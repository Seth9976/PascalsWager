-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Arcade.lua

FS_Arcade = class("FS_Arcade")
FS_Arcade.static.requestCD = 15
FS_Arcade.static.SelectStageTotalStoryId = 9999
FS_Arcade.static.NewGameTotalStoryId = 10080
FS_Arcade.static.StageTotalHeroId = 99999
FS_Arcade.static.ScoreA = 20000
FS_Arcade.static.ScoreB = 10000
FS_Arcade.static.StoryIdList = {
	9999,
	10080,
	1001,
	1002,
	1003,
	1005,
	1004,
	1006,
	1007,
	1008,
	2001,
	2002,
	2003,
	2004
}

function FS_Arcade:initialize()
	self.arcadeRecordList = {}
	self.rankList = {}
	self.rankRequireCDList = {}
	self.selfRankList = {}
	self.arcadeRecordTempList = {}
	self.getRankInfoCD = 0
end

function FS_Arcade:Clear()
	return
end

function FS_Arcade:Reset()
	self:Clear()
	self:initialize()
end

function FS_Arcade:Encode()
	local ret = {}

	ret.arcade = {}

	for level, v in pairs(self.arcadeRecordList) do
		for heroId, _v in pairs(v) do
			if ret.arcade[tostring(level)] == nil then
				ret.arcade[tostring(level)] = {}
			end

			for storyId, __v in pairs(_v) do
				if ret.arcade[tostring(level)][tostring(heroId)] == nil then
					ret.arcade[tostring(level)][tostring(heroId)] = {}
				end

				ret.arcade[tostring(level)][tostring(heroId)][tostring(storyId)] = {}
				ret.arcade[tostring(level)][tostring(heroId)][tostring(storyId)].time = __v.time
				ret.arcade[tostring(level)][tostring(heroId)][tostring(storyId)].killScore = __v.killScore
				ret.arcade[tostring(level)][tostring(heroId)][tostring(storyId)].totalScore = __v.totalScore
				ret.arcade[tostring(level)][tostring(heroId)][tostring(storyId)].killCount = __v.killCount
				ret.arcade[tostring(level)][tostring(heroId)][tostring(storyId)].levelPoint = __v.levelPoint
			end
		end
	end

	return ret
end

function FS_Arcade:Decode(data)
	self.arcadeRecordList = {}

	if data.arcade ~= nil then
		for level, v in pairs(data.arcade) do
			for heroId, _v in pairs(v) do
				if self.arcadeRecordList[tonumber(level)] == nil then
					self.arcadeRecordList[tonumber(level)] = {}
				end

				for storyId, __v in pairs(_v) do
					if self.arcadeRecordList[tonumber(level)][tonumber(heroId)] == nil then
						self.arcadeRecordList[tonumber(level)][tonumber(heroId)] = {}
					end

					self.arcadeRecordList[tonumber(level)][tonumber(heroId)][tonumber(storyId)] = {}
					self.arcadeRecordList[tonumber(level)][tonumber(heroId)][tonumber(storyId)].time = __v.time
					self.arcadeRecordList[tonumber(level)][tonumber(heroId)][tonumber(storyId)].killScore = __v.killScore
					self.arcadeRecordList[tonumber(level)][tonumber(heroId)][tonumber(storyId)].totalScore = __v.totalScore
					self.arcadeRecordList[tonumber(level)][tonumber(heroId)][tonumber(storyId)].killCount = __v.killCount
					self.arcadeRecordList[tonumber(level)][tonumber(heroId)][tonumber(storyId)].levelPoint = __v.levelPoint
				end
			end
		end
	end
end

