-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20043.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20043_Define")

Hero20043 = class("Hero20043", AnimalBase)

function Hero20043:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletAccVec3 = Vector3.zero
	self.bulletAccVec3.y = Hero20043_Define.BulletGravity
end

function Hero20043:Start()
	AnimalBase.Start(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		self:SetSkillCondition(Hero20043_Define.SkillType.SkillLP, AnimalBase_Define.SkillCallCondition)
		self:SetSkillCondition(Hero20043_Define.SkillType.SkillLPC, AnimalBase_Define.SkillCallCondition)
		self:SetLockDisable(true)
		self:SetBodyCollider(false)
	else
		self:SetSkillCondition(Hero20043_Define.SkillType.SkillLP, 1)
		self:SetSkillCondition(Hero20043_Define.SkillType.SkillLPC, 1)
	end
end

function Hero20043:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false or self.callFromHeroId ~= AnimalBase_Define.CallHost_10006 then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(2), "vfx_20043_self_2")
		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(3), "vfx_20043_self_2")
		self:CreateSelfEffectLoop("self_3", self:GetWeaponBox(4), "vfx_20043_self_2")
		self:CreateSelfEffectLoop("self_4", self:GetWeaponBox(5), "vfx_20043_self_2")
		self:CreateSelfEffectLoop("self_5", self:GetWeaponBox(6), "vfx_20043_self_1")
	end
end

function Hero20043:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
	self:ClearSelfEffectLoop("self_1")
	self:ClearSelfEffectLoop("self_2")
	self:ClearSelfEffectLoop("self_3")
	self:ClearSelfEffectLoop("self_4")
	self:ClearSelfEffectLoop("self_5")
end

function Hero20043:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20043:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20043:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20043:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20043:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20043_Define.SkillType.SkillSP or self.skillIndex == Hero20043_Define.SkillType.SkillS then
		if trigger > 0 then
			local weaponBox = self:GetWeaponBox(6)
			local startPos = weaponBox.position
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20043_Define.BulletRange, Hero20043_Define.BulletRangeMin, Hero20043_Define.BulletRangeMax, Hero20043_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20043_Define.BulletAngle, Hero20043_Define.BulletGravity)

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
	elseif self.skillIndex == Hero20043_Define.SkillType.SkillLPC and self.skillCombo == 1 and trigger == 2 then
		self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
	end
end

function Hero20043:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20043_Define.SkillType.SkillHP then
		if self.skillCombo == 2 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20043_Define.SkillType.SkillLPC and self.skillCombo == 1 then
		self:Stop()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20043:GetUIHeadInfoPosition()
	self.uiHeadInfoPosition:SetVector3(self:GetForward())
	self.uiHeadInfoPosition:Mul(1)
	self.uiHeadInfoPosition:Add(self:GetPosByWorldPos())

	self.uiHeadInfoPosition.y = self.uiHeadInfoPosition.y + self.headInfoHeight

	return self.uiHeadInfoPosition
end

function Hero20043:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20043:Exit()
	AnimalBase.Exit(self)
end

return Hero20043
