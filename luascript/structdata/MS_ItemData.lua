-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_ItemData.lua

require("GameData/StructData/ExportData/ES_ItemData")
require("GameData/StructData/ExportData/ES_WeaponData")
require("GameData/StructData/ExportData/ES_TrophyData")

MS_ItemData = class("MS_ItemData")
MS_ItemData.ItemList = {}
MS_ItemData.WeaponList = {}
MS_ItemData.TrophyList = {}
MS_ItemData.itemIconList = {}
MS_ItemData.static.Type = {
	TrophyScars = 601,
	TrophyNightmare = 603,
	Bullet = 209,
	MedcineStone = 802,
	Exp = 401,
	Quest = 101,
	Frog = 211,
	MedcineDefense = 204,
	OtherMaterial = 706,
	ThrowStraightLine = 301,
	RecastStone = 804,
	TrophyMaterial = 701,
	TrophyStone = 801,
	StrengthenStone = 803,
	MedcineStrengthen = 205,
	SubTime = 712,
	DarkCurrency = 402,
	Reborn = 208,
	Document = 710,
	TrophyResistance = 602,
	TrophyBox = 711,
	SceneMark = 210,
	MedcineMaterial = 702,
	Formula = 709,
	Teleport = 206,
	HpRecovery = 201,
	MpRecovery = 202,
	DominatorCrystal = 403,
	MedcineRecovery = 203,
	ThrowParabola = 302,
	Talent = 501,
	NoDebuffer = 207,
	MazeCoin = 404
}
MS_ItemData.static.MainType = {
	Talent = 5,
	Attack = 3,
	Material = 7,
	Consume = 2,
	Exp = 4,
	Quest = 1,
	Trophy = 6,
	Stone = 8
}
MS_ItemData.static.TrophyQuality = {
	Common = 1,
	Secondary = 2
}
MS_ItemData.static.TrophyLogicType = {
	Shield = 107,
	Silent = 112,
	AutoGetItem = 111,
	EatToughnessAdd = 110,
	DodgeEnergyAdd = 129,
	DeadDropSub = 117,
	DamageSuckHp = 101,
	DamageSubHp = 102,
	ShowDamageValue = 113,
	HPHalfPhysicResistAdd = 118,
	SanElementResistAdd = 123,
	DamagePerSec = 108,
	SanAttackAdd = 121,
	HPMaxAttackAdd = 104,
	CrazySanSubSlow = 124,
	CriticalEnergyAdd = 103,
	HPHalElementResistAdd = 126,
	GetDeathDropItem = 131,
	HPHalfAttackAdd = 105,
	NoDeath = 106,
	HPMaxPhysicResistAdd = 128,
	ResistSubSan = 116,
	SanPhysicResistAdd = 122,
	AlwaysSan = 119,
	DeathDisappear = 114,
	DodgeEnergySub = 109,
	ShieldSmall = 120,
	PierceMuteki = 115,
	HPHalfRageAdd = 125,
	ChangeSendrilProperty = 130,
	HPMaxElementResistAdd = 127
}
MS_ItemData.static.StatusId_TrophyNoDeath = 10025
MS_ItemData.static.StatusId_TrophyShield = 10026
MS_ItemData.static.StatusId_TrophyShieldSmall = 10079
MS_ItemData.static.StatusId_MarkScene = 10083
MS_ItemData.static.StatusId_MarkSceneMaze = 10097
MS_ItemData.static.TrophyMax = 6
MS_ItemData.static.ItemUnknownIcon = 99999
MS_ItemData.static.HpItemIcon = 40100
MS_ItemData.static.SanItemIcon = 40101
MS_ItemData.static.ItemID_HpAdd = 20001
MS_ItemData.static.ItemID_MpAdd = 20002
MS_ItemData.static.ItemID_BulletAdd = 20009
MS_ItemData.static.ItemID_SanAdd = 20020
MS_ItemData.static.ItemID_MoveFast = 20031
MS_ItemData.static.ItemID_FogFar = 20033
MS_ItemData.static.ItemID_SanAddMaze = 20030
MS_ItemData.static.UnnormalElement = 40011
MS_ItemData.static.DarkShard = 40031
MS_ItemData.static.NoobItem = 10018
MS_ItemData.static.TeleportUseExpItem = 26001
MS_ItemData.static.TeleportInArcadeMode = 90001
MS_ItemData.static.TeleportUseSelf = 26002
MS_ItemData.static.SceneMarkItem = 26003
MS_ItemData.static.SceneMarkItemCountMax = 10
MS_ItemData.static.SceneMarkItemMaze = 26004
MS_ItemData.static.SceneMarkItemMazeTime = 60
MS_ItemData.static.FrogItemId = 20008
MS_ItemData.static.ItemID_ExpAddList = {
	40001,
	40002,
	40003,
	40004,
	40011,
	40021,
	40031
}
MS_ItemData.static.ItemID_TalentAddList = {
	50001,
	50002,
	50003,
	50004,
	50005
}
MS_ItemData.static.TalentTextIconList = {
	51001,
	51002,
	51003,
	51004,
	51005
}
MS_ItemData.static.TrophyItemTypeIconList = {
	61000,
	62000,
	63000
}
MS_ItemData.static.ExpItemQuestIdList = {
	"12019",
	"12020",
	"12021",
	"12022"
}
MS_ItemData.static.ExpItemMax = 4
MS_ItemData.static.TrophyStrengthLevelMax = 6
MS_ItemData.static.TrophyCapacity = 600
MS_ItemData.static.ExpItemDropProbabilityMin = 0.25
MS_ItemData.static.ExpItemDropProbabilityMax = 0.35
MS_ItemData.static.ExpItemDropIndependentProbability = 0.3
MS_ItemData.static.BlessProbability = 400
MS_ItemData.static.BlessGetFormulaTimes = 20
MS_ItemData.static.BlessGetFormulaInitChance = 0.05
MS_ItemData.static.WeaponParabolaRangeMin = 4
MS_ItemData.static.WeaponParabolaRangeMax = 20
MS_ItemData.static.WeaponParabolaRange = 10
MS_ItemData.static.WeaponParabolaAngleMax = 30
MS_ItemData.static.WeaponParabolaStartAngle = 45
MS_ItemData.static.WeaponParabolaGravity = -20

