-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Camera/CameraBase.lua

CameraBase = class("CameraBase")
CameraBase.static.SphereCastRadiusGround = 0.06
CameraBase.static.SphereCastRadius = 0.06
CameraBase.static.SmoothSpeedHeightMin = 0.3
CameraBase.static.SmoothSpeedHeightMax = 0.6
CameraBase.static.SmoothSpeedRateMin = 1
CameraBase.static.SmoothSpeedRateMax = 3
CameraBase.static.GroundHitDistanceDiff = 0.03
CameraBase.static.CornerMax = 4
CameraBase.static.CornerType = {
	LowerRight = 4,
	UpperLeft = 1,
	LowerLeft = 3,
	UpperRight = 2
}
CameraBase.static.AnimatorFrame = {
	AnimatorFrame_Frame = 1,
	AnimatorFrame_RotX = 5,
	AnimatorFrame_PosZ = 4,
	AnimatorFrame_PosY = 3,
	AnimatorFrame_RotZ = 7,
	AnimatorFrame_PosX = 2,
	AnimatorFrame_RotY = 6
}
CameraBase.static.AnimatorType = {
	Route = 2,
	KeyFrame = 1
}
CameraBase.static.AnimatorPurpose = {
	Shake = 3,
	Other = 4,
	Event = 1,
	Dialog = 2
}
CameraBase.static.ControllerShake = {
	FadeOut = 4,
	Amplitude = 1,
	MotorIndex = 5,
	FadeIn = 3,
	Duration = 2,
	Delay = 6
}

local postProfilePreloaded = {}

function CameraBase:initialize(tf_cameraVirtual, tf_cameraRoot)
	self.tfCamVirtual = tf_cameraVirtual
	self.tfCamRoot = tf_cameraRoot
	self.tfMotion = TfFindChild(self.tfCamRoot, "CameraMotion")
	self.tfSelf = TfFindChild(self.tfMotion, "CameraSelf")
	self.cameraEnable = false

	if self.tfSelf ~= nil then
		self.tfSelf.gameObject:SetActive(true)

		self.cameraEnable = true
	end

	self.hostPlayer = nil
	self.hostPlayerLookAtHeight = 0
	self.subPlayer = nil
	self.switchHostToSub = false
	self.camera = self.tfSelf:GetComponent("Camera")

	if self.camera ~= nil then
		self.camera.enabled = true
		self.camera.useOcclusionCulling = false
	end

	self.sceneController = ST_Main.GetSceneController()
	self.controllerTimer = nil
	self.postProcessLayer = self.tfSelf:GetComponent("PostProcessLayer")
	self.brownianMotion = self.tfSelf:GetComponent("Klak.Motion.BrownianMotion")

	if self.brownianMotion ~= nil then
		self.brownianMotion.enabled = false
		self.brownianMotion = nil
	end

	self.cameraMotionPause = false
	self.moveFlg = false
	self.cameraPosLock = false
	self.cameraPosMinY = -999
	self.waterHeight = SceneBase.DefaultWaterHeight
	self.cameraPos = Vector3.zero
	self.cameraPosCollider = Vector3.zero
	self.cameraPosTarget = Vector3.zero
	self.cameraPosMotion = Vector3.zero
	self.cameraPosReal = Vector3.zero
	self.cameraLookAt = Vector3.zero
	self.cameraForward = Vector3.zero
	self.cameraForwardReal = Vector3.zero
	self.cameraRot = Quaternion.identity
	self.cameraRotTarget = Quaternion.identity
	self.cameraRotMotion = Quaternion.identity
	self.cameraRotReal = Quaternion.identity
	self.listenerPos = Vector3.zero
	self.listenerRot = Quaternion.identity
	self.lastOnCollider = false
	self.smoothPosVelocity = Vector3.zero
	self.smoothLookAtVelocity = Vector3.zero
	self.animatorPosInit = Vector3.zero
	self.animatorRotInit = Quaternion.identity
	self.animatorPlaying = false
	self.animatorCallBack = nil
	self.animatorType = CameraBase.AnimatorType.KeyFrame
	self.animatorPurpose = CameraBase.AnimatorPurpose.Other
	self.animatorBack = false
	self.animatorStartTime = 0
	self.animatorElapsedTime = 0
	self.animatorTemplate = nil
	self.controllerShakeTemplate = nil
	self.controllerShakeAmplitude = 0
	self.controllerShakeMotorIndex = 0
	self.controllerShakeTimeStart = 0
	self.controllerShakeTimeFadeIn = 0
	self.controllerShakeTimeFadeOut = 0
	self.controllerShakeTimeEnd = 0
	self.controllerShakeDelay = 0
	self.animatorTargetPos = Vector3.zero
	self.animatorTargetRot = Quaternion.identity
	self.animatorFromPos = Vector3.zero
	self.animatorFromRot = Quaternion.identity
	self.blockAllLayerMask = LayerMask.GetMask("WallOpaque", "Ground")
	self.isPad = SystemHelper.isSubquadrateScrAS()

	self:UpdateView()
