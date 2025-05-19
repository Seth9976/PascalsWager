-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Other/Crow.lua

require("GameData/PlayerDefine/Crow_Define")

Crow = class("Crow")
Crow.StateHash = {
	StartFly = 0,
	StartFlyLoop = 0,
	Idle = 0,
	Empty = 0,
	Move = 0
}

function Crow:initialize(targetHero, cameraCtrl, tf)
	local tmpPrefabName = "crow"
	local tmpPackage = string.lower("Character/" .. tmpPrefabName)

	Crow.StateHash.Idle = UnityEngine.Animator.StringToHash("Idle")
	Crow.StateHash.Move = UnityEngine.Animator.StringToHash("Move")
	Crow.StateHash.StartFly = UnityEngine.Animator.StringToHash("StartFly")
	Crow.StateHash.StartFlyLoop = UnityEngine.Animator.StringToHash("StartFlyLoop")
	Crow.StateHash.Empty = UnityEngine.Animator.StringToHash("Empty")
	self.tfSelf = tf
	self.tfSelf = self.tfSelf:Find("Bird")
	self.position = self.tfSelf.position
	self.rotation = self.tfSelf.rotation
	self.positionDelta = Vector3.zero
	self.rotationDelta = Quaternion.identity
	self.hidePosition = Vector3.New(0, -100, 0)
	self.animator = self.tfSelf:GetComponent("Animator")
	self.crowController = self.tfSelf:GetComponent("CrowController")

	self.crowController:SetAnimatorStateChangeFunc(Crow.ChangeAnimatorState)
	self.crowController:SetOnAnimatorMove(Crow.OnAnimatorMove)

	local tfLip = self.tfSelf:Find("lipsync")

	self.lipSync = nil
	self.eyeController = nil

	if tfLip ~= nil then
		self.lipSync = tfLip:GetComponent("RogoDigital.Lipsync.LipSync")
		self.eyeController = tfLip:GetComponent("RogoDigital.EyeController")
	end

	self.animator:SetBool("out", true)

	self.fixedPosition = Vector3.zero
	self.fixedRotation = Quaternion.identity
	self.targetHero = targetHero
	self.cameraCtrl = cameraCtrl
	self.modelName = "modelName"
	self.isAppear = false
	self.appearCallBack = nil
	self.disappearPos = Vector3.New(20, 20, 20)
	self.disappearRot = Quaternion.New(0, 0, 0, 0)
	self.disappearRotOffset = Quaternion.New(0, -0.908875200167, 0, 0.41706818449911)
	self.idlePosition = Vector3.forward
	self.idleRotation = Quaternion.New(1, 1, 1, 1)
	self.targetRotation = Quaternion.New(0, 0, 0, 0)

	self:ChangeState(Crow_Define.StateType.Disappear)
	self:ChangeMoveState(Crow_Define.MoveStateType.None)

	self.rotSpeed = Crow_Define.OriRotSpeed
	self.moveSpeed = Crow_Define.OriMoveSpeed
	self.reuseVecUp = Vector3.up
	self.reuseVecLook = Vector3.forward
	self.flyDir = Vector3.forward
	self.IdleChangeInterval = 300
end

