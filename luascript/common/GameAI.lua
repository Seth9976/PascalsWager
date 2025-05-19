-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/GameAI.lua

GameAI = class("GameAI")
GameAI.static.SkillTargetType = {
	FriendAndSelf = 4,
	Self = 3,
	Enemy = 1,
	AllOther = 5,
	All = 6,
	Friend = 2,
	HaveSameTarget = 7,
	None = 0
}
GameAI.static.BehaviourState = {
	Attack = 1,
	HoverInSkilling = 3,
	Dodge = 9,
	Threat = 6,
	CircleRound = 8,
	HoverWaitting = 11,
	Hover = 2,
	HoverInDefence = 4,
	Alert = 7,
	HoverKeep = 5,
	Execute = 10,
	None = 0
}
GameAI.static.BehaviourMode = {
	Default = 0,
	Guide = 6,
	TimeLine = 8,
	Companion = 7,
	BossRoomMode = 4,
	DoNotAttack = 2,
	Attack = 1,
	Battle = 5,
	Team = 9,
	AttackBack = 3
}
GameAI.static.MoveDirection = {
	Right = 4,
	Forward = 1,
	Back = 2,
	Left = 3,
	None = 0
}
GameAI.static.AILevel = {
	Normal = 1,
	Easy = 2,
	None = 0
}
GameAI.static.ArriveDistance = 2
GameAI.static.GetTargetSortIgnoreDis = 1
GameAI.static.GetWanderZoneSortIgnoreDis = 10
GameAI.static.HearingHight = 4
GameAI.static.CheckMoveDistance = 0.5
GameAI.static.NearDistance = 0.15
GameAI.static.LowEnergyPercent = 0.3
GameAI.static.LowHpPercent = 0.5
GameAI.static.GetPathDistance = 0.5
GameAI.static.HeroWalkSpeed = 1.5
GameAI.static.EnableHeight = 3
GameAI.static.CheckInsightLayerMask = LayerMask.GetMask("WallOpaque", "WallInvisible", "Ground")
GameAI.static.CheckIconInsightLayerMask = LayerMask.GetMask("WallOpaque", "WallInvisible", "Ground")
GameAI.static.CheckMoveLayerMask = LayerMask.GetMask("WallOpaque", "Ground", "WallTransparent", "WallInvisible", "WallMonster")

function GameAI.GetSelectTarget(animal, targetType)
	local ret = {}

	if animal ~= nil and targetType ~= nil then
		local sceneController = ST_Main.GetSceneController()

		if targetType == GameAI.SkillTargetType.None then
			-- block empty
		elseif targetType == GameAI.SkillTargetType.Enemy then
			local enemyList = sceneController:GetEnemyList(animal:GetTeamId())

			for k, v in pairs(enemyList) do
				table.insert(ret, v)
			end

			if BattleData.GetType() == BattleData.Type.PVE_Guard and animal:IsType(AnimalBase_Define.Type.Monster) == true then
				table.insert(ret, sceneController:GetHomeBase())
			end
		elseif targetType == GameAI.SkillTargetType.Friend then
			local friendList = sceneController:GetTeamList(animal:GetTeamId())

			for k, v in pairs(friendList) do
				if v ~= animal then
					table.insert(ret, v)
				end
			end
		elseif targetType == GameAI.SkillTargetType.Self then
			table.insert(ret, animal)
		elseif targetType == GameAI.SkillTargetType.FriendAndSelf then
			local friendList = sceneController:GetTeamList(animal:GetTeamId())

			for k, v in pairs(friendList) do
				table.insert(ret, v)
			end
		elseif targetType == GameAI.SkillTargetType.AllOther then
			local playerList = sceneController:GetPlayerList()

			for k, v in pairs(playerList) do
				if v ~= animal then
					table.insert(ret, v)
				end
			end
		elseif targetType == GameAI.SkillTargetType.All then
			local playerList = sceneController:GetPlayerList()

			for k, v in pairs(playerList) do
				table.insert(ret, v)
			end
		elseif targetType == GameAI.SkillTargetType.HaveSameTarget then
			local friendList = sceneController:GetTeamList(animal:GetTeamId())

			for k, v in pairs(friendList) do
				if v ~= animal and v:GetAITarget() ~= nil and v:GetAITarget() == animal:GetAITarget() then
					table.insert(ret, v)
				end
			end
		end
	end

	return ret
end

function GameAI.IsInSelectTargetForShell(hostAnimalId, hostTeamId, targetType, targetShell)
	if targetShell ~= nil and targetType ~= nil then
		local targetAnimalId = targetShell:GetFromAnimalId()
		local targetTeamId = targetShell:GetFromTeamId()

		if targetType == GameAI.SkillTargetType.None then
			-- block empty
		elseif targetType == GameAI.SkillTargetType.Enemy then
			if targetTeamId ~= hostTeamId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.Friend then
			if targetAnimalId ~= hostAnimalId and targetTeamId == hostTeamId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.Self then
			if targetAnimalId == hostAnimalId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.FriendAndSelf then
			if targetTeamId == hostTeamId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.AllOther then
			if targetAnimalId ~= hostAnimalId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.All then
			return true
		end
	end

	return false
