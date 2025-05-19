-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryElevator.lua

require("GameData/StructData/ExportData/ES_StoryElevator")

MS_StoryElevator = class("MS_StoryElevator")
MS_StoryElevator.storyElevatorList = {}

function MS_StoryElevator.Init()
	for k, data in pairs(ES_StoryElevator) do
		local storyId = tonumber(data.StoryId)
		local elevatorId = tonumber(data.ElevatorId)

		if MS_StoryElevator.storyElevatorList[storyId] == nil then
			MS_StoryElevator.storyElevatorList[storyId] = {}
		end

		MS_StoryElevator.storyElevatorList[storyId][elevatorId] = data
	end
end

function MS_StoryElevator.GetStoryElevator(storyId, elevatorId)
	storyId = tonumber(storyId)
	elevatorId = tonumber(elevatorId)

	if MS_StoryElevator.storyElevatorList[storyId] ~= nil and MS_StoryElevator.storyElevatorList[storyId][elevatorId] ~= nil then
		return MS_StoryElevator.storyElevatorList[storyId][elevatorId]
	end

	return nil
end
