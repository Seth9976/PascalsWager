-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryVirtualWallHint.lua

require("GameData/StructData/ExportData/ES_StoryVirtualWallHint")

MS_StoryVirtualWallHint = class("MS_StoryVirtualWallHint")
MS_StoryVirtualWallHint.storyVirtualWallHintList = {}

function MS_StoryVirtualWallHint.Init()
	for k, data in pairs(ES_StoryVirtualWallHint) do
		local storyId = tonumber(data.StoryId)
		local virtualWallId = tonumber(data.VirtualWallId)

		if MS_StoryVirtualWallHint.storyVirtualWallHintList[storyId] == nil then
			MS_StoryVirtualWallHint.storyVirtualWallHintList[storyId] = {}
		end

		MS_StoryVirtualWallHint.storyVirtualWallHintList[storyId][virtualWallId] = data
	end
end

function MS_StoryVirtualWallHint.GetStoryVirtualWallHint(storyId, virtualWallId)
	storyId = tonumber(storyId)
	virtualWallId = tonumber(virtualWallId)

	if MS_StoryVirtualWallHint.storyVirtualWallHintList[storyId] ~= nil and MS_StoryVirtualWallHint.storyVirtualWallHintList[storyId][virtualWallId] ~= nil then
		return MS_StoryVirtualWallHint.storyVirtualWallHintList[storyId][virtualWallId]
	end

	return nil
end
