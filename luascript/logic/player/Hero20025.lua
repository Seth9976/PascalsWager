-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20025.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20025_Define")

Hero20025 = class("Hero20025", AnimalBase)

function Hero20025:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletBeamSpeedVec3 = Vector3.zero
	self.bulletBeamSpeedVec3.z = Hero20025_Define.BulletBeamSpeed
	self.bulletBeamIndex = 0
	self.bulletTraceVec3 = Vector3.zero
	self.bulletTraceVec3.z = Hero20025_Define.BulletTraceSpeed
end

function Hero20025:Start()
	AnimalBase.Start(self)
end

function Hero20025:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20025:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20025:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20025:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == Hero20025_Define.SkillType.SkillDD2 and self.skillCombo == 2 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20025:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20025:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20025:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20025:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20025:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.animalGrade - 1, 0, 0)
end

function Hero20025:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20025_Define.SkillType.SkillO2 then
		local bullet = self.controllerBullet:GetBullet(self.bulletBeamIndex)

		if bullet ~= nil then
			local tfWeaponBox = self:GetWeaponBox(1)
			local startPos = tfWeaponBox.position
			local startRot = tfWeaponBox.rotation
			local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20025_Define.BulletBeamRangeMax)

			bullet:SetEndPosition(targetPos)
		end
	end
end

function Hero20025:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20025:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20025:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20025:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20025:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20025_Define.SkillType.SkillO1 then
		if trigger > 0 then
			self:AddGrade(false)
		end
	elseif self.skillIndex == Hero20025_Define.SkillType.SkillO2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local startPos = self:GetWeaponBox(1).position
				local startRot = self:GetWeaponBox(1).rotation
				local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20025_Define.BulletBeamRangeMax)

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
					self.controllerBullet:ClearBullet(self.bulletBeamIndex)
				end

				self.bulletBeamIndex = 0
			end
		end
	elseif self.skillIndex == Hero20025_Define.SkillType.SkillL1 then
		if trigger > 0 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20025_Define.BulletTraceRangeMax, Hero20025_Define.BulletTraceRangeMax, Hero20025_Define.BulletTraceRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, skillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetSpeedAngle(Hero20025_Define.BulletTraceAngleSpeed)
					bullet:SetLifeTime(Hero20025_Define.BulletTraceLifeTime)
					bullet:Ready()
					bullet:SetSkillTargetAnimal(GameAI.GetAttackTarget(self), true)
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20025_Define.SkillType.SkillL2 and trigger > 0 then
		local bulletTarget = GameAI.GetAttackTarget(self)

		if bulletTarget ~= nil then
			local bulletSkillData = MS_SkillData.GetSkillData(self.heroId, Hero20025_Define.SkillType.SkillL2, 1)
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local shootDir = self:GetForward()
			local diffAngle = 360 * (Hero20025_Define.BulletTraceNum - trigger) / Hero20025_Define.BulletTraceNum
			local rot = Quaternion.AngleAxis(diffAngle, shootDir)
			local tmpUp = Vector3.up

			tmpUp:MulQuat(rot)

			local targetPos = shootDir + tmpUp

			targetPos:SetNormalize()
			targetPos:Mul(Hero20025_Define.BulletTraceRangeMax)
			targetPos:Add(startPos)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, bulletSkillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetSpeedAngle(Hero20025_Define.BulletTraceAngleSpeed)
					bullet:SetLifeTime(Hero20025_Define.BulletTraceLifeTime)
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
end

function Hero20025:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20025_Define.SkillType.SkillO2 then
		if self.bulletBeamIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletBeamIndex)
		end

		self.bulletBeamIndex = 0
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20025:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20025:Exit()
	if self.bulletBeamIndex > 0 then
		self.controllerBullet:ClearBullet(self.bulletBeamIndex)
	end

	self.bulletBeamIndex = 0
	self.bulletBeamSpeedVec3 = nil
	self.bulletTraceVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20025
