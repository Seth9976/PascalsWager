-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/BrainStoryMode.lua

require("LuaScript/Lib/func")
require("LuaScript/Logic/AI/BrainBase")
require("LuaScript/Logic/AI/Behaviour/Follow")
require("LuaScript/Logic/AI/Behaviour/Alert")
require("LuaScript/Logic/AI/Behaviour/HoverWaitting")

local BT = require("LuaScript/Lib/behaviourtree")
local AttackStr = "LuaScript/Logic/AI/Behaviour/Attack/Attack"

BrainStoryMode = class("BrainStoryMode", BrainBase)
BrainStoryMode.static.PosState = {
	Initial = 1,
	AwayBornPoint = 3,
	NearBornPoint = 2,
	None = 0
}
BrainStoryMode.static.RelaxType = {
	Born2 = 4,
	Normal = 1,
	Born1 = 3,
	Loop = 2,
	Born3 = 5,
	None = 0
}

local sceneController

BrainStoryMode.static.ArriveBornPosDistance = 2
BrainStoryMode.static.ArriveBornPosAngle = 15
BrainStoryMode.static.LeaveBornPosDistance = 4
BrainStoryMode.static.NoActionDistance = 45
BrainStoryMode.static.GetTargetInterval = 0.3
BrainStoryMode.static.ChangeTargetInterval = 2
BrainStoryMode.static.LoseTargetTime = 5
BrainStoryMode.static.NearRadius = 5
BrainStoryMode.static.AwayToNearTime = 2.5
BrainStoryMode.static.RelaxIntervalMin = 4
BrainStoryMode.static.RelaxIntervalMax = 8
BrainStoryMode.static.DistanceDetectInterval = 0.3
BrainStoryMode.static.DropHeight = 3
BrainStoryMode.static.NotLookDistance = 12
BrainStoryMode.static.NotLookTime = 3
BrainStoryMode.static.ArriveCompanionPosDistance = 3.5
BrainStoryMode.static.LeaveCompanionPosDistance = 5.5
BrainStoryMode.static.AwayCompanionPosDistance = 12
BrainStoryMode.static.LookCompanionAngle = 20
BrainStoryMode.static.NotLookCompanionAngle = 65
BrainStoryMode.static.LoseCompanionTime = 2.5
BrainStoryMode.static.LoseTargetTimeForCompanion = 3.5
BrainStoryMode.static.ArriveAttractedPosDistance = 2.5
BrainStoryMode.static.NearGuidePosDistance = 8
BrainStoryMode.static.AwayGuidePosDistance = 11

function BrainStoryMode:initialize(instance)
	BrainBase.initialize(self, instance)

	local attack = require(AttackStr .. instance:GetHeroId())

	self.attack = attack:new(instance)
	self.follow = Follow:new(instance)
	self.posState = BrainStoryMode.PosState.Initial
	self.behaviourState = GameAI.BehaviourState.Attack
	self.behaviourMode = GameAI.BehaviourMode.Default
	self.isEnd = false
	self.backTime = 0
	self.waitTime = 0
	self.changeTargetFrame = 0
	self.distanceDetectFrame = 0
	self.loseTargetFrame = 0
	self.loseCompanionFrame = 0
	self.wanderIndex = 0
	self.wanderPos = Vector3.zero
	self.isArrivePos = false
	self.isTurnRot = false
	self.moveRadius = {}
	self.loseRadius = 0
	self.cooperationRange = 0
	self.alertType = 0
	self.relaxType = 0
	self.BornType = 0
	self.isBorn = false
	self.relaxInterval = 0
	self.bornGrade = 0
	self.isStartPatrol = true
	self.isLoseBackWay = false
	self.findTargetTime = 0
	self.showRange = 0
	self.showAngle = 0
	self.isBlind = false
	self.isBeAttracted = false
	self.attractedPos = Vector3.zero
	sceneController = ST_Main.GetSceneController()
	self.gameController = sceneController:GetGameController()
	self.hoverWaitting = HoverWaitting:new(instance, 3)
end

function BrainStoryMode:GetGameController()
	return self.gameController
end

function BrainStoryMode:createTree()
	local btnode = self:GetBehaviorNode()
	local beTree = BT.BehaviourTree:create(btnode)

	return beTree
end

function BrainStoryMode:SetBehaviourMode(id)
	if id ~= nil and id > 0 then
		self.behaviourMode = id
	end
end

function BrainStoryMode:GetBehaviorNode()
	local heroExtData = self:GetHeroExtData()

	if heroExtData ~= nil then
		self.loseRadius = heroExtData.LoseRadius
		self.moveRadius = heroExtData.MoveRadius
		self.alertType = heroExtData.IsAlert
		self.relaxType = heroExtData.IsRelax
		self.BornType = heroExtData.BornType
		self.bornGrade = heroExtData.BornGrade
		self.cooperationRange = heroExtData.CooperationRange
		self.showRange = heroExtData.ShowRange
		self.showAngle = heroExtData.ShowAngle

		if heroExtData.WanderPoint ~= "" then
			if self.relaxType == BrainStoryMode.RelaxType.Normal or self.relaxType == BrainStoryMode.RelaxType.None then
				self.wanderIndex = 1
				self.wanderIndex, self.wanderPos = self:GetWanderPoint(self.wanderIndex)
			else
				self.wanderIndex, self.wanderPos = self:GetWanderPoint(self.wanderIndex)
			end
		end
	end

	local btnode

	if self.instance:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) then
		if self.instance:GetTeamId() == 1 then
			btnode = self:StoryModelCompanion()
		else
			btnode = self:StoryModelSanMonster()
		end
	elseif self.instance:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true then
		btnode = self:StoryModelSanMonster()
	elseif self.behaviourMode == GameAI.BehaviourMode.DoNotAttack then
		btnode = self:StoryModelNPC()
	elseif self.behaviourMode == GameAI.BehaviourMode.Guide then
		btnode = self:StoryModelGuide()
	elseif self.behaviourMode == GameAI.BehaviourMode.Companion or self.instance:GetTeamId() == 1 then
		btnode = self:StoryModelCompanion()
	elseif self.behaviourMode == GameAI.BehaviourMode.Team then
		btnode = self:StoryModelTeam()
	elseif self.instance:IsBoss() == true or self.behaviourMode == GameAI.BehaviourMode.BossRoomMode then
		btnode = self:StoryModelBoss()
	else
		btnode = self:StoryModelEmeny()

		if self.isBorn == false and self.BornType > 0 and self.instance:IsSkilling() == false and (self.BornType == 1 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born1) == true or self.BornType == 2 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born2) == true or self.BornType == 3 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born3) == true) then
			self.instance:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
		end
	end

	return btnode
end

