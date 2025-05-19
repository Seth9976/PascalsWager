-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10006.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10006_Define")

Hero10006 = class("Hero10006", AnimalBase)

function Hero10006:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSkillNL1SpeedVec3 = Vector3.zero
	self.bulletSkillNL1SpeedVec3.z = Hero10006_Define.BulletSkillNL1Speed
	self.bulletSkillLP2SpeedVec3 = Vector3.zero
	self.bulletSkillLP2SpeedVec3.z = Hero10006_Define.BulletSkillLP2Speed
	self.bulletSkillHP2SpeedVec3 = Vector3.zero
	self.bulletSkillHP2SpeedVec3.z = Hero10006_Define.BulletSkillHP2Speed
	self.bulletSkillHP2AccVec3 = Vector3.zero
	self.bulletSkillHP2AccVec3.z = Hero10006_Define.BulletSkillHP2Acc
	self.bulletSkillS2SpeedVec3 = Vector3.zero
	self.bulletSkillS2SpeedVec3.z = Hero10006_Define.BulletSkillS2Speed
	self.bulletSkillS2Dir = Vector3.forward
	self.bulletSkillNLP3SpeedVec3 = Vector3.zero
	self.bulletSkillNLP3SpeedVec3.z = Hero10006_Define.BulletSkillNLP3Speed
	self.skillCloneTargetPos = Vector3.zero
	self.skillTargetPos = {}

	for i = 1, Hero10006_Define.TargetPosMax do
		self.skillTargetPos[i] = Vector3.zero
	end

	self.sanHeroList = {}
	self.sanHeroIndex = 0
	self.sanHeroAnimalId = 0
	self.cloneList = {}
	self.cloneDeadCnt = 0
	self.cloneSkillStartTime = 0
	self.callCrowId = 0
	self.skillExposureTime = 0
	self.skillExposureStep = 0
	self.hostClone = false
	self.hitTimes = 0
end

function Hero10006:Start()
	AnimalBase.Start(self)

	for i = 1, Hero10006_Define.TargetPosMax do
		self.skillTargetPos[i]:SetVector3(self.scene:GetSceneSkillPointPos(i))
	end

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and self.heroVariety > 1 and self.characterConfig ~= nil then
		local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

		if mat ~= nil then
			self:ChangeMaterial(mat)
		end
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false then
		if FS_UserData.story:IsQuestComplete(Hero10006_Define.QuestId_10002) == false then
			table.insert(self.sanHeroList, Hero10006_Define.AnimalId_10002_1)
		end

		if FS_UserData.story:IsQuestComplete(Hero10006_Define.QuestId_10003) == false then
			table.insert(self.sanHeroList, Hero10006_Define.AnimalId_10003_1)
		end

		if FS_UserData.story:IsQuestComplete(Hero10006_Define.QuestId_10004) == false then
			table.insert(self.sanHeroList, Hero10006_Define.AnimalId_10004_1)
		end
	else
		table.insert(self.sanHeroList, Hero10006_Define.AnimalId_10002_1)
		table.insert(self.sanHeroList, Hero10006_Define.AnimalId_10003_1)
		table.insert(self.sanHeroList, Hero10006_Define.AnimalId_10004_1)
	end

	self.sanHeroList = table.shuffle(self.sanHeroList)

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero10006:IsCallHeroSanEnable()
	if #self.sanHeroList > 0 and self.sanHeroIndex < #self.sanHeroList then
		return true
	end

	return false
end

function Hero10006:Show()
	AnimalBase.Show(self)

	if self.animalGrade >= Hero10006_Define.GradeNormal then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end
end

function Hero10006:Hide()
	AnimalBase.Hide(self)
end

function Hero10006:Dead(isFromSkill, reason, isFinalHit)
	local ret = AnimalBase.Dead(self, isFromSkill, reason, isFinalHit)

	if ret == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false then
		self.scene:RecoveryAutoExposure()
	end

	return ret
end

function Hero10006:WillDead(attackVPlayer, skillData)
	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and self:GetGrade() < Hero10006_Define.GradeSan then
		self.animalValue:SetHpToPercent(0.001)
	end

	if self:IsWillDead() == true then
		AnimalBase.WillDead(self, attackVPlayer, skillData)
	elseif self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false then
		local toMovie = false

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.gameController:IsHaveGradeUpMovie(self) == true then
			toMovie = self.gameController:BossGradeUpReady(self)
		end

		if toMovie == false then
			self:AddGrade(false)
		end
	end
end

function Hero10006:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade >= Hero10006_Define.GradeSan then
			self:ResetGrade()
		else
			self:AddGrade(false)
		end
	end
end