function Crow:LateUpdate()
	if self.stateType == Crow_Define.StateType.Disappear or self.stateType == Crow_Define.StateType.InMeeting then
		return
	end

	if self.stateType == Crow_Define.StateType.Fixed then
		self.IdleChangeInterval = self.IdleChangeInterval - 1 * self:GetSpeedRate()

		if self.IdleChangeInterval < 1 then
			local random = MathHelper.getRandom(1, 4)

			self.animator:SetInteger("RandomIdle", random)

			self.IdleChangeInterval = 300
		end

		return
	end

	if self.stateType == Crow_Define.StateType.ComeIn then
		self:CalcIdlePositionAndRotation()

		local dis = Vector3.Distance(self.position, self.idlePosition)

		if dis > Crow_Define.AppearDistance then
			self.animator:SetBool("outOfRange", true)
		else
			self.animator:SetBool("outOfRange", false)
		end
	elseif self.stateType == Crow_Define.StateType.Out then
		-- block empty
	elseif self.stateType == Crow_Define.StateType.Move then
		self:CalcIdlePositionAndRotation()

		local dis = Vector3.Distance(self.position, self.idlePosition)

		if self.moveStateType == Crow_Define.MoveStateType.Idle then
			if Quaternion.Angle(self.rotation, self.idleRotation) > Crow_Define.IdleRotThresholdAngle then
				local tmpRot = Quaternion.Lerp(self.rotation, self.idleRotation, self.rotSpeed)

				self:SetRotation(tmpRot)

				tmpRot = nil
				self.rotSpeed = self.rotSpeed + 0.0004 * self:GetSpeedRate()
				self.rotSpeed = Mathf.Clamp(self.rotSpeed, 0.002, 0.08 * self:GetSpeedRate())
			else
				self.rotSpeed = Crow_Define.OriRotSpeed * self:GetSpeedRate()
			end

			if dis > Crow_Define.ArriveDistance then
				self.animator:SetBool("fly", true)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.StartFly then
			if dis < Crow_Define.ReachDistance then
				self:ChangeMoveState(Crow_Define.MoveStateType.StopFly)

				return
			end

			if Quaternion.Angle(self.targetRotation, self.idleRotation) > Crow_Define.RotThresholdAngle and dis < Crow_Define.ArriveDistance - 0.5 then
				self.animator:SetBool("startFly", false)
			end

			if dis > 5 then
				self:ChangeMoveState(Crow_Define.MoveStateType.Fly)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.StartFlyLoop then
			if dis < Crow_Define.ReachDistance then
				self:ChangeMoveState(Crow_Define.MoveStateType.StopFly)

				return
			end

			if Quaternion.Angle(self.targetRotation, self.idleRotation) > Crow_Define.RotThresholdAngle and dis < Crow_Define.ArriveDistance - 0.5 then
				self.animator:SetBool("startFly", false)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.StopFly then
			local p = Mathf.Clamp((dis - Crow_Define.ArriveDistance) / 5, 1, 4) * 10
			local tmpPos = Vector3.Lerp(self.position, self.idlePosition, Crow_Define.OriMoveSpeed * p * self:GetSpeedRate())

			self:SetPosition(tmpPos)
			self.animator:SetFloat("turn", self:CalcTurn() * 10, 0, 0)

			if dis > Crow_Define.ArriveDistance + 1 then
				self:ChangeMoveState(Crow_Define.MoveStateType.StartFly)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.Fly then
			self.flyDir:Set(self.idlePosition.x - self.position.x, Mathf.Clamp(self.idlePosition.y - self.position.y, -dis / 4, dis / 4), self.idlePosition.z - self.position.z)

			local moveRotNew = Quaternion.LookRotation(self.flyDir)
			local tmpRot

			if dis - Crow_Define.ArriveDistance < 1 and Quaternion.Angle(self.rotation, self.idleRotation) > Crow_Define.StopThresholdAngle then
				self:ChangeMoveState(Crow_Define.MoveStateType.StopFly)

				return
			end

			tmpRot = Quaternion.Lerp(self.rotation, moveRotNew, Crow_Define.OriRotSpeed * 50 * self:GetSpeedRate())

			self.animator:SetFloat("turn", self:CalcTurn() * 5, 0, 0)
			self:SetRotation(tmpRot)

			tmpRot = nil
			moveRotNew = nil

			local p = Mathf.Clamp((dis - Crow_Define.ArriveDistance) / 5, 1, 4) * 10
			local tmpPos = Vector3.Lerp(self.position, self.idlePosition, Crow_Define.OriMoveSpeed * p * self:GetSpeedRate())

			self:SetPosition(tmpPos)

			tmpPos = nil

			if dis < Crow_Define.ReachDistance + 0.1 then
				self:ChangeMoveState(Crow_Define.MoveStateType.StopFly)
			end
		end
	end

	self:RefreshTransform()
end

function Crow:IsAppear()
	return self.isAppear
end

function Crow:SetPosition(pos)
	self.position:SetFixed(false)
	self.position:SetVector3(pos)
	self.position:SetFixed(true)
