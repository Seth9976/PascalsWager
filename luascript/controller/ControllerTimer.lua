-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerTimer.lua

ControllerTimer = class("ControllerTimer")
ControllerTimer.static.Priority = {
	GameMode = 3,
	Skill = 1,
	Menu = 4,
	QuickItem = 2
}
ControllerTimer.static.PriorityMax = 4

function ControllerTimer:initialize()
	self.scaleEnterOutList = {}
	self.scaleEnterInList = {}
	self.timeEnterOutList = {}
	self.timeEnterInList = {}
	self.timeExitOutList = {}
	self.timeExitInList = {}

	for i = 1, ControllerTimer.PriorityMax do
		self.scaleEnterOutList[i] = 1
		self.scaleEnterInList[i] = 1
		self.timeEnterOutList[i] = 0
		self.timeEnterInList[i] = 0
		self.timeExitOutList[i] = 0
		self.timeExitInList[i] = 0
	end

	self.timeScaleNow = 1
end

function ControllerTimer:PauseTime(priority)
	self:SetTimeScale(priority, 0, 0, -1, 0)
end

function ControllerTimer:ResumeTime(priority)
	self:RecoveryTimeScale(priority)
end

function ControllerTimer:SetTimeScale(priority, scale, enterTime, keepTime, exitTime)
	if self.scaleEnterOutList == nil then
		return
	end

	SystemHelper.LogTest("========SetTimeScale======priority=" .. priority .. "==scale=" .. scale)

	self.scaleEnterOutList[priority] = scale

	if enterTime > 0 then
		self.timeEnterInList[priority] = TimeHelper.getNowTimeNoScale()
		self.timeEnterOutList[priority] = self.timeEnterInList[priority] + enterTime
	else
		self.timeEnterInList[priority] = 0
		self.timeEnterOutList[priority] = 0
	end

	if keepTime < 0 then
		self.timeExitOutList[priority] = 0
		self.timeExitInList[priority] = 0
	else
		if self.timeEnterOutList[priority] > 0 then
			self.timeExitInList[priority] = self.timeEnterOutList[priority] + keepTime
		else
			self.timeExitInList[priority] = TimeHelper.getNowTimeNoScale() + keepTime
		end

		if exitTime >= 0 then
			self.timeExitOutList[priority] = self.timeExitInList[priority] + exitTime
		end
	end
end

function ControllerTimer:RecoveryTimeScale(priority)
	if self.scaleEnterOutList == nil then
		return
	end

	SystemHelper.LogTest("========RecoveryTimeScale======priority=" .. priority)

	self.scaleEnterOutList[priority] = 1
	self.scaleEnterInList[priority] = 1
	self.timeEnterInList[priority] = 0
	self.timeEnterOutList[priority] = 0
	self.timeExitOutList[priority] = 0
	self.timeExitInList[priority] = 0
end

function ControllerTimer:GetTimeScaleAllPriority()
	if self.scaleEnterOutList == nil then
		return 1
	end

	local useFlg = false
	local scale = 1

	for i = ControllerTimer.PriorityMax, 1, -1 do
		useFlg, scale = self:GetTimeScaleByPriority(i)

		if useFlg == true then
			return scale
		end
	end

	return 1
end

function ControllerTimer:GetTimeScaleByPriority(priority)
	if self.scaleEnterOutList == nil then
		return false, 1
	end

	local i = priority

	if self.scaleEnterOutList[i] ~= 1 then
		local nowTime = TimeHelper.getNowTimeNoScale()

		if self.timeExitOutList[i] > 0 and nowTime > self.timeExitOutList[i] then
			self:RecoveryTimeScale(i)
		elseif self.timeExitInList[i] > 0 and nowTime > self.timeExitInList[i] then
			if self.timeExitOutList[i] > self.timeExitInList[i] then
				local radio = (nowTime - self.timeExitInList[i]) / (self.timeExitOutList[i] - self.timeExitInList[i])

				radio = Mathf.Clamp(radio, 0, 1)

				local ret = Mathf.Lerp(self.scaleEnterOutList[i], 1, radio)

				return true, ret
			else
				self:RecoveryTimeScale(i)
			end
		elseif self.scaleEnterInList[i] ~= self.scaleEnterOutList[i] and self.timeEnterInList[i] > 0 and self.timeEnterOutList[i] > self.timeEnterInList[i] then
			local radio = (nowTime - self.timeEnterInList[i]) / (self.timeEnterOutList[i] - self.timeEnterInList[i])

			radio = Mathf.Clamp(radio, 0, 1)

			local ret = Mathf.Lerp(self.scaleEnterInList[i], self.scaleEnterOutList[i], radio)

			return true, ret
		else
			return true, self.scaleEnterOutList[i]
		end
	end

	return false, 1
end

function ControllerTimer:GetTimeScale()
	return self.timeScaleNow
end

function ControllerTimer:Update()
	if self.scaleEnterOutList == nil then
		return
	end

	local target = self:GetTimeScaleAllPriority()

	if self.timeScaleNow ~= target then
		TimeHelper.slowTime(target)

		self.timeScaleNow = target

		if target <= 0 then
			inputMgr:StopVibration()
		end
	end
end

function ControllerTimer:Exit()
	TimeHelper.slowTime(1)

	self.scaleEnterOutList = nil
	self.scaleEnterInList = nil
	self.timeEnterOutList = nil
	self.timeEnterInList = nil
	self.timeExitOutList = nil
	self.timeExitInList = nil
end

return ControllerTimer
