-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10003.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10003_Define")

Hero10003 = class("Hero10003", AnimalBase)

function Hero10003:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Hero)

	self.effMaterial = nil
	self.effMaterialParamNow = 1
	self.effMaterialParamTarget = 1
	self.skillTowardPosition = nil
	self.skillTowardAnimalId = 0
	self.skillOStatus = 1
	self.skillParryActive = false

	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL11, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL12, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL21, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL22, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL31, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL32, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL11T, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL12T, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL21T, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL22T, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL31T, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL32T, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillO1, 2)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillO2, 2)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP1, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillS1, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP2, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillS2, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillS3, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillS4, 1)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillLC1, 0)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillLC2, 0)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHC1, 0)
	self:SetSkillCondition(Hero10003_Define.SkillType.SkillHC2, 0)
end

function Hero10003:Start()
	AnimalBase.Start(self)

	if MS_StoryList.IsStoryCarriage(self.storyId) == false then
		self:ClearSelfEffectLoop("self_2")
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_10003_skill16_1")
	end

	if self.characterConfig ~= nil then
		self.effMaterial = self.characterConfig:GetOtherMaterial(1)
	end

	self:ShowIconSkillO()
end

function Hero10003:ExitBattle()
	AnimalBase.ExitBattle(self)
end

function Hero10003:Reborn(reset, propertyRateList)
	AnimalBase.Reborn(self, reset, propertyRateList)
	self.animalValue:ResetBottle()
end

function Hero10003:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true then
		if self.skillIndex == Hero10003_Define.SkillType.SkillLC2 or self.skillIndex == Hero10003_Define.SkillType.SkillHC2 then
			if self.skillCombo == 2 then
				local hitPlayer = hitData:GetHitPlayer()

				if hitPlayer ~= nil and hitPlayer:GetAnimalId() == self.skillTowardAnimalId then
					self.skillTowardPosition = GameAI.GetPositionCloseToTarget(self, hitPlayer)
				end
			end
		elseif self.skillIndex == Hero10003_Define.SkillType.SkillLH1 or self.skillIndex == Hero10003_Define.SkillType.SkillLH2 then
			local statusId = Hero10003_Define.StatusSuckHp1
			local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.StatusChange, statusId, 0)

			if statusIdAdd > 0 then
				statusId = statusId + statusIdAdd
			end

			self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	end
end

