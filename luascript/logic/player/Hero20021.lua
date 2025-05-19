-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20021.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20021_Define")

Hero20021 = class("Hero20021", AnimalBase)

function Hero20021:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20021:Start()
	AnimalBase.Start(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		self:SetSkillCondition(Hero20021_Define.SkillType.SkillHPH, AnimalBase_Define.SkillCallCondition)
		self:SetSkillCondition(Hero20021_Define.SkillType.SkillHPHC, AnimalBase_Define.SkillCallCondition)
		self:SetLockDisable(true)
		self:SetBodyCollider(false)
	else
		self:SetSkillCondition(Hero20021_Define.SkillType.SkillHPH, 1)
		self:SetSkillCondition(Hero20021_Define.SkillType.SkillHPHC, 1)
	end
end

function Hero20021:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20021:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20021:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20021:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20021:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20021:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20021:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	if self.skillIndex == Hero20021_Define.SkillType.SkillHPHC and self.skillCombo == 1 and trigger == 2 then
		self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
	end
end

function Hero20021:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == AnimalBase_Define.SkillType.Relax then
		if self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20021_Define.SkillType.SkillHPHC and self.skillCombo == 1 then
		self:Stop()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20021:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20021:Exit()
	AnimalBase.Exit(self)
end

return Hero20021
