-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Autosave.lua

LS_Autosave = class("LS_Autosave")
LS_Autosave.errno = 0
LS_Autosave.keyUserId = "1"
LS_Autosave.saveInfo = nil

if AppVer == AppTapTapEA then
	LS_Autosave.keyName = "eagame"
else
	LS_Autosave.keyName = "game"
end

LS_Autosave.static.keyArcade = "arcade"

function LS_Autosave.GetKey(arcadeMode)
	if arcadeMode ~= nil then
		return LS_Autosave.keyArcade .. "_" .. LS_Autosave.keyUserId .. "_0"
	end

	return LS_Autosave.keyName .. "_" .. LS_Autosave.keyUserId .. "_0"
end

function LS_Autosave.GetKeyByUserAndSlot(userId, arcadeMode)
	if arcadeMode ~= nil then
		return LS_Autosave.keyArcade .. "_" .. userId .. "_0"
	end

	return LS_Autosave.keyName .. "_" .. userId .. "_0"
end

function LS_Autosave.IsReadable(userId, arcadeMode)
	LS_Autosave.keyUserId = userId

	if arcadeMode ~= nil then
		return Recorder.IsHaveRecorder(LS_Autosave.GetKey(arcadeMode))
	end

	return Recorder.IsHaveRecorder(LS_Autosave.GetKey())
end

function LS_Autosave.Load(userId)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Autosave.Load : No Action!!! ]")

		return
	end

	if string.len(userId) <= 0 then
		SystemHelper.LogError("=========LS_Autosave.Load==userId=NULL")

		return false
	else
		SystemHelper.Log("[ Load Slot: 0  - uid: " .. userId .. " ]")
	end

	LS_Autosave.keyUserId = userId

	local retStr = Recorder.read(LS_Autosave.GetKey())

	if retStr and type(retStr) == "string" then
		SystemHelper.LogTest("====############=====LS_Autosave=key=" .. LS_Autosave.GetKey() .. ",retStr=" .. retStr)

		local val = json.decode(retStr)

		LS_Autosave.saveInfo = LS_Autosave.Decode(val)
	else
		SystemHelper.Log("[ .............................WARNING!!! This should NOT happen. ]")
		LS_Autosave.Update(false, "new", 1, 1, 0, TimeHelper.getUTC(), TimeHelper.getUTC(), BattleData.GlobalDifficultyLevel.Normal, 1)
	end

	return true
end

function LS_Autosave.DownloadSaveData()
	return
end

function LS_Autosave.DownloadCallback(result, jsonRes)
	return
end

function LS_Autosave.Update(isExit, des, location, level, playtime, savetime, utctime, gamemode, roundcount)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Autosave.Update : No Action!!! ]")

		return
	end

	local retStr = LS_Autosave.Encode(isExit, location, level, playtime, savetime, utctime, gamemode, roundcount)

	SystemHelper.Log("0++++++++++++++++++++++++++++++++++++++++++++++++++")
	SystemHelper.LogTest("=##########===========LS_Autosave=key=" .. LS_Autosave.GetKey() .. ",retStr=" .. retStr)
	Recorder.write(LS_Autosave.GetKey(), retStr)
	UIManager.SendMessage("MsgBoxSimple", "OpenGetSave")
	LS_Setting.SyncSaveSlotInfo(LS_Setting.IndexAutosave, location, level, playtime, savetime, utctime, gamemode, roundcount, true)

	if des == nil then
		des = "unknown"
	end

	LS_PlayerBehavior.Update(LS_Autosave.keyUserId, true)
end

function LS_Autosave.UpdateCallback(result, jsonRes)
	local response = json.decode(jsonRes)

	if result == true and response ~= nil and response.success == true then
		SystemHelper.Log("saveData上传成功!--")
	end
end

function LS_Autosave.Encode(isExit, location, level, playtime, savetime, utctime, gamemode, roundcount)
	local jsonData = {}
	local tmpJsonSub = {}
	local saveInfo = {}

	saveInfo.heroId = BattleData.GetHeroId()
	saveInfo.location = location
	saveInfo.level = level
	saveInfo.playtime = playtime
	saveInfo.savetime = savetime
	saveInfo.utctime = utctime
	saveInfo.saveslot = LS_Setting.lastSlotPlayed
	saveInfo.gamemode = gamemode
	saveInfo.roundcount = roundcount
	LS_Autosave.saveInfo = saveInfo
	tmpJsonSub.bag = FS_UserData.itemList:Encode(isExit)
	tmpJsonSub.hero = FS_UserData.heroList:Encode(isExit)
	tmpJsonSub.equip = FS_UserData.trophy:Encode(isExit)
	tmpJsonSub.story = FS_UserData.story:Encode(isExit)
	tmpJsonSub.save = saveInfo
	jsonData.result = tmpJsonSub

	return json.encode(jsonData)
end

