-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20028.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20028_Define")

Hero20028 = class("Hero20028", AnimalBase)

function Hero20028:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero20028_Define.BulletSpeed
end

function Hero20028:Start()
	AnimalBase.Start(self)

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20028:Show()
	AnimalBase.Show(self)
end

function Hero20028:Hide()
	AnimalBase.Hide(self)
end

function Hero20028:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20028:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == Hero20028_Define.SkillType.SkillSP and self.skillCombo == 2 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self:SetSkillTarget(hitPlayer)
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20028:GetGradeThreshold()
	return 0
end

function Hero20028:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20028:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20028:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20028:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20028:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20028_Define.SkillType.SkillO and self.skillCombo == 1 and trigger == 1 then
		local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
		local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20028_Define.BulletRangeMax, Hero20028_Define.BulletRangeMax, Hero20028_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

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

function Hero20028:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20028_Define.SkillType.SkillSP and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	elseif self.skillIndex == Hero20028_Define.SkillType.SkillOP then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20028:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20028:GetShootDistanceMax()
	return Hero20028_Define.BulletRangeMax
end

function Hero20028:Exit()
	self.bulletSpeedVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20028
