-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_FrameData.lua

require("LuaScript/StructData/FS_Vector2")
require("LuaScript/StructData/FS_Vector3")

FS_Battle_FrameData = class("FS_Battle_FrameData")

function FS_Battle_FrameData:initialize()
	self.userId = 0
	self.isPredicted = false
	self.moveX = 0
	self.moveY = 0
	self.moveZ = 0
	self.lockId = 0
	self.actionLongPress = 0
	self.actionPressUp = 0
	self.actionMove = false
	self.actionX = 0
	self.actionY = 0
	self.actionAssist = 0
	self.targetX = 0
	self.targetY = 0
	self.targetZ = 0
end

function FS_Battle_FrameData:parse(p_val)
	if p_val ~= nil and p_val.userId ~= nil then
		self.userId = FS_Parser.toInt(p_val.userId, self.userId)
		self.isPredicted = FS_Parser.toBool(p_val.isPredicted, self.isPredicted)
		self.moveX = FS_Parser.toInt(p_val.moveX, self.moveX)
		self.moveY = FS_Parser.toInt(p_val.moveY, self.moveY)
		self.moveZ = FS_Parser.toInt(p_val.moveZ, self.moveZ)
		self.lockId = FS_Parser.toInt(p_val.lockId, self.lockId)
		self.actionLongPress = FS_Parser.toInt(p_val.actionLongPress, self.actionLongPress)
		self.actionPressUp = FS_Parser.toInt(p_val.actionPressUp, self.actionPressUp)
		self.actionMove = FS_Parser.toBool(p_val.actionMove, self.actionMove)
		self.actionX = FS_Parser.toInt(p_val.actionX, self.actionX)
		self.actionY = FS_Parser.toInt(p_val.actionY, self.actionY)
		self.actionAssist = FS_Parser.toInt(p_val.actionAssist, self.actionAssist)
		self.actionItem = FS_Parser.toInt(p_val.actionItem, self.actionItem)
		self.targetX = FS_Parser.toInt(p_val.targetX, self.targetX)
		self.targetY = FS_Parser.toInt(p_val.targetY, self.targetY)
		self.targetZ = FS_Parser.toInt(p_val.targetZ, self.targetZ)
	end
end

return FS_Battle_FrameData