end

function CameraBase:GetCamera()
	return self.camera
end

function CameraBase:GetCameraObj()
	return self.tfSelf.gameObject
end

function CameraBase:SetCameraClippingPlane(near, far)
	if self.camera ~= nil then
		self.camera.nearClipPlane = near
		self.camera.farClipPlane = far
	end
end

function CameraBase:PauseBrownianMotion(flg)
	if self.brownianMotion ~= nil and self.cameraMotionPause ~= flg then
		if flg == true then
			self.brownianMotion:Pause()
		else
			self.brownianMotion:Resume()
		end

		self.cameraMotionPause = flg
	end
end

function CameraBase:SetHostPlayer(host, reset)
	self.hostPlayer = host
end

function CameraBase:SetSubPlayer(sub)
	self.subPlayer = sub
end

function CameraBase:GetSubPlayer()
	return self.subPlayer
end

function CameraBase:GetLookPlayer()
	if self.switchHostToSub == true and self.subPlayer ~= nil then
		return self.subPlayer
	else
		return self.hostPlayer
	end
end

function CameraBase:SwitchHostToSub(flg)
	self.switchHostToSub = flg
end

function CameraBase:GetCameraVirtual()
	return self.tfCamVirtual
end

function CameraBase:GetCameraRoot()
	return self.tfCamRoot
end

function CameraBase:GetNearClipPlane()
	return self.camera.nearClipPlane
end

function CameraBase:GetFarClipPlane()
	return self.camera.farClipPlane
end

function CameraBase:GetFieldOfView()
	return self.camera.fieldOfView
end

function CameraBase:SetFieldOfView(view)
	self.camera.fieldOfView = view
end

function CameraBase:GetNearViewportPlaneCorners()
	local nearDis = self.camera.nearClipPlane

	return self:GetViewportPlaneCorners(nearDis)
end

function CameraBase:GetViewportPlaneCorners(distance)
	local corners = {}

	for i = 1, CameraBase.CornerMax do
		table.insert(corners, Vector3.zero)
	end

	local fieldOfView = self.camera.fieldOfView
	local aspect = self.camera.aspect
	local halfFOV = fieldOfView * 0.5 * Mathf.Deg2Rad
	local height = distance * Mathf.Tan(halfFOV)
	local width = height * aspect

	corners[CameraBase.CornerType.UpperLeft] = self.tfSelf.position - self.tfSelf.right * width
	corners[CameraBase.CornerType.UpperLeft] = corners[CameraBase.CornerType.UpperLeft] + self.tfSelf.up * height
	corners[CameraBase.CornerType.UpperLeft] = corners[CameraBase.CornerType.UpperLeft] + self.tfSelf.forward * distance
	corners[CameraBase.CornerType.UpperRight] = self.tfSelf.position + self.tfSelf.right * width
	corners[CameraBase.CornerType.UpperRight] = corners[CameraBase.CornerType.UpperRight] + self.tfSelf.up * height
	corners[CameraBase.CornerType.UpperRight] = corners[CameraBase.CornerType.UpperRight] + self.tfSelf.forward * distance
	corners[CameraBase.CornerType.LowerLeft] = self.tfSelf.position - self.tfSelf.right * width
	corners[CameraBase.CornerType.LowerLeft] = corners[CameraBase.CornerType.LowerLeft] - self.tfSelf.up * height
	corners[CameraBase.CornerType.LowerLeft] = corners[CameraBase.CornerType.LowerLeft] + self.tfSelf.forward * distance
	corners[CameraBase.CornerType.LowerRight] = self.tfSelf.position + self.tfSelf.right * width
	corners[CameraBase.CornerType.LowerRight] = corners[CameraBase.CornerType.LowerRight] - self.tfSelf.up * height
	corners[CameraBase.CornerType.LowerRight] = corners[CameraBase.CornerType.LowerRight] + self.tfSelf.forward * distance

	return corners
