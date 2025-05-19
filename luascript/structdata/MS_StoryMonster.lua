-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMonster.lua

require("GameData/StructData/ExportData/ES_StoryMonster")

MS_StoryMonster = class("MS_StoryMonster")
MS_StoryMonster.storyMonsterList = {}
MS_StoryMonster.storyMonsterAreaList = {}
MS_StoryMonster.storySanMonsterList = {}
MS_StoryMonster.static.ArcadeRefreshMonsterList = {
	1006005,
	1006006,
	1006007,
	1006092,
	1002050,
	1002047,
	1002081,
	1004062,
	1004063,
	1004061,
	1006002,
	1006003,
	1006004,
	8004,
	8005,
	8006,
	8007,
	8008,
	8009,
	8010,
	8011,
	8012,
	8013,
	8014,
	8017,
	8019,
	8021
}

function MS_StoryMonster.Init()
	for k, data in pairs(ES_StoryMonster) do
		local storyId = tonumber(data.StoryId)
		local pattern = tonumber(data.Pattern)
		local areaId = tonumber(data.Area)
		local monsterId = tonumber(data.StoryMonsterId)
		local sanMonster = tonumber(data.SanMonster)

		if MS_StoryMonster.storyMonsterAreaList[storyId] == nil then
			MS_StoryMonster.storyMonsterAreaList[storyId] = {}
		end

		if MS_StoryMonster.storyMonsterAreaList[storyId][pattern] == nil then
			MS_StoryMonster.storyMonsterAreaList[storyId][pattern] = {}
		end

		if MS_StoryMonster.storyMonsterAreaList[storyId][pattern][areaId] == nil then
			MS_StoryMonster.storyMonsterAreaList[storyId][pattern][areaId] = {}
		end

		if MS_StoryMonster.storySanMonsterList[storyId] == nil then
			MS_StoryMonster.storySanMonsterList[storyId] = {}
		end

		if MS_StoryMonster.storySanMonsterList[storyId][pattern] == nil then
			MS_StoryMonster.storySanMonsterList[storyId][pattern] = {}
		end

		if MS_StoryMonster.storySanMonsterList[storyId][pattern][areaId] == nil then
			MS_StoryMonster.storySanMonsterList[storyId][pattern][areaId] = {}
		end

		if MS_StoryMonster.storyMonsterList[storyId] == nil then
			MS_StoryMonster.storyMonsterList[storyId] = {}
		end

		if MS_StoryMonster.storyMonsterList[storyId][pattern] == nil then
			MS_StoryMonster.storyMonsterList[storyId][pattern] = {}
		end

		local newRadius = {}
		local tmpStr = data.MoveRadius
		local tmpStrArr = StringHelper.Split(tmpStr, ";")

		for i = 1, #tmpStrArr do
			local tmparr = StringHelper.Split(tmpStrArr[i], "|")
			local tmpTab = {}

			tmpTab.center = Vector3.New(tonumber(tmparr[1]), tonumber(tmparr[2]), tonumber(tmparr[3]))
			tmpTab.radius = tonumber(tmparr[4])

			table.insert(newRadius, tmpTab)
		end

		data.MoveRadius = newRadius

		local callStr = data.CallMonsterId

		if callStr ~= "" then
			local tmpCallList = StringHelper.Split(callStr, ";")

			if #tmpCallList > 0 then
				data.CallMonsterIdList = {}

				for i = 1, #tmpCallList do
					local callId = tonumber(tmpCallList[i])

					table.insert(data.CallMonsterIdList, callId)
				end
			end
		end

		data.CallMonsterId = nil
		MS_StoryMonster.storyMonsterAreaList[storyId][pattern][areaId][monsterId] = data
		MS_StoryMonster.storyMonsterList[storyId][pattern][monsterId] = data

		if sanMonster > 0 then
			table.insert(MS_StoryMonster.storySanMonsterList[storyId][pattern][areaId], data)
		end
	end

	for storyId, storyList in pairs(MS_StoryMonster.storyMonsterAreaList) do
		if MS_StoryMonster.storyMonsterAreaList[storyId][0] ~= nil then
			for pattern, patternList in pairs(storyList) do
				if pattern > 0 then
					for areaId, monsterList in pairs(patternList) do
						if MS_StoryMonster.storyMonsterAreaList[storyId][0][areaId] ~= nil then
							table.merge(monsterList, MS_StoryMonster.storyMonsterAreaList[storyId][0][areaId])
						end
					end
				end
			end
		end
	end

	for storyId, storyList in pairs(MS_StoryMonster.storyMonsterList) do
		if MS_StoryMonster.storyMonsterList[storyId][0] ~= nil then
			for pattern, patternList in pairs(storyList) do
				if pattern > 0 then
					table.merge(patternList, MS_StoryMonster.storyMonsterList[storyId][0])
				end
			end
		end
	end

	for storyId, storyList in pairs(MS_StoryMonster.storySanMonsterList) do
		if MS_StoryMonster.storySanMonsterList[storyId][0] ~= nil then
			for pattern, patternList in pairs(storyList) do
				if pattern > 0 then
					for areaId, monsterList in pairs(patternList) do
						if MS_StoryMonster.storySanMonsterList[storyId][0][areaId] ~= nil and #MS_StoryMonster.storySanMonsterList[storyId][0][areaId] > 0 then
							table.append(monsterList, MS_StoryMonster.storySanMonsterList[storyId][0][areaId])
						end
					end
				end
			end
		end
	end