function Hero10006:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)

	if self.animalGrade >= Hero10006_Define.GradeNormal then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end

	self.animalValue:SetPropertyToMax(MS_HeroData.Property.Hp)

	if self.animalGrade == Hero10006_Define.GradeNormal then
		self.sanHeroIndex = 0

		if self:IsCallHeroSanEnable() == true then
			local max = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hp = max * Hero10006_Define.HpLockPercent[self.sanHeroIndex + 1]

			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
		else
			self.sceneController:EndSpecialChangeConfig(true)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
		end
	elseif self.animalGrade >= Hero10006_Define.GradeSan then
		self.sceneController:EndSpecialChangeConfig(true)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local bossMode = self.gameController:IsBossMode()
			local bossId = self.gameController:GetBossId()

			if self.isHost == false and bossMode == true and bossId > 0 and bossId == self.storyMonsterId and self.heroExtData ~= nil and self.heroExtData.BossFinal ~= nil and self.heroExtData.BossFinal > 0 then
				self.sceneController:BossGradeUpConfig()
			end
		end
	else
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
	end
end

function Hero10006:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)

	if self.animalGrade >= Hero10006_Define.GradeNormal then
		self:SetBodyPartsVisible(AnimalBase_Define.VisibleType.Variety, false)
		self:Show()
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
	end
end

function Hero10006:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero10006:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade >= Hero10006_Define.GradeSan then
		self:CreateSelfEffectLoop("self_1", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root), "vfx_10006_self_4")
	elseif self.animalGrade >= Hero10006_Define.GradeNormal then
		self:ClearSelfEffectLoop("self_1")
	else
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero10006:ClearAllEffect()
	self:ClearSelfEffectLoop("self_1")
end

function Hero10006:GetGradeThreshold()
	return Hero10006_Define.GradeSan + 1
end

function Hero10006:OnHit(isFirst, attackerData)
	AnimalBase.OnHit(self, isFirst, attackerData)

	if isFirst == true and attackerData ~= nil and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 and self:IsHit() == true then
		self:SetMoveMuteki(true)

		local callFromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if callFromPlayer ~= nil then
			local attackVPlayer = attackerData:GetAttackVirtualPlayer()
			local hitType = attackerData:GetHitType()
			local skillDir = attackerData:GetSkillDir()
			local skillData = attackerData:GetSkillData()
			local attFromPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

			if attFromPlayer ~= nil then
				callFromPlayer:CallNotifyHostHit(attFromPlayer, hitType, skillData, skillDir)
			end
		end
	end

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and (self:IsHitByType(AnimalBase_Define.HitType.Light) == true or self:IsHitByType(AnimalBase_Define.HitType.Heavy) == true) then
		self.hitTimes = self.hitTimes + 1
	end
end

function Hero10006:OnHitExit()
	AnimalBase.OnHitExit(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
		self:ChangeToNightmareEnd()
	end

	if self.hitTimes >= Hero10006_Define.MaxHitTimes then
		self.hitTimes = 0
	end
end

function Hero10006:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifyCloneDead()
		end
	end
end

function Hero10006:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == Hero10006_Define.SkillType.SkillL2 and self.skillCombo == 1 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero10006:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
		if self:IsSkillingSkill() == true then
			if self.skillIndex == Hero10006_Define.SkillType.SkillHostDash or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDash then
				if self.skillCombo <= 2 then
					local nowTime = TimeHelper.getNowTime()

					if nowTime >= self.cloneSkillStartTime + Hero10006_Define.SkillCloneDashStartTime then
						self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, 3, MS_SkillData.PressType.PressDown, 0)
					end

					local tmpDir = self.skillCloneTargetPos - self:GetPosByWorldPos()

					tmpDir.y = 0

					if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
						tmpDir:SetNormalize()
						self:LookAt(tmpDir, true)
					end

					tmpDir = nil
				elseif self.skillCombo == 4 then
					local nowTime = TimeHelper.getNowTime()

					if nowTime >= self.cloneSkillStartTime + Hero10006_Define.SkillCloneDashTime and self.callFromAnimalId > 0 then
						local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

						if fromPlayer ~= nil then
							fromPlayer:CallNotifyHostStopSkill()
						end
					end
				end
			elseif self.skillIndex == Hero10006_Define.SkillType.SkillHostDrag or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDrag then
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal ~= nil then
					local nowPos = self:GetPosByWorldPos()
					local dis = Vector3.Distance(self.skillCloneTargetPos, nowPos)

					if self.skillCombo <= 2 then
						if dis <= Hero10006_Define.SkillCloneDragRange then
							self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, 3, MS_SkillData.PressType.PressDown, 0)
						else
							local tmpDir = self.skillCloneTargetPos - self:GetPosByWorldPos()

							tmpDir.y = 0

							if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
								tmpDir:SetNormalize()
								self:LookAt(tmpDir, true)
							end

							tmpDir = nil
						end
					elseif self.skillCombo == 3 and self.animatorTrigger >= 1 then
						local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)

						if targetAnimal:IsHitByType(hitType) == true then
							targetAnimal:SetPosByWorldPos(self.skillCloneTargetPos, true)
						end
					end

					targetAnimal:ChangeMoveCageRange(Mathf.Max(0, dis - self:GetRadius() - targetAnimal:GetRadius()))
				end
			end
		end
	elseif self:IsSkillingSkill() == true and (self.skillIndex == Hero10006_Define.SkillType.SkillDP3 or self.skillIndex == Hero10006_Define.SkillType.SkillNDP3) and self.skillCombo == 3 then
		local nowTime = TimeHelper.getNowTime()
		local diffTime = nowTime - self.skillExposureTime

		if diffTime > Hero10006_Define.SkillExposureTime then
			self.scene:StartAutoExposure(Hero10006_Define.AutoExposureSpeedUp)
		end
	end