end

function Crow:SetRotation(quat)
	self.rotation:SetFixed(false)
	self.rotation:SetQuaternion(quat)
	self.rotation:SetFixed(true)
end

function Crow:RefreshTransform()
	self.tfSelf:SetPositionAndRotation(self.position, self.rotation)
end

function Crow:ChangeAnimatorStateSelf(namehash)
	if self.stateType == Crow_Define.StateType.ComeIn then
		if namehash == Crow.StateHash.Idle then
			self:ChangeState(Crow_Define.StateType.Move)
			self.appearCallBack()

			self.appearCallBack = nil
		elseif namehash == Crow.StateHash.Move then
			self:ChangeState(Crow_Define.StateType.Move)
			self:ChangeMoveState(Crow_Define.MoveStateType.Fly)
			self.appearCallBack()

			self.appearCallBack = nil
		end
	elseif self.stateType == Crow_Define.StateType.Out then
		if namehash == Crow.StateHash.Empty then
			self:ChangeState(Crow_Define.StateType.Disappear)
		end
	elseif self.stateType == Crow_Define.StateType.Move then
		if self.moveStateType == Crow_Define.MoveStateType.Idle then
			if namehash == Crow.StateHash.StartFly then
				self:ChangeMoveState(Crow_Define.MoveStateType.StartFly)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.StartFly then
			if namehash == Crow.StateHash.StartFlyLoop then
				self:ChangeMoveState(Crow_Define.MoveStateType.StartFlyLoop)
			elseif namehash == Crow.StateHash.Move then
				self:ChangeMoveState(Crow_Define.MoveStateType.Fly)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.StartFlyLoop then
			if namehash == Crow.StateHash.StartFly then
				self:ChangeMoveState(Crow_Define.MoveStateType.StartFly)
			elseif namehash == Crow.StateHash.Move then
				self:ChangeMoveState(Crow_Define.MoveStateType.Fly)
			end
		elseif self.moveStateType == Crow_Define.MoveStateType.StopFly and namehash == Crow.StateHash.Idle then
			self:ChangeMoveState(Crow_Define.MoveStateType.Idle)
		end
	elseif self.stateType == Crow_Define.StateType.Disappear then
		if namehash == Crow.StateHash.Empty then
			self.tfSelf.gameObject:SetActive(false)
		end
	elseif self.stateType == Crow_Define.StateType.Animator and namehash == Crow.StateHash.Empty then
		if self.lastStateType ~= nil then
			self:ChangeState(self.lastStateType)
		end

		if self.animatorFinishCallback ~= nil then
			self.animatorFinishCallback()
		end
	end
end

function Crow:OnAnimatorMoveSelf(vec3_x, vec3_y, vec3_z, quat_x, quat_y, quat_z, quat_w)
	self.positionDelta:Set(vec3_x, vec3_y, vec3_z)
	self.rotationDelta:Set(quat_x, quat_y, quat_z, quat_w)
	self.position:SetFixed(false)
	self.position:Add(self.positionDelta)
	self.position:SetFixed(true)
	self.rotation:SetFixed(false)
	self.rotation:MulQuat(self.rotationDelta)
	self.rotation:SetFixed(true)
end

function Crow.ChangeAnimatorState(namehash)
	local sceneController = ST_Main.GetSceneController()

	if sceneController == nil then
		return
	end

	local cr = sceneController:GetCrow()

	if cr == nil then
		return
	end

	cr:ChangeAnimatorStateSelf(namehash)
end

function Crow.OnAnimatorMove(vec3_x, vec3_y, vec3_z, quat_x, quat_y, quat_z, quat_w)
	local sceneController = ST_Main.GetSceneController()

	if sceneController == nil then
		return
	end

	local cr = sceneController:GetCrow()

	if cr == nil then
		return
	end

	cr:OnAnimatorMoveSelf(vec3_x, vec3_y, vec3_z, quat_x, quat_y, quat_z, quat_w)
end

function Crow:GetTransform()
	return self.tfSelf
end

