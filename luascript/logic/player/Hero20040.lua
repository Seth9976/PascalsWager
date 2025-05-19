-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20040.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20040_Define")

Hero20040 = class("Hero20040", AnimalBase)

function Hero20040:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSkillH1SpeedVec3 = Vector3.zero
	self.bulletSkillH1SpeedVec3.z = Hero20040_Define.BulletSkillH1Speed
	self.bulletSkillNS2Vec3 = Vector3.zero
	self.bulletSkillNS2Vec3.z = Hero20040_Define.BulletSkillNS2Speed
	self.bulletSkillNSP2SpeedVec3 = Vector3.zero
	self.bulletSkillNSP2SpeedVec3.z = Hero20040_Define.BulletSkillNSP2Speed
	self.grade1TargetPos = Vector3.zero
	self.grade1Dir = Vector3.forward
	self.bulletSkillNSP2Cnt = 0
	self.bulletSkillNSP2Time = 0
	self.bulletSkillNS2Cnt = 0
	self.bulletSkillNS2Time = 0
	self.weaponSwordPos = Vector3.zero
	self.callAnimalIndex = 1
	self.bodyColor = nil
	self.blossomFlg = false
	self.skillTargetPos = Vector3.zero
	self.skillNOPTime = 0
	self.skillNOPExposureStep = 0
	self.skillNOPExposure = 0
end

function Hero20040:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety == Hero20040_Define.VarietyHost then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 3, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 4, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 5, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 6, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 7, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 1, true)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 3, false)
	elseif self.heroVariety == Hero20040_Define.VarietyCall1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 3, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 4, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 5, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 6, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 7, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 1, true)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 3, false)
	elseif self.heroVariety == Hero20040_Define.VarietyCall2 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 3, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 4, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 5, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 6, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 7, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 1, true)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 3, true)
	elseif self.heroVariety == Hero20040_Define.VarietyCall3 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 3, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 4, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 5, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 6, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 7, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 1, true)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 3, false)
	end
end

function Hero20040:Start()
	AnimalBase.Start(self)
	self.grade1TargetPos:SetVector3(self.scene:GetSceneSkillPointPos(1))

	local nowPos = self:GetPosByWorldPos()

	self.grade1Dir:SetVector3(self.grade1TargetPos)
	self.grade1Dir:Sub(nowPos)
	self.grade1Dir:SetNormalize()
	self:ChangeToMoveForce(self.grade1Dir, 9999)
	self:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
	self:SetMoveSpeed(AnimalBase_Define.MotionWalkSpeed)
	self:SetSkillConditionAll(1)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_20040 then
		if self.characterConfig ~= nil then
			local mat = self.characterConfig:GetOtherMaterial(1)

			if mat ~= nil then
				self:ChangeMaterial(mat)
			end
		end

		self.bodyColor = self:GetMainMaterialColor()

		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	else
		self:SetMoveNoDamage(true)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 2, 0, 0)
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20040:StartBattle()
	AnimalBase.StartBattle(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self:ResetGrade()
			self:AddGrade(true)
			self:AddGrade(true)
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			self:ResetGrade()
			self:AddGrade(true)
			self:AddGrade(true)
		end
	end
end

function Hero20040:Show()
	AnimalBase.Show(self)
end

function Hero20040:Hide()
	AnimalBase.Hide(self)
end

function Hero20040:Dead(isFromSkill, reason, isFinalHit)
	local ret = AnimalBase.Dead(self, isFromSkill, reason, isFinalHit)

	if ret == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false then
		self.skillNOPExposure = 0
		self.skillNOPExposureStep = 3

		self.scene:SetAutoExposureEnable(false)
	end

	return ret
end

function Hero20040:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_20040 then
		local fromAnimal = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromAnimal ~= nil and fromAnimal:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false then
			fromAnimal:SetPosByWorldPos(self.scene:GetSceneSkillPointPos(8), true)
			fromAnimal:Show()
			fromAnimal:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			fromAnimal:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, Hero20040_Define.SkillType.SkillD, 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20040:ExitBorn()
	AnimalBase.ExitBorn(self)
	self:SetMoveThroughAll(false)
end

function Hero20040:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade >= Hero20040_Define.GradeSan then
			self:ResetGrade()
		else
			self:AddGrade(false)
		end
	end
end

function Hero20040:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)

	if self.animalGrade == Hero20040_Define.GradeCall then
		self:SetMoveNoDamage(false)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
		self:SetRebornPosition(self.scene:GetSceneSkillPointPos(1))
		self:SetRebornLook(self.scene:GetSceneSkillPointLook(1))

		self.moveForceEndTime = 0

		self:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
		self:StopMovementImmediately(true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, 6, true)
	elseif self.animalGrade == Hero20040_Define.GradeSan then
		self:SetMoveNoDamage(false)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
	end