end

function Hero10006:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero10006_Define.SkillType.SkillOP2 then
		if self.skillCombo == 1 and self.animalGrade == Hero10006_Define.GradeNormal and self:IsCallHeroSanEnable() == true then
			local retPlayer = self:CallAnimalFromAI(self.sanHeroList[self.sanHeroIndex + 1], self.skillTargetPos[1], false)

			if retPlayer ~= nil then
				self.sanHeroIndex = self.sanHeroIndex + 1
				self.sanHeroAnimalId = retPlayer:GetAnimalId()

				self.sceneController:StartSpecialChangeConfig(Hero10006_Define.SpecialFogChangeSpeed)
				self:SetMoveNoDamage(false)
				self:Hide()

				if self:IsCallHeroSanEnable() == true then
					local max = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
					local hp = max * Hero10006_Define.HpLockPercent[self.sanHeroIndex + 1]

					self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
				else
					self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
				end
			end
		end

		if self.skillIndex ~= skillIndexNext then
			self:SetMoveNoDamage(false)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNH2 then
		if skillIndexNext == self.skillIndex and (self.skillCombo == 1 or self.skillCombo == 2 or self.skillCombo == 4) then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:SetMoveMuteki(true)
			self:ClearAllEffect()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillDP3 or self.skillIndex == Hero10006_Define.SkillType.SkillNDP3 then
		local createFlg = false

		if self.skillCombo == 3 and self.animatorEnd == true then
			if self.skillIndex == Hero10006_Define.SkillType.SkillDP3 then
				self:CreateClone(Hero10006_Define.SkillType.SkillHostDash, 0)

				createFlg = true
			elseif self.skillIndex == Hero10006_Define.SkillType.SkillNDP3 then
				self:CreateClone(Hero10006_Define.SkillType.SkillHostDrag, 0)

				createFlg = true
			end

			if createFlg == true then
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal ~= nil and targetAnimal:IsDead() == false then
					local centerPos = self.scene:GetSceneSkillPointPos(8)
					local centerLook = self.scene:GetSceneSkillPointLook(8)

					targetAnimal:SetPosByWorldPos(centerPos, true)
					targetAnimal:LookAt(centerLook, true)

					if targetAnimal:IsHost() == true then
						self.cameraScene:ResetFollowingBase()
					end

					SystemHelper.LogTest("=====SetMoveNoDamage==false===111====animalId=" .. self.animalId)
					self:SetMoveNoDamage(false)
					self:Hide()
				end
			end
		end

		if self.skillIndex ~= skillIndexNext then
			SystemHelper.LogTest("=====SetMoveNoDamage==false===222====animalId=" .. self.animalId)
			self:SetMoveNoDamage(false)
			self.scene:RecoveryAutoExposure()
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self.cameraScene:LockSkillingPlayerForce(nil)
			self:SetLockDisable(false)

			if createFlg == false then
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal ~= nil then
					targetAnimal:SetMoveCage(false, Vector3.s_zero, 0)
				end

				if self.skillIndex == Hero10006_Define.SkillType.SkillNDP3 then
					self.scene:StopTrick(Hero10006_Define.TrickId_SkillDragWall)
				end
			end
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillHostDrag and skillIndexNext ~= Hero10006_Define.SkillType.SkillHostDrag or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDrag and skillIndexNext ~= Hero10006_Define.SkillType.SkillCloneDrag then
		if self.skillCombo == 3 and self.animatorEnd == true then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil and targetAnimal:IsDead() == false then
				local pos = targetAnimal:GetPosByWorldPos():Clone()

				pos.y = -2.5

				targetAnimal:SetPosByWorldPos(pos, true)
				targetAnimal:SetMoveCage(false, Vector3.s_zero, 0)
				targetAnimal:ChangeToDead(AnimalBase_Define.DeadReason.Drop)

				pos = nil
			end

			self:SkillDeadReady(AnimalBase_Define.DeadReason.Skill)
			self.scene:StopTrick(Hero10006_Define.TrickId_SkillDragWall)
		end

		if self.skillIndex ~= skillIndexNext then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				targetAnimal:SetMoveCage(false, Vector3.s_zero, 0)
			end

			self.scene:StopTrick(Hero10006_Define.TrickId_SkillDragWall)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillSP2 or self.skillIndex == Hero10006_Define.SkillType.SkillNLP3 then
		if self.skillCombo == 2 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.CounterAttack then
		if self.skillCombo == 1 then
			local targetAnimal = GameAI.GetAttackTarget(self)

			if targetAnimal ~= nil then
				local lookDir = targetAnimal:GetPosByWorldPos() - self:GetPosByWorldPos()

				lookDir.y = 0

				self:LookAt(lookDir, true)
			end

			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:ShowGradeEffect()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Backstab then
		self.cameraScene:LockSkillingPlayerForce(nil)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero10006:CreateClone(skillIndex, trickId)
	local targetAnimal = GameAI.GetSkillTargetByPos(self, self:GetPosByWorldPos())

	if targetAnimal == nil then
		SystemHelper.Log("==========CreateClone error ! no target !!!")

		return
	end

	if targetAnimal ~= nil then
		self.cloneList = {}

		local centerPos = self.scene:GetSceneSkillPointPos(8)
		local forward = targetAnimal:GetForward():Clone()
		local rot = Quaternion.Euler(0, 360 / Hero10006_Define.CloneMax, 0)
		local tmpPos = Vector3.zero

		for i = 1, Hero10006_Define.CloneMax do
			if i > 1 then
				forward:MulQuat(rot)
			end

			forward:SetNormalize()
			tmpPos:SetVector3(forward)
			tmpPos:Mul(Hero10006_Define.CloneRadius)
			tmpPos:Add(centerPos)

			local callPlayer = self:CallAnimalClone(targetAnimal, i, tmpPos)

			if callPlayer ~= nil then
				if i == 1 then
					callPlayer:SetHostClone(true)
					callPlayer:AddSkillNextWaitTime(skillIndex, Hero10006_Define.SkillCloneStartShowTime)
				else
					callPlayer:SetHostClone(false)
					callPlayer:AddSkillNextWaitTime(skillIndex + 1, Hero10006_Define.SkillCloneStartShowTime)
				end

				callPlayer:SetSkillTarget(targetAnimal)
				XCollider.SetRouteColliderThrough(callPlayer:GetAnimalId(), true)

				self.cloneList[i] = callPlayer:GetAnimalId()

				XCollider.AddRouteColliderIgnore(callPlayer:GetAnimalId(), targetAnimal:GetAnimalId())
				callPlayer:SetSkillCloneTargetPos(centerPos)
			end
		end

		self.cloneDeadCnt = 0

		self:SetSkillTarget(targetAnimal)

		if skillIndex == Hero10006_Define.SkillType.SkillHostDrag then
			targetAnimal:SetMoveCage(true, centerPos, Mathf.Max(0, Hero10006_Define.CloneRadius - self:GetRadius() - targetAnimal:GetRadius()))
			self.scene:OpenTrick(Hero10006_Define.TrickId_SkillDragWall, centerPos)
		end

		forward = nil
		tmpPos = nil
		centerPos = nil
		rot = nil
	end