function Hero10003:OnSkillParryBullet(bullet)
	if self:IsSkillingSkill() == false then
		return
	end

	local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

	if vfxRoot ~= nil then
		VfxManager.PlayBindMulti(vfxRoot, Hero10003_Define.VfxParryBullet)
	end

	AudioCtrl.SetHeroAudio("hero10003/skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
	self:StartAnimatorDelay(0, Hero10003_Define.ParryFrameFreeze, Hero10003_Define.ParryFrameFadeOut, Hero10003_Define.ParryFrameFreezeSpeed)
end

function Hero10003:OnSkillParry(target, targetSkillData)
	if self:IsSkillingSkill() == false then
		return
	end

	if target == nil or target:IsDead() == true or target:IsShow() == false then
		return
	end

	if (self.skillIndex == Hero10003_Define.SkillType.SkillLC1 or self.skillIndex == Hero10003_Define.SkillType.SkillLC2 or self.skillIndex == Hero10003_Define.SkillType.SkillHC1 or self.skillIndex == Hero10003_Define.SkillType.SkillHC2) and self.skillCombo == 1 and self.skillParryActive == false then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillLC1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillLC2, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHC1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHC2, 1)

		if target.hugeBody > 0 then
			if self.skillIndex == Hero10003_Define.SkillType.SkillLC1 or self.skillIndex == Hero10003_Define.SkillType.SkillHC1 then
				self.skillIndex = self.skillIndex + 1
				self.skillIndexOld = self.skillIndex
			end
		elseif self.skillIndex == Hero10003_Define.SkillType.SkillLC2 or self.skillIndex == Hero10003_Define.SkillType.SkillHC2 then
			self.skillIndex = self.skillIndex - 1
			self.skillIndexOld = self.skillIndex
		end

		self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)

		self.skillTowardAnimalId = target:GetAnimalId()

		local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

		if vfxRoot ~= nil then
			VfxManager.PlayBindMulti(vfxRoot, Hero10003_Define.VfxParryBullet)
		end

		AudioCtrl.SetHeroAudio("hero10003/skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
		self:StartAnimatorDelay(0, Hero10003_Define.ParryFrameFreeze, Hero10003_Define.ParryFrameFadeOut, Hero10003_Define.ParryFrameFreezeSpeed)

		self.skillParryActive = true
	end
end

function Hero10003:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero10003:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and (self.skillIndex == Hero10003_Define.SkillType.SkillLC2 or self.skillIndex == Hero10003_Define.SkillType.SkillHC2) and self.skillCombo == 2 and self.skillTowardPosition ~= nil and self.animatorTime > Hero10003_Define.SkillLCTimeStart and self.animatorTime <= Hero10003_Define.SkillLCTimeEnd then
		XAnimator.SetMatchTarget(self:GetAnimalId(), self.animatorLayer, self.skillTowardPosition.x, self.skillTowardPosition.y, self.skillTowardPosition.z, self.animatorTime, Hero10003_Define.SkillLCTimeEnd)
	end

	local haveShield = self:IsHaveShield()

	if haveShield == true and self.skillOStatus == 2 then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP2, self.skillOStatus)
	else
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP2, 1)
	end

	if self.effMaterialParamNow < self.effMaterialParamTarget then
		self.effMaterialParamNow = self.effMaterialParamNow + Hero10003_Define.EffectMaterialParamSpeed * ControllerMain.GetLogicDeltaTime()
		self.effMaterialParamNow = Mathf.Min(self.effMaterialParamTarget, self.effMaterialParamNow)

		if self.effMaterial ~= nil then
			self.effMaterial:SetFloat("_param", self.effMaterialParamNow)
		end
	end
end

function Hero10003:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero10003:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero10003:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero10003_Define.SkillType.SkillHHH11 or self.skillIndex == Hero10003_Define.SkillType.SkillHHH12 then
		if self.skillCombo > 1 then
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL11, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL12, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL21, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL22, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL31, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL32, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL11T, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL12T, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL21T, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL22T, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL31T, self.skillCombo - 1)
			self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL32T, self.skillCombo - 1)
		end
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillHHH21 or self.skillIndex == Hero10003_Define.SkillType.SkillHHH22 or self.skillIndex == Hero10003_Define.SkillType.SkillDH then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL11, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL12, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL21, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL22, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL31, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL32, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL11T, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL12T, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL21T, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL22T, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL31T, self.skillCombo)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHL32T, self.skillCombo)
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillO1 then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO1, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO2, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS2, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS3, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS4, 1)

		self.skillOStatus = 1

		self:ShowIconSkillO()
		self:ClearSelfEffectLoop("self_2")
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_10003_skill16_1")
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillO2 then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO2, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP1, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS1, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS2, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS3, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS4, 2)

		self.skillOStatus = 2

		self:ShowIconSkillO()
		self:ClearSelfEffectLoop("self_1")
		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(1), "vfx_10003_skill17_1")
	elseif (self.skillIndex == Hero10003_Define.SkillType.SkillLC1 or self.skillIndex == Hero10003_Define.SkillType.SkillLC2 or self.skillIndex == Hero10003_Define.SkillType.SkillHC1 or self.skillIndex == Hero10003_Define.SkillType.SkillHC2) and self.skillCombo == 1 then
		self.skillTowardAnimalId = 0
		self.skillTowardPosition = nil
		self.skillParryActive = false

		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillLC1, 0)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillLC2, 0)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHC1, 0)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillHC2, 0)
	end

	if skillData.SubHpByStatus > 0 and self:IsHaveStatusById(Hero10003_Define.StatusSuckHp1) == false and self:IsHaveStatusById(Hero10003_Define.StatusSuckHp2) == false and self:IsHaveStatusById(Hero10003_Define.StatusSuckHp3) == false then
		local hpMax = self:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
		local subHp = Mathf.Ceil(hpMax * skillData.SubHpByStatus / 1000)

		self:GetValue():SubProperty(MS_HeroData.Property.Hp, subHp, -1, -1, 1)
	end
