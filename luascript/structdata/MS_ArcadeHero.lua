-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_ArcadeHero.lua

require("GameData/StructData/ExportData/ES_ArcadeHero")

MS_ArcadeHero = class("MS_ArcadeHero")
MS_ArcadeHero.heroDataList = {}

function MS_ArcadeHero.Init()
	for k, data in pairs(ES_ArcadeHero) do
		local heroId = tonumber(data.HeroId)

		MS_ArcadeHero.heroDataList[heroId] = data
	end
end

function MS_ArcadeHero.GetHeroChallengeData(heroId)
	if MS_ArcadeHero.heroDataList[heroId] ~= nil then
		return MS_ArcadeHero.heroDataList[heroId]
	end

	return nil
end
