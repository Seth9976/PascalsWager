-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/MathHelper.lua

local math = math
local modf = math.modf
local type = type

MathHelper = {}
MathHelper.Power = 10000
MathHelper.PowerForNet = 100

function MathHelper.Mod(a, b)
	return a - Mathf.Floor(a / b) * b
end

function MathHelper.IsZero(a)
	return Mathf.Abs(a) < 1e-06
end

function MathHelper.Approximately(a, b)
	return Mathf.Abs(b - a) < 1e-06
end

function MathHelper.ToIntCut(value)
	local ret1, ret2 = modf(value)

	return ret1
end

function MathHelper.GetFloat(value)
	local ret1, ret2 = modf(value)

	return ret2
end

local toIntCut = MathHelper.ToIntCut

function MathHelper.ToFloatCut(value)
	local ret = toIntCut(value * MathHelper.Power)

	return ret / MathHelper.Power
end

function MathHelper.convertFloat(value)
	local ret = toIntCut(value * MathHelper.PowerForNet)

	return ret
end

function MathHelper.revertFloat(value)
	local ret = value / MathHelper.PowerForNet

	return ret
end

function MathHelper.convertVector2(vec2)
	local ret = Vector2.zero

	ret.x = MathHelper.convertFloat(vec2.x)
	ret.y = MathHelper.convertFloat(vec2.y)

	return ret
end

function MathHelper.revertVector2(vec2)
	local ret = Vector2.zero

	ret.x = MathHelper.revertFloat(vec2.x)
	ret.y = MathHelper.revertFloat(vec2.y)

	return ret
end

function MathHelper.convertVector3(vec3)
	local ret = Vector3.zero

	ret.x = MathHelper.convertFloat(vec3.x)
	ret.y = MathHelper.convertFloat(vec3.y)
	ret.z = MathHelper.convertFloat(vec3.z)

	return ret
end

function MathHelper.revertVector3(vec3)
	local ret = Vector3.zero

	ret.x = MathHelper.revertFloat(vec3.x)
	ret.y = MathHelper.revertFloat(vec3.y)
	ret.z = MathHelper.revertFloat(vec3.z)

	return ret
end

function MathHelper.convertMillisecond(time)
	return Mathf.Round(time * 1000)
end

function MathHelper.getValueInRadioRange(baseValue, baseRangeMin, baseRageMax, outRangeMin, outRangeMax)
	if MathHelper.IsZero(baseRageMax - baseRangeMin) == true or MathHelper.IsZero(outRangeMax - outRangeMin) == true then
		return outRangeMin
	end

	if baseRageMax < baseRangeMin then
		baseValue = Mathf.Clamp(baseValue, baseRageMax, baseRangeMin)
	else
		baseValue = Mathf.Clamp(baseValue, baseRangeMin, baseRageMax)
	end

	local rate = (baseValue - baseRangeMin) / (baseRageMax - baseRangeMin)
	local outValue = outRangeMin + rate * (outRangeMax - outRangeMin)

	if outRangeMin < outRangeMax then
		outValue = Mathf.Clamp(outValue, outRangeMin, outRangeMax)
	else
		outValue = Mathf.Clamp(outValue, outRangeMax, outRangeMin)
	end

	return outValue
end

function MathHelper.getAngleY(dir)
	dir.y = 0

	if MathHelper.IsZero(dir.sqrMagnitude) == true then
		return 0
	end

	local retAngleY = Mathf.Abs(Vector3.Angle(dir, Vector3.forward))
	local dirLeftAngle = Mathf.Abs(Vector3.Angle(dir, Vector3.right))

	if dirLeftAngle > 90 then
		retAngleY = 360 - retAngleY
	end

	return retAngleY
end

