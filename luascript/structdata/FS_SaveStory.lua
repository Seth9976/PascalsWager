-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_SaveStory.lua

require("LuaScript/StructData/FS_SaveStoryData")
require("LuaScript/StructData/FS_SaveMaze")
require("LuaScript/StructData/MS_SiteInfo")

FS_SaveStory = class("FS_SaveStory")
FS_SaveStory.static.StoryMode = {
	BossChallenge = 2,
	Maze = 5,
	BossTimeChallenge = 6,
	Arcade = 7,
	JumpGame = 3,
	Travel = 4,
	Normal = 1
}
FS_SaveStory.static.ArcadeMode = {
	StageSelect = 2,
	Normal = 1
}
FS_SaveStory.static.HeroSelectType = {
	IsOpen = 2,
	HeroId = 1
}
FS_SaveStory.static.ArcadeRankValueType = {
	Yellow = 1,
	White = 0.8,
	Red = 1.2
}
FS_SaveStory.static.DefaultHeroId = 10001
FS_SaveStory.static.ArcadeDefaultHeroId = 10007
FS_SaveStory.static.ArcadeStoryIdMax = 1008

function FS_SaveStory:initialize()
	self:SetLoop(1)

	self.storyId = 0
	self.areaId = 0
	self.pattern = 0
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.entranceOld = 0
	self.storyIdSave = 0
	self.areaIdSave = 0
	self.patternSave = 0
	self.firstLoad = false
	self.difficulty = BattleData.GlobalDifficultyLevel.Normal
	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.stageMap = {}
	self.questCompleteList = {}
	self.questCompleteListExit = {}
	self.historyQuestCompleteList = {}
	self.monsterDeadList = {}
	self.monsterCallList = {}
	self.heroEnableList = {}
	self.heroEnableIdList = {}
	self.heroSelectList = {}
	self.heroSelectMazeList = {}
	self.heroSelectSkinList = {}
	self.heroSelectIndex = 1
	self.heroSelectMazeIndex = 1
	self.heroProperty = {}
	self.heroShareStatus = {}
	self.heroCallId = 0
	self.heroCallType = 0
	self.heroCallProperty = {}
	self.bornPosition = Vector3.zero
	self.bornLook = Vector3.forward
	self.bornPositionLocal = Vector3.zero
	self.bornLookLocal = Vector3.forward
	self.rebornAreaId = 0
	self.rebornHeroId = 0
	self.rebornPosition = Vector3.zero
	self.rebornLook = Vector3.forward
	self.rebornAreaIdLocal = 0
	self.rebornPositionLocal = Vector3.zero
	self.rebornLookLocal = Vector3.forward
	self.storyMode = FS_SaveStory.StoryMode.Normal
	self.arcadeMode = FS_SaveStory.ArcadeMode.Normal
	self.inArcadeRelaxTime = 0
	self.inArcadeMovieTime = 0
	self.monsterMeet = {}
	self.monsterKillCnt = {}
	self.sanMonsterIndex = 0
	self.challengeLevel = 1
	self.challengeMonsterId = 0
	self.killBossNotInSan = 0
	self.hadNoobItem = 0
	self.randomSeed = MathHelper.getRandom(10000, 99999)
	self.randomTimes = 0
	self.patchId = 0
	self.storyDropItemList = {}
	self.doorList = {}
	self.stairList = {}
	self.coverList = {}
	self.elevatorList = {}
	self.cageList = {}
	self.crateList = {}
	self.gateList = {}
	self.bridgeList = {}
	self.altarList = {}
	self.statueList = {}
	self.fountainList = {}
	self.honeypotList = {}
	self.frogFinishList = {}
	self.transactionNumList = {}
	self.formulaKnownList = {}
	self.blessTimesList = {}
	self.documentKnownList = {}
	self.documentOrderList = {}
	self.timeRecorder = {}
	self.scoreRecorder = {}
	self.durationList = {}
	self.lastRecordTime = 0
	self.playerBehaviorRecordOff = 0
	self.achievementList = {}
	self.achievementFinishList = {}
	self.achievementStatisticsList = {}
	self.maze = FS_SaveMaze:new()
end

function FS_SaveStory:Clear()
	self.stageMap = nil
	self.questCompleteList = nil
	self.questCompleteListExit = nil
	self.historyQuestCompleteList = nil
	self.monsterDeadList = nil
	self.monsterCallList = nil
	self.heroEnableList = nil
	self.heroSelectList = nil
	self.heroSelectMazeList = nil
	self.heroSelectSkinList = nil
	self.heroProperty = nil
	self.heroShareStatus = nil
	self.heroCallProperty = nil
	self.bornPosition = nil
	self.bornPositionLocal = nil
	self.bornLook = nil
	self.bornLookLocal = nil
	self.rebornPosition = nil
	self.rebornPositionLocal = nil
	self.rebornLook = nil
	self.rebornLookLocal = nil
	self.monsterMeet = nil

	self:ClearDropItemAll(false)

	self.storyDropItemList = nil
	self.doorList = nil
	self.crateList = nil
	self.stairList = nil
	self.coverList = nil
	self.elevatorList = nil
	self.cageList = nil
	self.gateList = nil
	self.bridgeList = nil
	self.altarList = nil
	self.statueList = nil
	self.fountainList = nil
	self.honeypotList = nil
	self.frogFinishList = nil
	self.transactionNumList = nil
	self.formulaKnownList = nil
	self.blessTimesList = nil
	self.documentKnownList = nil
	self.documentOrderList = nil
	self.timeRecorder = nil
	self.scoreRecorder = nil
	self.durationList = nil
	self.lastRecordTime = 0
	self.playerBehaviorRecordOff = 0
	self.achievementList = nil
	self.achievementFinishList = nil
	self.achievementStatisticsList = nil

	if self.maze ~= nil then
		self.maze:Clear()

		self.maze = nil
	end
end

function FS_SaveStory:Reset()
	self:Clear()
	self:initialize()
end

function FS_SaveStory:Encode(isExit)
	local ret = {}

	ret.loop = self.loop
	ret.s_id = self.storyIdSave
	ret.a_id = self.areaIdSave
	ret.pattern = self.patternSave
	ret.s_id_o = self.storyIdOld
	ret.a_id_o = self.areaIdOld
	ret.pattern_o = self.patternOld
	ret.entrance_o = self.entranceOld
	ret.diff = self.difficulty
	ret.call_sid = self.carriageCallStoryId
	ret.call_id = self.carriageCallId
	ret.arr_sid = self.carriageArriveStoryId
	ret.arr_id = self.carriageArriveId
	ret.map = self.stageMap

	if isExit == true then
		ret.q_list = table.keys(self.questCompleteListExit)
	else
		ret.q_list = table.keys(self.questCompleteList)
	end

	ret.q_list_history = table.keys(self.historyQuestCompleteList)
	ret.m_dead_list = table.keys(self.monsterDeadList)
	ret.m_call_list = table.keys(self.monsterCallList)
	ret.h_enable_list = table.keys(self.heroEnableList)
	ret.h_select_list = self.heroSelectList
	ret.h_select_maze_list = self.heroSelectMazeList
	ret.h_select_idx = self.heroSelectIndex
	ret.h_select_maze_idx = self.heroSelectMazeIndex
	ret.h_select_skin_list = {}

	for k, v in pairs(self.heroSelectSkinList) do
		ret.h_select_skin_list[k] = v
	end

	ret.h_property = self.heroProperty
	ret.h_share_status = self.heroShareStatus
	ret.hc_id = self.heroCallId
	ret.hc_type = self.heroCallType
	ret.hc_property = self.heroCallProperty
	ret.b_pos = {
		self.bornPosition.x,
		self.bornPosition.y,
		self.bornPosition.z
	}
	ret.b_look = {
		self.bornLook.x,
		self.bornLook.y,
		self.bornLook.z
	}
	ret.r_id = self.rebornHeroId
	ret.r_a_id = self.rebornAreaId
	ret.r_pos = {
		self.rebornPosition.x,
		self.rebornPosition.y,
		self.rebornPosition.z
	}
	ret.r_look = {
		self.rebornLook.x,
		self.rebornLook.y,
		self.rebornLook.z
	}
	ret.s_mode = self.storyMode
	ret.a_mode = self.arcadeMode
	ret.in_arcade_relax_time = self.inArcadeRelaxTime
	ret.m_meet = table.keys(self.monsterMeet)
	ret.m_kill_cnt = self.monsterKillCnt
	ret.san_idx = self.sanMonsterIndex
	ret.had_noob_item = self.hadNoobItem
	ret.random_seed = self.randomSeed
	ret.random_times = self.randomTimes
	ret.patch_id = self.patchId
	ret.kill_boss_not_in_san = self.killBossNotInSan
	ret.player_behavior_record_off = self.playerBehaviorRecordOff
	ret.item_drop = {}

	for k, v in pairs(self.storyDropItemList) do
		local itemId = v:GetItemId()

		if itemId ~= MS_ItemData.SceneMarkItem and itemId ~= MS_ItemData.FrogItemId then
			local item = {}

			item.id = v:GetItemId()
			item.num = v:GetItemNum()
			item.pos_x = v:GetPosition().x
			item.pos_y = v:GetPosition().y
			item.pos_z = v:GetPosition().z

			table.insert(ret.item_drop, item)
		end
	end

	ret.door = {}

	for k, v in pairs(self.doorList) do
		for _k, _v in pairs(v) do
			if ret.door[k] == nil then
				ret.door[k] = {}
			end

			ret.door[k][_k] = _v
		end
	end

	ret.crate = {}

	for k, v in pairs(self.crateList) do
		for _k, _v in pairs(v) do
			if ret.crate[k] == nil then
				ret.crate[k] = {}
			end

			ret.crate[k][_k] = _v
		end
	end

	ret.statue = {}

	for k, v in pairs(self.statueList) do
		for _k, _v in pairs(v) do
			if ret.statue[k] == nil then
				ret.statue[k] = {}
			end

			ret.statue[k][_k] = _v
		end
	end

	ret.fountain = {}

	for k, v in pairs(self.fountainList) do
		for _k, _v in pairs(v) do
			if ret.fountain[k] == nil then
				ret.fountain[k] = {}
			end

			ret.fountain[k][_k] = _v
		end
	end

	ret.honeypot = {}

	for k, v in pairs(self.honeypotList) do
		for _k, _v in pairs(v) do
			if ret.honeypot[k] == nil then
				ret.honeypot[k] = {}
			end

			ret.honeypot[k][_k] = _v
		end
	end

	ret.stair = {}

	for k, v in pairs(self.stairList) do
		for _k, _v in pairs(v) do
			if ret.stair[k] == nil then
				ret.stair[k] = {}
			end

			ret.stair[k][_k] = _v
		end
	end

	ret.cover = {}

	for k, v in pairs(self.coverList) do
		for _k, _v in pairs(v) do
			if ret.cover[k] == nil then
				ret.cover[k] = {}
			end

			ret.cover[k][_k] = _v
		end
	end

	ret.elevator = {}

	for k, v in pairs(self.elevatorList) do
		for _k, _v in pairs(v) do
			if ret.elevator[k] == nil then
				ret.elevator[k] = {}
			end

			ret.elevator[k][_k] = _v
		end
	end

	ret.cage = {}

	for k, v in pairs(self.cageList) do
		for _k, _v in pairs(v) do
			if ret.cage[k] == nil then
				ret.cage[k] = {}
			end

			ret.cage[k][_k] = _v
		end
	end

	ret.gate = {}

	for k, v in pairs(self.gateList) do
		for _k, _v in pairs(v) do
			if ret.gate[k] == nil then
				ret.gate[k] = {}
			end

			ret.gate[k][_k] = _v
		end
	end

	ret.bridge = {}

	for k, v in pairs(self.bridgeList) do
		for _k, _v in pairs(v) do
			if ret.bridge[k] == nil then
				ret.bridge[k] = {}
			end

			ret.bridge[k][_k] = _v
		end
	end

	ret.altar = {}

	for k, v in pairs(self.altarList) do
		for _k, _v in pairs(v) do
			if ret.altar[k] == nil then
				ret.altar[k] = {}
			end

			ret.altar[k][_k] = _v
		end
	end

	ret.transaction_num = {}

	for k, v in pairs(self.transactionNumList) do
		ret.transaction_num[k] = v
	end

	ret.formula_known = {}

	for k, v in pairs(self.formulaKnownList) do
		ret.formula_known[k] = v
	end

	ret.document_known = {}

	for k, v in pairs(self.documentKnownList) do
		ret.document_known[k] = v
	end

	ret.document_order = self.documentOrderList
	ret.bless_times = {}

	for k, v in pairs(self.blessTimesList) do
		ret.bless_times[k] = v
	end

	ret.frog_finish = {}

	for k, v in pairs(self.frogFinishList) do
		ret.frog_finish[k] = v
	end

	ret.achievement = {}

	for k, v in pairs(self.achievementList) do
		ret.achievement[tostring(k)] = tonumber(v)
	end

	ret.achievement_statistics = {}

	for k, v in pairs(self.achievementStatisticsList) do
		ret.achievement_statistics[tostring(k)] = v
	end

	ret.achievement_finish = self.achievementFinishList

	if self.maze ~= nil then
		ret.maze = self.maze:Encode()
	end

	ret.score_record = {}

	for k, v in pairs(self.scoreRecorder) do
		ret.score_record[tostring(k)] = v
	end

	ret.time_record = {}

	for k, v in pairs(self.timeRecorder) do
		if ret.time_record[tostring(k)] == nil then
			ret.time_record[tostring(k)] = {}
		end

		if ret.time_record[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] == nil then
			ret.time_record[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] = {}
		end

		local _temp = ret.time_record[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)]

		for _k, _v in pairs(v) do
			_temp[tostring(_k)] = _v.duration
		end
	end

	for k, v in pairs(self.durationList) do
		if ret.time_record[tostring(k)] == nil then
			ret.time_record[tostring(k)] = {}
		end

		for _k, _v in pairs(v) do
			if ret.time_record[tostring(k)][tostring(_k)] == nil then
				ret.time_record[tostring(k)][tostring(_k)] = {}
			end

			local _temp1 = ret.time_record[tostring(k)][tostring(_k)]

			if _k == FS_PlayerBehavior.RecordType.InSanDuration then
				for __k, __v in pairs(_v) do
					if __v.start_time ~= nil then
						if __v.duration == nil then
							__v.duration = self:GetGameTime() - __v.start_time
						else
							__v.duration = self:GetGameTime() - __v.start_time + __v.duration
						end

						__v.start_time = self:GetGameTime()
					end

					if _temp1[tostring(__k)] == nil then
						_temp1[tostring(__k)] = {}
					end

					if __v.start_time ~= nil then
						_temp1[tostring(__k)].start_time = __v.start_time
					else
						_temp1[tostring(__k)].start_time = nil
					end

					_temp1[tostring(__k)].duration = __v.duration
				end

				if table.nums(_temp1) == 0 then
					ret.time_record[tostring(k)][tostring(_k)] = nil
				end
			end
		end
	end

	return ret
