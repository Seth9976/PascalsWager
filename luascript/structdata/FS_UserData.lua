-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_UserData.lua

require("LuaScript/Network/NI_Game")
require("LuaScript/Network/NI_Player")
require("LuaScript/StructData/FS_ServerList")
require("LuaScript/StructData/FS_PlayerList")
require("LuaScript/StructData/FS_ItemList")
require("LuaScript/StructData/FS_HeroList")
require("LuaScript/StructData/FS_Chat")
require("LuaScript/StructData/FS_Buddy")
require("LuaScript/StructData/FS_Rank")
require("LuaScript/StructData/FS_SaveStory")
require("LuaScript/StructData/FS_TrophyEquipList")
require("LuaScript/StructData/FS_Achievement")
require("LuaScript/StructData/FS_PlayerBehavior")
require("LuaScript/StructData/FS_Feedback")
require("LuaScript/StructData/FS_Challenge")
require("LuaScript/StructData/FS_Arcade")

FS_UserData = class("FS_UserData")
FS_UserData.serverList = nil
FS_UserData.playerList = nil
FS_UserData.itemList = nil
FS_UserData.heroList = nil
FS_UserData.story = nil
FS_UserData.rank = nil
FS_UserData.chat = nil
FS_UserData.trophy = nil
FS_UserData.feedback = nil
FS_UserData.challenge = nil
FS_UserData.arcade = nil
FS_UserData.playerBehavior = nil

function FS_UserData.Init()
	FS_UserData.serverList = FS_ServerList:new()
	FS_UserData.playerList = FS_PlayerList:new()
	FS_UserData.itemList = FS_ItemList:new()
	FS_UserData.trophy = FS_TrophyEquipList:new()
	FS_UserData.heroList = FS_HeroList:new()
	FS_UserData.story = FS_SaveStory:new()
	FS_UserData.chat = FS_Chat:new()
	FS_UserData.rank = FS_Rank:new()
	FS_UserData.playerBehavior = FS_PlayerBehavior:new()
	FS_UserData.achievement = FS_Achievement:new()
	FS_UserData.feedback = FS_Feedback:new()
	FS_UserData.challenge = FS_Challenge:new()
	FS_UserData.arcade = FS_Arcade:new()
end

function FS_UserData.LoginOut()
	LS_Account.Reset()
	FS_UserData.Clear()
	FS_UserData.Init()
end

function FS_UserData.Reset()
	FS_UserData.itemList:Reset()
	FS_UserData.trophy:Reset()
	FS_UserData.heroList:Reset()
	FS_UserData.story:Reset()
end

function FS_UserData.ResetToChallenge(heroId)
	FS_UserData.itemList:Reset()
	FS_UserData.trophy:Reset()
	FS_UserData.heroList:Reset()
	FS_UserData.story:Reset()

	local challengeHeroData = MS_StoryChallengeHero.GetHeroChallengeData(heroId)

	FS_UserData.trophy:Equip(1, FS_UserData.itemList:CreateTrophyItem(challengeHeroData.Trophy_1, MS_ItemData.GetItemData(challengeHeroData.Trophy_1).Level, nil, false))
	FS_UserData.trophy:Equip(2, FS_UserData.itemList:CreateTrophyItem(challengeHeroData.Trophy_2, MS_ItemData.GetItemData(challengeHeroData.Trophy_2).Level, nil, false))
	FS_UserData.trophy:Equip(3, FS_UserData.itemList:CreateTrophyItem(challengeHeroData.Trophy_3, MS_ItemData.GetItemData(challengeHeroData.Trophy_3).Level, nil, false))
	FS_UserData.trophy:Equip(4, FS_UserData.itemList:CreateTrophyItem(challengeHeroData.Trophy_4, MS_ItemData.GetItemData(challengeHeroData.Trophy_4).Level, nil, false))
	FS_UserData.trophy:Equip(5, FS_UserData.itemList:CreateTrophyItem(challengeHeroData.Trophy_5, MS_ItemData.GetItemData(challengeHeroData.Trophy_5).Level, nil, false))
	FS_UserData.trophy:Equip(6, FS_UserData.itemList:CreateTrophyItem(challengeHeroData.Trophy_6, MS_ItemData.GetItemData(challengeHeroData.Trophy_6).Level, nil, false))

	local attList = {}

	attList[1] = challengeHeroData.Attribute_1
	attList[2] = challengeHeroData.Attribute_2
	attList[3] = challengeHeroData.Attribute_3
	attList[4] = challengeHeroData.Attribute_4
	attList[5] = challengeHeroData.Attribute_5
	attList[6] = challengeHeroData.Attribute_6
	attList[7] = challengeHeroData.Attribute_7

	FS_UserData.heroList:ResetToChallenge(heroId, challengeHeroData.HeroLevel, attList)
