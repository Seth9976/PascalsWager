-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroPropertyData.lua

require("GameData/StructData/ExportData/ES_HeroPropertyData")

MS_HeroPropertyData = class("MS_HeroPropertyData")
MS_HeroPropertyData.heroPropertyList = {}

function MS_HeroPropertyData.Init()
	for k, data in pairs(ES_HeroPropertyData) do
		local heroId = tonumber(data.HeroId)
		local propertyId = tonumber(data.PropertyId)

		if MS_HeroPropertyData.heroPropertyList[heroId] == nil then
			MS_HeroPropertyData.heroPropertyList[heroId] = {}
		end

		MS_HeroPropertyData.heroPropertyList[heroId][propertyId] = data
	end
end

function MS_HeroPropertyData.GetValue(heroId, propertyId, attributeId)
	local field = "Attribute_" .. attributeId

	if MS_HeroPropertyData.heroPropertyList[heroId] ~= nil and MS_HeroPropertyData.heroPropertyList[heroId][propertyId] ~= nil and MS_HeroPropertyData.heroPropertyList[heroId][propertyId][field] ~= nil then
		return MS_HeroPropertyData.heroPropertyList[heroId][propertyId][field]
	end

	return 0
end
