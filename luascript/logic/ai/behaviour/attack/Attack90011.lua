-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack90011.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack90011 = class("Attack90011")

function Attack90011:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack90011:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack90011:GetTarget()
	return nil
end

return Attack90011
