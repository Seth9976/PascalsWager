-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Challenge.lua

FS_Challenge = class("FS_Challenge")
FS_Challenge.static.requestCD = 15

function FS_Challenge:initialize()
	self.challengeRecordList = {}
	self.bossPerfectList = {}
	self.rankList = {}
	self.rankRequireCDList = {}
	self.selfRankList = {}
	self.challengeRecordTempList = {}
	self.bossPerfectTempList = {}
	self.getRankInfoCD = 0
	self.isInChangeMode = false
	self.saveSlot = 1
	self.gameMode = 1
	self.level = 1
	self.heroSelect = 1
	self.monsterIndex = 1
end

function FS_Challenge:Clear()
	self.challengeRecordList = nil
	self.rankList = nil
	self.bossPerfectList = nil
	self.rankRequireCDList = nil
	self.selfRankList = nil
	self.challengeRecordTempList = nil
	self.bossPerfectTempList = nil
end

function FS_Challenge:Reset()
	self:Clear()
	self:initialize()
end

function FS_Challenge:Encode()
	local ret = {}

	ret.challenge = {}

	for level, v in pairs(self.challengeRecordList) do
		for heroId, _v in pairs(v) do
			if ret.challenge[tostring(level)] == nil then
				ret.challenge[tostring(level)] = {}
			end

			for monsterId, __v in pairs(_v) do
				if ret.challenge[tostring(level)][tostring(heroId)] == nil then
					ret.challenge[tostring(level)][tostring(heroId)] = {}
				end

				ret.challenge[tostring(level)][tostring(heroId)][tostring(monsterId)] = {}
				ret.challenge[tostring(level)][tostring(heroId)][tostring(monsterId)].time = __v.time
				ret.challenge[tostring(level)][tostring(heroId)][tostring(monsterId)].perfect = __v.perfect

				if __v.historyHeroPerfect == nil then
					__v.historyHeroPerfect = __v.perfect
				end

				ret.challenge[tostring(level)][tostring(heroId)][tostring(monsterId)].historyHeroPerfect = __v.historyHeroPerfect
			end
		end
	end

	ret.boss_perfect = {}

	for level, v in pairs(self.bossPerfectList) do
		for monsterId, _v in pairs(v) do
			if ret.boss_perfect[tostring(level)] == nil then
				ret.boss_perfect[tostring(level)] = {}
			end

			ret.boss_perfect[tostring(level)][tostring(monsterId)] = {}
			ret.boss_perfect[tostring(level)][tostring(monsterId)].history_perfect = _v.historyPerfect
		end
	end

	return ret
end

function FS_Challenge:Decode(data)
	self.challengeRecordList = {}

	if data.challenge ~= nil then
		for level, v in pairs(data.challenge) do
			for heroId, _v in pairs(v) do
				if self.challengeRecordList[tonumber(level)] == nil then
					self.challengeRecordList[tonumber(level)] = {}
				end

				for monsterId, __v in pairs(_v) do
					if self.challengeRecordList[tonumber(level)][tonumber(heroId)] == nil then
						self.challengeRecordList[tonumber(level)][tonumber(heroId)] = {}
					end

					self.challengeRecordList[tonumber(level)][tonumber(heroId)][tonumber(monsterId)] = {}
					self.challengeRecordList[tonumber(level)][tonumber(heroId)][tonumber(monsterId)].time = __v.time
					self.challengeRecordList[tonumber(level)][tonumber(heroId)][tonumber(monsterId)].perfect = __v.perfect

					if __v.historyHeroPerfect == nil then
						__v.historyHeroPerfect = __v.perfect
					end

					self.challengeRecordList[tonumber(level)][tonumber(heroId)][tonumber(monsterId)].historyHeroPerfect = __v.historyHeroPerfect
				end
			end
		end
	end

	self.bossPerfectList = {}

	if data.boss_perfect ~= nil then
		for level, v in pairs(data.boss_perfect) do
			for monsterId, _v in pairs(v) do
				if self.bossPerfectList[tonumber(level)] == nil then
					self.bossPerfectList[tonumber(level)] = {}
				end

				self.bossPerfectList[tonumber(level)][tonumber(monsterId)] = {}
				self.bossPerfectList[tonumber(level)][tonumber(monsterId)].historyPerfect = _v.history_perfect
			end
		end
	end
end