function FS_Arcade:SetArcadeRecord(level, heroId, storyId, time, killScore, totalScore, killCount, levelPoint)
	if self.arcadeRecordList[level] == nil then
		self.arcadeRecordList[level] = {}
	end

	if self.arcadeRecordList[level][heroId] == nil then
		self.arcadeRecordList[level][heroId] = {}
	end

	if self.arcadeRecordList[level][heroId][storyId] == nil then
		self.arcadeRecordList[level][heroId][storyId] = {}
		self.arcadeRecordList[level][heroId][storyId].time = time
		self.arcadeRecordList[level][heroId][storyId].killScore = killScore
		self.arcadeRecordList[level][heroId][storyId].totalScore = totalScore
		self.arcadeRecordList[level][heroId][storyId].killCount = killCount
		self.arcadeRecordList[level][heroId][storyId].levelPoint = levelPoint
	elseif totalScore > self.arcadeRecordList[level][heroId][storyId].totalScore then
		self.arcadeRecordList[level][heroId][storyId].time = time
		self.arcadeRecordList[level][heroId][storyId].killScore = killScore
		self.arcadeRecordList[level][heroId][storyId].totalScore = totalScore
		self.arcadeRecordList[level][heroId][storyId].killCount = killCount
		self.arcadeRecordList[level][heroId][storyId].levelPoint = levelPoint
	elseif totalScore == self.arcadeRecordList[level][heroId][storyId].totalScore and time < self.arcadeRecordList[level][heroId][storyId].time then
		self.arcadeRecordList[level][heroId][storyId].time = time
		self.arcadeRecordList[level][heroId][storyId].killScore = killScore
		self.arcadeRecordList[level][heroId][storyId].totalScore = totalScore
		self.arcadeRecordList[level][heroId][storyId].killCount = killCount
		self.arcadeRecordList[level][heroId][storyId].levelPoint = levelPoint
	end

	LS_Arcade.Update()
end

function FS_Arcade:CheckTotalRecord(level)
	if self.arcadeRecordList[level] == nil then
		return false
	end

	local totalScore = 0
	local totalTime = 0
	local totalKillScore = 0
	local totalKillCount = 0
	local totalScoreLevelPoint = 0
	local recordCount = 0

	for i = 1001, FS_SaveStory.ArcadeStoryIdMax do
		local ret = self:GetHighestScoreArcadeRecordHeroId(level, i)

		if ret ~= 0 then
			recordCount = recordCount + 1

			local record = self:GetArcadeRecord(level, ret, i)

			totalScore = totalScore + record.totalScore
			totalTime = totalTime + record.time
			totalKillScore = totalKillScore + record.killScore
			totalKillCount = totalKillCount + record.killCount
			totalScoreLevelPoint = totalScoreLevelPoint + record.levelPoint
		end
	end

	for i = 2001, 2004 do
		local ret = self:GetHighestScoreArcadeRecordHeroId(level, i)

		if ret ~= 0 then
			recordCount = recordCount + 1

			local record = self:GetArcadeRecord(level, ret, i)

			totalScore = totalScore + record.totalScore
			totalTime = totalTime + record.time
			totalKillScore = totalKillScore + record.killScore
			totalKillCount = totalKillCount + record.killCount
			totalScoreLevelPoint = totalScoreLevelPoint + record.levelPoint
		end
	end

	if recordCount == 0 then
		return false
	end

	local averageLevelPoint = math.floor(totalScoreLevelPoint / recordCount)
	local lastRecord = self:GetArcadeRecord(level, FS_Arcade.StageTotalHeroId, FS_Arcade.SelectStageTotalStoryId)

	if lastRecord == nil or lastRecord.totalScore == nil or totalScore > lastRecord.totalScore then
		self:SetArcadeRecord(level, FS_Arcade.StageTotalHeroId, FS_Arcade.SelectStageTotalStoryId, totalTime, totalKillScore, totalScore, totalKillCount, averageLevelPoint)

		return true
	end

	return false
end

function FS_Arcade:GetArcadeRecord(level, heroId, storyId)
	if self.arcadeRecordList[level] ~= nil and self.arcadeRecordList[level][heroId] ~= nil and self.arcadeRecordList[level][heroId][storyId] ~= nil then
		local record = self.arcadeRecordList[level][heroId][storyId]

		if record.killCount == nil then
			record.killCount = 0
		end

		if record.levelPoint == nil then
			record.levelPoint = 1
		end

		return record
	end

	return nil
