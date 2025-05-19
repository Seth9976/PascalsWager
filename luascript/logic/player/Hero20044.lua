-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20044.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20044_Define")

Hero20044 = class("Hero20044", AnimalBase)

function Hero20044:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSkillNO2Vec3 = Vector3.zero
	self.bulletSkillNO2Vec3.z = Hero20044_Define.BulletSkillNO2Speed
	self.bulletSkillNOP2Vec3 = Vector3.zero
	self.bulletSkillNOP2Vec3.z = Hero20044_Define.BulletSkillNOP2Speed
	self.blockCount = 0
end

function Hero20044:Start()
	AnimalBase.Start(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20044:StartBattle()
	AnimalBase.StartBattle(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self:ResetGrade()
			self:AddGrade(true)
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			self:ResetGrade()
			self:AddGrade(true)
		end
	end
end

function Hero20044:Show()
	AnimalBase.Show(self)
end

function Hero20044:Hide()
	AnimalBase.Hide(self)
end

function Hero20044:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)

	if self:IsSkilling() == true and self:IsSkillingById(Hero20044_Define.SkillType.SkillSP, 0) == true then
		self.blockCount = self.blockCount + 1
	end
end

function Hero20044:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20044:IsSkillCounterAttackedStart(attackVPlayer, skillIndex, skillCombo)
	if self:IsSkilling() == true and self:IsSkillingById(Hero20044_Define.SkillType.SkillSP, 0) == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and FS_UserData.story:GetLoop() <= 1 and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false and self.blockCount < Hero20044_Define.SkillSP_BlockCountToCounterAttack then
		return false
	end

	return AnimalBase.IsSkillCounterAttackedStart(self, attackVPlayer, skillIndex, skillCombo)
end

function Hero20044:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(4), "vfx_20044_self_2")
	else
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero20044:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20044:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20044:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20044:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20044_Define.SkillType.SkillNO2 then
		if trigger > 0 then
			local bulletTarget = GameAI.GetAttackTarget(self)

			if bulletTarget ~= nil then
				local bulletSkillData = MS_SkillData.GetSkillData(self.heroId, Hero20044_Define.SkillType.SkillNO2, 1)
				local startPos = self:GetWeaponBox(1).position
				local shootDir = self:GetForward()
				local diffAngle = 360 * (Hero20044_Define.BulletSkillNO2Num - trigger) / Hero20044_Define.BulletSkillNO2Num
				local rot = Quaternion.AngleAxis(diffAngle, shootDir)
				local tmpUp = Vector3.up

				tmpUp:MulQuat(rot)

				local targetPos = shootDir + tmpUp

				targetPos:SetNormalize()
				targetPos:Mul(Hero20044_Define.BulletSkillNO2RangeMax)
				targetPos:Add(startPos)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, bulletSkillData, nil, startPos, targetPos, self.bulletSkillNO2Vec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:SetSpeedAngle(Hero20044_Define.BulletSkillNO2AngleSpeed)
						bullet:SetLifeTime(Hero20044_Define.BulletSkillNO2LifeTime)
						bullet:Ready()
						bullet:SetSkillTargetAnimal(bulletTarget, false)
						bullet:Start()
					end
				end

				targetPos = nil
				rot = nil
				tmpUp = nil
			end
		end
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillLP1 or self.skillIndex == Hero20044_Define.SkillType.SkillLP2 then
		if self.skillCombo == 1 and trigger == 1 then
			self:SetBodyCollider(false)
		end
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillNS2 then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20044_Define.TrickId_SkillNS2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillNSP2 then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20044_Define.TrickId_SkillNSP2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillNOP2 then
		if self.skillCombo == 1 and (trigger ~= 1 or true) then
			-- block empty
		elseif self.skillCombo > 1 and trigger > 0 then
			local weaponBox = self:GetWeaponBox(6)
			local startPos = weaponBox.position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20044_Define.BulletRangeMax, Hero20044_Define.BulletRangeMax, Hero20044_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			targetPos.y = startPos.y

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSkillNOP2Vec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetThroughBody(true)
					bullet:Ready()

					if Hero20044_Define.BulletSkillNOP2Angle[self.skillCombo - 1][trigger] ~= nil then
						bullet:SetRotation(0, 0, Hero20044_Define.BulletSkillNOP2Angle[self.skillCombo - 1][trigger])
					end

					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillNLP2 and self.skillCombo == 1 and trigger == 1 then
		self.scene:OpenTrick(Hero20044_Define.TrickId_SkillNLP2, self:GetPosByWorldPos(), self:GetRotation())
	end
