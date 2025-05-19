-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20054.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20054_Define")

Hero20054 = class("Hero20054", AnimalBase)

function Hero20054:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero20054_Define.BulletSpeed
	self.bulletSkillDP2Speed1Vec3 = Vector3.zero
	self.bulletSkillDP2Speed1Vec3.z = Hero20054_Define.BulletSkillDP2Speed1
	self.bulletSkillDP2Speed2Vec3 = Vector3.zero
	self.bulletSkillDP2Speed2Vec3.z = Hero20054_Define.BulletSkillDP2Speed2
	self.bulletSkillDP2Acc2Vec3 = Vector3.zero
	self.bulletSkillDP2Acc2Vec3.z = Hero20054_Define.BulletSkillDP2Acc2
	self.bulletSkillDP2Index = 0
	self.bulletSkillDP2Status = BulletFalcula.FalculaStatus.Start
	self.skillParryActive = false
end

function Hero20054:Start()
	AnimalBase.Start(self)
	self:ShowGradeEffect()

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20054:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20054:GetGradeThreshold()
	return 0
end

function Hero20054:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20054:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20054:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20054_Define.EquipmentHandSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20054_Define.EquipmentShieldSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20054_Define.EquipmentSickle, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20054_Define.EquipmentHandSpear, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20054_Define.EquipmentShieldSpear, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20054_Define.EquipmentSickle, false)
	end
end

function Hero20054:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20054_Define.SkillType.SkillDP2 then
		local bullet = self.controllerBullet:GetBullet(self.bulletSkillDP2Index)

		if bullet ~= nil then
			local status = bullet:GetFalculaStatus()

			if self.bulletSkillDP2Status ~= status then
				if status == BulletFalcula.FalculaStatus.Disappear then
					self.controllerBullet:ClearBullet(self.bulletSkillDP2Index)

					self.bulletSkillDP2Index = 0
				elseif status == BulletFalcula.FalculaStatus.Back then
					self:SetSkillTarget(nil)
				end

				self.bulletSkillDP2Status = status
			end

			if status == BulletFalcula.FalculaStatus.Start then
				local bulletPos = bullet:GetPosition()
				local nowPos = self:GetPosByWorldPos()
				local radius = self:GetRadius()
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal == nil then
					local hitList = bullet:GetHitAnimalList()

					if hitList ~= nil then
						for k, animal in pairs(hitList) do
							if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true and (animal:IsHitBySkill(self, self.skillIndex, 0) or animal:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.DefenceHit) then
								self:SetSkillTarget(animal)
								bullet:PullArriveFalcula()

								self.skillTowardPosition = GameAI.GetPositionCloseToTarget(self, animal)

								self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)

								break
							end
						end
					end
				end
			elseif status == BulletFalcula.FalculaStatus.Arrived and bullet:IsPullfalculas() == true and self.skillTowardPosition ~= nil and self.animatorTime > Hero20054_Define.SkillDP2TimeStart and self.animatorTime <= Hero20054_Define.SkillDP2TimeEnd then
				XAnimator.SetMatchTarget(self:GetAnimalId(), self.animatorLayer, self.skillTowardPosition.x, self.skillTowardPosition.y, self.skillTowardPosition.z, self.animatorTime, Hero20054_Define.SkillDP2TimeEnd)
			end
		end

		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:KeepHitPeriod()
		end
	end
end

function Hero20054:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20054_Define.SkillType.SkillOO1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillHPO2 and self.skillCombo == 2 or self.skillIndex == Hero20054_Define.SkillType.SkillDDDO2 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 3) or self.skillIndex == Hero20054_Define.SkillType.SkillO2 and self.skillCombo == 1 then
		if trigger > 0 then
			local startPos = self:GetWeaponBox(1).position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20054_Define.BulletRangeMax, Hero20054_Define.BulletRangeMax, Hero20054_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillOO1 and self.skillCombo == 2 then
		if trigger == 1 then
			self.animalGrade = self.animalGrade + 1

			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillOP1 and self.skillCombo == 1 then
		if trigger == 2 then
			self.animalGrade = self.animalGrade + 1

			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillHPO2 and self.skillCombo == 3 or self.skillIndex == Hero20054_Define.SkillType.SkillDDDO2 and self.skillCombo == 4 or self.skillIndex == Hero20054_Define.SkillType.SkillOP2 and self.skillCombo == 1 then
		if trigger == 1 then
			self.animalGrade = 1

			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillDP2 and self.skillCombo == 1 then
		if trigger == 1 then
			local startPos = self:GetWeaponBox(1).position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20054_Define.BulletSkillDP2RangeMax, Hero20054_Define.BulletSkillDP2RangeMin, Hero20054_Define.BulletSkillDP2RangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Falcula, self, skillData, nil, startPos, targetPos, self.bulletSkillDP2Speed1Vec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:AddFalculaEffect(skillData[AnimalBase_Define.VfxSkillKey2], self:GetWeaponBox(1))
					bullet:Ready()
					bullet:Start()

					self.bulletSkillDP2Index = bulletIndex
				end
			end
		elseif trigger == 2 then
			local bullet = self.controllerBullet:GetBullet(self.bulletSkillDP2Index)

			if bullet ~= nil then
				bullet:PullBackFalcula(true, false)
				bullet:SetSpeed(self.bulletSkillDP2Speed2Vec3, self.bulletSkillDP2Acc2Vec3)
			end
		end
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillDP2 and self.skillCombo == 2 and trigger == 1 then
		local bullet = self.controllerBullet:GetBullet(self.bulletSkillDP2Index)

		if bullet ~= nil then
			local status = bullet:GetFalculaStatus()

			if status == BulletFalcula.FalculaStatus.Arrived then
				bullet:SetFalculaStatus(BulletFalcula.FalculaStatus.Disappear)
				bullet:SetDead(true)
			end
		end
	end