end

function FS_SaveStory:CopyQuestCompleteList()
	self.questCompleteListExit = {}

	if self.questCompleteList ~= nil then
		for k, v in pairs(self.questCompleteList) do
			self.questCompleteListExit[k] = v
		end
	end
end

function FS_SaveStory:Decode(data)
	if data.loop == nil then
		self:SetLoop(1)
	else
		self:SetLoop(data.loop)
	end

	self.storyId = data.s_id
	self.storyIdSave = self.storyId
	self.areaId = data.a_id
	self.areaIdSave = self.areaId
	self.pattern = data.pattern
	self.patternSave = self.pattern

	if data.s_id_o ~= nil then
		self.storyIdOld = data.s_id_o
	end

	if data.a_id_o ~= nil then
		self.areaIdOld = data.a_id_o
	end

	if data.pattern_o ~= nil then
		self.patternOld = data.pattern_o
	end

	if data.entrance_o ~= nil then
		self.entranceOld = data.entrance_o
	end

	self.difficulty = data.diff
	self.carriageCallStoryId = data.call_sid
	self.carriageCallId = data.call_id
	self.carriageArriveStoryId = data.arr_sid
	self.carriageArriveId = data.arr_id
	self.stageMap = data.map
	self.questCompleteList = {}

	if data.q_list ~= nil then
		for k, v in pairs(data.q_list) do
			self.questCompleteList[tonumber(v)] = 1
		end
	end

	self:CopyQuestCompleteList()

	self.historyQuestCompleteList = {}

	if data.q_list_history ~= nil then
		for k, v in pairs(data.q_list_history) do
			self.historyQuestCompleteList[tonumber(v)] = 1
		end
	end

	self.monsterDeadList = {}

	if data.m_dead_list ~= nil then
		for k, v in pairs(data.m_dead_list) do
			self.monsterDeadList[tonumber(v)] = 1
		end
	end

	self.monsterCallList = {}

	if data.m_call_list ~= nil then
		for k, v in pairs(data.m_call_list) do
			self.monsterCallList[tonumber(v)] = 1
		end
	end

	self.heroEnableList = {}

	local heroIdList = MS_HeroData.GetEnableHeroIdList()

	if data.h_enable_list ~= nil then
		for k, v in pairs(data.h_enable_list) do
			local heroId = tonumber(v)
			local find = false

			for i = 1, #heroIdList do
				if heroIdList[i] == heroId then
					find = true

					break
				end
			end

			if find == true then
				self.heroEnableList[heroId] = 1
			end
		end
	end

	self:RefreshHeroEnableIdList()

	if data.h_select_list ~= nil then
		self.heroSelectList = data.h_select_list
	end

	if data.h_select_maze_list ~= nil then
		self.heroSelectMazeList = data.h_select_maze_list
	end

	if data.h_select_idx ~= nil then
		self.heroSelectIndex = data.h_select_idx
	end

	if data.h_select_maze_idx ~= nil then
		self.heroSelectMazeIndex = data.h_select_maze_idx
	end

	self.heroSelectSkinList = {}

	if data.h_select_skin_list ~= nil then
		for k, v in pairs(data.h_select_skin_list) do
			self.heroSelectSkinList[tonumber(k)] = v
		end
	end

	if data.h_property ~= nil then
		self.heroProperty = data.h_property
	end

	if data.h_share_status ~= nil then
		self.heroShareStatus = data.h_share_status
	end

	if data.hc_id ~= nil then
		self.heroCallId = data.hc_id
	end

	if data.hc_type ~= nil then
		self.heroCallType = data.hc_type
	end

	if data.hc_property ~= nil then
		self.heroCallProperty = data.hc_property
	end

	if data.b_pos ~= nil then
		self.bornPosition:Set(data.b_pos[1], data.b_pos[2], data.b_pos[3])
		self.bornPositionLocal:SetVector3(self.bornPosition)
	end

	if data.b_look ~= nil then
		self.bornLook:Set(data.b_look[1], data.b_look[2], data.b_look[3])
		self.bornLookLocal:SetVector3(self.bornLook)
	end

	if data.r_id ~= nil then
		self.rebornHeroId = data.r_id
	end

	if data.r_a_id ~= nil then
		self.rebornAreaId = data.r_a_id
	else
		self.rebornAreaId = self.areaIdSave
	end

	self.rebornAreaIdLocal = self.rebornAreaId

	if data.r_pos ~= nil then
		self.rebornPosition:Set(data.r_pos[1], data.r_pos[2], data.r_pos[3])
		self.rebornPositionLocal:SetVector3(self.rebornPosition)
	end

	if data.r_look ~= nil then
		self.rebornLook:Set(data.r_look[1], data.r_look[2], data.r_look[3])
		self.rebornLookLocal:SetVector3(self.rebornLook)
	end

	if data.had_noob_item == nil then
		self.hadNoobItem = 0
	else
		self.hadNoobItem = data.had_noob_item
	end

	if data.random_seed == nil then
		self.randomSeed = MathHelper.getRandom(10000, 99999)
	else
		self.randomSeed = data.random_seed
	end

	if data.random_times == nil then
		self.randomTimes = 0
	else
		self.randomTimes = data.random_times
	end

	if data.patch_id == nil then
		self.patchId = 0
	else
		self.patchId = data.patch_id
	end

	if data.kill_boss_not_in_san ~= nil then
		self.killBossNotInSan = data.kill_boss_not_in_san
	end

	if data.player_behavior_record_off ~= nil then
		self.playerBehaviorRecordOff = data.player_behavior_record_off
	end

	self.storyMode = data.s_mode

	if data.a_mode == nil then
		self.arcadeMode = 1
	else
		self.arcadeMode = data.a_mode
	end

	if data.in_arcade_relax_time == nil then
		self.inArcadeRelaxTime = 0
	else
		self.inArcadeRelaxTime = data.in_arcade_relax_time
	end

	self.monsterMeet = {}

	if data.m_meet ~= nil then
		for k, v in pairs(data.m_meet) do
			self.monsterMeet[tonumber(v)] = 1
		end
	end

	self.monsterKillCnt = {}

	if data.m_kill_cnt ~= nil then
		self.monsterKillCnt = data.m_kill_cnt
	end

	self.sanMonsterIndex = data.san_idx

	local ItemTemplate = require("LuaScript/Logic/Item/ItemScene")

	if data.item_drop ~= nil then
		for k, v in pairs(data.item_drop) do
			local tmpPos = Vector3.New(v.pos_x, v.pos_y, v.pos_z)
			local tmpItem = ItemTemplate:new(ItemScene.Type.Drop, v.id, v.num, tmpPos, false)

			tmpPos = nil

			table.insert(self.storyDropItemList, tmpItem)
		end
	end

	if data.door ~= nil then
		for k, v in pairs(data.door) do
			for _k, _v in pairs(v) do
				if self.doorList[tonumber(k)] == nil then
					self.doorList[tonumber(k)] = {}
				end

				self.doorList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.crate ~= nil then
		for k, v in pairs(data.crate) do
			for _k, _v in pairs(v) do
				if self.crateList[tonumber(k)] == nil then
					self.crateList[tonumber(k)] = {}
				end

				self.crateList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.statue ~= nil then
		for k, v in pairs(data.statue) do
			for _k, _v in pairs(v) do
				if self.statueList[tonumber(k)] == nil then
					self.statueList[tonumber(k)] = {}
				end

				self.statueList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.fountain ~= nil then
		for k, v in pairs(data.fountain) do
			for _k, _v in pairs(v) do
				if self.fountainList[tonumber(k)] == nil then
					self.fountainList[tonumber(k)] = {}
				end

				self.fountainList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.honeypot ~= nil then
		for k, v in pairs(data.honeypot) do
			for _k, _v in pairs(v) do
				if self.honeypotList[tonumber(k)] == nil then
					self.honeypotList[tonumber(k)] = {}
				end

				self.honeypotList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.stair ~= nil then
		for k, v in pairs(data.stair) do
			for _k, _v in pairs(v) do
				if self.stairList[tonumber(k)] == nil then
					self.stairList[tonumber(k)] = {}
				end

				self.stairList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.cover ~= nil then
		for k, v in pairs(data.cover) do
			for _k, _v in pairs(v) do
				if self.coverList[tonumber(k)] == nil then
					self.coverList[tonumber(k)] = {}
				end

				self.coverList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.elevator ~= nil then
		for k, v in pairs(data.elevator) do
			for _k, _v in pairs(v) do
				if self.elevatorList[tonumber(k)] == nil then
					self.elevatorList[tonumber(k)] = {}
				end

				self.elevatorList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.cage ~= nil then
		for k, v in pairs(data.cage) do
			for _k, _v in pairs(v) do
				if self.cageList[tonumber(k)] == nil then
					self.cageList[tonumber(k)] = {}
				end

				self.cageList[tonumber(k)][tonumber(_k)] = _v
			end
		end
	end

	if data.gate ~= nil then
		for k, v in pairs(data.gate) do
			for _k, _v in pairs(v) do
				if self.gateList[tonumber(k)] == nil then
					self.gateList[tonumber(k)] = {}
				end

				self.gateList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.bridge ~= nil then
		for k, v in pairs(data.bridge) do
			for _k, _v in pairs(v) do
				if self.bridgeList[tonumber(k)] == nil then
					self.bridgeList[tonumber(k)] = {}
				end

				self.bridgeList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.altar ~= nil then
		for k, v in pairs(data.altar) do
			for _k, _v in pairs(v) do
				if self.altarList[tonumber(k)] == nil then
					self.altarList[tonumber(k)] = {}
				end

				self.altarList[tonumber(k)][tonumber(_k)] = tonumber(_v)
			end
		end
	end

	if data.transaction_num ~= nil then
		for k, v in pairs(data.transaction_num) do
			self.transactionNumList[tonumber(k)] = tonumber(v)
		end
	end

	if data.formula_known ~= nil then
		for k, v in pairs(data.formula_known) do
			self.formulaKnownList[tonumber(k)] = tonumber(v)
		end
	end

	if data.document_known ~= nil then
		for k, v in pairs(data.document_known) do
			self.documentKnownList[tonumber(k)] = tonumber(v)
		end
	end

	if data.document_order ~= nil then
		self.documentOrderList = data.document_order
	end

	if data.bless_times ~= nil then
		for k, v in pairs(data.bless_times) do
			self.blessTimesList[tonumber(k)] = tonumber(v)
		end
	end

	if data.frog_finish ~= nil then
		for k, v in pairs(data.frog_finish) do
			self.frogFinishList[tonumber(k)] = tonumber(v)
		end
	end

	self.achievementList = {}

	if data.achievement ~= nil then
		for k, v in pairs(data.achievement) do
			self.achievementList[tonumber(k)] = v
		end
	end

	self.achievementStatisticsList = {}

	if data.achievement_statistics ~= nil then
		for k, v in pairs(data.achievement_statistics) do
			self.achievementStatisticsList[tonumber(k)] = v
		end
	end

	self.achievementFinishList = {}

	if data.achievement_finish ~= nil then
		for k, v in pairs(data.achievement_finish) do
			table.insert(self.achievementFinishList, tonumber(v))
		end
	end

	if self.maze ~= nil then
		self.maze:Decode(data.maze)
	end

	self.scoreRecorder = {}

	if data.score_record ~= nil then
		for k, v in pairs(data.score_record) do
			self.scoreRecorder[tonumber(k)] = v
		end
	end

	if data.time_record ~= nil then
		self.timeRecorder = {}
		self.durationList = {}

		local timeData = data.time_record

		for k, v in pairs(timeData) do
			if self.timeRecorder[tonumber(k)] == nil then
				self.timeRecorder[tonumber(k)] = {}
			end

			if self.durationList[tonumber(k)] == nil then
				self.durationList[tonumber(k)] = {}
			end

			for _k, _v in pairs(v) do
				if tonumber(_k) == FS_PlayerBehavior.RecordType.PlayDuration then
					for __k, __v in pairs(_v) do
						if self.timeRecorder[tonumber(k)][tonumber(__k)] == nil then
							self.timeRecorder[tonumber(k)][tonumber(__k)] = {}
						end

						self.timeRecorder[tonumber(k)][tonumber(__k)].duration = __v
					end
				elseif tonumber(_k) == FS_PlayerBehavior.RecordType.InSanDuration then
					if self.durationList[tonumber(k)][tonumber(_k)] == nil then
						self.durationList[tonumber(k)][tonumber(_k)] = {}
					end

					for __k, __v in pairs(_v) do
						if self.durationList[tonumber(k)][tonumber(_k)][tostring(__k)] == nil then
							self.durationList[tonumber(k)][tonumber(_k)][tostring(__k)] = {}
						end

						if __v.start_time ~= nil then
							self.durationList[tonumber(k)][tonumber(_k)][tostring(__k)].start_time = __v.start_time
						end

						self.durationList[tonumber(k)][tonumber(_k)][tostring(__k)].duration = __v.duration
					end
				end
			end
		end
	end
