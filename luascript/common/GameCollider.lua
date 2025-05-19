-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/GameCollider.lua

GameCollider = {}
GameCollider.XCubeColliderMax = 5
GameCollider.XCubeColliderDistanceMax = 0.5
GameCollider.XCubeColliderAngleMax = 20
GameCollider.ColliderLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell")
GameCollider.ColliderSkillBoxLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "AnimalSkill")

function GameCollider.CheckCubeCollider(animal, xcubeList, useSkillBox)
	if xcubeList == nil or #xcubeList <= 0 then
		return 0, nil, nil
	end

	local retNum = 0
	local retIdList, retLayerList
	local ret = false
	local layer = GameCollider.ColliderLayerMask

	if useSkillBox == true then
		layer = GameCollider.ColliderSkillBoxLayerMask
	end

	local ignoreId = 0

	if animal ~= nil then
		ignoreId = animal:GetAnimalId()
	end

	local cnt = 1

	for i = 1, #xcubeList do
		local xcube = xcubeList[i]

		if xcube ~= nil then
			local halfExtents = xcube:GetHalfExtents()
			local shape = xcube:GetShapeType()
			local colliderNum = xcube:GetInterpolationNum()

			if colliderNum > 0 then
				for j = 1, colliderNum do
					local center = xcube:GetPositionInterpolation(j)
					local rotation = xcube:GetRotationInterpolation(j)
					local tmpRet = false

					if shape == XCube.ShapeType.Cube then
						tmpRet = XPhysics.OverlapBox(ignoreId, 0, center.x, center.y, center.z, halfExtents.x, halfExtents.y, halfExtents.z, rotation.x, rotation.y, rotation.z, rotation.w, layer, cnt)
					elseif shape == XCube.ShapeType.Sphere then
						local radius = Mathf.Min(halfExtents.x, halfExtents.y)

						radius = Mathf.Min(radius, halfExtents.z)
						tmpRet = XPhysics.OverlapSphere(ignoreId, 0, center.x, center.y, center.z, radius, layer, cnt)
					elseif shape == XCube.ShapeType.Capsule then
						local radius = Mathf.Max(halfExtents.x, halfExtents.z)

						tmpRet = XPhysics.OverlapCapsule(ignoreId, 0, center.x, center.y - halfExtents.y, center.z, halfExtents.y, radius, halfExtents.y * 2, layer, cnt)
					else
						SystemHelper.LogError("===========CheckCubeCollider=====cube shapeType error==")
					end

					if tmpRet == true then
						ret = true
						cnt = cnt + 1
					end
				end
			end
		end
	end

	if ret == true then
		retNum, retIdList, retLayerList = XPhysics.GetOverlapColliderAnimal(ignoreId, 0, layer, retIdList, retLayerList)
	end

	return retNum, retIdList, retLayerList
end

function GameCollider.GetOverlapColliderBone(targetAnimalId)
	local retNum = 0
	local retIdList, retLayerList

	retNum, retIdList, retLayerList = XPhysics.GetOverlapColliderBone(targetAnimalId, retIdList, retLayerList)

	return retNum, retIdList, retLayerList
end

