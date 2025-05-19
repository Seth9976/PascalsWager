-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10004.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10004_Define")

Hero10004 = class("Hero10004", AnimalBase)

function Hero10004:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Hero)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL1, 1)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL2, 1)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL31, 1)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL32, 1)

	self.SkillBeatBackActive = false
end

function Hero10004:Start()
	AnimalBase.Start(self)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero10004_Define.EquipmentCoffin, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentCoffinHand, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentLeftHand, false)

	if self.heroVariety > 1 then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.heroVariety == 99 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero10004_Define.EquipmentCoffin, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentCoffinHand, false)
	end
end

function Hero10004:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)

	if isFirst == true then
		local skillIndex, skillCombo, blockParam = self:GetBlockSkill()

		if skillIndex == Hero10004_Define.SkillType.SkillRSP then
			self:GetValue():SubProperty(MS_HeroData.Property.Rage, Hero10004_Define.DefenceUseRage)
		end

		if blockParam > 1 then
			local addPower = Hero10004_Define.BlockAddPower
			local tmpTalentPowerAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.BlockAddPower, 0, 0)

			if tmpTalentPowerAdd > 0 then
				addPower = addPower + tmpTalentPowerAdd
			end

			self:GetValue():AddProperty(MS_HeroData.Property.Power, addPower)

			local energyMax = self:GetValue():GetPropertyMax(MS_HeroData.Property.Energy)
			local addEnergy = energyMax * Hero10004_Define.BlockAddEnergy / 1000

			self:GetValue():AddProperty(MS_HeroData.Property.Energy, addEnergy)

			if skillIndex == Hero10004_Define.SkillType.SkillSP then
				local vfxRoot = self:GetWeaponBox(2)

				if vfxRoot ~= nil then
					VfxManager.PlayBindMulti(vfxRoot, Hero10004_Define.VfxName_Block_SkillSP)
				end
			end
		end
	end
end

function Hero10004:OnBeatBack(isFirst, attackerData)
	AnimalBase.OnBeatBack(self, isFirst, attackerData)

	if isFirst == true and self:IsSkillingSkill() == true and (self.skillIndex == Hero10004_Define.SkillType.SkillHP11 or self.skillIndex == Hero10004_Define.SkillType.SkillHP21 or self.skillIndex == Hero10004_Define.SkillType.SkillHP31 or self.skillIndex == Hero10004_Define.SkillType.SkillHP41 or self.skillIndex == Hero10004_Define.SkillType.SkillDHP1 or self.skillIndex == Hero10004_Define.SkillType.SkillLHP1) and self.skillCombo == 1 and self.SkillBeatBackActive == false then
		AudioCtrl.SetHeroAudio("hero10004/skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
		self:StartAnimatorDelay(0, Hero10004_Define.BeatBackFrameFreeze, Hero10004_Define.BeatBackFrameFadeOut, Hero10004_Define.BeatBackFrameFreezeSpeed)

		local nextSkillCombo1 = self.skillCombo + 3
		local nextSkillCombo2 = self.skillCombo + 4
		local skillData1 = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, nextSkillCombo1)
		local skillData2 = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, nextSkillCombo2)

		self:PlayEffect(self:GetTransform(), Hero10004_Define.VfxName_BeatBack, 1)
		self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, nextSkillCombo1, skillData1.BtnPressType, skillData1.BtnIndex)
		self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, nextSkillCombo2, skillData2.BtnPressType, skillData2.BtnIndex)
		self:AddStatus(self:GetVirtualPlayer(), Hero10004_Define.CounterAttackSuccessStatusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)

		self.SkillBeatBackActive = true
	end
end

function Hero10004:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero10004:CheckBlock()
	AnimalBase.CheckBlock(self)

	if self:IsSkillingSkill() == true then
		local skillAI = self:GetSkillTypeForAI()

		if skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit and self.skillIndex == Hero10004_Define.SkillType.SkillRSP then
			local nowRage = self:GetValue():GetProperty(MS_HeroData.Property.Rage)

			if nowRage <= 0 then
				self:SetBlock(true, Hero10004_Define.SkillType.SkillSP, 2, 1)
			end
		end
	end
end

