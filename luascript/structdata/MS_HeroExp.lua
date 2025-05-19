-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroExp.lua

require("GameData/StructData/ExportData/ES_HeroExp")

MS_HeroExp = class("MS_HeroExp")
MS_HeroExp.heroExpList = {}
MS_HeroExp.static.LvMax = 500

function MS_HeroExp.Init()
	for k, data in pairs(ES_HeroExp) do
		table.insert(MS_HeroExp.heroExpList, data.Exp)
	end
end

function MS_HeroExp.GetHeroRequireExp(lv)
	if MS_HeroExp.heroExpList[tonumber(lv)] then
		return MS_HeroExp.heroExpList[tonumber(lv)]
	end

	if lv > MS_HeroExp.LvMax then
		return 0
	end

	return nil
end
