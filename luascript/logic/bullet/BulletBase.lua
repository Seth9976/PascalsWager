-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletBase.lua

require("LuaScript/Logic/Bullet/BulletHitAnimal")
require("LuaScript/Logic/Bullet/BulletHitShell")

BulletBase = class("BulletBase")
BulletBase.static.BulletLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "WallOpaque", "WallInvisible", "Ground")
BulletBase.static.BulletSkillBoxLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "AnimalSkill", "WallOpaque", "WallInvisible", "Ground")
BulletBase.static.BulletSkillBoxOnlyLayerMask = LayerMask.GetMask("AnimalSkill")
BulletBase.static.BulletNoWallLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "Ground")
BulletBase.static.BulletNoGroundLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "WallOpaque", "WallInvisible")
BulletBase.static.BulletNoWallSkillBoxLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "AnimalSkill", "Ground")
BulletBase.static.BulletNoGroundSkillBoxLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "AnimalSkill", "WallOpaque", "WallInvisible")
BulletBase.static.BulletAnimalLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell")
BulletBase.static.BulletSkillBoxAnimalLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "AnimalSkill")
BulletBase.static.BulletBlockLayerMask = LayerMask.GetMask("WallOpaque", "WallInvisible", "Ground")
BulletBase.static.BulletBlockNoWallLayerMask = LayerMask.GetMask("Ground")
BulletBase.static.BulletBlockNoGroundLayerMask = LayerMask.GetMask("WallOpaque", "WallInvisible")
BulletBase.static.BulletRnageMax = 80
BulletBase.static.BulletReboundRnage = 30
BulletBase.static.BulletColliderExtendMin = 0.01
BulletBase.static.BulletExplodeInterceptTime = 0.1
BulletBase.static.RotationType = {
	EndToStart = 3,
	EndToFly = 4,
	ByFly = 5,
	StartToEndForward = 6,
	StartToEnd = 1,
	StartToFly = 2,
	None = 0
}
BulletBase.static.ThrowObstacle = {
	Wall = 1,
	Ground = 2,
	All = 3,
	None = 0
}

function BulletBase:initialize(tf, animal, skillData, itemData)
	self.exitFlg = false
	self.clearReady = false
	self.tfSelf = tf
	self.fromVPlayer = VirtualPlayer:new(animal)
	self.originVPlayer = VirtualPlayer:new(animal)
	self.fromHeroId = self.fromVPlayer:GetHeroId()
	self.skillTargetAnimal = nil
	self.skillData = skillData
	self.itemData = itemData
	self.sceneController = ST_Main.GetSceneController()
	self.scene = self.sceneController:GetScene()
	self.controllerCollider = self.sceneController:GetControllerCollider()
	self.controllerShell = self.sceneController:GetControllerShell()
	self.colliderMoveEnable = false
	self.colliderMoveWithAnimal = false
	self.colliderInterceptEnable = false
	self.colliderMoveCube = nil
	self.colliderMoveRotation = Quaternion.identity
	self.colliderMoveRadius = 1
	self.colliderBombRadius = 0
	self.colliderBombHit = false
	self.flyPositionOld = Vector3.zero
	self.flyPosition = Vector3.zero
	self.flyDirection = Vector3.forward
	self.flyRotationType = BulletBase.RotationType.None
	self.flyRotation = Quaternion.identity
	self.effectBullet = nil
	self.trapId = 0
	self.blockAudio = ""
	self.destroyAudio = ""
	self.effectBlock = nil
	self.effectBlockName = ""
	self.effectBlockRoot = 0
	self.effectBlockGround = nil
	self.effectBlockGroundName = ""
	self.effectBlockWall = nil
	self.effectBlockWallName = ""
	self.effectDestroy = nil
	self.effectDestroyName = ""
	self.effectDestroyRoot = 0
	self.startPosition = Vector3.zero
	self.endPosition = Vector3.zero
	self.moveVec3 = Vector3.zero
	self.speedVec3 = Vector3.zero
	self.accelerateVec3 = Vector3.zero
	self.speedY = 0
	self.accY = 0
	self.moveY = 0
	self.flyHeightMin = 0
	self.flyHeightMax = 0
	self.speedAngle = 0
	self.startFlg = false
	self.startMoveCollider = false
	self.startMoveColliderBlockLM = BulletBase.BulletBlockLayerMask
	self.startTime = 0
	self.lifeTime = 0
	self.explodeFlg = false
	self.deadFlg = false
	self.parryEnable = false
	self.rebound = false
	self.throughBody = false
	self.throughObstacle = BulletBase.ThrowObstacle.None
	self.intercepted = false
	self.interceptPosition = Vector3.zero
	self.interceptDistance = 0
	self.interceptLayer = 0
	self.hitAnimalList = nil
	self.hitAnimalTime = nil
	self.hitShellList = nil
	self.hitShellTime = nil
	self.rayHitAnimalList = nil
	self.rayHitShellList = nil

	if self.skillData ~= nil then
		self:SetColliderMoveRadius(self.skillData.ColliderRadius)
		self:SetColliderBombRadius(self.skillData.ColliderBombRadius)
	end

	if self.itemData ~= nil then
		self:SetColliderMoveRadius(self.itemData.ColliderRadius)
		self:SetColliderBombRadius(self.itemData.ColliderBombRadius)

		self.colliderBombHit = true
		self.trapId = self.itemData.TrapId
	end
end

