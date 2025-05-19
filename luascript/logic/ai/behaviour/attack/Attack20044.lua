-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20044.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20044 = class("Attack20044")
Attack20044.static.SkillCd = {
	{
		Hero20044_Define.SkillType.SkillLL1,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillLP1,
		6,
		true
	},
	{
		Hero20044_Define.SkillType.SkillHHHH1,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillNHHHH1,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillNLLLL1,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillHP,
		7,
		false
	},
	{
		Hero20044_Define.SkillType.SkillO1,
		12,
		false
	},
	{
		Hero20044_Define.SkillType.SkillOP1,
		8,
		false
	},
	{
		Hero20044_Define.SkillType.SkillNLP1,
		15,
		false
	},
	{
		Hero20044_Define.SkillType.SkillLL2,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillLP2,
		6,
		true
	},
	{
		Hero20044_Define.SkillType.SkillHHH2,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillNHHH2,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillNLLLL2,
		2,
		true
	},
	{
		Hero20044_Define.SkillType.SkillO2,
		10,
		false
	},
	{
		Hero20044_Define.SkillType.SkillOP1,
		8,
		false
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		6,
		true
	},
	{
		Hero20044_Define.SkillType.SkillNS2,
		15,
		false
	},
	{
		Hero20044_Define.SkillType.SkillNSP2,
		15,
		false
	},
	{
		Hero20044_Define.SkillType.SkillNOP2,
		25,
		false
	},
	{
		Hero20044_Define.SkillType.SkillNLP2,
		15,
		false
	},
	{
		Hero20044_Define.SkillType.SkillNO2,
		10,
		false
	},
	{
		Hero20044_Define.SkillType.SkillSP,
		7,
		true
	},
	{
		Hero20044_Define.SkillType.SkillOP2,
		10,
		true
	}
}
Attack20044.static.SkillProb = {
	Dodge = 0.5,
	SkillHP = 0.3,
	SkillNS2 = 0.3,
	SkillNOP2 = 0.3,
	SkillO1 = 0.3,
	SkillLP2 = 0.3,
	SkillNLP2 = 0.35,
	SkillNLP1 = 0.4,
	SkillNO2 = 0.4,
	SkillSP = 0.35,
	SkillO2 = 0.3,
	SkillNSP2 = 0.3,
	DodgeAttack = 0.3,
	SkillOP1 = 0.4,
	SkillOP2 = 0.35,
	SkillLP1 = 0.3
}
Attack20044.static.SkillRange = {
	SkillLP2_Max = 10,
	Dodge_Max = 12,
	SkillNLLLL2_Max = 5.5,
	SkillNLLLL2_Min = 4,
	SkillNLLLL1_Min = 4,
	SkillNLP2 = 7,
	SkillNO2_Min = 6.5,
	SkillOP2 = 3.5,
	DodgeAttack_Max = 7,
	SkillSP_Max = 10,
	SkillSP_Min = 5.5,
	SkillHHHH1_Max = 5.5,
	SkillNHHHH1_Min = 4,
	SkillNHHH2_Max = 5.5,
	SkillNOP2 = 30,
	SkillLL2 = 5,
	Dodge_Min = 6,
	SkillLP2_Min = 5,
	SkillLP1_Max = 9,
	SkillNS2 = 4.5,
	DodgeAttack_Min = 4,
	SkillHHH2_Min = 4,
	SkillOP2_Min = 8,
	SkillOP1_Min = 4,
	SkillNHHHH1_Max = 5.5,
	SkillOP1_Max = 8,
	SkillO1 = 4,
	SkillO2_Min = 8,
	SkillLP1_Min = 4.5,
	SkillNSP2 = 4.5,
	SkillLL1 = 4,
	SkillNO2_Max = 16,
	SkillHHH2_Max = 5.5,
	SkillNLP1_Max = 15,
	SkillO2_Max = 18,
	SkillHP = 3,
	SkillHHHH1_Min = 4,
	SkillOP2_Max = 30,
	SkillNHHH2_Min = 4,
	SkillNLLLL1_Max = 5.5,
	SkillNLP1_Min = 7
}
Attack20044.static.SkillAngle = {
	SkillNHHH2 = 55,
	SkillLL2 = 55,
	SkillHHH2 = 55,
	SkillHP = 90,
	SkillO1 = 120,
	SkillHHHH1 = 55,
	SkillNS2 = 60,
	SkillNLP1 = 45,
	SkillNLP2 = 60,
	SkillNHHHH1 = 55,
	SkillNO2 = 30,
	SkillNSP2 = 60,
	DodgeAttack = 45,
	SkillOP1 = 30,
	SkillLL1 = 55,
	SkillLP1 = 45,
	SkillSP = 45,
	SkillOP2 = 30,
	SkillNOP2 = 30,
	SkillNLLLL2 = 55,
	SkillLP2 = 45,
	SkillO2 = 60,
	SkillNLLLL1 = 55,
	Dodge = 180
}
Attack20044.static.HoverTimeRatio = 2.5
Attack20044.static.SkillSPTime = 5.5
Attack20044.static.SkillOP2Time = 5
Attack20044.static.CheckMoveDistance = 0.5

