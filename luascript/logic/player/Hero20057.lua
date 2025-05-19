-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20057.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20057_Define")

Hero20057 = class("Hero20057", AnimalBase)
Hero20057.BulletCnt = 0
Hero20057.static.BulletCntMax = 5

function Hero20057:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletLSpeedVec3 = Vector3.zero
	self.bulletLAccVec3 = Vector3.zero
	self.bulletLAccVec3.y = Hero20057_Define.BulletLGravity
	self.bulletTargetPos = Vector3.zero
end

function Hero20057:Start()
	AnimalBase.Start(self)
	self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
end

function Hero20057:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20057:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20057_Define.SkillType.SkillL and trigger == 1 then
		local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)

		self.bulletTargetPos.x = self.bulletTargetPos.x + MathHelper.getRandom(-20, 20, self:GetAnimalId() + 1) * 0.1
		self.bulletTargetPos.z = self.bulletTargetPos.z + MathHelper.getRandom(-20, 20, self:GetAnimalId() + 2) * 0.1

		local targetPos = GameAI.GetPosByParabola(self, startPos, self.bulletTargetPos, Hero20057_Define.BulletLRange, Hero20057_Define.BulletLRangeMin, Hero20057_Define.BulletLRangeMax, Hero20057_Define.BulletAngleMax)
		local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20057_Define.BulletLAngle, Hero20057_Define.BulletLGravity)

		self.bulletLSpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

		if self.controllerBullet ~= nil then
			local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletLSpeedVec3, self.bulletLAccVec3)
			local bullet = self.controllerBullet:GetBullet(bulletIndex)

			if bullet ~= nil then
				bullet:Ready()
				bullet:Start()
				self:PlaySkillEffect(true)
			end
		end
	end
end

function Hero20057:SetBulletTargetPos(pos)
	self.bulletTargetPos:SetVector3(pos)
end

function Hero20057:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20057:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20057:Exit()
	self.bulletLSpeedVec3 = nil
	self.bulletLAccVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20057
