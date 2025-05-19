-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20050.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20050_Define")

Hero20050 = class("Hero20050", AnimalBase)

function Hero20050:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletTraceVec3 = Vector3.zero
	self.bulletTraceVec3.z = Hero20050_Define.BulletTraceSpeed
	self.heroPose = 0
end

function Hero20050:Start()
	AnimalBase.Start(self)
	self:ChangeEquipment(self.heroVariety)

	self.heroPose = self.heroVariety

	local max = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)

	if self.heroPose == Hero20050_Define.PoseAll then
		self.animalGrade = Hero20050_Define.GradeSpear

		local hp = max * Hero20050_Define.HpLockPercent1

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
		self:ChangePose(Hero20050_Define.PoseAll)
	elseif self.heroPose == Hero20050_Define.PoseSpearAndHand then
		self.animalGrade = Hero20050_Define.GradeSpear

		local hp = max * Hero20050_Define.HpLockPercent3

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
		self:ChangePose(Hero20050_Define.PoseAll)
	elseif self.heroPose == Hero20050_Define.PoseShieldAndHand then
		self.animalGrade = Hero20050_Define.GradeShield

		local hp = max * Hero20050_Define.HpLockPercent3

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
		self:ChangePose(Hero20050_Define.PoseShieldAndHand)
	elseif self.heroPose == Hero20050_Define.PoseHand then
		self.animalGrade = Hero20050_Define.GradeHand

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
		self:ChangePose(Hero20050_Define.PoseHand)
	elseif self.heroPose == Hero20050_Define.PoseShield then
		self.animalGrade = Hero20050_Define.GradeShield

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
		self:ChangePose(Hero20050_Define.PoseShieldAndHand)
	elseif self.heroPose == Hero20050_Define.PoseSpear then
		self.animalGrade = Hero20050_Define.GradeSpear

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
		self:ChangePose(Hero20050_Define.PoseAll)
	elseif self.heroPose == Hero20050_Define.PoseSpearAndShield then
		self.animalGrade = Hero20050_Define.GradeSpear

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
		self:ChangePose(Hero20050_Define.PoseAll)
	end

	if self.heroVariety > 1 then
		if self.characterConfig ~= nil then
			local mat = self.characterConfig:GetOtherMaterial(1)

			if mat ~= nil then
				self:ChangeMaterial(mat)
			end
		end
	else
		local selfVfx = self:CreateSelfEffectLoop("self_1", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), Hero20050_Define.VfxName_PoseAll)

		if selfVfx ~= nil then
			selfVfx:SetDelayClear(true, nil)
		end

		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(4), Hero20050_Define.VfxName_Eye)
	end
end

function Hero20050:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20050:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20050:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true then
		if buttonPressDown == ControllerMain.SkillButton.Threat then
			if self.animalGrade <= 1 then
				self:AddGrade(false)
			else
				self:ResetGrade()
			end
		elseif buttonPressDown == ControllerMain.SkillButton.NewThreat then
			if self.animalGrade < 3 then
				self:AddGrade(false)
			else
				self:ResetGrade()
			end
		end
	end
end

function Hero20050:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20050:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)

	if self.animalGrade >= Hero20050_Define.GradeHand then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, false)
	elseif self.animalGrade >= Hero20050_Define.GradeShield then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, false)
	end
end

function Hero20050:ResetGrade()
	AnimalBase.ResetGrade(self)

	if self.animalGrade >= Hero20050_Define.GradeShield then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, true)
	end
end

function Hero20050:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
end

function Hero20050:ChangeEquipment(variety)
	if variety == Hero20050_Define.PoseAll then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, true)
	elseif variety == Hero20050_Define.PoseShieldAndHand then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, true)
	elseif variety == Hero20050_Define.PoseSpearAndHand then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, true)
	elseif variety == Hero20050_Define.PoseHand then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, true)
	elseif variety == Hero20050_Define.PoseShield then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, false)
	elseif variety == Hero20050_Define.PoseSpear then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, false)
	elseif variety == Hero20050_Define.PoseSpearAndShield then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentShield, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20050_Define.EquipmentHand, false)
	end
end

function Hero20050:ChangePose(variety)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, variety - 1, 0, 0)
end