end

function FS_UserData.InitArcadeHero(heroId, withoutTalent)
	FS_UserData.itemList:Reset()
	FS_UserData.trophy:Reset()

	local challengeHeroData = MS_ArcadeHero.GetHeroChallengeData(heroId)
	local attList = {}

	attList[1] = challengeHeroData.Attribute_1
	attList[2] = challengeHeroData.Attribute_2
	attList[3] = challengeHeroData.Attribute_3
	attList[4] = challengeHeroData.Attribute_4
	attList[5] = challengeHeroData.Attribute_5
	attList[6] = challengeHeroData.Attribute_6
	attList[7] = challengeHeroData.Attribute_7

	FS_UserData.heroList:ResetToChallenge(heroId, challengeHeroData.HeroLevel, attList, withoutTalent)
end

function FS_UserData.InitArcadeHeroTalent(heroId)
	local talentList = MS_HeroTalent.GetHeroTalent(heroId)

	for talentId, data in pairs(talentList) do
		if data.Achievement ~= nil and data.Achievement ~= 0 and FS_UserData.achievement:GetAchievementFinished(data.Achievement) and FS_UserData.heroList:GetHero(10007):GetHeroTalentLevel(talentId) == 0 then
			local p_data = {}

			p_data.talentId = tonumber(talentId)
			p_data.level = 1

			FS_UserData.heroList:GetHero(10007):ParseTalent(p_data)
		end
	end
end

function FS_UserData.GetTrophyCount()
	if FS_UserData.itemList ~= nil and FS_UserData.trophy ~= nil then
		return FS_UserData.itemList:GetTrophyCount() + FS_UserData.trophy:GetTrophyCount()
	end

	return 0
end

function FS_UserData.Clear()
	if FS_UserData.serverList ~= nil then
		FS_UserData.serverList:Clear()
	end

	FS_UserData.serverList = nil

	if FS_UserData.playerList ~= nil then
		FS_UserData.playerList:Clear()
	end

	FS_UserData.playerList = nil

	if FS_UserData.itemList ~= nil then
		FS_UserData.itemList:Clear()
	end

	FS_UserData.itemList = nil

	if FS_UserData.heroList ~= nil then
		FS_UserData.heroList:Clear()
	end

	FS_UserData.heroList = nil

	if FS_UserData.story ~= nil then
		FS_UserData.story:Clear()
	end

	FS_UserData.story = nil

	if FS_UserData.chat ~= nil then
		FS_UserData.chat:Clear()
	end

	FS_UserData.chat = nil

	if FS_UserData.rank ~= nil then
		FS_UserData.rank:Clear()
	end

	FS_UserData.rank = nil

	if FS_UserData.trophy ~= nil then
		FS_UserData.trophy:Clear()
	end

	FS_UserData.trophy = nil

	if FS_UserData.achievement ~= nil then
		FS_UserData.achievement:Clear()
	end

	FS_UserData.achievement = nil

	if FS_UserData.feedback ~= nil then
		FS_UserData.feedback:Clear()
	end

	FS_UserData.feedback = nil

	if FS_UserData.challenge ~= nil then
		FS_UserData.challenge:Clear()
	end

	FS_UserData.challenge = nil

	if FS_UserData.arcade ~= nil then
		FS_UserData.arcade:Clear()
	end

	FS_UserData.arcade = nil
end
