-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20033.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20033_Define")

Hero20033 = class("Hero20033", AnimalBase)

function Hero20033:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20033:Start()
	AnimalBase.Start(self)
end

function Hero20033:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20033:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20033:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20033:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)
end

function Hero20033:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20033:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20033:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20033:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20033:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20033:OnSkillEnd(skillIndexNext, skillComboNext)
	if (self.skillIndex == Hero20033_Define.SkillType.SkillDP or self.skillIndex == Hero20033_Define.SkillType.SkillLP) and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20033:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20033:Exit()
	AnimalBase.Exit(self)
end

return Hero20033
