-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20027.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20027_Define")

Hero20027 = class("Hero20027", AnimalBase)

function Hero20027:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletNSSpeedVec3 = Vector3.zero
	self.bulletNSAccVec3 = Vector3.zero
	self.bulletNSAccVec3.y = Hero20027_Define.BulletNSPGravity
	self.bulletBeamSpeedVec3 = Vector3.zero
	self.bulletBeamSpeedVec3.z = Hero20027_Define.BulletBeamSpeed
	self.eyeId = 0
	self.eyeList = {}
	self.tentacleList = {}
	self.bulletBeamIndexList = nil
	self.eyeMaterial = nil
	self.eyeIntensity = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.mEyeId = Hero20027_Define.EyeId
		self.mTentacleLeftId = Hero20027_Define.TentacleLeftId
		self.mTentacleRightId = Hero20027_Define.TentacleRightId

		if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self.mEyeId = Hero20027_Define.EyeIdInMaze
			self.mTentacleLeftId = Hero20027_Define.TentacleLeftIdInMaze
			self.mTentacleRightId = Hero20027_Define.TentacleRightIdInMaze
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			self.mEyeId = Hero20027_Define.EyeIdInMaze
			self.mTentacleLeftId = Hero20027_Define.TentacleLeftIdInMaze
			self.mTentacleRightId = Hero20027_Define.TentacleRightIdInMaze
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			self.mEyeId = Hero20027_Define.EyeIdInArcade
			self.mTentacleLeftId = Hero20027_Define.TentacleLeftIdInArcade
			self.mTentacleRightId = Hero20027_Define.TentacleRightIdInArcade
		end
	end
end

function Hero20027:Start()
	AnimalBase.Start(self)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20027_Define.Equipment2, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20027_Define.Equipment3, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20027_Define.Equipment4, true)

	if self.gameController ~= nil then
		local tmpCallList

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local monsterData = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self:GetStoryMonsterId())

			if monsterData ~= nil then
				tmpCallList = monsterData.CallMonsterIdList
			end

			if tmpCallList ~= nil and #tmpCallList == Hero20027_Define.TentacleMax + 1 then
				for i = 1, #tmpCallList do
					local callId = tonumber(tmpCallList[i])

					if callId == self.mEyeId then
						self.eyeId = callId
					elseif callId == self.mTentacleLeftId or callId == self.mTentacleRightId then
						if callId > 0 then
							local callPlayer = self.gameController:CallAnimalDynamic(self, callId, true)

							if callPlayer ~= nil then
								callPlayer:SetMoveFix(true)

								local tfWeaponBox = self:GetWeaponBox(Hero20027_Define.TentacleWeaponBox[i])

								callPlayer:SetFixBoneHost(AnimalBase_Define.FixBoneType.Root, tfWeaponBox, true)

								if self.isHost == true and self.isHostBack == false then
									callPlayer:SetHostBack(true)
								end

								callPlayer:Show()
								callPlayer:Start()
								XCollider.AddRouteColliderIgnore(self:GetAnimalId(), callPlayer:GetAnimalId())

								self.tentacleList[callId] = callPlayer
							end
						end
					else
						SystemHelper.LogError("==========CallAnimalId Error!!!!callId=" .. callId)
					end
				end
			end

			self:CreateTrap()

			local tfEffectRoot = self.scene:GetEffectRoot("effect_4")

			if tfEffectRoot ~= nil then
				tfEffectRoot.gameObject:SetActive(true)
			end
		end
	end

	self:SetLockDisable(true)

	local eyeRenderer = self:GetEquipmentRender(Hero20027_Define.Equipment2)

	if eyeRenderer ~= nil then
		self.eyeMaterial = eyeRenderer.material
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20027:StartBattle()
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

function Hero20027:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())

	for k, v in pairs(Hero20027_Define.SelfVfxWeaponBox) do
		self:CreateSelfEffectLoop("self_" .. k, self:GetWeaponBox(v), "vfx_20027_self_1")
	end
end

function Hero20027:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())

	for k, v in pairs(Hero20027_Define.SelfVfxWeaponBox) do
		self:ClearSelfEffectLoop("self_" .. k)
	end
