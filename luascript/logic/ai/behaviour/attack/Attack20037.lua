-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20037.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Hover")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20037 = class("Attack20037")
Attack20037.static.SkillCd = {
	{
		Hero20037_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20037_Define.SkillType.SkillH,
		1,
		true
	},
	{
		Hero20037_Define.SkillType.SkillNH,
		1,
		true
	},
	{
		Hero20037_Define.SkillType.SkillHP,
		6,
		true
	},
	{
		Hero20037_Define.SkillType.SkillS,
		2,
		true
	},
	{
		Hero20037_Define.SkillType.SkillSP,
		7,
		false
	},
	{
		Hero20037_Define.SkillType.SkillNS,
		8,
		true
	},
	{
		Hero20037_Define.SkillType.SkillNSP,
		8,
		true
	},
	{
		Hero20037_Define.SkillType.SkillDP,
		4,
		true
	}
}
Attack20037.static.SkillProb = {
	SkillNSP = 0.65,
	SkillDP = 0.65,
	SkillS = 0.35,
	SkillHP = 0.35,
	SkillNS = 0.3,
	SkillSP = 0.35
}
Attack20037.static.SkillRange = {
	SkillNSP = 5.5,
	SkillD = 4.5,
	SkillHP_Min = 4,
	SkillSP_Max = 20,
	SkillS_Max = 20,
	SkillNS = 5.5,
	SkillDP = 4,
	SkillLLL = 4,
	SkillS_Min = 4.5,
	SkillH = 4,
	SkillNH = 4,
	SkillSP_Min = 4.5,
	SkillHP_Max = 10
}
Attack20037.static.SkillAngle = {
	SkillD_1 = 45,
	SkillDP_1 = 35,
	SkillNSP_2 = 10,
	SkillHP = 45,
	SkillD_2 = 135,
	SkillLLL = 45,
	SkillS = 30,
	SkillH = 60,
	SkillNSP_1 = 120,
	SkillNS = 30,
	SkillDP_2 = 145,
	SkillSP = 30
}
Attack20037.static.HoverTimeRatio = 2
Attack20037.static.SkillHPTime = 3
Attack20037.static.TurnAroundTime = 1.5
Attack20037.static.SkillSPPercent = 0.6
Attack20037.static.ChangeFollowTypeRange = 9.5

function Attack20037:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20037.HoverTimeRatio, 1)
	self.skillCDList = Attack20037.SkillCd
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20037:create()
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
						Hero20037_Define.SkillType.SkillNS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillNSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20037_Define.SkillType.SkillNSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20037_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20037_Define.SkillType.SkillDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20037_Define.SkillType.SkillHP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillNH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20037_Define.SkillType.SkillLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20037_Define.SkillType.SkillLLL
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
			BT.CommonNode:create(function()
				if self.followType ~= Follow.Type.Default then
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20037.ChangeFollowTypeRange) == true then
						self.followType = Follow.Type.Default
					end
				end
			end),
			BT.SelectorNode:create({
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
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillNH, 1)
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillHP, 3),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillNH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20037_Define.SkillType.SkillHP, 3)
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
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.IsTargetAttackingNode:create(self.instance),
					BT.IsLeftNode:create(self.instance),
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()
						local targetSkillType = target:GetSkillTypeForAI()
						local triggerValue = math.floor(target:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger))

						return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose and triggerValue == 1 and self.instance:IsFreeSkillEnable() == true
					end),
					BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20037.SkillAngle.SkillD_1)),
					BT.IsTargetWithinAngleNode:create(self.instance, Attack20037.SkillAngle.SkillD_2),
					BT.IsTargetWithinRangeNode:create(self.instance, Attack20037.SkillRange.SkillD),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20037_Define.SkillType.SkillLLL, 0),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20037_Define.SkillType.SkillH, 1),
								BT.IsSkillingByIdNode:create(self.instance, Hero20037_Define.SkillType.SkillDP, 1)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20037.SkillRange.SkillNH),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsCanAttackNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.followType == Follow.Type.Stay
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20037.SkillRange.SkillSP_Max, Attack20037.SkillAngle.SkillSP)
								}),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20037.SkillRange.SkillSP_Min, Attack20037.SkillRange.SkillSP_Max, Attack20037.SkillAngle.SkillSP)
							}),
							BT.GetRandomNode:create(Attack20037.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.SetSkillTargetNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20037_Define.SkillType.SkillSP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsCanAttackNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.followType == Follow.Type.Stay
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20037.SkillRange.SkillS_Max, Attack20037.SkillAngle.SkillS)
								}),
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20037.SkillRange.SkillS_Min, Attack20037.SkillRange.SkillS_Max, Attack20037.SkillAngle.SkillS),
									BT.GetRandomNode:create(Attack20037.SkillProb.SkillS, self.instance:GetAnimalId())
								})
							}),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillNS),
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillNSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20037.SkillRange.SkillNS, Attack20037.SkillAngle.SkillNS),
							BT.GetRandomNode:create(Attack20037.SkillProb.SkillNS, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillNSP),
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillNS),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsBehindNode:create(self.instance),
							BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20037.SkillAngle.SkillNSP_1)),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20037.SkillRange.SkillNSP),
							BT.GetRandomNode:create(Attack20037.SkillProb.SkillNSP, self.instance:GetAnimalId()),
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

								return GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20037.SkillAngle.SkillNSP_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20037.TurnAroundTime),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20037_Define.SkillType.SkillNSP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillHP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.ConditionNode:create(function()
								return self.instance:GetMoveSpeed() < AnimalBase_Define.MotionWalkSpeed
							end),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20037.SkillRange.SkillHP_Min, Attack20037.SkillRange.SkillHP_Max, Attack20037.SkillAngle.SkillHP),
							BT.GetRandomNode:create(Attack20037.SkillProb.SkillHP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20037_Define.SkillType.SkillHP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20037.SkillRange.SkillHP_Min) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20037.SkillHPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillDP),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
							BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20037.SkillAngle.SkillDP_1)),
							BT.IsTargetWithinAngleNode:create(self.instance, Attack20037.SkillAngle.SkillDP_2),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20037.SkillRange.SkillDP),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20037_Define.SkillType.SkillDP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillLLL),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20037.SkillRange.SkillLLL, Attack20037.SkillAngle.SkillLLL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillH),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20037.SkillRange.SkillH, Attack20037.SkillAngle.SkillH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20037_Define.SkillType.SkillNH),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20037.SkillRange.SkillNH, Attack20037.SkillAngle.SkillNH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20037:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance, true)

	return target
end

return Attack20037
