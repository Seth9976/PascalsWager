﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/UnityEngine/Quaternion.lua

local math = math
local sin = math.sin
local cos = math.cos
local acos = math.acos
local asin = math.asin
local sqrt = math.sqrt
local min = math.min
local max = math.max
local sign = math.sign
local atan2 = math.atan2
local clamp = Mathf.Clamp
local abs = math.abs
local setmetatable = setmetatable
local getmetatable = getmetatable
local rawget = rawget
local rawset = rawset
local Vector3 = Vector3
local rad2Deg = Mathf.Rad2Deg
local halfDegToRad = 0.5 * Mathf.Deg2Rad
local _forward = Vector3.forward
local _up = Vector3.up
local _next = {
	2,
	3,
	1
}
local Quaternion = {}
local get = tolua.initget(Quaternion)

function Quaternion.__index(t, k)
	local var = rawget(Quaternion, k)

	if var == nil then
		var = rawget(get, k)

		if var ~= nil then
			return var(t)
		end
	end

	return var
end

function Quaternion.__newindex(t, name, k)
	if name == "eulerAngles" then
		t:SetEuler(k)
	else
		rawset(t, name, k)
	end
end

function Quaternion.New(x, y, z, w)
	local t = {
		fixed = false,
		x = x or 0,
		y = y or 0,
		z = z or 0,
		w = w or 0
	}

	setmetatable(t, Quaternion)

	return t
end

function Quaternion.NewS(x, y, z, w)
	local t = {
		fixed = true,
		x = x or 0,
		y = y or 0,
		z = z or 0,
		w = w or 0
	}

	setmetatable(t, Quaternion)

	return t
end

local _new = Quaternion.New

function Quaternion.__call(t, x, y, z, w)
	local t = {
		fixed = false,
		x = x or 0,
		y = y or 0,
		z = z or 0,
		w = w or 0
	}

	setmetatable(t, Quaternion)

	return t
end

function Quaternion:Set(x, y, z, w)
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	self.x = x or 0
	self.y = y or 0
	self.z = z or 0
	self.w = w or 0
end

function Quaternion:SetFixed(isFixed)
	if self.fixed ~= isFixed then
		self.fixed = isFixed
	end
end

function Quaternion:SetQuaternion(quat)
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	self.x = quat.x or 0
	self.y = quat.y or 0
	self.z = quat.z or 0
	self.w = quat.w or 0
end

function Quaternion:Clone()
	return _new(self.x, self.y, self.z, self.w)
end

function Quaternion:Get()
	return self.x, self.y, self.z, self.w
end

function Quaternion.Dot(a, b)
	return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w
end

function Quaternion.Angle(a, b)
	local dot = Quaternion.Dot(a, b)

	if dot < 0 then
		dot = -dot
	end

	return acos(min(dot, 1)) * 2 * 57.29578
end

function Quaternion.AngleAxis(angle, axis)
	local normAxis = axis:Normalize()

	angle = angle * halfDegToRad

	local s = sin(angle)
	local w = cos(angle)
	local x = normAxis.x * s
	local y = normAxis.y * s
	local z = normAxis.z * s

	return _new(x, y, z, w)
end

function Quaternion.Equals(a, b)
	return a.x == b.x and a.y == b.y and a.z == b.z and a.w == b.w
end

function Quaternion.Euler(x, y, z)
	x = x * 0.0087266462599716
	y = y * 0.0087266462599716
	z = z * 0.0087266462599716

	local sinX = sin(x)

	x = cos(x)

	local sinY = sin(y)

	y = cos(y)

	local sinZ = sin(z)

	z = cos(z)

	local q = {
		fixed = false,
		x = y * sinX * z + sinY * x * sinZ,
		y = sinY * x * z - y * sinX * sinZ,
		z = y * x * sinZ - sinY * sinX * z,
		w = y * x * z + sinY * sinX * sinZ
	}

	setmetatable(q, Quaternion)

	return q
end