end

function Hero20027:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20027:OnHitExit()
	if self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.Execute then
		self:SetLockDisable(true)
		self:ClearStatusById(Hero20027_Define.StatusId_Weakness)

		if self.tentacleList ~= nil then
			for callId, tentacle in pairs(self.tentacleList) do
				if tentacle ~= nil then
					local tmpDead = tentacle:IsDead()

					tentacle:Show()
					tentacle:Reborn(true, nil)

					if tmpDead == true then
						tentacle:Born(AnimalBase_Define.BornReason.CallAnimal, true)
					end
				end
			end
		end
	end

	AnimalBase.OnHitExit(self)
end

function Hero20027:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20027:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20027:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)

	local dir = Vector3.forward
	local tmpCenterPos = self.scene:GetSceneSkillPointPos(1)
	local timeList = {}
	local index = 1

	for i = Hero20027_Define.SceneEyePointStart, Hero20027_Define.SceneEyePointEnd do
		table.insert(timeList, index)

		index = index + 1
	end

	timeList = table.shuffle(timeList)
	index = 1

	for i = Hero20027_Define.SceneEyePointStart, Hero20027_Define.SceneEyePointEnd do
		local callPlayer = self.gameController:CallAnimalDynamic(self, self.eyeId, true)

		if callPlayer ~= nil then
			local tmpEyePos = self.scene:GetSceneSkillPointPos(i)

			callPlayer:SetPosByWorldPos(tmpEyePos, true)
			dir:SetVector3(tmpCenterPos)
			dir:Sub(tmpEyePos)
			callPlayer:LookAt(dir:SetNormalize(), true)
			callPlayer:SetRebornPosition(tmpEyePos)

			if self.isHost == true and self.isHostBack == false then
				callPlayer:SetHostBack(true)
			end

			callPlayer:Show()
			callPlayer:Start()
			callPlayer:AddSkillNextWaitTime(Hero90003_Define.SkillType.SkillL, Hero90003_Define.SkillExplodeTimeWait * timeList[index])

			tmpEyePos = nil

			table.insert(self.eyeList, callPlayer)

			index = index + 1
		end
	end

	timeList = nil
	dir = nil

	self:CreateTrap()
end

function Hero20027:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20027:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
end

function Hero20027:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20027_Define.SkillType.SkillSP then
			if self.skillCombo == 1 and self.animatorTrigger >= 1 and self.animatorTrigger < 2 then
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal == nil then
					local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
					local attPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
					local captureOffset, captureDis, captureHeight = self:GetCaptureDistanceAndHeight()

					targetAnimal = GameAI.GetSkillCaptureTarget(self, skillData, attPos, captureOffset, captureDis, captureHeight, true)

					if targetAnimal ~= nil then
						self:SetSkillTargetReady(targetAnimal)
					end
				end
			elseif self.skillCombo == 2 and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false and FS_UserData.story:IsQuestComplete(Hero20027_Define.QuestId_20028) == true and self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0 then
				self:ClearSkillEffectLoopAll()
				self:ClearSkillEffectAll()
				self:StopSkillAudio()
				AudioCtrl.SetObjectAudio("Object/other/toll", Hero20027_Define.TollPos_20028, "")
				self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
			end
		elseif self.skillIndex == Hero20027_Define.SkillType.SkillNOP or self.skillIndex == Hero20027_Define.SkillType.SkillO then
			local weaponBoxList = Hero20027_Define.SkillNOPWeaponBox

			if self.skillIndex == Hero20027_Define.SkillType.SkillO then
				weaponBoxList = Hero20027_Define.SkillOWeaponBox
			end

			if self.bulletBeamIndexList ~= nil then
				for i, bulletIndex in pairs(self.bulletBeamIndexList) do
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						local box = self:GetWeaponBox(weaponBoxList[i])

						if box ~= nil then
							local startPos = box.position
							local startRot = box.rotation
							local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20027_Define.BulletBeamRangeMax)

							bullet:SetEndPosition(targetPos)
						end
					end
				end
			end
		end
	end
end

