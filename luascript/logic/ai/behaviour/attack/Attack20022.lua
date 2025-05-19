-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20022.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/CircleRound")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20022 = class("Attack20022")
Attack20022.static.SkillCd = {
	{
		Hero20022_Define.SkillType.SkillS1,
		5,
		true
	},
	{
		Hero20022_Define.SkillType.SkillS2,
		6,
		true
	},
	{
		Hero20022_Define.SkillType.SkillSP,
		20,
		false
	},
	{
		Hero20022_Define.SkillType.SkillNH1,
		4,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNH2,
		5,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNHP1,
		4,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNHP2,
		8,
		true
	},
	{
		Hero20022_Define.SkillType.SkillOP,
		15,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNOP,
		20,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNO,
		20,
		true
	},
	{
		Hero20022_Define.SkillType.SkillO,
		12,
		true
	},
	{
		Hero20022_Define.SkillType.SkillDownShoot,
		12,
		true
	},
	{
		Hero20022_Define.SkillType.SkillGiantHand,
		12,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNL,
		4,
		true
	},
	{
		Hero20022_Define.SkillType.SkillND,
		4,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNDP,
		4,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNLP,
		4,
		true
	},
	{
		Hero20022_Define.SkillType.SkillL,
		1.5,
		true
	},
	{
		Hero20022_Define.SkillType.SkillHH,
		1.5,
		true
	},
	{
		Hero20022_Define.SkillType.SkillLPLL,
		1.5,
		true
	},
	{
		Hero20022_Define.SkillType.SkillNS,
		3,
		true
	},
	{
		Hero20022_Define.SkillType.SkillD,
		4,
		true
	}
}
Attack20022.static.SkillProb = {
	SkillNHP1 = 0.55,
	SkillS2 = 0.45,
	SkillND = 0.65,
	SkillNLP = 0.45,
	SkillNHP2 = 0.4,
	SkillNL = 0.65,
	SkillS1 = 0.45,
	SkillNDP = 0.65,
	SkillOP = 0.6,
	SkillD = 0.4,
	SkillNH2 = 0.4,
	SkillNH1 = 0.45,
	SkillNOP_SkillNO = 0.55,
	SkillSP = 0.3
}
Attack20022.static.SkillRange = {
	SkillNHP1_Max = 15,
	SkillNH1 = 6,
	SkillS1_Min = 5,
	SkillNHP1_Min = 5,
	SkillHH = 5.5,
	SkillNL = 5,
	SkillD_Max = 5,
	SkillNLP_Min = 4,
	SkillNLP_Max = 7,
	SkillNHP2_Min = 6,
	SkillNHP2_Max = 20,
	SkillNDP = 4.5,
	SkillLPLL = 7,
	SkillNHP2 = 4,
	SkillNH2 = 12,
	SkillSP = 10,
	SkillL = 6.5,
	SkillNS = 6.5,
	SkillND = 4.5,
	SkillS1_Max = 20,
	SkillD_Min = 5,
	SkillS2_Max = 20,
	SkillNLP = 4,
	SkillS2_Min = 5
}
Attack20022.static.SkillAngle = {
	SkillOP1 = 110,
	SkillD = 55,
	SkillNH2 = 70,
	SkillNH1 = 30,
	SkillHH = 60,
	SkillNDP = 60,
	SkillNL_2 = 10,
	SkillOP2 = 10,
	SkillNL_1 = 110,
	SkillNHP1 = 45,
	SkillNS = 65,
	SkillLPLL = 60,
	SkillNHP2 = 45,
	SkillNOP_SkillNO = 10,
	SkillSP = 180,
	SkillL = 60,
	SkillS2 = 60,
	SkillND = 60,
	SkillO = 10,
	SkillS1 = 60,
	SkillNLP = 60
}
Attack20022.static.CircleRoundTimeRatio = 3
Attack20022.static.SkillNHP1Time = 1
Attack20022.static.SkillNHP1PlayTimes = 2
Attack20022.static.SkillNHP2Time1 = 2.5
Attack20022.static.SkillNHP2Time2 = 1
Attack20022.static.SkillNHP2PlayTimes = 2
Attack20022.static.SkillNLPTime = 1
Attack20022.static.SkillSPTime = 5
Attack20022.static.TurnAroundTime = 2
Attack20022.static.MoveDirRadioMin = 0.5
Attack20022.static.MoveDirRadioMiddle = 1
Attack20022.static.MoveDirRadioMax = 1.5
Attack20022.static.CheckMoveDistance = 2.5

