-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Lib/Tween/TweenManager.lua

TweenManager = class("TweenManager")

local tweens = {}
local remove = {}

function TweenManager.GetAll()
	return tweens
end

function TweenManager.RemoveAll()
	tweens = {}
end

function TweenManager.Add(tween)
	table.insert(tweens, tween)
end

function TweenManager.Remove(tween)
	for _k, _v in pairs(tweens) do
		if _v == tween then
			table.remove(tweens, _k)

			break
		end
	end

	tween = nil
end

function TweenManager.Update(time)
	if table.nums(tweens) == 0 then
		return false
	end

	if time == nil then
		time = TimeHelper.getNowTimeNoScale()
	end

	local tempList = {}

	for k, v in pairs(tweens) do
		local flag = v:Update(time)

		if flag then
			table.insert(tempList, v)
		elseif v.autokill then
			v = nil
		end
	end

	tweens = tempList
end

return TweenManager
