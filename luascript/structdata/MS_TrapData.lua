-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_TrapData.lua

require("GameData/StructData/ExportData/ES_TrapData")

MS_TrapData = class("MS_TrapData")
MS_TrapData.trapList = {}

function MS_TrapData.Init()
	for k, data in pairs(ES_TrapData) do
		local trapId = tonumber(data.TrapId)

		if MS_TrapData.trapList[trapId] == nil then
			MS_TrapData.trapList[trapId] = data
			MS_TrapData.trapList[trapId].Damage = data.Damage_1
		end
	end
end

function MS_TrapData.SetLoop(loop)
	for k, v in pairs(MS_TrapData.trapList) do
		v.Damage = v["Damage_" .. loop]
	end
end

function MS_TrapData.GetTrapData(trapId)
	trapId = tonumber(trapId)

	if MS_TrapData.trapList[trapId] ~= nil then
		return MS_TrapData.trapList[trapId]
	end

	return nil
end
