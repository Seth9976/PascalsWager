-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryDoorHint.lua

require("GameData/StructData/ExportData/ES_StoryDoorHint")

MS_StoryDoorHint = class("MS_StoryDoorHint")
MS_StoryDoorHint.storyDoorHintList = {}

function MS_StoryDoorHint.Init()
	for k, data in pairs(ES_StoryDoorHint) do
		local storyId = tonumber(data.StoryId)
		local doorId = tonumber(data.DoorId)

		if MS_StoryDoorHint.storyDoorHintList[storyId] == nil then
			MS_StoryDoorHint.storyDoorHintList[storyId] = {}
		end

		MS_StoryDoorHint.storyDoorHintList[storyId][doorId] = data
	end
end

function MS_StoryDoorHint.GetStoryDoorHint(storyId, doorId)
	storyId = tonumber(storyId)
	doorId = tonumber(doorId)

	if MS_StoryDoorHint.storyDoorHintList[storyId] ~= nil and MS_StoryDoorHint.storyDoorHintList[storyId][doorId] ~= nil then
		return MS_StoryDoorHint.storyDoorHintList[storyId][doorId]
	end

	return nil
end
