-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletBeam.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletBeam = class("BulletBeam", BulletBase)
BulletBeam.static.HitIntervalTime = 0.6

function BulletBeam:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToFly)
	self:SetThroughBody(true)

	self.chainEffect = nil
	self.chainStartTf = nil
	self.chainEffectClear = false
end

function BulletBeam:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self.hitAnimalTime ~= nil then
		local nowTime = TimeHelper.getNowTime()

		for id, time in pairs(self.hitAnimalTime) do
			local diff = nowTime - time

			if diff >= BulletBeam.HitIntervalTime then
				self:ClearHitAnimal(id)
			end
		end
	end

	if self.hitShellTime ~= nil then
		local nowTime = TimeHelper.getNowTime()

		for id, time in pairs(self.hitShellTime) do
			local diff = nowTime - time

			if diff >= BulletBeam.HitIntervalTime then
				self:ClearHitShell(id)
			end
		end
	end
end

function BulletBeam:UpdateCollider()
	BulletBase.UpdateCollider(self)

	if self:IsRunning() == false then
		return
	end

	self:CheckStartMoveCollider(self.startPosition)
end

function BulletBeam:CheckIntervalSpace()
	local hitInfo

	if self:IsDead() == true or self:IsColliderMoveEnable() == false then
		return
	end

	if DebugShowBulletRoute == true then
		local controllerBullet = self.sceneController:GetControllerBullet()

		controllerBullet:AddDebugLine(self.startPosition, self.flyPosition)
	end

	local dir = self.endPosition - self.startPosition
	local radius = self.colliderMoveRadius

	if radius < BulletBase.BulletColliderExtendMin then
		radius = BulletBase.BulletColliderExtendMin
	end

	local ret = XPhysics.RaycastAll(self.fromVPlayer:GetAnimalId(), 0, self.startPosition.x, self.startPosition.y, self.startPosition.z, dir.x, dir.y, dir.z, dir.magnitude + 2 * radius, self:GetBlockLayerMask())

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

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(self.fromVPlayer:GetAnimalId(), 0, self:GetBlockLayerMask(), posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

		if ret == true and hitCollider ~= nil then
			local nearestPos = Vector3.New(posX, posY, posZ)

			self:Intercept(nearestPos, hitDistance, hitLayer)

			nearestPos = nil
		end
	end

	dir = nil

	if self:IsColliderMoveWithAnimal() == true then
		local dirReal = self.flyPosition - self.startPosition
		local tmpLayerMaskCheck = BulletBase.BulletAnimalLayerMask

		if self:IsBulletParryEnable() == true then
			tmpLayerMaskCheck = BulletBase.BulletSkillBoxAnimalLayerMask
		end

		ret = XPhysics.SphereCastAll(self.fromVPlayer:GetAnimalId(), 0, self.startPosition.x, self.startPosition.y, self.startPosition.z, radius, dirReal.x, dirReal.y, dirReal.z, dirReal.magnitude + 2 * radius, tmpLayerMaskCheck)

		if ret == true then
			local retNum = 0
			local retIdList, retLayerList, retPosXList, retPosYList, retPosZList, retDisList

			retNum, retIdList, retLayerList, retPosXList, retPosYList, retPosZList, retDisList = XPhysics.GetCastBulletColliderAnimal(self.fromVPlayer:GetAnimalId(), 0, tmpLayerMaskCheck, retIdList, retLayerList, retPosXList, retPosYList, retPosZList, retDisList)

			if retNum > 0 and retIdList ~= nil and retLayerList ~= nil and retPosXList ~= nil and retPosYList ~= nil and retPosZList ~= nil and retDisList ~= nil then
				for k = 0, retNum - 1 do
					local tmpOwnerId = retIdList[k]

					if tmpOwnerId > 0 then
						self:HitOwner(tmpOwnerId, retLayerList[k], retPosXList[k], retPosYList[k], retPosZList[k], retDisList[k], false)
					end
				end
			end
		end

		dirReal = nil
	end
end

function BulletBeam:LateUpdate()
	BulletBase.LateUpdate(self)

	if self:IsRunning() == false then
		return
	end

	if self.chainStartTf ~= nil then
		self:SetStartPosition(self.chainStartTf.position)
	end

	local disNow = Vector3.Distance(self.startPosition, self.flyPosition)
	local disTarget = Vector3.Distance(self.startPosition, self.endPosition)

	if disNow < disTarget then
		local tmpSpeed = self.speedVec3.z * ControllerMain.GetLogicDeltaTime()

		if tmpSpeed >= disTarget - disNow then
			disNow = disTarget
		else
			disNow = disNow + tmpSpeed
		end
	else
		disNow = disTarget
	end

	if self:IsIntercepted() == true then
		disNow = Mathf.Min(disNow, self.interceptDistance)
	end

	local targetPos = self.endPosition

	if MathHelper.IsZero(disTarget) == false then
		targetPos = self.endPosition - self.startPosition

		targetPos:SetNormalize()
		targetPos:Mul(disNow)
		targetPos:Add(self.startPosition)
	end

	self:SetPosition(targetPos, false)

	self.intercepted = false
	targetPos = nil

	if self.clearReady == true and self.chainEffectClear == false and self.chainEffect ~= nil then
		local ret = self.chainEffect:IsPlaying()

		if ret == false then
			self.chainEffectClear = true
		end
	end
end

function BulletBeam:AddChainEffect(effName, hostTf)
	self.chainEffect = VfxManager.PlayTransformFreezeMulti(self.tfSelf, effName)

	if self.chainEffect ~= nil then
		self.chainEffect:AddMultipleBind(1, hostTf)
		self.chainEffect:AddMultipleBind(2, self.tfSelf)
		self.chainEffect:SetDelayClear(true, nil)

		self.chainStartTf = hostTf
	end
end

function BulletBeam:IsRunning()
	local ret = BulletBase.IsRunning(self)

	if ret == true and self.chainEffectClear == true then
		ret = false
	end

	return ret
end

function BulletBeam:ClearDelay()
	if self.chainEffect ~= nil then
		self.chainEffect:Clear()
	end

	BulletBase.ClearDelay(self)
end

function BulletBeam:Exit()
	if self.exitFlg == true then
		return
	end

	if self.chainEffect ~= nil then
		self.chainEffect:ClearMultipleBind()
		self.chainEffect:Clear()

		self.chainEffect = nil
	end

	self.chainStartTf = nil

	BulletBase.Exit(self)
end

return BulletBeam
