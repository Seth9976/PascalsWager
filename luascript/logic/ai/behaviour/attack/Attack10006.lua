-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10006.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/CounterAttack")
require("LuaScript/Logic/AI/Behaviour/Execute")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10006 = class("Attack10006")
Attack10006.static.SkillProb = {
	SkillO2_SkillNO2 = 0.35,
	SkillS2 = 0.3,
	SkillLP2_SkillHP2 = 0.3,
	SkillSP2 = 1,
	SkillNOP3 = 0.3,
	SkillLP3_SkillHP3 = 0.3,
	SkillOP3 = 0.3,
	SkillNL2 = 0.35,
	SkillNLP3 = 0.3,
	SkillNL1 = 0.45,
	SkillNS2 = 0.35,
	SkillNH2 = 0.35,
	SkillH2 = 0.7,
	SkillNHP2 = 0.3
}
Attack10006.static.SkillCd = {
	{
		Hero10006_Define.SkillType.SkillL1,
		3,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNL1,
		4,
		true
	},
	{
		Hero10006_Define.SkillType.SkillH1,
		6,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNH1,
		5,
		true
	},
	{
		Hero10006_Define.SkillType.SkillO1,
		6,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNO1,
		6,
		true
	},
	{
		Hero10006_Define.SkillType.SkillS1,
		6,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNS1,
		6,
		true
	},
	{
		Hero10006_Define.SkillType.SkillShow,
		30,
		true
	},
	{
		Hero10006_Define.SkillType.SkillL2,
		3,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNL2,
		5,
		true
	},
	{
		Hero10006_Define.SkillType.SkillO2,
		20,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNO2,
		20,
		true
	},
	{
		Hero10006_Define.SkillType.SkillLP2,
		8,
		true
	},
	{
		Hero10006_Define.SkillType.SkillHP2,
		8,
		true
	},
	{
		Hero10006_Define.SkillType.SkillS2,
		6,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNS2,
		10,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNH2,
		10,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNHP2,
		22,
		true
	},
	{
		Hero10006_Define.SkillType.SkillSP2,
		5,
		true
	},
	{
		Hero10006_Define.SkillType.SkillH2,
		8,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNOP3,
		12,
		true
	},
	{
		Hero10006_Define.SkillType.SkillNLP3,
		10,
		true
	},
	{
		Hero10006_Define.SkillType.SkillOP3,
		12,
		true
	},
	{
		Hero10006_Define.SkillType.SkillLP3,
		8,
		true
	},
	{
		Hero10006_Define.SkillType.SkillHP3,
		8,
		true
	}
}
Attack10006.static.SkillRange = {
	SkillLP2_SkillHP2_Min = 6,
	SkillOP3 = 15,
	SkillNL1_Max = 20,
	SkillSP2 = 5,
	SkillO1 = 10,
	SkillNS2 = 12,
	SkillNHP2 = 20,
	SkillH2 = 4,
	SkillS2_Max = 8,
	SkillNL1_Min = 5,
	SkillNH2_Max = 30,
	SkillL2 = 3.5,
	SkillLP3_SkillHP3_Min = 6,
	SkillNL2_Min = 5,
	SkillNO1 = 10,
	SkillLP3_SkillHP3_Max = 18,
	SkillH1 = 10,
	SkillNLP3_Max = 20,
	SkillNH2_Min = 7.5,
	SkillLP2_SkillHP2_Max = 18,
	SkillL1 = 3.5,
	SkillNOP3 = 20,
	SkillNL2_Max = 15,
	SkillS1 = 10,
	SkillNS1 = 10,
	SkillNH1 = 10,
	SkillS2_Min = 3.5,
	SkillNLP3_Min = 5
}
Attack10006.static.SkillAngle = {
	SkillL2 = 30,
	SkillS2 = 30,
	SkillLP2_SkillHP2 = 30,
	SkillNL2 = 30,
	SkillNLP3 = 30,
	SkillL1 = 30,
	SkillLP3_SkillHP3 = 30,
	SkillH2 = 45,
	SkillNL1 = 30,
	SkillNH2 = 45,
	SkillNHP2 = 30
}
Attack10006.static.HoverFrameRatio = 2.5
Attack10006.static.SkillDefenceTime = 6
Attack10006.static.SkillNLP3Time = 7
Attack10006.static.SkillOP2Time = 1
Attack10006.static.HitMaxTime = 1.5
Attack10006.static.NoHitMaxTime = 1
Attack10006.static.SkillDP3_Percent = 0.6
Attack10006.static.SkillNDP3_Percent = 0.3

