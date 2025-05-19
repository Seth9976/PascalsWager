-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Execute.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Execute = class("Execute")
Execute.static.LockTime = 1

function Execute:initialize(instance)
	self.instance = instance
	self.waitTime = 0
	self.moveDir = GameAI.MoveDirection.None
	self.executeNode = self:create()
end

function Execute:create()
	local btnode = BT.SequenceNode:create({
		BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Execute),
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					return self.instance:IsSkilling() == true and self.instance:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) < 1
				end),
				BT.CommonNode:create(function()
					if self.instance:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit) > 0 then
						local target = self.instance:GetBrain():GetAnimalTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							self.instance:SetTargetByWorldPos(target:GetPosByWorldPos(), false)
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
						end
					end
				end)
			}),
			BT.SequenceNode:create({
				BT.StopMovementNode:create(self.instance),
				BT.ConditionNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()

					return target ~= nil and target:IsPermitExecuteHit() == true
				end),
				BT.CommonNode:create(function()
					local target = self.instance:GetBrain():GetAnimalTarget()
				end),
				BT.NotDecorator:create(BT.IsTargetMyTeamNode:create(self.instance)),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							local target = self.instance:GetBrain():GetAnimalTarget()

							return target ~= nil and (self.instance:CheckSkillExecuteStatusForAI(target) == true or self.instance:CheckSkillBackstabStatusForAI(target) == true)
						end),
						BT.StopMovementNode:create(self.instance),
						BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light),
						BT.CommonNode:create(function()
							self.moveDir = GameAI.MoveDirection.None
						end),
						BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
					}),
					BT.CommonNode:create(function()
						local target = self.instance:GetBrain():GetAnimalTarget()
						local skillPos = Vector3.zero

						if target ~= nil and target:IsDead() == false and target:IsShow() == true then
							local lookDir = self.instance:GetPosByWorldPos() - target:GetPosByWorldPos()

							if self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Execute) == true and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Backstab) == true then
								if Vector3.Angle(self.instance:GetForward(), target:GetForward()) > Vector3.Angle(self.instance:GetForward(), target:GetBack()) then
									target:LookAt(lookDir, false)

									skillPos = target:GetExecuteHitPosition()
								else
									target:LookAt(-lookDir, false)

									skillPos = target:GetBackstabHitPosition()
								end
							elseif self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Execute) == true and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Backstab) == false then
								target:LookAt(lookDir, false)

								skillPos = target:GetExecuteHitPosition()
							elseif self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Execute) == false and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Backstab) == true then
								target:LookAt(-lookDir, false)

								skillPos = target:GetBackstabHitPosition()
							end
						end

						self.instance:SetTargetByWorldPos(skillPos, false)
					end)
				})
			}),
			BT.SequenceNode:create({
				BT.CommonNode:create(function()
					self.moveDir = GameAI.MoveDirection.None
				end),
				BT.ChangeBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack)
			})
		})
	})

	return btnode
end

return Execute
