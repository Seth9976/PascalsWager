-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20034.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20034 = class("Attack20034")
Attack20034.static.SkillCd = {
	{
		Hero20034_Define.SkillType.SkillLL1,
		2,
		true
	},
	{
		Hero20034_Define.SkillType.SkillLL2,
		2,
		true
	},
	{
		Hero20034_Define.SkillType.SkillHH1,
		2,
		true
	},
	{
		Hero20034_Define.SkillType.SkillHH2,
		2,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNLL1,
		2,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNLL2,
		2,
		true
	},
	{
		Hero20034_Define.SkillType.SkillHP1,
		5,
		true
	},
	{
		Hero20034_Define.SkillType.SkillHP2,
		8,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNLP,
		5,
		true
	},
	{
		Hero20034_Define.SkillType.SkillDP,
		8,
		false
	},
	{
		Hero20034_Define.SkillType.SkillNH1,
		4,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNHHH2,
		4,
		true
	},
	{
		Hero20034_Define.SkillType.SkillSP2,
		10,
		true
	},
	{
		Hero20034_Define.SkillType.SkillS2,
		8,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNS2,
		6,
		true
	},
	{
		Hero20034_Define.SkillType.SkillO2,
		18,
		false
	},
	{
		Hero20034_Define.SkillType.SkillNSP2,
		20,
		false
	},
	{
		Hero20034_Define.SkillType.SkillD,
		5,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNO1,
		3,
		true
	},
	{
		Hero20034_Define.SkillType.SkillNO2,
		3,
		true
	}
}
Attack20034.static.SkillProb = {
	SkillNH1 = 0.35,
	SkillS2 = 0.3,
	SkillHP1 = 0.35,
	SkillSP2 = 0.35,
	SkillNLP = 0.4,
	SkillD = 0.35,
	SkillO2 = 0.45,
	SkillDP_1 = 0.3,
	SkillHP2 = 0.3,
	SkillNO1 = 0.65,
	SkillNS2 = 0.35,
	SkillNO2 = 0.65,
	SkillNHHH2 = 0.35,
	SkillDP_2 = 0.65
}
Attack20034.static.SkillRange = {
	SkillNLP = 3.5,
	SkillHH1 = 6,
	SkillNS2_Min = 2,
	SkillHH2 = 6.5,
	SkillO2 = 9,
	SkillDP = 20,
	SkillD_Max = 10,
	SkillNO1 = 6,
	SkillNS2_Max = 20,
	SkillSP2_Max = 20,
	SkillNSP2 = 10,
	SkillNO2 = 6.5,
	SkillNHHH2 = 5,
	SkillLL1 = 6,
	SkillNLL2 = 7.5,
	SkillHP1 = 7.5,
	SkillNLL1 = 7,
	SkillLL2 = 6.5,
	SkillHP2 = 15,
	SkillD_Min = 5,
	SkillS2_Max = 20,
	SkillNH1 = 4.5,
	SkillS2_Min = 5,
	SkillSP2_Min = 2
}
Attack20034.static.SkillAngle = {
	SkillS2 = 45,
	SkillD = 30,
	SkillNLP_2 = 110,
	SkillSP2 = 60,
	SkillHH2 = 45,
	SkillNLL2 = 45,
	SkillHH1 = 45,
	SkillNLP_1 = 60,
	SkillNO1 = 120,
	SkillNO2 = 120,
	SkillNHHH2 = 30,
	SkillLL1 = 45,
	SkillDP = 120,
	SkillHP1 = 30,
	SkillNLL1 = 45,
	SkillLL2 = 45,
	SkillHP2 = 30,
	SkillNH1 = 30
}
Attack20034.static.SkillSP2Time = 7
Attack20034.static.SkillO2HpRate = 0.3

