-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_CommonDialog.lua

require("GameData/StructData/ExportData/ES_CommonDialog")

MS_CommonDialog = class("MS_CommonDialog")
MS_CommonDialog.heroDialogList = {}

function MS_CommonDialog.Init()
	for k, data in pairs(ES_CommonDialog) do
		local heroId = tonumber(data.HeroId)
		local commonDialogId = tonumber(data.CommonDialogId)

		if MS_CommonDialog.heroDialogList[heroId] == nil then
			MS_CommonDialog.heroDialogList[heroId] = {}
		end

		MS_CommonDialog.heroDialogList[heroId][commonDialogId] = data
	end
end

function MS_CommonDialog.GetDialog(heroId, commonDialogId)
	if MS_CommonDialog.heroDialogList[heroId] ~= nil and MS_CommonDialog.heroDialogList[heroId][commonDialogId] ~= nil then
		return MS_CommonDialog.heroDialogList[heroId][commonDialogId]
	end

	return 0
end
