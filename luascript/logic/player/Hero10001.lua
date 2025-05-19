-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10001.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10001_Define")
require("GameData/PlayerDefine/Hero10006_Define")

Hero10001 = class("Hero10001", AnimalBase)

function Hero10001:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Hero)

	self.defencePose = 0
end

function Hero10001:Start()
	AnimalBase.Start(self)
end

function Hero10001:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero10001:IsMutekiForSkill(hitAnimal)
	local ret = AnimalBase.IsMutekiForSkill(self, hitAnimal)

	if ret == true then
		return true
	end

	if self:IsSkillingSkill() == true and self.skillIndex == AnimalBase_Define.SkillType.CounterAttack and self.skillCombo == 2 then
		local hitData = hitAnimal:GetHitData()

		if hitData ~= nil then
			local attackVPlayer = hitData:GetAttackVirtualPlayer()
			local skillData = hitData:GetSkillData()

			if attackVPlayer:GetAnimalId() == self:GetAnimalId() and skillData ~= nil and skillData.SkillIndex == self.skillIndex and skillData.SkillCombo == 1 then
				return false
			end
		end

		return true
	end

	return false
end

function Hero10001:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero10001:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero10001_Define.SkillType.SkillDefence then
		if self.skillCombo == 1 then
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
		end
	elseif self.skillIndex == Hero10001_Define.SkillType.SkillHHH2 and self.skillCombo == 1 then
		self:SetSkillButtonLongPressUsed()
	end
end

function Hero10001:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	if self.skillIndex == Hero10001_Define.SkillType.SkillHP and self.skillCombo == 2 or self.skillIndex == Hero10001_Define.SkillType.SkillHPP and self.skillCombo == 2 or self.skillIndex == Hero10001_Define.SkillType.SkillHPPT and self.skillCombo == 2 or self.skillIndex == Hero10001_Define.SkillType.SkillHHH1 and self.skillCombo == 2 then
		self:StopSkillAudio()
		self:ClearSkillEffectAll()
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero10001:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero10001:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero10001:OnHitTrigger(trigger)
	AnimalBase.OnHitTrigger(self, trigger)

	if (self.moveHitType == AnimalBase_Define.HitType.FrontFlyCrow or self.moveHitType == AnimalBase_Define.HitType.BackFlyCrow) and trigger == AnimalBase_Define.TriggerHit.FollowAttack and self.storyId == 8 then
		self.scene:OpenTrick(Hero10006_Define.TrickId_SkillDash, self:GetBodyChest().position, Quaternion.s_identity)
	end
end

function Hero10001:OnSkillLoopEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillLoopEnd(self, skillIndexNext, skillComboNext)

	if self.skillIndex == Hero10001_Define.SkillType.SkillDefence and self.skillCombo == 2 then
		local skillDir = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDir)

		if skillDir == 4 then
			self.defencePose = 1
		else
			self.defencePose = 0
		end

		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.defencePose, 0, 0)
	end
end

function Hero10001:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero10001_Define.SkillType.SkillDefence then
		if self.skillCombo == 4 then
			self.defencePose = 1 - self.defencePose

			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.defencePose, 0, 0)
		end
	elseif (self.skillIndex == Hero10001_Define.SkillType.SkillLH or self.skillIndex == Hero10001_Define.SkillType.SkillLHT) and self.skillCombo == 1 then
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero10001:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifySanHeroDead()
		end
	end
end

function Hero10001:GetHitUpUpTimeConfig()
	return Hero10001_Define.HitUpUpTimeHitTime1, Hero10001_Define.HitUpUpTimeHitTime2, Hero10001_Define.HitUpUpTimeResetTime1, Hero10001_Define.HitUpUpTimeResetTime2
end

function Hero10001:SetUI()
	AnimalBase.SetUI(self)
end

function Hero10001:Exit()
	AnimalBase.Exit(self)
end

return Hero10001
