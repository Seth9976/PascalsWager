-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20019.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Dodge")
require("LuaScript/Logic/AI/Behaviour/Hover")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20019 = class("Attack20019")
Attack20019.static.SkillProb = {
	SkillS = 0.35,
	Dodge = 0.6
}
Attack20019.static.SkillCd = {
	{
		Hero20019_Define.SkillType.SkillS,
		6,
		false
	},
	{
		Hero20019_Define.SkillType.SkillAimShoot,
		1.5,
		true
	},
	{
		Hero20019_Define.SkillType.SkillL,
		6,
		true
	},
	{
		AnimalBase_Define.SkillType.Dodge,
		4,
		true
	}
}
Attack20019.static.SkillRange = {
	SkillS = 15,
	SkillAimShoot_Max = 20,
	SkillL = 3.5,
	Dodge_Min = 5,
	Dodge_Max = 7,
	SkillAimShoot_Min = 3
}
Attack20019.static.SkillAngle = {
	SkillL = 45,
	SkillS = 20,
	Dodge = 60,
	SkillAimShoot = 10
}
Attack20019.static.HoverTimeRatio = 1.5
Attack20019.static.AimShootTime = 2.2

function Attack20019:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20019.HoverTimeRatio, 1)
	self.dodge = Dodge:new(instance, Attack20019.SkillRange.Dodge_Min, Attack20019.SkillRange.Dodge_Max, Attack20019.SkillAngle.Dodge, Attack20019.SkillProb.Dodge)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.aimPos = Vector3.zero
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.skillCDList = Attack20019.SkillCd
	self.attackNode = self:create()
end

function Attack20019:create()
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
						Hero20019_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20019_Define.SkillType.SkillS
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20019_Define.SkillType.SkillAimShoot
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20019_Define.SkillType.SkillAimShoot, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 1),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.SequenceNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20019_Define.SkillType.SkillL, 1),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
						}, self.instance:GetAnimalId(), {
							3,
							2,
							1
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == true
					end),
					BT.SequenceNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20019_Define.SkillType.SkillL, 1),
						BT.RandomNode:create({
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
							BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
						}, self.instance:GetAnimalId())
					})
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.IsSkillingByIdNode:create(self.instance, Hero20019_Define.SkillType.SkillL, 0),
								BT.IsHitNode:create(self.instance)
							}),
							BT.CommonNode:create(function()
								self.instance:GetBrain().alertType = Alert.Type.None
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetBrain().alertType == Alert.Type.Skilling
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsTargetWithinAngleNode:create(self.instance, Attack20019.SkillAngle.SkillL),
									BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
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
							BT.IsSkillCdNode:create(self.instance, Hero20019_Define.SkillType.SkillL),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20019.SkillRange.SkillL, Attack20019.SkillAngle.SkillL),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20019_Define.SkillType.SkillS),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20019.SkillRange.SkillS, Attack20019.SkillAngle.SkillS),
							BT.GetRandomNode:create(Attack20019.SkillProb.SkillS, self.instance:GetAnimalId()),
							BT.IsCanAttackNode:create(self.instance),
							BT.SetSkillTargetNode:create(self.instance),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20019_Define.SkillType.SkillAimShoot),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20019.SkillRange.SkillAimShoot_Max, Attack20019.SkillAngle.SkillAimShoot),
							BT.IsCanAttackNode:create(self.instance),
							BT.CommonNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.aimPos:SetVector3(target:GetAimPosition())
									self.instance:SetSkillButtonTargetForAI(self.aimPos)
								end
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20019_Define.SkillType.SkillAimShoot, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20019.SkillRange.SkillAimShoot_Min) == false then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
									self.aimPos:SetVector3(target:GetAimPosition())
									self.instance:SetSkillButtonTargetForAI(self.aimPos)
									self.instance:SetAimDirectionForAI(self.aimPos)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20019.AimShootTime),
							BT.CommonNode:create(function()
								local animTargetPos = self.instance:GetAimTargetPosition()

								self.instance:SetSkillButtonTargetForAI(animTargetPos)
								self.aimPos:Set(0, 0, 0)
							end),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20019:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20019