end

function Hero20040:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)

	if self.heroVariety == Hero20040_Define.VarietyHost and self.animalGrade == Hero20040_Define.GradeSan then
		self:Show()
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		self:SetEquipmentAllVisible(AnimalBase_Define.VisibleType.Variety, true)
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Variety, true)
	end
end

function Hero20040:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20040:GetGradeThreshold()
	return Hero20040_Define.GradeCall
end

function Hero20040:UpdateMoveState()
	AnimalBase.UpdateMoveState(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_20040 and self.moveStateNow == AnimalBase_Define.MoveStateType.Dead then
		local sub = Hero20040_Define.DeadAlphaChangeSpeed * ControllerMain.GetLogicDeltaTime()

		self.bodyColor.a = Mathf.Clamp(self.bodyColor.a - sub, 0, 1)

		self:ChangeMaterialColor(self.bodyColor)
	end
end

function Hero20040:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20040_Define.SkillType.SkillSP3 and self.skillCombo == 1 and self.animatorTrigger >= 1 and self.animatorTrigger < 2 then
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

function Hero20040:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and self.animalGrade <= Hero20040_Define.GradeForceMove then
		local nowPos = self:GetPosByWorldPos()
		local dis = Vector3.DistanceSquare(nowPos, self.grade1TargetPos)

		if dis < Hero20040_Define.Status1_TargetDistance then
			self:StopMovementImmediately()

			local hostPlayer = self.sceneController:GetHostPlayer()

			if hostPlayer ~= nil and hostPlayer:IsWillDead() == false then
				self:AddGrade(false)
			end
		else
			self.grade1Dir:SetVector3(self.grade1TargetPos)
			self.grade1Dir:Sub(nowPos)
			self.grade1Dir:SetNormalize()
			self:SetMoveForceDir(self.grade1Dir)
		end
	else
		if self.skillIndex == Hero20040_Define.SkillType.SkillSP3 then
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
		elseif self.skillIndex == Hero20040_Define.SkillType.SkillNOP and self.skillCombo == 2 then
			local nowTime = TimeHelper.getNowTime()
			local diffTime = nowTime - self.skillNOPTime

			if diffTime > Hero20040_Define.SkillNOPExposureTime then
				if self.skillNOPExposureStep == 0 then
					self.scene:SetAutoExposureEnable(true)

					self.skillNOPExposure = 1
					self.skillNOPExposureStep = self.skillNOPExposureStep + 1
				elseif self.skillNOPExposureStep == 1 then
					local tmpSpeed = Hero20040_Define.AutoExposureSpeedUp * ControllerMain.GetLogicDeltaTime()

					self.skillNOPExposure = self.skillNOPExposure + tmpSpeed

					if self.skillNOPExposure >= Hero20040_Define.AutoExposureTarget then
						self.skillNOPExposure = Hero20040_Define.AutoExposureTarget
						self.skillNOPExposureStep = self.skillNOPExposureStep + 1

						local targetAnimal = GameAI.GetAttackTarget(self)

						if targetAnimal ~= nil and self.gameController:IsStopAttack() == false then
							targetAnimal.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
							targetAnimal:ChangeToDead(AnimalBase_Define.DeadReason.MustDeath)

							if targetAnimal:IsHost() == true then
								local tmpHostPlayer = self.sceneController:GetSecondaryHostPlayer()

								if tmpHostPlayer ~= nil and tmpHostPlayer:IsDead() == false then
									tmpHostPlayer.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
									tmpHostPlayer:ChangeToDead(AnimalBase_Define.DeadReason.MustDeath)
								end
							end
						end
					end

					self.scene:SetAutoExposureCompensation(self.skillNOPExposure)
				elseif self.skillNOPExposureStep == 2 then
					local tmpSpeed = Hero20040_Define.AutoExposureSpeedDown * ControllerMain.GetLogicDeltaTime()

					self.skillNOPExposure = self.skillNOPExposure - tmpSpeed

					if self.skillNOPExposure <= 1 then
						self.skillNOPExposure = 0

						self.scene:SetAutoExposureEnable(false)

						self.skillNOPExposureStep = self.skillNOPExposureStep + 1
					else
						self.scene:SetAutoExposureCompensation(self.skillNOPExposure)
					end
				end
			end
		end

		if self.bulletSkillNSP2Cnt > 0 then
			local nowTime = TimeHelper.getNowTime()
			local diffTime = nowTime - self.bulletSkillNSP2Time

			if diffTime > Hero20040_Define.BulletSkillNSP2IntervalTime then
				local bulletSkillData = MS_SkillData.GetSkillData(self.heroId, Hero20040_Define.SkillType.SkillNSP2, 1)
				local weaponBox = self:GetWeaponBox(9)
				local startPos = weaponBox.position
				local targetPos = GameAI.GetFootTargetByStraightLine(self, startPos, Hero20040_Define.BulletSkillNSP2RangeMin, Hero20040_Define.BulletSkillNSP2RangeMin, Hero20040_Define.BulletSkillNSP2RangeMax, 999)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, bulletSkillData, nil, startPos, targetPos, self.bulletSkillNSP2SpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:Ready()
						bullet:Start()
					end
				end

				self.bulletSkillNSP2Time = nowTime
				self.bulletSkillNSP2Cnt = self.bulletSkillNSP2Cnt - 1
			end
		end

		if self.bulletSkillNS2Cnt > 0 then
			local bulletTarget = GameAI.GetAttackTarget(self)

			if bulletTarget ~= nil then
				local nowTime = TimeHelper.getNowTime()
				local diffTime = nowTime - self.bulletSkillNS2Time

				if diffTime > Hero20040_Define.BulletSkillNS2IntervalTime then
					local bulletSkillData = MS_SkillData.GetSkillData(self.heroId, Hero20040_Define.SkillType.SkillNS2, 1)
					local weaponBox = self:GetWeaponBox(6)
					local startPos = weaponBox.position
					local shootDir = self:GetForward()
					local diffAngle = 360 * (Hero20040_Define.BulletSkillNS2Num - self.bulletSkillNS2Cnt) / Hero20040_Define.BulletSkillNS2Num
					local rot = Quaternion.AngleAxis(diffAngle, shootDir)
					local tmpUp = Vector3.up

					tmpUp:MulQuat(rot)

					local targetPos = shootDir + tmpUp

					targetPos:SetNormalize()
					targetPos:Mul(Hero20040_Define.BulletSkillNS2RangeMax)
					targetPos:Add(startPos)

					if self.controllerBullet ~= nil then
						local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, bulletSkillData, nil, startPos, targetPos, self.bulletSkillNS2Vec3, Vector3.s_zero)
						local bullet = self.controllerBullet:GetBullet(bulletIndex)

						if bullet ~= nil then
							bullet:SetSpeedAngle(Hero20040_Define.BulletSkillNS2AngleSpeed)
							bullet:SetLifeTime(Hero20040_Define.BulletSkillNS2LifeTime)
							bullet:Ready()
							bullet:SetSkillTargetAnimal(bulletTarget, false)
							bullet:Start()
						end
					end

					self.bulletSkillNS2Time = nowTime
					self.bulletSkillNS2Cnt = self.bulletSkillNS2Cnt - 1

					if self.bulletSkillNS2Cnt <= 0 then
						self:SetBlossom(false)
					end

					targetPos = nil
					rot = nil
					tmpUp = nil
				end
			end
		end
	end
