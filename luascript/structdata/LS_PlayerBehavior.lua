-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_PlayerBehavior.lua

LS_PlayerBehavior = class("LS_PlayerBehavior")
LS_PlayerBehavior.keyUserId = "1"
LS_PlayerBehavior.gameId = 0

if AppVer == AppTapTapEA then
	LS_PlayerBehavior.keyName = "eaplayer_behavior"
	LS_PlayerBehavior.deltaKeyName = "eaplayer_behavior_delta"
else
	LS_PlayerBehavior.keyName = "player_behavior"
	LS_PlayerBehavior.deltaKeyName = "player_behavior_delta"
end

local waitingForResponse = false
local updateCountdown = 0

function LS_PlayerBehavior.GetKey(slotIdx)
	if slotIdx then
		return LS_PlayerBehavior.keyName .. "_" .. LS_PlayerBehavior.keyUserId .. "_" .. slotIdx
	else
		return LS_PlayerBehavior.keyName .. "_" .. LS_PlayerBehavior.keyUserId .. "_" .. LS_Setting.lastSlotPlayed
	end
end

function LS_PlayerBehavior.GetDeltaKey(slotIdx)
	if slotIdx then
		return LS_PlayerBehavior.deltaKeyName .. "_" .. LS_PlayerBehavior.keyUserId .. "_" .. slotIdx
	else
		return LS_PlayerBehavior.deltaKeyName .. "_" .. LS_PlayerBehavior.keyUserId .. "_" .. LS_Setting.lastSlotPlayed
	end
end

function LS_PlayerBehavior.GetKeyByUserAndSlot(userId, slotIdx)
	return LS_PlayerBehavior.keyName .. "_" .. userId .. "_" .. slotIdx
end

function LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(userId, slotIdx)
	return LS_PlayerBehavior.deltaKeyName .. "_" .. userId .. "_" .. slotIdx
end

function LS_PlayerBehavior.GetAutoKey()
	return LS_PlayerBehavior.keyName .. "_" .. LS_PlayerBehavior.keyUserId .. "_" .. "auto"
end

function LS_PlayerBehavior.GetAutoDeltaKey()
	return LS_PlayerBehavior.deltaKeyName .. "_" .. LS_PlayerBehavior.keyUserId .. "_" .. "auto"
end

function LS_PlayerBehavior.SetUserId(userId)
	LS_PlayerBehavior.keyUserId = userId
end

function LS_PlayerBehavior.IsReadable(userId)
	LS_PlayerBehavior.keyUserId = userId

	return Recorder.IsHaveRecorder(LS_PlayerBehavior.GetKey())
end

function LS_PlayerBehavior.Load(userId, isAuto)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_PlayerBehavior.Load : No Action!!! ]")

		return
	end

	LS_PlayerBehavior.keyUserId = userId

	local retStr, deltaStr

	if isAuto then
		retStr = Recorder.read(LS_PlayerBehavior.GetAutoKey())
		deltaStr = Recorder.read(LS_PlayerBehavior.GetAutoDeltaKey())
	else
		retStr = Recorder.read(LS_PlayerBehavior.GetKey())
		deltaStr = Recorder.read(LS_PlayerBehavior.GetDeltaKey())
	end

	if deltaStr and type(deltaStr) == "string" then
		local val = json.decode(deltaStr)

		LS_PlayerBehavior.DecodeDelta(val)
	end

	if retStr and type(retStr) == "string" then
		local val = json.decode(retStr)

		LS_PlayerBehavior.Decode(val)
	else
		FS_UserData.story:SetRecordPlayerBehaviorOff()
		FS_UserData.playerBehavior:Reset()
		LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetAutoKey())
		LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetAutoDeltaKey())
	end
end

