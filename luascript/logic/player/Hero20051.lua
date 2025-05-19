-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20051.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20051_Define")

Hero20051 = class("Hero20051", AnimalBase)

function Hero20051:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletNHSpeed1Vec3 = Vector3.zero
	self.bulletNHSpeed1Vec3.z = Hero20051_Define.BulletNHSpeed1
	self.bulletNHSpeed2Vec3 = Vector3.zero
	self.bulletNHSpeed2Vec3.z = Hero20051_Define.BulletNHSpeed2
	self.bulletNHAcc2Vec3 = Vector3.zero
	self.bulletNHAcc2Vec3.z = Hero20051_Define.BulletNHAcc2
	self.bulletNHIndex = 0
	self.bulletNHStatus = BulletFalcula.FalculaStatus.Start
	self.skillTowardPosition = nil
	self.skillParryActive = false
	self.heroVariety = 2
end

function Hero20051:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
	end
end

function Hero20051:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 and self.characterConfig ~= nil then
		local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

		if mat ~= nil then
			self:ChangeMaterial(mat)
		end
	end

	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.animatorSpecialId - 1, 0, 0)
end

function Hero20051:Show()
	AnimalBase.Show(self)
end

function Hero20051:Hide()
	AnimalBase.Hide(self)
end

function Hero20051:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20051:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and (self.skillIndex == Hero20051_Define.SkillType.SkillO or self.skillIndex == Hero20051_Define.SkillType.SkillND2) then
		local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

		if bullet ~= nil then
			local status = bullet:GetFalculaStatus()

			if self.bulletNHStatus ~= status then
				if status == BulletFalcula.FalculaStatus.Disappear then
					self.controllerBullet:ClearBullet(self.bulletNHIndex)

					self.bulletNHIndex = 0
				elseif status == BulletFalcula.FalculaStatus.Back then
					self:SetSkillTarget(nil)
				end

				self.bulletNHStatus = status
			end

			if status == BulletFalcula.FalculaStatus.Start then
				local bulletPos = bullet:GetPosition()
				local nowPos = self:GetPosByWorldPos()
				local radius = self:GetRadius()
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal == nil then
					local hitList = bullet:GetHitAnimalList()

					if hitList ~= nil then
						for k, animal in pairs(hitList) do
							if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true and (animal:IsHitBySkill(self, self.skillIndex, 0) or animal:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.DefenceHit) then
								self:SetSkillTarget(animal)
								bullet:PullArriveFalcula()

								self.skillTowardPosition = GameAI.GetPositionCloseToTarget(self, animal)

								self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)

								break
							end
						end
					end
				end
			elseif status == BulletFalcula.FalculaStatus.Arrived and bullet:IsPullfalculas() == true then
				local timeStart = 0
				local timeEnd = 0

				if self.skillIndex == Hero20051_Define.SkillType.SkillO then
					timeStart = Hero20051_Define.SkillOTimeStart
					timeEnd = Hero20051_Define.SkillOTimeEnd
				elseif self.skillIndex == Hero20051_Define.SkillType.SkillND2 then
					timeStart = Hero20051_Define.SkillND2TimeStart
					timeEnd = Hero20051_Define.SkillND2TimeEnd
				end

				if self.skillTowardPosition ~= nil and timeStart < self.animatorTime and timeEnd >= self.animatorTime then
					XAnimator.SetMatchTarget(self:GetAnimalId(), self.animatorLayer, self.skillTowardPosition.x, self.skillTowardPosition.y, self.skillTowardPosition.z, self.animatorTime, timeEnd)
				end
			end
		end

		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:KeepHitPeriod()
		end
	end
end

function Hero20051:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	if self.skillIndex ~= Hero20051_Define.SkillType.SkillO and self.skillIndex ~= Hero20051_Define.SkillType.SkillND2 then
		self:PlaySkillEffect(false)
	end

	self:PlaySkillAudio()
end

function Hero20051:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20051_Define.SkillType.SkillO and self.skillCombo == 1 or self.skillIndex == Hero20051_Define.SkillType.SkillND2 and self.skillCombo == 2 then
		if trigger == 1 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20051_Define.BulletNHRangeMax, Hero20051_Define.BulletNHRangeMin, Hero20051_Define.BulletNHRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Falcula, self, skillData, nil, startPos, targetPos, self.bulletNHSpeed1Vec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:AddFalculaEffect(skillData[AnimalBase_Define.VfxSkillKey1], self:GetWeaponBox(1))
					bullet:Ready()
					bullet:Start()

					self.bulletNHIndex = bulletIndex
				end
			end
		elseif trigger == 2 then
			local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

			if bullet ~= nil then
				bullet:PullBackFalcula(true, false)
				bullet:SetSpeed(self.bulletNHSpeed2Vec3, self.bulletNHAcc2Vec3)
			end
		end
	elseif (self.skillIndex == Hero20051_Define.SkillType.SkillO and self.skillCombo == 2 or self.skillIndex == Hero20051_Define.SkillType.SkillND2 and self.skillCombo == 3) and trigger == 1 then
		local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

		if bullet ~= nil then
			local status = bullet:GetFalculaStatus()

			if status == BulletFalcula.FalculaStatus.Arrived then
				bullet:SetFalculaStatus(BulletFalcula.FalculaStatus.Disappear)
				bullet:SetDead(true)
			end
		end
	end

	if self.skillIndex == Hero20051_Define.SkillType.SkillND1 and self.skillCombo == 2 or self.skillIndex == Hero20051_Define.SkillType.SkillND2 and self.skillCombo == 3 then
		if trigger == 1 then
			self:SetMoveThroughBody(true)
		elseif trigger == 2 then
			self:SetMoveThroughBody(false)
		end
	end
