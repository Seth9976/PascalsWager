-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Vector3.lua

FS_Vector3 = class("FS_Vector3")

function FS_Vector3:initialize()
	self.x = 0
	self.y = 0
	self.z = 0
end

function FS_Vector3:parse(p_val)
	if p_val ~= nil then
		self.x = FS_Parser.toInt(p_val.x, self.x)
		self.y = FS_Parser.toInt(p_val.y, self.y)
		self.z = FS_Parser.toInt(p_val.z, self.z)
	end
end

return FS_Vector3
