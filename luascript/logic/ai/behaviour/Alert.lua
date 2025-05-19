-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Alert.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Alert = class("Alert")
Alert.static.Type = {
	Normal = 1,
	Call = 4,
	Special = 3,
	Skilling = 2,
	None = 0
}
Alert.static.AlertDistanceMin = 5.5
Alert.static.AlertDistanceMax = 17
Alert.static.AlertAngle = 15
Alert.static.AlertMoveTime = 1.5

function Alert:initialize(instance)
	self.instance = instance
	self.moveTime = 0
	self.alertNode = self:create()
end

function Alert:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Alert),
		BT.SelectorNode:create({
			BT.IsSkillingNode:create(self.instance),
			BT.SequenceNode:create({
				BT.SelectorNode:create({
					BT.ConditionNode:create(function()
						return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Alert) == false
					end),
					BT.IsTargetWithinRangeNode:create(self.instance, Alert.AlertDistanceMin),
					BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Alert.AlertDistanceMax)),
					BT.IsHitNode:create(self.instance)
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

					return self.moveTime > Alert.AlertMoveTime or GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Alert.AlertAngle) == true
				end),
				BT.CommonNode:create(function()
					self.moveTime = 0
				end),
				BT.StopMovementNode:create(self.instance),
				BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Threat),
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
			})
		})
	})

	return btnode
end

return Alert
