-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMazeDrop.lua

require("GameData/StructData/ExportData/ES_StoryMazeDrop")

MS_StoryMazeDrop = class("MS_StoryMazeDrop")
MS_StoryMazeDrop.storyMazeDropList = {}

function MS_StoryMazeDrop.Init()
	for k, data in pairs(ES_StoryMazeDrop) do
		local level = tonumber(data.MazeLevel)
		local dropId = tonumber(data.DropId)

		if MS_StoryMazeDrop.storyMazeDropList[level] == nil then
			MS_StoryMazeDrop.storyMazeDropList[level] = {}
		end

		if MS_StoryMazeDrop.storyMazeDropList[level][dropId] == nil then
			MS_StoryMazeDrop.storyMazeDropList[level][dropId] = {}
		end

		table.insert(MS_StoryMazeDrop.storyMazeDropList[level][dropId], data)
	end
end

function MS_StoryMazeDrop.GetMazeDropData(mazeLevel, dropId)
	mazeLevel = tonumber(mazeLevel)
	dropId = tonumber(dropId)

	if MS_StoryMazeDrop.storyMazeDropList[mazeLevel] ~= nil and MS_StoryMazeDrop.storyMazeDropList[mazeLevel][dropId] ~= nil then
		return MS_StoryMazeDrop.storyMazeDropList[mazeLevel][dropId]
	end

	return nil
end
