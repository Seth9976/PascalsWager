-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack90008.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack90008 = class("Attack90008")

function Attack90008:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack90008:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack90008:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack90008