function BulletBase:Exit()
	if self.exitFlg == true then
		return
	end

	self.exitFlg = true
	self.controllerCollider = nil
	self.colliderMoveRotation = nil
	self.flyPositionOld = nil
	self.flyPosition = nil
	self.flyDirection = nil
	self.startPosition = nil
	self.endPosition = nil
	self.moveVec3 = nil
	self.speedVec3 = nil
	self.accelerateVec3 = nil
	self.interceptPosition = nil
	self.effectBlock = nil
	self.effectBlockGround = nil
	self.effectBlockWall = nil
	self.effectDestroy = nil
	self.blockAudio = ""
	self.destroyAudio = ""

	if self.tfSelf ~= nil then
		GoDestroy(self.tfSelf.gameObject)
	end

	self.tfSelf = nil

	if self.fromVPlayer ~= nil then
		self.fromVPlayer:Exit()
	end

	self.fromVPlayer = nil

	if self.originVPlayer ~= nil then
		self.originVPlayer:Exit()
	end

	self.originVPlayer = nil
	self.skillTargetAnimal = nil
	self.hitAnimalList = nil
	self.hitAnimalTime = nil
	self.hitShellList = nil
	self.hitShellTime = nil

	if self.rayHitAnimalList ~= nil then
		for i = 1, #self.rayHitAnimalList do
			local hitData = self.rayHitAnimalList[i]

			if hitData ~= nil then
				hitData:Clear()
			end
		end
	end

	self.rayHitAnimalList = nil

	if self.rayHitShellList ~= nil then
		for i = 1, #self.rayHitShellList do
			local hitData = self.rayHitShellList[i]

			if hitData ~= nil then
				hitData:Clear()
			end
		end
	end

	self.rayHitShellList = nil
	self.skillData = nil
	self.itemData = nil

	if self.colliderMoveCube ~= nil then
		self.colliderMoveCube:Exit()
	end

	self.colliderMoveCube = nil

	if self.effectBullet ~= nil then
		self.effectBullet:Clear()
	end

	self.effectBullet = nil
end

function BulletBase:SetRotation(xAngle, yAngle, zAngle)
	if self.tfSelf ~= nil then
		self.tfSelf:Rotate(xAngle, yAngle, zAngle)
	end
end

function BulletBase:GetFromVirtualPlayer()
	return self.fromVPlayer
end

function BulletBase:GetOriginVirtualPlayer()
	return self.originVPlayer
end

function BulletBase:GetSkillData()
	return self.skillData
end

function BulletBase:GetItemData()
	return self.itemData
end

function BulletBase:AddHitAnimal(animal)
	if animal ~= nil then
		local id = animal:GetAnimalId()

		if self.hitAnimalList == nil then
			self.hitAnimalList = {}
		end

		if self.hitAnimalList[id] == nil then
			self.hitAnimalList[id] = animal

			if animal ~= nil then
				if self.hitAnimalTime == nil then
					self.hitAnimalTime = {}
				end

				self.hitAnimalTime[id] = TimeHelper.getNowTime()
			end
		end
	end
end

function BulletBase:GetHitAnimalList()
	return self.hitAnimalList
end

function BulletBase:ResetHitAnimal()
	self.hitAnimalList = nil
	self.hitAnimalTime = nil
end

function BulletBase:ClearHitAnimal(id)
	if self.hitAnimalList ~= nil then
		self.hitAnimalList[id] = nil
	end

	if self.hitAnimalTime ~= nil then
		self.hitAnimalTime[id] = nil
	end
end

function BulletBase:IsHaveHitAnimal(animal)
	if animal == nil then
		return false
	end

	local id = animal:GetAnimalId()

	if self.hitAnimalList ~= nil and self.hitAnimalList[id] == animal then
		return true
	end

	return false
end

function BulletBase:AddHitShell(shell)
	if shell ~= nil then
		local id = shell:GetShellId()

		if self.hitShellList == nil then
			self.hitShellList = {}
		end

		if self.hitShellList[id] == nil then
			self.hitShellList[id] = shell

			if shell ~= nil then
				if self.hitShellTime == nil then
					self.hitShellTime = {}
				end

				self.hitShellTime[id] = TimeHelper.getNowTime()
			end
		end
	end
end

function BulletBase:GetHitShellList()
	return self.hitShellList
end

function BulletBase:ResetHitShell()
	self.hitShellList = nil
	self.hitShellTime = nil
end

function BulletBase:ClearHitShell(id)
	if self.hitShellList ~= nil then
		self.hitShellList[id] = nil
	end

	if self.hitShellTime ~= nil then
		self.hitShellTime[id] = nil
	end
end

function BulletBase:IsHaveHitShell(shell)
	if shell == nil then
		return false
	end

	local id = shell:GetShellId()

	if self.hitShellList ~= nil and self.hitShellList[id] == shell then
		return true
	end

	return false
end

function BulletBase:SetThroughBody(flg)
	self.throughBody = flg
end

function BulletBase:IsThroughBody()
	return self.throughBody
end

function BulletBase:SetThroughObstacle(type)
	self.throughObstacle = type
	self.startMoveColliderBlockLM = nil

	if self.throughObstacle == BulletBase.ThrowObstacle.Wall then
		self.startMoveColliderBlockLM = BulletBase.BulletBlockNoWallLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.Ground then
		self.startMoveColliderBlockLM = BulletBase.BulletBlockNoGroundLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.None then
		self.startMoveColliderBlockLM = BulletBase.BulletBlockLayerMask
	end
end

function BulletBase:GetThroughObstacleType()
	return self.throughObstacle
end

function BulletBase:SetRotationType(type)
	self.flyRotationType = type
