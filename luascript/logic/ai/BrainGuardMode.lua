-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/BrainGuardMode.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/BrainBase")
require("LuaScript/Logic/AI/Behaviour/Follow")

local BT = require("LuaScript/Lib/behaviourtree")
local AttackStr = "LuaScript/Logic/AI/Behaviour/Attack/Attack"

BrainGuardMode = class("BrainGuardMode", BrainBase)

local sceneController, homeBase

BrainGuardMode.static.NearCenterRange = 5
BrainGuardMode.static.AwayCenterRange = 9
BrainGuardMode.static.NpcAttackRange = 7
BrainGuardMode.static.GetTargetInterval = 1
BrainGuardMode.static.PosState = {
	Initial = 0,
	AwayCenter = 2,
	NearCenter = 1
}

function BrainGuardMode:initialize(instance)
	BrainBase.initialize(self, instance)

	local attack = require(AttackStr .. instance:GetHeroId())

	self.attack = attack:new(instance)
	self.follow = follow:new(instance)
	self.posState = BrainGuardMode.PosState.Initial
	self.behaviourState = GameAI.BehaviourState.Attack
	self.inRangeEnemy = {}
	self.isEnd = false
	self.changeTargetFrameMonster = 0
	self.changeTargetFrameNPC = 0
	self.wanderPos = instance:GetWanderPoint()
	sceneController = ST_Main.GetSceneController()
	homeBase = sceneController:GetHomeBase()
	self.behaviorTree = self:createTree()
end

function BrainGuardMode:createTree()
	local btnode

	if instance:GetTeamId() == 1 then
		btnode = self:GuardModeNPC()
	elseif instance:GetTeamId() == 2 then
		btnode = self:GuardModeEnemy()
	end

	local beTree = BT.BehaviourTree:create(btnode)

	return beTree
end

function BrainGuardMode:GuardModeEnemy()
	local beTree = BT.SelectorNode:create({
		BT.IsEndNode:create(self.instance),
		BT.IsDeadNode:create(self.instance),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				self.changeTargetFrameMonster = self.changeTargetFrameMonster + Time.deltaTime

				local Interval = BrainGuardMode.GetTargetInterval

				if Interval < self.changeTargetFrameMonster then
					self.animalTarget = self.attack:GetTarget()
					self.changeTargetFrameMonster = 0
				end

				return self.animalTarget ~= nil
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.IsTargetTypeNode:create(self.instance, AnimalBase_Define.Type.Hero),
					BT.SelectorNode:create({
						self.attack.attackNode,
						self.follow.followNode
					})
				}),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.behaviourState == GameAI.BehaviourState.Hover
						end),
						BT.CommonNode:create(function()
							self.behaviourState = GameAI.BehaviourState.Attack
						end)
					}),
					self.attack.attackNode,
					BT.GoToWanderPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainGuardMode.PosState.Initial
			end),
			BT.WaitNode:create(2),
			BT.CommonNode:create(function()
				self.posState = BrainGuardMode.PosState.AwayCenter
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainGuardMode.PosState.AwayCenter
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return GameAI.IsAnimalWithinDistance(self.instance, self.instance.wanderPoint, BrainGuardMode.NearCenterRange)
					end),
					BT.CommonNode:create(function()
						self.posState = BrainGuardMode.PosState.NearCenter
					end)
				}),
				BT.GoToWanderPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainGuardMode.PosState.NearCenter
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return not GameAI.IsAnimalWithinDistance(self.instance, self.instance.wanderPoint, BrainGuardMode.AwayCenterRange)
					end),
					BT.CommonNode:create(function()
						self.posState = BrainGuardMode.PosState.AwayCenter
					end)
				}),
				BT.GoToWanderPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow)
			})
		})
	})

	return beTree
end

function BrainGuardMode:GuardModeNPC()
	local beTree = BT.SelectorNode:create({
		BT.IsEndNode:create(self.instance),
		BT.IsDeadNode:create(self.instance),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				self.changeTargetFrameNPC = self.changeTargetFrameNPC + Time.deltaTime

				local Interval = BrainGuardMode.GetTargetInterval

				if Interval < self.changeTargetFrameNPC then
					self.animalTarget = self.attack:GetTarget()
					self.changeTargetFrameNPC = 0
				end
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainGuardMode.PosState.Initial and GameAI.isPlayerNearNpc(self.instance)
			end),
			BT.CommonNode:create(function()
				self.posState = BrainGuardMode.PosState.AwayCenter

				ControllerGuardMode.GetNpc(self.instance)
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainGuardMode.PosState.AwayCenter
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return GameAI.IsAnimalWithinDistance(self.instance, self.instance.wanderPoint, BrainGuardMode.NearCenterRange)
					end),
					BT.CommonNode:create(function()
						self.posState = BrainGuardMode.PosState.NearCenter
					end)
				}),
				BT.GoToWanderPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Fast)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainGuardMode.PosState.NearCenter
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return not GameAI.IsAnimalWithinDistance(self.instance, self.instance.wanderPoint, BrainGuardMode.AwayCenterRange)
					end),
					BT.CommonNode:create(function()
						self.posState = BrainGuardMode.PosState.AwayCenter
					end)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return not GameAI.IsAnimalWithinDistance(self.instance, self.instance.wanderPoint, BrainGuardMode.NearCenterRange)
					end),
					BT.CommonNode:create(function()
						self.posState = BrainGuardMode.PosState.AwayCenter
					end)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						self.inRangeEnemy = GameAI.GetEnemyInRange(self.instance, homeBase:GetPosByWorldPos(), BrainGuardMode.NpcAttackRange)

						return table.nums(self.inRangeEnemy) > 0
					end),
					BT.ActionNode:create(function()
						local target = self.inRangeEnemy[1]

						self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
						self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
					end)
				})
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return beTree
end

function BrainGuardMode:Exit()
	BrainBase.Exit(self)

	self.attack = nil
	self.follow = nil
	self.animalTarget = nil
	self.inRangeEnemy = {}
end

return BrainGuardMode
