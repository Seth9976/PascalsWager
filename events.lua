﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/events.lua

local EventLib = require("eventlib")
local Event = {}
local events = {}

function Event.AddListener(event, handler)
	if not event or type(event) ~= "string" then
		error("event parameter in addlistener function has to be string, " .. type(event) .. " not right.")
	end

	if not handler or type(handler) ~= "function" then
		error("handler parameter in addlistener function has to be function, " .. type(handler) .. " not right")
	end

	if not events[event] then
		events[event] = EventLib:new(event)
	end

	events[event]:connect(handler)
end

function Event.Brocast(event, ...)
	if not events[event] then
		error("brocast " .. event .. " has no event.")
	else
		events[event]:fire(...)
	end
end

function Event.RemoveListener(event, handler)
	if not events[event] then
		error("remove " .. event .. " has no event.")
	else
		events[event]:disconnect(handler)
	end
end

return Event