end

function BulletBase:AddEffect(effName)
	if effName ~= "" and self.effectBullet == nil then
		self.effectBullet = VfxManager.PlayBindMulti(self.tfSelf, effName)
	end
end

function BulletBase:AddBlockEffect(effBlockName, effRoot, effBlockGroundName, effBlockWallName)
	self.effectBlockName = effBlockName
	self.effectBlockRoot = tonumber(effRoot)
	self.effectBlockGroundName = effBlockGroundName
	self.effectBlockWallName = effBlockWallName
end

function BulletBase:AddDestroyEffect(effBlockName, effRoot)
	self.effectDestroyName = effBlockName
	self.effectDestroyRoot = tonumber(effRoot)
end

function BulletBase:AddDestroyAudio(destroyAudio)
	self.destroyAudio = destroyAudio
end

function BulletBase:AddBlockAudio(blockAudio)
	self.blockAudio = blockAudio
end

function BulletBase:AddTrap(trapId)
	self.trapId = trapId
end

function BulletBase:SetBulletParryEnable(flg)
	self.parryEnable = flg
end

function BulletBase:IsBulletParryEnable()
	return self.parryEnable
end

function BulletBase:SetColliderMoveEnable(flg)
	self.colliderMoveEnable = flg
end

function BulletBase:IsColliderMoveEnable()
	return self.colliderMoveEnable
end

function BulletBase:SetColliderMoveWithAnimal(flg)
	self.colliderMoveWithAnimal = flg
end

function BulletBase:IsColliderMoveWithAnimal()
	return self.colliderMoveWithAnimal
end

function BulletBase:SetColliderMoveRotation(rot)
	if self.colliderMoveCube ~= nil then
		self.colliderMoveRotation:SetQuaternion(rot)
	end
end

function BulletBase:SetColliderMoveRadius(radius)
	if radius < BulletBase.BulletColliderExtendMin then
		radius = BulletBase.BulletColliderExtendMin
	end

	self.colliderMoveRadius = radius

	if DebugShowAttackBox == true then
		if self.colliderMoveCube == nil then
			self.colliderMoveCube = XCube:new(XCube.Type.Virtual, XCube.ColliderType.BulletBox, XCube.ShapeType.Cube, nil)

			self.colliderMoveCube:CreateTestCube(self.tfSelf.name .. "_cube")
		end

		if self.colliderMoveCube ~= nil then
			self.colliderMoveCube:SetHalfExtents(radius, radius, radius)
		end
	end
end

function BulletBase:SetColliderBombRadius(radius)
	self.colliderBombRadius = radius
end

function BulletBase:GetStartPosition()
	return self.startPosition
end

function BulletBase:SetStartPosition(pos)
	if pos == nil then
		SystemHelper.LogError("====BulletBase SetStartPosition error")

		return
	end

	self.startPosition:SetVector3(pos)
end

function BulletBase:SetEndPosition(pos)
	if pos == nil then
		SystemHelper.LogError("====BulletBase SetEndPosition error")

		return
	end

	self.endPosition:SetVector3(pos)
	self:UpdateDirection(true)
end

function BulletBase:SetSpeed(sp, acc)
	self.speedVec3:SetVector3(sp)
	self.accelerateVec3:SetVector3(acc)
	self.moveVec3:SetVector3(self.speedVec3)
end

function BulletBase:SetSpeedY(sp, acc, heightL, heightH)
	self.speedY = sp
	self.accY = acc
	self.moveY = self.speedY
	self.flyHeightMin = heightL
	self.flyHeightMax = heightH
end

function BulletBase:SetSpeedAngle(angle)
	self.speedAngle = angle
end

function BulletBase:GetPosition()
	return self.flyPosition
end

function BulletBase:SetPosition(pos, isStart)
	if isStart == false then
		self.flyPositionOld:SetVector3(self.flyPosition)
	end

	self.flyPosition:SetVector3(pos)

	local tmpDis = Vector3.DistanceSquare(self.flyPosition, self.flyPositionOld)

	if MathHelper.IsZero(tmpDis) == false then
		self.flyDirection:SetVector3(self.flyPosition)
		self.flyDirection:Sub(self.flyPositionOld)
		self.flyDirection:SetNormalize()
	end

	if self.tfSelf ~= nil then
		self.tfSelf.position = self.flyPosition
	end

	self:UpdateDirection(isStart)
end

function BulletBase:UpdateDirection(force)
	local tmpDir

	if self.flyRotationType == BulletBase.RotationType.StartToEnd then
		if force == true then
			tmpDir = self.endPosition - self.startPosition
		end
	elseif self.flyRotationType == BulletBase.RotationType.EndToStart then
		if force == true then
			tmpDir = self.startPosition - self.endPosition
		end
	elseif self.flyRotationType == BulletBase.RotationType.StartToFly then
		tmpDir = self.flyPosition - self.startPosition
	elseif self.flyRotationType == BulletBase.RotationType.EndToFly then
		tmpDir = self.flyPosition - self.endPosition
	elseif self.flyRotationType == BulletBase.RotationType.ByFly then
		local rot = Quaternion.LookRotation(self.flyDirection)

		self.tfSelf.rotation = rot
		rot = nil
	elseif self.flyRotationType == BulletBase.RotationType.StartToEndForward and force == true then
		tmpDir = self.endPosition - self.startPosition
		tmpDir.y = 0
	end

	if tmpDir ~= nil then
		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			local tmpRot = Quaternion.LookRotation(tmpDir)

			self.tfSelf.rotation = tmpRot
			tmpRot = nil
		end

		tmpDir = nil
	end
