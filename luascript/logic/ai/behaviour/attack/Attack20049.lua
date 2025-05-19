-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20049.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20049 = class("Attack20049")
Attack20049.static.SkillCd = {
	{
		Hero20049_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20049_Define.SkillType.SkillHHH,
		1,
		true
	},
	{
		Hero20049_Define.SkillType.SkillLP,
		3,
		true
	},
	{
		Hero20049_Define.SkillType.SkillO,
		15,
		false
	},
	{
		Hero20049_Define.SkillType.SkillS,
		2.5,
		true
	},
	{
		Hero20049_Define.SkillType.SkillSP,
		8,
		true
	},
	{
		Hero20049_Define.SkillType.SkillDP,
		10,
		false
	}
}
Attack20049.static.SkillProb = {
	SkillSP = 0.35,
	SkillDP = 0.3,
	SkillO = 0.3
}
Attack20049.static.SkillRange = {
	SkillDP_Max = 12,
	SkillDP = 2,
	SkillDP_Min = 6,
	SkillHHH_Min = 4.5,
	SkillS_Max = 18,
	SkillHHH_Max = 6,
	SkillSP_Max = 18,
	SkillS_Min = 4,
	SkillLP = 4.5,
	SkillLLL_Min = 4.5,
	SkillLLL_Max = 6,
	SkillSP_Min = 4
}
Attack20049.static.SkillAngle = {
	SkillS = 30,
	SkillLP = 45,
	SkillSP = 30,
	SkillDP = 30,
	SkillHHH = 45,
	SkillLLL = 45
}
Attack20049.static.HoverTimeRatio = 2.5
Attack20049.static.SkillOHpRate = 0.5
Attack20049.static.SkillDPTime = 3

function Attack20049:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20049.HoverTimeRatio, 2, AnimalBase_Define.SpeedMode.Slow)
	self.skillCDList = Attack20049.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20049:create()
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
						Hero20049_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20049_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20049_Define.SkillType.SkillDP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20049_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20049_Define.SkillType.SkillHHH, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillHHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20049_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20049_Define.SkillType.SkillHHH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillHHH, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillLP, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillDP, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillSP, 1)
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
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillLLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillHHH, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillLP, 1),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20049_Define.SkillType.SkillDP, 3)
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
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20049_Define.SkillType.SkillDP, 0),
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
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Stay
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20049.SkillAngle.SkillDP),
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20049_Define.SkillType.SkillDP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20049.SkillRange.SkillDP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20049.SkillDPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
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
									BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20049.SkillRange.SkillDP_Min, Attack20049.SkillAngle.SkillDP),
									BT.GetRandomNode:create(Attack20049.SkillProb.SkillDP, self.instance:GetAnimalId()),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
									end),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20049_Define.SkillType.SkillDP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20049.SkillRange.SkillDP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20049.SkillDPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillO),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack20049.SkillOHpRate
									end),
									BT.GetRandomNode:create(Attack20049.SkillProb.SkillO, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillSP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20049.SkillRange.SkillSP_Min, Attack20049.SkillRange.SkillSP_Max, Attack20049.SkillAngle.SkillSP),
									BT.GetRandomNode:create(Attack20049.SkillProb.SkillSP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20049_Define.SkillType.SkillSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20049.SkillRange.SkillS_Min, Attack20049.SkillRange.SkillS_Max, Attack20049.SkillAngle.SkillS),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20049.SkillRange.SkillLP, Attack20049.SkillAngle.SkillLP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20049_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsVarietyNode:create(self.instance, 2),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Default
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20049.SkillAngle.SkillDP),
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20049_Define.SkillType.SkillDP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20049.SkillRange.SkillDP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20049.SkillDPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
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
									BT.IsSkillingByIdNode:create(self.instance, Hero20049_Define.SkillType.SkillLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20049_Define.SkillType.SkillHHH, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20049.SkillRange.SkillDP_Min, Attack20049.SkillRange.SkillDP_Max, Attack20049.SkillAngle.SkillDP),
									BT.GetRandomNode:create(Attack20049.SkillProb.SkillDP, self.instance:GetAnimalId()),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
									end),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20049_Define.SkillType.SkillDP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20049.SkillRange.SkillDP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20049.SkillDPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillO),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack20049.SkillOHpRate
									end),
									BT.GetRandomNode:create(Attack20049.SkillProb.SkillO, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillLLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20049.SkillRange.SkillLLL_Min, Attack20049.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillHHH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20049.SkillRange.SkillHHH_Min, Attack20049.SkillAngle.SkillHHH),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20049_Define.SkillType.SkillLP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20049.SkillRange.SkillLP, Attack20049.SkillAngle.SkillLP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20049_Define.SkillType.SkillLP, 1, false),
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

function Attack20049:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20049
