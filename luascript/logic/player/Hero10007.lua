-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10007.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10007_Define")

Hero10007 = class("Hero10007", AnimalBase)

function Hero10007:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Hero)

	self.weaponId = Hero10007_Define.WeaponSingleSword
	self.dodgePostEffect = false
	self.skillComboCnt = 0
	self.autoDodgeDir = 1
	self.autoSkill = 0
	self.isBeatBack = false
	self.HitTimeSkillSL2 = 0
	self.IsHitSkillSL2 = false
	self.tfWeaponRageMaterial = nil
	self.skillComboAttack = 0
	self.recordAchievementParryTimeList = {}
	self.recordAchievementParryCount = 0
	self.recordAchievementMissTimes = 0
	self.SkillBeatBackActive = false
end

function Hero10007:Start()
	AnimalBase.Start(self)
	self:ChangeWeapon(self.weaponId)
	self.animalValue:SetPropertyToZero(MS_HeroData.Property.Power)
	self:ShowSkillIcon()

	if self.tfWeaponRender[1] ~= nil then
		self.tfWeaponRageMaterial = self.tfWeaponRender[1].materials[1]
	end

	self:ShowWeaponEffect()
end

function Hero10007:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)

	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == Hero10007_Define.SkillType.SkillS1 and self.skillCombo == 4 then
		local tmpDefence = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDefence)
		local blockSkillIndex, blockSkillCombo, blockParam = self:GetBlockSkill()

		if blockParam > 1 then
			if self.animalGrade <= 1 then
				self.animalGrade = 2
			end

			VfxManager.PlayBindMulti(self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root), Hero10007_Define.VfxName_BlockHit)

			if self.isHost == true and self.isHostBack == false then
				AudioCtrl.SetHeroAudio("hero10007/skill/Character_hero10007_skill_defence", self:GetPosByWorldPos(), self.animalId)
				self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero10007_Define.DefenceTimeScale, Hero10007_Define.DefenceTimeScaleEnterTime, Hero10007_Define.DefenceTimeScaleKeepTime, Hero10007_Define.DefenceTimeScaleExitTime)
			end

			self:PowerDecrementSub()
		else
			self.animalGrade = 1
		end
	end
end

