-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20013.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20013_Define")

Hero20013 = class("Hero20013", AnimalBase)

function Hero20013:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletLSpeedVec3 = Vector3.zero
	self.bulletLAccVec3 = Vector3.zero
	self.bulletLAccVec3.y = Hero20013_Define.BulletLGravity
end

function Hero20013:Start()
	AnimalBase.Start(self)
end

function Hero20013:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20013:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20013:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20013:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
	self:SetWeaponVisible(AnimalBase_Define.VisibleType.Grade, Hero20013_Define.WeaponBomb, false)
end

function Hero20013:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20013:ResetGrade()
	AnimalBase.ResetGrade(self)
	self:SetWeaponVisible(AnimalBase_Define.VisibleType.Grade, Hero20013_Define.WeaponBomb, true)
end

function Hero20013:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.animalGrade - 1, 0, 0)
end

function Hero20013:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20013:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20013:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20013:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20013:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20013_Define.SkillType.SkillSP2 then
		if self.skillCombo == 4 and trigger == 1 and self:IsPulling() == true then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
				local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())

				targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, false)
			end
		end
	elseif self.skillIndex == Hero20013_Define.SkillType.SkillO1 then
		if trigger == 1 then
			self:AddGrade(false)
		end
	elseif self.skillIndex == Hero20013_Define.SkillType.SkillO2 then
		if trigger == 1 then
			self:ResetGrade()
		end
	elseif self.skillIndex == Hero20013_Define.SkillType.SkillL1 then
		if trigger == 1 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20013_Define.BulletLRange, Hero20013_Define.BulletLRangeMin, Hero20013_Define.BulletLRangeMax, Hero20013_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20013_Define.BulletLAngle, Hero20013_Define.BulletLGravity)

			self.bulletLSpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletLSpeedVec3, self.bulletLAccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
					self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20013_Define.WeaponBomb, false)
				end
			end
		elseif trigger == 2 then
			self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20013_Define.WeaponBomb, true)
		end
	end
end

function Hero20013:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20013_Define.SkillType.SkillSP2 then
		if self.skillCombo == 2 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20013_Define.SkillType.SkillL1 then
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20013_Define.WeaponBomb, true)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20013:GetCaptureDistanceAndHeight()
	return Hero20013_Define.SkillCaptureOffset, Hero20013_Define.SkillCaptureDistance, Hero20013_Define.SkillCaptureHeight
end

function Hero20013:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20013:Exit()
	self.bulletLSpeedVec3 = nil
	self.bulletLAccVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20013