end

function BulletBase:GetFlyDirection()
	return self.flyDirection
end

function BulletBase:Ready()
	if self.skillData ~= nil then
		self:AddEffect(self.skillData.SkillEffectBullet)
		self:AddBlockEffect(self.skillData.BulletBlockEffect, self.skillData.BulletBlockEffectRoot, self.skillData.BulletBlockGroundEffect, self.skillData.BulletBlockWallEffect)
		self:AddDestroyEffect(self.skillData.BulletDestroyEffect)
		self:AddBlockAudio(self.skillData.BulletBlockAudio)
		self:AddDestroyAudio(self.skillData.BulletDestroyAudio)
	end

	if self.itemData ~= nil then
		self:AddEffect(self.itemData.BulletEffect)
		self:AddBlockEffect(self.itemData.BulletBlockEffect, self.itemData.BulletBlockEffectRoot, self.itemData.BulletBlockGroundEffect, self.itemData.BulletBlockWallEffect)
		self:AddDestroyEffect(self.itemData.BulletDestroyEffect)
		self:AddBlockAudio(self.itemData.BulletBlockAudio)
		self:AddDestroyAudio(self.itemData.BulletDestroyAudio)
	end

	self.flyPosition:SetVector3(self.startPosition)
	self.flyPositionOld:SetVector3(self.startPosition)
	self.flyDirection:SetVector3(self.endPosition)
	self.flyDirection:Sub(self.flyPositionOld)
	self.flyDirection:SetNormalize()
	self:SetPosition(self.startPosition, true)
	self:SetColliderMoveEnable(true)
	self:SetColliderMoveWithAnimal(true)
end

function BulletBase:Start()
	self.startFlg = true
	self.startTime = TimeHelper.getNowTime()
	self.startMoveCollider = false
end

function BulletBase:SetSkillTargetAnimal(animal)
	if animal ~= nil and animal:IsDead() == false and animal:IsShow() == true then
		self.skillTargetAnimal = animal

		if DebugLog == true then
			SystemHelper.LogTest("========SetSkillTargetAnimal===111====heroId=" .. self.fromVPlayer:GetHeroId() .. ",monsterId=" .. self.fromVPlayer:GetStoryMonsterId())
			SystemHelper.LogTest("========SetSkillTargetAnimal===222===heroId=" .. animal:GetHeroId() .. ",monsterId=" .. animal:GetStoryMonsterId())
		end
	else
		self.skillTargetAnimal = nil
	end
end

function BulletBase:HandleTargetExit(animal)
	if self.skillTargetAnimal ~= nil and self.skillTargetAnimal == animal then
		self.skillTargetAnimal = nil

		if DebugLog == true then
			SystemHelper.LogTest("========HandleTargetExit===111====heroId=" .. self.fromVPlayer:GetHeroId() .. ",monsterId=" .. self.fromVPlayer:GetStoryMonsterId())
			SystemHelper.LogTest("========HandleTargetExit===222====heroId=" .. animal:GetHeroId() .. ",monsterId=" .. animal:GetStoryMonsterId())
		end
	end
end

function BulletBase:SetParryTarget(hitAnimal, posX, posY, posZ)
	local attackAnimal = self.sceneController:FindPlayerById(self.fromVPlayer:GetAnimalId())
	local reboundPos = Vector3.New(posX, posY, posZ)
	local targetPos = GameAI.GetParryReboundTargetByStraightLine(attackAnimal, self.startPosition, reboundPos, BulletBase.BulletReboundRnage)

	self:SetStartPosition(reboundPos)
	self:SetEndPosition(targetPos)
	self.flyPosition:SetVector3(self.startPosition)
	self.flyPositionOld:SetVector3(self.startPosition)
	self.flyDirection:SetVector3(self.endPosition)
	self.flyDirection:Sub(self.flyPositionOld)
	self.flyDirection:SetNormalize()
	self:SetSkillTargetAnimal(attackAnimal)
end

function BulletBase:ParryRebound(hitAnimal, posX, posY, posZ)
	self:SetParryTarget(hitAnimal, posX, posY, posZ)

	if self.fromVPlayer ~= nil then
		self.fromVPlayer:Exit()
	end

	self.fromVPlayer = nil
	self.fromVPlayer = VirtualPlayer:new(hitAnimal)

	hitAnimal:OnSkillParryBullet(self)

	if self.effectBullet ~= nil then
		self.effectBullet:Clear()
	end

	self.effectBullet = nil

	if self.skillData ~= nil then
		self:AddEffect(self.skillData.SkillEffectBullet)
	end

	if self.itemData ~= nil then
		self:AddEffect(self.itemData.BulletEffect)
	end

	self.intercepted = false

	self.interceptPosition:Set(0, 0, 0)

	self.interceptDistance = 0
	self.interceptLayer = 0
	self.startTime = TimeHelper.getNowTime()
	self.rebound = true
end

function BulletBase:IsReadying()
	if self.startFlg == false and self.exitFlg == false and self.deadFlg == false then
		return true
	end
end

function BulletBase:IsRunning()
	if self.startFlg == true and self.exitFlg == false and self.deadFlg == false then
		return true
	end

	return false
end

function BulletBase:IsExit()
	return self.exitFlg
end

function BulletBase:SetLifeTime(time)
	self.lifeTime = time
end

function BulletBase:Update()
	if self:IsRunning() == false then
		return
	end
end

function BulletBase:LateUpdate()
	if self:IsRunning() == false then
		return
	end