function Hero10007:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true then
		local hitPlayer = hitData:GetHitPlayer()

		if self.skillIndex == Hero10007_Define.SkillType.SkillSL2 and self.skillCombo == 1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 and self.skillCombo == 5 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 and (self.skillCombo == 5 or self.skillCombo == 6) then
			if hitPlayer ~= nil and self.skillIndex == Hero10007_Define.SkillType.SkillSL2 then
				self.IsHitSkillSL2 = true
				self.HitTimeSkillSL2 = TimeHelper.getNowTime()
			end
		elseif self.skillIndex == AnimalBase_Define.SkillType.Execute or self.skillIndex == AnimalBase_Define.SkillType.Backstab then
			local hitPlayer = hitData:GetHitPlayer()

			if hitPlayer ~= nil then
				hitPlayer:ClearStatusById(Hero10007_Define.WeaknessMaxSubStatusId)

				local status = hitPlayer:GetStatusById(Hero10007_Define.WeaknessRecoverySubStatusId3)

				if status ~= nil and status:IsOverlayMax() == true then
					hitPlayer:ClearStatusById(Hero10007_Define.WeaknessRecoverySubStatusId3)
				end
			end
		end

		self:PowerDecrementSub()
	end

	if self:IsSkillingSkill() == true then
		local hitPlayer = hitData:GetHitPlayer()

		if (self.skillIndex == Hero10007_Define.SkillType.SkillSL2 and self.skillCombo == 1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 and self.skillCombo == 5 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 and (self.skillCombo == 5 or self.skillCombo == 6)) and hitPlayer ~= nil then
			local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillAddStatus, self.skillIndex, self.skillCombo)

			if statusIdAdd > 0 then
				local statusId = Hero10007_Define.WeaknessRecoverySubStatusId1

				statusId = statusId + statusIdAdd - 1

				local status = hitPlayer:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)

				if statusId == Hero10007_Define.WeaknessRecoverySubStatusId3 and status ~= nil and status:IsOverlayMax() == true and hitPlayer:IsNoWeakness() == false then
					hitPlayer:AddStatus(self:GetVirtualPlayer(), Hero10007_Define.WeaknessMaxSubStatusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
				end
			end
		end
	end
end

function Hero10007:OnBeatBack(isFirst, attackerData)
	AnimalBase.OnBeatBack(self, isFirst, attackerData)
	log("============OnBeatBack===========self.skillIndex=" .. self.skillIndex .. ",self.skillCombo=" .. self.skillCombo)

	if isFirst == true and self:IsSkillingSkill() == true then
		local addCombo = 0

		if self.skillIndex == AnimalBase_Define.SkillType.Dodge and self.weaponId == Hero10007_Define.WeaponDoubleSword then
			if self.skillCombo == 1 then
				addCombo = 2
			elseif self.skillCombo == 2 then
				addCombo = 3
			elseif self.skillCombo == 4 then
				addCombo = 1
			end
		elseif self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1Up then
			if self.skillCombo == 1 and self.SkillBeatBackActive == false then
				self.SkillBeatBackActive = true
				self.isBeatBack = true

				self:PlayEffect(self:GetEffectRoot(0), Hero10007_Define.VfxName_BeatBack, 1)
				AudioCtrl.SetHeroAudio("hero10007/skill/Character_hero10007_skill_beatback", self:GetPosByWorldPos(), self.animalId)

				if self.isHost == true and self.isHostBack == false then
					self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero10007_Define.DodgeTimeScale, Hero10007_Define.DodgeTimeScaleEnterTime, Hero10007_Define.DodgeTimeScaleKeepTime, Hero10007_Define.DodgeTimeScaleExitTime)
				end

				self:AddStatus(self:GetVirtualPlayer(), Hero10007_Define.RageAddStatusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)

				local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillAddStatus, self.skillIndex, self.skillCombo)

				if statusIdAdd > 0 then
					local statusId = Hero10007_Define.EnergyAddStatusId

					self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
				end

				if self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 then
					self.recordAchievementMissTimes = self.recordAchievementMissTimes + 1

					if self.recordAchievementMissTimes >= 3 then
						FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.MissEnemyHitThreeTimes)

						self.recordAchievementMissTimes = 0
					end
				end
			end
		elseif (self.skillIndex == Hero10007_Define.SkillType.SkillHL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLH1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2Up) and self.skillCombo == 1 and self.SkillBeatBackActive == false then
			self.SkillBeatBackActive = true

			VfxManager.PlayBindMulti(self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root), Hero10007_Define.VfxName_BlockHit)
			AudioCtrl.SetHeroAudio("hero10007/skill/Character_hero10007_skill_defence", self:GetPosByWorldPos(), self.animalId)

			if attackerData ~= nil then
				local attackVPlayer = attackerData:GetAttackVirtualPlayer()

				if attackVPlayer ~= nil then
					local attackPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

					if attackPlayer ~= nil then
						local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillAddStatus, self.skillIndex, self.skillCombo)

						if statusIdAdd > 0 then
							local statusId = Hero10007_Define.WeaknessRecoverySubStatusId1

							statusId = statusId + statusIdAdd - 1

							local status = attackPlayer:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)

							if statusId == Hero10007_Define.WeaknessRecoverySubStatusId3 and status ~= nil and status:IsOverlayMax() == true and attackPlayer:IsNoWeakness() == false then
								attackPlayer:AddStatus(self:GetVirtualPlayer(), Hero10007_Define.WeaknessMaxSubStatusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
							end
						end
					end
				end
			end
		end

		if addCombo > 0 then
			local nextSkillCombo = self.skillCombo + addCombo
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, nextSkillCombo)

			log("============OnBeatBack=====Success!!!=====self.skillIndex=" .. self.skillIndex .. ",nextSkillCombo=" .. nextSkillCombo)
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, nextSkillCombo, skillData.BtnPressType, skillData.BtnIndex)
		end
	end