end

function Hero20040:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20040_Define.SkillType.SkillO then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20040_Define.TrickId_SkillO, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillH1 then
		-- block empty
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillHP then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20040_Define.TrickId_SkillHP, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillS1 then
		if trigger == 1 then
			self:SetBlossom(true)
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillNS2 then
		if trigger > 0 then
			self.bulletSkillNS2Cnt = Hero20040_Define.BulletSkillNS2Num
			self.bulletSkillNS2Time = 0
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillNSP2 then
		if trigger > 0 then
			self.bulletSkillNSP2Cnt = Hero20040_Define.BulletSkillNSP2Num
			self.bulletSkillNSP2Time = 0

			self:PlaySkillEffect(true)
			self:SetBlossom(false)
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillOP then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local weaponBox = self:GetWeaponBox(8)

				self.weaponSwordPos:SetVector3(weaponBox.position)
				self.scene:OpenTrick(Hero20040_Define.TrickId_SkillOP, weaponBox.position, weaponBox.rotation)
				self.scene:OpenTrick(Hero20040_Define.TrickId_SkillOP2, weaponBox.position, weaponBox.rotation)
				self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20040_Define.WeaponId_Sword, false)
			end
		elseif self.skillCombo == 2 and trigger == 1 then
			self:SetSkillConditionAll(3)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillSP3 then
		if self.skillCombo > 1 and trigger == 1 then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
				local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())

				targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, false)

				if self.skillCombo == 3 then
					targetAnimal:SetMoveFix(false)
					targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
					self:SetSkillTarget(nil)
				end
			end
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillOOO then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self.scene:StopTrick(Hero20040_Define.TrickId_SkillOP)
				self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20040_Define.WeaponId_Sword, true)
			end
		elseif self.skillCombo == 4 and trigger == 1 then
			self:SetSkillConditionAll(1)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillNHP then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20040_Define.TrickId_SkillNHP, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillD and self.skillCombo == 1 and trigger == 1 and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false then
		self.sceneController:UnlockPlayer(self)

		if self.gameController ~= nil then
			local pointIndex = MathHelper.getRandom(Hero20040_Define.CallAnimal_SkillPointStart, Hero20040_Define.CallAnimal_SkillPointEnd)
			local skillPointPos = self.scene:GetSceneSkillPointPos(pointIndex)
			local skillPointLook = self.scene:GetSceneSkillPointLook(pointIndex)
			local tmpCallList

			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
				local monsterData = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self:GetStoryMonsterId())

				if monsterData ~= nil then
					tmpCallList = monsterData.CallMonsterIdList
				end
			else
				local heroData = MS_HeroData.GetHero(self:GetHeroId())

				if heroData ~= nil then
					tmpCallList = heroData.CallHeroIdList
				end
			end

			if tmpCallList ~= nil and #tmpCallList >= self.callAnimalIndex then
				local callId = tonumber(tmpCallList[self.callAnimalIndex])

				if callId > 0 then
					local callPlayer = self.gameController:CallAnimal(self, callId, true)

					if callPlayer ~= nil then
						callPlayer:SetMoveThroughAll(true)
						callPlayer:SetPosByWorldPos(skillPointPos, true)
						callPlayer:LookAt(skillPointLook, true)
						callPlayer:SetRebornPosition(self:GetRebornPosition())
						callPlayer:SetRebornLook(self:GetRebornLook())

						if self.isHost == true and self.isHostBack == false then
							self:SetHostBack(true)
							callPlayer:SetHostBack(false)
							self.sceneController:ChangeHostPlayer(callPlayer)
						end

						callPlayer:Start()

						self.callAnimalIndex = self.callAnimalIndex % #tmpCallList + 1
					end
				end
			end
		end
	end