end

function FS_Arcade:GetArcadeRecordForStoryList(heroId, level)
	local retList = {}

	for k, storyId in pairs(FS_Arcade.StoryIdList) do
		local record = self:GetArcadeRecord(level, heroId, storyId)

		if record ~= nil then
			local storySingleList = {}

			storySingleList.time = record.time
			storySingleList.totalScore = record.totalScore
			storySingleList.killScore = record.killScore
			storySingleList.killCount = record.killCount
			storySingleList.levelPoint = record.levelPoint
			storySingleList.storyId = storyId

			table.insert(retList, storySingleList)
		end
	end

	return retList
end

function FS_Arcade:GetHighestScoreArcadeRecordHeroId(level, storyId)
	local HighestScoreHeroId = 0

	if self.arcadeRecordList[level] ~= nil then
		local HighestScore, HighestTime

		for heroId, v in pairs(self.arcadeRecordList[level]) do
			if v[storyId] ~= nil then
				if HighestScore == nil or HighestScore < v[storyId].totalScore then
					HighestScore = v[storyId].totalScore
					HighestTime = v[storyId].time
					HighestScoreHeroId = heroId
				elseif v[storyId].totalScore == HighestScore and HighestTime > v[storyId].time then
					HighestScore = v[storyId].totalScore
					HighestTime = v[storyId].time
					HighestScoreHeroId = heroId
				end
			end
		end
	end

	return HighestScoreHeroId
end

function FS_Arcade:IsHighestRecord(level, heroId, storyId)
	local HighestScoreHeroId = self:GetHighestScoreArcadeRecordHeroId(level, storyId)

	if HighestScoreHeroId == heroId then
		return true
	end

	return false
end

function FS_Arcade:GetRankCompareEveryFinish(level, storyId, totalScore, CB)
	local type = tostring(level) .. "_" .. storyId

	SdkHelper.SearchArcadeRankInfo(type, totalScore, function(isSuccess, resJson)
		SystemHelper.LogError("Arcade 百分比数据: " .. tostring(isSuccess) .. "  json:" .. tostring(resJson))

		if isSuccess then
			local resultData = json.decode(resJson)

			if resultData.success == true then
				CB(resultData.result.rank)
			end
		end
	end)
end

function FS_Arcade:SetRankInfo(level, storyIdList)
	local bossData = {}

	for _, storyId in pairs(storyIdList) do
		local fastHeroId = self:GetHighestScoreArcadeRecordHeroId(level, storyId)

		if fastHeroId ~= 0 then
			bossData[level .. "_" .. storyId] = {}

			if fastHeroId == FS_Arcade.StageTotalHeroId then
				local tArcadeData = self:GetArcadeRecord(level, fastHeroId, storyId)

				if tArcadeData ~= nil then
					if bossData[level .. "_" .. storyId].heroList == nil then
						bossData[level .. "_" .. storyId].heroList = {}
					end

					bossData[level .. "_" .. storyId].heroList[tostring(fastHeroId)] = {}
					bossData[level .. "_" .. storyId].heroList[tostring(fastHeroId)].score = tArcadeData.totalScore
					bossData[level .. "_" .. storyId].heroList[tostring(fastHeroId)].extraData = tostring(fastHeroId) .. "|" .. tArcadeData.time .. "|" .. tArcadeData.killScore .. "|" .. tArcadeData.killCount .. "|" .. tArcadeData.levelPoint
				end
			end

			for i = 10001, 10007 do
				if i ~= 10006 then
					local tArcadeData = self:GetArcadeRecord(level, i, storyId)

					if tArcadeData ~= nil then
						if bossData[level .. "_" .. storyId].heroList == nil then
							bossData[level .. "_" .. storyId].heroList = {}
						end

						bossData[level .. "_" .. storyId].heroList[tostring(i)] = {}
						bossData[level .. "_" .. storyId].heroList[tostring(i)].score = tArcadeData.totalScore
						bossData[level .. "_" .. storyId].heroList[tostring(i)].extraData = tostring(i) .. "|" .. tArcadeData.time .. "|" .. tArcadeData.killScore .. "|" .. tArcadeData.killCount .. "|" .. tArcadeData.levelPoint
					end
				end
			end
		end
	end

	if table.nums(bossData) == 0 then
		return
	end

	local dataStr = json.encode(bossData)

	SystemHelper.LogError(dataStr)
	SdkHelper.SetArcadeRankInfo(dataStr, function(isSuccess, errCode, resJson)
		SystemHelper.LogError("测试上传Arcade数据: " .. tostring(isSuccess) .. "  errCode:" .. tostring(errCode) .. "  json:" .. tostring(resJson))
	end)
