-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20035.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Execute")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20035 = class("Attack20035")
Attack20035.static.SkillCd = {
	{
		Hero20035_Define.SkillType.SkillLL,
		1,
		true
	},
	{
		Hero20035_Define.SkillType.SkillH,
		1,
		true
	},
	{
		Hero20035_Define.SkillType.SkillS1,
		3,
		true
	},
	{
		Hero20035_Define.SkillType.SkillSP1,
		5,
		true
	},
	{
		Hero20035_Define.SkillType.SkillNL2,
		1,
		true
	},
	{
		Hero20035_Define.SkillType.SkillD2,
		1,
		true
	},
	{
		Hero20035_Define.SkillType.SkillNHNH2,
		1,
		true
	},
	{
		Hero20035_Define.SkillType.SkillNS2,
		5,
		true
	}
}
Attack20035.static.SkillProb = {
	SkillNS2 = 0.4,
	SkillSP1 = 0.35
}
Attack20035.static.SkillRange = {
	SkillSP1_Min = 3.5,
	SkillNHNH2 = 4,
	SkillSP1_Max = 9.5,
	SkillD2 = 4,
	SkillS1_Min = 4.5,
	SkillNL2 = 4,
	SkillLL = 3.5,
	SkillS1_Max = 15,
	SkillNS2_Max = 6,
	SkillH = 3.5,
	SkillNS2_Min = 2.5
}
Attack20035.static.SkillAngle = {
	SkillH = 30,
	SkillSP1 = 30,
	SkillNS2 = 45,
	SkillLL = 45,
	SkillD2 = 30,
	SkillNHNH2 = 60,
	SkillS1 = 30,
	SkillNL2 = 30
}
Attack20035.static.HoverTimeRatio = 2
Attack20035.static.SkillSP1RangeMax = 10
Attack20035.static.SkillSP1Time = 4
Attack20035.static.SkillSP1AccrueTime = 3
Attack20035.static.SkillSP1Height = 2.5

function Attack20035:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.execute = Execute:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20035.HoverTimeRatio, 1)
	self.skillCDList = Attack20035.SkillCd
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.skillSP1AccrueTime = 0
	self.attackNode = self:create()
end

function Attack20035:create()
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
						Hero20035_Define.SkillType.SkillO1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillD2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillNS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillS1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillSP1
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20035_Define.SkillType.SkillSP1, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillNL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillNHNH2, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillNHNH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillNHNH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillLL, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20035_Define.SkillType.SkillLL
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
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						if self.skillSP1AccrueTime > Attack20035.SkillSP1AccrueTime then
							self.skillSP1AccrueTime = 0

							return true
						end

						return false
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.threat.threatNode,
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillLL, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillH, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId(), {
								3,
								2,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillNL2, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillD2, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillNHNH2, 2)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId(), {
								2,
								1
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Execute, 1),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == true
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillLL, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillNL2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillD2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20035_Define.SkillType.SkillNHNH2, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Execute, 1)
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
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Stay
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillLL, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillLL, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillSP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20035.SkillRange.SkillSP1_Min, Attack20035.SkillRange.SkillSP1_Max, Attack20035.SkillAngle.SkillSP1),
									BT.IsTargetWithinHeightNode:create(self.instance, Attack20035.SkillSP1Height),
									BT.GetRandomNode:create(Attack20035.SkillProb.SkillSP1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20035_Define.SkillType.SkillSP1, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										self.skillSP1AccrueTime = self.skillSP1AccrueTime + Time.deltaTime

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and (GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20035.SkillSP1RangeMax) == false or GameAI.IsCanGetTarget(target) == false) then
											return true
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20035.SkillSP1Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillLL, Attack20035.SkillAngle.SkillLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillH, Attack20035.SkillAngle.SkillH),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId()),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillS1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20035.SkillRange.SkillS1_Min, Attack20035.SkillRange.SkillS1_Max, Attack20035.SkillAngle.SkillS1),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Default
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillNHNH2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillNHNH2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20035.SkillRange.SkillNS2_Min, Attack20035.SkillRange.SkillNS2_Max, Attack20035.SkillAngle.SkillNS2),
											BT.GetRandomNode:create(Attack20035.SkillProb.SkillNS2, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillH, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20035.SkillRange.SkillNL2),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20035_Define.SkillType.SkillLL, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillNS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20035.SkillRange.SkillNS2_Min, Attack20035.SkillRange.SkillNS2_Max, Attack20035.SkillAngle.SkillNS2),
									BT.GetRandomNode:create(Attack20035.SkillProb.SkillNS2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillNL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillNL2, Attack20035.SkillAngle.SkillNL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillNHNH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillNHNH2, Attack20035.SkillAngle.SkillNHNH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillD2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillD2, Attack20035.SkillAngle.SkillD2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillLL, Attack20035.SkillAngle.SkillLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20035_Define.SkillType.SkillH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20035.SkillRange.SkillH, Attack20035.SkillAngle.SkillH),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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

function Attack20035:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20035