end

function GameAI.IsInSelectTarget(hostAnimalId, hostTeamId, targetType, targetAnimal)
	if targetAnimal ~= nil and targetType ~= nil then
		local targetAnimalId = targetAnimal:GetAnimalId()
		local targetTeamId = targetAnimal:GetTeamId()

		if targetType == GameAI.SkillTargetType.None then
			-- block empty
		elseif targetType == GameAI.SkillTargetType.Enemy then
			if targetTeamId ~= hostTeamId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.Friend then
			if targetAnimalId ~= hostAnimalId and targetTeamId == hostTeamId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.Self then
			if targetAnimalId == hostAnimalId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.FriendAndSelf then
			if targetTeamId == hostTeamId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.AllOther then
			if targetAnimalId ~= hostAnimalId then
				return true
			end
		elseif targetType == GameAI.SkillTargetType.All then
			return true
		end
	end

	return false
end

function GameAI.IsAnimalWithinSight(animal, target, viewAngle, distance)
	if animal == nil or target == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local targetPos = target:GetPosByWorldPos()
	local dis = Vector3.DistanceSquare(targetPos, animalPos)

	if dis <= distance * distance then
		local dir = targetPos - animalPos

		dir:SetNormalize()

		local animalForward = animal:GetForward()
		local angle = Vector3.Angle(dir, animalForward)

		dir = nil

		if angle <= viewAngle then
			local isVisible = animal:IsSightVisible(target)

			return isVisible
		end
	end

	return false
end

function GameAI.IsAnimalWithinSkillRange(animal, animalTarget, skillRangeMin, skillRangeMax, skillAngle)
	if animal == nil or animalTarget == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local targetPos = animalTarget:GetPosByWorldPos()
	local dis = Vector3.DistanceSquare(targetPos, animalPos)

	if dis <= skillRangeMax * skillRangeMax and dis >= skillRangeMin * skillRangeMin then
		local rayDirection = targetPos - animalPos

		rayDirection.y = 0

		rayDirection:SetNormalize()

		local animalForward = animal:GetForward()
		local angle = Vector3.Angle(rayDirection, animalForward)

		rayDirection = nil

		if skillAngle ~= nil then
			if angle <= skillAngle then
				return true
			end
		else
			return true
		end
	end

	return false
end

function GameAI.IsAnimalWithinHearing(animal, targetPos, distance, angle)
	if animal == nil or targetPos == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local dis = Vector3.DistanceSquare(animalPos, targetPos)

	if dis < distance * distance then
		if Mathf.Abs(angle) < 180 then
			local dir = targetPos - animalPos

			dir.y = 0

			dir:SetNormalize()

			local animalForward = animal:GetForward()
			local tmpAngle = Vector3.Angle(dir, animalForward)

			dir = nil

			if tmpAngle <= angle then
				return true
			end
		else
			return true
		end
	end

	return false
end

function GameAI.IsAnimalWithinDistance(animal, targetPos, distance)
	if animal == nil or targetPos == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local dis = Vector3.DistanceSquare(animalPos, targetPos)

	if dis < distance * distance then
		return true
	end

	return false
end

function GameAI.IsAnimalWithinHeight(animal, targetPos, height)
	if animal == nil or targetPos == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local disY = Mathf.Abs(animalPos.y - targetPos.y)

	if disY <= height then
		return true
	end

	return false
end

function GameAI.IsAnimalWithinAngle(animal, targetPos, angle)
	if animal == nil or targetPos == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local dir = targetPos - animalPos

	dir.y = 0

	dir:SetNormalize()

	local animalForward = animal:GetForward()
	local tmpAngle = Vector3.Angle(dir, animalForward)

	dir = nil

	if tmpAngle <= angle then
		return true
	end

	return false
end

function GameAI.IsAnimalBehind(animal, animalTarget)
	if animal == nil or animalTarget == nil then
		return false
	end

	return GameAI.IsAnimalBehindPosition(animal, animalTarget:GetPosByWorldPos())
end

function GameAI.IsAnimalBehindPosition(animal, targetPos)
	if animal == nil or targetPos == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local animalForward = animal:GetForward()
	local relative = targetPos - animalPos
	local ret = Vector3.Dot(relative, animalForward)

	relative = nil

	if ret >= 0 then
		return false
	else
		return true
	end
end

