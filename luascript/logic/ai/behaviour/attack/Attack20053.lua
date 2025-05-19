-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20053.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/CircleRound")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20053 = class("Attack20053")
Attack20053.static.SkillCd = {
	{
		Hero20053_Define.SkillType.SkillLLL,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillLLLS1,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillLLLS2,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillDPHHH,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillDPHHHS1,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillDPHHHS2,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillLP,
		8,
		true
	},
	{
		Hero20053_Define.SkillType.SkillHP1,
		5,
		true
	},
	{
		Hero20053_Define.SkillType.SkillOO,
		30,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNLP,
		30,
		false
	},
	{
		Hero20053_Define.SkillType.SkillNLLL,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNLLLS1,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNLLLS2,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillND,
		7,
		true
	},
	{
		Hero20053_Define.SkillType.SkillHHH2,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillHHH2S,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNS2,
		12,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNS2S,
		12,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNSP2,
		10,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNSP2S,
		10,
		true
	},
	{
		Hero20053_Define.SkillType.SkillHPHHHH2,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillHPHHHH2S,
		2,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNHH,
		10,
		false
	},
	{
		Hero20053_Define.SkillType.SkillNHP2,
		6,
		true
	},
	{
		Hero20053_Define.SkillType.SkillNDP,
		5,
		true
	},
	{
		Hero20053_Define.SkillType.SkillS,
		4,
		true
	},
	{
		Hero20053_Define.SkillType.SkillSP,
		15,
		true
	},
	{
		Hero20053_Define.SkillType.SkillOP,
		25,
		false
	},
	{
		Hero20053_Define.SkillType.SkillNO2,
		35,
		false
	},
	{
		Hero20053_Define.SkillType.SkillNOP2,
		25,
		false
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		8,
		true
	}
}
Attack20053.static.SkillProb = {
	SkillND = 0.5,
	SkillOO = 0.6,
	SkillNHH = 0.35,
	SkillNOP2 = 0.5,
	SkillNHP2 = 0.65,
	SkillNDP = 0.65,
	SkillOP = 0.5,
	SkillHP1 = 0.65,
	SkillS = 0.4,
	SkillLP = 0.3,
	SkillNS2 = 0.3,
	SkillNSP2 = 0.3,
	DodgeAttack = 0.45,
	SkillNLP = 0.6,
	Dodge = 0.45,
	SkillSP = 0.4
}
Attack20053.static.SkillRange = {
	SkillDPHHH_Max = 7,
	SkillOO = 20,
	SkillND = 7,
	SkillNS2_Min = 10,
	SkillS_Max = 20,
	SkillNS2_Max = 20,
	SkillHPHHHH2_Max = 9,
	SkillNOP2_Min = 7,
	SkillS_Min = 5,
	SkillHHH2_Min = 7,
	SkillLLL_Min = 7,
	SkillSP_Min = 8,
	SkillLLL_Max = 9,
	SkillHPHHHH2_Min = 7,
	DodgeAttack_Max = 12,
	SkillLP_Max = 14,
	SkillNHH = 8,
	Dodge_Min = 6,
	SkillLP_Min = 6,
	SkillNS2 = 7,
	DodgeAttack_Min = 4,
	SkillNLP = 20,
	SkillNLLL_Max = 9,
	SkillNLLL_Min = 8,
	SkillSP_Max = 20,
	SkillNDP = 5.5,
	SkillHP1_Max = 9,
	SkillNHP2 = 6,
	SkillHHH2_Max = 9,
	SkillHP1_Min = 4,
	Dodge_Max = 12,
	SkillDPHHH_Min = 5,
	SkillNSP2_Min = 10,
	SkillNSP2_Max = 20
}
Attack20053.static.SkillAngle = {
	SkillNLP = 45,
	SkillOO = 30,
	SkillHPHHHH2 = 45,
	SkillNHH = 45,
	SkillDPHHH = 45,
	SkillHHH2 = 45,
	SkillND = 150,
	SkillLLL = 45,
	SkillNS2 = 45,
	SkillNHP2_1 = 90,
	DodgeAttack = 45,
	SkillSP = 20,
	SkillNDP_2 = 20,
	SkillNHP2_2 = 10,
	SkillHP1 = 145,
	SkillNOP2 = 60,
	SkillS = 30,
	SkillLP = 45,
	SkillNDP_1 = 120,
	SkillNLLL = 45,
	Dodge = 180
}
Attack20053.static.TurnAroundTime = 2
Attack20053.static.SkillNO2HpPer = 0.2
Attack20053.static.SkillOOHpPer = 0.015
Attack20053.static.CircleRoundTimeRatio = 5

