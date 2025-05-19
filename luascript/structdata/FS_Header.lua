-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Header.lua

FS_Header = class("FS_Header")
FS_Header.index = 0
FS_Header.errorCode = 0
FS_Header.time = ""

function FS_Header.Parse(header)
	if header ~= nil then
		FS_Header.index = FS_Parser.toInt(header.index, FS_Header.index)
		FS_Header.errorCode = FS_Parser.toInt(header.errorCode, FS_Header.errorCode)
		FS_Header.time = FS_Parser.toString(header.time, FS_Header.time)
	end
end
