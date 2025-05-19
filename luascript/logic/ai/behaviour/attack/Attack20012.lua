-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20012.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20012 = class("Attack20012")
Attack20012.static.SkillProb = {
	SkillS = 0.4,
	SkillHHHHH = 0.4,
	SkillNH = 0.3,
	SkillSP = 0.35
}
Attack20012.static.SkillCd = {
	{
		Hero20012_Define.SkillType.SkillS,
		3,
		true
	},
	{
		Hero20012_Define.SkillType.SkillNH,
		3,
		true
	},
	{
		Hero20012_Define.SkillType.SkillHHHHH,
		12,
		false
	},
	{
		Hero20012_Define.SkillType.SkillSP,
		3,
		true
	}
}
Attack20012.static.SkillRange = {
	SkillL = 4.5,
	SkillNH_Max = 15,
	SkillSP_Max = 15,
	SkillS_Max = 7,
	SkillNL = 4.5,
	SkillHHHHH = 4.5,
	SkillS_Min = 4.5,
	SkillNH_Min = 5,
	SkillSP_Min = 4.5,
	SkillSP = 4.5
}
Attack20012.static.SkillAngle = {
	SkillL = 60,
	SkillS = 45,
	SkillNH = 30,
	SkillHHHHH = 55,
	SkillNL = 45,
	SkillSP = 45
}
Attack20012.static.HoverTimeRatio = 2
Attack20012.static.SkillSPTime = 2
Attack20012.static.SkillNHHeight = 4

function Attack20012:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20012.HoverTimeRatio, 2)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20012.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20012:create()
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
						Hero20012_Define.SkillType.SkillNH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20012_Define.SkillType.SkillSP,
						Hero20012_Define.SkillType.SkillSPC
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20012_Define.SkillType.SkillSP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 3),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20012_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20012_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20012_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20012_Define.SkillType.SkillHHHHH, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20012_Define.SkillType.SkillHHHHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20012_Define.SkillType.SkillHHHHH
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20012_Define.SkillType.SkillHHHHH, 5),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20012_Define.SkillType.SkillSP, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20012_Define.SkillType.SkillS, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
							}, self.instance:GetAnimalId(), {
								2,
								1
							})
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == true
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20012_Define.SkillType.SkillSP, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20012_Define.SkillType.SkillS, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20012_Define.SkillType.SkillHHHHH, 5)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20012_Define.SkillType.SkillNH, 0),
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
							BT.IsCanAttackNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20012.SkillAngle.SkillNH),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy),
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
									BT.IsStartSkillingNode:create(self.instance),
									BT.WaitNode:create(1),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20012_Define.SkillType.SkillSP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20012.SkillRange.SkillSP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20012.SkillSPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.StopMovementNode:create(self.instance)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20012_Define.SkillType.SkillHHHHH, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20012_Define.SkillType.SkillL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20012_Define.SkillType.SkillNH, 1),
							BT.IsHitBySkillNode:create(self.instance, Hero20012_Define.SkillType.SkillNH, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.RandomSequenceNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillHHHHH, Attack20012.SkillAngle.SkillHHHHH),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillL, Attack20012.SkillAngle.SkillL),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillNL, Attack20012.SkillAngle.SkillNL),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20012_Define.SkillType.SkillNL, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20012.SkillRange.SkillSP_Min, Attack20012.SkillRange.SkillSP_Max, Attack20012.SkillAngle.SkillSP),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
									end),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20012_Define.SkillType.SkillSP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20012.SkillRange.SkillSP) == true or self.instance:IsSkilling() == false or self.instance:IsFreeSkillEnable() == false or self.instance:IsDead() == true
									end, Attack20012.SkillSPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20012.SkillRange.SkillS_Min, Attack20012.SkillRange.SkillS_Max, Attack20012.SkillAngle.SkillS),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20012_Define.SkillType.SkillHHHHH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillHHHHH, Attack20012.SkillAngle.SkillHHHHH),
							BT.GetRandomNode:create(Attack20012.SkillProb.SkillHHHHH, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20012_Define.SkillType.SkillNH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinHeightNode:create(self.instance, Attack20012.SkillNHHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20012.SkillRange.SkillNH_Min, Attack20012.SkillRange.SkillNH_Max, Attack20012.SkillAngle.SkillNH),
							BT.GetRandomNode:create(Attack20012.SkillProb.SkillNH, self.instance:GetAnimalId()),
							BT.IsCanAttackNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20012_Define.SkillType.SkillSP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20012.SkillRange.SkillSP_Min, Attack20012.SkillRange.SkillSP_Max, Attack20012.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack20012.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20012_Define.SkillType.SkillSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20012.SkillRange.SkillSP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20012.SkillSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20012_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20012.SkillRange.SkillS_Min, Attack20012.SkillRange.SkillS_Max, Attack20012.SkillAngle.SkillS),
							BT.GetRandomNode:create(Attack20012.SkillProb.SkillS, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillL, Attack20012.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillNL, Attack20012.SkillAngle.SkillNL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsSkillCdNode:create(self.instance, Hero20012_Define.SkillType.SkillS),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20012.SkillRange.SkillS_Min, Attack20012.SkillAngle.SkillS),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
							})
						}, self.instance:GetAnimalId(), {
							2,
							1,
							1
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20012:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20012
