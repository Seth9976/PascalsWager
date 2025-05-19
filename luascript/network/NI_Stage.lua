-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Stage.lua

local BattleStage_pb = require("LuaScript/Protocol/Protobuf/BattleStage_pb")

NI_Stage = class("NI_Stage")

function NI_Stage.RequestSaveStage(storyId, saveId, questList)
	SystemHelper.LogTest("================NI_Stage.RequestSaveStage================")

	if ReqLogin then
		local request = BattleStage_pb.ReqSaveStage()
		local codeStr = ""

		request.stageNo = storyId
		request.savePoint = saveId
		request.saveTime = FS_UserData.playerList:GetTimestamp()
		codeStr = codeStr .. tostring(storyId) .. tostring(FS_UserData.playerList:GetPlayerId()) .. tostring(saveId) .. tostring(request.saveTime)

		for tmpId, data in pairs(questList) do
			request.stageTaskNo:append(tmpId)

			codeStr = codeStr .. tostring(tmpId)
		end

		request.sign = Util.md5(codeStr)

		local msg = request:SerializeToString()
		local buffer = ByteBuffer.New()

		buffer:WriteShort(XProtocol.BattleProtocolToStage.REQ_SAVE_STAGE)
		buffer:WriteBuffer(msg)
		networkMgr:SendMessage(buffer)
	end
end

function NI_Stage.ParseSaveStageDone(buffer)
	SystemHelper.LogTest("================NI_Stage.ParseSaveStageDone================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()
		local msg = BattleStage_pb.RespSaveStageDone()

		msg:ParseFromString(data)
	end

	if msg ~= nil then
		SystemHelper.Log("[TODO]")
	end
end