function FS_Challenge:SetChallengeRecord(level, heroId, monsterId, time, perfect)
	if self.challengeRecordList[level] == nil then
		self.challengeRecordList[level] = {}
	end

	if self.challengeRecordList[level][heroId] == nil then
		self.challengeRecordList[level][heroId] = {}
	end

	if self.challengeRecordList[level][heroId][monsterId] == nil then
		self.challengeRecordList[level][heroId][monsterId] = {}
		self.challengeRecordList[level][heroId][monsterId].time = time
		self.challengeRecordList[level][heroId][monsterId].perfect = perfect
	elseif time < self.challengeRecordList[level][heroId][monsterId].time then
		self.challengeRecordList[level][heroId][monsterId].time = time
		self.challengeRecordList[level][heroId][monsterId].perfect = perfect
	end

	if perfect == 1 then
		self.challengeRecordList[level][heroId][monsterId].historyHeroPerfect = 1
	elseif self.challengeRecordList[level][heroId][monsterId].historyHeroPerfect ~= 1 then
		self.challengeRecordList[level][heroId][monsterId].historyHeroPerfect = self.challengeRecordList[level][heroId][monsterId].perfect
	end

	LS_Challenge.Update()
end

function FS_Challenge:SetBossPerfect(level, monsterId, perfect)
	if self.bossPerfectList[level] == nil then
		self.bossPerfectList[level] = {}
	end

	if self.bossPerfectList[level][monsterId] == nil then
		self.bossPerfectList[level][monsterId] = {}
	end

	if self.bossPerfectList[level][monsterId].historyPerfect ~= 1 then
		self.bossPerfectList[level][monsterId].historyPerfect = perfect
	end

	LS_Challenge.Update()
end

function FS_Challenge:GetChallengeRecord(level, heroId, monsterId)
	if self.challengeRecordList[level] ~= nil and self.challengeRecordList[level][heroId] ~= nil and self.challengeRecordList[level][heroId][monsterId] ~= nil then
		return self.challengeRecordList[level][heroId][monsterId]
	end

	return nil
end

function FS_Challenge:GetFastChallengeRecordHeroId(level, monsterId)
	local fastHeroId = 0

	if self.challengeRecordList[level] ~= nil then
		local fastTime

		for heroId, v in pairs(self.challengeRecordList[level]) do
			if v[monsterId] ~= nil and (fastTime == nil or fastTime > v[monsterId].time) then
				fastTime = v[monsterId].time
				fastHeroId = heroId
			end
		end
	end

	return fastHeroId
end

function FS_Challenge:IsFastRecord(level, heroId, monsterId)
	local fastHeroId = self:GetFastChallengeRecordHeroId(level, monsterId)

	if fastHeroId == heroId then
		return true
	end

	return false
end

function FS_Challenge:GetTotalScore(level)
	local totalScore = 0

	if self.challengeRecordList[level] ~= nil then
		local monsterIdList = MS_StoryChallenge.GetHeroIdList()

		for i, monsterId in pairs(monsterIdList) do
			local fastHeroId = self:GetFastChallengeRecordHeroId(level, monsterId)

			if fastHeroId ~= 0 then
				local fastRecord = self:GetChallengeRecord(level, fastHeroId, monsterId)
				local S = self:GetScore(fastRecord.time, monsterId)

				totalScore = totalScore + S
			end
		end
	end

	return totalScore
end

function FS_Challenge:GetScore(time, monsterId)
	local challengeData = MS_StoryChallenge.GetDataByHeroId(monsterId)
	local S = math.floor(-time * challengeData.ScoreMax / challengeData.TimeLimit + challengeData.ScoreMax)

	if S < 0 then
		S = 0
	end

	return S
end

function FS_Challenge:GetIsHistoryPerfect(level, monsterId)
	if self.bossPerfectList[level] ~= nil and self.bossPerfectList[level][monsterId] ~= nil then
		return self.bossPerfectList[level][monsterId].historyPerfect
	end

	return 0
end

function FS_Challenge:SetRankInfo(level, monsterId)
	local fastHeroId = self:GetFastChallengeRecordHeroId(level, monsterId)

	if fastHeroId == 0 then
		return
	end

	local bossData = {}

	bossData[level .. "_" .. monsterId] = {}
	bossData[level .. "_" .. monsterId].perfect = self:GetIsHistoryPerfect(level, monsterId)

	for i = 10001, 10005 do
		local tchallengeData = self:GetChallengeRecord(level, i, monsterId)

		if tchallengeData ~= nil then
			if bossData[level .. "_" .. monsterId].heroList == nil then
				bossData[level .. "_" .. monsterId].heroList = {}
			end

			bossData[level .. "_" .. monsterId].heroList[tostring(i)] = {}
			bossData[level .. "_" .. monsterId].heroList[tostring(i)].score = self:GetScore(tchallengeData.time, monsterId)
			bossData[level .. "_" .. monsterId].heroList[tostring(i)].extraData = tostring(i) .. "|" .. tchallengeData.time .. "|" .. tchallengeData.perfect .. "|" .. tchallengeData.historyHeroPerfect
		end
	end

	local dataStr = json.encode(bossData)

	SdkHelper.SetRankInfo(dataStr, function(isSuccess, errCode, resJson)
		SystemHelper.LogError("测试上传boss挑战数据: " .. tostring(isSuccess) .. "  errCode:" .. tostring(errCode) .. "  json:" .. tostring(resJson))
	end)
