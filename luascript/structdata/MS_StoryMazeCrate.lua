-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMazeCrate.lua

require("GameData/StructData/ExportData/ES_StoryMazeCrate")

MS_StoryMazeCrate = class("MS_StoryMazeCrate")
MS_StoryMazeCrate.storyMazeCrateList = {}

function MS_StoryMazeCrate.Init()
	for k, data in pairs(ES_StoryMazeCrate) do
		local level = tonumber(data.MazeLevel)
		local crateId = tonumber(data.CrateId)

		if MS_StoryMazeCrate.storyMazeCrateList[level] == nil then
			MS_StoryMazeCrate.storyMazeCrateList[level] = {}
		end

		if MS_StoryMazeCrate.storyMazeCrateList[level][crateId] == nil then
			MS_StoryMazeCrate.storyMazeCrateList[level][crateId] = {}
		end

		table.insert(MS_StoryMazeCrate.storyMazeCrateList[level][crateId], data)
	end
end

function MS_StoryMazeCrate.GetMazeCrateNum(mazeLevel, crateId)
	mazeLevel = tonumber(mazeLevel)
	crateId = tonumber(crateId)

	if MS_StoryMazeCrate.storyMazeCrateList[mazeLevel] ~= nil and MS_StoryMazeCrate.storyMazeCrateList[mazeLevel][crateId] ~= nil then
		return #MS_StoryMazeCrate.storyMazeCrateList[mazeLevel][crateId]
	end

	return 0
end

function MS_StoryMazeCrate.GetMazeCrateData(mazeLevel, crateId, index)
	mazeLevel = tonumber(mazeLevel)
	crateId = tonumber(crateId)
	dataType = tonumber(dataType)

	if MS_StoryMazeCrate.storyMazeCrateList[mazeLevel] ~= nil and MS_StoryMazeCrate.storyMazeCrateList[mazeLevel][crateId] ~= nil then
		return MS_StoryMazeCrate.storyMazeCrateList[mazeLevel][crateId][index]
	end

	return nil
end
