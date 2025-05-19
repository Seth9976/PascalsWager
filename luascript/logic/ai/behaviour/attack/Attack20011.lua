-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20011.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20011 = class("Attack20011")
Attack20011.static.SkillProb = {
	SkillH = 0.3,
	SkillO_1 = 0.65,
	SkillHP = 0.25,
	SkillO_2 = 0.3,
	SkillSP = 0.25
}
Attack20011.static.SkillCd = {
	{
		Hero20011_Define.SkillType.SkillHP,
		8,
		false
	},
	{
		Hero20011_Define.SkillType.SkillD,
		3,
		true
	},
	{
		Hero20011_Define.SkillType.SkillSP,
		10,
		true
	},
	{
		Hero20011_Define.SkillType.SkillO,
		6,
		false
	},
	{
		Hero20011_Define.SkillType.SkillH,
		3,
		true
	}
}
Attack20011.static.SkillRange = {
	SkillH_Max = 6,
	SkillSP_Max = 6,
	SkillL = 5.5,
	SkillO = 5,
	SkillH_Min = 2,
	SkillHP_Min = 5,
	SkillD_Max = 6,
	SkillD_Min = 3,
	SkillSP_Min = 4,
	SkillHP_Max = 7
}
Attack20011.static.SkillAngle = {
	SkillL = 30,
	SkillH = 45,
	SkillD = 15,
	SkillO = 120,
	SkillHP = 45,
	SkillSP = 20
}
Attack20011.static.SkillSPTime = 3.5

function Attack20011:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20011.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20011:create()
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
					BT.WaitNode:create(1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillSP
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillHP,
						Hero20011_Define.SkillType.SkillHPC
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20011_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20011_Define.SkillType.SkillLL, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20011_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
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
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillLL, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillH, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillSP, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillHP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillD, 1)
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillLL, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillH, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillSP, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillHP, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20011_Define.SkillType.SkillD, 1)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20011_Define.SkillType.SkillHP, 0),
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20011.SkillAngle.SkillHP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20011_Define.SkillType.SkillHP, 1, false),
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
								return self.instance:GetBrain().alertType == Alert.Type.Special
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsStartSkillingNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20011_Define.SkillType.SkillHP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.StopMovementNode:create(self.instance)
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
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20011_Define.SkillType.SkillHPC, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.StopMovementNode:create(self.instance)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20011_Define.SkillType.SkillLL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20011_Define.SkillType.SkillSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20011.SkillRange.SkillSP_Min, Attack20011.SkillRange.SkillSP_Max, Attack20011.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack20011.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20011_Define.SkillType.SkillHP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20011.SkillRange.SkillHP_Min, Attack20011.SkillRange.SkillHP_Max, Attack20011.SkillAngle.SkillHP),
							BT.GetRandomNode:create(Attack20011.SkillProb.SkillHP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20011_Define.SkillType.SkillHP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20011_Define.SkillType.SkillH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20011.SkillRange.SkillH_Min, Attack20011.SkillRange.SkillH_Max, Attack20011.SkillAngle.SkillH),
							BT.GetRandomNode:create(Attack20011.SkillProb.SkillH, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20011_Define.SkillType.SkillO),
							BT.IsBehindNode:create(self.instance),
							BT.IsStartSkillingNode:create(self.instance),
							BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20011.SkillAngle.SkillO)),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20011.SkillRange.SkillO),
							BT.GetRandomNode:create(Attack20011.SkillProb.SkillO_1, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20011_Define.SkillType.SkillO),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20011.SkillRange.SkillO, Attack20011.SkillAngle.SkillO),
							BT.GetRandomNode:create(Attack20011.SkillProb.SkillO_2, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20011.SkillRange.SkillL, Attack20011.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20011_Define.SkillType.SkillD),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20011.SkillRange.SkillD_Min, Attack20011.SkillRange.SkillD_Max, Attack20011.SkillAngle.SkillD),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20011:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20011