end

function FS_SaveStory:SetArea(areaId)
	self.areaId = areaId
	self.areaIdSave = self.areaId
end

function FS_SaveStory:SetSaveStoryData(storyId, areaId, pattern)
	self.storyIdSave = storyId
	self.areaIdSave = areaId
	self.patternSave = pattern
end

function FS_SaveStory:SetReturnEntrance(entranceId)
	self.storyIdOld = self.storyId
	self.areaIdOld = self.areaId
	self.patternOld = self.pattern
	self.entranceOld = entranceId
end

function FS_SaveStory:NewGame(difficulty)
	self.storyId = 1

	self:SetLoop(1)

	self.storyIdSave = self.storyId
	self.areaId = 1
	self.areaIdSave = self.areaId
	self.pattern = 0
	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.storyMode = FS_SaveStory.StoryMode.Normal

	BattleData.SetBattleType(BattleData.Type.PVE_Story)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 1
	self.carriageCallId = 1
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + 1)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitHero()
	self:InitMapData()
	self:InitItem()
	FS_UserData.playerBehavior:Reset(true)
end

function FS_SaveStory:ArcadeNewGame(difficulty, heroId)
	self.storyId = 1001
	self.storyId = 1301

	self:SetLoop(1)

	self.storyIdSave = self.storyId
	self.areaId = 1
	self.areaIdSave = self.areaId
	self.pattern = 0
	self.pattern = difficulty

	if difficulty == BattleData.GlobalDifficultyLevel.Casual then
		self.pattern = BattleData.GlobalDifficultyLevel.Normal
	end

	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.storyMode = FS_SaveStory.StoryMode.Arcade
	self.arcadeMode = FS_SaveStory.ArcadeMode.Normal
	self.inArcadeRelaxTime = 0
	self.inArcadeMovieTime = 0

	FS_UserData.story:SetIsInRelaxTime(true)
	BattleData.SetBattleType(BattleData.Type.PVE_Story)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 1
	self.carriageCallId = 1
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + 1)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ArcadeInitHero(heroId)
	self:InitMapData()
	self:InitItem()

	if heroId ~= FS_SaveStory.ArcadeDefaultHeroId then
		FS_UserData.InitArcadeHero(heroId)
	else
		FS_UserData.InitArcadeHero(heroId, true)
	end

	FS_UserData.playerBehavior:Reset(true)
end

function FS_SaveStory:ArcadeStageSelect(difficulty, heroId, storyId)
	self.storyId = storyId

	if storyId == FS_SaveStory.ArcadeStoryIdMax then
		self.storyId = FS_SaveStory.ArcadeStoryIdMax - 1000
	end

	self:SetLoop(1)

	self.storyIdSave = self.storyId

	local storyData = MS_StoryList.GetStoryData(self.storyId)

	self.areaId = storyData:GetAreaId()
	self.areaIdSave = self.areaId
	self.pattern = 0
	self.pattern = difficulty

	if difficulty == BattleData.GlobalDifficultyLevel.Casual then
		self.pattern = BattleData.GlobalDifficultyLevel.Normal
	end

	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.storyMode = FS_SaveStory.StoryMode.Arcade
	self.arcadeMode = FS_SaveStory.ArcadeMode.StageSelect
	self.inArcadeRelaxTime = 0
	self.inArcadeMovieTime = 0

	BattleData.SetBattleType(BattleData.Type.PVE_Story)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 1
	self.carriageCallId = 1
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + 1)

	if self.storyId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornSave + 1)
	elseif self.storyId == 2002 then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + 2)
	elseif self.storyId == 2003 then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + 3)
	elseif self.storyId == 2004 then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + 4)
	end

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ArcadeInitHero(heroId)
	self:InitMapData()
	self:InitItem()

	if heroId ~= FS_SaveStory.ArcadeDefaultHeroId then
		FS_UserData.InitArcadeHero(heroId)
	else
		FS_UserData.InitArcadeHero(heroId, true)
		FS_UserData.heroList:GetHero(heroId):AddTalentToMaxWithOutSan()
	end

	FS_UserData.playerBehavior:Reset(true)
end

function FS_SaveStory:IsArcadeOver()
	return self.storyId == FS_SaveStory.ArcadeStoryIdMax - 1000 and self.inArcadeRelaxTime == 1
end

function FS_SaveStory:Restart()
	self:SetLoop(self.loop + 1)

	self.hadNoobItem = 0
	self.storyId = 1
	self.storyIdSave = self.storyId
	self.areaId = 1
	self.areaIdSave = self.areaId
	self.pattern = 0
	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.firstLoad = false
	self.carriageCallStoryId = 1
	self.carriageCallId = 1
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.stageMap = {}
	self.heroSelectIndex = 1
	self.heroSelectMazeIndex = 1
	self.bornPosition = Vector3.zero
	self.bornLook = Vector3.forward
	self.bornPositionLocal = Vector3.zero
	self.bornLookLocal = Vector3.forward
	self.rebornHeroId = 0
	self.rebornAreaId = 0
	self.rebornAreaIdLocal = 0
	self.rebornPosition = Vector3.zero
	self.rebornLook = Vector3.forward
	self.rebornPositionLocal = Vector3.zero
	self.rebornLookLocal = Vector3.forward
	self.sanMonsterIndex = 0
	self.killBossNotInSan = 0
	self.storyDropItemList = {}
	self.doorList = {}
	self.stairList = {}
	self.coverList = {}
	self.elevatorList = {}
	self.cageList = {}
	self.crateList = {}
	self.statueList = {}
	self.fountainList = {}
	self.honeypotList = {}
	self.gateList = {}
	self.bridgeList = {}
	self.altarList = {}
	self.frogFinishList = {}

	self:RestartTransaction()

	if self.maze ~= nil then
		self.maze:Restart()
	end

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + 1)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ResetAllQuest()
	self:InitMapData()
	self:SetHeroEnable(10002, true)
	self:SetHeroEnable(10003, true)
	self:SetHeroEnable(10004, true)

	if self:IsQuestComplete(MS_StoryQuest.DLCHeroJoinQuest) then
		self:SetHeroEnable(10005, true)
	end
end

function FS_SaveStory:ArcadeRestart(difficulty)
	self:SetLoop(self.loop + 1)

	self.hadNoobItem = 0
	self.storyId = 1001
	self.storyId = 1301
	self.storyIdSave = self.storyId
	self.areaId = 1
	self.areaIdSave = self.areaId
	self.pattern = 0
	self.pattern = difficulty
	self.inArcadeRelaxTime = 0

	FS_UserData.story:SetIsInRelaxTime(true)

	if difficulty == BattleData.GlobalDifficultyLevel.Casual then
		self.pattern = BattleData.GlobalDifficultyLevel.Normal
	end

	self:SetDifficulty(difficulty)

	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.firstLoad = false
	self.carriageCallStoryId = 1
	self.carriageCallId = 1
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.stageMap = {}
	self.bornPosition = Vector3.zero
	self.bornLook = Vector3.forward
	self.bornPositionLocal = Vector3.zero
	self.bornLookLocal = Vector3.forward
	self.rebornHeroId = 0
	self.rebornAreaId = 0
	self.rebornAreaIdLocal = 0
	self.rebornPosition = Vector3.zero
	self.rebornLook = Vector3.forward
	self.rebornPositionLocal = Vector3.zero
	self.rebornLookLocal = Vector3.forward
	self.sanMonsterIndex = 0
	self.storyDropItemList = {}
	self.doorList = {}
	self.stairList = {}
	self.coverList = {}
	self.elevatorList = {}
	self.cageList = {}
	self.crateList = {}
	self.statueList = {}
	self.fountainList = {}
	self.honeypotList = {}
	self.gateList = {}
	self.bridgeList = {}
	self.altarList = {}
	self.frogFinishList = {}

	self:RestartTransaction()

	if self.maze ~= nil then
		self.maze:Restart()
	end

	self.timeRecorder = {}
	self.scoreRecorder = {}
	self.durationList = {}
	self.lastRecordTime = 0

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + 1)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ResetAllQuest()
	self:InitMapData()
	FS_UserData.itemList:Restart()
end

function FS_SaveStory:ContinueGame()
	local ret = BattleData.SetBattleType(BattleData.Type.PVE_Story)

	if ret == true then
		self.firstLoad = true

		self:InitMapData()
	end

	return ret
end

function FS_SaveStory:JumpGame(storyId, difficulty)
	self.storyId = storyId
	self.storyIdSave = self.storyId

	local storyData = MS_StoryList.GetStoryData(self.storyId)

	self.areaId = storyData:GetAreaId()
	self.areaIdSave = self.areaId
	self.pattern = 0
	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.storyMode = FS_SaveStory.StoryMode.JumpGame

	BattleData.SetBattleType(BattleData.Type.PVE_Story)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData

	if DebugLocatorBorn == true then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + DebugLocatorId)
	else
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + 1)
	end

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitHero()
	self:InitTestMapData()
end

function FS_SaveStory:JumpMaze(storyId, difficulty)
	self.storyId = storyId
	self.storyIdSave = self.storyId
	self.areaId = 1
	self.areaIdSave = self.areaId

	if MS_StoryList.IsStoryMazeBoss(storyId) == true then
		self.pattern = 0

		if storyId == 501 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 1, 1, self.pattern, 1)
		elseif storyId == 502 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 1, 1, self.pattern, 1)
		elseif storyId == 503 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 1, 1, self.pattern, 1)
		elseif storyId == 504 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 2, 4, self.pattern, 1)
		elseif storyId == 505 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 1, 3, self.pattern, 1)
		elseif storyId == 506 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 3, 5, self.pattern, 1)
		elseif storyId == 507 then
			self.maze:DebugJumpData(self.storyId, self.areaId, 4, 6, self.pattern, 1)
		elseif storyId == 599 then
			self.areaId = 4

			self.maze:DebugJumpData(self.storyId, self.areaId, 4, 8, self.pattern, 1)
		end
	else
		self.pattern = 1
	end

	self.patternSave = self.pattern
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0

	BattleData.SetBattleType(BattleData.Type.PVE_Story)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData

	if DebugLocatorBorn == true then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornMaze + DebugLocatorId)
	else
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornMaze + 1)
	end

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitHero()
	self:InitTestMapData()
