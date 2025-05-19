-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryChallenge.lua

require("GameData/StructData/ExportData/ES_StoryChallenge")

MS_StoryChallenge = class("MS_StoryChallenge")
MS_StoryChallenge.StoryChallengeList = {}
MS_StoryChallenge.StoryChallengeBossList = {}
MS_StoryChallenge.StoryChallengeBossIdList = {}
MS_StoryChallenge.StoryChallengeNotDLCBossIdList = {}
MS_StoryChallenge.static.ChallengeMode = {
	Custom = 2,
	Normal = 1
}
MS_StoryChallenge.static.ChallengeLevel = {
	Hard = 3,
	VeryHard = 4,
	Normal = 2,
	Custom = 5,
	Easy = 1
}

function MS_StoryChallenge.Init()
	for k, data in pairs(ES_StoryChallenge) do
		local StoryId = tonumber(data.StoryId)
		local Area = tonumber(data.Area)
		local HeroId = tonumber(data.HeroId)

		if MS_StoryChallenge.StoryChallengeList[StoryId] == nil then
			MS_StoryChallenge.StoryChallengeList[StoryId] = {}
		end

		MS_StoryChallenge.StoryChallengeList[StoryId][Area] = data
		MS_StoryChallenge.StoryChallengeBossList[HeroId] = data

		table.insert(MS_StoryChallenge.StoryChallengeBossIdList, HeroId)

		if data.DLCBoss == 0 then
			table.insert(MS_StoryChallenge.StoryChallengeNotDLCBossIdList, HeroId)
		end
	end
end

function MS_StoryChallenge.GetBossId(storyId, area)
	if MS_StoryChallenge.StoryChallengeList[storyId] ~= nil and MS_StoryChallenge.StoryChallengeList[storyId][area] ~= nil then
		return MS_StoryChallenge.StoryChallengeList[storyId][area].BossId
	end

	return nil
end

function MS_StoryChallenge.GetHeroIdList()
	return MS_StoryChallenge.StoryChallengeBossIdList
end

function MS_StoryChallenge.GetDataByHeroId(heroId)
	return MS_StoryChallenge.StoryChallengeBossList[heroId]
end

function MS_StoryChallenge.GetAllHero()
	return MS_StoryChallenge.StoryChallengeBossList
end

function MS_StoryChallenge.GetAllNotDLCHero()
	return MS_StoryChallenge.StoryChallengeNotDLCBossIdList
end
