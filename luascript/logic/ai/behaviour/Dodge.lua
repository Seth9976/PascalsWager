-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Dodge.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Dodge = class("Dodge")
Dodge.static.DodgeType = {
	Horizontal = 5,
	Forward = 2,
	Back = 1,
	Slant = 3,
	Normal = 4
}
Dodge.static.Aggressive = {
	High = 4,
	Few = 3,
	Low = 1,
	Normal = 2
}
Dodge.static.CDTime = 4
Dodge.static.HitTime = 1.5
Dodge.static.MoveTime1 = 0.05
Dodge.static.MoveTime2 = 0.5

function Dodge:initialize(instance, skillRangeMin, skillRangeMax, skillAngle, skillProb, skillIndex, aggressive, isCombo)
	self.instance = instance
	self.skillRangeMin = skillRangeMin
	self.skillRangeMax = skillRangeMax
	self.skillAngle = skillAngle
	self.skillProb = skillProb
	self.dodgeType = Dodge.DodgeType.Back
	self.aggressive = aggressive or Dodge.Aggressive.Low
	self.hitTime = 0
	self.DodgeDir = GameAI.MoveDirection.None
	self.IsTargetShowSkillCollider = false
	self.targetSkillTriggerValue = 0
	self.isCombo = isCombo
	self.skillIndex = skillIndex or AnimalBase_Define.SkillType.Dodge
	self.dodgeNode = self:create()
end

function Dodge:SetDodgeType(type)
	if type ~= nil then
		self.dodgeType = type
	end
end

function Dodge:IsDodgeType(type)
	if self.dodgeType == type then
		return true
	end

	return false
end

