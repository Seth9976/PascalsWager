-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20055.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20055 = class("Attack20055")
Attack20055.static.SkillCd = {
	{
		Hero20055_Define.SkillType.SkillNSS2,
		5,
		true
	},
	{
		Hero20055_Define.SkillType.SkillLL2,
		2,
		true
	},
	{
		Hero20055_Define.SkillType.SkillLP2,
		2,
		true
	},
	{
		Hero20055_Define.SkillType.SkillHP2,
		8,
		true
	},
	{
		Hero20055_Define.SkillType.SkillHH3,
		2,
		true
	},
	{
		Hero20055_Define.SkillType.SkillLL3,
		2,
		true
	},
	{
		Hero20055_Define.SkillType.SkillS3,
		6,
		true
	},
	{
		Hero20055_Define.SkillType.SkillSP3,
		4,
		true
	},
	{
		Hero20055_Define.SkillType.SkillLL4,
		2,
		true
	},
	{
		Hero20055_Define.SkillType.SkillHP4,
		5,
		true
	},
	{
		Hero20055_Define.SkillType.SkillSP4,
		5,
		true
	},
	{
		Hero20055_Define.SkillType.SkillL1,
		6,
		true
	},
	{
		Hero20055_Define.SkillType.SkillS1,
		10,
		true
	},
	{
		Hero20055_Define.SkillType.SkillSP2,
		6,
		true
	},
	{
		Hero20055_Define.SkillType.SkillH2,
		8,
		true
	},
	{
		Hero20055_Define.SkillType.SkillOP4,
		8,
		true
	},
	{
		Hero20055_Define.SkillType.SkillDP4,
		15,
		true
	},
	{
		Hero20055_Define.SkillType.SkillOP2,
		18,
		false
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		6,
		true
	}
}
Attack20055.static.SkillProb = {
	SkillNSS2 = 0.35,
	SkillH2 = 0.35,
	SkillOP4 = 0.35,
	SkillSP2 = 0.35,
	SkillHP4 = 0.35,
	SkillL1 = 0.35,
	SkillOP2 = 0.35,
	SkillS3 = 0.35,
	SkillHP2 = 0.35,
	SkillS1 = 0.35,
	DodgeAttack = 0.4,
	SkillSP3 = 0.35,
	SkillDP4 = 0.3,
	Dodge = 0.5
}
Attack20055.static.SkillRange = {
	SkillHP4_Max = 15,
	SkillL1 = 4,
	SkillHP4_Min = 7,
	SkillHH3_Min = 4.5,
	SkillHP2_Min = 4,
	SkillS3_Min = 3,
	SkillLL3_Max = 6,
	SkillSP4 = 5.5,
	DodgeAttack_Max = 9,
	SkillSP3_Max = 8,
	SkillSP2_Max = 12,
	SkillH2_Min = 6,
	SkillLL2_Min = 4.5,
	SkillHH3_Max = 6,
	SkillS3_Max = 18,
	SkillHP4 = 4,
	Dodge_Min = 6,
	SkillLL4_Max = 5.5,
	SkillLL2_Max = 5.5,
	SkillSP3_Min = 4,
	SkillLL4_Min = 4.5,
	DodgeAttack_Min = 5,
	SkillNSS2_Min = 4,
	SkillSP2_Min = 5,
	SkillOP4_Min = 2,
	SkillH2_Max = 13,
	SkillLL3_Min = 4.5,
	SkillHP2_Max = 15,
	SkillOP4_Max = 5.5,
	SkillLP2 = 4.5,
	Dodge_Max = 12,
	SkillNSS2_Max = 12,
	SkillSP3 = 5.5
}
Attack20055.static.SkillAngle = {
	SkillLL4 = 45,
	SkillLP2 = 45,
	SkillHP4 = 45,
	SkillSP2 = 30,
	SkillSP4 = 60,
	SkillH2 = 30,
	SkillLL3 = 45,
	DodgeAttack = 45,
	SkillDP4 = 45,
	SkillNSS2 = 30,
	SkillLL2 = 45,
	SkillL1 = 30,
	SkillS3 = 30,
	SkillHP2 = 30,
	SkillHH3 = 45,
	SkillOP4 = 45,
	SkillSP3 = 45,
	Dodge = 180
}
Attack20055.static.SkillHP2Time = 3
Attack20055.static.SkillSP4Time = 4
Attack20055.static.SkillHP4Time = 4
Attack20055.static.SkillSP2Time = 3
Attack20055.static.SkillDP4Time = 5
Attack20055.static.SkillOP2Time = 10
Attack20055.static.SkillDP4HPPercent = 0.7
Attack20055.static.BarrelRange = 2
Attack20055.static.BarrelAngle = 5
Attack20055.static.RunAwayTime = 10
Attack20055.static.ArriveDistance = 1.5
Attack20055.static.SkillPointIndexStart = 2
Attack20055.static.SkillPointIndexEnd = 8

