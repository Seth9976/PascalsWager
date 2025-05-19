-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20011.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20011_Define")

Hero20011 = class("Hero20011", AnimalBase)

function Hero20011:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20011:Start()
	AnimalBase.Start(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		self:SetSkillCondition(Hero20011_Define.SkillType.SkillHP, AnimalBase_Define.SkillCallCondition)
		self:SetSkillCondition(Hero20011_Define.SkillType.SkillHPC, AnimalBase_Define.SkillCallCondition)
		self:SetLockDisable(true)
		self:SetBodyCollider(false)
	else
		self:SetSkillCondition(Hero20011_Define.SkillType.SkillHP, 1)
		self:SetSkillCondition(Hero20011_Define.SkillType.SkillHPC, 1)
	end
end

function Hero20011:Born(reason, toBorn)
	AnimalBase.Born(self, reason, toBorn)
	self:PlayEffect(self:GetTransform(), "vfx_20011_born", 1)
end

function Hero20011:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20011:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20011:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20011:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20011:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20011:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20011:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20011:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20011_Define.SkillType.SkillSP then
		if self.skillCombo >= 3 and trigger > 0 and self:IsPulling() == true then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
				local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())

				targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, false)
			end
		end
	elseif self.skillIndex == Hero20011_Define.SkillType.SkillHPC and self.skillCombo == 1 and trigger == 2 then
		self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
	end
end

function Hero20011:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20011_Define.SkillType.SkillSP then
		if self.skillCombo == 3 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20011_Define.SkillType.SkillHPC and self.skillCombo == 1 then
		self:Stop()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20011:GetCaptureDistanceAndHeight()
	return Hero20011_Define.SkillCaptureOffset, Hero20011_Define.SkillCaptureDistance, Hero20011_Define.SkillCaptureHeight
end

function Hero20011:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20011:Exit()
	AnimalBase.Exit(self)
end

return Hero20011
