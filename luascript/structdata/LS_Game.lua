-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Game.lua

LS_Game = class("LS_Game")
LS_Game.errno = 0
LS_Game.keyUserId = "1"

if AppVer == AppTapTapEA then
	LS_Game.keyName = "eagame"
else
	LS_Game.keyName = "game"
end

LS_Game.static.keyArcade = "arcade"

function LS_Game.GetKey(slotIdx, arcadeMode)
	if slotIdx == nil or type(slotIdx) ~= "number" then
		slotIdx = 1
	end

	if arcadeMode ~= nil then
		return LS_Game.keyArcade .. "_" .. LS_Game.keyUserId .. "_" .. slotIdx
	end

	return LS_Game.keyName .. "_" .. LS_Game.keyUserId .. "_" .. slotIdx
end

function LS_Game.GetKeyByUserAndSlot(userId, slotIdx, arcadeMode)
	if arcadeMode ~= nil then
		return LS_Game.keyArcade .. "_" .. userId .. "_" .. slotIdx
	end

	return LS_Game.keyName .. "_" .. userId .. "_" .. slotIdx
end

function LS_Game.IsReadable(userId, slotIdx, arcadeMode)
	LS_Game.keyUserId = userId

	if arcadeMode ~= nil then
		return Recorder.IsHaveRecorder(LS_Game.GetKey(slotIdx, arcadeMode))
	end

	return Recorder.IsHaveRecorder(LS_Game.GetKey(slotIdx))
end

function LS_Game.HasSaveData(userId, arcadeMode)
	LS_Game.keyUserId = userId

	local hasSaveData = false

	if arcadeMode == nil then
		for idx = 1, 3 do
			if Recorder.IsHaveRecorder(LS_Game.GetKey(idx)) then
				hasSaveData = true

				break
			end
		end
	else
		for idx = 1, 10 do
			if Recorder.IsHaveRecorder(LS_Game.GetKey(idx, arcadeMode)) then
				hasSaveData = true

				break
			end
		end
	end

	return hasSaveData
end

function LS_Game.Load(userId, slotIdx, arcadeMode)
	if AppVer == AppAppleLight then
		SystemHelper.Log("[ LS_Game.Load : No Action!!! ]")

		return false
	end

	if string.len(userId) <= 0 then
		SystemHelper.LogError("=========LS_Game.Load==userId=NULL")

		return false
	end

	SystemHelper.Log("[ Load Slot: " .. slotIdx .. " - uid: " .. userId .. " ]")

	LS_Game.keyUserId = userId

	if arcadeMode == nil then
		LS_Setting.SetLastSaveSlot(slotIdx)
	else
		LS_Setting.SetLastArcadeSaveSlot(slotIdx)
	end

	local retStr = Recorder.read(LS_Game.GetKey(slotIdx, arcadeMode))

	if retStr and type(retStr) == "string" then
		SystemHelper.LogTest("====############=====LS_Game=key=" .. LS_Game.GetKey(slotIdx, arcadeMode) .. ",retStr=" .. retStr)

		local val = json.decode(retStr)

		LS_Game.Decode(val)
	elseif arcadeMode == nil then
		SystemHelper.LogError("*************")
		LS_Game.Update(false, "new", 1, 1, 0, TimeHelper.getUTC(), TimeHelper.getUTC(), BattleData.GlobalDifficultyLevel.Normal, 1)
	else
		SystemHelper.LogError("*************arcadeMode")
		LS_Game.UpdateArcade(false, "new", 1, 10007, 0, TimeHelper.getUTC(), TimeHelper.getUTC(), BattleData.GlobalDifficultyLevel.Normal, 1)
	end

	return true
end

function LS_Game.GetSaveData(userId, slotIdx, arcadeMode)
	if string.len(userId) <= 0 then
		SystemHelper.LogError("[ LS_Game.GetSaveData( NULL ) ]")

		return nil
	end

	SystemHelper.Log("[ LS_Game.GetSaveData(" .. userId .. ", slot " .. slotIdx .. ") ]")

	LS_Game.keyUserId = userId

	local retStr = Recorder.read(LS_Game.GetKey(slotIdx, arcadeMode))

	if retStr == "" then
		SystemHelper.Log(string.format("Slot %d is EMPTY!!!", slotIdx))

		retStr = "null"
	end

	return retStr
end

function LS_Game.DownloadSaveData()
	return
end

function LS_Game.DownloadCallback(result, jsonRes)
	return
end

function LS_Game.Update(isExit, desc, location, level, playtime, savetime, utctime, gameMode, roundcount)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Game.Update : No Action!!! ]")

		return
	end

	local retStr = LS_Game.Encode(isExit, location, level, playtime, savetime, utctime, gameMode, roundcount)

	SystemHelper.Log("X++++++++++++++++++++++++++++++++++++++++++++++++++")
	SystemHelper.LogTest("=##########===========LS_Game=key=" .. LS_Game.GetKey(LS_Setting.lastSlotPlayed) .. ",retStr=" .. retStr)
	Recorder.write(LS_Game.GetKey(LS_Setting.lastSlotPlayed), retStr)
	UIManager.SendMessage("MsgBoxSimple", "OpenGetSave")
	LS_Setting.SyncSaveSlotInfo(LS_Setting.lastSlotPlayed, location, level, playtime, savetime, utctime, gameMode, roundcount, true)

	if desc == nil then
		desc = "unknown"
	end

	LS_PlayerBehavior.Update(LS_Game.keyUserId)
end

function LS_Game.UpdateArcade(isExit, desc, location, heroId, playtime, savetime, utctime, gameMode, roundcount, arcadeMode)
	local retStr = LS_Game.Encode(isExit, location, heroId, playtime, savetime, utctime, gameMode, roundcount)
	local slotIndex = 0

	if arcadeMode == 1 then
		slotIndex = LS_Setting.lastArcadeSlotPlayed
	else
		slotIndex = LS_Setting.IndexArcadeAutosave
	end

	Recorder.write(LS_Game.GetKey(slotIndex, true), retStr)
	UIManager.SendMessage("MsgBoxSimple", "OpenGetSave")
	LS_Setting.SyncSaveSlotInfo(slotIndex, location, heroId, playtime, savetime, utctime, gameMode, roundcount, true, true)
end

function LS_Game.UpdateCallback(result, jsonStr)
	if result == true then
		local response = json.decode(jsonStr)

		if response ~= nil and response.success == true then
			SystemHelper.Log("[ LS_Game.UpdateCallback: " .. tostring(result) .. ", json: " .. jsonStr .. " ]")
			SystemHelper.Log("saveData上传成功!--")
		else
			SystemHelper.Log("[ LS_Game.UpdateCallback: " .. tostring(result) .. ", json: " .. jsonStr .. " ]")
			SystemHelper.Log("saveData上传失败!--")
		end
	else
		SystemHelper.Log("[ LS_Game.UpdateCallback: " .. tostring(result) .. " ]")
		SystemHelper.Log("saveData上传失败!--")
	end