function Attack20044:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack20044.SkillRange.Dodge_Min, Attack20044.SkillRange.Dodge_Max, Attack20044.SkillAngle.Dodge, Attack20044.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20044.HoverTimeRatio, 1, AnimalBase_Define.SpeedMode.Slow, true)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Horizontal, Attack20044.HoverTimeRatio, 2, Hero20044_Define.SkillType.SkillSP, false)
	self.execute = Execute:new(instance)
	self.skillCDList = Attack20044.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20044:create()
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
						Hero20044_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20044_Define.SkillType.SkillSP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillO1,
						Hero20044_Define.SkillType.SkillO2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillOP1,
						Hero20044_Define.SkillType.SkillOP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20044_Define.SkillType.SkillOP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNOP2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 5)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNOP2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNOP2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20044_Define.SkillType.SkillNOP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20044_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillLP1,
						Hero20044_Define.SkillType.SkillLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20044_Define.SkillType.SkillLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNLP1,
						Hero20044_Define.SkillType.SkillNLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20044_Define.SkillType.SkillNLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNO2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNSP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20044_Define.SkillType.SkillNSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL2, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillLL1,
						Hero20044_Define.SkillType.SkillLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillLL1,
						Hero20044_Define.SkillType.SkillLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHHH1, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillHHHH1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHH2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillHHHH1,
						Hero20044_Define.SkillType.SkillHHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHHH1, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNHHHH1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNHHHH1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHH2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNHHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL2, 0)
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNLLLL1,
						Hero20044_Define.SkillType.SkillNLLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20044_Define.SkillType.SkillNLLLL1,
						Hero20044_Define.SkillType.SkillNLLLL2
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
				self.execute.executeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsPermitExecuteHit() == true
					end),
					BT.StopSkillNode:create(self.instance),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsHitByType(AnimalBase_Define.HitType.StatusWeak)
					end),
					BT.StopSkillNode:create(self.instance),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end
					end)
				}),
				self.hoverInDefence.hoverInDefenceNode,
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillLL1, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillHHHH1, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHHH1, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL1, 4)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.SequenceNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Normal)
							end)
						})
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillLL2, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillHHH2, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHH2, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL2, 4)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.SequenceNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Normal)
							end)
						})
					}, self.instance:GetAnimalId(), {
						2,
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
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillLL1),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillLP1_Max),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20044_Define.SkillType.SkillLP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHHH1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillHHHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHHH1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNLLLL1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLP1, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHHH1_Min),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.RandomSequenceNode:create({
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20044_Define.SkillType.SkillHP, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillHHHH1_Min),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHHH1_Min),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNLLLL1_Min),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
											})
										}, self.instance:GetAnimalId(), {
											2,
											1,
											1,
											2
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.dodge:IsDodgeType(Dodge.DodgeType.Back) == true
											end),
											BT.RandomNode:create({
												BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
												BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
											}, self.instance:GetAnimalId(), {
												2,
												1
											})
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHP, 1),
									BT.IsHitBySkillNode:create(self.instance, Hero20044_Define.SkillType.SkillHP, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillHP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillHP, Attack20044.SkillAngle.SkillHP),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillHP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20044_Define.SkillType.SkillHP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillSP),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillSP_Min, Attack20044.SkillAngle.SkillSP),
											BT.GetRandomNode:create(Attack20044.SkillProb.SkillSP, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Horizontal)
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillSP_Max, Attack20044.SkillAngle.SkillSP),
											BT.GetRandomNode:create(Attack20044.SkillProb.SkillSP, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
											BT.CommonNode:create(function()
												self.hoverInDefence:SetHoverInDefenceType(HoverInDefence.HoverType.Forward)
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillO1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillO1, Attack20044.SkillAngle.SkillO1),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillO1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.DodgeAttack_Min, Attack20044.SkillRange.DodgeAttack_Max, Attack20044.SkillAngle.Dodge),
									BT.GetRandomNode:create(Attack20044.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge:SetDodgeType(Dodge.DodgeType.Forward)
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillLP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.SkillLP1_Min, Attack20044.SkillRange.SkillLP1_Max, Attack20044.SkillAngle.SkillLP1),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillLP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20044_Define.SkillType.SkillLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillOP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.SkillOP1_Min, Attack20044.SkillRange.SkillOP1_Max, Attack20044.SkillAngle.SkillOP1),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillOP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20044_Define.SkillType.SkillOP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.SkillNLP1_Min, Attack20044.SkillRange.SkillNLP1_Max, Attack20044.SkillAngle.SkillNLP1),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillNLP1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20044_Define.SkillType.SkillNLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL1),
										BT.ConditionNode:create(function()
											return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
										end),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillLL1, Attack20044.SkillAngle.SkillLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHHH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillHHHH1_Min, Attack20044.SkillAngle.SkillHHHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHHH1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNHHHH1_Min, Attack20044.SkillAngle.SkillNHHHH1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNLLLL1_Min, Attack20044.SkillAngle.SkillNLLLL1),
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
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNOP2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 5)),
									BT.DebugAISkillingNode:create(self.instance, {
										Hero20044_Define.SkillType.SkillNOP2
									}),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNOP2),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillLL2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillLP2_Max),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20044_Define.SkillType.SkillLP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNS2),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNS2),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNSP2),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNSP2),
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20044_Define.SkillType.SkillNSP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHH2, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHH2_Min),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNLLLL2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillLP2, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHH2_Min),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.RandomSequenceNode:create({
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20044_Define.SkillType.SkillHP, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillHHH2_Min),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNHHH2_Min),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNS2),
												BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNS2),
												BT.SetSkillTargetNode:create(self.instance),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
											})
										}, self.instance:GetAnimalId())
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20044_Define.SkillType.SkillHP, 1),
									BT.IsHitBySkillNode:create(self.instance, Hero20044_Define.SkillType.SkillHP, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20044.SkillRange.SkillNLLLL2_Min),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLP2),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNLP2, Attack20044.SkillAngle.SkillNLP2),
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20044_Define.SkillType.SkillNLP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.DodgeAttack_Min, Attack20044.SkillRange.DodgeAttack_Max, Attack20044.SkillAngle.DodgeAttack),
									BT.GetRandomNode:create(Attack20044.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge:SetDodgeType(Dodge.DodgeType.Forward)
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNSP2),
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNS2, Attack20044.SkillAngle.SkillNS2),
											BT.GetRandomNode:create(Attack20044.SkillProb.SkillNS2, self.instance:GetAnimalId()),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNSP2, Attack20044.SkillAngle.SkillNSP2),
											BT.GetRandomNode:create(Attack20044.SkillProb.SkillNSP2, self.instance:GetAnimalId()),
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20044_Define.SkillType.SkillNSP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillHP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillHP, Attack20044.SkillAngle.SkillHP),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillHP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20044_Define.SkillType.SkillHP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNLP2, Attack20044.SkillAngle.SkillNLP2),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillNLP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20044_Define.SkillType.SkillNLP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.SkillOP2_Min, Attack20044.SkillRange.SkillOP2_Max, Attack20044.SkillAngle.SkillOP2),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillOP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20044_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20044.SkillRange.SkillOP2) == true or GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20044.CheckMoveDistance) == false
									end, Attack20044.SkillOP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillO2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.SkillO2_Min, Attack20044.SkillRange.SkillO2_Max, Attack20044.SkillAngle.SkillO2),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillO2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNOP2, Attack20044.SkillAngle.SkillNOP2),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillNOP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20044_Define.SkillType.SkillNOP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNO2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20044.SkillRange.SkillNO2_Min, Attack20044.SkillRange.SkillNO2_Max, Attack20044.SkillAngle.SkillNO2),
									BT.GetRandomNode:create(Attack20044.SkillProb.SkillNO2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillLL2),
										BT.ConditionNode:create(function()
											return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
										end),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillLL2, Attack20044.SkillAngle.SkillLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillHHH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillHHH2_Min, Attack20044.SkillAngle.SkillHHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNHHH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNHHH2_Min, Attack20044.SkillAngle.SkillNHHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20044_Define.SkillType.SkillNLLLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20044.SkillRange.SkillNLLLL2_Min, Attack20044.SkillAngle.SkillNLLLL2),
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

function Attack20044:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20044