function GameAI.IsAnimalLeft(animal, animalTarget)
	if animal == nil or animalTarget == nil then
		return false
	end

	local animalPos = animal:GetPosByWorldPos()
	local targetPos = animalTarget:GetPosByWorldPos()
	local animalLeft = animal:GetLeft()
	local relative = targetPos - animalPos
	local ret = Vector3.Dot(relative, animalLeft)

	relative = nil

	if ret >= 0 then
		return true
	else
		return false
	end
end

function GameAI.IsAnimalHitHand(animal)
	if animal == nil then
		return false
	end

	if animal:IsHitByType(AnimalBase_Define.HitType.LeftHand) or animal:IsHitByType(AnimalBase_Define.HitType.RightHand) or animal:IsHitByType(AnimalBase_Define.HitType.LeftHandBreak) or animal:IsHitByType(AnimalBase_Define.HitType.RightHandBreak) or animal:IsHitByType(AnimalBase_Define.HitType.LeftHandWeak) or animal:IsHitByType(AnimalBase_Define.HitType.RightHandWeak) then
		return true
	end

	return false
end

function GameAI.IsTargetAttacking(animal, animalTarget)
	if animal == nil or animalTarget == nil then
		return false
	end

	local targetState = animalTarget:GetSkillTypeForAI()
	local IsAttacking = animalTarget:IsSkillingSkill() and (targetState == AnimalBase_Define.SkillTypeForAI.OffenseFar or targetState == AnimalBase_Define.SkillTypeForAI.OffenseClose)
	local isFace = not GameAI.IsAnimalBehind(animalTarget, animal)

	if IsAttacking == true and isFace == true then
		return true
	end

	return false
end

function GameAI.IsAnimalCanAttack(animal, animalTarget)
	if animal == nil or animalTarget == nil then
		return true
	end

	return animal:IsSightVisible(animalTarget)
end

function GameAI.IsAnimalCanMove(animal, direction, checkMoveDistance)
	if animal == nil or direction == nil then
		return true
	end

	local centerPos = animal:GetGravityCenterPosition()
	local LayerMask
	local ret = XPhysics.Raycast(centerPos.x, centerPos.y, centerPos.z, direction.x, direction.y, direction.z, animal:GetRadius() + checkMoveDistance, GameAI.CheckMoveLayerMask)

	return not ret
end

function GameAI.IsAnimalMoveToTargetBlocked(animal, targetPos, layerMask)
	if animal == nil or targetPos == nil then
		return true
	end

	local centerPos = animal:GetGravityCenterPosition()
	local nowPos = animal:GetPosByWorldPos()
	local dis = Vector3.Distance(nowPos, targetPos)
	local tmpDir = targetPos - nowPos

	tmpDir:SetNormalize()

	local ret = XPhysics.Raycast(centerPos.x, centerPos.y, centerPos.z, tmpDir.x, tmpDir.y, tmpDir.z, dis, layerMask)

	tmpDir = nil

	return ret
end

function GameAI.GetEnemyInZone(animal, zone)
	local inZoneEnemy = {}

	if animal == nil or zone == nil then
		return inZoneEnemy
	end

	local sceneController = ST_Main.GetSceneController()
	local enemyList = sceneController:GetEnemyList(animal:GetTeamId())

	for k, v in pairs(enemyList) do
		local target = v

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			local tmpGroundType, tmpZoneType, tmpZoneId = target:GetTouchGroundDataSimple()

			if tmpZoneType == zone.zoneType and tmpZoneId == zone.zoneId then
				table.insert(inZoneEnemy, target)
			end
		end
	end

	return inZoneEnemy
end

function GameAI.GetEnemyInRange(animal, pos, range)
	local inRangeEnemy = {}

	if animal == nil or pos == nil or range == nil then
		return inRangeEnemy
	end

	local sceneController = ST_Main.GetSceneController()
	local enemyList = sceneController:GetEnemyList(animal:GetTeamId())

	for k, v in pairs(enemyList) do
		local target = v

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			local isInRange = GameAI.IsAnimalWithinDistance(target, pos, range)

			if isInRange == true then
				table.insert(inRangeEnemy, target)
			end
		end
	end

	return inRangeEnemy
end

function GameAI.GetTargetInRange(animal, pos, range)
	if animal == nil or pos == nil or range == nil then
		return nil
	end

	local enemyList = GameAI.GetSelectTarget(animal, GameAI.SkillTargetType.Enemy)
	local disMin = 9999
	local ret

	for k, v in pairs(enemyList) do
		local target = v

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			local targetPos = target:GetPosByWorldPos()
			local dis = Vector3.DistanceSquare(pos, targetPos)

			SystemHelper.LogTest("==========GetTargetInRange=dis=" .. dis)

			if dis < range * range and dis < disMin * disMin then
				ret = target
				disMin = dis
			end
		end
	end

	return ret
end

