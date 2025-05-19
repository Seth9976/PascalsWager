-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20009.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20009 = class("Attack20009")

function Attack20009:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20009:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20009:GetTarget()
	return nil
end

return Attack20009