end

function CameraBase:InitCameraPos(object)
	return
end

function CameraBase:SetMoving(is_move)
	self.moveFlg = is_move
end

function CameraBase:IsMoving()
	return self.moveFlg
end

function CameraBase:WorldToScreenPoint(pos)
	local ret = self.camera:WorldToScreenPoint(pos)

	return ret
end

function CameraBase:FoldScreen(width, height)
	self.isPad = SystemHelper.isSubquadrateScrAS()

	self:UpdateView()
end

function CameraBase:UpdateView()
	if self.camera ~= nil then
		if self.isPad == true then
			self.camera.usePhysicalProperties = true
			self.camera.gateFit = UnityEngine.Camera.GateFitMode.Horizontal
			self.camera.sensorSize = Vector2.New(42.2, 24.9)

			SystemHelper.LogTest("===#########===FoldScreen==usePhysicalProperties====")
		else
			self.camera.usePhysicalProperties = false
		end

		self:SetFieldOfView(LS_Setting.graphics.fieldofview)
	end
end

function CameraBase:Update()
	if self.animatorPlaying == true then
		if self.animatorType == CameraBase.AnimatorType.KeyFrame then
			if self.animatorTemplate ~= nil then
				local startIndex = 1
				local endIndex = 2
				local animatorPosX = 0
				local animatorPosY = 0
				local animatorPosZ = 0
				local animatorRotX = 0
				local animatorRotY = 0
				local animatorRotZ = 0
				local nowTime = TimeHelper.getNowTime()
				local diffTime = nowTime - self.animatorStartTime

				for i = 1, #self.animatorTemplate do
					if diffTime > self.animatorTemplate[i][CameraBase.AnimatorFrame.AnimatorFrame_Frame] / ControllerMain.AnimatorFrameRate then
						if i >= #self.animatorTemplate then
							startIndex = i
							endIndex = i
						else
							startIndex = i
							endIndex = i + 1
						end
					end
				end

				local radio = 1

				if startIndex < endIndex then
					local startTime = self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_Frame] / ControllerMain.AnimatorFrameRate
					local endTime = self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_Frame] / ControllerMain.AnimatorFrameRate

					radio = (diffTime - startTime) / (endTime - startTime)
				end

				animatorPosX = Mathf.Lerp(self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_PosX], self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_PosX], radio)
				animatorPosY = Mathf.Lerp(self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_PosY], self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_PosY], radio)
				animatorPosZ = Mathf.Lerp(self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_PosZ], self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_PosZ], radio)
				animatorRotX = Mathf.Lerp(self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_RotX], self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_RotX], radio)
				animatorRotY = Mathf.Lerp(self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_RotY], self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_RotY], radio)
				animatorRotZ = Mathf.Lerp(self.animatorTemplate[startIndex][CameraBase.AnimatorFrame.AnimatorFrame_RotZ], self.animatorTemplate[endIndex][CameraBase.AnimatorFrame.AnimatorFrame_RotZ], radio)

				self.cameraPosMotion:Set(animatorPosX, animatorPosY, animatorPosZ)
				self.cameraPosReal:SetVector3(self.cameraPosCollider)
				self.cameraPosReal:Add(self.cameraPosMotion)
				self.cameraRotMotion:SetEuler(animatorRotX, animatorRotY, animatorRotZ)
				self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
				self.cameraRotReal:MulQuat(self.cameraRot)

				self.tfMotion.localPosition = self.cameraPosMotion
				self.tfMotion.localRotation = self.cameraRotMotion

				if startIndex >= #self.animatorTemplate then
					self:EndAnimator()
				end
			end

			if LS_Setting.vibration > 0 and self.animatorPurpose == CameraBase.AnimatorPurpose.Shake and self.controllerShakeTemplate ~= nil and self.controllerShakeAmplitude > 0 then
				local nowTime = TimeHelper.getNowTimeNoScale()
				local diffTime = nowTime - self.controllerShakeTimeStart

				if diffTime >= self.controllerShakeDelay then
					local duration = Mathf.Min(0.1, self.controllerShakeTimeEnd - self.controllerShakeTimeStart - diffTime)
					local ratio = 1
					local timeScale = 1

					if self.controllerShakeTimeFadeIn > 0 and diffTime >= 0 and diffTime < self.controllerShakeTimeFadeIn + self.controllerShakeDelay then
						ratio = (diffTime - self.controllerShakeDelay) / self.controllerShakeTimeFadeIn
					elseif self.controllerShakeTimeFadeOut > 0 and diffTime >= self.controllerShakeTimeEnd - self.controllerShakeTimeStart - self.controllerShakeTimeFadeOut and diffTime < self.controllerShakeTimeEnd - self.controllerShakeTimeStart then
						ratio = (self.controllerShakeTimeEnd - self.controllerShakeTimeStart - diffTime) / self.controllerShakeTimeFadeOut
					elseif diffTime >= self.controllerShakeTimeEnd - self.controllerShakeTimeStart then
						self:EndControllerShake()

						ratio = 0
					end

					ratio = Mathf.Clamp(ratio, 0, 1)

					if self.controllerTimer ~= nil then
						timeScale = self.controllerTimer:GetTimeScale()
					end

					if ratio > 0 and timeScale > 0 then
						inputMgr:SetVibration(self.controllerShakeMotorIndex, self.controllerShakeAmplitude * ratio, duration)
					end
				end
			end
		elseif self.animatorType == CameraBase.AnimatorType.Route then
			local nowTime = TimeHelper.getNowTime()
			local diffTime = nowTime - self.animatorStartTime
			local radio = 1

			if diffTime < self.animatorElapsedTime then
				radio = diffTime / self.animatorElapsedTime
			end

			local routePos = Vector3.Lerp(self.animatorFromPos, self.animatorTargetPos, radio)
			local routeRot = Quaternion.Lerp(self.animatorFromRot, self.animatorTargetRot, radio)

			self:SynchronizePosAndRot(routePos, routeRot)

			if radio >= 1 then
				self:EndAnimator()
			end
		end
	end

	UIManager.SetMainCameraFwd(self.cameraForwardReal)
	UIManager.SetMainCameraPos(self.cameraPosReal)
