-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/CounterAttack.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

CounterAttack = class("CounterAttack")

function CounterAttack:initialize(instance, skillRange, skillAngle, skillProb)
	self.instance = instance
	self.skillRange = skillRange
	self.skillAngle = skillAngle
	self.skillProb = skillProb
	self.counterAttackNode = self:create()
end

function CounterAttack:create()
	local btnode = BT.SequenceNode:create({
		BT.ConditionNode:create(function()
			return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.CounterAttack) == true
		end),
		BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
		BT.IsTargetAttackingNode:create(self.instance),
		BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, self.skillRange, self.skillAngle),
		BT.GetRandomNode:create(self.skillProb, self.instance:GetAnimalId()),
		BT.ConditionNode:create(function()
			local target = self.instance:GetBrain():GetAnimalTarget()
			local skillIndex, skillCombo = target:GetSkillingData()

			return target ~= nil and AnimalBase.IsSkillCounterAttackedEnable(target:GetHeroId(), skillIndex, skillCombo)
		end),
		BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special)
	})

	return btnode
end

return CounterAttack
