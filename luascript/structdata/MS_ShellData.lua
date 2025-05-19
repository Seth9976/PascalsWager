-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_ShellData.lua

require("GameData/StructData/ExportData/ES_ShellData")

MS_ShellData = class("MS_ShellData")
MS_ShellData.shellList = {}

function MS_ShellData.Init()
	for k, data in pairs(ES_ShellData) do
		local id = tonumber(data.Id)

		if MS_ShellData.shellList[id] == nil then
			MS_ShellData.shellList[id] = data
			MS_ShellData.shellList[id].Durability = data.Durability_1
			MS_ShellData.shellList[id].Guard = data.Guard_1
		end
	end
end

function MS_ShellData.SetLoop(loop)
	for k, v in pairs(MS_ShellData.shellList) do
		v.Durability = v["Durability_" .. loop]
		v.Guard = v["Guard_" .. loop]
	end
end

function MS_ShellData.GetShellData(id)
	id = tonumber(id)

	if MS_ShellData.shellList[id] ~= nil then
		return MS_ShellData.shellList[id]
	end

	return nil
end
