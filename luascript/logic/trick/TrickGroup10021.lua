-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10021.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10021 = class("TrickGroup10021", TrickGroupBase)

function TrickGroup10021:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Single
end

function TrickGroup10021:Open(pos, rot)
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

function TrickGroup10021:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

return TrickGroup10021