end

function Hero10006:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero10006:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero10006_Define.SkillType.SkillL1 then
		if self.skillCombo == 3 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillD1 then
		if self.skillCombo == 2 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillShow then
		if self.skillCombo == 1 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:ShowGradeEffect()
			self:SetPosByWorldPos(self.skillTargetPos[1], true)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillOP2 then
		if self.skillCombo == 1 then
			self:SetMoveNoDamage(true)
			self:ClearCrow()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillL2 then
		if self.skillCombo == 3 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNH2 then
		if self.skillCombo == 2 or self.skillCombo == 4 or self.skillCombo == 6 then
			self:SetPosByWorldPos(self.skillTargetPos[1], true)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:SetMoveMuteki(false)
			self:ShowGradeEffect()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNOP3 then
		local target = GameAI.GetAttackTarget(self)

		if target ~= nil and target:IsDead() == false then
			self.scene:OpenTrick(Hero10006_Define.TrickId_SkillNOP3, target:GetPosByWorldPos(), target:GetRotation())
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillDP3 or self.skillIndex == Hero10006_Define.SkillType.SkillNDP3 then
		if self.skillCombo == 1 then
			SystemHelper.LogTest("=====SetMoveNoDamage==true===111====animalId=" .. self.animalId)
			self:SetMoveNoDamage(true)
			self:ClearCrow()
		elseif self.skillCombo == 2 then
			self:SetPosByWorldPos(self.scene:GetSceneSkillPointPos(9), true)
			self:LookAt(self.scene:GetSceneSkillPointLook(9), true)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:KeepLockCamera(self.skillIndex, self.skillCombo)
			self:SetLockDisable(true)
		elseif self.skillCombo == 3 then
			self.skillExposureTime = TimeHelper.getNowTime()
			self.skillExposureStep = 0

			local targetAnimal = GameAI.GetSkillTargetByPos(self, self:GetPosByWorldPos())

			self:SetSkillTarget(targetAnimal)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillHostDash or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDash then
		if self.skillCombo == 1 then
			self.cloneSkillStartTime = TimeHelper.getNowTime()

			self:SetLockId(-1)
		elseif self.skillCombo == 4 then
			self.cloneSkillStartTime = TimeHelper.getNowTime()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Backstab and self.boss > 0 and self.isHost == false then
		self.cameraScene:LockSkillingPlayerForce(self)
	end
