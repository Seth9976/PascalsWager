-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_PlayerBehavior.lua

FS_PlayerBehavior = class("FS_PlayerBehavior")
FS_PlayerBehavior.static.RecordType = {
	SkillHitTimes = 2,
	ItemMakeTimes = 6,
	KillEnemyTimes = 8,
	AddPointTime = 15,
	PlayDuration = 10,
	AddTalentTime = 14,
	InSanDuration = 9,
	DeathTimes = 3,
	QuestCompleteTime = 16,
	ItemPickUpTimes = 7,
	StageClearDuration = 11,
	ItemUseTimes = 4,
	SkillCastTimes = 1,
	LevelUpTime = 13,
	ItemBuyTimes = 5,
	KillBossDuration = 12
}
FS_PlayerBehavior.static.StageStartQuest = {
	13014,
	23701,
	35003,
	55035,
	45001,
	65001,
	75007,
	85001
}
FS_PlayerBehavior.static.StageClearQuest = {
	11003,
	21006,
	31002,
	41001,
	51001,
	61001,
	71001,
	81001
}
FS_PlayerBehavior.BossKillIdList = {}
FS_PlayerBehavior.BossKillIdList[13004] = 1030
FS_PlayerBehavior.BossKillIdList[23002] = 2028
FS_PlayerBehavior.BossKillIdList[33001] = 3001
FS_PlayerBehavior.BossKillIdList[43001] = 4060
FS_PlayerBehavior.BossKillIdList[53010] = 5038
FS_PlayerBehavior.BossKillIdList[63001] = 6001
FS_PlayerBehavior.BossKillIdList[73001] = 7001
FS_PlayerBehavior.BossKillIdList[83001] = 8001

function FS_PlayerBehavior:initialize()
	self.behaviorList = {}
	self.durationList = {}
	self.oldBehaviorList = {}
	self.deltaBehaviorList = {}
	self.deltaCacheList = {}
	self.lastRecordTime = 0
	self.timeRecorder = {}
end

function FS_PlayerBehavior:Clear()
	self.behaviorList = nil
	self.durationList = nil
	self.oldBehaviorList = nil
	self.deltaBehaviorList = nil
	self.deltaCacheList = nil
	self.timeRecorder = nil
	self.lastRecordTime = 0
end

function FS_PlayerBehavior:Reset(newGame)
	self:Clear()
	self:initialize()

	if newGame then
		local tempGameId = LS_Setting.GetGameTimes()

		tempGameId = tempGameId + 1

		LS_Setting.SetGameTimes(tempGameId)
		LS_PlayerBehavior.NewGame(tempGameId)
	end
end

function FS_PlayerBehavior:ResetDeltaList(success)
	self.deltaBehaviorList = {}
	self.deltaCacheList = {}

	return nil
end