function GameCollider.isCubeAndCubeCollider(box0, box1)
	local relative = box1.center - box0.center
	local box0AxisX = box0.rotation * Vector3.s_right
	local box0AxisY = box0.rotation * Vector3.s_up
	local box0AxisZ = box0.rotation * Vector3.s_forward
	local box0Axis = {}

	box0Axis[0] = box0AxisX
	box0Axis[1] = box0AxisY
	box0Axis[2] = box0AxisZ

	local box1AxisX = box1.rotation * Vector3.s_right
	local box1AxisY = box1.rotation * Vector3.s_up
	local box1AxisZ = box1.rotation * Vector3.s_forward
	local box1Axis = {}

	box1Axis[0] = box1AxisX
	box1Axis[1] = box1AxisY
	box1Axis[2] = box1AxisZ
	relative[0] = Vector3.Dot(relative, box0AxisX)
	relative[1] = Vector3.Dot(relative, box0AxisY)
	relative[2] = Vector3.Dot(relative, box0AxisZ)

	local cosAngle = {}
	local cosAngleAbs = {}
	local projBox0, projBox1, projRelative

	for i = 0, 2 do
		local tmpCosAngle = {}
		local tmpCosAngleAbs = {}

		for j = 0, 2 do
			tmpCosAngle[j] = Vector3.Dot(box0Axis[i], box1Axis[j])
			tmpCosAngleAbs[j] = 1e-06 + Mathf.Abs(tmpCosAngle[j])
		end

		cosAngle[i] = tmpCosAngle
		cosAngleAbs[i] = tmpCosAngleAbs
	end

	for i = 0, 2 do
		projBox0 = box0.extents[i]
		projBox1 = box1.extents[0] * cosAngleAbs[i][0] + box1.extents[1] * cosAngleAbs[i][1] + box1.extents[2] * cosAngleAbs[i][2]
		projRelative = Mathf.Abs(relative[i])

		if projRelative > projBox0 + projBox1 then
			return false
		end
	end

	for j = 0, 2 do
		projBox0 = box0.extents[0] * cosAngleAbs[0][j] + box0.extents[1] * cosAngleAbs[1][j] + box0.extents[2] * cosAngleAbs[2][j]
		projBox1 = box1.extents[j]
		projRelative = Mathf.Abs(relative[0] * cosAngle[0][j] + relative[1] * cosAngle[1][j] + relative[2] * cosAngle[2][j])

		if projRelative > projBox0 + projBox1 then
			return false
		end
	end

	projBox0 = box0.extents[1] * cosAngleAbs[2][0] + box0.extents[2] * cosAngleAbs[1][0]
	projBox1 = box1.extents[1] * cosAngleAbs[0][2] + box1.extents[2] * cosAngleAbs[0][1]
	projRelative = Mathf.Abs(relative[2] * cosAngle[1][0] - relative[1] * cosAngle[2][0])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[1] * cosAngleAbs[2][1] + box0.extents[2] * cosAngleAbs[1][1]
	projBox1 = box1.extents[0] * cosAngleAbs[0][2] + box1.extents[2] * cosAngleAbs[0][0]
	projRelative = Mathf.Abs(relative[2] * cosAngle[1][1] - relative[1] * cosAngle[2][1])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[1] * cosAngleAbs[2][2] + box0.extents[2] * cosAngleAbs[1][2]
	projBox1 = box1.extents[0] * cosAngleAbs[0][1] + box1.extents[1] * cosAngleAbs[0][0]
	projRelative = Mathf.Abs(relative[2] * cosAngle[1][2] - relative[1] * cosAngle[2][2])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[0] * cosAngleAbs[2][0] + box0.extents[2] * cosAngleAbs[0][0]
	projBox1 = box1.extents[1] * cosAngleAbs[1][2] + box1.extents[2] * cosAngleAbs[1][1]
	projRelative = Mathf.Abs(relative[0] * cosAngle[2][0] - relative[2] * cosAngle[0][0])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[0] * cosAngleAbs[2][1] + box0.extents[2] * cosAngleAbs[0][1]
	projBox1 = box1.extents[0] * cosAngleAbs[1][2] + box1.extents[2] * cosAngleAbs[1][0]
	projRelative = Mathf.Abs(relative[0] * cosAngle[2][1] - relative[2] * cosAngle[0][1])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[0] * cosAngleAbs[2][2] + box0.extents[2] * cosAngleAbs[0][2]
	projBox1 = box1.extents[0] * cosAngleAbs[1][1] + box1.extents[1] * cosAngleAbs[1][0]
	projRelative = Mathf.Abs(relative[0] * cosAngle[2][2] - relative[2] * cosAngle[0][2])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[0] * cosAngleAbs[1][0] + box0.extents[1] * cosAngleAbs[0][0]
	projBox1 = box1.extents[1] * cosAngleAbs[2][2] + box1.extents[2] * cosAngleAbs[2][1]
	projRelative = Mathf.Abs(relative[1] * cosAngle[0][0] - relative[0] * cosAngle[1][0])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[0] * cosAngleAbs[1][1] + box0.extents[1] * cosAngleAbs[0][1]
	projBox1 = box1.extents[0] * cosAngleAbs[2][2] + box1.extents[2] * cosAngleAbs[2][0]
	projRelative = Mathf.Abs(relative[1] * cosAngle[0][1] - relative[0] * cosAngle[1][1])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	projBox0 = box0.extents[0] * cosAngleAbs[1][2] + box0.extents[1] * cosAngleAbs[0][2]
	projBox1 = box1.extents[0] * cosAngleAbs[2][1] + box1.extents[1] * cosAngleAbs[2][0]
	projRelative = Mathf.Abs(relative[1] * cosAngle[0][2] - relative[0] * cosAngle[1][2])

	if projRelative > projBox0 + projBox1 then
		return false
	end

	return true
