-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10056.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10056 = class("TrickGroup10056", TrickGroupBase)

function TrickGroup10056:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.None
	self.hitType = AnimalBase_Define.HitType.None
	self.playMode = TrickGroupBase.PlayMode.Single
	self.trickActive = nil
end

function TrickGroup10056:Open(pos, rot)
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

function TrickGroup10056:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

function TrickGroup10056:GetPosition()
	if self:IsOpening() == false then
		return nil
	end

	if self.trickActive ~= nil then
		return self.trickActive:GetPosition()
	end

	return nil
end

function TrickGroup10056:SetPosition(pos)
	if self:IsOpening() == false then
		return nil
	end

	if self.trickActive ~= nil then
		return self.trickActive:SetPosition(pos, nil, nil)
	end

	return nil
end

function TrickGroup10056:Exit()
	self.trickActive = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10056
