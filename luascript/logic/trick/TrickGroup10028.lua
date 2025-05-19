-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10028.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10028_Define")

TrickGroup10028 = class("TrickGroup10028", TrickGroupBase)

function TrickGroup10028:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Sequence
end

function TrickGroup10028:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local nowTime = TimeHelper.getNowTime()

	if self.startTime == nil then
		self.startTime = {}
	end

	if self.usedList == nil then
		self.usedList = {}
	end

	for i = 1, #self.trickList do
		self.startTime[i] = nowTime + TrickGroup10028_Define.IntervalTime * (i - 1)
		self.usedList[i] = false
	end

	self:Start()

	return true
end

function TrickGroup10028:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick == nil or not (self.startTime[i] >= 0) or trick:IsPlaying() == true then
			-- block empty
		elseif self.usedList[i] == false and nowTime > self.startTime[i] then
			local target = self.sceneController:GetHostPlayer()

			if target ~= nil and target:IsDead() == false and target:IsShow() == true then
				trick:SetPosition(target:GetFootprintPos())
				trick:Play()
			end

			self.usedList[i] = true
		end
	end
end

function TrickGroup10028:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10028