end

function Hero20044:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if (self.skillIndex == Hero20044_Define.SkillType.SkillLL2 or self.skillIndex == Hero20044_Define.SkillType.SkillLP2 or self.skillIndex == Hero20044_Define.SkillType.SkillHHH2 or self.skillIndex == Hero20044_Define.SkillType.SkillNHHH2 or self.skillIndex == Hero20044_Define.SkillType.SkillNLLLL2 or self.skillIndex == Hero20044_Define.SkillType.SkillNLP2) and self.skillCombo == 1 or self.skillIndex == Hero20044_Define.SkillType.SkillNOP2 and self.skillCombo == 2 then
		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(2), "vfx_20044_skill_self1")
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillNOP2 and self.skillCombo == 1 then
		self:CreateSelfEffectLoop("self_3", self:GetWeaponBox(2), "vfx_20044_skill_self2")
	end

	if self.skillIndex == Hero20044_Define.SkillType.SkillOP2 and self.skillCombo == 3 then
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		self:SetMoveMuteki(false)
		self:ShowGradeEffect()
	end
end

function Hero20044:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20044_Define.SkillType.SkillOP2 then
		if self.skillCombo == 1 then
			self:SetMoveMuteki(true)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ClearSelfEffectLoop("self_1")
		end

		if skillIndexNext ~= Hero20044_Define.SkillType.SkillOP2 or self.skillCombo == 2 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:SetMoveMuteki(false)
			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillSP and skillIndexNext ~= Hero20044_Define.SkillType.SkillSP then
		self.blockCount = 0
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillLL2 and skillIndexNext ~= Hero20044_Define.SkillType.SkillLL2 or self.skillIndex == Hero20044_Define.SkillType.SkillLP2 and skillIndexNext ~= Hero20044_Define.SkillType.SkillLP2 or self.skillIndex == Hero20044_Define.SkillType.SkillHHH2 and skillIndexNext ~= Hero20044_Define.SkillType.SkillHHH2 or self.skillIndex == Hero20044_Define.SkillType.SkillNHHH2 and skillIndexNext ~= Hero20044_Define.SkillType.SkillNHHH2 or self.skillIndex == Hero20044_Define.SkillType.SkillNLLLL2 and skillIndexNext ~= Hero20044_Define.SkillType.SkillNLLLL2 or self.skillIndex == Hero20044_Define.SkillType.SkillNLP2 and self.skillCombo == 1 or self.skillIndex == Hero20044_Define.SkillType.SkillNOP2 and self.skillCombo == 2 then
		self:ClearSelfEffectLoop("self_2")
	elseif self.skillIndex == Hero20044_Define.SkillType.SkillNOP2 and self.skillCombo == 1 then
		self:ClearSelfEffectLoop("self_3")
	end

	if (self.skillIndex == Hero20044_Define.SkillType.SkillLP1 or self.skillIndex == Hero20044_Define.SkillType.SkillLP2) and self.skillCombo == 1 then
		self:SetBodyCollider(true)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20044:GetShootDistanceMax()
	return Hero20044_Define.BulletRangeMax
end

function Hero20044:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20044:Exit()
	self.bulletSkillNO2Vec3 = nil

	AnimalBase.Exit(self)
end

return Hero20044