function Hero20027:UpdateDynamicAnimal()
	if self.eyeList ~= nil then
		local eyeNum = #self.eyeList

		for i = eyeNum, 1, -1 do
			local eye = self.eyeList[i]

			if eye:IsDead() == true and eye:IsDeadHide() == true then
				self:DestroyCallAnimal(eye)
				table.remove(self.eyeList, i)
			end
		end
	end
end

function Hero20027:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
	self:UpdateDynamicAnimal()

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20027_Define.SkillType.SkillHP then
			if self.skillCombo == 1 and self.animalAim ~= nil then
				local targetPos = GameAI.GetFootTarget(self, Hero20027_Define.SkillHPDefaultRange)

				self.animalAim:SetTargetPos(targetPos.x, targetPos.y, targetPos.z)

				targetPos = nil
			end
		elseif self.skillIndex == Hero20027_Define.SkillType.SkillSP then
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
		elseif self.skillIndex == Hero20027_Define.SkillType.SkillNOP then
			if self.skillCombo == 1 and self.eyeMaterial ~= nil then
				if self.animatorTime > Hero20027_Define.EyeSkillNOPEndTime2 then
					self.eyeMaterial:SetFloat("_RimIntensity", 0)
				elseif self.animatorTime > Hero20027_Define.EyeSkillNOPStartTime2 then
					local ratio = (self.animatorTime - Hero20027_Define.EyeSkillNOPStartTime2) / (Hero20027_Define.EyeSkillNOPEndTime2 - Hero20027_Define.EyeSkillNOPStartTime2)
					local intensity = Mathf.Lerp(Hero20027_Define.EyeIntensity, 0, ratio)

					self.eyeMaterial:SetFloat("_RimIntensity", intensity)
				elseif self.animatorTime > Hero20027_Define.EyeSkillNOPEndTime1 then
					self.eyeMaterial:SetFloat("_RimIntensity", Hero20027_Define.EyeIntensity)
				elseif self.animatorTime > Hero20027_Define.EyeSkillNOPStartTime1 then
					local ratio = (self.animatorTime - Hero20027_Define.EyeSkillNOPStartTime1) / (Hero20027_Define.EyeSkillNOPEndTime1 - Hero20027_Define.EyeSkillNOPStartTime1)
					local intensity = Mathf.Lerp(0, Hero20027_Define.EyeIntensity, ratio)

					self.eyeMaterial:SetFloat("_RimIntensity", intensity)
				end
			end
		elseif self.skillIndex == Hero20027_Define.SkillType.SkillO and self.skillCombo == 1 and self.eyeMaterial ~= nil then
			if self.animatorTime > Hero20027_Define.EyeSkillOEndTime2 then
				self.eyeMaterial:SetFloat("_RimIntensity", 0)
			elseif self.animatorTime > Hero20027_Define.EyeSkillOStartTime2 then
				local ratio = (self.animatorTime - Hero20027_Define.EyeSkillOStartTime2) / (Hero20027_Define.EyeSkillOEndTime2 - Hero20027_Define.EyeSkillOStartTime2)
				local intensity = Mathf.Lerp(Hero20027_Define.EyeIntensity, 0, ratio)

				self.eyeMaterial:SetFloat("_RimIntensity", intensity)
			elseif self.animatorTime > Hero20027_Define.EyeSkillOEndTime1 then
				self.eyeMaterial:SetFloat("_RimIntensity", Hero20027_Define.EyeIntensity)
			elseif self.animatorTime > Hero20027_Define.EyeSkillOStartTime1 then
				local ratio = (self.animatorTime - Hero20027_Define.EyeSkillOStartTime1) / (Hero20027_Define.EyeSkillOEndTime1 - Hero20027_Define.EyeSkillOStartTime1)
				local intensity = Mathf.Lerp(0, Hero20027_Define.EyeIntensity, ratio)

				self.eyeMaterial:SetFloat("_RimIntensity", intensity)
			end
		end
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:IsHitByType(AnimalBase_Define.HitType.Execute) == false and self.tentacleList ~= nil then
		if self.tentacleList[self.mTentacleLeftId]:IsDead() == true and self.tentacleList[self.mTentacleRightId]:IsDead() == true then
			self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
			self:AddStatus(self:GetVirtualPlayer(), Hero20027_Define.StatusId_Weakness, 0, MS_StatusData.SourceType.Hit, 0, false)
			self:SetLockDisable(false)
		else
			self.animalValue:SetPropertyToMax(MS_HeroData.Property.Weakness)
			self:ClearStatusById(Hero20027_Define.StatusId_Weakness)
			self:SetLockDisable(true)
		end
	end