function Quaternion:SetEuler(x, y, z)
	if y == nil and z == nil then
		y = x.y
		z = x.z
		x = x.x
	end

	x = x * 0.0087266462599716
	y = y * 0.0087266462599716
	z = z * 0.0087266462599716

	local sinX = sin(x)
	local cosX = cos(x)
	local sinY = sin(y)
	local cosY = cos(y)
	local sinZ = sin(z)
	local cosZ = cos(z)

	self.w = cosY * cosX * cosZ + sinY * sinX * sinZ
	self.x = cosY * sinX * cosZ + sinY * cosX * sinZ
	self.y = sinY * cosX * cosZ - cosY * sinX * sinZ
	self.z = cosY * cosX * sinZ - sinY * sinX * cosZ

	return self
end

function Quaternion:Normalize()
	local quat = self:Clone()

	quat:SetNormalize()

	return quat
end

function Quaternion:SetNormalize()
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	local n = self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w

	if n ~= 1 and n > 0 then
		n = 1 / sqrt(n)
		self.x = self.x * n
		self.y = self.y * n
		self.z = self.z * n
		self.w = self.w * n
	end
end

function Quaternion.FromToRotation(from, to)
	local quat = Quaternion.New()

	quat:SetFromToRotation(from, to)

	return quat
end

function Quaternion:SetFromToRotation1(from, to)
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	local v0 = from:Normalize()
	local v1 = to:Normalize()
	local d = Vector3.Dot(v0, v1)

	if d > -0.999999 then
		local s = sqrt((1 + d) * 2)
		local invs = 1 / s
		local c = Vector3.Cross(v0, v1) * invs

		self.x = c.x or 0
		self.y = c.y or 0
		self.z = c.z or 0
		self.w = s * 0.5 or 0
	elseif d > 0.999999 then
		return _new(0, 0, 0, 1)
	else
		local axis = Vector3.Cross(Vector3.right, v0)

		if axis:SqrMagnitude() < 1e-06 then
			axis = Vector3.Cross(Vector3.forward, v0)
		end

		self.x = axis.x or 0
		self.y = axis.y or 0
		self.z = axis.z or 0
		self.w = 0

		return self
	end

	return self
end

local function MatrixToQuaternion(rot, quat)
	local trace = rot[1][1] + rot[2][2] + rot[3][3]

	if trace > 0 then
		local s = sqrt(trace + 1)

		quat.w = 0.5 * s
		s = 0.5 / s
		quat.x = (rot[3][2] - rot[2][3]) * s
		quat.y = (rot[1][3] - rot[3][1]) * s
		quat.z = (rot[2][1] - rot[1][2]) * s

		quat:SetNormalize()
	else
		local i = 1
		local q = {
			0,
			0,
			0
		}

		if rot[2][2] > rot[1][1] then
			i = 2
		end

		if rot[3][3] > rot[i][i] then
			i = 3
		end

		local j = _next[i]
		local k = _next[j]
		local t = rot[i][i] - rot[j][j] - rot[k][k] + 1
		local s = 0.5 / sqrt(t)

		q[i] = s * t

		local w = (rot[k][j] - rot[j][k]) * s

		q[j] = (rot[j][i] + rot[i][j]) * s
		q[k] = (rot[k][i] + rot[i][k]) * s

		quat:Set(q[1], q[2], q[3], w)
		quat:SetNormalize()
	end
end

