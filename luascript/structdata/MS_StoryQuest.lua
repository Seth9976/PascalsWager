-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryQuest.lua

require("GameData/StructData/ExportData/ES_StoryQuest")

MS_StoryQuest = class("MS_StoryQuest")
MS_StoryQuest.static.GameOverQuestId = 88888
MS_StoryQuest.static.GameLoopQuestId = "99999"
MS_StoryQuest.static.CageQuest = "72201"
MS_StoryQuest.static.DLCHeroJoinQuest = "95162"
MS_StoryQuest.static.CageDialogId = 74113
MS_StoryQuest.static.QuestIdStart = 10000
MS_StoryQuest.static.QuestArcadeStart = 10010000
MS_StoryQuest.static.QuestArcadeAllModeStart = 10090001
MS_StoryQuest.storyQuestList = {}
MS_StoryQuest.static.MazeBossQuest = {
	4991001,
	4991002,
	4991003,
	4991004
}
MS_StoryQuest.static.MazeFinalBossQuest = 4991005
MS_StoryQuest.static.MazeBossDialogQuest = 4992

function MS_StoryQuest.Init()
	for k, data in pairs(ES_StoryQuest) do
		local storyId = tonumber(data.StoryId)
		local questId = tonumber(data.QuestId)

		MS_StoryQuest.storyQuestList[questId] = data
	end
end

function MS_StoryQuest.GetQuestData(questId)
	questId = tonumber(questId)

	if MS_StoryQuest.storyQuestList[questId] ~= nil then
		return MS_StoryQuest.storyQuestList[questId]
	end

	return nil
end
