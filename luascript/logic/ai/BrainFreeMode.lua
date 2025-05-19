-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/BrainFreeMode.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/BrainBase")
require("LuaScript/Logic/AI/Behaviour/Follow")

local BT = require("LuaScript/Lib/behaviourtree")
local AttackStr = "LuaScript/Logic/AI/Behaviour/Attack/Attack"

BrainFreeMode = class("BrainFreeMode", BrainBase)

local sceneController, gameController

function BrainFreeMode:initialize(instance)
	BrainBase.initialize(self, instance)

	local attack = require(AttackStr .. instance:GetHeroId())

	self.attack = attack:new(instance)
	self.follow = Follow:new(instance)
	self.behaviourState = GameAI.BehaviourState.Attack
	self.isEnd = false
	sceneController = ST_Main.GetSceneController()
	gameController = sceneController:GetGameController()
	self.behaviorTree = self:createTree()
end

function BrainFreeMode:createTree()
	local btnode

	btnode = self:FreeModel()

	local beTree = BT.BehaviourTree:create(btnode)

	return beTree
end

function BrainFreeMode:FreeModel()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.isEnd == true or self.instance:IsDead() or gameController:IsStatus(ControllerFreeMode.Status.Normal) == false or self.instance:IsStop() == true or UILayerCtrl.IsCurrentLayerCurtain()
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget == nil then
					self.animalTarget = self.attack:GetTarget()
				end

				if self.animalTarget ~= nil then
					local audioName = self.instance:GetModelName() .. "/grunts"

					AudioCtrl.StopHeroAudio(audioName, self.instance:GetAnimalId())

					return true
				end

				return false
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainFreeMode:Exit()
	BrainBase.Exit(self)

	self.attack = nil
	self.follow = nil
end

return BrainFreeMode
