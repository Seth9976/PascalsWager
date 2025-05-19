-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_TrophyRandomProperty.lua

require("GameData/StructData/ExportData/ES_TrophyRandomProperty")

MS_TrophyRandomProperty = class("MS_TrophyRandomProperty")
MS_TrophyRandomProperty.TrophyRandomPropertyList = {}

function MS_TrophyRandomProperty.Init()
	for k, data in pairs(ES_TrophyRandomProperty) do
		local propertyId = tonumber(data.PropertyId)

		if MS_TrophyRandomProperty.TrophyRandomPropertyList[propertyId] == nil then
			MS_TrophyRandomProperty.TrophyRandomPropertyList[propertyId] = {}
		end

		MS_TrophyRandomProperty.TrophyRandomPropertyList[propertyId] = data
	end
end

function MS_TrophyRandomProperty.GetTrophyRandomPropertyData(propertyId)
	propertyId = tonumber(propertyId)

	if MS_TrophyRandomProperty.TrophyRandomPropertyList[propertyId] ~= nil then
		return MS_TrophyRandomProperty.TrophyRandomPropertyList[propertyId]
	end

	return nil
end