end

function MS_StoryMonster.GetStoryRandomPattern(storyId)
	local tmpList = {}
	local ret = 0

	storyId = MS_StoryMonster.GetChallengeStoryId(storyId)

	if MS_StoryMonster.storyMonsterList[storyId] ~= nil then
		for pattern, v in pairs(MS_StoryMonster.storyMonsterList[storyId]) do
			if pattern > 0 then
				table.insert(tmpList, pattern)
			end
		end
	end

	if #tmpList > 0 then
		table.shuffle(tmpList)

		ret = tmpList[1]
	end

	return ret
end

function MS_StoryMonster.GetStoryMonsterAll(storyId, pattern)
	storyId = tonumber(storyId)
	pattern = tonumber(pattern)
	storyId = MS_StoryMonster.GetChallengeStoryId(storyId)

	if MS_StoryList.IsStoryArcadeBoss(storyId) then
		pattern = 0

		if storyId == 2003 or storyId == 2004 then
			storyId = 2002
		end
	end

	local retList = MS_StoryMonster.storyMonsterList[storyId][pattern]

	return retList
end

function MS_StoryMonster.GetStoryMonsterArea(storyId, pattern, areaId)
	storyId = tonumber(storyId)
	pattern = tonumber(pattern)
	areaId = tonumber(areaId)
	storyId = MS_StoryMonster.GetChallengeStoryId(storyId)

	SystemHelper.LogTest("===GetStoryMonsterArea=storyId=" .. storyId .. ",pattern=" .. pattern .. ",areaId=" .. areaId)

	if MS_StoryList.IsStoryArcadeBoss(storyId) then
		pattern = 0

		if storyId == 2003 or storyId == 2004 then
			storyId = 2002
		end
	end

	local retList = MS_StoryMonster.storyMonsterAreaList[storyId][pattern][areaId]

	return retList
end

function MS_StoryMonster.GetSanStoryMonster(storyId, pattern, areaId)
	storyId = tonumber(storyId)
	pattern = tonumber(pattern)
	areaId = tonumber(areaId)
	storyId = MS_StoryMonster.GetChallengeStoryId(storyId)

	if MS_StoryList.IsStoryArcadeBoss(storyId) then
		pattern = 0

		if storyId == 2003 or storyId == 2004 then
			storyId = 2002
		end
	end

	local retList = MS_StoryMonster.storySanMonsterList[storyId][pattern][areaId]

	return retList
end

function MS_StoryMonster.GetMonsterData(storyId, pattern, monsterId)
	storyId = tonumber(storyId)
	pattern = tonumber(pattern)
	monsterId = tonumber(monsterId)
	storyId = MS_StoryMonster.GetChallengeStoryId(storyId)

	if MS_StoryList.IsStoryArcadeBoss(storyId) then
		pattern = 0

		if storyId == 2003 or storyId == 2004 then
			storyId = 2002
		end
	end

	if MS_StoryMonster.storyMonsterList[storyId] ~= nil and MS_StoryMonster.storyMonsterList[storyId][pattern] ~= nil then
		return MS_StoryMonster.storyMonsterList[storyId][pattern][monsterId]
	end

	return nil
end

function MS_StoryMonster.RefreshLanguage()
	if GameTextData.StoryMonster == nil then
		return
	end

	for storyId, v in pairs(MS_StoryMonster.storyMonsterList) do
		for pattern, _v in pairs(v) do
			for monsterId, __v in pairs(_v) do
				if GameTextData.StoryMonster[tostring(storyId) .. tostring(monsterId)] ~= nil then
					function __v.StoryMonsterName()
						return GameTextData.StoryMonster[tostring(storyId) .. tostring(monsterId)]
					end
				else
					function __v.StoryMonsterName()
						return "No Name"
					end
				end
			end
		end
	end
end

function MS_StoryMonster.GetChallengeStoryId(storyId)
	if storyId >= 600 and storyId < 700 then
		storyId = storyId == 608 and 8 or storyId - 100
	end

	return storyId
end
