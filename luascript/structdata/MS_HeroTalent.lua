-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroTalent.lua

require("GameData/StructData/ExportData/ES_HeroTalent")

MS_HeroTalent = class("MS_HeroTalent")
MS_HeroTalent.talentList = {}
MS_HeroTalent.talentListId = {}
MS_HeroTalent.static.Type = {
	StatusBloodCritRateAdd = 96,
	SkillToughnessAdd = 24,
	SkillSanAdd = 29,
	EatSpeedUp = 91,
	ItemValueAdd = 41,
	SanSkillWeaknessRate = 70,
	ItemMpMaxAdd = 45,
	PropertyAdd = 93,
	ItemNoSub = 50,
	SkillToughnessSubAdd = 36,
	SkillGuardBreakAdd = 12,
	SanItemValueChangeRate = 65,
	SanItemStatusChange = 64,
	SkillAddStatus = 39,
	SkillRageSub = 38,
	SanRageSubInSkillToughness = 73,
	SanPropertyChangeRate = 63,
	SkillGuardAdd = 11,
	SanCritStatusRate = 66,
	SkillPowerAdd = 35,
	ItemStatusTimeAdd = 42,
	HitAddPower = 94,
	SkillSanGuardAdd = 13,
	ItemSanSubRecovery = 47,
	SkillDefenceEnergySub = 25,
	SanKillAdd = 4,
	ComboAttackSubEnergy = 103,
	TalentGroup = 999,
	SkillWeaknessSubBaseOnRageAdd = 20,
	SkillCritDamageAdd = 28,
	ItemProbAdd = 43,
	AddChangeBuffer2 = 107,
	SkillSanPermit = 37,
	SkillDamageSubAdd = 34,
	SanRageReserve = 72,
	SanLockSub = 1,
	BeatbackChangeBuffer = 104,
	SkillBeatBack = 33,
	ColorBulletAdd = 99,
	BlockAddPower = 102,
	SkillWeaknessSubAdd = 22,
	SanFirstSub = 2,
	SpecialCombo = 105,
	ColorBulletMaxAdd = 98,
	SanPropertyChangeValue = 68,
	ItemHpMaxAdd = 44,
	SanEventAdd = 3,
	SanDarkStatusRageAdd = 71,
	ItemStatusValueAdd = 48,
	ItemSanAdd = 46,
	SanPropertyRateAdd = 62,
	SkillCondition = 31,
	ItemBlessChance = 49,
	HitAddRage = 92,
	SanHpLowDamageAddRate = 69,
	SkillRageAdd = 26,
	SanAttackSub = 5,
	SanPropertyValueAdd = 67,
	SkillOpen = 30,
	AddChangeBuffer = 106,
	SkillComboWeaknessSubAdd = 14,
	SkillMuteki = 32,
	SkillEnergySub = 23,
	StatusChange = 95,
	ParryUse = 101,
	SkillCritRateAdd = 27,
	SkillDamageAdd = 21,
	ExecuteRangeDamage = 100,
	SanDodgeRecovery = 61,
	NoBullet = 97
}
MS_HeroTalent.static.SkillTypeMin = 11
MS_HeroTalent.static.SkillTypeMax = 40

function MS_HeroTalent.Init()
	for k, data in pairs(ES_HeroTalent) do
		local talentId = tonumber(data.TalentId)
		local talentType = tonumber(data.Type)
		local heroId = tonumber(data.HeroId)

		if MS_HeroTalent.talentList[heroId] == nil then
			MS_HeroTalent.talentList[heroId] = {}
		end

		MS_HeroTalent.talentList[heroId][talentId] = data
		MS_HeroTalent.talentList[heroId][talentId].ConditionString = data.Condition
		MS_HeroTalent.talentList[heroId][talentId].Condition = MS_HeroTalentCondition:new(talentId, talentType, data.Condition)
		MS_HeroTalent.talentListId[talentId] = MS_HeroTalent.talentList[heroId][talentId]
	end
end

function MS_HeroTalent.RefreshLanguage()
	if GameTextData.HeroTalent == nil then
		return
	end

	for k, v in pairs(MS_HeroTalent.talentList) do
		for _k, _v in pairs(v) do
			if GameTextData.HeroTalent[tostring(_k)] ~= nil then
				_v.TalentName = GameTextData.HeroTalent[tostring(_k)]
			end
		end
	end

	for k, v in pairs(MS_HeroTalent.talentList) do
		for _k, _v in pairs(v) do
			if GameTextData.HeroTalent[tostring(_k) .. "TalentText"] ~= nil then
				_v.TalentText = GameTextData.HeroTalent[tostring(_k) .. "TalentText"]
			end
		end
	end

	for k, v in pairs(MS_HeroTalent.talentList) do
		for _k, _v in pairs(v) do
			if GameTextData.HeroTalent[tostring(_k) .. "TalentTextKeyboard"] ~= nil then
				_v.TalentTextKeyboard = GameTextData.HeroTalent[tostring(_k) .. "TalentTextKeyboard"]
			end
		end
	end
end

function MS_HeroTalent.GetTalentIconList()
	local talentIconList = {}

	for k, v in pairs(MS_HeroTalent.talentList) do
		for _k, _v in pairs(v) do
			local talentParent = tonumber(_v.TalentParent)

			if talentParent == 0 then
				table.insert(talentIconList, _v.Icon)
			end
		end
	end

	table.insert(talentIconList, 11100)
	table.insert(talentIconList, 11200)
	table.insert(talentIconList, 11300)
	table.insert(talentIconList, 11400)

	return talentIconList
end

function MS_HeroTalent.GetHeroTalent(heroId)
	if MS_HeroTalent.talentList[tonumber(heroId)] ~= nil then
		return MS_HeroTalent.talentList[tonumber(heroId)]
	end
end

function MS_HeroTalent.GetHeroTalentData(talentId)
	if MS_HeroTalent.talentListId[tonumber(talentId)] ~= nil then
		return MS_HeroTalent.talentListId[tonumber(talentId)]
	end
end

function MS_HeroTalent.IsTalentExist(heroId, pos)
	if MS_HeroTalent.talentList[tonumber(heroId)] ~= nil then
		for k, v in pairs(MS_HeroTalent.talentList[tonumber(heroId)]) do
			if v.TalentPos == pos then
				return true
			end
		end
	end

	return false
end

function MS_HeroTalent.GetHeroTalentValue(heroId, type, param1, param2)
	local talentDataList = MS_HeroTalent.GetHeroTalent(heroId)
	local ret = 0

	if talentDataList ~= nil then
		for k, v in pairs(talentDataList) do
			local tmpId = tonumber(v.TalentId)
			local tmpType = tonumber(v.Type)

			if tmpType ~= MS_HeroTalent.Type.TalentGroup then
				local tmpParentId = tonumber(v.TalentParent)
				local tmpLevel = 1

				if tmpType == type then
					local permit = v.Condition:IsConditionPermit(tonumber(param1), tonumber(param2))

					if permit == true then
						ret = ret + tonumber(v.Value) + tonumber(v.ValueAdd) * (tmpLevel - 1)
					end
				end
			end
		end
	end

	return ret
end
