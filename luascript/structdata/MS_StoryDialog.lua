-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryDialog.lua

require("GameData/StructData/ExportData/ES_StoryDialog")

MS_StoryDialog = class("MS_StoryDialog")
MS_StoryDialog.storyDialogList = {}
MS_StoryDialog.storySceneDialogList = {}
MS_StoryDialog.static.Type = {
	CrowWhisper = 7,
	Frog = 8,
	HostWhisper = 4,
	Statue = 10,
	Transaction = 6,
	ClickNext = 1,
	Wear = 9,
	Option = 3,
	NpcWhisper = 5,
	IncludeOption = 2
}
MS_StoryDialog.static.DLCShowType = {
	NoDLCShow = 2,
	HaveDLCShow = 1,
	Always = 0
}
MS_StoryDialog.static.StatueDialogId = 4991001
MS_StoryDialog.static.MazeDoorEntranceId = 4994001
MS_StoryDialog.static.MazeDoorBossId = 4994002

function MS_StoryDialog.Init()
	for k, data in pairs(ES_StoryDialog) do
		local storyId = tonumber(data.StoryId)
		local dialogId = tonumber(data.DialogId)
		local pos = tonumber(data.Position)
		local radius = tonumber(data.Radius)
		local type = tonumber(data.Type)

		if AppVer == AppAppleLight and storyId == 1 and dialogId == 17020 then
			data.Position = 0
		end

		if MS_StoryDialog.storyDialogList[storyId] == nil then
			MS_StoryDialog.storyDialogList[storyId] = {}
		end

		MS_StoryDialog.storyDialogList[storyId][dialogId] = data

		if pos > 0 or pos == -1 then
			if MS_StoryDialog.storySceneDialogList[storyId] == nil then
				MS_StoryDialog.storySceneDialogList[storyId] = {}
			end

			MS_StoryDialog.storySceneDialogList[storyId][dialogId] = data
		end
	end
end

function MS_StoryDialog.GetStoryDialog(storyId)
	storyId = tonumber(storyId)

	return MS_StoryDialog.storyDialogList[storyId]
end

function MS_StoryDialog.RefreshLanguage()
	if GameTextData.StoryDialog == nil then
		return
	end

	for k, v in pairs(MS_StoryDialog.storyDialogList) do
		for _k, _v in pairs(v) do
			if GameTextData.StoryDialog[tostring(k) .. tostring(_k)] ~= nil then
				_v.Text = GameTextData.StoryDialog[tostring(k) .. tostring(_k)]
			end
		end
	end

	for k, v in pairs(MS_StoryDialog.storySceneDialogList) do
		for _k, _v in pairs(v) do
			if GameTextData.StoryDialog[tostring(k) .. tostring(_k)] ~= nil then
				_v.Text = GameTextData.StoryDialog[tostring(k) .. tostring(_k)]
			end
		end
	end
end

function MS_StoryDialog.GetStorySceneDialogList(storyId)
	storyId = tonumber(storyId)

	return MS_StoryDialog.storySceneDialogList[storyId]
end

function MS_StoryDialog.GetDialogData(storyId, dialogId)
	storyId = tonumber(storyId)
	dialogId = tonumber(dialogId)

	if MS_StoryDialog.storyDialogList[storyId] ~= nil and MS_StoryDialog.storyDialogList[storyId][dialogId] ~= nil then
		return MS_StoryDialog.storyDialogList[storyId][dialogId]
	end

	return nil
end
