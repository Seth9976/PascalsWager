-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StorySituationDialog.lua

require("GameData/StructData/ExportData/ES_StorySituationDialog")

MS_StorySituationDialog = class("MS_StorySituationDialog")
MS_StorySituationDialog.storySituationDialogList = {}

function MS_StorySituationDialog.Init()
	for k, data in pairs(ES_StorySituationDialog) do
		local dialogId = tonumber(data.DialogId)
		local standId = tonumber(data.MeetingStandId)

		if MS_StorySituationDialog.storySituationDialogList[dialogId] == nil then
			MS_StorySituationDialog.storySituationDialogList[dialogId] = {}
		end

		MS_StorySituationDialog.storySituationDialogList[dialogId][standId] = data
	end
end

function MS_StorySituationDialog.GetSituationData(dialogId, standId)
	if MS_StorySituationDialog.storySituationDialogList[dialogId] ~= nil and MS_StorySituationDialog.storySituationDialogList[dialogId][standId] ~= nil then
		return MS_StorySituationDialog.storySituationDialogList[dialogId][standId]
	end

	return nil
end

function MS_StorySituationDialog.GetDialogData(dialogId)
	if MS_StorySituationDialog.storySituationDialogList[dialogId] ~= nil then
		return MS_StorySituationDialog.storySituationDialogList[dialogId]
	end

	return nil
end
