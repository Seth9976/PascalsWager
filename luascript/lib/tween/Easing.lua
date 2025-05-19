-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Lib/Tween/Easing.lua

Easing = class("Easing")
Easing.Linear = {}

function Easing.Linear.easeIn(t)
	return t
end

function Easing.Linear.easeOut(t)
	return t
end

function Easing.Linear.easeInOut(t)
	return t
end

Easing.Quadratic = {}

function Easing.Quadratic.easeIn(t)
	return Mathf.Pow(t, 2)
end

function Easing.Quadratic.easeOut(t)
	return -1 * (Mathf.Pow(t - 1, 2) - 1)
end

function Easing.Quadratic.easeInOut(t)
	if t <= 0.5 then
		return Easing.Quadratic.easeIn(t * 2) / 2
	else
		return Easing.Quadratic.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

Easing.Cubic = {}

function Easing.Cubic.easeIn(t)
	return Mathf.Pow(t, 3)
end

function Easing.Cubic.easeOut(t)
	return Mathf.Pow(t - 1, 3) + 1
end

function Easing.Cubic.easeInOut(t)
	if t <= 0.5 then
		return Easing.Cubic.easeIn(t * 2) / 2
	else
		return Easing.Cubic.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

Easing.Quartic = {}

function Easing.Quartic.easeIn(t)
	return Mathf.Pow(t, 4)
end

function Easing.Quartic.easeOut(t)
	return -1 * (Mathf.Pow(t - 1, 4) - 1)
end

function Easing.Quartic.easeInOut(t)
	if t <= 0.5 then
		return Easing.Quartic.easeIn(t * 2) / 2
	else
		return Easing.Quartic.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

Easing.CustomQuartic = {}

function Easing.CustomQuartic.easeInOut(t)
	if t <= 0.5 then
		return 8 * t * t * t * t
	else
		return 1 - (-2 * t + 2) * (-2 * t + 2) * (-2 * t + 2) * (-2 * t + 2) / 2
	end
end

Easing.Quintic = {}

function Easing.Quintic.easeIn(t)
	return Mathf.Pow(t, 5)
end

function Easing.Quintic.easeOut(t)
	return Mathf.Pow(t - 1, 5) + 1
end

function Easing.Quintic.easeInOut(t)
	if t <= 0.5 then
		return Easing.Quintic.easeIn(t * 2) / 2
	else
		return Easing.Quintic.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

Easing.Sinusoidal = {}

function Easing.Sinusoidal.easeIn(t)
	return Mathf.Sin((t - 1) * (Mathf.PI / 2)) + 1
end

function Easing.Sinusoidal.easeOut(t)
	return Mathf.Sin(t * (Mathf.PI / 2))
end

function Easing.Sinusoidal.easeInOut(t)
	if t <= 0.5 then
		return Easing.Sinusoidal.easeIn(t * 2) / 2
	else
		return Easing.Sinusoidal.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

Easing.Exponential = {}

function Easing.Exponential.easeIn(t)
	return Mathf.Pow(2, 10 * (t - 1))
end

function Easing.Exponential.easeOut(t)
	return (Mathf.Pow(2, -10 * t) + 1) * -1
end

function Easing.Exponential.easeInOut(t)
	if t <= 0.5 then
		return Easing.Exponential.easeIn(t * 2) / 2
	else
		return Easing.Exponential.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

Easing.Circular = {}

function Easing.Circular.easeIn(t)
	return -1 * Mathf.Sqrt(1 - t * t) + 1
end

function Easing.Circular.easeOut(t)
	return Mathf.Sqrt(1 - Mathf.Pow(t - 1, 2))
end

function Easing.Circular.easeInOut(t)
	if t <= 0.5 then
		return Easing.Circular.easeIn(t * 2) / 2
	else
		return Easing.Circular.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

local s = 1.70158
local s2 = 2.5949095

Easing.Back = {}

function Easing.Back.easeIn(t)
	return t * t * ((s + 1) * t - 2)
end

function Easing.Back.easeOut(t)
	t = t - 1

	return t * t * ((s + 1) * t + s) + 1
end

function Easing.Back.easeInOut(t)
	t = t * 2

	if t < 1 then
		return 0.5 * (t * t * ((s2 + 1) * t - s2))
	else
		t = t - 2

		return 0.5 * (t * t * ((s2 + 1) * t + s2) + 2)
	end
end

Easing.Bounce = {}

function Easing.Bounce.easeIn(t)
	return 1 - Easing.Bounce.easeOut(1 - t)
end

function Easing.Bounce.easeOut(t)
	if t < 0.36363636363636365 then
		return 7.5625 * t * t
	elseif t < 0.7272727272727273 then
		t = t - 0.5454545454545454

		return 7.5625 * t * t + 0.75
	elseif t < 0.9090909090909091 then
		t = t - 0.9090909090909091

		return 7.5625 * t * t + 0.9375
	else
		t = t - 0.9545454545454546

		return 7.5625 * t * t + 0.984375
	end
end

function Easing.Bounce.easeInOut(t)
	if t <= 0.5 then
		return Easing.Bounce.easeIn(t * 2) / 2
	else
		return Easing.Bounce.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

local p = 0.4
local a = 0.1
local ls, la, lp

Easing.Elastic = {}

function Easing.Elastic.calc()
	la = a
	lp = p

	if la < 1 then
		la = 1
		ls = lp / 4
	else
		ls = lp * Mathf.Asin(1 / la) / (2 * Mathf.PI)
	end
end

function Easing.Elastic.easeIn(t)
	if t == 0 or t == 1 then
		return t
	end

	Easing.Elastic.calc()

	t = t - 1

	return -(la * Mathf.Pow(2, 10 * t)) * Mathf.Sin((t - ls) * (2 * Mathf.PI) / lp)
end

function Easing.Elastic.easeOut(t)
	if t == 0 or t == 1 then
		return t
	end

	Easing.Elastic.calc()

	return la * Mathf.Pow(2, -10 * t) * Mathf.Sin((t - ls) * (2 * Mathf.PI) / lp) + 1
end

function Easing.Elastic.easeInOut(t)
	if t == 0 or t == 1 then
		return t
	end

	if t <= 0.5 then
		return Easing.Elastic.easeIn(t * 2) / 2
	else
		return Easing.Elastic.easeOut((t - 0.5) * 2) / 2 + 0.5
	end
end

return Easing
