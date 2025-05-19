-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20020.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20020 = class("Attack20020")
Attack20020.static.SkillProb = {
	SkillNSP = 0.35,
	SkillDefence = 0.3
}
Attack20020.static.SkillCd = {
	{
		Hero20020_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20020_Define.SkillType.SkillHP,
		1,
		true
	},
	{
		Hero20020_Define.SkillType.SkillNSP,
		6,
		true
	},
	{
		Hero20020_Define.SkillType.SkillLP,
		3,
		false
	},
	{
		Hero20020_Define.SkillType.SkillDefence,
		7,
		true
	}
}
Attack20020.static.SkillRange = {
	SkillL = 5,
	SkillH = 4.5,
	SkillDefence_Max = 8,
	SkillNSP_Min = 5,
	SkillNSP_Max = 12,
	SkillHP = 5,
	SkillDefence_Min = 4.5,
	SkillLP = 5
}
Attack20020.static.SkillAngle = {
	SkillL = 45,
	SkillH = 45,
	SkillLP = 60,
	SkillNSP = 45,
	SkillDefence = 55,
	SkillHP = 45
}
Attack20020.static.HoverTimeRatio = 3.5
Attack20020.static.SkillNSPTime = 1.5

function Attack20020:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20020.HoverTimeRatio, 1)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Forward, Attack20020.HoverTimeRatio, 1, Hero20020_Define.SkillType.SkillDefence)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20020.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20020:create()
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
						Hero20020_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20020_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20020_Define.SkillType.SkillNSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20020_Define.SkillType.SkillNSP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 3),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20020_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20020_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20020_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20020_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20020_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20020_Define.SkillType.SkillLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20020_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20020_Define.SkillType.SkillLLL
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
				self.hoverInDefence.hoverInDefenceNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillLP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillHP, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId(), {
								2,
								3,
								3
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillNSP, 3),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillLP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillHP, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20020_Define.SkillType.SkillNSP, 3)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20020_Define.SkillType.SkillNSP, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Special
							end),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20020_Define.SkillType.SkillLP, 0),
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20020.SkillAngle.SkillNSP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20020_Define.SkillType.SkillNSP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and target:IsHitBySkill(self.instance, Hero20020_Define.SkillType.SkillNSP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20020.SkillNSPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial),
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
								return self.instance:GetBrain().alertType == Alert.Type.Special
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20020.SkillRange.SkillLP, Attack20020.SkillAngle.SkillLP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20020_Define.SkillType.SkillLP, 1, false),
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
							BT.IsSkillingByIdNode:create(self.instance, Hero20020_Define.SkillType.SkillDefence, 4),
							BT.ConditionNode:create(function()
								return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20020.SkillRange.SkillH),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20020_Define.SkillType.SkillDefence),
							BT.IsStartSkillingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetAttackingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20020.SkillRange.SkillDefence_Max, Attack20020.SkillAngle.SkillDefence)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20020.SkillRange.SkillDefence_Min, Attack20020.SkillRange.SkillDefence_Max, Attack20020.SkillAngle.SkillDefence)
								})
							}),
							BT.GetRandomNode:create(Attack20020.SkillProb.SkillDefence, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20020_Define.SkillType.SkillLLL, 2),
							BT.IsSkillComboNode:create(self.instance),
							BT.RandomNode:create({
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
								BT.SequenceNode:create({
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20020_Define.SkillType.SkillLP, 1, true),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20020_Define.SkillType.SkillHP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20020_Define.SkillType.SkillLLL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20020_Define.SkillType.SkillNSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20020.SkillRange.SkillNSP_Min, Attack20020.SkillRange.SkillNSP_Max, Attack20020.SkillAngle.SkillNSP),
							BT.GetRandomNode:create(Attack20020.SkillProb.SkillNSP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20020_Define.SkillType.SkillNSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and target:IsHitBySkill(self.instance, Hero20020_Define.SkillType.SkillNSP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20020.SkillNSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20020_Define.SkillType.SkillLLL),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20020.SkillRange.SkillL, Attack20020.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20020_Define.SkillType.SkillLP),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20020.SkillRange.SkillLP, Attack20020.SkillAngle.SkillLP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20020_Define.SkillType.SkillLP, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20020_Define.SkillType.SkillHP),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20020.SkillRange.SkillHP, Attack20020.SkillAngle.SkillHP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20020_Define.SkillType.SkillHP, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20020:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20020
