-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_ArcadeMonsterProperty.lua

require("GameData/StructData/ExportData/ES_ArcadeMonsterProperty")

MS_ArcadeMonsterProperty = class("MS_ArcadeMonsterProperty")
MS_ArcadeMonsterProperty.monsterPropertyList = {}

function MS_ArcadeMonsterProperty.Init()
	for k, data in pairs(ES_ArcadeMonsterProperty) do
		local heroId = tonumber(data.HeroId)
		local level = tonumber(data.Level)
		local grade = tonumber(data.Grade)

		if MS_ArcadeMonsterProperty.monsterPropertyList[heroId] == nil then
			MS_ArcadeMonsterProperty.monsterPropertyList[heroId] = {}
		end

		if MS_ArcadeMonsterProperty.monsterPropertyList[heroId][level] == nil then
			MS_ArcadeMonsterProperty.monsterPropertyList[heroId][level] = {}
		end

		MS_ArcadeMonsterProperty.monsterPropertyList[heroId][level][grade] = data
	end
end

function MS_ArcadeMonsterProperty.GetStoryMonsterProperty(heroId, level, grade)
	heroId = tonumber(heroId)

	local inlevel = tonumber(level)

	grade = tonumber(grade)

	if inlevel == 1 then
		inlevel = 2
	end

	if MS_ArcadeMonsterProperty.monsterPropertyList[heroId] ~= nil and MS_ArcadeMonsterProperty.monsterPropertyList[heroId][inlevel] ~= nil and MS_ArcadeMonsterProperty.monsterPropertyList[heroId][inlevel][grade] ~= nil then
		return MS_ArcadeMonsterProperty.monsterPropertyList[heroId][inlevel][grade]
	end

	return nil
end
