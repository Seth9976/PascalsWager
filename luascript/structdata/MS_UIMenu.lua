-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_UIMenu.lua

require("GameData/StructData/ExportData/ES_UIMenu")

MS_UIMenu = class("MS_UIMenu")
MS_UIMenu.menuQuestList = {}

function MS_UIMenu.Init()
	for k, data in pairs(ES_UIMenu) do
		local menuId = tonumber(data.MenuId)

		MS_UIMenu.menuQuestList[menuId] = data.ShowQuestId
	end
end

function MS_UIMenu.GetUIMenuQuest(menuId)
	return MS_UIMenu.menuQuestList[menuId]
end
