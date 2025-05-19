-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryItem.lua

require("GameData/StructData/ExportData/ES_StoryItem")

MS_StoryItem = class("MS_StoryItem")
MS_StoryItem.storyItemList = {}

function MS_StoryItem.Init()
	for k, data in pairs(ES_StoryItem) do
		local storyId = tonumber(data.StoryId)
		local storyItemId = tonumber(data.StoryItemId)

		if MS_StoryItem.storyItemList[storyId] == nil then
			MS_StoryItem.storyItemList[storyId] = {}
		end

		data.ItemId = data.ItemId_1
		data.Effect = data.Effect_1
		data.Num = data.Num_1
		data.ElevatorId = data.ElevatorId_1
		data.ShowQuestId = data.ShowQuestId_1
		data.HideQuestId = data.HideQuestId_1
		data.CompleteQuestId = data.CompleteQuestId_1
		data.Description = data.Description_1
		MS_StoryItem.storyItemList[storyId][storyItemId] = data
	end
end

function MS_StoryItem.SetLoop(loop)
	for k, v in pairs(MS_StoryItem.storyItemList) do
		for _k, _v in pairs(v) do
			_v.ItemId = _v["ItemId_" .. loop]
			_v.Effect = _v["Effect_" .. loop]
			_v.Num = _v["Num_" .. loop]
			_v.ElevatorId = _v["ElevatorId_" .. loop]
			_v.ShowQuestId = _v["ShowQuestId_" .. loop]
			_v.HideQuestId = _v["HideQuestId_" .. loop]
			_v.CompleteQuestId = _v["CompleteQuestId_" .. loop]
			_v.Description = _v["Description_" .. loop]
		end
	end
end

function MS_StoryItem.GetStoryItem(storyId)
	storyId = tonumber(storyId)

	return MS_StoryItem.storyItemList[storyId]
end

function MS_StoryItem.GetItemData(storyId, storyItemId)
	storyId = tonumber(storyId)
	storyItemId = tonumber(storyItemId)

	if MS_StoryItem.storyItemList[storyId] ~= nil and MS_StoryItem.storyItemList[storyId][storyItemId] ~= nil then
		return MS_StoryItem.storyItemList[storyId][storyItemId]
	end

	return nil
end
