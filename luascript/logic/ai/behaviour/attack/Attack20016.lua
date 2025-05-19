-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20016.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20016 = class("Attack20016")
Attack20016.static.SkillProb = {
	SkillDefence = 0.25,
	SkillNL = 0.25
}
Attack20016.static.SkillCd = {
	{
		Hero20016_Define.SkillType.SkillNL,
		7,
		false
	},
	{
		Hero20016_Define.SkillType.SkillDefence,
		5,
		true
	}
}
Attack20016.static.SkillRange = {
	SkillOP = 3,
	SkillH = 3,
	SkillDefence_Max = 8,
	SkillO = 3,
	SkillDefence_Min = 5,
	SkillNL = 4,
	SkillL = 3
}
Attack20016.static.SkillAngle = {
	SkillOP = 45,
	SkillH = 55,
	SkillL = 45,
	SkillO = 55,
	SkillDefence = 45,
	SkillNL = 45
}
Attack20016.static.HoverTimeRatio = 3
Attack20016.static.SkillDefenceTime = 3.5

function Attack20016:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20016.HoverTimeRatio, 1)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Horizontal, Attack20016.HoverTimeRatio, 2, Hero20016_Define.SkillType.SkillDefence)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20016.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20016:create()
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
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20016_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20016_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20016_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20016_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20016_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20016_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20016_Define.SkillType.SkillOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20016_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
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
				self.hoverInDefence.hoverInDefenceNode,
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillL, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillOP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillO, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.SequenceNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
									end)
								}),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId(), {
								2,
								1,
								1,
								1
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillNL, 4),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillL, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillOP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillO, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20016_Define.SkillType.SkillNL, 4)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20016_Define.SkillType.SkillNL, 0),
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20016.SkillAngle.SkillNL),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight),
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
							BT.IsSkillingByIdNode:create(self.instance, Hero20016_Define.SkillType.SkillDefence, 4),
							BT.ConditionNode:create(function()
								return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20016.SkillRange.SkillNL),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20016_Define.SkillType.SkillDefence),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsTargetAttackingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillDefence_Min, Attack20016.SkillAngle.SkillDefence),
									BT.GetRandomNode:create(Attack20016.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
									end)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillDefence_Max, Attack20016.SkillAngle.SkillDefence),
									BT.GetRandomNode:create(Attack20016.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
									end)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20016_Define.SkillType.SkillNL),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillNL, Attack20016.SkillAngle.SkillNL),
							BT.GetRandomNode:create(Attack20016.SkillProb.SkillNL, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillL, Attack20016.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillH, Attack20016.SkillAngle.SkillH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillOP, Attack20016.SkillAngle.SkillOP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20016_Define.SkillType.SkillOP, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20016.SkillRange.SkillO, Attack20016.SkillAngle.SkillO),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20016:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20016
