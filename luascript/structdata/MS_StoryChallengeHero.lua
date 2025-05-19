-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryChallengeHero.lua

require("GameData/StructData/ExportData/ES_StoryChallengeHero")

MS_StoryChallengeHero = class("MS_StoryChallengeHero")
MS_StoryChallengeHero.heroDataList = {}

function MS_StoryChallengeHero.Init()
	for k, data in pairs(ES_StoryChallengeHero) do
		local heroId = tonumber(data.HeroId)

		MS_StoryChallengeHero.heroDataList[heroId] = data
	end
end

function MS_StoryChallengeHero.GetHeroChallengeData(heroId)
	if MS_StoryChallengeHero.heroDataList[heroId] ~= nil then
		return MS_StoryChallengeHero.heroDataList[heroId]
	end

	return nil
end
