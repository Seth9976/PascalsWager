-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_GuardModeSpawn.lua

require("GameData/StructData/ExportData/ES_GuardModeSpawn")

MS_GuardModeSpawn = class("MS_GuardModeSpawn")
MS_GuardModeSpawn.SpawnList = {}

function MS_GuardModeSpawn.Init()
	for k, data in pairs(ES_GuardModeSpawn) do
		if MS_GuardModeSpawn.SpawnList[data.Wave] == nil then
			MS_GuardModeSpawn.SpawnList[data.Wave] = {}
		end

		table.insert(MS_GuardModeSpawn.SpawnList[data.Wave], data)
	end
end

function MS_GuardModeSpawn.GetSpawnList(wave)
	if MS_GuardModeSpawn.SpawnList[wave] ~= nil then
		return MS_GuardModeSpawn.SpawnList[wave]
	end

	return nil
end
