-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10051.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10051 = class("TrickGroup10051", TrickGroupBase)

function TrickGroup10051:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.FrontFly
	self.playMode = TrickGroupBase.PlayMode.Sequence
end

function TrickGroup10051:Open(pos, rot)
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

function TrickGroup10051:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

function TrickGroup10051:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10051
