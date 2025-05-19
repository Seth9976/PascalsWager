-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20042.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20042_Define")

Hero20042 = class("Hero20042", AnimalBase)

function Hero20042:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20042:Start()
	AnimalBase.Start(self)
end

function Hero20042:Show()
	AnimalBase.Show(self)
end

function Hero20042:Hide()
	AnimalBase.Hide(self)
end

function Hero20042:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20042:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20042:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20042:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20042:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20042:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20042:Exit()
	AnimalBase.Exit(self)
end

return Hero20042
