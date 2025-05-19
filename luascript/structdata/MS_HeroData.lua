-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroData.lua

require("GameData/StructData/ExportData/ES_HeroData")

MS_HeroData = class("MS_HeroData")
MS_HeroData.static.Attribute = {
	Brave = 3,
	Generous = 6,
	Dexterous = 4,
	Hidden = 7,
	Spirit = 2,
	Tolerant = 5,
	Strength = 1
}
MS_HeroData.static.AttributeMax = 7
MS_HeroData.static.AttributeValueMax = 99
MS_HeroData.static.HeroLevelMax = 99
MS_HeroData.static.Property = {
	DarkResist = 26,
	ArcaneResist = 25,
	PhysicDamage = 1,
	CritResist = 3,
	CritRate = 4,
	San = 8,
	ArcaneDamage = 21,
	Power = 12,
	ToughnessRecovery = 14,
	Human = 38,
	Beast = 39,
	EnergyRecoveryBlock = 6,
	Sendril = 40,
	CritMpRecovery = 30,
	Toughness = 13,
	PowerDecrement = 42,
	DamageHPRecovery = 28,
	Mp = 7,
	SendrilAdd = 37,
	EnergyRecoveryTime = 27,
	Weakness = 17,
	PoisonResist = 24,
	EnergyRecovery = 15,
	CritDamage = 2,
	DarkDamage = 22,
	PoisonDamage = 20,
	HumanAdd = 35,
	TrophyShield = 33,
	PhysicResist = 10,
	FireResist = 23,
	FireDamage = 19,
	PierceResist = 32,
	Energy = 11,
	WeaknessRecovery = 18,
	RageDecrement = 9,
	BeastAdd = 36,
	Rage = 16,
	PierceDamage = 31,
	Hp = 5,
	SkillShield = 34,
	CritEnergyRecovery = 29,
	PowerRecovery = 41
}
MS_HeroData.static.PropertyMax = 42
MS_HeroData.static.SpecialProperty = {
	BulletRedMax = 106,
	BulletWhiteMax = 102,
	BulletRedNow = 105,
	BulletWhiteNow = 101,
	BulletBlueNow = 103,
	BulletBlueMax = 104
}
MS_HeroData.static.ParamMax = 4
MS_HeroData.static.HeroIconMax = 6
MS_HeroData.static.FrogHeroId = 90008
MS_HeroData.static.DLCHeroId = 10005
MS_HeroData.static.ArcadeHeroId = 10007
MS_HeroData.heroList = {}
MS_HeroData.heroIdList = {}
MS_HeroData.heroEnableIdList = {}
MS_HeroData.enemyEnableIdList = {}
MS_HeroData.animalEnableIdList = {}
MS_HeroData.UIEnableIdList = {}
MS_HeroData.iconAllList = {}
MS_HeroData.iconHeroList = {}
MS_HeroData.iconHeroListArcade = {}

function MS_HeroData.Init()
	for k, data in pairs(ES_HeroData) do
		local heroId = tonumber(data.HeroId)
		local enable = tonumber(data.Enable)
		local enableHost = tonumber(data.EnableHost)
		local callStr = data.CallHeroId

		if callStr ~= "" then
			local tmpCallList = StringHelper.Split(callStr, ";")

			if #tmpCallList > 0 then
				data.CallHeroIdList = {}

				for i = 1, #tmpCallList do
					local callId = tonumber(tmpCallList[i])

					table.insert(data.CallHeroIdList, callId)
				end
			end
		end

		data.CallHeroId = nil
		MS_HeroData.heroList[heroId] = data

		if enableHost > 0 then
			table.insert(MS_HeroData.heroIdList, heroId)

			if enable > 0 then
				table.insert(MS_HeroData.heroEnableIdList, heroId)
				table.insert(MS_HeroData.animalEnableIdList, heroId)
			end
		elseif enable > 0 then
			table.insert(MS_HeroData.enemyEnableIdList, heroId)
			table.insert(MS_HeroData.animalEnableIdList, heroId)
		end

		local UIEnable = tonumber(data.UIEnable)

		if UIEnable > 0 then
			table.insert(MS_HeroData.UIEnableIdList, heroId)
		end
	end

	table.insert(MS_HeroData.iconAllList, 20001)

	for i = 1, MS_HeroData.HeroIconMax do
		table.insert(MS_HeroData.iconHeroList, 10000 + i)
		table.insert(MS_HeroData.iconAllList, 10000 + i)
	end

	table.insert(MS_HeroData.iconHeroListArcade, 10007)
	table.insert(MS_HeroData.iconHeroListArcade, 10001)
	table.insert(MS_HeroData.iconHeroListArcade, 10002)
	table.insert(MS_HeroData.iconHeroListArcade, 10003)
	table.insert(MS_HeroData.iconHeroListArcade, 10004)
	table.insert(MS_HeroData.iconHeroListArcade, 10005)
end

function MS_HeroData.GetSelectHeroIdList()
	return MS_HeroData.heroIdList
end

function MS_HeroData.GetHeroList()
	return MS_HeroData.heroList
end

function MS_HeroData.GetAllIconList()
	return MS_HeroData.iconAllList
end

function MS_HeroData.GetAllIconHeroList()
	return MS_HeroData.iconHeroList
end

function MS_HeroData.GetAllIconHeroListArcade()
	return MS_HeroData.iconHeroListArcade
end

function MS_HeroData.GetEnableAnimalIdList()
	return MS_HeroData.animalEnableIdList
end

function MS_HeroData.GetEnableHeroIdList()
	return MS_HeroData.heroEnableIdList
end

function MS_HeroData.GetUIEnableHeroIdList()
	return MS_HeroData.UIEnableIdList
end

function MS_HeroData.IsAvailableInScene(chkHeroId, storySaveId)
	for k, data in pairs(ES_HeroData) do
		local heroId = tonumber(data.HeroId)
		local available = tonumber(data.Available)

		if heroId == chkHeroId then
			return available <= storySaveId
		end
	end

	return false
end

function MS_HeroData.RefreshLanguage()
	if GameTextData.HeroData == nil then
		return
	end

	for k, v in pairs(MS_HeroData.heroList) do
		if GameTextData.HeroData[tostring(k) .. "Name"] ~= nil then
			v.Name = GameTextData.HeroData[tostring(k) .. "Name"]
		end

		if GameTextData.HeroData[tostring(k) .. "UIDescription"] ~= nil then
			v.UIDescription = GameTextData.HeroData[tostring(k) .. "UIDescription"]
		end

		if GameTextData.HeroData[tostring(k) .. "UISkillDescription"] ~= nil then
			v.UISkillDescription = GameTextData.HeroData[tostring(k) .. "UISkillDescription"]
		end

		if GameTextData.HeroData[tostring(k) .. "UISanityDescription"] ~= nil then
			v.UISanityDescription = GameTextData.HeroData[tostring(k) .. "UISanityDescription"]
		end
	end
end

function MS_HeroData.IsSelectHeroIdList(heroId)
	for k, v in pairs(MS_HeroData.heroIdList) do
		if v == tonumber(heroId) then
			return true
		end
	end

	return false
end

function MS_HeroData.GetHero(heroId)
	heroId = tonumber(heroId)

	if MS_HeroData.heroList[heroId] ~= nil then
		return MS_HeroData.heroList[heroId]
	end

	return nil
end
