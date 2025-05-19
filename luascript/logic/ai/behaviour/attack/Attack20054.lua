-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20054.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Execute")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20054 = class("Attack20054")
Attack20054.static.SkillCd = {
	{
		Hero20054_Define.SkillType.SkillLLL1,
		2,
		true
	},
	{
		Hero20054_Define.SkillType.SkillHHHH1,
		2,
		true
	},
	{
		Hero20054_Define.SkillType.SkillHP1,
		2,
		true
	},
	{
		Hero20054_Define.SkillType.SkillLP1,
		4,
		true
	},
	{
		Hero20054_Define.SkillType.SkillSP1,
		6,
		true
	},
	{
		Hero20054_Define.SkillType.SkillOP1,
		15,
		false
	},
	{
		Hero20054_Define.SkillType.SkillLLL2,
		2,
		true
	},
	{
		Hero20054_Define.SkillType.SkillLP2,
		4,
		true
	},
	{
		Hero20054_Define.SkillType.SkillHHH2,
		2,
		true
	},
	{
		Hero20054_Define.SkillType.SkillSP2,
		4,
		true
	},
	{
		Hero20054_Define.SkillType.SkillOO1,
		8,
		false
	},
	{
		Hero20054_Define.SkillType.SkillHPO2,
		8,
		true
	},
	{
		Hero20054_Define.SkillType.SkillDDDO2,
		8,
		true
	},
	{
		Hero20054_Define.SkillType.SkillDP2,
		8,
		true
	},
	{
		Hero20054_Define.SkillType.SkillNSP2,
		6,
		true
	},
	{
		Hero20054_Define.SkillType.SkillO2,
		8,
		true
	},
	{
		Hero20054_Define.SkillType.SkillOP2,
		8,
		true
	},
	{
		Hero20054_Define.SkillType.SkillS1,
		4,
		true
	},
	{
		Hero20054_Define.SkillType.SkillNS1,
		5,
		true
	}
}
Attack20054.static.SkillProb = {
	SkillSP1 = 0.3,
	SkillDDDO2_2 = 0.4,
	SkillHPO2_2 = 0.4,
	SkillDP2 = 0.3,
	SkillOO1 = 0.3,
	SkillLP2 = 0.65,
	SkillS1 = 0.5,
	SkillOP2 = 0.4,
	SkillDDDO2_1 = 0.35,
	SkillO2 = 0.35,
	SkillNSP2 = 0.3,
	SkillHPO2_1 = 0.35,
	SkillOP1 = 0.25,
	SkillLP1 = 0.65
}
Attack20054.static.SkillRange = {
	SkillOP1 = 6,
	SkillLLL2_Min = 5,
	SkillS1_Min = 5,
	SkillSP2 = 6,
	SkillLLL2_Max = 6.5,
	SkillHPO2 = 7,
	SkillDDDO2_Min = 6,
	SkillDDDO2_Max = 15,
	SkillDP2_Min = 7,
	SkillSP1 = 8.5,
	SkillDP2_Max = 13,
	SkillNSP2 = 5,
	SkillO2_Min = 5,
	SkillHHHH1_Max = 7,
	SkillOO1_Max = 15,
	SkillLP1 = 5,
	SkillNS1 = 5,
	SkillHHH2_Max = 8,
	SkillHP1 = 5,
	SkillO2_Max = 15,
	SkillLP2 = 5,
	SkillS1_Max = 15,
	SkillHHHH1_Min = 5,
	SkillLLL1_Max = 8,
	SkillHHH2_Min = 6,
	SkillLLL1_Min = 6,
	SkillOO1_Min = 5
}
Attack20054.static.SkillAngle = {
	SkillLLL2 = 45,
	SkillHHHH1 = 45,
	SkillDP2 = 30,
	SkillSP2 = 45,
	SkillHHH2 = 45,
	SkillHPO2 = 45,
	SkillO2 = 30,
	SkillNS1 = 45,
	SkillNSP2 = 45,
	SkillOP1 = 60,
	SkillLP1 = 135,
	SkillHP1 = 60,
	SkillOO1 = 30,
	SkillLP2 = 135,
	SkillSP1_1 = 45,
	SkillDDDO2 = 30,
	SkillLLL1 = 45,
	SkillS1 = 55,
	SkillSP1_2 = 60
}
Attack20054.static.SkillSP1Time = 2.3
Attack20054.static.SkillNSP2Time = 3.5
Attack20054.static.HitMaxTime = 1
Attack20054.static.SkillO2MaxTimes = 3

function Attack20054:initialize(instance)
	self.instance = instance
	self.execute = Execute:new(instance)
	self.skillCDList = Attack20054.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.SkillO2Times = 0
	self.attackNode = self:create()
end

