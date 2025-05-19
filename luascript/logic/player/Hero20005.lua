-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20005.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20005_Define")

Hero20005 = class("Hero20005", AnimalBase)

function Hero20005:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.skillBuffFrameStart = 0
end

function Hero20005:Start()
	AnimalBase.Start(self)
end

function Hero20005:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20005:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20005:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.animatorReset == false and self.skillIndex == Hero20005_Define.SkillType.SkillSP and self.skillCombo == 2 and self.skillIndexOld == self.skillIndex and self.skillComboOld == self.skillCombo and self.animatorTime < self.animatorTimeLast then
		self:PlaySkillEffect(false)
		self:PlaySkillAudio()
	end
end

function Hero20005:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20005:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20005:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20005:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20005_Define.SkillType.SkillSP and self.skillCombo == 2 and trigger == 1 and skillData.TrapId > 0 then
		local nowPos = self:GetPosByWorldPos()
		local tmpVPlayer = self:GetVirtualPlayer()

		self.scene:AddTrap(skillData.TrapId, nowPos, tmpVPlayer, tmpVPlayer:GetTeamId())
	end
end

function Hero20005:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20005_Define.SkillType.SkillSP and self.skillCombo == 2 then
		self:EndSkillCollider()
		self:EndSkillParryCollider()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20005:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20005:Exit()
	AnimalBase.Exit(self)
end

return Hero20005
