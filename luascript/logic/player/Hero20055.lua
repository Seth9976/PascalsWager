-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20055.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20055_Define")

Hero20055 = class("Hero20055", AnimalBase)

function Hero20055:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bWithBarrel = true
	self.currentCondition = Hero20055_Define.ConditionBarrel
	self.lastCondition = Hero20055_Define.ConditionBarrel
	self.conditionTime = 0
	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero20055_Define.BulletSpeed
	self.bulletSkillH2SpeedVec3 = Vector3.zero
	self.bulletSkillH2AccVec3 = Vector3.zero
	self.bulletSkillH2AccVec3.y = Hero20055_Define.BulletSkillH2Gravity
	self.bulletSkillNSS2SpeedVec3 = Vector3.zero
	self.bulletSkillNSS2AccVec3 = Vector3.zero
	self.bulletSkillNSS2AccVec3.y = Hero20055_Define.BulletSkillNSS2Gravity
	self.barrelPos = Vector3.zero
	self.barrelFrontCollider = nil
	self.barrelFrontColliderEnable = false
	self.barrelBackCollider = nil
	self.barrelBackColliderEnable = false
	self.barrelWillGet = false
	self.needChangeCondition = false
end

function Hero20055:Start()
	AnimalBase.Start(self)

	local tfBarrelFront = self:GetEquipment(Hero20055_Define.EquipmentBarrelFront)

	if tfBarrelFront ~= nil then
		self.barrelFrontCollider = tfBarrelFront.parent.gameObject:GetComponent(typeof("UnityEngine.Collider"))
		self.barrelFrontCollider.enabled = true
		self.barrelFrontColliderEnable = true
	end

	local tfBarrelBack = self:GetEquipment(Hero20055_Define.EquipmentBarrelBack)

	if tfBarrelBack ~= nil then
		self.barrelBackCollider = tfBarrelBack.parent.gameObject:GetComponent(typeof("UnityEngine.Collider"))
		self.barrelBackCollider.enabled = true
		self.barrelBackColliderEnable = true
	end

	self:ShowCondition()

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20055:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20055:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20055:StartBattle()
	AnimalBase.StartBattle(self)
	self:ChangeCondition(Hero20055_Define.ConditionBarrel)
end

function Hero20055:GetCondition()
	return self.currentCondition
end

function Hero20055:GetLastCondition()
	return self.lastCondition
end

function Hero20055:IsWithBarrel()
	return self.bWithBarrel
end

function Hero20055:IsChangeTimeArrival()
	if self.conditionTime > 0 then
		local nowTime = TimeHelper.getNowTime()
		local conditionTime = 0

		if self.currentCondition == Hero20055_Define.ConditionWeak then
			conditionTime = Hero20055_Define.ConditionTimeMaxForWeak
		else
			conditionTime = Hero20055_Define.ConditionTimeMaxForOther
		end

		if conditionTime < nowTime - self.conditionTime then
			return true
		end
	end

	return false
end

function Hero20055:ChangeCondition(condition)
	SystemHelper.LogTest("=====ChangeCondition==============condition=" .. condition)

	if self.currentCondition ~= Hero20055_Define.ConditionWeak then
		self.lastCondition = self.currentCondition
	end

	self.currentCondition = condition
	self.needChangeCondition = false

	self:SetSkillConditionAll(condition)
	SystemHelper.LogTest("pose======================" .. self.currentCondition - 1)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.currentCondition - 1, 0, 0)

	self.conditionTime = TimeHelper.getNowTime()

	self.animalValue:SetPropertyToMax(MS_HeroData.Property.Weakness)

	if self.currentCondition == Hero20055_Define.ConditionWeak then
		self:AddStatus(self:GetVirtualPlayer(), Hero20055_Define.StatusIdSubDefence, 0, MS_StatusData.SourceType.Skill, 0, false)
		self:AddStatus(self:GetVirtualPlayer(), Hero20055_Define.StatusIdSubWeakness, 0, MS_StatusData.SourceType.Skill, 0, false)
	else
		self:ClearStatusById(Hero20055_Define.StatusIdSubDefence)
		self:ClearStatusById(Hero20055_Define.StatusIdSubWeakness)
	end