end

function LS_Game.Encode(isExit, location, level, playtime, savetime, utctime, gamemode, roundcount)
	local jsonData = {}
	local tmpJsonSub = {}
	local saveInfo = {}

	saveInfo.heroId = BattleData.GetHeroId()
	saveInfo.location = location
	saveInfo.level = level
	saveInfo.playtime = playtime
	saveInfo.savetime = savetime
	saveInfo.utctime = utctime
	saveInfo.gamemode = gamemode
	saveInfo.roundcount = roundcount
	tmpJsonSub.bag = FS_UserData.itemList:Encode(isExit)
	tmpJsonSub.hero = FS_UserData.heroList:Encode(isExit)
	tmpJsonSub.equip = FS_UserData.trophy:Encode(isExit)
	tmpJsonSub.story = FS_UserData.story:Encode(isExit)
	tmpJsonSub.save = saveInfo
	jsonData.result = tmpJsonSub

	return json.encode(jsonData)
end

function LS_Game.Decode(p_val)
	if p_val == nil then
		return nil
	end

	local saveInfo, achievementFinishList

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

			if FS_ParserJson.isValidKey(tmpJsonSub.story, "achievement_finish") then
				achievementFinishList = tmpJsonSub.story.achievement_finish
			end
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "save") then
			saveInfo = tmpJsonSub.save

			if saveInfo.gamemode == nil then
				saveInfo.gamemode = BattleData.GlobalDifficultyLevel.Normal
			end

			if saveInfo.roundcount == nil then
				saveInfo.roundcount = 1
			end
		else
			saveInfo = {}
			saveInfo.heroId = 0
			saveInfo.location = 1
			saveInfo.level = 1
			saveInfo.playtime = 0
			saveInfo.savetime = TimeHelper.getUTC()
			saveInfo.utctime = TimeHelper.getUTC()
			saveInfo.gamemode = BattleData.GlobalDifficultyLevel.Normal
			saveInfo.roundcount = 1
		end

		BattleData.SetHeroId(saveInfo.heroId)
	end

	return saveInfo, achievementFinishList
end

function LS_Game.Write(userId, slotIdx, data, isArcadeMode)
	if string.len(userId) <= 0 then
		SystemHelper.LogError("[[ ERR::LS_Game.Write( userId=NULL, slotIdx=" .. slotIdx .. ") ]]")

		return false
	end

	SystemHelper.Log("[[ LS_Game.Write( userId=" .. userId .. ", slotIdx=" .. slotIdx .. ") ]]" .. data)

	LS_Game.keyUserId = userId

	Recorder.write(LS_Game.GetKey(slotIdx, isArcadeMode), data)

	return true
end

function LS_Game.Delete(key)
	SystemHelper.Log("[ LS_Game.Delete( " .. key .. " ) ]")

	if Recorder.IsHaveRecorder(key) then
		Recorder.Delete(key)
		SystemHelper.Log("[ LS_Game.DeletingSucceeded ]")

		return true
	else
		SystemHelper.Log("[ LS_Game.NoFileExists ]")

		return false
	end
end

