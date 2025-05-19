-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10026.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10026_Define")

TrickGroup10026 = class("TrickGroup10026", TrickGroupBase)

function TrickGroup10026:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Down
	self.playMode = TrickGroupBase.PlayMode.Single
	self.trickActive = nil
end

function TrickGroup10026:Open(pos, rot)
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

function TrickGroup10026:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive ~= nil then
		local animatorTime = self.trickActive:GetTime()

		if animatorTime < TrickGroup10026_Define.TraceTime then
			local target = self.sceneController:GetHostPlayer()

			if target ~= nil and target:IsDead() == false and target:IsShow() == true then
				self.trickActive:SetPosition(target:GetFootprintPos())
			end
		end
	end
end

function TrickGroup10026:GetPosition()
	if self:IsOpening() == false then
		return nil
	end

	if self.trickActive ~= nil then
		return self.trickActive:GetPosition()
	end

	return nil
end

function TrickGroup10026:Exit()
	self.trickActive = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10026
