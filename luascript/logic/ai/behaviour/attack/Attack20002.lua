-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20002.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/Behaviour/Hover")
require("LuaScript/Logic/AI/Behaviour/Threat")
require("LuaScript/Logic/AI/Behaviour/Alert")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20002 = class("Attack20002")
Attack20002.static.SkillRange = {
	SkillL = 3.5,
	SkillAimShoot = 20,
	SkillShoot = 6
}
Attack20002.static.SkillCd = {
	{
		Hero20002_Define.SkillType.SkillAimShoot,
		3,
		true
	}
}
Attack20002.static.SkillAngle = {
	SkillL = 30,
	SkillAimShoot = 10,
	SkillShoot = 45
}
Attack20002.static.AimShootTime = 1.7
Attack20002.static.HoverTimeRatio = 2.5

function Attack20002:initialize(instance)
	self.instance = instance
	self.threat = Threat:new(instance)
	self.alert = Alert:new(instance)
	self.hover = Hover:new(instance, Hover.HoverType.Slant, Attack20002.HoverTimeRatio, 1)
	self.aimPos = Vector3.zero
	self.skillCDList = Attack20002.SkillCd
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20002:create()
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
						Hero20002_Define.SkillType.SkillAimShoot
					}),
					BT.WaitNode:create(1),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20002_Define.SkillType.SkillAimShoot, 1, false),
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
					BT.IsSkillingSkillNode:create(self.instance),
					BT.IsSkillingByIdNode:create(self.instance, Hero20002_Define.SkillType.SkillLLL, 0),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20002_Define.SkillType.SkillLLL
					}),
					BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				}),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20002_Define.SkillType.SkillLLL
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
				self.alert.alertNode,
				self.threat.threatNode,
				self.hover.hoverNode,
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:GetBrain():IsAnimalCrazy() == false
					end),
					BT.IsSkillIndexChangeNode:create(self.instance, Hero20002_Define.SkillType.SkillLLL, 3),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingSkillNode:create(self.instance),
							BT.IsSkillingByIdNode:create(self.instance, Hero20002_Define.SkillType.SkillLLL, 0),
							BT.IsSkillComboNode:create(self.instance),
							BT.NotDecorator:create(BT.IsSkillComboMoreThan:create(self.instance, 2)),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.instance:GetMonsterAILevel() == GameAI.AILevel.Easy
									end),
									BT.IsHitBySkillNode:create(self.instance, Hero20002_Define.SkillType.SkillLLL, 0),
									BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
								}),
								BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
							})
						}),
						BT.SequenceNode:create({
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20002.SkillRange.SkillL, Attack20002.SkillAngle.SkillL),
							BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
						}),
						BT.SequenceNode:create({
							BT.IsSkillCdNode:create(self.instance, Hero20002_Define.SkillType.SkillAimShoot),
							BT.IsStartSkillingNode:create(self.instance),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20002.SkillRange.SkillAimShoot, Attack20002.SkillAngle.SkillAimShoot),
							BT.IsCanAttackNode:create(self.instance),
							BT.CommonNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.aimPos:SetVector3(target:GetAimPosition())
									self.instance:SetSkillButtonTargetForAI(self.aimPos)
								end
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy, Hero20002_Define.SkillType.SkillAimShoot, 1, false),
							BT.ConditionWaitNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
									self.aimPos:SetVector3(target:GetAimPosition())
									self.instance:SetSkillButtonTargetForAI(self.aimPos)
									self.instance:SetAimDirectionForAI(self.aimPos)
								end

								return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
							end, Attack20002.AimShootTime),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Heavy),
							BT.CommonNode:create(function()
								local animTargetPos = self.instance:GetAimTargetPosition()

								self.instance:SetSkillButtonTargetForAI(animTargetPos)
								self.aimPos:Set(0, 0, 0)
							end)
						})
					})
				})
			})
		})
	})

	return btnode
end

function Attack20002:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20002
