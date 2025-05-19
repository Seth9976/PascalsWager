-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10029.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10029_Define")

TrickGroup10029 = class("TrickGroup10029", TrickGroupBase)

function TrickGroup10029:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Up
	self.playMode = TrickGroupBase.PlayMode.Sequence
	self.startTime = nil
	self.startPos = nil
end

function TrickGroup10029:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local hostPlayer = self.sceneController:GetHostPlayer()

	if hostPlayer == nil then
		return false
	end

	local nowTime = TimeHelper.getNowTime()

	if self.startTime == nil then
		self.startTime = {}
	end

	if self.startPos == nil then
		self.startPos = {}
	end

	local targetPos = hostPlayer:GetFootprintPos()
	local center = MathHelper.getRandom(1, #self.trickList, 0)

	for i = 1, #self.trickList do
		self.startTime[i] = nowTime + TrickGroup10029_Define.IntervalTime * (i - 1)
		self.startPos[i] = targetPos:Clone()

		if i ~= center then
			self.startPos[i].x = self.startPos[i].x + MathHelper.getRandom(0, 1, i) * TrickGroup10029_Define.CreateRange * 2 - TrickGroup10029_Define.CreateRange
			self.startPos[i].z = self.startPos[i].z + MathHelper.getRandom(0, 1, i) * TrickGroup10029_Define.CreateRange * 2 - TrickGroup10029_Define.CreateRange
		end
	end

	self:Start()

	return true
end

function TrickGroup10029:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == false and nowTime > self.startTime[i] then
			trick:Play()
			trick:SetPosition(self.startPos[i])

			self.startTime[i] = self.startTime[i] + 999
		end
	end
end

function TrickGroup10029:Stop()
	self.startTime = nil
	self.startPos = nil

	TrickGroupBase.Stop(self)
end

function TrickGroup10029:Exit()
	self.startTime = nil
	self.startPos = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10029
