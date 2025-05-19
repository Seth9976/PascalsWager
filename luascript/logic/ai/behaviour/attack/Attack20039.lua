-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20039.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20039 = class("Attack20039")
Attack20039.static.SkillCd = {
	{
		Hero20039_Define.SkillType.SkillLLLL1,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillHPHHH1,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillLPLLL1,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillO1,
		4,
		true
	},
	{
		Hero20039_Define.SkillType.SkillOP1,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillH1,
		16,
		false
	},
	{
		Hero20039_Define.SkillType.SkillLP2,
		16,
		false
	},
	{
		Hero20039_Define.SkillType.SkillLLL2,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillHHHHH2,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillHP2,
		6,
		true
	},
	{
		Hero20039_Define.SkillType.SkillSSS2,
		1,
		true
	},
	{
		Hero20039_Define.SkillType.SkillDP,
		7,
		true
	},
	{
		Hero20039_Define.SkillType.SkillOP21,
		5,
		true
	},
	{
		Hero20039_Define.SkillType.SkillOP22,
		4,
		true
	},
	{
		Hero20039_Define.SkillType.SkillS1,
		4,
		true
	},
	{
		Hero20039_Define.SkillType.SkillNS1,
		4,
		true
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		0,
		true
	}
}
Attack20039.static.SkillProb = {
	SkillOP21 = 0.4,
	SkillH1 = 0.3,
	SkillHP2_1 = 0.3,
	SkillHP2_2 = 0.65,
	SkillO1_1 = 0.55,
	SkillLP2 = 0.3,
	SkillO1_2 = 0.65,
	SkillHHHHH2 = 0.65,
	SkillDP_1 = 0.3,
	SkillOP22 = 0.55,
	SkillOP1 = 0.65,
	SkillDP_2 = 0.25,
	Dodge = 1
}
Attack20039.static.SkillRange = {
	SkillLPLLL1_Min = 4.5,
	SkillOP1_Min = 4.5,
	SkillLLLL1_Min = 4,
	SkillOP1_Max = 6.5,
	SkillO1 = 4.5,
	SkillLLLL1_Max = 5.5,
	SkillHHHHH2_Min = 4,
	SkillO1_Max = 17,
	SkillO1_Min = 6,
	SkillHPHHH1_Max = 6,
	SkillOP22 = 4.5,
	SkillOP22_Max = 17,
	SkillLPLLL1_Max = 6,
	Dodge_Max = 10,
	SkillSSS2_Max = 5,
	SkillS1_NS1_Max = 15,
	SkillOP21 = 5.5,
	SkillH1 = 4.5,
	SkillS1_NS1_Min = 6,
	SkillSSS2_Min = 4,
	SkillOP22_Min = 6,
	SkillLP2 = 6,
	Dodge_Min = 5,
	SkillHP2 = 6,
	SkillS1_NS1 = 4.5,
	SkillHPHHH1_Min = 4.5,
	SkillLLL2_Max = 5.5,
	SkillHHHHH2_Max = 6,
	SkillLLL2_Min = 4
}
Attack20039.static.SkillAngle = {
	SkillLLL2 = 45,
	SkillHHHHH2 = 45,
	SkillSSS2 = 45,
	SkillHPHHH1 = 45,
	SkillO1 = 45,
	SkillLLLL1 = 45,
	SkillLP2 = 45,
	SkillLPLLL = 45,
	SkillOP21_2 = 5,
	SkillOP21_1 = 10,
	SkillOP22 = 45,
	SkillH1 = 45,
	SkillOP1 = 45,
	Dodge = 180
}
Attack20039.static.HoverTimeRatio = 3.5
Attack20039.static.HoverDistance = 6.5
Attack20039.static.HitMaxTime = 2

function Attack20039:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack20039.SkillRange.Dodge_Min, Attack20039.SkillRange.Dodge_Max, Attack20039.SkillAngle.Dodge, Attack20039.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20039.HoverTimeRatio, 1, AnimalBase_Define.SpeedMode.Slow)
	self.skillCDList = Attack20039.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Slow
	self.SkillDPDir = GameAI.MoveDirection.Back
	self.dodgeTimes = 0
	self.hitTime = 0
	self.attackNode = self:create()
end