function Attack20034:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack20034.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20034:create()
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
						Hero20034_Define.SkillType.SkillHP1,
						Hero20034_Define.SkillType.SkillHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillSP2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20034_Define.SkillType.SkillSP2, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNSP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20034_Define.SkillType.SkillNSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillS2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNS2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNH1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20034_Define.SkillType.SkillNLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNO1,
						Hero20034_Define.SkillType.SkillNO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20034_Define.SkillType.SkillDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL2, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNLL1,
						Hero20034_Define.SkillType.SkillNLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNLL1,
						Hero20034_Define.SkillType.SkillNLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH2, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillHH1,
						Hero20034_Define.SkillType.SkillHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillHH1,
						Hero20034_Define.SkillType.SkillHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL2, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillLL1,
						Hero20034_Define.SkillType.SkillLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillLL1,
						Hero20034_Define.SkillType.SkillLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNHHH2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20034_Define.SkillType.SkillNHHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillDP, 2),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							local pos = Vector3.zero

							pos:SetVector3(target:GetPosByWorldPos())
							pos:Add(target:GetBack():SetNormalize():Mul(1.5))

							pos.y = target:GetGroundY()

							self.instance:SetSkillTargetPos(pos)
						end
					end)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL1, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillHH1, Attack20034.SkillAngle.SkillHH1),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillAngle.SkillHP1),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH1, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillAngle.SkillHP1),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL1, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillNH1, Attack20034.SkillAngle.SkillNH1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNO1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillHP1),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillNLL1),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillDP, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillHP1),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillD_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillD),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20034.SkillRange.SkillD_Min, Attack20034.SkillRange.SkillD_Max, Attack20034.SkillAngle.SkillD),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillD, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNH1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillNH1, Attack20034.SkillAngle.SkillNH1),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillNH1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillHP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillHP1, Attack20034.SkillAngle.SkillHP1),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillHP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLP),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20034.SkillAngle.SkillNLP_1)),
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20034.SkillAngle.SkillNLP_2),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillNLP),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillNLP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20034_Define.SkillType.SkillNLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNO1),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20034.SkillAngle.SkillNO1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillNO1),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillNO1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										return self.instance:GetWeakEnable() == true
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsBehindNode:create(self.instance),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20034.SkillAngle.SkillDP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillDP),
											BT.GetRandomNode:create(Attack20034.SkillProb.SkillDP_2, self.instance:GetAnimalId())
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillDP),
											BT.GetRandomNode:create(Attack20034.SkillProb.SkillDP_1, self.instance:GetAnimalId())
										})
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20034_Define.SkillType.SkillDP, 1, false),
									BT.SetSkillTargetNode:create(self.instance),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillLL1, Attack20034.SkillAngle.SkillLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillHH1, Attack20034.SkillAngle.SkillHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillNLL1, Attack20034.SkillAngle.SkillNLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and (target:IsHitByType(AnimalBase_Define.HitType.Freeze) or target:IsHitBySkill(self.instance, Hero20034_Define.SkillType.SkillO2, 1)) then
											return true
										end

										return false
									end),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillNSP2),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20034_Define.SkillType.SkillNSP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillHH2, Attack20034.SkillAngle.SkillHH2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillHP2),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillHP2),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillNHHH2, Attack20034.SkillAngle.SkillNHHH2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillDP, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local trick = self.instance.scene:GetTrick(Hero20034_Define.TrickIdSkillNSP2)

												return trick == nil or trick:IsOpening() == false
											end),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillO2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillHP2),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillD_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										})
									}, self.instance:GetAnimalId())
								}, {
									2,
									1,
									1
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20034_Define.SkillType.SkillNO2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillHP2),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillNLL2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNHHH2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillNHHH2, Attack20034.SkillAngle.SkillNHHH2),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillNH1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillHP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillHP2, Attack20034.SkillAngle.SkillHP2),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillHP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20034_Define.SkillType.SkillHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillO2),
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNSP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack20034.SkillO2HpRate
									end),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero20034_Define.TrickIdSkillNSP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillO2),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillO2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20034.SkillRange.SkillNS2_Min, Attack20034.SkillRange.SkillNS2_Max),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillNS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillSP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20034.SkillRange.SkillSP2_Min, Attack20034.SkillRange.SkillSP2_Max, Attack20034.SkillAngle.SkillSP2),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillSP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20034_Define.SkillType.SkillSP2, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20034.SkillSP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20034.SkillRange.SkillS2_Min, Attack20034.SkillRange.SkillS2_Max, Attack20034.SkillAngle.SkillS2),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNO2),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20034.SkillAngle.SkillNO2)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20034.SkillRange.SkillNO2),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillNO2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										return self.instance:GetWeakEnable() == true
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsBehindNode:create(self.instance),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20034.SkillAngle.SkillDP)),
											BT.GetRandomNode:create(Attack20034.SkillProb.SkillDP_2, self.instance:GetAnimalId())
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillDP),
											BT.GetRandomNode:create(Attack20034.SkillProb.SkillDP_1, self.instance:GetAnimalId())
										})
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20034_Define.SkillType.SkillDP, 1, false),
									BT.SetSkillTargetNode:create(self.instance),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillD),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20034.SkillRange.SkillD_Min, Attack20034.SkillRange.SkillD_Max, Attack20034.SkillAngle.SkillD),
									BT.GetRandomNode:create(Attack20034.SkillProb.SkillD, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillLL2, Attack20034.SkillAngle.SkillLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillHH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillHH2, Attack20034.SkillAngle.SkillHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20034_Define.SkillType.SkillNLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20034.SkillRange.SkillNLL2, Attack20034.SkillAngle.SkillNLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
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

function Attack20034:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20034
