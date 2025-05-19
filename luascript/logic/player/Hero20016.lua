-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20016.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20016_Define")

Hero20016 = class("Hero20016", AnimalBase)

function Hero20016:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20016:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
	end
end

function Hero20016:Start()
	AnimalBase.Start(self)
end

function Hero20016:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20016:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20016:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20016:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and (self.skillIndex == Hero20016_Define.SkillType.SkillOP or self.skillIndex == Hero20016_Define.SkillType.SkillO) and self.skillCombo == 1 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20016:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20016:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if (self.skillIndex == Hero20016_Define.SkillType.SkillOP or self.skillIndex == Hero20016_Define.SkillType.SkillO) and self.skillCombo == 2 then
		self:StopSkillAudio()
	end
end

function Hero20016:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20016:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20016:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20016:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == AnimalBase_Define.SkillType.Relax and self.skillCombo == 2 then
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20016:GetCaptureDistanceAndHeight()
	return Hero20016_Define.SkillCaptureOffset, Hero20016_Define.SkillCaptureDistance, Hero20016_Define.SkillCaptureHeight
end

function Hero20016:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20016:Exit()
	AnimalBase.Exit(self)
end

return Hero20016
