-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20024.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20024 = class("Attack20024")
Attack20024.static.SkillCd = {
	{
		Hero20024_Define.SkillType.SkillO2,
		5,
		true
	},
	{
		Hero20024_Define.SkillType.SkillLP1,
		2,
		true
	},
	{
		Hero20024_Define.SkillType.SkillLP2,
		4,
		true
	},
	{
		Hero20024_Define.SkillType.SkillHP1,
		4,
		false
	},
	{
		Hero20024_Define.SkillType.SkillHP2,
		4,
		false
	},
	{
		Hero20024_Define.SkillType.SkillH1,
		1,
		true
	},
	{
		Hero20024_Define.SkillType.SkillH2,
		1,
		true
	},
	{
		Hero20024_Define.SkillType.SkillD1,
		4,
		true
	},
	{
		Hero20024_Define.SkillType.SkillD2,
		4,
		true
	},
	{
		Hero20024_Define.SkillType.SkillO1,
		5,
		true
	}
}
Attack20024.static.SkillProb = {
	SkillHP2 = 0.35,
	SkillHP1 = 0.35,
	SkillO2 = 0.3,
	SkillD2 = 0.5,
	SkillLP2 = 0.4,
	SkillD1 = 0.5,
	SkillLP1 = 0.4
}
Attack20024.static.SkillRange = {
	SkillLL1_Max = 6,
	SkillHP2_Max = 10,
	SkillH2 = 4.5,
	SkillLL1_Min = 5,
	SkillHP2_Min = 4.5,
	SkillHP1_Min = 4.5,
	SkillD1_Min = 5,
	SkillHP1_Max = 10,
	SkillD1_Max = 7,
	SkillO2 = 6,
	SkillLP1 = 4,
	SkillD2_Max = 7,
	SkillH1 = 4.5,
	SkillD2_Min = 5,
	SkillLP2 = 6,
	SkillLM2_Max = 8,
	SkillLM2_Min = 6
}
Attack20024.static.SkillAngle = {
	SkillH2 = 45,
	SkillH1 = 45,
	SkillHP1 = 45,
	SkillD2 = 55,
	SkillS2 = 15,
	SkillLP2 = 120,
	SkillLM2 = 45,
	SkillHP2 = 45,
	SkillO2 = 60,
	SkillS1 = 15,
	SkillD1 = 55,
	SkillLL1 = 45,
	SkillLP1 = 120
}
Attack20024.static.WaitShapeshiftTime = 25
Attack20024.static.ShapeshiftHpRate = 0.6
Attack20024.static.TurnAroundTime = 1.5

function Attack20024:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.dodge1 = Dodge:new(instance, Attack20024.SkillRange.SkillD1_Min, Attack20024.SkillRange.SkillD1_Max, Attack20024.SkillAngle.SkillD1, Attack20024.SkillProb.SkillD1, Hero20024_Define.SkillType.SkillD1)
	self.dodge2 = Dodge:new(instance, Attack20024.SkillRange.SkillD2_Min, Attack20024.SkillRange.SkillD2_Max, Attack20024.SkillAngle.SkillD2, Attack20024.SkillProb.SkillD2, Hero20024_Define.SkillType.SkillD2)
	self.dropAttack = DropAttack:new(instance)
	self.skillCDList = Attack20024.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.comboSkill = 0
	self.attackNode = self:create()
end