end

function FS_Arcade:GetRankList(level, storyId)
	if self.rankList[level] == nil then
		self.rankList[level] = {}
	end

	if self.rankList[level][storyId] == nil then
		self.rankList[level][storyId] = {}
	end

	return self.rankList[level][storyId]
end

function FS_Arcade:GetSelfRank(level, storyId)
	if self.selfRankList[level] == nil then
		self.selfRankList[level] = {}
	end

	if self.selfRankList[level][storyId] == nil then
		self.selfRankList[level][storyId] = {}
	end

	return self.selfRankList[level][storyId]
end

function FS_Arcade:LoadRankList(level, CB)
	if self.rankRequireCDList[level] ~= nil and os.time() < self.rankRequireCDList[level] then
		CB()
	else
		self.rankRequireCDList[level] = os.time() + FS_Arcade.requestCD

		UIManager.SendMessage("Loading", "SimpleLoading", true)
		SdkHelper.GetArcadeRankList(tostring(level), function(isSuccess, resJson)
			if isSuccess then
				local rankData = json.decode(resJson)

				SystemHelper.LogError("测试获取Arcade排行榜: " .. tostring(isSuccess) .. "  json:" .. tostring(resJson))

				if rankData.success == true then
					for k, v in pairs(rankData.result.list) do
						local idlist = StringHelper.Split(k, "_")
						local tlevel = tonumber(idlist[1])
						local tstoryId = tonumber(idlist[2])

						if self.rankList[tlevel] == nil then
							self.rankList[tlevel] = {}
						end

						self.rankList[tlevel][tstoryId] = json.decode(v.list)

						if self.selfRankList[tlevel] == nil then
							self.selfRankList[tlevel] = {}
						end

						if self.selfRankList[tlevel][tstoryId] == nil then
							self.selfRankList[tlevel][tstoryId] = {}
						end

						self.selfRankList[tlevel][tstoryId].rank = tonumber(v.rank)
						self.selfRankList[tlevel][tstoryId].extraData = v.bestData
						self.selfRankList[tlevel][tstoryId].score = v.score
					end
				end
			end

			CB()
			UIManager.SendMessage("Loading", "SimpleLoading", false)
		end)
	end
end