end

function Hero10006:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero10006_Define.SkillType.SkillL1 then
		if self.skillCombo == 2 and trigger > 0 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ClearAllEffect()
			self:SetPosByWorldPos(self.skillTargetPos[1], true)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNL1 or self.skillIndex == Hero10006_Define.SkillType.SkillNL2 then
		if trigger > 0 then
			local weaponBox = self:GetWeaponBox(9)
			local startPos = weaponBox.position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10006_Define.BulletRangeMax, Hero10006_Define.BulletRangeMax, Hero10006_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSkillNL1SpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillH1 then
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20021, self.skillTargetPos[1], true)
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNH1 then
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20012, self.skillTargetPos[1], true)
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillO1 then
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20011, self.skillTargetPos[1], true)
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNO1 then
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20029_1, self.skillTargetPos[1], true)
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20029_2, self.skillTargetPos[2], true)
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillS1 then
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20043, self.skillTargetPos[1], true)
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNS1 then
		self:CallAnimalFromAI(Hero10006_Define.AnimalId_20024, self.skillTargetPos[1], true)
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillO2 then
		if self.callCrowId <= 0 then
			local retPlayer = self:CallAnimalFromAI(Hero10006_Define.AnimalId_90007_1, self.skillTargetPos[1], false)

			if retPlayer ~= nil then
				self.callCrowId = retPlayer:GetAnimalId()

				retPlayer:SetMoveThroughAll(true)
				retPlayer:SetSkillConditionAll(1)
			end
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNO2 then
		if self.callCrowId <= 0 then
			local retPlayer = self:CallAnimalFromAI(Hero10006_Define.AnimalId_90007_2, self.skillTargetPos[1], false)

			if retPlayer ~= nil then
				self.callCrowId = retPlayer:GetAnimalId()

				retPlayer:SetSkillConditionAll(2)
			end
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillD1 then
		if self.skillCombo == 1 and trigger == 1 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ClearAllEffect()
			self:SetPosByWorldPos(self.skillTargetPos[1], true)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNS2 then
		if self.skillCombo == 1 and trigger == 1 then
			local target = GameAI.GetAttackTarget(self)

			if target ~= nil and target:IsDead() == false then
				self.scene:OpenTrick(Hero10006_Define.TrickId_SkillNS2, target:GetPosByWorldPos(), target:GetRotation())
				self.scene:OpenDelayTrick(Hero10006_Define.TrickId_SkillNS2_2, Hero10006_Define.TrickId_SkillNS2_2_StartTime)
				self.scene:SetRelativeTrick(Hero10006_Define.TrickId_SkillNS2_2, Hero10006_Define.TrickId_SkillNS2)
			end
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.CounterAttack then
		if self.skillCombo == 1 and trigger == 3 then
			self.sceneController:UnlockPlayer(self)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ClearAllEffect()
			self:SetPosByWorldPos(self.skillTargetPos[1], true)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillL2 then
		if self.skillCombo == 2 and trigger == 1 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ClearAllEffect()
			self:SetPosByWorldPos(self.skillTargetPos[1], true)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillLP2 then
		if trigger > 0 then
			local weaponBox = self:GetWeaponBox(9)
			local startPos = weaponBox.position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10006_Define.BulletRangeMax, Hero10006_Define.BulletRangeMax, Hero10006_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSkillLP2SpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetThroughBody(true)
					bullet:Ready()
					bullet:Start()
				end
			end

			targetPos = nil
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillLP3 then
		if trigger > 0 then
			local skillTarget = GameAI.GetAttackTarget(self)

			if skillTarget ~= nil then
				local weaponBox = self:GetWeaponBox(9)
				local startPos = weaponBox.position
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10006_Define.BulletRangeMax, Hero10006_Define.BulletRangeMax, Hero10006_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLineMultiply, self, skillData, nil, startPos, targetPos, self.bulletSkillLP2SpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:SetThroughBody(true)
						bullet:SetSkillTargetAnimal(skillTarget)
						bullet:SetReboundTimes(Hero10006_Define.BulletSkillLP3ReboundTimes)
						bullet:Ready()
						bullet:Start()
					end
				end

				targetPos = nil
			end
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillHP2 or self.skillIndex == Hero10006_Define.SkillType.SkillHP3 then
		if trigger == 1 then
			local weaponBox = self:GetWeaponBox(9)
			local startPos = weaponBox.position
			local targetPos = GameAI.GetShootTargetByRot(startPos, self:GetRotation(), Hero10006_Define.BulletRangeMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSkillHP2SpeedVec3, self.bulletSkillHP2AccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetThroughBody(true)
					bullet:SetThroughObstacle(BulletBase.ThrowObstacle.Ground)
					bullet:SetSpeedY(Hero10006_Define.BulletSkillHP2SpeedY, Hero10006_Define.BulletSkillHP2AccY, Hero10006_Define.BulletSkillHP2Height, 999)
					bullet:Ready()
					bullet:Start()
				end
			end

			targetPos = nil
		elseif trigger > 1 then
			local weaponBox = self:GetWeaponBox(9)
			local startPos = weaponBox.position
			local rot1 = Quaternion.Euler(0, Hero10006_Define.BulletSkillHP2Angle * (trigger - 1), 0)

			rot1:MulQuat(self:GetRotation())

			local targetPos1 = GameAI.GetShootTargetByRot(startPos, rot1, Hero10006_Define.BulletRangeMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos1, self.bulletSkillHP2SpeedVec3, self.bulletSkillHP2AccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetThroughBody(true)
					bullet:SetThroughObstacle(BulletBase.ThrowObstacle.Ground)
					bullet:SetSpeedY(Hero10006_Define.BulletSkillHP2SpeedY, Hero10006_Define.BulletSkillHP2AccY, Hero10006_Define.BulletSkillHP2Height, 999)
					bullet:Ready()
					bullet:Start()
				end
			end

			local rot2 = Quaternion.Euler(0, -Hero10006_Define.BulletSkillHP2Angle * (trigger - 1), 0)

			rot2:MulQuat(self:GetRotation())

			local targetPos2 = GameAI.GetShootTargetByRot(startPos, rot2, Hero10006_Define.BulletRangeMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos2, self.bulletSkillHP2SpeedVec3, self.bulletSkillHP2AccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetThroughBody(true)
					bullet:SetThroughObstacle(BulletBase.ThrowObstacle.Ground)
					bullet:SetSpeedY(Hero10006_Define.BulletSkillHP2SpeedY, Hero10006_Define.BulletSkillHP2AccY, Hero10006_Define.BulletSkillHP2Height, 999)
					bullet:Ready()
					bullet:Start()
				end
			end

			targetPos1 = nil
			targetPos2 = nil
			rot1 = nil
			rot2 = nil
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillS2 then
		if trigger > 0 and trigger <= #Hero10006_Define.BulletSkillS2AngleList then
			local weaponBox = self:GetWeaponBox(9)
			local startPos = weaponBox.position

			self.bulletSkillS2Dir:SetVector3(self:GetForward())

			self.bulletSkillS2Dir.y = Hero10006_Define.BulletSkillS2Height

			local rot = Quaternion.Euler(0, Hero10006_Define.BulletSkillS2AngleList[trigger], 0)

			self.bulletSkillS2Dir:MulQuat(rot)
			self.bulletSkillS2Dir:SetNormalize()
			self.bulletSkillS2Dir:Mul(Hero10006_Define.BulletRangeMax)
			self.bulletSkillS2Dir:Add(startPos)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, self.bulletSkillS2Dir, self.bulletSkillS2SpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end

			rot = nil
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNHP2 then
		local weaponBox = self:GetWeaponBox(9)

		self.scene:OpenTrick(Hero10006_Define.TrickId_SkillNHP2, weaponBox.position, self:GetRotation())
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillNLP3 then
		if self.skillCombo == 2 and trigger > 0 then
			local weaponBox = self:GetWeaponBox(9)
			local startPos = weaponBox.position
			local targetPos = GameAI.GetShootTargetByRot(startPos, self:GetRotation(), Hero10006_Define.BulletRangeMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSkillNLP3SpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end

			targetPos = nil
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillOP3 then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero10006_Define.TrickId_SkillOP3)
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillDP3 or self.skillIndex == Hero10006_Define.SkillType.SkillNDP3 then
		if self.skillCombo == 1 and trigger == 1 then
			self.sceneController:UnlockPlayer(self)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ClearAllEffect()
		end
	elseif self.skillIndex == Hero10006_Define.SkillType.SkillHostDash or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDash then
		if self.skillCombo == 5 and trigger == 1 then
			self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
		end
	elseif (self.skillIndex == Hero10006_Define.SkillType.SkillHostDrag or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDrag) and self.skillCombo == 3 and trigger == 1 then
		local targetAnimal = self:GetSkillTarget()
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
		local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)

		if targetAnimal ~= nil and targetAnimal:IsHitByType(hitType) == false then
			local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())
			local ret = targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, true)

			if ret == true then
				targetAnimal:SetPosByWorldPos(self.skillCloneTargetPos, true)
			end
		end
	end
