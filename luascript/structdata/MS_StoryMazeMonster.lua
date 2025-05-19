-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMazeMonster.lua

require("GameData/StructData/ExportData/ES_StoryMazeMonster")

MS_StoryMazeMonster = class("MS_StoryMazeMonster")
MS_StoryMazeMonster.monsterLevelList = {}

function MS_StoryMazeMonster.Init()
	for k, data in pairs(ES_StoryMazeMonster) do
		local heroId = tonumber(data.HeroId)

		if MS_StoryMazeMonster.monsterLevelList[heroId] == nil then
			MS_StoryMazeMonster.monsterLevelList[heroId] = {}
		end

		for field, value in pairs(data) do
			if StringHelper.StartsWith(field, "Level_") then
				local fields = StringHelper.Split(field, "_")
				local mazeLevel = tonumber(fields[2])

				MS_StoryMazeMonster.monsterLevelList[heroId][mazeLevel] = tonumber(value)
			end
		end
	end
end

function MS_StoryMazeMonster.GetMonsterLevel(heroId, mazeLevel)
	heroId = tonumber(heroId)

	if MS_StoryMazeMonster.monsterLevelList[heroId] ~= nil and MS_StoryMazeMonster.monsterLevelList[heroId][mazeLevel] ~= nil then
		return tonumber(MS_StoryMazeMonster.monsterLevelList[heroId][mazeLevel])
	end

	return 1
end