end

function Hero20051:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20051_Define.SkillType.SkillO and self.skillCombo == 1 or self.skillIndex == Hero20051_Define.SkillType.SkillND2 and self.skillCombo == 2 then
		if self.bulletNHIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletNHIndex)
		end

		self.bulletNHIndex = 0
		self.skillTowardPosition = nil
		self.bulletNHStatus = BulletFalcula.FalculaStatus.Start
	elseif self.skillIndex == Hero20051_Define.SkillType.SkillO and self.skillCombo == 2 or self.skillIndex == Hero20051_Define.SkillType.SkillND2 and self.skillCombo == 3 then
		local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

		if bullet ~= nil then
			bullet:PullBackFalcula(true, true)
			bullet:SetSpeed(self.bulletNHSpeed2Vec3, self.bulletNHAcc2Vec3)
		end
	elseif self.skillIndex == Hero20051_Define.SkillType.SkillS and self.skillCombo == 1 then
		self.skillParryActive = false
	elseif self.skillIndex == AnimalBase_Define.SkillType.Drop and self.skillCombo == 1 then
		self:SetMoveNoDropDamage(true)
	elseif self.skillIndex == Hero20051_Define.SkillType.SkillLPLLL and self.skillCombo == 1 then
		local selfVfx = self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(2), Hero20051_Define.VfxName_SkillLPLLL)

		if selfVfx ~= nil then
			selfVfx:SetDelayClear(true, nil)
		end
	end
end

function Hero20051:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20051_Define.SkillType.SkillO and skillIndexNext ~= Hero20051_Define.SkillType.SkillO or self.skillIndex == Hero20051_Define.SkillType.SkillND2 and skillIndexNext ~= Hero20051_Define.SkillType.SkillND2 then
		if self.bulletNHIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletNHIndex)
		end

		self.bulletNHIndex = 0

		self:SetSkillTarget(nil)
	elseif self.skillIndex == Hero20051_Define.SkillType.SkillS and self.skillCombo == 1 then
		self.skillParryActive = false
	elseif self.skillIndex == AnimalBase_Define.SkillType.Born1 and self.skillCombo == 1 then
		self:StopSkillAudio()
	elseif self.skillIndex == AnimalBase_Define.SkillType.Drop and self.skillCombo == 2 then
		self:SetMoveNoDropDamage(false)
	elseif self.skillIndex == Hero20051_Define.SkillType.SkillLPLLL and skillIndexNext ~= Hero20051_Define.SkillType.SkillLPLLL then
		self:ClearSelfEffectLoop("self_1")
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20051:OnSkillParryBullet(bullet)
	if self:IsSkillingSkill() == false then
		return
	end

	local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

	if vfxRoot ~= nil then
		VfxManager.PlayBindMulti(vfxRoot, Hero20051_Define.VfxParryBullet)
	end

	AudioCtrl.SetHeroAudio("hero20051/skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
	self:StartAnimatorDelay(0, Hero20051_Define.ParryFrameFreeze, Hero20051_Define.ParryFrameFadeOut, Hero20051_Define.ParryFrameFreezeSpeed)
end

function Hero20051:OnSkillParry(target, targetSkillData)
	if self:IsSkillingSkill() == false then
		return
	end

	if target == nil or target:IsDead() == true or target:IsShow() == false then
		return
	end

	if self.skillIndex == Hero20051_Define.SkillType.SkillS and self.skillCombo == 1 and self.skillParryActive == false then
		local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

		if vfxRoot ~= nil then
			VfxManager.PlayBindMulti(vfxRoot, Hero20051_Define.VfxParryBullet)
		end

		AudioCtrl.SetHeroAudio("hero20051/skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
		self:StartAnimatorDelay(0, Hero20051_Define.ParryFrameFreeze, Hero20051_Define.ParryFrameFadeOut, Hero20051_Define.ParryFrameFreezeSpeed)

		self.skillParryActive = true
	end
end

function Hero20051:GetShootDistanceMax()
	return Hero20051_Define.BulletRangeMax
end

function Hero20051:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20051:Exit()
	if self.bulletNHIndex > 0 then
		self.controllerBullet:ClearBullet(self.bulletNHIndex)
	end

	self.bulletNHIndex = 0
	self.bulletNHSpeed1Vec3 = nil
	self.bulletNHSpeed2Vec3 = nil
	self.bulletNHAcc2Vec3 = nil
	self.skillTowardPosition = nil

	AnimalBase.Exit(self)
end

return Hero20051
