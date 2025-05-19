-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20028.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Execute")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20028 = class("Attack20028")
Attack20028.static.SkillCd = {
	{
		Hero20028_Define.SkillType.SkillLLLL,
		2,
		true
	},
	{
		Hero20028_Define.SkillType.SkillLPLL,
		2,
		true
	},
	{
		Hero20028_Define.SkillType.SkillHHHH,
		2,
		true
	},
	{
		Hero20028_Define.SkillType.SkillSSS,
		6,
		true
	},
	{
		Hero20028_Define.SkillType.SkillHP,
		4,
		true
	},
	{
		Hero20028_Define.SkillType.SkillO,
		5,
		true
	},
	{
		Hero20028_Define.SkillType.SkillOP,
		12,
		false
	},
	{
		Hero20028_Define.SkillType.SkillD,
		5,
		true
	},
	{
		Hero20028_Define.SkillType.SkillSP,
		7,
		true
	},
	{
		Hero20028_Define.SkillType.SkillDP,
		12,
		true
	}
}
Attack20028.static.SkillProb = {
	Dodge = 0.3,
	SkillD = 0.4,
	SkillDP = 0.25,
	SkillO = 0.4,
	SkillHP = 0.4,
	SkillOP_2 = 0.6,
	SkillOP_1 = 0.3,
	SkillHPH_SkillHPL_SkillHPS = 0.7,
	SkillSP = 0.4
}
Attack20028.static.SkillRange = {
	SkillO_Max = 15,
	SkillSSS_Min = 4.5,
	SkillSP_Min = 6,
	SkillSP_Max = 15,
	SkillLPLL_Max = 5,
	SkillDP = 3,
	SkillD_Max = 7,
	Dodge_Max = 7,
	SkillOP = 8.5,
	SkillHP_Min = 4,
	SkillHHHH_Max = 5,
	SkillO_Min = 6.5,
	Dodge_Min = 5,
	SkillLPLL_Min = 4,
	SkillSSS_Max = 12,
	SkillD_Min = 5,
	SkillLLLL_Max = 5,
	SkillHHHH_Min = 4,
	SkillLLLL_Min = 4,
	SkillHP_Max = 9
}
Attack20028.static.SkillAngle = {
	SkillSSS = 45,
	SkillD = 45,
	SkillDP = 45,
	SkillO = 15,
	SkillLLLL = 45,
	SkillHP = 20,
	SkillOP_2 = 135,
	SkillOP_1 = 45,
	Dodge = 60,
	SkillLPLL = 45,
	SkillHHHH = 45,
	SkillSP = 45
}
Attack20028.static.HoverTimeRatio = 2
Attack20028.static.SkillHPTime = 1
Attack20028.static.SkillSPTime = 3
Attack20028.static.HitMaxTime = 2

function Attack20028:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.execute = Execute:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20028.HoverTimeRatio, 1)
	self.dodge = Dodge:new(instance, Attack20028.SkillRange.Dodge_Min, Attack20028.SkillRange.Dodge_Max, Attack20028.SkillAngle.Dodge, Attack20028.SkillProb.Dodge, Hero20028_Define.SkillType.SkillD)
	self.skillCDList = Attack20028.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.attackNode = self:create()
end