end

function Hero20055:IsNeedChangeCondition()
	return self.needChangeCondition
end

function Hero20055:ShowCondition()
	if self.currentCondition == Hero20055_Define.ConditionHammer then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, false)
	elseif self.currentCondition == Hero20055_Define.ConditionSpoon then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, true)
	elseif self.currentCondition == Hero20055_Define.ConditionBarrel then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, true)
	end
end

function Hero20055:GetBarrelPosition()
	return self.barrelPos
end

function Hero20055:LostBarrel()
	if self.bWithBarrel == false then
		return
	end

	SystemHelper.LogTest("=====LostBarrel======")

	self.bWithBarrel = false

	local weaponBox = self:GetWeaponBox(5)

	self.barrelPos:SetVector3(weaponBox.position)

	local forward = Vector3.forward
	local rot = weaponBox.rotation

	forward:MulQuat(rot)

	forward.y = 0

	self.scene:OpenTrick(Hero20055_Define.TrickId_Barrel, weaponBox.position, rot)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20055_Define.EquipmentBarrelFront, false)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20055_Define.EquipmentBarrelBack, false)

	forward = nil
	rot = nil
end

function Hero20055:WillGetBarrel()
	if self.bWithBarrel == true then
		return
	end

	local weaponBox = self:GetWeaponBox(5)

	self.barrelPos:SetVector3(weaponBox.position)

	self.barrelWillGet = true

	self:SetMoveThroughWall(true)
end

function Hero20055:UpdateBarrel()
	if self.barrelWillGet == false then
		return
	end

	local weaponBox = self:GetWeaponBox(5)

	self.barrelPos:SetVector3(weaponBox.position)

	local trick = self.scene:GetTrick(Hero20055_Define.TrickId_Barrel)

	if trick ~= nil and trick:IsOpening() == true then
		local trickPos = trick:GetPosition()

		if trickPos ~= nil then
			local disSqr = Vector3.DistanceSquare(trickPos, self.barrelPos)

			if disSqr > Hero20055_Define.BarrelGetDistanceMin then
				local trickPosNew = Vector3.Lerp(trickPos, self.barrelPos, Hero20055_Define.BarrelGetSpeed * ControllerMain.GetLogicDeltaTime())

				trick:SetPosition(trickPosNew)
			else
				self:GetBarrel()
			end
		end
	end
end

function Hero20055:GetBarrel()
	if self.bWithBarrel == true or self.barrelWillGet == false then
		return
	end

	SystemHelper.LogTest("=====GetBarrel======")

	self.bWithBarrel = true
	self.barrelWillGet = false

	self.scene:StopTrick(Hero20055_Define.TrickId_Barrel)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20055_Define.EquipmentBarrelFront, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20055_Define.EquipmentBarrelBack, true)
	self.animalValue:ResetBarrelHp()
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
	self:SetMoveThroughWall(false)
end

function Hero20055:IsPermitAttackBarrel()
	if self.currentCondition == Hero20055_Define.ConditionWeak and self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == true then
		return false
	end

	return true
end

function Hero20055:UpdateBarrelCollider(force)
	local barrelFrontVisible = self:IsEquipmentVisible(Hero20055_Define.EquipmentBarrelFront)

	if (force == true or barrelFrontVisible ~= self.barrelFrontColliderEnable) and (self.characterBodyColliderEnable == true or barrelFrontVisible == false) and self.barrelFrontCollider ~= nil then
		self.barrelFrontCollider.enabled = barrelFrontVisible
		self.barrelFrontColliderEnable = barrelFrontVisible
	end

	local barrelBackVisible = self:IsEquipmentVisible(Hero20055_Define.EquipmentBarrelBack)

	if (force == true or barrelBackVisible ~= self.barrelBackColliderEnable) and (self.characterBodyColliderEnable == true or barrelBackVisible == false) and self.barrelBackCollider ~= nil then
		self.barrelBackCollider.enabled = barrelBackVisible
		self.barrelBackColliderEnable = barrelBackVisible
	end