end

function FS_Challenge:GetRankList(level, monsterId)
	if self.rankList[level] == nil then
		self.rankList[level] = {}
	end

	if self.rankList[level][monsterId] == nil then
		self.rankList[level][monsterId] = {}
	end

	return self.rankList[level][monsterId]
end

function FS_Challenge:GetSelfRank(level, monsterId)
	if self.selfRankList[level] == nil then
		self.selfRankList[level] = {}
	end

	if self.selfRankList[level][monsterId] == nil then
		self.selfRankList[level][monsterId] = {}
	end

	return self.selfRankList[level][monsterId]
end

function FS_Challenge:LoadRankList(level, CB)
	if self.rankRequireCDList[level] ~= nil and os.time() < self.rankRequireCDList[level] then
		CB()
	else
		self.rankRequireCDList[level] = os.time() + FS_Challenge.requestCD

		UIManager.SendMessage("Loading", "SimpleLoading", true)
		SdkHelper.GetRankList(tostring(level), function(isSuccess, resJson)
			if isSuccess then
				local rankData = json.decode(resJson)

				SystemHelper.LogError("测试获取排行榜: " .. tostring(isSuccess) .. "  json:" .. tostring(resJson))

				if rankData.success == true then
					for k, v in pairs(rankData.result.list) do
						local idlist = StringHelper.Split(k, "_")
						local tlevel = tonumber(idlist[1])
						local tmonsterId = tonumber(idlist[2])

						if tmonsterId == nil then
							tmonsterId = 999999
						end

						if self.rankList[tlevel] == nil then
							self.rankList[tlevel] = {}
						end

						self.rankList[tlevel][tmonsterId] = json.decode(v.list)

						if self.selfRankList[tlevel] == nil then
							self.selfRankList[tlevel] = {}
						end

						if self.selfRankList[tlevel][tmonsterId] == nil then
							self.selfRankList[tlevel][tmonsterId] = {}
						end

						self.selfRankList[tlevel][tmonsterId].rank = tonumber(v.rank)
						self.selfRankList[tlevel][tmonsterId].extraData = v.bestData
						self.selfRankList[tlevel][tmonsterId].score = v.score
					end
				end
			end

			CB()
			UIManager.SendMessage("Loading", "SimpleLoading", false)
		end)
	end
end

