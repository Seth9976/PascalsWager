-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_FormulaData.lua

require("LuaScript/StructData/MS_ItemData")
require("GameData/StructData/ExportData/ES_FormulaData")

MS_FormulaData = class("MS_FormulaData")
MS_FormulaData.formulaList = {}

function MS_FormulaData.Init()
	for k, data in pairs(ES_FormulaData) do
		local formulaId = tonumber(data.FormulaId)

		MS_FormulaData.formulaList[formulaId] = data
	end
end

function MS_FormulaData.GetFormulaDataById(formulaId)
	if MS_FormulaData.formulaList[formulaId] ~= nil then
		return MS_FormulaData.formulaList[formulaId]
	end

	return nil
end

function MS_FormulaData.GetFormulaDataListByMainType(type)
	local tempList = {}

	for k, v in pairs(MS_FormulaData.formulaList) do
		local itemData = MS_ItemData.GetItemData(k)

		if itemData.MainType == type then
			table.insert(tempList, v)
		end
	end

	return tempList
end

function MS_FormulaData.GetFormulaDataListByFormulaType(type)
	local tempList = {}

	for k, v in pairs(MS_FormulaData.formulaList) do
		if v.Type == type then
			table.insert(tempList, v)
		end
	end

	return tempList
end
