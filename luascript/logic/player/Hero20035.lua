-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20035.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20035_Define")

Hero20035 = class("Hero20035", AnimalBase)

function Hero20035:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletTraceVec3 = Vector3.zero
	self.bulletTraceVec3.z = Hero20035_Define.BulletTraceSpeed
	self.SkillSP1Effect = nil
end

function Hero20035:Start()
	AnimalBase.Start(self)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20035_Define.EquipmentHand, false)
end

function Hero20035:Show()
	AnimalBase.Show(self)
end

function Hero20035:Hide()
	AnimalBase.Hide(self)
end

function Hero20035:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)
end

function Hero20035:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20035:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20035_Define.EquipmentHand, true)
end

function Hero20035:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20035:ResetGrade()
	AnimalBase.ResetGrade(self)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Grade, Hero20035_Define.EquipmentHand, false)
end

function Hero20035:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_20035_self_1")
	else
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero20035:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20035:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if self.skillIndex == Hero20035_Define.SkillType.SkillSP1 and self.skillCombo == 1 then
			local hitPlayer = hitData:GetHitPlayer()

			if hitPlayer ~= nil then
				local tmpVfxRoot = self:GetEffectRoot(skillData.HitEffectRoot)

				self.SkillSP1Effect = VfxManager.PlayTransformFreezeMulti(hitPlayer:GetBodyChest(), skillData[AnimalBase_Define.VfxSkillKey1])

				if self.SkillSP1Effect ~= nil then
					self.SkillSP1Effect:AddMultipleBind(1, self:GetWeaponBox(1))
					self.SkillSP1Effect:AddMultipleBind(2, hitPlayer:GetBodyChest())
					self.SkillSP1Effect:SetDelayClear(true, nil)
				end
			end
		end
	end
end

function Hero20035:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20035:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20035:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20035:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20035_Define.SkillType.SkillO1 then
		if trigger > 0 then
			self:AddGrade(false)
		end
	elseif self.skillIndex == Hero20035_Define.SkillType.SkillS1 and trigger > 0 then
		local bulletTarget = GameAI.GetAttackTarget(self)

		if bulletTarget ~= nil then
			local bulletSkillData = MS_SkillData.GetSkillData(self.heroId, Hero20035_Define.SkillType.SkillS1, 1)
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local shootDir = self:GetForward()
			local diffAngle = 360 * (Hero20035_Define.BulletTraceNum - trigger) / Hero20035_Define.BulletTraceNum
			local rot = Quaternion.AngleAxis(diffAngle, shootDir)
			local tmpUp = Vector3.up

			tmpUp:MulQuat(rot)

			local targetPos = shootDir + tmpUp

			targetPos:SetNormalize()
			targetPos:Mul(Hero20035_Define.BulletTraceRangeMax)
			targetPos:Add(startPos)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, bulletSkillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetSpeedAngle(Hero20035_Define.BulletTraceAngleSpeed)
					bullet:SetLifeTime(Hero20035_Define.BulletTraceLifeTime)
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

function Hero20035:GetCaptureDistanceAndHeight()
	return Hero20035_Define.SkillCaptureOffset, Hero20035_Define.SkillCaptureDistance, Hero20035_Define.SkillCaptureHeight
end

function Hero20035:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20035:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20035_Define.SkillType.SkillSP1 and self.skillCombo == 1 then
		if self.SkillSP1Effect ~= nil then
			self.SkillSP1Effect:ClearMultipleBind()
			self.SkillSP1Effect:Clear()
		end

		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20035:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20035:Exit()
	self.bulletTraceVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20035