end

function BulletBase:UpdateCollider()
	if self:IsRunning() == false then
		return
	end

	if self.rayHitAnimalList ~= nil then
		for i = 1, #self.rayHitAnimalList do
			local hitData = self.rayHitAnimalList[i]

			if hitData ~= nil then
				hitData:Disable()
			end
		end
	end

	if self.rayHitShellList ~= nil then
		for i = 1, #self.rayHitShellList do
			local hitData = self.rayHitShellList[i]

			if hitData ~= nil then
				hitData:Disable()
			end
		end
	end

	if self.colliderMoveCube ~= nil then
		self.colliderMoveCube:SetPostionAndRotation(self.flyPosition, self.colliderMoveRotation)
	end

	if self.startMoveCollider == false then
		self:CheckStartMoveCollider(self.flyPosition)

		self.startMoveCollider = true
	end

	local ret = self:CheckOverlapParryCollider()

	if ret == false then
		self:CheckIntervalSpace()
	end
end

function BulletBase:Explode(isIntercepted, isBlock, targetAnimal, targetShell, hitPosition, colliderIndexList)
	if isIntercepted == true then
		if self.explodeFlg == false then
			self.explodeFlg = true

			if self.controllerCollider ~= nil and self.colliderBombRadius > 0 then
				local colliderIndex = self.controllerCollider:CreateCollider(ControllerCollider.ColliderType.Sphere, self.fromVPlayer, self.originVPlayer, self.skillData, self.itemData, self.interceptPosition, BulletBase.BulletExplodeInterceptTime, self.colliderBombRadius, self.colliderBombRadius, self.colliderBombRadius)

				self:SetDead(true)
			else
				self:ExplodeIntercepted(self.interceptPosition, self.interceptLayer)
			end

			if self.trapId > 0 and self.interceptLayer == LayerGround then
				self.scene:AddTrap(self.trapId, self.interceptPosition, self.fromVPlayer, self.fromVPlayer:GetTeamId())
			end
		end
	elseif targetAnimal ~= nil or targetShell ~= nil then
		if self.controllerCollider ~= nil and self.colliderBombRadius > 0 and self.colliderBombHit == true then
			local colliderIndex = self.controllerCollider:CreateCollider(ControllerCollider.ColliderType.Sphere, self.fromVPlayer, self.originVPlayer, self.skillData, self.itemData, hitPosition, BulletBase.BulletExplodeInterceptTime, self.colliderBombRadius, self.colliderBombRadius, self.colliderBombRadius)

			self:SetDead(true)
		else
			if isBlock == true then
				self:ExplodeBlock(hitPosition)
			end

			if targetShell ~= nil then
				self:AddHitShell(targetShell)
			elseif targetAnimal ~= nil then
				self:AddHitAnimal(targetAnimal)
			end

			if self:IsThroughBody() == false then
				self:SetDead(true)
			end
		end
	end
end

function BulletBase:ExplodeBlock(pos)
	if self.effectBlockName ~= "" and self.effectBlock == nil then
		local tmpDir = pos - self.startPosition
		local rot = Vector3.s_forward

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			rot = Quaternion.LookRotation(pos - self.startPosition)
		end

		self.effectBlock = VfxManager.PlayBindVirtualPositionMulti(self.effectBlockName, pos, rot, Vector3.s_one)
	end

	if self.blockAudio ~= "" then
		AudioCtrl.SetHeroAudio(self.blockAudio, self.tfSelf, self.originVPlayer:GetAnimalId())
	end
end

function BulletBase:ExplodeIntercepted(pos, layer)
	if layer == LayerGround and self.effectBlockGroundName ~= "" and self.effectBlockGround == nil then
		local tmpDir = pos - self.startPosition

		tmpDir.y = 0

		local rot = Vector3.s_forward

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			rot = Quaternion.LookRotation(tmpDir)
		end

		self.effectBlockGround = VfxManager.PlayBindVirtualPositionMulti(self.effectBlockGroundName, pos, rot, Vector3.s_one)
		tmpDir = nil
	elseif (layer == LayerWallOpaque or layer == LayerWallInvisible) and self.effectBlockWallName ~= "" and self.effectBlockWall == nil then
		local tmpDir = pos - self.startPosition
		local rot = Vector3.s_forward

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			rot = Quaternion.LookRotation(pos - self.startPosition)
		end

		self.effectBlockWall = VfxManager.PlayBindVirtualPositionMulti(self.effectBlockWallName, pos, rot, Vector3.s_one)
	end

	if self.blockAudio ~= "" then
		AudioCtrl.SetHeroAudio(self.blockAudio, self.tfSelf, self.originVPlayer:GetAnimalId())
	end
end

function BulletBase:ExplodeDestroy(pos)
	if self.effectDestroyName ~= "" and self.effectDestroy == nil then
		local tmpDir = pos - self.startPosition
		local rot = Vector3.s_forward

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			rot = Quaternion.LookRotation(pos - self.startPosition)
		end

		self.effectDestroy = VfxManager.PlayBindVirtualPositionMulti(self.effectDestroyName, pos, rot, Vector3.s_one)
	end

	if self.destroyAudio ~= "" then
		AudioCtrl.SetHeroAudio(self.destroyAudio, self.tfSelf, self.originVPlayer:GetAnimalId())
	end
end

function BulletBase:Intercept(pos, dis, layer)
	self.intercepted = true

	self.interceptPosition:SetVector3(pos)

	self.interceptDistance = dis
	self.interceptLayer = layer
