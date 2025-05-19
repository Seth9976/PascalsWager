-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10032.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10032_Define")

TrickGroup10032 = class("TrickGroup10032", TrickGroupBase)

function TrickGroup10032:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Period
	self.hitType = AnimalBase_Define.HitType.None
	self.playMode = TrickGroupBase.PlayMode.SingleLoop
	self.trickActive = nil
	self.param = 0
	self.hitTime = 0
end

function TrickGroup10032:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickActive = self:OpenTrickSingle(pos, rot)

	if self.trickActive == nil then
		return false
	end

	self.trickActive:SetParamFloat(TrickGroup10032_Define.Param, self.param)

	self.param = (self.param + 1) % TrickGroup10032_Define.Pattern

	self:Start()

	return true
end

function TrickGroup10032:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil then
		return
	end

	if self.hitTime <= 0 then
		if self.trickActive:IsHitAnimal() == true then
			self.hitTime = TimeHelper.getNowTime()
		end
	else
		local nowTime = TimeHelper.getNowTime()

		if nowTime >= self.hitTime + TrickGroup10032_Define.HitClearTime then
			self.trickActive:ClearHitAnimal()

			self.hitTime = 0
		end
	end

	if self.trickActive:IsLoopEnd() == true then
		self.trickActive:SetParamFloat(TrickGroup10032_Define.Param, self.param)

		self.param = (self.param + 1) % TrickGroup10032_Define.Pattern

		self.trickActive:ClearHitAnimal()

		self.hitTime = 0
	end
end

function TrickGroup10032:Exit()
	self.trickActive = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10032
