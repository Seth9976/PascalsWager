﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/System/Timer.lua

local setmetatable = setmetatable
local UpdateBeat = UpdateBeat
local CoUpdateBeat = CoUpdateBeat
local Time = Time

Timer = {}

local Timer = Timer
local mt = {
	__index = Timer
}

function Timer.New(func, duration, loop, unscaled)
	unscaled = unscaled or false and true
	loop = loop or 1

	return setmetatable({
		running = false,
		func = func,
		duration = duration,
		time = duration,
		loop = loop,
		unscaled = unscaled
	}, mt)
end

function Timer:Start()
	self.running = true

	if not self.handle then
		self.handle = UpdateBeat:CreateListener(self.Update, self)
	end

	UpdateBeat:AddListener(self.handle)
end

function Timer:Reset(func, duration, loop, unscaled)
	self.duration = duration
	self.loop = loop or 1
	self.unscaled = unscaled
	self.func = func
	self.time = duration
end

function Timer:Stop()
	self.running = false

	if self.handle then
		UpdateBeat:RemoveListener(self.handle)
	end
end

function Timer:Update()
	if not self.running then
		return
	end

	local delta = self.unscaled and Time.unscaledDeltaTime or Time.deltaTime

	self.time = self.time - delta

	if self.time <= 0 then
		self.func()

		if self.loop > 0 then
			self.loop = self.loop - 1
			self.time = self.time + self.duration
		end

		if self.loop == 0 then
			self:Stop()
		elseif self.loop < 0 then
			self.time = self.time + self.duration
		end
	end
end

FrameTimer = {}

local FrameTimer = FrameTimer
local mt2 = {
	__index = FrameTimer
}

function FrameTimer.New(func, count, loop)
	local c = Time.frameCount + count

	loop = loop or 1

	return setmetatable({
		running = false,
		func = func,
		loop = loop,
		duration = count,
		count = c
	}, mt2)
end

function FrameTimer:Reset(func, count, loop)
	self.func = func
	self.duration = count
	self.loop = loop
	self.count = Time.frameCount + count
end

function FrameTimer:Start()
	if not self.handle then
		self.handle = CoUpdateBeat:CreateListener(self.Update, self)
	end

	CoUpdateBeat:AddListener(self.handle)

	self.running = true
end

function FrameTimer:Stop()
	self.running = false

	if self.handle then
		CoUpdateBeat:RemoveListener(self.handle)
	end
end

function FrameTimer:Update()
	if not self.running then
		return
	end

	if Time.frameCount >= self.count then
		self.func()

		if self.loop > 0 then
			self.loop = self.loop - 1
		end

		if self.loop == 0 then
			self:Stop()
		else
			self.count = Time.frameCount + self.duration
		end
	end
end

CoTimer = {}

local CoTimer = CoTimer
local mt3 = {
	__index = CoTimer
}

function CoTimer.New(func, duration, loop)
	loop = loop or 1

	return setmetatable({
		running = false,
		duration = duration,
		loop = loop,
		func = func,
		time = duration
	}, mt3)
end

function CoTimer:Start()
	if not self.handle then
		self.handle = CoUpdateBeat:CreateListener(self.Update, self)
	end

	self.running = true

	CoUpdateBeat:AddListener(self.handle)
end

function CoTimer:Reset(func, duration, loop)
	self.duration = duration
	self.loop = loop or 1
	self.func = func
	self.time = duration
end

function CoTimer:Stop()
	self.running = false

	if self.handle then
		CoUpdateBeat:RemoveListener(self.handle)
	end
end

function CoTimer:Update()
	if not self.running then
		return
	end

	if self.time <= 0 then
		self.func()

		if self.loop > 0 then
			self.loop = self.loop - 1
			self.time = self.time + self.duration
		end

		if self.loop == 0 then
			self:Stop()
		elseif self.loop < 0 then
			self.time = self.time + self.duration
		end
	end

	self.time = self.time - Time.deltaTime
end
