-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20017.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Dodge")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20017 = class("Attack20017")
Attack20017.static.SkillProb = {
	Dodge = 0.4,
	SkillHP = 0.35,
	SkillXLL = 0.4,
	SkillXHP = 0.4,
	SkillLP_1 = 0.35,
	SkillOOO = 0.3,
	SkillDefence2 = 0.3,
	SkillLP_2 = 0.6,
	SkillDefence1 = 0.35
}
Attack20017.static.SkillCd = {
	{
		Hero20017_Define.SkillType.SkillOOO,
		15,
		true
	},
	{
		Hero20017_Define.SkillType.SkillDefence,
		7,
		true
	},
	{
		Hero20017_Define.SkillType.SkillLLLL,
		2,
		true
	},
	{
		Hero20017_Define.SkillType.SkillHHH,
		2,
		true
	},
	{
		Hero20017_Define.SkillType.SkillLP,
		5,
		true
	},
	{
		Hero20017_Define.SkillType.SkillHPLL,
		2,
		true
	},
	{
		AnimalBase_Define.SkillType.CounterAttack,
		8,
		true
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		5,
		true
	}
}
Attack20017.static.SkillRange = {
	SkillH_Max = 5.5,
	SkillO_Min = 5,
	SkillL_Min = 5,
	SkillO_Max = 12,
	SkillH_Min = 4.5,
	SkillXLL = 5,
	SkillXHP = 5,
	Dodge_Min = 5,
	Dodge_Max = 7,
	SkillLP = 5,
	DodgeAttack_Max = 8,
	SkillDefence = 5,
	DodgeAttack_Min = 5.5,
	SkillHP_Min = 4.5,
	SkillL_Max = 6,
	SkillHP_Max = 12
}
Attack20017.static.SkillAngle = {
	SkillL = 75,
	SkillHP = 45,
	SkillO = 45,
	SkillXLL = 60,
	SkillXHP_1 = 45,
	SkillH = 45,
	DodgeAttack = 45,
	SkillDefence = 55,
	SkillXHP_2 = 30,
	Dodge = 55
}
Attack20017.static.HoverTimeRatio = 2
Attack20017.static.SkillDefenceTime = 2.5
Attack20017.static.SkillLPTime = 3
Attack20017.static.SkillXHPTime = 2.5
Attack20017.static.HitMaxTime = 2