end

function Hero10003:OnSkillStartNoAction(skillIndex, skillCombo)
	AnimalBase.OnSkillStartNoAction(self, skillIndex, skillCombo)

	if skillIndex == Hero10003_Define.SkillType.SkillO1 then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO1, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO2, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS2, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS3, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS4, 1)

		self.skillOStatus = 1

		self:ShowIconSkillO()
		self:ClearSelfEffectLoop("self_2")
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_10003_skill16_1")
	elseif skillIndex == Hero10003_Define.SkillType.SkillO2 then
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO1, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillO2, 1)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillSP1, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS1, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS2, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS3, 2)
		self:SetSkillCondition(Hero10003_Define.SkillType.SkillS4, 2)

		self.skillOStatus = 2

		self:ShowIconSkillO()
		self:ClearSelfEffectLoop("self_1")
		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(1), "vfx_10003_skill17_1")
	end
end

function Hero10003:OnSkillEnd(skillIndexNext, skillComboNext)
	if (self.skillIndex == Hero10003_Define.SkillType.SkillLC1 or self.skillIndex == Hero10003_Define.SkillType.SkillLC2 or self.skillIndex == Hero10003_Define.SkillType.SkillHC1 or self.skillIndex == Hero10003_Define.SkillType.SkillHC2) and skillIndexNext ~= Hero10003_Define.SkillType.SkillLC1 and skillIndexNext ~= Hero10003_Define.SkillType.SkillLC2 and skillIndexNext ~= Hero10003_Define.SkillType.SkillHC1 and skillIndexNext ~= Hero10003_Define.SkillType.SkillHC2 then
		self.skillTowardAnimalId = 0
		self.skillParryActive = false
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero10003:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if (self.skillIndex == Hero10003_Define.SkillType.SkillLH1 or self.skillIndex == Hero10003_Define.SkillType.SkillLH2) and (self.skillCombo ~= 1 or true) then
		-- block empty
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillSP1 then
		if self.skillCombo == 2 and trigger == 1 then
			local statusId = Hero10003_Define.StatusEnergyDontUse1
			local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.StatusChange, statusId, 0)

			if statusIdAdd > 0 then
				statusId = statusId + statusIdAdd
			end

			self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillS1 and self.skillCombo == 2 or self.skillIndex == Hero10003_Define.SkillType.SkillS3 and self.skillCombo == 1 then
		if trigger == 1 then
			local statusId = Hero10003_Define.StatusEnergyRecoveryAdd1
			local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.StatusChange, statusId, 0)

			if statusIdAdd > 0 then
				statusId = statusId + statusIdAdd
			end

			self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillSP2 then
		if self.skillCombo == 2 and trigger == 1 then
			self:GetValue():CalculateDamageAdd()
			self:ClearStatusById(Hero10003_Define.StatusShield1)
			self:ClearStatusById(Hero10003_Define.StatusShield2)
			self:ClearStatusById(Hero10003_Define.StatusShield3)
			self:GetValue():SetPropertyToZero(MS_HeroData.Property.TrophyShield)
			self:GetValue():SetPropertyToZero(MS_HeroData.Property.SkillShield)
		end
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillS2 and self.skillCombo == 2 or self.skillIndex == Hero10003_Define.SkillType.SkillS4 and self.skillCombo == 1 then
		if trigger == 1 then
			local statusId = Hero10003_Define.StatusShield1
			local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.StatusChange, statusId, 0)

			if statusIdAdd > 0 then
				statusId = statusId + statusIdAdd
			end

			self:ClearStatusById(Hero10003_Define.StatusShield1)
			self:ClearStatusById(Hero10003_Define.StatusShield2)
			self:ClearStatusById(Hero10003_Define.StatusShield3)
			self:GetValue():SetPropertyToZero(MS_HeroData.Property.SkillShield)
			self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)

			self.effMaterialParamTarget = 1
			self.effMaterialParamNow = 0

			if self.effMaterial ~= nil then
				self.effMaterial:SetFloat("_param", self.effMaterialParamNow)
			end
		end
	elseif self.skillIndex == Hero10003_Define.SkillType.SkillLP1 and self.skillCombo == 2 and trigger == 1 and self:IsHeroSanNotNormal(10003) == true then
		local tmpTalentChange = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SanItemStatusChange, 0, 0)

		if tmpTalentChange >= 0 and tmpTalentChange <= 2 then
			self:AddStatus(self:GetVirtualPlayer(), Hero10003_Define.SanItemValueSubStatusId1 + tmpTalentChange, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	end
end

function Hero10003:IsHaveShield()
	if self:IsHaveStatusById(Hero10003_Define.StatusShield1) or self:IsHaveStatusById(Hero10003_Define.StatusShield2) or self:IsHaveStatusById(Hero10003_Define.StatusShield3) or self.animalValue:GetProperty(MS_HeroData.Property.TrophyShield) > 0 or self.animalValue:GetProperty(MS_HeroData.Property.SkillShield) > 0 then
		return true
	end

	return false
end

function Hero10003:ShowIconSkillO()
	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "ChangeSpecialSkill", self.heroId, self.skillOStatus)
		UIManager.SendMessage("Mainmenu", "SetRageType", self.heroId, self.skillOStatus)
		self.animalValue:SwitchBottle(self.skillOStatus)
	end
