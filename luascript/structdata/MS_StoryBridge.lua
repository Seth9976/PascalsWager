-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryBridge.lua

require("GameData/StructData/ExportData/ES_StoryBridge")

MS_StoryBridge = class("MS_StoryBridge")
MS_StoryBridge.storyBridgeList = {}

function MS_StoryBridge.Init()
	for k, data in pairs(ES_StoryBridge) do
		local storyId = tonumber(data.StoryId)
		local bridgeId = tonumber(data.BridgeId)

		if MS_StoryBridge.storyBridgeList[storyId] == nil then
			MS_StoryBridge.storyBridgeList[storyId] = {}
		end

		MS_StoryBridge.storyBridgeList[storyId][bridgeId] = data
	end
end

function MS_StoryBridge.GetStoryBridge(storyId, bridgeId)
	storyId = tonumber(storyId)
	bridgeId = tonumber(bridgeId)

	if MS_StoryBridge.storyBridgeList[storyId] ~= nil and MS_StoryBridge.storyBridgeList[storyId][bridgeId] ~= nil then
		return MS_StoryBridge.storyBridgeList[storyId][bridgeId]
	end

	return nil
end
