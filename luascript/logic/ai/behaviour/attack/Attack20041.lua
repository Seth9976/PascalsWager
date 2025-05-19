-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20041.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20041 = class("Attack20041")
Attack20041.static.SkillCd = {
	{
		Hero20041_Define.SkillType.SkillLP,
		1,
		true
	},
	{
		Hero20041_Define.SkillType.SkillHP,
		3,
		true
	},
	{
		Hero20041_Define.SkillType.SkillH,
		4,
		true
	},
	{
		Hero20041_Define.SkillType.SkillS,
		4,
		true
	},
	{
		Hero20041_Define.SkillType.SkillSP,
		6,
		false
	}
}
Attack20041.static.SkillProb = {
	SkillS = 0.35,
	SkillSP = 0.4
}
Attack20041.static.SkillRange = {
	SkillS_Min = 5.5,
	SkillH = 5,
	SkillLP = 3,
	SkillLL = 3,
	SkillS_Max = 15,
	SkillHP = 3,
	SkillSP = 5
}
Attack20041.static.SkillAngle = {
	SkillS = 30,
	SkillH = 45,
	SkillLP = 45,
	SkillLL = 45,
	SkillHP = 45,
	SkillSP = 30
}
Attack20041.static.HoverTimeRatio = 2

function Attack20041:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20041.HoverTimeRatio, 1)
	self.dropAttack = DropAttack:new(instance)
	self.skillCDList = Attack20041.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20041:create()
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
						Hero20041_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20041_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20041_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20041_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20041_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20041_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20041_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20041_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20041_Define.SkillType.SkillLL, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20041_Define.SkillType.SkillLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20041_Define.SkillType.SkillLL
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
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillLL, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillLP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillHP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillH, 1)
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillSP, 3),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillLL, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillLP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillHP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20041_Define.SkillType.SkillSP, 3)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20041_Define.SkillType.SkillSP, 0),
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
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Stay
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20041.SkillAngle.SkillSP),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20041_Define.SkillType.SkillSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
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
							BT.IsSkillCdNode:create(self.instance, Hero20041_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillS_Max, Attack20041.SkillAngle.SkillS),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20041_Define.SkillType.SkillLL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20041_Define.SkillType.SkillLL, 2),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillLP, Attack20041.SkillAngle.SkillLP),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20041_Define.SkillType.SkillLP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20041_Define.SkillType.SkillHP, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20041.SkillRange.SkillH),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20041_Define.SkillType.SkillSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillSP, Attack20041.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack20041.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.SetSkillTargetNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20041_Define.SkillType.SkillSP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20041_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsCanAttackNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20041.SkillRange.SkillS_Min, Attack20041.SkillRange.SkillS_Max, Attack20041.SkillAngle.SkillS),
							BT.GetRandomNode:create(Attack20041.SkillProb.SkillS, self.instance:GetAnimalId()),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillLL, Attack20041.SkillAngle.SkillLL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20041_Define.SkillType.SkillLP),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillLP, Attack20041.SkillAngle.SkillLP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20041_Define.SkillType.SkillLP, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20041_Define.SkillType.SkillHP),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillHP, Attack20041.SkillAngle.SkillHP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20041_Define.SkillType.SkillHP, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20041_Define.SkillType.SkillH),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20041.SkillRange.SkillH, Attack20041.SkillAngle.SkillH),
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

function Attack20041:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20041
