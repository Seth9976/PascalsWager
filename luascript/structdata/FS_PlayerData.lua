-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_PlayerData.lua

FS_PlayerData = class("FS_PlayerData")

function FS_PlayerData:initialize()
	self.id = 0
	self.name = ""
	self.profession = 0
	self.gender = 0
	self.icon = 0
	self.iconUrl = ""
	self.gameServerId = 0
	self.coin = 0
	self.gold = 0
	self.ticket = 0
	self.level = 0
	self.exp = 0
	self.vip = 0
	self.vipExp = 0
end

function FS_PlayerData:Clear()
	return
end

function FS_PlayerData:Parse(p_val)
	if p_val ~= nil and p_val.id ~= nil then
		self.id = FS_Parser.toInt(p_val.id, self.id)
		self.name = FS_Parser.toString(p_val.name, self.name)
		self.profession = FS_Parser.toInt(p_val.profession, self.profession)
		self.gender = FS_Parser.toInt(p_val.gender, self.gender)
		self.icon = FS_Parser.toInt(p_val.icon, self.icon)
		self.iconUrl = FS_Parser.toString(p_val.iconUrl, self.iconUrl)
		self.gameServerId = FS_Parser.toInt(p_val.gameServerId, self.gameServerId)
		self.coin = FS_Parser.toInt(p_val.coin, self.coin)
		self.gold = FS_Parser.toInt(p_val.gold, self.gold)
		self.ticket = FS_Parser.toInt(p_val.ticket, self.ticket)
		self.level = FS_Parser.toInt(p_val.level, self.level)
		self.exp = FS_Parser.toInt(p_val.exp, self.exp)
		self.vip = FS_Parser.toInt(p_val.vip, self.vip)
		self.vipExp = FS_Parser.toInt(p_val.vipExp, self.vipExp)

		SystemHelper.LogTest("==========##########==Parse========id=" .. self.id .. ",name=" .. self.name)
	end
end

function FS_PlayerData:ParseEditInfo(p_val)
	if p_val ~= nil then
		self.name = FS_Parser.toString(p_val.name, self.name)
		self.icon = FS_Parser.toInt(p_val.icon, self.icon)
		self.iconUrl = FS_Parser.toString(p_val.iconUrl, self.iconUrl)

		SystemHelper.LogTest("==========##########====ParseEditInfo======id=" .. self.id .. ",name=" .. self.name)
	end
end

function FS_PlayerData:GetId()
	return self.id
end

function FS_PlayerData:GetName()
	return self.name
end

function FS_PlayerData:GetLevel()
	return self.level
end

function FS_PlayerData:GetIcon()
	return self.icon
end

function FS_PlayerData:GetIconUrl()
	return self.iconUrl
end

return FS_PlayerData