function BrainStoryMode:StoryModelEmeny()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.Initial
			end),
			BT.CommonNode:create(function()
				self.instance:SetRebornPosition(self.instance:GetPosByWorldPos())

				self.relaxInterval = MathHelper.getRandom(BrainStoryMode.RelaxIntervalMin, BrainStoryMode.RelaxIntervalMax, self.instance:GetAnimalId())

				if self.instance:GetGrade() <= 1 and self.bornGrade > 1 then
					self.instance:AddGrade(false)
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isBorn == false and self.BornType > 0 and self.instance:IsSkilling() == false
					end),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.BornType == 1 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born1) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born1, 1, false)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.BornType == 2 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born2) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born2, 1, false)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.BornType == 3 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born3) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born3, 1, false)
						})
					}),
					BT.CommonNode:create(function()
						self.isBorn = true
						self.posState = BrainStoryMode.PosState.NearBornPoint

						self.instance:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
					end)
				}),
				BT.CommonNode:create(function()
					self.posState = BrainStoryMode.PosState.NearBornPoint
				end)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.instance:IsStop() == true or self.isEnd == true or self.instance:IsDead() == true or (self.gameController:IsInMovie() == true or self.gameController:IsInTimeLine() == true or self.gameController:IsInDialog() == true) and self.instance:IsBornSkilling() == false and (self.isBorn == true or self.BornType <= 0) or self.gameController:IsStatus(ControllerStoryMode.Status.Normal) == false and GameAI.IsTimeLineSkillEnable(self.instance, self.gameController) == false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.CommonNode:create(function()
				local audioName = self.instance:GetModelName() .. "/grunts"
				local checkName = "Character/" .. audioName

				if self.instance:IsDead() == false and self.animalTarget ~= nil and AudioCtrl.isAudioExist(checkName) == true then
					AudioCtrl.SetHeroAudio(audioName, self.instance:GetModel(), self.instance:GetAnimalId())
				end

				self.animalTarget = nil
				self.findTargetTime = 0

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return UILayerCtrl.IsCurrentLayerCurtain() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget ~= nil then
					return true
				else
					self.loseTargetFrame = 0
				end

				return false
			end),
			BT.CommonNode:create(function()
				local enemyList = sceneController:GetEnemyList(self.instance:GetTeamId())

				if table.nums(enemyList) > 1 and self.instance:IsSkilling() == false then
					self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

					if self.changeTargetFrame > BrainStoryMode.ChangeTargetInterval then
						local target = self.attack:GetTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true and target ~= self.animalTarget then
							self.animalTarget = target
						end

						self.changeTargetFrame = 0
					end
				end
			end),
			BT.ConditionNode:create(function()
				if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					local isLose = (GameAI.IsAnimalWithinDistance(self.instance, self.animalTarget:GetPosByWorldPos(), self.loseRadius) == false or self.animalTarget:IsOnStair() == true or ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false) and self.instance:IsSkilling() == false

					if isLose == true then
						self.loseTargetFrame = self.loseTargetFrame + Time.deltaTime
					else
						self.loseTargetFrame = 0
					end

					if self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBlind) == false then
						self.isBlind = false
					elseif self.isBlind == false and self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBlind) == true then
						self.isBlind = true

						return true
					end

					if self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBeAttracted) == false then
						self.isBeAttracted = false
					elseif self.isBeAttracted == false and self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBeAttracted) == true then
						self.isBeAttracted = true

						return true
					end
				end

				return GameAI.IsCanGetTarget(self.animalTarget) == false or self.loseTargetFrame > BrainStoryMode.LoseTargetTime
			end),
			BT.CommonNode:create(function()
				if self.attack.followType == Follow.Type.Default and self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					self.posState = BrainStoryMode.PosState.AwayBornPoint
				end

				self.backTime = 0
				self.isArrivePos = false
			end),
			BT.CommonNode:create(function()
				self.animalTarget = nil
				self.findTargetTime = 0
				self.loseTargetFrame = 0

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				local audioName = self.instance:GetModelName() .. "/grunts"
				local checkName = "Character/" .. audioName

				if AudioCtrl.isAudioExist(checkName) == true and self.instance:IsDead() == false then
					AudioCtrl.SetHeroAudio(audioName, self.instance:GetModel(), self.instance:GetAnimalId())
				end
			end),
			BT.StopMovementNode:create(self.instance),
			BT.StopSkillNode:create(self.instance),
			BT.WaitNode:create(1)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.AwayBornPoint
			end),
			BT.ConditionNode:create(function()
				return self.instance:GetHatredTargetId() <= 0 and self.animalTarget == nil
			end),
			BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
			BT.UnLockTargetNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local ret = false

						if self.moveRadius ~= "" then
							for i = 1, #self.moveRadius do
								local centerPos = self.moveRadius[i].center

								if self.instance:IsMonsterType(AnimalBase_Define.MonsterType.CrateMonster) == true then
									centerPos = self.instance:GetRebornPosition()
								end

								ret = GameAI.IsAnimalWithinDistance(self.instance, centerPos, self.moveRadius[i].radius)

								if ret then
									break
								end
							end
						end

						return self.backTime > BrainStoryMode.AwayToNearTime
					end),
					BT.CommonNode:create(function()
						self.posState = BrainStoryMode.PosState.NearBornPoint
						self.backTime = 0
					end)
				}),
				BT.SequenceNode:create({
					BT.CommonNode:create(function()
						self.backTime = self.backTime + Time.deltaTime
						self.animalTarget = nil
						self.findTargetTime = 0
					end),
					BT.GoToBornPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Fast)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.NearBornPoint
			end),
			BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
			BT.ConditionNode:create(function()
				return self.attack.followType ~= Follow.Type.motionless
			end),
			BT.ConditionNode:create(function()
				local ret = true

				if self.moveRadius ~= "" then
					self.distanceDetectFrame = self.distanceDetectFrame + Time.deltaTime

					if self.distanceDetectFrame > BrainStoryMode.DistanceDetectInterval then
						self.distanceDetectFrame = 0

						for i = 1, #self.moveRadius do
							local centerPos = self.moveRadius[i].center

							if self.instance:IsMonsterType(AnimalBase_Define.MonsterType.CrateMonster) == true then
								centerPos = self.instance:GetRebornPosition()
							end

							ret = GameAI.IsAnimalWithinDistance(self.instance, centerPos, self.moveRadius[i].radius)

							if ret then
								break
							end
						end
					end
				end

				if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					return ret == false and GameAI.IsAnimalWithinDistance(self.instance, self.animalTarget:GetPosByWorldPos(), BrainStoryMode.NearRadius) == false
				end

				return ret == false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.WaitNode:create(1),
			BT.CommonNode:create(function()
				self.posState = BrainStoryMode.PosState.AwayBornPoint

				if self.animalTarget ~= nil then
					local audioName = self.instance:GetModelName() .. "/grunts"
					local checkName = "Character/" .. audioName

					if AudioCtrl.isAudioExist(checkName) == true and self.instance:IsDead() == false then
						AudioCtrl.SetHeroAudio(audioName, self.instance:GetModel(), self.instance:GetAnimalId())
					end
				end

				self.animalTarget = nil
				self.findTargetTime = 0

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				self.backTime = 0
				self.isStartPatrol = false
				self.isArrivePos = false
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.attractedPos ~= nil and self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBeAttracted) == true and self.instance:IsBoss() == false
			end),
			BT.ConditionNode:create(function()
				return self.instance:GetHatredTargetId() <= 0 and self.attack.followType ~= Follow.Type.motionless and self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) == false
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return GameAI.IsAnimalWithinDistance(self.instance, self.attractedPos, BrainStoryMode.ArriveAttractedPosDistance) == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Relax, 0),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true
							end),
							BT.StopMovementNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
						}),
						BT.StopMovementNode:create(self.instance)
					})
				}),
				BT.CommonNode:create(function()
					self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
					self.instance:SetTargetByWorldPos(self.attractedPos, true)
				end)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.behaviourMode == GameAI.BehaviourMode.AttackBack
			end),
			BT.ConditionNode:create(function()
				if self.animalTarget == nil then
					if self.instance:GetHatredTargetId() > 0 then
						local tmpTarget = sceneController:FindPlayerById(self.instance:GetHatredTargetId())

						if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
							self.animalTarget = tmpTarget
						end

						self.instance:SetHatredTargetId(0)
					end

					if self.animalTarget == nil and self.cooperationRange > 0 and self.isArrivePos == true then
						self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

						if self.changeTargetFrame > BrainStoryMode.GetTargetInterval then
							self.animalTarget = GameAI.GetTargetCooperation(self.instance, self.cooperationRange)
							self.changeTargetFrame = 0
						end
					end

					if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
						self.behaviourMode = GameAI.BehaviourMode.Default

						if self.BornType > 0 then
							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewDodge then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end
							end

							if self.instance:IsMoveFix() == true then
								local animalPos = self.instance:GetPosByWorldPos()
								local targetPos = self.animalTarget:GetPosByWorldPos()

								if animalPos.y > targetPos.y and GameAI.IsAnimalWithinHeight(self.instance, targetPos, BrainStoryMode.DropHeight) == false or self.instance:IsHit() == true then
									self.instance:SetMoveFix(false)
									self.instance:StopSkill()

									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if wanderPos ~= Vector3.zero and length <= 1 then
										self.instance:SetRebornPosition(wanderPos)

										self.wanderPos = Vector3.zero
									end
								end
							end

							if self:IsAnimalCrazy() == true then
								self.instance:SetMonsterNotNormal(true)
							end
						elseif self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) then
							self.instance:Born(AnimalBase_Define.BornReason.FindTarget, true)
						else
							if self.alertType == Alert.Type.Normal and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Alert) == true then
								self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Alert
							end

							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Relax, 0) then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewThreat then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end

								if self.animalTarget ~= nil then
									self.instance:SetTargetByWorldPos(self.animalTarget:GetPosByWorldPos(), false)
								end

								self.instance:StopSkillAudio()
							end

							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewDodge then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end
							end
						end

						if self.instance:IsHit() == true then
							local button = self.instance:GetLongPressButton()

							self.instance:PressUpSkillButton(button)
							self.instance:LongPressSkillButton(0)
						end

						local audioName = self.instance:GetModelName() .. "/grunts"

						AudioCtrl.StopHeroAudio(audioName, self.instance:GetAnimalId())

						self.backTime = 0
					end
				end

				return self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true
			end),
			BT.CommonNode:create(function()
				self.findTargetTime = self.findTargetTime + Time.deltaTime
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.behaviourMode == GameAI.BehaviourMode.Default or self.behaviourMode == GameAI.BehaviourMode.Attack or self.behaviourMode == GameAI.BehaviourMode.TimeLine
			end),
			BT.ConditionNode:create(function()
				if self.animalTarget == nil then
					if self.instance:GetHatredTargetId() > 0 then
						local tmpTarget = sceneController:FindPlayerById(self.instance:GetHatredTargetId())

						if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
							self.animalTarget = tmpTarget
						end

						self.instance:SetHatredTargetId(0)
					end

					if self.animalTarget == nil then
						self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

						if self.changeTargetFrame > BrainStoryMode.GetTargetInterval or self.behaviourMode == GameAI.BehaviourMode.Attack then
							self.animalTarget = self.attack:GetTarget()

							if self.animalTarget == nil and self.cooperationRange > 0 and self.isArrivePos == true then
								self.animalTarget = GameAI.GetTargetCooperation(self.instance, self.cooperationRange)
							end

							self.changeTargetFrame = 0
						end
					end

					if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
						if self.BornType > 0 then
							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewDodge then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end
							end

							if self.instance:IsMoveFix() == true then
								local animalPos = self.instance:GetPosByWorldPos()
								local targetPos = self.animalTarget:GetPosByWorldPos()

								if animalPos.y > targetPos.y and GameAI.IsAnimalWithinHeight(self.instance, targetPos, BrainStoryMode.DropHeight) == false or self.instance:IsHit() == true then
									self.instance:SetMoveFix(false)
									self.instance:StopSkill()

									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if wanderPos ~= Vector3.zero and length <= 1 then
										self.instance:SetRebornPosition(wanderPos)

										self.wanderPos = Vector3.zero
									end
								end
							end

							if self:IsAnimalCrazy() == true then
								self.instance:SetMonsterNotNormal(true)
							end
						elseif self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) then
							self.instance:Born(AnimalBase_Define.BornReason.FindTarget, true)
						else
							if self.alertType == Alert.Type.Normal and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Alert) == true then
								self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Alert
							end

							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Relax, 0) then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewThreat then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end

								if self.animalTarget ~= nil then
									self.instance:SetTargetByWorldPos(self.animalTarget:GetPosByWorldPos(), false)
								end

								self.instance:StopSkillAudio()
							end

							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewDodge then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end
							end
						end

						if self.instance:IsHit() == true then
							local button = self.instance:GetLongPressButton()

							self.instance:PressUpSkillButton(button)
							self.instance:LongPressSkillButton(0)
						end

						local audioName = self.instance:GetModelName() .. "/grunts"

						AudioCtrl.StopHeroAudio(audioName, self.instance:GetAnimalId())

						self.backTime = 0
					end
				end

				return self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true
			end),
			BT.CommonNode:create(function()
				self.findTargetTime = self.findTargetTime + Time.deltaTime
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.behaviourMode == GameAI.BehaviourMode.Battle
			end),
			BT.ConditionNode:create(function()
				local hostPlayer = sceneController:GetHostPlayer()
				local isHostPlayerNear = GameAI.IsAnimalWithinDistance(self.instance, hostPlayer:GetPosByWorldPos(), self.showRange) and GameAI.IsAnimalWithinAngle(self.instance, hostPlayer:GetPosByWorldPos(), self.showAngle)

				if isHostPlayerNear == true then
					self.behaviourMode = GameAI.BehaviourMode.Default

					return true
				end

				if self.instance:GetHatredTargetId() > 0 then
					local tmpTarget = sceneController:FindPlayerById(self.instance:GetHatredTargetId())

					if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
						self.instance:SetHatredTargetId(0)

						self.behaviourMode = GameAI.BehaviourMode.Default

						return true
					end
				end

				return false
			end)
		}),
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					return self.wanderPos ~= Vector3.zero and self.isStartPatrol == true and self.attack.followType ~= Follow.Type.motionless and self.BornType <= 0
				end),
				BT.CommonNode:create(function()
					if GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, BrainStoryMode.ArriveBornPosDistance) == true then
						self.isArrivePos = true
					elseif GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, BrainStoryMode.LeaveBornPosDistance) == false then
						self.isArrivePos = false
					end
				end),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.BornType > 0 and (self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true)
						end),
						BT.StopMovementNode:create(self.instance)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.isArrivePos == true
						end),
						BT.SelectorNode:create({
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									local isNoAction = false
									local sceneCamera = self.instance:GetSceneCamera()

									if sceneCamera ~= nil and GameAI.IsAnimalWithinDistance(self.instance, sceneCamera:GetCameraRealPosition(), BrainStoryMode.NoActionDistance) == false then
										isNoAction = true
									end

									return isNoAction == true and DebugShowAllMonster == false
								end),
								BT.StopMovementNode:create(self.instance)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) == true
								end),
								BT.StopMovementNode:create(self.instance)
							}),
							BT.SequenceNode:create({
								BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Relax, 1),
								BT.CommonNode:create(function()
									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if self.wanderIndex ~= 0 then
										if length > 1 then
											self.wanderPos = wanderPos
											self.isArrivePos = false
										else
											self.instance:SetRebornPosition(wanderPos)

											self.wanderPos = Vector3.zero
										end
									else
										self.wanderPos = wanderPos
										self.isArrivePos = false
									end

									self.wanderIndex = wanderIndex
								end)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.relaxType == BrainStoryMode.RelaxType.Born1 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born1) == true or self.relaxType == BrainStoryMode.RelaxType.Born2 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born2) == true or self.relaxType == BrainStoryMode.RelaxType.Born3 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born3) == true
								end),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born1, 0),
										BT.StopMovementNode:create(self.instance)
									}),
									BT.SequenceNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born2, 0),
										BT.StopMovementNode:create(self.instance)
									}),
									BT.SequenceNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born3, 0),
										BT.StopMovementNode:create(self.instance)
									}),
									BT.SequenceNode:create({
										BT.StopMovementNode:create(self.instance),
										BT.CommonNode:create(function()
											local bornType = 0

											if self.relaxType == BrainStoryMode.RelaxType.Born1 then
												bornType = 1
											elseif self.relaxType == BrainStoryMode.RelaxType.Born2 then
												bornType = 2
											elseif self.relaxType == BrainStoryMode.RelaxType.Born3 then
												bornType = 3
											end

											self.instance:SetHeroBornType(bornType)
										end),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born1, 1, false)
									})
								})
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true and self.relaxType ~= BrainStoryMode.RelaxType.None
								end),
								BT.StopMovementNode:create(self.instance),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
							}),
							BT.SequenceNode:create({
								BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
								BT.CommonNode:create(function()
									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if self.wanderIndex ~= 0 then
										if length > 1 then
											self.wanderPos = wanderPos
											self.isArrivePos = false
										else
											self.instance:SetRebornPosition(wanderPos)

											self.wanderPos = Vector3.zero
										end
									else
										self.wanderPos = wanderPos
										self.isArrivePos = false
									end

									self.wanderIndex = wanderIndex
								end)
							}),
							BT.StopMovementNode:create(self.instance)
						})
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.isArrivePos == false
						end),
						BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
						BT.CommonNode:create(function()
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
							self.instance:SetTargetByWorldPos(self.wanderPos, true)
						end)
					}),
					BT.StopMovementNode:create(self.instance)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.instance:GetRebornPosition() ~= Vector3.zero
			end),
			BT.CommonNode:create(function()
				if self.attack.followType ~= Follow.Type.motionless then
					if self.isArrivePos == false then
						if GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetRebornPosition(), BrainStoryMode.ArriveBornPosDistance) == true then
							self.isArrivePos = true
							self.isStartPatrol = true
						end
					else
						self.distanceDetectFrame = self.distanceDetectFrame + Time.deltaTime

						if self.distanceDetectFrame > BrainStoryMode.DistanceDetectInterval then
							self.distanceDetectFrame = 0

							if GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetRebornPosition(), BrainStoryMode.LeaveBornPosDistance) == false then
								self.isArrivePos = false
							end
						end
					end
				else
					self.isArrivePos = true
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.BornType > 0 and (self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true)
					end),
					BT.StopMovementNode:create(self.instance)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetGrade() > 1 and self.bornGrade <= 1 and self.instance:GetHeroId() == 20013
							end),
							BT.StopMovementNode:create(self.instance),
							BT.CommonNode:create(function()
								self.instance:ResetGrade()
							end)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local isNoAction = false
								local sceneCamera = self.instance:GetSceneCamera()

								if sceneCamera ~= nil and GameAI.IsAnimalWithinDistance(self.instance, sceneCamera:GetCameraRealPosition(), BrainStoryMode.NoActionDistance) == false then
									isNoAction = true
								end

								return isNoAction == true and DebugShowAllMonster == false
							end),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) == true
							end),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true and self.relaxType == BrainStoryMode.RelaxType.Loop and AnimalBase.Config[self.instance:GetHeroId()].skillComboMax[AnimalBase_Define.SkillType.Relax] > 2
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Relax, 0),
									BT.StopMovementNode:create(self.instance)
								}),
								BT.SequenceNode:create({
									BT.StopMovementNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								if self.instance:IsSkilling() == false then
									self.waitTime = self.waitTime + Time.deltaTime
								end

								return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true and self.relaxType == BrainStoryMode.RelaxType.Normal and self.waitTime > self.relaxInterval
							end),
							BT.StopMovementNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat),
							BT.CommonNode:create(function()
								self.waitTime = 0
								self.relaxInterval = MathHelper.getRandom(BrainStoryMode.RelaxIntervalMin, BrainStoryMode.RelaxIntervalMax, self.instance:GetAnimalId())
							end)
						}),
						BT.SequenceNode:create({
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.StopMovementNode:create(self.instance),
							BT.ConditionWaitNode:create(function()
								local tmpLook = self.instance:GetRebornLook()

								self.instance:LookAt(tmpLook, false)

								local animalForward = self.instance:GetForward()
								local tmpAngle = Vector3.Angle(tmpLook, animalForward, true, true)

								return tmpAngle <= BrainStoryMode.ArriveBornPosAngle or self.instance:IsDead() or self.instance:IsHit()
							end)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == false
					end),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.GoToBornPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow),
					BT.CommonNode:create(function()
						self.distanceDetectFrame = self.distanceDetectFrame + Time.deltaTime

						if self.distanceDetectFrame > BrainStoryMode.DistanceDetectInterval or self.isLoseBackWay == true then
							if ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false and (self.animalTarget == nil or self.animalTarget:IsDead() == true or self.animalTarget:IsShow() == false) then
								local sceneCamera = self.instance:GetSceneCamera()

								if sceneCamera ~= nil then
									local dis1 = Vector3.DistanceSquare(self.instance:GetPosByWorldPos(), sceneCamera:GetCameraRealPosition())
									local dis2 = Vector3.DistanceSquare(self.instance:GetRebornPosition(), sceneCamera:GetCameraRealPosition())

									if dis1 > BrainStoryMode.NotLookDistance * BrainStoryMode.NotLookDistance and dis2 > BrainStoryMode.NotLookDistance * BrainStoryMode.NotLookDistance then
										self.isLoseBackWay = true
									else
										self.isLoseBackWay = false
									end
								end
							else
								self.isLoseBackWay = false
							end
						end

						if self.isLoseBackWay == true then
							self.loseTargetFrame = self.loseTargetFrame + Time.deltaTime

							if self.loseTargetFrame > BrainStoryMode.NotLookTime then
								self.loseTargetFrame = 0

								local pos = Vector3.zero

								pos:SetVector3(self.instance:GetRebornPosition())
								self.instance:SetPosByWorldPos(pos, true)
								self.instance:LookAt(self.instance:GetRebornLook())
								self.instance:SetTargetByWorldPos(self.instance:GetRebornPosition(), true)
							end
						else
							self.loseTargetFrame = 0
						end
					end)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainStoryMode:StoryModelTeam()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.Initial
			end),
			BT.CommonNode:create(function()
				self.instance:SetRebornPosition(self.instance:GetPosByWorldPos())

				self.relaxInterval = MathHelper.getRandom(BrainStoryMode.RelaxIntervalMin, BrainStoryMode.RelaxIntervalMax, self.instance:GetAnimalId())

				if self.instance:GetGrade() <= 1 and self.bornGrade > 1 then
					self.instance:AddGrade(false)
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isBorn == false and self.BornType > 0 and self.instance:IsSkilling() == false
					end),
					BT.SwitchNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.BornType == 1 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born1) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born1, 1, false)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.BornType == 2 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born2) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born2, 1, false)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.BornType == 3 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born3) == true
							end),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born3, 1, false)
						})
					}),
					BT.CommonNode:create(function()
						self.isBorn = true
						self.posState = BrainStoryMode.PosState.NearBornPoint

						self.instance:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
					end)
				}),
				BT.CommonNode:create(function()
					self.posState = BrainStoryMode.PosState.NearBornPoint
				end)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.instance:IsStop() == true or self.isEnd == true or self.instance:IsDead() == true or (self.gameController:IsInMovie() == true or self.gameController:IsInTimeLine() == true or self.gameController:IsInDialog() == true) and self.instance:IsBornSkilling() == false and (self.isBorn == true or self.BornType <= 0) or self.gameController:IsStatus(ControllerStoryMode.Status.Normal) == false and GameAI.IsTimeLineSkillEnable(self.instance, self.gameController) == false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.CommonNode:create(function()
				local audioName = self.instance:GetModelName() .. "/grunts"
				local checkName = "Character/" .. audioName

				if self.instance:IsDead() == false and self.animalTarget ~= nil and AudioCtrl.isAudioExist(checkName) == true then
					AudioCtrl.SetHeroAudio(audioName, self.instance:GetModel(), self.instance:GetAnimalId())
				end

				self.animalTarget = nil
				self.findTargetTime = 0

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return UILayerCtrl.IsCurrentLayerCurtain() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget ~= nil then
					return true
				else
					self.loseTargetFrame = 0
				end

				return false
			end),
			BT.CommonNode:create(function()
				local enemyList = sceneController:GetEnemyList(self.instance:GetTeamId())

				if table.nums(enemyList) > 1 and self.instance:IsSkilling() == false then
					self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

					if self.changeTargetFrame > BrainStoryMode.ChangeTargetInterval then
						local target = self.attack:GetTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true and target ~= self.animalTarget then
							self.animalTarget = target
						end

						self.changeTargetFrame = 0
					end
				end
			end),
			BT.ConditionNode:create(function()
				if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					local isLose = (GameAI.IsAnimalWithinDistance(self.instance, self.animalTarget:GetPosByWorldPos(), self.loseRadius) == false or self.animalTarget:IsOnStair() == true or ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false) and self.instance:IsSkilling() == false

					if isLose == true then
						self.loseTargetFrame = self.loseTargetFrame + Time.deltaTime
					else
						self.loseTargetFrame = 0
					end

					if self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBlind) == false then
						self.isBlind = false
					elseif self.isBlind == false and self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBlind) == true then
						self.isBlind = true

						return true
					end

					if self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBeAttracted) == false then
						self.isBeAttracted = false
					elseif self.isBeAttracted == false and self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBeAttracted) == true then
						self.isBeAttracted = true

						return true
					end
				end

				return GameAI.IsCanGetTarget(self.animalTarget) == false or self.loseTargetFrame > BrainStoryMode.LoseTargetTime
			end),
			BT.CommonNode:create(function()
				if self.attack.followType == Follow.Type.Default and self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					self.posState = BrainStoryMode.PosState.AwayBornPoint
				end

				self.backTime = 0
				self.isArrivePos = false
			end),
			BT.CommonNode:create(function()
				self.animalTarget = nil
				self.findTargetTime = 0
				self.loseTargetFrame = 0

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				local audioName = self.instance:GetModelName() .. "/grunts"
				local checkName = "Character/" .. audioName

				if AudioCtrl.isAudioExist(checkName) == true and self.instance:IsDead() == false then
					AudioCtrl.SetHeroAudio(audioName, self.instance:GetModel(), self.instance:GetAnimalId())
				end
			end),
			BT.StopMovementNode:create(self.instance),
			BT.StopSkillNode:create(self.instance),
			BT.WaitNode:create(1)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.AwayBornPoint
			end),
			BT.ConditionNode:create(function()
				return self.instance:GetHatredTargetId() <= 0 and self.animalTarget == nil
			end),
			BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
			BT.UnLockTargetNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						local ret = false

						if self.moveRadius ~= "" then
							for i = 1, #self.moveRadius do
								local centerPos = self.moveRadius[i].center

								if self.instance:IsMonsterType(AnimalBase_Define.MonsterType.CrateMonster) == true then
									centerPos = self.instance:GetRebornPosition()
								end

								ret = GameAI.IsAnimalWithinDistance(self.instance, centerPos, self.moveRadius[i].radius)

								if ret then
									break
								end
							end
						end

						return self.backTime > BrainStoryMode.AwayToNearTime
					end),
					BT.CommonNode:create(function()
						self.posState = BrainStoryMode.PosState.NearBornPoint
						self.backTime = 0
					end)
				}),
				BT.SequenceNode:create({
					BT.CommonNode:create(function()
						self.backTime = self.backTime + Time.deltaTime
						self.animalTarget = nil
						self.findTargetTime = 0
					end),
					BT.GoToBornPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Fast)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.NearBornPoint
			end),
			BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
			BT.ConditionNode:create(function()
				return self.attack.followType ~= Follow.Type.motionless
			end),
			BT.ConditionNode:create(function()
				local ret = true

				if self.moveRadius ~= "" then
					self.distanceDetectFrame = self.distanceDetectFrame + Time.deltaTime

					if self.distanceDetectFrame > BrainStoryMode.DistanceDetectInterval then
						self.distanceDetectFrame = 0

						for i = 1, #self.moveRadius do
							local centerPos = self.moveRadius[i].center

							if self.instance:IsMonsterType(AnimalBase_Define.MonsterType.CrateMonster) == true then
								centerPos = self.instance:GetRebornPosition()
							end

							ret = GameAI.IsAnimalWithinDistance(self.instance, centerPos, self.moveRadius[i].radius)

							if ret then
								break
							end
						end
					end
				end

				if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					return ret == false and GameAI.IsAnimalWithinDistance(self.instance, self.animalTarget:GetPosByWorldPos(), BrainStoryMode.NearRadius) == false
				end

				return ret == false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.WaitNode:create(1),
			BT.CommonNode:create(function()
				self.posState = BrainStoryMode.PosState.AwayBornPoint

				if self.animalTarget ~= nil then
					local audioName = self.instance:GetModelName() .. "/grunts"
					local checkName = "Character/" .. audioName

					if AudioCtrl.isAudioExist(checkName) == true and self.instance:IsDead() == false then
						AudioCtrl.SetHeroAudio(audioName, self.instance:GetModel(), self.instance:GetAnimalId())
					end
				end

				self.animalTarget = nil
				self.findTargetTime = 0

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				self.backTime = 0
				self.isStartPatrol = false
				self.isArrivePos = false
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.attractedPos ~= nil and self.instance:IsHaveStatusById(AnimalBase_Define.StatusIdBeAttracted) == true and self.instance:IsBoss() == false
			end),
			BT.ConditionNode:create(function()
				return self.instance:GetHatredTargetId() <= 0 and self.attack.followType ~= Follow.Type.motionless and self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) == false
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return GameAI.IsAnimalWithinDistance(self.instance, self.attractedPos, BrainStoryMode.ArriveAttractedPosDistance) == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Relax, 0),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true
							end),
							BT.StopMovementNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
						}),
						BT.StopMovementNode:create(self.instance)
					})
				}),
				BT.CommonNode:create(function()
					self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Normal)
					self.instance:SetTargetByWorldPos(self.attractedPos, true)
				end)
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.behaviourMode == GameAI.BehaviourMode.Team
			end),
			BT.ConditionNode:create(function()
				if self.animalTarget == nil then
					if self.instance:GetHatredTargetId() > 0 then
						local tmpTarget = sceneController:FindPlayerById(self.instance:GetHatredTargetId())

						if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
							self.animalTarget = tmpTarget
						end

						self.instance:SetHatredTargetId(0)
					end

					if self.animalTarget == nil then
						self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

						if self.changeTargetFrame > BrainStoryMode.GetTargetInterval or self.behaviourMode == GameAI.BehaviourMode.Attack then
							self.animalTarget = self.attack:GetTarget()

							if self.animalTarget == nil and self.cooperationRange > 0 and self.isArrivePos == true then
								self.animalTarget = GameAI.GetTargetCooperation(self.instance, self.cooperationRange)
							end

							self.changeTargetFrame = 0
						end
					end

					if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
						if self.BornType > 0 then
							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewDodge then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end
							end

							if self.instance:IsMoveFix() == true then
								local animalPos = self.instance:GetPosByWorldPos()
								local targetPos = self.animalTarget:GetPosByWorldPos()

								if animalPos.y > targetPos.y and GameAI.IsAnimalWithinHeight(self.instance, targetPos, BrainStoryMode.DropHeight) == false or self.instance:IsHit() == true then
									self.instance:SetMoveFix(false)
									self.instance:StopSkill()

									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if wanderPos ~= Vector3.zero and length <= 1 then
										self.instance:SetRebornPosition(wanderPos)

										self.wanderPos = Vector3.zero
									end
								end
							end

							if self:IsAnimalCrazy() == true then
								self.instance:SetMonsterNotNormal(true)
							end
						elseif self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) then
							self.instance:Born(AnimalBase_Define.BornReason.FindTarget, true)
						else
							if self.alertType == Alert.Type.Normal and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Alert) == true then
								self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Alert
							end

							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Relax, 0) then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewThreat then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end

								if self.animalTarget ~= nil then
									self.instance:SetTargetByWorldPos(self.animalTarget:GetPosByWorldPos(), false)
								end

								self.instance:StopSkillAudio()
							end

							if self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
								local button = self.instance:GetLongPressButton()

								if button == ControllerMain.SkillButton.NewDodge then
									self.instance:PressUpSkillButton(button)
									self.instance:LongPressSkillButton(0)
								end
							end
						end

						if self.instance:IsHit() == true then
							local button = self.instance:GetLongPressButton()

							self.instance:PressUpSkillButton(button)
							self.instance:LongPressSkillButton(0)
						end

						local audioName = self.instance:GetModelName() .. "/grunts"

						AudioCtrl.StopHeroAudio(audioName, self.instance:GetAnimalId())

						self.backTime = 0
					end
				end

				return self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true
			end),
			BT.CommonNode:create(function()
				self.findTargetTime = self.findTargetTime + Time.deltaTime

				local isFriendSkilling = false
				local friendList = GameAI.GetSelectTarget(self.instance, GameAI.SkillTargetType.HaveSameTarget)

				for i, tmpFriend in pairs(friendList) do
					if tmpFriend ~= nil and tmpFriend:IsDead() == false and tmpFriend:IsShow() == true and tmpFriend:IsSkilling() == true and (tmpFriend:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.OffenseClose or tmpFriend:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.Chase or tmpFriend:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.PullFix or tmpFriend:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.Pull or tmpFriend:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.OffensePull) then
						isFriendSkilling = true
					end
				end

				if isFriendSkilling == true then
					if self.behaviourState == GameAI.BehaviourState.Attack then
						self.behaviourState = GameAI.BehaviourState.HoverWaitting
					end
				elseif self.behaviourState == GameAI.BehaviourState.HoverWaitting then
					self.behaviourState = GameAI.BehaviourState.Attack
				end
			end),
			BT.SelectorNode:create({
				self.hoverWaitting.hoverWaittingNode,
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SelectorNode:create({
			BT.SequenceNode:create({
				BT.ConditionNode:create(function()
					return self.wanderPos ~= Vector3.zero and self.isStartPatrol == true and self.attack.followType ~= Follow.Type.motionless and self.BornType <= 0
				end),
				BT.CommonNode:create(function()
					if GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, BrainStoryMode.ArriveBornPosDistance) == true then
						self.isArrivePos = true
					elseif GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, BrainStoryMode.LeaveBornPosDistance) == false then
						self.isArrivePos = false
					end
				end),
				BT.SelectorNode:create({
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.BornType > 0 and (self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true)
						end),
						BT.StopMovementNode:create(self.instance)
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.isArrivePos == true
						end),
						BT.SelectorNode:create({
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									local isNoAction = false
									local sceneCamera = self.instance:GetSceneCamera()

									if sceneCamera ~= nil and GameAI.IsAnimalWithinDistance(self.instance, sceneCamera:GetCameraRealPosition(), BrainStoryMode.NoActionDistance) == false then
										isNoAction = true
									end

									return isNoAction == true and DebugShowAllMonster == false
								end),
								BT.StopMovementNode:create(self.instance)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) == true
								end),
								BT.StopMovementNode:create(self.instance)
							}),
							BT.SequenceNode:create({
								BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Relax, 1),
								BT.CommonNode:create(function()
									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if self.wanderIndex ~= 0 then
										if length > 1 then
											self.wanderPos = wanderPos
											self.isArrivePos = false
										else
											self.instance:SetRebornPosition(wanderPos)

											self.wanderPos = Vector3.zero
										end
									else
										self.wanderPos = wanderPos
										self.isArrivePos = false
									end

									self.wanderIndex = wanderIndex
								end)
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.relaxType == BrainStoryMode.RelaxType.Born1 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born1) == true or self.relaxType == BrainStoryMode.RelaxType.Born2 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born2) == true or self.relaxType == BrainStoryMode.RelaxType.Born3 and self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Born3) == true
								end),
								BT.SelectorNode:create({
									BT.SequenceNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born1, 0),
										BT.StopMovementNode:create(self.instance)
									}),
									BT.SequenceNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born2, 0),
										BT.StopMovementNode:create(self.instance)
									}),
									BT.SequenceNode:create({
										BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Born3, 0),
										BT.StopMovementNode:create(self.instance)
									}),
									BT.SequenceNode:create({
										BT.StopMovementNode:create(self.instance),
										BT.CommonNode:create(function()
											local bornType = 0

											if self.relaxType == BrainStoryMode.RelaxType.Born1 then
												bornType = 1
											elseif self.relaxType == BrainStoryMode.RelaxType.Born2 then
												bornType = 2
											elseif self.relaxType == BrainStoryMode.RelaxType.Born3 then
												bornType = 3
											end

											self.instance:SetHeroBornType(bornType)
										end),
										BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewDodge, AnimalBase_Define.SkillType.Born1, 1, false)
									})
								})
							}),
							BT.SequenceNode:create({
								BT.ConditionNode:create(function()
									return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true and self.relaxType ~= BrainStoryMode.RelaxType.None
								end),
								BT.StopMovementNode:create(self.instance),
								BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
								BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat)
							}),
							BT.SequenceNode:create({
								BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
								BT.CommonNode:create(function()
									local wanderIndex, wanderPos, wanderLook, length = self:GetWanderPoint(self.wanderIndex)

									if self.wanderIndex ~= 0 then
										if length > 1 then
											self.wanderPos = wanderPos
											self.isArrivePos = false
										else
											self.instance:SetRebornPosition(wanderPos)

											self.wanderPos = Vector3.zero
										end
									else
										self.wanderPos = wanderPos
										self.isArrivePos = false
									end

									self.wanderIndex = wanderIndex
								end)
							}),
							BT.StopMovementNode:create(self.instance)
						})
					}),
					BT.SequenceNode:create({
						BT.ConditionNode:create(function()
							return self.isArrivePos == false
						end),
						BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
						BT.CommonNode:create(function()
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
							self.instance:SetTargetByWorldPos(self.wanderPos, true)
						end)
					}),
					BT.StopMovementNode:create(self.instance)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.instance:GetRebornPosition() ~= Vector3.zero
			end),
			BT.CommonNode:create(function()
				if self.attack.followType ~= Follow.Type.motionless then
					if self.isArrivePos == false then
						if GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetRebornPosition(), BrainStoryMode.ArriveBornPosDistance) == true then
							self.isArrivePos = true
							self.isStartPatrol = true
						end
					else
						self.distanceDetectFrame = self.distanceDetectFrame + Time.deltaTime

						if self.distanceDetectFrame > BrainStoryMode.DistanceDetectInterval then
							self.distanceDetectFrame = 0

							if GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetRebornPosition(), BrainStoryMode.LeaveBornPosDistance) == false then
								self.isArrivePos = false
							end
						end
					end
				else
					self.isArrivePos = true
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.BornType > 0 and (self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self.instance:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true)
					end),
					BT.StopMovementNode:create(self.instance)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:GetGrade() > 1 and self.bornGrade <= 1 and self.instance:GetHeroId() == 20013
							end),
							BT.StopMovementNode:create(self.instance),
							BT.CommonNode:create(function()
								self.instance:ResetGrade()
							end)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								local isNoAction = false
								local sceneCamera = self.instance:GetSceneCamera()

								if sceneCamera ~= nil and GameAI.IsAnimalWithinDistance(self.instance, sceneCamera:GetCameraRealPosition(), BrainStoryMode.NoActionDistance) == false then
									isNoAction = true
								end

								return isNoAction == true and DebugShowAllMonster == false
							end),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsInState(AnimalBase_Define.MoveStateType.Special) == true
							end),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true and self.relaxType == BrainStoryMode.RelaxType.Loop and AnimalBase.Config[self.instance:GetHeroId()].skillComboMax[AnimalBase_Define.SkillType.Relax] > 2
							end),
							BT.SelectorNode:create({
								BT.SequenceNode:create({
									BT.IsSkillingByIdNode:create(self.instance, AnimalBase_Define.SkillType.Relax, 0),
									BT.StopMovementNode:create(self.instance)
								}),
								BT.SequenceNode:create({
									BT.StopMovementNode:create(self.instance),
									BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false)
								})
							})
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								if self.instance:IsSkilling() == false then
									self.waitTime = self.waitTime + Time.deltaTime
								end

								return self.instance:IsHaveSkill(AnimalBase_Define.SkillType.Relax) == true and self.relaxType == BrainStoryMode.RelaxType.Normal and self.waitTime > self.relaxInterval
							end),
							BT.StopMovementNode:create(self.instance),
							BT.LongPressSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat, AnimalBase_Define.SkillType.Relax, 1, false),
							BT.PressUpSkillButtonNode:create(self.instance, ControllerMain.SkillButton.NewThreat),
							BT.CommonNode:create(function()
								self.waitTime = 0
								self.relaxInterval = MathHelper.getRandom(BrainStoryMode.RelaxIntervalMin, BrainStoryMode.RelaxIntervalMax, self.instance:GetAnimalId())
							end)
						}),
						BT.SequenceNode:create({
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.StopMovementNode:create(self.instance),
							BT.ConditionWaitNode:create(function()
								local tmpLook = self.instance:GetRebornLook()

								self.instance:LookAt(tmpLook, false)

								local animalForward = self.instance:GetForward()
								local tmpAngle = Vector3.Angle(tmpLook, animalForward, true, true)

								return tmpAngle <= BrainStoryMode.ArriveBornPosAngle or self.instance:IsDead() or self.instance:IsHit()
							end)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == false
					end),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.GoToBornPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow),
					BT.CommonNode:create(function()
						self.distanceDetectFrame = self.distanceDetectFrame + Time.deltaTime

						if self.distanceDetectFrame > BrainStoryMode.DistanceDetectInterval or self.isLoseBackWay == true then
							if ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false and (self.animalTarget == nil or self.animalTarget:IsDead() == true or self.animalTarget:IsShow() == false) then
								local sceneCamera = self.instance:GetSceneCamera()

								if sceneCamera ~= nil then
									local dis1 = Vector3.DistanceSquare(self.instance:GetPosByWorldPos(), sceneCamera:GetCameraRealPosition())
									local dis2 = Vector3.DistanceSquare(self.instance:GetRebornPosition(), sceneCamera:GetCameraRealPosition())

									if dis1 > BrainStoryMode.NotLookDistance * BrainStoryMode.NotLookDistance and dis2 > BrainStoryMode.NotLookDistance * BrainStoryMode.NotLookDistance then
										self.isLoseBackWay = true
									else
										self.isLoseBackWay = false
									end
								end
							else
								self.isLoseBackWay = false
							end
						end

						if self.isLoseBackWay == true then
							self.loseTargetFrame = self.loseTargetFrame + Time.deltaTime

							if self.loseTargetFrame > BrainStoryMode.NotLookTime then
								self.loseTargetFrame = 0

								local pos = Vector3.zero

								pos:SetVector3(self.instance:GetRebornPosition())
								self.instance:SetPosByWorldPos(pos, true)
								self.instance:LookAt(self.instance:GetRebornLook())
								self.instance:SetTargetByWorldPos(self.instance:GetRebornPosition(), true)
							end
						else
							self.loseTargetFrame = 0
						end
					end)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainStoryMode:StoryModelCompanion()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.CommonNode:create(function()
				if self.posState == BrainStoryMode.PosState.Initial then
					self.posState = BrainStoryMode.PosState.NearBornPoint

					if self.animalCompanion == nil then
						self.animalCompanion = GameAI.GetCompanion(self.instance)

						if self.animalCompanion == nil then
							-- block empty
						end
					end
				end
			end),
			BT.ConditionNode:create(function()
				return self.instance:IsStop() == true or self.isEnd == true or self.instance:IsDead() == true or self.gameController:IsInMovie() == true or self.gameController:IsInTimeLine() == true or self.gameController:IsInDialog() == true or self.gameController:IsStatus(ControllerStoryMode.Status.Normal) == false and GameAI.IsTimeLineSkillEnable(self.instance, self.gameController) == false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.CommonNode:create(function()
				if self.animalTarget ~= nil then
					self.animalTarget = nil

					if self.instance:GetHatredTargetId() > 0 then
						self.instance:SetHatredTargetId(0)
					end
				end
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return UILayerCtrl.IsCurrentLayerCurtain() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget ~= nil then
					return true
				else
					self.loseTargetFrame = 0
				end

				return false
			end),
			BT.CommonNode:create(function()
				local enemyList = sceneController:GetEnemyList(self.instance:GetTeamId())

				if table.nums(enemyList) > 1 and self.instance:IsSkilling() == false then
					self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

					if self.changeTargetFrame > BrainStoryMode.ChangeTargetInterval then
						local target = self.attack:GetTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true and target ~= self.animalTarget then
							self.animalTarget = target
						end

						self.changeTargetFrame = 0
					end
				end
			end),
			BT.ConditionNode:create(function()
				if self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					local isLose = (GameAI.IsAnimalWithinDistance(self.instance, self.animalTarget:GetPosByWorldPos(), self.loseRadius) == false or self.animalTarget:IsOnStair() == false and ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false) and self.instance:IsSkilling() == false

					if isLose == true then
						self.loseTargetFrame = self.loseTargetFrame + Time.deltaTime
					else
						self.loseTargetFrame = 0
					end
				end

				return GameAI.IsCanGetTarget(self.animalTarget) == false or self.loseTargetFrame > BrainStoryMode.LoseTargetTimeForCompanion
			end),
			BT.CommonNode:create(function()
				if self.attack.followType == Follow.Type.Default and self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true then
					self.posState = BrainStoryMode.PosState.AwayBornPoint
				end

				self.backTime = 0
			end),
			BT.CommonNode:create(function()
				self.animalTarget = nil
				self.loseTargetFrame = 0
				self.isArrivePos = false

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
			end),
			BT.StopMovementNode:create(self.instance),
			BT.StopSkillNode:create(self.instance),
			BT.WaitNode:create(1)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget == nil and self.animalCompanion ~= nil and self.isArrivePos == false then
					return true
				else
					self.loseCompanionFrame = 0
				end

				return false
			end),
			BT.ConditionNode:create(function()
				if self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true then
					local isLose = self.animalCompanion:IsOnStair() == false and ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false and self.instance:IsSkilling() == false

					if isLose == true then
						self.loseCompanionFrame = self.loseCompanionFrame + Time.deltaTime
					else
						self.loseCompanionFrame = 0
					end
				end

				return self.loseCompanionFrame > BrainStoryMode.LoseCompanionTime
			end),
			BT.CommonNode:create(function()
				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				self.animalCompanion = nil
				self.loseCompanionFrame = 0
				self.isArrivePos = false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.StopSkillNode:create(self.instance),
			BT.WaitNode:create(1)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.NearBornPoint
			end),
			BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
			BT.ConditionNode:create(function()
				if self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true and GameAI.IsAnimalWithinDistance(self.instance, self.animalCompanion:GetPosByWorldPos(), BrainStoryMode.AwayCompanionPosDistance) == false then
					return true
				end

				return false
			end),
			BT.StopMovementNode:create(self.instance),
			BT.WaitNode:create(1),
			BT.CommonNode:create(function()
				self.posState = BrainStoryMode.PosState.AwayBornPoint
				self.animalTarget = nil
				self.isArrivePos = false

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				self.instance:GetBrain().behaviourState = GameAI.BehaviourState.Attack
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalCompanion == nil then
					self.animalCompanion = GameAI.GetCompanion(self.instance)
				end

				return self.animalCompanion == nil or self.animalCompanion:IsDead() == true or self.animalCompanion:IsShow() == false
			end),
			BT.CommonNode:create(function()
				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end

				self.animalCompanion = nil
				self.loseCompanionFrame = 0
				self.isArrivePos = false
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				local isNeedFindTarget = false

				if self.animalTarget == nil then
					self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

					if self.changeTargetFrame > BrainStoryMode.GetTargetInterval then
						self.changeTargetFrame = 0

						if isNeedFindTarget == false and self.animalCompanion:GetHatredTargetId() > 0 then
							local tmpTarget = sceneController:FindPlayerById(self.animalCompanion:GetHatredTargetId())

							if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
								isNeedFindTarget = true
							end

							self.animalCompanion:SetHatredTargetId(0)
						end

						if isNeedFindTarget == false and self.instance:GetHatredTargetId() > 0 then
							local tmpTarget = sceneController:FindPlayerById(self.instance:GetHatredTargetId())

							if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
								isNeedFindTarget = true
							end

							self.instance:SetHatredTargetId(0)
						end

						if isNeedFindTarget == false then
							local enemyList = GameAI.GetSelectTarget(self.instance, GameAI.SkillTargetType.Enemy)

							for i, tmpTarget in pairs(enemyList) do
								if tmpTarget ~= nil and tmpTarget:IsDead() == false and tmpTarget:IsShow() == true then
									if tmpTarget:GetHatredTargetId() > 0 and tmpTarget:GetHatredTargetId() == self.animalCompanion:GetAnimalId() then
										isNeedFindTarget = true
									end

									if isNeedFindTarget == false then
										local target = tmpTarget:GetBrain():GetAnimalTarget()

										if target ~= nil and target:IsDead() == false and target:IsShow() == true and (target == self.instance or target == self.animalCompanion) then
											isNeedFindTarget = true
										end
									end
								end
							end
						end

						if isNeedFindTarget == true then
							self.animalTarget = self.attack:GetTarget()
						end
					end
				end

				return self.animalTarget ~= nil and self.animalTarget:IsDead() == false and self.animalTarget:IsShow() == true
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.AwayBornPoint
			end),
			BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
			BT.UnLockTargetNode:create(self.instance),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true and GameAI.IsAnimalWithinDistance(self.instance, self.animalCompanion:GetPosByWorldPos(), BrainStoryMode.ArriveCompanionPosDistance) == true
					end),
					BT.CommonNode:create(function()
						self.posState = BrainStoryMode.PosState.NearBornPoint
					end)
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true
					end),
					BT.CommonNode:create(function()
						self.animalTarget = nil
						self.isArrivePos = false

						if self.instance:GetHatredTargetId() > 0 then
							self.instance:SetHatredTargetId(0)
						end

						self.instance:SetTargetByWorldPos(self.animalCompanion:GetFindPathPosForAI(), true)
						self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
					end)
				})
			})
		}),
		BT.SequenceNode:create({
			BT.CommonNode:create(function()
				if self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true then
					if GameAI.IsAnimalWithinDistance(self.instance, self.animalCompanion:GetPosByWorldPos(), BrainStoryMode.ArriveCompanionPosDistance) == true then
						self.isArrivePos = true
					elseif GameAI.IsAnimalWithinDistance(self.instance, self.animalCompanion:GetPosByWorldPos(), BrainStoryMode.LeaveCompanionPosDistance) == false then
						self.isArrivePos = false
					end

					if GameAI.IsAnimalWithinAngle(self.instance, self.animalCompanion:GetPosByWorldPos(), BrainStoryMode.LookCompanionAngle) == true then
						self.isTurnRot = true
					elseif GameAI.IsAnimalWithinAngle(self.instance, self.animalCompanion:GetPosByWorldPos(), BrainStoryMode.NotLookCompanionAngle) == false then
						self.isTurnRot = false
					end
				else
					self.isArrivePos = false
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.isTurnRot == true
							end),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return self.isTurnRot == false
							end),
							BT.CommonNode:create(function()
								if self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true then
									self.instance:SetOrientation(self.animalCompanion:GetPosByWorldPos())
								else
									self.instance:StopMovement()
								end
							end)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == false
					end),
					BT.CommonNode:create(function()
						if self.animalCompanion ~= nil and self.animalCompanion:IsDead() == false and self.animalCompanion:IsShow() == true then
							self.instance:SetTargetByWorldPos(self.animalCompanion:GetFindPathPosForAI(), true)
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
						else
							self.instance:StopMovement()
						end
					end)
				})
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainStoryMode:StoryModelBoss()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.Initial
			end),
			BT.CommonNode:create(function()
				local heroExtData = self:GetHeroExtData()

				if heroExtData ~= nil then
					self.alertType = heroExtData.IsAlert
				end
			end),
			BT.CommonNode:create(function()
				self.posState = BrainStoryMode.PosState.NearBornPoint
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.isEnd == true or self.instance:IsDead() == true or self.gameController:IsStatus(ControllerStoryMode.Status.Normal) == false and GameAI.IsTimeLineSkillEnable(self.instance, self.gameController) == false or self.instance:IsStop() == true or self.gameController:IsInMovie() == true or self.gameController:IsInTimeLine() == true or self.gameController:IsInDialog() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return UILayerCtrl.IsCurrentLayerCurtain() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.animalTarget ~= nil
			end),
			BT.CommonNode:create(function()
				local enemyList = sceneController:GetEnemyList(self.instance:GetTeamId())

				if table.nums(enemyList) > 1 and self.instance:IsSkilling() == false then
					self.changeTargetFrame = self.changeTargetFrame + Time.deltaTime

					if self.changeTargetFrame > BrainStoryMode.ChangeTargetInterval then
						local target = self.attack:GetTarget()

						if target ~= nil and target:IsDead() == false and target:IsShow() == true and target ~= self.animalTarget then
							self.animalTarget = target
						end

						self.changeTargetFrame = 0
					end
				end
			end),
			BT.ConditionNode:create(function()
				return GameAI.IsCanGetTarget(self.animalTarget) == false or self.gameController:IsBossMode() == false
			end),
			BT.CommonNode:create(function()
				self.animalTarget = nil

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end
			end),
			BT.StopMovementNode:create(self.instance),
			BT.StopSkillNode:create(self.instance),
			BT.WaitNode:create(1)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget == nil then
					self.animalTarget = self.attack:GetTarget()
				end

				return self.animalTarget ~= nil
			end),
			BT.SelectorNode:create({
				self.attack.attackNode,
				self.follow.followNode
			})
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.instance:GetRebornPosition() ~= Vector3.zero
			end),
			BT.CommonNode:create(function()
				if self.isArrivePos == false then
					if GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetRebornPosition(), BrainStoryMode.ArriveBornPosDistance) == true then
						self.isArrivePos = true
					end
				elseif GameAI.IsAnimalWithinDistance(self.instance, self.instance:GetRebornPosition(), BrainStoryMode.LeaveBornPosDistance) == false then
					self.isArrivePos = false
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
							BT.StopMovementNode:create(self.instance),
							BT.ConditionWaitNode:create(function()
								local tmpLook = self.instance:GetRebornLook()

								self.instance:LookAt(tmpLook, false)

								local animalForward = self.instance:GetForward()
								local tmpAngle = Vector3.Angle(tmpLook, animalForward, true, true)

								return tmpAngle <= BrainStoryMode.ArriveBornPosAngle or self.instance:IsDead() or self.instance:IsHit()
							end)
						})
					})
				}),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == false
					end),
					BT.NotDecorator:create(BT.IsSkillingNode:create(self.instance)),
					BT.GoToBornPointNode:create(self.instance, AnimalBase_Define.SpeedMode.Slow)
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainStoryMode:StoryModelSanMonster()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.isEnd == true or self.instance:IsDead() == true or self.gameController:IsStatus(ControllerStoryMode.Status.Normal) == false and GameAI.IsTimeLineSkillEnable(self.instance, self.gameController) == false or self.instance:IsStop() == true or self.gameController:IsInMovie() == true or self.gameController:IsInTimeLine() == true or self.gameController:IsInDialog() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return UILayerCtrl.IsCurrentLayerCurtain() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.animalTarget ~= nil
			end),
			BT.ConditionNode:create(function()
				return GameAI.IsCanGetTarget(self.animalTarget) == false or self.animalTarget:IsOnStair() == false and ProjectXPathFindingAI.IsFindPath(self.instance:GetAnimalId()) == false
			end),
			BT.CommonNode:create(function()
				self.animalTarget = nil

				if self.instance:GetHatredTargetId() > 0 then
					self.instance:SetHatredTargetId(0)
				end
			end),
			BT.StopMovementNode:create(self.instance),
			BT.StopSkillNode:create(self.instance),
			BT.WaitNode:create(1)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				if self.animalTarget == nil then
					local hostPlayer = sceneController:GetHostPlayer()

					self.animalTarget = hostPlayer
				end

				return self.animalTarget ~= nil
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

