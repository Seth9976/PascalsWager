-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10005_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10005_Value = class("Hero10005_Value", AnimalBase_Value)

function Hero10005_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero10005_Value:Update()
	AnimalBase_Value.Update(self)

	if self.animal:IsDead() == false and self.animal:GetGrade() > 1 then
		self:DecrementRage()

		local nowRage = self:GetProperty(MS_HeroData.Property.Rage)

		if nowRage <= 0 then
			self.animal:ResetGrade()
		end
	end
end

function Hero10005_Value:AddPropertyCommon(propertyId, add, isPeriod)
	if propertyId == MS_HeroData.Property.Rage and self.animal:GetGrade() > 1 then
		return 0
	end

	AnimalBase_Value.AddPropertyCommon(self, propertyId, add, isPeriod)
end

function Hero10005_Value:GetSkillEnergy(skillIndex, skillCombo)
	local useEnergy = AnimalBase_Value.GetSkillEnergy(self, skillIndex, skillCombo)

	if useEnergy > 0 and self.animal:GetSkillComboAttack() >= Hero10005_Define.TalentComboAttackNum then
		local tmpTalentEnergy = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.ComboAttackSubEnergy, 0, 0)

		if tmpTalentEnergy > 0 then
			useEnergy = MathHelper.subValuePermil(useEnergy, tmpTalentEnergy)
		end
	end

	return useEnergy
end

function Hero10005_Value:UseSkillEnergy(skillIndex, skillCombo)
	local useEnergy = AnimalBase_Value.UseSkillEnergy(self, skillIndex, skillCombo)

	self.animal:AddSkillComboAttack(skillIndex, skillCombo)

	return useEnergy
end

function Hero10005_Value:UseSkillRage(skillIndex, skillCombo)
	if self.animal:GetGrade() > 1 then
		return
	end

	AnimalBase_Value.UseSkillRage(self, skillIndex, skillCombo)
end

function Hero10005_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero10005_Value