end

function Hero10006:SetSkillTargetPos(index, pos)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local centerPos = self.scene:GetSceneSkillPointPos(7)

		if centerPos ~= nil then
			pos.x = Mathf.Clamp(pos.x, centerPos.x - 20, centerPos.x + 20)
			pos.z = Mathf.Clamp(pos.z, centerPos.z - 20, centerPos.z + 20)
		end
	end

	self.skillTargetPos[index]:SetVector3(pos)
end

function Hero10006:SetSkillCloneTargetPos(pos)
	self.skillCloneTargetPos:SetVector3(pos)
end

function Hero10006:IsHaveCrow()
	return self.callCrowId > 0
end

function Hero10006:ClearCrow()
	if self.callCrowId > 0 then
		local callPlayer = self.sceneController:FindPlayerById(self.callCrowId)

		if callPlayer ~= nil then
			callPlayer:ChangeToNightmareEnd()
		end
	end
end

function Hero10006:CallNotifyCloneDead()
	self.cloneDeadCnt = self.cloneDeadCnt + 1

	if self:IsShow() == false and self.cloneDeadCnt >= Hero10006_Define.CloneMax then
		if self.cloneList ~= nil then
			for i, animalId in pairs(self.cloneList) do
				if animalId > 0 then
					self.sceneController:RemovePlayerDelay(animalId)
				end
			end
		end

		self.cloneList = {}

		self:Show()
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
		self:ClearAllEffect()
		self:AddSkillNextWaitTime(Hero10006_Define.SkillType.SkillShow, Hero10006_Define.SkillCloneEndShowTime)
		self.scene:RecoveryAutoExposure()
	end