function LS_Game.Copy(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Copy(src, dst)

		return true
	else
		return false
	end
end

function LS_Game.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

function LS_Game.SaveTest()
	return
end

function LS_Game.Rename(userId, slotIdx)
	local srcName = LS_Game.keyName .. "_" .. LS_Game.keyUserId .. "_" .. slotIdx
	local dstName = LS_Game.keyName .. "_" .. userId .. "_" .. slotIdx
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_Game.Move(srcName, dstName)
	end
end

function LS_Game.SetUserId(userId)
	if userId ~= nil and type(userId) == "string" then
		LS_Game.keyUserId = userId
	end
end

function LS_Game.GenerateSaveData(userId, saveId)
	LS_Game.keyUserId = userId

	local retStr = "test"

	if saveId == 3 then
		retStr = "{\"result\":{\"equip\":{\"trophyList\":[{\"RanV\":[93,145,148,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":69507,\"Lock\":0},{\"RanV\":[76,112,117,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":69407,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60032,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60460,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60080,\"Lock\":0},{\"RanV\":[114,126,128,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":6,\"Id\":69515,\"Lock\":0}]},\"save\":{\"roundcount\":2,\"level\":19,\"utctime\":1604529834,\"heroId\":10005,\"location\":1,\"playtime\":21007.41,\"gamemode\":2,\"savetime\":1604558634},\"bag\":{\"item\":{\"40021\":999,\"71049\":1,\"70030\":1,\"71043\":1,\"20017\":3,\"80001\":99,\"70006\":1,\"70049\":1,\"70005\":1,\"70007\":2,\"20023\":1,\"20020\":5,\"40011\":998,\"71014\":1,\"71011\":1,\"70041\":1,\"80035\":99,\"80034\":99,\"80033\":99,\"26001\":1,\"26003\":1,\"50002\":99,\"50001\":99,\"50004\":99,\"50003\":99,\"80032\":99,\"80031\":99,\"70019\":2,\"70018\":1,\"40003\":1025,\"70057\":1,\"40002\":1038,\"40001\":307,\"70055\":1,\"40004\":1001,\"30002\":9,\"80025\":99,\"80024\":99,\"30004\":10,\"80023\":99,\"80022\":99,\"30003\":10,\"30009\":8,\"80021\":99,\"30006\":10,\"30005\":10,\"30007\":10,\"40031\":1000,\"70029\":1,\"70025\":1,\"70063\":1,\"71076\":1,\"71074\":1,\"80012\":99,\"80011\":99,\"10046\":1,\"10048\":2},\"trophy\":[{\"SubProperty\":0,\"Level\":1,\"Id\":60016,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60017,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60018,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60019,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60020,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60021,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60022,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60023,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60024,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60025,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60026,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60027,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60027,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60028,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60029,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60030,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60031,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60033,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60034,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60035,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60036,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60037,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60038,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60039,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60040,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60041,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60042,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60043,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60044,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60045,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60046,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60047,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60048,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60049,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60050,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60051,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60052,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60053,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60054,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60055,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60056,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60057,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60058,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60059,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60060,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60061,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60062,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60063,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60064,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60065,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60066,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60067,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60068,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60069,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60069,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60070,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60071,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60072,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60073,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60074,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60075,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60076,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60076,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60077,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60078,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60079,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60101,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60102,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60103,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60104,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60105,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60106,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60107,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60108,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60109,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60110,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60111,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":60112,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60201,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60202,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60203,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60204,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60205,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60206,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60207,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60208,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60209,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60210,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60211,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60212,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60225,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60237,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60255,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60256,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60257,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60258,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60259,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60260,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60261,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60262,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60263,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60264,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60265,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60266,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":60267,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60301,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60302,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60303,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60304,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60305,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60306,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60307,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60308,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60309,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60310,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60311,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60312,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60325,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60337,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60355,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60356,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60357,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60358,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60359,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60360,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60361,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60362,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60363,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60364,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60365,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60366,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":60367,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60401,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60402,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60403,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60404,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60405,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60406,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60407,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60408,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60409,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60410,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60411,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60412,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60425,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60437,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60455,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60456,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60457,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60458,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60459,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60461,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60462,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60463,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60464,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60465,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60466,\"Lock\":0},{\"SubProperty\":0,\"Level\":4,\"Id\":60467,\"Lock\":0},{\"SubProperty\":0,\"Level\":1,\"Id\":61015,\"Lock\":0},{\"SubProperty\":0,\"Level\":2,\"Id\":61022,\"Lock\":0},{\"SubProperty\":0,\"Level\":3,\"Id\":61031,\"Lock\":0},{\"SubProperty\":0,\"Level\":5,\"Id\":61056,\"Lock\":0},{\"SubProperty\":0,\"Level\":6,\"Id\":61063,\"Lock\":0},{\"SubProperty\":0,\"Level\":6,\"Id\":61064,\"Lock\":0},{\"RanV\":[37,74,48,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":67001,\"Lock\":0},{\"RanV\":[46,68,50,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":67002,\"Lock\":0},{\"RanV\":[30,61,35,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":67003,\"Lock\":0},{\"RanV\":[32,75,70,0],\"RanT\":[1,35,36,0],\"SubProperty\":0,\"Level\":1,\"Id\":67004,\"Lock\":0},{\"RanV\":[25,55,52,0],\"RanT\":[1,36,37,0],\"SubProperty\":0,\"Level\":1,\"Id\":67005,\"Lock\":0},{\"RanV\":[25,60,58,0],\"RanT\":[1,37,35,0],\"SubProperty\":0,\"Level\":1,\"Id\":67006,\"Lock\":0},{\"RanV\":[25,47,39,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":67007,\"Lock\":0},{\"RanV\":[70,26,21,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":1,\"Id\":67008,\"Lock\":0},{\"RanV\":[70,24,23,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":1,\"Id\":67009,\"Lock\":0},{\"RanV\":[65,20,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67010,\"Lock\":0},{\"RanV\":[18,90,22,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":1,\"Id\":67011,\"Lock\":0},{\"RanV\":[21,75,28,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":1,\"Id\":67012,\"Lock\":0},{\"RanV\":[30,30,58,67],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":1,\"Id\":67013,\"Lock\":0},{\"RanV\":[43,36,39,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":1,\"Id\":67014,\"Lock\":0},{\"RanV\":[48,26,28,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":1,\"Id\":67015,\"Lock\":0},{\"RanV\":[7,32,43,0],\"RanT\":[8,4,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":67016,\"Lock\":0},{\"RanV\":[6,44,39,0],\"RanT\":[8,11,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":67017,\"Lock\":0},{\"RanV\":[27,30,0,0],\"RanT\":[1,15,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67068,\"Lock\":0},{\"RanV\":[56,36,0,0],\"RanT\":[35,11,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67069,\"Lock\":0},{\"RanV\":[75,7,0,0],\"RanT\":[36,8,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67070,\"Lock\":0},{\"RanV\":[14,26,0,0],\"RanT\":[10,1,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67071,\"Lock\":0},{\"RanV\":[26,58,0,0],\"RanT\":[23,35,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67072,\"Lock\":0},{\"RanV\":[21,53,0,0],\"RanT\":[24,36,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67073,\"Lock\":0},{\"RanV\":[28,14,0,0],\"RanT\":[15,10,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67074,\"Lock\":0},{\"RanV\":[47,23,0,0],\"RanT\":[11,23,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":67075,\"Lock\":0},{\"RanV\":[56,96,60,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":67101,\"Lock\":0},{\"RanV\":[50,103,63,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":67102,\"Lock\":0},{\"RanV\":[51,86,52,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":67103,\"Lock\":0},{\"RanV\":[40,82,93,0],\"RanT\":[1,35,36,0],\"SubProperty\":0,\"Level\":2,\"Id\":67104,\"Lock\":0},{\"RanV\":[45,88,94,0],\"RanT\":[1,36,37,0],\"SubProperty\":0,\"Level\":2,\"Id\":67105,\"Lock\":0},{\"RanV\":[42,87,87,0],\"RanT\":[1,37,35,0],\"SubProperty\":0,\"Level\":2,\"Id\":67106,\"Lock\":0},{\"RanV\":[44,50,58,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":67107,\"Lock\":0},{\"RanV\":[145,34,31,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":2,\"Id\":67108,\"Lock\":0},{\"RanV\":[145,31,34,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":2,\"Id\":67109,\"Lock\":0},{\"RanV\":[140,32,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":2,\"Id\":67110,\"Lock\":0},{\"RanV\":[33,115,31,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":2,\"Id\":67111,\"Lock\":0},{\"RanV\":[25,120,34,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":2,\"Id\":67112,\"Lock\":0},{\"RanV\":[40,59,111,110],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":2,\"Id\":67113,\"Lock\":0},{\"RanV\":[52,61,52,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":2,\"Id\":67114,\"Lock\":0},{\"RanV\":[57,45,56,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":2,\"Id\":67115,\"Lock\":0},{\"RanV\":[9,43,60,0],\"RanT\":[8,4,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":67116,\"Lock\":0},{\"RanV\":[9,53,60,0],\"RanT\":[8,11,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":67117,\"Lock\":0},{\"RanV\":[77,134,75,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":67201,\"Lock\":0},{\"RanV\":[70,135,87,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":67202,\"Lock\":0},{\"RanV\":[74,129,80,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":67203,\"Lock\":0},{\"RanV\":[54,114,113,0],\"RanT\":[1,35,36,0],\"SubProperty\":0,\"Level\":3,\"Id\":67204,\"Lock\":0},{\"RanV\":[55,133,134,0],\"RanT\":[1,36,37,0],\"SubProperty\":0,\"Level\":3,\"Id\":67205,\"Lock\":0},{\"RanV\":[54,139,122,0],\"RanT\":[1,37,35,0],\"SubProperty\":0,\"Level\":3,\"Id\":67206,\"Lock\":0},{\"RanV\":[51,87,80,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":67207,\"Lock\":0},{\"RanV\":[180,51,51,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":3,\"Id\":67208,\"Lock\":0},{\"RanV\":[230,45,46,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":3,\"Id\":67209,\"Lock\":0},{\"RanV\":[180,42,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":3,\"Id\":67210,\"Lock\":0},{\"RanV\":[44,205,46,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":3,\"Id\":67211,\"Lock\":0},{\"RanV\":[44,215,53,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":3,\"Id\":67212,\"Lock\":0},{\"RanV\":[71,69,128,115],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":3,\"Id\":67213,\"Lock\":0},{\"RanV\":[68,68,73,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":3,\"Id\":67214,\"Lock\":0},{\"RanV\":[80,71,70,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":3,\"Id\":67215,\"Lock\":0},{\"RanV\":[12,65,72,0],\"RanT\":[8,4,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":67216,\"Lock\":0},{\"RanV\":[12,67,64,0],\"RanT\":[8,11,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":67217,\"Lock\":0},{\"RanV\":[91,148,108,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":67301,\"Lock\":0},{\"RanV\":[97,159,106,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":67302,\"Lock\":0},{\"RanV\":[90,144,109,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":67303,\"Lock\":0},{\"RanV\":[60,164,150,0],\"RanT\":[1,35,36,0],\"SubProperty\":0,\"Level\":4,\"Id\":67304,\"Lock\":0},{\"RanV\":[60,168,157,0],\"RanT\":[1,36,37,0],\"SubProperty\":0,\"Level\":4,\"Id\":67305,\"Lock\":0},{\"RanV\":[62,144,159,0],\"RanT\":[1,37,35,0],\"SubProperty\":0,\"Level\":4,\"Id\":67306,\"Lock\":0},{\"RanV\":[71,104,96,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":67307,\"Lock\":0},{\"RanV\":[295,65,58,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":4,\"Id\":67308,\"Lock\":0},{\"RanV\":[290,58,58,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":4,\"Id\":67309,\"Lock\":0},{\"RanV\":[260,54,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":4,\"Id\":67310,\"Lock\":0},{\"RanV\":[46,290,55,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":4,\"Id\":67311,\"Lock\":0},{\"RanV\":[53,240,63,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":4,\"Id\":67312,\"Lock\":0},{\"RanV\":[89,99,171,154],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":4,\"Id\":67313,\"Lock\":0},{\"RanV\":[93,94,99,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":4,\"Id\":67314,\"Lock\":0},{\"RanV\":[93,100,91,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":4,\"Id\":67315,\"Lock\":0},{\"RanV\":[15,84,91,0],\"RanT\":[8,4,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":67316,\"Lock\":0},{\"RanV\":[15,86,84,0],\"RanT\":[8,11,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":67317,\"Lock\":0},{\"RanV\":[123,184,131,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":67401,\"Lock\":0},{\"RanV\":[124,201,116,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":67402,\"Lock\":0},{\"RanV\":[123,180,134,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":67403,\"Lock\":0},{\"RanV\":[79,194,203,0],\"RanT\":[1,35,36,0],\"SubProperty\":0,\"Level\":5,\"Id\":67404,\"Lock\":0},{\"RanV\":[78,177,198,0],\"RanT\":[1,36,37,0],\"SubProperty\":0,\"Level\":5,\"Id\":67405,\"Lock\":0},{\"RanV\":[80,193,185,0],\"RanT\":[1,37,35,0],\"SubProperty\":0,\"Level\":5,\"Id\":67406,\"Lock\":0},{\"RanV\":[76,112,118,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":67407,\"Lock\":0},{\"RanV\":[360,69,73,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":5,\"Id\":67408,\"Lock\":0},{\"RanV\":[360,68,71,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":5,\"Id\":67409,\"Lock\":0},{\"RanV\":[340,64,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":5,\"Id\":67410,\"Lock\":0},{\"RanV\":[63,370,68,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":5,\"Id\":67411,\"Lock\":0},{\"RanV\":[64,320,71,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":5,\"Id\":67412,\"Lock\":0},{\"RanV\":[113,116,196,202],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":5,\"Id\":67413,\"Lock\":0},{\"RanV\":[100,112,113,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":5,\"Id\":67414,\"Lock\":0},{\"RanV\":[106,110,114,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":5,\"Id\":67415,\"Lock\":0},{\"RanV\":[18,112,113,0],\"RanT\":[8,4,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":67416,\"Lock\":0},{\"RanV\":[19,110,107,0],\"RanT\":[8,11,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":67417,\"Lock\":0},{\"RanV\":[134,215,150,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":67501,\"Lock\":0},{\"RanV\":[143,210,157,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":67502,\"Lock\":0},{\"RanV\":[135,217,146,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":67503,\"Lock\":0},{\"RanV\":[92,238,214,0],\"RanT\":[1,35,36,0],\"SubProperty\":0,\"Level\":6,\"Id\":67504,\"Lock\":0},{\"RanV\":[91,208,233,0],\"RanT\":[1,36,37,0],\"SubProperty\":0,\"Level\":6,\"Id\":67505,\"Lock\":0},{\"RanV\":[100,226,229,0],\"RanT\":[1,37,35,0],\"SubProperty\":0,\"Level\":6,\"Id\":67506,\"Lock\":0},{\"RanV\":[98,139,154,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":67507,\"Lock\":0},{\"RanV\":[440,88,82,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":6,\"Id\":67508,\"Lock\":0},{\"RanV\":[430,84,81,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":6,\"Id\":67509,\"Lock\":0},{\"RanV\":[450,69,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":6,\"Id\":67510,\"Lock\":0},{\"RanV\":[74,435,81,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":6,\"Id\":67511,\"Lock\":0},{\"RanV\":[75,450,86,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":6,\"Id\":67512,\"Lock\":0},{\"RanV\":[130,136,226,238],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":6,\"Id\":67513,\"Lock\":0},{\"RanV\":[113,127,122,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":6,\"Id\":67514,\"Lock\":0},{\"RanV\":[118,139,121,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":6,\"Id\":67515,\"Lock\":0},{\"RanV\":[22,122,123,0],\"RanT\":[8,4,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":67516,\"Lock\":0},{\"RanV\":[22,121,132,0],\"RanT\":[8,11,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":67517,\"Lock\":0},{\"RanV\":[40,52,40,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":68001,\"Lock\":0},{\"RanV\":[36,55,32,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":68002,\"Lock\":0},{\"RanV\":[42,75,34,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":68003,\"Lock\":0},{\"RanV\":[22,46,36,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":68007,\"Lock\":0},{\"RanV\":[70,29,21,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":1,\"Id\":68008,\"Lock\":0},{\"RanV\":[75,20,22,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":1,\"Id\":68009,\"Lock\":0},{\"RanV\":[100,17,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":68010,\"Lock\":0},{\"RanV\":[22,95,24,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":1,\"Id\":68011,\"Lock\":0},{\"RanV\":[21,60,22,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":1,\"Id\":68012,\"Lock\":0},{\"RanV\":[36,40,61,78],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":1,\"Id\":68013,\"Lock\":0},{\"RanV\":[45,26,32,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":1,\"Id\":68014,\"Lock\":0},{\"RanV\":[43,39,37,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":1,\"Id\":68015,\"Lock\":0},{\"RanV\":[54,92,62,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":68101,\"Lock\":0},{\"RanV\":[59,95,52,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":68102,\"Lock\":0},{\"RanV\":[63,108,66,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":68103,\"Lock\":0},{\"RanV\":[39,52,71,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":68107,\"Lock\":0},{\"RanV\":[120,37,37,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":2,\"Id\":68108,\"Lock\":0},{\"RanV\":[150,39,40,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":2,\"Id\":68109,\"Lock\":0},{\"RanV\":[110,25,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":2,\"Id\":68110,\"Lock\":0},{\"RanV\":[32,140,33,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":2,\"Id\":68111,\"Lock\":0},{\"RanV\":[29,155,39,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":2,\"Id\":68112,\"Lock\":0},{\"RanV\":[57,55,101,109],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":2,\"Id\":68113,\"Lock\":0},{\"RanV\":[65,53,52,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":2,\"Id\":68114,\"Lock\":0},{\"RanV\":[55,60,55,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":2,\"Id\":68115,\"Lock\":0},{\"RanV\":[87,135,79,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":68201,\"Lock\":0},{\"RanV\":[83,115,87,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":68202,\"Lock\":0},{\"RanV\":[79,121,90,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":68203,\"Lock\":0},{\"RanV\":[49,80,75,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":68207,\"Lock\":0},{\"RanV\":[220,51,53,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":3,\"Id\":68208,\"Lock\":0},{\"RanV\":[200,51,44,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":3,\"Id\":68209,\"Lock\":0},{\"RanV\":[210,37,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":3,\"Id\":68210,\"Lock\":0},{\"RanV\":[37,185,53,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":3,\"Id\":68211,\"Lock\":0},{\"RanV\":[43,205,49,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":3,\"Id\":68212,\"Lock\":0},{\"RanV\":[74,72,123,114],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":3,\"Id\":68213,\"Lock\":0},{\"RanV\":[72,67,77,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":3,\"Id\":68214,\"Lock\":0},{\"RanV\":[75,74,59,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":3,\"Id\":68215,\"Lock\":0},{\"RanV\":[91,159,106,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":68301,\"Lock\":0},{\"RanV\":[91,154,101,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":68302,\"Lock\":0},{\"RanV\":[89,153,112,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":68303,\"Lock\":0},{\"RanV\":[67,105,104,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":68307,\"Lock\":0},{\"RanV\":[240,59,57,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":4,\"Id\":68308,\"Lock\":0},{\"RanV\":[245,56,65,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":4,\"Id\":68309,\"Lock\":0},{\"RanV\":[290,53,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":4,\"Id\":68310,\"Lock\":0},{\"RanV\":[46,245,61,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":4,\"Id\":68311,\"Lock\":0},{\"RanV\":[52,275,56,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":4,\"Id\":68312,\"Lock\":0},{\"RanV\":[88,87,145,168],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":4,\"Id\":68313,\"Lock\":0},{\"RanV\":[84,84,85,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":4,\"Id\":68314,\"Lock\":0},{\"RanV\":[88,85,81,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":4,\"Id\":68315,\"Lock\":0},{\"RanV\":[125,186,131,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":68401,\"Lock\":0},{\"RanV\":[115,198,128,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":68402,\"Lock\":0},{\"RanV\":[122,193,133,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":68403,\"Lock\":0},{\"RanV\":[81,115,124,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":68407,\"Lock\":0},{\"RanV\":[335,76,72,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":5,\"Id\":68408,\"Lock\":0},{\"RanV\":[320,68,72,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":5,\"Id\":68409,\"Lock\":0},{\"RanV\":[315,59,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":5,\"Id\":68410,\"Lock\":0},{\"RanV\":[58,315,73,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":5,\"Id\":68411,\"Lock\":0},{\"RanV\":[66,330,71,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":5,\"Id\":68412,\"Lock\":0},{\"RanV\":[110,104,201,194],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":5,\"Id\":68413,\"Lock\":0},{\"RanV\":[110,106,120,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":5,\"Id\":68414,\"Lock\":0},{\"RanV\":[97,103,108,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":5,\"Id\":68415,\"Lock\":0},{\"RanV\":[143,238,155,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":68501,\"Lock\":0},{\"RanV\":[145,207,154,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":68502,\"Lock\":0},{\"RanV\":[138,239,151,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":68503,\"Lock\":0},{\"RanV\":[88,134,156,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":68507,\"Lock\":0},{\"RanV\":[425,85,83,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":6,\"Id\":68508,\"Lock\":0},{\"RanV\":[420,89,84,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":6,\"Id\":68509,\"Lock\":0},{\"RanV\":[385,77,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":6,\"Id\":68510,\"Lock\":0},{\"RanV\":[75,405,90,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":6,\"Id\":68511,\"Lock\":0},{\"RanV\":[71,415,83,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":6,\"Id\":68512,\"Lock\":0},{\"RanV\":[125,127,230,232],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":6,\"Id\":68513,\"Lock\":0},{\"RanV\":[118,128,127,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":6,\"Id\":68514,\"Lock\":0},{\"RanV\":[117,132,127,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":6,\"Id\":68515,\"Lock\":0},{\"RanV\":[43,77,34,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":69001,\"Lock\":0},{\"RanV\":[41,53,45,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":69002,\"Lock\":0},{\"RanV\":[27,70,39,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":69003,\"Lock\":0},{\"RanV\":[23,43,34,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":1,\"Id\":69007,\"Lock\":0},{\"RanV\":[100,21,20,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":1,\"Id\":69008,\"Lock\":0},{\"RanV\":[85,21,19,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":1,\"Id\":69009,\"Lock\":0},{\"RanV\":[80,20,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":1,\"Id\":69010,\"Lock\":0},{\"RanV\":[16,70,22,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":1,\"Id\":69011,\"Lock\":0},{\"RanV\":[19,70,20,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":1,\"Id\":69012,\"Lock\":0},{\"RanV\":[34,39,62,80],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":1,\"Id\":69013,\"Lock\":0},{\"RanV\":[42,30,35,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":1,\"Id\":69014,\"Lock\":0},{\"RanV\":[43,37,26,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":1,\"Id\":69015,\"Lock\":0},{\"RanV\":[52,90,54,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":69101,\"Lock\":0},{\"RanV\":[55,93,65,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":69102,\"Lock\":0},{\"RanV\":[67,82,67,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":69103,\"Lock\":0},{\"RanV\":[39,64,71,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":2,\"Id\":69107,\"Lock\":0},{\"RanV\":[140,31,37,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":2,\"Id\":69108,\"Lock\":0},{\"RanV\":[120,31,39,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":2,\"Id\":69109,\"Lock\":0},{\"RanV\":[160,33,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":2,\"Id\":69110,\"Lock\":0},{\"RanV\":[26,110,41,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":2,\"Id\":69111,\"Lock\":0},{\"RanV\":[24,115,33,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":2,\"Id\":69112,\"Lock\":0},{\"RanV\":[40,58,104,102],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":2,\"Id\":69113,\"Lock\":0},{\"RanV\":[65,61,43,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":2,\"Id\":69114,\"Lock\":0},{\"RanV\":[54,45,50,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":2,\"Id\":69115,\"Lock\":0},{\"RanV\":[81,119,84,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":69201,\"Lock\":0},{\"RanV\":[79,117,91,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":69202,\"Lock\":0},{\"RanV\":[73,120,85,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":69203,\"Lock\":0},{\"RanV\":[54,86,84,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":3,\"Id\":69207,\"Lock\":0},{\"RanV\":[210,44,46,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":3,\"Id\":69208,\"Lock\":0},{\"RanV\":[215,48,51,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":3,\"Id\":69209,\"Lock\":0},{\"RanV\":[220,40,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":3,\"Id\":69210,\"Lock\":0},{\"RanV\":[39,205,51,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":3,\"Id\":69211,\"Lock\":0},{\"RanV\":[44,195,43,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":3,\"Id\":69212,\"Lock\":0},{\"RanV\":[63,65,115,117],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":3,\"Id\":69213,\"Lock\":0},{\"RanV\":[70,64,76,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":3,\"Id\":69214,\"Lock\":0},{\"RanV\":[69,77,65,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":3,\"Id\":69215,\"Lock\":0},{\"RanV\":[103,156,97,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":69301,\"Lock\":0},{\"RanV\":[90,154,110,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":69302,\"Lock\":0},{\"RanV\":[98,152,94,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":69303,\"Lock\":0},{\"RanV\":[61,91,94,0],\"RanT\":[1,4,2,0],\"SubProperty\":0,\"Level\":4,\"Id\":69307,\"Lock\":0},{\"RanV\":[250,60,65,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":4,\"Id\":69308,\"Lock\":0},{\"RanV\":[275,65,56,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":4,\"Id\":69309,\"Lock\":0},{\"RanV\":[270,53,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":4,\"Id\":69310,\"Lock\":0},{\"RanV\":[50,260,55,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":4,\"Id\":69311,\"Lock\":0},{\"RanV\":[54,260,62,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":4,\"Id\":69312,\"Lock\":0},{\"RanV\":[86,87,163,172],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":4,\"Id\":69313,\"Lock\":0},{\"RanV\":[82,93,82,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":4,\"Id\":69314,\"Lock\":0},{\"RanV\":[94,83,79,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":4,\"Id\":69315,\"Lock\":0},{\"RanV\":[123,184,131,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":69401,\"Lock\":0},{\"RanV\":[118,201,115,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":69402,\"Lock\":0},{\"RanV\":[121,199,116,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":5,\"Id\":69403,\"Lock\":0},{\"RanV\":[370,77,69,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":5,\"Id\":69408,\"Lock\":0},{\"RanV\":[360,68,77,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":5,\"Id\":69409,\"Lock\":0},{\"RanV\":[320,65,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":5,\"Id\":69410,\"Lock\":0},{\"RanV\":[62,330,69,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":5,\"Id\":69411,\"Lock\":0},{\"RanV\":[57,345,72,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":5,\"Id\":69412,\"Lock\":0},{\"RanV\":[104,116,192,192],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":5,\"Id\":69413,\"Lock\":0},{\"RanV\":[100,113,120,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":5,\"Id\":69414,\"Lock\":0},{\"RanV\":[99,106,100,0],\"RanT\":[11,15,4,0],\"SubProperty\":0,\"Level\":5,\"Id\":69415,\"Lock\":0},{\"RanV\":[142,218,156,0],\"RanT\":[4,35,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":69501,\"Lock\":0},{\"RanV\":[146,220,139,0],\"RanT\":[4,36,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":69502,\"Lock\":0},{\"RanV\":[138,222,148,0],\"RanT\":[4,37,2,0],\"SubProperty\":0,\"Level\":6,\"Id\":69503,\"Lock\":0},{\"RanV\":[380,89,87,0],\"RanT\":[5,23,24,0],\"SubProperty\":0,\"Level\":6,\"Id\":69508,\"Lock\":0},{\"RanV\":[410,86,83,0],\"RanT\":[5,25,26,0],\"SubProperty\":0,\"Level\":6,\"Id\":69509,\"Lock\":0},{\"RanV\":[425,72,0,0],\"RanT\":[5,10,0,0],\"SubProperty\":0,\"Level\":6,\"Id\":69510,\"Lock\":0},{\"RanV\":[69,415,90,0],\"RanT\":[10,5,26,0],\"SubProperty\":0,\"Level\":6,\"Id\":69511,\"Lock\":0},{\"RanV\":[72,440,86,0],\"RanT\":[10,5,23,0],\"SubProperty\":0,\"Level\":6,\"Id\":69512,\"Lock\":0},{\"RanV\":[122,132,206,224],\"RanT\":[4,2,35,37],\"SubProperty\":0,\"Level\":6,\"Id\":69513,\"Lock\":0},{\"RanV\":[115,132,135,0],\"RanT\":[11,2,15,0],\"SubProperty\":0,\"Level\":6,\"Id\":69514,\"Lock\":0}]},\"hero\":{\"10002\":{\"mp_add\":4,\"shortcut\":[0,0,0,0,0,0,0],\"hp_add\":2,\"talent_pt\":100,\"level\":19,\"heroNo\":10002,\"shortcut_id\":1,\"talent_tree\":{\"12109\":1,\"12209\":1,\"12101\":1,\"12201\":1,\"12105\":1,\"12206\":1},\"att_pt\":18,\"exp\":950,\"att_add\":[0,0,0,0,0,0,0]},\"10001\":{\"mp_add\":4,\"shortcut\":[20020,30001,0,0,0,0,0],\"hp_add\":3,\"talent_pt\":100,\"level\":19,\"heroNo\":10001,\"shortcut_id\":2,\"talent_tree\":{\"11206\":1,\"11201\":1,\"11101\":1},\"att_pt\":18,\"exp\":950,\"att_add\":[0,0,0,0,0,0,0]},\"10004\":{\"mp_add\":4,\"shortcut\":[0,0,0,0,0,0,0],\"hp_add\":2,\"talent_pt\":100,\"level\":19,\"heroNo\":10004,\"shortcut_id\":1,\"talent_tree\":{\"14111\":1,\"14101\":1,\"14203\":1},\"att_pt\":18,\"exp\":950,\"att_add\":[0,0,0,0,0,0,0]},\"10003\":{\"mp_add\":4,\"shortcut\":[20020,30001,0,0,0,0,0],\"hp_add\":2,\"talent_pt\":100,\"level\":19,\"heroNo\":10003,\"shortcut_id\":2,\"talent_tree\":{\"13203\":1,\"13101\":1,\"13204\":1,\"13205\":1},\"att_pt\":18,\"exp\":950,\"att_add\":[0,0,0,0,0,0,0]},\"10005\":{\"mp_add\":4,\"shortcut\":[0,0,0,0,0,0,0],\"hp_add\":2,\"talent_pt\":100,\"level\":19,\"heroNo\":10005,\"shortcut_id\":1,\"talent_tree\":{\"15201\":1,\"15112\":1,\"15205\":1,\"15203\":1,\"15209\":1,\"15109\":1,\"15208\":1},\"att_pt\":18,\"exp\":950,\"att_add\":[0,0,0,0,0,0,0]}},\"story\":{\"door\":[],\"player_behavior_record_off\":0,\"fountain\":[],\"achievement\":{\"20002\":1,\"20001\":1,\"40002\":1,\"11010\":5,\"40001\":1,\"10008\":1,\"10019\":1,\"11009\":1000,\"10007\":1,\"12002\":4,\"11001\":1,\"10002\":1,\"10001\":1,\"12014\":15,\"12003\":6,\"10012\":1,\"11005\":1,\"10004\":1,\"10003\":1,\"12005\":1,\"10006\":1,\"10005\":1,\"10016\":1},\"maze\":{\"ele_type_2\":-1,\"ele_type_3\":-1,\"ele_type_1\":-1,\"pattern\":0,\"s_id\":0,\"a_id\":0,\"lv_add\":0,\"e_id\":0,\"ele_rnd2_3\":0,\"ele_rnd1_4\":0,\"floor\":1,\"ele_rnd1_3\":0,\"ele_rnd2_2\":0,\"ele_rnd1_2\":0,\"ele_rnd2_1\":0,\"ele_type_4\":-1,\"ele_rnd1_1\":0,\"m_id\":1,\"ele_rnd2_4\":0,\"b_bar\":0,\"ele_cnt_4\":-1,\"ele_cnt_3\":-1,\"ele_cnt_2\":-1,\"ele_id_4\":-1,\"ele_id_3\":-1,\"ele_cnt_1\":-1,\"ele_id_2\":-1,\"b_list\":[],\"ele_id_1\":-1},\"cover\":[],\"cage\":[],\"altar\":[[null,null,null,null,2]],\"elevator\":[],\"a_id\":1,\"entrance_o\":1,\"q_list_history\":[53012,21014,53706,83006,65062,72019,45067,75015,35044,35013,55029,83701,72004,95105,15008,19013,42027,63005,25042,93015,25075,15074,91107,23004,55010,15043,45037,35029,65053,72036,95137,15012,42072,42105,25017,33012,53013,42043,53707,93014,45066,85021,91106,23012,75017,45020,15047,65036,12301,95235,72037,90017,11001,25025,32045,72301,25058,91105,23020,13011,15051,55011,92517,61005,45007,95168,53010,90049,22202,11005,63714,33013,83010,52052,91104,43702,65035,75019,55027,35046,15024,11009,25041,19014,91202,83011,93019,63705,75018,15059,61004,95232,35031,92052,32003,53011,25049,52918,75005,91201,43007,12002,52053,93018,3021002,3021004,55090,65067,15063,90071,45022,35047,88888,35016,15032,63002,25057,75037,73003,63704,41004,65083,90037,45038,19003,45009,55048,15036,63018,42201,75036,75069,43006,42044,75007,92215,93016,53710,12204,55091,42403,95163,90042,90011,25007,15040,55033,93007,25073,75068,75006,53001,63703,63009,65082,12208,15075,95162,41007,13702,55014,45041,35033,65057,25048,93006,85013,75038,23010,75009,12018,16002,53711,21001,45070,95128,95161,65007,55030,32043,12302,65073,35018,93005,75070,23018,75008,85018,12022,63008,33001,95160,15083,90041,45057,45040,15052,51001,93004,45011,35003,53014,75040,11006,75011,33017,62900,92012,42405,65039,25039,65072,35050,45027,35019,83003,22018,85016,31002,75010,75043,33002,42900,15091,65022,62049,63709,53701,15060,61008,25080,93010,53015,73708,90028,52503,29003,33018,21002,15095,25022,65038,65071,23015,45026,83001,35051,35020,15033,95181,90060,90029,43011,33003,53004,21010,42003,63708,41008,12201,61007,75061,45042,45013,15037,95180,32405,90061,23702,73012,33019,25038,65070,12205,25071,75060,65012,13001,35052,45029,43010,15010,90066,62047,33004,53005,63013,15076,23008,45012,62311,55053,29002,90032,90067,33020,32041,42501,22031,45074,15080,23016,75033,13009,65044,35053,35022,29010,53002,99108,62046,11003,25029,19002,41010,45061,75065,85011,15053,65060,32404,45015,22900,73714,52087,11007,25037,33021,25070,81002,15088,65010,93003,85008,63017,35034,13017,15057,55035,91203,22201,62202,45031,75003,22501,95216,91109,53009,55008,43012,53003,52103,63011,23005,16015,13003,55013,25078,62114,62920,13010,15046,15092,95104,35028,29005,85009,55082,65059,75067,75034,25082,45014,45033,45047,3021006,55043,65001,65056,55071,25020,62301,55001,32046,45068,23013,65032,73004,45024,85014,45016,42053,52092,22032,71001,25015,62069,16025,62308,52900,73701,73006,15073,61028,75071,90044,23002,23019,90008,21008,45001,15031,15034,25028,63010,23017,73715,95156,75020,43004,75004,99999,62201,43701,75013,23001,23011,71002,53709,63712,65058,12202,90016,73702,45063,16006,45046,17002,45069,31001,90077,15041,45017,91207,15038,25036,45006,43009,72201,25069,73002,25054,13007,24001,25008,22401,75039,21011,52093,15061,71003,85001,73716,12206,53705,15021,73703,73718,95179,23701,73005,90027,85012,15042,91206,99106,22502,55041,83012,13701,92011,25077,75042,62918,15011,23006,81001,95223,15058,33008,31007,13018,42906,95111,15064,65028,45062,83008,65014,73704,55081,23007,17001,90059,55022,91205,45049,62310,99107,55057,83005,62045,52602,62303,75066,32042,15015,23014,15094,52408,95103,12020,75014,62066,73007,21005,75072,25055,45078,32900,19001,45056,73705,90025,45004,91006,91204,12019,83013,73008,65081,61001,45003,35006,53007,90054,55023,15054,53006,45065,85020,62083,95135,63710,16008,42071,99101,13016,95102,45028,90014,21007,15085,92062,13006,73706,53708,42302,13014,25035,19008,16003,15019,29001,45019,35011,63006,3021003,55073,25056,15023,12405,95101,95134,29008,91005,16012,22402,83002,25072,95182,13013,15002,13703,65013,22906,13005,91004,73707,63701,41001,23003,73009,75041,45002,25076,45035,65065,43005,43008,61009,12017,95159,17005,95133,75055,63015,51005,16016,16013,90038,33010,43003,42041,55015,12001,15093,21004,55032,43705,72017,45032,99103,15062,35054,61016,45018,91209,13008,90022,33015,65005,65050,12021,55028,33016,91007,93001,95231,90013,13004,45008,29007,65008,15001,33014,55056,21006,15097,90036,15067,32902,65046,35045,65019,15066,75012,16001,53713,3021005,91009,3021001,73001,65021,45005,55044,15035,95164,63014,95230,90076,90045,15055,95106,43002,83004,75044,33011],\"r_a_id\":1,\"loop\":2,\"hc_type\":0,\"a_id_o\":0,\"hc_property\":[],\"frog_finish\":[],\"random_seed\":39013,\"h_select_maze_list\":[10001,10005],\"formula_known\":[],\"patch_id\":20200410,\"document_known\":{\"30207\":1},\"statue\":[],\"diff\":2,\"random_times\":7540,\"call_id\":1,\"m_meet\":[],\"arr_id\":0,\"hc_id\":0,\"r_look\":[-0.032,0,-0.999],\"m_kill_cnt\":[],\"bridge\":[],\"h_select_skin_list\":[],\"r_id\":10001,\"s_id_o\":0,\"item_drop\":[],\"stair\":[],\"s_mode\":1,\"h_property\":{\"10002\":{\"12\":100,\"101\":6,\"102\":99999,\"103\":6,\"5\":724,\"16\":0,\"104\":12,\"105\":6,\"106\":12,\"8\":100},\"10001\":{\"12\":100,\"16\":0,\"5\":658,\"8\":100},\"10004\":{\"12\":100,\"16\":0,\"5\":984,\"8\":100},\"10003\":{\"12\":100,\"16\":0,\"5\":849,\"8\":100},\"10005\":{\"12\":100,\"16\":0,\"5\":916,\"8\":100}},\"m_dead_list\":[],\"pattern\":0,\"arr_sid\":0,\"kill_boss_not_in_san\":0,\"had_noob_item\":0,\"pattern_o\":0,\"bless_times\":[],\"m_call_list\":[],\"h_select_list\":[10001,10005],\"s_id\":1,\"achievement_finish\":[11009,20002,12005,11001,10001,10002,10003,11005,10004,10016,10005,10012,10006,10007,40002,40001,10008,10019,20001],\"call_sid\":1,\"document_order\":[30207,30303,30519,30407,30619,30621],\"map\":{\"99\":{\"portals\":[],\"status\":1},\"100\":{\"portals\":{\"101\":1,\"102\":0},\"status\":1},\"200\":{\"portals\":{\"201\":0,\"202\":0},\"status\":0},\"300\":{\"portals\":{\"301\":0,\"302\":0,\"303\":0},\"status\":0},\"400\":{\"portals\":{\"401\":0,\"402\":0,\"403\":0},\"status\":0},\"500\":{\"portals\":{\"501\":0,\"502\":0},\"status\":0},\"600\":{\"portals\":{\"601\":0,\"602\":0},\"status\":0},\"700\":{\"portals\":{\"701\":0,\"702\":0},\"status\":0},\"800\":{\"portals\":[],\"status\":0},\"900\":{\"portals\":{\"901\":0},\"status\":0}},\"b_pos\":[-8.65,-0.009,-68.63],\"transaction_num\":[],\"crate\":[],\"h_select_idx\":1,\"q_list\":[13013,15053,16025,15037,17002,91203,11006,91104,19008,91207,15038,62900,15055,42403,95163,12405,42405,22401,13016,75060,22402,19013,52900,13001,15057,15073,22906,91202,15058,91206,91107,13701,42900,15059,16015,62918,75055,62920,15060,15076,16013,42906,91201,99999,15061,55048,12017,16001,52918,29001,55053,13006,15042,29002,91205,16002,91106,29003,55057,32405,17001,52602,12019,15095,12301,29005,95162,55056,15032,91209,15064,15062,12302,29007,15074,15094,12020,13009,12021,15054,15001,52408,32902,29010,32404,91204,15066,91105,12022,15034,15085,91109,19001,32900,16016,15083,19002,15035,95164,16012,19003,15046,15052,16008,75061,15036,13014,42027,22900],\"honeypot\":[],\"san_idx\":0,\"time_record\":{\"99\":{\"9\":{\"10001\":[]},\"10\":{\"10001\":710.35}},\"1\":{\"9\":{\"10001\":{\"duration\":253.37,\"start_time\":21007.41}},\"10\":{\"10001\":7386.15}},\"2\":{\"9\":{\"10001\":{\"duration\":91.949999999998}},\"10\":{\"10001\":1940.28}},\"3\":{\"9\":{\"10001\":{\"duration\":2.0200000000004}},\"10\":{\"10001\":390.48}},\"4\":{\"9\":{\"10001\":{\"duration\":847.45},\"10003\":[]},\"10\":{\"10001\":1840.46,\"10003\":11.84}},\"499\":{\"9\":{\"10001\":[]},\"10\":{\"10001\":0}},\"301\":{\"9\":{\"10001\":[]},\"10\":{\"10001\":633.11}},\"5\":{\"9\":{\"10001\":{\"duration\":20.700000000001},\"10003\":[]},\"10\":{\"10001\":1520.02,\"10003\":8.5}},\"302\":{\"9\":{\"10001\":[]},\"10\":{\"10001\":171.69}},\"6\":{\"9\":{\"10001\":{\"duration\":197.22}},\"10\":{\"10001\":2317.74}},\"7\":{\"9\":{\"10001\":[],\"10003\":{\"duration\":55.970000000001}},\"10\":{\"10001\":750.2,\"10003\":2029.58}},\"8\":{\"9\":{\"10001\":{\"duration\":2398.3,\"start_time\":21007.41}},\"10\":{\"10001\":441.88}},\"9\":{\"9\":{\"10001\":{\"duration\":102.72}},\"10\":{\"10001\":855.13}}},\"r_pos\":[-8.65,-0.009,-68.63],\"b_look\":[-0.032,0,-0.999],\"h_enable_list\":[10004,10003,10001,10005,10002],\"gate\":[],\"achievement_statistics\":{\"12002\":[92011,92012,92052,92062],\"12003\":[22906,32902,52918,42906,62918,62920],\"12014\":[11009,12005,11001,10001,10002,10003,11005,10004,10016,10005,10012,10006,10007,10008,10019]},\"h_select_maze_idx\":1}}}"

		LS_Setting.SyncSaveSlotInfo(3, 4, 37, 1171.86, 1595856486, 1595856486, 2, 1, true)
	end

	Recorder.write(LS_Game.GetKey(saveId), retStr)
end

return LS_Game