end

function BulletBase:GetInterceptPosition()
	return self.interceptPosition
end

function BulletBase:GetInterceptDistance()
	return self.interceptDistance
end

function BulletBase:IsIntercepted()
	return self.intercepted
end

function BulletBase:RayHitAnimal(animal, posX, posY, posZ, hitDis, colliderIndexList)
	if self.rayHitAnimalList == nil then
		self.rayHitAnimalList = {}
	end

	local find = false

	for i = 1, #self.rayHitAnimalList do
		local hitData = self.rayHitAnimalList[i]

		if hitData ~= nil and hitData:IsEnable() == false then
			hitData:Reset(animal, posX, posY, posZ, hitDis, colliderIndexList)

			find = true

			break
		end
	end

	if find == false then
		local hitData = BulletHitAnimal:new(animal, posX, posY, posZ, hitDis, colliderIndexList)

		table.insert(self.rayHitAnimalList, hitData)
	end
end

function BulletBase:GetRayHitAnimalList()
	return self.rayHitAnimalList
end

function BulletBase:RayHitShell(shell, posX, posY, posZ, hitDis)
	if self.rayHitShellList == nil then
		self.rayHitShellList = {}
	end

	local find = false

	for i = 1, #self.rayHitShellList do
		local hitData = self.rayHitShellList[i]

		if hitData ~= nil and hitData:IsEnable() == false then
			hitData:Reset(shell, posX, posY, posZ, hitDis)

			find = true

			break
		end
	end

	if find == false then
		local hitData = BulletHitShell:new(shell, posX, posY, posZ, hitDis)

		table.insert(self.rayHitShellList, hitData)
	end
end

function BulletBase:GetRayHitShellList()
	return self.rayHitShellList
end

function BulletBase:GetLayerMask()
	local ret = BulletBase.BulletLayerMask

	if self.throughObstacle == BulletBase.ThrowObstacle.Wall then
		ret = BulletBase.BulletNoWallLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.Ground then
		ret = BulletBase.BulletNoGroundLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.All then
		ret = BulletBase.BulletAnimalLayerMask
	end

	return ret
end

function BulletBase:GetSkillBoxLayerMask()
	local ret = BulletBase.BulletSkillBoxLayerMask

	if self.throughObstacle == BulletBase.ThrowObstacle.Wall then
		ret = BulletBase.BulletNoWallSkillBoxLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.Ground then
		ret = BulletBase.BulletNoGroundSkillBoxLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.All then
		ret = BulletBase.BulletSkillBoxAnimalLayerMask
	end

	return ret
end

function BulletBase:GetBlockLayerMask()
	local ret = BulletBase.BulletBlockLayerMask

	if self.throughObstacle == BulletBase.ThrowObstacle.Wall then
		ret = BulletBase.BulletBlockNoWallLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.Ground then
		ret = BulletBase.BulletBlockNoGroundLayerMask
	elseif self.throughObstacle == BulletBase.ThrowObstacle.All then
		ret = nil
	end

	return ret
end

function BulletBase:SetStartMoveColliderBlockLM(layerMask)
	self.startMoveColliderBlockLM = layerMask
end

function BulletBase:CheckStartMoveCollider(pos)
	if self:IsColliderMoveEnable() == false then
		return
	end

	local radius = self.colliderMoveRadius

	if radius < BulletBase.BulletColliderExtendMin then
		radius = BulletBase.BulletColliderExtendMin
	end

	local tmpLayerMaskCheck = self:GetLayerMask()

	if self:IsBulletParryEnable() == true then
		tmpLayerMaskCheck = self:GetSkillBoxLayerMask()
	end

	if tmpLayerMaskCheck ~= nil then
		local ret = XPhysics.OverlapSphere(self.fromVPlayer:GetAnimalId(), 0, pos.x, pos.y, pos.z, radius, tmpLayerMaskCheck, 1)

		if ret == true then
			if self.startMoveColliderBlockLM ~= nil then
				local interceptNum = XPhysics.GetOverlapColliderNum(self.fromVPlayer:GetAnimalId(), 0, self.startMoveColliderBlockLM)

				if interceptNum > 0 then
					self:Intercept(pos, 0, 0)
				end
			end

			if self:IsColliderMoveWithAnimal() == true or self:IsBulletParryEnable() == true then
				local retNum = 0
				local retIdList, retLayerList
				local tmpLayerMaskGet = BulletBase.BulletAnimalLayerMask

				if self:IsColliderMoveWithAnimal() == true and self:IsBulletParryEnable() == true then
					tmpLayerMaskGet = BulletBase.BulletSkillBoxAnimalLayerMask
				elseif self:IsColliderMoveWithAnimal() == true then
					tmpLayerMaskGet = BulletBase.BulletAnimalLayerMask
				elseif self:IsBulletParryEnable() == true then
					tmpLayerMaskGet = BulletBase.BulletSkillBoxOnlyLayerMask
				end

				retNum, retIdList, retLayerList = XPhysics.GetOverlapColliderAnimal(self.fromVPlayer:GetAnimalId(), 0, tmpLayerMaskGet, retIdList, retLayerList)

				if retNum > 0 and retIdList ~= nil and retLayerList ~= nil then
					if self:IsThroughBody() == true then
						for k = 0, retNum - 1 do
							local tmpOwnerId = retIdList[k]

							if tmpOwnerId > 0 then
								self:HitOwner(tmpOwnerId, retLayerList[k], self.startPosition.x, self.startPosition.y, self.startPosition.z, 0, true)
							end
						end
					else
						local retRebound = false

						for k = 0, retNum - 1 do
							local tmpOwnerId = retIdList[k]

							if tmpOwnerId > 0 and retLayerList[k] == LayerAnimalSkill then
								retRebound = self:HitOwner(tmpOwnerId, retLayerList[k], self.startPosition.x, self.startPosition.y, self.startPosition.z, 0, true)

								if retRebound == true then
									break
								end
							end
						end

						if retRebound == false then
							for k = 0, retNum - 1 do
								local tmpOwnerId = retIdList[k]

								if tmpOwnerId > 0 and retLayerList[k] ~= LayerAnimalSkill then
									local retHit = self:HitOwner(tmpOwnerId, retLayerList[k], self.startPosition.x, self.startPosition.y, self.startPosition.z, 0, true)

									if retHit == true then
										break
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function BulletBase:CheckOverlapParryCollider()
	if self:IsColliderMoveEnable() == false then
		return false
	end

	if self:IsColliderMoveWithAnimal() == false then
		return false
	end

	if self:IsBulletParryEnable() == false then
		return false
	end

	local radius = self.colliderMoveRadius

	if radius < BulletBase.BulletColliderExtendMin then
		radius = BulletBase.BulletColliderExtendMin
	end

	local ret = XPhysics.OverlapSphere(self.fromVPlayer:GetAnimalId(), 0, self.flyPositionOld.x, self.flyPositionOld.y, self.flyPositionOld.z, radius, BulletBase.BulletSkillBoxOnlyLayerMask, 1)

	if ret == true then
		local retNum = 0
		local retIdList, retLayerList

		retNum, retIdList, retLayerList = XPhysics.GetOverlapColliderAnimal(self.fromVPlayer:GetAnimalId(), 0, BulletBase.BulletSkillBoxOnlyLayerMask, retIdList, retLayerList)

		if retNum > 0 and retIdList ~= nil and retLayerList ~= nil then
			for k = 0, retNum - 1 do
				local tmpOwnerId = retIdList[k]

				if tmpOwnerId > 0 then
					local retHit = self:HitOwner(tmpOwnerId, retLayerList[k], self.flyPositionOld.x, self.flyPositionOld.y, self.flyPositionOld.z, 0, true)

					if retHit == true then
						return true
					end
				end
			end
		end
	end

	return false
