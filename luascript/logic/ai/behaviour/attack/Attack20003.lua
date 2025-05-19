-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20003.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20003 = class("Attack20003")

function Attack20003:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.attackNode = self:create()
end

function Attack20003:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20003:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20003