function LS_PlayerBehavior.Update(userId, isAuto)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_PlayerBehavior.Update : No Action!!! ]")

		return
	end

	if FS_UserData.story:GetRecordPlayerBehaviorOff() then
		return
	end

	LS_PlayerBehavior.keyUserId = userId

	local retStr, deltaStr = LS_PlayerBehavior.Encode()

	SystemHelper.LogTest("==key=" .. LS_PlayerBehavior.GetKey() .. ",retStr=" .. retStr)

	if isAuto then
		Recorder.write(LS_PlayerBehavior.GetAutoKey(), retStr)
	else
		Recorder.write(LS_PlayerBehavior.GetKey(), retStr)
	end

	if deltaStr == nil then
		return
	end

	if isAuto then
		updateCountdown = updateCountdown - 1

		Recorder.write(LS_PlayerBehavior.GetAutoDeltaKey(), deltaStr)
	else
		Recorder.write(LS_PlayerBehavior.GetDeltaKey(), deltaStr)
	end

	if isAuto and updateCountdown <= 0 then
		if waitingForResponse then
			return
		end

		updateCountdown = 15
		waitingForResponse = true

		SdkHelper.clientLog(deltaStr, LS_PlayerBehavior.UpdateCallback)
	end
end

function LS_PlayerBehavior.UpdateCallback(result, jsonRes)
	if result == true then
		local response = json.decode(jsonRes)

		if response ~= nil and response.success == true then
			SystemHelper.Log("playerBehavior上传成功!")
			Recorder.write(LS_PlayerBehavior.GetDeltaKey(), "")
			Recorder.write(LS_PlayerBehavior.GetAutoDeltaKey(), "")
			FS_UserData.playerBehavior:ResetDeltaList()
		end
	end

	waitingForResponse = false
end

function LS_PlayerBehavior.NewGame(gameId)
	LS_PlayerBehavior.gameId = gameId
end

function LS_PlayerBehavior.IsWaitingForResponse()
	return waitingForResponse
end

function LS_PlayerBehavior.Encode(isExit)
	local jsonData = {}
	local jsonData2 = {}
	local tmpJsonSub = {}
	local tmpJsonSub2 = {}

	tmpJsonSub.player_behavior, tmpJsonSub2.player_behavior = FS_UserData.playerBehavior:Encode(isExit)
	tmpJsonSub.game_id = LS_PlayerBehavior.gameId
	tmpJsonSub2.game_id = LS_PlayerBehavior.gameId
	jsonData.result = tmpJsonSub
	jsonData2.result = tmpJsonSub2

	if tmpJsonSub2.player_behavior.behavior == nil then
		return json.encode(jsonData), nil
	else
		return json.encode(jsonData), json.encode(jsonData2)
	end
end

function LS_PlayerBehavior.Decode(p_val)
	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "player_behavior") then
			FS_UserData.playerBehavior:Decode(tmpJsonSub.player_behavior)
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "game_id") then
			LS_PlayerBehavior.gameId = tmpJsonSub.game_id
		end
	end
end

function LS_PlayerBehavior.DecodeDelta(p_val)
	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "player_behavior") then
			FS_UserData.playerBehavior:DecodeDelta(tmpJsonSub.player_behavior)
		end
	end
end

function LS_PlayerBehavior.Write(userId, slotIdx, data)
	if tonumber(userId) <= 0 then
		SystemHelper.LogError("[[ ERR::LS_PlayerBehavior.Write( userId=" .. userId .. ", slotIdx=" .. slotIdx .. ") ]]")

		return false
	end

	SystemHelper.Log("[[ LS_PlayerBehavior.Write( userId=" .. userId .. ", slotIdx=" .. slotIdx .. ") ]]" .. data)

	LS_PlayerBehavior.keyUserId = userId

	Recorder.write(LS_PlayerBehavior.GetKey(slotIdx), data)

	return true
end

function LS_PlayerBehavior.Rename(userId, slotIdx)
	local srcName = LS_PlayerBehavior.keyName .. "_1_" .. slotIdx
	local dstName = LS_PlayerBehavior.keyName .. "_" .. userId .. "_" .. slotIdx
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_PlayerBehavior.Move(srcName, dstName)
	end

	srcName = LS_PlayerBehavior.deltaKeyName .. "_1_" .. slotIdx
	dstName = LS_PlayerBehavior.deltaKeyName .. "_" .. userId .. "_" .. slotIdx

	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_PlayerBehavior.Move(srcName, dstName)
	end
end

function LS_PlayerBehavior.Copy(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Copy(src, dst)

		return true
	else
		LS_PlayerBehavior.Delete(dst)

		return false
	end
end

function LS_PlayerBehavior.Delete(key)
	if Recorder.IsHaveRecorder(key) then
		Recorder.Delete(key)

		return true
	else
		return false
	end
end

function LS_PlayerBehavior.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

return LS_PlayerBehavior