function Crow:StartMeeting(pos, quat, animatorType)
	if self.stateType == Crow_Define.StateType.InMeeting then
		return
	end

	if self.stateType == Crow_Define.StateType.Fixed then
		self:PlayAnimation(Crow_Define.AnimationName.Dialogue)

		return
	end

	if pos == nil or quat == nil then
		self:ChangeState(Crow_Define.StateType.Disappear)
	else
		self:ChangeState(Crow_Define.StateType.InMeeting)

		if animatorType and animatorType == Crow_Define.MeetingAnimatorType.Carriage then
			self:PlayAnimation(Crow_Define.AnimationName.Carriage)
			AudioCtrl.SetUIAudio("call_wagon")
		else
			self:PlayAnimation(Crow_Define.AnimationName.Idle)
		end

		self:SetPosition(pos)
		self:SetRotation(quat)
		self:RefreshTransform()
	end
end

function Crow:QuitMeeting()
	if self.stateType == Crow_Define.StateType.Fixed then
		self:PlayAnimation(Crow_Define.AnimationName.FixedIdle)

		return
	end

	self:ChangeState(Crow_Define.StateType.Disappear)
end

function Crow:PlayAnimation(name)
	self.animator:Rebind()
	self.animator:Play(name, 0, 0)
end

function Crow:PlayLipSyn(id, fmodInstance)
	local lipData = DialogueManager.GetLip(id)

	if lipData ~= nil and self.lipSync ~= nil and fmodInstance ~= nil then
		self.lipSync:Play(lipData, fmodInstance)
	end
end

function Crow:StartFixed(pos, quat)
	self:ChangeState(Crow_Define.StateType.Fixed)
	self.fixedPosition:Set(pos.x, pos.y, pos.z)
	self.fixedRotation:Set(quat.x, quat.y, quat.z, quat.w)
	self:SetPosition(pos)
	self:SetRotation(quat)
	self:RefreshTransform()
end

function Crow:QuitFixed()
	self:ChangeState(Crow_Define.StateType.Disappear)
end

function Crow:ChangeToTimeLine(transition)
	self:ChangeState(Crow_Define.StateType.TimeLine)
end

function Crow:StartAnimator(oriPos, oriRot, aniName, callback)
	if self.stateType == Crow_Define.StateType.Animator then
		return
	end

	self.lastStateType = self.stateType
	self.animatorFinishCallback = callback

	self:ChangeState(Crow_Define.StateType.Animator)
	self:SetPosition(oriPos)
	self:SetRotation(oriRot)
	self:RefreshTransform()
	self:PlayAnimation(aniName)
	self.crowController:RebindMachineBehaviour()
end

function Crow:StartCameraCenterBasedAnimator(aniName, callback)
	local forward = self.cameraCtrl:GetCameraRealForward():Clone()

	forward:SetNormalize()

	local pos = self.cameraCtrl:GetCameraLogicPosition():Clone()

	pos:Add(forward:Mul(Crow_Define.CameraFrontDistance))

	local rot = self.cameraCtrl:GetCameraRotation()

	self:StartAnimator(pos, rot, aniName, callback)

	forward = nil
	pos = nil
	rot = nil
end

function Crow:StartFixedPointBasedAnimator(aniName, callback)
	self:QuitFixed()
	self:StartAnimator(self.fixedPosition, self.fixedRotation, aniName, callback)
end

function Crow:ExitTimeLine()
	self:ChangeState(Crow_Define.StateType.Disappear)
end

function Crow:GetModelName()
	return self.modelName
end

function Crow:StopLipSyn(bool)
	return false
end

function Crow:Appear(targetHero, cb)
	if self.stateType == Crow_Define.StateType.Disappear then
		self.targetHero = targetHero

		self:ChangeState(Crow_Define.StateType.ComeIn)

		self.appearCallBack = cb
	end
end

function Crow:Disappear()
	if self.stateType == Crow_Define.StateType.Out or self.stateType == Crow_Define.StateType.Disappear or DebugCrowAlwaysFly or self.stateType == Crow_Define.StateType.Fixed then
		return
	end

	self:ChangeState(Crow_Define.StateType.Out)
end

function Crow:Reset()
	if self.stateType == Crow_Define.StateType.Fixed then
		return
	end

	self:ChangeState(Crow_Define.StateType.Disappear)