function Dodge:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.IsSkillingByIdNode:create(self.instance, self.skillIndex, 1),
			BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
			BT.ConditionNode:create(function()
				return AnimalBase.Config[self.instance:GetHeroId()].skillComboMax[self.skillIndex] > 1 and (self.isCombo == nil or self.isCombo == true) and self.dodgeType == Dodge.DodgeType.Back
			end),
			BT.IsSkillComboNode:create(self.instance),
			BT.GetRandomNode:create(self.skillProb, self.instance:GetAnimalId()),
			BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local isSkillEnable = self.instance:IsHaveSkill(self.skillIndex)

				if isSkillEnable == false then
					self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
				end

				local target = self.instance:GetBrain():GetAnimalTarget()

				if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsSkilling() == false then
					self.IsTargetShowSkillCollider = false
					self.targetSkillTriggerValue = 0
				end

				return isSkillEnable == true
			end),
			BT.SelectorNode:create({
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
				BT.SequenceNode:create({
					BT.IsSkillCdNode:create(self.instance, self.skillIndex),
					BT.IsTargetAttackingNode:create(self.instance),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, self.skillRangeMin, self.skillAngle),
							BT.GetRandomNode:create(self.skillProb, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									if target:IsSkilling() == true then
										local isEnableSkill = false

										if target:IsShowSkillCollider() == true and self.IsTargetShowSkillCollider == false then
											isEnableSkill = true
										end

										self.IsTargetShowSkillCollider = target:IsShowSkillCollider()

										return isEnableSkill
									else
										self.IsTargetShowSkillCollider = false

										return true
									end
								else
									return false
								end
							end)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()
								local targetSkillType = target:GetSkillTypeForAI()

								return targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar
							end),
							BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, self.skillRangeMax, self.skillAngle),
							BT.GetRandomNode:create(self.skillProb, self.instance:GetAnimalId()),
							BT.ConditionNode:create(function()
								local target = self.instance:GetBrain():GetAnimalTarget()

								if target ~= nil and target:IsDead() == false and target:IsShow() == true then
									if target:IsSkilling() == true then
										local isEnableSkill = false
										local triggerValue = math.floor(target:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger))

										if triggerValue > 0 and triggerValue > self.targetSkillTriggerValue then
											isEnableSkill = true
										end

										self.targetSkillTriggerValue = triggerValue

										return isEnableSkill
									else
										self.targetSkillTriggerValue = 0

										return true
									end
								else
									return false
								end
							end)
						})
					}),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local skillEnergy = self.instance:GetValue():GetSkillEnergy(self.skillIndex, 1)

								return skillEnergy <= 0 or skillEnergy < self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy)
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.aggressive == Dodge.Aggressive.Few
									end),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.dodgeType = Dodge.DodgeType.Back
										end),
										BT.CommonNode:create(function()
											self.dodgeType = Dodge.DodgeType.Slant
										end)
									}, self.instance:GetAnimalId())
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.aggressive == Dodge.Aggressive.High
									end),
									BT.RandomNode:create({
										BT.CommonNode:create(function()
											self.dodgeType = Dodge.DodgeType.Back
										end),
										BT.CommonNode:create(function()
											self.dodgeType = Dodge.DodgeType.Slant
										end)
									}, self.instance:GetAnimalId(), {
										1,
										2
									})
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.aggressive == Dodge.Aggressive.Normal
									end),
									BT.CommonNode:create(function()
										self.dodgeType = Dodge.DodgeType.Normal
									end)
								}),
								BT.SequenceNode:create({
									BT.ConditionNode:create(function()
										return self.aggressive == Dodge.Aggressive.Low
									end),
									BT.CommonNode:create(function()
										self.dodgeType = Dodge.DodgeType.Back
									end)
								})
							})
						}),
						BT.CommonNode:create(function()
							self.dodgeType = Dodge.DodgeType.Back
						end)
					}),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
					BT.CommonNode:create(function()
						self.hitTime = 0
					end)
				})
			}),
			BT.CommonNode:create(function()
				local skillEnergy = self.instance:GetValue():GetSkillEnergy(self.skillIndex, 1)

				if skillEnergy > 0 and skillEnergy > self.instance:GetValue():GetProperty(MS_HeroData.Property.Energy) then
					self.dodgeType = Dodge.DodgeType.Back
				end
			end),
			BT.SelectorNode:create({
				BT.NotDecorator:create(BT.IsHitNode:create(self.instance)),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.instance:IsSkillHitComboEnable(self.skillIndex, self.instance:GetHitType()) == false
					end),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						self.instance:ClearSkillButtonAll()

						self.hitTime = self.hitTime + Time.deltaTime

						return self.instance:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0 and (self.hitTime > Dodge.HitTime or self.instance:IsType(AnimalBase_Define.Type.Hero))
					end),
					BT.CommonNode:create(function()
						self.hitTime = 0
						self.dodgeType = Dodge.DodgeType.Back
					end)
				})
			}),
			BT.SelectorNode:create({
				BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
				BT.SequenceNode:create({
					BT.NotDecorator:create(BT.IsSkillComboSkillNode:create(self.instance, self.skillIndex, 1)),
					BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
				}),
				BT.ConditionNode:create(function()
					return self.instance:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0
				end)
			}),
			BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Dodge),
			BT.CommonNode:create(function()
				if self.instance:GetHeroId() == 20039 then
					self.instance:SetMoveMuteki(true)
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.dodgeType == Dodge.DodgeType.Back
					end),
					BT.CommonNode:create(function()
						self.instance:StopMovementImmediately(true)
					end)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.dodgeType == Dodge.DodgeType.Forward
					end),
					BT.ConditionWaitNode:create(function()
						if self.instance:IsHit() then
							self.instance:StopMovementImmediately(true)

							self.dodgeType = Dodge.DodgeType.Back

							return true
						end

						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeMoveEnable() == false
					end, Dodge.MoveTime1)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.dodgeType == Dodge.DodgeType.Slant
					end),
					BT.RandomNode:create({
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Left
						end),
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Right
						end)
					}, self.instance:GetAnimalId()),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsSkillingSkill() == true then
							local targetSkillType = target:GetSkillTypeForAI()

							if targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose then
								local skillDir = target:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDir)

								if skillDir >= 1 and skillDir < 3 then
									self.DodgeDir = GameAI.MoveDirection.Right
								else
									self.DodgeDir = GameAI.MoveDirection.Left
								end
							end
						end
					end),
					BT.ConditionWaitNode:create(function()
						if self.instance:IsHit() then
							self.instance:StopMovementImmediately(true)

							self.dodgeType = Dodge.DodgeType.Back

							return true
						end

						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							local dodgeDir = target:GetPosByWorldPos() - self.instance:GetPosByWorldPos()

							dodgeDir:SetNormalize()

							local vertDir = Vector3.zero

							if self.DodgeDir == GameAI.MoveDirection.Left then
								vertDir:Set(-dodgeDir.z, dodgeDir.y, dodgeDir.x)
							elseif self.DodgeDir == GameAI.MoveDirection.Right then
								vertDir:Set(dodgeDir.z, dodgeDir.y, -dodgeDir.x)
							end

							dodgeDir:Add(vertDir:Mul(0.5))

							local movePos = Vector3.zero

							movePos:SetVector3(self.instance:GetPosByWorldPos())
							movePos:Add(dodgeDir)

							movePos.y = self.instance:GetGroundY()

							self.instance:SetTargetByWorldPos(movePos, false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeMoveEnable() == false
					end, Dodge.MoveTime1)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.dodgeType == Dodge.DodgeType.Horizontal
					end),
					BT.RandomNode:create({
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Left
						end),
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Right
						end)
					}, self.instance:GetAnimalId()),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							if target:IsSkillingSkill() == true then
								local targetSkillType = target:GetSkillTypeForAI()

								if targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose then
									local skillDir = target:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDir)

									if skillDir >= 1 and skillDir < 3 then
										self.DodgeDir = GameAI.MoveDirection.Right
									else
										self.DodgeDir = GameAI.MoveDirection.Left
									end
								elseif targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar then
									self.DodgeDir = MathHelper.getRandom(GameAI.MoveDirection.Left, GameAI.MoveDirection.Right, self.instance:GetAnimalId())
								end
							end

							self.instance:SetLockId(target:GetAnimalId())
						end

						if self.instance:IsLockingPlayer() == false then
							self.DodgeDir = GameAI.MoveDirection.Back
						end
					end),
					BT.ConditionWaitNode:create(function()
						if self.instance:IsHit() or self.DodgeDir == GameAI.MoveDirection.Back then
							self.instance:StopMovementImmediately(true)

							self.dodgeType = Dodge.DodgeType.Back

							return true
						end

						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							local movePos = Vector3.zero

							movePos:SetVector3(self.instance:GetPosByWorldPos())

							local vertDir = Vector3.zero

							if self.DodgeDir == GameAI.MoveDirection.Left then
								movePos:Add(self.instance:GetLeft():Mul(4))
							elseif self.DodgeDir == GameAI.MoveDirection.Right then
								movePos:Add(self.instance:GetRight():Mul(4))
							end

							movePos.y = self.instance:GetGroundY()

							self.instance:SetTargetByWorldPos(movePos, true)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeMoveEnable() == false
					end, Dodge.MoveTime2)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.dodgeType == Dodge.DodgeType.Normal
					end),
					BT.RandomNode:create({
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Left
						end),
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Right
						end),
						BT.CommonNode:create(function()
							self.DodgeDir = GameAI.MoveDirection.Back
						end)
					}, self.instance:GetAnimalId()),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							if target:IsSkillingSkill() == true then
								local targetSkillType = target:GetSkillTypeForAI()

								if targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseClose then
									local skillDir = target:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDir)

									if skillDir == 1 then
										self.DodgeDir = GameAI.MoveDirection.Back
									elseif skillDir > 1 and skillDir <= 3 then
										self.DodgeDir = GameAI.MoveDirection.Right
									else
										self.DodgeDir = GameAI.MoveDirection.Left
									end
								elseif targetSkillType == AnimalBase_Define.SkillTypeForAI.OffenseFar then
									self.DodgeDir = MathHelper.getRandom(GameAI.MoveDirection.Left, GameAI.MoveDirection.Right, self.instance:GetAnimalId())
								end
							end

							self.instance:SetLockId(target:GetAnimalId())
						end

						if self.instance:IsLockingPlayer() == false then
							self.DodgeDir = GameAI.MoveDirection.Back
						end
					end),
					BT.ConditionWaitNode:create(function()
						if self.instance:IsHit() or self.DodgeDir == GameAI.MoveDirection.Back then
							self.instance:StopMovementImmediately(true)

							self.dodgeType = Dodge.DodgeType.Back

							return true
						end

						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							local movePos = target:GetPosByWorldPos() - self.instance:GetPosByWorldPos()

							movePos:SetNormalize()

							local vertDir = Vector3.zero

							if self.DodgeDir == GameAI.MoveDirection.Left then
								vertDir:Set(-movePos.z, movePos.y, movePos.x)
							elseif self.DodgeDir == GameAI.MoveDirection.Right then
								vertDir:Set(movePos.z, movePos.y, -movePos.x)
							end

							movePos:SetVector3(vertDir)

							movePos.y = self.instance:GetGroundY()

							self.instance:SetTargetByWorldPos(movePos, false)
						end

						return self.instance:IsDead() == true or self.instance:IsFreeMoveEnable() == false
					end, Dodge.MoveTime1)
				})
			}),
			BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Dodge),
			BT.WaitNode:create(0.1),
			BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
			BT.CommonNode:create(function()
				if self.instance:GetHeroId() == 20039 then
					self.instance:SetMoveMuteki(false)
				end

				if self.instance:IsLockingPlayer() == true then
					local target = self.instance:GetBrain():GetAnimalTarget()

					if target ~= nil and target:IsDead() == false and target:IsShow() == true then
						self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
					end

					self.instance:SetLockId(-1)
				end
			end)
		})
	})

	return btnode
end

return Dodge