function Attack20054:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL2, 0)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillLLL1,
						Hero20054_Define.SkillType.SkillLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillOO1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillOO1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHPO2, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillHPO2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillS1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillS1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillSP2, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillSP2, 2)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillSP2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillNS1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillSP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20054_Define.SkillType.SkillSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillSP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20054_Define.SkillType.SkillSP1, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, Attack20054.SkillSP1Time),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillNSP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20054_Define.SkillType.SkillNSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillS1
					}),
					BT.WaitNode:create(1),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 2),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillHP1,
						Hero20054_Define.SkillType.SkillHPO2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20054_Define.SkillType.SkillHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillOP1,
						Hero20054_Define.SkillType.SkillOP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20054_Define.SkillType.SkillOP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillLP1,
						Hero20054_Define.SkillType.SkillLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20054_Define.SkillType.SkillLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillDP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20054_Define.SkillType.SkillDP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillLLL1,
						Hero20054_Define.SkillType.SkillLLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillOO1,
						Hero20054_Define.SkillType.SkillO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHHH1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHH2, 0)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillHHHH1,
						Hero20054_Define.SkillType.SkillHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2, 3),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillDDDO2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillDDDO2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillHHHH1,
						Hero20054_Define.SkillType.SkillHHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20054_Define.SkillType.SkillDDDO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				self.execute.executeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsPermitExecuteHit() == true
					end),
					BT.StopSkillNode:create(self.instance),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillS1),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.IsTargetAttackingNode:create(self.instance),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillS1_Min, Attack20054.SkillAngle.SkillS1),
							BT.GetRandomNode:create(Attack20054.SkillProb.SkillS1, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillS1_Max, Attack20054.SkillAngle.SkillS1),
							BT.GetRandomNode:create(Attack20054.SkillProb.SkillS1, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						})
					}),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillS1, 1),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalHitHand(target) == true and self.instance:IsHit() == false then
											return true
										end

										return false
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillS1, 1),
									BT.IsSkillComboNode:create(self.instance, 2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL1, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHHH1, 4)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20054.SkillRange.SkillOO1_Min, Attack20054.SkillRange.SkillOO1_Max, Attack20054.SkillAngle.SkillOO1),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillOO1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillNS1, 0),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillLLL1_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillHHHH1_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillLLL1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHHH1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillHHHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillHPO2),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOP2),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillOO1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillOO1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillNS1),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsSkilling() == true and (target:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.Defence or target:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.DefenceLoop) then
											return true
										end

										return false
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillNS1, Attack20054.SkillAngle.SkillNS1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillLP1),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20054.SkillAngle.SkillLP1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillLP1),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillLP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20054_Define.SkillType.SkillLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOO1),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20054.SkillRange.SkillOO1_Min, Attack20054.SkillRange.SkillOO1_Max, Attack20054.SkillAngle.SkillOO1),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillOO1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillSP1),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillSP1, Attack20054.SkillAngle.SkillSP1_1),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillSP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20054_Define.SkillType.SkillSP1, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and (GameAI.IsAnimalHitHand(target) == true and self.instance:IsHit() == false or GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20054.SkillAngle.SkillSP1_2) == false) then
											return true
										end

										if self.instance:IsSkillParryActive() == true then
											return true
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20054.SkillSP1Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOP1),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillHPO2),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOP2),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillOP1, Attack20054.SkillAngle.SkillOP1),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillOP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20054_Define.SkillType.SkillOP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL1),
										BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillLLL1_Min, Attack20054.SkillAngle.SkillLLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHHH1),
										BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillHHHH1_Min, Attack20054.SkillAngle.SkillHHHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillHP1),
										BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillHP1, Attack20054.SkillAngle.SkillHP1),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20054_Define.SkillType.SkillHP1, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillLLL2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillSP2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillSP2, 1),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											local skillAI = target:GetSkillTypeForAI()

											if target:IsHit() == true or skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit then
												return true
											end
										end

										return false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOO1),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOP1),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillHPO2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillHPO2_2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillO2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20054.SkillRange.SkillO2_Min, Attack20054.SkillRange.SkillO2_Max),
											BT.GetRandomNode:create(Attack20054.SkillProb.SkillO2, self.instance:GetAnimalId()),
											BT.ConditionNode:create(function()
												if self.SkillO2Times >= 0 and self.SkillO2Times < Attack20054.SkillO2MaxTimes then
													return true
												end

												return false
											end),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
											BT.CommonNode:create(function()
												self.SkillO2Times = self.SkillO2Times + 1
											end)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOO1),
											BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOP1),
											BT.GetRandomNode:create(Attack20054.SkillProb.SkillOP2, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20054_Define.SkillType.SkillOP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.CommonNode:create(function()
												self.SkillO2Times = -1
											end)
										})
									}, self.instance:GetAnimalId(), {
										2,
										1,
										1
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOO1),
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillOP1),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillDDDO2_2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillLP2),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20054.SkillAngle.SkillLP2)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20054.SkillRange.SkillLP2),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillLP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20054_Define.SkillType.SkillLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillNSP2),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillNSP2, Attack20054.SkillAngle.SkillNSP2),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillNSP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20054_Define.SkillType.SkillNSP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalHitHand(target) == true and self.instance:IsHit() == false then
											return true
										end

										if self.instance:IsSkillParryActive() == true then
											return true
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20054.SkillNSP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillDP2),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20054.SkillRange.SkillDP2_Min, Attack20054.SkillRange.SkillDP2_Max, Attack20054.SkillAngle.SkillDP2),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillDP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20054_Define.SkillType.SkillDP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillHPO2),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillHPO2, Attack20054.SkillAngle.SkillHPO2),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillHPO2_1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20054_Define.SkillType.SkillHPO2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillDDDO2),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20054.SkillRange.SkillDDDO2_Min, Attack20054.SkillRange.SkillDDDO2_Max, Attack20054.SkillAngle.SkillDDDO2),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillDDDO2_1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillO2),
									BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20054.SkillRange.SkillO2_Min, Attack20054.SkillRange.SkillO2_Max, Attack20054.SkillAngle.SkillO2),
									BT.GetRandomNode:create(Attack20054.SkillProb.SkillO2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
									BT.CommonNode:create(function()
										self.SkillO2Times = 0
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillLLL2),
										BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillLLL2_Min, Attack20054.SkillAngle.SkillLLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillHHH2),
										BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillHHH2_Min, Attack20054.SkillAngle.SkillHHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20054_Define.SkillType.SkillSP2),
										BT.IsStartSkillingNode:create(self.instance, Attack20054.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20054.SkillRange.SkillSP2, Attack20054.SkillAngle.SkillSP2),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20054_Define.SkillType.SkillSP2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
									})
								}, self.instance:GetAnimalId())
							})
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20054:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20054
