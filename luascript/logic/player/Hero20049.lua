-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20049.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20049_Define")

Hero20049 = class("Hero20049", AnimalBase)

function Hero20049:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletAccVec3 = Vector3.zero
	self.bulletAccVec3.y = Hero20049_Define.BulletGravity
	self.heroVariety = 2
end

function Hero20049:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
	end
end

function Hero20049:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 and self.characterConfig ~= nil then
		local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

		if mat ~= nil then
			self:ChangeMaterial(mat)
		end
	end
end

function Hero20049:Show()
	AnimalBase.Show(self)

	if self.heroExtAiMode ~= GameAI.BehaviourMode.DoNotAttack then
		AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
	end
end

function Hero20049:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20049:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20049:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20049_Define.SkillType.SkillS then
		if self.skillCombo == 1 and trigger == 1 then
			local startPos = self:GetWeaponBox(2).position
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20049_Define.BulletRange, Hero20049_Define.BulletRangeMin, Hero20049_Define.BulletRangeMax, Hero20049_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20049_Define.BulletAngle, Hero20049_Define.BulletGravity)

			self.bulletSpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, self.bulletAccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
				end
			end
		end
	elseif self.skillIndex == Hero20049_Define.SkillType.SkillSP and self.skillCombo == 1 and trigger > 0 then
		local startPos = Vector3.zero

		if trigger == 1 or trigger == 3 then
			startPos = self:GetWeaponBox(2).position
		else
			startPos = self:GetWeaponBox(1).position
		end

		local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20049_Define.BulletRange, Hero20049_Define.BulletRangeMin, Hero20049_Define.BulletRangeMax, Hero20049_Define.BulletAngleMax)
		local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20049_Define.BulletAngle, Hero20049_Define.BulletGravity)

		self.bulletSpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

		if self.controllerBullet ~= nil then
			local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, self.bulletAccVec3)
			local bullet = self.controllerBullet:GetBullet(bulletIndex)

			if bullet ~= nil then
				bullet:Ready()
				bullet:Start()
				self:PlaySkillEffect(true)
			end
		end
	end
end

function Hero20049:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20049:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20049:GetCaptureDistanceAndHeight()
	return Hero20049_Define.SkillCaptureOffset, Hero20049_Define.SkillCaptureDistance, Hero20049_Define.SkillCaptureHeight
end

function Hero20049:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20049:Exit()
	self.bulletSpeedVec3 = nil
	self.bulletAccVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20049