end

function Hero20055:SetBodyCollider(flg)
	AnimalBase.SetBodyCollider(self, flg)
	self:UpdateBarrelCollider(true)
end

function Hero20055:GetGradeThreshold()
	return 0
end

function Hero20055:PlayFootstepsAudioAndEffect(tfFoot, footIndex)
	if self:IsSkillingById(Hero20055_Define.SkillType.SkillS3, 1) == false and self:IsSkillingById(Hero20055_Define.SkillType.SkillHP4, 2) == false and self:IsSkillingById(Hero20055_Define.SkillType.SkillSP4, 2) == false then
		AudioCtrl.SetFootstepsAudio(self.modelName, self.tfModel, self.animalId, self.moveTouchGroundType, self.type, footIndex)

		local tmpPos = tfFoot.position

		if self.moveTouchWaterHeight > SceneBase.DefaultWaterHeight then
			tmpPos.y = self.moveTouchWaterHeight
		end

		VfxManager.PlayFreezeMulti(Hero20055_Define.FootstepsVfxName, tmpPos, nil, nil)
	end
end

function Hero20055:OnHit(isFirst, attackerData)
	AnimalBase.OnHit(self, isFirst, attackerData)

	if isFirst == true and attackerData ~= nil then
		if self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) then
			self.conditionTime = TimeHelper.getNowTime()

			if self.currentCondition == Hero20055_Define.ConditionWeak then
				self.needChangeCondition = true
			end

			self:SetMoveNoDamage(true)
			self:SetMoveThroughBody(false)
		elseif self:IsHitByType(AnimalBase_Define.HitType.Execute) then
			if self.currentCondition == Hero20055_Define.ConditionWeak then
				self.needChangeCondition = false
			end

			self:SetMoveNoDamage(false)
			self:SetMoveThroughBody(false)
		end
	end
end

function Hero20055:HitExecute(attackAnimal)
	local ret = AnimalBase.HitExecute(self, attackAnimal)

	self:SetMoveNoDamage(false)
	self:SetMoveThroughBody(false)

	return ret
end

function Hero20055:ChangeConditionOnHit(condition)
	self:ChangeCondition(condition)

	if condition == Hero20055_Define.ConditionHammer then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, true)
	elseif condition == Hero20055_Define.ConditionSpoon then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
	elseif condition == Hero20055_Define.ConditionBarrel then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, true)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
	end
end

function Hero20055:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == Hero20055_Define.SkillType.SkillSP2 and self.skillCombo == 2 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self:SetSkillTarget(hitPlayer)
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20055:OnHitExit()
	if self.moveHitType == AnimalBase_Define.HitType.StatusWeak then
		SystemHelper.LogTest("====OnHitExit========self.currentCondition=" .. self.currentCondition)

		if self.currentCondition == Hero20055_Define.ConditionHammer or self.currentCondition == Hero20055_Define.ConditionSpoon or self.currentCondition == Hero20055_Define.ConditionBarrel then
			self:ChangeCondition(Hero20055_Define.ConditionWeak)
		end

		self:SetMoveNoDamage(false)
	end

	if self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.Execute then
		self:ShowCondition()
	end

	AnimalBase.OnHitExit(self)
end

function Hero20055:ChangeToWeak()
	self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)

	local ret = self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)

	if ret == true then
		self.conditionTime = TimeHelper.getNowTime()
	end
end

function Hero20055:IsPermitExecuteHit()
	local permitExecute = AnimalBase.IsPermitExecuteHit(self)

	if permitExecute == true and (self.currentCondition == Hero20055_Define.ConditionHammer or self.currentCondition == Hero20055_Define.ConditionSpoon or self.currentCondition == Hero20055_Define.ConditionBarrel) then
		return false
	end

	return permitExecute
end

function Hero20055:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20055:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20055:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
end

function Hero20055:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true then
		if buttonPressDown == ControllerMain.SkillButton.Threat then
			local condition = self.currentCondition % 4 + 1

			self:ChangeCondition(condition)
			self:ShowCondition()
		elseif buttonPressDown == ControllerMain.SkillButton.NewThreat then
			self:ChangeCondition(Hero20055_Define.ConditionWeak)
			self:ShowCondition()
		end
	end
