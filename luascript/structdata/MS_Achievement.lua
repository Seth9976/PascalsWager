-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_Achievement.lua

require("GameData/StructData/ExportData/ES_Achievement")

MS_Achievement = class("MS_Achievement")
MS_Achievement.static.AchievementType = {
	Quest = 1,
	None = 0
}
MS_Achievement.static.AchievementIdType = {
	FirstTimeBless = 10010,
	OnlyUseTalenceInOneGame = 12013,
	PlaySecondTime = 20001,
	AlchemyAllItem = 12001,
	ClearArcadeModeFirstTime = 60003,
	GetUndeadBottle = 20002,
	AttactItemAlchemy = 11007,
	Death = 11010,
	TrophyAlchemy = 11008,
	StrengthTrophySix = 20003,
	LuanShiJiaRen = 10017,
	AddDLCHeroAllTalent = 40008,
	FirstTimeInSan = 11001,
	killAllBossPerfectInCustomMode = 50001,
	GetAllAchievement = 12014,
	killAllBossInCustomMode = 50002,
	killAllBossInNormalModeVeryHard = 50003,
	FindAllHandPaper = 12003,
	AddFiveTalent = 12007,
	GetAllSInArcadeNormal = 60012,
	ParryTimesInTime = 60013,
	MissEnemyHitThreeTimes = 60014,
	GetSpecialTrophy = 12005,
	FirstTimeIntoDarkFog = 11003,
	AssistConsumeItemAlchemy = 11006,
	KillAllBossInSanInOneGame = 12011,
	FirstTimeAddTalent = 11002,
	FinishAllSubQuest = 12009,
	AddArcadeHeroAllTalent = 60002,
	GetAllAlchemyFormula = 12006,
	FirstTimeDoAlchemy = 11004,
	ClearArcadeModeHardLevelByArcadeHero = 60004,
	FindAllHandPaperInDLC = 40004,
	FindAllDarkEssence = 12002,
	UnnormalDuration = 12010,
	AddAllTalent = 20004,
	CompleteFourTimesGameWithoutNoobItem = 20005,
	FindAllFrog = 12004,
	FindAllDarkFog = 12008,
	killTerrsaWithOtherHero = 50004,
	AllRoleAliveInOneGame = 12012,
	GetUnnormalElement = 11009,
	FirstTimeKillBossInSan = 11005,
	killAllArcadeMonster = 60001
}
MS_Achievement.static.BeforeSecondTime = 20000
MS_Achievement.static.InSanDuration = 18000
MS_Achievement.static.SpecialTrophyId = 60075
MS_Achievement.static.UndeadBottleId = 60080
MS_Achievement.static.LastBossId = 8001
MS_Achievement.static.TideLastBossId = 9078
MS_Achievement.static.ArcadeMonsterList = {
	1001054,
	1002088,
	1003088,
	1004065,
	10050137,
	10060135,
	1007095
}
MS_Achievement.achievementList = {}
MS_Achievement.questAchievementList = {}
MS_Achievement.achievementIconList = {}

function MS_Achievement.Init()
	for k, data in pairs(ES_Achievement) do
		local achievementId = data.AchievementId

		MS_Achievement.achievementList[achievementId] = data

		table.insert(MS_Achievement.achievementIconList, data.Icon)

		if data.Type == MS_Achievement.AchievementType.Quest then
			MS_Achievement.questAchievementList[tonumber(data.Quest)] = data
		end
	end
end

function MS_Achievement.RefreshLanguage()
	if GameTextData.Achievement == nil then
		return
	end

	for k, v in pairs(MS_Achievement.achievementList) do
		if GameTextData.Achievement[tostring(k)] ~= nil then
			v.Title = GameTextData.Achievement[tostring(k)]
		end

		if GameTextData.Achievement[tostring(k) .. "Text"] ~= nil then
			v.Text = GameTextData.Achievement[tostring(k) .. "Text"]
		end
	end
end

function MS_Achievement.GetAchievement(achievementId)
	if achievementId == nil then
		return nil
	end

	achievementId = tonumber(achievementId)

	if MS_Achievement.achievementList[achievementId] ~= nil then
		return MS_Achievement.achievementList[achievementId]
	end

	return nil
end

function MS_Achievement.GetAchievementList()
	return MS_Achievement.achievementList
end

function MS_Achievement.GetAchievementListWithoutId(tab)
	local ret = {}

	for k, v in pairs(MS_Achievement.achievementList) do
		if v.Tab == tab then
			table.insert(ret, v)
		end
	end

	table.sort(ret, function(a, b)
		return tonumber(a.Sort) < tonumber(b.Sort)
	end)

	return ret
end

function MS_Achievement.GetAchievementIconList()
	return MS_Achievement.achievementIconList
end