end

function GameCollider.isCubeAndCylinderCollider(xCube, xCylinder)
	return
end

function GameCollider.isRectAndCircleCross(rectCenter, wHalfDir, hHafDir, circleCenter, circleRadius)
	rectCenter.y = 0
	wHalfDir.y = 0
	hHafDir.y = 0
	circleCenter = circleCenter - rectCenter
	circleCenter.y = 0

	local angleY = MathHelper.getAngleY(wHalfDir)

	angleY = 90 - angleY

	local rot = Quaternion.Euler(0, angleY, 0)

	wHalfDir = rot * wHalfDir
	hHafDir = rot * hHafDir
	circleCenter = rot * circleCenter
	wHalfDir.x = Mathf.Abs(wHalfDir.x)
	hHafDir.z = Mathf.Abs(hHafDir.z)
	circleCenter.x = Mathf.Abs(circleCenter.x)
	circleCenter.z = Mathf.Abs(circleCenter.z)

	local rectPoint = wHalfDir + hHafDir
	local relative = circleCenter - rectPoint

	if relative.x >= 0 and relative.z >= 0 then
		-- block empty
	elseif relative.x < 0 and relative.z >= 0 then
		relative.x = 0
	elseif relative.z < 0 and relative.x >= 0 then
		relative.z = 0
	else
		return true
	end

	if relative.sqrMagnitude < circleRadius * circleRadius then
		return true
	else
		return false
	end

	return false
end

function GameCollider.SkillCollider(attPlayer, hitPlayer, skillData, colliderIndexList)
	local blockFlg = false
	local hitHandFlg = false
	local attVPlayer = attPlayer:GetVirtualPlayer()
	local hitVPlayer = hitPlayer:GetVirtualPlayer()

	if skillData ~= nil then
		blockFlg = hitPlayer:IsBlocked(attVPlayer, attVPlayer, skillData.SkillIndex, skillData.SkillCombo)

		if blockFlg == false then
			hitHandFlg = hitPlayer:IsHitHand(attVPlayer, attVPlayer, skillData.SkillIndex, skillData.SkillCombo)
		end
	end

	if blockFlg == false and hitHandFlg == false and attPlayer ~= hitPlayer then
		hitPlayer:AddTouchHitCombo(attVPlayer, skillData)
	end

	local attackDir = attPlayer:GetSkillDirection(hitPlayer:GetPosByWorldPos())
	local attTouchData = hitPlayer:AddSkillTouchAttackPlayer(attVPlayer, skillData, nil, attackDir, colliderIndexList)

	if attTouchData ~= nil then
		if skillData ~= nil then
			local damageType = AnimalBase.GetSkillDamageType(attVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

			attTouchData:SetDamageType(damageType)
		end

		if blockFlg == true then
			local blockSkillIndex, blockSkillCombo, blockParam = hitPlayer:GetBlockSkill()
			local skillBlockData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), blockSkillIndex, blockSkillCombo)

			if skillBlockData ~= nil then
				attTouchData:SetSkillBlocked(blockFlg, skillBlockData, blockParam)
			end
		elseif hitHandFlg == true and hitPlayer:IsSkilling() == true then
			local tmpSkillIndex = 0
			local tmpSkillCombo = 0

			tmpSkillIndex, tmpSkillCombo = hitPlayer:GetSkillingData()

			if tmpSkillIndex > 0 and tmpSkillCombo > 0 then
				local tmpSkillData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), tmpSkillIndex, tmpSkillCombo)

				if tmpSkillData ~= nil then
					attTouchData:SetSkillHitHand(hitHandFlg, tmpSkillData)
				end
			end
		end

		local isBehind = GameAI.IsAnimalBehindPosition(hitPlayer, attVPlayer:GetPosition())

		attTouchData:SetAttackFromBehind(isBehind)

		if skillData ~= nil and skillData.DamageDisMin > 0 and skillData.DamageDisMax > 0 then
			attTouchData:SetAttackDistance(Vector3.Distance(attPlayer:GetPosByWorldPos(), hitPlayer:GetPosByWorldPos()))
		end

		attTouchData:SetDamageAdd(attPlayer:GetValue():GetDamageAdd())
	end

	local hitTouchData = attPlayer:AddSkillTouchHitPlayer(hitVPlayer, skillData, nil, attackDir, colliderIndexList)

	if hitTouchData ~= nil then
		if blockFlg == true then
			local blockSkillIndex, blockSkillCombo, blockParam = hitPlayer:GetBlockSkill()
			local skillBlockData = MS_SkillData.GetSkillData(hitVPlayer:GetHeroId(), blockSkillIndex, blockSkillCombo)

			if skillBlockData ~= nil then
				if blockParam > 1 then
					hitTouchData:SetHitBlock(true)
				else
					local guard = AnimalBase_Value.GetGuard(hitPlayer, skillBlockData)
					local guardBreak = AnimalBase_Value.GetGuardBreak(attVPlayer, skillData, nil)

					if guardBreak <= guard then
						hitTouchData:SetHitBlock(true)
					end
				end
			end
		elseif hitHandFlg == true and hitPlayer:IsSkilling() == true then
			local tmpSkillIndex = 0
			local tmpSkillCombo = 0

			tmpSkillIndex, tmpSkillCombo = hitPlayer:GetSkillingData()

			if tmpSkillIndex > 0 and tmpSkillCombo > 0 then
				local tmpSkillData = MS_SkillData.GetSkillData(hitVPlayer:GetHeroId(), tmpSkillIndex, tmpSkillCombo)

				if tmpSkillData ~= nil then
					local guard = AnimalBase_Value.GetGuard(hitPlayer, tmpSkillData)
					local guardBreak = AnimalBase_Value.GetGuardBreak(attVPlayer, skillData, nil)
					local diffRate = AnimalBase_Define.BlockGuardLevelHigh

					if guard > 0 then
						diffRate = (guardBreak - guard) / guard
					end

					if diffRate < 1 then
						hitTouchData:SetHitHand(true)
					end
				end
			end
		end
	end

	attackDir = nil