end

function Hero10007:OnAutoSkill(isFirst, attackerData)
	if isFirst == true and self.autoSkill == Hero10007_Define.SkillType.SkillAutoDefence1 then
		self:SetBlock(true, Hero10007_Define.SkillType.SkillAutoDefence1, 1, 1)

		if attackerData ~= nil then
			local attackVPlayer = attackerData:GetAttackVirtualPlayer()

			if attackVPlayer ~= nil then
				local attackPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())
				local skillBlockData = MS_SkillData.GetSkillData(self.heroId, Hero10007_Define.SkillType.SkillAutoDefence1, 1)

				if attackPlayer ~= nil and skillBlockData ~= nil then
					attackerData:SetSkillBlocked(true, skillBlockData, 1)

					local hitTouchData = attackPlayer:AddSkillTouchHitPlayer(self:GetVirtualPlayer(), skillBlockData, nil, Vector3.s_forward, nil)

					if hitTouchData ~= nil then
						local guard = skillBlockData.Guard
						local guardBreak = AnimalBase_Value.GetGuardBreak(attackVPlayer, attackerData:GetSkillData(), nil)

						if guardBreak <= guard then
							hitTouchData:SetHitBlock(true)
						end
					end
				end
			end
		end

		self.autoSkill = 0
	end
end

function Hero10007:OnHit(isFirst, attackerData)
	AnimalBase.OnHit(self, isFirst, attackerData)

	if isFirst == true and attackerData ~= nil then
		self.skillComboCnt = 0
	end
end

function Hero10007:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self.isHost == true and self.isHostBack == false then
		self:UpdateDodgeEffect()
	end

	if self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.MoveSpeed, Hero10007_Define.DodgeSpecialMoveSpeed, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.MoveSpeed, 1, 0, 0)
	end

	if self.IsHitSkillSL2 == true then
		self.animalGrade = 3

		local currentTime = TimeHelper.getNowTime()
		local diffTime = currentTime - self.HitTimeSkillSL2

		if diffTime > Hero10007_Define.LimitTimeSkillXL1 then
			self.IsHitSkillSL2 = false
			self.animalGrade = 1
		end
	end

	self:ShowWeaponEffect()
end

function Hero10007:ApplyMoveSpeedAndRotation()
	AnimalBase.ApplyMoveSpeedAndRotation(self)

	if self:IsSkilling() == true and self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial then
		self.moveSpeedHorizontalSpecial = self.moveDirLocalDodge.x
		self.moveSpeedVerticalSpecial = self.moveDirLocalDodge.z
	end
end

function Hero10007:UpdateDodgeEffect()
	if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
		local useFlg = false
		local timeScale = 1

		useFlg, timeScale = self.controllerTimer:GetTimeScaleByPriority(ControllerTimer.Priority.Skill)

		if useFlg == true then
			self.dodgePostEffect = true

			local intensity = MathHelper.getValueInRadioRange(timeScale, 1, Hero10007_Define.DodgeTimeScale, 0, 1)

			self.scene:InterpChromaticAberrationIntensity(true, intensity)
		elseif self.dodgePostEffect == true then
			self.dodgePostEffect = false

			self.scene:RecoveryChromaticAberrationIntensity()
		end
	end
end

