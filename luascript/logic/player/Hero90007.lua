-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90007.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90007_Define")

Hero90007 = class("Hero90007", AnimalBase)

function Hero90007:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero90007_Define.BulletSpeed
end

function Hero90007:Start()
	AnimalBase.Start(self)

	if self.heroVariety == 1 then
		self:SetSkillConditionAll(1)
	else
		self:SetSkillConditionAll(2)
	end
end

function Hero90007:Show()
	AnimalBase.Show(self)
end

function Hero90007:Hide()
	AnimalBase.Hide(self)
end

function Hero90007:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifyCrowDisappear()
		end
	end
end

function Hero90007:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero90007:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero90007:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero90007:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero90007_Define.SkillType.SkillS and self.skillCombo == 1 and trigger == 1 then
		local weaponBox = self:GetWeaponBox(1)
		local startPos = weaponBox.position
		local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero90007_Define.BulletRangeMax, Hero90007_Define.BulletRangeMax, Hero90007_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

		if self.controllerBullet ~= nil then
			local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
			local bullet = self.controllerBullet:GetBullet(bulletIndex)

			if bullet ~= nil then
				bullet:Ready()
				bullet:Start()
			end
		end
	end
end

function Hero90007:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90007:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90007:GetShootDistanceMax()
	return Hero90007_Define.BulletRangeMax
end

function Hero90007:Exit()
	self.bulletSpeedVec3 = nil

	AnimalBase.Exit(self)
end

return Hero90007
