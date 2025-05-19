-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryGate.lua

require("GameData/StructData/ExportData/ES_StoryGate")

MS_StoryGate = class("MS_StoryGate")
MS_StoryGate.storyGateList = {}

function MS_StoryGate.Init()
	for k, data in pairs(ES_StoryGate) do
		local storyId = tonumber(data.StoryId)
		local gateId = tonumber(data.GateId)

		if MS_StoryGate.storyGateList[storyId] == nil then
			MS_StoryGate.storyGateList[storyId] = {}
		end

		MS_StoryGate.storyGateList[storyId][gateId] = data
	end
end

function MS_StoryGate.GetStoryGate(storyId, gateId)
	storyId = tonumber(storyId)
	gateId = tonumber(gateId)

	if MS_StoryGate.storyGateList[storyId] ~= nil and MS_StoryGate.storyGateList[storyId][gateId] ~= nil then
		return MS_StoryGate.storyGateList[storyId][gateId]
	end

	return nil
end
