-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/BattleData.lua

BattleData = class("BattleData")
BattleData.Type = {
	PVP_5 = 3,
	PVP_2 = 2,
	PVE_Occupy = 50,
	PVP_1 = 1,
	PVE_Custom = 52,
	PVE_Guard = 51,
	PVE_Story = 53
}
BattleData.ResultType = {
	Lose = 2,
	Draw = 3,
	Win = 1
}
BattleData.GlobalDifficultyLevel = {
	Expert = 3,
	Casual = 1,
	Normal = 2
}

local sceneId = 0
local battleSeed = 0
local battleType = BattleData.Type.PVE_Story
local bossMode = false
local hostList = {}
local enemyList = {}
local enemyAllList = {}
local friendList = {}
local callList = {}
local callAllList = {}
local loadHeroIdList = {}
local loadHeroIdAllList = {}
local loadHeroIdIsNpc = {}
local heroId = 0
local enemyListCustom, friendListCustom
local difficulty = BattleData.GlobalDifficultyLevel.Normal
local isHaveNoobItem = false

BattleData.static.AnimalId_HomeBase = 101
BattleData.static.AnimalId_Enemy = 201
BattleData.static.AnimalId_Call = 1001
BattleData.static.GameLoopMax = 4
BattleData.static.DefaultItemList = {}
BattleData.static.DefaultItemQuantityList = {
	10
}

function BattleData.SetBattleType(type, mode)
	battleType = type

	if mode then
		bossMode = mode
	else
		bossMode = false
	end

	local ret = false

	if battleType == BattleData.Type.PVE_Occupy then
		BattleData.SetSceneId(10001)

		ret = true
	elseif battleType == BattleData.Type.PVE_Custom then
		BattleData.SetSceneId(10002)

		ret = true
	elseif battleType == BattleData.Type.PVE_Guard then
		BattleData.SetSceneId(1002)

		ret = true
	elseif battleType == BattleData.Type.PVE_Story then
		local storyId = FS_UserData.story:GetStoryId()

		if storyId > 0 then
			local storyData = MS_StoryList.GetStoryData(storyId)

			if storyData ~= nil then
				local stageId = storyData:GetStageId()

				if stageId > 0 then
					BattleData.SetSceneId(stageId)

					ret = true
				else
					SystemHelper.LogError("===============SetSceneId error !=stageId=" .. stageId)
				end
			else
				SystemHelper.LogError("===============GetStoryData error !=storyId=" .. storyId)
			end
		else
			SystemHelper.LogError("===============GetStoryId error !=storyId=" .. storyId)
		end
	else
		SystemHelper.LogError("========SetBattleType=====error!!!")
	end

	return ret
end

function BattleData.InitBattleMode()
	if battleType == BattleData.Type.PVE_Occupy then
		BattleData.InitOccupyMode()
	elseif battleType == BattleData.Type.PVE_Custom then
		BattleData.InitCustomMode()
	elseif battleType == BattleData.Type.PVE_Guard then
		BattleData.InitGuardMode()
	elseif battleType == BattleData.Type.PVE_Story then
		if not bossMode then
			BattleData.InitStoryMode()
		else
			BattleData.InitStoryBossMode()
		end
	else
		SystemHelper.LogError("========InitBattleMode=====error!!!")
	end

	BattleData.InitCallPlayerNum()
	BattleData.InitLoadHeroIdList()
end

function BattleData.SetDifficulty(level)
	if level > BattleData.GlobalDifficultyLevel.Normal then
		level = BattleData.GlobalDifficultyLevel.Normal
	end

	difficulty = level

	SdkHelper.SetGameMode(level)
end

function BattleData.GetDifficulty()
	return difficulty
end

function BattleData.SetNoobItem(isHave)
	isHaveNoobItem = isHave
end

function BattleData.isHaveNoobItem()
	return isHaveNoobItem
end