end

function GameCollider.SkillColliderFar(fromVPlayer, originVPlayer, hitPlayer, skillData, itemData, flyDir, flyDis, colliderIndexList)
	local blockFlg = false
	local hitHandFlg = false

	if skillData ~= nil then
		blockFlg = hitPlayer:IsBlocked(fromVPlayer, originVPlayer, skillData.SkillIndex, skillData.SkillCombo)

		if blockFlg == false then
			hitHandFlg = hitPlayer:IsHitHand(fromVPlayer, originVPlayer, skillData.SkillIndex, skillData.SkillCombo)
		end
	end

	if blockFlg == false and hitHandFlg == false and itemData == nil then
		hitPlayer:AddTouchHitCombo(fromVPlayer, skillData)
	end

	local attTouchData = hitPlayer:AddSkillTouchAttackPlayer(originVPlayer, skillData, itemData, flyDir, colliderIndexList)

	if attTouchData ~= nil then
		if skillData ~= nil then
			local damageType = AnimalBase.GetSkillDamageType(originVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

			attTouchData:SetDamageType(damageType)
		end

		if blockFlg == true then
			local blockSkillIndex, blockSkillCombo, blockParam = hitPlayer:GetBlockSkill()
			local skillBlockData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), blockSkillIndex, blockSkillCombo)

			if skillBlockData ~= nil then
				attTouchData:SetSkillBlocked(blockFlg, skillBlockData, blockParam)
			end
		elseif hitHandFlg == true and hitPlayer:IsSkilling() == true then
			local tmpSkillIndex = 0
			local tmpSkillCombo = 0

			tmpSkillIndex, tmpSkillCombo = hitPlayer:GetSkillingData()

			if tmpSkillIndex > 0 and tmpSkillCombo > 0 then
				local tmpSkillData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), tmpSkillIndex, tmpSkillCombo)

				if tmpSkillData ~= nil then
					attTouchData:SetSkillHitHand(hitHandFlg, tmpSkillData)
				end
			end
		end

		local isBehind = GameAI.IsAnimalBehindPosition(hitPlayer, fromVPlayer:GetPosition())

		attTouchData:SetAttackFromBehind(isBehind)
		attTouchData:SetAttackDistance(flyDis)
		attTouchData:SetFromBullet(true)
		attTouchData:SetBulletDirection(flyDir)

		if skillData ~= nil then
			attTouchData:AddBulletHitEffect(skillData.BulletHitEffect, skillData.BulletHitCritEffect, skillData.BulletHitEffectRoot, skillData.BulletHitEfffectBind)
			attTouchData:AddBulletHitAudio(skillData.BulletHitAudio, skillData.BulletHitCritAudio)
		end

		if itemData ~= nil then
			attTouchData:AddBulletHitEffect(itemData.BulletHitEffect, itemData.BulletHitCritEffect, itemData.BulletHitEffectRoot, itemData.BulletHitEfffectBind)
			attTouchData:AddBulletHitAudio(itemData.BulletHitAudio, itemData.BulletHitCritAudio)
		end
	end

	return blockFlg