end

function Hero20040:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20040:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20040:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20040_Define.SkillType.SkillSP3 then
		if self.skillCombo == 1 then
			self:SetSkillTarget(nil)
		elseif self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillD or self.skillIndex == Hero20040_Define.SkillType.SkillND then
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		self:SetMoveNoWeakness(true)
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillDP3 then
		if self.skillCombo == 2 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		end

		self:SetMoveNoWeakness(true)
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillOOO and self.skillCombo == 1 then
		self.scene:StopReadyTrick(Hero20040_Define.TrickId_SkillOP2)
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillNOP and self.skillCombo == 1 then
		self.skillNOPTime = TimeHelper.getNowTime()
		self.skillNOPExposureStep = 0

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
		self.animalValue:SetHpToPercent(Hero20040_Define.SkillNOPHpPer)
	end
end

function Hero20040:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20040_Define.SkillType.SkillSP3 and skillIndexNext ~= Hero20040_Define.SkillType.SkillSP3 then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end

		self:SetSkillTarget(nil)
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillD and skillIndexNext ~= Hero20040_Define.SkillType.SkillD then
		if self:IsWillDead() == false then
			self:Hide()
		end

		self:SetMoveNoWeakness(false)
		self:ClearStatusAllDebuffer()
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillND and skillIndexNext ~= Hero20040_Define.SkillType.SkillND then
		self:SetMoveNoWeakness(false)
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillDP3 then
		if skillIndexNext == self.skillIndex and self.skillCombo == 1 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)

			if DebugMonsterAISkill == true then
				self:SetPosByWorldPos(self:GetPosByWorldPos(), true)
			else
				self:SetPosByWorldPos(self.skillTargetPos, true)
			end

			if self.weaponSwordPos ~= Vector3.zero then
				local lookDir = self.weaponSwordPos - self.skillTargetPos

				lookDir.y = 0

				self:LookAt(lookDir, true)
			end
		elseif self.skillCombo == 2 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		end

		if skillIndexNext ~= Hero20040_Define.SkillType.SkillD then
			self:SetMoveNoWeakness(false)
		end
	elseif self.skillIndex == Hero20040_Define.SkillType.SkillHP then
		if skillIndexNext ~= Hero20040_Define.SkillType.SkillHP then
			self.scene:StopTrick(Hero20040_Define.TrickId_SkillHP)
		end
	elseif (self.skillIndex == Hero20040_Define.SkillType.SkillNLP or self.skillIndex == Hero20040_Define.SkillType.SkillNOP) and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20040:SetSkillTargetPos(pos)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local centerPos = self.scene:GetSceneSkillPointPos(8)

		if centerPos ~= nil then
			pos.x = Mathf.Clamp(pos.x, centerPos.x - 12, centerPos.x + 12)
			pos.z = Mathf.Clamp(pos.z, centerPos.z - 11, centerPos.z + 11)
		end
	end

	self.skillTargetPos:SetVector3(pos)
