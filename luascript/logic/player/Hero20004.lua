-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20004.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20004_Define")

Hero20004 = class("Hero20004", AnimalBase)

function Hero20004:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20004:Start()
	AnimalBase.Start(self)
	self:SetSpeedSmooth(false)
end

function Hero20004:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20004:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20004:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20004:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20004:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20004:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20004:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20004:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20004:Exit()
	AnimalBase.Exit(self)
end

return Hero20004
