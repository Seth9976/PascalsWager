-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20014.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInSkilling")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20014 = class("Attack20014")
Attack20014.static.SkillProb = {
	SkillSP1 = 0.4,
	SkillDP = 0.35,
	SkillDP3 = 0.35,
	SkillHP = 0.65,
	SkillS = 0.35,
	SkillLP = 0.65,
	SkillDM3 = 0.3,
	SkillSP3 = 0.35,
	SkillHP3 = 0.4
}
Attack20014.static.SkillCd = {
	{
		Hero20014_Define.SkillType.SkillLP1,
		3,
		true
	},
	{
		Hero20014_Define.SkillType.SkillLP2,
		3,
		true
	},
	{
		Hero20014_Define.SkillType.SkillHP1,
		3,
		true
	},
	{
		Hero20014_Define.SkillType.SkillHP2,
		3,
		true
	},
	{
		Hero20014_Define.SkillType.SkillLLL1,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillLLL2,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillD1,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillD2,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillHH1,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillHH2,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillSP1,
		5,
		true
	},
	{
		Hero20014_Define.SkillType.SkillDP1,
		15,
		true
	},
	{
		Hero20014_Define.SkillType.SkillDP2,
		15,
		true
	},
	{
		Hero20014_Define.SkillType.SkillS,
		7,
		true
	},
	{
		Hero20014_Define.SkillType.SkillSP3,
		6,
		true
	},
	{
		Hero20014_Define.SkillType.SkillDP3,
		12,
		true
	},
	{
		Hero20014_Define.SkillType.SkillHP3,
		6,
		true
	},
	{
		Hero20014_Define.SkillType.SkillLM3,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillLP3,
		1,
		true
	},
	{
		Hero20014_Define.SkillType.SkillDM3,
		5,
		true
	}
}
Attack20014.static.SkillRange = {
	SkillLP3_Min = 5.5,
	SkillHP3_Max = 5,
	SkillL_Min = 5.5,
	SkillH_Max = 7,
	SkillS_Max = 14,
	SkillHP3_Min = 1.5,
	SkillD_Max = 7,
	SkillSP1_Min = 6,
	SkillS_Min = 6,
	SkillLP = 6,
	SkillLM3_Max = 8,
	SkillHH3_Max = 7,
	SkillDP3_Min = 8,
	SkillDP_Min = 7,
	SkillL_Max = 6.5,
	SkillDP3_Max = 16,
	SkillDP_Max = 14,
	SkillDM3_Min = 5.5,
	SkillSP1_Max = 20,
	SkillLP3_Max = 7,
	SkillH_Min = 6,
	SkillHP = 5.5,
	SkillDM3_Max = 9,
	SkillDP3 = 3.5,
	SkillLM3_Min = 6,
	SkillSP3_Min = 6,
	SkillD_Min = 6,
	SkillSP3_Max = 20,
	SkillHH3_Min = 6
}
Attack20014.static.SkillAngle = {
	SkillL = 45,
	SkillDP = 30,
	SkillLP = 134,
	SkillH = 90,
	SkillD = 45,
	SkillHP = 134,
	SkillLM3 = 45,
	SkillHH3 = 55,
	SkillS = 30,
	SkillSP1 = 30,
	SkillDM3 = 45,
	SkillLP3 = 180,
	SkillDP3 = 30,
	SkillSP3 = 30,
	SkillHP3 = 45
}
Attack20014.static.SkillOPTime = 3
Attack20014.static.HpPercentReduce = 0.3
Attack20014.static.SkillDP3Time1 = 3.5
Attack20014.static.SkillDP3Time2 = 2
Attack20014.static.SkillDP3Time3 = 1
Attack20014.static.SkillDP3PlayTimes = 3
Attack20014.static.HoverTimeRatio = 2
Attack20014.static.CheckMoveDistance = 2