function FS_Challenge:SyncChallenge()
	if os.time() > self.getRankInfoCD then
		self.getRankInfoCD = os.time() + FS_Challenge.requestCD

		SdkHelper.GetRankInfo(function(result, jsonStr)
			if result == true then
				local challengeData = json.decode(jsonStr)

				if challengeData.success == true then
					self.challengeRecordTempList = {}
					self.bossPerfectTempList = {}

					SystemHelper.LogError("[ ChallengeCtrl.GetChallenge: " .. tostring(result) .. ", json: " .. jsonStr)

					for k, v in pairs(challengeData.result) do
						local idlist = StringHelper.Split(k, "_")
						local tlevel = tonumber(idlist[1])

						if idlist[2] ~= nil then
							local tmonsterId = tonumber(idlist[2])

							if v.perfect == 1 then
								if self.bossPerfectList[tlevel] == nil then
									self.bossPerfectList[tlevel] = {}
								end

								if self.bossPerfectList[tlevel][tmonsterId] == nil then
									self.bossPerfectList[tlevel][tmonsterId] = {}
								end

								if self.bossPerfectTempList[tlevel] == nil then
									self.bossPerfectTempList[tlevel] = {}
								end

								if self.bossPerfectTempList[tlevel][tmonsterId] == nil then
									self.bossPerfectTempList[tlevel][tmonsterId] = {}
								end

								self.bossPerfectTempList[tlevel][tmonsterId].historyPerfect = v.perfect

								if self.bossPerfectList[tlevel][tmonsterId].historyPerfect ~= 1 then
									self.bossPerfectList[tlevel][tmonsterId].historyPerfect = v.perfect
								end
							end

							if v.heroList ~= nil then
								for heroId, _v in pairs(v.heroList) do
									if _v.extraData ~= nil and _v.extraData ~= "" then
										local extraList = StringHelper.Split(_v.extraData, "|")
										local theroId = tonumber(extraList[1])
										local ttime = tonumber(extraList[2])
										local tperfect = tonumber(extraList[3])
										local thistoryHeroPerfect

										if #extraList > 3 then
											thistoryHeroPerfect = tonumber(extraList[4])
										else
											thistoryHeroPerfect = 0
										end

										if self.challengeRecordList[tlevel] == nil then
											self.challengeRecordList[tlevel] = {}
										end

										if self.challengeRecordList[tlevel][theroId] == nil then
											self.challengeRecordList[tlevel][theroId] = {}
										end

										if self.challengeRecordTempList[tlevel] == nil then
											self.challengeRecordTempList[tlevel] = {}
										end

										if self.challengeRecordTempList[tlevel][theroId] == nil then
											self.challengeRecordTempList[tlevel][theroId] = {}
										end

										if self.challengeRecordTempList[tlevel][theroId][tmonsterId] == nil then
											self.challengeRecordTempList[tlevel][theroId][tmonsterId] = {}
											self.challengeRecordTempList[tlevel][theroId][tmonsterId].time = ttime
											self.challengeRecordTempList[tlevel][theroId][tmonsterId].perfect = tperfect
											self.challengeRecordTempList[tlevel][theroId][tmonsterId].historyHeroPerfect = thistoryHeroPerfect
										end

										if self.challengeRecordList[tlevel][theroId][tmonsterId] == nil then
											self.challengeRecordList[tlevel][theroId][tmonsterId] = {}
											self.challengeRecordList[tlevel][theroId][tmonsterId].time = ttime
											self.challengeRecordList[tlevel][theroId][tmonsterId].perfect = tperfect
										elseif ttime < self.challengeRecordList[tlevel][theroId][tmonsterId].time then
											self.challengeRecordList[tlevel][theroId][tmonsterId].time = ttime
											self.challengeRecordList[tlevel][theroId][tmonsterId].perfect = tperfect
										end

										if thistoryHeroPerfect == 1 then
											self.challengeRecordList[tlevel][theroId][tmonsterId].historyHeroPerfect = 1
										elseif self.challengeRecordList[tlevel][theroId][tmonsterId].historyHeroPerfect ~= 1 then
											self.challengeRecordList[tlevel][theroId][tmonsterId].historyHeroPerfect = self.challengeRecordList[tlevel][theroId][tmonsterId].perfect
										end
									end
								end
							end
						end
					end

					LS_Challenge.Update()
					self:SyncChallengeUpdateToServer()
				else
					SystemHelper.LogError("errorCode" .. challengeData.code)
				end
			end
		end)
	end
end

