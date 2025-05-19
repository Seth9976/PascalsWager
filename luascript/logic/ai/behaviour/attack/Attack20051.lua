-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20051.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20051 = class("Attack20051")
Attack20051.static.SkillCd = {
	{
		Hero20051_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20051_Define.SkillType.SkillHPH,
		1,
		true
	},
	{
		Hero20051_Define.SkillType.SkillLPLLL,
		8,
		true
	},
	{
		Hero20051_Define.SkillType.SkillH,
		5,
		true
	},
	{
		Hero20051_Define.SkillType.SkillO,
		5,
		true
	},
	{
		Hero20051_Define.SkillType.SkillND1,
		8,
		true
	},
	{
		Hero20051_Define.SkillType.SkillND2,
		8,
		true
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		6,
		true
	},
	{
		Hero20051_Define.SkillType.SkillS,
		8,
		true
	}
}
Attack20051.static.SkillProb = {
	SkillS_1 = 0.5,
	SkillD = 0.5,
	SkillND = 0.4,
	SkillO = 0.4,
	Dodge_1 = 0.4,
	SkillH = 0.65,
	SkillS_2 = 0.3,
	DodgeAttack = 0.3,
	Dodge_2 = 1
}
Attack20051.static.SkillRange = {
	SkillLLL = 6,
	SkillS_Min = 5,
	SkillS_Max = 15,
	SkillD_Max = 12,
	SkillLPLLL = 6,
	DodgeAttack_Max = 9,
	SkillND_Min = 5.5,
	SkillND2 = 12,
	SkillND1 = 4.5,
	SkillO_Min = 6.5,
	SkillND_Max = 12,
	Dodge_Min = 6,
	SkillHPH = 6,
	Dodge_Max = 12,
	SkillH = 3,
	SkillD_Min = 6,
	DodgeAttack_Min = 5,
	SkillO_Max = 15
}
Attack20051.static.SkillAngle = {
	SkillHPH = 45,
	SkillD = 55,
	SkillND = 55,
	SkillO = 30,
	SkillLPLLL = 45,
	SkillSP = 30,
	SkillLLL = 45,
	SkillS = 55,
	SkillH = 120,
	DodgeAttack = 45,
	Dodge = 180
}
Attack20051.static.HitMaxTime = 2
Attack20051.static.HoverTimeRatio = 1.5

