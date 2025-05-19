-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20040.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Execute")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20040 = class("Attack20040")
Attack20040.static.SkillCd = {
	{
		Hero20040_Define.SkillType.SkillL,
		1,
		true
	},
	{
		Hero20040_Define.SkillType.SkillNL,
		1,
		true
	},
	{
		Hero20040_Define.SkillType.SkillO,
		5,
		true
	},
	{
		Hero20040_Define.SkillType.SkillH1,
		4,
		true
	},
	{
		Hero20040_Define.SkillType.SkillHP,
		7,
		true
	},
	{
		Hero20040_Define.SkillType.SkillS1,
		6,
		true
	},
	{
		Hero20040_Define.SkillType.SkillOP,
		20,
		false
	},
	{
		Hero20040_Define.SkillType.SkillOOO,
		20,
		false
	},
	{
		Hero20040_Define.SkillType.SkillH3,
		1,
		true
	},
	{
		Hero20040_Define.SkillType.SkillLLL,
		1,
		true
	},
	{
		Hero20040_Define.SkillType.SkillSP3,
		4,
		true
	},
	{
		Hero20040_Define.SkillType.SkillNLP,
		35,
		false
	},
	{
		Hero20040_Define.SkillType.SkillNHP,
		4,
		true
	},
	{
		Hero20040_Define.SkillType.SkillND,
		20,
		true
	},
	{
		Hero20040_Define.SkillType.SkillDP3,
		20,
		true
	},
	{
		Hero20040_Define.SkillType.SkillNS2,
		6,
		true
	},
	{
		Hero20040_Define.SkillType.SkillNSP2,
		6,
		true
	}
}
Attack20040.static.SkillProb = {
	SkillOP = 0.35,
	SkillH1 = 0.35,
	SkillOOO = 0.35,
	SkillS1 = 0.35,
	SkillHP = 0.35,
	SkillSP3 = 0.35,
	SkillNS2_SkillNSP2 = 0.3,
	SkillNLP = 0.35
}
Attack20040.static.SkillRange = {
	SkillL = 5.5,
	SkillH1 = 7,
	SkillHP_Min = 7,
	SkillO = 6,
	SkillSP3 = 5.5,
	SkillNL = 5.5,
	SkillNHP = 5,
	SkillLLL = 4.5,
	SkillOOO = 8,
	SkillS1 = 20,
	SkillH3 = 4.5,
	SkillHP_Max = 20
}
Attack20040.static.SkillAngle = {
	SkillL = 30,
	SkillH1 = 55,
	SkillHP = 30,
	SkillO = 90,
	SkillH3 = 30,
	SkillNL = 55,
	SkillNHP = 60,
	SkillOOO = 30,
	SkillS1 = 60,
	SkillSP3 = 30
}
Attack20040.static.DrewOrInsertSwordRange = 6
Attack20040.static.SwordRange = 0.5
Attack20040.static.SwordAngle = 5
Attack20040.static.SkillHPTime = 5
Attack20040.static.SkillNLPHpRate = 0.4
Attack20040.static.SkillNLPTime = 8
Attack20040.static.SkillNOPHpRate = 0.2
Attack20040.static.SkillOOOWaitTimeMax = 35
Attack20040.static.SkillDP3Time = 1

function Attack20040:initialize(instance)
	self.instance = instance
	self.execute = Execute:new(instance)
	self.skillCDList = Attack20040.SkillCd
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.isInsertSword = false
	self.isDrewSword = true
	self.skillOOOWaitTime = 0
	self.isSkillOP = false
	self.isArrive = false
	self.arrivePosList = {}
	self.arrivePos = Vector3.zero
	self.attackNode = self:create()
end