function Attack20024:create()
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
						Hero20024_Define.SkillType.SkillLP1,
						Hero20024_Define.SkillType.SkillLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20024_Define.SkillType.SkillLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillHP1,
						Hero20024_Define.SkillType.SkillHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20024_Define.SkillType.SkillHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillS1,
						Hero20024_Define.SkillType.SkillS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillD1,
						Hero20024_Define.SkillType.SkillD2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillO1,
						Hero20024_Define.SkillType.SkillO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillH1,
						Hero20024_Define.SkillType.SkillH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLL1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillLL1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLM2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillLM2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLM2C, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillLM2C
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20024_Define.SkillType.SkillLL1,
						Hero20024_Define.SkillType.SkillLM2,
						Hero20024_Define.SkillType.SkillLM2C
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
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillO1),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return self.instance:GetBrain().findTargetTime ~= nil and self.instance:GetBrain().findTargetTime > Attack20024.WaitShapeshiftTime or rate <= Attack20024.ShapeshiftHpRate
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.dropAttack.dropAttackNode,
				self.alert.alertNode,
				self.threat.threatNode,
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					self.dodge1.dodgeNode
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					self.dodge2.dodgeNode
				}),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillHP1, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillHP2, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
						}, self.instance:GetAnimalId(), {
							2,
							1
						})
					}),
					BT.SequenceNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillO2, 2),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
					}),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillLL1, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillLM2, 5),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillH1, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20024_Define.SkillType.SkillH2, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
						}, self.instance:GetAnimalId(), {
							2,
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLM2, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.comboSkill > 0
							end),
							BT.SelectorNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsSkillingById(self.comboSkill, 0) == true
								end),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.comboSkill = 0
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLL1, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20024.SkillRange.SkillLL1_Max),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20024_Define.SkillType.SkillS1
									end),
									BT.SelectorNode:create({
										BT.IsSkillingNode:create(self.instance),
										BT.SequenceNode:create({
											BT.StopMovementNode:create(self.instance),
											BT.ConditionWaitNode:create(function()
												if self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false then
													self.comboSkill = 0

													return true
												end

												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetOrientation(target:GetPosByWorldPos())
												end

												return GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20024.SkillAngle.SkillS1) == true
											end, Attack20024.TurnAroundTime),
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												return GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20024.SkillAngle.SkillS1) == true and self.instance:IsDead() == false or self.instance:IsFreeSkillEnable() == true
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP1),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLL1, 2),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20024.SkillRange.SkillLP1),
									BT.GetRandomNode:create(Attack20024.SkillProb.SkillLP1, self.instance:GetAnimalId()),
									BT.IsSkillComboNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20024_Define.SkillType.SkillLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP1),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillH1, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20024.SkillRange.SkillLP1),
									BT.GetRandomNode:create(Attack20024.SkillProb.SkillLP1, self.instance:GetAnimalId()),
									BT.IsSkillComboNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20024_Define.SkillType.SkillLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP1, 1),
									BT.IsHitBySkillNode:create(self.instance, Hero20024_Define.SkillType.SkillLP1, 1),
									BT.CommonNode:create(function()
										self.comboSkill = Hero20024_Define.SkillType.SkillS1
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillD1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.comboSkill = Hero20024_Define.SkillType.SkillS1
										end),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20024.SkillRange.SkillHP1_Max),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20024_Define.SkillType.SkillHP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillHP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20024.SkillRange.SkillHP1_Min, Attack20024.SkillRange.SkillHP1_Max, Attack20024.SkillAngle.SkillHP1),
									BT.GetRandomNode:create(Attack20024.SkillProb.SkillHP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20024_Define.SkillType.SkillHP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillLP1, Attack20024.SkillAngle.SkillLP1),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20024_Define.SkillType.SkillLP1, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillLL1_Min, Attack20024.SkillAngle.SkillLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillH1, Attack20024.SkillAngle.SkillH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20024.SkillAngle.SkillLM2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
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
										return self.instance:GetBrain().alertType == Alert.Type.Call
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingSkillNode:create(self.instance),
											BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLM2C, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsStartSkillingNode:create(self.instance),
											BT.WaitNode:create(2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.StopMovementNode:create(self.instance)
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLM2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20024_Define.SkillType.SkillS2
									end),
									BT.SelectorNode:create({
										BT.IsSkillingNode:create(self.instance),
										BT.SequenceNode:create({
											BT.StopMovementNode:create(self.instance),
											BT.ConditionWaitNode:create(function()
												if self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false then
													self.comboSkill = 0

													return true
												end

												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetOrientation(target:GetPosByWorldPos())
												end

												return GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20024.SkillAngle.SkillS2) == true
											end, Attack20024.TurnAroundTime),
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												return GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20024.SkillAngle.SkillS2) == true and self.instance:IsDead() == false or self.instance:IsFreeSkillEnable() == true
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP2),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillH2, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20024.SkillRange.SkillLP2),
									BT.GetRandomNode:create(Attack20024.SkillProb.SkillLP1, self.instance:GetAnimalId()),
									BT.IsSkillComboNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20024_Define.SkillType.SkillLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP2, 1),
									BT.IsHitBySkillNode:create(self.instance, Hero20024_Define.SkillType.SkillLP2, 1),
									BT.CommonNode:create(function()
										self.comboSkill = Hero20024_Define.SkillType.SkillS2
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20024_Define.SkillType.SkillD2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.comboSkill = Hero20024_Define.SkillType.SkillS2
										end),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20024.SkillRange.SkillHP2_Max),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20024_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillO2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillO2, Attack20024.SkillAngle.SkillO2),
									BT.GetRandomNode:create(Attack20024.SkillProb.SkillO2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillHP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20024.SkillRange.SkillHP2_Min, Attack20024.SkillRange.SkillHP2_Max, Attack20024.SkillAngle.SkillHP2),
									BT.GetRandomNode:create(Attack20024.SkillProb.SkillHP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20024_Define.SkillType.SkillHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillLP2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillLP2, Attack20024.SkillAngle.SkillLP2),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20024_Define.SkillType.SkillLP2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillLM2_Min, Attack20024.SkillAngle.SkillLM2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20024_Define.SkillType.SkillH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20024.SkillRange.SkillH2, Attack20024.SkillAngle.SkillH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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

function Attack20024:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20024