end

function CameraBase:GetCameraRealPosition()
	return self.cameraPosReal
end

function CameraBase:GetCameraLogicPosition()
	return self.cameraPos
end

function CameraBase:GetCameraRotation()
	return self.cameraRot
end

function CameraBase:GetCameraRotationInverse()
	return self.cameraRot:Inverse()
end

function CameraBase:GetCameraLookAt()
	return self.cameraLookAt
end

function CameraBase:GetCameraForward()
	return self.cameraForward
end

function CameraBase:GetCameraRealForward()
	return self.cameraForwardReal
end

function CameraBase:SynchronizeTransformPosition()
	self.cameraPos:SetVector3(self.tfCamVirtual.position)
	self.cameraPosCollider:SetVector3(self.cameraPos)
	self.cameraPosMotion:SetVector3(self.tfMotion.localPosition)
	self.cameraPosReal:SetVector3(self.cameraPosCollider)
	self.cameraPosReal:Add(self.cameraPosMotion)
	self.cameraRot:SetQuaternion(self.tfCamVirtual.rotation)
	self.cameraRotMotion:SetQuaternion(self.tfMotion.localRotation)
	self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
	self.cameraRotReal:MulQuat(self.cameraRot)
	self.cameraForward:Set(0, 0, 1)
	self.cameraForward:MulQuat(self.cameraRot)
	self.cameraForward:SetNormalize()
	self.cameraForwardReal:Set(0, 0, 1)
	self.cameraForwardReal:MulQuat(self.cameraRotReal)
	self.cameraForwardReal:SetNormalize()
	self.cameraLookAt:SetVector3(self.cameraPosReal)
	self.cameraLookAt:Add(self.cameraForwardReal)
	self.smoothPosVelocity:Set(0, 0, 0)
	self.smoothLookAtVelocity:Set(0, 0, 0)
	self:UpdateListenerPosition(false)
end