end

function Hero20055:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == true then
		if self.currentCondition == Hero20055_Define.ConditionHammer then
			if self:IsStrideOverFrame(10220, 10390, 10372) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, false)
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, true)
			end

			if self.animalValue:IsBarrelHpEmpty() == true then
				if self:IsStrideOverFrame(10220, 10390, 10224) == true then
					self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
					self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
				end

				if self:IsStrideOverFrame(10220, 10390, 10310) == true then
					self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
					self:LostBarrel()
				end
			end
		elseif self.currentCondition == Hero20055_Define.ConditionSpoon then
			if self:IsStrideOverFrame(10030, 10200, 10127) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, false)
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, true)
			end

			if self.animalValue:IsBarrelHpEmpty() == true then
				if self:IsStrideOverFrame(10030, 10200, 10036) == true then
					self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
					self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
				end

				if self:IsStrideOverFrame(10030, 10200, 10148) == true then
					self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
					self:LostBarrel()
				end
			end
		elseif self.currentCondition == Hero20055_Define.ConditionBarrel then
			if self:IsStrideOverFrame(9840, 10010, 9949) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
				self:LostBarrel()
			end
		elseif self.currentCondition == Hero20055_Define.ConditionWeak and self.animalValue:IsBarrelHpEmpty() == true then
			if self:IsStrideOverFrame(3880, 4050, 3883) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
			end

			if self:IsStrideOverFrame(3880, 4050, 3950) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
				self:LostBarrel()
			end
		end
	elseif self:IsHitByType(AnimalBase_Define.HitType.Execute) == true then
		if self.currentCondition == Hero20055_Define.ConditionBarrel then
			if self:IsStrideOverFrame(10770, 10960, 10841) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
			end
		elseif self.currentCondition == Hero20055_Define.ConditionSpoon then
			if self:IsStrideOverFrame(4240, 4430, 4386) == true then
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, true)
				self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, false)
			end
		elseif self.currentCondition == Hero20055_Define.ConditionHammer and self:IsStrideOverFrame(4440, 4630, 4585) == true then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, false)
		end
	end

	if self:IsHit() == false and self:IsSkilling() == false and self.currentCondition ~= Hero20055_Define.ConditionWeak and self:IsChangeTimeArrival() == true then
		self:ChangeToWeak()
	end

	self:UpdateBarrelCollider(false)

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20055_Define.SkillType.SkillOP4 then
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
		elseif self.skillIndex == Hero20055_Define.SkillType.SkillNHP1 and self.skillCombo == 1 or self.skillIndex == Hero20055_Define.SkillType.SkillNLP1 and self.skillCombo == 1 or self.skillIndex == Hero20055_Define.SkillType.SkillNDP1 and self.skillCombo == 1 then
			self:UpdateBarrel()
		end
	end
end

function Hero20055:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20055_Define.SkillType.SkillOP4 and self.skillCombo == 1 and self.animatorTrigger >= 1 and self.animatorTrigger < 2 then
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

