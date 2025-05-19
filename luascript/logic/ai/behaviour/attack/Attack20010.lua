-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20010.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20010 = class("Attack20010")

function Attack20010:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20010:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20010:GetTarget()
	return nil
end

return Attack20010
