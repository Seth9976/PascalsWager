-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20001.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20001 = class("Attack20001")
Attack20001.static.SkillProb = {
	SkillDPHH = 0.35,
	SkillDefence = 0.25
}
Attack20001.static.SkillCd = {
	{
		Hero20001_Define.SkillType.SkillDPHH,
		2,
		true
	},
	{
		Hero20001_Define.SkillType.SkillDefence,
		4,
		true
	}
}
Attack20001.static.SkillRange = {
	SkillDefence_Min = 5,
	SkillDPHH_Max = 7,
	SkillL_Min = 3,
	SkillH_Max = 4,
	SkillH_Min = 3,
	SkillDPHH = 3,
	SkillDefence_Max = 8,
	SkillDPHH_Min = 4.5,
	SkillL_Max = 4
}
Attack20001.static.SkillAngle = {
	SkillL = 45,
	SkillH = 55,
	SkillDefence = 30,
	SkillDPHH = 45
}
Attack20001.static.SkillDefenceTime = 3.5
Attack20001.static.SprintTime = 1.5
Attack20001.static.HoverTimeRatio = 3.5

function Attack20001:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20001.HoverTimeRatio, 2)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.skillTime = 0
	self.skillCDList = Attack20001.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20001:create()
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
						Hero20001_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20001_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20001_Define.SkillType.SkillDPHH
					}),
					BT.WaitNode:create(1),
					BT.ConditionWaitNode:create(function()
						local param = Mathf.Clamp(self.skillTime * 2.5, 0, 1)

						self.instance:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, param, 0, 0)

						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
						end

						self.skillTime = self.skillTime + Time.deltaTime

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
					BT.CommonNode:create(function()
						self.skillTime = 0

						self.instance:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
					end)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillDPHH, 2),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillDPHH
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 1),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillLHL
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLHL, 2),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillLHL
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 1),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillLLH
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 2),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillLLH
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillLLL
							}),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillHH, 1),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero20001_Define.SkillType.SkillHH
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20001_Define.SkillType.SkillLLL,
						Hero20001_Define.SkillType.SkillLHL,
						Hero20001_Define.SkillType.SkillLLH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20001_Define.SkillType.SkillHH
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
							BT.ConditionNode:create(function()
								return self.instance:GetMonsterAILevel() == GameAI.AILevel.Normal
							end),
							BT.SequenceNode:create({
								BT.SelectorNode:create({
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 3),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLHL, 3),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLH, 3),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillHH, 2)
								}),
								BT.RandomNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetMonsterAILevel() == GameAI.AILevel.Easy
							end),
							BT.SequenceNode:create({
								BT.SelectorNode:create({
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 2),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 3),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLHL, 2),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLHL, 3),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLH, 2),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLH, 3),
									BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillHH, 2)
								}),
								BT.RandomNode:create({
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
								}, self.instance:GetAnimalId(), {
									1,
									2
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillDPHH, 2),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLHL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillLLH, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillHH, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20001_Define.SkillType.SkillDPHH, 1)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillDPHH, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
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
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20001.SkillAngle.SkillDPHH),
									BT.ConditionWaitNode:create(function()
										self.instance:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.skillTime * 2.5, 0, 0)

										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
											self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
										end

										self.skillTime = self.skillTime + Time.deltaTime

										return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20001.SkillRange.SkillDPHH) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20001.SprintTime),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
									BT.CommonNode:create(function()
										self.skillTime = 0

										self.instance:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
									end),
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
							BT.IsSkillCdNode:create(self.instance, Hero20001_Define.SkillType.SkillDefence),
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.IsTargetAttackingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20001.SkillRange.SkillDefence_Min, Attack20001.SkillAngle.SkillDefence)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20001.SkillRange.SkillDefence_Max, Attack20001.SkillAngle.SkillDefence)
								})
							}),
							BT.GetRandomNode:create(Attack20001.SkillProb.SkillDefence, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20001_Define.SkillType.SkillDefence, 1, false),
							BT.ConditionWaitNode:create(function()
								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end, Attack20001.SkillDefenceTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20001_Define.SkillType.SkillDPHH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20001.SkillRange.SkillDPHH_Min, Attack20001.SkillRange.SkillDPHH_Max, Attack20001.SkillAngle.SkillDPHH),
							BT.GetRandomNode:create(Attack20001.SkillProb.SkillDPHH, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.ConditionWaitNode:create(function()
								self.instance:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.skillTime * 2.5, 0, 0)

								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
									self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
								end

								self.skillTime = self.skillTime + Time.deltaTime

								return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20001.SkillRange.SkillDPHH) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20001.SprintTime),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
							BT.CommonNode:create(function()
								self.skillTime = 0

								self.instance:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
							end)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLHL, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillHH, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLH, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20001_Define.SkillType.SkillLLL, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20001.SkillRange.SkillL_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								})
							})
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20001.SkillRange.SkillL_Min, Attack20001.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20001.SkillRange.SkillH_Min, Attack20001.SkillAngle.SkillH),
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

function Attack20001:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20001
