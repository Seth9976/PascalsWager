-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryWall.lua

require("GameData/StructData/ExportData/ES_StoryWall")

MS_StoryWall = class("MS_StoryWall")
MS_StoryWall.static.Type = {
	Boss = 2,
	Quest = 1
}
MS_StoryWall.storyQuestWallList = {}
MS_StoryWall.static.SpecialWallId = 1999

function MS_StoryWall.Init()
	for k, data in pairs(ES_StoryWall) do
		local storyId = tonumber(data.StoryId)
		local WallId = tonumber(data.WallId)

		if MS_StoryWall.storyQuestWallList[storyId] == nil then
			MS_StoryWall.storyQuestWallList[storyId] = {}
		end

		MS_StoryWall.storyQuestWallList[storyId][WallId] = data
	end
end

function MS_StoryWall.GetStoryQuestWall(storyId)
	storyId = tonumber(storyId)

	return MS_StoryWall.storyQuestWallList[storyId]
end