end

function Crow:IsComingIn()
	return self.stateType == Crow_Define.StateType.ComeIn
end

function Crow:ChangeMoveState(movestatetype)
	if self.moveStateType ~= movestatetype then
		self.moveStateType = movestatetype

		if movestatetype == Crow_Define.MoveStateType.Idle then
			self.animator:SetBool("fly", false)
		elseif movestatetype == Crow_Define.MoveStateType.StartFly then
			self.animator:SetBool("fly", true)
			self.animator:SetBool("startFly", true)
			self.animator:SetFloat("turn", self:CalcTurn(), 0, 0)
		elseif movestatetype == Crow_Define.MoveStateType.StartFlyLoop then
			self.animator:SetBool("fly", true)
			self.animator:SetBool("startFly", true)
			self.animator:SetFloat("turn", self:CalcTurn(), 0, 0)
		elseif movestatetype == Crow_Define.MoveStateType.StopFly then
			self.animator:SetBool("fly", false)
			self.animator:SetBool("startFly", false)
			self.animator:SetFloat("turn", self:CalcTurn(), 0, 0)
		elseif movestatetype == Crow_Define.MoveStateType.Fly then
			self.animator:SetBool("fly", true)
			self.animator:SetFloat("vertical", 0.9, 0, 0)

			self.rotSpeed = Crow_Define.OriRotSpeed
			self.moveSpeed = Crow_Define.OriMoveSpeed * 5
		end
	end
end

function Crow:ChangeState(statetype)
	if self.stateType ~= statetype then
		self.stateType = statetype

		if statetype == Crow_Define.StateType.Out then
			self.tfSelf.gameObject:SetActive(true)

			self.isAppear = false

			self.animator:SetBool("out", true)
		elseif statetype == Crow_Define.StateType.Disappear then
			self.tfSelf.gameObject:SetActive(true)

			self.isAppear = false

			self:SetPosition(self.hidePosition)
			self:SetRotation(self.disappearRot)
			self:PlayAnimation(Crow_Define.AnimationName.Empty)
			self.animator:SetBool("out", true)
			self.crowController:SetUpdateAnimatorMove(false)
			self:RefreshTransform()
		elseif statetype == Crow_Define.StateType.ComeIn then
			self.tfSelf.gameObject:SetActive(true)
			self.crowController:SetUpdateAnimatorMove(true)
			self.crowController:RebindMachineBehaviour()
			self:CalcDisappearPositionAndRotation()
			self:SetPosition(self.disappearPos)
			self:SetRotation(self.disappearRot)
			self.animator:SetBool("out", false)
		elseif statetype == Crow_Define.StateType.Move then
			self.tfSelf.gameObject:SetActive(true)
			self.crowController:SetUpdateAnimatorMove(true)

			self.isAppear = true

			self:ChangeMoveState(Crow_Define.MoveStateType.Idle)
		elseif statetype == Crow_Define.StateType.InMeeting then
			self.tfSelf.gameObject:SetActive(true)
			self.crowController:SetUpdateAnimatorMove(false)
			self.animator:SetBool("out", false)
			self.animator:SetBool("fly", false)
			self.animator:SetBool("startFly", false)
		elseif statetype == Crow_Define.StateType.Fixed then
			self.tfSelf.gameObject:SetActive(true)
			self.crowController:SetUpdateAnimatorMove(false)
			self.animator:SetBool("out", false)
			self.animator:SetBool("fly", false)
			self.animator:SetBool("startFly", false)
		elseif statetype == Crow_Define.StateType.TimeLine then
			self.tfSelf.gameObject:SetActive(true)
			self.crowController:SetUpdateAnimatorMove(true)
			self.animator:SetBool("out", false)
			self.animator:SetBool("fly", false)
			self.animator:SetBool("startFly", false)
		elseif statetype == Crow_Define.StateType.Animator then
			self.tfSelf.gameObject:SetActive(true)
			self.crowController:SetUpdateAnimatorMove(true)
			self.animator:SetBool("out", false)
			self.animator:SetBool("fly", false)
			self.animator:SetBool("startFly", false)
		end
	end
