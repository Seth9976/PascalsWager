-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryCarriage.lua

require("GameData/StructData/ExportData/ES_StoryCarriage")

MS_StoryCarriage = class("MS_StoryCarriage")
MS_StoryCarriage.storyCarriageList = {}

function MS_StoryCarriage.Init()
	for k, data in pairs(ES_StoryCarriage) do
		local storyId = tonumber(data.StoryId)
		local carriageId = tonumber(data.CarriageId)

		if MS_StoryCarriage.storyCarriageList[storyId] == nil then
			MS_StoryCarriage.storyCarriageList[storyId] = {}
		end

		MS_StoryCarriage.storyCarriageList[storyId][carriageId] = data
	end
end

function MS_StoryCarriage.GetStoryCarriageData(storyId, carriageId)
	storyId = tonumber(storyId)
	carriageId = tonumber(carriageId)

	return MS_StoryCarriage.storyCarriageList[storyId][carriageId]
end
