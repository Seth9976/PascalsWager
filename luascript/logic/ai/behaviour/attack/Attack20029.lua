-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20029.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20029 = class("Attack20029")
Attack20029.static.SkillCd = {
	{
		Hero20029_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20029_Define.SkillType.SkillHP,
		1,
		true
	},
	{
		Hero20029_Define.SkillType.SkillNHP,
		1,
		true
	},
	{
		Hero20029_Define.SkillType.SkillD,
		3,
		false
	},
	{
		Hero20029_Define.SkillType.SkillS,
		15,
		true
	},
	{
		Hero20029_Define.SkillType.SkillNLP,
		1,
		true
	}
}
Attack20029.static.SkillProb = {
	SkillS = 0.4,
	SkillD = 0.7
}
Attack20029.static.SkillRange = {
	SkillNLP_Max = 6.5,
	SkillD = 4.5,
	SkillNHP_Min = 3.5,
	SkillNHP_Max = 6.5,
	SkillLLL = 4.5,
	SkillS = 8,
	SkillNLP_Min = 3.5,
	SkillHP_Min = 3.5,
	SkillHP_Max = 6.5
}
Attack20029.static.SkillAngle = {
	SkillD_1 = 90,
	SkillNHP = 45,
	SkillNLP = 30,
	SkillHP = 45,
	SkillD_2 = 10,
	SkillLLL = 45
}
Attack20029.static.ShapeshiftHpRate = 0.6
Attack20029.static.TurnAroundTime = 1.5
Attack20029.static.SkillHPTime = 0.6
Attack20029.static.SkillNHPTime = 0.6
Attack20029.static.SkillNLPTime = 0.6
Attack20029.static.SkillSRange = 12

function Attack20029:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.skillCDList = Attack20029.SkillCd
	self.attackNode = self:create()
end

