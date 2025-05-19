-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_TrophyProperty.lua

require("GameData/StructData/ExportData/ES_TrophyProperty")

MS_TrophyProperty = class("MS_TrophyProperty")
MS_TrophyProperty.TrophyPropertyList = {}

function MS_TrophyProperty.Init()
	for k, data in pairs(ES_TrophyProperty) do
		local propertyId = tonumber(data.PropertyId)

		if MS_TrophyProperty.TrophyPropertyList[propertyId] == nil then
			MS_TrophyProperty.TrophyPropertyList[propertyId] = {}
		end

		MS_TrophyProperty.TrophyPropertyList[propertyId] = data
	end
end

function MS_TrophyProperty.GetTrophyPropertyData(propertyId)
	propertyId = tonumber(propertyId)

	if MS_TrophyProperty.TrophyPropertyList[propertyId] ~= nil then
		return MS_TrophyProperty.TrophyPropertyList[propertyId]
	end

	return nil
end

function MS_TrophyProperty.GetTrophyPropertyTypeAndValue(propertyId, quality, OnlyValue)
	propertyId = tonumber(propertyId)

	if MS_TrophyProperty.TrophyPropertyList[propertyId] ~= nil then
		if OnlyValue then
			if quality == MS_ItemData.TrophyQuality.Common then
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyValue
			elseif quality == MS_ItemData.TrophyQuality.Secondary then
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].SecondaryValue
			end
		elseif quality == MS_ItemData.TrophyQuality.Common then
			if MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.CritRate or MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.HumanAdd or MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.BeastAdd or MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.SendrilAdd then
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyValue / 10 .. "%"
			elseif MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.CritDamage then
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyValue / 10 .. "%"
			else
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyValue
			end
		elseif quality == MS_ItemData.TrophyQuality.Secondary then
			if MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.CritRate or MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.HumanAdd or MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.BeastAdd or MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.SendrilAdd then
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].SecondaryValue / 10 .. "%"
			elseif MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType == MS_HeroData.Property.CritDamage then
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].SecondaryValue / 10 .. "%"
			else
				return MS_TrophyProperty.TrophyPropertyList[propertyId].PropertyType, MS_TrophyProperty.TrophyPropertyList[propertyId].SecondaryValue
			end
		end
	end

	return 1, 0
end

function MS_TrophyProperty.GetTrophyPropertyText(type, value)
	if type == MS_HeroData.Property.CritRate or type == MS_HeroData.Property.HumanAdd or type == MS_HeroData.Property.BeastAdd or type == MS_HeroData.Property.SendrilAdd or type == MS_HeroData.Property.CritDamage then
		return GameText.UI_PLAYERINFO_PROPERTY_TYPE[type] .. "+" .. value / 10 .. "%\n"
	else
		return GameText.UI_PLAYERINFO_PROPERTY_TYPE[type] .. "+" .. value .. "\n"
	end
end
