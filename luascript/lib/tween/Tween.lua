-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Lib/Tween/Tween.lua

Tween = class("Tween")

function Tween:initialize(object)
	self.object = object
	self.oldValue = 0
	self.valuesStart = {}
	self.valuesEnd = {}
	self.valuesStartRepeat = {}
	self.duration = 10
	self.repeatCount = -1
	self.repeatDelayTime = -1
	self.yoyo = false
	self.isPlaying = false
	self.reversed = false
	self.autokill = true
	self.pause = false
	self.delayTime = 0
	self.startTime = nil
	self.easingFunction = Easing.Linear.easeInOut
	self.tweenPath = TweenPath.Linear
	self.sequenceList = {}
	self.onStartCallback = nil
	self.onStartCallbackFired = false
	self.onUpdateCallback = nil
	self.onCompleteCallback = nil
	self.onStopCallback = nil
	self.onTriggerCallback = {}
	self.virtual = false
	self.moveToEnd = false

	if self.object == nil then
		self.virtual = true
	end
end

function Tween:MoveTo(properties, duration)
	if duration ~= nil then
		self.duration = duration
	end

	self.valuesStart = {}
	self.valuesStartRepeat = {}
	self.valuesEnd = {}

	for k, v in pairs(properties) do
		self.valuesEnd[k] = v

		if self.virtual == false then
			if type(v) == "table" and table.nums(v) == #v then
				table.insert(self.valuesEnd[k], 1, self.object[k])

				self.valuesStartRepeat[k] = {}

				for _k, _v in pairs(self.valuesEnd[k]) do
					self.valuesStartRepeat[k][#self.valuesEnd[k] - _k + 1] = _v
				end
			else
				self.valuesStart[k] = self.object[k]
				self.valuesStartRepeat[k] = self.object[k]
			end
		end
	end
end

function Tween:Start(time)
	TweenManager.Add(self)

	self.isPlaying = true
	self.onStartCallbackFired = false

	if time == nil then
		time = TimeHelper.getNowTimeNoScale()
	end

	self.startTime = time + self.delayTime
end

function Tween:Stop()
	if not self.isPlaying then
		return
	end

	TweenManager.Remove(self)

	self.isPlaying = false

	if self.onStopCallback ~= nil then
		self:onStopCallback()
	end

	self:StopSequenceList()
end

function Tween:ForceEnd()
	self:Update(self.startTime + self.duration)
end

function Tween:SetMoveToEnd(bool)
	self.moveToEnd = bool
end

function Tween:StopSequenceList()
	for _k, _v in pairs(self.sequenceList) do
		_v:Stop()
	end
end

function Tween:Delay(amount)
	self.delayTime = amount
end

function Tween:Repeat(times)
	self.repeatCount = times
end

function Tween:RepeatDelay(amount)
	self.repeatDelayTime = amount
end

function Tween:SetMixed(miexdType)
	self.mixed = miexdType
end

function Tween:Yoyo(yoyo)
	self.yoyo = yoyo
end

function Tween:SetAutoKill(auto)
	self.autokill = auto
end

function Tween:Easing(easing)
	self.easingFunction = easing
end

function Tween:TweenPath(interpolation)
	self.tweenPath = interpolation
end

function Tween:Sequence(arguments)
	self.sequenceList = arguments
end

function Tween:OnStart(callback)
	self.onStartCallback = callback
end

function Tween:OnUpdate(callback)
	self.onUpdateCallback = callback
end

function Tween:OnComplete(callback)
	self.onCompleteCallback = callback
end

function Tween:OnStop(callback)
	self.onStopCallback = callback
end

function Tween:OnTrigger(callback)
	self.onTriggerCallback = callback
end

function Tween:GetAllSequence()
	local seqList = {}
	local alltime = 0

	local function eachSequence(list)
		local maxTime = 0

		for _k, _v in pairs(list) do
			table.insert(seqList, _v)

			maxTime = Mathf.Max(maxTime, _v.delayTime + _v.duration)

			if #_v.sequenceList > 0 then
				alltime = alltime + eachSequence(_v.sequenceList)
			end
		end

		return maxTime
	end

	alltime = alltime + eachSequence({
		self
	})

	return seqList, alltime
end

function Tween:GetValue(value)
	for k, v in pairs(self.valuesEnd) do
		local vstart = self.valuesStart[k]
		local vend = self.valuesEnd[k]
		local offset, ret

		if table.nums(vend) == #vend then
			ret = self.tweenPath(vend, value)
		else
			offset = vend - vstart
			ret = vstart + offset * value
		end

		return ret
	end
end

function Tween:Update(time)
	local elapsed, value

	if self.virtual == false and IsNil(self.object) then
		return false
	end

	if time < self.startTime then
		return true
	end

	if self.onStartCallbackFired == false then
		if self.onStartCallback ~= nil then
			self.onStartCallback()
		end

		self.onStartCallbackFired = true
	end

	elapsed = (time - self.startTime) / self.duration
	elapsed = Mathf.Clamp01(elapsed)
	value = self.easingFunction(elapsed)

	self:OnValueChange(value)

	for _k, _v in pairs(self.onTriggerCallback) do
		local trigger = _k

		if self.reversed then
			trigger = 1 - trigger
		end

		if trigger > self.oldValue and trigger <= value and _v ~= nil then
			_v()
		end
	end

	self.oldValue = value

	if self.onUpdateCallback ~= nil then
		self.onUpdateCallback(value)
	end

	if elapsed >= 1 then
		if self.repeatCount > 0 then
			self.repeatCount = self.repeatCount - 1

			if self.repeatCount == 0 then
				self.repeatCount = -1
			end
		end

		if self.repeatCount ~= -1 then
			for k, v in pairs(self.valuesStartRepeat) do
				if self.yoyo then
					local tmp = self.valuesStartRepeat[k]

					self.valuesStartRepeat[k] = self.valuesEnd[k]
					self.valuesEnd[k] = tmp
				end

				self.valuesStart[k] = self.valuesStartRepeat[k]
			end

			if self.yoyo then
				self.reversed = not self.reversed
			end

			if self.repeatDelayTime ~= -1 then
				self.startTime = time + self.repeatDelayTime
			else
				self.startTime = time + self.delayTime
			end

			self.oldValue = 0

			return true
		else
			if self.moveToEnd then
				for k, v in pairs(self.valuesEnd) do
					local vend = self.valuesEnd[k]

					if type(vend) == "table" and table.nums(vend) == #vend then
						-- block empty
					elseif self.virtual == false then
						self.object[k] = vend
					end
				end
			end

			if self.onCompleteCallback ~= nil then
				self.onCompleteCallback()
			end

			for _k, _v in pairs(self.sequenceList) do
				_v:Start(self.startTime + self.duration)
			end

			self.isPlaying = false

			return false
		end
	end

	return true
end

function Tween:OnValueChange(value)
	for k, v in pairs(self.valuesEnd) do
		local vstart = self.valuesStart[k]
		local vend = self.valuesEnd[k]
		local offset, ret

		if type(vend) == "table" and table.nums(vend) == #vend then
			ret = self.tweenPath(vend, value)
		else
			offset = vend - vstart
			ret = vstart + offset * value
		end

		if self.virtual == false then
			self.object[k] = ret
		end
	end
end

return Tween