function MathHelper.getForwardAngleY(forward, dir)
	dir.y = 0

	if MathHelper.IsZero(dir.sqrMagnitude) == true then
		return 0
	end

	local rot = Quaternion.Euler(0, 90, 0)
	local right = rot * forward
	local retAngleY = Mathf.Abs(Vector3.Angle(dir, forward))
	local dirLeftAngle = Mathf.Abs(Vector3.Angle(dir, right))

	if dirLeftAngle > 90 then
		retAngleY = 360 - retAngleY
	end

	return retAngleY
end

function MathHelper.getDirectionIndex(dir, directionNum)
	local angle = MathHelper.getAngleY(dir)
	local dirAngle = 360 / directionNum

	dirAngle = MathHelper.ToFloatCut(dirAngle)

	local dirAngleHalf = dirAngle / 2
	local minAngle = 360
	local minDirIndex = 1

	for i = 1, directionNum do
		local tmpDirAngle = dirAngle * (i - 1)
		local diffAngle = Mathf.Abs(angle - tmpDirAngle)

		if i == 1 then
			if angle >= 0 and angle <= dirAngleHalf then
				return minDirIndex, 0
			elseif angle >= 360 - dirAngleHalf and angle <= 360 then
				return minDirIndex, 0
			elseif angle > 180 then
				diffAngle = Mathf.Abs(360 - angle)
			end
		end

		if diffAngle < minAngle then
			minAngle = diffAngle
			minDirIndex = i
		end
	end

	return minDirIndex, minAngle
end

function MathHelper.setRandomSeed(seed)
	math.randomseed(seed)
end

function MathHelper.addValuePermil(value, permil)
	permil = Mathf.Abs(permil)
	value = value * (1000 + permil) / 1000

	return value
end

function MathHelper.subValuePermil(value, permil)
	value = value * (1000 - permil) / 1000

	if value < 0 then
		value = 0
	end

	return value
end

function MathHelper.getRandomResult(permil, param)
	if permil <= 0 then
		return false
	elseif permil >= 1000 then
		return true
	end

	local rnd = MathHelper.getRandom(0, 1000, param)

	if rnd <= permil then
		return true
	end

	return false
end

function MathHelper.getRandom(num1, num2, param)
	local seed = tostring(os.time()):reverse():sub(1, 6)

	if param ~= nil then
		seed = seed + param
	end

	math.randomseed(seed)

	local ret = math.random(num1, num2)

	return ret
end

function MathHelper.getRandomWithSeed(num1, num2, param)
	math.randomseed(param)

	local ret = math.random(num1, num2)

	return ret
end

function MathHelper.getRandomFloat(num1, num2, param)
	local seed = tostring(os.time()):reverse():sub(1, 6)

	if param ~= nil then
		seed = seed + param
	end

	math.randomseed(seed)

	local num = 100
	local ret = math.random(num1 * num, num2 * num) / num

	return ret
end

