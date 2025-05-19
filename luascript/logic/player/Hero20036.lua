-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20036.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20036_Define")

Hero20036 = class("Hero20036", AnimalBase)

function Hero20036:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20036:Start()
	AnimalBase.Start(self)
end

function Hero20036:Show()
	AnimalBase.Show(self)
end

function Hero20036:Hide()
	AnimalBase.Hide(self)
end

function Hero20036:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)
end

function Hero20036:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20036:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20036:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20036:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20036:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_20036_self_1")
		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(2), "vfx_20036_self_1")
		AudioCtrl.SetHeroAudio(self.modelName .. "/torch", self.tfModel, self:GetAnimalId())
	else
		self:ClearSelfEffectLoop("self_1")
		self:ClearSelfEffectLoop("self_2")
		AudioCtrl.StopHeroAudio(self.modelName .. "/torch", self:GetAnimalId())
	end
end

function Hero20036:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20036:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20036:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20036:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20036:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20036_Define.SkillType.SkillO1 and trigger > 0 then
		self:AddGrade(false)
	end
end

function Hero20036:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20036:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20036:UpdateQuality(force)
	AnimalBase.UpdateQuality(self, force)

	if self.animalGrade > 1 then
		-- block empty
	end
end

function Hero20036:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20036:Exit()
	AnimalBase.Exit(self)
end

return Hero20036