end

function Hero20027:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20027:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20027:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20027_Define.SkillType.SkillNSP then
		if trigger == 1 then
			self.scene:OpenTrick(Hero20027_Define.TrickId_SkillNSP)
		end
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillSP then
		if self.skillCombo == 3 and trigger == 1 then
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
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillH then
		if self.skillCombo == 1 and trigger == 1 and self.eyeId > 0 then
			local callPlayer = self.gameController:CallAnimalDynamic(self, self.eyeId, true)

			if callPlayer ~= nil then
				local weaponBox = self:GetWeaponBox(26)
				local attPos = weaponBox.position
				local tmpTargetPos = self.scene:GetSceneSkillPointPos(1):Clone()

				tmpTargetPos.x = tmpTargetPos.x + MathHelper.getRandomFloat(-2.5, 2.5, 1)
				tmpTargetPos.z = tmpTargetPos.z + MathHelper.getRandomFloat(-2.5, 2.5, 2)

				callPlayer:SetMoveFix(false)
				callPlayer:SetPosByWorldPos(attPos, false)

				local tmpDir = tmpTargetPos - attPos

				tmpDir.y = 0

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					callPlayer:LookAt(tmpDir:SetNormalize(), true)
				else
					callPlayer:LookAt(self:GetForward(), true)
				end

				callPlayer:SetRebornPosition(tmpTargetPos)

				if self.isHost == true and self.isHostBack == false then
					callPlayer:SetHostBack(true)
				end

				callPlayer:Show()
				callPlayer:Start()
				callPlayer:AddSkillNextWaitTime(Hero90003_Define.SkillType.SkillL, Hero90003_Define.SkillExplodeTimeWait)
				XCollider.AddRouteColliderIgnore(self:GetAnimalId(), callPlayer:GetAnimalId())

				tmpTargetPos = nil
				tmpDir = nil

				table.insert(self.eyeList, callPlayer)
			end
		end
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillNOP or self.skillIndex == Hero20027_Define.SkillType.SkillO then
		if self.skillCombo == 1 then
			if trigger == 1 then
				if self.bulletBeamIndexList == nil then
					self.bulletBeamIndexList = {}
				end

				local weaponBoxList = Hero20027_Define.SkillNOPWeaponBox

				if self.skillIndex == Hero20027_Define.SkillType.SkillO then
					weaponBoxList = Hero20027_Define.SkillOWeaponBox
				end

				for i = 1, #weaponBoxList do
					if self.bulletBeamIndexList[i] == nil then
						local box = self:GetWeaponBox(weaponBoxList[i])

						if box ~= nil then
							local startPos = box.position
							local startRot = box.rotation
							local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20027_Define.BulletBeamRangeMax)

							if self.controllerBullet ~= nil then
								local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Beam, self, skillData, nil, startPos, targetPos, self.bulletBeamSpeedVec3, Vector3.s_zero)
								local bullet = self.controllerBullet:GetBullet(bulletIndex)

								if bullet ~= nil then
									bullet:AddChainEffect(skillData[AnimalBase_Define.VfxSkillKey1], box)
									bullet:SetThroughObstacle(BulletBase.ThrowObstacle.Wall)
									bullet:Ready()
									bullet:Start()

									self.bulletBeamIndexList[i] = bulletIndex
								end
							end
						end
					end
				end
			elseif trigger == 2 then
				self:ClearBeam()
			end
		end
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillNO and self.skillCombo == 2 and trigger > 0 then
		local target = GameAI.GetAttackTarget(self)

		if target ~= nil then
			self.scene:OpenTrick(Hero20027_Define.TrickId_SkillNO, target:GetPosByWorldPos(), target:GetRotation())
		end
	end
