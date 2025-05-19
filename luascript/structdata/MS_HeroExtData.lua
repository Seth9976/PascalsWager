-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroExtData.lua

require("GameData/StructData/ExportData/ES_HeroExtData")

MS_HeroExtData = class("MS_HeroExtData")
MS_HeroExtData.heroExtList = {}
MS_HeroExtData.heroIdExtList = {}

function MS_HeroExtData.Init()
	for k, data in pairs(ES_HeroExtData) do
		local heroExtId = tonumber(data.HeroExtId)
		local heroId = tonumber(data.HeroId)

		MS_HeroExtData.heroExtList[heroExtId] = data

		if MS_HeroExtData.heroIdExtList[heroId] == nil then
			MS_HeroExtData.heroIdExtList[heroId] = {}
		end

		table.insert(MS_HeroExtData.heroIdExtList[heroId], data)
	end
end

function MS_HeroExtData.GetHeroData(heroExtId)
	heroExtId = tonumber(heroExtId)

	if MS_HeroExtData.heroExtList[heroExtId] ~= nil then
		return MS_HeroExtData.heroExtList[heroExtId]
	end

	return nil
end

function MS_HeroExtData.GetHeroDataById(heroId)
	heroId = tonumber(heroId)

	if MS_HeroExtData.heroIdExtList[heroId] ~= nil then
		return MS_HeroExtData.heroIdExtList[heroId]
	end

	return nil
end