function GameAI.GetTargetSupport(animal)
	if animal == nil then
		return nil
	end

	local friendList = GameAI.GetSelectTarget(animal, GameAI.SkillTargetType.Friend)
	local animalPos = animal:GetPosByWorldPos()

	if #friendList > 1 then
		table.sort(friendList, function(a, b)
			if a ~= nil and a:IsDead() == false and a:IsShow() == true and b ~= nil and b:IsDead() == false and b:IsShow() == true then
				local disA = Vector3.Distance(a:GetPosByWorldPos(), animalPos)
				local disB = Vector3.Distance(b:GetPosByWorldPos(), animalPos)
				local diff = disA - disB

				diff = Mathf.Abs(diff)

				if diff <= GameAI.GetTargetSortIgnoreDis then
					return false
				end

				return disA < disB
			end
		end)
	end

	local selfEnergy = animal:GetValue():GetProperty(MS_HeroData.Property.Energy)
	local selfEnergyMax = animal:GetValue():GetPropertyMax(MS_HeroData.Property.Energy)

	if selfEnergy < selfEnergyMax * GameAI.LowEnergyPercent then
		return nil
	end

	local animalHearingRange = animal:GetHearingRange()
	local animalHearingAngle = animal:GetHearingAngle()
	local animalSightAngle = animal:GetSightAngle()
	local animalSightRange = animal:GetSightRange()

	for k, v in pairs(friendList) do
		local target = v

		if GameAI.IsCanGetTarget(target) == true then
			local targetHp = target:GetValue():GetProperty(MS_HeroData.Property.Hp)
			local targetHpMax = target:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)

			if targetHp <= targetHpMax * GameAI.LowHpPercent then
				if BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true then
					return target
				else
					local isSight = GameAI.IsAnimalWithinSight(animal, target, animalSightAngle, animalSightRange)

					if isSight == true then
						return target
					end

					local isHear = GameAI.IsAnimalWithinDistance(animal, target:GetPosByWorldPos(), animalHearingRange, animalHearingAngle)

					if isHear == true then
						return target
					end
				end
			end
		end
	end

	return nil
end

function GameAI.GetTargetOffense(animal, ignoreSilent)
	if animal == nil then
		return nil
	end

	local enemyList = GameAI.GetSelectTarget(animal, GameAI.SkillTargetType.Enemy)
	local animalPos = animal:GetPosByWorldPos()
	local sceneController = ST_Main.GetSceneController()
	local controllerGameMode = sceneController:GetGameController()

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and animal:IsBoss() == true and controllerGameMode:IsBossMode() == false then
		return nil
	end

	local isNoNeedFind = false
	local behaviourMode = animal:GetBrain().behaviourMode

	if BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true or BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and (behaviourMode ~= nil and (behaviourMode == GameAI.BehaviourMode.Attack or behaviourMode == GameAI.BehaviourMode.BossRoomMode) or animal:IsBoss() == true and controllerGameMode:IsBossMode() == true) then
		isNoNeedFind = true
	end

	if #enemyList > 1 then
		table.sort(enemyList, function(a, b)
			if a ~= nil and a:IsDead() == false and a:IsShow() == true and b ~= nil and b:IsDead() == false and b:IsShow() == true then
				local disA = Vector3.Distance(a:GetPosByWorldPos(), animalPos)
				local disB = Vector3.Distance(b:GetPosByWorldPos(), animalPos)
				local diff = disA - disB

				diff = Mathf.Abs(diff)

				if diff <= GameAI.GetTargetSortIgnoreDis then
					return false
				end

				return disA < disB
			end
		end)
	end

	local animalHearingRange = animal:GetHearingRange()
	local animalHearingAngle = animal:GetHearingAngle()
	local animalSightAngle = animal:GetSightAngle()
	local animalSightRange = animal:GetSightRange()
	local animalRadius = animal:GetRadius()

	for k, v in pairs(enemyList) do
		local target = v

		if target:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true and animal:GetTeamId() > 1 then
			target = nil
		end

		if GameAI.IsCanGetTarget(target) == true then
			if isNoNeedFind == true then
				return target
			end

			if animal:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true and target:GetTeamId() == 1 then
				return target
			end

			if animal:IsHaveStatusById(AnimalBase_Define.StatusIdBlind) then
				return nil
			end

			local targetMoveSpeed = target:GetMoveSpeedMode()
			local tmpHearingRange = animalHearingRange

			if ignoreSilent == nil or ignoreSilent == false then
				if targetMoveSpeed == AnimalBase_Define.SpeedMode.Slow then
					tmpHearingRange = animalRadius + target:GetRadius()
				elseif target:IsHost() == true then
					local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.Silent)

					if ret > 0 then
						tmpHearingRange = animalRadius + target:GetRadius()
					end
				end
			end

			local isHear = GameAI.IsAnimalWithinHearing(animal, target:GetPosByWorldPos(), tmpHearingRange, animalHearingAngle)

			if isHear == true then
				return target
			end

			local isSight = GameAI.IsAnimalWithinSight(animal, target, animalSightAngle, animalSightRange)

			if isSight == true then
				return target
			end
		end
	end

	return nil