end

function Hero20027:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20027_Define.SkillType.SkillSP then
		if self.skillCombo == 1 then
			self:SetSkillTarget(nil)
		elseif self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillOP then
		if self.skillCombo == 2 then
			self.scene:OpenTrick(Hero20027_Define.TrickId_SkillOP)
		end
	elseif (self.skillIndex == Hero20027_Define.SkillType.SkillO or self.skillIndex == Hero20027_Define.SkillType.SkillNOP) and self.skillCombo == 1 and self.eyeMaterial ~= nil then
		self.eyeMaterial:SetFloat("_RimIntensity", 0)
	end
end

function Hero20027:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20027_Define.SkillType.SkillSP and skillIndexNext ~= Hero20027_Define.SkillType.SkillSP then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end

		self:SetSkillTarget(nil)
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillOP then
		if self.skillCombo == 2 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
			self.scene:StopReadyTrick(Hero20027_Define.TrickId_SkillOP)
		end
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillSP then
		if self.skillCombo == 1 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20027_Define.SkillType.SkillNOP and skillIndexNext ~= Hero20027_Define.SkillType.SkillNOP or self.skillIndex == Hero20027_Define.SkillType.SkillO and skillIndexNext ~= Hero20027_Define.SkillType.SkillO then
		self:ClearBeam()

		if self.eyeMaterial ~= nil then
			self.eyeMaterial:SetFloat("_RimIntensity", 0)
		end
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20027:CreateTrap()
	local TrapPos1 = self.scene:GetSceneSkillPointPos(8)
	local TrapPos2 = self.scene:GetSceneSkillPointPos(9)
	local tmpVPlayer = self:GetVirtualPlayer()

	self.scene:AddTrap(Hero20027_Define.TrapId_Scene, TrapPos1, tmpVPlayer, tmpVPlayer:GetTeamId())
	self.scene:AddTrap(Hero20027_Define.TrapId_Scene, TrapPos2, tmpVPlayer, tmpVPlayer:GetTeamId())
end

function Hero20027:DestroyCallAnimal(animal)
	if animal ~= nil then
		self.sceneController:RemovePlayerDelay(animal:GetAnimalId())
	end
end

function Hero20027:ClearBeam()
	if self.bulletBeamIndexList ~= nil then
		for i, bulletIndex in pairs(self.bulletBeamIndexList) do
			self.controllerBullet:ClearBullet(bulletIndex)
		end
	end

	self.bulletBeamIndexList = nil
end

function Hero20027:ClearCallAnimal()
	if self.eyeList ~= nil then
		for i, eye in pairs(self.eyeList) do
			self:DestroyCallAnimal(eye)
		end
	end

	self.eyeList = nil

	if self.tentacleList ~= nil then
		for i, tentacle in pairs(self.tentacleList) do
			self:DestroyCallAnimal(tentacle)
		end
	end

	self.tentacleList = nil
end

function Hero20027:SetCharacterBodyIKEnable(enable)
	if self.finalIkBipedIK ~= nil then
		self.finalIkBipedIK.enabled = true
	end
end

function Hero20027:GetShootDistanceMax()
	return Hero20027_Define.BulletRangeMax
end

function Hero20027:GetCaptureDistanceAndHeight()
	return Hero20027_Define.SkillCaptureOffset, Hero20027_Define.SkillCaptureDistance, Hero20027_Define.SkillCaptureHeight
end

function Hero20027:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20027:ExitBattle()
	local tfEffectRoot = self.scene:GetEffectRoot("effect_4")

	if tfEffectRoot ~= nil then
		tfEffectRoot.gameObject:SetActive(false)
	end

	self:ClearBeam()
	self:ClearCallAnimal()
	self.scene:ClearTrapAll()
	AnimalBase.ExitBattle(self)
end

function Hero20027:Exit()
	if self.eyeMaterial ~= nil then
		GoDestroy(self.eyeMaterial)
	end

	self.eyeMaterial = nil

	self:ClearBeam()
	self:ClearCallAnimal()

	self.bulletNSSpeedVec3 = nil
	self.bulletNSAccVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20027
