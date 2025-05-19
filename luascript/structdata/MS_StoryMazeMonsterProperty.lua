-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMazeMonsterProperty.lua

require("GameData/StructData/ExportData/ES_StoryMazeMonsterProperty")

MS_StoryMazeMonsterProperty = class("MS_StoryMazeMonsterProperty")
MS_StoryMazeMonsterProperty.monsterPropertyList = {}

function MS_StoryMazeMonsterProperty.Init()
	for k, data in pairs(ES_StoryMazeMonsterProperty) do
		local heroId = tonumber(data.HeroId)
		local mazeLevel = tonumber(data.Level)
		local grade = tonumber(data.Grade)

		if MS_StoryMazeMonsterProperty.monsterPropertyList[heroId] == nil then
			MS_StoryMazeMonsterProperty.monsterPropertyList[heroId] = {}
		end

		if MS_StoryMazeMonsterProperty.monsterPropertyList[heroId][mazeLevel] == nil then
			MS_StoryMazeMonsterProperty.monsterPropertyList[heroId][mazeLevel] = {}
		end

		MS_StoryMazeMonsterProperty.monsterPropertyList[heroId][mazeLevel][grade] = data
	end
end

function MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(heroId, mazeLevel, grade)
	heroId = tonumber(heroId)
	mazeLevel = tonumber(mazeLevel)
	grade = tonumber(grade)

	if MS_StoryMazeMonsterProperty.monsterPropertyList[heroId] ~= nil and MS_StoryMazeMonsterProperty.monsterPropertyList[heroId][mazeLevel] ~= nil and MS_StoryMazeMonsterProperty.monsterPropertyList[heroId][mazeLevel][grade] ~= nil then
		return MS_StoryMazeMonsterProperty.monsterPropertyList[heroId][mazeLevel][grade]
	end

	return nil
end
