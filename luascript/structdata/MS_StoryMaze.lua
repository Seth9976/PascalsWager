-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMaze.lua

require("GameData/StructData/ExportData/ES_StoryMaze")

MS_StoryMaze = class("MS_StoryMaze")
MS_StoryMaze.static.MazeIdMax = 4
MS_StoryMaze.mazeList = {}
MS_StoryMaze.floorMaxList = {}

function MS_StoryMaze.Init()
	for k, data in pairs(ES_StoryMaze) do
		local mazeId = tonumber(data.MazeId)
		local mazeFloor = tonumber(data.MazeFloor)

		if MS_StoryMaze.mazeList[mazeId] == nil then
			MS_StoryMaze.mazeList[mazeId] = {}
		end

		if MS_StoryMaze.mazeList[mazeId][mazeFloor] == nil then
			MS_StoryMaze.mazeList[mazeId][mazeFloor] = {}
		end

		table.insert(MS_StoryMaze.mazeList[mazeId][mazeFloor], data)

		if MS_StoryMaze.floorMaxList[mazeId] == nil then
			MS_StoryMaze.floorMaxList[mazeId] = mazeFloor
		elseif mazeFloor > MS_StoryMaze.floorMaxList[mazeId] then
			MS_StoryMaze.floorMaxList[mazeId] = mazeFloor
		end
	end
end

function MS_StoryMaze.GetMazeList(mazeId, mazeFloor)
	if MS_StoryMaze.mazeList[mazeId] ~= nil and MS_StoryMaze.mazeList[mazeId][mazeFloor] ~= nil then
		return MS_StoryMaze.mazeList[mazeId][mazeFloor]
	end

	return nil
end

function MS_StoryMaze.GetMazeFloorMax(mazeId)
	if MS_StoryMaze.floorMaxList[mazeId] ~= nil then
		local max = MS_StoryMaze.floorMaxList[mazeId]

		if mazeId == MS_StoryMaze.MazeIdMax then
			return max - 1
		else
			return max
		end
	end

	return 0
end

function MS_StoryMaze.IsHaveMazeFinalFloor(mazeId, floorId)
	local max = MS_StoryMaze.GetMazeFloorMax(mazeId)

	if mazeId == MS_StoryMaze.MazeIdMax and floorId == max then
		return true
	end

	return false
end

function MS_StoryMaze.IsMazeFinalFloor(mazeId, floorId)
	local max = MS_StoryMaze.GetMazeFloorMax(mazeId)

	if mazeId == MS_StoryMaze.MazeIdMax and floorId == max + 1 then
		return true
	end

	return false
end

function MS_StoryMaze.GetMazeBossId(mazeId, mazeFloor, storyId, area)
	if MS_StoryMaze.mazeList[mazeId] ~= nil and MS_StoryMaze.mazeList[mazeId][mazeFloor] ~= nil then
		for k, data in pairs(MS_StoryMaze.mazeList[mazeId][mazeFloor]) do
			if data.StoryId == storyId and data.Area == area then
				return data.BossId
			end
		end
	end

	return 0
end