function Attack20022:initialize(instance)
	self.instance = instance
	self.circleRound = CircleRound:new(instance, CircleRound.CircleRoundType.Right, Attack20022.CircleRoundTimeRatio)
	self.dodge = Dodge:new(instance, Attack20022.SkillRange.SkillD_Min, Attack20022.SkillRange.SkillD_Max, Attack20022.SkillAngle.SkillD, Attack20022.SkillProb.SkillD, Hero20022_Define.SkillType.SkillD)
	self.skillNHP1PlayTimes = 0
	self.skillNHP2PlayTimes = 0
	self.skillCDList = Attack20022.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.MoveDirRadio = Attack20022.MoveDirRadioMiddle
	self.comboSkill = 0
	self.lastJumpSkill = 0
	self.attackNode = self:create()
end

function Attack20022:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 1),
						BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 2)
					}),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillLPLL
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20022_Define.SkillType.SkillNLP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNH1,
						Hero20022_Define.SkillType.SkillNH2
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20022_Define.SkillType.SkillOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20022_Define.SkillType.SkillNOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNHP1,
						Hero20022_Define.SkillType.SkillNHP2
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20022_Define.SkillType.SkillNHP1, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillS1,
						Hero20022_Define.SkillType.SkillS2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillSP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20022_Define.SkillType.SkillSP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillND
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNDP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20022_Define.SkillType.SkillNDP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillNS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillLPLL
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20022_Define.SkillType.SkillLPLL, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillHH, 1),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillHH
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20022_Define.SkillType.SkillHH
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
					BT.IsGradeNode:create(self.instance, 1),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.SelectorNode:create({
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 3),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillHH, 2),
								BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillNH1, 1)
							}),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound)
							}, self.instance:GetAnimalId())
						}),
						BT.SequenceNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillL, 1),
							BT.RandomNode:create({
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound)
							}, self.instance:GetAnimalId())
						})
					})
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.SequenceNode:create({
						BT.SelectorNode:create({
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 3),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillHH, 2),
							BT.IsSkillIndexChangeNode:create(self.instance, Hero20022_Define.SkillType.SkillNH2, 1)
						}),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge)
						}, self.instance:GetAnimalId(), {
							2,
							1
						})
					})
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillSP, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillS1, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillS2, 0),
						BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillL, 0)
					}),
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil then
							local moveDir = target:GetPosByWorldPos() - self.instance:GetPosByWorldPos()

							moveDir:SetNormalize()

							local vertDir = Vector3.zero

							vertDir:Set(moveDir.z, moveDir.y, -moveDir.x)
							moveDir:Add(vertDir:Mul(self.MoveDirRadio))

							local movePos = Vector3.zero

							movePos:SetVector3(self.instance:GetPosByWorldPos())
							movePos:Add(moveDir)

							movePos.y = self.instance:GetGroundY()

							self.instance:SetTargetByWorldPos(movePos, false)
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
						end

						return false
					end)
				}),
				self.circleRound.circleRoundNode,
				self.dodge.dodgeNode,
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
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillOP, 2),
							BT.CommonNode:create(function()
								self.comboSkill = Hero20022_Define.SkillType.SkillO
							end)
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillD, 1),
							BT.ConditionNode:create(function()
								return self.comboSkill ~= Hero20022_Define.SkillType.SkillS1
							end),
							BT.RandomNode:create({
								BT.CommonNode:create(function()
									self.comboSkill = Hero20022_Define.SkillType.SkillS1
								end),
								BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound)
							}, self.instance:GetAnimalId(), {
								2,
								1
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillD, 1),
							BT.ConditionNode:create(function()
								return self.comboSkill ~= Hero20022_Define.SkillType.SkillS2
							end),
							BT.CommonNode:create(function()
								self.comboSkill = Hero20022_Define.SkillType.SkillS2
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20022_Define.SkillType.SkillS1
									end),
									BT.SelectorNode:create({
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillS1_Min, Attack20022.SkillRange.SkillS1_Max, Attack20022.SkillAngle.SkillS1),
										BT.ConditionNode:create(function()
											self.comboSkill = 0

											return false
										end)
									}),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
									BT.CommonNode:create(function()
										self.MoveDirRadio = Attack20022.MoveDirRadioMin
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillHH, 1),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 1),
												BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 2)
											}),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillNLP, 2),
											BT.IsSkillComboNode:create(self.instance),
											BT.IsHitBySkillNode:create(self.instance, Hero20022_Define.SkillType.SkillNLP, 2),
											BT.RandomSequenceNode:create({
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											}, self.instance:GetAnimalId())
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillNS, 1),
											BT.IsSkillComboNode:create(self.instance),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillNH1),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillNHP1, 3),
											BT.IsSkillComboNode:create(self.instance),
											BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
											BT.ConditionNode:create(function()
												return self.skillNHP1PlayTimes > 0 and self.skillNHP1PlayTimes < Attack20022.SkillNHP1PlayTimes
											end),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNHP1_Max, Attack20022.SkillAngle.SkillNHP1),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20022_Define.SkillType.SkillNHP1, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
													self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
												end

												if self.instance:IsHit() == true then
													self.skillNHP1PlayTimes = 0
												end

												return GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20022.CheckMoveDistance) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.SkillNHP1Time),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy),
											BT.CommonNode:create(function()
												if self.instance:IsSkillingById(Hero20022_Define.SkillType.SkillNHP1, 0) then
													self.skillNHP1PlayTimes = self.skillNHP1PlayTimes + 1
												end

												if self.skillNHP1PlayTimes >= Attack20022.SkillNHP1PlayTimes then
													self.skillNHP1PlayTimes = 0
												end
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillSP),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillS1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillSP, Attack20022.SkillAngle.SkillSP),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillSP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20022_Define.SkillType.SkillSP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.MoveDirRadio = Attack20022.MoveDirRadioMax

											local moveDir = target:GetPosByWorldPos() - self.instance:GetPosByWorldPos()

											moveDir:SetNormalize()

											local vertDir = Vector3.zero

											vertDir:Set(moveDir.z, moveDir.y, -moveDir.x)
											moveDir:Add(vertDir:Mul(self.MoveDirRadio))

											local movePos = Vector3.zero

											movePos:SetVector3(self.instance:GetPosByWorldPos())
											movePos:Add(moveDir)

											movePos.y = self.instance:GetGroundY()

											self.instance:SetTargetByWorldPos(movePos, false)
											self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20022.SkillSPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillS1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillS1_Min, Attack20022.SkillRange.SkillS1_Max, Attack20022.SkillAngle.SkillS1),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillS1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
									BT.CommonNode:create(function()
										self.MoveDirRadio = Attack20022.MoveDirRadioMax
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNLP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNLP, Attack20022.SkillAngle.SkillNLP),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillNLP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, 0, 0, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillNLP_Min, Attack20022.SkillRange.SkillNLP_Max, Attack20022.SkillAngle.SkillNLP),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillNLP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20022_Define.SkillType.SkillNLP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.SkillNLPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNH1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNH1, Attack20022.SkillAngle.SkillNH1),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNH1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNHP1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillNHP1_Min, Attack20022.SkillRange.SkillNHP1_Max, Attack20022.SkillAngle.SkillNHP1),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNHP1, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20022_Define.SkillType.SkillNHP1, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
											self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
										end

										if self.instance:IsHit() == true then
											self.skillNHP1PlayTimes = 0
										end

										return GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20022.CheckMoveDistance) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20022.SkillNHP1Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy),
									BT.CommonNode:create(function()
										if self.instance:IsSkillingById(Hero20022_Define.SkillType.SkillNHP1, 0) then
											self.skillNHP1PlayTimes = self.skillNHP1PlayTimes + 1
										end

										if self.skillNHP1PlayTimes >= Attack20022.SkillNHP1PlayTimes then
											self.skillNHP1PlayTimes = 0
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNL),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillND),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNDP),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20022.SkillAngle.SkillNL_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillNL),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNL, self.instance:GetAnimalId()),
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

										return GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20022.SkillAngle.SkillNL_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20022.TurnAroundTime),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNL),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillND),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNDP),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsLeftNode:create(self.instance),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20022.SkillAngle.SkillND)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillND),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillND, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										}),
										BT.SequenceNode:create({
											BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20022.SkillAngle.SkillNDP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillNDP),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillNDP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20022_Define.SkillType.SkillNDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										})
									})
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.ConditionNode:create(function()
											return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
										end),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillL, Attack20022.SkillAngle.SkillL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
										BT.CommonNode:create(function()
											self.MoveDirRadio = Attack20022.MoveDirRadioMiddle
										end)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillLPLL, Attack20022.SkillAngle.SkillLPLL),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20022_Define.SkillType.SkillLPLL, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillHH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillHH, Attack20022.SkillAngle.SkillHH),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNS),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNS, Attack20022.SkillAngle.SkillNS),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20022_Define.SkillType.SkillO
									end),
									BT.SelectorNode:create({
										BT.IsSkillingNode:create(self.instance),
										BT.SequenceNode:create({
											BT.StopMovementNode:create(self.instance),
											BT.ConditionWaitNode:create(function()
												if self.instance:IsHit() == true then
													self.comboSkill = 0

													return true
												end

												local tmpTargetPos = self.instance:GetScene():GetSceneSkillPointPos(7):Clone()

												tmpTargetPos.y = self.instance:GetPosByWorldPos().y

												self.instance:SetTargetByWorldPos(tmpTargetPos, false)

												return GameAI.IsAnimalWithinAngle(self.instance, tmpTargetPos, Attack20022.SkillAngle.SkillO) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.TurnAroundTime),
											BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										})
									})
								}),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											return self.comboSkill == Hero20022_Define.SkillType.SkillNO
										end),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
									}),
									BT.SequenceNode:create({
										BT.ConditionNode:create(function()
											return self.comboSkill == Hero20022_Define.SkillType.SkillNOP
										end),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20022_Define.SkillType.SkillNOP, 1, false, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
									})
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.comboSkill == Hero20022_Define.SkillType.SkillS2
									end),
									BT.SelectorNode:create({
										BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillS2_Min, Attack20022.SkillRange.SkillS2_Max, Attack20022.SkillAngle.SkillS2),
										BT.ConditionNode:create(function()
											self.comboSkill = 0

											return false
										end)
									}),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
									BT.CommonNode:create(function()
										self.MoveDirRadio = Attack20022.MoveDirRadioMiddle
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillHH, 1),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 1),
												BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL, 2)
											}),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillNLP, 2),
											BT.IsSkillComboNode:create(self.instance),
											BT.IsHitBySkillNode:create(self.instance, Hero20022_Define.SkillType.SkillNLP, 2),
											BT.RandomSequenceNode:create({
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											}, self.instance:GetAnimalId())
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillNS, 1),
											BT.IsSkillComboNode:create(self.instance),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillNH2),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingByIdNode:create(self.instance, Hero20022_Define.SkillType.SkillNHP2, 3),
											BT.IsSkillComboNode:create(self.instance),
											BT.ConditionNode:create(function()
												return self.skillNHP2PlayTimes > 0 and self.skillNHP2PlayTimes < Attack20022.SkillNHP2PlayTimes
											end),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20022_Define.SkillType.SkillNHP2, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
												end

												local skillIndex, skillCombo = self.instance:GetSkillingData()

												if self.instance:IsHit() == true then
													self.skillNHP2PlayTimes = 0
												end

												return target ~= nil and target:IsHitBySkill(self.instance, Hero20022_Define.SkillType.SkillNHP2, 0) == true and skillIndex == Hero20022_Define.SkillType.SkillNHP2 and skillCombo == 2 and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20022.SkillRange.SkillNHP2) == true or GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20022.CheckMoveDistance) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.SkillNHP2Time2),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy),
											BT.CommonNode:create(function()
												if self.instance:IsSkillingById(Hero20022_Define.SkillType.SkillNHP2, 0) then
													self.skillNHP2PlayTimes = self.skillNHP2PlayTimes + 1
												end

												if self.skillNHP2PlayTimes >= Attack20022.SkillNHP2PlayTimes then
													self.skillNHP2PlayTimes = 0
												end
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillOP),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillO),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillGiantHand),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillDownShoot),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										local tmpTargetPos = self.instance:GetScene():GetSceneSkillPointPos(9):Clone()
										local tmpDir = self.instance:GetPosByWorldPos() - tmpTargetPos
										local angle = Vector3.Angle(self.instance:GetForward(), tmpDir)

										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed and angle < Attack20022.SkillAngle.SkillOP1
									end),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillOP, self.instance:GetAnimalId()),
									BT.StopMovementNode:create(self.instance),
									BT.StopSkillNode:create(self.instance),
									BT.ConditionWaitNode:create(function()
										if self.instance:IsHit() == true then
											self.comboSkill = 0

											return true
										end

										local tmpTargetPos = self.instance:GetScene():GetSceneSkillPointPos(9):Clone()

										tmpTargetPos = self.instance:GetPosByWorldPos() - tmpTargetPos + self.instance:GetPosByWorldPos()
										tmpTargetPos.y = self.instance:GetPosByWorldPos().y

										self.instance:SetOrientation(tmpTargetPos)

										return GameAI.IsAnimalWithinAngle(self.instance, tmpTargetPos, Attack20022.SkillAngle.SkillOP2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20022.TurnAroundTime),
									BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20022_Define.SkillType.SkillOP, 1, false, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNOP),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNO),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillO),
									BT.IsStartSkillingNode:create(self.instance),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
									end),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNOP_SkillNO, self.instance:GetAnimalId()),
									BT.StopMovementNode:create(self.instance),
									BT.StopSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.lastJumpSkill == 0
											end),
											BT.RandomNode:create({
												BT.CommonNode:create(function()
													self.comboSkill = Hero20022_Define.SkillType.SkillNO
													self.lastJumpSkill = Hero20022_Define.SkillType.SkillNO
												end),
												BT.CommonNode:create(function()
													self.comboSkill = Hero20022_Define.SkillType.SkillNOP
													self.lastJumpSkill = Hero20022_Define.SkillType.SkillNOP
												end)
											}, self.instance:GetAnimalId())
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.lastJumpSkill == Hero20022_Define.SkillType.SkillNO
											end),
											BT.CommonNode:create(function()
												self.comboSkill = Hero20022_Define.SkillType.SkillNOP
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.lastJumpSkill == Hero20022_Define.SkillType.SkillNOP
											end),
											BT.CommonNode:create(function()
												self.comboSkill = Hero20022_Define.SkillType.SkillNO
											end)
										})
									}),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.comboSkill == Hero20022_Define.SkillType.SkillNO
											end),
											BT.ConditionWaitNode:create(function()
												local tmpTargetPos = self.instance:GetScene():GetSceneSkillPointPos(4):Clone()

												tmpTargetPos.y = self.instance:GetPosByWorldPos().y

												self.instance:SetOrientation(tmpTargetPos)

												return GameAI.IsAnimalWithinAngle(self.instance, tmpTargetPos, Attack20022.SkillAngle.SkillNOP_SkillNO) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.TurnAroundTime),
											BT.NotDecorator:create(BT.IsHitNode:create(self.instance))
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.comboSkill == Hero20022_Define.SkillType.SkillNOP
											end),
											BT.ConditionWaitNode:create(function()
												local tmpTargetPos = self.instance:GetScene():GetSceneSkillPointPos(1):Clone()

												tmpTargetPos.y = self.instance:GetPosByWorldPos().y

												self.instance:SetOrientation(tmpTargetPos)

												return GameAI.IsAnimalWithinAngle(self.instance, tmpTargetPos, Attack20022.SkillAngle.SkillNOP_SkillNO) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.TurnAroundTime),
											BT.NotDecorator:create(BT.IsHitNode:create(self.instance))
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNHP2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillNHP2_Min, Attack20022.SkillRange.SkillNHP2_Max, Attack20022.SkillAngle.SkillNHP2),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNHP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20022_Define.SkillType.SkillNHP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
										end

										local skillIndex, skillCombo = self.instance:GetSkillingData()

										if self.instance:IsHit() == true then
											self.skillNHP2PlayTimes = 0
										end

										return target ~= nil and target:IsHitBySkill(self.instance, Hero20022_Define.SkillType.SkillNHP2, 0) == true and skillIndex == Hero20022_Define.SkillType.SkillNHP2 and skillCombo == 2 and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20022.SkillRange.SkillNHP2) == true or GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), Attack20022.CheckMoveDistance) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20022.SkillNHP2Time1),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy),
									BT.CommonNode:create(function()
										if self.instance:IsSkillingById(Hero20022_Define.SkillType.SkillNHP2, 0) then
											self.skillNHP2PlayTimes = self.skillNHP2PlayTimes + 1
										end

										if self.skillNHP2PlayTimes >= Attack20022.SkillNHP2PlayTimes then
											self.skillNHP2PlayTimes = 0
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillS2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.ConditionNode:create(function()
										return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionRunSpeed
									end),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillS2_Min, Attack20022.SkillRange.SkillS2_Max, Attack20022.SkillAngle.SkillS2),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
									BT.CommonNode:create(function()
										self.MoveDirRadio = Attack20022.MoveDirRadioMax
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNH2),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNH2, Attack20022.SkillAngle.SkillNH2),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNH2, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNLP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNLP, Attack20022.SkillAngle.SkillNLP),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillNLP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, 0, 0, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										}),
										BT.SequenceNode:create({
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20022.SkillRange.SkillNLP_Min, Attack20022.SkillRange.SkillNLP_Max, Attack20022.SkillAngle.SkillNLP),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillNLP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20022_Define.SkillType.SkillNLP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												if target ~= nil and target:IsDead() == false and target:IsShow() == true then
													self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
												end

												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20022.SkillNLPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNL),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillND),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNDP),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.IsBehindNode:create(self.instance),
									BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20022.SkillAngle.SkillNL_1)),
									BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillNL),
									BT.GetRandomNode:create(Attack20022.SkillProb.SkillNL, self.instance:GetAnimalId()),
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

										return GameAI.IsAnimalWithinAngle(self.instance, targetPos, Attack20022.SkillAngle.SkillNL_2) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20022.TurnAroundTime),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNL),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillND),
									BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNDP),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsLeftNode:create(self.instance),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20022.SkillAngle.SkillND)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillND),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillND, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										}),
										BT.SequenceNode:create({
											BT.NotDecorator:create(BT.IsLeftNode:create(self.instance)),
											BT.NotDecorator:create(BT.IsTargetWithinAngleNode:create(self.instance, Attack20022.SkillAngle.SkillNDP)),
											BT.IsTargetWithinRangeNode:create(self.instance, Attack20022.SkillRange.SkillNDP),
											BT.GetRandomNode:create(Attack20022.SkillProb.SkillNDP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero20022_Define.SkillType.SkillNDP, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
										})
									})
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.ConditionNode:create(function()
											return self.instance:GetMoveSpeed() <= AnimalBase_Define.MotionWalkSpeed
										end),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillL, Attack20022.SkillAngle.SkillL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
										BT.CommonNode:create(function()
											self.MoveDirRadio = Attack20022.MoveDirRadioMiddle
										end)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillLPLL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillLPLL, Attack20022.SkillAngle.SkillLPLL),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20022_Define.SkillType.SkillLPLL, 1, false),
										BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillHH),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillHH, Attack20022.SkillAngle.SkillHH),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20022_Define.SkillType.SkillNS),
										BT.IsStartSkillingNode:create(self.instance),
										BT.NotDecorator:create(BT.IsMoveFlyNode:create(self.instance)),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20022.SkillRange.SkillNS, Attack20022.SkillAngle.SkillNS),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
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

function Attack20022:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20022
