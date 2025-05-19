-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_ServerListData.lua

FS_ServerListData = class("FS_ServerListData")

function FS_ServerListData:initialize()
	self.no = 0
	self.isDefault = true
	self.port = 0
	self.ip = ""
	self.name = ""
	self.id = 0
end

function FS_ServerListData:Clear()
	return
end

function FS_ServerListData:Parse(p_val)
	if p_val ~= nil and p_val.id ~= nil then
		self.no = FS_Parser.toInt(p_val.no, self.no)
		self.isDefault = FS_Parser.toBool(p_val.isDefault, self.isDefault)
		self.port = FS_Parser.toInt(p_val.port, self.port)
		self.ip = FS_Parser.toString(p_val.ip, self.ip)
		self.name = FS_Parser.toString(p_val.name, self.name)
		self.id = FS_Parser.toInt(p_val.id, self.id)
	end
end

return FS_ServerListData