function BrainStoryMode:StoryModelNPC()
	local btnode = BT.SelectorNode:create({
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainStoryMode:StoryModelGuide()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.posState == BrainStoryMode.PosState.Initial
			end),
			BT.CommonNode:create(function()
				local heroExtData = self:GetHeroExtData()

				if heroExtData ~= nil and heroExtData.WanderPoint ~= "" then
					self.wanderIndex, self.wanderPos = self:GetWanderPoint(self.wanderIndex)
				end
			end),
			BT.CommonNode:create(function()
				self.posState = BrainStoryMode.PosState.NearBornPoint
			end)
		}),
		BT.SequenceNode:create({
			BT.ConditionNode:create(function()
				return self.isEnd == true or self.instance:IsDead() == true or self.gameController:IsStatus(ControllerStoryMode.Status.Normal) == false and GameAI.IsTimeLineSkillEnable(self.instance, self.gameController) == false or self.instance:IsStop() == true or self.gameController:IsInMovie() == true or self.gameController:IsInTimeLine() == true or self.gameController:IsInDialog() == true
			end),
			BT.StopMovementNode:create(self.instance)
		}),
		BT.SequenceNode:create({
			BT.CommonNode:create(function()
				local hostPlayer = sceneController:GetHostPlayer()

				if hostPlayer ~= nil and hostPlayer:IsDead() == false and hostPlayer:IsShow() == true then
					if GameAI.IsAnimalWithinDistance(self.instance, hostPlayer:GetPosByWorldPos(), BrainStoryMode.NearGuidePosDistance) == true then
						self.isArrivePos = true
					elseif GameAI.IsAnimalWithinDistance(self.instance, hostPlayer:GetPosByWorldPos(), BrainStoryMode.AwayGuidePosDistance) == false then
						self.isArrivePos = false
					end
				end
			end),
			BT.SelectorNode:create({
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						return self.isArrivePos == true
					end),
					BT.SelectorNode:create({
						BT.SequenceNode:create({
							BT.ConditionNode:create(function()
								return GameAI.IsAnimalWithinDistance(self.instance, self.wanderPos, GameAI.ArriveDistance) == true
							end),
							BT.CommonNode:create(function()
								local wanderIndex, wanderPos, wanderLook, length, isEnd = self:GetWanderPoint(self.wanderIndex)

								if isEnd == false then
									self.wanderPos = wanderPos
									self.wanderIndex = wanderIndex
								else
									local animalForward = self.instance:GetForward()
									local tmpAngle = Vector3.Angle(wanderLook, animalForward, true, true)

									if tmpAngle > BrainStoryMode.ArriveBornPosAngle then
										self.instance:LookAt(wanderLook, false)
									end
								end
							end),
							BT.StopMovementNode:create(self.instance)
						}),
						BT.CommonNode:create(function()
							if self.wanderIndex == 5 and self.instance:GetHeroId() == 20010 then
								self.waitTime = self.waitTime + Time.deltaTime

								local value = Mathf.Lerp(0, 1, self.waitTime)

								self.instance:ChangeDissolveThreshold(value)
								self.instance:SetBodyCollider(false)

								if self.instance.sanMonsterEffect ~= nil then
									self.instance.sanMonsterEffect:Clear()

									self.instance.sanMonsterEffect = nil
								end
							end

							self.instance:SetTargetByWorldPos(self.wanderPos, true)
							self.instance:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
						end)
					})
				}),
				BT.StopMovementNode:create(self.instance)
			})
		}),
		BT.StopMovementNode:create(self.instance)
	})

	return btnode
