-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_BattleData_GuardMode.lua

FS_BattleData_GuardMode = class("FS_BattleData_GuardMode")
FS_BattleData_GuardMode.battleDataList = {}
FS_BattleData_GuardMode.static.DataType = {
	DeathNum = 3,
	KillNum = 2,
	ClearWaveNum = 9,
	CleanWaveTime = 11,
	EliteMonsterKillNum = 10,
	DataTypeMax = 13,
	BuffToughness = 7,
	HeroId = 1,
	BuffPower = 5,
	BuffEnergy = 8,
	BuffDefence = 6,
	FinalScore = 12,
	BuffHpMax = 4
}
FS_BattleData_GuardMode.BuffType = {
	Strain = 6,
	Energy = 5,
	Toughness = 4,
	Defence = 3,
	HpMax = 1,
	Power = 2
}

function FS_BattleData_GuardMode.initialize()
	FS_BattleData_GuardMode.battleDataList = {}
end

function FS_BattleData_GuardMode.AddPlayer(animalId)
	FS_BattleData_GuardMode.battleDataList[animalId] = {}

	for i = 1, FS_BattleData_GuardMode.DataType.DataTypeMax do
		FS_BattleData_GuardMode.battleDataList[animalId][i] = 0
	end
end

function FS_BattleData_GuardMode.SetBattleData(animalId, type, value)
	if FS_BattleData_GuardMode.battleDataList[animalId] ~= nil then
		FS_BattleData_GuardMode.battleDataList[animalId][type] = value
	end
end

function FS_BattleData_GuardMode.AddBattleData(animalId, type, value)
	if FS_BattleData_GuardMode.battleDataList[animalId] ~= nil then
		local ret = FS_BattleData_GuardMode.battleDataList[animalId][type] + value

		FS_BattleData_GuardMode.battleDataList[animalId][type] = ret
	end
end

function FS_BattleData_GuardMode.GetBattleData(animalId, type)
	local ret = 0

	if FS_BattleData_GuardMode.battleDataList[animalId] == nil then
		return ret
	end

	ret = FS_BattleData_GuardMode.battleDataList[animalId][type]

	return ret
end