function Attack20017:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Horizontal, Attack20017.HoverTimeRatio, 2)
	self.dodge = Dodge:new(instance, Attack20017.SkillRange.Dodge_Min, Attack20017.SkillRange.Dodge_Max, Attack20017.SkillAngle.Dodge, Attack20017.SkillProb.Dodge)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.skillCDList = Attack20017.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20017:create()
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
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHPLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillHPLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20017_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20017_Define.SkillType.SkillLP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHHH, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillXHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20017_Define.SkillType.SkillXHP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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
						Hero20017_Define.SkillType.SkillHPLL
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillOOO, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillOOO
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillOO, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillOO
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillOOO,
						Hero20017_Define.SkillType.SkillOO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillLLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillXLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillLLLL,
						Hero20017_Define.SkillType.SkillXLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHHH, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillHHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20017_Define.SkillType.SkillHHH,
						Hero20017_Define.SkillType.SkillXHP
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
				self.alert.alertNode,
				self.threat.threatNode,
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillLP, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillHPLL, 4),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillHHH, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillL, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillXLL, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillXHP, 3)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
					}, self.instance:GetAnimalId(), {
						2,
						1
					})
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillXLL, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillXHP, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20017_Define.SkillType.SkillOOO, 3)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
					}, self.instance:GetAnimalId(), {
						2,
						1,
						1
					})
				}),
				BT.SequenceNode:create({
					BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.CounterAttack, 1),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsHitNode:create(self.instance),
							BT.ConditionNode:create(function()
								return self.instance:IsHitByType(AnimalBase_Define.HitType.Down) == true or self.instance:IsHitByType(AnimalBase_Define.HitType.Up) == true or self.instance:IsHitByType(AnimalBase_Define.HitType.FrontFly) == true or self.instance:IsHitByType(AnimalBase_Define.HitType.BackFly) == true or self.instance:IsHitByType(AnimalBase_Define.HitType.Execute) == true or self.instance:IsHitByType(AnimalBase_Define.HitType.Backstab) == true or self.instance:IsHitByType(AnimalBase_Define.HitType.Backstab2) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20017_Define.SkillType.SkillL, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillComboNode:create(self.instance),
											BT.ConditionNode:create(function()
												return self.instance:IsSkillCondition(Hero20017_Define.SkillType.SkillOO, 2)
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsSkillComboNode:create(self.instance),
											BT.ConditionNode:create(function()
												return self.dodge:IsDodgeType(Dodge.DodgeType.Back) == false
											end),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20017.SkillRange.SkillXLL),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.dodge:IsDodgeType(Dodge.DodgeType.Back) == true
											end),
											BT.RandomNode:create({
												BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
												BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
												BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
											}, self.instance:GetAnimalId(), {
												2,
												1,
												1
											})
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillOO, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillOOO, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillOOO, 2)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsHitBySkillNode:create(self.instance, Hero20017_Define.SkillType.SkillOOO, 0),
											BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
											BT.CommonNode:create(function()
												self.dodge:SetDodgeType(Dodge.DodgeType.Back)
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										}),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
									})
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillXLL, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillL, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20017.SkillRange.SkillXLL),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHPLL, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsHitBySkillNode:create(self.instance, Hero20017_Define.SkillType.SkillHPLL, 3),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target ~= nil and (target:IsHitByType(AnimalBase_Define.HitType.FrontFly) == true or target:IsHitByType(AnimalBase_Define.HitType.BackFly) == true)
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHPLL, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20017.SkillRange.SkillHP_Min),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20017.SkillRange.SkillXHP),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20017_Define.SkillType.SkillXHP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)

													if GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20017.SkillAngle.SkillXHP_2) == false and target:IsHit() == false and self.instance:IsSkillingById(Hero20017_Define.SkillType.SkillXHP, 2) then
														return true
													end
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20017.SkillXHPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId(), {
										2,
										1
									})
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL, 3)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20017.SkillRange.SkillL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHHH, 2),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20017.SkillRange.SkillH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20017_Define.SkillType.SkillDefence),
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.CounterAttack),
							BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20017.SkillRange.SkillDefence, Attack20017.SkillAngle.SkillDefence),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetAttackingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20017.SkillProb.SkillDefence2, self.instance:GetAnimalId()),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil then
											local skillIndex, skillCombo = target:GetSkillingData()

											return AnimalBase.IsSkillCounterAttackedEnable(target:GetHeroId(), skillIndex, skillCombo)
										end

										return false
									end)
								}),
								BT.GetRandomNode:create(Attack20017.SkillProb.SkillDefence1, self.instance:GetAnimalId())
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20017.SkillDefenceTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillHHH, 3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20017.SkillRange.SkillXHP, Attack20017.SkillAngle.SkillXHP),
									BT.GetRandomNode:create(Attack20017.SkillProb.SkillXHP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20017_Define.SkillType.SkillXHP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)

											if GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Attack20017.SkillAngle.SkillXHP_2) == false and target:IsHit() == false and self.instance:IsSkillingById(Hero20017_Define.SkillType.SkillXHP, 2) then
												return true
											end
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20017.SkillXHPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillLP, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL, 4)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20017.SkillRange.SkillXLL, Attack20017.SkillAngle.SkillXLL),
									BT.GetRandomNode:create(Attack20017.SkillProb.SkillXLL, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20017_Define.SkillType.SkillOOO),
							BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20017.SkillRange.SkillO_Min, Attack20017.SkillRange.SkillO_Max, Attack20017.SkillAngle.SkillO),
							BT.GetRandomNode:create(Attack20017.SkillProb.SkillOOO, self.instance:GetAnimalId()),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20017_Define.SkillType.SkillLP),
							BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20017.SkillRange.SkillLP),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsBehindNode:create(self.instance),
									BT.GetRandomNode:create(Attack20017.SkillProb.SkillLP_2, self.instance:GetAnimalId())
								}),
								BT.GetRandomNode:create(Attack20017.SkillProb.SkillLP_1, self.instance:GetAnimalId())
							}),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20017_Define.SkillType.SkillLP, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20017.SkillLPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20017_Define.SkillType.SkillHPLL),
							BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20017.SkillRange.SkillHP_Min, Attack20017.SkillRange.SkillHP_Max, Attack20017.SkillAngle.SkillHP),
							BT.GetRandomNode:create(Attack20017.SkillProb.SkillHP, self.instance:GetAnimalId()),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, 0, 0, false),
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
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
							BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20017.SkillRange.DodgeAttack_Min, Attack20017.SkillRange.DodgeAttack_Max, Attack20017.SkillAngle.DodgeAttack),
							BT.GetRandomNode:create(Attack20017.SkillProb.Dodge, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Forward)
							end)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20017_Define.SkillType.SkillLLLL),
								BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20017.SkillRange.SkillL_Min, Attack20017.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero20017_Define.SkillType.SkillHHH),
								BT.IsStartSkillingNode:create(self.instance, Attack20017.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20017.SkillRange.SkillH_Min, Attack20017.SkillAngle.SkillH),
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

function Attack20017:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20017