function Attack10006:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack10006.HoverFrameRatio, 1, AnimalBase_Define.SpeedMode.Normal)
	self.counterAttack = CounterAttack:new(instance, Attack10006.SkillRange.CounterAttack, Attack10006.SkillAngle.CounterAttack, Attack10006.SkillProb.CounterAttack)
	self.execute = Execute:new(instance)
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Fast
	self.skillCDList = Attack10006.SkillCd
	self.skillDir = GameAI.MoveDirection.Forward
	self.callCrowId = 0
	self.sanHeroIndex = 1
	self.hitTime = 0
	self.noHitTime = 0
	self.isSkillDP3 = false
	self.isSkillNDP3 = false
	self.attackNode = self:create()
end

function Attack10006:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true and self.instance:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillL1,
						Hero10006_Define.SkillType.SkillL2
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNL1,
						Hero10006_Define.SkillType.SkillNL2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillH1,
						Hero10006_Define.SkillType.SkillH2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNH1,
						Hero10006_Define.SkillType.SkillNH2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillO1,
						Hero10006_Define.SkillType.SkillO2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNO1,
						Hero10006_Define.SkillType.SkillNO2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillS1,
						Hero10006_Define.SkillType.SkillS2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNS1,
						Hero10006_Define.SkillType.SkillNS2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillD1
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillDP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero10006_Define.SkillType.SkillDP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillOP2,
						Hero10006_Define.SkillType.SkillOP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero10006_Define.SkillType.SkillOP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillLP2,
						Hero10006_Define.SkillType.SkillLP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero10006_Define.SkillType.SkillLP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillHP2,
						Hero10006_Define.SkillType.SkillHP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10006_Define.SkillType.SkillHP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNHP2
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero10006_Define.SkillType.SkillNHP2, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillSP2
					}),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10006_Define.SkillType.SkillSP2, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNOP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero10006_Define.SkillType.SkillNOP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNLP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero10006_Define.SkillType.SkillNLP3, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero10006_Define.SkillType.SkillNDP3
					}),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero10006_Define.SkillType.SkillNDP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge)
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
						return self.instance:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true
					end)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and (self.instance:IsDrop() == true or target:CheckSkillCommandEnable() == false)
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				self.execute.executeNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and target:IsPermitExecuteHit() == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.CounterAttack, 1)
					end),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil then
							local pos = Vector3.zero

							pos:SetVector3(target:GetPosByWorldPos())
							pos:Add(target:GetBack():SetNormalize())
							self.instance:SetSkillTargetPos(1, pos)
						end
					end),
					BT.StopSkillNode:create(self.instance),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)
				}),
				BT.SequenceNode:create({
					BT.NotDecorator:create(BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)),
					BT.IsGradeNode:create(self.instance, 2),
					BT.ConditionNode:create(function()
						return self.instance:IsCallHeroSanEnable() == true
					end),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Hero10006_Define.HpLockPercent[self.sanHeroIndex]
					end),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == false and self.instance:IsFreeSkillEnable() == true and self.instance:IsSkilling() == false
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.CommonNode:create(function()
						self.instance:SetMoveNoDamage(true)

						local pos = Vector3.zero
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							pos:SetVector3(target:GetPosByWorldPos())
							pos:Add(target:GetForward():SetNormalize():Mul(10))
							self.instance:SetSkillTargetPos(1, pos)
						end
					end),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero10006_Define.SkillType.SkillOP2, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, Attack10006.SkillOP2Time),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
					BT.CommonNode:create(function()
						if self.sanHeroIndex < #Hero10006_Define.HpLockPercent then
							self.sanHeroIndex = self.sanHeroIndex + 1
						end
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.NotDecorator:create(BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)),
					BT.IsGradeNode:create(self.instance, 3),
					BT.ConditionNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						return (trick == nil or trick:IsTrickHitTarget() == false) and self.isSkillNDP3 == false
					end),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Attack10006.SkillNDP3_Percent
					end),
					BT.ConditionWaitNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						return self.instance:IsDead() == false and self.instance:IsFreeSkillEnable() == true and self.instance:IsSkilling() == false and (trick == nil or trick:IsTrickHitTarget() == false)
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.CommonNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						if trick ~= nil and trick:IsOpening() == true then
							trick:Stop()
						end
					end),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, Hero10006_Define.SkillType.SkillDP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge),
					BT.CommonNode:create(function()
						self.isSkillNDP3 = true
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.NotDecorator:create(BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute)),
					BT.IsGradeNode:create(self.instance, 3),
					BT.ConditionNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						return (trick == nil or trick:IsTrickHitTarget() == false) and self.isSkillDP3 == false
					end),
					BT.ConditionNode:create(function()
						local nowHp = self.instance:GetValue():GetProperty(MS_HeroData.Property.Hp)
						local hpMax = self.instance:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
						local rate = nowHp / hpMax

						return rate <= Attack10006.SkillDP3_Percent
					end),
					BT.ConditionWaitNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						return self.instance:IsDead() == false and self.instance:IsFreeSkillEnable() == true and self.instance:IsSkilling() == false and (trick == nil or trick:IsTrickHitTarget() == false)
					end),
					BT.StopMovementNode:create(self.instance),
					BT.StopSkillNode:create(self.instance),
					BT.CommonNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						if trick ~= nil and trick:IsOpening() == true then
							trick:Stop()
						end
					end),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge, Hero10006_Define.SkillType.SkillDP3, 1, false),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
					BT.CommonNode:create(function()
						self.isSkillDP3 = true
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 1),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillH1, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNH1, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillO1, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNO1, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillS1, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNS1, 1)
					}),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 2),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillO2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNO2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillLP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillHP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillS2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNS2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNHP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillSP2, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
					}, self.instance:GetAnimalId(), {
						1,
						2
					})
				}),
				BT.SequenceNode:create({
					BT.IsGradeNode:create(self.instance, 3),
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillO2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNO2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillLP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillHP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillS2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNS2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNHP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillSP2, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNOP3, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillNLP3, 3),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillOP3, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillLP3, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
					}, self.instance:GetAnimalId(), {
						1,
						3
					})
				}),
				BT.SequenceNode:create({
					BT.IsSkillIndexChangeNode:create(self.instance, Hero10006_Define.SkillType.SkillHP3, 1),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
				}),
				BT.SequenceNode:create({
					BT.CommonNode:create(function()
						if self.instance:IsHit() == true then
							self.noHitTime = 0
						else
							self.noHitTime = self.noHitTime + Time.deltaTime

							if self.noHitTime > Attack10006.NoHitMaxTime or self.instance:IsSkilling() == true then
								self.instance.hitTimes = 0
							end
						end
					end),
					BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillH2),
					BT.SelectorNode:create({
						BT.IsGradeNode:create(self.instance, 2),
						BT.IsGradeNode:create(self.instance, 3)
					}),
					BT.ConditionNode:create(function()
						local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

						return trick == nil or trick:IsOpening() == false
					end),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.ConditionNode:create(function()
						if self.instance.hitTimes >= Hero10006_Define.MaxHitTimes and (self.instance:IsHitByType(AnimalBase_Define.HitType.Light) or self.instance:IsHitByType(AnimalBase_Define.HitType.Heavy)) then
							self.instance.hitTimes = 0

							return true
						end
					end),
					BT.GetRandomNode:create(Attack10006.SkillProb.SkillH2, self.instance:GetAnimalId()),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.CommonNode:create(function()
						if self.instance:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
							if self.instance:IsSkilling() == false then
								self.followType = Follow.Type.motionless
							elseif self.instance:IsSkillingById(Hero10006_Define.SkillType.SkillHostDrag, 0) then
								self.followType = Follow.Type.motionless
							else
								local target = self.instance:GetSkillTarget()

								if target ~= nil and (target:IsHit() == true or target:IsDead() == true or target:IsShow() == false) then
									self.followType = Follow.Type.motionless
								end
							end
						end
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 1),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNL1),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillNL1_Min, Attack10006.SkillRange.SkillNL1_Max, Attack10006.SkillAngle.SkillNL1),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNL1, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillL1),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillL1, Attack10006.SkillAngle.SkillL1),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Forward
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId(), {
										1,
										1,
										1,
										2
									}),
									BT.CommonNode:create(function()
										local pos = Vector3.zero
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											pos:SetVector3(target:GetPosByWorldPos())

											if self.skillDir == GameAI.MoveDirection.Left then
												pos:Add(self.instance:GetLeft():SetNormalize():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Right then
												pos:Add(self.instance:GetRight():SetNormalize():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Forward then
												pos:Add(self.instance:GetBack():SetNormalize():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Back then
												pos:Add(self.instance:GetForward():SetNormalize():Mul(8))
											end

											self.instance:SetSkillTargetPos(1, pos)
										end
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.RandomSequenceNode:create({
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillH1),
										BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillH1),
										BT.RandomNode:create({
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Left
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Right
											end)
										}, self.instance:GetAnimalId()),
										BT.CommonNode:create(function()
											local pos = Vector3.zero
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												pos:SetVector3(target:GetPosByWorldPos())
												pos:Add(self.instance:GetBack():SetNormalize():Mul(3.5))

												if self.skillDir == GameAI.MoveDirection.Left then
													pos:Add(self.instance:GetLeft():SetNormalize():Mul(2))
												elseif self.skillDir == GameAI.MoveDirection.Right then
													pos:Add(self.instance:GetRight():SetNormalize():Mul(2))
												end

												self.instance:SetSkillTargetPos(1, pos)
											end
										end),
										BT.SetSkillTargetNode:create(self.instance),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH1),
										BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNH1),
										BT.RandomNode:create({
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Left
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Right
											end)
										}, self.instance:GetAnimalId()),
										BT.CommonNode:create(function()
											local pos = Vector3.zero
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												pos:SetVector3(target:GetPosByWorldPos())
												pos:Add(self.instance:GetBack():SetNormalize():Mul(7))

												if self.skillDir == GameAI.MoveDirection.Left then
													pos:Add(self.instance:GetLeft():SetNormalize():Mul(2))
												elseif self.skillDir == GameAI.MoveDirection.Right then
													pos:Add(self.instance:GetRight():SetNormalize():Mul(2))
												end

												self.instance:SetSkillTargetPos(1, pos)
											end
										end),
										BT.SetSkillTargetNode:create(self.instance),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillO1),
										BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillO1),
										BT.RandomNode:create({
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Left
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Right
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Forward
											end)
										}, self.instance:GetAnimalId()),
										BT.CommonNode:create(function()
											local pos = Vector3.zero
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												pos:SetVector3(target:GetPosByWorldPos())
												pos:Add(self.instance:GetBack():SetNormalize():Mul(4))

												if self.skillDir == GameAI.MoveDirection.Left then
													pos:Add(self.instance:GetLeft():SetNormalize():Mul(2))
												elseif self.skillDir == GameAI.MoveDirection.Right then
													pos:Add(self.instance:GetRight():SetNormalize():Mul(2))
												end

												self.instance:SetSkillTargetPos(1, pos)
											end
										end),
										BT.SetSkillTargetNode:create(self.instance),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNO1),
										BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNO1),
										BT.CommonNode:create(function()
											local pos = Vector3.zero
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												pos:SetVector3(target:GetPosByWorldPos())
												self.instance:SetSkillTargetPos(1, pos:Add(self.instance:GetLeft():SetNormalize():Mul(6)))
												pos:SetVector3(target:GetPosByWorldPos())
												self.instance:SetSkillTargetPos(2, pos:Add(self.instance:GetRight():SetNormalize():Mul(6)))
											end
										end),
										BT.SetSkillTargetNode:create(self.instance),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillS1),
										BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillS1),
										BT.RandomNode:create({
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Left
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Right
											end)
										}, self.instance:GetAnimalId()),
										BT.CommonNode:create(function()
											local pos = Vector3.zero
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												pos:SetVector3(target:GetPosByWorldPos())
												pos:Add(self.instance:GetBack():SetNormalize():Mul(8))

												if self.skillDir == GameAI.MoveDirection.Left then
													pos:Add(self.instance:GetLeft():SetNormalize():Mul(4))
												elseif self.skillDir == GameAI.MoveDirection.Right then
													pos:Add(self.instance:GetRight():SetNormalize():Mul(4))
												end

												self.instance:SetSkillTargetPos(1, pos)
											end
										end),
										BT.SetSkillTargetNode:create(self.instance),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
									}),
									BT.SequenceNode:create({
										BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNS1),
										BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
										BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNS1),
										BT.RandomNode:create({
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Left
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Right
											end),
											BT.CommonNode:create(function()
												self.skillDir = GameAI.MoveDirection.Forward
											end)
										}, self.instance:GetAnimalId()),
										BT.CommonNode:create(function()
											local pos = Vector3.zero
											local target = self.instance:GetBrain():GetAnimalTarget()

											if target ~= nil and target:IsDead() == false and target:IsShow() == true then
												pos:SetVector3(target:GetPosByWorldPos())
												pos:Add(self.instance:GetBack():SetNormalize():Mul(3.5))

												if self.skillDir == GameAI.MoveDirection.Left then
													pos:Add(self.instance:GetLeft():SetNormalize():Mul(2))
												elseif self.skillDir == GameAI.MoveDirection.Right then
													pos:Add(self.instance:GetRight():SetNormalize():Mul(2))
												end

												self.instance:SetSkillTargetPos(1, pos)
											end
										end),
										BT.SetSkillTargetNode:create(self.instance),
										BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
									})
								}, self.instance:GetAnimalId())
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 2),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNHP2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNHP2, Attack10006.SkillAngle.SkillNHP2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNHP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero10006_Define.SkillType.SkillNHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillS2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										if trick ~= nil and trick:IsTrickHitTarget() == true then
											return false
										end

										return true
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillS2_Min, Attack10006.SkillRange.SkillS2_Max, Attack10006.SkillAngle.SkillS2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillLP2),
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillHP2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillLP2_SkillHP2_Min, Attack10006.SkillRange.SkillLP2_SkillHP2_Max, Attack10006.SkillAngle.SkillLP2_SkillHP2_Min),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillLP2_SkillHP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero10006_Define.SkillType.SkillLP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10006_Define.SkillType.SkillHP2, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNS2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										if trick ~= nil and trick:IsTrickHitTarget() == true then
											return false
										end

										return true
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNS2, Attack10006.SkillAngle.SkillNS2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillNH2_Min, Attack10006.SkillRange.SkillNH2_Max, Attack10006.SkillAngle.SkillNH2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNH2, self.instance:GetAnimalId()),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Forward
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											local pos = Vector3.zero

											pos:SetVector3(target:GetPosByWorldPos())

											if self.skillDir == GameAI.MoveDirection.Left then
												pos:Add(target:GetLeft():SetNormalize():Mul(0.5))
											elseif self.skillDir == GameAI.MoveDirection.Right then
												pos:Add(target:GetRight():SetNormalize():Mul(0.5))
											elseif self.skillDir == GameAI.MoveDirection.Forward then
												pos:Add(target:GetForward():SetNormalize():Mul(0.5))
											else
												pos:Add(target:GetBack():SetNormalize():Mul(0.5))
											end

											pos.y = target:GetGroundY()

											self.instance:SetSkillTargetPos(1, pos)
										end
									end),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNL2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillNL2_Min, Attack10006.SkillRange.SkillNL2_Max, Attack10006.SkillAngle.SkillNL2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNL2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillL2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillL2, Attack10006.SkillAngle.SkillL2),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Forward
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local pos = Vector3.zero
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											pos:SetVector3(target:GetPosByWorldPos())

											if self.skillDir == GameAI.MoveDirection.Left then
												pos:Add(self.instance:GetLeft():SetNormalize():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Right then
												pos:Add(self.instance:GetRight():SetNormalize():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Forward then
												pos:Add(self.instance:GetBack():SetNormalize():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Back then
												pos:Add(self.instance:GetForward():SetNormalize():Mul(8))
											end

											self.instance:SetSkillTargetPos(1, pos)
										end
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillSP2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillSP2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillSP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10006_Define.SkillType.SkillSP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack10006.SkillDefenceTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillO2),
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNO2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.ConditionNode:create(function()
										return self.instance:IsHaveCrow() == false
									end),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillO2_SkillNO2, self.instance:GetAnimalId()),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local pos = Vector3.zero

										pos:SetVector3(self.instance:GetPosByWorldPos())

										if self.skillDir == GameAI.MoveDirection.Left then
											pos:Add(self.instance:GetLeft():SetNormalize():Mul(3))
										elseif self.skillDir == GameAI.MoveDirection.Right then
											pos:Add(self.instance:GetRight():SetNormalize():Mul(3))
										end

										self.instance:SetSkillTargetPos(1, pos)
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.callCrowId == 1
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
											BT.CommonNode:create(function()
												self.callCrowId = 2
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.callCrowId == 2
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption),
											BT.CommonNode:create(function()
												self.callCrowId = 1
											end)
										}),
										BT.RandomSequenceNode:create({
											BT.SequenceNode:create({
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
												BT.CommonNode:create(function()
													self.callCrowId = 2
												end)
											}),
											BT.SequenceNode:create({
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption),
												BT.CommonNode:create(function()
													self.callCrowId = 1
												end)
											})
										}, self.instance:GetAnimalId())
									})
								})
							})
						}),
						BT.SequenceNode:create({
							BT.IsGradeNode:create(self.instance, 3),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2, 3),
										BT.IsSkillingByIdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2, 5)
									}),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Forward
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											local pos = Vector3.zero

											pos:SetVector3(target:GetPosByWorldPos())

											if self.skillDir == GameAI.MoveDirection.Left then
												pos:Add(target:GetLeft():SetNormalize():Mul(0.5))
											elseif self.skillDir == GameAI.MoveDirection.Right then
												pos:Add(target:GetRight():SetNormalize():Mul(0.5))
											elseif self.skillDir == GameAI.MoveDirection.Forward then
												pos:Add(target:GetForward():SetNormalize():Mul(0.5))
											else
												pos:Add(target:GetBack():SetNormalize():Mul(0.5))
											end

											pos.y = target:GetGroundY()

											self.instance:SetSkillTargetPos(1, pos)
										end
									end)
								}),
								BT.SequenceNode:create({
									BT.IsSkillingSkillNode:create(self.instance),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.SelectorNode:create({
										BT.IsSkillingByIdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2, 2),
										BT.IsSkillingByIdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2, 4)
									}),
									BT.IsSkillComboNode:create(self.instance),
									BT.NotDecorator:create(BT.IsHitBySkillNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2, 0)),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillOP3),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillOP3),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillOP3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option, Hero10006_Define.SkillType.SkillOP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNLP3),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										if trick ~= nil and trick:IsTrickHitTarget() == true then
											return false
										end

										return true
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillNLP3_Min, Attack10006.SkillRange.SkillNLP3_Max, Attack10006.SkillAngle.SkillNLP3),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNLP3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight, Hero10006_Define.SkillType.SkillNLP3, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack10006.SkillNLP3Time),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNOP3),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNOP3),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNOP3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption, Hero10006_Define.SkillType.SkillNOP3, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillL2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillL2, Attack10006.SkillAngle.SkillL2),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Forward
										end)
									}, self.instance:GetAnimalId(), {
										1,
										1,
										1,
										2
									}),
									BT.CommonNode:create(function()
										local pos = Vector3.zero
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											pos:SetVector3(target:GetPosByWorldPos())
											pos:Add(self.instance:GetForward():Mul(8))

											if self.skillDir == GameAI.MoveDirection.Left then
												pos:Add(self.instance:GetLeft():Mul(8))
											elseif self.skillDir == GameAI.MoveDirection.Right then
												pos:Add(self.instance:GetRight():Mul(8))
											end

											self.instance:SetSkillTargetPos(1, pos)
										end
									end),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillSP2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillSP2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillSP2, self.instance:GetAnimalId()),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero10006_Define.SkillType.SkillSP2, 1, false),
									BT.ConditionWaitNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
										end

										return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
									end, Attack10006.SkillDefenceTime),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillS2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										if trick ~= nil and trick:IsTrickHitTarget() == true then
											return false
										end

										return true
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillS2_Min, Attack10006.SkillRange.SkillS2_Max, Attack10006.SkillAngle.SkillS2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillLP3),
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillHP3),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillLP3_SkillHP3_Min, Attack10006.SkillRange.SkillLP3_SkillHP3_Max, Attack10006.SkillAngle.SkillLP3_SkillHP3_Min),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillLP3_SkillHP3, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.RandomSequenceNode:create({
										BT.SequenceNode:create({
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero10006_Define.SkillType.SkillLP3, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
										}),
										BT.SequenceNode:create({
											BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero10006_Define.SkillType.SkillHP3, 1, false),
											BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
										})
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNH2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillNH2_Min, Attack10006.SkillRange.SkillNH2_Max, Attack10006.SkillAngle.SkillNH2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNH2, self.instance:GetAnimalId()),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Forward
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Back
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local target = self.instance:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true then
											local pos = Vector3.zero

											pos:SetVector3(target:GetPosByWorldPos())

											if self.skillDir == GameAI.MoveDirection.Left then
												pos:Add(target:GetLeft():SetNormalize():Mul(0.5))
											elseif self.skillDir == GameAI.MoveDirection.Right then
												pos:Add(target:GetRight():SetNormalize():Mul(0.5))
											elseif self.skillDir == GameAI.MoveDirection.Forward then
												pos:Add(target:GetForward():SetNormalize():Mul(0.5))
											else
												pos:Add(target:GetBack():SetNormalize():Mul(0.5))
											end

											pos.y = target:GetGroundY()

											self.instance:SetSkillTargetPos(1, pos)
										end
									end),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNHP2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										return trick == nil or trick:IsOpening() == false
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNHP2, Attack10006.SkillAngle.SkillNHP2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNHP2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy, Hero10006_Define.SkillType.SkillNHP2, 1, false),
									BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNS2),
									BT.ConditionNode:create(function()
										local trick = self.instance.scene:GetTrick(Hero10006_Define.TrickId_SkillNHP2)

										if trick ~= nil and trick:IsTrickHitTarget() == true then
											return false
										end

										return true
									end),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack10006.SkillRange.SkillNS2, Attack10006.SkillAngle.SkillNS2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNS2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewSpecial)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNL2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.IsTargetWithinSkillRangeNode:create(self.instance, Attack10006.SkillRange.SkillNL2_Min, Attack10006.SkillRange.SkillNL2_Max, Attack10006.SkillAngle.SkillNL2),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillNL2, self.instance:GetAnimalId()),
									BT.SetSkillTargetNode:create(self.instance),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewLight)
								}),
								BT.SequenceNode:create({
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillO2),
									BT.IsSkillCdNode:create(self.instance, Hero10006_Define.SkillType.SkillNO2),
									BT.IsStartSkillingNode:create(self.instance, Attack10006.HitMaxTime),
									BT.ConditionNode:create(function()
										return self.instance:IsHaveCrow() == false
									end),
									BT.GetRandomNode:create(Attack10006.SkillProb.SkillO2_SkillNO2, self.instance:GetAnimalId()),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Left
										end),
										BT.CommonNode:create(function()
											self.skillDir = GameAI.MoveDirection.Right
										end)
									}, self.instance:GetAnimalId()),
									BT.CommonNode:create(function()
										local pos = Vector3.zero

										pos:SetVector3(self.instance:GetPosByWorldPos())

										if self.skillDir == GameAI.MoveDirection.Left then
											pos:Add(self.instance:GetLeft():SetNormalize():Mul(3))
										elseif self.skillDir == GameAI.MoveDirection.Right then
											pos:Add(self.instance:GetRight():SetNormalize():Mul(3))
										end

										self.instance:SetSkillTargetPos(1, pos)
									end),
									BT.SelectorNode:create({
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.callCrowId == 1
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
											BT.CommonNode:create(function()
												self.callCrowId = 2
											end)
										}),
										BT.SequenceNode:create({
											BT.ConditionNode:create(function()
												return self.callCrowId == 2
											end),
											BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption),
											BT.CommonNode:create(function()
												self.callCrowId = 1
											end)
										}),
										BT.RandomSequenceNode:create({
											BT.SequenceNode:create({
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
												BT.CommonNode:create(function()
													self.callCrowId = 2
												end)
											}),
											BT.SequenceNode:create({
												BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewOption),
												BT.CommonNode:create(function()
													self.callCrowId = 1
												end)
											})
										}, self.instance:GetAnimalId())
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

function Attack10006:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack10006
