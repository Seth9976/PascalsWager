-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryChallengeMonsterProperty.lua

require("GameData/StructData/ExportData/ES_StoryChallengeMonsterProperty")

MS_StoryChallengeMonsterProperty = class("MS_StoryChallengeMonsterProperty")
MS_StoryChallengeMonsterProperty.monsterPropertyList = {}

function MS_StoryChallengeMonsterProperty.Init()
	for k, data in pairs(ES_StoryChallengeMonsterProperty) do
		local heroId = tonumber(data.HeroId)
		local level = tonumber(data.Level)
		local grade = tonumber(data.Grade)

		if MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId] == nil then
			MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId] = {}
		end

		if MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId][level] == nil then
			MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId][level] = {}
		end

		MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId][level][grade] = data
	end
end

function MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(heroId, level, grade)
	heroId = tonumber(heroId)
	level = tonumber(level)
	grade = tonumber(grade)

	if MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId] ~= nil and MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId][level] ~= nil and MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId][level][grade] ~= nil then
		return MS_StoryChallengeMonsterProperty.monsterPropertyList[heroId][level][grade]
	end

	return nil
end