function CameraBase:SynchronizePosAndRot(pos, rot)
	if self.cameraPosLock == false then
		self.cameraPos:SetVector3(pos)
		self.cameraPosCollider:SetVector3(self.cameraPos)
		self.cameraPosReal:SetVector3(self.cameraPosCollider)
		self.cameraPosReal:Add(self.cameraPosMotion)
	end

	self.cameraRot:SetQuaternion(rot)
	self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
	self.cameraRotReal:MulQuat(self.cameraRot)
	self.cameraForward:Set(0, 0, 1)
	self.cameraForward:MulQuat(self.cameraRot)
	self.cameraForward:SetNormalize()
	self.cameraForwardReal:Set(0, 0, 1)
	self.cameraForwardReal:MulQuat(self.cameraRotReal)
	self.cameraForwardReal:SetNormalize()
	self.cameraLookAt:SetVector3(self.cameraPosReal)
	self.cameraLookAt:Add(self.cameraForwardReal)

	self.tfCamVirtual.position = self.cameraPos
	self.tfCamVirtual.rotation = self.cameraRot

	self.smoothPosVelocity:Set(0, 0, 0)
	self.smoothLookAtVelocity:Set(0, 0, 0)
	self:UpdateListenerPosition(false)
end

function CameraBase:SetCameraPosAndLookAtPos(pos, look, use_collider, collider_check_point, inTimeLine)
	self.cameraLookAt:SetVector3(look)

	if self.cameraPosLock == false then
		self.cameraPos:SetVector3(pos)
	end

	self.cameraPosCollider:SetVector3(self.cameraPos)

	if use_collider == true then
		self.cameraPosCollider = self:AdjustCameraPosAndLookAtPos(self.cameraPosCollider, collider_check_point)
	end

	local minY = Mathf.Max(self.waterHeight, self.cameraPosMinY)

	if minY > self.cameraPosCollider.y then
		self.cameraPosCollider.y = minY
	end

	self.cameraPosReal:SetVector3(self.cameraPosCollider)
	self.cameraPosReal:Add(self.cameraPosMotion)
	self.cameraForward:SetVector3(self.cameraLookAt)
	self.cameraForward:Sub(self.cameraPos)
	self.cameraForwardReal:SetVector3(self.cameraLookAt)
	self.cameraForwardReal:Sub(self.cameraPosReal)

	if MathHelper.IsZero(self.cameraForwardReal.sqrMagnitude) == false then
		local tmpRot = Quaternion.LookRotation(self.cameraForwardReal)

		self.cameraRot:SetQuaternion(tmpRot)
		self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
		self.cameraRotReal:MulQuat(self.cameraRot)
	end

	self.tfCamVirtual.position = self.cameraPosCollider
	self.tfCamVirtual.rotation = self.cameraRot

	self.smoothPosVelocity:Set(0, 0, 0)
	self.smoothLookAtVelocity:Set(0, 0, 0)
	self:UpdateListenerPosition(inTimeLine)
end

function CameraBase:UseCameraPosCollider()
	self.cameraPos:SetVector3(self.cameraPosCollider)
end

function CameraBase:LockPosition(flg)
	self.cameraPosLock = flg
end

function CameraBase:IsPositionLocked()
	return self.cameraPosLock
end

function CameraBase:SetCameraTargetPosAndRot(pos, rot)
	self.cameraPosTarget:SetVector3(pos)
	self.cameraRotTarget:SetQuaternion(rot)
end

function CameraBase:SetPositionMinY(y)
	self.cameraPosMinY = y
end

function CameraBase:SetWaterHeight(y)
	self.waterHeight = y
end

function CameraBase:UpdateListenerPosition(inTimeLine)
	if inTimeLine == true then
		self.listenerPos:SetVector3(self.tfCamRoot.position)
		self.listenerRot:SetQuaternion(self.tfCamRoot.rotation)
		AudioCtrl.SetListenerPos(self.listenerPos, self.listenerRot)
	elseif self.hostPlayer ~= nil then
		local tfBodyHead = self.hostPlayer:GetBodyHead()

		if tfBodyHead ~= nil then
			self.listenerPos:SetVector3(tfBodyHead.position)
		else
			self.listenerPos:SetVector3(self.hostPlayer:GetPosByWorldPos())
		end

		self.listenerPos:Add(self.cameraPosReal)
		self.listenerPos:Div(2)
		self.listenerRot:SetQuaternion(self.tfCamRoot.rotation)
		AudioCtrl.SetListenerPos(self.listenerPos, self.listenerRot)
	end