function MS_ItemData.Init()
	for k, data in pairs(ES_ItemData) do
		local itemId = tonumber(data.ItemId)

		if MS_ItemData.ItemList[itemId] == nil then
			MS_ItemData.ItemList[itemId] = {}
		end

		MS_ItemData.ItemList[itemId] = data

		table.insert(MS_ItemData.itemIconList, data.Icon)
	end

	for k, data in pairs(ES_WeaponData) do
		local itemId = tonumber(data.ItemId)

		if MS_ItemData.WeaponList[itemId] == nil then
			MS_ItemData.WeaponList[itemId] = {}
		end

		MS_ItemData.WeaponList[itemId] = data

		table.insert(MS_ItemData.itemIconList, data.Icon)
	end

	for k, data in pairs(ES_TrophyData) do
		local itemId = tonumber(data.ItemId)

		if MS_ItemData.TrophyList[itemId] == nil then
			MS_ItemData.TrophyList[itemId] = {}
		end

		MS_ItemData.TrophyList[itemId] = data

		table.insert(MS_ItemData.itemIconList, data.Icon)
	end

	table.insert(MS_ItemData.itemIconList, MS_ItemData.ItemUnknownIcon)
	table.insert(MS_ItemData.itemIconList, MS_ItemData.HpItemIcon)
	table.insert(MS_ItemData.itemIconList, MS_ItemData.SanItemIcon)

	for k, v in pairs(MS_ItemData.TalentTextIconList) do
		table.insert(MS_ItemData.itemIconList, v)
	end

	for k, v in pairs(MS_ItemData.TrophyItemTypeIconList) do
		table.insert(MS_ItemData.itemIconList, v)
	end
end

function MS_ItemData.GetItemIconList()
	return MS_ItemData.itemIconList
end