function FS_PlayerBehavior:Encode()
	local timeRecorderList = FS_UserData.story:GetTimeRecorderList()
	local sanDurationList = FS_UserData.story:GetDurationList()

	if LS_PlayerBehavior.IsWaitingForResponse() then
		if self.oldBehaviorList[tostring(FS_UserData.story:GetStoryId())] == nil then
			self.oldBehaviorList[tostring(FS_UserData.story:GetStoryId())] = {}
		end

		local temp = self.oldBehaviorList[tostring(FS_UserData.story:GetStoryId())]

		if self.deltaBehaviorList[tostring(FS_UserData.story:GetStoryId())] == nil then
			self.deltaBehaviorList[tostring(FS_UserData.story:GetStoryId())] = {}
		end

		local temp2 = self.deltaBehaviorList[tostring(FS_UserData.story:GetStoryId())]

		if self.deltaCacheList[tostring(FS_UserData.story:GetStoryId())] == nil then
			self.deltaCacheList[tostring(FS_UserData.story:GetStoryId())] = {}
		end

		local temp3 = self.deltaCacheList[tostring(FS_UserData.story:GetStoryId())]

		for k, v in pairs(self.behaviorList) do
			if temp[tostring(k)] == nil then
				temp[tostring(k)] = {}
			end

			if temp2[tostring(k)] == nil then
				temp2[tostring(k)] = {}
			end

			if temp3[tostring(k)] == nil then
				temp3[tostring(k)] = {}
			end

			local _temp = temp[tostring(k)]
			local _temp2 = temp2[tostring(k)]
			local _temp3 = temp3[tostring(k)]

			if k == FS_PlayerBehavior.RecordType.SkillCastTimes or k == FS_PlayerBehavior.RecordType.SkillHitTimes or k == FS_PlayerBehavior.RecordType.DeathTimes or k == FS_PlayerBehavior.RecordType.ItemUseTimes or k == FS_PlayerBehavior.RecordType.ItemMakeTimes or k == FS_PlayerBehavior.RecordType.ItemPickUpTimes or k == FS_PlayerBehavior.RecordType.ItemBuyTimes or k == FS_PlayerBehavior.RecordType.KillEnemyTimes then
				for _k, _v in pairs(v) do
					if _temp[_k] == nil then
						_temp[_k] = _v
					else
						_temp[_k] = _temp[_k] + _v
					end
				end

				for _k, _v in pairs(v) do
					_temp2[_k] = _temp[_k]
				end

				for _k, _v in pairs(v) do
					_temp3[_k] = _temp[_k]
				end
			elseif k == FS_PlayerBehavior.RecordType.LevelUpTime or k == FS_PlayerBehavior.RecordType.AddPointTime or k == FS_PlayerBehavior.RecordType.QuestCompleteTime or k == FS_PlayerBehavior.RecordType.AddTalentTime then
				for _k, _v in pairs(v) do
					_temp[_k] = _v
				end

				for _k, _v in pairs(v) do
					_temp2[_k] = _v
				end

				for _k, _v in pairs(v) do
					_temp3[_k] = _v
				end
			end
		end

		self.behaviorList = {}

		for k, v in pairs(timeRecorderList) do
			if self.oldBehaviorList[tostring(k)] == nil then
				self.oldBehaviorList[tostring(k)] = {}
			end

			if self.oldBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] == nil then
				self.oldBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] = {}
			end

			local _temp = self.oldBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)]

			for _k, _v in pairs(v) do
				if _v.duration ~= nil and _temp[tostring(_k)] ~= _v.duration then
					if self.deltaBehaviorList[tostring(k)] == nil then
						self.deltaBehaviorList[tostring(k)] = {}
					end

					if self.deltaCacheList[tostring(k)] == nil then
						self.deltaCacheList[tostring(k)] = {}
					end

					if self.deltaBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] == nil then
						self.deltaBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] = {}
					end

					self.deltaBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)][tostring(_k)] = _v.duration

					if self.deltaCacheList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] == nil then
						self.deltaCacheList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] = {}
					end

					self.deltaCacheList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)][tostring(_k)] = _v.duration
				end

				_temp[tostring(_k)] = _v.duration
			end
		end

		for k, v in pairs(self.durationList) do
			if self.oldBehaviorList[tostring(k)] == nil then
				self.oldBehaviorList[tostring(k)] = {}
			end

			if self.deltaBehaviorList[tostring(k)] == nil then
				self.deltaBehaviorList[tostring(k)] = {}
			end

			if self.deltaCacheList[tostring(k)] == nil then
				self.deltaCacheList[tostring(k)] = {}
			end

			for _k, _v in pairs(v) do
				if self.oldBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.oldBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				if self.deltaBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.deltaBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				if self.deltaCacheList[tostring(k)][tostring(_k)] == nil then
					self.deltaCacheList[tostring(k)][tostring(_k)] = {}
				end

				local _temp1 = self.oldBehaviorList[tostring(k)][tostring(_k)]
				local _temp2 = self.deltaBehaviorList[tostring(k)][tostring(_k)]
				local _temp3 = self.deltaCacheList[tostring(k)][tostring(_k)]

				if _k == FS_PlayerBehavior.RecordType.StageClearDuration then
					if _temp1.duration ~= _v.duration then
						_temp2.duration = _v.duration
						_temp3.duration = _v.duration
					end

					if _v.start_time ~= nil then
						_temp1.start_time = _v.start_time
					end

					_temp1.duration = _v.duration

					if table.nums(_temp2) == 0 then
						self.deltaBehaviorList[tostring(k)][tostring(_k)] = nil
					end

					if table.nums(_temp3) == 0 then
						self.deltaCacheList[tostring(k)][tostring(_k)] = nil
					end
				elseif _k == FS_PlayerBehavior.RecordType.KillBossDuration then
					for __k, __v in pairs(_v) do
						if __v.duration ~= nil then
							if _temp1[__k] == nil then
								_temp1[__k] = {}
							end

							_temp1[__k].duration = __v.duration

							if _temp2[__k] == nil then
								_temp2[__k] = {}
							end

							_temp2[__k].duration = __v.duration

							if _temp3[__k] == nil then
								_temp3[__k] = {}
							end

							_temp3[__k].duration = __v.duration
							__v.duration = nil
						end
					end

					if table.nums(_temp2) == 0 then
						self.deltaBehaviorList[tostring(k)][tostring(_k)] = nil
					end

					if table.nums(_temp3) == 0 then
						self.deltaCacheList[tostring(k)][tostring(_k)] = nil
					end
				end
			end
		end

		for k, v in pairs(sanDurationList) do
			if self.oldBehaviorList[tostring(k)] == nil then
				self.oldBehaviorList[tostring(k)] = {}
			end

			if self.deltaBehaviorList[tostring(k)] == nil then
				self.deltaBehaviorList[tostring(k)] = {}
			end

			if self.deltaCacheList[tostring(k)] == nil then
				self.deltaCacheList[tostring(k)] = {}
			end

			for _k, _v in pairs(v) do
				if self.oldBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.oldBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				if self.deltaBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.deltaBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				if self.deltaCacheList[tostring(k)][tostring(_k)] == nil then
					self.deltaCacheList[tostring(k)][tostring(_k)] = {}
				end

				local _temp1 = self.oldBehaviorList[tostring(k)][tostring(_k)]
				local _temp2 = self.deltaBehaviorList[tostring(k)][tostring(_k)]
				local _temp3 = self.deltaCacheList[tostring(k)][tostring(_k)]

				if _k == FS_PlayerBehavior.RecordType.InSanDuration then
					for __k, __v in pairs(_v) do
						if __v.start_time ~= nil then
							if __v.duration == nil then
								__v.duration = FS_UserData.story:GetGameTime() - __v.start_time
							else
								__v.duration = FS_UserData.story:GetGameTime() - __v.start_time + __v.duration
							end

							__v.start_time = FS_UserData.story:GetGameTime()
						end

						if __v.duration ~= nil and (_temp1[tostring(__k)] == nil or _temp1[tostring(__k)].duration ~= __v.duration) then
							if _temp2[tostring(__k)] == nil then
								_temp2[tostring(__k)] = {}
							end

							_temp2[tostring(__k)].duration = __v.duration

							if _temp3[tostring(__k)] == nil then
								_temp3[tostring(__k)] = {}
							end

							_temp3[tostring(__k)].duration = __v.duration
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

					if table.nums(_temp2) == 0 then
						self.deltaBehaviorList[tostring(k)][tostring(_k)] = nil
					end

					if table.nums(_temp3) == 0 then
						self.deltaCacheList[tostring(k)][tostring(_k)] = nil
					end
				end
			end
		end

		for k, v in pairs(self.deltaBehaviorList) do
			if table.nums(v) == 0 then
				self.deltaBehaviorList[k] = nil
			end
		end

		for k, v in pairs(self.deltaCacheList) do
			if table.nums(v) == 0 then
				self.deltaCacheList[k] = nil
			end
		end

		local ret = {}

		ret.behavior = self.oldBehaviorList

		local ret2 = {}

		if table.nums(self.deltaBehaviorList) == 0 then
			ret2.behavior = nil
		else
			ret2.behavior = self.deltaBehaviorList
		end

		return ret, ret2
	else
		if self.oldBehaviorList[tostring(FS_UserData.story:GetStoryId())] == nil then
			self.oldBehaviorList[tostring(FS_UserData.story:GetStoryId())] = {}
		end

		local temp = self.oldBehaviorList[tostring(FS_UserData.story:GetStoryId())]

		if self.deltaBehaviorList[tostring(FS_UserData.story:GetStoryId())] == nil then
			self.deltaBehaviorList[tostring(FS_UserData.story:GetStoryId())] = {}
		end

		local temp2 = self.deltaBehaviorList[tostring(FS_UserData.story:GetStoryId())]

		for k, v in pairs(self.behaviorList) do
			if temp[tostring(k)] == nil then
				temp[tostring(k)] = {}
			end

			if temp2[tostring(k)] == nil then
				temp2[tostring(k)] = {}
			end

			local _temp = temp[tostring(k)]
			local _temp2 = temp2[tostring(k)]

			if k == FS_PlayerBehavior.RecordType.SkillCastTimes or k == FS_PlayerBehavior.RecordType.SkillHitTimes or k == FS_PlayerBehavior.RecordType.DeathTimes or k == FS_PlayerBehavior.RecordType.ItemUseTimes or k == FS_PlayerBehavior.RecordType.ItemMakeTimes or k == FS_PlayerBehavior.RecordType.ItemPickUpTimes or k == FS_PlayerBehavior.RecordType.ItemBuyTimes or k == FS_PlayerBehavior.RecordType.KillEnemyTimes then
				for _k, _v in pairs(v) do
					if _temp[_k] == nil then
						_temp[_k] = _v
					else
						_temp[_k] = _temp[_k] + _v
					end
				end

				for _k, _v in pairs(v) do
					_temp2[_k] = _temp[_k]
				end
			elseif k == FS_PlayerBehavior.RecordType.LevelUpTime or k == FS_PlayerBehavior.RecordType.AddPointTime or k == FS_PlayerBehavior.RecordType.QuestCompleteTime or k == FS_PlayerBehavior.RecordType.AddTalentTime then
				for _k, _v in pairs(v) do
					_temp[_k] = _v
				end

				for _k, _v in pairs(v) do
					_temp2[_k] = _v
				end
			end
		end

		self.behaviorList = {}

		for k, v in pairs(timeRecorderList) do
			if self.oldBehaviorList[tostring(k)] == nil then
				self.oldBehaviorList[tostring(k)] = {}
			end

			if self.oldBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] == nil then
				self.oldBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] = {}
			end

			local _temp = self.oldBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)]

			for _k, _v in pairs(v) do
				if _v.duration ~= nil and _temp[tostring(_k)] ~= _v.duration then
					if self.deltaBehaviorList[tostring(k)] == nil then
						self.deltaBehaviorList[tostring(k)] = {}
					end

					if self.deltaBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] == nil then
						self.deltaBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)] = {}
					end

					self.deltaBehaviorList[tostring(k)][tostring(FS_PlayerBehavior.RecordType.PlayDuration)][tostring(_k)] = _v.duration
				end

				_temp[tostring(_k)] = _v.duration
			end
		end

		for k, v in pairs(self.durationList) do
			if self.oldBehaviorList[tostring(k)] == nil then
				self.oldBehaviorList[tostring(k)] = {}
			end

			if self.deltaBehaviorList[tostring(k)] == nil then
				self.deltaBehaviorList[tostring(k)] = {}
			end

			for _k, _v in pairs(v) do
				if self.oldBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.oldBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				if self.deltaBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.deltaBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				local _temp1 = self.oldBehaviorList[tostring(k)][tostring(_k)]
				local _temp2 = self.deltaBehaviorList[tostring(k)][tostring(_k)]

				if _k == FS_PlayerBehavior.RecordType.StageClearDuration then
					if _temp1.duration ~= _v.duration then
						_temp2.duration = _v.duration
					end

					if _v.start_time ~= nil then
						_temp1.start_time = _v.start_time
					end

					_temp1.duration = _v.duration

					if table.nums(_temp2) == 0 then
						self.deltaBehaviorList[tostring(k)][tostring(_k)] = nil
					end
				elseif _k == FS_PlayerBehavior.RecordType.KillBossDuration then
					for __k, __v in pairs(_v) do
						if __v.duration ~= nil then
							if _temp1[__k] == nil then
								_temp1[__k] = {}
							end

							_temp1[__k].duration = __v.duration

							if _temp2[__k] == nil then
								_temp2[__k] = {}
							end

							_temp2[__k].duration = __v.duration
							__v.duration = nil
						end
					end

					if table.nums(_temp2) == 0 then
						self.deltaBehaviorList[tostring(k)][tostring(_k)] = nil
					end
				end
			end
		end

		for k, v in pairs(sanDurationList) do
			if self.oldBehaviorList[tostring(k)] == nil then
				self.oldBehaviorList[tostring(k)] = {}
			end

			if self.deltaBehaviorList[tostring(k)] == nil then
				self.deltaBehaviorList[tostring(k)] = {}
			end

			for _k, _v in pairs(v) do
				if self.oldBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.oldBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				if self.deltaBehaviorList[tostring(k)][tostring(_k)] == nil then
					self.deltaBehaviorList[tostring(k)][tostring(_k)] = {}
				end

				local _temp1 = self.oldBehaviorList[tostring(k)][tostring(_k)]
				local _temp2 = self.deltaBehaviorList[tostring(k)][tostring(_k)]

				if _k == FS_PlayerBehavior.RecordType.InSanDuration then
					for __k, __v in pairs(_v) do
						if __v.start_time ~= nil then
							if __v.duration == nil then
								__v.duration = FS_UserData.story:GetGameTime() - __v.start_time
							else
								__v.duration = FS_UserData.story:GetGameTime() - __v.start_time + __v.duration
							end

							__v.start_time = FS_UserData.story:GetGameTime()
						end

						if __v.duration ~= nil and (_temp1[tostring(__k)] == nil or _temp1[tostring(__k)].duration ~= __v.duration) then
							if _temp2[tostring(__k)] == nil then
								_temp2[tostring(__k)] = {}
							end

							_temp2[tostring(__k)].duration = __v.duration
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

					if table.nums(_temp2) == 0 then
						self.deltaBehaviorList[tostring(k)][tostring(_k)] = nil
					end
				end
			end
		end

		for k, v in pairs(self.deltaBehaviorList) do
			if table.nums(v) == 0 then
				self.deltaBehaviorList[k] = nil
			end
		end

		local ret = {}

		ret.behavior = self.oldBehaviorList

		local ret2 = {}

		if table.nums(self.deltaBehaviorList) == 0 then
			ret2.behavior = nil
		else
			ret2.behavior = self.deltaBehaviorList
		end

		return ret, ret2
	end
