-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10001.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/CounterAttack")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10001 = class("Attack10001")
Attack10001.static.SkillProb = {
	SkillLH = 0.35,
	Dodge = 0.55,
	Eat = 0.6,
	CounterAttack = 0.55,
	DodgeAttack = 0.35,
	SkillDefence = 0.4,
	SkillHPP = 0.3,
	SkillHL = 0.35
}
Attack10001.static.SkillCd = {
	{
		AnimalBase_Define.SkillType.Dodge,
		4,
		true
	},
	{
		Hero10001_Define.SkillType.SkillHPP,
		5,
		true
	},
	{
		Hero10001_Define.SkillType.SkillHPPT,
		5,
		true
	},
	{
		Hero10001_Define.SkillType.SkillLH,
		6,
		true
	},
	{
		Hero10001_Define.SkillType.SkillLHT,
		6,
		true
	},
	{
		Hero10001_Define.SkillType.SkillHL,
		6,
		true
	},
	{
		Hero10001_Define.SkillType.SkillDefence,
		4,
		true
	},
	{
		AnimalBase_Define.SkillType.CounterAttack,
		5,
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
Attack10001.static.SkillRange = {
	SkillDH = 5,
	Eat_Max = 30,
	SkillL_Min = 3.5,
	DodgeAttack_Max = 5.5,
	SkillHPP_Max = 4.5,
	Eat_Min = 5,
	SkillH_Max = 5,
	SkillHPP_Min = 2.5,
	SkillLH = 5,
	SkillDefence_Max = 8,
	SkillL_Max = 4.5,
	SkillDefence_Min = 5,
	SkillH_Min = 4,
	Dodge_Min = 5,
	Dodge_Max = 7,
	CounterAttack = 4,
	DodgeAttack_Min = 2.5,
	SkillHL = 5
}
Attack10001.static.SkillAngle = {
	SkillDH = 60,
	SkillL = 45,
	Dodge = 180,
	SkillHPP = 45,
	SkillLH = 45,
	SkillH = 45,
	CounterAttack = 45,
	DodgeAttack = 55,
	SkillDefence = 55,
	SkillHL = 55
}
Attack10001.static.HoverFrameRatio = 1.5
Attack10001.static.SkillDefenceTime = 2.5
Attack10001.static.HitMaxTime = 0.5
Attack10001.static.LowHPPercent = 0.5

function Attack10001:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack10001.SkillRange.Dodge_Min, Attack10001.SkillRange.Dodge_Max, Attack10001.SkillAngle.Dodge, Attack10001.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack10001.HoverFrameRatio, 2, AnimalBase_Define.SpeedMode.Normal)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Horizontal, Attack10001.HoverFrameRatio, 2, Hero10001_Define.SkillType.SkillDefence)
	self.counterAttack = CounterAttack:new(instance, Attack10001.SkillRange.CounterAttack, Attack10001.SkillAngle.CounterAttack, Attack10001.SkillProb.CounterAttack)
	self.execute = Execute:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.skillCDList = Attack10001.SkillCd
	self.isWait = false
	self.attackNode = self:create()
end

