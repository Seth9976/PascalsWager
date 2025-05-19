-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20029.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20029_Define")

Hero20029 = class("Hero20029", AnimalBase)

function Hero20029:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20029:Start()
	AnimalBase.Start(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		self:AddGrade(true)
		self:SetSkillCondition(Hero20029_Define.SkillType.SkillNLP, AnimalBase_Define.SkillCallCondition)
		self:SetSkillCondition(Hero20029_Define.SkillType.SkillNLPC, AnimalBase_Define.SkillCallCondition)
		self:SetLockDisable(true)
		self:SetBodyCollider(false)
	else
		self:SetSkillCondition(Hero20029_Define.SkillType.SkillNLP, 1)
		self:SetSkillCondition(Hero20029_Define.SkillType.SkillNLPC, 1)
	end
end

function Hero20029:Show()
	AnimalBase.Show(self)
end

function Hero20029:Hide()
	AnimalBase.Hide(self)
end

function Hero20029:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20029:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20029:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20029:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20029:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20029:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.animalGrade - 1, 0, 0)
end

function Hero20029:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20029:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20029:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20029:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20029:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	if self.skillIndex == Hero20029_Define.SkillType.SkillO then
		if trigger > 1 then
			self:AddGrade(false)
		end
	elseif self.skillIndex == Hero20029_Define.SkillType.SkillS then
		if trigger > 0 and self:GetBrain() ~= nil then
			local friendList = GameAI.GetSelectTarget(self, GameAI.SkillTargetType.Friend)
			local target = self:GetBrain():GetAnimalTarget()

			if target ~= nil and target:IsDead() == false and target:IsShow() == true then
				for k, v in pairs(friendList) do
					local friendTarget = v

					if friendTarget ~= nil and friendTarget:IsDead() == false and friendTarget:IsShow() == true and friendTarget:GetHeroId() == self:GetHeroId() and friendTarget:GetBrain():GetAnimalTarget() == nil and Vector3.DistanceSquare(self:GetPosByWorldPos(), friendTarget:GetPosByWorldPos()) <= Hero20029_Define.SkillSRange * Hero20029_Define.SkillSRange then
						friendTarget:GetBrain():SetAnimalTarget(target)
					end
				end
			end
		end
	elseif self.skillIndex == Hero20029_Define.SkillType.SkillNLPC and self.skillCombo == 2 and trigger == 2 then
		self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
	end
end

function Hero20029:OnSkillEnd(skillIndexNext, skillComboNext)
	if (self.skillIndex == Hero20029_Define.SkillType.SkillHP or self.skillIndex == Hero20029_Define.SkillType.SkillNHP or self.skillIndex == Hero20029_Define.SkillType.SkillNLP or self.skillIndex == Hero20029_Define.SkillType.SkillNLPC) and self.skillCombo == 1 then
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	end

	if self.skillIndex == Hero20029_Define.SkillType.SkillNLPC and self.skillCombo == 2 then
		self:Stop()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20029:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20029:Exit()
	AnimalBase.Exit(self)
end

return Hero20029