end

function Hero20040:SetBlossom(flg)
	self.blossomFlg = flg

	if self.blossomFlg == true then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(6), "vfx_20040_self_1")
	else
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero20040:IsBlossom()
	return self.blossomFlg
end

function Hero20040:ExitBattle()
	self.scene:StopTrick(Hero20040_Define.TrickId_SkillHP)
	self.scene:StopTrick(Hero20040_Define.TrickId_SkillOP)
	self.scene:StopTrick(Hero20040_Define.TrickId_SkillOP2)

	self.bulletSkillNSP2Cnt = 0
	self.bulletSkillNSP2Time = 0
	self.bulletSkillNS2Cnt = 0
	self.bulletSkillNS2Time = 0
	self.skillNOPExposure = 0
	self.skillNOPExposureStep = 3

	self.scene:SetAutoExposureEnable(false)
	AnimalBase.ExitBattle(self)
end

function Hero20040:GetShootDistanceMax()
	return Hero20040_Define.BulletRangeMax
end

function Hero20040:GetCaptureDistanceAndHeight()
	return Hero20040_Define.SkillCaptureOffset, Hero20040_Define.SkillCaptureDistance, Hero20040_Define.SkillCaptureHeight
end

function Hero20040:GetSkillNOPExposureStep()
	return self.skillNOPExposureStep
end

function Hero20040:GetWeaponSwordPos()
	return self.weaponSwordPos
end

function Hero20040:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20040:Exit()
	self.bulletSkillH1SpeedVec3 = nil
	self.bulletSkillNS2Vec3 = nil
	self.bulletSkillNSP2SpeedVec3 = nil
	self.grade1TargetPos = nil
	self.grade1Dir = nil
	self.weaponSwordPos = nil
	self.skillTargetPos = nil

	AnimalBase.Exit(self)
end

return Hero20040
