-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/Logic/LuaClass.lua

LuaClass = {
	x = 0,
	y = 0
}
LuaClass.__index = LuaClass

function LuaClass:New(x, y)
	local self = {}

	setmetatable(self, LuaClass)

	self.x = x
	self.y = y

	return self
end

function LuaClass:test()
	logWarn("x:>" .. self.x .. " y:>" .. self.y)
end
