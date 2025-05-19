-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10003.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10003 = class("TrickGroup10003", TrickGroupBase)

function TrickGroup10003:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Up
	self.playMode = TrickGroupBase.PlayMode.Single
end

function TrickGroup10003:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local trick = self:OpenTrickSingle(nil, nil)

	if trick == nil then
		return false
	end

	self:Start()

	return true
end

function TrickGroup10003:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

return TrickGroup10003