function Attack20014:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20014.HoverTimeRatio, 2)
	self.hoverInSkilling = HoverInSkilling:new(instance, HoverInSkilling.HoverType.Horizontal, Attack20014.HoverTimeRatio)
	self.comboSkill = 0
	self.skillDP3PlayTimes = 0
	self.skillDP3Time = 0
	self.hpPercent = 1 - Attack20014.HpPercentReduce
	self.skillCDList = Attack20014.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20014:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLP3, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillLP3
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20014_Define.SkillType.SkillOP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillSP1,
						Hero20014_Define.SkillType.SkillSP3
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20014_Define.SkillType.SkillSP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillDP1,
						Hero20014_Define.SkillType.SkillDP1,
						Hero20014_Define.SkillType.SkillDP3
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20014_Define.SkillType.SkillDP1, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return target:IsHit() == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 3),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillHP1,
						Hero20014_Define.SkillType.SkillHP2,
						Hero20014_Define.SkillType.SkillHP3
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20014_Define.SkillType.SkillHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillLP1,
						Hero20014_Define.SkillType.SkillLP2,
						Hero20014_Define.SkillType.SkillLP3
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20014_Define.SkillType.SkillLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL2, 0)
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillLLL1,
						Hero20014_Define.SkillType.SkillLLL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLM3, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 8)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillLM3
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillLLL1,
						Hero20014_Define.SkillType.SkillLLL2,
						Hero20014_Define.SkillType.SkillLM3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH2, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH3, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillHH1,
						Hero20014_Define.SkillType.SkillHH2,
						Hero20014_Define.SkillType.SkillHH3
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillHH1,
						Hero20014_Define.SkillType.SkillHH2,
						Hero20014_Define.SkillType.SkillHH3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillDM3, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillDM3
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20014_Define.SkillType.SkillD1,
						Hero20014_Define.SkillType.SkillD2,
						Hero20014_Define.SkillType.SkillDM3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.ConditionNode:create(function()
						return self.instance:IsEnchant() == false
					end),
					BT.ConditionNode:create(function()
						return self.hpPercent > 0.2
					end),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= self.hpPercent
					end),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == false and self.instance:IsFreeSkillEnable() == true and self.instance:IsSkilling() == false
					end),
					BT.CommonNode:create(function()
						self.instance:SetMoveNoDamage(true)
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, 0, 0, false),
					BT.ConditionWaitNode:create(function()
						self.instance:SetMoveNoDamage(false)
						self.instance:StopMovement()

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:IsSkillingById(Hero20014_Define.SkillType.SkillOP, 0) == false
					end, Attack20014.SkillOPTime),
					BT.CommonNode:create(function()
						self.hpPercent = self.hpPercent - Attack20014.HpPercentReduce
					end),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.hover.hoverNode,
				self.hoverInSkilling.hoverInSkillingNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillSP1, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillS, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillSP3, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillS, 1)
					}),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInSkilling)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:IsEnchant() == false
					end),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL1, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL2, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20014_Define.SkillType.SkillHH1, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20014_Define.SkillType.SkillHH2, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20014_Define.SkillType.SkillD1, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20014_Define.SkillType.SkillD2, 2)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
					}, self.instance:GetAnimalId())
				}),
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
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillS, 0),
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillDP1),
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillDP2),
									BT.CommonNode:create(function()
										if self.instance:IsEnchant() == true then
											self.comboSkill = Hero20014_Define.SkillType.SkillDP2
										else
											self.comboSkill = Hero20014_Define.SkillType.SkillDP1
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.CommonNode:create(function()
										self.comboSkill = Hero20014_Define.SkillType.SkillSP1
									end)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHP3, 3),
							BT.CommonNode:create(function()
								self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(1), false)
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20014_Define.SkillType.SkillDP1 or self.comboSkill == Hero20014_Define.SkillType.SkillDP2
									end),
									BT.SelectorNode:create({
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillDP_Min, Attack20014.SkillRange.SkillDP_Max, Attack20014.SkillAngle.SkillDP),
										BT.ConditionNode:create(function()
											self.comboSkill = 0

											return false
										end)
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20014_Define.SkillType.SkillDP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20014_Define.SkillType.SkillSP1
									end),
									BT.SelectorNode:create({
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillSP1_Min, Attack20014.SkillRange.SkillSP1_Max, Attack20014.SkillAngle.SkillSP1),
										BT.ConditionNode:create(function()
											self.comboSkill = 0

											return false
										end)
									}),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20014_Define.SkillType.SkillSP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL1, 0),
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL2, 0)
											}),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillL_Max),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH1, 1),
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH2, 1)
											}),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillH_Max),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillD1, 1),
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillD2, 1)
											}),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillD_Max),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillS),
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillSP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillS_Min, Attack20014.SkillRange.SkillS_Max, Attack20014.SkillAngle.SkillS),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillDP1),
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillDP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillDP_Min, Attack20014.SkillRange.SkillDP_Max, Attack20014.SkillAngle.SkillDP),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillDP, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20014_Define.SkillType.SkillDP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillSP1),
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillSP1_Min, Attack20014.SkillRange.SkillSP1_Max, Attack20014.SkillAngle.SkillSP1),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillSP1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20014_Define.SkillType.SkillSP1, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsLeftNode:create(self.instance),
											BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillHP1),
											BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillHP2),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20014.SkillAngle.SkillHP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillHP),
											BT.GetRandomNode:create(Attack20014.SkillProb.SkillHP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20014_Define.SkillType.SkillHP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
											BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillLP1),
											BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillLP2),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20014.SkillAngle.SkillLP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillLP),
											BT.GetRandomNode:create(Attack20014.SkillProb.SkillLP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20014_Define.SkillType.SkillLP1, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									})
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL1),
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillLLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillL_Min, Attack20014.SkillAngle.SkillL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH1),
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillH_Min, Attack20014.SkillAngle.SkillH),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillD1),
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillD2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillD_Min, Attack20014.SkillAngle.SkillD),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLP3, 1),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillLP3_Max),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLM3, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 5)),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLM3, 6),
												BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLM3, 7)
											}),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillLM3_Max),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillLM3, 8),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillHH3, 1),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20014.SkillRange.SkillHH3_Max),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillDM3, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 4)),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20014_Define.SkillType.SkillDP3, 3),
											BT.IsSkillComboNode:create(self.instance),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local target = self.instance:GetBrain():GetAnimalTarget()

														return target ~= nil and (target:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.DefenceHit or target:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.DefenceLoop)
													end),
													BT.CommonNode:create(function()
														self.skillDP3PlayTimes = 0
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.skillDP3PlayTimes == 1
													end),
													BT.IsTargetHitNode:create(self.instance),
													BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillDM3_Max),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
													BT.CommonNode:create(function()
														self.skillDP3PlayTimes = 0
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.skillDP3PlayTimes > 0 and self.skillDP3PlayTimes < Attack20014.SkillDP3PlayTimes
													end),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20014_Define.SkillType.SkillDP3, 1, false),
													BT.ConditionWaitNode:create(function()
														local target = self.instance:GetBrain():GetAnimalTarget()

														if target ~= nil and target:IsDead() == false and target:IsShow() == true and self.skillDP3Time <= Attack20014.SkillDP3Time3 then
															self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
														end

														local skillIndex, skillCombo = self.instance:GetSkillingData()

														if self.instance:IsHit() == true then
															self.skillDP3PlayTimes = 0
														end

														self.skillDP3Time = self.skillDP3Time + Time.deltaTime

														return GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20014.CheckMoveDistance) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
													end, Attack20014.SkillDP3Time2),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
													BT.CommonNode:create(function()
														self.skillDP3Time = 0

														if self.instance:IsSkillingById(Hero20014_Define.SkillType.SkillDP3, 0) then
															self.skillDP3PlayTimes = self.skillDP3PlayTimes + 1
														end

														if self.skillDP3PlayTimes >= Attack20014.SkillDP3PlayTimes then
															self.skillDP3PlayTimes = 0
														end
													end)
												})
											})
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillHP3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillHP3_Min, Attack20014.SkillRange.SkillHP3_Max, Attack20014.SkillAngle.SkillHP3),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillHP3, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20014_Define.SkillType.SkillHP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillDP3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillDP3_Min, Attack20014.SkillRange.SkillDP3_Max, Attack20014.SkillAngle.SkillDP3),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillDP3, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20014_Define.SkillType.SkillDP3, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and self.skillDP3Time <= Attack20014.SkillDP3Time3 then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										local skillIndex, skillCombo = self.instance:GetSkillingData()

										if self.instance:IsHit() == true then
											self.skillDP3PlayTimes = 0
										end

										self.skillDP3Time = self.skillDP3Time + Time.deltaTime

										return GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20014.CheckMoveDistance) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20014.SkillDP3Time1),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
									BT.CommonNode:create(function()
										self.skillDP3Time = 0

										if self.instance:IsSkillingById(Hero20014_Define.SkillType.SkillDP3, 0) then
											self.skillDP3PlayTimes = self.skillDP3PlayTimes + 1
										end

										if self.skillDP3PlayTimes >= Attack20014.SkillDP3PlayTimes then
											self.skillDP3PlayTimes = 0
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillSP3),
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillSP3_Min, Attack20014.SkillRange.SkillSP3_Max, Attack20014.SkillAngle.SkillSP3),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillSP3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20014_Define.SkillType.SkillSP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillDM3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20014.SkillRange.SkillDM3_Min, Attack20014.SkillRange.SkillDM3_Max, Attack20014.SkillAngle.SkillDM3),
									BT.GetRandomNode:create(Attack20014.SkillProb.SkillDM3, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillLM3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillLM3_Min, Attack20014.SkillAngle.SkillLM3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillHH3_Min, Attack20014.SkillAngle.SkillHH3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20014_Define.SkillType.SkillLP3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20014.SkillRange.SkillLP3_Min),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20014_Define.SkillType.SkillLP3, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId(), {
									2,
									2,
									1
								})
							})
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20014:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20014
