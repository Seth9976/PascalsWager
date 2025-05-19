-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryStairKick.lua

require("GameData/StructData/ExportData/ES_StoryStairKick")

MS_StoryStairKick = class("MS_StoryStairKick")
MS_StoryStairKick.storyStairKickList = {}

function MS_StoryStairKick.Init()
	for k, data in pairs(ES_StoryStairKick) do
		local storyId = tonumber(data.StoryId)
		local stairKickId = tonumber(data.StairKickId)

		if MS_StoryStairKick.storyStairKickList[storyId] == nil then
			MS_StoryStairKick.storyStairKickList[storyId] = {}
		end

		MS_StoryStairKick.storyStairKickList[storyId][stairKickId] = data
	end
end

function MS_StoryStairKick.GetStoryStairKick(storyId, stairKickId)
	storyId = tonumber(storyId)
	stairKickId = tonumber(stairKickId)

	if MS_StoryStairKick.storyStairKickList[storyId] ~= nil and MS_StoryStairKick.storyStairKickList[storyId][stairKickId] ~= nil then
		return MS_StoryStairKick.storyStairKickList[storyId][stairKickId]
	end

	return nil
end
