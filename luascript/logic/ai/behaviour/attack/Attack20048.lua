-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20048.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20048 = class("Attack20048")
Attack20048.static.SkillCd = {
	{
		Hero20048_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20048_Define.SkillType.SkillHP,
		5,
		true
	},
	{
		Hero20048_Define.SkillType.SkillSP,
		5,
		false
	},
	{
		Hero20048_Define.SkillType.SkillS,
		3,
		false
	},
	{
		Hero20048_Define.SkillType.SkillNS,
		3,
		false
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		8,
		true
	}
}
Attack20048.static.SkillProb = {
	Dodge = 0.4,
	SkillHP = 0.4,
	SkillSP = 0.4
}
Attack20048.static.SkillRange = {
	SkillNSP = 30,
	SkillNS = 5,
	SkillSP = 5,
	Dodge_Max = 10,
	Dodge_Min = 5,
	SkillS = 5,
	SkillLLL_Min = 4.5,
	SkillLLL_Max = 6.5,
	SkillHP_Min = 4.5,
	SkillHP_Max = 15
}
Attack20048.static.SkillAngle = {
	SkillS = 120,
	SkillSP = 135,
	SkillNS = 120,
	Dodge = 55,
	SkillHP = 45,
	SkillLLL = 45
}
Attack20048.static.SkillHPTime = 2
Attack20048.static.HoverTimeRatio = 2.5
Attack20048.static.SkillNSPTime = 30
Attack20048.static.SkillNSPHeight = 8

function Attack20048:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.dodge = Dodge:new(instance, Attack20048.SkillRange.Dodge_Min, Attack20048.SkillRange.Dodge_Max, Attack20048.SkillAngle.Dodge, Attack20048.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Low)
	self.hover = Hover:new(instance, Hover.HoverType.Normal, Attack20048.HoverTimeRatio, 1, AnimalBase_Define.SpeedMode.Slow)
	self.skillCDList = Attack20048.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20048:create()
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
						AnimalBase_Define.SkillType.Dodge
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20048_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20048_Define.SkillType.SkillHP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillNSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20048_Define.SkillType.SkillNSP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 10),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20048_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillNS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20048_Define.SkillType.SkillLLL
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
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillS, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillNS, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId(), {
								1,
								1,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillHP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillSP, 1)
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
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillS, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillNS, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
							}, self.instance:GetAnimalId(), {
								2,
								1
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillHP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20048_Define.SkillType.SkillSP, 1)
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
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20048_Define.SkillType.SkillHP, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20048.SkillAngle.SkillHP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20048_Define.SkillType.SkillHP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and target:IsHitBySkill(self.instance, Hero20048_Define.SkillType.SkillHP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20048.SkillHPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
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
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born2, 2),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, Attack20048.SkillNSPHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillNSP),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20048_Define.SkillType.SkillNSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20048.SkillRange.SkillNSP) == false then
									return true
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20048.SkillNSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20048_Define.SkillType.SkillLLL, 2),
							BT.IsSkillComboNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20048_Define.SkillType.SkillLLL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.RandomNode:create({
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 2),
									BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillSP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillSP, Attack20048.SkillAngle.SkillSP),
									BT.GetRandomNode:create(Attack20048.SkillProb.SkillSP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20048_Define.SkillType.SkillSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.IsVarietyNode:create(self.instance, 1),
										BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillNS),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillNS, Attack20048.SkillAngle.SkillNS),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
									}),
									BT.SequenceNode:create({
										BT.IsVarietyNode:create(self.instance, 2),
										BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillS),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillS, Attack20048.SkillAngle.SkillS),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
									})
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillHP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20048.SkillRange.SkillHP_Min, Attack20048.SkillRange.SkillHP_Max, Attack20048.SkillAngle.SkillHP),
							BT.GetRandomNode:create(Attack20048.SkillProb.SkillHP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20048_Define.SkillType.SkillHP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and target:IsHitBySkill(self.instance, Hero20048_Define.SkillType.SkillHP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20048.SkillHPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsVarietyNode:create(self.instance, 2),
							BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillSP, Attack20048.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack20048.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20048_Define.SkillType.SkillSP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillLLL),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillLLL_Min, Attack20048.SkillAngle.SkillLLL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 1),
									BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillNS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillNS, Attack20048.SkillAngle.SkillNS),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 2),
									BT.IsSkillCdNode:create(self.instance, Hero20048_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20048.SkillRange.SkillS, Attack20048.SkillAngle.SkillS),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20048:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20048
