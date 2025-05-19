-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20006.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/CircleRound")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20006 = class("Attack20006")
Attack20006.static.SkillProb = {
	SkillS = 0.65,
	SkillH = 0.3,
	Dodge = 0.25
}
Attack20006.static.SkillCd = {
	{
		Hero20006_Define.SkillType.SkillH,
		4,
		true
	},
	{
		Hero20006_Define.SkillType.SkillS,
		5,
		false
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		5,
		true
	}
}
Attack20006.static.SkillRange = {
	SkillH_Max = 5,
	SkillL = 3.5,
	SkillS = 2.5,
	Dodge_Max = 7,
	SkillH_Min = 3.5,
	Dodge_Min = 5
}
Attack20006.static.SkillAngle = {
	SkillL = 60,
	SkillH = 30,
	Dodge = 55
}
Attack20006.static.CircleRoundTimeRatio = 2

function Attack20006:initialize(instance)
	self.instance = instance
	self.circleRound = CircleRound:new(instance, CircleRound.CircleRoundType.Normal, Attack20006.CircleRoundTimeRatio)
	self.dodge = Dodge:new(instance, Attack20006.SkillRange.Dodge_Min, Attack20006.SkillRange.Dodge_Max, Attack20006.SkillAngle.Dodge, Attack20006.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20006.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20006:create()
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
						Hero20006_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20006_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20006_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20006_Define.SkillType.SkillLLL
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20006_Define.SkillType.SkillLLL
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
				self.circleRound.circleRoundNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetMonsterAILevel() == GameAI.AILevel.Easy
							end),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20006_Define.SkillType.SkillLLL, 2),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
							}, self.instance:GetAnimalId(), {
								3,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetMonsterAILevel() == GameAI.AILevel.Normal
							end),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20006_Define.SkillType.SkillLLL, 3),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
							}, self.instance:GetAnimalId(), {
								3,
								3,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20006_Define.SkillType.SkillH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1)
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
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20006_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20006_Define.SkillType.SkillH, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
						}, self.instance:GetAnimalId(), {
							3,
							1,
							2
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20006_Define.SkillType.SkillLLL, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20006_Define.SkillType.SkillH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20006.SkillRange.SkillH_Min, Attack20006.SkillRange.SkillH_Max, Attack20006.SkillAngle.SkillH),
							BT.GetRandomNode:create(Attack20006.SkillProb.SkillH, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20006.SkillRange.SkillL, Attack20006.SkillAngle.SkillL),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20006_Define.SkillType.SkillS),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsBehindNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20006.SkillRange.SkillS),
							BT.GetRandomNode:create(Attack20006.SkillProb.SkillS, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20006:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20006
