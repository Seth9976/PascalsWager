-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10006.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10006_Define")

TrickGroup10006 = class("TrickGroup10006", TrickGroupBase)

function TrickGroup10006:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.startTime = nil
	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Light
	self.playMode = TrickGroupBase.PlayMode.Sequence
end

function TrickGroup10006:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local nowTime = TimeHelper.getNowTime()

	if self.startTime == nil then
		self.startTime = {}
	end

	local rnd = MathHelper.getRandom(1, #self.trickList)

	for i = 1, #self.trickList do
		if i == rnd then
			self.startTime[i] = -1
		else
			self.startTime[i] = nowTime + TrickGroup10006_Define.IntervalTime * (i - 1)
		end
	end

	self:Start()

	self.stopCnt = 1

	return true
end

function TrickGroup10006:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and self.startTime[i] >= 0 then
			if trick:IsPlaying() == false then
				if nowTime > self.startTime[i] then
					trick:Play()

					self.startTime[i] = self.startTime[i] + 999
				end
			elseif trick:IsTriggerTime(TrickGroup10006_Define.TrapNormalizeTime) then
				trick:AddTrap(trick:GetPosition())
			end
		end
	end
end

function TrickGroup10006:Stop()
	self.startTime = nil

	TrickGroupBase.Stop(self)
end

function TrickGroup10006:Exit()
	self.startTime = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10006
