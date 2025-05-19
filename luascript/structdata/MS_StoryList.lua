-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryList.lua

require("GameData/StructData/ExportData/ES_StoryData")
require("LuaScript/StructData/MS_StoryData")

MS_StoryList = class("MS_StoryList")
MS_StoryList.static.Carriage = 99
MS_StoryList.storyList = {}
MS_StoryList.levelList = {}
MS_StoryList.mazeList = {}
MS_StoryData.sceneList = {}

function MS_StoryList.Init()
	local sortList = {}
	local mazeList = {}

	MS_StoryList.sceneList = {}

	for k, data in pairs(ES_StoryData) do
		local storyId = tonumber(data.StoryId)
		local stageId = tonumber(data.StageId)

		if MS_StoryList.storyList[storyId] == nil then
			local v_storyData = MS_StoryData:new(data)

			MS_StoryList.storyList[storyId] = v_storyData

			if storyId ~= MS_StoryList.Carriage then
				table.insert(sortList, tonumber(storyId))

				if storyId >= 400 and storyId < 600 then
					table.insert(mazeList, tonumber(storyId))
				end
			end
		end

		MS_StoryList.sceneList[stageId] = 1
	end

	table.sort(sortList, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
	table.sort(mazeList, function(a, b)
		return tonumber(a) < tonumber(b)
	end)

	MS_StoryList.levelList = sortList
	MS_StoryList.mazeList = mazeList
end

function MS_StoryList.GetStoryData(storyId)
	if MS_StoryList.storyList[storyId] ~= nil then
		return MS_StoryList.storyList[storyId]
	end

	return nil
end

function MS_StoryList.GetSceneList()
	return MS_StoryList.sceneList
end

function MS_StoryList.GetStoryIdByIndex(index)
	local sid = MS_StoryList.levelList[index]

	if sid == nil then
		sid = 0
	end

	return sid
end

function MS_StoryList.GetMazeStoryIdByIndex(index)
	local sid = MS_StoryList.mazeList[index]

	if sid == nil then
		sid = 0
	end

	return sid
end

function MS_StoryList.LevelCount()
	return table.nums(MS_StoryList.levelList)
end

function MS_StoryList.MazeLevelCount()
	return table.nums(MS_StoryList.mazeList)
end

function MS_StoryList.Count()
	return table.nums(MS_StoryList.storyList)
end

function MS_StoryList.IsStoryNormal(storyId)
	if storyId >= 1 and storyId < 100 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryOriginal(storyId)
	if storyId >= 1 and storyId < 9 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryDLC(storyId)
	if storyId == 9 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryDream(storyId)
	if storyId >= 300 and storyId < 400 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryCarriage(storyId)
	if storyId == 99 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryMazeStart(storyId)
	if storyId == 499 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryMaze(storyId)
	if storyId >= 400 and storyId < 499 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryMazeBoss(storyId)
	if storyId >= 500 and storyId < 600 then
		return true
	end

	return false
end

function MS_StoryList.IsBossChallenge(storyId)
	if storyId >= 600 and storyId < 700 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryNew(storyId)
	if storyId > 1000 then
		return true
	end

	return false
end

function MS_StoryList.IsStoryArcadeBoss(storyId)
	if storyId > 2000 then
		return true
	end

	return false
end

function MS_StoryList.ConvertArcadeToNormal(storyId)
	if storyId > 2000 then
		if storyId == 2001 then
			return 699
		elseif storyId > 2001 then
			return 9
		end
	end

	return storyId - 1000
end