function Hero10007:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 and (self.skillCombo == 5 or self.skillCombo == 6) or (self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.Dodge) and self.skillCombo == 1 then
		self.skillButtonLongPressUsed = false
	end

	if self.skillIndex == AnimalBase_Define.SkillType.Dodge and (self.skillCombo == 3 or self.skillCombo == 5) then
		if self.isHost == true and self.isHostBack == false then
			self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero10007_Define.DodgeTimeScale, Hero10007_Define.DodgeTimeScaleEnterTime, Hero10007_Define.DodgeTimeScaleKeepTime, Hero10007_Define.DodgeTimeScaleExitTime)
			self:AddStatus(self:GetVirtualPlayer(), Hero10007_Define.RageAddStatusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)

			local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillAddStatus, self.skillIndex, self.skillCombo)

			if statusIdAdd > 0 then
				local statusId = Hero10007_Define.EnergyAddStatusId

				self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
			end

			self:PowerDecrementSub()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial and self.skillCombo == 2 then
		if self.characterConfig ~= nil then
			local mat = self.characterConfig:GetOtherMaterial(1)

			if mat ~= nil then
				self:ChangeMaterial(mat)
			end
		end

		self:SetMoveMuteki(true)
	elseif (self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2) and self.skillCombo == 2 and self.skillComboCnt > 0 then
		local isEnable = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillCondition, self.skillIndex, self.skillCombo)

		if isEnable > 0 and self.skillComboCnt ~= 2 then
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillComboCnt)

			log("ChangeSkillState====skillIndexNext=" .. self.skillIndex .. ",nextSkillCombo=" .. self.skillComboCnt)

			if self:CheckSkillDataRagePowerPermit(skillData) == true then
				self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillComboCnt, skillData.BtnPressType, skillData.BtnIndex)
			end
		end

		self.skillComboCnt = 0
	elseif (self.skillIndex == Hero10007_Define.SkillType.SkillHP1 or self.skillIndex == Hero10007_Define.SkillType.SkillHP2) and self.skillCombo == 1 then
		self.animalValue:SetPropertyToZero(MS_HeroData.Property.Power)
	end

	if (self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLH1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2Up) and self.skillCombo == 1 then
		self.SkillBeatBackActive = false
	end
end