end

function Hero10003:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifySanHeroDead()
		end
	end
end

function Hero10003:IsPermitExecuteButton(button, targetAnimal)
	if button == ControllerMain.SkillButton.Light then
		if self.isHost == true and targetAnimal ~= nil and targetAnimal.moveHitStatusWeakToward == true then
			if self:IsSkillingById(Hero10003_Define.SkillType.SkillLC1, 2) == true or self:IsSkillingById(Hero10003_Define.SkillType.SkillLC2, 2) == true then
				self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)

				return true
			else
				return false
			end
		elseif self.isHost == false then
			return true
		end
	elseif button == ControllerMain.SkillButton.Heavy then
		if self.isHost == true and targetAnimal ~= nil and targetAnimal.moveHitStatusWeakToward == true then
			if self:IsSkillingById(Hero10003_Define.SkillType.SkillHC1, 2) == true or self:IsSkillingById(Hero10003_Define.SkillType.SkillHC2, 2) == true then
				self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)

				return true
			else
				return false
			end
		elseif self.isHost == false then
			return true
		end
	end

	return false
end

function Hero10003:GetHitUpUpTimeConfig()
	return Hero10003_Define.HitUpUpTimeHitTime1, Hero10003_Define.HitUpUpTimeHitTime2, Hero10003_Define.HitUpUpTimeResetTime1, Hero10003_Define.HitUpUpTimeResetTime2
end

function Hero10003:SetWeaponAllVisible(type, flg)
	AnimalBase.SetWeaponAllVisible(self, type, flg)

	if type == AnimalBase_Define.VisibleType.Act or type == AnimalBase_Define.VisibleType.Dialog then
		if flg == false then
			self:ClearSelfEffectLoop("self_1")
			self:ClearSelfEffectLoop("self_2")
		elseif self:IsSkillCondition(Hero10003_Define.SkillType.SkillO1, 1) then
			self:ClearSelfEffectLoop("self_1")
			self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(1), "vfx_10003_skill17_1")
		elseif self:IsSkillCondition(Hero10003_Define.SkillType.SkillO2, 2) then
			self:ClearSelfEffectLoop("self_2")
			self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_10003_skill16_1")
		end
	end
end

function Hero10003:SetUI()
	AnimalBase.SetUI(self)
	self:ShowIconSkillO()
end

function Hero10003:Exit()
	self.skillTowardPosition = nil
	self.effMaterial = nil

	AnimalBase.Exit(self)
end

return Hero10003
