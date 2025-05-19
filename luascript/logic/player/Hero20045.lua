-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20045.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20045_Define")

Hero20045 = class("Hero20045", AnimalBase)

function Hero20045:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSkillNDSpeedVec3 = Vector3.zero
	self.bulletSkillNDAccVec3 = Vector3.zero
	self.bulletSkillNDAccVec3.y = Hero20045_Define.BulletSkillNDGravity
	self.bulletTraceVec3 = Vector3.zero
	self.bulletTraceVec3.z = Hero20045_Define.BulletTraceSpeed
	self.chargeNum = 0
end

function Hero20045:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 then
		self:CreateSelfEffectLoop("self_1", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root), Hero20045_Define.VfxNpcName)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20045_Define.WeaponHammer, false)
	end

	self.chargeNum = 0

	self:SetSkillConditionAll(0)

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20045:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true then
		if buttonPressDown == ControllerMain.SkillButton.Threat then
			if self.animalGrade <= 1 then
				self:AddGrade(false)
			else
				self:ResetGrade()
			end
		elseif buttonPressDown == ControllerMain.SkillButton.NewThreat then
			self.chargeNum = self.chargeNum + 1

			self:SetAttackSkillCondition(self.chargeNum)
		end
	end
end

function Hero20045:AddGrade(isStart)
	local toMovie = false

	if self.boss > 0 and BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self.gameController:IsBossMode() == false then
		return toMovie
	end

	self.animalGrade = self.animalGrade + 1

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		if self.isHost == false then
			local propertyData

			if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
				local mazeLevel = FS_UserData.story:GetMazeLevel()

				propertyData = MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(self.heroId, mazeLevel, self.animalGrade)
			else
				propertyData = MS_StoryMonsterProperty.GetStoryMonsterProperty(self.storyId, self:GetStoryMonsterId(), self.animalGrade)
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
				local challengeData = MS_StoryChallenge.GetDataByHeroId(self.heroId)

				if challengeData ~= nil then
					propertyData = MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(self.heroId, FS_UserData.story:GetChallengeLevel(), self.animalGrade)
				end
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				propertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(self.heroId, FS_UserData.story:GetDifficulty(), self.animalGrade)
			end

			if propertyData ~= nil then
				self.animalValue:SetHeroPropertyData(propertyData)
				self.animalValue:RefreshPropertyAll(isStart, false, nil)
			end

			if self.boss > 0 and self.heroExtData.BossFinal > 0 then
				toMovie = self.gameController:BossGradeUp(self)

				if toMovie == true then
					self.gameController:ClearCallMonsterAll()
				end
			end
		end

		if toMovie == false then
			self:AddGradeAfter(false)
		else
			self:ClearSkillButtonAll()
			self:ClearMoveButtonAll()
			self:StopSkill()
			self:StopSkillAudio()
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
		end
	else
		self:AddGradeAfter(false)
	end

	if DebugMonsterAISkill == true and self.animalGrade > 1 then
		self:SetAttackSkillCondition(Hero20045_Define.SkillNSP2Condition)
		self:SetAttackSkillCondition(Hero20045_Define.SkillNOP2Condition)
		self:SetAttackSkillCondition(Hero20045_Define.SkillNO2Condition)
		self:SetAttackSkillCondition(Hero20045_Define.SkillSlayCondition)
	end

	return toMovie
end

function Hero20045:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:CreateSelfEffectLoop("self_2", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), "vfx_20045_self_2")
		self:ClearSelfEffectLoop("self_1")
		AudioCtrl.SetHeroAudio(self.modelName .. "/shapeshift", self.tfModel, self:GetAnimalId())
	else
		self:ClearSelfEffectLoop("self_2")
		self:ClearSelfEffectLoop("self_3")
		AudioCtrl.StopHeroAudio(self.modelName .. "/shapeshift", self:GetAnimalId())
	end
end