function Quaternion:SetFromToRotation(from, to)
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	from = from:Normalize()
	to = to:Normalize()

	local e = Vector3.Dot(from, to)

	if e > 0.999999 then
		self.x = 0
		self.y = 0
		self.z = 0
		self.w = 1
	elseif e < -0.999999 then
		local left = {
			0,
			from.z,
			from.y
		}
		local mag = left[2] * left[2] + left[3] * left[3]

		if mag < 1e-06 then
			left[1] = -from.z
			left[2] = 0
			left[3] = from.x
			mag = left[1] * left[1] + left[3] * left[3]
		end

		local invlen = 1 / sqrt(mag)

		left[1] = left[1] * invlen
		left[2] = left[2] * invlen
		left[3] = left[3] * invlen

		local up = {
			0,
			0,
			0
		}

		up[1] = left[2] * from.z - left[3] * from.y
		up[2] = left[3] * from.x - left[1] * from.z
		up[3] = left[1] * from.y - left[2] * from.x

		local fxx = -from.x * from.x
		local fyy = -from.y * from.y
		local fzz = -from.z * from.z
		local fxy = -from.x * from.y
		local fxz = -from.x * from.z
		local fyz = -from.y * from.z
		local uxx = up[1] * up[1]
		local uyy = up[2] * up[2]
		local uzz = up[3] * up[3]
		local uxy = up[1] * up[2]
		local uxz = up[1] * up[3]
		local uyz = up[2] * up[3]
		local lxx = -left[1] * left[1]
		local lyy = -left[2] * left[2]
		local lzz = -left[3] * left[3]
		local lxy = -left[1] * left[2]
		local lxz = -left[1] * left[3]
		local lyz = -left[2] * left[3]
		local rot = {
			{
				fxx + uxx + lxx,
				fxy + uxy + lxy,
				fxz + uxz + lxz
			},
			{
				fxy + uxy + lxy,
				fyy + uyy + lyy,
				fyz + uyz + lyz
			},
			{
				fxz + uxz + lxz,
				fyz + uyz + lyz,
				fzz + uzz + lzz
			}
		}

		MatrixToQuaternion(rot, self)
	else
		local v = Vector3.Cross(from, to)
		local h = (1 - e) / Vector3.Dot(v, v)
		local hx = h * v.x
		local hz = h * v.z
		local hxy = hx * v.y
		local hxz = hx * v.z
		local hyz = hz * v.y
		local rot = {
			{
				e + hx * v.x,
				hxy - v.z,
				hxz + v.y
			},
			{
				hxy + v.z,
				e + h * v.y * v.y,
				hyz - v.x
			},
			{
				hxz - v.y,
				hyz + v.x,
				e + hz * v.z
			}
		}

		MatrixToQuaternion(rot, self)
	end
end

function Quaternion:Inverse()
	local quat = Quaternion.New()

	quat.x = -self.x
	quat.y = -self.y
	quat.z = -self.z
	quat.w = self.w

	return quat
end

function Quaternion.Lerp(q1, q2, t)
	t = clamp(t, 0, 1)

	local q = {
		z = 0,
		y = 0,
		w = 1,
		x = 0,
		fixed = false
	}

	if Quaternion.Dot(q1, q2) < 0 then
		q.x = q1.x + t * (-q2.x - q1.x)
		q.y = q1.y + t * (-q2.y - q1.y)
		q.z = q1.z + t * (-q2.z - q1.z)
		q.w = q1.w + t * (-q2.w - q1.w)
	else
		q.x = q1.x + (q2.x - q1.x) * t
		q.y = q1.y + (q2.y - q1.y) * t
		q.z = q1.z + (q2.z - q1.z) * t
		q.w = q1.w + (q2.w - q1.w) * t
	end

	Quaternion.SetNormalize(q)
	setmetatable(q, Quaternion)

	return q
end

function Quaternion.LookRotation(forward, up)
	local mag = forward:Magnitude()

	if mag < 1e-06 then
		error("error input forward to Quaternion.LookRotation" .. tostring(forward))

		return nil
	end

	forward = forward / mag
	up = up or _up

	local right = Vector3.Cross(up, forward)

	right:SetNormalize()

	up = Vector3.Cross(forward, right)
	right = Vector3.Cross(up, forward)

	local t = right.x + up.y + forward.z

	if t > 0 then
		local x, y, z, w

		t = t + 1

		local s = 0.5 / sqrt(t)

		w = s * t
		x = (up.z - forward.y) * s
		y = (forward.x - right.z) * s
		z = (right.y - up.x) * s

		local ret = _new(x, y, z, w)

		ret:SetNormalize()

		return ret
	else
		local rot = {
			{
				right.x,
				up.x,
				forward.x
			},
			{
				right.y,
				up.y,
				forward.y
			},
			{
				right.z,
				up.z,
				forward.z
			}
		}
		local q = {
			0,
			0,
			0
		}
		local i = 1

		if up.y > right.x then
			i = 2
		end

		if forward.z > rot[i][i] then
			i = 3
		end

		local j = _next[i]
		local k = _next[j]
		local t = rot[i][i] - rot[j][j] - rot[k][k] + 1
		local s = 0.5 / sqrt(t)

		q[i] = s * t

		local w = (rot[k][j] - rot[j][k]) * s

		q[j] = (rot[j][i] + rot[i][j]) * s
		q[k] = (rot[k][i] + rot[i][k]) * s

		local ret = _new(q[1], q[2], q[3], w)

		ret:SetNormalize()

		return ret
	end