function Hero10007:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)
	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero10007:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero10007:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if (self.skillIndex == Hero10007_Define.SkillType.SkillHP1 or self.skillIndex == Hero10007_Define.SkillType.SkillHP2) and (self.skillCombo == 1 or self.skillCombo == 2) and trigger == 2 then
		local nextSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo + 1)

		if self:CheckSkillDataRagePowerPermit(nextSkillData) == true then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, skillData.BtnPressType, skillData.BtnIndex)
		end
	end

	if self.skillIndex == Hero10007_Define.SkillType.SkillLP1Up and self.skillCombo == 1 and trigger == 4 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1 and self.skillCombo == 1 and trigger == 4 or self.skillIndex == Hero10007_Define.SkillType.SkillHP1 and trigger == 9 then
		self.weaponId = Hero10007_Define.WeaponDoubleSword

		self:ChangeWeapon(self.weaponId)
	elseif self.skillIndex == Hero10007_Define.SkillType.SkillLP2Up and self.skillCombo == 1 and trigger == 2 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2 and self.skillCombo == 1 and trigger == 2 or self.skillIndex == Hero10007_Define.SkillType.SkillHP2 and trigger == 9 then
		self.weaponId = Hero10007_Define.WeaponSingleSword

		self:ChangeWeapon(self.weaponId)
	end

	if (self.skillIndex == AnimalBase_Define.SkillType.Dodge and (self.skillCombo == 3 or self.skillCombo == 5) or (self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1Up) and self.skillCombo == 1 and self.isBeatBack == true) and trigger == 1 then
		self:PlaySkillEffect(true)

		if self.skillEffect ~= nil then
			for i = 1, AnimalBase_Define.VfxSkillKeyNum do
				local tmpKey = AnimalBase_Define.VfxSkillTriggerKey .. i

				if self.skillEffect[tmpKey] ~= nil then
					local rot = Quaternion.LookRotation(self.moveDirDodge)

					self.skillEffect[tmpKey]:SetRotation(rot.x, rot.y, rot.z, rot.w)

					rot = nil
				end
			end
		end
	end

	if self.skillIndex == Hero10007_Define.SkillType.SkillHP1 then
		if trigger == 1 then
			local tmpRage = skillData.RageSub

			self.animalValue:AddProperty(MS_HeroData.Property.Power, tmpRage)
		elseif trigger == 9 then
			self:AddStatus(self:GetVirtualPlayer(), Hero10007_Define.StatusEnergyDontUse, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	elseif self.skillIndex == Hero10007_Define.SkillType.SkillHP2 then
		if trigger == 1 then
			local tmpRage = skillData.RageSub

			self.animalValue:AddProperty(MS_HeroData.Property.Power, tmpRage)
		elseif trigger == 9 then
			self:AddStatus(self:GetVirtualPlayer(), Hero10007_Define.StatusGuardUp, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	end
end

function Hero10007:OnHitTrigger(trigger)
	AnimalBase.OnHitTrigger(self, trigger)
end

function Hero10007:OnSkillLoopEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillLoopEnd(self, skillIndexNext, skillComboNext)
end

function Hero10007:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)

	if skillIndexNext <= 0 then
		self.skillComboAttack = 0
		self.recordAchievementMissTimes = 0
		self.skillComboCnt = 0
	end

	if self.skillIndex == AnimalBase_Define.SkillType.Dodge and (self.skillCombo == 3 or self.skillCombo == 5) or (self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1Up) and self.skillCombo == 1 and self.isBeatBack == true then
		self.isBeatBack = false

		if self.isHost == true and self.isHostBack == false then
			self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.Skill)
			self:UpdateDodgeEffect()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.SkillSL1 or self.skillIndex == AnimalBase_Define.SkillType.SkillSL2 or self.skillIndex == Hero10007_Define.SkillType.SkillS1 and self.skillCombo == 4 then
		if self.isHost == true and self.isHostBack == false then
			self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.Skill)
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial and self.skillCombo == 2 then
		self:UnloadChangeMaterial()
		self:SetMoveMuteki(false)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.MoveSpeed, 1, 0, 0)
	elseif (self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 or self.skillIndex == Hero10007_Define.SkillType.SkillDL1 or self.skillIndex == Hero10007_Define.SkillType.SkillXL1) and skillIndexNext == Hero10007_Define.SkillType.SkillLH1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 and skillIndexNext == Hero10007_Define.SkillType.SkillHL1 or (self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillDL2) and skillIndexNext == Hero10007_Define.SkillType.SkillLH2 or (self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up2) and skillIndexNext == Hero10007_Define.SkillType.SkillHL2 then
		self.skillComboCnt = self.skillCombo
	elseif self.skillIndex == Hero10007_Define.SkillType.SkillLH1 then
		if skillIndexNext == Hero10007_Define.SkillType.SkillHHHH1 then
			self.skillComboCnt = self.skillComboCnt + 1

			if self.skillComboCnt > 5 then
				self.skillComboCnt = 1
			end
		elseif skillIndexNext ~= Hero10007_Define.SkillType.SkillHL1 then
			self.skillComboCnt = 0
		end
	elseif self.skillIndex == Hero10007_Define.SkillType.SkillHL1 then
		if skillIndexNext == Hero10007_Define.SkillType.SkillLLLL1 then
			self.skillComboCnt = self.skillComboCnt + 1

			if self.skillComboCnt > 5 then
				self.skillComboCnt = 1
			end
		elseif skillIndexNext ~= Hero10007_Define.SkillType.SkillLH1 then
			self.skillComboCnt = 0
		end
	elseif self.skillIndex == Hero10007_Define.SkillType.SkillHL2 then
		if skillIndexNext == Hero10007_Define.SkillType.SkillLLLLL2 or skillIndexNext == Hero10007_Define.SkillType.SkillLLLLL2Up1 or skillIndexNext == Hero10007_Define.SkillType.SkillLLLLL2Up2 then
			self.skillComboCnt = self.skillComboCnt + 1

			if self.skillComboCnt > 6 then
				self.skillComboCnt = 1
			end
		elseif skillIndexNext ~= Hero10007_Define.SkillType.SkillLH2 then
			self.skillComboCnt = 0
		end
	elseif self.skillIndex == Hero10007_Define.SkillType.SkillLH2 then
		if skillIndexNext == Hero10007_Define.SkillType.SkillHHHHH2 or skillIndexNext == Hero10007_Define.SkillType.SkillHHHHH2Up1 or skillIndexNext == Hero10007_Define.SkillType.SkillHHHHH2Up2 then
			self.skillComboCnt = self.skillComboCnt + 1

			if self.skillComboCnt > 6 then
				self.skillComboCnt = 1
			end
		elseif skillIndexNext ~= Hero10007_Define.SkillType.SkillHL2 then
			self.skillComboCnt = 0
		end
	end

	if self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 and self.skillCombo == 1 and skillIndexNext == Hero10007_Define.SkillType.SkillLP1Up or self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 and self.skillCombo == 1 and skillIndexNext == Hero10007_Define.SkillType.SkillLP1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 and self.skillCombo == 1 and skillIndexNext == Hero10007_Define.SkillType.SkillHP1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 and self.skillCombo == 5 and skillIndexNext == Hero10007_Define.SkillType.SkillHHHH1 or (self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up2) and (self.skillCombo == 1 and (skillIndexNext == Hero10007_Define.SkillType.SkillLP2Up or skillIndexNext == Hero10007_Define.SkillType.SkillLP2) or skillIndexNext == Hero10007_Define.SkillType.SkillLH2 or skillIndexNext == Hero10007_Define.SkillType.SkillLH2Up) or (self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up2) and (self.skillCombo == 1 and skillIndexNext == Hero10007_Define.SkillType.SkillHP2 or skillIndexNext == Hero10007_Define.SkillType.SkillHL2 or skillIndexNext == Hero10007_Define.SkillType.SkillHL2Up) or self.skillIndex == Hero10007_Define.SkillType.SkillHP1 and (self.skillCombo == 1 or self.skillCombo == 2) and skillIndexNext == Hero10007_Define.SkillType.SkillHP1 or self.skillIndex == Hero10007_Define.SkillType.SkillHP2 and (self.skillCombo == 1 or self.skillCombo == 2) and skillIndexNext == Hero10007_Define.SkillType.SkillHP2 or (self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2Up) and (skillIndexNext == Hero10007_Define.SkillType.Dodge or skillIndexNext == Hero10007_Define.SkillType.SkillHL2) or (self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2Up) and (skillIndexNext == Hero10007_Define.SkillType.Dodge or skillIndexNext == Hero10007_Define.SkillType.SkillLH2) or self.skillIndex == Hero10007_Define.SkillType.SkillDL1 or self.skillIndex == Hero10007_Define.SkillType.SkillDL2 or self.skillIndex == AnimalBase_Define.SkillType.Drop then
		self:StopSkillAudio()
		self:ClearSkillEffectAll()
	end

	if (self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL2Up or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP1Up or self.skillIndex == Hero10007_Define.SkillType.SkillHL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLH1 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2 or self.skillIndex == Hero10007_Define.SkillType.SkillLP2Up) and self.skillCombo == 1 then
		self.SkillBeatBackActive = false
	end