end

function FS_PlayerBehavior:Decode(data)
	self.oldBehaviorList = {}

	if data.behavior ~= nil then
		self.oldBehaviorList = data.behavior

		if self.oldBehaviorList ~= nil then
			for k, v in pairs(self.oldBehaviorList) do
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
					elseif tonumber(_k) == FS_PlayerBehavior.RecordType.StageClearDuration then
						if self.durationList[tonumber(k)][tonumber(_k)] == nil then
							self.durationList[tonumber(k)][tonumber(_k)] = {}
						end

						self.durationList[tonumber(k)][tonumber(_k)].start_time = _v.start_time
						self.durationList[tonumber(k)][tonumber(_k)].duration = _v.duration
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
end

function FS_PlayerBehavior:DecodeDelta(data)
	self.deltaBehaviorList = {}

	if data.behavior ~= nil then
		self.deltaBehaviorList = data.behavior
	end
end

function FS_PlayerBehavior:RecordTimes(type, ...)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == false or FS_UserData.story:GetRecordPlayerBehaviorOff() then
		return
	end

	local arg = {
		...
	}

	if self.behaviorList[type] == nil then
		self.behaviorList[type] = {}
	end

	local behavior = self.behaviorList[type]

	if type == FS_PlayerBehavior.RecordType.SkillHitTimes or type == FS_PlayerBehavior.RecordType.DeathTimes then
		local key = arg[1] .. "_" .. arg[2] .. "_" .. arg[3]

		if behavior[key] == nil then
			behavior[key] = 1
		else
			behavior[key] = behavior[key] + 1
		end
	elseif type == FS_PlayerBehavior.RecordType.SkillCastTimes then
		local key = arg[1] .. "_" .. arg[2]

		if behavior[key] == nil then
			behavior[key] = 1
		else
			behavior[key] = behavior[key] + 1
		end
	elseif type == FS_PlayerBehavior.RecordType.ItemUseTimes or type == FS_PlayerBehavior.RecordType.ItemMakeTimes or type == FS_PlayerBehavior.RecordType.ItemPickUpTimes then
		local key = arg[1]

		if behavior[tostring(key)] == nil then
			behavior[tostring(key)] = arg[2]
		else
			behavior[tostring(key)] = behavior[tostring(key)] + arg[2]
		end
	elseif type == FS_PlayerBehavior.RecordType.ItemBuyTimes then
		local key = arg[1] .. "_" .. arg[2]

		if behavior[tostring(key)] == nil then
			behavior[tostring(key)] = arg[3]
		else
			behavior[tostring(key)] = behavior[tostring(key)] + arg[3]
		end
	elseif type == FS_PlayerBehavior.RecordType.KillEnemyTimes then
		local key = arg[1] .. "_" .. arg[2]

		if behavior[key] == nil then
			behavior[key] = 1
		else
			behavior[key] = behavior[key] + 1
		end
	elseif type == FS_PlayerBehavior.RecordType.LevelUpTime then
		local key = arg[1]

		behavior[tostring(key)] = arg[2]
	elseif type == FS_PlayerBehavior.RecordType.AddPointTime then
		local key = arg[1] .. "_" .. arg[2] .. "_" .. arg[3]

		behavior[key] = arg[4]
	elseif type == FS_PlayerBehavior.RecordType.QuestCompleteTime then
		local key = arg[1]

		behavior[tostring(key)] = arg[2]
	elseif type == FS_PlayerBehavior.RecordType.AddTalentTime then
		local key = arg[1] .. "_" .. arg[2]

		behavior[key] = arg[3]
	end