end

function Quaternion:SetIdentity()
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	self.x = 0
	self.y = 0
	self.z = 0
	self.w = 1
end

local function UnclampedSlerp(q1, q2, t)
	local dot = q1.x * q2.x + q1.y * q2.y + q1.z * q2.z + q1.w * q2.w

	if dot < 0 then
		dot = -dot
		q2 = setmetatable({
			fixed = false,
			x = -q2.x,
			y = -q2.y,
			z = -q2.z,
			w = -q2.w
		}, Quaternion)
	end

	if dot < 0.95 then
		local angle = acos(dot)
		local invSinAngle = 1 / sin(angle)
		local t1 = sin((1 - t) * angle) * invSinAngle
		local t2 = sin(t * angle) * invSinAngle

		q1 = {
			fixed = false,
			x = q1.x * t1 + q2.x * t2,
			y = q1.y * t1 + q2.y * t2,
			z = q1.z * t1 + q2.z * t2,
			w = q1.w * t1 + q2.w * t2
		}

		setmetatable(q1, Quaternion)

		return q1
	else
		q1 = {
			fixed = false,
			x = q1.x + t * (q2.x - q1.x),
			y = q1.y + t * (q2.y - q1.y),
			z = q1.z + t * (q2.z - q1.z),
			w = q1.w + t * (q2.w - q1.w)
		}

		Quaternion.SetNormalize(q1)
		setmetatable(q1, Quaternion)

		return q1
	end
end

function Quaternion.Slerp(from, to, t)
	if t < 0 then
		t = 0
	elseif t > 1 then
		t = 1
	end

	return UnclampedSlerp(from, to, t)
end

function Quaternion.RotateTowards(from, to, maxDegreesDelta)
	local angle = Quaternion.Angle(from, to)

	if angle == 0 then
		return to
	end

	local t = min(1, maxDegreesDelta / angle)

	return UnclampedSlerp(from, to, t)
end

local function Approximately(f0, f1)
	return abs(f0 - f1) < 1e-06
end

function Quaternion:ToAngleAxis()
	local angle = 2 * acos(self.w)

	if Approximately(angle, 0) then
		return angle * 57.29578, Vector3.New(1, 0, 0)
	end

	local div = 1 / sqrt(1 - sqrt(self.w))

	return angle * 57.29578, Vector3.New(self.x * div, self.y * div, self.z * div)
end

local pi = Mathf.PI
local half_pi = pi * 0.5
local two_pi = 2 * pi
local negativeFlip = -0.0001
local positiveFlip = two_pi - 0.0001

local function SanitizeEuler(euler)
	if euler.x < negativeFlip then
		euler.x = euler.x + two_pi
	elseif euler.x > positiveFlip then
		euler.x = euler.x - two_pi
	end

	if euler.y < negativeFlip then
		euler.y = euler.y + two_pi
	elseif euler.y > positiveFlip then
		euler.y = euler.y - two_pi
	end

	if euler.z < negativeFlip then
		euler.z = euler.z + two_pi
	elseif euler.z > positiveFlip then
		euler.z = euler.z + two_pi
	end
end