function MS_ItemData.RefreshLanguage()
	if GameTextData.ItemData == nil or GameTextData.WeaponData == nil or GameTextData.TrophyData == nil then
		return
	end

	for k, v in pairs(MS_ItemData.ItemList) do
		if GameTextData.ItemData[tostring(k)] ~= nil then
			v.Name = GameTextData.ItemData[tostring(k)]
		end

		if GameTextData.ItemData[tostring(k) .. "Description"] ~= nil then
			v.Description = GameTextData.ItemData[tostring(k) .. "Description"]
		end
	end

	for k, v in pairs(MS_ItemData.WeaponList) do
		if GameTextData.WeaponData[tostring(k)] ~= nil then
			v.Name = GameTextData.WeaponData[tostring(k)]
		end

		if GameTextData.WeaponData[tostring(k) .. "Description"] ~= nil then
			v.Description = GameTextData.WeaponData[tostring(k) .. "Description"]
		end
	end

	for k, v in pairs(MS_ItemData.TrophyList) do
		if GameTextData.TrophyData[tostring(k)] ~= nil then
			v.Name = GameTextData.TrophyData[tostring(k)]
		end

		if GameTextData.TrophyData[tostring(k) .. "Description"] ~= nil then
			v.Description = GameTextData.TrophyData[tostring(k) .. "Description"]
		end
	end
end

function MS_ItemData.GetItemName(itemId)
	local itemData = MS_ItemData.GetItemData(itemId)

	if itemData ~= nil then
		return itemData.Name
	end

	SystemHelper.LogError("===Error!Not Found!==MS_ItemData=GetItemData=itemId=" .. itemId)

	return ""
end

function MS_ItemData.GetItemData(itemId)
	itemId = tonumber(itemId)

	if MS_ItemData.ItemList[itemId] ~= nil then
		return MS_ItemData.ItemList[itemId]
	end

	if MS_ItemData.WeaponList[itemId] ~= nil then
		return MS_ItemData.WeaponList[itemId]
	end

	if MS_ItemData.TrophyList[itemId] ~= nil then
		return MS_ItemData.TrophyList[itemId]
	end

	SystemHelper.LogError("===Error!Not Found!==MS_ItemData=GetItemData=itemId=" .. itemId)

	return nil
end

function MS_ItemData.GetAllItemId(type)
	local allIdList = {}

	for k, v in pairs(MS_ItemData.ItemList) do
		if v.MainType == type then
			table.insert(allIdList, v.ItemId)
		end
	end

	for k, v in pairs(MS_ItemData.WeaponList) do
		if v.MainType == type then
			table.insert(allIdList, v.ItemId)
		end
	end

	for k, v in pairs(MS_ItemData.TrophyList) do
		if v.MainType == type then
			table.insert(allIdList, v.ItemId)
		end
	end

	return allIdList
end

function MS_ItemData.GetAlchemyStoneId(type, Lv)
	for k, v in pairs(MS_ItemData.ItemList) do
		if v.Type == type then
			if v.Type == MS_ItemData.Type.StrengthenStone then
				if v.Level == Mathf.Ceil(Lv / 2) then
					return v.ItemId, 2 - MathHelper.Mod(Lv, 2)
				end
			elseif v.Type == MS_ItemData.Type.RecastStone then
				return nil, 0
			end
		end
	end

	return nil, 0
end

function MS_ItemData.GetTrophyRawBounsText(itemId)
	itemId = tonumber(itemId)

	local st = ""

	if MS_ItemData.TrophyList[itemId] == nil then
		return st
	end

	if MS_ItemData.TrophyList[itemId].RandomProperty == 1 then
		return st
	end

	if MS_ItemData.TrophyList[itemId].Property1 ~= 0 then
		local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(MS_ItemData.TrophyList[itemId].Property1, MS_ItemData.TrophyList[itemId].Value1)

		st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
	end

	if MS_ItemData.TrophyList[itemId].Property2 ~= 0 then
		local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(MS_ItemData.TrophyList[itemId].Property2, MS_ItemData.TrophyList[itemId].Value1)

		st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
	end

	if MS_ItemData.TrophyList[itemId].Property3 ~= 0 then
		local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(MS_ItemData.TrophyList[itemId].Property3, MS_ItemData.TrophyList[itemId].Value1)

		st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
	end

	if MS_ItemData.TrophyList[itemId].Property4 ~= 0 then
		local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(MS_ItemData.TrophyList[itemId].Property4, MS_ItemData.TrophyList[itemId].Value1)

		st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
	end

	if string.len(st) > 1 then
		st = string.sub(st, 1, string.len(st) - 1)
	end

	return st
end

function MS_ItemData.GetItemRawBounsText(itemId)
	itemId = tonumber(itemId)

	local st = ""

	return st
end
