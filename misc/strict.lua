﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/misc/strict.lua

local getinfo, error, rawset, rawget = debug.getinfo, error, rawset, rawget
local mt = getmetatable(_G)

if mt == nil then
	mt = {}

	setmetatable(_G, mt)
end

mt.__declared = {}

function mt.__newindex(t, n, v)
	if not mt.__declared[n] then
		local info = getinfo(2, "S")

		if info and info.linedefined > 0 then
			error("assign to undeclared variable '" .. n .. "'", 2)
		end

		mt.__declared[n] = true
	end

	rawset(t, n, v)
end

function mt.__index(t, n)
	if not mt.__declared[n] then
		local info = getinfo(2, "S")

		if info and info.linedefined > 0 then
			error("variable '" .. n .. "' is not declared", 2)
		end
	end

	return rawget(t, n)
end