function Attack20051:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.execute = Execute:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20051.HoverTimeRatio, 1, AnimalBase_Define.SpeedMode.Slow)
	self.dodge1 = Dodge:new(instance, Attack20051.SkillRange.Dodge_Min, Attack20051.SkillRange.Dodge_Max, Attack20051.SkillAngle.Dodge, Attack20051.SkillProb.Dodge_1, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.dodge2 = Dodge:new(instance, Attack20051.SkillRange.Dodge_Min, Attack20051.SkillRange.Dodge_Max, Attack20051.SkillAngle.Dodge, Attack20051.SkillProb.Dodge_2, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.skillCDList = Attack20051.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.isWaitAttack = false
	self.attackNode = self:create()
end

function Attack20051:create()
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
						Hero20051_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillND1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillND1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillND1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillND2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillND1,
						Hero20051_Define.SkillType.SkillND2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
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
						AnimalBase_Define.SkillType.Relax
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillLPLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillHPH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillLPLLL
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20051_Define.SkillType.SkillLPLLL, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillHPH
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20051_Define.SkillType.SkillHPH, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20051_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20051_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
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
				self.execute.executeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsPermitExecuteHit() == true
					end),
					BT.StopSkillNode:create(self.instance),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)
				}),
				BT.SequenceNode:create({
					BT.IsVarietyNode:create(self.instance, 2),
					BT.ConditionNode:create(function()
						return self.isWaitAttack == true
					end),
					BT.IsSkillingNode:create(self.instance),
					BT.IsTargetAttackingNode:create(self.instance),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillND_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillND_Min),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
						}),
						BT.SequenceNode:create({
							BT.CommonNode:create(function()
								self.isWaitAttack = false
							end),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
						})
					}),
					BT.CommonNode:create(function()
						self.isWaitAttack = false
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.IsVarietyNode:create(self.instance, 2),
					BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillND1),
					BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillND2),
					BT.ConditionNode:create(function()
						return self.isWaitAttack == false
					end),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 2),
						BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH, 1)
					}),
					BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillND_Min, Attack20051.SkillAngle.SkillND),
					BT.IsSkillComboNode:create(self.instance),
					BT.GetRandomNode:create(Attack20051.SkillProb.SkillND, self.instance:GetAnimalId()),
					BT.CommonNode:create(function()
						self.isWaitAttack = true
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								return target ~= nil and target:IsHost() == true
							end),
							BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillS)
						}),
						BT.ConditionNode:create(function()
							local target = self.instance:GetBrain():GetAnimalTarget()

							return target == nil or target:IsHost() == false
						end)
					}),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.IsTargetAttackingNode:create(self.instance),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillS_Min, Attack20051.SkillAngle.SkillS),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose
							end),
							BT.SelectorNode:create({
								BT.ConditionNode:create(function()
									local target = self.instance:GetBrain():GetAnimalTarget()

									return target == nil or target:IsHost() == false
								end),
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 2),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillS_2, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 1),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillS_1, self.instance:GetAnimalId())
								})
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillS_Max, Attack20051.SkillAngle.SkillS),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar and math.floor(target:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)) > 0
							end),
							BT.SelectorNode:create({
								BT.ConditionNode:create(function()
									local target = self.instance:GetBrain():GetAnimalTarget()

									return target == nil or target:IsHost() == false
								end),
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 2),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillS_2, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsVarietyNode:create(self.instance, 1),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillS_1, self.instance:GetAnimalId())
								})
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						})
					}),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsHost() == true
					end),
					self.dodge1.dodgeNode
				}),
				self.dodge2.dodgeNode,
				self.threat.threatNode,
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsVarietyNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 5)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.SequenceNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge1:SetDodgeType(Dodge.DodgeType.Back)
									end)
								})
							}, self.instance:GetAnimalId(), {
								3,
								2,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.IsVarietyNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 5)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.SequenceNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge1:SetDodgeType(Dodge.DodgeType.Back)
									end)
								})
							}, self.instance:GetAnimalId(), {
								4,
								3,
								1
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillND1, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillND2, 3)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
							BT.ConditionNode:create(function()
								return self.dodge1:IsDodgeType(Dodge.DodgeType.Back) == true
							end),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId(), {
								2,
								1
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Execute, 1),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 5)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.SequenceNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
								BT.CommonNode:create(function()
									self.dodge1:SetDodgeType(Dodge.DodgeType.Back)
								end)
							})
						}, self.instance:GetAnimalId(), {
							2,
							1
						})
					}),
					BT.SequenceNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Execute, 1),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillSP, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsVarietyNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20051.SkillAngle.SkillSP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20051_Define.SkillType.SkillSP, 1, false),
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
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 3)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 1),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											local skillAI = target:GetSkillTypeForAI()

											if target:IsHit() == true or skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit or target:IsHost() == false then
												return true
											end
										end

										return false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLLL),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Threat, 0),
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Alert, 0)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Threat.ThreatDistanceMin),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillH),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20051.SkillAngle.SkillH)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20051.SkillRange.SkillH),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillH, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target == nil or target:IsHost() == false
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillO),
									BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20051.SkillRange.SkillO_Min, Attack20051.SkillRange.SkillO_Max, Attack20051.SkillAngle.SkillO),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillO, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20051.SkillRange.DodgeAttack_Min, Attack20051.SkillRange.DodgeAttack_Max, Attack20051.SkillAngle.DodgeAttack),
									BT.GetRandomNode:create(Attack20051.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge1:SetDodgeType(Dodge.DodgeType.Forward)
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL),
										BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLLL, Attack20051.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL),
										BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLPLLL, Attack20051.SkillAngle.SkillLPLLL),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20051_Define.SkillType.SkillLPLLL, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsVarietyNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20051.SkillAngle.SkillSP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20051_Define.SkillType.SkillSP, 1, false),
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
										return self.isWaitAttack == false
									end),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.isWaitAttack == false
									end),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 3)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL, 1),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											local skillAI = target:GetSkillTypeForAI()

											if target:IsHit() == true or skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit then
												return true
											end
										end

										return false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillO, 2),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target == nil or target:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLLL),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillHPH),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20051_Define.SkillType.SkillHPH, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLLL),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillHPH),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20051_Define.SkillType.SkillHPH, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsCanAttackNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20051.SkillRange.SkillO_Min, Attack20051.SkillRange.SkillO_Max, Attack20051.SkillAngle.SkillO),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20051_Define.SkillType.SkillND1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillND1),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsCanAttackNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillND2),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Threat, 0),
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Alert, 0)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Threat.ThreatDistanceMin),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillH),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20051.SkillAngle.SkillH)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20051.SkillRange.SkillH),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillH, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillO),
									BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20051.SkillRange.SkillO_Min, Attack20051.SkillRange.SkillO_Max, Attack20051.SkillAngle.SkillO),
									BT.GetRandomNode:create(Attack20051.SkillProb.SkillO, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20051.SkillRange.DodgeAttack_Min, Attack20051.SkillRange.DodgeAttack_Max, Attack20051.SkillAngle.Dodge),
									BT.GetRandomNode:create(Attack20051.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge1:SetDodgeType(Dodge.DodgeType.Forward)
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillLLL),
										BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLLL, Attack20051.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillHPH),
										BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillHPH, Attack20051.SkillAngle.SkillHPH),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20051_Define.SkillType.SkillHPH, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20051_Define.SkillType.SkillLPLLL),
										BT.IsStartSkillingNode:create(self.instance, Attack20051.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20051.SkillRange.SkillLPLLL, Attack20051.SkillAngle.SkillLPLLL),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20051_Define.SkillType.SkillLPLLL, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId())
							})
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20051:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20051