end

function Hero10007:ChangeWeapon(WeaponId)
	self:SetSkillConditionAll(WeaponId)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, WeaponId - 1, 0, 0)
	self:ShowSkillIcon()
end

function Hero10007:IsSkillAutoSkillStart()
	local isAutoSkill = false

	if self.weaponId == Hero10007_Define.WeaponDoubleSword then
		self.autoSkill = Hero10007_Define.SkillType.SkillAutoDodge2
	elseif self.weaponId == Hero10007_Define.WeaponSingleSword then
		self.autoSkill = Hero10007_Define.SkillType.SkillAutoDefence1
	end

	if self.autoSkill > 0 then
		if self:IsSkilling() == true then
			if self:IsSkillComboSkill(self.skillIndex, self.autoSkill) == true then
				isAutoSkill = true
			end
		elseif self:IsFreeSkillEnable() == true then
			isAutoSkill = true
		end

		if isAutoSkill == true then
			local AutoSkillData = MS_SkillData.GetSkillData(self.heroId, self.autoSkill, 1)

			if AutoSkillData ~= nil and (AutoSkillData.SkillTalent <= 0 or self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, AutoSkillData.SkillIndex, AutoSkillData.SkillCombo) >= AutoSkillData.SkillTalent) and self:CheckSkillDataRagePowerPermit(AutoSkillData) == true then
				self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalHit, self.autoDodgeDir, 0, 0)

				self.autoDodgeDir = -1 * self.autoDodgeDir

				return self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.autoSkill, 1, MS_SkillData.PressType.PressDown, 0)
			end
		end
	end

	return false
