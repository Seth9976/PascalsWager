-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10045.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10045 = class("TrickGroup10045", TrickGroupBase)

function TrickGroup10045:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Sequence
	self.trickActive = nil
end

function TrickGroup10045:Open(pos, rot)
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

function TrickGroup10045:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil then
		return
	end

	local targetAnimal = self.sceneController:GetHostPlayer()

	if targetAnimal ~= nil and targetAnimal:IsDead() == false and self.trickActive:IsHaveHitAnimal(targetAnimal) == true then
		targetAnimal.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
		targetAnimal:ChangeToDead(AnimalBase_Define.DeadReason.MustDeath)

		local tmpHostPlayer = self.sceneController:GetSecondaryHostPlayer()

		if tmpHostPlayer ~= nil and tmpHostPlayer:IsDead() == false then
			tmpHostPlayer.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
			tmpHostPlayer:ChangeToDead(AnimalBase_Define.DeadReason.MustDeath)
		end
	end
end

function TrickGroup10045:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10045
