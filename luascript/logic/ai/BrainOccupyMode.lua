-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/BrainOccupyMode.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/BrainBase")
require("LuaScript/Logic/AI/Behaviour/Follow")
require("LuaScript/Logic/AI/Behaviour/Patrol")

local BT = require("LuaScript/Lib/behaviourtree")
local AttackStr = "LuaScript/Logic/AI/Behaviour/Attack/Attack"

BrainOccupyMode = class("BrainOccupyMode", BrainBase)

local sceneController, gameController
local zoneBList = {}

BrainOccupyMode.static.ZoneRange = 5
BrainOccupyMode.static.AwayZoneRange = 12
BrainOccupyMode.static.GoToZoneCRestTime = 5
BrainOccupyMode.static.GetTargetInterval = 1
BrainOccupyMode.static.PosState = {
	Initial = 0,
	NearZone = 1,
	AwayZone = 2
}

function BrainOccupyMode:initialize(instance)
	BrainBase.initialize(self, instance)

	local attack = require(AttackStr .. instance:GetHeroId())

	self.attack = attack:new(instance)
	self.follow = Follow:new(instance)
	self.patrol = Patrol:new(instance)
	self.posState = BrainOccupyMode.PosState.Initial
	self.behaviourState = GameAI.BehaviourState.Attack
	self.inZoneEnemy = {}
	self.wanderZone = nil
	self.isEnd = false
	self.changeTargetFrame = 0
	self.wanderPos = instance:GetWanderPoint()
	sceneController = ST_Main.GetSceneController()
	gameController = sceneController:GetGameController()
	zoneBList = gameController.zoneBList
	self.behaviorTree = self:createTree()
end

function BrainOccupyMode:createTree()
	local btnode

	btnode = self:OccupyModel()

	local beTree = BT.BehaviourTree:create(btnode)

	return beTree
end

