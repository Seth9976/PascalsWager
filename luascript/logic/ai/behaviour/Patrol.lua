-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Patrol.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Patrol = class("Patrol")

function Patrol:initialize(instance)
	self.instance = instance
	self.patrolNode = self:create()
end

function Patrol:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetBrain().wanderPos, GameAI.ArriveDistance)
			end),
			BT.StopMovementNode:create(self.instance),
			BT.WaitNode:create(MathHelper.getRandom(1, 2, self.instance:GetAnimalId())),
			BT.GetWanderPointNode:create(self.instance)
		}),
		BT.GoToWanderPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow)
	})

	return btnode
end

return Patrol