end

function FS_SaveStory:BossChallenge(storyId, difficulty)
	self.storyId = storyId
	self.storyIdSave = self.storyId
	self.pattern = 0
	self.patternSave = self.pattern
	self.areaId = 1

	if self.storyId == 5 or self.storyId == 6 then
		self.areaId = 2
	elseif self.storyId == 9 then
		self.areaId = 5
	end

	self.areaIdSave = self.areaId
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.storyMode = FS_SaveStory.StoryMode.BossChallenge

	BattleData.SetBattleType(BattleData.Type.PVE_Story, true)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornBoss)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitHero()
	self:InitTestMapData()
end

function FS_SaveStory:BossTimeChallenge(storyId, areaId, pos, level, monsterId)
	self.storyId = storyId
	self.pattern = 0
	self.areaId = areaId

	if level ~= nil then
		self.challengeLevel = level
	end

	if monsterId ~= nil then
		self.challengeMonsterId = monsterId
	end

	self.storyMode = FS_SaveStory.StoryMode.BossTimeChallenge

	BattleData.SetBattleType(BattleData.Type.PVE_Story, true)
	self:SetDifficulty(BattleData.GlobalDifficultyLevel.Normal)

	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornMaze + pos)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitHero()
	self:InitTestMapData()
end

function FS_SaveStory:GetChallengeLevel()
	return self.challengeLevel
end

function FS_SaveStory:GetChallengeMonsterId()
	return self.challengeMonsterId
end

function FS_SaveStory:Travel(difficulty)
	self.storyId = MS_StoryData.StoryIdInCarriage
	self.storyIdSave = self.storyId
	self.pattern = 0
	self.patternSave = self.pattern
	self.areaId = 1
	self.areaIdSave = self.areaId
	self.storyIdOld = 0
	self.areaIdOld = 0
	self.patternOld = 0
	self.storyMode = FS_SaveStory.StoryMode.Travel

	BattleData.SetBattleType(BattleData.Type.PVE_Story)
	self:SetDifficulty(difficulty)

	self.carriageCallStoryId = 1
	self.carriageCallId = 1
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + 1)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitHero()
	self:InitTestMapData()
end

function FS_SaveStory:StartOff(storyId, carriageId)
	self.storyId = storyId
	self.storyIdSave = self.storyId

	local carriageData

	if self.storyMode == FS_SaveStory.StoryMode.Arcade and storyId ~= FS_SaveStory.ArcadeStoryIdMax - 1000 then
		carriageData = MS_StoryCarriage.GetStoryCarriageData(storyId - 1000, carriageId)
	else
		carriageData = MS_StoryCarriage.GetStoryCarriageData(storyId, carriageId)
	end

	local transfer = carriageData.Transfer

	self.pattern = 0
	self.patternSave = self.pattern
	self.areaId = tonumber(carriageData.AreaId)
	self.areaIdSave = self.areaId

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	if transfer > 0 then
		self.carriageCallStoryId = 0
		self.carriageCallId = 0
		self.carriageArriveStoryId = 0
		self.carriageArriveId = 0
	else
		self.carriageCallStoryId = storyId > 0 and storyId or self.carriageCallStoryId
		self.carriageCallId = 0
		self.carriageArriveStoryId = storyId
		self.carriageArriveId = carriageId
	end

	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + carriageId)

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.storyId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornSave + carriageId)
	end

	if locatorData ~= nil then
		if self.storyId ~= MS_StoryData.StoryId10011 then
			self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
			self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		else
			self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, false)
			self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, false)
		end
	end

	if MS_StoryList.IsStoryDream(self.storyId) == true or MS_StoryList.IsStoryCarriage(self.storyId) == true then
		self:InitSelectHero(0)
	elseif self.storyMode == FS_SaveStory.StoryMode.Arcade then
		-- block empty
	else
		self:InitSelectHero(BattleData.GetHeroId())
	end

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:StartOffArcade(storyId, carriageId)
	self.storyId = storyId
	self.storyIdSave = self.storyId
	self.patternSave = self.pattern

	local storyData = MS_StoryList.GetStoryData(self.storyId)

	self.areaId = storyData:GetAreaId()
	self.areaIdSave = self.areaId

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + 1)

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.storyId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
		locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornSave + 1)
	end

	if locatorData ~= nil then
		if self.storyId ~= MS_StoryData.StoryId10011 then
			self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
			self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		else
			self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, false)
			self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, false)
		end
	end

	if MS_StoryList.IsStoryDream(self.storyId) == true or MS_StoryList.IsStoryCarriage(self.storyId) == true then
		self:InitSelectHero(0)
	elseif self.storyMode == FS_SaveStory.StoryMode.Arcade then
		-- block empty
	else
		self:InitSelectHero(BattleData.GetHeroId())
	end

	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:EnterOrExitForest(storyId, entranceId, pattern)
	self.storyId = storyId
	self.storyIdSave = self.storyId
	self.pattern = pattern
	self.patternSave = self.pattern
	self.areaId = 1
	self.areaIdSave = self.areaId

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornForest + entranceId)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:EnterMazeStart(storyId, entranceId, pattern)
	self:ResetMaze()

	self.storyId = storyId
	self.storyIdSave = self.storyId
	self.pattern = pattern
	self.patternSave = self.pattern
	self.areaId = 1
	self.areaIdSave = self.areaId

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornMaze + entranceId)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:ExitMazeStart(storyId, entranceId, pattern)
	if self.storyIdOld > 0 and self.entranceOld > 0 then
		storyId = self.storyIdOld
		entranceId = self.entranceOld
		pattern = self.patternOld
	end

	self:ResetMaze()

	self.storyId = storyId
	self.storyIdSave = self.storyId
	self.pattern = pattern
	self.patternSave = self.pattern
	self.areaId = 1
	self.areaIdSave = self.areaId

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornForest + entranceId)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:EnterNextMaze(final)
	if self.maze == nil then
		return
	end

	self:ResetMaze()

	if MS_StoryList.IsStoryMazeStart(self.storyId) == true then
		self.maze:EnterStart()
	elseif final > 0 then
		self.maze:EnterFinalBoss()
	else
		self.maze:EnterNext()
	end

	self.storyId = self.maze:GetStoryId()
	self.storyIdSave = self.storyId
	self.pattern = self.maze:GetPattern()
	self.patternSave = self.pattern
	self.areaId = self.maze:GetAreaId()
	self.areaIdSave = self.areaId

	local entranceId = self.maze:GetEntranceId()

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.carriageCallStoryId = 0
	self.carriageCallId = 0
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornMaze + entranceId)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:GoToCarriage(storyId, carriageId)
	self.storyId = MS_StoryData.StoryIdInCarriage
	self.storyIdSave = self.storyId
	self.pattern = 0
	self.patternSave = self.pattern
	self.areaId = 1
	self.areaIdSave = self.areaId

	BattleData.SetBattleType(BattleData.Type.PVE_Story)

	self.carriageCallStoryId = storyId > 0 and storyId or self.carriageCallStoryId
	self.carriageCallId = carriageId
	self.carriageArriveStoryId = 0
	self.carriageArriveId = 0
	self.firstLoad = false

	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + 1)

	if locatorData ~= nil then
		self:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
		self:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
	end

	self:InitSelectHero(0)
	self:ClearMonsterDead()
	self:ClearMonsterCall()
	self:ClearMonsterMeet()
	self:ClearMonsterKillCnt()
end

function FS_SaveStory:IsFirstLoad()
	return self.firstLoad
end

function FS_SaveStory:SetFirstLoad(flg)
	self.firstLoad = flg
end

function FS_SaveStory:IsStoryMode(mode)
	if self.storyMode == mode then
		return true
	end

	return false
end

function FS_SaveStory:IsArcadeMode(mode)
	if self.arcadeMode == mode then
		return true
	end

	return false
end

function FS_SaveStory:GetStoryId()
	return self.storyId
end

function FS_SaveStory:SetLoop(loop)
	self.loop = loop

	local logicLoop = self:GetLogicLoop()

	MS_ShellData.SetLoop(logicLoop)
	MS_TrapData.SetLoop(logicLoop)
	MS_TrickData.SetLoop(logicLoop)
	MS_StoryItemDrop.SetLoop(logicLoop)
	MS_StoryItem.SetLoop(logicLoop)
	MS_TransactionData.SetLoop(logicLoop)
end

function FS_SaveStory:GetLogicLoop()
	if self.storyMode == FS_SaveStory.StoryMode.Arcade then
		return 1
	end

	if self.loop > BattleData.GameLoopMax then
		return BattleData.GameLoopMax
	else
		return self.loop
	end
end

function FS_SaveStory:GetLoop()
	return self.loop
end

function FS_SaveStory:GetIsLoopMax()
	return false
end

function FS_SaveStory:GetHadNoobItem()
	return self.hadNoobItem == 1
end

function FS_SaveStory:SetHadNoobItem()
	if self.loop == BattleData.GameLoopMax then
		self.hadNoobItem = 1
	end
end

function FS_SaveStory:ResetHadNoobItem()
	self.hadNoobItem = 0
end

function FS_SaveStory:GetPatchId()
	return self.patchId
end

function FS_SaveStory:SetPatchId(id)
	self.patchId = id
end

function FS_SaveStory:GetAreaId()
	return self.areaId
end

function FS_SaveStory:GetPattern()
	if self.storyMode == FS_SaveStory.StoryMode.Arcade and self.storyId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
		return 0
	end

	return self.pattern
end

function FS_SaveStory:GetArcadePatternForScore()
	return self.pattern
end

function FS_SaveStory:GetCarriageCallStoryId()
	return self.carriageCallStoryId
end

function FS_SaveStory:GetCarriageArriveId()
	return self.carriageArriveId
end

function FS_SaveStory:ClearCarriageArriveId()
	self.carriageArriveId = 0
end

function FS_SaveStory:SetDifficulty(difficulty)
	self.difficulty = difficulty

	BattleData.SetDifficulty(difficulty)
end

function FS_SaveStory:GetDifficulty()
	return self.difficulty
end

function FS_SaveStory:GetArcadeRankValue(StoryId, ignoreBoss)
	local monsterList = MS_StoryMonster.GetStoryMonsterAll(StoryId, self:GetArcadePatternForScore())

	if StoryId == FS_SaveStory.ArcadeStoryIdMax - 1000 or MS_StoryList.IsStoryArcadeBoss(StoryId) then
		monsterList = MS_StoryMonster.GetStoryMonsterAll(StoryId, 0)
	end

	local StoryData = MS_StoryList.GetStoryData(StoryId)
	local monsterCount = StoryData["MonsterCount" .. self:GetArcadePatternForScore()]
	local deadCount = 0

	for k, v in pairs(monsterList) do
		if not table.contains(MS_StoryMonster.ArcadeRefreshMonsterList, v.StoryMonsterId) and v.IsNPC == 0 and self:IsMonsterDead(v.StoryMonsterId) then
			deadCount = deadCount + 1
		end
	end

	if self.arcadeMode == FS_SaveStory.ArcadeMode.StageSelect then
		deadCount = deadCount + 1

		if ignoreBoss then
			deadCount = deadCount - 1
		end
	end

	local percent = deadCount / monsterCount

	if percent < 0.4 then
		return FS_SaveStory.ArcadeRankValueType.White
	elseif percent < 0.7 then
		return FS_SaveStory.ArcadeRankValueType.Yellow
	else
		return FS_SaveStory.ArcadeRankValueType.Red
	end
end

function FS_SaveStory:GetArcadeMonsterDeadCount(StoryId)
	local monsterList = MS_StoryMonster.GetStoryMonsterAll(StoryId, self:GetArcadePatternForScore())

	if StoryId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
		monsterList = MS_StoryMonster.GetStoryMonsterAll(StoryId, 0)
	end

	local deadCount = 0

	for k, v in pairs(monsterList) do
		if not table.contains(MS_StoryMonster.ArcadeRefreshMonsterList, v.StoryMonsterId) and v.IsNPC == 0 and self:IsMonsterDead(v.StoryMonsterId) then
			deadCount = deadCount + 1
		end
	end

	if self.arcadeMode == FS_SaveStory.ArcadeMode.StageSelect then
		deadCount = deadCount + 1
	end

	return deadCount
