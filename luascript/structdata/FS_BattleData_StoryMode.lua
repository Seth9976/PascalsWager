-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_BattleData_StoryMode.lua

FS_BattleData_StoryMode = class("FS_BattleData_StoryMode")
FS_BattleData_StoryMode.battleDataList = {}
FS_BattleData_StoryMode.static.DataType = {
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
FS_BattleData_StoryMode.BuffType = {
	Strain = 6,
	Energy = 5,
	Toughness = 4,
	Defence = 3,
	HpMax = 1,
	Power = 2
}

function FS_BattleData_StoryMode.initialize()
	FS_BattleData_StoryMode.battleDataList = {}
end

function FS_BattleData_StoryMode.AddPlayer(animalId)
	FS_BattleData_StoryMode.battleDataList[animalId] = {}

	for i = 1, FS_BattleData_StoryMode.DataType.DataTypeMax do
		FS_BattleData_StoryMode.battleDataList[animalId][i] = 0
	end
end

function FS_BattleData_StoryMode.SetBattleData(animalId, type, value)
	if FS_BattleData_StoryMode.battleDataList[animalId] ~= nil then
		FS_BattleData_StoryMode.battleDataList[animalId][type] = value
	end
end

function FS_BattleData_StoryMode.AddBattleData(animalId, type, value)
	if FS_BattleData_StoryMode.battleDataList[animalId] ~= nil then
		local ret = FS_BattleData_StoryMode.battleDataList[animalId][type] + value

		FS_BattleData_StoryMode.battleDataList[animalId][type] = ret
	end
end

function FS_BattleData_StoryMode.GetBattleData(animalId, type)
	local ret = 0

	if FS_BattleData_StoryMode.battleDataList[animalId] == nil then
		return ret
	end

	ret = FS_BattleData_StoryMode.battleDataList[animalId][type]

	return ret
end