function Hero10004:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero10004:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero10004:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero10004_Define.SkillType.SkillHP11 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(1)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillHP21 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(2)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillHP31 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(3)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillHP41 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(4)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillDHP1 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(5)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillLHP1 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(6)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillLP11 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(1)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillLP21 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(2)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillLP31 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(3)
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillDLP1 and self.skillCombo == 1 then
		self:SetSkillFollowCondition(4)
	end

	if (self.skillIndex == Hero10004_Define.SkillType.SkillHP11 or self.skillIndex == Hero10004_Define.SkillType.SkillHP21 or self.skillIndex == Hero10004_Define.SkillType.SkillHP31 or self.skillIndex == Hero10004_Define.SkillType.SkillHP41 or self.skillIndex == Hero10004_Define.SkillType.SkillDHP1 or self.skillIndex == Hero10004_Define.SkillType.SkillLHP1) and self.skillCombo == 1 then
		self.SkillBeatBackActive = false
	end
end

function Hero10004:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero10004_Define.SkillType.SkillRL1 then
		if trigger > 0 then
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL1, 2)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL2, 2)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL31, 2)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL32, 2)
		end
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillRL2 then
		if trigger > 0 then
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL1, 3)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL2, 3)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL31, 3)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL32, 3)
		end
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillRL31 or self.skillIndex == Hero10004_Define.SkillType.SkillRL32 then
		if trigger > 0 then
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL1, 1)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL2, 1)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL31, 1)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL32, 1)
		end
	elseif self.skillIndex == Hero10004_Define.SkillType.SkillHLP then
		if trigger == 1 then
			self:AddGrade(false)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL1, 1)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL2, 1)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL31, 1)
			self:SetSkillCondition(Hero10004_Define.SkillType.SkillRL32, 1)
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Execute and trigger > 0 and self.skillExecuteTarget ~= nil then
		local tmpTalentRange = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.ExecuteRangeDamage, 0, 0)

		if tmpTalentRange > 0 then
			skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10004_Define.ExecuteExplodeSkillAdd, self.skillCombo)

			if skillData ~= nil then
				local fromVPlayer = self:GetVirtualPlayer()
				local colliderIndex = self.controllerCollider:CreateCollider(ControllerCollider.ColliderType.Sphere, fromVPlayer, fromVPlayer, skillData, nil, self:GetPosByWorldPos(), Hero10004_Define.ExecuteExplodeTime, Hero10004_Define.ExecuteExplodeRadius, Hero10004_Define.ExecuteExplodeRadius, Hero10004_Define.ExecuteExplodeRadius)

				if colliderIndex > 0 then
					local colliderData = self.controllerCollider:GetCollider(colliderIndex)

					if colliderData ~= nil then
						colliderData:SetIgnoreAnimalId(self.skillExecuteTarget:GetAnimalId())
					end
				end
			end
		end
	end
end

