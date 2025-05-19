-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20038.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20038 = class("Attack20038")

function Attack20038:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20038:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20038:GetTarget()
	return nil
end

return Attack20038
