-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20021.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20021 = class("Attack20021")
Attack20021.static.SkillProb = {
	SkillDefence = 0.3,
	SkillHPH = 0.35
}
Attack20021.static.SkillCd = {
	{
		Hero20021_Define.SkillType.SkillHPH,
		3,
		true
	},
	{
		Hero20021_Define.SkillType.SkillDefence,
		7,
		true
	}
}
Attack20021.static.SkillRange = {
	SkillL = 4,
	SkillLP = 4.5,
	SkillDefence_Max = 8,
	SkillHPH_Max = 5.5,
	SkillDefence_Min = 4.5,
	SkillH = 4.5,
	SkillHPH_Min = 3
}
Attack20021.static.SkillAngle = {
	SkillL = 60,
	SkillH = 70,
	SkillLP = 60,
	SkillDefence = 55,
	SkillHPH = 45
}
Attack20021.static.HoverTimeRatio = 4.5

function Attack20021:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20021.HoverTimeRatio, 1)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Forward, Attack20021.HoverTimeRatio, 1, Hero20021_Define.SkillType.SkillDefence, false)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.skillCDList = Attack20021.SkillCd
	self.attackNode = self:create()
end

function Attack20021:create()
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
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillLPL, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillLPL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillHPH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20021_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillLPL
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20021_Define.SkillType.SkillLPL, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillHPH,
						Hero20021_Define.SkillType.SkillHPHC
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20021_Define.SkillType.SkillHPH, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillLLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillLLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillLLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillHHH, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillHHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20021_Define.SkillType.SkillHHH
					}),
					BT.WaitNode:create(1),
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
				self.threat.threatNode,
				self.hover.hoverNode,
				self.hoverInDefence.hoverInDefenceNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetMonsterAILevel() == GameAI.AILevel.Normal
							end),
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLPL, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLLLL, 4),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHHH, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId(), {
								3,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetMonsterAILevel() == GameAI.AILevel.Easy
							end),
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLPL, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLLLL, 4),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHHH, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHHH, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 2),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLPL, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillLLLL, 4),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHHH, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 2)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 0),
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20021.SkillAngle.SkillHPH),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20021_Define.SkillType.SkillHPH, 1, false),
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
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Call
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsStartSkillingNode:create(self.instance),
									BT.WaitNode:create(1),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20021_Define.SkillType.SkillHPHC, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.StopMovementNode:create(self.instance)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20021_Define.SkillType.SkillDefence),
							BT.IsStartSkillingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetAttackingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20021.SkillRange.SkillDefence_Max, Attack20021.SkillAngle.SkillDefence)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20021.SkillRange.SkillDefence_Min, Attack20021.SkillRange.SkillDefence_Max, Attack20021.SkillAngle.SkillDefence)
								})
							}),
							BT.GetRandomNode:create(Attack20021.SkillProb.SkillDefence, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillLPL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillLLLL, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20021_Define.SkillType.SkillHHH, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20021_Define.SkillType.SkillHPH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20021.SkillRange.SkillHPH_Min, Attack20021.SkillRange.SkillHPH_Max, Attack20021.SkillAngle.SkillHPH),
							BT.GetRandomNode:create(Attack20021.SkillProb.SkillHPH, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20021_Define.SkillType.SkillHPH, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20021.SkillRange.SkillL, Attack20021.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20021.SkillRange.SkillLP, Attack20021.SkillAngle.SkillLP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20021_Define.SkillType.SkillLPL, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20021.SkillRange.SkillH, Attack20021.SkillAngle.SkillH),
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

function Attack20021:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20021
