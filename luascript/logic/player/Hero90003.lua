-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90003.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90003_Define")

Hero90003 = class("Hero90003", AnimalBase)

function Hero90003:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletTraceVec3 = Vector3.zero
	self.bulletTraceVec3.z = Hero90003_Define.BulletTraceSpeed
end

function Hero90003:Start()
	AnimalBase.Start(self)
	self:SetMoveThroughAll(true)
end

function Hero90003:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Born and self.animatorTime > Hero90003_Define.BornTimeStart and self.animatorTime <= Hero90003_Define.BornTimeEnd then
		local rebornPos = self:GetRebornPosition()

		XAnimator.SetMatchTarget(self:GetAnimalId(), self.animatorLayer, rebornPos.x, rebornPos.y, rebornPos.z, self.animatorTime, Hero90003_Define.BornTimeEnd)
	end
end

function Hero90003:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero90003_Define.SkillType.SkillL and self.skillCombo == 1 and trigger == 1 then
		local startPos = self:GetWeaponBox(1).position
		local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero90003_Define.BulletTraceRangeMax, Hero90003_Define.BulletTraceRangeMax, Hero90003_Define.BulletTraceRangeMax, AnimalBase_Define.ShootTargetAngleMax)

		if self.controllerBullet ~= nil then
			local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Trace, self, skillData, nil, startPos, targetPos, self.bulletTraceVec3, Vector3.s_zero)
			local bullet = self.controllerBullet:GetBullet(bulletIndex)

			if bullet ~= nil then
				bullet:SetSpeedAngle(Hero90003_Define.BulletTraceAngleSpeed)
				bullet:SetLifeTime(Hero90003_Define.BulletTraceLifeTime)
				bullet:Ready()
				bullet:SetSkillTargetAnimal(GameAI.GetAttackTarget(self), true)
				bullet:Start()
			end
		end

		if skillData.TrapId > 0 then
			local nowPos = self:GetPosByWorldPos()
			local tmpVPlayer = self:GetVirtualPlayer()

			self.scene:AddTrap(skillData.TrapId, nowPos, tmpVPlayer, tmpVPlayer:GetTeamId())
		end

		self:SetMoveMuteki(true)
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
	end
end

function Hero90003:Reborn(reset, propertyRateList)
	AnimalBase.Reborn(self, reset, propertyRateList)
	self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
end

function Hero90003:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero90003_Define.SkillType.SkillL then
		self:SetMoveMuteki(false)

		if self.skillCombo == 1 and self.animatorEnd == true then
			self:SkillDeadReady(AnimalBase_Define.DeadReason.Skill)
		end
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90003:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero90003:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero90003:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90003:Exit()
	AnimalBase.Exit(self)
end

return Hero90003
