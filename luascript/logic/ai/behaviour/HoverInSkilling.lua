-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/HoverInSkilling.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

HoverInSkilling = class("HoverInSkilling")
HoverInSkilling.static.HoverType = {
	Horizontal = 2,
	Vertical = 3,
	Normal = 1
}
HoverInSkilling.static.MaxTime = 1.5
HoverInSkilling.static.MinTime = 1
HoverInSkilling.static.LockTime = 1

function HoverInSkilling:initialize(instance, hoverType, waitTimeRatio)
	self.instance = instance
	self.moveHoriDir = GameAI.MoveDirection.None
	self.moveVertDir = GameAI.MoveDirection.None
	self.movePos = Vector3.zero
	self.changeStateTime = 0
	self.waitTime = 0
	self.waitTimeRatio = waitTimeRatio
	self.hoverType = hoverType
	self.hoverTimes = 1
	self.animalGrade = 0
	self.hoverInSkillingNode = self:create()
end

function HoverInSkilling:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInSkilling),
		BT.ConditionNode:create(function()
			local target = self.instance:GetBrain():GetAnimalTarget()

			if target ~= nil and target:IsDead() == false and target:IsShow() == true then
				self.instance:SetOrientation(target:GetPosByWorldPos())
				self.instance:SetLockId(target:GetAnimalId())
			end

			if self.waitTime > HoverInSkilling.LockTime or self.instance:IsFreeMoveEnable() == false then
				self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
				self.waitTime = 0

				return true
			elseif self.instance:IsLockingPlayer() == true then
				self.waitTime = 0

				return true
			end

			self.waitTime = self.waitTime + Time.deltaTime

			return false
		end),
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					return self.instance:IsLockingPlayer() == true
				end),
				BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
				BT.NotDecorator:create(BT.IsTargetMyTeamNode:create(self.instance)),
				BT.IsSkillingNode:create(self.instance),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == HoverInSkilling.HoverType.Vertical
						end),
						BT.CommonNode:create(function()
							self.moveVertDir = GameAI.MoveDirection.Back
						end),
						BT.CommonNode:create(function()
							self.moveHoriDir = GameAI.MoveDirection.None
						end)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == HoverInSkilling.HoverType.Horizontal
						end),
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
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == HoverInSkilling.HoverType.Normal
						end),
						BT.SequenceNode:create({
							BT.CommonNode:create(function()
								self.moveVertDir = GameAI.MoveDirection.Back
							end),
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
							}, self.instance:GetAnimalId())
						})
					})
				}),
				BT.CommonNode:create(function()
					if self.hoverTimes <= 1 then
						self.instance:ResetMoveSpeedParam()
					end

					self.changeStateTime = self.waitTimeRatio * (MathHelper.getRandom(HoverInSkilling.MinTime * 10, HoverInSkilling.MaxTime * 10, self.instance:GetAnimalId()) * 0.1)
					self.waitTime = 0
					self.animalGrade = self.instance:GetGrade()
				end),
				BT.ConditionWaitNode:create(function()
					if self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false or self.instance:IsSkilling() == false or self.instance:IsBoss() == true and self.instance:GetGrade() ~= self.animalGrade then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					self.movePos:SetVector3(self.instance:GetPosByWorldPos())

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

					self.waitTime = self.waitTime + Time.deltaTime

					return self.waitTime >= self.changeStateTime or self.instance:GetBrain().behaviourState == GameAI.BehaviourState.Attack or GameAI.IsAnimalCanMove(self.instance, self.movePos - self.instance:GetPosByWorldPos(), GameAI.CheckMoveDistance) == false
				end),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInSkilling),
					BT.ConditionNode:create(function()
						return self.instance:IsSkilling() == true
					end),
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
					self.animalGrade = 0

					self.instance:StopMovement()

					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true then
						self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
					end
				end),
				BT.UnLockTargetNode:create(self.instance),
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInSkilling)
			})
		})
	})

	return btnode
end

return HoverInSkilling
