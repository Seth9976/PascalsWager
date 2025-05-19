-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_ChatData.lua

FS_ChatData = class("FS_ChatData")

function FS_ChatData:initialize()
	self.chatType = 0
	self.content = ""
	self.chatTime = 0
	self.fromId = 0
	self.fromName = ""
	self.fromServerId = 0
	self.fromIcon = 0
	self.fromIconUrl = ""
	self.toId = 0
	self.toName = ""
	self.toServerId = 0
	self.toUnionId = 0
end

function FS_ChatData:Clear()
	return
end

function FS_ChatData:Parse(p_val)
	if p_val ~= nil then
		self.chatType = FS_Parser.toInt(p_val.chatType, self.chatType)
		self.content = FS_Parser.toString(p_val.content, self.content)
		self.chatTime = FS_Parser.toInt(p_val.chatTime, self.chatTime)
		self.fromId = FS_Parser.toInt(p_val.fromId, self.fromId)
		self.fromName = FS_Parser.toString(p_val.fromName, self.fromName)
		self.fromServerId = FS_Parser.toInt(p_val.fromServerId, self.fromServerId)
		self.fromIcon = FS_Parser.toInt(p_val.fromIcon, self.fromIcon)
		self.fromIconUrl = FS_Parser.toString(p_val.fromIconUrl, self.fromIconUrl)
		self.toId = FS_Parser.toInt(p_val.toId, self.toId)
		self.toName = FS_Parser.toString(p_val.toName, self.toName)
		self.toServerId = FS_Parser.toInt(p_val.toServerId, self.toServerId)
		self.toUnionId = FS_Parser.toInt(p_val.toUnionId, self.toUnionId)
	end
end

return FS_ChatData