end

function CameraBase:RotateCameraByAxis(angleX, angleY, angleZ)
	local rotate = Quaternion.Euler(angleX, angleY, angleZ)

	self.cameraRot:MulQuat(rotate)
	self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
	self.cameraRotReal:MulQuat(self.cameraRot)

	self.tfCamVirtual.rotation = self.cameraRot
end

function CameraBase:CheckCameraBlock(from, to)
	local tmpDir = to - from
	local dis = tmpDir.magnitude
	local lookPlayer = self:GetLookPlayer()
	local ignoreId = 0

	if lookPlayer ~= nil then
		ignoreId = lookPlayer:GetAnimalId()
	end

	ret = XPhysics.SphereCastAll(ignoreId, 0, from.x, from.y, from.z, CameraBase.SphereCastRadius, tmpDir.x, tmpDir.y, tmpDir.z, dis, self.blockAllLayerMask)

	return ret
end

function CameraBase:IsLastOnCollider()
	return self.lastOnCollider
end

function CameraBase:AdjustCameraPosAndLookAtPos(pos, check_point)
	local hitInfo
	local camPos = pos
	local distanceOld = Vector3.Distance(check_point, pos)
	local relative = camPos - check_point

	relative:SetNormalize()

	local lookPlayer = self:GetLookPlayer()
	local ignoreId = 0

	if lookPlayer ~= nil then
		ignoreId = lookPlayer:GetAnimalId()
	end

	self.lastOnCollider = false

	local ret = false
	local camDis = distanceOld

	ret = XPhysics.SphereCastAll(ignoreId, 0, check_point.x, check_point.y, check_point.z, CameraBase.SphereCastRadius, relative.x, relative.y, relative.z, distanceOld, self.blockAllLayerMask)

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

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(ignoreId, 0, self.blockAllLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

		if ret == true then
			if hitDistance > CameraBase.GroundHitDistanceDiff then
				hitDistance = hitDistance - CameraBase.GroundHitDistanceDiff
			end

			if hitDistance > 0 then
				camDis = Mathf.Min(camDis, hitDistance)
			end

			self.lastOnCollider = true
		end
	end

	camPos:SetVector3(check_point)
	relative:Mul(camDis)
	camPos:Add(relative)

	relative = nil

	return camPos
end

function CameraBase:SmoothRotateCameraPosAndLookAtPos(posNew, lookAtNew, originPos, originPosOld, disSpeed, rotSpeed, smoothRot, smoothHeight)
	local testPosDis = Vector3.DistanceSquare(posNew, self.cameraPos)
	local testLookDis = Vector3.DistanceSquare(lookAtNew, self.cameraLookAt)

	if MathHelper.IsZero(testPosDis) == true and MathHelper.IsZero(testLookDis) == true then
		return posNew, lookAtNew
	end

	local tmpOriginDir = originPos - originPosOld
	local camPosOld = self.cameraPos:Clone()
	local camLookAtOld = self.cameraLookAt:Clone()

	camLookAtOld:Add(tmpOriginDir)

	local tmpLookAtHeightDiff = Mathf.Abs(camLookAtOld.y - lookAtNew.y)
	local dirToOriginOld = camPosOld - originPosOld
	local heightOld = dirToOriginOld.y

	dirToOriginOld.y = 0

	local disOld = dirToOriginOld.magnitude

	dirToOriginOld:SetNormalize()

	if MathHelper.IsZero(dirToOriginOld.sqrMagnitude) then
		return posNew, lookAtNew
	end

	local moveRotOld = Quaternion.LookRotation(dirToOriginOld)
	local dirToOriginNew = posNew - originPos
	local heightNew = dirToOriginNew.y

	dirToOriginNew.y = 0

	local disNew = dirToOriginNew.magnitude

	dirToOriginNew:SetNormalize()

	if MathHelper.IsZero(dirToOriginNew.sqrMagnitude) then
		return posNew, lookAtNew
	end

	local moveRotNew = Quaternion.LookRotation(dirToOriginNew)
	local moveRot = moveRotNew:Clone()

	if smoothRot == true then
		moveRot = Quaternion.Lerp(moveRotOld, moveRotNew, rotSpeed)
	end

	local height = heightNew

	if smoothHeight == true then
		height = Mathf.Lerp(heightOld, heightNew, disSpeed)
	end

	local dis = disNew

	if smoothHeight == true then
		dis = Mathf.Lerp(disOld, disNew, disSpeed)
	end

	local dirToOrigin = Vector3.forward

	dirToOrigin:MulQuat(moveRot)

	if MathHelper.IsZero(dirToOrigin.sqrMagnitude) then
		return posNew, lookAtNew
	end

	local retLookPos = lookAtNew

	if smoothHeight == true then
		retLookPos = Mathf.Lerp(camLookAtOld, lookAtNew, disSpeed)
	end

	local retPos = originPos:Clone()

	dirToOrigin:SetNormalize()
	dirToOrigin:Mul(dis)
	retPos:Add(dirToOrigin)

	retPos.y = originPos.y
	retPos.y = retPos.y + height
	tmpOriginDir = nil
	camPosOld = nil
	camLookAtOld = nil
	dirToOriginOld = nil
	dirToOriginNew = nil
	dirToOrigin = nil
	moveRotOld = nil
	moveRotNew = nil
	moveRot = nil

	return retPos, retLookPos
end

function CameraBase:MoveTo(pos, rot, time)
	self.animatorTargetPos:SetVector3(pos)
	self.animatorTargetRot:SetQuaternion(rot)

	self.animatorType = CameraBase.AnimatorType.Route
	self.animatorPurpose = CameraBase.AnimatorPurpose.Other
	self.animatorElapsedTime = time
end

function CameraBase:SetAnimatorTemplate(cameraTemplate, isBack, purpose, shakeTemplate)
	self.animatorTemplate = cameraTemplate
	self.animatorBack = isBack
	self.animatorType = CameraBase.AnimatorType.KeyFrame
	self.animatorPurpose = purpose
	self.controllerShakeTemplate = shakeTemplate
end

function CameraBase:IsAnimatorPlaying()
	return self.animatorPlaying
end

function CameraBase:StartAnimator(callBack)
	if self.animatorPlaying == true then
		return
	end

	if self.animatorType == CameraBase.AnimatorType.KeyFrame then
		if self.animatorTemplate == nil or #self.animatorTemplate <= 0 then
			return
		end

		if LS_Setting.vibration > 0 and self.animatorPurpose == CameraBase.AnimatorPurpose.Shake and self.controllerShakeTemplate ~= nil then
			local amplitude = self.controllerShakeTemplate[CameraBase.ControllerShake.Amplitude]
			local duration = self.controllerShakeTemplate[CameraBase.ControllerShake.Duration]
			local fadeIn = self.controllerShakeTemplate[CameraBase.ControllerShake.FadeIn]
			local fadeOut = self.controllerShakeTemplate[CameraBase.ControllerShake.FadeOut]
			local motorIndex = self.controllerShakeTemplate[CameraBase.ControllerShake.MotorIndex]
			local delay = self.controllerShakeTemplate[CameraBase.ControllerShake.Delay]

			self:StartControllerShake(amplitude, duration, fadeIn, fadeOut, motorIndex, delay)
		end
	elseif self.animatorType == CameraBase.AnimatorType.Route then
		self.animatorFromPos:SetVector3(self:GetCameraLogicPosition())
		self.animatorFromRot:SetQuaternion(self:GetCameraRotation())
	end

	self.animatorPlaying = true
	self.animatorCallBack = callBack
	self.animatorStartTime = TimeHelper.getNowTime()
end

function CameraBase:StartControllerShake(amplitude, duration, fadeIn, fadeOut, motorIndex, delay)
	self.controllerShakeAmplitude = amplitude
	self.controllerShakeMotorIndex = motorIndex
	self.controllerShakeTimeStart = TimeHelper.getNowTimeNoScale()
	self.controllerShakeTimeFadeIn = fadeIn
	self.controllerShakeTimeFadeOut = fadeOut
	self.controllerShakeTimeEnd = self.controllerShakeTimeStart + delay + duration
	self.controllerShakeDelay = delay
end

function CameraBase:EndControllerShake()
	self.controllerShakeAmplitude = 0
	self.controllerShakeMotorIndex = 0
	self.controllerShakeTimeStart = 0
	self.controllerShakeTimeFadeIn = 0
	self.controllerShakeTimeFadeOut = 0
	self.controllerShakeTimeEnd = 0
	self.controllerShakeDelay = 0

	inputMgr:StopVibration()
end

function CameraBase:EndAnimator()
	if self.animatorType == CameraBase.AnimatorType.KeyFrame and self.animatorPurpose == CameraBase.AnimatorPurpose.Shake and self.controllerShakeTemplate ~= nil then
		self:EndControllerShake()
	end

	self.animatorPlaying = false
	self.animatorTemplate = nil
	self.controllerShakeTemplate = nil

	if self.animatorCallBack ~= nil then
		local tempFunc = self.animatorCallBack

		self.animatorCallBack = nil

		tempFunc()
	end

	if self.animatorBack == true then
		self.cameraPosMotion:SetVector3(self.animatorPosInit)
		self.cameraPosReal:SetVector3(self.cameraPosCollider)
		self.cameraPosReal:Add(self.cameraPosMotion)
		self.cameraRotMotion:SetQuaternion(self.animatorRotInit)
		self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
		self.cameraRotReal:MulQuat(self.cameraRot)

		self.tfMotion.localPosition = self.animatorPosInit
		self.tfMotion.localRotation = self.animatorRotInit
	end
end

function CameraBase:ClearCallBack()
	self.animatorCallBack = nil
end

function CameraBase:SetAnimatorBack()
	self.cameraPosMotion:SetVector3(self.animatorPosInit)
	self.cameraPosReal:SetVector3(self.cameraPosCollider)
	self.cameraPosReal:Add(self.cameraPosMotion)
	self.cameraRotMotion:SetQuaternion(self.animatorRotInit)
	self.cameraRotReal:SetQuaternion(self.cameraRotMotion)
	self.cameraRotReal:MulQuat(self.cameraRot)

	self.tfMotion.localPosition = self.animatorPosInit
	self.tfMotion.localRotation = self.animatorRotInit
end

function CameraBase:SetAntialiasing(antialiasingMode)
	if self.postProcessLayer then
		self.postProcessLayer.antialiasingMode = antialiasingMode
	end
end

function CameraBase:SetControllerTimer(controllerTimer)
	self.controllerTimer = controllerTimer
end

function CameraBase:UpdateQuality(force)
	return
end

function CameraBase:SetFog(quality)
	return
end

function CameraBase:Enable()
	if self.tfSelf ~= nil and self.cameraEnable == false then
		if self.tfCamVirtual ~= nil then
			self.tfCamVirtual.gameObject:SetActive(true)
		end

		if self.tfCamRoot ~= nil then
			self.tfCamRoot.gameObject:SetActive(true)
		end

		self.cameraEnable = true
	end
end

function CameraBase:Disable()
	if self.tfSelf ~= nil and self.cameraEnable == true then
		if self.tfCamVirtual ~= nil then
			self.tfCamVirtual.gameObject:SetActive(false)
		end

		if self.tfCamRoot ~= nil then
			self.tfCamRoot.gameObject:SetActive(false)
		end

		self.cameraEnable = false
	end
end

function CameraBase:Exit()
	self:Disable()

	self.tfSelf = nil
	self.tfCamVirtual = nil
	self.tfCamRoot = nil
	self.tfMotion = nil
	self.hostPlayer = nil
	self.subPlayer = nil
	self.camera = nil
	self.sceneController = nil
	self.controllerTimer = nil
	self.postProcessLayer = nil
	self.brownianMotion = nil
	self.cameraPos = nil
	self.cameraPosCollider = nil
	self.cameraPosTarget = nil
	self.cameraPosMotion = nil
	self.cameraPosReal = nil
	self.cameraLookAt = nil
	self.cameraForward = nil
	self.cameraForwardReal = nil
	self.cameraRot = nil
	self.cameraRotTarget = nil
	self.cameraRotMotion = nil
	self.cameraRotReal = nil
	self.listenerPos = nil
	self.listenerLookAt = nil
	self.smoothPosVelocity = nil
	self.smoothLookAtVelocity = nil
	self.animatorPosInit = nil
	self.animatorRotInit = nil
	self.animatorTemplate = nil
	self.controllerShakeTemplate = nil
	self.animatorTargetPos = nil
	self.animatorTargetRot = nil
	self.animatorFromPos = nil
	self.animatorFromRot = nil
	self.animatorCallBack = nil
	self.blockAllLayerMask = nil
end

return CameraBase
