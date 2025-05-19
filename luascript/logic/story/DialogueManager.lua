-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Story/DialogueManager.lua

DialogueManager = class("DialogueManager")

local lipList = {}
local assetIdList, assetNameList
local this = DialogueManager

function DialogueManager.LoadStart(loadStep, useProgress)
	local lipIdList = {}
	local storyId = FS_UserData.story:GetStoryId()

	if MS_StoryList.IsStoryMazeBoss(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true then
		storyId = MS_StoryData.StoryIdMazeStart
	end

	local dialogueList = MS_StoryDialog.GetStoryDialog(storyId)

	if dialogueList ~= nil then
		for i, dialogueData in pairs(dialogueList) do
			if dialogueData ~= nil then
				local dialogueStandList = MS_StorySituationDialog.GetDialogData(dialogueData.DialogId)

				if dialogueStandList ~= nil then
					for j, situationData in pairs(dialogueStandList) do
						local lipId = situationData.LipId

						if lipId > 0 then
							lipIdList[lipId] = 1
						end
					end
				end
			end
		end
	end

	assetIdList = {}
	assetNameList = {}

	for k, v in pairs(lipIdList) do
		table.insert(assetIdList, k)
		table.insert(assetNameList, k .. ".asset")
	end

	lipIdList = nil

	if #assetNameList <= 0 then
		assetIdList = nil
		assetNameList = nil

		return false
	end

	local packageName = "dialogue/story" .. storyId

	LoadProgress.CreateAndAddItem(loadStep, packageName, assetNameList)
	resMgr:LoadPrefabWithProgress(packageName, LoadProgress.GetSubItemNameList(loadStep, packageName), false, function(objs)
		if assetNameList ~= nil then
			for i = 1, #assetNameList do
				local id = assetIdList[i]

				if lipList == nil then
					lipList = {}
				end

				lipList[id] = objs[i - 1]

				if DebugLog == true then
					SystemHelper.LogTest("======###################################============id=" .. id)
				end
			end
		end
	end, function(packageName, index, request, isFinish)
		LoadProgress.SetSubItemRequest(loadStep, packageName, index, request, isFinish)
	end)

	return true
end

function DialogueManager.IsFinish()
	if assetNameList ~= nil then
		if lipList ~= nil and table.nums(lipList) >= #assetNameList then
			return true
		else
			if DebugLog == true then
				local test = ""

				for k, id in pairs(assetIdList) do
					if lipList == nil or lipList[id] == nil then
						test = test .. "," .. id
					end
				end

				SystemHelper.LogTest("===DialogueManager==Not Load=" .. test)
			end

			return false
		end
	end

	return true
end

function DialogueManager.Clear()
	lipList = nil
	assetIdList = nil
	assetNameList = nil
end

function DialogueManager.GetLip(id)
	if lipList ~= nil and lipList[id] ~= nil then
		return lipList[id]
	end

	return nil
end

return DialogueManager
