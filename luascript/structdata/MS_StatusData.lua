-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StatusData.lua

require("GameData/StructData/ExportData/ES_StatusData")

MS_StatusData = class("MS_StatusData")
MS_StatusData.static.SourceType = {
	Ground = 7,
	Skill = 1,
	San = 5,
	Honeypot = 10,
	Trap = 4,
	Trophy = 6,
	Unknown = 0,
	Item = 2,
	Trick = 3,
	Maze = 9,
	Hit = 8
}
MS_StatusData.static.LogicType = {
	PropertySet = 109,
	NoDebuffer = 112,
	MazeFogFar = 122,
	SubHpToSuckHp = 108,
	DamageOverlay = 124,
	MazeExpAdd = 119,
	PropertyPeriodAdd = 103,
	Dizzy = 105,
	MazeSanFix = 121,
	SanCrazy = 106,
	CallHero = 120,
	NoLogic = 111,
	GuardAdd = 126,
	SuckHp = 116,
	MazeSanSubSlow = 118,
	DamageOverlayClear = 125,
	PropertyPeriodSub = 104,
	NoDeathAdd = 117,
	PropertyMaxAdd = 101,
	NoDeath = 110,
	NoDamage = 115,
	MoveFast = 123,
	EnergyDontUse = 107,
	PropertyMaxSub = 102,
	ExpAdd = 113,
	ExecuteDamageAdd = 114
}
MS_StatusData.static.NoDeathAddId = 10090
MS_StatusData.static.CallHeroId = 10089
MS_StatusData.static.SanAddRageStatusId1 = 10101
MS_StatusData.static.SanAddRageStatusId2 = 10102
MS_StatusData.static.SanAddRageRate = 100
MS_StatusData.static.BloodIdList = {
	10001,
	10030,
	10034,
	10035,
	10036
}
MS_StatusData.statusList = {}

function MS_StatusData.Init()
	for k, data in pairs(ES_StatusData) do
		local statusId = tonumber(data.StatusId)

		MS_StatusData.statusList[statusId] = data
	end
end

function MS_StatusData.GetStatusData(id)
	if MS_StatusData.statusList[id] ~= nil then
		return MS_StatusData.statusList[id]
	end

	return nil
end

function MS_StatusData.GetStatusList()
	return MS_StatusData.statusList
end

function MS_StatusData.Count()
	return table.nums(MS_StatusData.statusList)
end
