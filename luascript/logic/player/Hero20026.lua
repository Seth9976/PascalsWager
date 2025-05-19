-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20026.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20026_Define")

Hero20026 = class("Hero20026", AnimalBase)

function Hero20026:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.skillBlockIndexLast = 0
	self.skillBlockComboLast = 0

	self:SetSkillConditionAll(1)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
end

function Hero20026:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
	end
end

function Hero20026:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 then
		self:AddGrade(true)
	else
		self:ResetGrade()
	end
end

function Hero20026:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20026:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20026:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20026:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20026:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20026:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20026:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20026:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade <= 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
	end
end

function Hero20026:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20026:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20026:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20026_Define.SkillType.SkillDefence1 or self.skillIndex == Hero20026_Define.SkillType.SkillDefence2 or self.skillIndex == Hero20026_Define.SkillType.SkillDefence3 or self.skillIndex == Hero20026_Define.SkillType.SkillDefence4 then
		self:SetBlockSkill(self.skillIndex, self.skillCombo)
	end
end

function Hero20026:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20026:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20026:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20026_Define.SkillType.SkillLLL1 or self.skillIndex == Hero20026_Define.SkillType.SkillLLL3 then
		if self.skillCombo == 3 and trigger == 1 then
			self:SetSkillConditionAll(2)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
		end
	elseif self.skillIndex == Hero20026_Define.SkillType.SkillLLL2 or self.skillIndex == Hero20026_Define.SkillType.SkillLLL4 then
		if self.skillCombo == 3 and trigger == 1 then
			self:SetSkillConditionAll(1)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
		end
	elseif self.skillIndex == Hero20026_Define.SkillType.SkillO and trigger > 0 then
		self:AddGrade(false)
	end
end

function Hero20026:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20026:SetBlockSkill(skillIndex, skillCombo)
	self.skillBlockIndexLast = skillIndex
	self.skillBlockComboLast = skillCombo
end

function Hero20026:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20026:Exit()
	AnimalBase.Exit(self)
end

return Hero20026
