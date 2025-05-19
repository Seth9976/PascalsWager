-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20041.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20041_Define")

Hero20041 = class("Hero20041", AnimalBase)

function Hero20041:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletBeamSpeedVec3 = Vector3.zero
	self.bulletBeamSpeedVec3.z = Hero20041_Define.BulletBeamSpeed
	self.bulletBeamIndex = 0
end

function Hero20041:Start()
	AnimalBase.Start(self)

	if self.tfBodyRender ~= nil then
		self.tfBodyMaterial = self.tfBodyRender.material
	end

	self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
	self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
	self:UpdateHpShow()
end

function Hero20041:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20041:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20041:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingById(Hero20041_Define.SkillType.SkillDead, 0) == false and self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 2) == false then
		local nowHp = self:GetValue():GetProperty(MS_HeroData.Property.Hp)

		if nowHp <= 1 then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, Hero20041_Define.SkillType.SkillDead, 1, MS_SkillData.PressType.PressDown, 0)
		end
	end

	self:UpdateHpShow()
end

function Hero20041:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20041_Define.SkillType.SkillS and self.bulletBeamIndex > 0 then
		local bullet = self.controllerBullet:GetBullet(self.bulletBeamIndex)

		if bullet ~= nil then
			local startPos = self:GetWeaponBox(1).position
			local startRot = self:GetWeaponBox(1).rotation
			local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20041_Define.BulletBeamRangeMax)

			bullet:SetEndPosition(targetPos)
		end
	end
end

function Hero20041:Reborn(reset, propertyRateList)
	AnimalBase.Reborn(self, reset, propertyRateList)
	self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
end

function Hero20041:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20041_Define.SkillType.SkillO then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self.storyId == 8 then
			local target = self:GetSkillTarget()

			if target ~= nil then
				self.scene:OpenTrick(Hero20041_Define.TrickId_SkillO, target:GetPosByWorldPos(), Quaternion.s_identity)
			end
		end
	elseif self.skillIndex == Hero20041_Define.SkillType.SkillDead and self.skillCombo == 1 or self.skillIndex == AnimalBase_Define.SkillType.Drop and self.skillCombo == 2 then
		self:SetMoveNoDamage(true)
	end
end

function Hero20041:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20041:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20041:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20041_Define.SkillType.SkillS then
		if self.skillCombo == 1 then
			if trigger == 1 then
				if self.bulletBeamIndex > 0 then
					self.controllerBullet:ClearBullet(self.bulletBeamIndex)

					self.bulletBeamIndex = 0
				end

				local startPos = self:GetWeaponBox(1).position
				local startRot = self:GetWeaponBox(1).rotation
				local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20041_Define.BulletBeamRangeMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Beam, self, skillData, nil, startPos, targetPos, self.bulletBeamSpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:AddChainEffect(skillData[AnimalBase_Define.VfxSkillKey1], self:GetWeaponBox(1))
						bullet:Ready()
						bullet:Start()

						self.bulletBeamIndex = bulletIndex
					end
				end
			elseif trigger == 2 then
				if self.bulletBeamIndex > 0 then
					local bullet = self.controllerBullet:GetBullet(self.bulletBeamIndex)

					if bullet ~= nil then
						bullet:ClearDelay()
					end
				end

				self.bulletBeamIndex = 0
			end
		end
	elseif (self.skillIndex == Hero20041_Define.SkillType.SkillDead or self.skillIndex == AnimalBase_Define.SkillType.Drop and self.skillCombo == 2) and trigger == 1 then
		self:SetMoveMuteki(true)
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
		self:SetBodyCollider(false)
	end
end

function Hero20041:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20041_Define.SkillType.SkillS then
		if self.bulletBeamIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletBeamIndex)
		end

		self.bulletBeamIndex = 0
	elseif self.skillIndex == Hero20041_Define.SkillType.SkillDead and self.skillCombo == 1 or self.skillIndex == AnimalBase_Define.SkillType.Drop and self.skillCombo == 2 then
		self:SetMoveNoDamage(false)
		self:SetMoveMuteki(false)

		if self.animatorEnd == true then
			self:SkillDeadReady(AnimalBase_Define.DeadReason.Skill)
		else
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		end
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20041:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifyGiantDisappear(self:GetAnimalId())
		end
	end
end

function Hero20041:GetCaptureDistanceAndHeight()
	return Hero20041_Define.SkillCaptureOffset, Hero20041_Define.SkillCaptureDistance, Hero20041_Define.SkillCaptureHeight
end

function Hero20041:UpdateHpShow()
	if self.tfBodyMaterial ~= nil then
		local hp = self:GetValue():GetProperty(MS_HeroData.Property.Hp)
		local hpMax = self:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
		local ratio = Mathf.Clamp(hp / hpMax, 0, 1)

		self.tfBodyMaterial:SetFloat("_AlphaRatio", 1 - ratio)
	end
end

function Hero20041:HandleDamage(damage)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		local bossMode = self.gameController:IsBossMode()
		local bossId = self.gameController:GetBossId()

		if self.isHost == false and bossMode == true and bossId > 0 and damage > 0 then
			local tmpBoss = self.sceneController:FindPlayerByStoryMonsterId(bossId)

			if tmpBoss ~= nil and tmpBoss:IsDead() == false and tmpBoss:IsShow() == true then
				tmpBoss:GetValue():SubProperty(MS_HeroData.Property.Hp, damage * Hero20041_Define.DamageRateToBoss, -1, -1, 1)
			end
		end
	end
end

function Hero20041:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20041:Exit()
	if self.bulletBeamIndex > 0 then
		self.controllerBullet:ClearBullet(self.bulletBeamIndex)
	end

	self.bulletBeamIndex = 0
	self.bulletBeamSpeedVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20041
