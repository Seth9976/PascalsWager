-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryGateHint.lua

require("GameData/StructData/ExportData/ES_StoryGateHint")

MS_StoryGateHint = class("MS_StoryGateHint")
MS_StoryGateHint.storyGateHintList = {}

function MS_StoryGateHint.Init()
	for k, data in pairs(ES_StoryGateHint) do
		local storyId = tonumber(data.StoryId)
		local gateId = tonumber(data.GateId)

		if MS_StoryGateHint.storyGateHintList[storyId] == nil then
			MS_StoryGateHint.storyGateHintList[storyId] = {}
		end

		MS_StoryGateHint.storyGateHintList[storyId][gateId] = data
	end
end

function MS_StoryGateHint.GetStoryGateHint(storyId, gateId)
	storyId = tonumber(storyId)
	gateId = tonumber(gateId)

	if MS_StoryGateHint.storyGateHintList[storyId] ~= nil and MS_StoryGateHint.storyGateHintList[storyId][gateId] ~= nil then
		return MS_StoryGateHint.storyGateHintList[storyId][gateId]
	end

	return nil
end