function MathHelper.getNoRepeatRandom(min, max, num)
	local ret = {}

	if num > max - min + 1 then
		return ret
	end

	local t = {}

	for i = min, max do
		table.insert(t, i)
	end

	for i = 1, num do
		local rndNum = MathHelper.getRandom(1, #t)

		table.insert(ret, t[rndNum])
		table.remove(t, rndNum)
	end

	return ret
end

function MathHelper.getAnimatorNormalizedTime(time)
	local timeFloor = Mathf.Floor(time)

	if time == 0 then
		return 0
	end

	if timeFloor == time then
		return 1
	else
		local ret = time - timeFloor

		ret = Mathf.Clamp(ret, 0, 1)

		return ret
	end
end

function MathHelper.getAngleFull(angle)
	local tmpAngle = Mathf.Abs(angle)

	tmpAngle = tmpAngle % 360

	if angle < 0 then
		tmpAngle = -tmpAngle
	end

	return (tmpAngle + 360) % 360
end

function MathHelper.getAngleHalf(angle)
	local tmpAngle = MathHelper.getAngleFull(angle)

	if tmpAngle > 180 then
		tmpAngle = tmpAngle - 360
	end

	return tmpAngle
end

function MathHelper.AngleMoveTowards(angle1, angle2, t)
	local angleStart = MathHelper.getAngleFull(angle1)
	local angleEnd = MathHelper.getAngleFull(angle2)
	local angleDiff = Mathf.Abs(angleEnd - angleStart)

	if angleDiff > 180 then
		if angleEnd > 180 then
			angleEnd = angleEnd - 360
		else
			angleStart = angleStart - 360
		end
	end

	local angle = Mathf.MoveTowards(angleStart, angleEnd, t)

	return MathHelper.getAngleFull(angle)
end

function MathHelper.AngleVector3MoveTowards(angleStartVec3, angleEndVec3, t)
	local vecStart = angleStartVec3:Clone()
	local vecEnd = angleEndVec3:Clone()

	vecStart.x = MathHelper.getAngleFull(vecStart.x)
	vecStart.y = MathHelper.getAngleFull(vecStart.y)
	vecStart.z = MathHelper.getAngleFull(vecStart.z)
	vecEnd.x = MathHelper.getAngleFull(vecEnd.x)
	vecEnd.y = MathHelper.getAngleFull(vecEnd.y)
	vecEnd.z = MathHelper.getAngleFull(vecEnd.z)

	local angleDiff = Mathf.Abs(vecEnd.x - vecStart.x)

	if angleDiff > 180 then
		if vecEnd.x > 180 then
			vecEnd.x = vecEnd.x - 360
		else
			vecStart.x = vecStart.x - 360
		end
	end

	angleDiff = Mathf.Abs(vecEnd.y - vecStart.y)

	if angleDiff > 180 then
		if vecEnd.y > 180 then
			vecEnd.y = vecEnd.y - 360
		else
			vecStart.y = vecStart.y - 360
		end
	end

	angleDiff = Mathf.Abs(vecEnd.z - vecStart.z)

	if angleDiff > 180 then
		if vecEnd.z > 180 then
			vecEnd.z = vecEnd.z - 360
		else
			vecStart.z = vecStart.z - 360
		end
	end

	local vec3 = Vector3.MoveTowards(vecStart, vecEnd, t)

	vec3.x = MathHelper.getAngleFull(vec3.x)
	vec3.y = MathHelper.getAngleFull(vec3.y)
	vec3.z = MathHelper.getAngleFull(vec3.z)

	return vec3
end

function MathHelper.getDistancePointToLine(origin, point, line)
	local tmpDir = point - origin
	local dir = Vector3.Project(tmpDir, line)
	local tmp = tmpDir - dir

	return tmp.magnitude
end

function MathHelper.getAngleByTriangleSide(a, b, c)
	if c >= a + b then
		return 180
	elseif b >= a + c then
		return 0
	elseif a >= b + c then
		return 0
	end

	local cosT = (a * a + b * b - c * c) / (2 * a * b)

	cosT = Mathf.Clamp(cosT, -1, 1)

	local angle = Mathf.Acos(cosT) * Mathf.Rad2Deg

	return angle
end

function MathHelper.getAngleByTriangleSide2(a, b, squareC)
	local cosT = (a * a + b * b - squareC) / (2 * a * b)

	cosT = Mathf.Clamp(cosT, -1, 1)

	local angle = Mathf.Acos(cosT) * Mathf.Rad2Deg

	return angle
end

function MathHelper.getTriangleSideSquareByAngle(angle, a, b)
	local squareC = a * a + b * b - 2 * Mathf.Cos(angle * Mathf.Deg2Rad) * a * b

	return squareC
end

function MathHelper.MoveTowardsVector2(x1, y1, x2, y2, delta)
	local x = x2 - x1
	local y = y2 - y1
	local s = x * x + y * y

	if s > delta * delta and MathHelper.IsZero(s) == false then
		s = delta / Mathf.Sqrt(s)

		return x1 + x * s, y1 + y * s
	end

	return x2, y2
end

function MathHelper.GetCrossPointLineCircle(cx, cy, r, stx, sty, edx, edy)
	local x1, y1, x2, y2
	local ret = {}

	if MathHelper.Approximately(stx, edx) == true and MathHelper.Approximately(sty, edy) == true then
		return ret
	elseif MathHelper.Approximately(stx, edx) == true then
		local a = r * r - (stx - cx) * (stx - cx)

		if a >= 0 then
			local tmp = Mathf.Sqrt(a)

			x1 = stx
			x2 = stx
			y1 = cy + tmp
			y2 = cy - tmp
		else
			return ret
		end
	else
		local k = (edy - sty) / (edx - stx)
		local b = edy - k * edx
		local c = cx * cx + (b - cy) * (b - cy) - r * r
		local a = 1 + k * k
		local b1 = 2 * cx - 2 * k * (b - cy)
		local b2 = b1 * b1 - 4 * a * c

		if b2 >= 0 then
			local tmp = Mathf.Sqrt(b2)

			x1 = (b1 + tmp) / (2 * a)
			y1 = k * x1 + b
			x2 = (b1 - tmp) / (2 * a)
			y2 = k * x2 + b
		else
			return ret
		end
	end

	local res1 = (x1 - cx) * (x1 - cx) + (y1 - cy) * (y1 - cy)

	if MathHelper.Approximately(res1, r * r) == true then
		tmp = {}
		tmp.x = x1
		tmp.y = y1

		table.insert(ret, tmp)
	end

	local res2 = (x2 - cx) * (x2 - cx) + (y2 - cy) * (y2 - cy)

	if MathHelper.Approximately(res2, r * r) == true then
		tmp = {}
		tmp.x = x2
		tmp.y = y2

		table.insert(ret, tmp)
	end

	return ret
end

function MathHelper.GetParabolaParam(startPos, endPos, angle, gravity)
	local relative = endPos - startPos

	gravity = Mathf.Abs(gravity)

	local v = 0
	local disX = 0
	local disY = 0

	if MathHelper.IsZero(relative.y) == true then
		relative.y = 0
	end

	disY = relative.y
	relative.y = 0
	disX = relative.magnitude
	relative = nil

	local sinAngle = Mathf.Sin(angle * Mathf.Deg2Rad)
	local cosAngle = Mathf.Cos(angle * Mathf.Deg2Rad)
	local tmp = 2 * (cosAngle * sinAngle * disX - disY * cosAngle * cosAngle)

	if tmp > 0 then
		local speed = Mathf.Sqrt(gravity * disX * disX / tmp)

		return speed * cosAngle, speed * sinAngle
	end

	return 0, 0
end

function MathHelper.IsInCapsule(pos, point1, point2, radius)
	if radius < 0 or MathHelper.IsZero(radius) == true then
		return false
	end

	local dir = point1 - point2

	if MathHelper.IsZero(dir.sqrMagnitude) == true then
		local dis1 = Vector3.Distance(pos, point1)

		if dis1 <= radius then
			dir = nil

			return true
		end
	else
		local dis1 = Vector3.Distance(pos, point1)

		if dis1 <= radius then
			return true
		end

		local dis2 = Vector3.Distance(pos, point2)

		if dis2 <= radius then
			return true
		end

		local posToP2 = pos - point2
		local posToP2D = Vector3.Project(posToP2, dir)

		if MathHelper.IsZero(posToP2D.sqrMagnitude) == true then
			if posToP2.sqrMagnitude <= radius * radius then
				dir = nil
				posToP2 = nil
				posToP2D = nil

				return true
			end
		elseif Vector3.Dot(posToP2D, dir) > 0 then
			posToP2:Sub(posToP2D)

			if posToP2.sqrMagnitude <= radius * radius then
				dir = nil
				posToP2 = nil
				posToP2D = nil

				return true
			end
		end

		posToP2 = nil
		posToP2D = nil
	end

	dir = nil

	return false
end
