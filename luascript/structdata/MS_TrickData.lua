-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_TrickData.lua

require("GameData/StructData/ExportData/ES_TrickData")

MS_TrickData = class("MS_TrickData")
MS_TrickData.trickList = {}

function MS_TrickData.Init()
	for k, data in pairs(ES_TrickData) do
		local trickId = tonumber(data.TrickId)

		if MS_TrickData.trickList[trickId] == nil then
			MS_TrickData.trickList[trickId] = data
			MS_TrickData.trickList[trickId].Damage = data.Damage_1
			MS_TrickData.trickList[trickId].DurabilitySub = data.DurabilitySub_1
		end
	end
end

function MS_TrickData.SetLoop(loop)
	for k, v in pairs(MS_TrickData.trickList) do
		v.Damage = v["Damage_" .. loop]
		v.DurabilitySub = v["DurabilitySub_" .. loop]
	end
end

function MS_TrickData.GetTrickData(trickId)
	trickId = tonumber(trickId)

	if MS_TrickData.trickList[trickId] ~= nil then
		return MS_TrickData.trickList[trickId]
	end

	return nil
end
