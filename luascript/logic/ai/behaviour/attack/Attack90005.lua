-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack90005.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack90005 = class("Attack90005")

function Attack90005:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack90005:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack90005:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack90005
