-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10046.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10046 = class("TrickGroup10046", TrickGroupBase)

function TrickGroup10046:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Multiply
end

function TrickGroup10046:Open(pos, rot)
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

function TrickGroup10046:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

function TrickGroup10046:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10046