end

function Hero10006:CallNotifyHostStopSkill()
	for i, animalId in pairs(self.cloneList) do
		local callPlayer = self.sceneController:FindPlayerById(animalId)

		if callPlayer ~= nil then
			callPlayer:StopCloneSkill()
		end
	end
end

function Hero10006:CallNotifyHostHit(attPlayer, hitType, skillData, attackDir)
	for i, animalId in pairs(self.cloneList) do
		local callPlayer = self.sceneController:FindPlayerById(animalId)

		if callPlayer ~= nil and callPlayer:IsHit() == false then
			callPlayer:ChangeHitSimple(attPlayer, AnimalBase_Define.HitType.Heavy, skillData, attackDir, true)
		end
	end
end

function Hero10006:StopCloneSkill()
	if self:IsSkillingSkill() == true and (self.skillIndex == Hero10006_Define.SkillType.SkillHostDash or self.skillIndex == Hero10006_Define.SkillType.SkillCloneDash) and self.skillCombo < 5 then
		self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, 5, MS_SkillData.PressType.PressDown, 0)
	end
end

function Hero10006:CallNotifySanHeroDead()
	if self:IsShow() == false then
		self.sanHeroAnimalId = 0

		self:Show()
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
		self:ClearAllEffect()
		self:AddSkillNextWaitTime(Hero10006_Define.SkillType.SkillShow, Hero10006_Define.SkillCloneEndShowTime)
		self.sceneController:EndSpecialChangeConfig(false)
	end
end

function Hero10006:CallNotifyCrowDisappear()
	self.callCrowId = 0
end

function Hero10006:CallNotifyGiantDisappear(animalId)
	return
end

