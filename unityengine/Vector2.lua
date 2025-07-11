﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/UnityEngine/Vector2.lua

local sqrt = math.sqrt
local setmetatable = setmetatable
local rawget = rawget
local math = math
local acos = math.acos
local max = math.max
local Vector2 = {}
local get = tolua.initget(Vector2)

function Vector2.__index(t, k)
	local var = rawget(Vector2, k)

	if var == nil then
		var = rawget(get, k)

		if var ~= nil then
			return var(t)
		end
	end

	return var
end

function Vector2.New(x, y)
	local t = {
		fixed = false,
		x = x or 0,
		y = y or 0
	}

	setmetatable(t, Vector2)

	return t
end

function Vector2.NewS(x, y)
	local t = {
		fixed = true,
		x = x or 0,
		y = y or 0
	}

	setmetatable(t, Vector2)

	return t
end

function Vector2.__call(t, x, y)
	return setmetatable({
		fixed = false,
		x = x or 0,
		y = y or 0
	}, Vector2)
end

function Vector2:Set(x, y)
	if self.fixed == true then
		SystemHelper.LogError("=========Vector2 fixed error !!! =" .. t)
	end

	self.x = x or 0
	self.y = y or 0
end

function Vector2:SetVector2(vec2)
	if self.fixed == true then
		SystemHelper.LogError("=========Vector2 fixed error !!! =" .. t)
	end

	self.x = vec2.x
	self.y = vec2.y
end

function Vector2:Get()
	return self.x, self.y
end

function Vector2:SqrMagnitude()
	return self.x * self.x + self.y * self.y
end

function Vector2:Clone()
	return setmetatable({
		fixed = false,
		x = self.x,
		y = self.y
	}, Vector2)
end

function Vector2.Normalize(v)
	local x = v.x
	local y = v.y
	local magnitude = sqrt(x * x + y * y)

	if magnitude > 1e-05 then
		x = x / magnitude
		y = y / magnitude
	else
		x = 0
		y = 0
	end

	return setmetatable({
		fixed = false,
		x = x,
		y = y
	}, Vector2)
end

function Vector2:SetNormalize()
	if self.fixed == true then
		SystemHelper.LogError("=========Vector2 fixed error !!! =" .. t)
	end

	local magnitude = sqrt(self.x * self.x + self.y * self.y)

	if magnitude > 1e-05 then
		self.x = self.x / magnitude
		self.y = self.y / magnitude
	else
		self.x = 0
		self.y = 0
	end

	return self
end

function Vector2.Dot(lhs, rhs)
	return lhs.x * rhs.x + lhs.y * rhs.y
end

function Vector2.Angle(from, to)
	local x1, y1 = from.x, from.y
	local d = sqrt(x1 * x1 + y1 * y1)

	if d > 1e-05 then
		x1 = x1 / d
		y1 = y1 / d
	else
		x1, y1 = 0, 0
	end

	local x2, y2 = to.x, to.y

	d = sqrt(x2 * x2 + y2 * y2)

	if d > 1e-05 then
		x2 = x2 / d
		y2 = y2 / d
	else
		x2, y2 = 0, 0
	end

	d = x1 * x2 + y1 * y2

	if d < -1 then
		d = -1
	elseif d > 1 then
		d = 1
	end

	return acos(d) * 57.29578
end

function Vector2.Magnitude(v)
	return sqrt(v.x * v.x + v.y * v.y)
end

function Vector2.Reflect(dir, normal)
	local dx = dir.x
	local dy = dir.y
	local nx = normal.x
	local ny = normal.y
	local s = -2 * (dx * nx + dy * ny)

	return setmetatable({
		fixed = false,
		x = s * nx + dx,
		y = s * ny + dy
	}, Vector2)
end

function Vector2.Distance(a, b)
	return sqrt((a.x - b.x)^2 + (a.y - b.y)^2)
end

function Vector2.Lerp(a, b, t)
	if t < 0 then
		t = 0
	elseif t > 1 then
		t = 1
	end

	return setmetatable({
		fixed = false,
		x = a.x + (b.x - a.x) * t,
		y = a.y + (b.y - a.y) * t
	}, Vector2)
end

function Vector2.LerpUnclamped(a, b, t)
	return setmetatable({
		fixed = false,
		x = a.x + (b.x - a.x) * t,
		y = a.y + (b.y - a.y) * t
	}, Vector2)
end

function Vector2.MoveTowards(current, target, maxDistanceDelta)
	local cx = current.x
	local cy = current.y
	local x = target.x - cx
	local y = target.y - cy
	local s = x * x + y * y

	if s > maxDistanceDelta * maxDistanceDelta and s ~= 0 then
		s = maxDistanceDelta / sqrt(s)

		return setmetatable({
			fixed = false,
			x = cx + x * s,
			y = cy + y * s
		}, Vector2)
	end

	return setmetatable({
		fixed = false,
		x = target.x,
		y = target.y
	}, Vector2)
end