function Hero20050:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:IsHitByType(AnimalBase_Define.HitType.Execute) == false and self:IsHitByType(AnimalBase_Define.HitType.Backstab) == false then
		local hpMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
		local hpNow = self.animalValue:GetProperty(MS_HeroData.Property.Hp)

		if self.heroPose == Hero20050_Define.PoseAll then
			if hpNow <= hpMax * Hero20050_Define.HpLockPercent1 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			end
		elseif self.heroPose == Hero20050_Define.PoseShieldAndHand then
			if self.heroVariety == Hero20050_Define.PoseAll and hpNow <= hpMax * Hero20050_Define.HpLockPercent2 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			elseif self.heroVariety == Hero20050_Define.PoseShieldAndHand and hpNow <= hpMax * Hero20050_Define.HpLockPercent3 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			end
		elseif self.heroPose == Hero20050_Define.PoseSpearAndHand then
			if self.heroVariety == Hero20050_Define.PoseSpearAndHand and hpNow <= hpMax * Hero20050_Define.HpLockPercent3 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			end
		elseif self.heroPose == Hero20050_Define.PoseHand then
			if hpNow <= 1 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			end
		elseif self.heroPose == Hero20050_Define.PoseShield then
			if hpNow <= 1 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			end
		elseif self.heroPose == Hero20050_Define.PoseSpear then
			if hpNow <= 1 then
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			end
		elseif self.heroPose == Hero20050_Define.PoseSpearAndShield and hpNow <= hpMax * Hero20050_Define.HpLockPercent3 then
			self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
		end
	end
end

function Hero20050:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20050_Define.SkillType.SkillO3 then
		if trigger > 0 then
			local startPos = self:GetWeaponBox(2).position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20050_Define.BulletTraceRangeMax, Hero20050_Define.BulletTraceRangeMax, Hero20050_Define.BulletTraceRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, skillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetSpeedAngle(Hero20050_Define.BulletTraceAngleSpeed)
					bullet:SetLifeTime(Hero20050_Define.BulletTraceLifeTime)
					bullet:Ready()
					bullet:SetSkillTargetAnimal(GameAI.GetAttackTarget(self), true)
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20050_Define.SkillType.SkillH3 and self.skillCombo == 4 and trigger > 0 and self:IsPulling() == true then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
			local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())

			targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, false)
		end
	end
end

