-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20036.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20036 = class("Attack20036")
Attack20036.static.SkillProb = {
	SkillHPHP2 = 0.25,
	SkillDefence = 0.3,
	SkillHHHH2 = 0.35,
	SkillOP2 = 0.35
}
Attack20036.static.SkillCd = {
	{
		Hero20036_Define.SkillType.SkillLLL1,
		1,
		true
	},
	{
		Hero20036_Define.SkillType.SkillHP1,
		1,
		true
	},
	{
		Hero20036_Define.SkillType.SkillHHH1,
		1,
		true
	},
	{
		Hero20036_Define.SkillType.SkillLLL2,
		1,
		true
	},
	{
		Hero20036_Define.SkillType.SkillHPHP2,
		1,
		true
	},
	{
		Hero20036_Define.SkillType.SkillHHHH2,
		1,
		true
	},
	{
		Hero20036_Define.SkillType.SkillOP2,
		5,
		true
	},
	{
		Hero20036_Define.SkillType.SkillDefence,
		7,
		true
	},
	{
		Hero20036_Define.SkillType.SkillO1,
		4,
		true
	}
}
Attack20036.static.SkillRange = {
	SkillOP2_Min = 2.5,
	SkillHPHP2 = 4,
	SkillHP1 = 3.5,
	SkillHHHH2 = 4,
	SkillLLL2 = 4,
	SkillDefence_Min = 4.5,
	SkillDefence_Max = 8,
	SkillLLL1 = 3.5,
	SkillOP2_Max = 7,
	SkillHHH1 = 4
}
Attack20036.static.SkillAngle = {
	SkillLLL2 = 45,
	SkillHPHP2 = 45,
	SkillHP1 = 45,
	SkillHHHH2 = 45,
	SkillHHH1 = 45,
	SkillDefence = 55,
	SkillLLL1 = 45,
	SkillOP2 = 30
}
Attack20036.static.HoverTimeRatio = 3.5
Attack20036.static.ShapeshiftHpRate = 0.6
Attack20036.static.WaitLiftFireTime = 20

function Attack20036:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Forward, Attack20036.HoverTimeRatio, 1, Hero20036_Define.SkillType.SkillDefence)
	self.skillCDList = Attack20036.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20036:create()
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
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat, AnimalBase_Define.SkillType.Threat, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Alert
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Relax
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillHPHP2, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillHPHP2
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20036_Define.SkillType.SkillHPHP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillDefence
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20036_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillO1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillOP2
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20036_Define.SkillType.SkillOP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillHP1,
						Hero20036_Define.SkillType.SkillHPHP2
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20036_Define.SkillType.SkillHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillLLL1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillHHH1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20036_Define.SkillType.SkillHHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				self.alert.alertNode,
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillO1),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return self.instance:GetBrain().findTargetTime ~= nil and self.instance:GetBrain().findTargetTime > Attack20036.WaitLiftFireTime or rate <= Attack20036.ShapeshiftHpRate
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.threat.threatNode,
				self.hoverInDefence.hoverInDefenceNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL1, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHP1, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHHH1, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillOP2, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.SequenceNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
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
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillOP2, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL2, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHPHP2, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHHHH2, 4)
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHP1, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHHH1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillOP2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillOP2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL2, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHPHP2, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20036_Define.SkillType.SkillHHHH2, 4)
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
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillDefence, 4),
									BT.ConditionNode:create(function()
										return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20036.SkillRange.SkillHHH1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillHHH1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillDefence),
									BT.IsStartSkillingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetAttackingNode:create(self.instance),
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillDefence_Max, Attack20036.SkillAngle.SkillDefence)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20036.SkillRange.SkillDefence_Min, Attack20036.SkillRange.SkillDefence_Max, Attack20036.SkillAngle.SkillDefence)
										})
									}),
									BT.GetRandomNode:create(Attack20036.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillLLL1, Attack20036.SkillAngle.SkillLLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillHHH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillHHH1, Attack20036.SkillAngle.SkillHHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillHP1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillHP1, Attack20036.SkillAngle.SkillHP1),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20036_Define.SkillType.SkillHP1, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillDefence, 4),
									BT.ConditionNode:create(function()
										return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20036.SkillRange.SkillHHHH2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL2, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20036.SkillRange.SkillHPHP2),
											BT.GetRandomNode:create(Attack20036.SkillProb.SkillHPHP2, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20036_Define.SkillType.SkillHPHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20036.SkillRange.SkillHHHH2),
											BT.GetRandomNode:create(Attack20036.SkillProb.SkillHHHH2, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillHHHH2, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillHPHP2, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20036.SkillRange.SkillOP2_Min, Attack20036.SkillRange.SkillOP2_Max, Attack20036.SkillAngle.SkillOP2),
									BT.GetRandomNode:create(Attack20036.SkillProb.SkillOP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20036_Define.SkillType.SkillOP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillHHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20036_Define.SkillType.SkillHPHP2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20036_Define.SkillType.SkillHPHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20036.SkillRange.SkillOP2_Min, Attack20036.SkillRange.SkillOP2_Max, Attack20036.SkillAngle.SkillOP2),
									BT.GetRandomNode:create(Attack20036.SkillProb.SkillOP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20036_Define.SkillType.SkillOP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillDefence),
									BT.IsStartSkillingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetAttackingNode:create(self.instance),
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillDefence_Max, Attack20036.SkillAngle.SkillDefence)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20036.SkillRange.SkillDefence_Min, Attack20036.SkillRange.SkillDefence_Max, Attack20036.SkillAngle.SkillDefence)
										})
									}),
									BT.GetRandomNode:create(Attack20036.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillLLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillLLL2, Attack20036.SkillAngle.SkillLLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillHHHH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillHHHH2, Attack20036.SkillAngle.SkillHHHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20036_Define.SkillType.SkillHPHP2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20036.SkillRange.SkillHPHP2, Attack20036.SkillAngle.SkillHPHP2),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20036_Define.SkillType.SkillHPHP2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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

function Attack20036:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20036
