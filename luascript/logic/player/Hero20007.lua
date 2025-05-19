-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20007.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20007_Define")

Hero20007 = class("Hero20007", AnimalBase)

function Hero20007:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.skillHSBulletSpeedVec3 = Vector3.zero
	self.skillHSBulletSpeedVec3.z = Hero20007_Define.SkillHSBulletSpeedZ
	self.skillHSBulletSpeedVec3.y = Hero20007_Define.SkillHSBulletSpeedY
	self.skillHSBulletAccVec3 = Vector3.zero
	self.skillHSBulletAccVec3.y = Hero20007_Define.SkillHSBulletGravity
	self.skillLSBulletSpeedVec3 = Vector3.zero
	self.skillLSBulletSpeedVec3.z = Hero20007_Define.SkillLSBulletSpeedZ
	self.skillLSBulletSpeedVec3.y = Hero20007_Define.SkillLSBulletSpeedY
	self.skillLSBulletAccVec3 = Vector3.zero
	self.skillLSBulletAccVec3.y = Hero20007_Define.SkillLSBulletGravity
end

function Hero20007:Start()
	AnimalBase.Start(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20007:StartBattle()
	AnimalBase.StartBattle(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self:ResetGrade()
			self:AddGrade(true)
		elseif self.heroExtData.BossFinal <= 0 then
			self:ResetGrade()
			self:AddGrade(true)
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			self:ResetGrade()
			self:AddGrade(true)
		end
	end
end

function Hero20007:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20007:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())

	if self.animalGrade > 1 then
		AudioCtrl.StopHeroAudio(self.modelName .. "/shapeshift", self:GetAnimalId())
	end
end

function Hero20007:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		local tfRoot = self:GetWeaponBox(1)

		self:CreateSelfEffectLoop("self_1", tfRoot, "vfx_20007_self_1")
		self:CreateSelfEffectLoop("self_2", tfRoot, "vfx_20007_self_2")
		AudioCtrl.SetHeroAudio(self.modelName .. "/shapeshift", self.tfModel, self:GetAnimalId())
	else
		self:SetAnimatorStateSpecial(AnimalBase_Define.AnimatorStateEmpty, self:GetAnimatorLayerIndex("UpperBody"))
		self:ClearSelfEffectLoop("self_1")
		self:ClearSelfEffectLoop("self_2")
		AudioCtrl.StopHeroAudio(self.modelName .. "/shapeshift", self:GetAnimalId())
	end
end

function Hero20007:OnHitTrigger(trigger)
	AnimalBase.OnHitTrigger(self, trigger)

	if (self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.StatusBreak) and self.animalGrade >= 2 then
		if trigger == AnimalBase_Define.TriggerHit.FollowAttack then
			self:ClearSelfEffectLoop("self_1")
		elseif trigger == AnimalBase_Define.TriggerHit.StandUp then
			local tfRoot = self:GetWeaponBox(1)

			self:CreateSelfEffectLoop("self_1", tfRoot, "vfx_20007_self_1")
		end
	end
end

function Hero20007:OnHitReset()
	local resetTime = AnimalBase.OnHitReset(self)

	if self.animalGrade >= 2 and (self.moveHitTypeOld == AnimalBase_Define.HitType.StatusWeak or self.moveHitTypeOld == AnimalBase_Define.HitType.StatusBreak) then
		local tfRoot = self:GetWeaponBox(1)

		self:CreateSelfEffectLoop("self_1", tfRoot, "vfx_20007_self_1")
	end

	return resetTime
end

function Hero20007:OnHitExit()
	if self.animalGrade >= 2 and (self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.StatusBreak) then
		local tfRoot = self:GetWeaponBox(1)

		self:CreateSelfEffectLoop("self_1", tfRoot, "vfx_20007_self_1")
	end

	AnimalBase.OnHitExit(self)
end

function Hero20007:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20007:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
	self:SetAnimatorStateSpecial(AnimalBase_Define.AnimatorStateState2, self:GetAnimatorLayerIndex("UpperBody"))
end

function Hero20007:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20007:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20007:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20007:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20007:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20007:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20007_Define.SkillType.SkillLPH then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
				local startPos = self:GetWeaponBox(3).position
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20007_Define.BulletRangeMax, Hero20007_Define.BulletRangeMax, Hero20007_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.skillHSBulletSpeedVec3, self.skillHSBulletAccVec3)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:SetStartMoveColliderBlockLM(Hero20007_Define.BulletBlockLayerMask)
						bullet:SetBulletParryEnable(false)
						bullet:Ready()
						bullet:Start()
					end
				end
			end
		elseif self.skillCombo == 2 and trigger == 1 then
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
			local startPos = self:GetWeaponBox(2).position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20007_Define.BulletRangeMax, Hero20007_Define.BulletRangeMax, Hero20007_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.skillHSBulletSpeedVec3, self.skillHSBulletAccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetStartMoveColliderBlockLM(Hero20007_Define.BulletBlockLayerMask)
					bullet:SetBulletParryEnable(false)
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20007_Define.SkillType.SkillLS and self.skillCombo == 2 and trigger == 1 then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
		local startPos = self:GetWeaponBox(3).position
		local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20007_Define.BulletRangeMax, Hero20007_Define.BulletRangeMax, Hero20007_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

		if self.controllerBullet ~= nil then
			local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.skillLSBulletSpeedVec3, self.skillLSBulletAccVec3)
			local bullet = self.controllerBullet:GetBullet(bulletIndex)

			if bullet ~= nil then
				bullet:SetStartMoveColliderBlockLM(Hero20007_Define.BulletBlockLayerMask)
				bullet:SetBulletParryEnable(false)
				bullet:Ready()
				bullet:Start()
			end
		end
	end
end

function Hero20007:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20007:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20007:GetShootDistanceMax()
	return Hero20007_Define.BulletRangeMax
end

function Hero20007:ExitBattle()
	AnimalBase.ExitBattle(self)
end

function Hero20007:Exit()
	AnimalBase.Exit(self)
end

return Hero20007