function Hero20045:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20045_Define.SkillType.SkillS then
		if self.skillCombo == 2 and trigger == 1 then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
				local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())

				targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, false)
				targetAnimal:SetMoveFix(false)
				targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
				self:SetSkillTarget(nil)
			end
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillND then
		if self.skillCombo == 1 and trigger == 1 then
			local startPos = self:GetWeaponBox(3).position
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20045_Define.BulletSkillNDRange, Hero20045_Define.BulletSkillNDRangeMin, Hero20045_Define.BulletSkillNDRangeMax, Hero20045_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20045_Define.BulletSkillNDAngle, Hero20045_Define.BulletSkillNDGravity)

			self.bulletSkillNDSpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSkillNDSpeedVec3, self.bulletSkillNDAccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetBulletParryEnable(false)
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
					self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20045_Define.WeaponBomb, false)
				end
			end
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillNLP2 then
		if self.skillCombo == 1 and trigger == 2 then
			self.scene:OpenTrick(Hero20045_Define.TrickId_SkillNLP2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillNS2 then
		if trigger > 0 then
			local bulletTarget = GameAI.GetAttackTarget(self)

			if bulletTarget ~= nil then
				local startPos = self:GetWeaponBox(5).position
				local shootDir = self:GetForward()
				local diffAngle = 360 * (Hero20045_Define.BulletTraceNum - trigger) / Hero20045_Define.BulletTraceNum
				local rot = Quaternion.AngleAxis(diffAngle, shootDir)
				local tmpUp = Vector3.up

				tmpUp:MulQuat(rot)

				local targetPos = shootDir + tmpUp

				targetPos:SetNormalize()
				targetPos:Mul(Hero20045_Define.BulletTraceRangeMax)
				targetPos:Add(startPos)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, skillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:SetSpeedAngle(Hero20045_Define.BulletTraceAngleSpeed)
						bullet:SetLifeTime(Hero20045_Define.BulletTraceLifeTime)
						bullet:Ready()
						bullet:SetSkillTargetAnimal(bulletTarget, false)
						bullet:Start()
					end
				end

				targetPos = nil
				rot = nil
				tmpUp = nil

				VfxManager.PlayBindMulti(self:GetWeaponBox(5), "vfx_20045_skill17_2")
			end
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillNSP2 then
		if self.skillCombo == 1 and trigger == 2 then
			local target = GameAI.GetAttackTarget(self)

			if target ~= nil and target:IsDead() == false then
				self.scene:OpenTrick(Hero20045_Define.TrickId_SkillNSP2, target:GetPosByWorldPos(), target:GetRotation())
			end
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillOP1 then
		if self.skillCombo == 3 and trigger > 0 then
			local rot = Quaternion.Euler(0, MathHelper.getRandom(0, 180, trigger), 0)

			self.scene:OpenTrick(Hero20045_Define.TrickId_SkillOP, self:GetPosByWorldPos(), rot)
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillOP2 then
		if self.skillCombo == 3 and trigger == 1 then
			self.scene:OpenTrick(Hero20045_Define.TrickId_SkillSlay, self:GetPosByWorldPos(), self:GetRotation())
		end

		if self.skillCombo == 2 and trigger > 0 then
			local rot = Quaternion.Euler(0, MathHelper.getRandom(0, 180, trigger), 0)

			self.scene:OpenTrick(Hero20045_Define.TrickId_SkillOP, self:GetPosByWorldPos(), rot)
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillNOP2 and self.skillCombo == 1 and trigger == 1 then
		self.scene:OpenTrick(Hero20045_Define.TrickId_SkillNOP2, self:GetPosByWorldPos(), self:GetRotation())
	end
end

function Hero20045:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20045_Define.SkillType.SkillS and self.skillCombo == 1 and self.animatorTrigger >= 1 and self.animatorTrigger < 2 then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal == nil then
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
			local attPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local captureOffset, captureDis, captureHeight = self:GetCaptureDistanceAndHeight()

			targetAnimal = GameAI.GetSkillCaptureTarget(self, skillData, attPos, captureOffset, captureDis, captureHeight, false)

			if targetAnimal ~= nil then
				self:SetSkillTargetReady(targetAnimal)
			end
		end
	end
end

function Hero20045:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20045_Define.SkillType.SkillS then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal == nil and self.skillCombo == 1 then
				local targetAnimalReady = self:GetSkillTargetReady()

				if targetAnimalReady ~= nil then
					local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
					local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
					local attackDir = self:GetSkillDirection(targetAnimalReady:GetPosByWorldPos())
					local ret = targetAnimalReady:ChangeHitSimple(self, hitType, skillData, attackDir, false)

					if ret == true then
						self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
						self:SetSkillTarget(targetAnimalReady)
						XCollider.AddRouteColliderIgnore(self:GetAnimalId(), targetAnimalReady:GetAnimalId())
						XCollider.AddRouteColliderIgnore(targetAnimalReady:GetAnimalId(), self:GetAnimalId())

						local attBoxTF = self:GetAttackBoxTF(self.skillIndex, 1)

						targetAnimalReady:SetMoveFix(true)
						targetAnimalReady:SetFixBoneHost(AnimalBase_Define.FixBoneType.Chest, attBoxTF, true)
					end

					self:SetSkillTargetReady(nil)
				end
			end

			targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				targetAnimal:KeepHitPeriod()
			end
		elseif self.skillIndex == Hero20045_Define.SkillType.SkillOP2 and self.skillCombo == 2 and self:IsSkillCondition(Hero20045_Define.SkillType.SkillOP2, Hero20045_Define.SkillSlayCondition) == true then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20045:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20045:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20045_Define.SkillType.SkillS then
		if self.skillCombo == 1 then
			self:SetSkillTarget(nil)
		elseif self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	end
end

function Hero20045:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20045_Define.SkillType.SkillNDP and self.skillCombo == 2 or self.skillIndex == Hero20045_Define.SkillType.SkillOP1 and self.skillCombo == 3 or self.skillIndex == Hero20045_Define.SkillType.SkillOP2 and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillS and skillIndexNext ~= Hero20045_Define.SkillType.SkillS then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end

		self:SetSkillTarget(nil)
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillOP1 then
		if self.skillCombo == 2 then
			self.chargeNum = self.chargeNum + 2

			self:SetAttackSkillCondition(self.chargeNum)

			if self.animalGrade <= 1 and self.chargeNum >= Hero20045_Define.AddGradeCondition then
				self:AddGrade(false)
			end
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillOP2 and self.skillCombo == 1 and self.chargeNum < Hero20045_Define.SkillNOP2Condition then
		self.chargeNum = self.chargeNum + 1

		self:SetAttackSkillCondition(self.chargeNum)

		if self:IsSkillCondition(Hero20045_Define.SkillType.SkillOP2, Hero20045_Define.SkillSlayCondition) == true then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20045:OnSkillLoopEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillLoopEnd(self, skillIndexNext, skillComboNext)

	if self.skillIndex == Hero20045_Define.SkillType.SkillOP1 then
		if self.skillCombo == 3 then
			self.chargeNum = self.chargeNum + 1

			self:SetAttackSkillCondition(self.chargeNum)

			if self.animalGrade <= 1 and self.chargeNum >= Hero20045_Define.AddGradeCondition then
				self:AddGrade(false)
			end
		end
	elseif self.skillIndex == Hero20045_Define.SkillType.SkillOP2 and self.skillCombo == 2 then
		self.chargeNum = self.chargeNum + 1

		self:SetAttackSkillCondition(self.chargeNum)

		if self:IsSkillCondition(Hero20045_Define.SkillType.SkillOP2, Hero20045_Define.SkillSlayCondition) == true then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20045:SetAttackSkillCondition(condition)
	if condition >= Hero20045_Define.SkillSlayCondition then
		self:SetSkillCondition(Hero20045_Define.SkillType.SkillOP2, Hero20045_Define.SkillSlayCondition)
	elseif condition >= Hero20045_Define.SkillNO2Condition then
		self:SetSkillCondition(Hero20045_Define.SkillType.SkillNO2, Hero20045_Define.SkillNO2Condition)
	elseif condition >= Hero20045_Define.SkillNOP2Condition then
		self:SetSkillCondition(Hero20045_Define.SkillType.SkillNOP2, Hero20045_Define.SkillNOP2Condition)
		self:CreateSelfEffectLoop("self_3", self:GetWeaponBox(7), "vfx_20045_self_3")
	elseif condition >= Hero20045_Define.SkillNSP2Condition then
		self:SetSkillCondition(Hero20045_Define.SkillType.SkillNSP2, Hero20045_Define.SkillNSP2Condition)
	elseif condition >= 1 then
		self:CreateSelfEffectLoop("self_1", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), "vfx_20045_self_1")
	end

	log("Condition=============" .. condition)
end

function Hero20045:GetChargeNum()
	return self.chargeNum
end

function Hero20045:GetCaptureDistanceAndHeight()
	return Hero20045_Define.SkillCaptureOffset, Hero20045_Define.SkillCaptureDistance, Hero20045_Define.SkillCaptureHeight
end

function Hero20045:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20045:ExitBattle()
	self.scene:StopTrick(Hero20045_Define.TrickId_SkillNSP2)
	self.scene:StopTrick(Hero20045_Define.TrickId_SkillNOP2)
	self.scene:StopTrick(Hero20045_Define.TrickId_SkillSlay)
	self.scene:StopTrick(Hero20045_Define.TrickId_SkillOP)
	self.scene:StopTrick(Hero20045_Define.TrickId_SkillNLP2)

	self.chargeNum = 0

	AnimalBase.ExitBattle(self)
end

function Hero20045:Exit()
	self.bulletSkillNDSpeedVec3 = nil
	self.bulletSkillNDAccVec3 = nil
	self.bulletTraceVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20045
