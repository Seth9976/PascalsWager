-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Threat.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Threat = class("Threat")
Threat.static.ThreatDistanceMin = 4.5
Threat.static.ThreatDistanceMax = 15
Threat.static.ThreatAngle = 15
Threat.static.ThreatMoveTime = 1.5

function Threat:initialize(instance)
	self.instance = instance
	self.moveTime = 0
	self.threatNode = self:create()
end

function Threat:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Threat),
		BT.SelectorNode:create({
			BT.IsSkillingNode:create(self.instance),
			BT.SequenceNode:create({
				BT.SelectorNode:create({
					BT.ConditionNode:create(function()
						return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Threat) == false
					end),
					BT.IsTargetMyTeamNode:create(self.instance),
					BT.IsTargetWithinRangeNode:create(self.instance, Threat.ThreatDistanceMin),
					BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Threat.ThreatDistanceMax)),
					BT.IsHitNode:create(self.instance),
					BT.ConditionNode:create(function()
						if self.moveTime > Threat.ThreatMoveTime then
							self.moveTime = 0

							return true
						end

						return false
					end)
				}),
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
			}),
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil then
						self.instance:SetOrientation(target:GetPosByWorldPos())
					end

					self.moveTime = self.moveTime + Time.deltaTime

					return GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Threat.ThreatAngle) == true
				end),
				BT.CommonNode:create(function()
					self.moveTime = 0
				end),
				BT.StopMovementNode:create(self.instance),
				BT.IsStartSkillingNode:create(self.instance),
				BT.RandomNode:create({
					BT.SequenceNode:create({
						BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat, AnimalBase_Define.SkillType.Threat, 1, false),
						BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat)
					}),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat)
				}, self.instance:GetAnimalId(), {
					2,
					1
				}),
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
			})
		})
	})

	return btnode
end

return Threat
