-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20047.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20047 = class("Attack20047")
Attack20047.static.SkillCd = {
	{
		Hero20047_Define.SkillType.SkillLP,
		1.5,
		true
	}
}
Attack20047.static.SkillRange = {
	SkillLP = 35
}
Attack20047.static.SkillAngle = {
	SkillLP = 60
}
Attack20047.static.SkillLPTime = 4

function Attack20047:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack20047.SkillCd
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack20047:create()
	local btnode = BT.SelectorNode:create({
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					return DebugMonsterAISkill == true
				end),
				BT.SkillingChangeDirection:create(self.instance),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.IsStartSkillingNode:create(self.instance),
						BT.DebugAISkillingNode:create(self.instance, {
							Hero20047_Define.SkillType.SkillLP
						}),
						BT.WaitNode:create(1),
						BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20047_Define.SkillType.SkillLP, 1, false),
						BT.ConditionWaitNode:create(function()
							return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
						end, 5),
						BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
					})
				})
			})
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SequenceNode:create({
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
				BT.SequenceNode:create({
					BT.IsSkillCdNode:create(self.instance, Hero20047_Define.SkillType.SkillLP),
					BT.IsStartSkillingNode:create(self.instance),
					BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20047.SkillRange.SkillLP, Attack20047.SkillAngle.SkillLP),
					BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light, Hero20047_Define.SkillType.SkillLP, 1, false),
					BT.ConditionWaitNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
					end, Attack20047.SkillLPTime),
					BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				})
			})
		})
	})

	return btnode
end

function Attack20047:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20047
