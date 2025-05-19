-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryTimeLine.lua

require("GameData/StructData/ExportData/ES_StoryTimeLine")

MS_StoryTimeLine = class("MS_StoryTimeLine")
MS_StoryTimeLine.storyTimeLineList = {}
MS_StoryTimeLine.static.TimeLineTriggerTime1 = 2
MS_StoryTimeLine.static.TimeLineTriggerTime2 = 7
MS_StoryTimeLine.static.TimeLineTriggerTime3 = 9
MS_StoryTimeLine.static.TimeLineTriggerTime4 = 19.25
MS_StoryTimeLine.static.TimeLineTriggerTime5 = 70
MS_StoryTimeLine.static.TimeLineTriggerTime5_Demo = 66

function MS_StoryTimeLine.Init()
	for k, data in pairs(ES_StoryTimeLine) do
		local storyId = tonumber(data.StoryId)
		local timeLineId = tonumber(data.TimeLineId)

		if MS_StoryTimeLine.storyTimeLineList[storyId] == nil then
			MS_StoryTimeLine.storyTimeLineList[storyId] = {}
		end

		MS_StoryTimeLine.storyTimeLineList[storyId][timeLineId] = data
	end
end

function MS_StoryTimeLine.GetStoryTimeLineAll(storyId)
	storyId = tonumber(storyId)

	return MS_StoryTimeLine.storyTimeLineList[storyId]
end

function MS_StoryTimeLine.GetStoryTimeLine(storyId, timeLineId)
	storyId = tonumber(storyId)
	timeLineId = tonumber(timeLineId)

	if MS_StoryTimeLine.storyTimeLineList[storyId] ~= nil and MS_StoryTimeLine.storyTimeLineList[storyId][timeLineId] ~= nil then
		return MS_StoryTimeLine.storyTimeLineList[storyId][timeLineId]
	end

	return nil
end