end

function Hero10007:OnSkillParryBullet(bullet)
	if self:IsSkillingSkill() == false then
		return
	end

	local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

	if vfxRoot ~= nil then
		VfxManager.PlayBindMulti(vfxRoot, Hero10007_Define.VfxParryBullet)
	end

	AudioCtrl.SetHeroAudio("hero10007/skill/Character_hero10007_skill_defence", self:GetPosByWorldPos(), self.animalId)
	self:StartAnimatorDelay(0, Hero10007_Define.ParryFrameFreeze, Hero10007_Define.ParryFrameFadeOut, Hero10007_Define.ParryFrameFreezeSpeed)

	self.recordAchievementParryTimeList[self.recordAchievementParryCount] = ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime()

	local nextCount = self.recordAchievementParryCount - 9

	if self.recordAchievementParryTimeList[nextCount] ~= nil then
		if self.recordAchievementParryTimeList[self.recordAchievementParryCount] - self.recordAchievementParryTimeList[nextCount] <= 10 then
			FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.ParryTimesInTime)
		end

		self.recordAchievementParryTimeList[nextCount] = nil
	end

	self.recordAchievementParryCount = self.recordAchievementParryCount + 1

	log("OnSkillParryBullet=================================")
end

function Hero10007:PowerDecrementSub()
	local nowPower = self.animalValue:GetProperty(MS_HeroData.Property.Power)

	if nowPower > 0 then
		local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.StatusChange, 0, 0)

		if statusIdAdd > 0 then
			local statusId = Hero10007_Define.PowerDecrementSubStatusId

			self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	end
end

function Hero10007:ShowSkillIcon()
	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "ChangeSpecialSkill", self.heroId, self.weaponId)
		UIManager.SendMessage("Mainmenu", "SetRageType", self.heroId, self.weaponId, true)
	end
end

function Hero10007:ShowWeaponEffect()
	if self.tfWeaponRageMaterial ~= nil then
		local rage = self.animalValue:GetProperty(MS_HeroData.Property.Rage)

		self.tfWeaponRageMaterial:SetFloat("_Lerp0_100", rage)
	end
end

function Hero10007:ChangeMaterial(mat)
	if self.materialChanged == true or mat == nil then
		return
	end

	if self.tfBodyRender ~= nil and self.tfBodyMaterial == nil then
		self.tfBodyRender.materials = {}
		self.tfBodyRender.material = mat
		self.tfBodyMaterial = self.tfBodyRender.material
	end

	if self.tfBodyHairRender ~= nil and self.tfBodyHairMaterial == nil then
		self.tfBodyHairRender.materials = {}
		self.tfBodyHairRender.material = mat
		self.tfBodyHairMaterial = self.tfBodyHairRender.material
	end

	if self.tfBodyPartsRender ~= nil and self.tfBodyPartsMaterial == nil then
		self.tfBodyPartsRender.materials = {}
		self.tfBodyPartsRender.material = mat
		self.tfBodyPartsMaterial = self.tfBodyPartsRender.material
	end

	if self.tfWeaponRender ~= nil and self.tfWeaponMaterial ~= nil then
		for index, render in pairs(self.tfWeaponRender) do
			log("ChangeMaterial=====================" .. index .. "=====" .. tostring(render))

			if render ~= nil and self.tfWeaponMaterial[index] == nil then
				log("render.materials====================" .. tostring(render.materials))

				render.materials[0] = mat
				render.material = mat
				self.tfWeaponMaterial[index] = render.material
			end
		end
	end

	if self.tfEquipmentRender ~= nil and self.tfEquipmentMaterial ~= nil then
		for index, render in pairs(self.tfEquipmentRender) do
			if render ~= nil and self.tfEquipmentMaterial[index] == nil then
				render.materials = {}
				render.material = mat
				self.tfEquipmentMaterial[index] = render.material
			end
		end
	end

	self.materialChanged = true