function Hero20050:OnHitTrigger(trigger)
	AnimalBase.OnHitTrigger(self, trigger)

	if self.moveHitType == AnimalBase_Define.HitType.Execute or self.moveHitType == AnimalBase_Define.HitType.Backstab then
		if trigger == 1 then
			if self.heroPose == Hero20050_Define.PoseAll then
				self:ChangePose(Hero20050_Define.ExecutePoseSpearToShield)
			elseif self.heroPose == Hero20050_Define.PoseShieldAndHand then
				self:ChangePose(Hero20050_Define.ExecutePoseShieldToHand)
			elseif self.heroPose == Hero20050_Define.PoseSpearAndHand then
				self:ChangePose(Hero20050_Define.ExecutePoseSpearToHand)
			elseif self.heroPose == Hero20050_Define.PoseHand then
				self:ChangePose(Hero20050_Define.ExecutePoseHandToDead)
			elseif self.heroPose == Hero20050_Define.PoseShield then
				self:ChangePose(Hero20050_Define.ExecutePoseShieldToHand)
			elseif self.heroPose == Hero20050_Define.PoseSpear then
				self:ChangePose(Hero20050_Define.ExecutePoseSpearToHand)
			elseif self.heroPose == Hero20050_Define.PoseSpearAndShield then
				self:ChangePose(Hero20050_Define.ExecutePoseSpearToShield)
			end
		elseif trigger == 2 then
			local hpMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hpNow = self.animalValue:GetProperty(MS_HeroData.Property.Hp)
			local hp1 = hpMax * Hero20050_Define.HpLockPercent1
			local hp2 = hpMax * Hero20050_Define.HpLockPercent2
			local hp3 = hpMax * Hero20050_Define.HpLockPercent3

			if self.heroPose == Hero20050_Define.PoseAll then
				self.heroPose = Hero20050_Define.PoseShieldAndHand

				self:ChangeEquipment(Hero20050_Define.PoseShieldAndHand)
				self:AddGrade(false)

				self.animalGrade = Hero20050_Define.GradeShield

				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp2 - 1)

				if hp1 < hpNow then
					local diffHp = hpNow - hp1

					self.animalValue:SubProperty(MS_HeroData.Property.Hp, diffHp)
				end
			elseif self.heroPose == Hero20050_Define.PoseShieldAndHand then
				self.heroPose = Hero20050_Define.PoseHand

				self:ChangeEquipment(Hero20050_Define.PoseHand)
				self:AddGrade(false)

				self.animalGrade = Hero20050_Define.GradeHand

				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)

				if self.heroVariety == Hero20050_Define.PoseAll and hp2 < hpNow then
					local diffHp = hpNow - hp2

					self.animalValue:SubProperty(MS_HeroData.Property.Hp, diffHp)
				elseif self.heroVariety == Hero20050_Define.PoseShieldAndHand and hp3 < hpNow then
					local diffHp = hpNow - hp3

					self.animalValue:SubProperty(MS_HeroData.Property.Hp, diffHp)
				end
			elseif self.heroPose == Hero20050_Define.PoseSpearAndHand then
				self.heroPose = Hero20050_Define.PoseHand

				self:ChangeEquipment(Hero20050_Define.PoseHand)
				self:AddGrade(false)

				self.animalGrade = Hero20050_Define.GradeHand

				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)

				if hp3 < hpNow then
					local diffHp = hpNow - hp3

					self.animalValue:SubProperty(MS_HeroData.Property.Hp, diffHp)
				end
			elseif self.heroPose == Hero20050_Define.PoseHand then
				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
			elseif self.heroPose == Hero20050_Define.PoseShield then
				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
			elseif self.heroPose == Hero20050_Define.PoseSpear then
				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
			elseif self.heroPose == Hero20050_Define.PoseSpearAndShield then
				self.heroPose = Hero20050_Define.PoseShield

				self:ChangeEquipment(Hero20050_Define.PoseShield)
				self:AddGrade(false)

				self.animalGrade = Hero20050_Define.GradeShield

				self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)

				if hp3 < hpNow then
					local diffHp = hpNow - hp3

					self.animalValue:SubProperty(MS_HeroData.Property.Hp, diffHp)
				end
			end
		end
	end
end

function Hero20050:OnHitExit()
	if self.moveHitType == AnimalBase_Define.HitType.StatusWeak then
		local hpMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
		local hpNow = self.animalValue:GetProperty(MS_HeroData.Property.Hp)

		if self.heroPose == Hero20050_Define.PoseAll then
			if hpNow <= hpMax * Hero20050_Define.HpLockPercent1 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			end
		elseif self.heroPose == Hero20050_Define.PoseShieldAndHand then
			if self.heroVariety == Hero20050_Define.PoseAll and hpNow <= hpMax * Hero20050_Define.HpLockPercent2 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			elseif self.heroVariety == Hero20050_Define.PoseShieldAndHand and hpNow <= hpMax * Hero20050_Define.HpLockPercent3 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			end
		elseif self.heroPose == Hero20050_Define.PoseSpearAndHand then
			if self.heroVariety == Hero20050_Define.PoseSpearAndHand and hpNow <= hpMax * Hero20050_Define.HpLockPercent3 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			end
		elseif self.heroPose == Hero20050_Define.PoseHand then
			if hpNow <= 1 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			end
		elseif self.heroPose == Hero20050_Define.PoseShield then
			if hpNow <= 1 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			end
		elseif self.heroPose == Hero20050_Define.PoseSpear then
			if hpNow <= 1 then
				local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

				self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
			end
		elseif self.heroPose == Hero20050_Define.PoseSpearAndShield and hpNow <= hpMax * Hero20050_Define.HpLockPercent3 then
			local addHp = Mathf.Ceil(hpMax * Hero20050_Define.HpAddPercent)

			self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
		end
	end

	AnimalBase.OnHitExit(self)
end

function Hero20050:GetHeroPose()
	return self.heroPose
end

function Hero20050:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20050:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20050_Define.SkillType.SkillHP2 and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20050:GetCaptureDistanceAndHeight()
	return Hero20050_Define.SkillCaptureOffset, Hero20050_Define.SkillCaptureDistance, Hero20050_Define.SkillCaptureHeight
end

function Hero20050:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20050:Exit()
	self.bulletTraceVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20050
