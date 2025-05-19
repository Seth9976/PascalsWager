-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryItemDrop.lua

require("GameData/StructData/ExportData/ES_ItemDropData")

MS_StoryItemDrop = class("MS_StoryItemDrop")
MS_StoryItemDrop.storyItemDropList = {}
MS_StoryItemDrop.static.FrogDropId = 99998

function MS_StoryItemDrop.Init()
	for k, data in pairs(ES_ItemDropData) do
		local storyId = tonumber(data.StoryId)
		local dropId = tonumber(data.DropId)

		if MS_StoryItemDrop.storyItemDropList[storyId] == nil then
			MS_StoryItemDrop.storyItemDropList[storyId] = {}
		end

		if MS_StoryItemDrop.storyItemDropList[storyId][dropId] == nil then
			MS_StoryItemDrop.storyItemDropList[storyId][dropId] = {}
		end

		data.ItemId = data.ItemId_1
		data.Num1 = data.Num1_1
		data.Num2 = data.Num2_1
		data.Prob = data.Prob_1
		data.ProbAdd1 = data.ProbAdd1_1
		data.ProbAdd2 = data.ProbAdd2_1

		table.insert(MS_StoryItemDrop.storyItemDropList[storyId][dropId], data)
	end
end

function MS_StoryItemDrop.SetLoop(loop)
	for k, v in pairs(MS_StoryItemDrop.storyItemDropList) do
		for _k, _v in pairs(v) do
			for __k, __v in pairs(_v) do
				__v.ItemId = __v["ItemId_" .. loop]
				__v.Num1 = __v["Num1_" .. loop]
				__v.Num2 = __v["Num2_" .. loop]
				__v.Prob = __v["Prob_" .. loop]
				__v.ProbAdd1 = __v["ProbAdd1_" .. loop]
				__v.ProbAdd2 = __v["ProbAdd2_" .. loop]
			end
		end
	end
end

function MS_StoryItemDrop.GetStoryItemDropData(storyId, dropId)
	storyId = tonumber(storyId)
	dropId = tonumber(dropId)

	if MS_StoryItemDrop.storyItemDropList[storyId] ~= nil and MS_StoryItemDrop.storyItemDropList[storyId][dropId] ~= nil then
		return MS_StoryItemDrop.storyItemDropList[storyId][dropId]
	end

	return nil
end