end

function GameCollider.SkillColliderTrick(hitPlayer, trick, trickDir, colliderIndexList)
	local attTouchData = hitPlayer:AddTrickTouch(trick, trickDir, colliderIndexList)

	if attTouchData ~= nil then
		attTouchData:SetDamageType(trick:GetDamageType())

		local hitHandFlg = hitPlayer:IsHitHandTrick(trick)

		if hitHandFlg == true and hitPlayer:IsSkilling() == true then
			local tmpSkillIndex = 0
			local tmpSkillCombo = 0

			tmpSkillIndex, tmpSkillCombo = hitPlayer:GetSkillingData()

			if tmpSkillIndex > 0 and tmpSkillCombo > 0 then
				local tmpSkillData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), tmpSkillIndex, tmpSkillCombo)

				if tmpSkillData ~= nil then
					attTouchData:SetSkillHitHand(hitHandFlg, tmpSkillData)
				end
			end
		end

		local dot = Vector3.Dot(hitPlayer:GetForward(), trickDir)

		if dot < 0 then
			attTouchData:SetAttackFromBehind(true)
		else
			attTouchData:SetAttackFromBehind(false)
		end

		attTouchData:SetHitType(trick:GetHitType())
	end

	return false
end

function GameCollider.SkillColliderExplode(fromVPlayer, originVPlayer, hitPlayer, skillData, itemData, position, hitType, colliderIndexList)
	local blockFlg = false
	local hitHandFlg = false

	if skillData ~= nil then
		blockFlg = hitPlayer:IsBlocked(fromVPlayer, originVPlayer, skillData.SkillIndex, skillData.SkillCombo)

		if blockFlg == false then
			hitHandFlg = hitPlayer:IsHitHand(fromVPlayer, originVPlayer, skillData.SkillIndex, skillData.SkillCombo)
		end
	end

	if blockFlg == false and hitHandFlg == false and itemData == nil then
		hitPlayer:AddTouchHitCombo(fromVPlayer, skillData)
	end

	local nowPos = hitPlayer:GetPosByWorldPos()
	local tmpDir = nowPos - position

	tmpDir.y = 0

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		tmpDir:SetNormalize()
	else
		tmpDir:SetVector3(hitPlayer:GetBack())
	end

	local attTouchData = hitPlayer:AddSkillTouchAttackPlayer(originVPlayer, skillData, itemData, tmpDir, colliderIndexList)

	if attTouchData ~= nil then
		if skillData ~= nil then
			local damageType = AnimalBase.GetSkillDamageType(originVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

			attTouchData:SetDamageType(damageType)

			if skillData.DamageDisMin > 0 and skillData.DamageDisMax > 0 then
				attTouchData:SetAttackDistance(Vector3.Distance(nowPos, position))
			end
		end

		if blockFlg == true then
			local blockSkillIndex, blockSkillCombo, blockParam = hitPlayer:GetBlockSkill()
			local skillBlockData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), blockSkillIndex, blockSkillCombo)

			if skillBlockData ~= nil then
				attTouchData:SetSkillBlocked(blockFlg, skillBlockData, blockParam)
			end
		elseif hitHandFlg == true and hitPlayer:IsSkilling() == true then
			local tmpSkillIndex = 0
			local tmpSkillCombo = 0

			tmpSkillIndex, tmpSkillCombo = hitPlayer:GetSkillingData()

			if tmpSkillIndex > 0 and tmpSkillCombo > 0 then
				local tmpSkillData = MS_SkillData.GetSkillData(hitPlayer:GetHeroId(), tmpSkillIndex, tmpSkillCombo)

				if tmpSkillData ~= nil then
					attTouchData:SetSkillHitHand(hitHandFlg, tmpSkillData)
				end
			end
		end

		local isBehind = GameAI.IsAnimalBehindPosition(hitPlayer, position)

		attTouchData:SetAttackFromBehind(isBehind)
		attTouchData:SetHitType(hitType)
	end

	tmpDir = nil

	return blockFlg
