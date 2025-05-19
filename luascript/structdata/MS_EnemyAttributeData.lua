-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_EnemyAttributeData.lua

require("GameData/StructData/ExportData/ES_EnemyAttributeData")

MS_EnemyAttributeData = class("MS_EnemyAttributeData")
MS_EnemyAttributeData.static.AttributePointMax = 200
MS_EnemyAttributeData.enemyAttributeList = {}

function MS_EnemyAttributeData.Init()
	for k, data in pairs(ES_EnemyAttributeData) do
		local attributeId = tonumber(data.AttributeId)
		local attributePoint = tonumber(data.AttributePoint)

		if MS_EnemyAttributeData.enemyAttributeList[attributeId] == nil then
			MS_EnemyAttributeData.enemyAttributeList[attributeId] = {}
		end

		MS_EnemyAttributeData.enemyAttributeList[attributeId][attributePoint] = data
	end
end

function MS_EnemyAttributeData.GetValue(attributeId, attributePoint, propertyId)
	local field = "Property_" .. propertyId

	attributePoint = Mathf.Min(attributePoint, MS_EnemyAttributeData.AttributePointMax)

	if MS_EnemyAttributeData.enemyAttributeList[attributeId] ~= nil and MS_EnemyAttributeData.enemyAttributeList[attributeId][attributePoint] ~= nil and MS_EnemyAttributeData.enemyAttributeList[attributeId][attributePoint][field] ~= nil then
		return MS_EnemyAttributeData.enemyAttributeList[attributeId][attributePoint][field]
	end

	return 0
end