function BrainOccupyMode:OccupyModel()
	local btnode = BT.SelectorNode:create({
		BT.IsEndNode:create(self.instance),
		BT.IsDeadNode:create(self.instance),
		BT.ConditionNode:create(function()
			return not gameController:IsStatus(ControllerOccupyMode.Status.Normal)
		end),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

				local Interval = BrainOccupyMode.GetTargetInterval

				if Interval < self.changeTargetFrame then
					self.animalTarget = self.attack:GetTarget()
					self.changeTargetFrame = 0
				end

				return self.animalTarget ~= nil
			end),
			BT.ConditionNode:create(function()
				return self.wanderZone ~= gameController.zoneC or self.posState ~= BrainOccupyMode.PosState.AwayZone
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainOccupyMode.PosState.Initial
			end),
			BT.CommonNode:create(function()
				self.wanderZone = GameAI.GetWanderZone(self.instance)
				self.posState = BrainOccupyMode.PosState.AwayZone
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local zoneC = gameController.zoneC
				local isGet, restTime = zoneC:GetOpenRestTime()

				return self.wanderZone ~= zoneC and (isGet == true and restTime <= BrainOccupyMode.GoToZoneCRestTime or zoneC:GetStatus() == OccupyZone.Status.Open or zoneC:GetStatus() == OccupyZone.Status.Ready)
			end),
			BT.CommonNode:create(function()
				self.wanderZone = GameAI.GetWanderZone(self.instance)
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.wanderZone == nil
			end),
			BT.CommonNode:create(function()
				self.wanderZone = GameAI.GetWanderZone(self.instance)
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local tmpGroundType, tmpZoneType, tmpZoneId = self.instance:GetTouchGroundDataSimple()
						local pos = gameController:GetZonePosition(ControllerOccupyMode.ZoneType.ZoneC, gameController.zoneC:GetZoneId())

						return tmpGroundType == ControllerOccupyMode.ZoneType.ZoneC and tmpZoneId == gameController.zoneC:GetZoneId() and GameAI.IsAnimalWithinDistance(self.instance, pos, BrainOccupyMode.ZoneRange)
					end),
					self.patrol.patrolNode
				}),
				BT.ActionNode:create(function()
					local zonePos = gameController:GetZonePosition(ControllerOccupyMode.ZoneType.ZoneC, gameController.zoneC:GetZoneId())

					self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
					self.instance:SetTargetByWorldPos(zonePos, true)
				end)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local teamId = self.instance:GetTeamId()

				if self.wanderZone:GetType() == ControllerOccupyMode.ZoneType.ZoneC then
					local isGet, restTime = self.wanderZone:GetOpenRestTime()

					return isGet == true and restTime > BrainOccupyMode.GoToZoneCRestTime or self.wanderZone:GetStatus() == OccupyZone.Status.Keep
				else
					return self.wanderZone:GetStatus() == OccupyZone.Status.Keep and self.wanderZone:GetTeamId() == teamId
				end
			end),
			BT.StopMovementNode:create(self.instance),
			BT.WaitNode:create(MathHelper.getRandom(0, 2, self.instance:GetAnimalId())),
			BT.CommonNode:create(function()
				self.wanderZone = GameAI.GetWanderZone(self.instance)
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainOccupyMode.PosState.AwayZone
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local tmpGroundType, tmpZoneType, tmpZoneId = self.instance:GetTouchGroundDataSimple()
						local pos = gameController:GetZonePosition(self.wanderZone:GetType(), self.wanderZone:GetZoneId())

						if self.wanderZone:GetType() == ControllerOccupyMode.ZoneType.ZoneC then
							return tmpZoneType == self.wanderZone:GetType() and tmpZoneId == self.wanderZone:GetZoneId()
						else
							return tmpZoneType == self.wanderZone:GetType() and tmpZoneId == self.wanderZone:GetZoneId() and GameAI.IsAnimalWithinDistance(self.instance, pos, MathHelper.getRandom(1, BrainOccupyMode.ZoneRange, self.instance:GetAnimalId()))
						end
					end),
					BT.CommonNode:create(function()
						self.posState = BrainOccupyMode.PosState.NearZone
					end)
				}),
				BT.ActionNode:create(function()
					local zonePos = gameController:GetZonePosition(self.wanderZone:GetType(), self.wanderZone:GetZoneId())

					self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
					self.instance:SetTargetByWorldPos(zonePos, true)
				end)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainOccupyMode.PosState.NearZone
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local tmpGroundType, tmpZoneType, tmpZoneId = self.instance:GetTouchGroundDataSimple()
						local pos = gameController:GetZonePosition(self.wanderZone:GetType(), self.wanderZone:GetZoneId())

						return not GameAI.IsAnimalWithinDistance(self.instance, pos, BrainOccupyMode.AwayZoneRange) or tmpZoneType ~= self.wanderZone:GetType() or tmpZoneId ~= self.wanderZone:GetZoneId()
					end),
					BT.UnLockTargetNode:create(self.instance),
					BT.CommonNode:create(function()
						self.posState = BrainOccupyMode.PosState.AwayZone
					end)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						self.inZoneEnemy = GameAI.GetEnemyInZone(self.instance, self.wanderZone)

						return table.nums(self.inZoneEnemy) > 0
					end),
					BT.CommonNode:create(function()
						local target = self.inZoneEnemy[1]

						self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
						self.instance:SetTargetByWorldPos(target:GetFindPathPosForAI(), true)
					end)
				}),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.wanderZone:GetType() == ControllerOccupyMode.ZoneType.ZoneC
						end),
						self.patrol.patrolNode
					}),
					BT.StopMovementNode:create(self.instance)
				})
			})
		})
	})

	return btnode
end

function BrainOccupyMode:Exit()
	BrainBase.Exit(self)

	self.attack = nil
	self.follow = nil
	self.patrol = nil
	self.wanderZone = nil
	self.inZoneEnemy = {}
end

return BrainOccupyMode
