-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20002.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20002_Define")

Hero20002 = class("Hero20002", AnimalBase)

function Hero20002:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero20002_Define.BulletSpeed
end

function Hero20002:Start()
	AnimalBase.Start(self)
end

function Hero20002:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20002:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20002:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20002:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20002:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20002:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20002_Define.SkillType.SkillAimShoot then
		if self.skillCombo == 3 and trigger == 1 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local targetPos = self:AdjustShootTargetByDistance(startPos, self:GetSkillButtonTarget(), self:GetShootDistanceMax())

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end

				self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20002_Define.WeaponIndex, false)
			end
		end
	elseif self.skillIndex == Hero20002_Define.SkillType.SkillShoot then
		if self.skillCombo == 2 then
			if trigger == 1 then
				local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20002_Define.BulletRangeMax, Hero20002_Define.BulletRangeMax, Hero20002_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:Ready()
						bullet:Start()
					end

					self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20002_Define.WeaponIndex, false)
				end
			elseif trigger == 2 then
				self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20002_Define.WeaponIndex, true)
			end
		end
	elseif self.skillIndex == Hero20002_Define.SkillType.SkillLLL then
		-- block empty
	end
end

function Hero20002:OnSkillEnd(skillIndexNext, skillComboNext)
	self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20002_Define.WeaponIndex, true)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20002:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20002:GetShootDistanceMax()
	return Hero20002_Define.BulletRangeMax
end

function Hero20002:Exit()
	self.bulletSpeedVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20002
