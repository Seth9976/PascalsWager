-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_AnimalDirection.lua

require("GameData/StructData/ExportData/ES_AnimalDirection")

MS_AnimalDirection = class("MS_AnimalDirection")
MS_AnimalDirection.dirList = {}

function MS_AnimalDirection.Init()
	for k, dir in pairs(ES_AnimalDirection) do
		local keys = StringHelper.Split(k, "_")
		local index = tonumber(keys[2])

		MS_AnimalDirection.dirList[index] = dir
	end
end

function MS_AnimalDirection.GetDirectionNum()
	return #MS_AnimalDirection.dirList
end

function MS_AnimalDirection.GetDirection(index)
	if MS_AnimalDirection.dirList[index] ~= nil then
		return MS_AnimalDirection.dirList[index].move_x, MS_AnimalDirection.dirList[index].move_z
	end

	return 0, 0
end