function FS_Arcade:SyncArcade()
	if os.time() > self.getRankInfoCD then
		self.getRankInfoCD = os.time() + FS_Arcade.requestCD

		SdkHelper.GetArcadeRankInfo(function(result, jsonStr)
			if result == true then
				local ArcadeData = json.decode(jsonStr)

				if ArcadeData.success == true then
					self.arcadeRecordTempList = {}

					SystemHelper.LogError("[ ArcadeCtrl.GetArcade: " .. tostring(result) .. ", json: " .. jsonStr)

					for k, v in pairs(ArcadeData.result) do
						local idlist = StringHelper.Split(k, "_")
						local tlevel = tonumber(idlist[1])

						if idlist[2] ~= nil then
							local tstoryId = tonumber(idlist[2])

							if v.heroList ~= nil then
								for heroId, _v in pairs(v.heroList) do
									if _v.extraData ~= nil and _v.extraData ~= "" then
										local extraList = StringHelper.Split(_v.extraData, "|")
										local ttotalScore = _v.score
										local theroId = tonumber(extraList[1])
										local ttime = tonumber(extraList[2])
										local tkillScore = tonumber(extraList[3])
										local tkillCount = tonumber(extraList[4])
										local tlevelPoint = tonumber(extraList[5])

										if self.arcadeRecordList[tlevel] == nil then
											self.arcadeRecordList[tlevel] = {}
										end

										if self.arcadeRecordList[tlevel][theroId] == nil then
											self.arcadeRecordList[tlevel][theroId] = {}
										end

										if self.arcadeRecordTempList[tlevel] == nil then
											self.arcadeRecordTempList[tlevel] = {}
										end

										if self.arcadeRecordTempList[tlevel][theroId] == nil then
											self.arcadeRecordTempList[tlevel][theroId] = {}
										end

										if self.arcadeRecordTempList[tlevel][theroId][tstoryId] == nil then
											self.arcadeRecordTempList[tlevel][theroId][tstoryId] = {}
											self.arcadeRecordTempList[tlevel][theroId][tstoryId].time = ttime
											self.arcadeRecordTempList[tlevel][theroId][tstoryId].totalScore = ttotalScore
											self.arcadeRecordTempList[tlevel][theroId][tstoryId].killScore = tkillScore
											self.arcadeRecordTempList[tlevel][theroId][tstoryId].killCount = tkillCount
											self.arcadeRecordTempList[tlevel][theroId][tstoryId].levelPoint = tlevelPoint
										end

										if self.arcadeRecordList[tlevel][theroId][tstoryId] == nil then
											self.arcadeRecordList[tlevel][theroId][tstoryId] = {}
											self.arcadeRecordList[tlevel][theroId][tstoryId].time = ttime
											self.arcadeRecordList[tlevel][theroId][tstoryId].totalScore = ttotalScore
											self.arcadeRecordList[tlevel][theroId][tstoryId].killScore = tkillScore
											self.arcadeRecordList[tlevel][theroId][tstoryId].killCount = tkillCount
											self.arcadeRecordList[tlevel][theroId][tstoryId].levelPoint = tlevelPoint
										elseif ttotalScore > self.arcadeRecordList[tlevel][theroId][tstoryId].totalScore then
											self.arcadeRecordList[tlevel][theroId][tstoryId].time = ttime
											self.arcadeRecordList[tlevel][theroId][tstoryId].totalScore = ttotalScore
											self.arcadeRecordList[tlevel][theroId][tstoryId].killScore = tkillScore
											self.arcadeRecordList[tlevel][theroId][tstoryId].killCount = tkillCount
											self.arcadeRecordList[tlevel][theroId][tstoryId].levelPoint = tlevelPoint
										elseif ttotalScore == self.arcadeRecordList[tlevel][theroId][tstoryId].totalScore and ttime < self.arcadeRecordList[tlevel][theroId][tstoryId].time then
											self.arcadeRecordList[tlevel][theroId][tstoryId].time = ttime
											self.arcadeRecordList[tlevel][theroId][tstoryId].totalScore = ttotalScore
											self.arcadeRecordList[tlevel][theroId][tstoryId].killScore = tkillScore
											self.arcadeRecordList[tlevel][theroId][tstoryId].killCount = tkillCount
											self.arcadeRecordList[tlevel][theroId][tstoryId].levelPoint = tlevelPoint
										end
									end
								end
							end
						end
					end

					LS_Arcade.Update()
					self:SyncArcadeUpdateToServer()
				else
					SystemHelper.LogError("errorCode" .. ArcadeData.code)
				end
			end
		end)
	end
end

