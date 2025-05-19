-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20024.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20024_Define")

Hero20024 = class("Hero20024", AnimalBase)

function Hero20024:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20024:Start()
	AnimalBase.Start(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		self:AddGrade(true)
		self:SetSkillCondition(Hero20024_Define.SkillType.SkillLM2, AnimalBase_Define.SkillCallCondition)
		self:SetSkillCondition(Hero20024_Define.SkillType.SkillLM2C, AnimalBase_Define.SkillCallCondition)
		self:SetLockDisable(true)
		self:SetBodyCollider(false)
	else
		self:SetSkillCondition(Hero20024_Define.SkillType.SkillLM2, 1)
		self:SetSkillCondition(Hero20024_Define.SkillType.SkillLM2C, 1)
	end
end

function Hero20024:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20024:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20024:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20024:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == Hero20024_Define.SkillType.SkillO2 and self.skillCombo == 1 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero20024:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20024:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20024:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20024:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20024:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.animalGrade - 1, 0, 0)
end

function Hero20024:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20024:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20024:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20024:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20024:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20024_Define.SkillType.SkillO1 then
		if trigger > 0 then
			self:AddGrade(false)
		end
	elseif self.skillIndex == Hero20024_Define.SkillType.SkillLM2C and self.skillCombo == 5 and trigger == 2 then
		self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
	end
end

function Hero20024:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20024:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20024_Define.SkillType.SkillLM2C and self.skillCombo == 5 then
		self:Stop()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20024:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20024:Exit()
	AnimalBase.Exit(self)
end

return Hero20024
