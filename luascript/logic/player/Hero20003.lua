-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20003.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20003_Define")

Hero20003 = class("Hero20003", AnimalBase)

function Hero20003:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero20003_Define.BulletSpeedZ
	self.bulletSpeedVec3.y = Hero20003_Define.BulletSpeedY
	self.bulletAccVec3 = Vector3.zero
	self.bulletAccVec3.y = Hero20003_Define.BulletGravity
end

function Hero20003:Start()
	AnimalBase.Start(self)
	self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
end

function Hero20003:Show()
	AnimalBase.Show(self)
end

function Hero20003:Hide()
	AnimalBase.Hide(self)
end

function Hero20003:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20003:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20003:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20003:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20003_Define.SkillType.Sputa and trigger == 1 then
		local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
		local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20003_Define.BulletRangeMax, Hero20003_Define.BulletRangeMax, Hero20003_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

		if self.controllerBullet ~= nil then
			local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, self.bulletAccVec3)
			local bullet = self.controllerBullet:GetBullet(bulletIndex)

			if bullet ~= nil then
				bullet:Ready()
				bullet:Start()
			end
		end
	end
end

function Hero20003:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20003:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20003:GetShootDistanceMax()
	return Hero20003_Define.BulletRangeMax
end

function Hero20003:Exit()
	self.bulletSpeedVec3 = nil
	self.bulletAccVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20003
