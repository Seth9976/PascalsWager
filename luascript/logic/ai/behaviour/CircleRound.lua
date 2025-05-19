-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/CircleRound.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

CircleRound = class("CircleRound")
CircleRound.static.MaxTime = 1.5
CircleRound.static.MinTime = 1.2
CircleRound.static.BreakStateDistance = 0.5
CircleRound.static.BreakStatePercent = 0.5
CircleRound.static.CircleRoundType = {
	Right = 3,
	Left = 2,
	Normal = 1
}

function CircleRound:initialize(instance, circleRoundType, waitTimeRatio, checkMoveDistance)
	self.instance = instance
	self.moveDir = GameAI.MoveDirection.None
	self.movePos = Vector3.zero
	self.changeStateTime = 0
	self.waitTime = 0
	self.circleRoundType = circleRoundType
	self.waitTimeRatio = waitTimeRatio
	self.checkMoveDistance = checkMoveDistance or GameAI.CheckMoveDistance
	self.animalGrade = 0
	self.circleRoundNode = self:create()
end

function CircleRound:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.CircleRound),
		BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.NotDecorator:create(BT.IsTargetMyTeamNode:create(self.instance)),
				BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.circleRoundType == CircleRound.CircleRoundType.Normal
						end),
						BT.RandomNode:create({
							BT.CommonNode:create(function()
								self.moveDir = GameAI.MoveDirection.Left
							end),
							BT.CommonNode:create(function()
								self.moveDir = GameAI.MoveDirection.Right
							end)
						}, self.instance:GetAnimalId())
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.circleRoundType == CircleRound.CircleRoundType.Left
						end),
						BT.CommonNode:create(function()
							self.moveDir = GameAI.MoveDirection.Left
						end)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.circleRoundType == CircleRound.CircleRoundType.Right
						end),
						BT.CommonNode:create(function()
							self.moveDir = GameAI.MoveDirection.Right
						end)
					})
				}),
				BT.CommonNode:create(function()
					if self.instance:GetHatredTargetId() > 0 then
						self.instance:SetHatredTargetId(0)
					end

					local heroExtData = self.instance:GetBrain():GetHeroExtData()

					self.changeStateTime = self.waitTimeRatio * (MathHelper.getRandom(CircleRound.MinTime * 10, CircleRound.MaxTime * 10, self.instance:GetAnimalId()) * 0.1)
					self.waitTime = 0
					self.animalGrade = self.instance:GetGrade()
				end),
				BT.UnLockTargetNode:create(self.instance),
				BT.ConditionWaitNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target == nil or target:IsDead() == true or target:IsShow() == false or self.instance:IsBoss() == true and self.instance:GetGrade() ~= self.animalGrade then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					local dir = target:GetPosByWorldPos() - self.instance:GetPosByWorldPos()
					local vertDir = Vector3.zero

					if self.moveDir == GameAI.MoveDirection.Right then
						vertDir:Set(dir.z, dir.y, -dir.x)
					else
						vertDir:Set(-dir.z, dir.y, dir.x)
					end

					dir:Add(vertDir:Mul(2))
					self.movePos:SetVector3(self.instance:GetPosByWorldPos())
					self.movePos:Add(dir)

					self.movePos.y = self.instance:GetGroundY()

					self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)

					self.movePos = self.instance:FindPathPos(self.movePos)

					self.instance:SetTargetByWorldPos(self.movePos, true)

					vertDir = nil
					dir = nil
					self.waitTime = self.waitTime + Time.deltaTime

					return self.waitTime >= self.changeStateTime or self.instance:IsDead() == true or self.instance:IsFreeMoveEnable() == false or self.instance:GetBrain().behaviourState == GameAI.BehaviourState.Attack or GameAI.IsAnimalCanMove(self.instance, self.instance:GetForward(), self.checkMoveDistance) == false or self.instance:GetHatredTargetId() > 0 or self.waitTime >= self.changeStateTime * CircleRound.BreakStatePercent and GameAI.GetAnimalDistance(self.instance, target, true) < CircleRound.BreakStateDistance
				end),
				BT.CommonNode:create(function()
					self.instance:SetHatredTargetId(0)
					self.movePos:Set(0, 0, 0)
					self.instance:StopMovement()

					self.moveDir = GameAI.MoveDirection.None
					self.waitTime = 0
					self.animalGrade = 0
					self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
				end),
				BT.ConditionWaitNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true then
						self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
					end

					return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
				end, 0.2)
			}),
			BT.SequenceNode:create({
				BT.StopMovementNode:create(self.instance),
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
			})
		})
	})

	return btnode
end

return CircleRound
