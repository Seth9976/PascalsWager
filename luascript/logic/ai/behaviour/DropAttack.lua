-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/DropAttack.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

DropAttack = class("DropAttack")

function DropAttack:initialize(instance)
	self.instance = instance
	self.dropAttackNode = self:create()
end

function DropAttack:create()
	local btnode = BT.SequenceNode:create({
		BT.ConditionNode:create(function()
			return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Drop) == true and self.instance:IsDrop() == true
		end),
		BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
	})

	return btnode
end

return DropAttack
