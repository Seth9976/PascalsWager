-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10004.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10004 = class("Attack10004")
Attack10004.static.SkillProb = {
	SkillSP = 0.5,
	Dodge = 0.55,
	Eat = 0.6,
	SkillRH = 0.25,
	SkillLHP = 0.35,
	SkillLH = 0.35,
	SkillRSP = 0.25,
	DodgeAttack = 0.3,
	SkillHL = 0.35
}
Attack10004.static.SkillCd = {
	{
		AnimalBase_Define.SkillType.Dodge,
		5,
		true
	},
	{
		Hero10004_Define.SkillType.SkillSP,
		5,
		true
	},
	{
		Hero10004_Define.SkillType.SkillRSP,
		6,
		true
	},
	{
		Hero10004_Define.SkillType.SkillLHP1,
		5,
		true
	},
	{
		Hero10004_Define.SkillType.SkillLH,
		5,
		true
	},
	{
		Hero10004_Define.SkillType.SkillLHP2,
		5,
		true
	},
	{
		Hero10004_Define.SkillType.SkillHLLL1,
		6,
		true
	},
	{
		AnimalBase_Define.SkillType.CounterAttack,
		7,
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
Attack10004.static.SkillRange = {
	SkillDH = 5,
	Eat_Max = 30,
	SkillRSP_Min = 5,
	SkillSP_Max = 8,
	SkillDLP = 4,
	Eat_Min = 5,
	SkillRL_Max = 5,
	SkillRH = 5,
	SkillLH = 3.5,
	Dodge_Min = 5,
	DodgeAttack_Max = 5.5,
	SkillLHP_Max = 4.5,
	SkillRL_Min = 4,
	SkillHP_Min = 5,
	SkillHP_Max = 6,
	SkillLP_Max = 5,
	SkillLHP_Min = 3,
	SkillDHP = 5,
	SkillRSP_Max = 8,
	Dodge_Max = 7,
	SkillLP_Min = 3.5,
	SkillDL = 4,
	DodgeAttack_Min = 2.5,
	SkillSP_Min = 5,
	SkillHL = 5
}
Attack10004.static.SkillAngle = {
	SkillSP = 55,
	SkillRH = 55,
	Dodge = 180,
	DodgeAttack = 55,
	SkillHP = 55,
	SkillLHP = 45,
	SkillLH = 45,
	SkillLP = 45,
	SkillRSP = 55,
	SkillRL = 45,
	SkillHL = 60
}
Attack10004.static.HoverFrameRatio = 2
Attack10004.static.SkillLPTime = 1.5
Attack10004.static.SkillHPTime = 1.5
Attack10004.static.SkillLHPTime = 1.5
Attack10004.static.SkillDefenceTime = 3
Attack10004.static.HitMaxTime = 0.5
Attack10004.static.LowHPPercent = 0.5

function Attack10004:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack10004.SkillRange.Dodge_Min, Attack10004.SkillRange.Dodge_Max, Attack10004.SkillAngle.Dodge, Attack10004.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack10004.HoverFrameRatio, 2, AnimalBase_Define.SpeedMode.Normal)
	self.hoverInDefence1 = HoverInDefence:new(instance, HoverInDefence.HoverType.Horizontal, Attack10004.HoverFrameRatio, 2, Hero10004_Define.SkillType.SkillSP)
	self.hoverInDefence2 = HoverInDefence:new(instance, HoverInDefence.HoverType.Horizontal, Attack10004.HoverFrameRatio, 2, Hero10004_Define.SkillType.SkillRSP)
	self.execute = Execute:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.skillCDList = Attack10004.SkillCd
	self.isWait = false
	self.attackNode = self:create()
end

function Attack10004:create()
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
							BT.IsStartSkillingNode:create(self.instance),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10004_Define.SkillType.SkillHP11
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, 1.5),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10004_Define.SkillType.SkillHP12
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10004_Define.SkillType.SkillLP11
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, 1.5),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10004_Define.SkillType.SkillLP12
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.StopMovementNode:create(self.instance)
					})
				})
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
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					self.hoverInDefence1.hoverInDefenceNode
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					self.hoverInDefence2.hoverInDefenceNode
				}),
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHP31, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHP31, 5),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHP32, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHP41, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHP41, 5),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHP42, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillLP32, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillLHP1, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillLHP2, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillLH, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHLLL1, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHLLL2, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHLLL3, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillHHH, 6)
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
					BT.IsSkillIndexChangeNode:create(self.instance, Hero10004_Define.SkillType.SkillLP31, 3),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillSP),
									BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillSP_Min, Attack10004.SkillAngle.SkillSP),
											BT.GetRandomNode:create(Attack10004.SkillProb.SkillSP, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillSP_Max, Attack10004.SkillAngle.SkillSP),
											BT.GetRandomNode:create(Attack10004.SkillProb.SkillSP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10004_Define.SkillType.SkillSP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
											end, Attack10004.SkillDefenceTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack10004.SkillRange.SkillDL),
												BT.ConditionNode:create(function()
													return self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true
												end)
											}),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsTargetWithinRangeNode:create(self.instance, Attack10004.SkillRange.SkillDH),
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
											BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10004_Define.SkillType.SkillLH, 1),
											BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillLH),
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP11, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP12, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP21, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP22, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP31, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP32, 2)
											}),
											BT.IsSkillComboNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillLH, Attack10004.SkillAngle.SkillLH),
											BT.GetRandomNode:create(Attack10004.SkillProb.SkillLH, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10004_Define.SkillType.SkillLHP1, 1),
											BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillLHP1),
											BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillLHP2),
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP11, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP12, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP21, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP22, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP31, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP32, 2)
											}),
											BT.IsSkillComboNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillLHP_Max, Attack10004.SkillAngle.SkillLHP),
											BT.GetRandomNode:create(Attack10004.SkillProb.SkillLHP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack10004.SkillRange.SkillLHP_Min) == true
											end, Attack10004.SkillLHPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP11, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP11, 5),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP12, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP21, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP21, 5),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP22, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP31, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP31, 5),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP32, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP41, 3),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP41, 5),
												BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP42, 2)
											}),
											BT.IsSkillComboNode:create(self.instance),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10004_Define.SkillType.SkillHLP, 1),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
												}),
												BT.SequenceNode:create({
													BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10004_Define.SkillType.SkillHLLL1, 1),
													BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillHLLL1),
													BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillHL, Attack10004.SkillAngle.SkillHL),
													BT.GetRandomNode:create(Attack10004.SkillProb.SkillHL, self.instance:GetAnimalId()),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
												})
											})
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP11, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP12, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP21, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP22, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP31, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillLP32, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDLP1, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDLP2, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDL, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10004.SkillRange.SkillHP_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack10004.SkillRange.SkillLP_Min) == true
									end, Attack10004.SkillLPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10004_Define.SkillType.SkillHP11, 1),
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP11, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP11, 5),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP12, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP21, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP21, 5),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP22, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP31, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP31, 5),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP32, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP41, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP41, 5),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillHP42, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDHP1, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDHP1, 5),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDHP2, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillDH, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10004.SkillRange.SkillHP_Max),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack10004.SkillRange.SkillHP_Max) == false
									end, Attack10004.SkillHPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Eat),
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.EatFast),
									BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack10004.LowHPPercent
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10004.SkillRange.Eat_Min, Attack10004.SkillRange.Eat_Max),
									BT.GetRandomNode:create(Attack10004.SkillProb.Eat, self.instance:GetAnimalId()),
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
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
									BT.ConditionNode:create(function()
										local skillEnergy = self.instance:GetValue():GetSkillEnergy(AnimalBase_Define.SkillType.Dodge, 1)

										return skillEnergy < self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy)
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10004.SkillRange.DodgeAttack_Min, Attack10004.SkillRange.DodgeAttack_Max, Attack10004.SkillAngle.DodgeAttack),
									BT.GetRandomNode:create(Attack10004.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge:SetDodgeType(Dodge.DodgeType.Slant)
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, MathHelper.getRandom(Attack10004.SkillRange.SkillLP_Min * 10, Attack10004.SkillRange.SkillLP_Max * 10, self.instance:GetAnimalId()) / 10, Attack10004.SkillAngle.SkillLP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
										BT.ConditionWaitNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
											end

											return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack10004.SkillRange.SkillLP_Min) == true
										end, Attack10004.SkillLPTime),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10004_Define.SkillType.SkillHP11, 1),
										BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, MathHelper.getRandom(Attack10004.SkillRange.SkillHP_Min * 10, Attack10004.SkillRange.SkillHP_Max * 10, self.instance:GetAnimalId()) / 10, Attack10004.SkillAngle.SkillHP),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
										BT.ConditionWaitNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
											end

											return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack10004.SkillRange.SkillHP_Max) == false
										end, Attack10004.SkillHPTime),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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
											BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillRL1, 1),
											BT.IsSkillConditionNode:create(self.instance, Hero10004_Define.SkillType.SkillRL2, 2)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10004_Define.SkillType.SkillRL2, 2),
											BT.IsSkillConditionNode:create(self.instance, Hero10004_Define.SkillType.SkillRL31, 3)
										})
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10004.SkillRange.SkillRL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillRSP),
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.CounterAttack),
									BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillRSP_Min, Attack10004.SkillAngle.SkillRSP),
											BT.GetRandomNode:create(Attack10004.SkillProb.SkillRSP, self.instance:GetAnimalId()),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()
												local targetSkillType = target:GetSkillTypeForAI()

												return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillRSP_Max, Attack10004.SkillAngle.SkillRSP),
											BT.GetRandomNode:create(Attack10004.SkillProb.SkillRSP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10004_Define.SkillType.SkillRSP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
											end, Attack10004.SkillDefenceTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10004_Define.SkillType.SkillRH),
									BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
									BT.IsTargetAttackingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10004.SkillRange.SkillRH, Attack10004.SkillAngle.SkillRH),
									BT.GetRandomNode:create(Attack10004.SkillProb.SkillRH, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero10004_Define.SkillType.SkillRL1, 1),
										BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, MathHelper.getRandom(Attack10004.SkillRange.SkillRL_Min * 10, Attack10004.SkillRange.SkillRL_Max * 10, self.instance:GetAnimalId()) / 10, Attack10004.SkillAngle.SkillRL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero10004_Define.SkillType.SkillRL2, 2),
										BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, MathHelper.getRandom(Attack10004.SkillRange.SkillRL_Min * 10, Attack10004.SkillRange.SkillRL_Max * 10, self.instance:GetAnimalId()) / 10, Attack10004.SkillAngle.SkillRL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillConditionNode:create(self.instance, Hero10004_Define.SkillType.SkillRL31, 3),
										BT.IsStartSkillingNode:create(self.instance, Attack10004.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, MathHelper.getRandom(Attack10004.SkillRange.SkillRL_Min * 10, Attack10004.SkillRange.SkillRL_Max * 10, self.instance:GetAnimalId()) / 10, Attack10004.SkillAngle.SkillRL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
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

function Attack10004:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack10004
