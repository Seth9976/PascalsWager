-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Vector2.lua

FS_Vector2 = class("FS_Vector2")

function FS_Vector2:initialize()
	self.x = 0
	self.y = 0
end

function FS_Vector2:parse(p_val)
	if p_val ~= nil then
		self.x = FS_Parser.toInt(p_val.x, self.x)
		self.y = FS_Parser.toInt(p_val.y, self.y)
	end
end

return FS_Vector2
