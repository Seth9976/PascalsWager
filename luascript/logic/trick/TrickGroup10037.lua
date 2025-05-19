-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10037.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10037_Define")

TrickGroup10037 = class("TrickGroup10037", TrickGroupBase)

function TrickGroup10037:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Period
	self.hitType = AnimalBase_Define.HitType.None
	self.playMode = TrickGroupBase.PlayMode.SingleLoop
	self.trickActive = nil
	self.hitTime = 0
end

function TrickGroup10037:Open(pos, rot)
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

function TrickGroup10037:SynchronizePosAndRot(pos, rot)
	if self.trickActive ~= nil then
		self.trickActive:SetPosition(pos)
		self.trickActive:SetRotation(rot)
	end
end

function TrickGroup10037:Update()
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

		if nowTime >= self.hitTime + TrickGroup10037_Define.HitClearTime then
			self.trickActive:ClearHitAnimal()

			self.hitTime = 0
		end
	end
end

return TrickGroup10037