function FS_Challenge:SyncChallengeUpdateToServer()
	local challengeRecordMap = {}

	for level, v in pairs(self.challengeRecordList) do
		for heroId, _v in pairs(v) do
			if self.challengeRecordTempList[level] == nil then
				self.challengeRecordTempList[level] = {}
			end

			for monsterId, __v in pairs(_v) do
				if self.challengeRecordTempList[level][heroId] == nil then
					self.challengeRecordTempList[level][heroId] = {}
				end

				if self.challengeRecordTempList[level][heroId][monsterId] == nil or self.challengeRecordTempList[level][heroId][monsterId].time > __v.time or self.challengeRecordTempList[level][heroId][monsterId].historyHeroPerfect == 0 and __v.historyHeroPerfect == 1 then
					if challengeRecordMap[level] == nil then
						challengeRecordMap[level] = {}
					end

					if table.contains(challengeRecordMap[level], monsterId) == false then
						table.insert(challengeRecordMap[level], monsterId)
					end
				elseif self.challengeRecordTempList[level][heroId][monsterId].time == __v.time and self.challengeRecordTempList[level][heroId][monsterId].perfect == 0 and __v.perfect == 1 then
					if challengeRecordMap[level] == nil then
						challengeRecordMap[level] = {}
					end

					if table.contains(challengeRecordMap[level], monsterId) == false then
						table.insert(challengeRecordMap[level], monsterId)
					end
				end
			end
		end
	end

	for level, v in pairs(self.bossPerfectList) do
		for monsterId, _v in pairs(v) do
			if self.bossPerfectTempList[level] == nil then
				self.bossPerfectTempList[level] = {}
			end

			if self.bossPerfectTempList[level][monsterId] == nil then
				if _v.historyPerfect == 1 then
					if challengeRecordMap[level] == nil then
						challengeRecordMap[level] = {}
					end

					if table.contains(challengeRecordMap[level], monsterId) == false then
						table.insert(challengeRecordMap[level], monsterId)
					end
				end
			elseif (self.bossPerfectTempList[level][monsterId].historyPerfect == nil or self.bossPerfectTempList[level][monsterId].historyPerfect == 0) and _v.historyPerfect == 1 then
				if challengeRecordMap[level] == nil then
					challengeRecordMap[level] = {}
				end

				if table.contains(challengeRecordMap[level], monsterId) == false then
					table.insert(challengeRecordMap[level], monsterId)
				end
			end
		end
	end

	local bossData = {}

	for level, v in pairs(challengeRecordMap) do
		for index, monsterId in pairs(v) do
			local fastHeroId = self:GetFastChallengeRecordHeroId(level, monsterId)

			if fastHeroId ~= 0 then
				bossData[level .. "_" .. monsterId] = {}
				bossData[level .. "_" .. monsterId].perfect = self:GetIsHistoryPerfect(level, monsterId)

				for i = 10001, 10005 do
					local tchallengeData = self:GetChallengeRecord(level, i, monsterId)

					if tchallengeData ~= nil then
						if bossData[level .. "_" .. monsterId].heroList == nil then
							bossData[level .. "_" .. monsterId].heroList = {}
						end

						bossData[level .. "_" .. monsterId].heroList[tostring(i)] = {}
						bossData[level .. "_" .. monsterId].heroList[tostring(i)].score = self:GetScore(tchallengeData.time, monsterId)
						bossData[level .. "_" .. monsterId].heroList[tostring(i)].extraData = tostring(i) .. "|" .. tchallengeData.time .. "|" .. tchallengeData.perfect .. "|" .. tchallengeData.historyHeroPerfect
					end
				end
			end
		end
	end

	if table.nums(bossData) > 0 then
		local dataStr = json.encode(bossData)

		SystemHelper.LogError(dataStr)
		SdkHelper.SetRankInfo(dataStr, function(isSuccess, errCode, resJson)
			SystemHelper.LogError("测试上传boss挑战数据: " .. tostring(isSuccess) .. "  errCode:" .. tostring(errCode) .. "  json:" .. tostring(resJson))
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CHALLENGE_SYNC_SUCCESS)
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CHALLENGE_SYNC_SUCCESS)
	end
end

function FS_Challenge:CheckAchievement()
	local notDLCHeroIdList = MS_StoryChallenge.GetAllNotDLCHero()
	local perfectFlag = true
	local n5Flag = true
	local n4Flag = true

	for k, monsterId in pairs(notDLCHeroIdList) do
		local havePerfect = false

		for i = 1, 5 do
			if self.bossPerfectList[i] ~= nil and self.bossPerfectList[i][monsterId] ~= nil and self.bossPerfectList[i][monsterId].historyPerfect == 1 then
				havePerfect = true
			end
		end

		if havePerfect == false then
			perfectFlag = false
		end

		local fastId = self:GetFastChallengeRecordHeroId(5, monsterId)

		if fastId == 0 then
			n5Flag = false
		end

		local fastId2 = self:GetFastChallengeRecordHeroId(4, monsterId)

		if fastId2 == 0 then
			n4Flag = false
		end
	end

	if perfectFlag then
		FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.killAllBossPerfectInCustomMode)
	end

	if n5Flag then
		FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.killAllBossInCustomMode)
	end

	if n4Flag then
		FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.killAllBossInNormalModeVeryHard)
	end
end

function FS_Challenge:SetIsInChallengeMode(bool)
	if not bool then
		self.level = 1
		self.heroSelect = 1
		self.monsterIndex = 1
	end

	self.isInChangeMode = bool
end

function FS_Challenge:GetIsInChallengeMode()
	return self.isInChangeMode
end

function FS_Challenge:SetSaveSlot(index)
	self.saveSlot = index
end

function FS_Challenge:GetSaveSlot()
	return self.saveSlot
end

function FS_Challenge:SetGameMode(mode)
	self.gameMode = mode
end

function FS_Challenge:GetGameMode()
	return self.gameMode
end

function FS_Challenge:SetChallengeLevel(level)
	self.level = level
end

function FS_Challenge:GetChallengeLevel()
	return self.level
end

function FS_Challenge:SetHeroSelect(index)
	self.heroSelect = index
end

function FS_Challenge:GetHeroSelect()
	return self.heroSelect
end

function FS_Challenge:SetMonsterIndex(index)
	self.monsterIndex = index
end

function FS_Challenge:GetMonsterIndex()
	return self.monsterIndex
end

return FS_Challenge
