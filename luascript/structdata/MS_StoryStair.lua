-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryStair.lua

require("GameData/StructData/ExportData/ES_StoryStair")

MS_StoryStair = class("MS_StoryStair")
MS_StoryStair.storyStairList = {}

function MS_StoryStair.Init()
	for k, data in pairs(ES_StoryStair) do
		local storyId = tonumber(data.StoryId)
		local stairId = tonumber(data.StairId)

		if MS_StoryStair.storyStairList[storyId] == nil then
			MS_StoryStair.storyStairList[storyId] = {}
		end

		MS_StoryStair.storyStairList[storyId][stairId] = data
	end
end

function MS_StoryStair.GetStoryStair(storyId, stairId)
	storyId = tonumber(storyId)
	stairId = tonumber(stairId)

	if MS_StoryStair.storyStairList[storyId] ~= nil and MS_StoryStair.storyStairList[storyId][stairId] ~= nil then
		return MS_StoryStair.storyStairList[storyId][stairId]
	end

	return nil
end