function Quaternion:ToEulerAngles()
	local x = self.x
	local y = self.y
	local z = self.z
	local w = self.w
	local check = 2 * (y * z - w * x)

	if check < 0.999 then
		if check > -0.999 then
			local v = Vector3.New(-asin(check), atan2(2 * (x * z + w * y), 1 - 2 * (x * x + y * y)), atan2(2 * (x * y + w * z), 1 - 2 * (x * x + z * z)))

			SanitizeEuler(v)
			v:Mul(rad2Deg)

			return v
		else
			local v = Vector3.New(half_pi, atan2(2 * (x * y - w * z), 1 - 2 * (y * y + z * z)), 0)

			SanitizeEuler(v)
			v:Mul(rad2Deg)

			return v
		end
	else
		local v = Vector3.New(-half_pi, atan2(-2 * (x * y - w * z), 1 - 2 * (y * y + z * z)), 0)

		SanitizeEuler(v)
		v:Mul(rad2Deg)

		return v
	end
end

function Quaternion:Forward()
	return self:MulVec3(_forward)
end

function Quaternion:MulVec3(point)
	local vec = Vector3.New()
	local num = self.x * 2
	local num2 = self.y * 2
	local num3 = self.z * 2
	local num4 = self.x * num
	local num5 = self.y * num2
	local num6 = self.z * num3
	local num7 = self.x * num2
	local num8 = self.x * num3
	local num9 = self.y * num3
	local num10 = self.w * num
	local num11 = self.w * num2
	local num12 = self.w * num3

	vec.x = (1 - (num5 + num6)) * point.x + (num7 - num12) * point.y + (num8 + num11) * point.z
	vec.y = (num7 + num12) * point.x + (1 - (num4 + num6)) * point.y + (num9 - num10) * point.z
	vec.z = (num8 - num11) * point.x + (num9 + num10) * point.y + (1 - (num4 + num5)) * point.z

	return vec
end

function Quaternion:MulQuat(quat)
	if self.fixed == true then
		SystemHelper.LogError("=========Quaternion fixed error !!! =" .. t)
	end

	local lhs_x = quat.x
	local lhs_y = quat.y
	local lhs_z = quat.z
	local lhs_w = quat.w
	local rhs_x = self.x
	local rhs_y = self.y
	local rhs_z = self.z
	local rhs_w = self.w
	local x = lhs_w * rhs_x + lhs_x * rhs_w + lhs_y * rhs_z - lhs_z * rhs_y
	local y = lhs_w * rhs_y + lhs_y * rhs_w + lhs_z * rhs_x - lhs_x * rhs_z
	local z = lhs_w * rhs_z + lhs_z * rhs_w + lhs_x * rhs_y - lhs_y * rhs_x
	local w = lhs_w * rhs_w - lhs_x * rhs_x - lhs_y * rhs_y - lhs_z * rhs_z

	self.x = x or 0
	self.y = y or 0
	self.z = z or 0
	self.w = w or 0

	return self
end

function Quaternion.__mul(lhs, rhs)
	if Quaternion == getmetatable(rhs) then
		return Quaternion.New(lhs.w * rhs.x + lhs.x * rhs.w + lhs.y * rhs.z - lhs.z * rhs.y, lhs.w * rhs.y + lhs.y * rhs.w + lhs.z * rhs.x - lhs.x * rhs.z, lhs.w * rhs.z + lhs.z * rhs.w + lhs.x * rhs.y - lhs.y * rhs.x, lhs.w * rhs.w - lhs.x * rhs.x - lhs.y * rhs.y - lhs.z * rhs.z)
	elseif Vector3 == getmetatable(rhs) then
		return lhs:MulVec3(rhs)
	end
end

function Quaternion.__unm(q)
	return Quaternion.New(-q.x, -q.y, -q.z, -q.w)
end

function Quaternion.__eq(lhs, rhs)
	return Quaternion.Dot(lhs, rhs) > 0.999999
end

function Quaternion:__tostring()
	return "[" .. self.x .. "," .. self.y .. "," .. self.z .. "," .. self.w .. "]"
end

function get.identity()
	return _new(0, 0, 0, 1)
end

get.eulerAngles = Quaternion.ToEulerAngles
Quaternion.s_identity = Quaternion.NewS(0, 0, 0, 1)
UnityEngine.Quaternion = Quaternion

setmetatable(Quaternion, Quaternion)

return Quaternion
