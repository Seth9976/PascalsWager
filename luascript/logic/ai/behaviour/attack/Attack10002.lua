-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10002.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/CounterAttack")
require("LuaScript/Logic/AI/Behaviour/Execute")
require("LuaScript/Logic/AI/Behaviour/DropAttack")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10002 = class("Attack10002")
Attack10002.static.SkillProb = {
	SkillLH = 0.35,
	SkillHL = 0.35,
	Dodge = 0.55,
	CounterAttack = 0.5,
	DodgeAttack = 0.35,
	Eat = 0.6,
	SkillSP = 0.3
}
Attack10002.static.SkillCd = {
	{
		AnimalBase_Define.SkillType.Dodge,
		4,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP1,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP2,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP3,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP4,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP5,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP6,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP1T,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP2T,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP3T,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP4T,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP5T,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillSP6T,
		6,
		true
	},
	{
		Hero10002_Define.SkillType.SkillLH,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillHL,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillLHT,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillHLT,
		5,
		true
	},
	{
		AnimalBase_Define.SkillType.CounterAttack,
		7,
		true
	},
	{
		Hero10002_Define.SkillType.SkillS1,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillS2,
		5,
		true
	},
	{
		Hero10002_Define.SkillType.SkillS3,
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
Attack10002.static.SkillRange = {
	SkillDH = 10,
	Eat_Max = 30,
	SkillL_Min = 4,
	SkillSP_Max = 8,
	SkillLH = 5,
	Eat_Min = 5,
	Dodge_Min = 5,
	SkillHP1_Max = 12,
	SkillHHH_Max = 15,
	DodgeAttack_Max = 5.5,
	SkillDL = 4.5,
	CounterAttack = 4,
	SkillL_Max = 5,
	SkillH_Max = 12,
	SkillH_Min = 7,
	SkillHP1_Min = 4.5,
	Dodge_Max = 7,
	SkillH = 5.5,
	SkillS1 = 3.5,
	DodgeAttack_Min = 2.5,
	SkillSP_Min = 4,
	SkillHL = 5
}
Attack10002.static.SkillAngle = {
	SkillL = 55,
	SkillHL = 45,
	SkillHP1 = 10,
	Dodge = 180,
	SkillLH = 45,
	SkillH = 45,
	CounterAttack = 45,
	DodgeAttack = 55,
	SkillSP = 45
}
Attack10002.static.AimShootTime = 1.5
Attack10002.static.HoverFrameRatio = 1.5
Attack10002.static.shootHeight = 0.7
Attack10002.static.HitMaxTime = 0.5
Attack10002.static.LowHPPercent = 0.5

function Attack10002:initialize(instance)
	self.instance = instance
	self.dodge = Dodge:new(instance, Attack10002.SkillRange.Dodge_Min, Attack10002.SkillRange.Dodge_Max, Attack10002.SkillAngle.Dodge, Attack10002.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Normal)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack10002.HoverFrameRatio, 2, AnimalBase_Define.SpeedMode.Normal)
	self.counterAttack = CounterAttack:new(instance, Attack10002.SkillRange.CounterAttack, Attack10002.SkillAngle.CounterAttack, Attack10002.SkillProb.CounterAttack)
	self.execute = Execute:new(instance)
	self.dropAttack = DropAttack:new(instance)
	self.aimPos = Vector3.zero
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.skillCDList = Attack10002.SkillCd
	self.isWait = false
	self.attackNode = self:create()
end

function Attack10002:create()
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
								Hero10002_Define.SkillType.SkillDH
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
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10002_Define.SkillType.SkillDL
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillLLL, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10002_Define.SkillType.SkillLH
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillLLL, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10002_Define.SkillType.SkillLLL
							}),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 0),
								BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH2, 0)
							}),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10002_Define.SkillType.SkillHL
							}),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10002_Define.SkillType.SkillHHH1
							}),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 3)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH2, 0),
							BT.DebugAISkillingNode:create(self.instance, {
								Hero10002_Define.SkillType.SkillHHH2
							}),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10002_Define.SkillType.SkillHP1, 1),
					BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10002_Define.SkillType.SkillHP1, 1, false),
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
					BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10002_Define.SkillType.SkillSP1,
						Hero10002_Define.SkillType.SkillSP2,
						Hero10002_Define.SkillType.SkillSP3,
						Hero10002_Define.SkillType.SkillSP4,
						Hero10002_Define.SkillType.SkillSP5,
						Hero10002_Define.SkillType.SkillSP6
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance.bulletSPNum >= Hero10002_Define.BulletReloadMax or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10002_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						AnimalBase_Define.SkillType.Dodge,
						Hero10002_Define.SkillType.SkillDH,
						Hero10002_Define.SkillType.SkillDL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10002_Define.SkillType.SkillLLL,
						Hero10002_Define.SkillType.SkillLH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10002_Define.SkillType.SkillHHH1,
						Hero10002_Define.SkillType.SkillHHH2,
						Hero10002_Define.SkillType.SkillHL
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
				BT.SequenceNode:create({
					BT.IsPropertyMoreOrLessNode:create(self.instance, MS_HeroData.Property.Energy, false, 0),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				BT.SequenceNode:create({
					BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.CounterAttack),
					BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillS1),
					BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillS2),
					BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillS3),
					BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP6),
					BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP6T),
					self.counterAttack.counterAttackNode
				}),
				BT.SequenceNode:create({
					BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillL_Max),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10002_Define.SkillType.SkillLLL, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10002_Define.SkillType.SkillLH, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10002_Define.SkillType.SkillHL, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10002_Define.SkillType.SkillLHT, 2),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10002_Define.SkillType.SkillHLT, 2)
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
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillDL),
										BT.ConditionNode:create(function()
											return self.dodge:IsDodgeType(Dodge.DodgeType.Slant) == true
										end)
									}),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBulletNow() > 0
									end),
									BT.IsCanAttackNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillDH),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10002_Define.SkillType.SkillHP1, 1),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10002.SkillRange.SkillHP1_Min, Attack10002.SkillRange.SkillHP1_Max, Attack10002.SkillAngle.SkillHP1),
							BT.IsCanAttackNode:create(self.instance),
							BT.StopMovementNode:create(self.instance),
							BT.CommonNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.aimPos:SetVector3(target:GetAimPosition())
									self.instance:SetSkillButtonTargetForAI(self.aimPos)
								end
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10002_Define.SkillType.SkillHP1, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
									self.aimPos:SetVector3(target:GetAimPosition())
									self.instance:SetSkillButtonTargetForAI(self.aimPos)
									self.instance:SetAimDirectionForAI(self.aimPos)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack10002.AimShootTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
							BT.CommonNode:create(function()
								local aimTarget = self.instance:GetAimTargetPosition()

								self.instance:SetSkillButtonTargetForAI(aimTarget)
								self.aimPos:Set(0, 0, 0)
							end)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillLH),
									BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillLHT),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillLLL, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillDL, 1)
									}),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10002_Define.SkillType.SkillLH, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillLH),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10002.SkillRange.SkillLH, Attack10002.SkillAngle.SkillLH),
									BT.GetRandomNode:create(Attack10002.SkillProb.SkillLH, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillHL),
									BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillHLT),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 4),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH2, 0),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillDH, 1)
									}),
									BT.IsSkillDataConditionPermitNode:create(self.instance, Hero10002_Define.SkillType.SkillHL, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10002.SkillRange.SkillHL, Attack10002.SkillAngle.SkillHL),
									BT.GetRandomNode:create(Attack10002.SkillProb.SkillHL, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillLLL, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2))
										}),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillDL, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillL_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBulletNow() > 0
									end),
									BT.SelectorNode:create({
										BT.SelectorNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 2),
											BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH1, 3)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillHHH2, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2))
										}),
										BT.IsSkillingByIdNode:create(self.instance, Hero10002_Define.SkillType.SkillDH, 1)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillHHH_Max),
									BT.IsCanAttackNode:create(self.instance),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Eat),
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.EatFast),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.ConditionNode:create(function()
								local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
								local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
								local rate = nowHp / hpMax

								return rate <= Attack10002.LowHPPercent
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10002.SkillRange.Eat_Min, Attack10002.SkillRange.Eat_Max),
							BT.GetRandomNode:create(Attack10002.SkillProb.Eat, self.instance:GetAnimalId()),
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
							BT.ConditionNode:create(function()
								return (self.instance:GetBulletMax(Hero10002_Define.BulletType.Blue) > 0 or self.instance:GetBulletMax(Hero10002_Define.BulletType.Red) > 0) and self.instance.bulletType ~= Hero10002_Define.BulletType.Red
							end),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillH_Min)),
							BT.StopMovementNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.ConditionNode:create(function()
								local skillEnergy = self.instance:GetValue():GetSkillEnergy(AnimalBase_Define.SkillType.Dodge, 1)

								return skillEnergy < self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy)
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10002.SkillRange.DodgeAttack_Min, Attack10002.SkillRange.DodgeAttack_Max, Attack10002.SkillAngle.DodgeAttack),
							BT.GetRandomNode:create(Attack10002.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.RandomNode:create({
								BT.CommonNode:create(function()
									self.dodge:SetDodgeType(Dodge.DodgeType.Slant)
								end),
								BT.CommonNode:create(function()
									self.dodge:SetDodgeType(Dodge.DodgeType.Back)
								end)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBulletNow() <= 0
							end),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillS1)),
							BT.StopMovementNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return (self.instance:GetBulletMax(Hero10002_Define.BulletType.Blue) > 0 or self.instance:GetBulletMax(Hero10002_Define.BulletType.Red) > 0) and self.instance.bulletType ~= Hero10002_Define.BulletType.Blue
							end),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillH),
							BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Attack10002.SkillRange.SkillS1)),
							BT.StopMovementNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP1),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP2),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP3),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP4),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP5),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP6),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP1T),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP2T),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP3T),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP4T),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP5T),
							BT.IsSkillCdNode:create(self.instance, Hero10002_Define.SkillType.SkillSP6T),
							BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
							BT.ConditionNode:create(function()
								return self.instance:GetBulletNow() >= 3
							end),
							BT.IsTargetWithinHeightNode:create(self.instance, Attack10002.shootHeight),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10002.SkillRange.SkillSP_Min, Attack10002.SkillRange.SkillSP_Max, Attack10002.SkillAngle.SkillSP),
							BT.GetRandomNode:create(Attack10002.SkillProb.SkillSP, self.instance:GetAnimalId()),
							BT.IsCanAttackNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
								end

								return self.instance.bulletSPNum >= self.instance:GetBulletNow() or self.instance:IsSkilling() == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.RandomSequenceNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10002.SkillRange.SkillL_Min, Attack10002.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance.bulletType == Hero10002_Define.BulletType.Red or self.instance.bulletType == Hero10002_Define.BulletType.White
								end),
								BT.ConditionNode:create(function()
									return self.instance:GetBulletNow() > 0
								end),
								BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
								BT.IsTargetWithinHeightNode:create(self.instance, Attack10002.shootHeight),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10002.SkillRange.SkillH_Min, Attack10002.SkillRange.SkillH_Max, Attack10002.SkillAngle.SkillH),
								BT.IsCanAttackNode:create(self.instance),
								BT.SetSkillTargetNode:create(self.instance),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance.bulletType == Hero10002_Define.BulletType.Blue or self.instance.bulletType == Hero10002_Define.BulletType.White
								end),
								BT.ConditionNode:create(function()
									return self.instance:GetBulletNow() > 0
								end),
								BT.IsStartSkillingNode:create(self.instance, Attack10002.HitMaxTime),
								BT.IsTargetWithinHeightNode:create(self.instance, Attack10002.shootHeight),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10002.SkillRange.SkillH, Attack10002.SkillAngle.SkillH),
								BT.IsCanAttackNode:create(self.instance),
								BT.SetSkillTargetNode:create(self.instance),
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

function Attack10002:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack10002
