-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10007_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10007_Value = class("Hero10007_Value", AnimalBase_Value)

function Hero10007_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero10007_Value:Update()
	AnimalBase_Value.Update(self)

	if self.animal:IsDead() == false then
		local nowPower = self:GetProperty(MS_HeroData.Property.Power)

		if nowPower > 0 then
			if self.animal:IsSkillingById(Hero10007_Define.SkillType.SkillHP1, 0) == false and self.animal:IsSkillingById(Hero10007_Define.SkillType.SkillHP2, 0) == false then
				self:DecrementPower()
			end
		else
			if self.animal:IsHaveStatusById(Hero10007_Define.StatusEnergyDontUse) == true then
				self.animal:ClearStatusById(Hero10007_Define.StatusEnergyDontUse)
			end

			if self.animal:IsHaveStatusById(Hero10007_Define.StatusGuardUp) == true then
				self.animal:ClearStatusById(Hero10007_Define.StatusGuardUp)
			end
		end
	end
end

function Hero10007_Value:InitProperty(propertyId, isStart, reset)
	if isStart == true then
		if propertyId == MS_HeroData.Property.Rage or propertyId == MS_HeroData.Property.Power or propertyId == MS_HeroData.Property.TrophyShield or propertyId == MS_HeroData.Property.SkillShield then
			if reset == true then
				self.property[propertyId] = 0
			elseif self.property[propertyId] > self:GetPropertyMax(propertyId) then
				self.property[propertyId] = self:GetPropertyMax(propertyId)
			end
		else
			self.property[propertyId] = self:GetPropertyMax(propertyId)
		end
	elseif self.property[propertyId] > self:GetPropertyMax(propertyId) then
		self.property[propertyId] = self:GetPropertyMax(propertyId)
	end
end

function Hero10007_Value:GetSkillEnergy(skillIndex, skillCombo)
	local useEnergy = AnimalBase_Value.GetSkillEnergy(self, skillIndex, skillCombo)

	if useEnergy > 0 and self.animal:GetSkillComboAttack() >= Hero10007_Define.TalentComboAttackNum then
		local tmpTalentEnergy = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.ComboAttackSubEnergy, 0, 0)

		if tmpTalentEnergy > 0 then
			useEnergy = MathHelper.subValuePermil(useEnergy, tmpTalentEnergy)
		end
	end

	return useEnergy
end

function Hero10007_Value:UseSkillEnergy(skillIndex, skillCombo)
	local useEnergy = AnimalBase_Value.UseSkillEnergy(self, skillIndex, skillCombo)

	self.animal:AddSkillComboAttack(skillIndex, skillCombo)

	return useEnergy
end

function Hero10007_Value:DamageDrop(height)
	local damage, realDamage = AnimalBase_Value.DamageDrop(self, height)

	if self:CheckDead() == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.storyId == 1007 and self.animal.moveFallPos.x > -134 and self.animal.moveFallPos.x < -129 and self.animal.moveFallPos.y > 53 and self.animal.moveFallPos.y < 56 and self.animal.moveFallPos.z > -12 and self.animal.moveFallPos.z < 2 then
		self.gameController:CompleteQuest(Hero10007_Define.QuestId_DropDead)
	end

	return damage, realDamage
end

function Hero10007_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero10007_Value