end

function BrainStoryMode:ChangeBehaviourMode(behaviourMode)
	if self.instance ~= nil and behaviourMode ~= nil then
		local heroExtData = self:GetHeroExtData()

		self:initialize(self.instance)

		self.animalTarget = nil

		self.instance:SetHatredTargetId(0)

		self.behaviourMode = behaviourMode

		self:SetHeroExtData(heroExtData)

		self.posState = BrainStoryMode.PosState.Initial

		local btnode = self:GetBehaviorNode()

		self.instance.beTree = BT.BehaviourTree:create(btnode)

		self:SetBehaviorTree(self.instance.beTree)
		self.instance.beTree:Reset()
	end
end

function BrainStoryMode:GetWanderPoint(wanderIndex)
	local heroExtData = self:GetHeroExtData()

	if heroExtData.WanderPoint ~= nil and heroExtData.WanderPoint ~= "" then
		local wanderPointList = string.split(heroExtData.WanderPoint, ";")
		local isRandom = heroExtData.IsWanderRandom
		local length = #wanderPointList
		local index = 1

		if length > 1 and wanderIndex > 0 then
			for i, v in pairs(wanderPointList) do
				if tonumber(wanderPointList[i]) == tonumber(wanderIndex) then
					table.remove(wanderPointList, i)

					index = i

					break
				end
			end
		end

		local isEnd = false

		if isRandom > 0 and length > 1 then
			local rndNum = MathHelper.getRandom(1, #wanderPointList, self.instance:GetAnimalId())

			wanderIndex = tonumber(wanderPointList[rndNum])
		else
			if length <= index then
				index = 1
				isEnd = true
			end

			wanderIndex = tonumber(wanderPointList[index])
		end

		local wanderPoint = MS_SceneData.GetData(MS_SceneData.LocatorType.Wander, wanderIndex)

		if wanderPoint == nil then
			SystemHelper.LogError("============GetWanderPoint error !!wanderIndex=" .. wanderIndex)
		end

		return wanderIndex, wanderPoint.Position, wanderPoint.Orientation, length, isEnd
	end

	return 0, Vector3.zero, Vector3.zero, 0, false
end

function BrainStoryMode:SetAttracted(pos)
	if pos ~= nil then
		self.attractedPos = Vector3.zero

		self.attractedPos:SetVector3(pos)
	else
		self.attractedPos = nil
	end
end

function BrainStoryMode:Exit()
	BrainBase.Exit(self)

	self.attack = nil
	self.follow = nil
	self.backPos = nil
	self.wanderPos = nil
	self.animalTarget = nil
	self.animalCompanion = nil
	self.moveRadius = nil
	self.attractedPos = nil
end

return BrainStoryMode
