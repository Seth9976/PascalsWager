-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20007.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20007 = class("Attack20007")
Attack20007.static.SkillProb = {
	SkillS_1 = 0.65,
	SkillD = 0.5,
	SkillS_2 = 0.25,
	SkillLS = 0.3,
	SkillSPP = 0.35,
	SkillLPH = 0.4,
	SkillOP = 0.35
}
Attack20007.static.SkillCd = {
	{
		Hero20007_Define.SkillType.SkillS,
		4,
		true
	},
	{
		Hero20007_Define.SkillType.SkillLPH,
		5,
		true
	},
	{
		Hero20007_Define.SkillType.SkillLS,
		6,
		true
	},
	{
		Hero20007_Define.SkillType.SkillD,
		4,
		true
	},
	{
		Hero20007_Define.SkillType.SkillSPP,
		3,
		true
	},
	{
		Hero20007_Define.SkillType.SkillSP,
		3,
		true
	},
	{
		Hero20007_Define.SkillType.SkillOP,
		15,
		true
	}
}
Attack20007.static.SkillRange = {
	SkillH_Max = 6.5,
	SkillLPH_Min = 5,
	SkillSPP_Max = 12,
	SkillLS_Max = 12,
	SkillH_Min = 5.5,
	SkillLPH_Max = 12,
	SkillD_Max = 10,
	SkillL_Min = 5,
	SkillS = 5.5,
	SkillOP = 6.5,
	SkillD_Min = 5,
	SkillLS_Min = 5,
	SkillL_Max = 6.5,
	SkillSPP_Min = 5
}
Attack20007.static.SkillAngle = {
	SkillL = 65,
	SkillD = 55,
	SkillSPP = 30,
	SkillS_1 = 120,
	SkillOP = 180,
	SkillH = 65,
	SkillS_2 = 60,
	SkillLS = 65,
	SkillLPH = 65
}
Attack20007.static.SkillSPPTime = 2
Attack20007.static.HoverTimeRatio = 2.5

function Attack20007:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20007.HoverTimeRatio, 2)
	self.skillCDList = Attack20007.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.isComboSkillD = false
	self.attackNode = self:create()
end

function Attack20007:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLPH, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLHH, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLHH, 2)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillLPH,
						Hero20007_Define.SkillType.SkillLHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillHPL, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillHLL, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillHLL, 2)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillHPL,
						Hero20007_Define.SkillType.SkillHLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLHH, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillLS
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20007_Define.SkillType.SkillOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillSP,
						Hero20007_Define.SkillType.SkillSPP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20007_Define.SkillType.SkillSP, 1, false),
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
						Hero20007_Define.SkillType.SkillLHH,
						Hero20007_Define.SkillType.SkillLS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillLPH
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20007_Define.SkillType.SkillLPH, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillHLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20007_Define.SkillType.SkillHPL
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20007_Define.SkillType.SkillHPL, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20007_Define.SkillType.SkillHLL, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20007_Define.SkillType.SkillLHH, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20007_Define.SkillType.SkillHPL, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20007_Define.SkillType.SkillSPP, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20007_Define.SkillType.SkillS, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLPH, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsGradeNode:create(self.instance, 2),
									BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillSPP, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillD_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
									BT.CommonNode:create(function()
										self.isComboSkillD = false
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillSP, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillSP, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillHPL, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillHLL, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillHLL, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLHH, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillLHH, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsGradeNode:create(self.instance, 1),
											BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillLS),
											BT.IsCanAttackNode:create(self.instance),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillLS_Max),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillH_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									})
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20007_Define.SkillType.SkillD, 1),
							BT.ConditionNode:create(function()
								return self.isComboSkillD == true
							end),
							BT.NotDecorator:create(BT.IsTargetHitNode:create(self.instance)),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillD_Max),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillD, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
							BT.CommonNode:create(function()
								self.isComboSkillD = false
							end)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillOP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20007.SkillRange.SkillOP),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillOP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20007_Define.SkillType.SkillOP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillSP),
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillSPP),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20007.SkillRange.SkillSPP_Min, Attack20007.SkillRange.SkillSPP_Max, Attack20007.SkillAngle.SkillSPP),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillSPP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20007_Define.SkillType.SkillSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return GameAI.IsAnimalWithinSkillRange(self.instance, target, 0, Attack20007.SkillRange.SkillSPP_Min, Attack20007.SkillAngle.SkillSPP) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20007.SkillSPPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillD),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20007.SkillRange.SkillD_Min, Attack20007.SkillRange.SkillD_Max, Attack20007.SkillAngle.SkillD),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillD, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
							BT.CommonNode:create(function()
								self.isComboSkillD = true
							end)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillLPH),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsCanAttackNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20007.SkillRange.SkillLPH_Min, Attack20007.SkillRange.SkillLPH_Max, Attack20007.SkillAngle.SkillLPH),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillLPH, self.instance:GetAnimalId()),
							BT.SetSkillTargetNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20007_Define.SkillType.SkillLPH, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillLS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsCanAttackNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20007.SkillRange.SkillLS_Min, Attack20007.SkillRange.SkillLS_Max, Attack20007.SkillAngle.SkillLS),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillLS, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillD),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20007.SkillRange.SkillD_Min, Attack20007.SkillAngle.SkillD),
							BT.GetRandomNode:create(Attack20007.SkillProb.SkillD, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
							BT.CommonNode:create(function()
								self.isComboSkillD = true
							end)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20007_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20007.SkillAngle.SkillS_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20007.SkillRange.SkillS),
									BT.GetRandomNode:create(Attack20007.SkillProb.SkillS_1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20007.SkillRange.SkillS, Attack20007.SkillAngle.SkillS_2),
									BT.GetRandomNode:create(Attack20007.SkillProb.SkillS_2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							})
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20007.SkillRange.SkillL_Min, Attack20007.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20007.SkillRange.SkillH_Min, Attack20007.SkillAngle.SkillH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20007.SkillRange.SkillH_Min, Attack20007.SkillAngle.SkillH),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20007_Define.SkillType.SkillHPL, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20007:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20007
