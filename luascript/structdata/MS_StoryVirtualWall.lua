-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryVirtualWall.lua

require("GameData/StructData/ExportData/ES_StoryVirtualWall")

MS_StoryVirtualWall = class("MS_StoryVirtualWall")
MS_StoryVirtualWall.storyVirtualWallList = {}

function MS_StoryVirtualWall.Init()
	for k, data in pairs(ES_StoryVirtualWall) do
		local storyId = tonumber(data.StoryId)
		local virtualWallId = tonumber(data.VirtualWallId)

		if MS_StoryVirtualWall.storyVirtualWallList[storyId] == nil then
			MS_StoryVirtualWall.storyVirtualWallList[storyId] = {}
		end

		MS_StoryVirtualWall.storyVirtualWallList[storyId][virtualWallId] = data
	end
end

function MS_StoryVirtualWall.GetStoryVirtualWall(storyId, virtualWallId)
	storyId = tonumber(storyId)
	virtualWallId = tonumber(virtualWallId)

	if MS_StoryVirtualWall.storyVirtualWallList[storyId] ~= nil and MS_StoryVirtualWall.storyVirtualWallList[storyId][virtualWallId] ~= nil then
		return MS_StoryVirtualWall.storyVirtualWallList[storyId][virtualWallId]
	end

	return nil
end
