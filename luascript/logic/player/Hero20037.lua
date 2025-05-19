-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20037.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20037_Define")

Hero20037 = class("Hero20037", AnimalBase)

function Hero20037:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletTraceVec3 = Vector3.zero
	self.bulletTraceVec3.z = Hero20037_Define.BulletTraceSpeed
end

function Hero20037:Start()
	AnimalBase.Start(self)
end

function Hero20037:Show()
	AnimalBase.Show(self)

	local tfRoot1 = self:GetWeaponBox(1)

	self:CreateSelfEffectLoop("self_1", tfRoot1, "vfx_20037_self_1")

	local tfRoot2 = self:GetWeaponBox(4)

	self:CreateSelfEffectLoop("self_2", tfRoot2, "vfx_20037_self_1")

	local tfRoot3 = self:GetWeaponBox(5)

	self:CreateSelfEffectLoop("self_3", tfRoot3, "vfx_20037_self_1")
end

function Hero20037:Hide()
	AnimalBase.Hide(self)
	self:ClearSelfEffectLoop("self_1")
	self:ClearSelfEffectLoop("self_2")
	self:ClearSelfEffectLoop("self_3")
end

function Hero20037:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)
end

function Hero20037:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20037:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20037:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20037:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20037:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20037_Define.SkillType.SkillS then
		if trigger > 0 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20037_Define.BulletTraceRangeMax, Hero20037_Define.BulletTraceRangeMax, Hero20037_Define.BulletTraceRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, skillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetSpeedAngle(Hero20037_Define.BulletTraceAngleSpeed)
					bullet:SetLifeTime(Hero20037_Define.BulletTraceLifeTime)
					bullet:Ready()
					bullet:SetSkillTargetAnimal(GameAI.GetAttackTarget(self), true)
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20037_Define.SkillType.SkillSP and trigger > 0 then
		local bulletTarget = GameAI.GetAttackTarget(self)

		if bulletTarget ~= nil then
			local bulletSkillData = MS_SkillData.GetSkillData(self.heroId, Hero20037_Define.SkillType.SkillSP, 1)
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local shootDir = self:GetForward()
			local diffAngle = 360 * (Hero20037_Define.BulletTraceNum - trigger) / Hero20037_Define.BulletTraceNum
			local rot = Quaternion.AngleAxis(diffAngle, shootDir)
			local tmpUp = Vector3.up

			tmpUp:MulQuat(rot)

			local targetPos = shootDir + tmpUp

			targetPos:SetNormalize()
			targetPos:Mul(Hero20037_Define.BulletTraceRangeMax)
			targetPos:Add(startPos)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, bulletSkillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetSpeedAngle(Hero20037_Define.BulletTraceAngleSpeed)
					bullet:SetLifeTime(Hero20037_Define.BulletTraceLifeTime)
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

function Hero20037:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20037:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20037:IsSkillCounterAttackedStart(attackVPlayer, skillIndex, skillCombo)
	local attHeroId = attackVPlayer:GetHeroId()

	if AnimalBase.IsSkillCounterAttackedEnable(attHeroId, skillIndex, skillCombo) == true and self:IsSkilling() == true and self:IsSkillingById(AnimalBase_Define.SkillType.CounterAttack, 0) == false then
		local attSkillData = MS_SkillData.GetSkillData(attHeroId, skillIndex, skillCombo)
		local hitSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if attSkillData ~= nil and hitSkillData ~= nil and hitSkillData.CounterAttack > attSkillData.CounterAttack then
			local tmpSkillCounterAttack = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillCounterAttack)

			if DebugTestSkillCounterAttack == true then
				tmpSkillCounterAttack = 1
			end

			if tmpSkillCounterAttack > 0 then
				local skillDataCounterAttack = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.CounterAttack, 1)

				if skillDataCounterAttack ~= nil then
					local nowPos = self:GetPosByWorldPos()
					local attackPos = attackVPlayer:GetPosition()
					local attackDis = Vector3.Distance(nowPos, attackPos)
					local nowForward = self:GetLeft()
					local nowPos = self:GetPosByWorldPos()

					if attackDis < AnimalBase_Define.AutoLockDistance then
						local lockAngle = MathHelper.getValueInRadioRange(attackDis, 0, AnimalBase_Define.AutoLockDistance, AnimalBase_Define.AutoLockAngleDistanceMin, AnimalBase_Define.AutoLockAngleDistanceMax)
						local tmpLockDir = attackPos - nowPos

						tmpLockDir.y = 0

						local tmpAngle = Vector3.Angle(tmpLockDir, nowForward)

						if tmpAngle < lockAngle then
							tmpLockDir = nil

							return true
						end

						tmpLockDir = nil
					end
				end
			end
		end
	end

	return false
end

function Hero20037:GetCaptureDistanceAndHeight()
	return Hero20037_Define.SkillCaptureOffset, Hero20037_Define.SkillCaptureDistance, Hero20037_Define.SkillCaptureHeight
end

function Hero20037:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20037:Exit()
	AnimalBase.Exit(self)

	self.bulletTraceVec3 = nil
end

return Hero20037