function FS_Arcade:SyncArcadeUpdateToServer()
	local arcadeRecordMap = {}

	for level, v in pairs(self.arcadeRecordList) do
		for heroId, _v in pairs(v) do
			if self.arcadeRecordTempList[level] == nil then
				self.arcadeRecordTempList[level] = {}
			end

			for storyId, __v in pairs(_v) do
				if self.arcadeRecordTempList[level][heroId] == nil then
					self.arcadeRecordTempList[level][heroId] = {}
				end

				if self.arcadeRecordTempList[level][heroId][storyId] == nil or self.arcadeRecordTempList[level][heroId][storyId].totalScore < __v.totalScore then
					if arcadeRecordMap[level] == nil then
						arcadeRecordMap[level] = {}
					end

					if table.contains(arcadeRecordMap[level], storyId) == false then
						table.insert(arcadeRecordMap[level], storyId)
					end
				elseif self.arcadeRecordTempList[level][heroId][storyId].totalScore == __v.totalScore and __v.time < self.arcadeRecordTempList[level][heroId][storyId].time then
					if arcadeRecordMap[level] == nil then
						arcadeRecordMap[level] = {}
					end

					if table.contains(arcadeRecordMap[level], storyId) == false then
						table.insert(arcadeRecordMap[level], storyId)
					end
				end
			end
		end
	end

	local bossData = {}

	for level, v in pairs(arcadeRecordMap) do
		for index, storyId in pairs(v) do
			local fastHeroId = self:GetHighestScoreArcadeRecordHeroId(level, storyId)

			if fastHeroId ~= 0 then
				bossData[level .. "_" .. storyId] = {}

				if fastHeroId == FS_Arcade.StageTotalHeroId then
					local tArcadeData = self:GetArcadeRecord(level, fastHeroId, storyId)

					if tArcadeData ~= nil then
						if bossData[level .. "_" .. storyId].heroList == nil then
							bossData[level .. "_" .. storyId].heroList = {}
						end

						bossData[level .. "_" .. storyId].heroList[tostring(fastHeroId)] = {}
						bossData[level .. "_" .. storyId].heroList[tostring(fastHeroId)].score = tArcadeData.totalScore
						bossData[level .. "_" .. storyId].heroList[tostring(fastHeroId)].extraData = tostring(fastHeroId) .. "|" .. tArcadeData.time .. "|" .. tArcadeData.killScore .. "|" .. tArcadeData.killCount .. "|" .. tArcadeData.levelPoint
					end
				end

				for i = 10001, 10007 do
					if i ~= 10006 then
						local tArcadeData = self:GetArcadeRecord(level, i, storyId)

						if tArcadeData ~= nil then
							if bossData[level .. "_" .. storyId].heroList == nil then
								bossData[level .. "_" .. storyId].heroList = {}
							end

							bossData[level .. "_" .. storyId].heroList[tostring(i)] = {}
							bossData[level .. "_" .. storyId].heroList[tostring(i)].score = tArcadeData.totalScore
							bossData[level .. "_" .. storyId].heroList[tostring(i)].extraData = tostring(i) .. "|" .. tArcadeData.time .. "|" .. tArcadeData.killScore .. "|" .. tArcadeData.killCount .. "|" .. tArcadeData.levelPoint
						end
					end
				end
			end
		end
	end

	if table.nums(bossData) > 0 then
		local dataStr = json.encode(bossData)

		SystemHelper.LogError(dataStr)
		SdkHelper.SetArcadeRankInfo(dataStr, function(isSuccess, errCode, resJson)
			SystemHelper.LogError("测试上传Arcade数据: " .. tostring(isSuccess) .. "  errCode:" .. tostring(errCode) .. "  json:" .. tostring(resJson))
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CHALLENGE_SYNC_SUCCESS)
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CHALLENGE_SYNC_SUCCESS)
	end
end

function FS_Arcade:IsGamePassed(level)
	if self.arcadeRecordList[level] ~= nil and self.arcadeRecordList[level][10007] ~= nil and self.arcadeRecordList[level][10007][FS_Arcade.NewGameTotalStoryId] ~= nil and self.arcadeRecordList[level][10007][FS_Arcade.NewGameTotalStoryId].time ~= nil then
		return true
	end

	return false
end

function FS_Arcade:GetOneStageScore(storyId, time, killScore, rank)
	local difficulty = FS_UserData.story:GetArcadePatternForScore()
	local StoryData = MS_StoryList.GetStoryData(storyId)
	local standardTime = StoryData.StandardTime
	local totalKillScore = StoryData["TotalKillScore" .. difficulty]
	local timeScore = math.floor(FS_Arcade.ScoreA / (time / standardTime + 1))

	if timeScore > FS_Arcade.ScoreA then
		timeScore = FS_Arcade.ScoreA
	end

	return timeScore + math.floor(killScore * rank)