function Hero20055:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20055_Define.SkillType.SkillNH1 and self.skillCombo == 1 then
		if trigger == 1 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, false)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillNHP1 and self.skillCombo == 1 then
		if trigger == 1 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerFront, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHammerBack, false)
		elseif trigger == 2 then
			self:WillGetBarrel()
		elseif trigger == 3 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, true)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillNL1 and self.skillCombo == 1 then
		if trigger == 1 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillNLP1 and self.skillCombo == 1 then
		if trigger == 1 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
		elseif trigger == 2 then
			self:WillGetBarrel()
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillND1 and self.skillCombo == 1 then
		if trigger == 1 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, false)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillNDP1 and self.skillCombo == 1 then
		if trigger == 1 then
			self:WillGetBarrel()
		elseif trigger == 2 then
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelFront, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentBarrelBack, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonFront, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentSpoonBack, false)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillHP2 and self.skillCombo == 2 then
		if trigger > 0 then
			local startPos = self:GetWeaponBox(1).position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20055_Define.BulletRangeMax, Hero20055_Define.BulletRangeMax, Hero20055_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillNSS2 then
		if trigger > 0 then
			local startPos = self:GetWeaponBox(1).position
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20055_Define.BulletSkillNSS2Range, Hero20055_Define.BulletSkillNSS2RangeMin, Hero20055_Define.BulletSkillNSS2RangeMax, Hero20055_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20055_Define.BulletSkillNSS2Angle, Hero20055_Define.BulletSkillNSS2Gravity)

			self.bulletSkillNSS2SpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSkillNSS2SpeedVec3, self.bulletSkillNSS2AccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
				end
			end
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillH2 and self.skillCombo == 1 then
		if trigger > 0 then
			local startPos = self:GetWeaponBox(1).position
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20055_Define.BulletSkillH2Range, Hero20055_Define.BulletSkillH2RangeMin, Hero20055_Define.BulletSkillH2RangeMax, Hero20055_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20055_Define.BulletSkillH2Angle, Hero20055_Define.BulletSkillH2Gravity)

			self.bulletSkillH2SpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSkillH2SpeedVec3, self.bulletSkillH2AccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:AddTrap(skillData.TrapId)
					bullet:SetThroughBody(true)
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
				end
			end
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillSP2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), Hero20055_Define.VfxName_SkillSP2)
			end
		elseif self.skillCombo == 3 and trigger == 1 then
			local target = GameAI.GetAttackTarget(self)

			if target ~= nil and target:IsDead() == false then
				self:ClearSelfEffectLoop("self_1")
				self.scene:OpenTrick(Hero20055_Define.TrickId_BarrelBomb, target:GetPosByWorldPos(), target:GetRotation())
			end
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillOP4 then
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
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillOP2 then
		if self.skillCombo == 2 and trigger > 0 then
			local targetAnimal = GameAI.GetAttackTarget(self)

			if targetAnimal ~= nil then
				self.scene:OpenTrick(Hero20055_Define.TrickId_Signal, targetAnimal:GetPosByWorldPos(), Quaternion.s_identity)
			end
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillDP4 and self.skillCombo == 2 and trigger > 0 then
		local hpMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
		local addHp = Mathf.Ceil(hpMax * Hero20055_Define.HpAddPercent)

		self.animalValue:AddProperty(MS_HeroData.Property.Hp, addHp)
		self:PlaySkillEffect(true)
	end
end

function Hero20055:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end

	if self.skillIndex == Hero20055_Define.SkillType.SkillSP2 and self.skillCombo == 2 then
		AudioCtrl.SetHeroAudio("hero20055/skill/Character_hero20055_skill_5_02_recovery", self.tfModel, self.animalId)
	end
end

function Hero20055:OnSkillRecoveryTrigger(trigger)
	AnimalBase.OnSkillRecoveryTrigger(self, trigger)

	if self:IsSkillingRecovery() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20055_Define.SkillType.SkillSP2 and self.skillCombo == 2 and trigger == 1 then
		self.scene:OpenTrick(Hero20055_Define.TrickId_BarrelBomb, self:GetPosByWorldPos(), self:GetRotation())
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero20055:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20055:OnSkillStart()
	AnimalBase.OnSkillStart(self)
	SystemHelper.LogTest("====OnSkillStart===self.skillIndex=" .. self.skillIndex .. ",self.skillCombo=" .. self.skillCombo)

	if self.skillIndex == Hero20055_Define.SkillType.SkillNH1 or self.skillIndex == Hero20055_Define.SkillType.SkillNHP1 then
		if self.skillCombo == 1 then
			self:ChangeCondition(Hero20055_Define.ConditionHammer)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, true)
			self:SetMoveNoDamage(true)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillND1 or self.skillIndex == Hero20055_Define.SkillType.SkillNDP1 then
		if self.skillCombo == 1 then
			self:ChangeCondition(Hero20055_Define.ConditionSpoon)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
			self:SetMoveNoDamage(true)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillNL1 or self.skillIndex == Hero20055_Define.SkillType.SkillNLP1 then
		if self.skillCombo == 1 then
			self:ChangeCondition(Hero20055_Define.ConditionBarrel)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead1, true)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead2, false)
			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Act, Hero20055_Define.EquipmentHead3, false)
			self:SetMoveNoDamage(true)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillOP4 then
		if self.skillCombo == 1 then
			self:SetSkillTarget(nil)
		elseif self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillOP2 then
		if self.skillCombo == 1 then
			local trick = self.scene:GetTrick(Hero20055_Define.TrickId_Signal)

			if trick ~= nil then
				trick:Reset()
			end
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillS3 and self.skillCombo == 1 then
		self:SetMoveThroughBody(true)
	end