end

function BulletBase:CheckIntervalSpace()
	local hitInfo

	if self:IsDead() == true or self:IsColliderMoveEnable() == false then
		return
	end

	if DebugShowBulletRoute == true then
		local controllerBullet = self.sceneController:GetControllerBullet()

		controllerBullet:AddDebugLine(self.flyPositionOld, self.flyPosition)
	end

	local dir = self.flyPosition - self.flyPositionOld
	local radius = self.colliderMoveRadius

	if radius < BulletBase.BulletColliderExtendMin then
		radius = BulletBase.BulletColliderExtendMin
	end

	local tmpLayerMaskCheck = self:GetLayerMask()

	if self:IsBulletParryEnable() == true then
		tmpLayerMaskCheck = self:GetSkillBoxLayerMask()
	end

	if tmpLayerMaskCheck ~= nil then
		local ret = XPhysics.SphereCastAll(self.fromVPlayer:GetAnimalId(), 0, self.flyPositionOld.x, self.flyPositionOld.y, self.flyPositionOld.z, radius, dir.x, dir.y, dir.z, dir.magnitude + 2 * radius, tmpLayerMaskCheck)

		if ret == true then
			local posX = 0
			local posY = 0
			local posZ = 0
			local normalX = 0
			local normalY = 0
			local normalZ = 0
			local hitDistance = 0
			local hitLayer = 0
			local hitCollider
			local hitOwnerId = 0
			local tmpBlockLayerMask = self:GetBlockLayerMask()
			local interceptNearestPos
			local interceptDis = -1
			local interceptLayer = 0

			if tmpBlockLayerMask ~= nil then
				ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(self.fromVPlayer:GetAnimalId(), 0, tmpBlockLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

				if ret == true and hitCollider ~= nil then
					interceptNearestPos = Vector3.New(posX, posY, posZ)
					interceptDis = hitDistance
					interceptLayer = hitLayer
				end
			end

			if self:IsColliderMoveWithAnimal() == true or self:IsBulletParryEnable() == true then
				local retNum = 0
				local retIdList, retLayerList, retPosXList, retPosYList, retPosZList, retDisList
				local tmpLayerMaskGet = BulletBase.BulletAnimalLayerMask

				if self:IsColliderMoveWithAnimal() == true and self:IsBulletParryEnable() == true then
					tmpLayerMaskGet = BulletBase.BulletSkillBoxAnimalLayerMask
				elseif self:IsColliderMoveWithAnimal() == true then
					tmpLayerMaskGet = BulletBase.BulletAnimalLayerMask
				elseif self:IsBulletParryEnable() == true then
					tmpLayerMaskGet = BulletBase.BulletSkillBoxOnlyLayerMask
				end

				retNum, retIdList, retLayerList, retPosXList, retPosYList, retPosZList, retDisList = XPhysics.GetCastBulletColliderAnimal(self.fromVPlayer:GetAnimalId(), 0, tmpLayerMaskGet, retIdList, retLayerList, retPosXList, retPosYList, retPosZList, retDisList)

				if retNum > 0 and retIdList ~= nil and retLayerList ~= nil and retPosXList ~= nil and retPosYList ~= nil and retPosZList ~= nil and retDisList ~= nil then
					if self:IsThroughBody() == true then
						for k = 0, retNum - 1 do
							local tmpOwnerId = retIdList[k]

							if tmpOwnerId > 0 then
								local tmpDis = Vector3.Distance(self.flyPositionOld, self.startPosition)

								self:HitOwner(tmpOwnerId, retLayerList[k], retPosXList[k], retPosYList[k], retPosZList[k], retDisList[k] + tmpDis, false)
							end
						end
					else
						local sortListByDis

						for k = 0, retNum - 1 do
							local dis = retDisList[k]
							local tmp = {}

							tmp[1] = k
							tmp[2] = dis

							if sortListByDis == nil then
								sortListByDis = {}
							end

							table.insert(sortListByDis, tmp)
						end

						if sortListByDis ~= nil then
							table.sort(sortListByDis, function(a, b)
								return a[2] < b[2]
							end)
						end

						if sortListByDis ~= nil then
							for i = 1, #sortListByDis do
								local k = sortListByDis[i][1]
								local dis = sortListByDis[i][2]

								SystemHelper.LogTest("===========k=" .. k .. ",dis=" .. dis .. ",interceptDis=" .. interceptDis)

								if interceptDis <= 0 or dis < interceptDis then
									local tmpOwnerId = retIdList[k]

									if tmpOwnerId > 0 then
										local tmpDis = Vector3.Distance(self.flyPositionOld, self.startPosition)
										local hitRet = self:HitOwner(tmpOwnerId, retLayerList[k], retPosXList[k], retPosYList[k], retPosZList[k], retDisList[k] + tmpDis, false)

										if hitRet == true then
											break
										end
									end
								else
									break
								end
							end
						end

						sortListByDis = nil
					end
				end
			end

			if interceptNearestPos ~= nil and interceptDis > 0 then
				self:Intercept(interceptNearestPos, interceptDis, interceptLayer)
			end

			interceptNearestPos = nil
		end
	end

	dir = nil
end

function BulletBase:GetTargetList()
	local skillTargetList

	if self.skillData ~= nil then
		skillTargetList = GameAI.GetSelectTarget(self.fromVPlayer, AnimalBase.GetSkillTargetType(self.originVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo))
	end

	return skillTargetList
end

function BulletBase:IsInTargetForShell(shell)
	if self.skillData ~= nil then
		local retIn = GameAI.IsInSelectTargetForShell(self.fromVPlayer:GetAnimalId(), self.fromVPlayer:GetTeamId(), AnimalBase.GetSkillTargetType(self.originVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo), shell)

		return retIn
	end

	return false
end

function BulletBase:HitOwner(hitOwnerId, hitLayer, posX, posY, posZ, hitDis, isOverlap)
	if hitLayer == LayerShell then
		local hitShell = self.sceneController:FindShellById(hitOwnerId)

		if hitShell ~= nil and self:IsInTargetForShell(hitShell) == true then
			self:RayHitShell(hitShell, posX, posY, posZ, hitDis)

			return true
		end
	else
		local hitAnimal

		if self.skillData ~= nil then
			local skillTargetList = self:GetTargetList()

			if skillTargetList ~= nil then
				for i, tmpPlayer in pairs(skillTargetList) do
					if tmpPlayer:GetAnimalId() == hitOwnerId and tmpPlayer:IsDead() == false and tmpPlayer:IsShow() == true then
						hitAnimal = tmpPlayer

						break
					end
				end
			end
		end

		if hitAnimal ~= nil then
			local colliderIndexList

			if hitLayer == LayerAnimalSkill then
				if self:IsBulletParryEnable() == true then
					self:ParryRebound(hitAnimal, posX, posY, posZ)

					return true
				end
			else
				if hitAnimal.useHitBone > 0 then
					local colliderIndexList = {}
					local retNum = 0
					local retIdList, retLayerList

					if isOverlap == true then
						retNum, retIdList, retLayerList = XPhysics.GetOverlapColliderBone(hitOwnerId, retIdList, retLayerList)
					else
						retNum, retIdList, retLayerList = XPhysics.GetCastColliderBone(hitOwnerId, retIdList, retLayerList)
					end

					if retNum > 0 and retIdList ~= nil and retLayerList ~= nil then
						for k = 0, retNum - 1 do
							local colliderIndex = retIdList[k]

							if colliderIndex ~= nil and colliderIndex >= 0 then
								if colliderIndexList == nil then
									colliderIndexList = {}
								end

								table.insert(colliderIndexList, colliderIndex)
							end
						end
					end
				end

				self:RayHitAnimal(hitAnimal, posX, posY, posZ, hitDis, colliderIndexList)

				return true
			end
		end
	end

	return false
end

function BulletBase:IsArrived()
	if self.lifeTime > 0 then
		local nowTime = TimeHelper.getNowTime()

		if nowTime >= self.startTime + self.lifeTime then
			return true
		end
	else
		local dis = Vector3.DistanceSquare(self.flyPosition, self.endPosition)

		if MathHelper.IsZero(dis) == true then
			return true
		end

		if self.flyPosition.y <= -10 then
			return true
		end

		if dis > BulletBase.BulletRnageMax * BulletBase.BulletRnageMax then
			return true
		end
	end

	return false
end

function BulletBase:IsDead()
	return self.deadFlg
end

function BulletBase:SetDead(flg)
	self.deadFlg = flg

	if self.deadFlg == true then
		self:ExplodeDestroy(self.flyPosition)
	end
end

function BulletBase:ClearDelay()
	self.clearReady = true
end

return BulletBase
