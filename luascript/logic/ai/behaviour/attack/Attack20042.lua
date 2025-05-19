-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20042.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20042 = class("Attack20042")

function Attack20042:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20042:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack20042:GetTarget()
	return nil
end

return Attack20042
