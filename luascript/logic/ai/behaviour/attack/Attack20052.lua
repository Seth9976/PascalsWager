-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20052.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20052 = class("Attack20052")

function Attack20052:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20052:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20052:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20052