end

function Crow:GetSpeedRate()
	local fps = LS_Setting.FrameRate[LS_Setting.graphics.framerate]

	if fps == -1 then
		fps = 120
	end

	return 60 / fps
end

function Crow:CalcTurn()
	local ret

	self.reuseVecLook:Set(0, 0, 1)
	self.reuseVecLook:MulQuat(self.rotation)

	self.reuseVecLook.y = 0

	self.reuseVecLook:SetNormalize()

	local selfDegree = Mathf.Atan2(self.reuseVecLook.x, self.reuseVecLook.z)

	self.targetRotation:SetQuaternion(self.idleRotation)
	self.reuseVecLook:Set(0, 0, 1)
	self.reuseVecLook:MulQuat(self.idleRotation)

	self.reuseVecLook.y = 0

	self.reuseVecLook:SetNormalize()

	local newDegree = Mathf.Atan2(self.reuseVecLook.x, self.reuseVecLook.z)
	local delta = newDegree - selfDegree

	delta = MathHelper.getAngleHalf(delta * 180 / math.pi)

	if delta >= 0 then
		ret = Easing.Quadratic.easeInOut(delta / 180)
	else
		ret = -Easing.Quadratic.easeInOut(delta / 180)
	end

	delta = nil

	return ret
end

function Crow:CalcIdlePositionAndRotation()
	self.reuseVecLook:Set(0, 0, 1)
	self.reuseVecUp:Set(0, 1, 0)
	self.reuseVecLook:MulQuat(self.targetHero:GetRotation())

	local heroLeft = Vector3.Cross(self.reuseVecLook, self.reuseVecUp)

	self.reuseVecLook:SetNormalize()
	heroLeft:SetNormalize()
	self.idlePosition:SetVector3(self.targetHero:GetGravityCenterPosition())
	self.idlePosition:Add(self.reuseVecLook:Mul(0.4)):Add(heroLeft:Mul(0.4):Add(self.reuseVecUp:Mul(1)))
	self.idleRotation:SetQuaternion(self.targetHero:GetRotation())

	heroLeft = nil
end

function Crow:CalcDisappearPositionAndRotation()
	local camForward = self.cameraCtrl:GetCameraRealForward()

	self.reuseVecLook:Set(camForward.x, camForward.y, camForward.z)
	self.reuseVecUp:Set(0, 1, 0)

	if MathHelper.IsZero(self.reuseVecLook.x) and MathHelper.IsZero(self.reuseVecLook.z) then
		self.reuseVecLook:SetVector3(self.targetHero:GetForward())
	end

	self.reuseVecLook.y = 0

	self.reuseVecLook:SetNormalize()

	local left = Vector3.Cross(self.reuseVecLook, self.reuseVecUp)

	left:SetNormalize()
	self.disappearPos:SetVector3(self.targetHero:GetGravityCenterPosition())
	self.disappearPos:Add(self.reuseVecLook:Mul(4.5)):Add(self.reuseVecUp:Mul(3.23)):Add(left:Mul(-5.1))
	self.disappearRot:SetQuaternion(self.targetHero:GetRotation())
	self.disappearRot:MulQuat(self.disappearRotOffset)

	left = nil
end

function Crow:Exit()
	self.crowController:SetUpdateAnimatorMove(false)

	self.crowController = nil
	self.lipSync = nil
	self.eyeController = nil
	self.tfSelf = nil
	self.positionDelta = nil
	self.rotationDelta = nil
	self.position = nil
	self.rotation = nil
	self.fixedPosition = nil
	self.fixedRotation = nil
	self.hidePosition = nil
	self.animator = nil
	self.targetHero = nil
	self.cameraCtrl = nil
	self.modelName = nil
	self.isAppear = nil
	self.appearCallBack = nil
	self.disappearPos = nil
	self.disappearRot = nil
	self.disappearRotOffset = nil
	self.idlePosition = nil
	self.idleRotation = nil
	self.targetRotation = nil
	self.reuseVecUp = nil
	self.reuseVecLook = nil
	self.flyDir = nil
end

return Crow
