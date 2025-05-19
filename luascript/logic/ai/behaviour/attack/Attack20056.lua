-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20056.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20056 = class("Attack20056")

function Attack20056:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20056:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20056:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20056