end

function GameAI.GetCompanion(animal)
	if animal == nil then
		return nil
	end

	local friendList = GameAI.GetSelectTarget(animal, GameAI.SkillTargetType.Friend)
	local animalPos = animal:GetPosByWorldPos()

	if #friendList > 1 then
		table.sort(friendList, function(a, b)
			if a ~= nil and a:IsDead() == false and a:IsShow() == true and b ~= nil and b:IsDead() == false and b:IsShow() == true then
				local disA = Vector3.Distance(a:GetPosByWorldPos(), animalPos)
				local disB = Vector3.Distance(b:GetPosByWorldPos(), animalPos)
				local diff = disA - disB

				diff = Mathf.Abs(diff)

				if diff <= GameAI.GetTargetSortIgnoreDis then
					return false
				end

				return disA < disB
			end
		end)
	end

	for k, v in pairs(friendList) do
		local target = v

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			return target
		end
	end

	return nil
end

function GameAI.IsCanGetTarget(animal)
	if animal ~= nil and animal:IsDead() == false and animal:IsShow() == true and animal:GetHeroExtAIId() ~= GameAI.BehaviourMode.DoNotAttack and animal:GetHeroExtAIId() ~= GameAI.BehaviourMode.AttackBack and animal:GetHeroExtAIId() ~= GameAI.BehaviourMode.Guide and animal:IsInChangeOrTransferState() == false then
		return true
	end

	return false
end

function GameAI.GetTargetCooperation(animal, range)
	if animal == nil or range == nil then
		return nil
	end

	local friendList = GameAI.GetSelectTarget(animal, GameAI.SkillTargetType.Friend)

	for k, v in pairs(friendList) do
		local friend = v

		if friend ~= nil and friend:IsDead() == false and friend:IsShow() == true then
			local target = friend:GetBrain():GetAnimalTarget()

			if GameAI.IsCanGetTarget(target) == true then
				local isInRange = GameAI.IsAnimalWithinDistance(animal, friend:GetPosByWorldPos(), range)

				if isInRange == true and (friend:GetMoveSpeed() >= AnimalBase_Define.MotionWalkSpeed or friend:IsSkilling() == true or friend:IsHit() == true) then
					return target
				end
			end
		end
	end

	return nil
end

function GameAI.GetPositionTargetForward(targetAnimal, forwardDis)
	if targetAnimal == nil then
		return nil
	end

	local ret = targetAnimal:GetForward():Clone()

	ret:SetNormalize()
	ret:Mul(targetAnimal:GetRadius() + forwardDis)
	ret:Add(targetAnimal:GetPosByWorldPos())

	return ret
end

function GameAI.GetPositionCloseToTarget(host, targetAnimal)
	if host == nil or targetAnimal == nil then
		return nil
	end

	local nowPos = host:GetPosByWorldPos()
	local targetPos = targetAnimal:GetPosByWorldPos()
	local ret = nowPos - targetPos

	ret:SetNormalize()
	ret:Mul(host:GetRadius() + targetAnimal:GetRadius())
	ret:Add(targetPos)

	return ret
end

function GameAI.isPlayerNearNpc(animal)
	if animal == nil then
		return nil
	end

	local sceneController = ST_Main.GetSceneController()
	local friendList = sceneController:GetTeamList(animal:GetTeamId())

	for k, v in pairs(friendList) do
		local target = v

		if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHost() == true then
			local isNear = GameAI.IsAnimalWithinDistance(animal, target:GetPosByWorldPos(), 3)

			if isNear == true then
				return true
			end
		end
	end

	return false
end

function GameAI.GetAnimalDistance(animal1, animal2, useRadius)
	if animal1 == nil or animal2 == nil then
		return 0
	end

	local pos1 = animal1:GetPosByWorldPos()
	local pos2 = animal2:GetPosByWorldPos()
	local tmpDis = Vector3.Distance(pos1, pos2)

	if useRadius == true then
		local radius1 = animal1:GetRadius()
		local radius2 = animal2:GetRadius()

		tmpDis = tmpDis - radius1 - radius2
	end

	return Mathf.Max(tmpDis, 0)
end

