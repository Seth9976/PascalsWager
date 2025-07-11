﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/UnityEngine/Ray.lua

local rawget = rawget
local setmetatable = setmetatable
local Vector3 = Vector3
local Ray = {
	direction = Vector3.zero,
	origin = Vector3.zero
}
local get = tolua.initget(Ray)

function Ray.__index(t, k)
	local var = rawget(Ray, k)

	if var == nil then
		var = rawget(get, k)

		if var ~= nil then
			return var(t)
		end
	end

	return var
end

function Ray.__call(t, direction, origin)
	return Ray.New(direction, origin)
end

function Ray.New(direction, origin)
	local ray = {}

	ray.direction = direction:Normalize()
	ray.origin = origin

	setmetatable(ray, Ray)

	return ray
end

function Ray:GetPoint(distance)
	local dir = self.direction * distance

	dir:Add(self.origin)

	return dir
end

function Ray:Get()
	local o = self.origin
	local d = self.direction

	return o.x, o.y, o.z, d.x, d.y, d.z
end

function Ray:__tostring()
	return string.format("Origin:(%f,%f,%f),Dir:(%f,%f, %f)", self.origin.x, self.origin.y, self.origin.z, self.direction.x, self.direction.y, self.direction.z)
end

UnityEngine.Ray = Ray

setmetatable(Ray, Ray)

return Ray
