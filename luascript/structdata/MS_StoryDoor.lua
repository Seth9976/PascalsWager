-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryDoor.lua

require("GameData/StructData/ExportData/ES_StoryDoor")

MS_StoryDoor = class("MS_StoryDoor")
MS_StoryDoor.storyDoorList = {}

function MS_StoryDoor.Init()
	for k, data in pairs(ES_StoryDoor) do
		local storyId = tonumber(data.StoryId)
		local doorId = tonumber(data.DoorId)

		if MS_StoryDoor.storyDoorList[storyId] == nil then
			MS_StoryDoor.storyDoorList[storyId] = {}
		end

		MS_StoryDoor.storyDoorList[storyId][doorId] = data
	end
end

function MS_StoryDoor.GetStoryDoor(storyId, doorId)
	storyId = tonumber(storyId)
	doorId = tonumber(doorId)

	if MS_StoryDoor.storyDoorList[storyId] ~= nil and MS_StoryDoor.storyDoorList[storyId][doorId] ~= nil then
		return MS_StoryDoor.storyDoorList[storyId][doorId]
	end

	return nil
end
