-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/HoverInDefence.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

HoverInDefence = class("Hover")
HoverInDefence.static.HoverType = {
	Horizontal = 2,
	Back = 4,
	Forward = 3,
	Normal = 1
}
HoverInDefence.static.MaxTime = 1.5
HoverInDefence.static.MinTime = 1
HoverInDefence.static.HoverTimesMax = 3
HoverInDefence.static.MaxDistance = 10
HoverInDefence.static.BreakStateDistance = 0.5
HoverInDefence.static.BreakStatePercent = 0.5
HoverInDefence.static.LockTime = 1
HoverInDefence.static.LockAngle = 15

function HoverInDefence:initialize(instance, hoverType, waitTimeRatio, hoverTimesMax, skillIndex, isBreak)
	self.instance = instance
	self.moveHoriDir = GameAI.MoveDirection.None
	self.moveVertDir = GameAI.MoveDirection.None
	self.movePos = Vector3.zero
	self.changeStateTime = 0
	self.waitTime = 0
	self.waitTimeRatio = waitTimeRatio
	self.hoverType = hoverType
	self.hoverTimesMax = hoverTimesMax or Hover.HoverTimesMax
	self.hoverTimes = 1
	self.skillIndex = skillIndex
	self.isBreak = isBreak
	self.animalGrade = 0
	self.hoverInDefenceNode = self:create()
end

function HoverInDefence:SetHoverInDefenceType(type)
	if type ~= nil then
		self.hoverType = type
	end
end

function HoverInDefence:IsHoverInDefenceType(type)
	if self.hoverType == type then
		return true
	end

	return false
end

function HoverInDefence:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
		BT.ConditionNode:create(function()
			local target = self.instance:GetBrain():GetAnimalTarget()

			if self.instance:IsSkilling() == false then
				if target ~= nil and target:IsDead() == false and target:IsShow() == true then
					self.instance:SetOrientation(target:GetPosByWorldPos())

					if GameAI.IsAnimalWithinAngle(self.instance, target:GetPosByWorldPos(), HoverInDefence.LockAngle) == true then
						self.instance:SetLockId(target:GetAnimalId())
					end
				end

				self.waitTime = self.waitTime + Time.deltaTime
			end

			if self.waitTime > HoverInDefence.LockTime or self.instance:IsFreeMoveEnable() == false then
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
			BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
			BT.SequenceNode:create({
				BT.IsHitNode:create(self.instance),
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
			}),
			BT.IsSkillingByIdNode:create(self.instance, self.skillIndex, 0),
			BT.SequenceNode:create({
				BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
				BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special, 0, 0, false)
			})
		}),
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
							return self.hoverType == HoverInDefence.HoverType.Forward
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
							return self.hoverType == HoverInDefence.HoverType.Back
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
							return self.hoverType == HoverInDefence.HoverType.Horizontal
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
							return self.hoverType == HoverInDefence.HoverType.Normal
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

					local heroExtData = self.instance:GetBrain():GetHeroExtData()

					self.changeStateTime = self.waitTimeRatio * (MathHelper.getRandom(HoverInDefence.MinTime * 10, HoverInDefence.MaxTime * 10, self.instance:GetAnimalId()) * 0.1)
					self.waitTime = 0
					self.animalGrade = self.instance:GetGrade()
				end),
				BT.ConditionWaitNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target == nil or target:IsDead() == true or target:IsShow() == false then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if self.instance:IsSkilling() == false or self.instance:IsFreeSkillEnable() == false or (self.isBreak == nil or self.isBreak == true) and GameAI.IsAnimalHitHand(self.instance:GetBrain():GetAnimalTarget()) == true or self.instance:IsBoss() == true and self.instance:GetGrade() ~= self.animalGrade then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					local targetState = target:GetSkillTypeForAI()
					local IsAttacking = target:IsSkillingSkill() and targetState == AnimalBase_Define.SkillTypeForAI.OffenseFar
					local isFace = not GameAI.IsAnimalBehind(target, self.instance)

					if GameAI.IsAnimalWithinDistance(self.instance, target:GetPosByWorldPos(), HoverInDefence.MaxDistance) == false and (IsAttacking == false or isFace == false) then
						self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack

						return true
					end

					if self.waitTime >= self.changeStateTime * HoverInDefence.BreakStatePercent and GameAI.GetAnimalDistance(self.instance, target, true) < HoverInDefence.BreakStateDistance then
						self.moveVertDir = GameAI.MoveDirection.None
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

					self.waitTime = self.waitTime + Time.deltaTime

					return self.waitTime >= self.changeStateTime or self.instance:GetBrain().behaviourState == GameAI.BehaviourState.Attack or GameAI.IsAnimalCanMove(self.instance, self.movePos - self.instance:GetPosByWorldPos(), GameAI.CheckMoveDistance) == false
				end),
				BT.SequenceNode:create({
					BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence),
					BT.IsSkillingByIdNode:create(self.instance, self.skillIndex, 0),
					BT.ConditionNode:create(function()
						return self.hoverTimes < self.hoverTimesMax
					end),
					BT.CommonNode:create(function()
						self.hoverTimes = self.hoverTimes + 1
						self.waitTime = 0
					end)
				})
			}),
			BT.SequenceNode:create({
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
				BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Special),
				BT.CommonNode:create(function()
					self.hoverTimes = 1
					self.moveVertDir = GameAI.MoveDirection.None
					self.moveHoriDir = GameAI.MoveDirection.None

					self.movePos:Set(0, 0, 0)

					self.waitTime = 0
					self.animalGrade = 0

					local button = self.instance:GetLongPressButton()

					self.instance:PressUpSkillButton(button)
					self.instance:LongPressSkillButton(0)
					self.instance:StopMovement()

					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true then
						self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
					end
				end),
				BT.UnLockTargetNode:create(self.instance),
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.HoverInDefence)
			})
		})
	})

	return btnode
end

return HoverInDefence
