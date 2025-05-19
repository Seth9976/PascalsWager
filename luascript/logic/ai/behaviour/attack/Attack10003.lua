-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10003.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10003 = class("Attack10003")
Attack10003.static.SkillProb = {
	SkillHL1 = 0.35,
	SkillS2 = 0.35,
	SkillSP1 = 0.3,
	SkillO = 0.3,
	SkillSP2 = 0.3,
	SkillHL3 = 0.35,
	Dodge = 0.6,
	CounterAttack = 0.35,
	SkillLH_1 = 0.35,
	SkillLP = 0.45,
	Eat = 0.6,
	SkillS1 = 0.3,
	DodgeAttack = 0.35,
	SkillLH_2 = 0.5,
	SkillHL2 = 0.35
}
Attack10003.static.SkillCd = {
	{
		AnimalBase_Define.SkillType.Dodge,
		4,
		true
	},
	{
		Hero10003_Define.SkillType.SkillLH1,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillLH2,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL11,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL12,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL21,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL22,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL31,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL32,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL11T,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL12T,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL21T,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL22T,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL31T,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillHL32T,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillO1,
		18,
		false
	},
	{
		Hero10003_Define.SkillType.SkillO2,
		18,
		false
	},
	{
		Hero10003_Define.SkillType.SkillLP1,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillLP2,
		6,
		true
	},
	{
		Hero10003_Define.SkillType.SkillS1,
		8,
		true
	},
	{
		Hero10003_Define.SkillType.SkillSP1,
		8,
		true
	},
	{
		Hero10003_Define.SkillType.SkillS2,
		8,
		true
	},
	{
		Hero10003_Define.SkillType.SkillSP2,
		8,
		true
	},
	{
		Hero10003_Define.SkillType.SkillLLLL11,
		4,
		true
	},
	{
		AnimalBase_Define.SkillType.Eat,
		12,
		true
	},
	{
		AnimalBase_Define.SkillType.EatFast,
		12,
		true
	}
}
Attack10003.static.SkillRange = {
	SkillDH = 4,
	Eat_Max = 30,
	SkillS1_Min = 4,
	SkillSP2 = 3.5,
	SkillHP = 5,
	Eat_Min = 5,
	SkillHHH_Max = 5,
	SkillS2_Min = 4,
	SkillLH = 5,
	SkillS2_Max = 12,
	DodgeAttack_Min = 2.5,
	DodgeAttack_Max = 5.5,
	CounterAttack_Min = 6,
	CounterAttack_Max = 15,
	SkillLP_Min = 4,
	SkillLP_Max = 15,
	SkillSP1_Min = 4,
	SkillHL3 = 5,
	SkillSP1_Max = 12,
	SkillHHH_Min = 3.5,
	Dodge_Min = 5,
	SkillS1_Max = 12,
	Dodge_Max = 7,
	SkillHL1 = 4,
	SkillDL = 4,
	SkillLLLL_Max = 4.5,
	SkillLLLL_Min = 3,
	SkillHL2 = 5
}
Attack10003.static.SkillAngle = {
	SkillDH = 45,
	SkillHP = 45,
	Dodge = 180,
	CounterAttack = 45,
	SkillLLLL = 45,
	SkillHL3 = 45,
	SkillLH = 45,
	SkillHL1 = 45,
	SkillDL = 45,
	DodgeAttack = 55,
	SkillHHH = 45,
	SkillHL2 = 45
}
Attack10003.static.HoverFrameRatio = 1.5
Attack10003.static.LowHPPercent = 0.5
Attack10003.static.SkillSPTime = 2
Attack10003.static.HitMaxTime = 0.5

function Attack10003:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack10003.SkillRange.Dodge_Min, Attack10003.SkillRange.Dodge_Max, Attack10003.SkillAngle.Dodge, Attack10003.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack10003.HoverFrameRatio, 2, AnimalBase_Define.SpeedMode.Normal)
	self.execute = Execute:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.skillCDList = Attack10003.SkillCd
	self.isWait = false
	self.attackNode = self:create()
end

