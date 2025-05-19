-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20013.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20013 = class("Attack20013")
Attack20013.static.SkillProb = {
	SkillSP2 = 0.3
}
Attack20013.static.SkillCd = {
	{
		Hero20013_Define.SkillType.SkillSP2,
		3,
		true
	}
}
Attack20013.static.SkillRange = {
	SkillH2 = 4.5,
	SkillL1_Min = 4,
	SkillSP2_Max = 8,
	SkillSP2 = 2,
	SkillLL2 = 4.5,
	SkillSP2_Min = 4.5,
	SkillL1_Max = 20
}
Attack20013.static.SkillAngle = {
	SkillLL2 = 60,
	SkillL1 = 10,
	SkillSP2 = 45,
	SkillH2 = 45
}
Attack20013.static.HoverTimeRatio = 2.5
Attack20013.static.SkillSP2Time = 2.5
Attack20013.static.SkillO1Range = 8
Attack20013.static.SkillO1Height = 2

function Attack20013:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20013.HoverTimeRatio, 2)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.skillCDList = Attack20013.SkillCd
	self.attackNode = self:create()
end

function Attack20013:create()
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
					BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20013_Define.SkillType.SkillSP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20013_Define.SkillType.SkillSP2, 1, false),
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
						Hero20013_Define.SkillType.SkillO1,
						Hero20013_Define.SkillType.SkillO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20013_Define.SkillType.SkillLL2, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20013_Define.SkillType.SkillLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20013_Define.SkillType.SkillLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20013_Define.SkillType.SkillH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponBomb),
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20013_Define.SkillType.SkillL1
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
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20013_Define.SkillType.SkillLL2, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20013_Define.SkillType.SkillH2, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20013_Define.SkillType.SkillSP2, 3),
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
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20013_Define.SkillType.SkillLL2, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20013_Define.SkillType.SkillH2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20013_Define.SkillType.SkillSP2, 3)
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
								BT.IsSkillingByIdNode:create(self.instance, Hero20013_Define.SkillType.SkillSP2, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponBomb),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Stay
							end)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Default
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
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponBomb),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20013.SkillAngle.SkillSP2),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20013_Define.SkillType.SkillSP2, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20013.SkillRange.SkillSP2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20013.SkillSP2Time),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									}),
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
							BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponBomb),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20013.SkillO1Range),
							BT.ConditionNode:create(function()
								if self.instance:GetBrain().alertType == Alert.Type.Special then
									local target = self.instance:GetBrain():GetAnimalTarget()

									if GameAI.IsAnimalWithinHeight(self.instance, target:GetPosByWorldPos(), Attack20013.SkillO1Height) == true then
										return true
									end
								else
									return true
								end

								return false
							end),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20013_Define.SkillType.SkillLL2, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
							BT.IsSkillCdNode:create(self.instance, Hero20013_Define.SkillType.SkillSP2),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20013.SkillRange.SkillSP2_Min, Attack20013.SkillRange.SkillSP2_Max, Attack20013.SkillAngle.SkillSP2),
							BT.GetRandomNode:create(Attack20013.SkillProb.SkillSP2, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20013_Define.SkillType.SkillSP2, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20013.SkillRange.SkillSP2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20013.SkillSP2Time),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20013.SkillRange.SkillLL2, Attack20013.SkillAngle.SkillLL2),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponScissors),
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20013.SkillRange.SkillH2, Attack20013.SkillAngle.SkillH2),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							})
						}, self.instance:GetAnimalId(), {
							2,
							1
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, Hero20013_Define.WeaponBomb),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20013.SkillRange.SkillL1_Min, Attack20013.SkillRange.SkillL1_Max, Attack20013.SkillAngle.SkillL1),
							BT.IsCanAttackNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20013:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20013
