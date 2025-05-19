-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20031.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20031 = class("Attack20031")
Attack20031.static.SkillCd = {
	{
		Hero20031_Define.SkillType.SkillLP,
		1,
		true
	}
}
Attack20031.static.SkillRange = {
	SkillLP = 9
}
Attack20031.static.SkillAngle = {
	SkillLP = 15
}
Attack20031.static.SkillLPRangeMax = 11
Attack20031.static.SkillLPTime = 3.2
Attack20031.static.SkillLPHeight = 2.5

function Attack20031:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack20031.SkillCd
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Slow
	self.attackNode = self:create()
end

function Attack20031:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return DebugMonsterAISkill == true
			end),
			BT.SkillingChangeDirection:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.DebugAISkillingNode:create(self.instance, {
						Hero20031_Define.SkillType.SkillLP
					}),
					BT.WaitNode:create(1),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20031_Define.SkillType.SkillLP, 1, false),
					BT.ConditionWaitNode:create(function()
						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, 5),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SequenceNode:create({
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
				BT.SequenceNode:create({
					BT.IsSkillCdNode:create(self.instance, Hero20031_Define.SkillType.SkillLP),
					BT.IsStartSkillingNode:create(self.instance),
					BT.IsCanAttackNode:create(self.instance),
					BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20031.SkillRange.SkillLP, Attack20031.SkillAngle.SkillLP),
					BT.IsTargetWithinHeightNode:create(self.instance, Attack20031.SkillLPHeight),
					BT.SetSkillTargetNode:create(self.instance),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20031_Define.SkillType.SkillLP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return target ~= nil and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Attack20031.SkillLPRangeMax) == false or self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or GameAI.IsCanGetTarget(target) == false
					end, Attack20031.SkillLPTime),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				})
			})
		})
	})

	return btnode
end

function Attack20031:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20031
