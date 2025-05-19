-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20045.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20045 = class("Attack20045")
Attack20045.static.SkillCd = {
	{
		Hero20045_Define.SkillType.SkillLLLL,
		2,
		true
	},
	{
		Hero20045_Define.SkillType.SkillLP,
		2,
		true
	},
	{
		Hero20045_Define.SkillType.SkillHHH1,
		2,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNHNH,
		2,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNHP,
		5,
		true
	},
	{
		Hero20045_Define.SkillType.SkillSP,
		7,
		true
	},
	{
		Hero20045_Define.SkillType.SkillND,
		6,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNDP,
		5,
		true
	},
	{
		Hero20045_Define.SkillType.SkillDP,
		7,
		true
	},
	{
		Hero20045_Define.SkillType.SkillS,
		7,
		true
	},
	{
		Hero20045_Define.SkillType.SkillOP1,
		15,
		false
	},
	{
		Hero20045_Define.SkillType.SkillOP2,
		25,
		false
	},
	{
		Hero20045_Define.SkillType.SkillNLLL2,
		2,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNLP2,
		6,
		true
	},
	{
		Hero20045_Define.SkillType.SkillHPH2,
		2,
		true
	},
	{
		Hero20045_Define.SkillType.SkillHHH2,
		9,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNS2,
		8,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNSP2,
		14,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNOP2,
		14,
		true
	},
	{
		Hero20045_Define.SkillType.SkillNO2,
		8,
		true
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		6,
		true
	}
}
Attack20045.static.SkillProb = {
	SkillOP1_1 = 0.4,
	SkillDP = 0.4,
	SkillHHH2 = 0.3,
	SkillNLP2 = 0.35,
	SkillNDP = 0.4,
	SkillOP1_2 = 0.6,
	SkillOP2 = 0.4,
	SkillNHNH = 0.15,
	SkillNSP2 = 0.6,
	SkillNO2 = 0.5,
	SkillSP = 0.65,
	SkillNHP = 0.65,
	SkillND = 0.3,
	SkillNOP2 = 0.6,
	SkillS = 0.45,
	SkillNS2 = 0.35,
	Dodge = 0.5
}
Attack20045.static.SkillRange = {
	SkillNHNH = 4.5,
	SkillNS2_Min = 6,
	SkillHHH1_Max = 8,
	SkillNLLL2_Min = 5,
	SkillS_Max = 7,
	SkillNDP = 4,
	SkillOP1 = 6.5,
	SkillNDP_Min = 4,
	SkillNS2_Max = 18,
	SkillS_Min = 3,
	SkillNLLL2_Max = 6,
	SkillHHH2_Min = 5,
	SkillNO2 = 6,
	SkillDP_Min = 5.5,
	SkillND_Min = 8,
	SkillSP = 5.5,
	SkillDP_Max = 10,
	SkillNHP = 4,
	SkillNLP2_Max = 14,
	SkillND_Max = 20,
	SkillHPH2 = 4.5,
	Dodge_Min = 5,
	Dodge_Max = 10,
	SkillHHH2_Max = 10,
	SkillNDP_Max = 12,
	SkillLP = 4.5,
	SkillNOP2 = 7,
	SkillOP2 = 6,
	SkillLLLL_Max = 6,
	SkillHHH1_Min = 6.5,
	SkillLLLL_Min = 4.5,
	SkillNLP2_Min = 6
}
Attack20045.static.SkillAngle = {
	SkillNDP = 30,
	SkillLLLL = 45,
	SkillHHH2 = 45,
	SkillNHP = 120,
	SkillNLP2 = 30,
	SkillNHNH = 45,
	SkillHHH1 = 45,
	SkillOP1 = 45,
	SkillSP = 150,
	SkillDP = 30,
	SkillND = 30,
	SkillHPH2 = 45,
	SkillNLLL2 = 45,
	SkillS = 30,
	SkillLP = 45,
	SkillNS2 = 30,
	Dodge = 55
}
Attack20045.static.SkillNDPTime_1 = 2.2
Attack20045.static.SkillNDPTime_2 = 3
Attack20045.static.SkillOP1Time = 15
Attack20045.static.SkillOP2Time1 = 24
Attack20045.static.SkillOP2Time2 = 1
Attack20045.static.SkillOP2Time3 = 17
Attack20045.static.SkillOP1HPPercent_1 = 0.85
Attack20045.static.SkillOP1HPPercent_2 = 0.55
Attack20045.static.SkillOP2HPPercent = 0.35