end

function FS_SaveStory:IsQuestComplete(qId)
	qId = tonumber(qId)

	if self.questCompleteList[qId] ~= nil then
		return true
	end

	return false
end

function FS_SaveStory:CompleteQuest(qId, exitGameNotSave)
	if exitGameNotSave <= 0 then
		self.questCompleteListExit[tonumber(qId)] = 1
	end

	if self.questCompleteList[tonumber(qId)] == 1 then
		return false
	end

	self.questCompleteList[tonumber(qId)] = 1

	if DebugLog == true then
		local tmpStr = ""

		for tmpId, data in pairs(self.questCompleteList) do
			tmpStr = tmpStr .. "," .. tmpId
		end

		SystemHelper.LogTest("==========questStr=" .. tmpStr)
	end

	return true
end

function FS_SaveStory:RevertQuest(qId)
	self.questCompleteList[tonumber(qId)] = nil
	self.questCompleteListExit[tonumber(qId)] = nil
end

function FS_SaveStory:GetCompleteQuestList()
	return self.questCompleteList
end

function FS_SaveStory:ResetAllQuest()
	local newCompleteList = {}
	local newCompleteListExit = {}

	self.historyQuestCompleteList = {}

	for k, v in pairs(self.questCompleteList) do
		self.historyQuestCompleteList[k] = v

		local data = MS_StoryQuest.GetQuestData(k)

		if data.NotReset == 1 then
			newCompleteList[k] = 1
		end
	end

	for k, v in pairs(self.questCompleteListExit) do
		local data = MS_StoryQuest.GetQuestData(k)

		if data.NotReset == 1 then
			newCompleteListExit[k] = 1
		end
	end

	self.questCompleteList = newCompleteList
	self.questCompleteListExit = newCompleteListExit
end

function FS_SaveStory:ClearMonsterDead()
	self.monsterDeadList = {}
end

function FS_SaveStory:RemoveMonsterDead(storyMonsterId)
	local k = tonumber(storyMonsterId)

	if self.monsterDeadList[k] ~= nil then
		self.monsterDeadList[k] = nil
	end
end

function FS_SaveStory:AddMonsterDead(storyMonsterId)
	local k = tonumber(storyMonsterId)

	self.monsterDeadList[k] = 1
end

function FS_SaveStory:IsMonsterDead(storyMonsterId)
	if self.monsterDeadList[tonumber(storyMonsterId)] ~= nil then
		return true
	end

	return false
end

function FS_SaveStory:ClearMonsterCall()
	self.monsterCallList = {}
end

function FS_SaveStory:AddMonsterCall(storyMonsterId)
	local k = tonumber(storyMonsterId)

	self.monsterCallList[k] = 1
end

function FS_SaveStory:IsMonsterCall(storyMonsterId)
	if self.monsterCallList[tonumber(storyMonsterId)] ~= nil then
		return true
	end

	return false
end

function FS_SaveStory:IsMonsterMeet(storyMonsterId)
	if self.monsterMeet[tonumber(storyMonsterId)] ~= nil then
		return false
	end

	return true
end

function FS_SaveStory:AddMonsterMeet(storyMonsterId)
	local k = tonumber(storyMonsterId)

	self.monsterMeet[k] = 1
end

function FS_SaveStory:ClearMonsterMeet()
	self.monsterMeet = {}
end

function FS_SaveStory:ClearMonsterKillCnt()
	self.monsterKillCnt = {}
end

function FS_SaveStory:AddMonsterKillCnt(monsterType)
	local k = tonumber(monsterType)

	if self.monsterKillCnt[k] == nil then
		self.monsterKillCnt[k] = 1
	else
		self.monsterKillCnt[k] = self.monsterKillCnt[k] + 1
	end
end

function FS_SaveStory:GetMonsterKillCnt(monsterType)
	local ret = 0
	local k = tonumber(monsterType)

	if self.monsterKillCnt[k] ~= nil then
		ret = self.monsterKillCnt[k]
	end

	return ret
end

function FS_SaveStory:GetDropItemList()
	if self.storyDropItemList ~= nil then
		return self.storyDropItemList
	end
end

function FS_SaveStory:GetDropItem(index)
	if self.storyDropItemList ~= nil then
		return self.storyDropItemList[index]
	end
end

function FS_SaveStory:AddDropItem(itemId, itemNum, itemPos)
	if self.storyDropItemList ~= nil then
		local ItemTemplate = require("LuaScript/Logic/Item/ItemScene")
		local tmpItem = ItemTemplate:new(ItemScene.Type.Drop, itemId, itemNum, itemPos, true)

		table.insert(self.storyDropItemList, tmpItem)

		return tmpItem
	end

	return nil
end

function FS_SaveStory:RemoveDropItem(index)
	if self.storyDropItemList ~= nil then
		local tmpItem = self.storyDropItemList[index]

		table.remove(self.storyDropItemList, index)

		if tmpItem ~= nil then
			tmpItem:Exit()
		end

		tmpItem = nil
	end
end

function FS_SaveStory:RemoveDropItemValue(item)
	if self.storyDropItemList ~= nil and item ~= nil then
		table.removeValue(self.storyDropItemList, item)
	end
end

function FS_SaveStory:RemoveDropItemByReplaceId(replaceItemId)
	local deleteIdList

	if self.storyDropItemList ~= nil then
		for k, v in pairs(self.storyDropItemList) do
			if v ~= nil and v:GetReplaceItemId() == replaceItemId then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, k)
			end
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			local index = deleteIdList[i]

			self:RemoveDropItem(index)
		end
	end

	deleteIdList = nil
end

function FS_SaveStory:ShowDropItemAll()
	if self.storyDropItemList ~= nil then
		for k, v in pairs(self.storyDropItemList) do
			v:PlayEffect()
		end
	end
end

function FS_SaveStory:ClearDropItemAll(isReborn)
	if isReborn then
		local tmpList

		if self.storyDropItemList ~= nil then
			for k, v in pairs(self.storyDropItemList) do
				local itemId = v:GetItemId()

				if itemId == MS_ItemData.SceneMarkItem or itemId == MS_ItemData.FrogItemId then
					if tmpList == nil then
						tmpList = {}
					end

					table.insert(tmpList, v)
				else
					v:Exit()
				end
			end
		end

		self.storyDropItemList = {}

		if tmpList ~= nil then
			for k, v in pairs(tmpList) do
				table.insert(self.storyDropItemList, v)
			end
		end
	else
		if self.storyDropItemList ~= nil then
			for k, v in pairs(self.storyDropItemList) do
				v:Exit()
			end
		end

		self.storyDropItemList = {}
	end
end

function FS_SaveStory:GetDoorStatus(id)
	if self.doorList ~= nil and self.doorList[self.storyId] ~= nil and self.doorList[self.storyId][id] ~= nil then
		return self.doorList[self.storyId][id]
	end

	return Door.Status.Close
end

function FS_SaveStory:SetDoorStatus(id, status, storyId)
	if self.doorList ~= nil then
		if storyId then
			if self.doorList[storyId] == nil then
				self.doorList[storyId] = {}
			end

			self.doorList[storyId][id] = status

			return true
		else
			if self.doorList[self.storyId] == nil then
				self.doorList[self.storyId] = {}
			end

			self.doorList[self.storyId][id] = status

			return true
		end
	end

	return false
end

function FS_SaveStory:GetCrateStatus(id)
	if self.crateList ~= nil and self.crateList[self.storyId] ~= nil and self.crateList[self.storyId][id] ~= nil then
		return self.crateList[self.storyId][id]
	end

	return Crate.Status.Close
end

function FS_SaveStory:SetCrateStatus(id, status)
	if self.crateList ~= nil then
		if self.crateList[self.storyId] == nil then
			self.crateList[self.storyId] = {}
		end

		self.crateList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:GetStatueStatus(id)
	if self.statueList ~= nil and self.statueList[self.storyId] ~= nil and self.statueList[self.storyId][id] ~= nil then
		return self.statueList[self.storyId][id]
	end

	return Statue.Status.Open
end

function FS_SaveStory:SetStatueStatus(id, status)
	if self.statueList ~= nil then
		if self.statueList[self.storyId] == nil then
			self.statueList[self.storyId] = {}
		end

		self.statueList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:GetFountainStatus(id)
	if self.fountainList ~= nil and self.fountainList[self.storyId] ~= nil and self.fountainList[self.storyId][id] ~= nil then
		return self.fountainList[self.storyId][id]
	end

	return Fountain.Status.Open
end

function FS_SaveStory:SetFountainStatus(id, status)
	if self.fountainList ~= nil then
		if self.fountainList[self.storyId] == nil then
			self.fountainList[self.storyId] = {}
		end

		self.fountainList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:GetHoneypotStatus(id)
	if self.honeypotList ~= nil and self.honeypotList[self.storyId] ~= nil and self.honeypotList[self.storyId][id] ~= nil then
		return self.honeypotList[self.storyId][id]
	end

	return Honeypot.Status.Open
end

function FS_SaveStory:SetHoneypotStatus(id, status)
	if self.honeypotList ~= nil then
		if self.honeypotList[self.storyId] == nil then
			self.honeypotList[self.storyId] = {}
		end

		self.honeypotList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:GetStairStatus(id)
	if self.stairList ~= nil and self.stairList[self.storyId] ~= nil and self.stairList[self.storyId][id] ~= nil then
		return self.stairList[self.storyId][id]
	end

	return StairKick.Status.Close
end

function FS_SaveStory:SetStairStatus(id, status)
	if self.stairList ~= nil then
		if self.stairList[self.storyId] == nil then
			self.stairList[self.storyId] = {}
		end

		self.stairList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:GetCoverStatus(id)
	if self.coverList ~= nil and self.coverList[self.storyId] ~= nil and self.coverList[self.storyId][id] ~= nil then
		return self.coverList[self.storyId][id]
	end

	return CoverKick.Status.Close
end

function FS_SaveStory:SetCoverStatus(id, status)
	if self.coverList ~= nil then
		if self.coverList[self.storyId] == nil then
			self.coverList[self.storyId] = {}
		end

		self.coverList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:GetElevatorStatus(id)
	if self.elevatorList ~= nil and self.elevatorList[self.storyId] ~= nil and self.elevatorList[self.storyId][id] ~= nil then
		return self.elevatorList[self.storyId][id]
	end

	return nil
end

function FS_SaveStory:SetElevatorStatus(id, floor)
	if self.elevatorList ~= nil then
		if self.elevatorList[self.storyId] == nil then
			self.elevatorList[self.storyId] = {}
		end

		self.elevatorList[self.storyId][id] = floor

		return true
	end

	return false
end

function FS_SaveStory:GetCageStatus(id)
	if self.cageList ~= nil and self.cageList[self.storyId] ~= nil and self.cageList[self.storyId][id] ~= nil then
		return self.cageList[self.storyId][id]
	end

	return {
		1,
		1,
		1,
		1,
		1,
		1
	}
end

function FS_SaveStory:SetCageStatus(id, statusData)
	if self.cageList ~= nil then
		if self.cageList[self.storyId] == nil then
			self.cageList[self.storyId] = {}
		end

		self.cageList[self.storyId][id] = statusData

		return true
	end

	return false
end

function FS_SaveStory:GetGateStatus(id)
	if self.gateList ~= nil and self.gateList[self.storyId] ~= nil and self.gateList[self.storyId][id] ~= nil then
		return self.gateList[self.storyId][id]
	end

	return Gate.Status.Close
end

function FS_SaveStory:SetGateStatus(id, status, storyId)
	if self.gateList ~= nil then
		if storyId then
			if self.gateList[storyId] == nil then
				self.gateList[storyId] = {}
			end

			self.gateList[storyId][id] = status

			return true
		else
			if self.gateList[self.storyId] == nil then
				self.gateList[self.storyId] = {}
			end

			self.gateList[self.storyId][id] = status

			return true
		end
	end

	return false
end

function FS_SaveStory:GetBridgeStatus(id)
	if self.bridgeList ~= nil and self.bridgeList[self.storyId] ~= nil and self.bridgeList[self.storyId][id] ~= nil then
		return self.bridgeList[self.storyId][id]
	end

	return Bridge.Status.Close
end

function FS_SaveStory:SetBridgeStatus(id, status, storyId)
	if self.bridgeList ~= nil then
		if storyId then
			if self.bridgeList[storyId] == nil then
				self.bridgeList[storyId] = {}
			end

			self.bridgeList[storyId][id] = status

			return true
		else
			if self.bridgeList[self.storyId] == nil then
				self.bridgeList[self.storyId] = {}
			end

			self.bridgeList[self.storyId][id] = status

			return true
		end
	end

	return false