end

function FS_PlayerBehavior:RecordDurationByQuest(qId)
	if table.contains(FS_PlayerBehavior.StageStartQuest, qId) then
		self:RecordDuration(FS_PlayerBehavior.RecordType.StageClearDuration, true)
	elseif table.contains(FS_PlayerBehavior.StageClearQuest, qId) then
		self:RecordDuration(FS_PlayerBehavior.RecordType.StageClearDuration, false)
	end

	if FS_PlayerBehavior.BossKillIdList[qId] ~= nil then
		self:RecordDuration(FS_PlayerBehavior.RecordType.KillBossDuration, true, FS_PlayerBehavior.BossKillIdList[qId])
	end
end

function FS_PlayerBehavior:RecordDurationByBossId(id)
	if table.contains(FS_PlayerBehavior.BossKillIdList, id) then
		self:RecordDuration(FS_PlayerBehavior.RecordType.KillBossDuration, false, id)
	end
end

function FS_PlayerBehavior:RecordDuration(type, isStart, ...)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == false or FS_UserData.story:GetRecordPlayerBehaviorOff() then
		return
	end

	local arg = {
		...
	}

	if self.durationList[FS_UserData.story:GetStoryId()] == nil then
		self.durationList[FS_UserData.story:GetStoryId()] = {}
	end

	if self.durationList[FS_UserData.story:GetStoryId()][type] == nil then
		self.durationList[FS_UserData.story:GetStoryId()][type] = {}
	end

	local temp = self.durationList[FS_UserData.story:GetStoryId()][type]

	if type == FS_PlayerBehavior.RecordType.KillBossDuration then
		if temp[tostring(arg[1])] == nil then
			temp[tostring(arg[1])] = {}
		end

		if isStart then
			temp[tostring(arg[1])].start_time = FS_UserData.story:GetGameTime()
		elseif temp[tostring(arg[1])].start_time ~= nil and temp.duration == nil then
			temp[tostring(arg[1])].duration = FS_UserData.story:GetGameTime() - temp[tostring(arg[1])].start_time
		end
	elseif type == FS_PlayerBehavior.RecordType.StageClearDuration then
		if isStart then
			if temp.start_time == nil then
				temp.start_time = FS_UserData.story:GetGameTime()
			end
		elseif temp.start_time ~= nil and temp.duration == nil then
			temp.duration = FS_UserData.story:GetGameTime() - temp.start_time
		end
	elseif type == FS_PlayerBehavior.RecordType.InSanDuration then
		if temp[tostring(arg[1])] == nil then
			temp[tostring(arg[1])] = {}
		end

		if isStart then
			if temp[tostring(arg[1])].start_time == nil then
				temp[tostring(arg[1])].start_time = FS_UserData.story:GetGameTime()
			end
		elseif temp[tostring(arg[1])].start_time ~= nil then
			if temp[tostring(arg[1])].duration == nil then
				temp[tostring(arg[1])].duration = FS_UserData.story:GetGameTime() - temp[tostring(arg[1])].start_time
			else
				temp[tostring(arg[1])].duration = FS_UserData.story:GetGameTime() - temp[tostring(arg[1])].start_time + temp[tostring(arg[1])].duration
			end

			temp[tostring(arg[1])].start_time = nil
		end
	end
end

function FS_PlayerBehavior:ResetSanDurationStartTime()
	for k, v in pairs(self.durationList) do
		for _k, _v in pairs(v) do
			if _k == FS_PlayerBehavior.RecordType.InSanDuration then
				for __k, __v in pairs(_v) do
					_v[__k].start_time = nil
				end
			end
		end
	end
end

return FS_PlayerBehavior