function Attack20039:create()
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
						AnimalBase_Define.SkillType.Dodge
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillH1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillO1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP1, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillOP1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillOP1,
						Hero20039_Define.SkillType.SkillOP21,
						Hero20039_Define.SkillType.SkillOP22
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20039_Define.SkillType.SkillOP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20039_Define.SkillType.SkillDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHPHHH1, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillHPHHH1
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillHPHHH1,
						Hero20039_Define.SkillType.SkillHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20039_Define.SkillType.SkillHPHHH1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLPLLL1, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillLPLLL1
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillLPLLL1,
						Hero20039_Define.SkillType.SkillLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20039_Define.SkillType.SkillLPLLL1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillNS1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20039_Define.SkillType.SkillNS1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLLL1, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillLLLL1
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLL2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillLLLL1,
						Hero20039_Define.SkillType.SkillLLL2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHHHHH2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillHHHHH2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillHHHHH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillSSS2, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillSSS2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20039_Define.SkillType.SkillSSS2,
						Hero20039_Define.SkillType.SkillS1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.HoverDistance),
							BT.CommonNode:create(function()
								self.hover.hoverType = Hover.HoverType.Horizontal
							end)
						}),
						BT.CommonNode:create(function()
							self.hover.hoverType = Hover.HoverType.Forward
						end)
					}),
					self.hover.hoverNode
				}),
				BT.SequenceNode:create({
					BT.IsSkillConditionNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 2),
					BT.SelectorNode:create({
						BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
						BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0)
					}),
					self.dodge.dodgeNode,
					BT.CommonNode:create(function()
						self.dodgeTimes = self.dodgeTimes + 1
					end)
				}),
				BT.SequenceNode:create({
					BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillS1),
					BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillNS1),
					BT.IsSkillConditionNode:create(self.instance, Hero20039_Define.SkillType.SkillS1, 1),
					BT.IsSkillConditionNode:create(self.instance, Hero20039_Define.SkillType.SkillNS1, 1),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.SelectorNode:create({
						BT.ConditionNode:create(function()
							if self.instance:IsHit() == true then
								self.hitTime = self.hitTime + Time.deltaTime
							else
								self.hitTime = 0
							end

							if self.hitTime > Attack20039.HitMaxTime then
								self.hitTime = 0

								return true
							end

							return false
						end),
						BT.SequenceNode:create({
							BT.IsTargetAttackingNode:create(self.instance),
							BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local triggerValue = math.floor(target:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger))

								return triggerValue == 1 and self.instance:IsFreeSkillEnable() == true
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillS1_NS1),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20039.SkillRange.SkillS1_NS1_Min, Attack20039.SkillRange.SkillS1_NS1_Max)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local skillDir = 0

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									skillDir = target:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDir)
								end

								return skillDir >= 1 and skillDir < 3
							end),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
						}),
						BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
					}),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillLLLL1, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillHPHHH1, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillLPLLL1, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillOP1, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillLLL2, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillHHHHH2, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillHP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20039_Define.SkillType.SkillSSS2, 3)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
					}, self.instance:GetAnimalId(), {
						1,
						2
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillConditionNode:create(self.instance, Hero20039_Define.SkillType.SkillH1, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() >= AnimalBase_Define.MotionRunSpeed
									end),
									BT.ConditionNode:create(function()
										if self.instance:IsFreeMoveEnable() == false then
											self.followSpeed = AnimalBase_Define.SpeedMode.Slow

											return false
										end

										return true
									end),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillO1),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
									BT.CommonNode:create(function()
										self.followSpeed = AnimalBase_Define.SpeedMode.Slow
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.CounterAttack, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillOP1_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20039_Define.SkillType.SkillOP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillDP),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLLL1, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHPHHH1, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLPLLL1, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP1, 2)
									}),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillDP_1, self.instance:GetAnimalId()),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.SkillDPDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.SkillDPDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.SkillDPDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetLockId(target:GetAnimalId())

											if self.instance:IsLockingPlayer() == false then
												self.SkillDPDir = GameAI.MoveDirection.Back
											end

											local movePos = Vector3.zero

											movePos:SetVector3(self.instance:GetPosByWorldPos())

											if self.SkillDPDir == GameAI.MoveDirection.Left then
												movePos:Add(self.instance:GetLeft())
											elseif self.SkillDPDir == GameAI.MoveDirection.Right then
												movePos:Add(self.instance:GetRight())
											end

											movePos.y = self.instance:GetGroundY()

											self.instance:SetTargetByWorldPos(movePos, false)
										end
									end),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20039_Define.SkillType.SkillDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
									BT.UnLockTargetNode:create(self.instance)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsbossFinal() == true
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLLL1, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillH1),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillH1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLLLL1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHPHHH1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillHPHHH1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLPLLL1, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLPLLL1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillOP1_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillO1, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsbossFinal() == true
											end),
											BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
											BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillH1),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillH1, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLLLL1_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillDP, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsbossFinal() == true
											end),
											BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
											BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillH1),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillH1, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillO1),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLLLL1_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillOP1_Max),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20039_Define.SkillType.SkillOP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillO1),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20039.SkillRange.SkillO1_Min, Attack20039.SkillRange.SkillO1_Max, Attack20039.SkillAngle.SkillO1),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillO1_1, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										self.followSpeed = AnimalBase_Define.SpeedMode.Fast
									end)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsbossFinal() == true
									end),
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillH1, Attack20039.SkillAngle.SkillH1),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillH1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsBehindNode:create(self.instance),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillOP1_Min),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillOP1, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, 0, 0, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillO1),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillO1_2, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLLL1),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillLLLL1_Min, Attack20039.SkillAngle.SkillLLLL1),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillHPHHH1),
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLPLLL1),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillHPHHH1_Min, Attack20039.SkillAngle.SkillHPHHH1),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20039_Define.SkillType.SkillHPHHH1, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLPLLL1),
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillHPHHH1),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillLPLLL1_Min, Attack20039.SkillAngle.SkillLPLLL1),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20039_Define.SkillType.SkillLPLLL1, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillOP1_Min, Attack20039.SkillAngle.SkillOP1),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, 0, 0, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillConditionNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2, 2),
							BT.CommonNode:create(function()
								if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Dodge, 0) == false then
									self.dodgeTimes = 0
								end
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.ConditionNode:create(function()
											return self.dodgeTimes >= 3
										end),
										BT.GetRandomNode:create(Attack20039.SkillProb.SkillDP_2, self.instance:GetAnimalId())
									}),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetLockId(target:GetAnimalId())

											if self.instance:IsLockingPlayer() == false then
												self.SkillDPDir = GameAI.MoveDirection.Back
											end

											self.SkillDPDir = self.dodge.DodgeDir

											local movePos = Vector3.zero

											movePos:SetVector3(self.instance:GetPosByWorldPos())

											if self.SkillDPDir == GameAI.MoveDirection.Left then
												movePos:Add(self.instance:GetLeft())
											elseif self.SkillDPDir == GameAI.MoveDirection.Right then
												movePos:Add(self.instance:GetRight())
											end

											movePos.y = self.instance:GetGroundY()

											self.instance:SetTargetByWorldPos(movePos, false)
										end
									end),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20039_Define.SkillType.SkillDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
									BT.UnLockTargetNode:create(self.instance)
								}),
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() >= AnimalBase_Define.MotionRunSpeed
									end),
									BT.ConditionNode:create(function()
										if self.instance:IsFreeMoveEnable() == false then
											self.followSpeed = AnimalBase_Define.SpeedMode.Slow

											return false
										end

										return true
									end),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillOP22),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20039_Define.SkillType.SkillOP22, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
									BT.CommonNode:create(function()
										self.followSpeed = AnimalBase_Define.SpeedMode.Slow
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillDP),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLL2, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHHHHH2, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHP2, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillSSS2, 3)
									}),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillDP_1, self.instance:GetAnimalId()),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.SkillDPDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.SkillDPDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.SkillDPDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetLockId(target:GetAnimalId())

											if self.instance:IsLockingPlayer() == false then
												self.SkillDPDir = GameAI.MoveDirection.Back
											end

											local movePos = Vector3.zero

											movePos:SetVector3(self.instance:GetPosByWorldPos())

											if self.SkillDPDir == GameAI.MoveDirection.Left then
												movePos:Add(self.instance:GetLeft())
											elseif self.SkillDPDir == GameAI.MoveDirection.Right then
												movePos:Add(self.instance:GetRight())
											end

											movePos.y = self.instance:GetGroundY()

											self.instance:SetTargetByWorldPos(movePos, false)
										end
									end),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20039_Define.SkillType.SkillDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
									BT.UnLockTargetNode:create(self.instance)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP21, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillHHHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLL2, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP22, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLP2),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillLP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20039_Define.SkillType.SkillLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHHHHH2, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP22, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillHP2),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillHP2_1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20039_Define.SkillType.SkillHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLL2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLLL2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillHHHHH2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillHHHHH2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillSSS2, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillSSS2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20039_Define.SkillType.SkillDP, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
											BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLP2),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillLP2, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20039_Define.SkillType.SkillLP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillOP22),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20039_Define.SkillType.SkillOP22, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillLLL2_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20039.SkillRange.SkillHP2),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20039_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP21),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillOP21),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsLeftNode:create(self.instance),
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20039.SkillAngle.SkillOP21_1)
										}),
										BT.IsTargetWithinAngleNode:create(self.instance, Attack20039.SkillAngle.SkillOP21_2)
									}),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillOP21, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20039_Define.SkillType.SkillOP21, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillOP22),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20039.SkillRange.SkillOP22_Min, Attack20039.SkillRange.SkillOP22_Max, Attack20039.SkillAngle.SkillOP22),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillOP22, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										self.followSpeed = AnimalBase_Define.SpeedMode.Fast
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLP2),
									BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillH1),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillLP2, Attack20039.SkillAngle.SkillLP2),
									BT.GetRandomNode:create(Attack20039.SkillProb.SkillLP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20039_Define.SkillType.SkillLP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsBehindNode:create(self.instance),
									BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillHP2),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillHP2_2, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20039_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillHHHHH2_Min),
											BT.GetRandomNode:create(Attack20039.SkillProb.SkillHHHHH2, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillLLL2),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillLLL2_Min, Attack20039.SkillAngle.SkillLLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillHHHHH2),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillHHHHH2_Min, Attack20039.SkillAngle.SkillHHHHH2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillHP2),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillHP2, Attack20039.SkillAngle.SkillHP2),
										BT.GetRandomNode:create(Attack20039.SkillProb.SkillHP2_1, self.instance:GetAnimalId()),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20039_Define.SkillType.SkillHP2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20039_Define.SkillType.SkillSSS2),
										BT.IsStartSkillingNode:create(self.instance, Attack20039.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20039.SkillRange.SkillSSS2_Min, Attack20039.SkillAngle.SkillSSS2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
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

function Attack20039:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20039
