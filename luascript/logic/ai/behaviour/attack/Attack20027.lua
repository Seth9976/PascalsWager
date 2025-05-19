-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20027.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20027 = class("Attack20027")
Attack20027.static.SkillCd = {
	{
		Hero20027_Define.SkillType.SkillHP,
		4,
		true
	},
	{
		Hero20027_Define.SkillType.SkillLP,
		4,
		true
	},
	{
		Hero20027_Define.SkillType.SkillNLP,
		4,
		true
	},
	{
		Hero20027_Define.SkillType.SkillL,
		6,
		true
	},
	{
		Hero20027_Define.SkillType.SkillNL,
		6,
		true
	},
	{
		Hero20027_Define.SkillType.SkillNHP,
		7,
		true
	},
	{
		Hero20027_Define.SkillType.SkillS,
		8,
		true
	},
	{
		Hero20027_Define.SkillType.SkillSP,
		15,
		false
	},
	{
		Hero20027_Define.SkillType.SkillH,
		8,
		false
	},
	{
		Hero20027_Define.SkillType.SkillNSP,
		12,
		false
	},
	{
		Hero20027_Define.SkillType.SkillOP,
		13,
		true
	},
	{
		Hero20027_Define.SkillType.SkillNOP,
		14,
		true
	},
	{
		Hero20027_Define.SkillType.SkillO,
		12,
		true
	},
	{
		Hero20027_Define.SkillType.SkillNO,
		20,
		true
	}
}
Attack20027.static.SkillProb = {
	SkillNSP = 0.3,
	SkillH = 0.3,
	SkillNOP = 0.3,
	SkillO = 0.3,
	SkillNO = 0.3,
	SkillOP = 0.3,
	SkillSP = 0.3
}
Attack20027.static.SkillRange = {
	SkillNSP = 14,
	SkillNHP = 13,
	SkillL_Min = 10,
	SkillO_Max = 20,
	SkillO_Min = 10,
	SkillHP = 20,
	SkillNL_Min = 10,
	SkillSP = 20,
	SkillNLP_Max = 18,
	SkillLP_Min = 10,
	SkillS = 20,
	SkillNLP_Min = 10,
	SkillNL_Max = 20,
	SkillL_Max = 20,
	SkillLP_Max = 18
}
Attack20027.static.SkillAngle = {
	SkillNSP = 90,
	SkillNHP = 45,
	SkillS = 60,
	SkillL_1 = 60,
	SkillLP = 45,
	SkillHP = 75,
	SkillNL_2 = 30,
	SkillNL_1 = 60,
	SkillL_2 = 30,
	SkillNLP = 45,
	SkillSP = 60
}
Attack20027.static.SkillOPTime = 15

function Attack20027:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack20027.SkillCd
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.comboSkill = 0
	self.attackNode = self:create()
end

function Attack20027:create()
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
						Hero20027_Define.SkillType.SkillHP
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20027_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20027_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillNLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20027_Define.SkillType.SkillNLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillNHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20027_Define.SkillType.SkillNHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillSP
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20027_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillNSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20027_Define.SkillType.SkillNSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20027_Define.SkillType.SkillOP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 15),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillNOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20027_Define.SkillType.SkillNOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20027_Define.SkillType.SkillNO
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
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
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNSP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillNSP, Attack20027.SkillAngle.SkillNSP),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillNSP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20027_Define.SkillType.SkillNSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillSP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillSP, Attack20027.SkillAngle.SkillSP),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillSP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20027_Define.SkillType.SkillSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillH),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillH, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillS),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillS, Attack20027.SkillAngle.SkillS),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNHP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillNHP, Attack20027.SkillAngle.SkillNHP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20027_Define.SkillType.SkillNHP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillHP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillHP, Attack20027.SkillAngle.SkillHP),
										BT.SetSkillTargetNode:create(self.instance),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20027_Define.SkillType.SkillHP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillLP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillLP_Min, Attack20027.SkillRange.SkillLP_Max, Attack20027.SkillAngle.SkillLP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20027_Define.SkillType.SkillLP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNLP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillNLP_Min, Attack20027.SkillRange.SkillNLP_Max, Attack20027.SkillAngle.SkillNLP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20027_Define.SkillType.SkillNLP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.SelectorNode:create({
											BT.SequenceNode:create({
												BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillL_Min, Attack20027.SkillRange.SkillL_Max, Attack20027.SkillAngle.SkillL_1)
											}),
											BT.SequenceNode:create({
												BT.IsLeftNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillL_Min, Attack20027.SkillRange.SkillL_Max, Attack20027.SkillAngle.SkillL_2)
											})
										}),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.SelectorNode:create({
											BT.SequenceNode:create({
												BT.IsLeftNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillNL_Min, Attack20027.SkillRange.SkillNL_Max, Attack20027.SkillAngle.SkillNL_1)
											}),
											BT.SequenceNode:create({
												BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillNL_Min, Attack20027.SkillRange.SkillNL_Max, Attack20027.SkillAngle.SkillNL_2)
											})
										}),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20027_Define.SkillType.SkillLP, 1),
									BT.CommonNode:create(function()
										self.comboSkill = Hero20027_Define.SkillType.SkillNLP
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20027_Define.SkillType.SkillL, 1),
									BT.CommonNode:create(function()
										self.comboSkill = Hero20027_Define.SkillType.SkillNL
									end)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20027_Define.SkillType.SkillNLP
									end),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20027_Define.SkillType.SkillNLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20027_Define.SkillType.SkillNL
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNO),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillNSP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillOP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillOP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20027_Define.SkillType.SkillOP, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20027.SkillOPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillO),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillO_Min, Attack20027.SkillRange.SkillO_Max),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillO, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNOP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillNOP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20027_Define.SkillType.SkillNOP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNSP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillNSP, Attack20027.SkillAngle.SkillNSP),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillNSP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20027_Define.SkillType.SkillNSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillSP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillSP, Attack20027.SkillAngle.SkillSP),
									BT.GetRandomNode:create(Attack20027.SkillProb.SkillSP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20027_Define.SkillType.SkillSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillS),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillS, Attack20027.SkillAngle.SkillS),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillNHP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillNHP, Attack20027.SkillAngle.SkillNHP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20027_Define.SkillType.SkillNHP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillHP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20027.SkillRange.SkillHP, Attack20027.SkillAngle.SkillHP),
										BT.SetSkillTargetNode:create(self.instance),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20027_Define.SkillType.SkillHP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillLP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillLP_Min, Attack20027.SkillRange.SkillLP_Max, Attack20027.SkillAngle.SkillLP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20027_Define.SkillType.SkillLP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20027_Define.SkillType.SkillL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20027.SkillRange.SkillL_Min, Attack20027.SkillRange.SkillL_Max, Attack20027.SkillAngle.SkillL_1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
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

function Attack20027:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20027