end

function Hero10007:AddSkillComboAttack(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

	if skillData ~= nil and skillData.Attack > 0 then
		self.skillComboAttack = self.skillComboAttack + 1
	end
end

function Hero10007:GetSkillComboAttack()
	return self.skillComboAttack
end

function Hero10007:PlaySkillEffect(isTrigger)
	if self.skillIndex == Hero10007_Define.SkillType.SkillHHHH1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillLLLLL2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up1 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2Up2 or self.skillIndex == Hero10007_Define.SkillType.SkillHHHHH2 or self.skillIndex == Hero10007_Define.SkillType.SkillDL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLH2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL2 or self.skillIndex == Hero10007_Define.SkillType.SkillDL2 or self.skillIndex == Hero10007_Define.SkillType.SkillHL1 or self.skillIndex == Hero10007_Define.SkillType.SkillLH1 then
		if self:IsSkillingSkill() == true then
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

			if skillData ~= nil then
				local rage = self.animalValue:GetProperty(MS_HeroData.Property.Rage)
				local rageMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Rage)
				local rageRadio = rage / rageMax
				local rageLevel = 1

				if rageRadio >= Hero10007_Define.RageLevel2Limit then
					rageLevel = 3
				elseif rageRadio >= Hero10007_Define.RageLevel1Limit then
					rageLevel = 2
				end

				local tmpTrigger = 0
				local tmpEffKey = AnimalBase_Define.VfxSkillKey .. rageLevel
				local tmpEffTrigger = AnimalBase_Define.VfxSkillTriggerKey .. rageLevel
				local tmpKey = tmpEffKey

				if isTrigger == true then
					tmpTrigger = 1
					tmpKey = tmpEffTrigger
				end

				if skillData[tmpEffKey] ~= "" and skillData[tmpEffTrigger] == tmpTrigger then
					local vfxRoot = self:GetEffectRoot(skillData[AnimalBase_Define.VfxSkillRootKey .. rageLevel])

					if vfxRoot ~= nil then
						local eff = self:PlayEffect(vfxRoot, skillData[tmpEffKey], skillData[AnimalBase_Define.VfxSkillBindKey .. rageLevel])

						if eff ~= nil then
							self:AddSkillEffect(tmpKey, eff)

							if skillData[AnimalBase_Define.VfxSkillDelayKey .. rageLevel] > 0 then
								eff:SetDelayClear(true, nil)
							end
						end
					end
				end
			end
		end
	else
		AnimalBase.PlaySkillEffect(self, isTrigger)
	end
end

function Hero10007:PlaySkillAudio()
	local rage = self.animalValue:GetProperty(MS_HeroData.Property.Rage)
	local rageMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Rage)
	local rageRadio = rage / rageMax
	local rageLevel = 1

	if rageRadio >= Hero10007_Define.RageLevel2Limit then
		rageLevel = 3
	elseif rageRadio >= Hero10007_Define.RageLevel1Limit then
		rageLevel = 2
	end

	AnimalBase.PlaySkillAudio(self, false, "rage_level", rageLevel)
end

function Hero10007:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)
end

function Hero10007:SetUI()
	AnimalBase.SetUI(self)
	self:ShowSkillIcon()
end

function Hero10007:Exit()
	AnimalBase.Exit(self)
end

return Hero10007