function Hero10006:CallAnimalFromAI(monsterId, pos, muteki)
	if self.isHost == true then
		return nil
	end

	local monster = self.gameController:GetMonsterIncludeDead(monsterId)

	if monster ~= nil then
		SystemHelper.LogTest("=============CallAnimalFromAI monsterId=" .. monsterId .. " exist !!!")

		return nil
	end

	local callPlayer = self.gameController:CallAnimal(self, monsterId, false)

	if callPlayer ~= nil then
		callPlayer:SetPosByWorldPos(pos, true)

		local targetAnimal = GameAI.GetSkillTargetByPos(callPlayer, pos)

		if targetAnimal ~= nil then
			local dir = targetAnimal:GetPosByWorldPos() - pos

			dir.y = 0

			if MathHelper.IsZero(dir.sqrMagnitude) == false then
				dir:SetNormalize()
				callPlayer:LookAt(dir, true)
			end

			dir = nil
		end

		callPlayer:SetRebornPosition(self:GetRebornPosition())
		callPlayer:SetRebornLook(self:GetRebornLook())
		callPlayer:Start()
		callPlayer:SetMoveMuteki(muteki)

		if self:IsMyTeam(callPlayer:GetTeamId()) == true and monsterId ~= Hero10006_Define.AnimalId_90007_1 and monsterId ~= Hero10006_Define.AnimalId_90007_2 then
			if callPlayer:IsType(AnimalBase_Define.Type.Hero) == true then
				-- block empty
			else
				callPlayer:SetMoveThroughWall(true)
				callPlayer:SetMoveThroughBody(true)
			end

			callPlayer:DissolveStart(AnimalBase_Define.NightmareShowTime)
		end
	end

	return callPlayer
end

function Hero10006:CallAnimalClone(targetAnimal, index, pos)
	if self.isHost == true then
		return nil
	end

	if targetAnimal == nil then
		return nil
	end

	local callId = Hero10006_Define.AnimalId_10006_Host

	if index > 1 then
		callId = Hero10006_Define.AnimalId_10006_Clone
	end

	local callPlayer = self.gameController:CallAnimalDynamic(self, callId, false)

	if callPlayer ~= nil then
		callPlayer:SetMoveThroughAll(true)
		callPlayer:SetPosByWorldPos(pos, true)

		local dir = targetAnimal:GetPosByWorldPos() - pos

		dir.y = 0

		if MathHelper.IsZero(dir.sqrMagnitude) == false then
			dir:SetNormalize()
			callPlayer:LookAt(dir, true)
		end

		dir = nil

		callPlayer:SetRebornPosition(self:GetRebornPosition())
		callPlayer:SetRebornLook(self:GetRebornLook())
		callPlayer:Start()
		callPlayer:SetBodyPartsVisible(AnimalBase_Define.VisibleType.Variety, false)
		callPlayer:DissolveStart(AnimalBase_Define.NightmareShowTime)
	end

	return callPlayer
end

function Hero10006:SetHostClone(flg)
	self.hostClone = flg
end

function Hero10006:KeepLockCamera(skillIndex, skillCombo)
	if self.boss > 0 and self.isHost == false then
		self.cameraScene:LockSkillingPlayerForce(self)
		self.sceneController:UnlockPlayer(self)
	end
end

function Hero10006:GetHitUpUpTimeConfig()
	return Hero10006_Define.HitUpUpTimeHitTime1, Hero10001_Define.HitUpUpTimeHitTime2, Hero10006_Define.HitUpUpTimeResetTime1, Hero10001_Define.HitUpUpTimeResetTime2
end

function Hero10006:SetUI()
	AnimalBase.SetUI(self)
end

function Hero10006:GetShootDistanceMax()
	return Hero10006_Define.static.BulletRangeMax
end

function Hero10006:ExitBattle()
	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false then
		self.cameraScene:LockSkillingPlayerForce(nil)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillNS2)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillNS2_2)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillNHP2)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillNOP3)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillOP3)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillDash)
		self.scene:StopTrick(Hero10006_Define.TrickId_SkillDragWall)
		self.sceneController:EndSpecialChangeConfig(true)

		if self.cloneList ~= nil then
			for i, animalId in pairs(self.cloneList) do
				if animalId > 0 then
					self.sceneController:RemovePlayerDelay(animalId)
				end
			end
		end

		self.scene:RecoveryAutoExposure()
	end

	AnimalBase.ExitBattle(self)
end

function Hero10006:Exit()
	self.cloneList = nil
	self.bulletSkillNL1SpeedVec3 = nil
	self.bulletSkillLP2SpeedVec3 = nil
	self.bulletSkillHP2SpeedVec3 = nil
	self.bulletSkillS2SpeedVec3 = nil
	self.bulletSkillS2Dir = nil
	self.bulletSkillNLP3SpeedVec3 = nil
	self.skillTargetPos = nil
	self.skillCloneTargetPos = nil

	AnimalBase.Exit(self)
end

return Hero10006