function Attack20028:create()
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
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLPLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillLPLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHP, 2),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillHPL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHP, 2),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillHPH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHP, 2),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillHPS
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillLPLL
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillHP,
						Hero20028_Define.SkillType.SkillHPL,
						Hero20028_Define.SkillType.SkillHPH,
						Hero20028_Define.SkillType.SkillHPS
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20028_Define.SkillType.SkillHP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 1),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20028_Define.SkillType.SkillSP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 2),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20028_Define.SkillType.SkillOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20028_Define.SkillType.SkillDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillLLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillLLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHHHH, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillHHHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillHHHH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillSSS, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillSSS
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20028_Define.SkillType.SkillSSS
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
				self.alert.alertNode,
				self.execute.executeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:GetHitType() == AnimalBase_Define.HitType.Freeze
					end),
					BT.StopSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20028.SkillRange.SkillDP),
							BT.StopMovementNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20028_Define.SkillType.SkillDP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.CommonNode:create(function()
							local target = self.instance:GetBrain():GetAnimalTarget()

							if target ~= nil and target:IsDead() == false and target:IsShow() == true then
								self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
							end

							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
						end)
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsPermitExecuteHit() == true
					end),
					BT.StopSkillNode:create(self.instance),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)
				}),
				self.threat.threatNode,
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20028_Define.SkillType.SkillLLLL, 5),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20028_Define.SkillType.SkillLPLL, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20028_Define.SkillType.SkillHHHH, 5),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20028_Define.SkillType.SkillSSS, 4)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
					}, self.instance:GetAnimalId(), {
						3,
						3,
						2
					})
				}),
				BT.SequenceNode:create({
					BT.IsSkillIndexChangeNode:create(self.instance, Hero20028_Define.SkillType.SkillSP, 3),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
					}, self.instance:GetAnimalId(), {
						3,
						1
					})
				}),
				BT.SequenceNode:create({
					BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Execute, 1),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLLLL, 2),
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLLLL, 3),
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLLLL, 4)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20028.SkillRange.SkillLLLL_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHHHH, 2),
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHHHH, 3),
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHHHH, 4)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20028.SkillRange.SkillHHHH_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillSSS, 2),
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillSSS, 3)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20028.SkillRange.SkillSSS_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLPLL, 2),
								BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillLPLL, 3)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20028.SkillRange.SkillLPLL_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillD, 1),
							BT.IsSkillComboNode:create(self.instance),
							BT.RandomSequenceNode:create({
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillDP),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20028_Define.SkillType.SkillDP, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20028_Define.SkillType.SkillHP, 2),
							BT.IsSkillComboNode:create(self.instance),
							BT.GetRandomNode:create(Attack20028.SkillProb.SkillHPH_SkillHPL_SkillHPS, self.instance:GetAnimalId()),
							BT.RandomNode:create({
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
							}, self.instance:GetAnimalId(), {
								1,
								1,
								2
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillOP),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20028.SkillAngle.SkillOP_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20028.SkillRange.SkillOP),
									BT.GetRandomNode:create(Attack20028.SkillProb.SkillOP_2, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20028.SkillRange.SkillOP, Attack20028.SkillAngle.SkillOP_1),
									BT.GetRandomNode:create(Attack20028.SkillProb.SkillOP_1, self.instance:GetAnimalId())
								})
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20028_Define.SkillType.SkillOP, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillSP),
							BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20028.SkillRange.SkillSP_Min, Attack20028.SkillRange.SkillSP_Max, Attack20028.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack20028.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20028_Define.SkillType.SkillSP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
								end

								return target ~= nil and target:IsHitBySkill(self.instance, Hero20028_Define.SkillType.SkillSP, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20028.SkillSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillHP),
							BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20028.SkillRange.SkillHP_Min, Attack20028.SkillRange.SkillHP_Max, Attack20028.SkillAngle.SkillHP),
							BT.GetRandomNode:create(Attack20028.SkillProb.SkillHP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20028_Define.SkillType.SkillHP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20028.SkillHPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillO),
							BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
							BT.IsCanAttackNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20028.SkillRange.SkillO_Min, Attack20028.SkillRange.SkillO_Max, Attack20028.SkillAngle.SkillO),
							BT.GetRandomNode:create(Attack20028.SkillProb.SkillO, self.instance:GetAnimalId()),
							BT.IsCanAttackNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillD),
							BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20028.SkillRange.SkillD_Min, Attack20028.SkillRange.SkillD_Max, Attack20028.SkillAngle.SkillD),
							BT.GetRandomNode:create(Attack20028.SkillProb.SkillD, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillLLLL),
								BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20028.SkillRange.SkillLLLL_Min, Attack20028.SkillAngle.SkillLLLL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillLPLL),
								BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20028.SkillRange.SkillLPLL_Min, Attack20028.SkillAngle.SkillLPLL),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillHHHH),
								BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20028.SkillRange.SkillHHHH_Min, Attack20028.SkillAngle.SkillHHHH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20028_Define.SkillType.SkillSSS),
								BT.IsStartSkillingNode:create(self.instance, Attack20028.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20028.SkillRange.SkillSSS_Min, Attack20028.SkillAngle.SkillSSS),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack20028:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20028