function Attack20055:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack20055.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Slow
	self.isArrive = false
	self.changeCondition = Hero20055_Define.ConditionBarrel
	self.initCondition = Hero20055_Define.ConditionBarrel
	self.runAwayTime = 0
	self.isRunAway = false
	self.wanderPos = 0
	self.wanderIndex = 0
	self.isWander = false
	self.dodge = Dodge:new(instance, Attack20055.SkillRange.Dodge_Min, Attack20055.SkillRange.Dodge_Max, Attack20055.SkillAngle.Dodge, Attack20055.SkillProb.Dodge, AnimalBase_Define.SkillType.Dodge, Dodge.Aggressive.Low)
	self.attackNode = self:create()
end

function Attack20055:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillNSS2, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNSS2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL2, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL3, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL4, 1)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillLL2,
						Hero20055_Define.SkillType.SkillLL3,
						Hero20055_Define.SkillType.SkillLL4
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillHH3, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillHH3
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillL1,
						Hero20055_Define.SkillType.SkillLL2,
						Hero20055_Define.SkillType.SkillLL2,
						Hero20055_Define.SkillType.SkillLL3,
						Hero20055_Define.SkillType.SkillLL4
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillH2,
						Hero20055_Define.SkillType.SkillHH3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNDP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20055_Define.SkillType.SkillNDP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillND1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillS1,
						Hero20055_Define.SkillType.SkillS3
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNSS2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNLP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20055_Define.SkillType.SkillNLP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNL1
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
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
						Hero20055_Define.SkillType.SkillHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20055_Define.SkillType.SkillHP2, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillHP4
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20055_Define.SkillType.SkillHP4, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNH1,
						Hero20055_Define.SkillType.SkillHP2,
						Hero20055_Define.SkillType.SkillHP4
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillNHP1
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20055_Define.SkillType.SkillNHP1, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillSP4
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP4, 1, false),
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
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillSP2,
						Hero20055_Define.SkillType.SkillSP3,
						Hero20055_Define.SkillType.SkillSP4
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillDP4
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20055_Define.SkillType.SkillDP4, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 10),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillOP2,
						Hero20055_Define.SkillType.SkillOP4
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20055_Define.SkillType.SkillOP2, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 20),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20055_Define.SkillType.SkillLP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20055_Define.SkillType.SkillLP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetCondition() ~= Hero20055_Define.ConditionWeak
					end),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20055_Define.SkillType.SkillLP2, 1),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20055_Define.SkillType.SkillLL2, 2)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
						}, self.instance:GetAnimalId(), {
							3,
							1
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetCondition() == Hero20055_Define.ConditionBarrel
					end),
					self.dodge.dodgeNode
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetCondition() == Hero20055_Define.ConditionWeak
							end),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.None

								if self.instance:IsWithBarrel() == true then
									self.runAwayTime = 0
								end
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsHitByType(AnimalBase_Define.HitType.Execute) == true
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetLastCondition() == Hero20055_Define.ConditionBarrel
											end),
											BT.CommonNode:create(function()
												if self.initCondition == Hero20055_Define.ConditionSpoon then
													self.changeCondition = Hero20055_Define.ConditionHammer
												elseif self.initCondition == Hero20055_Define.ConditionHammer then
													self.changeCondition = Hero20055_Define.ConditionSpoon
												else
													local ret = MathHelper.getRandomResult(500, self.animalId)

													if ret == true then
														self.changeCondition = Hero20055_Define.ConditionSpoon
													else
														self.changeCondition = Hero20055_Define.ConditionHammer
													end
												end
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetLastCondition() == Hero20055_Define.ConditionSpoon
											end),
											BT.CommonNode:create(function()
												if self.initCondition == Hero20055_Define.ConditionBarrel then
													self.changeCondition = Hero20055_Define.ConditionHammer
												elseif self.initCondition == Hero20055_Define.ConditionHammer then
													self.changeCondition = Hero20055_Define.ConditionBarrel
												else
													local ret = MathHelper.getRandomResult(500, self.animalId)

													if ret == true then
														self.changeCondition = Hero20055_Define.ConditionBarrel
													else
														self.changeCondition = Hero20055_Define.ConditionHammer
													end
												end

												if self.instance:IsWithBarrel() == false then
													self.changeCondition = Hero20055_Define.ConditionHammer
												end
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetLastCondition() == Hero20055_Define.ConditionHammer
											end),
											BT.CommonNode:create(function()
												if self.initCondition == Hero20055_Define.ConditionBarrel then
													self.changeCondition = Hero20055_Define.ConditionSpoon
												elseif self.initCondition == Hero20055_Define.ConditionSpoon then
													self.changeCondition = Hero20055_Define.ConditionBarrel
												else
													local ret = MathHelper.getRandomResult(500, self.animalId)

													if ret == true then
														self.changeCondition = Hero20055_Define.ConditionSpoon
													else
														self.changeCondition = Hero20055_Define.ConditionBarrel
													end
												end

												if self.instance:IsWithBarrel() == false then
													self.changeCondition = Hero20055_Define.ConditionSpoon
												end
											end)
										})
									}),
									BT.CommonNode:create(function()
										self.initCondition = self.instance:GetLastCondition()

										self.instance:ChangeConditionOnHit(self.changeCondition)
										self.instance:SetMoveThroughBody(false)
									end)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsNeedChangeCondition() == true
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
									BT.StopMovementNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetLastCondition() == Hero20055_Define.ConditionBarrel
											end),
											BT.CommonNode:create(function()
												if self.initCondition == Hero20055_Define.ConditionSpoon then
													self.changeCondition = Hero20055_Define.ConditionHammer
												elseif self.initCondition == Hero20055_Define.ConditionHammer then
													self.changeCondition = Hero20055_Define.ConditionSpoon
												else
													local ret = MathHelper.getRandomResult(500, self.animalId)

													if ret == true then
														self.changeCondition = Hero20055_Define.ConditionSpoon
													else
														self.changeCondition = Hero20055_Define.ConditionHammer
													end
												end
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetLastCondition() == Hero20055_Define.ConditionSpoon
											end),
											BT.CommonNode:create(function()
												if self.initCondition == Hero20055_Define.ConditionBarrel then
													self.changeCondition = Hero20055_Define.ConditionHammer
												elseif self.initCondition == Hero20055_Define.ConditionHammer then
													self.changeCondition = Hero20055_Define.ConditionBarrel
												else
													local ret = MathHelper.getRandomResult(500, self.animalId)

													if ret == true then
														self.changeCondition = Hero20055_Define.ConditionBarrel
													else
														self.changeCondition = Hero20055_Define.ConditionHammer
													end
												end

												if self.instance:IsWithBarrel() == false then
													self.changeCondition = Hero20055_Define.ConditionHammer
												end
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:GetLastCondition() == Hero20055_Define.ConditionHammer
											end),
											BT.CommonNode:create(function()
												if self.initCondition == Hero20055_Define.ConditionBarrel then
													self.changeCondition = Hero20055_Define.ConditionSpoon
												elseif self.initCondition == Hero20055_Define.ConditionSpoon then
													self.changeCondition = Hero20055_Define.ConditionBarrel
												else
													local ret = MathHelper.getRandomResult(500, self.animalId)

													if ret == true then
														self.changeCondition = Hero20055_Define.ConditionSpoon
													else
														self.changeCondition = Hero20055_Define.ConditionBarrel
													end
												end

												if self.instance:IsWithBarrel() == false then
													self.changeCondition = Hero20055_Define.ConditionSpoon
												end
											end)
										})
									}),
									BT.CommonNode:create(function()
										self.initCondition = self.instance:GetLastCondition()

										self.instance:SetMoveThroughBody(false)
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.changeCondition == Hero20055_Define.ConditionBarrel
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.changeCondition == Hero20055_Define.ConditionSpoon
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.changeCondition == Hero20055_Define.ConditionHammer
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsWithBarrel() == true
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsChangeTimeArrival() == true
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.StopMovementNode:create(self.instance),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.instance:GetLastCondition() == Hero20055_Define.ConditionBarrel
													end),
													BT.CommonNode:create(function()
														if self.initCondition == Hero20055_Define.ConditionSpoon then
															self.changeCondition = Hero20055_Define.ConditionHammer
														elseif self.initCondition == Hero20055_Define.ConditionHammer then
															self.changeCondition = Hero20055_Define.ConditionSpoon
														else
															local ret = MathHelper.getRandomResult(500, self.animalId)

															if ret == true then
																self.changeCondition = Hero20055_Define.ConditionSpoon
															else
																self.changeCondition = Hero20055_Define.ConditionHammer
															end
														end
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.instance:GetLastCondition() == Hero20055_Define.ConditionSpoon
													end),
													BT.CommonNode:create(function()
														if self.initCondition == Hero20055_Define.ConditionBarrel then
															self.changeCondition = Hero20055_Define.ConditionHammer
														elseif self.initCondition == Hero20055_Define.ConditionHammer then
															self.changeCondition = Hero20055_Define.ConditionBarrel
														else
															local ret = MathHelper.getRandomResult(500, self.animalId)

															if ret == true then
																self.changeCondition = Hero20055_Define.ConditionBarrel
															else
																self.changeCondition = Hero20055_Define.ConditionHammer
															end
														end

														if self.instance:IsWithBarrel() == false then
															self.changeCondition = Hero20055_Define.ConditionHammer
														end
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.instance:GetLastCondition() == Hero20055_Define.ConditionHammer
													end),
													BT.CommonNode:create(function()
														if self.initCondition == Hero20055_Define.ConditionBarrel then
															self.changeCondition = Hero20055_Define.ConditionSpoon
														elseif self.initCondition == Hero20055_Define.ConditionSpoon then
															self.changeCondition = Hero20055_Define.ConditionBarrel
														else
															local ret = MathHelper.getRandomResult(500, self.animalId)

															if ret == true then
																self.changeCondition = Hero20055_Define.ConditionSpoon
															else
																self.changeCondition = Hero20055_Define.ConditionBarrel
															end
														end

														if self.instance:IsWithBarrel() == false then
															self.changeCondition = Hero20055_Define.ConditionSpoon
														end
													end)
												})
											}),
											BT.CommonNode:create(function()
												self.initCondition = self.instance:GetLastCondition()

												self.instance:SetMoveThroughBody(false)
											end),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.changeCondition == Hero20055_Define.ConditionBarrel
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.changeCondition == Hero20055_Define.ConditionSpoon
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.changeCondition == Hero20055_Define.ConditionHammer
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
												})
											})
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillL1),
											BT.IsStartSkillingNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillL1, Attack20055.SkillAngle.SkillL1),
											BT.GetRandomNode:create(Attack20055.SkillProb.SkillL1, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsChangeTimeArrival() == false
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.CommonNode:create(function()
												if self.isWander == false then
													local wanderIndexList = {}

													for i = Attack20055.SkillPointIndexStart, Attack20055.SkillPointIndexEnd do
														local wanderPos = self.instance:GetScene():GetSceneSkillPointPos(i)

														if wanderPos ~= nil and tonumber(self.wanderIndex) ~= i then
															table.insert(wanderIndexList, i)
														end
													end

													local target = self.instance:GetBrain():GetAnimalTarget()
													local targetPos = target:GetPosByWorldPos()

													table.sort(wanderIndexList, function(a, b)
														local disA = Vector3.DistanceSquare(self.instance:GetScene():GetSceneSkillPointPos(a), targetPos)
														local disB = Vector3.DistanceSquare(self.instance:GetScene():GetSceneSkillPointPos(b), targetPos)

														return disA < disB
													end)

													self.wanderIndex = wanderIndexList[1]
													self.wanderPos = self.instance:GetScene():GetSceneSkillPointPos(self.wanderIndex)
													self.isWander = true
												end

												if GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, Attack20055.ArriveDistance) == true then
													self.isArrive = true
												elseif GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, Attack20055.ArriveDistance) == false then
													self.isArrive = false
												end
											end),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.isArrive == true
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
													BT.CommonNode:create(function()
														self.isWander = false

														self.instance:SetMoveThroughBody(false)
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.isArrive == false
													end),
													BT.CommonNode:create(function()
														self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
														self.instance:SetTargetByWorldPos(self.wanderPos, true)
														self.instance:SetMoveThroughBody(true)
													end)
												})
											})
										})
									})
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsWithBarrel() == false
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsChangeTimeArrival() == true
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.StopMovementNode:create(self.instance),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.instance:GetLastCondition() == Hero20055_Define.ConditionBarrel
													end),
													BT.CommonNode:create(function()
														if self.initCondition == Hero20055_Define.ConditionSpoon then
															self.changeCondition = Hero20055_Define.ConditionHammer
														elseif self.initCondition == Hero20055_Define.ConditionHammer then
															self.changeCondition = Hero20055_Define.ConditionSpoon
														else
															local ret = MathHelper.getRandomResult(500, self.animalId)

															if ret == true then
																self.changeCondition = Hero20055_Define.ConditionSpoon
															else
																self.changeCondition = Hero20055_Define.ConditionHammer
															end
														end
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.instance:GetLastCondition() == Hero20055_Define.ConditionSpoon
													end),
													BT.CommonNode:create(function()
														if self.initCondition == Hero20055_Define.ConditionBarrel then
															self.changeCondition = Hero20055_Define.ConditionHammer
														elseif self.initCondition == Hero20055_Define.ConditionHammer then
															self.changeCondition = Hero20055_Define.ConditionBarrel
														else
															local ret = MathHelper.getRandomResult(500, self.animalId)

															if ret == true then
																self.changeCondition = Hero20055_Define.ConditionBarrel
															else
																self.changeCondition = Hero20055_Define.ConditionHammer
															end
														end

														if self.instance:IsWithBarrel() == false then
															self.changeCondition = Hero20055_Define.ConditionHammer
														end
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.instance:GetLastCondition() == Hero20055_Define.ConditionHammer
													end),
													BT.CommonNode:create(function()
														if self.initCondition == Hero20055_Define.ConditionBarrel then
															self.changeCondition = Hero20055_Define.ConditionSpoon
														elseif self.initCondition == Hero20055_Define.ConditionSpoon then
															self.changeCondition = Hero20055_Define.ConditionBarrel
														else
															local ret = MathHelper.getRandomResult(500, self.animalId)

															if ret == true then
																self.changeCondition = Hero20055_Define.ConditionSpoon
															else
																self.changeCondition = Hero20055_Define.ConditionBarrel
															end
														end

														if self.instance:IsWithBarrel() == false then
															self.changeCondition = Hero20055_Define.ConditionSpoon
														end
													end)
												})
											}),
											BT.CommonNode:create(function()
												self.initCondition = self.instance:GetLastCondition()

												self.instance:SetMoveThroughBody(false)
											end),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.changeCondition == Hero20055_Define.ConditionBarrel
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.changeCondition == Hero20055_Define.ConditionSpoon
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.changeCondition == Hero20055_Define.ConditionHammer
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
												})
											}),
											BT.CommonNode:create(function()
												self.isArrive = false
												self.isRunAway = false
												self.runAwayTime = 0
											end)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillL1),
											BT.IsStartSkillingNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillL1, Attack20055.SkillAngle.SkillL1),
											BT.GetRandomNode:create(Attack20055.SkillProb.SkillL1, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsChangeTimeArrival() == false and self.isRunAway == false
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.CommonNode:create(function()
												if self.isWander == false then
													local wanderIndexList = {}

													for i = Attack20055.SkillPointIndexStart, Attack20055.SkillPointIndexEnd do
														local wanderPos = self.instance:GetScene():GetSceneSkillPointPos(i)

														if wanderPos ~= nil and tonumber(self.wanderIndex) ~= i then
															table.insert(wanderIndexList, i)
														end
													end

													local target = self.instance:GetBrain():GetAnimalTarget()
													local targetPos = target:GetPosByWorldPos()

													table.sort(wanderIndexList, function(a, b)
														local disA = Vector3.DistanceSquare(self.instance:GetScene():GetSceneSkillPointPos(a), targetPos)
														local disB = Vector3.DistanceSquare(self.instance:GetScene():GetSceneSkillPointPos(b), targetPos)

														return disA < disB
													end)

													self.wanderIndex = wanderIndexList[1]
													self.wanderPos = self.instance:GetScene():GetSceneSkillPointPos(self.wanderIndex)
													self.isWander = true
												end

												if GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, Attack20055.ArriveDistance) == true then
													self.isArrive = true
												elseif GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, Attack20055.ArriveDistance) == false then
													self.isArrive = false
												end

												if self.runAwayTime > Attack20055.RunAwayTime then
													self.runAwayTime = 0
													self.isRunAway = true

													log("isArrive==========================================")
												end
											end),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.isArrive == true
													end),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
													BT.CommonNode:create(function()
														self.isWander = false

														self.instance:SetMoveThroughBody(false)
													end)
												}),
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														return self.isArrive == false
													end),
													BT.CommonNode:create(function()
														self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
														self.instance:SetTargetByWorldPos(self.wanderPos, true)
														self.instance:SetMoveThroughBody(true)

														self.runAwayTime = self.runAwayTime + Time.deltaTime

														log("self.runAwayTime============================" .. self.runAwayTime)
													end)
												})
											})
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsChangeTimeArrival() == false and self.isRunAway == true
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetBarrelPosition(), Attack20055.BarrelRange)

														return isWithinRange == true
													end),
													BT.CommonNode:create(function()
														self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
													end),
													BT.StopMovementNode:create(self.instance),
													BT.SelectorNode:create({
														BT.SequenceNode:create({
															BT.ConditionNode:create(function()
																local isWithinAngle = GameAI.IsAnimalWithinAngle(self.instance, self.instance:GetBarrelPosition(), Attack20055.BarrelAngle)

																return isWithinAngle == true
															end),
															BT.StopMovementNode:create(self.instance),
															BT.SelectorNode:create({
																BT.SequenceNode:create({
																	BT.ConditionNode:create(function()
																		return self.instance:GetLastCondition() == Hero20055_Define.ConditionBarrel
																	end),
																	BT.CommonNode:create(function()
																		if self.initCondition == Hero20055_Define.ConditionSpoon then
																			self.changeCondition = Hero20055_Define.ConditionHammer
																		elseif self.initCondition == Hero20055_Define.ConditionHammer then
																			self.changeCondition = Hero20055_Define.ConditionSpoon
																		else
																			local ret = MathHelper.getRandomResult(500, self.animalId)

																			if ret == true then
																				self.changeCondition = Hero20055_Define.ConditionSpoon
																			else
																				self.changeCondition = Hero20055_Define.ConditionHammer
																			end
																		end
																	end)
																}),
																BT.SequenceNode:create({
																	BT.ConditionNode:create(function()
																		return self.instance:GetLastCondition() == Hero20055_Define.ConditionSpoon
																	end),
																	BT.CommonNode:create(function()
																		if self.initCondition == Hero20055_Define.ConditionBarrel then
																			self.changeCondition = Hero20055_Define.ConditionHammer
																		elseif self.initCondition == Hero20055_Define.ConditionHammer then
																			self.changeCondition = Hero20055_Define.ConditionBarrel
																		else
																			local ret = MathHelper.getRandomResult(500, self.animalId)

																			if ret == true then
																				self.changeCondition = Hero20055_Define.ConditionBarrel
																			else
																				self.changeCondition = Hero20055_Define.ConditionHammer
																			end
																		end
																	end)
																}),
																BT.SequenceNode:create({
																	BT.ConditionNode:create(function()
																		return self.instance:GetLastCondition() == Hero20055_Define.ConditionHammer
																	end),
																	BT.CommonNode:create(function()
																		if self.initCondition == Hero20055_Define.ConditionBarrel then
																			self.changeCondition = Hero20055_Define.ConditionSpoon
																		elseif self.initCondition == Hero20055_Define.ConditionSpoon then
																			self.changeCondition = Hero20055_Define.ConditionBarrel
																		else
																			local ret = MathHelper.getRandomResult(500, self.animalId)

																			if ret == true then
																				self.changeCondition = Hero20055_Define.ConditionSpoon
																			else
																				self.changeCondition = Hero20055_Define.ConditionBarrel
																			end
																		end
																	end)
																})
															}),
															BT.CommonNode:create(function()
																self.initCondition = self.instance:GetLastCondition()

																self.instance:SetMoveThroughBody(false)
															end),
															BT.SelectorNode:create({
																BT.SequenceNode:create({
																	BT.ConditionNode:create(function()
																		return self.changeCondition == Hero20055_Define.ConditionBarrel
																	end),
																	BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20055_Define.SkillType.SkillNLP1, 1, false),
																	BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
																}),
																BT.SequenceNode:create({
																	BT.ConditionNode:create(function()
																		return self.changeCondition == Hero20055_Define.ConditionSpoon
																	end),
																	BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20055_Define.SkillType.SkillNDP1, 1, false),
																	BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
																}),
																BT.SequenceNode:create({
																	BT.ConditionNode:create(function()
																		return self.changeCondition == Hero20055_Define.ConditionHammer
																	end),
																	BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20055_Define.SkillType.SkillNHP1, 1, false),
																	BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
																})
															}),
															BT.CommonNode:create(function()
																self.isArrive = false
																self.isRunAway = false
																self.runAwayTime = 0
															end)
														}),
														BT.CommonNode:create(function()
															self.instance:SetOrientation(self.instance:GetBarrelPosition())
														end)
													})
												}),
												BT.CommonNode:create(function()
													self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
													self.instance:SetTargetByWorldPos(self.instance:GetBarrelPosition(), true)
													self.instance:SetMoveThroughBody(true)
												end)
											})
										})
									})
								})
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetCondition() == Hero20055_Define.ConditionBarrel
							end),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Default
								self.runAwayTime = 0

								self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.ConditionNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHitByType(AnimalBase_Define.HitType.Freeze) then
											return true
										end

										return false
									end),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20055_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20055.SkillOP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.RandomNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillLP2),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20055_Define.SkillType.SkillLP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillLL2_Max),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL2, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillLL2_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillNSS2, 1),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= 0.5
									end),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillNSS2_Min, Attack20055.SkillRange.SkillNSS2_Max, Attack20055.SkillAngle.SkillNSS2),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillSP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillSP2_Min, Attack20055.SkillRange.SkillSP2_Max, Attack20055.SkillAngle.SkillSP2),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillSP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return target ~= nil and target:IsHitBySkill(self.instance, Hero20055_Define.SkillType.SkillSP2, 0) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20055.SkillSP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillH2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillH2_Min, Attack20055.SkillRange.SkillH2_Max, Attack20055.SkillAngle.SkillH2),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillH2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillNSS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillNSS2_Min, Attack20055.SkillRange.SkillNSS2_Max, Attack20055.SkillAngle.SkillNSS2),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillNSS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillHP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillHP2_Min, Attack20055.SkillRange.SkillHP2_Max, Attack20055.SkillAngle.SkillHP2),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillHP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20055_Define.SkillType.SkillHP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20055.SkillHP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillOP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillH2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20055_Define.SkillType.SkillOP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20055.SkillOP2Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, AnimalBase_Define.SkillType.Dodge),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.DodgeAttack_Min, Attack20055.SkillRange.DodgeAttack_Max, Attack20055.SkillAngle.DodgeAttack),
									BT.GetRandomNode:create(Attack20055.SkillProb.DodgeAttack, self.instance:GetAnimalId()),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
									BT.CommonNode:create(function()
										self.dodge:SetDodgeType(Dodge.DodgeType.Forward)
									end)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillLL2_Min, Attack20055.SkillAngle.SkillLL2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillLP2),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillLP2, Attack20055.SkillAngle.SkillLP2),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20055_Define.SkillType.SkillLP2, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetCondition() == Hero20055_Define.ConditionSpoon
							end),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Default
								self.runAwayTime = 0

								self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillSP3, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillSP3),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillS3, 1),
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillSP3),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillSP3),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillSP3, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillHH3, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillHH3_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL3, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillLL3_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillS3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillS3_Min, Attack20055.SkillRange.SkillS3_Max, Attack20055.SkillAngle.SkillS3),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillS3, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillSP3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillSP3_Min, Attack20055.SkillRange.SkillSP3_Max, Attack20055.SkillAngle.SkillSP3),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillSP3, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillHH3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillHH3_Min, Attack20055.SkillAngle.SkillHH3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillLL3_Min, Attack20055.SkillAngle.SkillLL3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetCondition() == Hero20055_Define.ConditionHammer
							end),
							BT.CommonNode:create(function()
								self.followType = Follow.Type.Default
								self.runAwayTime = 0

								self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillOP4, 3),
									BT.CommonNode:create(function()
										self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(8), false)
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL4, 1),
									BT.IsSkillComboNode:create(self.instance),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20055.SkillRange.SkillLL4_Max),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillOP4),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillOP4_Min, Attack20055.SkillRange.SkillOP4_Max),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillOP4, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20055_Define.SkillType.SkillOP4, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillHP4),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20055.SkillRange.SkillHP4_Min, Attack20055.SkillRange.SkillHP4_Max, Attack20055.SkillAngle.SkillHP4),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillHP4, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20055_Define.SkillType.SkillHP4, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20055.SkillRange.SkillHP4) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20055.SkillHP4Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillDP4),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
										local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
										local rate = nowHp / hpMax

										return rate <= Attack20055.SkillDP4HPPercent
									end),
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20055.SkillAngle.SkillDP4),
									BT.GetRandomNode:create(Attack20055.SkillProb.SkillDP4, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20055_Define.SkillType.SkillDP4, 1, false),
									BT.ConditionWaitNode:create(function()
										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20055.SkillDP4Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillLL4),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillLL4_Min, Attack20055.SkillAngle.SkillLL4),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20055_Define.SkillType.SkillSP4),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20055.SkillRange.SkillSP4, Attack20055.SkillAngle.SkillSP4),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20055_Define.SkillType.SkillSP4, 1, false),
										BT.ConditionWaitNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
											end

											return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
										end, Attack20055.SkillSP4Time),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
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

function Attack20055:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20055
