-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack90007.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/CircleRound")

local BT = require("LuaScript/Lib/behaviourtree")

Attack90007 = class("Attack90007")
Attack90007.static.SkillCd = {
	{
		Hero90007_Define.SkillType.SkillL,
		1,
		true
	},
	{
		Hero90007_Define.SkillType.SkillH,
		1,
		true
	},
	{
		Hero90007_Define.SkillType.SkillLP,
		1,
		true
	},
	{
		Hero90007_Define.SkillType.SkillO,
		5,
		true
	},
	{
		Hero90007_Define.SkillType.SkillS,
		5,
		true
	}
}
Attack90007.static.SkillProb = {
	Dodge = 0.4,
	SkillO = 0.3
}
Attack90007.static.SkillRange = {
	SkillL = 2.5,
	SkillLP = 2.5,
	SkillH = 2.5,
	SkillO = 5,
	SkillS = 20,
	Dodge_Min = 5,
	Dodge_Max = 10
}
Attack90007.static.SkillAngle = {
	SkillS = 30,
	SkillLP = 60,
	SkillH = 60,
	SkillO = 60,
	SkillL = 60,
	Dodge = 55
}
Attack90007.static.CircleRoundTimeRatio = 2

function Attack90007:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack90007.SkillCd
	self.followType = Follow.Type.Default
	self.circleRound = CircleRound:new(instance, CircleRound.CircleRoundType.Normal, Attack90007.CircleRoundTimeRatio)
	self.dodge = Dodge:new(instance, Attack90007.SkillRange.Dodge_Min, Attack90007.SkillRange.Dodge_Max, Attack90007.SkillAngle.Dodge, Attack90007.SkillProb.Dodge, Hero90007_Define.SkillType.SkillD, Dodge.Aggressive.Low)
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
	self.isWait = false
end

function Attack90007:create()
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
						Hero90007_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero90007_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero90007_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero90007_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero90007_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero90007_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero90007_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.isWait == false
					end),
					BT.CommonNode:create(function()
						self.isWait = true
					end),
					BT.StopMovementNode:create(self.instance),
					BT.WaitNode:create(1)
				}),
				self.circleRound.circleRoundNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							return target:GetHitType() == AnimalBase_Define.HitType.Backstab2
						end

						return false
					end),
					BT.CommonNode:create(function()
						self.instance:StopMovementImmediately(true)
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound)
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero90007_Define.SkillType.SkillL, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero90007_Define.SkillType.SkillH, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero90007_Define.SkillType.SkillLP, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero90007_Define.SkillType.SkillO, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
					}, self.instance:GetAnimalId(), {
						1,
						2,
						1
					})
				}),
				BT.SequenceNode:create({
					BT.IsSkillIndexChangeNode:create(self.instance, Hero90007_Define.SkillType.SkillS, 1),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
					}, self.instance:GetAnimalId(), {
						1,
						2
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.IsSkillConditionNode:create(self.instance, Hero90007_Define.SkillType.SkillS, 2),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Stay
							end)
						}),
						BT.CommonNode:create(function()
							self.followType = Follow.Type.Default
						end)
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillConditionNode:create(self.instance, Hero90007_Define.SkillType.SkillO, 1),
							BT.IsSkillCdNode:create(self.instance, Hero90007_Define.SkillType.SkillO),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack90007.SkillRange.SkillO, Attack90007.SkillAngle.SkillO),
							BT.GetRandomNode:create(Attack90007.SkillProb.SkillO, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillConditionNode:create(self.instance, Hero90007_Define.SkillType.SkillS, 2),
							BT.IsSkillCdNode:create(self.instance, Hero90007_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack90007.SkillRange.SkillS, Attack90007.SkillAngle.SkillS),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillConditionNode:create(self.instance, Hero90007_Define.SkillType.SkillL, 1),
								BT.IsSkillCdNode:create(self.instance, Hero90007_Define.SkillType.SkillL),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack90007.SkillRange.SkillL, Attack90007.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillConditionNode:create(self.instance, Hero90007_Define.SkillType.SkillH, 1),
								BT.IsSkillCdNode:create(self.instance, Hero90007_Define.SkillType.SkillH),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack90007.SkillRange.SkillH, Attack90007.SkillAngle.SkillH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillConditionNode:create(self.instance, Hero90007_Define.SkillType.SkillLP, 1),
								BT.IsSkillCdNode:create(self.instance, Hero90007_Define.SkillType.SkillLP),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack90007.SkillRange.SkillLP, Attack90007.SkillAngle.SkillLP),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero90007_Define.SkillType.SkillLP, 1, false),
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

function Attack90007:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack90007