function GameAI.GetWanderZone(animal)
	if animal == nil then
		return nil
	end

	local animalPos = animal:GetPosByWorldPos()
	local teamId = animal:GetTeamId()
	local sceneController = ST_Main.GetSceneController()
	local controllerGameMode = sceneController:GetGameController()
	local zoneC = controllerGameMode.zoneC
	local zoneBList = {}

	for k, v in pairs(controllerGameMode.zoneBList) do
		zoneBList[k] = v
	end

	local isGet, restTime = zoneC:GetOpenRestTime()

	if zoneC ~= nil and (isGet == true and restTime <= BrainOccupyMode.GoToZoneCRestTime or zoneC:GetStatus() == OccupyZone.Status.Open or zoneC:GetStatus() == OccupyZone.Status.Ready) then
		return zoneC
	end

	table.sort(zoneBList, function(a, b)
		local disA = Vector3.Distance(controllerGameMode:GetZonePosition(a:GetType(), a:GetZoneId()), animalPos)
		local disB = Vector3.Distance(controllerGameMode:GetZonePosition(b:GetType(), b:GetZoneId()), animalPos)
		local diff = disA - disB

		diff = Mathf.Abs(diff)

		if diff <= GameAI.GetWanderZoneSortIgnoreDis then
			return disB < disA
		end

		return disA < disB
	end)

	for k, v in pairs(zoneBList) do
		local zone = v

		if zone ~= nil and (zone:GetStatus() == OccupyZone.Status.Open or zone:GetStatus() == OccupyZone.Status.Ready and zone:GetTeamIdForReady() > 0 and zone:GetTeamIdForReady() ~= teamId or zone:GetStatus() == OccupyZone.Status.Keep and zone:GetTeamId() ~= teamId) then
			return zone
		end
	end

	return nil
end

function GameAI.GetSkillTargetByPos(attackAnimal, pos)
	local enemyList = GameAI.GetSelectTarget(attackAnimal, GameAI.SkillTargetType.Enemy)
	local disMin = 9999
	local target

	for k, animal in pairs(enemyList) do
		if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true then
			local targetPos = animal:GetPosByWorldPos()
			local dis = Vector3.DistanceSquare(pos, targetPos)

			if dis < disMin then
				target = animal
				disMin = dis
			end
		end
	end

	return target
end

function GameAI.GetClosestTarget(animal)
	local enemyList = GameAI.GetSelectTarget(animal, GameAI.SkillTargetType.Enemy)
	local target
	local animalPos = animal:GetPosByWorldPos()

	if #enemyList > 1 then
		table.sort(enemyList, function(a, b)
			if a ~= nil and a:IsDead() == false and a:IsShow() == true and b ~= nil and b:IsDead() == false and b:IsShow() == true then
				local disA = Vector3.Distance(a:GetPosByWorldPos(), animalPos)
				local disB = Vector3.Distance(b:GetPosByWorldPos(), animalPos)

				return disA < disB
			end
		end)
	end

	for k, tmpTarget in pairs(enemyList) do
		if tmpTarget ~= nil and tmpTarget:IsWillDead() == false and tmpTarget:IsShow() == true then
			target = tmpTarget

			return target
		end
	end

	return nil
end

function GameAI.GetSkillCaptureTarget(attackAnimal, skillData, attackPos, captureOffset, captureRadius, captureHeight, simple)
	if skillData == nil then
		return nil
	end

	local enemyList = GameAI.GetSelectTarget(attackAnimal, GameAI.SkillTargetType.Enemy)
	local disMin = 9999
	local target
	local nowPos = attackAnimal:GetPosByWorldPos()

	for k, animal in pairs(enemyList) do
		if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true and animal.useBodyBone <= 0 and animal.hugeBody <= 0 and animal.parasitic <= 0 then
			local targetPos = animal:GetPosByWorldPos()
			local ret, dis = GameAI.IsInSkillCaptureRange(nowPos, attackPos, targetPos, captureOffset, captureRadius, captureHeight, simple)

			if ret == true and dis < disMin then
				target = animal
				disMin = dis
			end
		end
	end

	return target
end

function GameAI.IsInSkillCaptureRange(selfPos, attackPos, targetPos, captureOffset, captureRadius, captureHeight, simple)
	local height = Mathf.Abs(attackPos.y - targetPos.y)

	if captureHeight < height then
		return false, 0
	end

	if simple == true then
		local dis = Vector3.Distance2D(attackPos, targetPos)
		local ret = false

		if dis <= captureRadius then
			ret = true
		end

		return ret, dis
	else
		local point1 = selfPos:Clone()
		local point2 = attackPos:Clone()
		local pos = targetPos:Clone()

		point2.y = point1.y
		pos.y = point1.y

		local dis = Vector3.Distance2D(attackPos, targetPos)

		if captureOffset > 0 then
			local dir = point2 - point1

			dir.y = 0

			if MathHelper.IsZero(dir.sqrMagnitude) == false then
				dir:SetNormalize()
				dir:Mul(captureOffset)
				point1:Add(dir)
			end

			dir = nil
		end

		local ret = MathHelper.IsInCapsule(pos, point1, point2, captureRadius)

		point1 = nil
		point2 = nil
		pos = nil

		return ret, dis
	end