function BattleData.InitLoadHeroIdList()
	loadHeroIdList = {}
	loadHeroIdAllList = {}

	BattleData.AddLoadHeroIdList(loadHeroIdList, hostList)

	if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
		local tmpList = {}
		local heroIdList = MS_HeroData.GetEnableHeroIdList()

		for i = 1, #heroIdList do
			local heroId = tonumber(heroIdList[i])

			table.insert(tmpList, heroId)

			local num = MS_StorySkin.GetSkinMax(heroId)

			if num > 0 then
				for j = 1, num do
					table.insert(tmpList, heroId + 1000 * j)
				end
			end
		end

		BattleData.AddLoadHeroIdList(loadHeroIdList, tmpList)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		local tmpList = {}
		local heroIdList = FS_UserData.story:GetEnableHeroIdList()

		for i = 1, #heroIdList do
			local heroId = tonumber(heroIdList[i])

			table.insert(tmpList, heroId)

			local num = MS_StorySkin.GetSkinMax(heroId)

			if num > 0 then
				for j = 1, num do
					table.insert(tmpList, heroId + 1000 * j)
				end
			end
		end

		BattleData.AddLoadHeroIdList(loadHeroIdList, tmpList)
	end

	BattleData.AddLoadHeroIdList(loadHeroIdList, enemyList)
	BattleData.AddLoadHeroIdList(loadHeroIdList, friendList)
	BattleData.AddLoadHeroIdList(loadHeroIdList, callList)
	BattleData.AddLoadHeroIdList(loadHeroIdAllList, hostList)
	BattleData.AddLoadHeroIdList(loadHeroIdAllList, enemyAllList)
	BattleData.AddLoadHeroIdList(loadHeroIdAllList, friendList)
	BattleData.AddLoadHeroIdList(loadHeroIdAllList, callAllList)
end

function BattleData.AddLoadHeroIdList(recordList, list)
	if list ~= nil then
		for i = 1, #list do
			recordList[tonumber(list[i])] = 1
		end
	end
end

function BattleData.GetLoadHeroIdList()
	return loadHeroIdList
end

function BattleData.GetLoadHeroIdAllList()
	return loadHeroIdAllList
end

function BattleData.IsHeroIdNpc(heroId)
	if loadHeroIdIsNpc ~= nil and loadHeroIdIsNpc[heroId] ~= nil and loadHeroIdIsNpc[heroId] == true then
		return true
	end

	return false
end

function BattleData.GetLoadHeroIdNum()
	return table.nums(loadHeroIdList)
end

function BattleData.InitBattleData()
	FS_Battle_MatchGame.initialize()
	FS_Battle_MatchGame.SetMatchPlayerMax(BattleData.GetType())
	FS_Battle_Frame.initialize()
end

function BattleData.IsBattleMode(mode)
	if battleType == mode then
		return true
	end

	return false
end

function BattleData.IsRuleMode(mode)
	if ruleType == mode then
		return true
	end

	return false
end

function BattleData.GetType()
	return battleType
end

function BattleData.Clear()
	return
end

function BattleData.SetBattleSeed(seed)
	battleSeed = seed

	MathHelper.setRandomSeed(battleSeed)
end

function BattleData.SetSceneId(id)
	sceneId = id
end

function BattleData.GetSceneId()
	return sceneId
end

function BattleData.GetLoadSceneId()
	local storyId = FS_UserData.story:GetStoryId()

	if MS_StoryList.IsStoryNew(storyId) then
		if storyId == 2002 then
			return 16012
		elseif storyId == 2003 then
			return 14012
		elseif storyId == 2004 then
			return 15012
		end

		return sceneId - 1000
	else
		return sceneId
	end
end

function BattleData.GetPathSceneId()
	local storyId = FS_UserData.story:GetStoryId()

	if MS_StoryList.IsStoryArcadeBoss(storyId) then
		if storyId == 2002 then
			return 16012
		elseif storyId == 2003 then
			return 14012
		elseif storyId == 2004 then
			return 15012
		end

		return sceneId - 1000
	else
		return sceneId
	end
end

function BattleData.GetSceneName(id)
	if id == 1002 then
		return "Cave" .. id
	else
		return "Arena" .. id
	end
end

function BattleData.ConvertSceneId(name)
	if StringHelper.StartsWith(name, "Cave") == true then
		return tonumber(StringHelper.Substring(name, 5, string.len(name)))
	elseif StringHelper.StartsWith(name, "Arena") == true then
		return tonumber(StringHelper.Substring(name, 6, string.len(name)))
	else
		SystemHelper.LogError("=====ConvertSceneId====name=" .. name)
	end

	return 0
end