function Attack10001:create()
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
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10001_Define.SkillType.SkillDH
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
							BT.DebugAISkillingNode:create(self.instance, {
								AnimalBase_Define.SkillType.Dodge
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillLLL, 0),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10001_Define.SkillType.SkillLHMax, 1),
									BT.DebugAISkillingNode:create(self.instance, {
										Hero10001_Define.SkillType.SkillLHMax
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.DebugAISkillingNode:create(self.instance, {
										Hero10001_Define.SkillType.SkillLH
									}),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.DebugAISkillingNode:create(self.instance, {
										Hero10001_Define.SkillType.SkillLLL
									}),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 0),
								BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH2, 0)
							}),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10001_Define.SkillType.SkillHLMax, 1),
									BT.DebugAISkillingNode:create(self.instance, {
										Hero10001_Define.SkillType.SkillHLMax
									}),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.DebugAISkillingNode:create(self.instance, {
										Hero10001_Define.SkillType.SkillHL
									}),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10001_Define.SkillType.SkillHHH1
							}),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH2, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10001_Define.SkillType.SkillHHH2
							}),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10001_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10001_Define.SkillType.SkillDefence, 1, false),
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
					BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10001_Define.SkillType.SkillHPP,
						Hero10001_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10001_Define.SkillType.SkillHPP, 2, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Dodge,
						Hero10001_Define.SkillType.SkillDH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10001_Define.SkillType.SkillLLL,
						Hero10001_Define.SkillType.SkillLH,
						Hero10001_Define.SkillType.SkillLHMax
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10001_Define.SkillType.SkillHHH1,
						Hero10001_Define.SkillType.SkillHHH2,
						Hero10001_Define.SkillType.SkillHL,
						Hero10001_Define.SkillType.SkillHLMax
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
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
				self.hoverInDefence.hoverInDefenceNode,
				BT.SequenceNode:create({
					BT.IsPropertyMoreOrLessNode:create(self.instance, MS_HeroData.Property.Energy, false, 0),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.CounterAttack),
					BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.SkillDefence),
					self.counterAttack.counterAttackNode
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillLLL, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH2, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillLH, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillLHMax, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillHL, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillHLMax, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10001_Define.SkillType.SkillLHT, 1)
					}),
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
							BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillDefence),
							BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
							BT.IsTargetAttackingNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10001.SkillRange.SkillDefence_Min, Attack10001.SkillAngle.SkillDefence),
									BT.GetRandomNode:create(Attack10001.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetSkillType = target:GetSkillTypeForAI()

										return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10001.SkillRange.SkillDefence_Max, Attack10001.SkillAngle.SkillDefence),
									BT.GetRandomNode:create(Attack10001.SkillProb.SkillDefence, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10001_Define.SkillType.SkillDefence, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
									end, Attack10001.SkillDefenceTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
								BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.DodgeSpecial, 0)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsTargetWithinRangeNode:create(self.instance, Attack10001.SkillRange.SkillDH),
								BT.ConditionNode:create(function()
									return self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true
								end)
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillLLL, 0),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10001.SkillRange.SkillLH, Attack10001.SkillAngle.SkillLH),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10001_Define.SkillType.SkillLHMax, 1),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10001_Define.SkillType.SkillLH, 1),
											BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillLH),
											BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillLHT),
											BT.GetRandomNode:create(Attack10001.SkillProb.SkillLH, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH2, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillDH, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10001.SkillRange.SkillHL, Attack10001.SkillAngle.SkillHL),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10001_Define.SkillType.SkillHLMax, 1),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10001_Define.SkillType.SkillHL, 1),
											BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillHL),
											BT.GetRandomNode:create(Attack10001.SkillProb.SkillHL, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									})
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillLLL, 0),
									BT.IsSkillComboNode:create(self.instance),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10001.SkillRange.SkillL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH1, 3),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillHHH2, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2))
										}),
										BT.IsSkillingByIdNode:create(self.instance, Hero10001_Define.SkillType.SkillDH, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10001.SkillRange.SkillH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Eat),
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.EatFast),
							BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
							BT.ConditionNode:create(function()
								local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
								local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
								local rate = nowHp / hpMax

								return rate <= Attack10001.LowHPPercent
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10001.SkillRange.Eat_Min, Attack10001.SkillRange.Eat_Max),
							BT.GetRandomNode:create(Attack10001.SkillProb.Eat, self.instance:GetAnimalId()),
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
							BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillHP),
							BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillHPP),
							BT.IsSkillCdNode:create(self.instance, Hero10001_Define.SkillType.SkillHPPT),
							BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10001.SkillRange.SkillHPP_Min, Attack10001.SkillRange.SkillHPP_Max, Attack10001.SkillAngle.SkillHPP),
							BT.GetRandomNode:create(Attack10001.SkillProb.SkillHPP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10001_Define.SkillType.SkillHPP, 2, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
							BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
							BT.ConditionNode:create(function()
								local skillEnergy = self.instance:GetValue():GetSkillEnergy(AnimalBase_Define.SkillType.Dodge, 1)

								return skillEnergy < self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy)
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10001.SkillRange.DodgeAttack_Min, Attack10001.SkillRange.DodgeAttack_Max, Attack10001.SkillAngle.DodgeAttack),
							BT.GetRandomNode:create(Attack10001.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Slant)
							end)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10001.SkillRange.SkillL_Min, Attack10001.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10001.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10001.SkillRange.SkillH_Min, Attack10001.SkillAngle.SkillH),
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

function Attack10001:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack10001
