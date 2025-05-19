-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StorySubtitle.lua

require("GameData/StructData/ExportData/ES_StorySubtitle")

MS_StorySubtitle = class("MS_StorySubtitle")
MS_StorySubtitle.subtitleList = {}

function MS_StorySubtitle.Init()
	for k, data in pairs(ES_StorySubtitle) do
		local storyId = tonumber(data.StoryId)
		local movieId = tonumber(data.MovieId)

		if MS_StorySubtitle.subtitleList[storyId] == nil then
			MS_StorySubtitle.subtitleList[storyId] = {}
		end

		if MS_StorySubtitle.subtitleList[storyId][movieId] == nil then
			MS_StorySubtitle.subtitleList[storyId][movieId] = {}
		end

		table.insert(MS_StorySubtitle.subtitleList[storyId][movieId], data)
	end
end

function MS_StorySubtitle.GetSubtitleList(storyId, movieId)
	storyId = tonumber(storyId)
	movieId = tonumber(movieId)

	if MS_StorySubtitle.subtitleList[storyId] ~= nil and MS_StorySubtitle.subtitleList[storyId][movieId] ~= nil then
		return MS_StorySubtitle.subtitleList[storyId][movieId]
	end

	return nil
end