function BattleData.GetSceneNameFromFullPath(fullPath)
	if fullPath ~= nil and fullPath ~= "" then
		local nameList = StringHelper.Split(fullPath, "/")

		if #nameList > 0 then
			return nameList[#nameList]
		end
	end

	return nil
end

function BattleData.GetScenePath(id)
	if id == 10002 then
		return "Scenes/Common/"
	else
		return "Scenes/Arena/"
	end
end

function BattleData.IsDarkForestScene()
	if sceneId > 20000 and sceneId < 30000 then
		return true
	end

	return false
end

function BattleData.IsDreamScene()
	if sceneId > 30000 and sceneId < 40000 then
		return true
	end

	return false
end

function BattleData.GetHeroName(heroId)
	return "hero" .. heroId
end

function BattleData.ConvertHeroIdWithoutSkin(id)
	id = tonumber(id)

	if id < 20000 then
		local tmpId = id - 10000

		if tmpId > 1000 then
			tmpId = tmpId % 1000
		end

		tmpId = tmpId + 10000

		return tmpId
	elseif id == 21039 then
		return 20039
	end

	return id
end

function BattleData.ConvertHeroIdWithSkin(id, force)
	id = BattleData.ConvertHeroIdWithoutSkin(id)

	if id < 20000 then
		local tmpId = id - 10000

		if tmpId < 1000 then
			local skinId = FS_UserData.story:GetSelectSkin(id)

			if skinId > 0 then
				local storyId = FS_UserData.story:GetStoryId()

				if MS_StoryList.IsStoryMazeStart(storyId) == false and MS_StoryList.IsStoryCarriage(storyId) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == false and id ~= 10001 and (force == nil or force == false) then
					local tmpIdSkin = tmpId + skinId * 1000
					local tmpHeroIdSkin = tmpIdSkin + 10000

					if hostList ~= nil then
						for k, heroId in pairs(hostList) do
							if heroId == tmpHeroIdSkin then
								tmpId = tmpIdSkin

								break
							end
						end
					end
				else
					tmpId = tmpId + skinId * 1000
				end
			end
		end

		tmpId = tmpId + 10000

		return tmpId
	elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == true and id == 20039 then
		local skinId = FS_UserData.story:GetSelectSkin(10007)

		if skinId <= 0 then
			return 21039
		end
	end

	return id
end

function BattleData.ConvertHeroNameToId(name)
	local nameList = StringHelper.Split(name, "_")
	local headName = nameList[1]

	if StringHelper.StartsWith(headName, "hero") == true or StringHelper.StartsWith(headName, "Hero") == true then
		local id = string.sub(headName, 5, string.len(headName))

		return tonumber(id)
	end

	return 0
end

function BattleData.SetHeroId(id)
	heroId = id
end

function BattleData.GetHeroId()
	return heroId
end

function BattleData.InitOccupyMode()
	hostList = {}
	enemyList = {}
	friendList = {}
	loadHeroIdIsNpc = {}

	table.insert(hostList, BattleData.GetHeroId())

	for index = 1, 3 do
		if enemyList[index] == nil then
			local num = math.random(3)

			table.insert(enemyList, 10000 + num)
		end
	end

	for index = 1, 2 do
		if friendList[index] == nil then
			local num = math.random(3)

			table.insert(friendList, 10000 + num)
		end
	end

	enemyAllList = enemyList
end

function BattleData.InitCustomMode()
	hostList = {}
	enemyList = {}
	friendList = {}
	loadHeroIdIsNpc = {}

	table.insert(hostList, BattleData.GetHeroId())

	if friendListCustom ~= nil then
		for k, v in pairs(friendListCustom) do
			if v > 0 then
				table.insert(friendList, v)
			else
				local heroIdList = MS_HeroData.GetEnableHeroIdList()
				local num = MathHelper.getRandom(1, #heroIdList, k)

				table.insert(friendList, heroIdList[num])
			end
		end
	end

	if enemyListCustom ~= nil then
		for k, v in pairs(enemyListCustom) do
			if v > 0 then
				table.insert(enemyList, v)
			else
				local heroIdList = MS_HeroData.GetEnableHeroIdList()
				local num = MathHelper.getRandom(1, #heroIdList, -k)

				table.insert(enemyList, heroIdList[num])
			end
		end
	end

	enemyAllList = enemyList
end

function BattleData.InitGuardMode()
	hostList = {}

	table.insert(hostList, BattleData.GetHeroId())

	enemyList = {
		20001,
		20002,
		20003,
		20004
	}
	friendList = {
		10002,
		10003
	}

	local idList = MS_HeroData.GetSelectHeroIdList()
	local cnt = 1

	for i = 1, #idList do
		if tonumber(BattleData:GetHeroId()) ~= tonumber(idList[i]) then
			friendList[cnt] = idList[i]
			cnt = cnt + 1

			if cnt > #friendList then
				break
			end
		end
	end

	enemyAllList = enemyList
end

function BattleData.InitStoryMode()
	local storyId = FS_UserData.story:GetStoryId()

	hostList = FS_UserData.story:GetLoadHeroList()

	if MS_StoryList.IsStoryMazeStart(storyId) == true then
		hostList = {}

		local heroIdList = MS_HeroData.GetEnableHeroIdList()

		for i = 1, #heroIdList do
			local heroId = tonumber(heroIdList[i])

			table.insert(hostList, heroId)
		end
	end

	enemyList = {}
	enemyAllList = {}
	friendList = {}

	for k, heroId in pairs(hostList) do
		hostList[k] = BattleData.ConvertHeroIdWithSkin(heroId, true)
	end

	loadHeroIdIsNpc = {}

	for k, heroId in pairs(hostList) do
		loadHeroIdIsNpc[heroId] = false
	end

	if DebugTestMemory == false then
		local monsterList = MS_StoryMonster.GetStoryMonsterArea(storyId, FS_UserData.story:GetPattern(), FS_UserData.story:GetAreaId())

		if monsterList ~= nil then
			for i, monsterData in pairs(monsterList) do
				local heroId = tonumber(monsterData.HeroId)

				heroId = BattleData.ConvertHeroIdWithSkin(heroId)

				if BattleData.IsHaveHeroId(enemyList, heroId) == false then
					table.insert(enemyList, heroId)
				end
			end
		end

		local monsterAllList = MS_StoryMonster.GetStoryMonsterAll(storyId, FS_UserData.story:GetPattern())

		if monsterAllList ~= nil then
			for i, monsterData in pairs(monsterAllList) do
				local heroId = tonumber(monsterData.HeroId)
				local npc = tonumber(monsterData.IsNPC)

				heroId = BattleData.ConvertHeroIdWithSkin(heroId)

				if BattleData.IsHaveHeroId(enemyAllList, heroId) == false then
					table.insert(enemyAllList, heroId)
				end

				if npc > 0 then
					if loadHeroIdIsNpc[heroId] == nil then
						loadHeroIdIsNpc[heroId] = true
					end
				else
					loadHeroIdIsNpc[heroId] = false
				end
			end
		end

		if MS_StoryList.IsStoryMaze(storyId) == true then
			local tmpHeroId = 0

			tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

			if tmpHeroId <= 0 then
				tmpHeroId, tmpHeroType = FS_UserData.story:GetMazeHeroCallData()
			end

			if tmpHeroId > 0 then
				tmpHeroId = BattleData.ConvertHeroIdWithSkin(tmpHeroId)

				if BattleData.IsHaveHeroId(enemyList, tmpHeroId) == false then
					table.insert(enemyList, tmpHeroId)
				end

				if BattleData.IsHaveHeroId(enemyAllList, tmpHeroId) == false then
					table.insert(enemyAllList, tmpHeroId)
				end

				loadHeroIdIsNpc[tmpHeroId] = false
			end
		end
	end
end

function BattleData.InitStoryBossMode()
	hostList = {}

	table.insert(hostList, BattleData.GetHeroId())

	for k, heroId in pairs(hostList) do
		hostList[k] = BattleData.ConvertHeroIdWithSkin(heroId)
	end

	enemyList = {}
	enemyAllList = {}
	friendList = {}
	loadHeroIdIsNpc = {}

	for k, heroId in pairs(hostList) do
		loadHeroIdIsNpc[heroId] = false
	end

	if DebugTestMemory == false then
		local monsterList = MS_StoryMonster.GetStoryMonsterArea(FS_UserData.story:GetStoryId(), FS_UserData.story:GetPattern(), FS_UserData.story:GetAreaId())

		if monsterList ~= nil then
			for i, monsterData in pairs(monsterList) do
				local heroId = tonumber(monsterData.HeroId)

				heroId = BattleData.ConvertHeroIdWithSkin(heroId)

				if BattleData.IsHaveHeroId(enemyList, heroId) == false then
					table.insert(enemyList, heroId)
				end
			end
		end

		local monsterAllList = MS_StoryMonster.GetStoryMonsterAll(FS_UserData.story:GetStoryId(), FS_UserData.story:GetPattern())

		if monsterAllList ~= nil then
			for i, monsterData in pairs(monsterAllList) do
				local heroId = tonumber(monsterData.HeroId)
				local npc = tonumber(monsterData.IsNPC)

				heroId = BattleData.ConvertHeroIdWithSkin(heroId)

				if BattleData.IsHaveHeroId(enemyAllList, heroId) == false then
					table.insert(enemyAllList, heroId)
				end

				if npc > 0 then
					if loadHeroIdIsNpc[heroId] == nil then
						loadHeroIdIsNpc[heroId] = true
					end
				else
					loadHeroIdIsNpc[heroId] = false
				end
			end
		end
	end

	FS_UserData.story:InitSelectList()
end

function BattleData.InitCallPlayerNum()
	callList = {}
	callAllList = {}

	BattleData.CheckPlayerCall(callList, hostList)
	BattleData.CheckPlayerCall(callList, friendList)
	BattleData.CheckPlayerCall(callList, enemyList)
	BattleData.CheckPlayerCall(callAllList, hostList)
	BattleData.CheckPlayerCall(callAllList, friendList)
	BattleData.CheckPlayerCall(callAllList, enemyAllList)
end

function BattleData.CheckPlayerCall(recordList, tempList)
	if tempList ~= nil then
		for i = 1, #tempList do
			local heroId = BattleData.ConvertHeroIdWithoutSkin(tempList[i])
			local heroData = MS_HeroData.GetHero(heroId)

			if heroData ~= nil then
				local tmpCallList = heroData.CallHeroIdList

				if tmpCallList ~= nil and #tmpCallList > 0 then
					for j = 1, #tmpCallList do
						local callId = tonumber(tmpCallList[j])

						if callId > 0 then
							if BattleData.IsHaveHeroId(recordList, callId) == false then
								table.insert(recordList, callId)
							end

							loadHeroIdIsNpc[heroId] = false
						end
					end
				end
			end
		end
	end
end

function BattleData.IsHaveHeroId(tempList, id)
	if tempList ~= nil then
		for i = 1, #tempList do
			if tempList[i] == id then
				return true
			end
		end
	end

	return false
end

function BattleData.InitCustomAIList(flist, elist)
	enemyListCustom = elist
	friendListCustom = flist
end

function BattleData.GetHostNum()
	return #hostList
end

function BattleData.GetEnemyNum()
	return #enemyList
end

function BattleData.GetFriendNum()
	return #friendList
end

function BattleData.GetCallNum()
	return #callList
end

function BattleData.GetPVEPlayerNum()
	return BattleData.GetHostNum() + BattleData.GetEnemyNum() + BattleData.GetFriendNum() + BattleData.GetCallNum()
end

function BattleData.GetHostHeroId(index)
	if hostList[index] ~= nil then
		return hostList[index]
	end

	return 0
end

function BattleData.SetFriendHeroId(heroId)
	for i = 1, #friendList do
		friendList[i] = heroId
	end
end

function BattleData.GetFriendHeroId(index)
	if friendList[index] ~= nil then
		return friendList[index]
	end

	return 0
end

function BattleData.GetEnemyHeroId(index)
	if enemyList[index] ~= nil then
		return enemyList[index]
	end

	return 0
end

function BattleData.GetCallHeroId(index)
	if callList[index] ~= nil then
		return callList[index]
	end

	return 0
end

function BattleData.GetVfxNameList(heroIdList)
	local vfxNameList = {
		"vfx_common"
	}

	if heroIdList ~= nil then
		for k, v in pairs(heroIdList) do
			local heroId = BattleData.ConvertHeroIdWithoutSkin(k)
			local heroData = MS_HeroData.GetHero(heroId)

			if heroData.Enable > 0 then
				table.insert(vfxNameList, "vfx_hero" .. heroId)
			end
		end
	end

	return vfxNameList
end
