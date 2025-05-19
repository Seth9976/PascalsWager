-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Lib/Tween/TweenPath.lua

TweenPath = class("TweenPath")

function TweenPath.Linear(v, k)
	local m = #v
	local f = 1 + (m - 1) * k
	local i = Mathf.Floor(f)
	local fn = TweenPath.Utils.Linear

	if k < 0 then
		return fn(v[1], v[2], f)
	end

	if k > 1 then
		return fn(v[m], v[m - 1], m - f)
	end

	return fn(v[i], v[Mathf.Min(i + 1, m)], f - i)
end

function TweenPath.Bezier(v, k)
	local b
	local n = #v - 1
	local pw = Mathf.Pow
	local bn = TweenPath.Utils.Bernstein

	for i = 0, n do
		local x = pw(1 - k, n - i) * pw(k, i) * bn(n, i)

		if b == nil then
			b = v[i + 1] * x
		else
			b = b + v[i + 1] * x
		end
	end

	return b
end

function TweenPath.CatmullRom(v, k)
	local pts = {}

	table.insert(pts, v[1])

	for _k, _v in pairs(v) do
		table.insert(pts, _v)
	end

	table.insert(pts, v[#v])
	table.insert(pts, v[#v])

	local m = #pts - 3
	local f = 1 + (m - 1) * k
	local i = Mathf.Floor(f)
	local cn = TweenPath.Utils.CatmullRom

	if k < 0 then
		return cn(pts[1], pts[2], pts[3], pts[4], f)
	end

	if k > 1 then
		return cn(pts[m + 3], pts[m + 2], pts[m + 1], pts[m], m - f)
	end

	return cn(pts[i], pts[i + 1], pts[i + 2], pts[i + 3], f - i)
end

TweenPath.Utils = {}

function TweenPath.Utils.Linear(p0, p1, t)
	local p = p1 - p0

	p = p * t

	return p + p0
end

function TweenPath.Utils.Bernstein(n, i)
	local fc = TweenPath.Utils.Factorial

	return fc(n) / fc(i) / fc(n - i)
end

function TweenPath.Utils.Factorial(n)
	local s = 1

	for i = 1, n do
		s = s * i
	end

	return s
end

function TweenPath.Utils.CatmullRom(a, b, c, d, u)
	return ((-a + b * 3 - c * 3 + d) * (u * u * u) + (a * 2 - b * 5 + c * 4 - d) * (u * u) + (-a + c) * u + b * 2) * 0.5
end

return TweenPath
