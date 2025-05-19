-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10025.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10025 = class("TrickGroup10025", TrickGroupBase)

function TrickGroup10025:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.FrontFly
	self.playMode = TrickGroupBase.PlayMode.Single
end

function TrickGroup10025:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local trick = self:OpenTrickSingle(pos, rot)

	if trick == nil then
		return false
	end

	self:Start()

	return true
end

function TrickGroup10025:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

return TrickGroup10025
