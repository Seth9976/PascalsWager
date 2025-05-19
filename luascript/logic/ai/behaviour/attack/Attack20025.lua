-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20025.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20025 = class("Attack20025")
Attack20025.static.SkillCd = {
	{
		Hero20025_Define.SkillType.SkillO2,
		6,
		true
	},
	{
		Hero20025_Define.SkillType.SkillDD2,
		6,
		true
	},
	{
		Hero20025_Define.SkillType.SkillH1,
		1,
		true
	},
	{
		Hero20025_Define.SkillType.SkillH2,
		1,
		true
	},
	{
		Hero20025_Define.SkillType.SkillL1,
		1.5,
		true
	},
	{
		Hero20025_Define.SkillType.SkillL2,
		2.5,
		true
	},
	{
		Hero20025_Define.SkillType.SkillO1,
		5,
		true
	}
}
Attack20025.static.SkillProb = {
	SkillDD2 = 0.35,
	SkillH1 = 0.3,
	SkillO2 = 0.3
}
Attack20025.static.SkillRange = {
	SkillH2 = 4,
	SkillH1 = 3.5,
	SkillL2_Min = 1.5,
	SkillDD1 = 4.5,
	SkillL1_Min = 1.5,
	SkillDD2_Max = 8,
	SkillO2_Min = 4,
	SkillL1_Max = 20,
	SkillDD2_Min = 4,
	SkillDD2 = 2,
	SkillO2_Max = 20,
	SkillL2_Max = 20
}
Attack20025.static.SkillAngle = {
	SkillDD1 = 45,
	SkillH1 = 90,
	SkillO2 = 45,
	SkillL2 = 60,
	SkillDD2 = 45,
	SkillL1 = 60,
	SkillH2 = 90
}
Attack20025.static.ShapeshiftHpRate = 0.6

function Attack20025:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20025.SkillCd
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20025:create()
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
						Hero20025_Define.SkillType.SkillO1,
						Hero20025_Define.SkillType.SkillO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20025_Define.SkillType.SkillH1,
						Hero20025_Define.SkillType.SkillH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20025_Define.SkillType.SkillL1,
						Hero20025_Define.SkillType.SkillL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20025_Define.SkillType.SkillDD1,
						Hero20025_Define.SkillType.SkillDD2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20025_Define.SkillType.SkillDD1,
						Hero20025_Define.SkillType.SkillDD2
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
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillO1),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Attack20025.ShapeshiftHpRate
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.alert.alertNode,
				self.threat.threatNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillH1, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillH2, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillDD1, 2)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2, 4),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == true
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillH1, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillH2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillDD1, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2, 4)
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
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD1, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20025.SkillRange.SkillH1, Attack20025.SkillAngle.SkillH1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20025.SkillRange.SkillDD1, Attack20025.SkillAngle.SkillDD1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20025.SkillRange.SkillH1, Attack20025.SkillAngle.SkillH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId()),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillL1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20025.SkillRange.SkillL1_Min, Attack20025.SkillRange.SkillL1_Max, Attack20025.SkillAngle.SkillL1),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target ~= nil and target:GetHitType() == AnimalBase_Define.HitType.Freeze
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.StopSkillNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20025.SkillRange.SkillDD2_Min),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2, 2),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsHitBySkillNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2, 2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										}),
										BT.SequenceNode:create({
											BT.IsSkillComboNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20025.SkillRange.SkillH2, Attack20025.SkillAngle.SkillH2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillO2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20025.SkillRange.SkillO2_Min, Attack20025.SkillRange.SkillO2_Max, Attack20025.SkillAngle.SkillO2),
									BT.GetRandomNode:create(Attack20025.SkillProb.SkillO2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillDD2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20025.SkillRange.SkillDD2_Min, Attack20025.SkillRange.SkillDD2_Max, Attack20025.SkillAngle.SkillDD2),
									BT.GetRandomNode:create(Attack20025.SkillProb.SkillDD2, self.instance:GetAnimalId()),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillH2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20025.SkillRange.SkillH2, Attack20025.SkillAngle.SkillH2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20025_Define.SkillType.SkillL2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20025.SkillRange.SkillL2_Min, Attack20025.SkillRange.SkillL2_Max, Attack20025.SkillAngle.SkillL2),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20025:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20025