end

function FS_SaveStory:GetAltarStatus(id)
	if self.altarList ~= nil and self.altarList[self.storyId] ~= nil and self.altarList[self.storyId][id] ~= nil then
		return self.altarList[self.storyId][id]
	end

	return Altar.Status.Close
end

function FS_SaveStory:SetAltarStatus(id, status)
	if self.altarList ~= nil then
		if self.altarList[self.storyId] == nil then
			self.altarList[self.storyId] = {}
		end

		self.altarList[self.storyId][id] = status

		return true
	end

	return false
end

function FS_SaveStory:InitHero()
	self.heroEnableList = {}
	self.heroSelectList = {}
	self.heroSelectMazeList = {}
	self.heroSelectSkinList = {}
	self.heroProperty = {}
	self.heroShareStatus = nil
	self.heroCallId = 0
	self.heroCallType = 0
	self.heroCallProperty = {}

	if self.storyMode == FS_SaveStory.StoryMode.Normal then
		table.insert(self.heroSelectList, FS_SaveStory.DefaultHeroId)
		table.insert(self.heroSelectMazeList, FS_SaveStory.DefaultHeroId)

		for i = 1, #self.heroSelectList do
			local heroId = self.heroSelectList[i]

			self.heroEnableList[heroId] = 1
		end
	else
		local heroIdList = MS_HeroData.GetEnableHeroIdList()

		for i = 1, #heroIdList do
			local heroId = tonumber(heroIdList[i])

			self.heroEnableList[heroId] = 1
		end

		local storyData = MS_StoryList.GetStoryData(self.storyId)

		if storyData ~= nil then
			local heroList = storyData:GetSelectHeroList()

			for i = 1, #heroList do
				local heroId = heroList[i]

				table.insert(self.heroSelectList, heroId)
				table.insert(self.heroSelectMazeList, heroId)
			end
		end
	end

	self.heroSelectIndex = 1
	self.heroSelectMazeIndex = 1

	self:RefreshHeroEnableIdList()
end

function FS_SaveStory:ArcadeInitHero(heroId)
	self.heroEnableList = {}
	self.heroSelectList = {}
	self.heroSelectMazeList = {}
	self.heroSelectSkinList = {}
	self.heroProperty = {}
	self.heroShareStatus = nil
	self.heroCallId = 0
	self.heroCallType = 0
	self.heroCallProperty = {}

	table.insert(self.heroSelectList, heroId)

	self.heroEnableList[heroId] = 1
	self.heroSelectIndex = 1
	self.heroSelectMazeIndex = 1

	self:RefreshHeroEnableIdList()
end

function FS_SaveStory:InitSelectHero(heroId)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	self.heroSelectList = {}
	self.heroSelectMazeList = {}

	table.insert(self.heroSelectList, FS_SaveStory.DefaultHeroId)

	if tmpHeroId > 0 and tmpHeroId ~= self.heroSelectList[1] then
		table.insert(self.heroSelectList, tmpHeroId)
	end

	for i = 1, #self.heroSelectList do
		local heroId = self.heroSelectList[i]

		table.insert(self.heroSelectMazeList, heroId)
	end

	self.heroSelectIndex = 1
	self.heroSelectMazeIndex = 1
end

function FS_SaveStory:InitSelectList()
	self.heroSelectList = {}
	self.heroSelectMazeList = {}

	local num = BattleData.GetHostNum()

	for i = 1, num do
		local heroId = BattleData.GetHostHeroId(i)
		local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

		table.insert(self.heroSelectList, tmpHeroId)
	end

	for i = 1, #self.heroSelectList do
		local heroId = self.heroSelectList[i]

		table.insert(self.heroSelectMazeList, heroId)
	end

	self.heroSelectIndex = 1
	self.heroSelectMazeIndex = 1
end

function FS_SaveStory:ChangeMazeSelectHero(heroId1, heroId2)
	if heroId1 <= 0 and heroId2 <= 0 then
		return
	end

	local tmpHeroId1 = 0
	local tmpHeroId2 = 0

	if heroId1 > 0 then
		tmpHeroId1 = BattleData.ConvertHeroIdWithoutSkin(heroId1)
	end

	if heroId2 > 0 then
		tmpHeroId2 = BattleData.ConvertHeroIdWithoutSkin(heroId2)
	end

	self.heroSelectMazeList = {}

	if tmpHeroId1 > 0 then
		table.insert(self.heroSelectMazeList, tmpHeroId1)
	end

	if tmpHeroId2 > 0 then
		table.insert(self.heroSelectMazeList, tmpHeroId2)
	end

	self.heroSelectMazeIndex = 1
end

function FS_SaveStory:InitSelectSkin(heroId, skinId)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if self.heroSelectSkinList ~= nil then
		self.heroSelectSkinList[tmpHeroId] = skinId
	end
end

function FS_SaveStory:GetSelectSkin(heroId)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if MS_StorySkin.GetSkinMax(tmpHeroId) > 0 and self.heroSelectSkinList ~= nil and self.heroSelectSkinList[tmpHeroId] ~= nil then
		return self.heroSelectSkinList[tmpHeroId]
	end

	return 0
end

function FS_SaveStory:GetHeroSelectList()
	if MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		return self.heroSelectMazeList
	end

	return self.heroSelectList
end

function FS_SaveStory:GetLoadHeroList()
	if DebugTestMemory == true then
		return {
			10001
		}
	else
		local ret = {}
		local tmpSelectList = self:GetHeroSelectList()

		for i = 1, #tmpSelectList do
			table.insert(ret, tmpSelectList[i])
		end

		local storyData = MS_StoryList.GetStoryData(self.storyId)

		if storyData ~= nil then
			local heroList = storyData:GetLoadHeroList()

			for i = 1, #heroList do
				local heroId = heroList[i]
				local find = false

				for j = 1, #ret do
					if ret[j] == heroId then
						find = true

						break
					end
				end

				if find == false then
					table.insert(ret, heroId)
				end
			end
		end

		return ret
	end
end

function FS_SaveStory:SetHeroEnable(heroId, flg)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if tmpHeroId == FS_SaveStory.DefaultHeroId then
		return
	end

	if self.heroEnableList ~= nil then
		SystemHelper.Log("*************************************************************")

		if flg then
			SystemHelper.Log("SetHeroEnable: " .. tmpHeroId .. " - TRUE")
		else
			SystemHelper.Log("SetHeroEnable: " .. tmpHeroId .. " - FALSE")
		end

		if flg == true then
			self.heroEnableList[tmpHeroId] = 1
		else
			self.heroEnableList[tmpHeroId] = nil
		end

		self:RefreshHeroEnableIdList()
	end
end

function FS_SaveStory:RefreshHeroEnableIdList()
	self.heroEnableIdList = {}

	for k, v in pairs(self.heroEnableList) do
		if v ~= nil and v > 0 then
			table.insert(self.heroEnableIdList, k)
		end
	end

	table.sort(self.heroEnableIdList, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function FS_SaveStory:GetEnableHeroIdList()
	if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
		local heroIdList = MS_HeroData.GetEnableHeroIdList()
		local retHeroIdList = {}

		for _, id in pairs(heroIdList) do
			if id ~= 10007 then
				table.insert(retHeroIdList, id)
			end
		end

		return retHeroIdList
	end

	return self.heroEnableIdList
end

function FS_SaveStory:GetUIHeroNum()
	if MS_StoryList.IsStoryDream(self:GetStoryId()) == true then
		return 1
	elseif MS_StoryList.IsStoryCarriage(self.storyId) == true then
		return #self.heroEnableIdList
	else
		return self:GetSelectEnableHeroNum()
	end
end

function FS_SaveStory:GetUIHeroId(index)
	if MS_StoryList.IsStoryDream(self:GetStoryId()) == true then
		return FS_SaveStory.DefaultHeroId
	elseif MS_StoryList.IsStoryCarriage(self.storyId) == true then
		if self.heroEnableIdList ~= nil and self.heroEnableIdList[index] ~= nil then
			return self.heroEnableIdList[index]
		end

		return 0
	else
		return self:GetSelectHeroId(index)
	end
end

function FS_SaveStory:CheckHeroEnable(heroId)
	if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
		if heroId == 10005 then
			if IapData.GetEnterTide() and self:IsQuestComplete(MS_StoryQuest.DLCHeroJoinQuest) then
				return true
			else
				return false
			end
		elseif heroId == 10007 then
			return false
		else
			return true
		end
	end

	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if self.heroEnableList ~= nil and self.heroEnableList[tmpHeroId] ~= nil and self.heroEnableList[tmpHeroId] > 0 then
		return true
	end

	return false
end

function FS_SaveStory:SelectHeroId(heroId)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)
	local tmpSelectList = self:GetHeroSelectList()

	for i = 1, #tmpSelectList do
		local selectHeroId = tmpSelectList[i]

		if selectHeroId == tmpHeroId then
			if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
				self.heroSelectMazeIndex = i

				return true
			end

			if self.heroEnableList[tmpHeroId] ~= nil and self.heroEnableList[tmpHeroId] > 0 then
				self.heroSelectIndex = i

				return true
			end
		end
	end

	return false
end

function FS_SaveStory:GetSelectHeroId(index)
	local tmpSelectList = self:GetHeroSelectList()

	if tmpSelectList ~= nil and tmpSelectList[index] ~= nil then
		local heroId = tmpSelectList[index]

		if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
			return heroId
		end

		if self.heroEnableList[heroId] ~= nil and self.heroEnableList[heroId] > 0 then
			return heroId
		end
	end

	return 0
end

function FS_SaveStory:GetSelectHeroIdNow()
	return self:GetSelectHeroId(self:GetSelectHeroIndex())
end

function FS_SaveStory:GetSelectHeroNum()
	local tmpSelectList = self:GetHeroSelectList()

	return #tmpSelectList
end

function FS_SaveStory:GetSelectEnableHeroNum()
	local num = 0
	local tmpSelectList = self:GetHeroSelectList()

	for k, v in pairs(tmpSelectList) do
		if self:CheckHeroEnable(v) then
			num = num + 1
		end
	end

	return num
end

function FS_SaveStory:GetSelectHeroIndex()
	if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
		return self.heroSelectMazeIndex
	end

	return self.heroSelectIndex
end

function FS_SaveStory:ChangeSelectHeroId(heroId)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)
	local tmpSelectList = self:GetHeroSelectList()

	if tmpSelectList ~= nil and self.heroEnableList[tmpHeroId] ~= nil and self.heroEnableList[tmpHeroId] > 0 then
		if #tmpSelectList < 2 then
			table.insert(tmpSelectList, tmpHeroId)
		else
			tmpSelectList[2] = tmpHeroId
		end
	end
end

function FS_SaveStory:GetNextHeroId()
	local tmpSelectList = self:GetHeroSelectList()
	local tmpSelectIndex = self:GetSelectHeroIndex()

	if #tmpSelectList > 0 and tmpSelectIndex > 0 then
		for i = 1, #tmpSelectList - 1 do
			local index = tmpSelectIndex % #tmpSelectList + 1
			local heroId = tmpSelectList[index]

			if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
				return heroId
			end

			if self.heroEnableList[heroId] ~= nil and self.heroEnableList[heroId] > 0 then
				return heroId
			end
		end
	end

	return 0
end

function FS_SaveStory:GetSecondaryHeroId()
	local tmpSelectList = self:GetHeroSelectList()

	if self.heroEnableList ~= nil and tmpSelectList ~= nil then
		for i = 1, #tmpSelectList do
			local tmpHeroId = tmpSelectList[i]

			if tmpHeroId ~= FS_SaveStory.DefaultHeroId then
				if DLC_Maze == true and (MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true) then
					return tmpHeroId
				end

				if self.heroEnableList[tmpHeroId] ~= nil and self.heroEnableList[tmpHeroId] > 0 then
					return tmpHeroId
				end
			end
		end
	end

	return 0
end

function FS_SaveStory:SetHeroProperty(heroId, property, value, fromCall)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if fromCall == false then
		tmpHeroId = tostring(tmpHeroId)

		if self.heroProperty[tmpHeroId] == nil then
			self.heroProperty[tmpHeroId] = {}
		end

		self.heroProperty[tmpHeroId][tostring(property)] = tonumber(value)
	elseif tmpHeroId > 0 and self.heroCallId == tmpHeroId then
		if self.heroCallProperty == nil then
			self.heroCallProperty = {}
		end

		self.heroCallProperty[tostring(property)] = tonumber(value)
	end
