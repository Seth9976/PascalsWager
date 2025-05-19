-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_SaveMaze.lua

FS_SaveMaze = class("FS_SaveMaze")
FS_SaveMaze.static.BossBarMax = 100
FS_SaveMaze.static.MazeMax = 14
FS_SaveMaze.static.MazeBossMax = 7
FS_SaveMaze.static.MazeEntranceMax = 3
FS_SaveMaze.static.MazePatternMax = 3
FS_SaveMaze.static.MazeStatueRndMax = 1
FS_SaveMaze.static.MazeStatueRndMin = 0
FS_SaveMaze.static.MazeStatueProb = 500
FS_SaveMaze.static.MazeFountainRndMax = 2
FS_SaveMaze.static.MazeFountainRndMin = 1
FS_SaveMaze.static.MazeFountainProb = 500
FS_SaveMaze.static.MazeHoneypotRndMax = 2
FS_SaveMaze.static.MazeHoneypotRndMin = 1
FS_SaveMaze.static.MazeHoneypotProb = 500
FS_SaveMaze.static.MazeCrateRndMax = 1
FS_SaveMaze.static.MazeCrateRndMin = 0
FS_SaveMaze.static.MazeCrateProb = 500
FS_SaveMaze.static.MazeElementDefaultValue = -1
FS_SaveMaze.static.ElementType = {
	Honeypot = 3,
	Max = 4,
	Crate = 4,
	Fountain = 2,
	Statue = 1
}
FS_SaveMaze.static.DebugShowType = {
	Save = "Save",
	Debug = "Debug",
	Gold = "Gold",
	Silver = "Silver",
	None = "None"
}
FS_SaveMaze.DebugShowList = {}

function FS_SaveMaze:initialize()
	self.storyId = 0
	self.areaId = 0
	self.entranceId = 0
	self.pattern = 0
	self.mazeId = 1
	self.floor = 1
	self.levelAdd = 0
	self.bossBar = 0
	self.bossList = {}
	self.elementId = {}
	self.elementType = {}
	self.elementCnt = {}
	self.elementRnd1 = {}
	self.elementRnd2 = {}

	for i = 1, FS_SaveMaze.ElementType.Max do
		self.elementId[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementType[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementCnt[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementRnd1[i] = 0
		self.elementRnd2[i] = 0
	end

	if DLC_Maze == true then
		FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Statue] = {
			"Statue",
			FS_SaveMaze.DebugShowType.None,
			0,
			Vector3.zero
		}
		FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Fountain] = {
			"Fountain",
			FS_SaveMaze.DebugShowType.None,
			0,
			Vector3.zero
		}
		FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Honeypot] = {
			"Honeypot",
			FS_SaveMaze.DebugShowType.None,
			0,
			Vector3.zero
		}
		FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Crate] = {
			"Crate",
			FS_SaveMaze.DebugShowType.None,
			0,
			Vector3.zero
		}
	end
end

function FS_SaveMaze:Clear()
	self.storyId = 0
	self.areaId = 0
	self.entranceId = 0
	self.pattern = 0
	self.mazeId = 0
	self.floor = 0
	self.levelAdd = 0
	self.bossBar = 0
	self.bossList = nil
	self.elementId = nil
	self.elementType = nil
	self.elementCnt = nil
	self.elementRnd1 = nil
	self.elementRnd2 = nil
end

function FS_SaveMaze:SetMazeId(id)
	self.mazeId = id
end

function FS_SaveMaze:SetLevelAdd(add)
	self.levelAdd = add
end

