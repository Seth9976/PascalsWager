-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_BattleResult.lua

local BattleGameRoom_pb = require("LuaScript/Protocol/Protobuf/BattleGameRoom_pb")

NI_BattleResult = class("NI_BattleResult")

function NI_BattleResult.SubmitResultPVP(result)
	SystemHelper.LogTest("================NI_BattleResult.SubmitResultPVP========")

	local matchRoom = BattleGameRoom_pb.ReqBattleResult()

	matchRoom.result = tonumber(result)

	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_BATTLE_RESULT)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleResult.ParseResultPVP(buffer)
	SystemHelper.LogTest("================ NI_BattleResult ParseResultPVP============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespBattleResult()

	msg:ParseFromString(data)

	if msg ~= nil then
		-- block empty
	end
end

function NI_BattleResult.Submit(wave, score, callbackFun)
	local accountId = tostring(FS_UserData.playerList:GetUserId())

	if accountId ~= nil and score >= 0 then
		local currentTime = 1000 * os.time()
		local contents = accountId .. "|" .. currentTime .. "|" .. score .. "|" .. wave
		local checksum = Util.md5(contents)
		local pageStr = "incScore"
		local paramList = {
			{
				"accountId",
				accountId
			},
			{
				"score",
				score
			},
			{
				"wave",
				wave
			},
			{
				"time",
				currentTime
			},
			{
				"sign",
				checksum
			}
		}
		local paramStr = SystemHelper.ConvertHttpParam(paramList)

		SystemHelper.Log("NI_BattleResult.Submit(" .. accountId .. ", " .. score .. ", " .. currentTime .. ", " .. checksum .. ")")
		SystemHelper.Log("Param:" .. paramStr)
		networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
	end
end

function NI_BattleResult.ParseSubmitResponse(jsonData)
	SystemHelper.LogTest("==================ParseSubmitResponse==================")

	local v_data = json.decode(jsonData)

	if v_data == nil then
		SystemHelper.LogTest("======v_data=null")

		return false
	else
		local code = v_data.code
		local success = v_data.success

		if success == true then
			SystemHelper.Log("ParseSubmitResponse -- success")

			return true
		end
	end

	return false
end