end

function GameAI.GetShootTargetByRot(shootPos, shootRot, range)
	local dir = Vector3.forward

	dir:MulQuat(shootRot)
	dir:SetNormalize()
	dir:Mul(range)
	dir:Add(shootPos)

	return dir
end

function GameAI.GetAttackTarget(attackAnimal)
	local targetAnimal

	if attackAnimal:IsLockingPlayer() == true then
		targetAnimal = attackAnimal:GetLockPlayer()
	elseif attackAnimal:GetSkillTarget() ~= nil then
		targetAnimal = attackAnimal:GetSkillTarget()
	elseif attackAnimal:GetSkillTargetForAI() ~= nil then
		targetAnimal = attackAnimal:GetSkillTargetForAI()
	end

	return targetAnimal
end

function GameAI.GetParryReboundTargetByStraightLine(attackAnimal, startPos, reboundPos, range)
	if attackAnimal ~= nil and attackAnimal:IsDead() == false and attackAnimal:IsShow() == true then
		local targetPos = attackAnimal:GetAimPosition()
		local tmpDir = targetPos - reboundPos

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			tmpDir:SetNormalize()
			tmpDir:Mul(range)
			tmpDir:Add(reboundPos)

			return tmpDir
		end
	end

	local tmpDir = startPos - reboundPos

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		tmpDir:SetNormalize()
		tmpDir:Mul(range)
		tmpDir:Add(reboundPos)

		return tmpDir
	end

	return Vector3.s_forward
end

function GameAI.GetChestTargetByStraightLine(attackAnimal, shootPos, defaultRange, rangeMin, rangeMax, angleMax)
	local target = Vector3.zero
	local rangeAdd = 2

	target:SetVector3(attackAnimal:GetForward())

	local targetAnimal = GameAI.GetAttackTarget(attackAnimal)
	local targetFlg = false

	if targetAnimal ~= nil then
		local animalPos = targetAnimal:GetAimPosition()
		local tmpDir = animalPos - shootPos
		local tmpDir2 = tmpDir:Clone()

		tmpDir2.y = 0

		if Vector3.Dot(attackAnimal:GetForward(), tmpDir) > 0 then
			local dis = tmpDir.magnitude

			if MathHelper.IsZero(dis) == false then
				local angle = Vector3.Angle(tmpDir2, target)

				if angleMax < angle then
					local axis = Vector3.Cross(tmpDir2, target)
					local rot = Quaternion.AngleAxis(angle - angleMax, axis)

					target:SetVector3(tmpDir)
					target:MulQuat(rot)

					rot = nil
					axis = nil
				else
					target:SetVector3(tmpDir)
				end

				dis = Mathf.Clamp(dis + rangeAdd, rangeMin, rangeMax)

				target:SetNormalize()
				target:Mul(dis)
				target:Add(shootPos)

				targetFlg = true
			end
		end

		tmpDir = nil
	end

	if targetFlg == false then
		target:Mul(defaultRange)
		target:Add(shootPos)
	end

	return target
end

function GameAI.GetFootTargetByParabola(attackAnimal, shootPos, defaultRange, rangeMin, rangeMax, angleMax)
	local nowPos = attackAnimal:GetPosByWorldPos()
	local target = Vector3.zero

	target:SetVector3(attackAnimal:GetForward())

	local targetAnimal = GameAI.GetAttackTarget(attackAnimal)
	local targetFlg = false

	if targetAnimal ~= nil then
		local animalPos = targetAnimal:GetPosByWorldPos()
		local tmpDir = animalPos - shootPos
		local tmpDir2 = tmpDir:Clone()

		tmpDir2.y = 0

		if Vector3.Dot(attackAnimal:GetForward(), tmpDir) > 0 then
			local dis = tmpDir.magnitude

			if MathHelper.IsZero(dis) == false then
				local angle = Vector3.Angle(tmpDir2, target)

				if angleMax < angle then
					local axis = Vector3.Cross(tmpDir2, target)
					local rot = Quaternion.AngleAxis(angle - angleMax, axis)

					target:SetVector3(tmpDir)
					target:MulQuat(rot)

					rot = nil
					axis = nil
				else
					target:SetVector3(tmpDir)
				end

				dis = Mathf.Clamp(dis, rangeMin, rangeMax)

				target:SetNormalize()
				target:Mul(dis)
				target:Add(shootPos)

				targetFlg = true
			end
		end

		tmpDir = nil
	end

	if targetFlg == false then
		target:Mul(defaultRange)
		target:Add(nowPos)
	end

	return target
end