function Attack20040:create()
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
						Hero20040_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillNL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillH1,
						Hero20040_Define.SkillType.SkillH3
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20040_Define.SkillType.SkillHP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillS1
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillNS2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillD
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillND
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillSP3
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20040_Define.SkillType.SkillSP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillNSP2
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20040_Define.SkillType.SkillNSP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillOP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20040_Define.SkillType.SkillOP, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillNOP
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20040_Define.SkillType.SkillNOP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:GetSkillNOPExposureStep() > 2
					end),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillDP3
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20040_Define.SkillType.SkillDP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillNLP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20040_Define.SkillType.SkillNLP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 10),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillNHP
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20040_Define.SkillType.SkillNHP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillLLL
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillLLL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 0),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillOOO
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20040_Define.SkillType.SkillOOO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
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
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsHitByType(AnimalBase_Define.HitType.StatusWeak)
					end),
					BT.StopSkillNode:create(self.instance),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
						end
					end)
				}),
				BT.SequenceNode:create({
					BT.NotDecorator:create(BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)),
					BT.ConditionNode:create(function()
						local variety = self.instance:GetHeroVariety()

						return variety == Hero20040_Define.VarietyHost
					end),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Attack20040.SkillNOPHpRate
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.ConditionWaitNode:create(function()
						self.instance:SetOrientation(self.instance:GetScene():GetSceneSkillPointPos(8))

						return GameAI.IsAnimalWithinAngle(self.instance, self.instance:GetScene():GetSceneSkillPointPos(8), Attack20040.SwordAngle) == true or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 1.5),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero20040_Define.SkillType.SkillNOP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self:GetTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetSkillTargetForAI(target)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:GetSkillNOPExposureStep() > 2
					end),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillSP3, 3),
							BT.CommonNode:create(function()
								self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(8), false)
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local variety = self.instance:GetHeroVariety()

								return variety == Hero20040_Define.VarietyHost
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsGradeNode:create(self.instance, Hero20040_Define.GradeForceMove),
									BT.SequenceNode:create({
										BT.CommonNode:create(function()
											self.followType = Follow.Type.motionless
										end),
										BT.StopMovementNode:create(self.instance)
									})
								}),
								BT.SequenceNode:create({
									BT.IsGradeNode:create(self.instance, Hero20040_Define.GradeCall),
									BT.SequenceNode:create({
										BT.CommonNode:create(function()
											self.followType = Follow.Type.motionless
										end),
										BT.IsStartSkillingNode:create(self.instance),
										BT.WaitNode:create(2),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
									})
								}),
								BT.SequenceNode:create({
									BT.IsGradeNode:create(self.instance, Hero20040_Define.GradeSan),
									BT.CommonNode:create(function()
										self.followType = Follow.Type.Default

										for i = 9, 12 do
											if self.instance:GetScene():GetSceneSkillPointPos(i) ~= nil then
												table.insert(self.arrivePosList, self.instance:GetScene():GetSceneSkillPointPos(i))
											end
										end
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.isInsertSword == true and self.isDrewSword == false
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOP, 1),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetScene():GetSceneSkillPointPos(9), Attack20040.SwordRange)

														if isWithinRange == true then
															self.isArrive = true
														end

														return self.isArrive == true
													end),
													BT.StopMovementNode:create(self.instance),
													BT.SelectorNode:create({
														BT.SequenceNode:create({
															BT.ConditionNode:create(function()
																local isWithinAngle = GameAI.IsAnimalWithinAngle(self.instance, self.instance:GetScene():GetSceneSkillPointPos(8), Attack20040.SwordAngle)

																return isWithinAngle == true
															end),
															BT.StopMovementNode:create(self.instance),
															BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20040_Define.SkillType.SkillOP, 1, false),
															BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
															BT.CommonNode:create(function()
																self.skillOOOWaitTime = TimeHelper.getNowTime()
																self.isArrive = false
															end)
														}),
														BT.CommonNode:create(function()
															self.instance:SetOrientation(self.instance:GetScene():GetSceneSkillPointPos(8))
														end)
													})
												}),
												BT.CommonNode:create(function()
													self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
													self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(9), true)
												end)
											})
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.isDrewSword == true and self.isInsertSword == false
											end),
											BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 3),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.arrivePos, Attack20040.SwordRange)

														if isWithinRange == true then
															self.isArrive = true
														end

														return self.isArrive == true
													end),
													BT.StopMovementNode:create(self.instance),
													BT.SelectorNode:create({
														BT.SequenceNode:create({
															BT.ConditionNode:create(function()
																local isWithinAngle = GameAI.IsAnimalWithinAngle(self.instance, self.instance:GetWeaponSwordPos(), Attack20040.SwordAngle)

																return isWithinAngle == true
															end),
															BT.StopMovementNode:create(self.instance),
															BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
															BT.CommonNode:create(function()
																self.isArrive = false
															end)
														}),
														BT.CommonNode:create(function()
															self.instance:SetOrientation(self.instance:GetWeaponSwordPos())
														end)
													})
												}),
												BT.CommonNode:create(function()
													self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
													self.instance:SetTargetByWorldPos(self.arrivePos, true)
												end)
											})
										}),
										BT.SequenceNode:create({
											BT.IsSkillingSkillNode:create(self.instance),
											BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL, 0),
											BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.IsSkillingSkillNode:create(self.instance),
											BT.SelectorNode:create({
												BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 2),
												BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 3)
											}),
											BT.IsSkillComboNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOP),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillND),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillDP3),
											BT.ConditionNode:create(function()
												return self.isDrewSword == false and self.isInsertSword == true
											end),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 3),
											BT.IsStartSkillingNode:create(self.instance),
											BT.SelectorNode:create({
												BT.ConditionNode:create(function()
													local nowTime = TimeHelper.getNowTime()

													return nowTime > self.skillOOOWaitTime + Attack20040.SkillOOOWaitTimeMax
												end),
												BT.GetRandomNode:create(Attack20040.SkillProb.SkillOOO, self.instance:GetAnimalId())
											}),
											BT.CommonNode:create(function()
												self.isDrewSword = true
												self.isInsertSword = false

												self.instance:SetSkillTargetPos(self.instance:GetScene():GetSceneSkillPointPos(9))
											end),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetWeaponSwordPos(), Attack20040.DrewOrInsertSwordRange)

														return isWithinRange == true
													end),
													BT.CommonNode:create(function()
														table.sort(self.arrivePosList, function(a, b)
															local nowPos = self.instance:GetPosByWorldPos()
															local disA = Vector3.Distance(a, nowPos)
															local disB = Vector3.Distance(b, nowPos)

															return disA < disB
														end)

														self.arrivePos = self.arrivePosList[1]
													end)
												}),
												BT.SequenceNode:create({
													BT.StopMovementNode:create(self.instance),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20040_Define.SkillType.SkillDP3, 1, false),
													BT.ConditionWaitNode:create(function()
														return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
													end, Attack20040.SkillDP3Time),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
													BT.CommonNode:create(function()
														self.arrivePos = self.instance:GetScene():GetSceneSkillPointPos(9)
													end)
												})
											})
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillSP3),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillSP3, 3),
											BT.IsStartSkillingNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillSP3, Attack20040.SkillAngle.SkillSP3),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillSP3, self.instance:GetAnimalId()),
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20040_Define.SkillType.SkillSP3, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillHP),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillHP, 1),
											BT.IsStartSkillingNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20040.SkillRange.SkillHP_Min, Attack20040.SkillRange.SkillHP_Max, Attack20040.SkillAngle.SkillHP),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillHP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20040_Define.SkillType.SkillHP, 1, false),
											BT.ConditionWaitNode:create(function()
												local target = self.instance:GetBrain():GetAnimalTarget()

												return target ~= nil and target:IsHitByType(AnimalBase_Define.HitType.StatusWeak) or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20040.SkillHPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillH1),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillH1, 1),
											BT.IsStartSkillingNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillH1, Attack20040.SkillAngle.SkillH1),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillH1, self.instance:GetAnimalId()),
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.instance:IsBlossom() == true
											end),
											BT.IsStartSkillingNode:create(self.instance),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillNS2_SkillNSP2, self.instance:GetAnimalId()),
											BT.RandomSequenceNode:create({
												BT.SequenceNode:create({
													BT.SetSkillTargetNode:create(self.instance),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
												}),
												BT.SequenceNode:create({
													BT.SetSkillTargetNode:create(self.instance),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20040_Define.SkillType.SkillNSP2, 1, false),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
												})
											}, self.instance:GetAnimalId())
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillS1),
											BT.ConditionNode:create(function()
												return self.instance:IsBlossom() == false
											end),
											BT.IsStartSkillingNode:create(self.instance),
											BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillS1, Attack20040.SkillAngle.SkillS1),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillS1, self.instance:GetAnimalId()),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOP),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillND),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillDP3),
											BT.ConditionNode:create(function()
												return self.isInsertSword == false and self.isDrewSword == true
											end),
											BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOP, 1),
											BT.IsStartSkillingNode:create(self.instance),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillOP, self.instance:GetAnimalId()),
											BT.CommonNode:create(function()
												self.isInsertSword = true
												self.isDrewSword = false

												self.instance:SetSkillTargetPos(self.instance:GetScene():GetSceneSkillPointPos(9))
											end),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetScene():GetSceneSkillPointPos(8), Attack20040.DrewOrInsertSwordRange)

														return isWithinRange == true
													end)
												}),
												BT.SequenceNode:create({
													BT.StopMovementNode:create(self.instance),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20040_Define.SkillType.SkillDP3, 1, false),
													BT.ConditionWaitNode:create(function()
														return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
													end, Attack20040.SkillDP3Time),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
												})
											})
										}),
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNLP),
											BT.IsStartSkillingNode:create(self.instance),
											BT.ConditionNode:create(function()
												local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
												local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
												local rate = nowHp / hpMax

												return rate <= Attack20040.SkillNLPHpRate
											end),
											BT.GetRandomNode:create(Attack20040.SkillProb.SkillNLP, self.instance:GetAnimalId()),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero20040_Define.SkillType.SkillNLP, 1, false),
											BT.ConditionWaitNode:create(function()
												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20040.SkillNLPTime),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
										}),
										BT.RandomSequenceNode:create({
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNHP),
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillNHP, Attack20040.SkillAngle.SkillNHP),
												BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero20040_Define.SkillType.SkillNHP, 1, false),
												BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillH3),
												BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillH3, 3),
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillH3, Attack20040.SkillAngle.SkillH3),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL),
												BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL, 3),
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillLLL, Attack20040.SkillAngle.SkillLLL),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillL),
												BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillL, 1),
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillL, Attack20040.SkillAngle.SkillL),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNL),
												BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillNL, 1),
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillNL, Attack20040.SkillAngle.SkillNL),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
											}),
											BT.SequenceNode:create({
												BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillO),
												BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillO, 1),
												BT.IsStartSkillingNode:create(self.instance),
												BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillO, Attack20040.SkillAngle.SkillO),
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
											})
										}, self.instance:GetAnimalId())
									})
								})
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local variety = self.instance:GetHeroVariety()

								return variety == Hero20040_Define.VarietyCall1
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillH1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillH1, Attack20040.SkillAngle.SkillH1),
									BT.GetRandomNode:create(Attack20040.SkillProb.SkillH1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillHP),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack20040.SkillRange.SkillHP_Min, Attack20040.SkillRange.SkillHP_Max, Attack20040.SkillAngle.SkillHP),
									BT.GetRandomNode:create(Attack20040.SkillProb.SkillHP, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20040_Define.SkillType.SkillHP, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										return target ~= nil and target:IsHitByType(AnimalBase_Define.HitType.StatusWeak) or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack20040.SkillHPTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillL, Attack20040.SkillAngle.SkillL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillNL, Attack20040.SkillAngle.SkillNL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillO),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillO, Attack20040.SkillAngle.SkillO),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local variety = self.instance:GetHeroVariety()

								return variety == Hero20040_Define.VarietyCall2
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:IsBlossom() == true
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20040.SkillProb.SkillNS2_SkillNSP2, self.instance:GetAnimalId()),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.SetSkillTargetNode:create(self.instance),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										}),
										BT.SequenceNode:create({
											BT.SetSkillTargetNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial, Hero20040_Define.SkillType.SkillNSP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillS1),
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNS2),
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNSP2),
									BT.ConditionNode:create(function()
										return self.instance:IsBlossom() == false
									end),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillS1, Attack20040.SkillAngle.SkillS1),
									BT.GetRandomNode:create(Attack20040.SkillProb.SkillS1, self.instance:GetAnimalId()),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillL, Attack20040.SkillAngle.SkillL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNL),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillNL, Attack20040.SkillAngle.SkillNL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillO),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillO, Attack20040.SkillAngle.SkillO),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local variety = self.instance:GetHeroVariety()

								return variety == Hero20040_Define.VarietyCall3
							end),
							BT.CommonNode:create(function()
								for i = 9, 12 do
									if self.instance:GetScene():GetSceneSkillPointPos(i) ~= nil then
										table.insert(self.arrivePosList, self.instance:GetScene():GetSceneSkillPointPos(i))
									end
								end
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.isInsertSword == true and self.isDrewSword == false
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOP, 1),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetScene():GetSceneSkillPointPos(9), Attack20040.SwordRange)

												if isWithinRange == true then
													self.isArrive = true
												end

												return self.isArrive == true
											end),
											BT.StopMovementNode:create(self.instance),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinAngle = GameAI.IsAnimalWithinAngle(self.instance, self.instance:GetScene():GetSceneSkillPointPos(8), Attack20040.SwordAngle)

														return isWithinAngle == true
													end),
													BT.StopMovementNode:create(self.instance),
													BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero20040_Define.SkillType.SkillOP, 1, false),
													BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
													BT.CommonNode:create(function()
														self.skillOOOWaitTime = TimeHelper.getNowTime()
														self.isSkillOP = true
														self.isArrive = false
													end)
												}),
												BT.CommonNode:create(function()
													self.instance:SetOrientation(self.instance:GetScene():GetSceneSkillPointPos(8))
												end)
											})
										}),
										BT.CommonNode:create(function()
											self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
											self.instance:SetTargetByWorldPos(self.instance:GetScene():GetSceneSkillPointPos(9), true)
										end)
									})
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.isDrewSword == true and self.isInsertSword == false
									end),
									BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
									BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 3),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.arrivePos, Attack20040.SwordRange)

												if isWithinRange == true then
													self.isArrive = true
												end

												return self.isArrive == true
											end),
											BT.StopMovementNode:create(self.instance),
											BT.SelectorNode:create({
												BT.SequenceNode:create({
													BT.ConditionNode:create(function()
														local isWithinAngle = GameAI.IsAnimalWithinAngle(self.instance, self.instance:GetWeaponSwordPos(), Attack20040.SwordAngle)

														return isWithinAngle == true
													end),
													BT.StopMovementNode:create(self.instance),
													BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
													BT.CommonNode:create(function()
														self.isArrive = false
													end)
												}),
												BT.CommonNode:create(function()
													self.instance:SetOrientation(self.instance:GetWeaponSwordPos())
												end)
											})
										}),
										BT.CommonNode:create(function()
											self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
											self.instance:SetTargetByWorldPos(self.arrivePos, true)
										end)
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL, 0),
									BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 3)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO),
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOP),
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillND),
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillDP3),
									BT.ConditionNode:create(function()
										return self.isDrewSword == false and self.isInsertSword == true
									end),
									BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO, 3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.SelectorNode:create({
										BT.ConditionNode:create(function()
											local nowTime = TimeHelper.getNowTime()

											return nowTime > self.skillOOOWaitTime + Attack20040.SkillOOOWaitTimeMax
										end),
										BT.GetRandomNode:create(Attack20040.SkillProb.SkillOOO, self.instance:GetAnimalId())
									}),
									BT.CommonNode:create(function()
										self.isDrewSword = true
										self.isInsertSword = false

										self.instance:SetSkillTargetPos(self.instance:GetScene():GetSceneSkillPointPos(9))
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetWeaponSwordPos(), Attack20040.DrewOrInsertSwordRange)

												return isWithinRange == true
											end),
											BT.CommonNode:create(function()
												table.sort(self.arrivePosList, function(a, b)
													local nowPos = self.instance:GetPosByWorldPos()
													local disA = Vector3.Distance(a, nowPos)
													local disB = Vector3.Distance(b, nowPos)

													return disA < disB
												end)

												self.arrivePos = self.arrivePosList[1]
											end)
										}),
										BT.SequenceNode:create({
											BT.StopMovementNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20040_Define.SkillType.SkillDP3, 1, false),
											BT.ConditionWaitNode:create(function()
												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20040.SkillDP3Time),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
											BT.CommonNode:create(function()
												self.arrivePos = self.instance:GetScene():GetSceneSkillPointPos(9)
											end)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOP),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillOOO),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillND),
											BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillDP3)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.isSkillOP == false
											end),
											BT.WaitNode:create(1)
										})
									}),
									BT.ConditionNode:create(function()
										return self.isInsertSword == false and self.isDrewSword == true
									end),
									BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillOP, 1),
									BT.IsStartSkillingNode:create(self.instance),
									BT.GetRandomNode:create(Attack20040.SkillProb.SkillOP, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										self.isInsertSword = true
										self.isDrewSword = false

										self.instance:SetSkillTargetPos(self.instance:GetScene():GetSceneSkillPointPos(9))
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												local isWithinRange = GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetScene():GetSceneSkillPointPos(8), Attack20040.DrewOrInsertSwordRange)

												return isWithinRange == true
											end)
										}),
										BT.SequenceNode:create({
											BT.StopMovementNode:create(self.instance),
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero20040_Define.SkillType.SkillDP3, 1, false),
											BT.ConditionWaitNode:create(function()
												return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
											end, Attack20040.SkillDP3Time),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
										})
									})
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillSP3),
									BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillSP3, 3),
									BT.IsStartSkillingNode:create(self.instance),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillSP3, Attack20040.SkillAngle.SkillSP3),
									BT.GetRandomNode:create(Attack20040.SkillProb.SkillSP3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20040_Define.SkillType.SkillSP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillH3),
										BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillH3, 3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillH3, Attack20040.SkillAngle.SkillH3),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL),
										BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillLLL, 3),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillLLL, Attack20040.SkillAngle.SkillLLL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillL),
										BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillL, 1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillL, Attack20040.SkillAngle.SkillL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillNL),
										BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillNL, 1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillNL, Attack20040.SkillAngle.SkillNL),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero20040_Define.SkillType.SkillO),
										BT.IsSkillConditionNode:create(self.instance, Hero20040_Define.SkillType.SkillO, 1),
										BT.IsStartSkillingNode:create(self.instance),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20040.SkillRange.SkillO, Attack20040.SkillAngle.SkillO),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
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

function Attack20040:GetTarget()
	local variety = self.instance:GetHeroVariety()

	if variety == Hero20040_Define.VarietyHost and self.instance:GetGrade() > Hero20040_Define.GradeForceMove or variety ~= Hero20040_Define.VarietyHost then
		local target = GameAI.GetTargetOffense(self.instance)

		if self.instance ~= nil then
			return target
		end
	end

	return nil
end

return Attack20040
