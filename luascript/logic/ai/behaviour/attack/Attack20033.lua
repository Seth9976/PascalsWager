-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20033.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20033 = class("Attack20033")
Attack20033.static.SkillCd = {
	{
		Hero20033_Define.SkillType.SkillH,
		1,
		true
	},
	{
		Hero20033_Define.SkillType.SkillLP,
		5,
		true
	},
	{
		Hero20033_Define.SkillType.SkillD,
		3,
		false
	},
	{
		Hero20033_Define.SkillType.SkillDP,
		5,
		true
	},
	{
		Hero20033_Define.SkillType.SkillOO,
		1,
		true
	},
	{
		Hero20033_Define.SkillType.SkillDefence,
		10,
		false
	}
}
Attack20033.static.SkillProb = {
	SkillDP = 0.35,
	SkillD = 0.7,
	SkillLP = 0.35,
	SkillDefence = 0.3
}
Attack20033.static.SkillRange = {
	SkillDefence_Min = 6,
	SkillOO = 5,
	SkillDP = 5,
	SkillLP = 5.5,
	SkillD = 4.5,
	SkillDP_Max = 15,
	SkillH = 4.5,
	SkillDefence_Max = 9,
	SkillDP_Min = 5.5
}
Attack20033.static.SkillAngle = {
	SkillD_1 = 90,
	SkillLP = 55,
	SkillH = 30,
	SkillDP = 45,
	SkillOO = 60,
	SkillDefence = 55,
	SkillD_2 = 10
}
Attack20033.static.SkillDefenceTime = 4
Attack20033.static.SkillDPTime = 3.5
Attack20033.static.SkillLPTime = 2.5
Attack20033.static.TurnAroundTime = 1.5
Attack20033.static.HoverTimeRatio = 3.5

function Attack20033:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20033.HoverTimeRatio, 1)
	self.dropAttack = DropAttack:new(instance)
	self.skillCDList = Attack20033.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20033:create()
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
						Hero20033_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20033_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20033_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20033_Define.SkillType.SkillDP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20033_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20033_Define.SkillType.SkillOO, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20033_Define.SkillType.SkillOO
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20033_Define.SkillType.SkillOO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20033_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20033_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20033_Define.SkillType.SkillLP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
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
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillLP, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillOO, 2)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillDP, 3),
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
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillLP, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillOO, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20033_Define.SkillType.SkillDP, 3)
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
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20033_Define.SkillType.SkillOO, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20033_Define.SkillType.SkillLP, 3),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20033.SkillRange.SkillH, Attack20033.SkillAngle.SkillH),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20033_Define.SkillType.SkillDefence),
							BT.IsStartSkillingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetAttackingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20033.SkillRange.SkillDefence_Max, Attack20033.SkillAngle.SkillDefence),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20033_Define.SkillType.SkillDefence, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20033.SkillDefenceTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20033.SkillRange.SkillDefence_Min, Attack20033.SkillAngle.SkillDefence)
								})
							}),
							BT.GetRandomNode:create(Attack20033.SkillProb.SkillDefence, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20033_Define.SkillType.SkillDefence, 1, false),
							BT.ConditionWaitNode:create(function()
								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20033.SkillDefenceTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20033.SkillRange.SkillDP_Min, Attack20033.SkillRange.SkillDP_Max, Attack20033.SkillAngle.SkillDP),
							BT.GetRandomNode:create(Attack20033.SkillProb.SkillDP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20033_Define.SkillType.SkillDP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20033.SkillRange.SkillDP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20033.SkillDPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20033_Define.SkillType.SkillLP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20033.SkillRange.SkillLP, Attack20033.SkillAngle.SkillLP),
							BT.GetRandomNode:create(Attack20033.SkillProb.SkillLP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20033_Define.SkillType.SkillLP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20033.SkillLPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20033_Define.SkillType.SkillD),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsBehindNode:create(self.instance),
							BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20033.SkillAngle.SkillD_1)),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20033.SkillRange.SkillD),
							BT.GetRandomNode:create(Attack20033.SkillProb.SkillD, self.instance:GetAnimalId()),
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

								return targetPos ~= nil and GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20033.SkillAngle.SkillD_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20033.TurnAroundTime),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20033_Define.SkillType.SkillH),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20033.SkillRange.SkillH, Attack20033.SkillAngle.SkillH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20033_Define.SkillType.SkillOO),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20033.SkillRange.SkillOO, Attack20033.SkillAngle.SkillOO),
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

function Attack20033:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20033