end

function FS_SaveStory:GetHeroProperty(heroId, property, fromCall)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if fromCall == false then
		tmpHeroId = tostring(tmpHeroId)

		if self.heroProperty[tmpHeroId] ~= nil then
			return self.heroProperty[tmpHeroId][tostring(property)]
		end
	elseif tmpHeroId > 0 and self.heroCallId == tmpHeroId and self.heroCallProperty ~= nil and self.heroCallProperty[tostring(property)] then
		return self.heroCallProperty[tostring(property)]
	end

	return nil
end

function FS_SaveStory:ClearHeroShareStatusAll()
	self.heroShareStatus = nil
end

function FS_SaveStory:ClearHeroShareStatus(statusId)
	if self.heroShareStatus ~= nil then
		self.heroShareStatus[tostring(statusId)] = nil
	end
end

function FS_SaveStory:SetHeroShareStatus(statusId, saveData)
	if statusId > 0 and saveData ~= nil then
		if self.heroShareStatus == nil then
			self.heroShareStatus = {}
		end

		self.heroShareStatus[tostring(statusId)] = saveData
	end
end

function FS_SaveStory:GetHeroShareStatusList()
	return self.heroShareStatus
end

function FS_SaveStory:ClearHeroCall()
	self.heroCallId = 0
	self.heroCallType = 0
	self.heroCallProperty = nil
end

function FS_SaveStory:SetHeroCall(heroId, heroType)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if tmpHeroId > 0 then
		self.heroCallId = tmpHeroId
		self.heroCallType = heroType
	end
end

function FS_SaveStory:GetHeroCall()
	return self.heroCallId, self.heroCallType
end

function FS_SaveStory:SetRebornPosAndLook(pos, look, save)
	if save == true then
		self.rebornAreaId = self.areaId

		self.rebornPosition:SetVector3(pos)
		self.rebornLook:SetVector3(look)
	end

	self.rebornAreaIdLocal = self.areaId
	self.rebornHeroId = self:GetSelectHeroIdNow()

	self.rebornPositionLocal:SetVector3(pos)
	self.rebornLookLocal:SetVector3(look)
end

function FS_SaveStory:GetRebornAreaId()
	return self.rebornAreaIdLocal
end

function FS_SaveStory:GetRebornHeroId()
	return self.rebornHeroId
end

function FS_SaveStory:GetRebornPos()
	return self.rebornPositionLocal
end

function FS_SaveStory:GetRebornLook()
	return self.rebornLookLocal
end

function FS_SaveStory:SetBornPosAndLook(pos, look, save)
	if save == true then
		self.bornPosition:SetVector3(pos)
		self.bornLook:SetVector3(look)
	end

	self.bornPositionLocal:SetVector3(pos)
	self.bornLookLocal:SetVector3(look)
end

function FS_SaveStory:GetBornPos()
	return self.bornPositionLocal
end

function FS_SaveStory:GetBornLook()
	return self.bornLookLocal
end

function FS_SaveStory:InitItem()
	for i = 1, #BattleData.DefaultItemList do
		FS_UserData.itemList:AddBagItem(BattleData.DefaultItemList[i], BattleData.DefaultItemQuantityList[i])
	end
end

function FS_SaveStory:InitMapData()
	local stageMap = {}
	local siteList = MS_SiteInfo.siteList

	for siteId, siteData in pairs(siteList) do
		stageMap[tostring(siteId)] = {
			status = 0,
			portals = {}
		}
	end

	local portalList = MS_SiteInfo.portalList

	for portalId, portalData in pairs(portalList) do
		local siteId = tostring(100 * Mathf.Floor(portalId / 100))

		stageMap[siteId].portals[tostring(portalId)] = 0
	end

	stageMap["99"].status = 1
	stageMap["100"].status = 1
	stageMap["100"].portals["101"] = 1
	self.stageMap = stageMap
end

function FS_SaveStory:InitTestMapData()
	self.stageMap = LS_Setting.dbgStageMap
end

function FS_SaveStory:GetStageCount()
	local count = table.nums(self.stageMap) - 1

	return count
end

function FS_SaveStory:GetStageMap()
	return self.stageMap
end

function FS_SaveStory:UpdateStageMap()
	if DebugShowFullMap then
		self.stageMap = LS_Setting.dbgStageMap

		return
	end

	for siteId, siteData in pairs(self.stageMap) do
		if tonumber(siteId) >= 100 then
			local count = 0
			local isAlwaysOn = true
			local portals = siteData.portals

			SystemHelper.Log("SID: " .. siteId)

			for pId, pStatus in pairs(portals) do
				local prev = pStatus
				local show = 0
				local hShow = 0

				SystemHelper.Log("PID: " .. pId .. " -> " .. pStatus)

				local portal = MS_SiteInfo.GetPortal(pId)
				local showQuestIdList = StringHelper.Split(portal.EnableQuestId, ";")
				local hideQuestIdList = StringHelper.Split(portal.HideQuestId, ";")
				local showQuestCount = table.nums(showQuestIdList)

				if string.len(portal.EnableQuestId) > 0 and showQuestCount > 0 then
					for _, qId in pairs(showQuestIdList) do
						show = show + (self:IsQuestComplete(tonumber(qId)) and 1 or 0)
						isAlwaysOn = false
					end
				elseif pStatus == 0 and string.len(portal.EnableQuestId) == 0 then
					show = 1
					showQuestCount = 1
				end

				if string.len(portal.HideQuestId) > 0 and table.nums(hideQuestIdList) > 0 then
					for _, qId in pairs(hideQuestIdList) do
						hShow = hShow + (self:IsQuestComplete(tonumber(qId)) and 1 or 0)
						isAlwaysOn = false
					end
				elseif string.len(portal.HideQuestId) == 0 then
					hShow = -1
				end

				if hShow > 0 then
					show = 0
				end

				if prev <= 0 and show >= 0 and hShow < 0 then
					if showQuestCount > 0 and show == showQuestCount then
						SystemHelper.Log("???     " .. pId .. " -> " .. show)

						show = -show
					else
						SystemHelper.Log("!!!     " .. pId .. " -> " .. show .. " / " .. showQuestCount)

						show = 0
					end
				end

				portals[pId] = show

				SystemHelper.Log("     " .. pId .. " -> " .. show)

				if show ~= 0 then
					count = count + 1
				end
			end

			self.stageMap[siteId].portals = portals

			if isAlwaysOn then
				self.stageMap[siteId].status = count
			elseif self.stageMap[siteId].status == 0 and count > 0 then
				self.stageMap[siteId].status = -count
			elseif self.stageMap[siteId].status < 0 then
				self.stageMap[siteId].status = -count
			else
				self.stageMap[siteId].status = count
			end
		end
	end

	self.stageMap["99"].status = 1
	self.stageMap["100"].status = 1
	self.stageMap["100"].portals["101"] = 1
end

function FS_SaveStory:RevalidateStageMap()
	for siteId, siteData in pairs(self.stageMap) do
		if tonumber(siteId) >= 100 then
			local portals = siteData.portals

			for pId, status in pairs(portals) do
				local count = self.stageMap[siteId].status

				if count < 0 then
					self.stageMap[siteId].status = -count
				end

				local portals = siteData.portals

				for pId, pStatus in pairs(portals) do
					count = portals[pId]

					if count < 0 then
						portals[pId] = -count
					end
				end

				self.stageMap[siteId].portals = portals
			end
		end
	end
end

function FS_SaveStory:RestartTransaction()
	local toResetList = {}

	for k, v in pairs(self.transactionNumList) do
		if MS_TransactionData.IsNeedReset(k) then
			table.insert(toResetList, k)
		end
	end

	for k, v in pairs(toResetList) do
		self.transactionNumList[v] = nil
	end

	toResetList = nil
end

function FS_SaveStory:GetTransactionNum(TransactionId)
	return self.transactionNumList[TransactionId]
end

function FS_SaveStory:SetTransactionNum(TransactionId, num)
	self.transactionNumList[TransactionId] = num

	return true
end

function FS_SaveStory:RefreshTransactionNum()
	local loop = self:GetLogicLoop()

	for k, v in pairs(self.transactionNumList) do
		if MS_TransactionData.IsNeedRefresh(k) then
			self.transactionNumList[k] = MS_TransactionData.GetNumMax(k)
		end
	end
end

function FS_SaveStory:GetFormulaKnown(FormulaId)
	if self.formulaKnownList[FormulaId] == 1 then
		return true
	else
		return false
	end
end

function FS_SaveStory:SetFormulaKnown(FormulaId)
	self.formulaKnownList[FormulaId] = 1

	return true
end

function FS_SaveStory:GetBlessTimes(itemId)
	if self.blessTimesList[itemId] then
		return self.blessTimesList[itemId]
	else
		return 0
	end
end

function FS_SaveStory:SetBlessTimes(itemId, times)
	self.blessTimesList[itemId] = times

	return true
end

function FS_SaveStory:SetKillBossNotInSan()
	self.killBossNotInSan = 1
end

function FS_SaveStory:GetKillBossNotInSan()
	if self.killBossNotInSan then
		return self.killBossNotInSan
	end

	return 0
end

function FS_SaveStory:GetDocumentKnown(questId)
	if self.documentKnownList[questId] == 1 then
		return true
	else
		return false
	end
end

function FS_SaveStory:SetDocumentKnown(questId)
	self.documentKnownList[questId] = 1

	return true
end

function FS_SaveStory:GetDocumentOrderList()
	return self.documentOrderList
end

function FS_SaveStory:AddDocumentToOrderList(questId)
	table.insert(self.documentOrderList, questId)

	return true
end

function FS_SaveStory:GetFrogFinish(frogId)
	if self.frogFinishList[frogId] ~= nil and self.frogFinishList[frogId] == 1 then
		return true
	else
		return false
	end
end

function FS_SaveStory:SetFrogFinish(frogId)
	self.frogFinishList[frogId] = 1

	return true
end

function FS_SaveStory:GetFrogStoryFinishCount(storyId)
	local finishCount = 0

	for k, v in pairs(self.frogFinishList) do
		if v == 1 then
			local sId = Mathf.Floor(k / 1000)

			if sId == storyId then
				finishCount = finishCount + 1
			end
		end
	end

	return finishCount, MS_StoryFrog.GetStoryFrogCount(storyId)
end

function FS_SaveStory:SetRecordPlayerBehaviorOff()
	self.playerBehaviorRecordOff = 1
end

function FS_SaveStory:GetRecordPlayerBehaviorOff()
	return self.playerBehaviorRecordOff == 1
end

function FS_SaveStory:AddAchievementValue(achievementId, value, recordId)
	local achievementData = MS_Achievement.GetAchievement(achievementId)

	if self.achievementList[achievementId] == nil then
		self.achievementList[achievementId] = 0
	end

	if self.achievementList[achievementId] >= achievementData.Max then
		return false
	end

	if recordId then
		if self.achievementStatisticsList[achievementId] == nil then
			self.achievementStatisticsList[achievementId] = {}
		end

		if table.contains(self.achievementStatisticsList[achievementId], recordId) then
			return false
		end

		table.insert(self.achievementStatisticsList[achievementId], recordId)
	end

	self.achievementList[achievementId] = self.achievementList[achievementId] + value

	if self.achievementList[achievementId] >= achievementData.Max then
		self.achievementList[achievementId] = achievementData.Max

		if not table.contains(self.achievementFinishList, achievementId) then
			table.insert(self.achievementFinishList, achievementId)
		end

		FS_UserData.achievement:AddAchievementValue(achievementId, value, recordId)

		return true
	else
		return false
	end
end

function FS_SaveStory:GetAchievementComplete(achievementId)
	local achievementData = MS_Achievement.GetAchievement(achievementId)

	if self.achievementList[achievementId] == nil then
		return false
	else
		return self.achievementList[achievementId] >= achievementData.Max
	end
end

function FS_SaveStory:SetIsInRelaxTime(isInArcadeRelaxTime)
	if isInArcadeRelaxTime then
		self.inArcadeRelaxTime = 1
	else
		self.inArcadeRelaxTime = 0
	end
end

function FS_SaveStory:SetIsInMovieTime(isInArcadeMovieTime)
	if isInArcadeMovieTime then
		self.inArcadeMovieTime = 1
	else
		self.inArcadeMovieTime = 0
	end
end

function FS_SaveStory:IsSelectStageGameOver()
	return self.inArcadeRelaxTime == 1
end

function FS_SaveStory:RecordStartMovieTime()
	local nowTime = ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime()

	nowTime = Mathf.Round(nowTime * 100) / 100
	self.StartMovieTime = nowTime
