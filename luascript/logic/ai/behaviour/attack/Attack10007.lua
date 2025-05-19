-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack10007.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack10007 = class("Attack10007")

function Attack10007:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.Default
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack10007:create()
	local btnode = BT.SelectorNode:create({})

	return btnode
end

function Attack10007:GetTarget()
	return nil
end

return Attack10007
