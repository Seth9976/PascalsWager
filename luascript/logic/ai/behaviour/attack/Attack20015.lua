-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20015.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/HoverInDefence")
require("LuaScript/Logic/AI/Behaviour/HoverKeep")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/Dodge")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20015 = class("Attack20015")
Attack20015.static.SkillProb = {
	Dodge = 0.6
}
Attack20015.static.SkillCd = {
	{
		AnimalBase_Define.SkillType.Dodge,
		4
	}
}
Attack20015.static.SkillRange = {
	Dodge_Max = 7,
	SkillL = 4.5,
	SkillNH = 4.5,
	SkillDefence = 10,
	Dodge_Min = 5
}
Attack20015.static.SkillAngle = {
	SkillL = 55,
	SkillNH = 60,
	SkillO = 55,
	SkillDefence = 55,
	Dodge = 55
}
Attack20015.static.HoverTimeRatio = 3.5
Attack20015.static.HoverBreakDistance = 4.5
Attack20015.static.WaitCallTime = 15
Attack20015.static.HitMaxTime = 2

function Attack20015:initialize(instance)
	self.instance = instance
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20015.HoverTimeRatio, 2)
	self.hoverInDefence = HoverInDefence:new(instance, HoverInDefence.HoverType.Normal, Attack20015.HoverTimeRatio, 2, Hero20015_Define.SkillType.SkillDefence)
	self.hoverKeep = HoverKeep:new(instance, Attack20015.HoverTimeRatio, Attack20015.HoverBreakDistance)
	self.dodge = Dodge:new(instance, Attack20015.SkillRange.Dodge_Min, Attack20015.SkillRange.Dodge_Max, Attack20015.SkillAngle.Dodge, Attack20015.SkillProb.Dodge)
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.followType = Follow.Type.Hover
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.isDefence = false
	self.isCall = false
	self.skillWaitTime = 0
	self.isSkillH = false
	self.skillCDList = Attack20015.SkillCd
	self.attackNode = self:create()
end

function Attack20015:create()
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
						Hero20015_Define.SkillType.SkillDefence
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, Hero20015_Define.SkillType.SkillDefence, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20015_Define.SkillType.SkillO
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20015_Define.SkillType.SkillH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy)
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
						Hero20015_Define.SkillType.SkillL
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20015_Define.SkillType.SkillNH
					}),
					BT.WaitNode:create(1),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.ConditionNode:create(function()
						local nowTime = TimeHelper.getNowTime()

						return self.isCall == true and nowTime > Attack20015.WaitCallTime + self.skillWaitTime and self.isSkillH == false
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
					BT.CommonNode:create(function()
						self.skillWaitTime = 0
						self.isSkillH = true
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				self.alert.alertNode,
				self.threat.threatNode,
				self.hoverInDefence.hoverInDefenceNode,
				self.hover.hoverNode,
				self.dodge.dodgeNode,
				self.hoverKeep.hoverKeepNode,
				BT.SequenceNode:create({
					BT.IsTargetAttackingNode:create(self.instance),
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()
						local targetSkillType = target:GetSkillTypeForAI()

						return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
					end),
					BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20015.SkillRange.SkillDefence, Attack20015.SkillAngle.SkillDefence),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
				}),
				BT.SequenceNode:create({
					BT.SelectorNode:create({
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20015_Define.SkillType.SkillL, 1),
						BT.IsSkillIndexChangeNode:create(self.instance, Hero20015_Define.SkillType.SkillNH, 1)
					}),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsSkillIndexChangeNode:create(self.instance, AnimalBase_Define.SkillType.Dodge, 1),
					BT.RandomNode:create({
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
					}, self.instance:GetAnimalId())
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20015_Define.SkillType.SkillO, 1),
							BT.CommonNode:create(function()
								self.isCall = true
							end)
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.ConditionNode:create(function()
								local heroExtData = self.instance:GetBrain():GetHeroExtData()

								if self.isCall == false then
									if heroExtData ~= nil then
										if heroExtData.CallMonsterIdList ~= nil then
											return true
										end
									else
										return true
									end
								end
							end),
							BT.IsTargetWithinAngleNode:create(self.instance, Attack20015.SkillAngle.SkillO),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Option),
							BT.CommonNode:create(function()
								self.skillWaitTime = TimeHelper.getNowTime()
							end)
						}),
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, Hero20015_Define.SkillType.SkillDefence, 4),
							BT.ConditionNode:create(function()
								return GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true
							end),
							BT.IsSkillComboNode:create(self.instance),
							BT.IsTargetWithinRangeNode:create(self.instance, Attack20015.SkillRange.SkillL),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.RandomNode:create({
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack20015.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20015.SkillRange.SkillL, Attack20015.SkillAngle.SkillL),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							}),
							BT.SequenceNode:create({
								BT.IsStartSkillingNode:create(self.instance, Attack20015.HitMaxTime),
								BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20015.SkillRange.SkillNH, Attack20015.SkillAngle.SkillNH),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewHeavy)
							})
						}, self.instance:GetAnimalId(), {
							3,
							1
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20015:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20015
