-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20026.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20026 = class("Attack20026")
Attack20026.static.SkillCd = {
	{
		Hero20026_Define.SkillType.SkillD1,
		3,
		true
	},
	{
		Hero20026_Define.SkillType.SkillD2,
		3,
		true
	},
	{
		Hero20026_Define.SkillType.SkillD3,
		3,
		true
	},
	{
		Hero20026_Define.SkillType.SkillD4,
		3,
		true
	},
	{
		Hero20026_Define.SkillType.SkillH1,
		1,
		true
	},
	{
		Hero20026_Define.SkillType.SkillH3,
		1,
		true
	},
	{
		Hero20026_Define.SkillType.SkillDefence1,
		5,
		true
	},
	{
		Hero20026_Define.SkillType.SkillDefence2,
		5,
		true
	},
	{
		Hero20026_Define.SkillType.SkillDefence3,
		5,
		true
	},
	{
		Hero20026_Define.SkillType.SkillDefence4,
		5,
		true
	},
	{
		Hero20026_Define.SkillType.SkillO,
		5,
		true
	}
}
Attack20026.static.SkillProb = {
	SkillDefence3 = 0.25,
	SkillD3 = 0.35,
	SkillDefence2 = 0.25,
	SkillD2 = 0.35,
	SkillDefence1 = 0.25,
	SkillD1 = 0.35,
	SkillDefence4 = 0.25,
	SkillD4 = 0.35
}
Attack20026.static.SkillRange = {
	SkillLLL2 = 3.5,
	SkillD4_Max = 6.5,
	SkillD3_Min = 3.5,
	SkillD2_Min = 3.5,
	SkillLLL1 = 3.5,
	SkillDefence2_Min = 5,
	SkillDefence2_Max = 8,
	SkillDefence3_Min = 5,
	SkillD1_Max = 6.5,
	SkillDefence3_Max = 8,
	SkillDefence4_Min = 5,
	SkillDefence4_Max = 8,
	SkillLLL4 = 3.5,
	SkillH3 = 3,
	SkillD2_Max = 6.5,
	SkillH1 = 3,
	SkillD1_Min = 3.5,
	SkillLLL3 = 3.5,
	SkillD3_Max = 6.5,
	SkillDefence1_Max = 8,
	SkillDefence1_Min = 5,
	SkillD4_Min = 3.5
}
Attack20026.static.SkillAngle = {
	SkillLLL2 = 45,
	SkillH1 = 45,
	SkillH3 = 45,
	SkillD2 = 45,
	SkillDefence1 = 45,
	SkillDefence2 = 45,
	SkillLLL3 = 45,
	SkillDefence3 = 45,
	SkillD3 = 45,
	SkillLLL1 = 45,
	SkillLLL4 = 45,
	SkillD1 = 45,
	SkillDefence4 = 45,
	SkillD4 = 45
}
Attack20026.static.HoverTimeRatio = 3
Attack20026.static.ShapeshiftHpRate = 0.6
Attack20026.static.SkillDefenceTime = 3.5

function Attack20026:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hoverInDefence1 = HoverInDefence:new(instance, HoverInDefence.HoverType.Normal, Attack20026.HoverTimeRatio, 2, Hero20026_Define.SkillType.SkillDefence1)
	self.hoverInDefence2 = HoverInDefence:new(instance, HoverInDefence.HoverType.Normal, Attack20026.HoverTimeRatio, 2, Hero20026_Define.SkillType.SkillDefence2)
	self.hoverInDefence3 = HoverInDefence:new(instance, HoverInDefence.HoverType.Normal, Attack20026.HoverTimeRatio, 2, Hero20026_Define.SkillType.SkillDefence3)
	self.hoverInDefence4 = HoverInDefence:new(instance, HoverInDefence.HoverType.Normal, Attack20026.HoverTimeRatio, 2, Hero20026_Define.SkillType.SkillDefence4)
	self.dropAttack = DropAttack:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.skillCDList = Attack20026.SkillCd
	self.attackNode = self:create()
end

