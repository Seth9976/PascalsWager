-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryTimeLineSubtitle.lua

require("GameData/StructData/ExportData/ES_StoryTimeLineSubtitle")

MS_StoryTimeLineSubtitle = class("MS_StoryTimeLineSubtitle")
MS_StoryTimeLineSubtitle.subtitleList = {}

function MS_StoryTimeLineSubtitle.Init()
	for k, data in pairs(ES_StoryTimeLineSubtitle) do
		local storyId = tonumber(data.StoryId)
		local timeLineId = tonumber(data.TimeLineId)

		if MS_StoryTimeLineSubtitle.subtitleList[storyId] == nil then
			MS_StoryTimeLineSubtitle.subtitleList[storyId] = {}
		end

		if MS_StoryTimeLineSubtitle.subtitleList[storyId][timeLineId] == nil then
			MS_StoryTimeLineSubtitle.subtitleList[storyId][timeLineId] = {}
		end

		table.insert(MS_StoryTimeLineSubtitle.subtitleList[storyId][timeLineId], data)
	end
end

function MS_StoryTimeLineSubtitle.GetSubtitleList(storyId, timeLineId)
	storyId = tonumber(storyId)
	timeLineId = tonumber(timeLineId)

	if MS_StoryTimeLineSubtitle.subtitleList[storyId] ~= nil and MS_StoryTimeLineSubtitle.subtitleList[storyId][timeLineId] ~= nil then
		return MS_StoryTimeLineSubtitle.subtitleList[storyId][timeLineId]
	end

	return nil
end
