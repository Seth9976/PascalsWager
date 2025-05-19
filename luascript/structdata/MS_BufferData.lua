-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_BufferData.lua

require("GameData/StructData/ExportData/ES_BufferData")

MS_BufferData = class("MS_BufferData")
MS_BufferData.bufferList = {}

function MS_BufferData.Init()
	for k, data in pairs(ES_BufferData) do
		local bufferId = tonumber(data.BufferId)

		MS_BufferData.bufferList[bufferId] = data
	end
end

function MS_BufferData.GetBuffer(bufferId)
	bufferId = tonumber(bufferId)

	if MS_BufferData.bufferList[bufferId] ~= nil then
		return MS_BufferData.bufferList[bufferId]
	end

	return nil
end