function Attack20026:create()
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
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20026_Define.SkillType.SkillDefence1,
						Hero20026_Define.SkillType.SkillDefence2,
						Hero20026_Define.SkillType.SkillDefence3,
						Hero20026_Define.SkillType.SkillDefence4
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20026_Define.SkillType.SkillDefence1, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20026_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20026_Define.SkillType.SkillD1,
						Hero20026_Define.SkillType.SkillD2,
						Hero20026_Define.SkillType.SkillD3,
						Hero20026_Define.SkillType.SkillD4
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20026_Define.SkillType.SkillH1,
						Hero20026_Define.SkillType.SkillH3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 0)
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20026_Define.SkillType.SkillLLL1,
						Hero20026_Define.SkillType.SkillLLL2,
						Hero20026_Define.SkillType.SkillLLL3,
						Hero20026_Define.SkillType.SkillLLL4
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20026_Define.SkillType.SkillLLL1,
						Hero20026_Define.SkillType.SkillLLL2,
						Hero20026_Define.SkillType.SkillLLL3,
						Hero20026_Define.SkillType.SkillLLL4
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
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillO),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Attack20026.ShapeshiftHpRate
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.dropAttack.dropAttackNode,
				self.alert.alertNode,
				self.threat.threatNode,
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence1, 1),
					self.hoverInDefence1.hoverInDefenceNode
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence1, 2),
					self.hoverInDefence2.hoverInDefenceNode
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence3, 1),
					self.hoverInDefence3.hoverInDefenceNode
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence4, 2),
					self.hoverInDefence4.hoverInDefenceNode
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.SequenceNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence1:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
										self.hoverInDefence2:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
										self.hoverInDefence3:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
										self.hoverInDefence4:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
									end)
								})
							}, self.instance:GetAnimalId(), {
								3,
								2,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD1, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD2, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD3, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD4, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId(), {
								3,
								1
							})
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == true
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD1, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD3, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20026_Define.SkillType.SkillD4, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
						}, self.instance:GetAnimalId(), {
							3,
							1
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillD1, 0),
								BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillD2, 0),
								BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillD3, 0),
								BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillD4, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20026.SkillAngle.SkillD2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
											BT.CommonNode:create(function()
												self.instance:GetBrain().alertType = Alert.Type.None
											end)
										}),
										BT.CommonNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
											end
										end)
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence1, 4),
									BT.ConditionNode:create(function()
										return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20026.SkillRange.SkillLLL1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence2, 4),
									BT.ConditionNode:create(function()
										return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20026.SkillRange.SkillLLL2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain():IsAnimalCrazy() == true
									end),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 2),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD1_Min, Attack20026.SkillRange.SkillD1_Max, Attack20026.SkillAngle.SkillD1)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 3),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD2_Min, Attack20026.SkillRange.SkillD2_Max, Attack20026.SkillAngle.SkillD2)
										})
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain():IsAnimalCrazy() == true
									end),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 2),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD2_Min, Attack20026.SkillRange.SkillD2_Max, Attack20026.SkillAngle.SkillD2)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 3),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD1_Min, Attack20026.SkillRange.SkillD1_Max, Attack20026.SkillAngle.SkillD1)
										})
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence1),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence1, 1),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence1_Min, Attack20026.SkillAngle.SkillDefence1),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence1, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence1:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence1_Max, Attack20026.SkillAngle.SkillDefence1),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence1, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence1:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence2),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence2, 2),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence2_Min, Attack20026.SkillAngle.SkillDefence2),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence2, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence2:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence2_Max, Attack20026.SkillAngle.SkillDefence2),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence2, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence2:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillD1),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillD1, 1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD1_Min, Attack20026.SkillRange.SkillD1_Max, Attack20026.SkillAngle.SkillD1),
									BT.GetRandomNode:create(Attack20026.SkillProb.SkillD1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillD2),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillD2, 2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD2_Min, Attack20026.SkillRange.SkillD2_Max, Attack20026.SkillAngle.SkillD2),
									BT.GetRandomNode:create(Attack20026.SkillProb.SkillD2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL1, 1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillLLL1, Attack20026.SkillAngle.SkillLLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillH1, 1),
										BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillH1, Attack20026.SkillAngle.SkillH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId()),
								BT.SequenceNode:create({
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL2, 2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillLLL2, Attack20026.SkillAngle.SkillLLL2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20026.SkillAngle.SkillD4),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
											BT.CommonNode:create(function()
												self.instance:GetBrain().alertType = Alert.Type.None
											end)
										}),
										BT.CommonNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
											end
										end)
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence3, 4),
									BT.ConditionNode:create(function()
										return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20026.SkillRange.SkillLLL3),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence2, 4),
									BT.ConditionNode:create(function()
										return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20026.SkillRange.SkillLLL4),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain():IsAnimalCrazy() == true
									end),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 2),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD1_Min, Attack20026.SkillRange.SkillD1_Max, Attack20026.SkillAngle.SkillD1)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 3),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD2_Min, Attack20026.SkillRange.SkillD2_Max, Attack20026.SkillAngle.SkillD2)
										})
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain():IsAnimalCrazy() == true
									end),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 2),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD2_Min, Attack20026.SkillRange.SkillD2_Max, Attack20026.SkillAngle.SkillD2)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 3),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD1_Min, Attack20026.SkillRange.SkillD1_Max, Attack20026.SkillAngle.SkillD1)
										})
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence3),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence3, 1),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence3_Min, Attack20026.SkillAngle.SkillDefence3),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence3, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence3:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence3_Max, Attack20026.SkillAngle.SkillDefence3),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence3, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence3:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence4),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillDefence4, 2),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence4_Min, Attack20026.SkillAngle.SkillDefence4),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence4, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence4:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillDefence4_Max, Attack20026.SkillAngle.SkillDefence4),
											BT.GetRandomNode:create(Attack20026.SkillProb.SkillDefence4, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence4:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillD3),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillD3, 1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD3_Min, Attack20026.SkillRange.SkillD3_Max, Attack20026.SkillAngle.SkillD3),
									BT.GetRandomNode:create(Attack20026.SkillProb.SkillD3, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillD4),
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillD4, 2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20026.SkillRange.SkillD4_Min, Attack20026.SkillRange.SkillD4_Max, Attack20026.SkillAngle.SkillD4),
									BT.GetRandomNode:create(Attack20026.SkillProb.SkillD4, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL3, 1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillLLL3, Attack20026.SkillAngle.SkillLLL3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillH3, 1),
										BT.IsSkillCdNode:create(self.instance, Hero20026_Define.SkillType.SkillH3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillH3, Attack20026.SkillAngle.SkillH3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId()),
								BT.SequenceNode:create({
									BT.IsSkillConditionNode:create(self.instance, Hero20026_Define.SkillType.SkillLLL4, 2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20026.SkillRange.SkillLLL4, Attack20026.SkillAngle.SkillLLL4),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20026:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20026