function Attack10003:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SelectorNode:create({
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.isWait == false
					end),
					BT.CommonNode:create(function()
						self.isWait = true
					end),
					BT.StopMovementNode:create(self.instance),
					BT.WaitNode:create(2)
				}),
				self.dropAttack.dropAttackNode,
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
					BT.IsPropertyMoreOrLessNode:create(self.instance, MS_HeroData.Property.Energy, false, 0),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL11, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL12, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL21, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL22, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH11, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH12, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH21, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH22, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillLH1, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillLH2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL11, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL12, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL21, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL22, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL31, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL32, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL11T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL12T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL21T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL22T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL31T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10003_Define.SkillType.SkillHL32T, 1)
					}),
					BT.ConditionNode:create(function()
						return self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyDontUse1) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyDontUse2) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyDontUse3) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyRecoveryAdd1) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyRecoveryAdd2) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyRecoveryAdd3) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusSuckHp1) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusSuckHp2) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusSuckHp3) == false
					end),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.SequenceNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Normal)
							end)
						})
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillHP1, 1),
							BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillHP, Attack10003.SkillAngle.SkillHP),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillLP1, 1),
							BT.ConditionNode:create(function()
								local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
								local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
								local rate = nowHp / hpMax

								return rate <= Attack10003.LowHPPercent
							end),
							BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillLP1),
							BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillLP2),
							BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10003.SkillRange.SkillLP_Min, Attack10003.SkillRange.SkillLP_Max),
							BT.GetRandomNode:create(Attack10003.SkillProb.SkillLP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.RandomSequenceNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsTargetWithinRangeNode:create(self.instance, Attack10003.SkillRange.SkillDL),
										BT.ConditionNode:create(function()
											return self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true
										end)
									}),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsTargetWithinRangeNode:create(self.instance, Attack10003.SkillRange.SkillDH),
										BT.ConditionNode:create(function()
											return self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true
										end)
									}),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillLH1),
									BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillLH2),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL11, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL12, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL21, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL22, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillDL, 1)
									}),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillLH1, 1),
									BT.IsSkillComboNode:create(self.instance, 2),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillLH, Attack10003.SkillAngle.SkillLH),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
												local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
												local rate = nowHp / hpMax

												return rate <= Attack10003.LowHPPercent
											end),
											BT.GetRandomNode:create(Attack10003.SkillProb.SkillLH_2, self.instance:GetAnimalId())
										}),
										BT.GetRandomNode:create(Attack10003.SkillProb.SkillLH_1, self.instance:GetAnimalId())
									}),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL11),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL12),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL11T),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL12T),
										BT.SelectorNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH11, 1),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH12, 1),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH21, 1),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH22, 1),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillDH, 1)
										}),
										BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillHL11, 1),
										BT.IsSkillComboNode:create(self.instance, 2),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillHL1, Attack10003.SkillAngle.SkillHL1),
										BT.GetRandomNode:create(Attack10003.SkillProb.SkillHL1, self.instance:GetAnimalId()),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL21),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL22),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL21T),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL22T),
										BT.SelectorNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH11, 2),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH12, 2),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH21, 2),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH22, 2)
										}),
										BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillHL21, 1),
										BT.IsSkillComboNode:create(self.instance, 2),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillHL2, Attack10003.SkillAngle.SkillHL2),
										BT.GetRandomNode:create(Attack10003.SkillProb.SkillHL2, self.instance:GetAnimalId()),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL31),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL32),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL31T),
										BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillHL32T),
										BT.SelectorNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH11, 3),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH12, 3),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH21, 3),
											BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH22, 3)
										}),
										BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillHL31, 1),
										BT.IsSkillComboNode:create(self.instance, 2),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillHL3, Attack10003.SkillAngle.SkillHL3),
										BT.GetRandomNode:create(Attack10003.SkillProb.SkillHL3, self.instance:GetAnimalId()),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL11, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL12, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL21, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillLLLL22, 0)
									}),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3))
								}),
								BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillDL, 1)
							}),
							BT.IsSkillComboNode:create(self.instance, 2),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack10003.SkillRange.SkillLLLL_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH11, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH12, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH21, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillHHH22, 0)
									}),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2))
								}),
								BT.IsSkillingByIdNode:create(self.instance, Hero10003_Define.SkillType.SkillDH, 1)
							}),
							BT.IsSkillComboNode:create(self.instance, 2),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack10003.SkillRange.SkillHHH_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Eat),
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.EatFast),
							BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
							BT.ConditionNode:create(function()
								local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
								local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
								local rate = nowHp / hpMax

								return rate <= Attack10003.LowHPPercent
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10003.SkillRange.Eat_Min, Attack10003.SkillRange.Eat_Max),
							BT.GetRandomNode:create(Attack10003.SkillProb.Eat, self.instance:GetAnimalId()),
							BT.CommonNode:create(function()
								if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
									local gameController = self.instance:GetBrain():GetGameController()
									local num = gameController:GetBagItemNum(MS_ItemData.ItemID_HpAdd)

									if num > 0 then
										self.instance:StopMovement()
										self.instance:ClearSkillButtonAll()
										self.instance:EatItem(MS_ItemData.ItemID_HpAdd)
									end
								else
									self.instance:StopMovement()
									self.instance:ClearSkillButtonAll()
									self.instance:EatItem(MS_ItemData.ItemID_HpAdd)
								end
							end)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillO1),
							BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillO2),
							BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
							BT.GetRandomNode:create(Attack10003.SkillProb.SkillO, self.instance:GetAnimalId()),
							BT.StopMovementNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyDontUse1) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyDontUse2) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyDontUse3) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyRecoveryAdd1) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyRecoveryAdd2) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusEnergyRecoveryAdd3) == false
							end),
							BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillS1),
							BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillSP1),
							BT.RandomNode:create({
								BT.SequenceNode:create({
									BT.IsSkillConditionNode:create(self.instance, Hero10003_Define.SkillType.SkillSP1, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillSP1, 1),
									BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10003.SkillRange.SkillSP1_Min, Attack10003.SkillRange.SkillSP1_Max),
									BT.GetRandomNode:create(Attack10003.SkillProb.SkillSP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack10003.SkillSPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillConditionNode:create(self.instance, Hero10003_Define.SkillType.SkillS1, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillS1, 1),
									BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10003.SkillRange.SkillS1_Min, Attack10003.SkillRange.SkillS1_Max),
									BT.GetRandomNode:create(Attack10003.SkillProb.SkillS1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							}, self.instance:GetAnimalId())
						}),
						BT.SelectorNode:create({
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsHaveShield() == true
								end),
								BT.ConditionNode:create(function()
									local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
									local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
									local rate = nowHp / hpMax

									return rate > Attack10003.LowHPPercent
								end),
								BT.IsSkillConditionNode:create(self.instance, Hero10003_Define.SkillType.SkillSP2, 2),
								BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillSP2, 1),
								BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillSP2),
								BT.GetRandomNode:create(Attack10003.SkillProb.SkillSP2, self.instance:GetAnimalId()),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false),
								BT.ConditionWaitNode:create(function()
									return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
								end, Attack10003.SkillSPTime),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsHaveStatusById(Hero10003_Define.StatusShield1) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusShield2) == false and self.instance:IsHaveStatusById(Hero10003_Define.StatusShield3) == false
								end),
								BT.IsSkillConditionNode:create(self.instance, Hero10003_Define.SkillType.SkillS2, 2),
								BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10003_Define.SkillType.SkillS2, 1),
								BT.IsSkillCdNode:create(self.instance, Hero10003_Define.SkillType.SkillS2),
								BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10003.SkillRange.SkillS2_Min, Attack10003.SkillRange.SkillS2_Max),
								BT.GetRandomNode:create(Attack10003.SkillProb.SkillS2, self.instance:GetAnimalId()),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
							BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
							BT.ConditionNode:create(function()
								local skillEnergy = self.instance:GetValue():GetSkillEnergy(AnimalBase_Define.SkillType.Dodge, 1)

								return skillEnergy < self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy)
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10003.SkillRange.DodgeAttack_Min, Attack10003.SkillRange.DodgeAttack_Max, Attack10003.SkillAngle.DodgeAttack),
							BT.GetRandomNode:create(Attack10003.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Slant)
							end)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillLLLL_Min, Attack10003.SkillAngle.SkillLLLL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10003.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10003.SkillRange.SkillHHH_Min, Attack10003.SkillAngle.SkillHHH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							})
						}, self.instance:GetAnimalId())
					})
				})
			})
		})
	})

	return btnode
end

function Attack10003:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack10003