function FS_SaveMaze:EnterStart()
	FS_UserData.story:ClearHeroCall()

	local rnd = MathHelper.getRandom(1, FS_SaveMaze.MazeMax, 1)

	if DebugMazeRandom == true then
		rnd = DebugMazeId
	end

	self.storyId = MS_StoryData.StoryIdForMaze + rnd
	self.areaId = 1
	self.pattern = MS_StoryMonster.GetStoryRandomPattern(self.storyId)

	if DebugMazeRandom == true then
		self.pattern = DebugMazePattern
	end

	self.entranceId = MathHelper.getRandom(1, FS_SaveMaze.MazeEntranceMax, 2)

	if DebugMazeRandom == true then
		self.entranceId = DebugMazeEntrance
	end

	self.floor = 1
	self.bossBar = 0
	self.bossList = {}

	local tmpCnt = {}
	local tmp = FS_SaveMaze.MazeElementDefaultValue

	for i = 1, FS_SaveMaze.ElementType.Max do
		table.insert(tmpCnt, tmp)

		tmp = tmp + 1
	end

	tmpCnt = table.shuffle(tmpCnt)

	for i = 1, FS_SaveMaze.ElementType.Max do
		self.elementId[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementType[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementCnt[i] = tmpCnt[i]
		self.elementRnd1[i] = MathHelper.getRandom(0, 100, i)
		self.elementRnd2[i] = MathHelper.getRandom(0, 100, i * self.elementRnd1[i])
	end
end

function FS_SaveMaze:DebugJumpData(storyId, areaId, mazeId, floor, pattern, entranceId)
	self.storyId = storyId
	self.areaId = areaId
	self.mazeId = mazeId
	self.floor = floor
	self.pattern = pattern
	self.entranceId = entranceId
end

function FS_SaveMaze:EnterFinalBoss()
	if self:IsHaveMazeFinalFloor() == false then
		SystemHelper.LogError("=======EnterFinalBoss=====1111==")

		return
	end

	self.floor = MS_StoryMaze.GetMazeFloorMax(self.mazeId) + 1

	FS_UserData.story:ClearHeroCall()

	local mazeList = MS_StoryMaze.GetMazeList(self.mazeId, self.floor)
	local defaultId = 0

	if mazeList ~= nil then
		for i, mazeData in pairs(mazeList) do
			if defaultId <= 0 then
				defaultId = i

				break
			end
		end
	end

	if defaultId <= 0 then
		SystemHelper.LogError("=======EnterFinalBoss=====Select Enable Boss==self.mazeId=" .. self.mazeId .. "=self.floor=" .. self.floor)
	end

	self.storyId = mazeList[defaultId].StoryId
	self.areaId = mazeList[defaultId].Area
	self.pattern = 0
	self.entranceId = 1
	self.bossBar = 0
end

function FS_SaveMaze:EnterNext()
	if self:IsBossBarFull() == true then
		FS_UserData.story:ClearHeroCall()

		local mazeList = MS_StoryMaze.GetMazeList(self.mazeId, self.floor)
		local selectList = {}
		local defaultId = 0

		if mazeList ~= nil then
			if DebugMazeBossSelect == true and DebugMazeBossIndex > 0 and mazeList[DebugMazeBossIndex] ~= nil then
				defaultId = DebugMazeBossIndex

				table.insert(selectList, mazeList[DebugMazeBossIndex])

				self.bossList = {}

				SystemHelper.LogTest("=====Debug==EnterNext=====BossId====" .. mazeList[DebugMazeBossIndex].BossId)
			end

			if #selectList <= 0 then
				for i, mazeData in pairs(mazeList) do
					if defaultId <= 0 then
						defaultId = i
					end

					if self.bossList == nil or self.bossList[mazeData.BossId] == nil then
						SystemHelper.LogTest("=======EnterNext=====BossId====" .. mazeData.BossId)
						table.insert(selectList, mazeData)
					end
				end
			end
		end

		if #selectList > 0 then
			SystemHelper.LogTest("=======EnterNext=====Select Enable Boss===num=" .. #selectList)

			selectList = table.shuffle(selectList)
		else
			if mazeList ~= nil and mazeList[defaultId] ~= nil then
				table.insert(selectList, mazeList[defaultId])
			end

			SystemHelper.LogError("======EnterNext=====Cannot find out enable boss!! ====self.mazeId=" .. self.mazeId .. ",self.floor=" .. self.floor)
		end

		self.storyId = selectList[1].StoryId
		self.areaId = selectList[1].Area
		self.pattern = 0
		self.entranceId = 1
		self.bossBar = 0
	else
		local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

		if tmpHeroId <= 0 or tmpHeroType ~= ControllerStoryMode.CallHeroType.Friend then
			FS_UserData.story:ClearHeroCall()
		end

		rnd = MathHelper.getRandom(1, FS_SaveMaze.MazeMax, 1)

		if DebugMazeRandom == true then
			rnd = DebugMazeId
		end

		self.storyId = MS_StoryData.StoryIdForMaze + rnd
		self.areaId = 1
		self.pattern = MS_StoryMonster.GetStoryRandomPattern(self.storyId)

		if DebugMazeRandom == true then
			self.pattern = DebugMazePattern
		end

		self.entranceId = MathHelper.getRandom(1, FS_SaveMaze.MazeEntranceMax, 2)

		if DebugMazeRandom == true then
			self.entranceId = DebugMazeEntrance
		end
	end

	for i = 1, FS_SaveMaze.ElementType.Max do
		self.elementId[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementType[i] = FS_SaveMaze.MazeElementDefaultValue
		self.elementRnd1[i] = MathHelper.getRandom(0, 100, i)
		self.elementRnd2[i] = MathHelper.getRandom(0, 100, i * self.elementRnd1[i])
	end
end

function FS_SaveMaze:IsFloorMax()
	if self.floor >= MS_StoryMaze.GetMazeFloorMax(self.mazeId) then
		return true
	end

	return false
end

function FS_SaveMaze:IsHaveMazeFinalFloor()
	return MS_StoryMaze.IsHaveMazeFinalFloor(self.mazeId, self.floor)
end

function FS_SaveMaze:NextFloor()
	if self.floor < MS_StoryMaze.GetMazeFloorMax(self.mazeId) then
		self.floor = self.floor + 1

		SystemHelper.LogTest("=======NextFloor=====self.floor=" .. self.floor)
	end
end

function FS_SaveMaze:PrevFloor()
	if self.floor > 1 then
		self.floor = self.floor - 1

		SystemHelper.LogTest("=======PrevFloor=====self.floor=" .. self.floor)
	end
end

function FS_SaveMaze:GetStoryId()
	return self.storyId
end

function FS_SaveMaze:GetAreaId()
	return self.areaId
end

function FS_SaveMaze:GetPattern()
	return self.pattern
end

function FS_SaveMaze:GetEntranceId()
	return self.entranceId
end

function FS_SaveMaze:GetMazeId()
	return self.mazeId
end

function FS_SaveMaze:GetMazeFloor()
	return self.floor
end

function FS_SaveMaze:GetMazeLevel()
	local mazeList = MS_StoryMaze.GetMazeList(self.mazeId, self.floor)

	if mazeList ~= nil then
		local mazeData = mazeList[1]
		local retLevel = mazeData.Level + self.levelAdd

		return retLevel
	end

	return 1
end

function FS_SaveMaze:GetElementId(element_type, id, type)
	local retId = 0
	local retType = 0
	local rndMax = 0
	local rndMin = 0
	local retRnd1 = 0
	local retRnd2 = 0
	local prob = 0

	if element_type == FS_SaveMaze.ElementType.Statue then
		rndMax = FS_SaveMaze.MazeStatueRndMax
		rndMin = FS_SaveMaze.MazeStatueRndMin
		prob = FS_SaveMaze.MazeStatueProb
	elseif element_type == FS_SaveMaze.ElementType.Fountain then
		rndMax = FS_SaveMaze.MazeFountainRndMax
		rndMin = FS_SaveMaze.MazeFountainRndMin
		prob = FS_SaveMaze.MazeFountainProb
	elseif element_type == FS_SaveMaze.ElementType.Honeypot then
		rndMax = FS_SaveMaze.MazeHoneypotRndMax
		rndMin = FS_SaveMaze.MazeHoneypotRndMin
		prob = FS_SaveMaze.MazeHoneypotProb
	elseif element_type == FS_SaveMaze.ElementType.Crate then
		rndMax = FS_SaveMaze.MazeCrateRndMax
		rndMin = FS_SaveMaze.MazeCrateRndMin
		prob = FS_SaveMaze.MazeCrateProb
	else
		SystemHelper.LogError("======GetElementId=error===element_type=" .. element_type)

		return retId, retType, retRnd1, retRnd2
	end

	if self.elementId[element_type] < 0 or self.elementType[element_type] < 0 then
		if id > 0 and type > 0 then
			if rndMax <= Mathf.Abs(self.elementCnt[element_type]) then
				ret = true

				if DLC_Maze == true then
					FS_SaveMaze.DebugShowList[element_type][2] = FS_SaveMaze.DebugShowType.Gold
				end
			elseif self.elementCnt[element_type] >= 0 and rndMin > self.elementCnt[element_type] then
				ret = false
			else
				ret = MathHelper.getRandomResult(prob)

				if DLC_Maze == true and ret == true then
					FS_SaveMaze.DebugShowList[element_type][2] = FS_SaveMaze.DebugShowType.Silver
				end
			end

			if ret == true and element_type == FS_SaveMaze.ElementType.Honeypot then
				local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

				if tmpHeroId > 0 then
					ret = false
				end
			end

			if DLC_Maze == true and ret == false and (DebugMazeStatue == true and element_type == FS_SaveMaze.ElementType.Statue or DebugMazeFountain == true and element_type == FS_SaveMaze.ElementType.Fountain or DebugMazeHoneypot == true and element_type == FS_SaveMaze.ElementType.Honeypot or DebugMazeCrate == true and element_type == FS_SaveMaze.ElementType.Crate) then
				ret = true
				FS_SaveMaze.DebugShowList[element_type][2] = FS_SaveMaze.DebugShowType.Debug
			end

			if ret == true then
				self.elementCnt[element_type] = 0
				self.elementId[element_type] = id
				self.elementType[element_type] = type
			else
				if self.elementCnt[element_type] >= 0 then
					self.elementCnt[element_type] = self.elementCnt[element_type] + 1
				else
					self.elementCnt[element_type] = self.elementCnt[element_type] - 1
				end

				self.elementId[element_type] = 0
				self.elementType[element_type] = 0

				if DLC_Maze == true then
					FS_SaveMaze.DebugShowList[element_type][2] = FS_SaveMaze.DebugShowType.None
				end
			end
		else
			self.elementId[element_type] = 0
			self.elementType[element_type] = 0
		end
	elseif DLC_Maze == true then
		if self.elementId[element_type] > 0 and self.elementType[element_type] > 0 then
			FS_SaveMaze.DebugShowList[element_type][2] = FS_SaveMaze.DebugShowType.Save
		else
			FS_SaveMaze.DebugShowList[element_type][2] = FS_SaveMaze.DebugShowType.None
		end
	end

	retId = self.elementId[element_type]
	retType = self.elementType[element_type]
	retRnd1 = self.elementRnd1[element_type]
	retRnd2 = self.elementRnd2[element_type]

	return retId, retType, retRnd1, retRnd2
end

function FS_SaveMaze:DebugGetElementId(element_type)
	if self.elementId[element_type] ~= nil then
		return self.elementId[element_type]
	end

	return 0
end

function FS_SaveMaze:DebugSetElementId(element_type, id)
	if self.elementId[element_type] ~= nil and self.elementId[element_type] > 0 then
		self.elementId[element_type] = id
	end
end

function FS_SaveMaze:GetHeroCallData()
	local heroId = FS_SaveStory.DefaultHeroId
	local heroType = ControllerStoryMode.CallHeroType.Friend
	local heroIdList = FS_UserData.story:GetEnableHeroIdList()

	if #heroIdList > 0 then
		local tmpIndex = self.elementRnd1[FS_SaveMaze.ElementType.Honeypot] % #heroIdList + 1

		heroId = heroIdList[tmpIndex]
		heroType = self.elementRnd2[FS_SaveMaze.ElementType.Honeypot] % ControllerStoryMode.CallHeroTypeMax + 1

		if DebugMazeHoneypot == true and DebugMazeCallHeroIndex > 0 and DebugMazeCallHeroType > 0 and heroIdList[DebugMazeCallHeroIndex] ~= nil and DebugMazeCallHeroType <= ControllerStoryMode.CallHeroTypeMax then
			heroId = heroIdList[DebugMazeCallHeroIndex]
			heroType = DebugMazeCallHeroType
		end
	end

	return heroId, heroType
end

function FS_SaveMaze:IsBossBarFull()
	if self.bossBar >= FS_SaveMaze.BossBarMax then
		return true
	end

	return false
end

function FS_SaveMaze:AddBossBar(add)
	self.bossBar = self.bossBar + add
	self.bossBar = Mathf.Clamp(self.bossBar, 0, FS_SaveMaze.BossBarMax)

	local progress = Mathf.Clamp01(self.bossBar / FS_SaveMaze.BossBarMax)

	UIManager.SendMessage("Mainmenu", "SetMazeProgress", progress)

	return self:IsBossBarFull()
end

function FS_SaveMaze:KillBoss(id)
	self.bossList[id] = 1

	SystemHelper.LogTest("=======KillBoss=============id=" .. id)
end

function FS_SaveMaze:Encode()
	local ret = {}

	ret.s_id = self.storyId
	ret.a_id = self.areaId
	ret.pattern = self.pattern
	ret.e_id = self.entranceId
	ret.m_id = self.mazeId
	ret.floor = self.floor
	ret.lv_add = self.levelAdd
	ret.b_list = table.keys(self.bossList)
	ret.b_bar = self.bossBar

	for i = 1, FS_SaveMaze.ElementType.Max do
		ret["ele_id_" .. i] = self.elementId[i]
		ret["ele_type_" .. i] = self.elementType[i]
		ret["ele_cnt_" .. i] = self.elementCnt[i]
		ret["ele_rnd1_" .. i] = self.elementRnd1[i]
		ret["ele_rnd2_" .. i] = self.elementRnd2[i]
	end

	return ret
end

function FS_SaveMaze:Decode(mazeInfo)
	if mazeInfo ~= nil then
		self.storyId = mazeInfo.s_id
		self.areaId = mazeInfo.a_id
		self.pattern = mazeInfo.pattern
		self.entranceId = mazeInfo.e_id
		self.mazeId = mazeInfo.m_id
		self.floor = mazeInfo.floor
		self.levelAdd = mazeInfo.lv_add

		if mazeInfo.b_list ~= nil then
			for k, v in pairs(mazeInfo.b_list) do
				self.bossList[tonumber(v)] = 1
			end
		end

		self.bossBar = mazeInfo.b_bar

		for i = 1, FS_SaveMaze.ElementType.Max do
			if mazeInfo["ele_id_" .. i] ~= nil then
				self.elementId[i] = mazeInfo["ele_id_" .. i]
			else
				self.elementId[i] = FS_SaveMaze.MazeElementDefaultValue
			end

			if mazeInfo["ele_type_" .. i] ~= nil then
				self.elementType[i] = mazeInfo["ele_type_" .. i]
			else
				self.elementType[i] = FS_SaveMaze.MazeElementDefaultValue
			end

			if mazeInfo["ele_cnt_" .. i] ~= nil then
				self.elementCnt[i] = mazeInfo["ele_cnt_" .. i]
			else
				self.elementCnt[i] = FS_SaveMaze.MazeElementDefaultValue
			end

			if mazeInfo["ele_rnd1_" .. i] ~= nil then
				self.elementRnd1[i] = mazeInfo["ele_rnd1_" .. i]
			else
				self.elementRnd1[i] = 0
			end

			if mazeInfo["ele_rnd2_" .. i] ~= nil then
				self.elementRnd2[i] = mazeInfo["ele_rnd2_" .. i]
			else
				self.elementRnd2[i] = 0
			end
		end
	end
end

function FS_SaveMaze:Restart()
	return
end

return FS_SaveMaze
