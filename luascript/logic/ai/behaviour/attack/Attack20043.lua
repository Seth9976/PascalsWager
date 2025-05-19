-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20043.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20043 = class("Attack20043")
Attack20043.static.SkillCd = {
	{
		Hero20043_Define.SkillType.SkillLLL,
		2,
		true
	},
	{
		Hero20043_Define.SkillType.SkillHHHH,
		2,
		true
	},
	{
		Hero20043_Define.SkillType.SkillLP,
		4,
		true
	},
	{
		Hero20043_Define.SkillType.SkillHP,
		4,
		false
	},
	{
		Hero20043_Define.SkillType.SkillSP,
		6,
		false
	},
	{
		Hero20043_Define.SkillType.SkillS,
		4,
		false
	},
	{
		Hero20043_Define.SkillType.SkillDP,
		4,
		false
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		8,
		true
	}
}
Attack20043.static.SkillProb = {
	SkillLP = 0.4,
	SkillDP = 0.65,
	Dodge = 0.4,
	SkillHP = 0.3,
	SkillSP = 0.3
}
Attack20043.static.SkillRange = {
	Dodge_Min = 5,
	SkillDP = 5,
	Dodge_Max = 10,
	SkillSP_Max = 12,
	SkillS_Max = 12,
	SkillHP = 6,
	SkillLLL = 5,
	SkillS_Min = 5,
	SkillLP_Min = 5,
	SkillSP_Min = 6,
	SkillHHHH = 5,
	SkillLP_Max = 12
}
Attack20043.static.SkillAngle = {
	SkillDP_1 = 90,
	SkillLP = 30,
	SkillSP = 15,
	SkillDP_2 = 10,
	Dodge = 55,
	SkillHP = 30,
	SkillHHHH = 45,
	SkillLLL = 45
}
Attack20043.static.HoverTimeRatio = 1.5
Attack20043.static.TurnAroundTime = 1.5
Attack20043.static.SkillHPTime = 2.5

function Attack20043:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.dodge = Dodge:new(instance, Attack20043.SkillRange.Dodge_Min, Attack20043.SkillRange.Dodge_Max, Attack20043.SkillAngle.Dodge, Attack20043.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Low)
	self.hover = Hover:new(instance, Hover.HoverType.Normal, Attack20043.HoverTimeRatio, 1, AnimalBase_Define.SpeedMode.Slow)
	self.skillCDList = Attack20043.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20043:create()
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
						Hero20043_Define.SkillType.SkillLP,
						Hero20043_Define.SkillType.SkillLPC
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20043_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20043_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20043_Define.SkillType.SkillHP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20043_Define.SkillType.SkillDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20043_Define.SkillType.SkillHHHH, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillHHHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20043_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillHHHH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20043_Define.SkillType.SkillLLL
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
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillHHHH, 4),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillHP, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId(), {
								3,
								2,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillLP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillDP, 1)
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
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillHHHH, 4),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillHP, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillLP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20043_Define.SkillType.SkillDP, 1)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20043_Define.SkillType.SkillLP, 0),
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20043.SkillAngle.SkillLP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20043_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
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
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Call
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsStartSkillingNode:create(self.instance),
									BT.WaitNode:create(1),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20043_Define.SkillType.SkillLPC, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.StopMovementNode:create(self.instance)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20043_Define.SkillType.SkillLLL, 0),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20043_Define.SkillType.SkillHHHH, 0),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20043.SkillRange.SkillS_Min, Attack20043.SkillRange.SkillS_Max),
							BT.IsSkillComboNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillHP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20043.SkillRange.SkillHP, Attack20043.SkillAngle.SkillHP),
							BT.GetRandomNode:create(Attack20043.SkillProb.SkillHP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20043_Define.SkillType.SkillHP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20043.SkillHPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillLP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20043.SkillRange.SkillLP_Min, Attack20043.SkillRange.SkillLP_Max, Attack20043.SkillAngle.SkillLP),
							BT.GetRandomNode:create(Attack20043.SkillProb.SkillLP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20043_Define.SkillType.SkillLP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillSP),
							BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsCanAttackNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20043.SkillRange.SkillSP_Min, Attack20043.SkillRange.SkillSP_Max, Attack20043.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack20043.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.SetSkillTargetNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20043_Define.SkillType.SkillSP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillDP),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsBehindNode:create(self.instance),
							BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20043.SkillAngle.SkillDP_1)),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20043.SkillRange.SkillDP),
							BT.GetRandomNode:create(Attack20043.SkillProb.SkillDP, self.instance:GetAnimalId()),
							BT.StopMovementNode:create(self.instance),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetPos

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									targetPos = target:GetPosByWorldPos()
									targetPos = self.instance:GetPosByWorldPos() - targetPos + self.instance:GetPosByWorldPos()
									targetPos.y = self.instance:GetPosByWorldPos().y

									self.instance:SetOrientation(targetPos)
								end

								return GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20043.SkillAngle.SkillDP_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20043.TurnAroundTime),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20043_Define.SkillType.SkillDP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillLLL),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20043.SkillRange.SkillLLL, Attack20043.SkillAngle.SkillLLL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20043_Define.SkillType.SkillHHHH),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20043.SkillRange.SkillHHHH, Attack20043.SkillAngle.SkillHHHH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20043:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20043
