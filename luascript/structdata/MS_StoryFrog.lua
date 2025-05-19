-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryFrog.lua

require("GameData/StructData/ExportData/ES_StoryFrog")

MS_StoryFrog = class("MS_StoryFrog")
MS_StoryFrog.storyFrogList = {}
MS_StoryFrog.storyFrogCountList = {}

function MS_StoryFrog.Init()
	for k, data in pairs(ES_StoryFrog) do
		local frogId = tonumber(data.FrogId)

		if MS_StoryFrog.storyFrogList[frogId] == nil then
			MS_StoryFrog.storyFrogList[frogId] = {}
		end

		local storyId = Mathf.Floor(frogId / 1000)

		if MS_StoryFrog.storyFrogCountList[storyId] == nil then
			MS_StoryFrog.storyFrogCountList[storyId] = 1
		else
			MS_StoryFrog.storyFrogCountList[storyId] = MS_StoryFrog.storyFrogCountList[storyId] + 1
		end

		MS_StoryFrog.storyFrogList[frogId] = data
	end
end

function MS_StoryFrog.GetStoryFrog(frogId)
	frogId = tonumber(frogId)

	if MS_StoryFrog.storyFrogList[frogId] ~= nil then
		return MS_StoryFrog.storyFrogList[frogId]
	end

	return nil
end

function MS_StoryFrog.GetStoryFrogCount(storyId)
	storyId = tonumber(storyId)

	if MS_StoryFrog.storyFrogCountList[storyId] ~= nil then
		return MS_StoryFrog.storyFrogCountList[storyId]
	end

	return 0
end
