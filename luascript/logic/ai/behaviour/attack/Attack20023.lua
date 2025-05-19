-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20023.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20023 = class("Attack20023")
Attack20023.static.SkillCd = {
	{
		Hero20023_Define.SkillType.SkillLP,
		4,
		true
	},
	{
		Hero20023_Define.SkillType.SkillNSP,
		6,
		true
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		5,
		true
	},
	{
		Hero20023_Define.SkillType.SkillDefence,
		5,
		true
	}
}
Attack20023.static.SkillProb = {
	SkillNSP = 0.35,
	SkillDefence = 0.25,
	DodgeAttack = 0.35,
	Dodge = 0.5
}
Attack20023.static.SkillRange = {
	SkillNSP_Max = 10,
	SkillL = 4,
	DodgeAttack_Max = 5.5,
	SkillDefence_Min = 5,
	SkillDefence_Max = 8,
	Dodge_Min = 5,
	Dodge_Max = 7,
	SkillLP = 4,
	SkillNH = 4,
	DodgeAttack_Min = 2.5,
	SkillNSP_Min = 5
}
Attack20023.static.SkillAngle = {
	SkillNSP = 45,
	SkillLP = 45,
	SkillNH = 45,
	SkillL = 45,
	DodgeAttack = 55,
	SkillDefence = 45,
	Dodge = 55
}
Attack20023.static.HoverTimeRatio = 3
Attack20023.static.SkillNSPTime = 2.5
Attack20023.static.SkillDefenceTime = 3.5

function Attack20023:initialize(instance)
	self.instance = instance
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Horizontal, Attack20023.HoverTimeRatio, 2, Hero20023_Define.SkillType.SkillDefence)
	self.dodge = Dodge:new(instance, Attack20023.SkillRange.Dodge_Min, Attack20023.SkillRange.Dodge_Max, Attack20023.SkillAngle.Dodge, Attack20023.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.High)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.skillCDList = Attack20023.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20023:create()
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
						Hero20023_Define.SkillType.SkillNSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20023_Define.SkillType.SkillNSP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return target:IsHit() == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20023_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20023_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 3),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
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
						Hero20023_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20023_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20023_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20023_Define.SkillType.SkillNH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20023_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20023_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20023_Define.SkillType.SkillLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20023_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20023_Define.SkillType.SkillLLL
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
				self.dropAttack.dropAttackNode,
				self.alert.alertNode,
				self.threat.threatNode,
				self.hoverInDefence.hoverInDefenceNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillLP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillHP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillH, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.SequenceNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
									end)
								})
							}, self.instance:GetAnimalId(), {
								3,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillNSP, 3),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillLP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillHP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20023_Define.SkillType.SkillNSP, 3)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20023_Define.SkillType.SkillNSP, 0),
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20023.SkillAngle.SkillNSP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20023_Define.SkillType.SkillNSP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and target:IsHitBySkill(self.instance, Hero20023_Define.SkillType.SkillNSP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20023.SkillNSPTime),
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
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.ConditionNode:create(function()
								return self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true
							end),
							BT.RandomNode:create({
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
								BT.SequenceNode:create({
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20023_Define.SkillType.SkillHP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20023_Define.SkillType.SkillDefence, 4),
							BT.ConditionNode:create(function()
								return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20023.SkillRange.SkillNH),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20023_Define.SkillType.SkillDefence),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsTargetAttackingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20023.SkillRange.SkillDefence_Min, Attack20023.SkillAngle.SkillDefence),
									BT.GetRandomNode:create(Attack20023.SkillProb.SkillDefence, self.instance:GetAnimalId()),
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
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20023.SkillRange.SkillDefence_Max, Attack20023.SkillAngle.SkillDefence),
									BT.GetRandomNode:create(Attack20023.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
									BT.CommonNode:create(function()
										self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
									end)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20023_Define.SkillType.SkillLLL, 2),
							BT.IsSkillComboNode:create(self.instance),
							BT.RandomNode:create({
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
								BT.SequenceNode:create({
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20023_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20023_Define.SkillType.SkillLLL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20023_Define.SkillType.SkillNSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20023.SkillRange.SkillNSP_Min, Attack20023.SkillRange.SkillNSP_Max, Attack20023.SkillAngle.SkillNSP),
							BT.GetRandomNode:create(Attack20023.SkillProb.SkillNSP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20023_Define.SkillType.SkillNSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and target:IsHitBySkill(self.instance, Hero20023_Define.SkillType.SkillNSP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20023.SkillNSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20023.SkillRange.DodgeAttack_Min, Attack20023.SkillRange.DodgeAttack_Max, Attack20023.SkillAngle.DodgeAttack),
							BT.GetRandomNode:create(Attack20023.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Slant)
							end)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20023.SkillRange.SkillL, Attack20023.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20023_Define.SkillType.SkillLP),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20023.SkillRange.SkillLP, Attack20023.SkillAngle.SkillLP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20023_Define.SkillType.SkillLP, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20023:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20023
