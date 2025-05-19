-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20018.lua

require("LuaScript/Lib/func")
require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/DropAttack")
require("LuaScript/Logic/AI/Behaviour/CircleRound")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20018 = class("Attack20018")
Attack20018.static.SkillCd = {
	{
		Hero20018_Define.SkillType.SkillL,
		4,
		false
	},
	{
		Hero20018_Define.SkillType.SkillH,
		2,
		true
	},
	{
		Hero20018_Define.SkillType.SkillNSP,
		5,
		true
	},
	{
		Hero20018_Define.SkillType.SkillNL,
		1,
		true
	},
	{
		Hero20018_Define.SkillType.SkillDefence,
		8,
		true
	}
}
Attack20018.static.SkillProb = {
	SkillNSP = 0.35,
	SkillDefence = 0.25,
	SkillL = 0.65,
	SkillH = 0.35
}
Attack20018.static.SkillRange = {
	SkillDefence_Min = 5,
	SkillNSP_Max = 12,
	SkillH_Max = 8,
	SkillL = 4.5,
	SkillH_Min = 4,
	SkillNL = 4.5,
	SkillDefence_Max = 8,
	SkillNH = 4.5,
	SkillNSP_Min = 4.5
}
Attack20018.static.SkillAngle = {
	SkillNSP = 30,
	SkillL_2 = 120,
	SkillNH = 30,
	SkillL_1 = 30,
	SkillH = 15,
	SkillNL = 30,
	SkillDefence = 55
}
Attack20018.static.SkillNSPTime = 2
Attack20018.static.SkillDefenceTime = 3.5
Attack20018.static.CircleRoundTimeRatio = 2.5

function Attack20018:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.circleRound = CircleRound:new(instance, CircleRound.CircleRoundType.Normal, Attack20018.CircleRoundTimeRatio)
	self.dropAttack = DropAttack:new(instance)
	self.skillCDList = Attack20018.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20018:create()
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
						Hero20018_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20018_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20018_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20018_Define.SkillType.SkillNSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20018_Define.SkillType.SkillNSP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return target:IsHit() == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 3),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20018_Define.SkillType.SkillNH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20018_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20018_Define.SkillType.SkillL
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
				self.circleRound.circleRoundNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillL, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillNL, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillNH, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillNSP, 3),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillL, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillNL, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillNH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20018_Define.SkillType.SkillNSP, 3)
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
							BT.IsSkillingByIdNode:create(self.instance, Hero20018_Define.SkillType.SkillDefence, 4),
							BT.ConditionNode:create(function()
								return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20018.SkillRange.SkillNL),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20018_Define.SkillType.SkillDefence),
							BT.IsStartSkillingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetAttackingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20018.SkillRange.SkillDefence_Max, Attack20018.SkillAngle.SkillDefence),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20018_Define.SkillType.SkillDefence, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end, Attack20018.SkillDefenceTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20018.SkillRange.SkillDefence_Min, Attack20018.SkillAngle.SkillDefence)
								})
							}),
							BT.GetRandomNode:create(Attack20018.SkillProb.SkillDefence, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20018_Define.SkillType.SkillDefence, 1, false),
							BT.ConditionWaitNode:create(function()
								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end, Attack20018.SkillDefenceTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20018_Define.SkillType.SkillH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20018.SkillRange.SkillH_Min, Attack20018.SkillRange.SkillH_Max, Attack20018.SkillAngle.SkillH),
							BT.GetRandomNode:create(Attack20018.SkillProb.SkillH, self.instance:GetAnimalId()),
							BT.IsCanAttackNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20018_Define.SkillType.SkillNSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20018.SkillRange.SkillNSP_Min, Attack20018.SkillRange.SkillNSP_Max, Attack20018.SkillAngle.SkillNSP),
							BT.GetRandomNode:create(Attack20018.SkillProb.SkillNSP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20018_Define.SkillType.SkillNSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and target:IsHitBySkill(self.instance, Hero20018_Define.SkillType.SkillNSP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20018.SkillNSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20018_Define.SkillType.SkillL),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsBehindNode:create(self.instance),
							BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20018.SkillAngle.SkillL_2)),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20018.SkillRange.SkillL),
							BT.GetRandomNode:create(Attack20018.SkillProb.SkillL, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20018.SkillRange.SkillNH, Attack20018.SkillAngle.SkillNH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20018_Define.SkillType.SkillNL),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20018.SkillRange.SkillNL, Attack20018.SkillAngle.SkillNL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20018.SkillRange.SkillL, Attack20018.SkillAngle.SkillL_1),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20018:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20018
