-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20050.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20050 = class("Attack20050")
Attack20050.static.SkillCd = {
	{
		Hero20050_Define.SkillType.SkillLLL1,
		2,
		true
	},
	{
		Hero20050_Define.SkillType.SkillHH1,
		2,
		true
	},
	{
		Hero20050_Define.SkillType.SkillHH2,
		2,
		true
	},
	{
		Hero20050_Define.SkillType.SkillLLL2,
		2,
		true
	},
	{
		Hero20050_Define.SkillType.SkillLP1,
		4,
		true
	},
	{
		Hero20050_Define.SkillType.SkillLP2,
		4,
		true
	},
	{
		Hero20050_Define.SkillType.SkillHP2,
		8,
		true
	},
	{
		Hero20050_Define.SkillType.SkillLLL3,
		2,
		true
	},
	{
		Hero20050_Define.SkillType.SkillO3,
		4,
		true
	},
	{
		Hero20050_Define.SkillType.SkillH3,
		8,
		true
	},
	{
		Hero20050_Define.SkillType.SkillLP3,
		2,
		true
	},
	{
		Hero20050_Define.SkillType.SkillS,
		5,
		true
	}
}
Attack20050.static.SkillProb = {
	SkillO3 = 0.4,
	SkillHP2 = 0.3,
	SkillH3 = 0.35,
	SkillS = 0.35,
	SkillLP2 = 0.65,
	SkillLP1 = 0.65
}
Attack20050.static.SkillRange = {
	SkillHH2_Min = 5,
	SkillLLL2_Max = 6.5,
	SkillLLL3_Max = 5.5,
	SkillLLL3_Min = 4,
	SkillO3_Max = 12,
	SkillLLL2_Min = 5,
	SkillH3_Min = 3,
	SkillHH2_Max = 6.5,
	SkillS_Min = 5,
	SkillS_Max = 10,
	SkillO3_Min = 5,
	SkillLP3 = 4,
	SkillLP1 = 4,
	SkillHH1_Min = 6,
	SkillLP2 = 4,
	SkillH3_Max = 6,
	SkillHP2 = 6,
	SkillLLL1_Max = 8.5,
	SkillLLL1_Min = 7,
	SkillHH1_Max = 7.5
}
Attack20050.static.SkillAngle = {
	SkillO3 = 30,
	SkillLLL2 = 45,
	SkillS = 45,
	SkillHH2 = 45,
	SkillLP2 = 120,
	SkillLLL3 = 45,
	SkillHP2 = 60,
	SkillLLL1 = 45,
	SkillLP3 = 45,
	SkillH3 = 30,
	SkillLP1 = 120
}
Attack20050.static.SkillHP2Time = 3
Attack20050.static.HoverTimeRatio = 2

function Attack20050:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20050.HoverTimeRatio, 1, AnimalBase_Define.SpeedMode.Slow)
	self.skillCDList = Attack20050.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20050:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Threat
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat, AnimalBase_Define.SkillType.Threat, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Alert
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Relax
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL1, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLLL1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL3, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLLL3
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillHH1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillHH1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillHH2, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillHH1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillHH1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillO3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillH3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20050_Define.SkillType.SkillLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20050_Define.SkillType.SkillLP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLP3
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20050_Define.SkillType.SkillLP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20050_Define.SkillType.SkillHP2, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLLL1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20050_Define.SkillType.SkillLLL3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				self.alert.alertNode,
				self.threat.threatNode,
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL1, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillHH1, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillHH2, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL2, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
							}, self.instance:GetAnimalId(), {
								1,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillH3, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillH3, 4)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId())
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == true
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillHH1, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillHH2, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL2, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillH3, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillH3, 4),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL3, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20050_Define.SkillType.SkillLP3, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
						}, self.instance:GetAnimalId(), {
							1,
							3
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillLLL1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillHH1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillS, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalHitHand(target) == true and self.instance:IsHit() == false then
											return true
										end

										return false
									end),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillS_Min),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillLP1),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20050.SkillAngle.SkillLP1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillLP1),
									BT.GetRandomNode:create(Attack20050.SkillProb.SkillLP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20050_Define.SkillType.SkillLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetHeroPose() == Hero20050_Define.PoseAll
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillS),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillS_Min, Attack20050.SkillAngle.SkillS),
											BT.GetRandomNode:create(Attack20050.SkillProb.SkillS, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillS_Max, Attack20050.SkillAngle.SkillS),
											BT.GetRandomNode:create(Attack20050.SkillProb.SkillS, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									})
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillLLL1_Min, Attack20050.SkillAngle.SkillLLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillHH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillHH1_Min, Attack20050.SkillAngle.SkillHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillLLL2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillHH2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillS, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalHitHand(target) and self.instance:IsHit() == false then
											return true
										end

										return false
									end),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillS_Min),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillLP2),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20050.SkillAngle.SkillLP2)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillLP2),
									BT.GetRandomNode:create(Attack20050.SkillProb.SkillLP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20050_Define.SkillType.SkillLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillS),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillS_Min, Attack20050.SkillAngle.SkillS),
											BT.GetRandomNode:create(Attack20050.SkillProb.SkillS, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillS_Max, Attack20050.SkillAngle.SkillS),
											BT.GetRandomNode:create(Attack20050.SkillProb.SkillS, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillHP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillHP2, Attack20050.SkillAngle.SkillHP2),
									BT.GetRandomNode:create(Attack20050.SkillProb.SkillHP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20050_Define.SkillType.SkillHP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20050.SkillHP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillHH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillHH2_Min, Attack20050.SkillAngle.SkillHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillLLL2_Min, Attack20050.SkillAngle.SkillLLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 3),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL3, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20050.SkillRange.SkillLLL3_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillH3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20050.SkillRange.SkillH3_Min, Attack20050.SkillRange.SkillH3_Max, Attack20050.SkillAngle.SkillH3),
									BT.GetRandomNode:create(Attack20050.SkillProb.SkillH3, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillO3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20050.SkillRange.SkillO3_Min, Attack20050.SkillRange.SkillO3_Max, Attack20050.SkillAngle.SkillO3),
									BT.GetRandomNode:create(Attack20050.SkillProb.SkillO3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillLLL3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillLLL3_Min, Attack20050.SkillAngle.SkillLLL3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20050_Define.SkillType.SkillLP3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20050.SkillRange.SkillLP3, Attack20050.SkillAngle.SkillLP3),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20050_Define.SkillType.SkillLP3, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
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

function Attack20050:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance, true)

	return target
end

return Attack20050
