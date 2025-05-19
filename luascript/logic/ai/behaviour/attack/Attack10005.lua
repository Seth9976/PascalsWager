-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10005.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10005 = class("Attack10005")
Attack10005.static.SkillProb = {
	SkillLH_1 = 0.3,
	SkillS = 0.4,
	Eat = 0.6,
	SkillHL_2 = 0.5,
	DodgeAttack = 0.4,
	SkillHL_1 = 0.3,
	SkillLH_2 = 0.5,
	Dodge = 0.65
}
Attack10005.static.SkillCd = {
	{
		AnimalBase_Define.SkillType.Dodge,
		4,
		true
	},
	{
		AnimalBase_Define.SkillType.DodgeSpecial,
		4,
		true
	},
	{
		Hero10005_Define.SkillType.SkillS11,
		2,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH11,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH11T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH21,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH21T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH12,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH12T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH22,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH22T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH13,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH13T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH23,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillLH23T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL11,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL11T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL21,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL21T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL12,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL12T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL22,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL22T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL13,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL13T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL23,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL23T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL14,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL14T,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL24,
		8,
		true
	},
	{
		Hero10005_Define.SkillType.SkillHL24T,
		8,
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
Attack10005.static.SkillRange = {
	SkillDH = 5.5,
	Eat_Max = 30,
	SkillL_Min = 4.5,
	SkillSP_Max = 15,
	SkillS_Max = 10,
	Eat_Min = 5,
	Dodge_Min = 5,
	Dodge_Max = 7,
	DodgeAttack_Max = 6,
	SkillHL4 = 4,
	SkillLH3 = 4,
	SkillS_Min = 4,
	SkillHL1 = 4,
	SkillL_Max = 5.5,
	SkillLP_Max = 5.5,
	SkillH_Max = 5.5,
	SkillLH1 = 4,
	SkillH_Min = 5,
	SkillHL3 = 4,
	SkillLH2 = 4,
	SkillLP_Min = 4.5,
	SkillDL = 5,
	DodgeAttack_Min = 2.5,
	SkillSP_Min = 4.5,
	SkillHL2 = 4
}
Attack10005.static.SkillAngle = {
	SkillL = 45,
	SkillH = 45,
	SkillLH1 = 45,
	SkillDH = 45,
	SkillHL4 = 45,
	SkillHL3 = 45,
	SkillLP = 45,
	Dodge = 180,
	SkillLH2 = 45,
	SkillHL1 = 45,
	SkillS = 45,
	SkillDL = 45,
	DodgeAttack = 55,
	SkillLH3 = 45,
	SkillHL2 = 45
}
Attack10005.static.HoverFrameRatio = 1.5
Attack10005.static.SkillLPTime = 2
Attack10005.static.SkillSPTime = 2
Attack10005.static.HitMaxTime = 0.5
Attack10005.static.LowHPPercent = 0.5

function Attack10005:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack10005.SkillRange.Dodge_Min, Attack10005.SkillRange.Dodge_Max, Attack10005.SkillAngle.Dodge, Attack10005.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.dodgeSpecial = Dodge:new(instance, Attack10005.SkillRange.Dodge_Min, Attack10005.SkillRange.Dodge_Max, Attack10005.SkillAngle.Dodge, Attack10005.SkillProb.Dodge, AnimalBase_Define.SkillType.DodgeSpecial, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack10005.HoverFrameRatio, 2, AnimalBase_Define.SpeedMode.Normal)
	self.execute = Execute:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.skillCDList = Attack10005.SkillCd
	self.isWait = false
	self.attackNode = self:create()
end

function Attack10005:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({})
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
				BT.SequenceNode:create({
					BT.IsSkillingNode:create(self.instance),
					self.dodgeSpecial.dodgeNode
				}),
				BT.SequenceNode:create({
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					self.dodge.dodgeNode
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL12, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL13, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL14, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL22, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL23, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL24, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH12, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH13, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH14, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH22, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH23, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH24, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.SequenceNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Normal)
								self.dodgeSpecial:SetDodgeType(Dodge.DodgeType.Normal)
							end)
						})
					}, self.instance:GetAnimalId(), {
						3,
						1
					})
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL15, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillL25, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH15, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillH25, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.SequenceNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								log("dodge=========================================1111111=")
								self.dodge:SetDodgeType(Dodge.DodgeType.Normal)
								self.dodgeSpecial:SetDodgeType(Dodge.DodgeType.Normal)
							end)
						})
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH11, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH11T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH12, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH12T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH13, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH13T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH21, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH21T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH22, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH22T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH23, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLH23T, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL11, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL11T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL12, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL12T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL14, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL14T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL21, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL21T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL22, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL22T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL24, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillHL24T, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLP1, 5),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10005_Define.SkillType.SkillLP2, 5)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.SequenceNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								log("dodge========================================22222222222==")
								self.dodge:SetDodgeType(Dodge.DodgeType.Normal)
								self.dodgeSpecial:SetDodgeType(Dodge.DodgeType.Normal)
							end)
						})
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
								BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.DodgeSpecial, 0)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.SelectorNode:create({
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.SelectorNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack10005.SkillRange.SkillDL),
											BT.ConditionNode:create(function()
												return self.instance:GetFinalSkillParamMax() > 0 and self.instance:GetFinalSkillParamMax() <= 3
											end),
											BT.ConditionNode:create(function()
												return self.instance:IsSkillingById(AnimalBase_Define.SkillType.Dodge, 0) and self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.DodgeSpecial, 0) and self.dodgeSpecial:IsDodgeType(Dodge.DodgeType.Slant) == true
											end)
										}),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.SelectorNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack10005.SkillRange.SkillDH),
											BT.ConditionNode:create(function()
												return self.instance:GetFinalSkillParamMax() > 5 and self.instance:GetFinalSkillParamMax() <= 9
											end),
											BT.ConditionNode:create(function()
												return self.instance:IsSkillingById(AnimalBase_Define.SkillType.Dodge, 0) and self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.DodgeSpecial, 0) and self.dodgeSpecial:IsDodgeType(Dodge.DodgeType.Slant) == true
											end)
										}),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SelectorNode:create({
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH11),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH21),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH11T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH21T),
								BT.IsSkillingSkillNode:create(self.instance),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL11, 2),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL12, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL16, 2),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL26, 2),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL21, 2),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL22, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDL1, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDL2, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH11, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH21, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH11T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH21T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillLH1, Attack10005.SkillAngle.SkillLH1),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												log(tostring(target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId)) .. "=====" .. target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay))

												if target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
													return true
												end
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillLH_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillLH_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH12),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH12T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH22),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH22T),
								BT.IsSkillingSkillNode:create(self.instance),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL13, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL23, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL14, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL24, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH12, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH12T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH22, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH22T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillLH2, Attack10005.SkillAngle.SkillLH2),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
												return true
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillLH_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillLH_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH13),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH13T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH23),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillLH23T),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL15, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL25, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH13, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH13T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH23, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLH23T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillLH3, Attack10005.SkillAngle.SkillLH3),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
												return true
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillLH_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillLH_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL11),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL11T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL21),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL21T),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH11, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH21, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDH1, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDH2, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL11, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL21, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL11T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL21T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillHL1, Attack10005.SkillAngle.SkillHL1),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
												return true
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL12),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL12T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL22),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL22T),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH12, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH22, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL12, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL22, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL12T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL22T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillHL2, Attack10005.SkillAngle.SkillHL2),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
												return true
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23T),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH13, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH23, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH14, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH24, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillHL3, Attack10005.SkillAngle.SkillHL3),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
												return true
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL14),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL14T),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL24),
								BT.IsSkillCdNode:create(self.instance, Hero10005_Define.SkillType.SkillHL24T),
								BT.SelectorNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH14, 1),
									BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH24, 1)
								}),
								BT.SelectorNode:create({
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL13T, 1),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillHL23T, 1)
								}),
								BT.IsSkillComboNode:create(self.instance),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillHL4, Attack10005.SkillAngle.SkillHL4),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHaveStatusById(Hero10005_Define.TalentDarkStatusId) == true and target:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay) >= 3 then
												return true
											end

											return false
										end),
										BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_2, self.instance:GetAnimalId())
									}),
									BT.GetRandomNode:create(Attack10005.SkillProb.SkillHL_1, self.instance:GetAnimalId())
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL11, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL12, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL16, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL26, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL13, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL14, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL21, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL22, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL23, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillL24, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDL1, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDL2, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10005.SkillRange.SkillL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH11, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH12, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH13, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH14, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH21, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH22, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH23, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillH24, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDH1, 1),
										BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillDH2, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10005.SkillRange.SkillH_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillLP1, 4),
								BT.IsSkillingByIdNode:create(self.instance, Hero10005_Define.SkillType.SkillLP2, 4)
							}),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack10005.SkillRange.SkillLP_Max),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLP1, 1),
								BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillLP1, 1)
							}),
							BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillLP_Min, Attack10005.SkillAngle.SkillLP),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, 0, 0, false),
							BT.ConditionWaitNode:create(function()
								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack10005.SkillLPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillSP11, 1),
							BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10005.SkillRange.SkillSP_Min, Attack10005.SkillRange.SkillSP_Max),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false),
							BT.ConditionWaitNode:create(function()
								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack10005.SkillSPTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10005_Define.SkillType.SkillS11, 2),
							BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10005.SkillRange.SkillS_Min, Attack10005.SkillRange.SkillS_Max, Attack10005.SkillAngle.SkillS),
							BT.GetRandomNode:create(Attack10005.SkillProb.SkillS, self.instance:GetAnimalId()),
							BT.StopMovementNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Eat),
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.EatFast),
							BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
							BT.ConditionNode:create(function()
								local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
								local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
								local rate = nowHp / hpMax

								return rate <= Attack10005.LowHPPercent
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10005.SkillRange.Eat_Min, Attack10005.SkillRange.Eat_Max),
							BT.GetRandomNode:create(Attack10005.SkillProb.Eat, self.instance:GetAnimalId()),
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
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.DodgeSpecial),
							BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
							BT.ConditionNode:create(function()
								local skillEnergy = self.instance:GetValue():GetSkillEnergy(AnimalBase_Define.SkillType.Dodge, 1)

								return skillEnergy < self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy)
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10005.SkillRange.DodgeAttack_Min, Attack10005.SkillRange.DodgeAttack_Max, Attack10005.SkillAngle.DodgeAttack),
							BT.GetRandomNode:create(Attack10005.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.CommonNode:create(function()
								self.dodge:SetDodgeType(Dodge.DodgeType.Slant)
								self.dodgeSpecial:SetDodgeType(Dodge.DodgeType.Slant)
							end)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillL_Min, Attack10005.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10005.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10005.SkillRange.SkillH_Min, Attack10005.SkillAngle.SkillH),
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

function Attack10005:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack10005
