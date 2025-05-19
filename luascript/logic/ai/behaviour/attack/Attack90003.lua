-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack90003.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack90003 = class("Attack90003")
Attack90003.static.SkillRange = {
	SkillL = 4
}

function Attack90003:initialize(instance)
	self.instance = instance
	self.followType = Follow.Type.motionless
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.attackNode = self:create()
end

function Attack90003:create()
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
							Hero90003_Define.SkillType.SkillL
						}),
						BT.WaitNode:create(1),
						BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
					})
				})
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.instance:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true
			end),
			BT.SetSkillTargetNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SequenceNode:create({
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
				BT.SequenceNode:create({
					BT.IsStartSkillingNode:create(self.instance),
					BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack90003.SkillRange.SkillL),
					BT.SetSkillTargetNode:create(self.instance),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				})
			})
		})
	})

	return btnode
end

function Attack90003:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack90003