function Attack20045:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack20045.SkillRange.Dodge_Min, Attack20045.SkillRange.Dodge_Max, Attack20045.SkillAngle.Dodge, Attack20045.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Low)
	self.skillCDList = Attack20045.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20045:create()
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
						AnimalBase_Define.SkillType.Dodge
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20045_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20045_Define.SkillType.SkillHP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillLLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNLLL2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH1, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillHHH1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNHNH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20045_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNHNH
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHNH, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20045_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20045_Define.SkillType.SkillNDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillOP1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillOP1
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillNDP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 8),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillOP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillOP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP2, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 8),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20045_Define.SkillType.SkillNLP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillHPH2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20045_Define.SkillType.SkillHPH2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillLLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNLLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillND
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillHHH1,
						Hero20045_Define.SkillType.SkillHHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNSP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20045_Define.SkillType.SkillNSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20045_Define.SkillType.SkillNOP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20045_Define.SkillType.SkillNOP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillS, 2),
					BT.CommonNode:create(function()
						self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(99), false)
					end)
				}),
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH1, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20045_Define.SkillType.SkillNLLL2, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20045_Define.SkillType.SkillHPH2, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH2, 3)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
					}, self.instance:GetAnimalId(), {
						3,
						1
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
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillOP1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP1, 2, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:GetChargeNum() >= Hero20045_Define.AddGradeCondition
									end, Attack20045.SkillOP1Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillLLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillHHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNHNH),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillNHNH, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHNH, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillDP_Min, Attack20045.SkillRange.SkillDP_Max, Attack20045.SkillAngle.SkillDP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillNDP_Min, Attack20045.SkillRange.SkillNDP_Max, Attack20045.SkillAngle.SkillNDP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20045_Define.SkillType.SkillNDP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20045.SkillRange.SkillNDP) == true and self.instance:IsSkillingById(Hero20045_Define.SkillType.SkillNDP, 2)
											end, Attack20045.SkillNDPTime_2),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHP),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20045.SkillAngle.SkillNHP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNHP),
											BT.GetRandomNode:create(Attack20045.SkillProb.SkillNHP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillSP),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20045.SkillAngle.SkillSP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillSP),
											BT.GetRandomNode:create(Attack20045.SkillProb.SkillSP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20045_Define.SkillType.SkillSP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillOP1),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack20045.SkillOP1HPPercent_1
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillOP1, Attack20045.SkillAngle.SkillOP1),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
												local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
												local rate = nowHp / hpMax

												return rate <= Attack20045.SkillOP1HPPercent_2
											end),
											BT.GetRandomNode:create(Attack20045.SkillProb.SkillOP1_2, self.instance:GetAnimalId())
										}),
										BT.GetRandomNode:create(Attack20045.SkillProb.SkillOP1_1, self.instance:GetAnimalId())
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillS_Min, Attack20045.SkillRange.SkillS_Max, Attack20045.SkillAngle.SkillS),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillDP_Min, Attack20045.SkillRange.SkillDP_Max, Attack20045.SkillAngle.SkillDP),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillDP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillND),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillND_Min, Attack20045.SkillRange.SkillND_Max, Attack20045.SkillAngle.SkillND),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillND, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillNDP_Min, Attack20045.SkillAngle.SkillNDP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20045_Define.SkillType.SkillNDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										}),
										BT.SequenceNode:create({
											BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillNDP_Min, Attack20045.SkillRange.SkillNDP_Max, Attack20045.SkillAngle.SkillNDP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20045_Define.SkillType.SkillNDP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20045.SkillRange.SkillNDP) == true and self.instance:IsSkillingById(Hero20045_Define.SkillType.SkillNDP, 2)
											end, Attack20045.SkillNDPTime_1),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										})
									})
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillLLLL_Min, Attack20045.SkillAngle.SkillLLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillLP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillLP, Attack20045.SkillAngle.SkillLP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20045_Define.SkillType.SkillLP, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillHHH1_Min, Attack20045.SkillAngle.SkillHHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillNHNH, Attack20045.SkillAngle.SkillNHNH),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHNH, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillSlayCondition
									end),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero20045_Define.TrickId_SkillSlay)

										return trick ~= nil and trick:IsOpening() == true
									end),
									BT.StopMovementNode:create(self.instance)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillSlayCondition
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20045.SkillOP2Time2),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillNO2Condition
									end),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and (target:IsHitByType(AnimalBase_Define.HitType.Freeze) or target:IsHitBySkill(self.instance, Hero20045_Define.SkillType.SkillNO2, 1)) then
											return true
										end

										return false
									end),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack20045.SkillOP2HPPercent
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20045.SkillOP2Time3),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillLLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNLLL2, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNLP2_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20045_Define.SkillType.SkillNLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNLLL2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNHNH),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillNHNH, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHNH, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillDP_Min, Attack20045.SkillRange.SkillDP_Max, Attack20045.SkillAngle.SkillDP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillNDP_Min, Attack20045.SkillRange.SkillNDP_Max, Attack20045.SkillAngle.SkillNDP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20045_Define.SkillType.SkillNDP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20045.SkillRange.SkillNDP) == true and self.instance:IsSkillingById(Hero20045_Define.SkillType.SkillNDP, 2)
											end, Attack20045.SkillNDPTime_2),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL, 4),
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillNO2Condition
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNO2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20045_Define.SkillType.SkillNO2, 1),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and (target:IsHitByType(AnimalBase_Define.HitType.Freeze) or target:IsHitBySkill(self.instance, Hero20045_Define.SkillType.SkillNO2, 1)) then
											return true
										end

										return false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillS_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillNO2Condition
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNO2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillNO2),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillNO2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillNOP2Condition
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillNOP2),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillNOP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20045_Define.SkillType.SkillNOP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() >= Hero20045_Define.SkillNSP2Condition
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNSP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillNSP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20045_Define.SkillType.SkillNSP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHP),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20045.SkillAngle.SkillNHP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillNHP),
											BT.GetRandomNode:create(Attack20045.SkillProb.SkillNHP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20045_Define.SkillType.SkillNHP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillSP),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20045.SkillAngle.SkillSP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20045.SkillRange.SkillSP),
											BT.GetRandomNode:create(Attack20045.SkillProb.SkillSP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20045_Define.SkillType.SkillSP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										if self.instance:GetChargeNum() == Hero20045_Define.SkillNO2Condition then
											local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
											local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
											local rate = nowHp / hpMax

											return rate <= Attack20045.SkillOP2HPPercent
										end

										return false
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillOP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.SwitchNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local skillPonitPos = self.instance:GetScene():GetSceneSkillPointPos(98)

												return GameAI.IsAnimalWithinDistance(self.instance, skillPonitPos, Attack20045.SkillRange.SkillOP2) == false
											end),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
											BT.ConditionWaitNode:create(function()
												if self.instance:IsSkillingById(Hero20045_Define.SkillType.SkillDP, 1) == true then
													self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(98), false)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:IsSkilling() == true
											end)
										})
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:GetChargeNum() >= Hero20045_Define.SkillSlayCondition
									end, Attack20045.SkillOP2Time3),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetChargeNum() < Hero20045_Define.SkillNO2Condition
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillOP1),
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillOP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.SwitchNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local skillPonitPos = self.instance:GetScene():GetSceneSkillPointPos(98)

												return GameAI.IsAnimalWithinDistance(self.instance, skillPonitPos, Attack20045.SkillRange.SkillOP2) == false
											end),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
											BT.ConditionWaitNode:create(function()
												if self.instance:IsSkillingById(Hero20045_Define.SkillType.SkillDP, 1) == true then
													self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(98), false)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:IsSkilling() == true
											end)
										})
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20045_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:GetChargeNum() >= Hero20045_Define.SkillNO2Condition and rate > Attack20045.SkillOP2HPPercent
									end, Attack20045.SkillOP2Time1),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillS_Min, Attack20045.SkillRange.SkillS_Max, Attack20045.SkillAngle.SkillS),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillHHH2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillHHH2_Min, Attack20045.SkillRange.SkillHHH2_Max, Attack20045.SkillAngle.SkillHHH2),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNLP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillNLP2_Min, Attack20045.SkillRange.SkillNLP2_Max, Attack20045.SkillAngle.SkillNLP2),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20045_Define.SkillType.SkillNLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillDP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillDP_Min, Attack20045.SkillRange.SkillDP_Max, Attack20045.SkillAngle.SkillDP),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillDP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20045_Define.SkillType.SkillDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20045.SkillRange.SkillNS2_Min, Attack20045.SkillRange.SkillNS2_Max, Attack20045.SkillAngle.SkillNS2),
									BT.GetRandomNode:create(Attack20045.SkillProb.SkillNS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillLLLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillLLLL_Min, Attack20045.SkillAngle.SkillLLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillHPH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillHPH2, Attack20045.SkillAngle.SkillHPH2),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20045_Define.SkillType.SkillHPH2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNLLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillNLLL2_Min, Attack20045.SkillAngle.SkillNLLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20045_Define.SkillType.SkillNHNH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20045.SkillRange.SkillNHNH, Attack20045.SkillAngle.SkillNHNH),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20045_Define.SkillType.SkillNHNH, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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

function Attack20045:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20045