end

function FS_Arcade:GetOneStageTimeScore(storyId, time)
	local StoryData = MS_StoryList.GetStoryData(storyId)
	local standardTime = StoryData.StandardTime
	local timeScore = math.floor(FS_Arcade.ScoreA / (time / standardTime + 1))

	if timeScore > FS_Arcade.ScoreA then
		timeScore = FS_Arcade.ScoreA
	end

	return timeScore
end

function FS_Arcade:GetKillScoreEach(storyId, killScore)
	local StoryData = MS_StoryList.GetStoryData(storyId)
	local difficulty = FS_UserData.story:GetArcadePatternForScore()
	local totalKillScore = StoryData["TotalKillScore" .. difficulty]

	return math.floor(FS_Arcade.ScoreB * (killScore / totalKillScore))
end

function FS_Arcade:GetTotalScoreLevel(score, inStoryId, inDifficulty)
	local storyId = inStoryId

	if storyId == FS_SaveStory.ArcadeStoryIdMax then
		storyId = FS_SaveStory.ArcadeStoryIdMax - 1000
	end

	local StoryData = MS_StoryList.GetStoryData(storyId)

	if StoryData == nil then
		return nil
	end

	local difficulty = inDifficulty

	if difficulty == 1 then
		difficulty = 2
	end

	local totalScore = StoryData["TotalScore" .. difficulty]
	local percent = score / totalScore

	if percent >= 1 then
		return "s"
	elseif percent >= 0.8 then
		return "a"
	elseif percent >= 0.5 then
		return "b"
	else
		return "c"
	end
end

function FS_Arcade:GetHighestScoreGamePassedTimeAndHero(level, storyId)
	if self.arcadeRecordList[level] == nil then
		return nil, nil
	end

	local retTotalScore, retKillScore, retTime, retHeroId, retLevelPoint

	for heroId, v in pairs(self.arcadeRecordList[level]) do
		if v[storyId] ~= nil and v[storyId].time ~= nil then
			if retTotalScore == nil then
				retTotalScore = v[storyId].totalScore
				retKillScore = v[storyId].killScore
				retTime = v[storyId].time
				retHeroId = heroId
				retLevelPoint = v[storyId].levelPoint
			elseif retTotalScore < v[storyId].totalScore then
				retTotalScore = v[storyId].totalScore
				retKillScore = v[storyId].killScore
				retTime = v[storyId].time
				retHeroId = heroId
				retLevelPoint = v[storyId].levelPoint
			elseif retTotalScore == v[storyId].totalScore and retTime > v[storyId].time then
				retTotalScore = v[storyId].totalScore
				retKillScore = v[storyId].killScore
				retTime = v[storyId].time
				retHeroId = heroId
				retLevelPoint = v[storyId].levelPoint
			end
		end
	end

	return retTotalScore, retKillScore, retTime, retHeroId, retLevelPoint
end

function FS_Arcade:CheckAchievement()
	local heroIdList = {}

	for level, v in pairs(self.arcadeRecordList) do
		for heroId, _v in pairs(v) do
			for storyId, __v in pairs(_v) do
				if storyId == 10080 and __v.totalScore ~= nil then
					FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.ClearArcadeModeFirstTime)

					if not table.contains(heroIdList, heroId) then
						table.insert(heroIdList, heroId)
					end

					if level == 3 and heroId == 10007 then
						FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.ClearArcadeModeHardLevelByArcadeHero)
					end
				end
			end
		end
	end
end

function FS_Arcade:ConvertLevelPointToText(levelPoint)
	levelPoint = tonumber(levelPoint)

	if levelPoint == 4 then
		return "s"
	elseif levelPoint == 3 then
		return "a"
	elseif levelPoint == 2 then
		return "b"
	elseif levelPoint == 1 then
		return "c"
	end

	return "c"
end

return FS_Arcade