function GameAI.GetFootTargetByParabolaRound(attackAnimal, shootPos, defaultRange, rangeMin, rangeMax)
	local nowPos = attackAnimal:GetPosByWorldPos()
	local target = Vector3.zero

	target:SetVector3(attackAnimal:GetForward())

	local targetAnimal = GameAI.GetAttackTarget(attackAnimal)
	local targetFlg = false

	if targetAnimal ~= nil then
		local animalPos = targetAnimal:GetPosByWorldPos()
		local tmpDir = animalPos - shootPos
		local oldY = tmpDir.y

		tmpDir.y = 0

		local dis = tmpDir.magnitude

		if MathHelper.IsZero(dis) == false then
			target:SetVector3(tmpDir)

			dis = Mathf.Clamp(dis, rangeMin, rangeMax)

			target:SetNormalize()
			target:Mul(dis)

			target.y = oldY

			target:Add(shootPos)

			targetFlg = true
		end

		tmpDir = nil
	end

	if targetFlg == false then
		target:Mul(defaultRange)
		target:Add(nowPos)
	end

	return target
end

function GameAI.GetPosByParabola(attackAnimal, shootPos, targetPos, defaultRange, rangeMin, rangeMax)
	local nowPos = attackAnimal:GetPosByWorldPos()
	local target = Vector3.zero

	target:SetVector3(attackAnimal:GetForward())

	local targetFlg = false
	local tmpDir = targetPos - shootPos
	local oldY = tmpDir.y

	tmpDir.y = 0

	local dis = tmpDir.magnitude

	if MathHelper.IsZero(dis) == false then
		target:SetVector3(tmpDir)

		dis = Mathf.Clamp(dis, rangeMin, rangeMax)

		target:SetNormalize()
		target:Mul(dis)

		target.y = oldY

		target:Add(shootPos)

		targetFlg = true
	end

	tmpDir = nil

	if targetFlg == false then
		target:Mul(defaultRange)
		target:Add(nowPos)
	end

	return target
end

function GameAI.GetFootTargetByStraightLine(attackAnimal, shootPos, defaultRange, rangeMin, rangeMax, angleMax)
	local target = GameAI.GetFootTargetByParabola(attackAnimal, shootPos, defaultRange, rangeMin, rangeMax, angleMax)
	local dir = target - shootPos
	local tmpDis = dir.magnitude

	dir:SetNormalize()
	dir:Mul(tmpDis + 10)
	target:SetVector3(shootPos)
	target:Add(dir)

	dir = nil

	return target
end

function GameAI.GetFootTarget(attackAnimal, defaultRange)
	local targetAnimal = GameAI.GetAttackTarget(attackAnimal)

	if targetAnimal ~= nil then
		return targetAnimal:GetPosByWorldPos()
	end

	local targetPos = attackAnimal:GetForward():Clone()

	targetPos:Mul(defaultRange)
	targetPos:Add(attackAnimal:GetPosByWorldPos())

	return targetPos
end

function GameAI.SetSkillingDirection(animal, animalTarget)
	if animal == nil or animalTarget == nil then
		return
	end

	local skillType = animal:GetSkillRotForAI()

	if animal:IsSkilling() == true and (animal:GetAnimatorParam(AnimalBase_Define.ParamType.SkillRot) >= 1 or skillType == AnimalBase_Define.SkillRotTypeAI.TurnBack) and animal:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit) < 1 then
		if skillType == AnimalBase_Define.SkillRotTypeAI.Chase then
			animal:SetTargetByWorldPos(animalTarget:GetFindPathPosForAI(), true)
			animal:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
		elseif skillType == AnimalBase_Define.SkillRotTypeAI.Stay then
			animal:StopMovement()
		else
			animal:SetTargetByWorldPos(animalTarget:GetPosByWorldPos(), false)
		end
	end
end

function GameAI.IsSkillParryCloseSuccess(attAnimal, hitAnimal)
	if attAnimal == nil or attAnimal:IsWillDead() == true or attAnimal:IsShow() == false or hitAnimal == nil or hitAnimal:IsWillDead() == true or hitAnimal:IsShow() == false then
		return false
	end

	local attForward = attAnimal:GetForward()
	local hitForward = hitAnimal:GetForward()
	local tmpAngle = Vector3.Angle(attForward, hitForward)

	if tmpAngle > 90 and hitAnimal:IsSkillParryCloseEnable() then
		return true
	end

	return false
end

function GameAI.IsTimeLineSkillEnable(animal, GameController)
	if animal == nil or animal:IsWillDead() == true or animal:IsShow() == false and GameController ~= nil then
		return false
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and (GameController:IsStatus(ControllerStoryMode.Status.TimeLine) == true or GameController:IsStatus(ControllerStoryMode.Status.TimeLineMove) == true) and animal:GetHeroExtAIId() == GameAI.BehaviourMode.TimeLine then
		return true
	end

	return false
end