end

function GameCollider.SkillColliderShell(attPlayer, hitShell, skillData)
	local hitHandFlg = false
	local attVPlayer = attPlayer:GetVirtualPlayer()
	local hitShellId = hitShell:GetShellId()
	local attackDir = attPlayer:GetSkillDirection(hitShell:GetPosByWorldPos())
	local attTouchData = hitShell:AddSkillTouchAttackPlayer(attVPlayer, skillData, nil, attackDir)
	local guard = hitShell:GetGuard()
	local guardBreak = AnimalBase_Value.GetGuardBreak(attVPlayer, skillData, nil)

	if guardBreak < guard then
		hitHandFlg = true
	end

	if attTouchData ~= nil then
		if skillData ~= nil then
			local damageType = AnimalBase.GetSkillDamageType(attVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

			attTouchData:SetDamageType(damageType)
		end

		attTouchData:SetSkillHitHand(hitHandFlg)

		if skillData ~= nil and skillData.DamageDisMin > 0 and skillData.DamageDisMax > 0 then
			attTouchData:SetAttackDistance(Vector3.Distance(attPlayer:GetPosByWorldPos(), hitShell:GetPosByWorldPos()))
		end

		attTouchData:SetDamageAdd(attPlayer:GetValue():GetDamageAdd())
	end

	local hitTouchData = attPlayer:AddSkillTouchHitShell(hitShell, skillData, nil, attackDir)

	if hitTouchData ~= nil then
		hitTouchData:SetHitHand(hitHandFlg)
	end

	attackDir = nil
end

function GameCollider.SkillColliderShellFar(fromVPlayer, originVPlayer, hitShell, skillData, itemData, flyDir, flyDis)
	local hitHandFlg = false
	local attTouchData = hitShell:AddSkillTouchAttackPlayer(originVPlayer, skillData, itemData, flyDir)
	local guard = hitShell:GetGuard()
	local guardBreak = AnimalBase_Value.GetGuardBreak(originVPlayer, skillData, nil)

	if guardBreak < guard then
		hitHandFlg = true
	end

	if attTouchData ~= nil then
		if skillData ~= nil then
			local damageType = AnimalBase.GetSkillDamageType(originVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

			attTouchData:SetDamageType(damageType)
		end

		attTouchData:SetSkillHitHand(hitHandFlg)
		attTouchData:SetAttackDistance(flyDis)
		attTouchData:SetFromBullet(true)
		attTouchData:SetBulletDirection(flyDir)
	end

	return false
end

function GameCollider.SkillColliderShellTrick(hitShell, trick, trickDir)
	local attTouchData = hitShell:AddTrickTouch(trick, trickDir, colliderIndexList)

	if attTouchData ~= nil then
		attTouchData:SetDamageType(trick:GetDamageType())
	end

	return false
end

function GameCollider.SkillColliderShellExplode(fromVPlayer, originVPlayer, hitShell, skillData, itemData, position)
	local hitHandFlg = false
	local nowPos = hitShell:GetPosByWorldPos()
	local tmpDir = nowPos - position

	tmpDir.y = 0

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		tmpDir:SetNormalize()
	else
		tmpDir:SetVector3(Vector3.s_forward)
	end

	local guard = hitShell:GetGuard()
	local guardBreak = AnimalBase_Value.GetGuardBreak(originVPlayer, skillData, nil)

	if guardBreak < guard then
		hitHandFlg = true
	end

	local attTouchData = hitShell:AddSkillTouchAttackPlayer(originVPlayer, skillData, itemData, tmpDir)

	if attTouchData ~= nil then
		if skillData ~= nil then
			local damageType = AnimalBase.GetSkillDamageType(originVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

			attTouchData:SetDamageType(damageType)

			if skillData.DamageDisMin > 0 and skillData.DamageDisMax > 0 then
				attTouchData:SetAttackDistance(Vector3.Distance(nowPos, position))
			end
		end

		attTouchData:SetSkillHitHand(hitHandFlg)
	end

	SystemHelper.LogTest("=======SkillColliderShellExplode==========hitShellIdList!!!==")

	tmpDir = nil

	return false
end