function Vector2.ClampMagnitude(v, maxLength)
	local x = v.x
	local y = v.y
	local sqrMag = x * x + y * y

	if sqrMag > maxLength * maxLength then
		local mag = maxLength / sqrt(sqrMag)

		x = x * mag
		y = y * mag

		return setmetatable({
			fixed = false,
			x = x,
			y = y
		}, Vector2)
	end

	return setmetatable({
		fixed = false,
		x = x,
		y = y
	}, Vector2)
end

function Vector2.SmoothDamp(current, target, Velocity, smoothTime, maxSpeed, deltaTime)
	deltaTime = deltaTime or Time.deltaTime
	maxSpeed = maxSpeed or math.huge
	smoothTime = math.max(0.0001, smoothTime)

	local num = 2 / smoothTime
	local num2 = num * deltaTime

	num2 = 1 / (1 + num2 + 0.48 * num2 * num2 + 0.235 * num2 * num2 * num2)

	local tx = target.x
	local ty = target.y
	local cx = current.x
	local cy = current.y
	local vecx = cx - tx
	local vecy = cy - ty
	local m = vecx * vecx + vecy * vecy
	local n = maxSpeed * smoothTime

	if m > n * n then
		m = n / sqrt(m)
		vecx = vecx * m
		vecy = vecy * m
	end

	m = Velocity.x
	n = Velocity.y

	local vec3x = (m + num * vecx) * deltaTime
	local vec3y = (n + num * vecy) * deltaTime

	Velocity.x = (m - num * vec3x) * num2
	Velocity.y = (n - num * vec3y) * num2
	m = cx - vecx + (vecx + vec3x) * num2
	n = cy - vecy + (vecy + vec3y) * num2

	if (tx - cx) * (m - tx) + (ty - cy) * (n - ty) > 0 then
		m = tx
		n = ty
		Velocity.x = 0
		Velocity.y = 0
	end

	return setmetatable({
		fixed = false,
		x = m,
		y = n
	}, Vector2), Velocity
end

function Vector2.Max(a, b)
	return setmetatable({
		fixed = false,
		x = math.max(a.x, b.x),
		y = math.max(a.y, b.y)
	}, Vector2)
end

function Vector2.Min(a, b)
	return setmetatable({
		fixed = false,
		x = math.min(a.x, b.x),
		y = math.min(a.y, b.y)
	}, Vector2)
end

function Vector2.Scale(a, b)
	return setmetatable({
		fixed = false,
		x = a.x * b.x,
		y = a.y * b.y
	}, Vector2)
end

function Vector2:Div(d)
	self.x = self.x / d
	self.y = self.y / d

	return self
end

function Vector2:Mul(d)
	self.x = self.x * d
	self.y = self.y * d

	return self
end

function Vector2:Add(b)
	self.x = self.x + b.x
	self.y = self.y + b.y

	return self
end

function Vector2:Sub(b)
	self.x = self.x - b.x
	self.y = self.y - b.y
end

function Vector2:__tostring()
	return string.format("(%f,%f)", self.x, self.y)
end

function Vector2.__div(va, d)
	return setmetatable({
		fixed = false,
		x = va.x / d,
		y = va.y / d
	}, Vector2)
end

function Vector2.__mul(a, d)
	if type(d) == "number" then
		return setmetatable({
			fixed = false,
			x = a.x * d,
			y = a.y * d
		}, Vector2)
	else
		return setmetatable({
			fixed = false,
			x = a * d.x,
			y = a * d.y
		}, Vector2)
	end
end

function Vector2.__add(a, b)
	return setmetatable({
		fixed = false,
		x = a.x + b.x,
		y = a.y + b.y
	}, Vector2)
end

function Vector2.__sub(a, b)
	return setmetatable({
		fixed = false,
		x = a.x - b.x,
		y = a.y - b.y
	}, Vector2)
end

function Vector2.__unm(v)
	return setmetatable({
		fixed = false,
		x = -v.x,
		y = -v.y
	}, Vector2)
end

function Vector2.__eq(a, b)
	return (a.x - b.x)^2 + (a.y - b.y)^2 < 9.999999e-11
end

function get.up()
	return setmetatable({
		fixed = false,
		x = 0,
		y = 1
	}, Vector2)
end

function get.right()
	return setmetatable({
		fixed = false,
		x = 1,
		y = 0
	}, Vector2)
end

function get.zero()
	return setmetatable({
		fixed = false,
		x = 0,
		y = 0
	}, Vector2)
end

function get.one()
	return setmetatable({
		fixed = false,
		x = 1,
		y = 1
	}, Vector2)
end

get.magnitude = Vector2.Magnitude
get.normalized = Vector2.Normalize
get.sqrMagnitude = Vector2.SqrMagnitude
Vector2.s_zero = Vector2.NewS(0, 0)
Vector2.s_one = Vector2.NewS(1, 1)
UnityEngine.Vector2 = Vector2

setmetatable(Vector2, Vector2)

return Vector2
