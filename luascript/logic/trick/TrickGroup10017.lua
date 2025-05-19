-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10017.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10017_Define")

TrickGroup10017 = class("TrickGroup10017", TrickGroupBase)

function TrickGroup10017:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Period
	self.hitType = AnimalBase_Define.HitType.None
	self.playMode = TrickGroupBase.PlayMode.Single
	self.trickActive = nil
	self.hitTime = 0
end

function TrickGroup10017:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickActive = self:OpenTrickSingle(pos, rot)

	if self.trickActive == nil then
		return false
	end

	self:Start()

	return true
end

function TrickGroup10017:Update()
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

		if nowTime >= self.hitTime + TrickGroup10017_Define.HitClearTime then
			self.trickActive:ClearHitAnimal()

			self.hitTime = 0
		end
	end

	if self.trickActive:IsLoopEnd() == true or self.trickActive:IsPlaying() == false then
		self.trickActive:ClearHitAnimal()

		self.hitTime = 0
	end
end

return TrickGroup10017