end

function Hero20054:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	if self.skillIndex ~= Hero20054_Define.SkillType.SkillDP2 then
		self:PlaySkillEffect(false)
	end

	self:PlaySkillAudio()
end

function Hero20054:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20054_Define.SkillType.SkillDP2 and self.skillCombo == 1 then
		if self.bulletSkillDP2Index > 0 then
			self.controllerBullet:ClearBullet(self.bulletSkillDP2Index)
		end

		self.bulletSkillDP2Index = 0
		self.skillTowardPosition = nil
		self.bulletSkillDP2Status = BulletFalcula.FalculaStatus.Start
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillDP2 and self.skillCombo == 2 then
		local bullet = self.controllerBullet:GetBullet(self.bulletSkillDP2Index)

		if bullet ~= nil then
			bullet:PullBackFalcula(true, true)
			bullet:SetSpeed(self.bulletSkillDP2Speed2Vec3, self.bulletSkillDP2Acc2Vec3)
		end
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillS1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillSPP1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillS2 and self.skillCombo == 2 then
		self.skillParryActive = false
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillSP2 and self.skillCombo == 1 then
		local selfVfx = self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(5), Hero20054_Define.VfxName_SkillSP2)

		if selfVfx ~= nil then
			selfVfx:SetDelayClear(true, nil)
		end
	end
end

function Hero20054:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20054_Define.SkillType.SkillDP2 and skillIndexNext ~= Hero20054_Define.SkillType.SkillDP2 then
		if self.bulletSkillDP2Index > 0 then
			self.controllerBullet:ClearBullet(self.bulletSkillDP2Index)
		end

		self.bulletSkillDP2Index = 0

		self:SetSkillTarget(nil)
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillS1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillSPP1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillS2 and self.skillCombo == 2 then
		self.skillParryActive = false
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillSP2 and skillIndexNext ~= Hero20054_Define.SkillType.SkillSP2 then
		self:ClearSelfEffectLoop("self_1")
	elseif self.skillIndex == Hero20054_Define.SkillType.SkillOO1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillHPO2 and self.skillCombo == 2 or self.skillIndex == Hero20054_Define.SkillType.SkillDDDO2 and self.skillCombo == 3 or self.skillIndex == Hero20054_Define.SkillType.SkillO2 and self.skillCombo == 1 then
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20054:OnSkillParryBullet(bullet)
	if self:IsSkillingSkill() == false then
		return
	end

	local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

	if vfxRoot ~= nil then
		VfxManager.PlayBindMulti(vfxRoot, Hero20054_Define.VfxParryBullet)
	end

	self:StartAnimatorDelay(0, Hero20054_Define.ParryFrameFreeze, Hero20054_Define.ParryFrameFadeOut, Hero20054_Define.ParryFrameFreezeSpeed)

	self.skillParryActive = true
end

function Hero20054:OnSkillParry(target, targetSkillData)
	if self:IsSkillingSkill() == false then
		return
	end

	if target == nil or target:IsDead() == true or target:IsShow() == false then
		return
	end

	if self.skillIndex == Hero20054_Define.SkillType.SkillS1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillSPP1 and self.skillCombo == 1 or self.skillIndex == Hero20054_Define.SkillType.SkillS2 and self.skillCombo == 2 and self.skillParryActive == false then
		local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

		if vfxRoot ~= nil then
			VfxManager.PlayBindMulti(vfxRoot, Hero20054_Define.VfxParryBullet)
		end

		self:StartAnimatorDelay(0, Hero20054_Define.ParryFrameFreeze, Hero20054_Define.ParryFrameFadeOut, Hero20054_Define.ParryFrameFreezeSpeed)

		self.skillParryActive = true
	end
end

function Hero20054:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20054:GetShootDistanceMax()
	return Hero20054_Define.BulletRangeMax
end

function Hero20054:IsSkillParryActive()
	return self.skillParryActive
end

function Hero20054:Exit()
	if self.bulletSkillDP2Index > 0 then
		self.controllerBullet:ClearBullet(self.bulletSkillDP2Index)
	end

	self.bulletSkillDP2Index = 0
	self.bulletSkillDP2Speed1Vec3 = nil
	self.bulletSkillDP2Speed2Vec3 = nil
	self.bulletSkillDP2Acc2Vec3 = nil
	self.bulletSpeedVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20054