function LS_Autosave.Decode(p_val)
	if p_val == nil then
		return nil
	end

	local saveInfo

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "bag") then
			FS_UserData.itemList:Decode(tmpJsonSub.bag)
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "hero") then
			FS_UserData.heroList:Decode(tmpJsonSub.hero)
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "equip") then
			FS_UserData.trophy:Decode(tmpJsonSub.equip)
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "story") then
			FS_UserData.story:Decode(tmpJsonSub.story)
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "save") then
			saveInfo = tmpJsonSub.save

			if saveInfo.saveslot == nil then
				saveInfo.saveslot = LS_Setting.lastSlotPlayed
			end

			LS_Setting.lastSlotPlayed = saveInfo.saveslot

			if saveInfo.gamemode == nil then
				saveInfo.gamemode = BattleData.GlobalDifficultyLevel.Normal
			end

			if saveInfo.roundcount == nil then
				saveInfo.roundcount = 1
			end

			SystemHelper.Log("[ Set autosave slot to " .. saveInfo.saveslot .. " ]")
		else
			saveInfo = {}
			saveInfo.heroId = 0
			saveInfo.location = 1
			saveInfo.level = 1
			saveInfo.playtime = 0
			saveInfo.savetime = TimeHelper.getUTC()
			saveInfo.utctime = TimeHelper.getUTC()
			saveInfo.saveslot = LS_Setting.lastSlotPlayed
			saveInfo.gamemode = BattleData.GlobalDifficultyLevel.Normal
			saveInfo.roundcount = 1
			LS_Autosave.saveInfo = saveInfo
		end

		BattleData.SetHeroId(saveInfo.heroId)
	end

	return saveInfo
end

function LS_Autosave.Write(userId, data, slotIdx)
	if string.len(userId) <= 0 then
		SystemHelper.LogError("[[ ERR::LS_Autosave.Write( userId=NULL, slotIdx=" .. slotIdx .. ") ]]")

		return false
	end

	SystemHelper.Log("[[ LS_Autosave.Write( userId=" .. userId .. ", slotIdx=" .. slotIdx .. ") ]]" .. data)

	LS_Autosave.keyUserId = userId

	Recorder.write(LS_Autosave.GetKey(), data)

	return true
end

function LS_Autosave.Delete(userId)
	local key = LS_Autosave.keyName .. "_" .. userId .. "_0"

	SystemHelper.Log("[ LS_Autosave.Delete( " .. key .. " ) ]")

	LS_Autosave.saveInfo = nil

	if Recorder.IsHaveRecorder(key) then
		Recorder.Delete(key)
		SystemHelper.Log("[ LS_Autosave.DeletingSucceeded ]")

		return true
	else
		SystemHelper.Log("[ LS_Autosave.NoFileExists ]")

		return false
	end
end

function LS_Autosave.Copy(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Copy(src, dst)

		return true
	else
		return false
	end
end

function LS_Autosave.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

function LS_Autosave.SaveTest()
	return
end

function LS_Autosave.Rename(userId)
	local srcName = LS_Autosave.keyName .. "_" .. LS_Autosave.keyUserId .. "_0"
	local dstName = LS_Autosave.keyName .. "_" .. userId .. "_0"
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_Autosave.Move(srcName, dstName)
	end

	LS_Autosave.keyUserId = userId
end

function LS_Autosave.SetUserId(userId)
	if userId ~= nil and type(userId) == "string" then
		LS_Autosave.keyUserId = userId
		LS_Autosave.saveInfo = nil
	end
end

function LS_Autosave.OverwriteWithLastSaveSlot()
	local lastSaveSlot = LS_Setting.lastSlotPlayed

	if lastSaveSlot > 0 then
		local slotInfo = LS_Setting.GetSaveSlotInfo(lastSaveSlot)

		SystemHelper.Log(string.format("____%s", LS_Game.GetKey(lastSaveSlot)))

		local retStr = Recorder.read(LS_Game.GetKey(lastSaveSlot))

		SystemHelper.Log(string.format("++++%s", retStr))

		if retStr ~= nil and string.len(retStr) > 0 and type(retStr) == "string" then
			FS_UserData.Reset()

			local val = json.decode(retStr)

			LS_Autosave.Decode(val)
			LS_Autosave.Update(true, nil, slotInfo[LS_Setting.SlotStatus.Location], slotInfo[LS_Setting.SlotStatus.Level], slotInfo[LS_Setting.SlotStatus.PlayTime], slotInfo[LS_Setting.SlotStatus.SaveTime], slotInfo[LS_Setting.SlotStatus.SaveTime], slotInfo[LS_Setting.SlotStatus.GameMode], slotInfo[LS_Setting.SlotStatus.RoundCount])
			BattleData.SetHeroId(0)
			SystemHelper.Log(string.format("[ LS_Autosave.OverwriteWithLastSaveSlot( %d ) ]", lastSaveSlot))
			LS_Setting.Update()
		else
			SystemHelper.Log("__________________NO MANUAL SAVEDATA____________________")
		end
	end
end

return LS_Autosave
