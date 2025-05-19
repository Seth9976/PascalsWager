-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryEffect.lua

require("GameData/StructData/ExportData/ES_StoryEffect")

MS_StoryEffect = class("MS_StoryEffect")
MS_StoryEffect.static.Type = {
	MazeBossEntrance = 4,
	Quest = 1,
	MazeEntrance = 3,
	Boss = 2
}
MS_StoryEffect.storyQuestEffectList = {}

function MS_StoryEffect.Init()
	for k, data in pairs(ES_StoryEffect) do
		local storyId = tonumber(data.StoryId)
		local EffectId = tonumber(data.EffectId)

		if MS_StoryEffect.storyQuestEffectList[storyId] == nil then
			MS_StoryEffect.storyQuestEffectList[storyId] = {}
		end

		MS_StoryEffect.storyQuestEffectList[storyId][EffectId] = data
	end
end

function MS_StoryEffect.GetStoryQuestEffect(storyId)
	storyId = tonumber(storyId)

	return MS_StoryEffect.storyQuestEffectList[storyId]
end