end

function FS_SaveStory:RecordEndMovieTime(storyId, heroId)
	if self.StartMovieTime == nil then
		return
	end

	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if self.timeRecorder[storyId] == nil then
		self.timeRecorder[storyId] = {}
	end

	if self.timeRecorder[storyId][tmpHeroId] == nil then
		self.timeRecorder[storyId][tmpHeroId] = {}
	end

	local nowTime = ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime()

	nowTime = Mathf.Round(nowTime * 100) / 100

	local deltaMovieTime = nowTime - self.StartMovieTime

	if self.timeRecorder[storyId][tmpHeroId].start_time ~= nil then
		self.timeRecorder[storyId][tmpHeroId].start_time = self.timeRecorder[storyId][tmpHeroId].start_time + deltaMovieTime
	end

	self.lastRecordTime = self.lastRecordTime + deltaMovieTime
end

function FS_SaveStory:AddStageScore(storyId, Score)
	if self.storyMode ~= FS_SaveStory.StoryMode.Arcade or self.inArcadeRelaxTime == 1 then
		return
	end

	if self.scoreRecorder[storyId] == nil then
		self.scoreRecorder[storyId] = Score
	else
		self.scoreRecorder[storyId] = self.scoreRecorder[storyId] + Score
	end
end

function FS_SaveStory:GetStageScore(storyId)
	if self.scoreRecorder[storyId] == nil then
		return 0
	else
		return self.scoreRecorder[storyId]
	end
end

function FS_SaveStory:GetStageScoreAll()
	if self.scoreRecorder == nil then
		return 0
	end

	local allScore = 0

	for storyId, score in pairs(self.scoreRecorder) do
		allScore = allScore + score
	end

	return allScore
end

function FS_SaveStory:RecordStageTime(storyId, heroId)
	if self.storyMode == FS_SaveStory.StoryMode.Arcade and (self.inArcadeRelaxTime == 1 or self.inArcadeMovieTime == 1) then
		return
	end

	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if self.timeRecorder[storyId] == nil then
		self.timeRecorder[storyId] = {}
	end

	if self.timeRecorder[storyId][tmpHeroId] == nil then
		self.timeRecorder[storyId][tmpHeroId] = {}
	end

	local nowTime = ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime()

	nowTime = Mathf.Round(nowTime * 100) / 100

	if self.timeRecorder[storyId][tmpHeroId].start_time ~= nil then
		if self.timeRecorder[storyId][tmpHeroId].duration ~= nil then
			self.timeRecorder[storyId][tmpHeroId].duration = nowTime - self.timeRecorder[storyId][tmpHeroId].start_time + self.timeRecorder[storyId][tmpHeroId].duration
		else
			self.timeRecorder[storyId][tmpHeroId].duration = nowTime - self.timeRecorder[storyId][tmpHeroId].start_time
		end
	end

	self.timeRecorder[storyId][tmpHeroId].start_time = nowTime
	self.lastRecordTime = nowTime
end

function FS_SaveStory:GetStageTime(storyId, heroId)
	if self.timeRecorder[storyId] ~= nil and self.timeRecorder[storyId][heroId] ~= nil and self.timeRecorder[storyId][heroId].duration ~= nil then
		return self.timeRecorder[storyId][heroId].duration
	end

	return 0
end

function FS_SaveStory:RecordDuration(type, isStart, ...)
	if self:IsStoryMode(FS_SaveStory.StoryMode.Normal) == false then
		return
	end

	local arg = {
		...
	}

	if self.durationList[self:GetStoryId()] == nil then
		self.durationList[self:GetStoryId()] = {}
	end

	if self.durationList[self:GetStoryId()][type] == nil then
		self.durationList[self:GetStoryId()][type] = {}
	end

	local temp = self.durationList[self:GetStoryId()][type]

	if type == FS_PlayerBehavior.RecordType.InSanDuration then
		if temp[tostring(arg[1])] == nil then
			temp[tostring(arg[1])] = {}
		end

		if isStart then
			if temp[tostring(arg[1])].start_time == nil then
				temp[tostring(arg[1])].start_time = self:GetGameTime()
			end
		elseif temp[tostring(arg[1])].start_time ~= nil then
			if temp[tostring(arg[1])].duration == nil then
				temp[tostring(arg[1])].duration = self:GetGameTime() - temp[tostring(arg[1])].start_time
			else
				temp[tostring(arg[1])].duration = self:GetGameTime() - temp[tostring(arg[1])].start_time + temp[tostring(arg[1])].duration
			end

			temp[tostring(arg[1])].start_time = nil
		end
	end
end

function FS_SaveStory:ClearAllStageTime()
	self.timeRecorder = {}
end

function FS_SaveStory:ResetAllStageTime()
	for k, v in pairs(self.timeRecorder) do
		for _k, _v in pairs(v) do
			_v.start_time = nil
		end
	end
end

function FS_SaveStory:GetTimeRecorderList()
	return self.timeRecorder
end

function FS_SaveStory:GetDurationList()
	return self.durationList
end

function FS_SaveStory:GetInSanDuration()
	local totalTime = 0

	for k, v in pairs(self.durationList) do
		for _k, _v in pairs(v) do
			if _k == FS_PlayerBehavior.RecordType.InSanDuration then
				for __k, __v in pairs(_v) do
					if _v[__k].duration then
						totalTime = totalTime + _v[__k].duration
					end
				end
			end
		end
	end

	return totalTime
end

function FS_SaveStory:SubGameTime(storyId, heroId, time)
	if self.storyMode == FS_SaveStory.StoryMode.Arcade and (self.inArcadeRelaxTime == 1 or self.inArcadeMovieTime == 1) then
		return
	end

	self:RecordStageTime(storyId, heroId)
	self:SubGameTimeInternal(storyId, heroId, time)
end

function FS_SaveStory:SubGameTimeInternal(storyId, heroId, time)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if self.timeRecorder[storyId] ~= nil and self.timeRecorder[storyId][tmpHeroId] ~= nil and self.timeRecorder[storyId][tmpHeroId].duration ~= nil and self.timeRecorder[storyId][tmpHeroId].duration > 0 then
		if time <= self.timeRecorder[storyId][tmpHeroId].duration then
			self.timeRecorder[storyId][tmpHeroId].duration = self.timeRecorder[storyId][tmpHeroId].duration - time
		else
			local retTime = time - self.timeRecorder[storyId][tmpHeroId].duration

			self.timeRecorder[storyId][tmpHeroId].duration = 0

			if self.arcadeMode == FS_SaveStory.ArcadeMode.Normal then
				if self:GetStoryId() == FS_SaveStory.ArcadeStoryIdMax - 1000 then
					self:SubGameTimeInternal(FS_SaveStory.ArcadeStoryIdMax - 1, heroId, retTime)
				elseif self:GetStoryId() > 1001 then
					self:SubGameTimeInternal(self:GetStoryId() - 1, heroId, retTime)
				end
			end
		end
	end
end

function FS_SaveStory:GetTotalScore()
	local totalScore = 0

	for k, v in pairs(self.scoreRecorder) do
		totalScore = totalScore + v
	end

	return totalScore
end

function FS_SaveStory:GetGameTime()
	local totalTime = 0

	for k, v in pairs(self.timeRecorder) do
		for _k, _v in pairs(v) do
			if _v.duration ~= nil then
				totalTime = totalTime + _v.duration
			end
		end
	end

	if self.storyMode ~= FS_SaveStory.StoryMode.Arcade or self.inArcadeRelaxTime == 0 then
		totalTime = totalTime + ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime() - self.lastRecordTime
	end

	totalTime = Mathf.Round(totalTime * 100) / 100

	return totalTime
end

function FS_SaveStory:GetRandomSeed()
	self.randomTimes = self.randomTimes + 10

	if self.randomTimes > 999999 then
		self.randomTimes = 0
	end

	return self.randomSeed + self.randomTimes
end

function FS_SaveStory:ResetRandomSeed()
	self.randomSeed = MathHelper.getRandom(10000, 99999)
end

function FS_SaveStory:AddMazeBossBar(add)
	if self.maze ~= nil then
		if DebugMazeBossUp == true then
			add = add * 100
		end

		return self.maze:AddBossBar(add)
	end

	return false
end

function FS_SaveStory:IsMazeBossBarFull()
	if self.maze ~= nil then
		return self.maze:IsBossBarFull()
	end

	return false
end

function FS_SaveStory:KillMazeBoss(id)
	if self.maze ~= nil then
		return self.maze:KillBoss(id)
	end
end

function FS_SaveStory:GetMazeElementId(element_type, id, type)
	if self.maze ~= nil then
		local id, type, rnd1, rnd2 = self.maze:GetElementId(element_type, id, type)

		return id, type, rnd1, rnd2
	end

	return 0, 0, 0, 0
end

function FS_SaveStory:DebugGetElementId(element_type)
	if self.maze ~= nil then
		return self.maze:DebugGetElementId(element_type)
	end

	return 0
end

function FS_SaveStory:DebugSetElementId(element_type, id)
	if self.maze ~= nil then
		return self.maze:DebugSetElementId(element_type, id)
	end
end

function FS_SaveStory:GetMazeId()
	if self.maze ~= nil then
		return self.maze:GetMazeId()
	end

	return 1
end

function FS_SaveStory:SetMazeId(id)
	if self.maze ~= nil then
		return self.maze:SetMazeId(id)
	end
end

function FS_SaveStory:GetMazeFloor()
	if self.maze ~= nil then
		return self.maze:GetMazeFloor()
	end

	return 1
end

function FS_SaveStory:GetMazeLevel()
	if self.maze ~= nil then
		return self.maze:GetMazeLevel()
	end

	return 1
end

function FS_SaveStory:SetMazeLevelAdd(add)
	if self.maze ~= nil then
		return self.maze:SetLevelAdd(add)
	end
end

function FS_SaveStory:GetMazeEntrance()
	if self.maze ~= nil then
		return self.maze:GetEntranceId()
	end

	return 1
end

function FS_SaveStory:GetMazeHeroCallData()
	if self.maze ~= nil then
		return self.maze:GetHeroCallData()
	end

	return 0, 0
end

function FS_SaveStory:IsMazeFloorMax()
	if self.maze ~= nil then
		return self.maze:IsFloorMax()
	end

	return true
end

function FS_SaveStory:IsHaveMazeFinalFloor()
	if self.maze ~= nil then
		return self.maze:IsHaveMazeFinalFloor()
	end

	return true
end

function FS_SaveStory:NextMazeFloor()
	if self.maze ~= nil then
		return self.maze:NextFloor()
	end
end

function FS_SaveStory:PrevMazeFloor()
	if self.maze ~= nil then
		return self.maze:PrevFloor()
	end
end

function FS_SaveStory:IsHaveMazeBoss()
	if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		local mazeId = self:GetMazeId()
		local mazeFloor = self:GetMazeFloor()
		local bossId = MS_StoryMaze.GetMazeBossId(mazeId, mazeFloor, self.storyId, self.areaId)

		if bossId > 0 and self:IsMonsterDead(bossId) == false then
			return true
		end
	end

	return false
end

function FS_SaveStory:ResetMaze()
	self:ClearMazeData(self.doorList)
	self:ClearMazeData(self.crateList)
	self:ClearMazeData(self.statueList)
	self:ClearMazeData(self.fountainList)
	self:ClearMazeData(self.honeypotList)

	local deleteIdList

	if self.questCompleteList ~= nil then
		for qId, v in pairs(self.questCompleteList) do
			if qId < MS_StoryQuest.QuestIdStart then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, qId)
			end
		end
	end

	if deleteIdList ~= nil then
		for i = 1, #deleteIdList do
			self.questCompleteList[deleteIdList[i]] = nil
		end
	end

	deleteIdList = nil

	if self.questCompleteListExit ~= nil then
		for qId, v in pairs(self.questCompleteListExit) do
			if qId < MS_StoryQuest.QuestIdStart then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, qId)
			end
		end
	end

	if deleteIdList ~= nil then
		for i = 1, #deleteIdList do
			self.questCompleteListExit[deleteIdList[i]] = nil
		end
	end
end

function FS_SaveStory:ClearMazeData(list)
	if list ~= nil then
		local deleteIdList

		for storyId, v in pairs(list) do
			if MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, storyId)
			end
		end

		if deleteIdList ~= nil then
			for i = 1, #deleteIdList do
				list[deleteIdList[i]] = nil
			end

			deleteIdList = nil
		end
	end
end

function FS_SaveStory:Parse()
	return
end

return FS_SaveStory
