-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroAttributeData.lua

require("GameData/StructData/ExportData/ES_HeroAttributeData")

MS_HeroAttributeData = class("MS_HeroAttributeData")
MS_HeroAttributeData.static.AttributePointMax = 200
MS_HeroAttributeData.heroAttributeList = {}

function MS_HeroAttributeData.Init()
	for k, data in pairs(ES_HeroAttributeData) do
		local attributeId = tonumber(data.AttributeId)
		local attributePoint = tonumber(data.AttributePoint)

		if MS_HeroAttributeData.heroAttributeList[attributeId] == nil then
			MS_HeroAttributeData.heroAttributeList[attributeId] = {}
		end

		MS_HeroAttributeData.heroAttributeList[attributeId][attributePoint] = data
	end
end

function MS_HeroAttributeData.GetValue(attributeId, attributePoint, propertyId)
	local field = "Property_" .. propertyId

	attributePoint = Mathf.Min(attributePoint, MS_HeroAttributeData.AttributePointMax)

	if MS_HeroAttributeData.heroAttributeList[attributeId] ~= nil and MS_HeroAttributeData.heroAttributeList[attributeId][attributePoint] ~= nil and MS_HeroAttributeData.heroAttributeList[attributeId][attributePoint][field] ~= nil then
		return MS_HeroAttributeData.heroAttributeList[attributeId][attributePoint][field]
	end

	return 0
end