function Attack20029:create()
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
						Hero20029_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20029_Define.SkillType.SkillHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillNHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20029_Define.SkillType.SkillNHP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillNLP,
						Hero20029_Define.SkillType.SkillNLPC
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20029_Define.SkillType.SkillLLL, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillLLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20029_Define.SkillType.SkillLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
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
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsDead() == false and target:IsShow() == true
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.alert.alertNode,
				self.threat.threatNode,
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20029_Define.SkillType.SkillHP, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20029_Define.SkillType.SkillNHP, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20029_Define.SkillType.SkillNLP, 3)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20029_Define.SkillType.SkillNLP, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20029_Define.SkillType.SkillS, 0),
							BT.CommonNode:create(function()
								local friendList = GameAI.GetSelectTarget(self.instance, GameAI.SkillTargetType.Friend)
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									local triggerValue = math.floor(self.instance:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger))

									if triggerValue > 0 then
										for k, v in pairs(friendList) do
											local friendTarget = v

											if friendTarget ~= nil and friendTarget:IsDead() == false and friendTarget:IsShow() == true and friendTarget:GetHeroId() == self.instance:GetHeroId() and friendTarget:GetBrain():GetAnimalTarget() == nil and GameAI.IsAnimalWithinDistance(self.instance, friendTarget:GetPosByWorldPos(), Attack20029.SkillSRange) then
												friendTarget:SetHatredTargetId(target:GetAnimalId())
											end
										end
									end
								end
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.StopMovementNode:create(self.instance)
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Skilling
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinAngleNode:create(self.instance, Attack20029.SkillAngle.SkillNLP),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillNLP_Min),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLP, 1, false),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
												}),
												BT.SequenceNode:create({
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLP, 1, false),
													BT.ConditionWaitNode:create(function()
														local target = self.instance:GetBrain():GetAnimalTarget()

														if target ~= nil and target:IsDead() == false and target:IsShow() == true then
															self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
														end

														return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
													end, Attack20029.SkillNLPTime),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
												})
											}),
											BT.CommonNode:create(function()
												self.instance:GetBrain().alertType = Alert.Type.None
											end)
										}),
										BT.CommonNode:create(function()
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
											end
										end)
									})
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetBrain().alertType == Alert.Type.Call
									end),
									BT.SelectorNode:create({
										BT.SelectorNode:create({
											BT.SequenceNode:create({
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillNLP_Min),
												BT.WaitNode:create(1),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLPC, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
											}),
											BT.SequenceNode:create({
												BT.IsStartSkillingNode:create(self.instance),
												BT.WaitNode:create(1),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLPC, 1, false),
												BT.ConditionWaitNode:create(function()
													local target = self.instance:GetBrain():GetAnimalTarget()

													if target ~= nil and target:IsDead() == false and target:IsShow() == true then
														self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
													end

													return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
												end, Attack20029.SkillNLPTime),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
											})
										}),
										BT.StopMovementNode:create(self.instance)
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20029_Define.SkillType.SkillLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20029_Define.SkillType.SkillD),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20029.SkillAngle.SkillD_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20029.SkillRange.SkillD),
									BT.GetRandomNode:create(Attack20029.SkillProb.SkillD, self.instance:GetAnimalId()),
									BT.StopMovementNode:create(self.instance),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()
										local targetPos

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											targetPos = target:GetPosByWorldPos()
											targetPos = self.instance:GetPosByWorldPos() - targetPos + self.instance:GetPosByWorldPos()
											targetPos.y = self.instance:GetPosByWorldPos().y

											self.instance:SetOrientation(targetPos)
										end

										return GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20029.SkillAngle.SkillD_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20029.TurnAroundTime),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20029_Define.SkillType.SkillS),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillS),
									BT.GetRandomNode:create(Attack20029.SkillProb.SkillS, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20029_Define.SkillType.SkillLLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillLLL, Attack20029.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20029_Define.SkillType.SkillNLP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.SelectorNode:create({
											BT.SequenceNode:create({
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillNLP_Min, Attack20029.SkillAngle.SkillNLP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLP, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
											}),
											BT.SequenceNode:create({
												BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20029.SkillRange.SkillNLP_Min, Attack20029.SkillRange.SkillNLP_Max, Attack20029.SkillAngle.SkillNLP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20029_Define.SkillType.SkillNLP, 1, false),
												BT.ConditionWaitNode:create(function()
													local target = self.instance:GetBrain():GetAnimalTarget()

													if target ~= nil and target:IsDead() == false and target:IsShow() == true then
														self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
													end

													return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
												end, Attack20029.SkillNLPTime),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
											})
										})
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20029_Define.SkillType.SkillHP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
										BT.SelectorNode:create({
											BT.SequenceNode:create({
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillHP_Min, Attack20029.SkillAngle.SkillHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20029_Define.SkillType.SkillHP, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20029.SkillRange.SkillHP_Min, Attack20029.SkillRange.SkillHP_Max, Attack20029.SkillAngle.SkillHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20029_Define.SkillType.SkillHP, 1, false),
												BT.ConditionWaitNode:create(function()
													local target = self.instance:GetBrain():GetAnimalTarget()

													if target ~= nil and target:IsDead() == false and target:IsShow() == true then
														self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
													end

													return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
												end, Attack20029.SkillHPTime),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											})
										})
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20029_Define.SkillType.SkillNHP),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsLeftNode:create(self.instance),
										BT.SelectorNode:create({
											BT.SequenceNode:create({
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20029.SkillRange.SkillNHP_Min, Attack20029.SkillAngle.SkillNHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20029_Define.SkillType.SkillNHP, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											}),
											BT.SequenceNode:create({
												BT.IsTargetHeightEnableNode:create(self.instance, GameAI.EnableHeight),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20029.SkillRange.SkillNHP_Min, Attack20029.SkillRange.SkillNHP_Max, Attack20029.SkillAngle.SkillNHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20029_Define.SkillType.SkillNHP, 1, false),
												BT.ConditionWaitNode:create(function()
													local target = self.instance:GetBrain():GetAnimalTarget()

													if target ~= nil and target:IsDead() == false and target:IsShow() == true then
														self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
													end

													return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
												end, Attack20029.SkillNHPTime),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											})
										})
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

function Attack20029:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20029
