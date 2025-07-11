﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/protobuf/listener.lua

local setmetatable = setmetatable

module("protobuf.listener")

local _null_listener = {
	Modified = function()
		return
	end
}

function NullMessageListener()
	return _null_listener
end

local _listener_meta = {
	Modified = function(self)
		if self.dirty then
			return
		end

		if self._parent_message then
			self._parent_message:_Modified()
		end
	end
}

_listener_meta.__index = _listener_meta

function Listener(parent_message)
	local o = {}

	o.__mode = "v"
	o._parent_message = parent_message
	o.dirty = false

	return setmetatable(o, _listener_meta)
end
