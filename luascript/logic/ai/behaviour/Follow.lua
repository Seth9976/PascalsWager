-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Follow.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Follow = class("Follow")
Follow.Type = {
	Hover = 3,
	Stay = 2,
	Default = 1,
	motionless = 4,
	None = 0
}

function Follow:initialize(instance)
	self.instance = instance
	self.followNode = self:create()
end

function Follow:create()
	local btnode = BT.SelectorNode:create({
		BT.NotDecorator:create(BT.IsMoveEnableNode:create(self.instance)),
		BT.ConditionNode:create(function()
			local attack = self.instance:GetBrain().attack

			return attack.followType ~= nil and attack.followType == Follow.Type.None
		end),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local attack = self.instance:GetBrain().attack

				return attack.followType ~= nil and attack.followType == Follow.Type.Stay
			end),
			BT.StopMovementNode:create(self.instance),
			BT.CommonNode:create(function()
				local target = self.instance:GetBrain():GetAnimalTarget()

				if target ~= nil then
					self.instance:SetOrientation(target:GetPosByWorldPos())
				end
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local attack = self.instance:GetBrain().attack

				return attack.followType ~= nil and attack.followType == Follow.Type.Hover
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target == nil or not GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), HoverKeep.MaxDistance)
					end),
					BT.UnLockTargetNode:create(self.instance),
					BT.StopMovementNode:create(self.instance)
				}),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverKeep)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local attack = self.instance:GetBrain().attack

				return attack.followType ~= nil and attack.followType == Follow.Type.motionless
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
			BT.CommonNode:create(function()
				local followSpeed = AnimalBase_Define.SpeedMode.Normal
				local attack = self.instance:GetBrain().attack

				if attack.followSpeed ~= nil then
					followSpeed = attack.followSpeed
				end

				local target = self.instance:GetBrain():GetAnimalTarget()

				if target ~= nil and target:IsDead() == false and target:IsShow() == true then
					if self.instance:IsAnimatorInTransition() == true then
						self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
					else
						self.instance:SetMoveSpeedMode(followSpeed)
					end

					self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
				end
			end)
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

return Follow