end

function Hero20055:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20055_Define.SkillType.SkillNH1 or self.skillIndex == Hero20055_Define.SkillType.SkillNHP1 or self.skillIndex == Hero20055_Define.SkillType.SkillNL1 or self.skillIndex == Hero20055_Define.SkillType.SkillNLP1 or self.skillIndex == Hero20055_Define.SkillType.SkillND1 or self.skillIndex == Hero20055_Define.SkillType.SkillNDP1 then
		if self.skillCombo == 1 then
			self:ShowCondition()
			self:SetMoveNoDamage(false)
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillSP4 and self.skillCombo == 2 or self.skillIndex == Hero20055_Define.SkillType.SkillHP4 and self.skillCombo == 2 or self.skillIndex == Hero20055_Define.SkillType.SkillHP2 and self.skillCombo == 2 then
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillOP4 and skillIndexNext ~= Hero20055_Define.SkillType.SkillOP4 then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end

		self:SetSkillTarget(nil)
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillSP2 then
		if self.skillCombo == 1 and skillIndexNext ~= Hero20055_Define.SkillType.SkillSP2 or self.skillCombo == 2 then
			self:StopSkillAudio()
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
		end
	elseif self.skillIndex == Hero20055_Define.SkillType.SkillS3 and skillIndexNext ~= Hero20055_Define.SkillType.SkillS3 then
		self:SetMoveThroughBody(false)
	end

	if self.skillIndex == Hero20055_Define.SkillType.SkillNHP1 and self.skillCombo == 1 or self.skillIndex == Hero20055_Define.SkillType.SkillNLP1 and self.skillCombo == 1 or self.skillIndex == Hero20055_Define.SkillType.SkillNDP1 and self.skillCombo == 1 then
		self:GetBarrel()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20055:IsStrideOverFrame(min, max, frame)
	local rate = (frame - min) / (max - min)

	if rate >= self.animatorTimeLast and rate < self.animatorTime then
		return true
	end

	return false
end

function Hero20055:GetSignalPos(index)
	local trick = self.scene:GetTrick(Hero20055_Define.TrickId_Signal)

	if trick ~= nil then
		return trick:GetSignalPos(index)
	end

	return nil
end

function Hero20055:GetSignalCnt()
	local trick = self.scene:GetTrick(Hero20055_Define.TrickId_Signal)

	if trick ~= nil then
		return trick:GetSignalCnt()
	end

	return 0
end

function Hero20055:ExitBattle()
	self.scene:StopTrick(Hero20055_Define.TrickId_Barrel)
	self.scene:StopTrick(Hero20055_Define.TrickId_BarrelBomb)
	self:SetMoveNoDamage(false)
	AnimalBase.ExitBattle(self)
end

function Hero20055:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20055:GetCaptureDistanceAndHeight()
	return Hero20055_Define.SkillCaptureOffset, Hero20055_Define.SkillCaptureDistance, Hero20055_Define.SkillCaptureHeight
end

function Hero20055:Exit()
	self.bulletSpeedVec3 = nil
	self.bulletSkillH2SpeedVec3 = nil
	self.bulletSkillH2AccVec3 = nil
	self.bulletSkillNSS2SpeedVec3 = nil
	self.bulletSkillNSS2AccVec3 = nil
	self.barrelPos = nil
	self.barrelFrontCollider = nil
	self.barrelBackCollider = nil

	AnimalBase.Exit(self)
end

return Hero20055
