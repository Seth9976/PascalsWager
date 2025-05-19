-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Hover.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Hover = class("Hover")
Hover.static.MaxTime = 1.5
Hover.static.MinTime = 1.2
Hover.static.MaxDistance = 15
Hover.static.KeepMoveDis = 4
Hover.static.KeepProb = 0.7
Hover.static.LackEnergyPercent = 0.2
Hover.static.BreakStateDistance = 0.5
Hover.static.BreakStatePercent = 0.5
Hover.static.LockTime = 1
Hover.static.LockAngle = 10
Hover.static.BreakDistanceMin = 5
Hover.static.BreakDistanceMax = 10
Hover.static.HoverType = {
	Horizontal = 2,
	Slant = 7,
	Right = 6,
	Forward = 4,
	Back = 3,
	Left = 5,
	Normal = 1
}

function Hover:initialize(instance, hoverType, waitTimeRatio, hoverTimesMax, speedMode, isIgnoreDis)
	self.instance = instance
	self.moveHoriDir = GameAI.MoveDirection.None
	self.moveVertDir = GameAI.MoveDirection.None
	self.movePos = Vector3.zero
	self.changeStateTime = 0
	self.waitTime = 0
	self.waitTimeRatio = waitTimeRatio
	self.hoverType = hoverType
	self.hoverTimesMax = hoverTimesMax
	self.hoverTimes = 1
	self.speedMode = speedMode
	self.isIgnoreDis = isIgnoreDis
	self.animalGrade = 0
	self.hoverNode = self:create()
end

function Hover:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
		BT.ConditionNode:create(function()
			local target = self.instance:GetBrain():GetAnimalTarget()

			if self.instance:IsSkilling() == false then
				if target ~= nil and target:IsDead() == false and target:IsShow() == true then
					self.instance:SetOrientation(target:GetPosByWorldPos())

					if GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), Hover.LockAngle) == true then
						self.instance:SetLockId(target:GetAnimalId())
					end
				end

				self.waitTime = self.waitTime + Time.deltaTime
			end

			if self.waitTime > Hover.LockTime or self.instance:IsFreeMoveEnable() == false then
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
				BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
				BT.NotDecorator:create(BT.IsTargetMyTeamNode:create(self.instance)),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == Hover.HoverType.Forward
						end),
						BT.CommonNode:create(function()
							self.moveVertDir = GameAI.MoveDirection.Forward
						end),
						BT.CommonNode:create(function()
							self.moveHoriDir = GameAI.MoveDirection.None
						end)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == Hover.HoverType.Back
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
							return self.hoverType == Hover.HoverType.Horizontal
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
							return self.hoverType == Hover.HoverType.Slant
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
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == Hover.HoverType.Left
						end),
						BT.CommonNode:create(function()
							self.moveVertDir = GameAI.MoveDirection.None
						end),
						BT.CommonNode:create(function()
							self.moveHoriDir = GameAI.MoveDirection.Left
						end)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == Hover.HoverType.Right
						end),
						BT.CommonNode:create(function()
							self.moveVertDir = GameAI.MoveDirection.None
						end),
						BT.CommonNode:create(function()
							self.moveHoriDir = GameAI.MoveDirection.Right
						end)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.hoverType == Hover.HoverType.Normal
						end),
						BT.RandomNode:create({
							BT.CommonNode:create(function()
								self.moveHoriDir = GameAI.MoveDirection.Left
								self.moveVertDir = GameAI.MoveDirection.None
							end),
							BT.CommonNode:create(function()
								self.moveHoriDir = GameAI.MoveDirection.Right
								self.moveVertDir = GameAI.MoveDirection.None
							end),
							BT.CommonNode:create(function()
								self.moveHoriDir = GameAI.MoveDirection.None
								self.moveVertDir = GameAI.MoveDirection.Back
							end)
						}, self.instance:GetAnimalId())
					})
				}),
				BT.CommonNode:create(function()
					if self.hoverTimes <= 1 then
						self.instance:ResetMoveSpeedParam()
					end

					if self.instance:GetHatredTargetId() > 0 then
						self.instance:SetHatredTargetId(0)
					end

					self.changeStateTime = self.waitTimeRatio * (MathHelper.getRandom(Hover.MinTime * 10, Hover.MaxTime * 10, self.instance:GetAnimalId()) * 0.1)
					self.waitTime = 0
					self.animalGrade = self.instance:GetGrade()
				end),
				BT.ConditionWaitNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target == nil or target:IsDead() == true or target:IsShow() == false then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if (self.isIgnoreDis ~= nil and self.isIgnoreDis == false or self.instance:GetBrain():IsAnimalCrazy() == true) and self.waitTime >= self.changeStateTime * Hover.BreakStatePercent and GameAI.GetAnimalDistance(self.instance, target, true) < Hover.BreakStateDistance then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if self.instance:IsDead() == true or self.instance:IsFreeMoveEnable() == false or self.instance:GetHatredTargetId() > 0 or self.instance:IsBoss() == true and self.instance:GetGrade() ~= self.animalGrade then
						self.instance:SetHatredTargetId(0)

						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Hover.MaxDistance) == false then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if GameAI.IsTargetAttacking(self.instance, target) and math.floor(target:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)) > 0 then
						local targetSkillType = target:GetSkillTypeForAI()

						if targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Hover.BreakDistanceMin) == true or targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar and GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), Hover.BreakDistanceMax) == true then
							self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

							return true
						end
					end

					self.movePos:SetVector3(self.instance:GetPosByWorldPos())

					if self.moveHoriDir ~= GameAI.MoveDirection.None then
						if self.moveHoriDir == GameAI.MoveDirection.Left then
							self.movePos:Add(self.instance:GetLeft():Mul(4))
						elseif self.moveHoriDir == GameAI.MoveDirection.Right then
							self.movePos:Add(self.instance:GetRight():Mul(4))
						end
					end

					if self.moveVertDir ~= GameAI.MoveDirection.None then
						if self.moveVertDir == GameAI.MoveDirection.Forward then
							self.movePos:Add(self.instance:GetForward():Mul(2))
						elseif self.moveVertDir == GameAI.MoveDirection.Back then
							self.movePos:Add(self.instance:GetBack():Mul(2))
						end
					end

					self.movePos = self.instance:FindPathPos(self.movePos)
					self.movePos.y = self.instance:GetGroundY()

					self.instance:SetTargetByWorldPos(self.movePos, true)

					if self.speedMode ~= nil then
						self.instance:SetMoveSpeedMode(self.speedMode)
					else
						self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
					end

					self.waitTime = self.waitTime + Time.deltaTime

					return self.waitTime >= self.changeStateTime or self.instance:GetBrain().behaviourState == GameAI.BehaviourState.Attack or GameAI.IsAnimalCanMove(self.instance, self.movePos - self.instance:GetPosByWorldPos(), GameAI.CheckMoveDistance) == false
				end),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover),
					BT.ConditionNode:create(function()
						return self.hoverTimes < self.hoverTimesMax
					end),
					BT.NotDecorator:create(BT.IsTargetWithinRangeNode:create(self.instance, Hover.KeepMoveDis)),
					BT.GetRandomNode:create(Hover.KeepProb, self.instance:GetAnimalId()),
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
					self.instance:StopMovement()

					self.waitTime = 0
					self.animalGrade = 0
				end),
				BT.ConditionWaitNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true then
						self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
					end

					return self.instance:IsDead() == true or self.instance:IsFreeSkillEnable() == false
				end, 0.2),
				BT.UnLockTargetNode:create(self.instance),
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Hover)
			})
		})
	})

	return btnode
end

return Hover
