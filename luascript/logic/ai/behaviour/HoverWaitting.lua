-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/HoverWaitting.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

HoverWaitting = class("HoverWaitting")
HoverWaitting.static.MaxTime = 1.5
HoverWaitting.static.MinTime = 1
HoverWaitting.static.MaxDistance = 10
HoverWaitting.static.LockTime = 1

function HoverWaitting:initialize(instance, waitTimeRatio)
	self.instance = instance
	self.moveHoriDir = GameAI.MoveDirection.None
	self.moveVertDir = GameAI.MoveDirection.None
	self.movePos = Vector3.zero
	self.changeStateTime = 0
	self.waitTime = 0
	self.waitTimeRatio = waitTimeRatio
	self.hoverTimes = 1
	self.hoverWaittingNode = self:create()
end

function HoverWaitting:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverWaitting),
		BT.ConditionNode:create(function()
			local target = self.instance:GetBrain():GetAnimalTarget()

			if self.instance:IsSkilling() == false then
				if target ~= nil and target:IsDead() == false and target:IsShow() == true then
					self.instance:SetOrientation(target:GetPosByWorldPos())
					self.instance:SetLockId(target:GetAnimalId())
				end

				self.waitTime = self.waitTime + Time.deltaTime
			end

			if self.waitTime > HoverWaitting.LockTime or self.instance:IsFreeMoveEnable() == false then
				self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
				self.waitTime = 0

				return true
			elseif self.instance:IsLockingPlayer() == true then
				self.waitTime = 0

				return true
			end

			return false
		end),
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					return self.instance:IsLockingPlayer() == true
				end),
				BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
				BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
				BT.NotDecorator:create(BT.IsTargetMyTeamNode:create(self.instance)),
				BT.SequenceNode:create({
					BT.RandomNode:create({
						BT.CommonNode:create(function()
							if self.hoverTimes > 1 and self.moveHoriDir == GameAI.MoveDirection.Left then
								self.moveHoriDir = GameAI.MoveDirection.Right
							else
								self.moveHoriDir = GameAI.MoveDirection.Left
							end
						end),
						BT.CommonNode:create(function()
							if self.hoverTimes > 1 and self.moveHoriDir == GameAI.MoveDirection.Right then
								self.moveHoriDir = GameAI.MoveDirection.Left
							else
								self.moveHoriDir = GameAI.MoveDirection.Right
							end
						end)
					}, self.instance:GetAnimalId()),
					BT.CommonNode:create(function()
						self.moveVertDir = GameAI.MoveDirection.None
					end)
				}),
				BT.CommonNode:create(function()
					if self.hoverTimes <= 1 then
						self.instance:ResetMoveSpeedParam()
					end

					self.changeStateTime = self.waitTimeRatio * (MathHelper.getRandom(HoverWaitting.MinTime * 10, HoverWaitting.MaxTime * 10, self.instance:GetAnimalId()) * 0.1)
					self.waitTime = 0
				end),
				BT.ConditionWaitNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target == nil or target:IsDead() == true or target:IsShow() == false then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if self.instance:IsDead() == true or target ~= nil and target:IsDead() == true or self.instance:IsFreeMoveEnable() == false or self.instance:GetHatredTargetId() > 0 then
						self.instance:SetHatredTargetId(0)

						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					self.movePos:SetVector3(self.instance:GetPosByWorldPos())

					if GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), HoverWaitting.MaxDistance) == false then
						local dir = target:GetPosByWorldPos() - self.instance:GetPosByWorldPos()

						self.movePos:Add(dir)

						self.moveHoriDir = GameAI.MoveDirection.None
						self.moveVertDir = GameAI.MoveDirection.None
					end

					if self.moveHoriDir ~= GameAI.MoveDirection.None then
						if self.moveHoriDir == GameAI.MoveDirection.Left then
							self.movePos:Add(self.instance:GetLeft())
						elseif self.moveHoriDir == GameAI.MoveDirection.Right then
							self.movePos:Add(self.instance:GetRight())
						end
					end

					if self.moveVertDir ~= GameAI.MoveDirection.None then
						if self.moveVertDir == GameAI.MoveDirection.Forward then
							self.movePos:Add(self.instance:GetForward())
						elseif self.moveVertDir == GameAI.MoveDirection.Back then
							self.movePos:Add(self.instance:GetBack())
						end
					end

					self.movePos.y = self.instance:GetGroundY()

					self.instance:SetTargetByWorldPos(self.movePos, false)
					self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)

					self.waitTime = self.waitTime + Time.deltaTime

					return self.waitTime >= self.changeStateTime or self.instance:GetBrain().behaviourState == GameAI.BehaviourState.Attack or GameAI.IsAnimalCanMove(self.instance, self.movePos - self.instance:GetPosByWorldPos(), GameAI.CheckMoveDistance) == false
				end),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverWaitting),
					BT.CommonNode:create(function()
						self.hoverTimes = self.hoverTimes + 1
						self.waitTime = 0
					end)
				})
			}),
			BT.SequenceNode:create({
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
				BT.CommonNode:create(function()
					self.hoverTimes = 1
					self.moveVertDir = GameAI.MoveDirection.None
					self.moveHoriDir = GameAI.MoveDirection.None

					self.movePos:Set(0, 0, 0)

					self.waitTime = 0

					self.instance:StopMovement()

					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true then
						self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
					end
				end),
				BT.UnLockTargetNode:create(self.instance),
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverWaitting)
			})
		})
	})

	return btnode
end

return HoverWaitting