function Attack20053:initialize(instance)
	self.instance = instance
	self.circleRound = CircleRound:new(instance, CircleRound.CircleRoundType.Normal, Attack20053.CircleRoundTimeRatio)
	self.dodge = Dodge:new(instance, Attack20053.SkillRange.Dodge_Min, Attack20053.SkillRange.Dodge_Max, Attack20053.SkillAngle.Dodge, Attack20053.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Low)
	self.skillCDList = Attack20053.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20053:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillLLLS1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillLLLS2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLP, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNLP
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillOO, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillOO
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHH, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS2, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2S, 0)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillDPHHH,
						Hero20053_Define.SkillType.SkillDPHHHS1,
						Hero20053_Define.SkillType.SkillHHH2,
						Hero20053_Define.SkillType.SkillHHH2S,
						Hero20053_Define.SkillType.SkillDPHHHS2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNLLLS1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNLLLS2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 2),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNHO
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillHPHHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2S, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillHPHHHH2S
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2, 2),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNS2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2S, 2),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNS2S
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20053_Define.SkillType.SkillLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20053_Define.SkillType.SkillOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillHP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20053_Define.SkillType.SkillHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20053_Define.SkillType.SkillNDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20053_Define.SkillType.SkillNHP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNOP2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20053_Define.SkillType.SkillNOP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNSP2,
						Hero20053_Define.SkillType.SkillNSP2S
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20053_Define.SkillType.SkillNSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillOO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20053_Define.SkillType.SkillNLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
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
						Hero20053_Define.SkillType.SkillNS2,
						Hero20053_Define.SkillType.SkillNS2S
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNHH,
						Hero20053_Define.SkillType.SkillNHO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(3),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20053_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillHPHHHH2,
						Hero20053_Define.SkillType.SkillHPHHHH2S
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20053_Define.SkillType.SkillHPHHHH2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillND
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillLLL,
						Hero20053_Define.SkillType.SkillLLLS1,
						Hero20053_Define.SkillType.SkillLLLS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillDPHHH,
						Hero20053_Define.SkillType.SkillDPHHHS1,
						Hero20053_Define.SkillType.SkillDPHHHS2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20053_Define.SkillType.SkillDPHHH, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillHHH2,
						Hero20053_Define.SkillType.SkillHHH2S
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20053_Define.SkillType.SkillNLLL,
						Hero20053_Define.SkillType.SkillNLLLS1,
						Hero20053_Define.SkillType.SkillNLLLS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.ConditionNode:create(function()
						return self.instance:IsRampage() == false
					end),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Attack20053.SkillNO2HpPer
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return self.instance:IsRampage() == true and rate <= Attack20053.SkillOOHpPer
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil then
							self.instance:SetOrientation(target:GetPosByWorldPos())

							if GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20053.SkillAngle.SkillOO) == true then
								return true
							end
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 1.5),
					BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillOO),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.ConditionNode:create(function()
						return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2, 5),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1, 4),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillNOP2, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.SequenceNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
								BT.CommonNode:create(function()
									self.dodge:SetDodgeType(Dodge.DodgeType.Back)
								end)
							}),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound)
						}, self.instance:GetAnimalId(), {
							2,
							1,
							3
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.ConditionNode:create(function()
						return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHH, 4),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1, 4)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.SequenceNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
								BT.CommonNode:create(function()
									self.dodge:SetDodgeType(Dodge.DodgeType.Back)
								end)
							})
						}, self.instance:GetAnimalId(), {
							3,
							1
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
					BT.ConditionNode:create(function()
						if self.instance:IsCrazy() == true or self.instance:IsRampage() == true then
							self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
						end

						return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
					end),
					self.circleRound.circleRoundNode
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
					BT.ConditionNode:create(function()
						if self.instance:IsRampage() == true and self.dodge:IsDodgeType(Dodge.DodgeType.Horizontal) == false then
							self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
						end

						return self.instance:IsRampage() == false or self.dodge:IsDodgeType(Dodge.DodgeType.Horizontal) == true
					end),
					self.dodge.dodgeNode
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.CommonNode:create(function()
								self.followSpeed = AnimalBase_Define.SpeedMode.Normal
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 1),
									BT.IsHitBySkillNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 1),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target ~= nil and target:IsHitByType(AnimalBase_Define.HitType.StatusWeak)
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.StopSkillNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillLLL_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillDPHHH_Max),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20053_Define.SkillType.SkillDPHHH, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNLLL_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 2),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLL, 3),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillLP_Min, Attack20053.SkillRange.SkillLP_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20053_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 3),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillLP_Min, Attack20053.SkillRange.SkillLP_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20053_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHH, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance, 2),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillDPHHH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillDPHHH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 2),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillLP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillLP_Min, Attack20053.SkillRange.SkillLP_Max, Attack20053.SkillAngle.SkillLP),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillLP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20053_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillOP),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == true
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillNLP, Attack20053.SkillAngle.SkillNLP),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNLP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20053_Define.SkillType.SkillNLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLP),
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillOP),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillOP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20053_Define.SkillType.SkillOP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillS),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillS_Min, Attack20053.SkillRange.SkillS_Max, Attack20053.SkillAngle.SkillS),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillNHH, Attack20053.SkillAngle.SkillNHH),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNHH, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNDP),
									BT.ConditionNode:create(function()
										return self.instance:GetWeakEnable() == true
									end),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillNDP_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNDP),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNDP, self.instance:GetAnimalId()),
									BT.StopMovementNode:create(self.instance),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetPos

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											targetPos = target:GetPosByWorldPos()
											targetPos = self.instance:GetPosByWorldPos() - targetPos + self.instance:GetPosByWorldPos()
											targetPos.y = self.instance:GetPosByWorldPos().y

											self.instance:SetOrientation(targetPos)
										end

										return targetPos ~= nil and GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20053.SkillAngle.SkillNDP_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20053.TurnAroundTime),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20053_Define.SkillType.SkillNDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillHP1),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillHP1)),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillHP1_Min, Attack20053.SkillRange.SkillHP1_Max),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillHP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20053_Define.SkillType.SkillHP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillND),
									BT.ConditionNode:create(function()
										return self.instance:GetWeakEnable() == true
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillND)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillND),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillND, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLL),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillNLLL_Min, Attack20053.SkillAngle.SkillNLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHH),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillDPHHH_Min, Attack20053.SkillAngle.SkillDPHHH),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20053_Define.SkillType.SkillDPHHH, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLL),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillLLL_Min, Attack20053.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.CommonNode:create(function()
								self.followSpeed = AnimalBase_Define.SpeedMode.Fast
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 2)
									}),
									BT.IsHitBySkillNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 0),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target ~= nil and target:IsHitByType(AnimalBase_Define.HitType.StatusWeak)
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.StopSkillNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.dodge:IsDodgeType(Dodge.DodgeType.Horizontal) == true
											end),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20053_Define.SkillType.SkillNSP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										}),
										BT.RandomSequenceNode:create({
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillDPHHH_Max),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20053_Define.SkillType.SkillDPHHH, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillHHH2_Max),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillHPHHHH2_Max),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20053_Define.SkillType.SkillHPHHHH2, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2),
												BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2S),
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNS2_Max),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
											})
										}, self.instance:GetAnimalId())
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1, 3),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillLP_Min, Attack20053.SkillRange.SkillLP_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20053_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS2, 3),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillLP_Min, Attack20053.SkillRange.SkillLP_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20053_Define.SkillType.SkillLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2S, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNLLL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2S, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance, 1),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillDPHHH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillDPHHH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetHitNode:create(self.instance)),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillOO, 3),
									BT.ConditionNode:create(function()
										return self.instance:IsRampage() == true
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillOO, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLP, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNS2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2S, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNS2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHP2),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillNHP2_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNHP2),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNHP2, self.instance:GetAnimalId()),
									BT.StopMovementNode:create(self.instance),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetPos

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											targetPos = target:GetPosByWorldPos()
											targetPos = self.instance:GetPosByWorldPos() - targetPos + self.instance:GetPosByWorldPos()
											targetPos.y = self.instance:GetPosByWorldPos().y

											self.instance:SetOrientation(targetPos)
										end

										return targetPos ~= nil and GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20053.SkillAngle.SkillNHP2_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20053.TurnAroundTime),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20053_Define.SkillType.SkillNHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillND),
									BT.ConditionNode:create(function()
										return self.instance:GetWeakEnable() == true
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillND)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillND),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillND, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNOP2),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Attack20053.SkillRange.SkillNOP2_Min)),
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20053.SkillAngle.SkillNOP2),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNOP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20053_Define.SkillType.SkillNOP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLP),
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillOP),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate > Attack20053.SkillNO2HpPer
									end),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillOP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20053_Define.SkillType.SkillOP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNHH),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillNHH, Attack20053.SkillAngle.SkillNHH),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNHH, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillSP),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == false and self.instance:IsRampage() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillSP_Min, Attack20053.SkillRange.SkillSP_Max, Attack20053.SkillAngle.SkillSP),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillSP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20053_Define.SkillType.SkillSP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNSP2),
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNSP2S),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.DodgeAttack_Min, Attack20053.SkillRange.DodgeAttack_Max, Attack20053.SkillAngle.DodgeAttack),
									BT.GetRandomNode:create(Attack20053.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge:SetDodgeType(Dodge.DodgeType.Horizontal)
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillOP),
									BT.ConditionNode:create(function()
										return self.instance:IsCrazy() == true and self.instance:IsRampage() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillNLP, Attack20053.SkillAngle.SkillNLP),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNLP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20053_Define.SkillType.SkillNLP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2),
									BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNS2S),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20053.SkillRange.SkillNS2_Min, Attack20053.SkillRange.SkillNS2_Max, Attack20053.SkillAngle.SkillNS2),
									BT.GetRandomNode:create(Attack20053.SkillProb.SkillNS2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS1),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillNLLLS2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillNLLL_Min, Attack20053.SkillAngle.SkillNLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillHHH2S),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillHHH2_Min, Attack20053.SkillAngle.SkillHHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS1),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillLLLS2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillLLL_Min, Attack20053.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillHPHHHH2S),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillHPHHHH2_Min, Attack20053.SkillAngle.SkillHPHHHH2),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20053_Define.SkillType.SkillHPHHHH2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS1),
										BT.IsSkillCdNode:create(self.instance, Hero20053_Define.SkillType.SkillDPHHHS2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20053.SkillRange.SkillDPHHH_Min, Attack20053.SkillAngle.SkillDPHHH),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20053_Define.SkillType.SkillDPHHH, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
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

function Attack20053:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20053