function Hero10004:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero10004_Define.SkillType.SkillHP11 and skillIndexNext ~= Hero10004_Define.SkillType.SkillHP11 or self.skillIndex == Hero10004_Define.SkillType.SkillHP21 and skillIndexNext ~= Hero10004_Define.SkillType.SkillHP21 or self.skillIndex == Hero10004_Define.SkillType.SkillHP31 and skillIndexNext ~= Hero10004_Define.SkillType.SkillHP31 or self.skillIndex == Hero10004_Define.SkillType.SkillHP41 and skillIndexNext ~= Hero10004_Define.SkillType.SkillHP41 or self.skillIndex == Hero10004_Define.SkillType.SkillLP11 and skillIndexNext ~= Hero10004_Define.SkillType.SkillLP11 or self.skillIndex == Hero10004_Define.SkillType.SkillLP21 and skillIndexNext ~= Hero10004_Define.SkillType.SkillLP21 or self.skillIndex == Hero10004_Define.SkillType.SkillLP31 and skillIndexNext ~= Hero10004_Define.SkillType.SkillLP31 or self.skillIndex == Hero10004_Define.SkillType.SkillDLP1 and skillIndexNext ~= Hero10004_Define.SkillType.SkillDLP1 or self.skillIndex == Hero10004_Define.SkillType.SkillDHP1 and skillIndexNext ~= Hero10004_Define.SkillType.SkillDHP1 or self.skillIndex == Hero10004_Define.SkillType.SkillLHP1 and skillIndexNext ~= Hero10004_Define.SkillType.SkillLHP1 then
		self:SetSkillFollowCondition(0)
	end

	if self.skillIndex == Hero10004_Define.SkillType.SkillHP11 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) or self.skillIndex == Hero10004_Define.SkillType.SkillHP21 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) or self.skillIndex == Hero10004_Define.SkillType.SkillHP31 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) or self.skillIndex == Hero10004_Define.SkillType.SkillHP41 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) or self.skillIndex == Hero10004_Define.SkillType.SkillLP11 and (self.skillCombo == 1 or self.skillCombo == 2) or self.skillIndex == Hero10004_Define.SkillType.SkillLP21 and (self.skillCombo == 1 or self.skillCombo == 2) or self.skillIndex == Hero10004_Define.SkillType.SkillLP31 and (self.skillCombo == 1 or self.skillCombo == 2) or self.skillIndex == Hero10004_Define.SkillType.SkillDLP1 and (self.skillCombo == 1 or self.skillCombo == 2) or self.skillIndex == Hero10004_Define.SkillType.SkillDHP1 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) or self.skillIndex == Hero10004_Define.SkillType.SkillLHP1 and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) or self.skillIndex == Hero10004_Define.SkillType.SkillRSP and self.skillCombo == 2 then
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	end

	if (self.skillIndex == Hero10004_Define.SkillType.SkillHP11 or self.skillIndex == Hero10004_Define.SkillType.SkillHP21 or self.skillIndex == Hero10004_Define.SkillType.SkillHP31 or self.skillIndex == Hero10004_Define.SkillType.SkillHP41 or self.skillIndex == Hero10004_Define.SkillType.SkillDHP1 or self.skillIndex == Hero10004_Define.SkillType.SkillLHP1) and self.skillCombo == 1 then
		self.SkillBeatBackActive = false
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero10004:SetSkillFollowCondition(condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillHP12, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillHP22, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillHP32, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillHP42, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillLP12, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillLP22, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillLP32, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillDLP2, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillDHP2, condition)
	self:SetSkillCondition(Hero10004_Define.SkillType.SkillLHP2, condition)
end

function Hero10004:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentCoffinHand, false)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentLeftHand, true)
	self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(3), "vfx_10004_self_1")
end

function Hero10004:ResetGrade()
	AnimalBase.ResetGrade(self)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentCoffinHand, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero10004_Define.EquipmentLeftHand, false)
	self:ClearSelfEffectLoop("self_1")
end

function Hero10004:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifySanHeroDead()
		end
	end
end

function Hero10004:GetHitUpUpTimeConfig()
	return Hero10004_Define.HitUpUpTimeHitTime1, Hero10004_Define.HitUpUpTimeHitTime2, Hero10004_Define.HitUpUpTimeResetTime1, Hero10004_Define.HitUpUpTimeResetTime2
end

function Hero10004.IsSanSkillWeakness(skillIndex, skillCombo)
	local ret = false

	if skillIndex == Hero10004_Define.SkillType.SkillHP11 or skillIndex == Hero10004_Define.SkillType.SkillHP21 or skillIndex == Hero10004_Define.SkillType.SkillHP31 or skillIndex == Hero10004_Define.SkillType.SkillHP41 or skillIndex == Hero10004_Define.SkillType.SkillDHP1 or skillIndex == Hero10004_Define.SkillType.SkillLHP1 then
		if skillCombo == 3 or skillCombo == 5 then
			return true
		end
	elseif (skillIndex == Hero10004_Define.SkillType.SkillLP11 or skillIndex == Hero10004_Define.SkillType.SkillLP21 or skillIndex == Hero10004_Define.SkillType.SkillLP31 or skillIndex == Hero10004_Define.SkillType.SkillDLP1) and skillCombo == 3 then
		return true
	end

	return false
end

function Hero10004:SetUI()
	AnimalBase.SetUI(self)
end

function Hero10004:Exit()
	AnimalBase.Exit(self)
end

return Hero10004
