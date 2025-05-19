-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Camera/CameraMain.lua

require("LuaScript/Logic/Camera/CameraBase")

CameraMain = class("CameraMain", CameraBase)
CameraMain.static.CameraFieldOfView = 55
CameraMain.static.CameraDistance = 3
CameraMain.static.CameraCarriageDistance = 1.5
CameraMain.static.CameraVerticaleAngle = 15
CameraMain.static.CameraLockTargetDisMin = 1
CameraMain.static.CameraLockTargetDisMax = 5
CameraMain.static.CameraLockSlopeDisMin = -2
CameraMain.static.CameraLockSlopeDisMax = 2
CameraMain.static.CameraLockTargetAngleMin = -90
CameraMain.static.CameraLockTargetAngleMax = 90
CameraMain.static.CameraFollowHeightMin = -1
CameraMain.static.CameraFollowHeightMax = 3
CameraMain.static.CameraFollowLookRatio = 0.1
CameraMain.static.StoryEnterRot = Quaternion.Euler(0, 300, 0)
CameraMain.static.StoryEnterTargetPos = Vector3.New(-43.58, 45.56, -162.1)
CameraMain.static.CameraAimEnterTime = 0.1
CameraMain.static.CameraDeadTime = 5
CameraMain.static.CameraAimToPivotDis = 0.5
CameraMain.static.CameraAimToLookAtDis = 10
CameraMain.static.CameraSmoothRouteFastSpeed = 10
CameraMain.static.CameraSmoothRouteSlowSpeed = 5
CameraMain.static.CameraSmoothRouteRotateSpeed = 10
CameraMain.static.CameraStairRotateSpeed = 5
CameraMain.static.CameraSmoothTimeMax = 1
CameraMain.static.CameraSmoothTimeMaxForTimeLine = 3
CameraMain.static.CameraSmoothTimeLineSpeed = 0.8
CameraMain.static.CameraSmoothStoryEnterSpeed = 40
CameraMain.static.DeadMonsterCenterY = 0.3
CameraMain.static.DeadMonsterCameraDis = 2
CameraMain.static.DeadMonsterCameraDisFar = 3
CameraMain.static.DeadMonsterCameraHeight = 0.5
CameraMain.static.DeadMonsterCameraHeightFar = 1.2
CameraMain.static.DeadMonsterSmoothTimeMin = 1
CameraMain.static.DeadMonsterSmoothTimeMax = 3
CameraMain.static.DeadMonsterSmoothTimeByDisMin = 1
CameraMain.static.DeadMonsterSmoothTimeByDisMax = 2
CameraMain.static.DeadMonsterSmoothTime2 = 3
CameraMain.static.ModeType = {
	Default = 0,
	Following = 1,
	Menu = 3,
	Dialog = 2
}
CameraMain.static.FollowingBaseMax = 2
CameraMain.static.FollowingType = {
	Meeting = 7,
	Stair = 4,
	StairExit = 5,
	Dead = 6,
	TimeLineMove = 8,
	TimeLine = 9,
	DeadMonster = 11,
	Aim = 2,
	StairEnter = 3,
	StoryEnterMove = 10,
	AimEnter = 1,
	Normal = 0
}
CameraMain.static.CameraLayerMask = {
	LayerDefault,
	LayerWater,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerEffect1,
	LayerEffect2,
	LayerEffectLight,
	LayerAnimal,
	LayerHost,
	LayerDefaultNoShadow
}
CameraMain.static.CameraLayerMaskMovie = {
	LayerDefault,
	LayerWater,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerEffect1,
	LayerEffect2,
	LayerEffectLight,
	LayerMovie,
	LayerDefaultNoShadow
}

function CameraMain:initialize(tf_cameraVirtual, tf_cameraRoot)
	CameraBase.initialize(self, tf_cameraVirtual, tf_cameraRoot)

	if self.tfSelf ~= nil then
		self.tfSelf.tag = "MainCamera"
	end

	self.storyId = 0
	self.areaId = 0
	self.pattern = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.storyId = FS_UserData.story:GetStoryId()
		self.areaId = FS_UserData.story:GetAreaId()
		self.pattern = FS_UserData.story:GetPattern()
	end

	self:SetLayerMask(CameraMain.CameraLayerMask)

	if self.brownianMotion ~= nil then
		if MS_StoryList.IsStoryCarriage(self.storyId) == true then
			self.brownianMotion.rotationFrequency = 1
			self.brownianMotion.rotationAmplitude = 0.8
		else
			self.brownianMotion.rotationFrequency = 0.2
			self.brownianMotion.rotationAmplitude = 2
		end
	end

	self:UpdateFollowingBaseBySetting()
	self:SetMode(CameraMain.ModeType.Following)

	self.following = self.followingBase
	self.followingTime = 0
	self.followingPlayer = nil
	self.skillingPlayer = nil
	self.skillingPlayerLock = false
	self.skillingPlayerForce = nil
	self.lookPlayerPos = Vector3.zero
	self.lookPlayerPosOld = Vector3.zero
	self.lockPlayerPos = Vector3.zero
	self.cameraLookAtToPos = Vector3.forward
	self.cameraLookAtToPosOld = Vector3.forward
	self.cameraUseSmooth = true
	self.cameraRotateView = false
	self.cameraRotateVerticalAngle = 0
	self.cameraRotateVerticalAngleOld = 0
	self.cameraRotateZ = 0
	self.cameraStoryDistanceRate = 1

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		local storyData = MS_StoryList.GetStoryData(self.storyId)

		self.cameraStoryDistanceRate = storyData:GetCameraDistanceRate()
	end

	self.cameraAimLookAtToPos = Vector3.forward
	self.cameraAimLookAtToPosOld = Vector3.forward
	self.cameraAimLookAtToPivotOld = Vector3.forward
	self.cameraAimColliderCheck = false
	self.cameraAimColliderToPivotDistance = CameraMain.CameraAimToPivotDis
	self.cameraPosSave = Vector3.zero
	self.cameraLookAtSave = Vector3.zero
	self.cameraSmoothTime = 0
	self.cameraEffect = nil
	self.bossMode = false
	self.bossId = 0
	self.bossCameraDistanceSkill = 0
	self.deadMonsterSmoothTime = 1
	self.deadMonsterPosOld = Vector3.zero
	self.deadMonsterRotOld = Quaternion.identity
	self.deadMonsterStep = 0
	self.deadMonsterStepTime = 0
end

function CameraMain:SetLayerMask(layerMask)
	if self.camera ~= nil then
		self.camera.cullingMask = Common.GetOneBitLeftMove(layerMask)
	end
end

function CameraMain:UpdateFollowingBaseBySetting()
	self.followingBase = CameraMain.FollowingType.Normal
	self.following = self.followingBase
end

function CameraMain:StartSmooth(smoothTime)
	if smoothTime > 0 then
		self.cameraSmoothTime = smoothTime
	else
		self.cameraSmoothTime = CameraMain.CameraSmoothTimeMax
	end
end

function CameraMain:IsSmoothing()
	return self.cameraSmoothTime > 0
end

function CameraMain:EndSmooth()
	self.cameraSmoothTime = 0
end

function CameraMain:UseSmooth(posNew, lookAtNew, originPos, originPosOld, smoothRot, smoothHeight)
	local deltaTime = ControllerMain.GetLogicDeltaTime()
	local disSpeed = deltaTime * CameraMain.CameraSmoothRouteFastSpeed
	local rotSpeed = deltaTime * CameraMain.CameraSmoothRouteRotateSpeed

	if self.cameraSmoothTime > 0 then
		self.cameraSmoothTime = Mathf.Max(0, self.cameraSmoothTime - deltaTime)
	end

	posNew, lookAtNew = self:SmoothRotateCameraPosAndLookAtPos(posNew, lookAtNew, originPos, originPosOld, disSpeed, rotSpeed, smoothRot, smoothHeight)

	return posNew, lookAtNew
end

function CameraMain:SetEffectGray(flg)
	return
end

function CameraMain:UpdateQuality(force)
	CameraBase.UpdateQuality(self, force)

	local layerDis = {}
	local layerMax = 32

	for i = 0, layerMax - 1 do
		layerDis[i] = 0
	end

	local disRatio = 1

	if Platform == PlatformType.MAC or Platform == PlatformType.PC then
		disRatio = 2
	end

	if LS_Setting.graphics.antialiasing > 1 then
		Common.SetCameraDepthAndMSAA(self.camera, true, true, false)
	else
		Common.SetCameraDepthAndMSAA(self.camera, false, true, false)
	end

	Common.EnableShaderKeyword("WATER_EDGEBLEND_ON")
	Common.DisableShaderKeyword("WATER_EDGEBLEND_OFF")

	if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.High then
		if MS_StoryList.IsStoryCarriage(self.storyId) == false and self.cameraEffect == nil then
			local lookPlayer = self:GetLookPlayer()

			if lookPlayer ~= nil then
				self.cameraEffect = VfxManager.PlayBind(lookPlayer:GetTransform(), "vfx_common_scenes")
			end
		end

		layerDis[LayerItem1] = 25 * disRatio
		layerDis[LayerItem2] = 40 * disRatio
		layerDis[LayerItem3] = 80 * disRatio
		layerDis[LayerEffect1] = 25 * disRatio
		layerDis[LayerEffect2] = 80 * disRatio
		layerDis[LayerEffectLight] = 25 * disRatio
		layerDis[LayerEffectMovie] = 500 * disRatio
		layerDis[LayerAnimal] = 40 * disRatio
	else
		if self.cameraEffect ~= nil then
			self.cameraEffect:Clear()

			self.cameraEffect = nil
		end

		layerDis[LayerItem1] = 18 * disRatio
		layerDis[LayerItem2] = 26 * disRatio

		if self.storyId == MS_StoryData.StoryId10012 then
			if self.areaId == 4 then
				layerDis[LayerItem3] = 70 * disRatio
			else
				layerDis[LayerItem3] = 50 * disRatio
			end
		else
			layerDis[LayerItem3] = 50 * disRatio
		end

		layerDis[LayerEffect1] = 18 * disRatio
		layerDis[LayerEffect2] = 50 * disRatio
		layerDis[LayerEffectLight] = 18 * disRatio
		layerDis[LayerEffectMovie] = 500 * disRatio
		layerDis[LayerAnimal] = 40 * disRatio
	end

	Common.SetCameraLayerCullDistance(self.camera, layerDis)
	self:SetFog(LS_Setting.graphics.quality)
end

function CameraMain:SetHostPlayer(host, reset)
	CameraBase.SetHostPlayer(self, host)
	self:UpdateQuality(false)
	self:ChangeSubPlayer(nil, reset)
end

function CameraMain:ChangeSubPlayer(subPlayer, reset)
	if subPlayer ~= nil then
		self:SwitchHostToSub(true)
	else
		self:SwitchHostToSub(false)
	end

	self:SetSubPlayer(subPlayer)

	if self:IsMode(CameraMain.ModeType.Following) then
		if self.following == CameraMain.FollowingType.TimeLine then
			self:ResetCameraPositionAndLookAt()
		elseif reset == true then
			self:ResetFollowingBase()
		else
			self:ReturnFollowingBase(true, false, CameraMain.CameraSmoothTimeMax)
		end
	end

	local lookPlayer = self:GetLookPlayer()

	if self.cameraEffect ~= nil then
		self.cameraEffect:SwitchHost(lookPlayer:GetTransform())
		self.cameraEffect:SetRotation(0, 0, 0, 1)
	end
end

function CameraMain:SelectSubPlayer()
	local friendList = self.sceneController:GetTeamList(self.hostPlayer:GetTeamId())
	local selectList = {}

	for i, tmpPlayer in pairs(friendList) do
		if self.hostPlayer ~= tmpPlayer and tmpPlayer:IsDead() == false and tmpPlayer:IsShow() == true then
			table.insert(selectList, tmpPlayer)
		end
	end

	if #selectList > 0 then
		local rnd = MathHelper.getRandom(1, #selectList)

		return selectList[rnd]
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		local homeBase = self.sceneController:GetHomeBase()

		if homeBase:IsDead() == false then
			return homeBase
		end
	end

	local enemyList = self.sceneController:GetEnemyList(self.hostPlayer:GetTeamId())

	for i, tmpPlayer in pairs(enemyList) do
		if tmpPlayer:IsDead() == false then
			table.insert(selectList, tmpPlayer)
		end
	end

	if #selectList > 0 then
		local rnd = MathHelper.getRandom(1, #selectList)

		return selectList[rnd]
	end

	return nil
end

function CameraMain:IsMode(m_type)
	if self.mode == m_type then
		return true
	end

	return false
end

function CameraMain:SetMode(m_type)
	if m_type ~= self.mode then
		local modeOld = self.mode

		self.mode = m_type

		if modeOld == CameraMain.ModeType.Menu and self.mode == CameraMain.ModeType.Following then
			self:ResetFollowingBase()
		end

		if self.mode == CameraMain.ModeType.Following then
			self:SetFollowingType(self.followingBase)
			self:SetMoving(false)
		elseif self.mode == CameraMain.ModeType.Dialog then
			self:SetMoving(false)
		elseif self.mode == CameraMain.ModeType.Menu then
			self:SetMoving(false)
		end
	end
end

function CameraMain:SetBossMode(flg, bossId)
	self.bossMode = flg
	self.bossId = bossId
end

function CameraMain:SetBossCameraDistanceSkill(dis)
	self.bossCameraDistanceSkill = dis
end

function CameraMain:GetCameraDistance(lookPlayer)
	local disBase = CameraMain.CameraDistance
	local ret = disBase
	local disRate = lookPlayer:GetCameraDistanceRate()

	if DebugAdjustCameraLock == true then
		disRate = DebugParam5
	end

	if self.bossMode == true and self.bossId > 0 then
		ret = Mathf.Max(ret, disBase * disRate)

		local boss = self.sceneController:FindPlayerByStoryMonsterId(self.bossId)

		if boss ~= nil then
			local heroData = MS_HeroData.GetHero(boss:GetHeroId())
			local bossPos = boss:GetPosByWorldPos()
			local lookPos = lookPlayer:GetPosByWorldPos()
			local tmpDis = Vector3.Distance(bossPos, lookPos)
			local camDisMin = heroData.CameraDistanceMin
			local camDisMax = heroData.CameraDistanceMax
			local camRateMin = heroData.CameraDistanceRateMin
			local camRateMax = heroData.CameraDistanceRateMax
			local camIpadRate = heroData.CameraDistanceIpadRate

			if DebugAdjustCameraLock == true then
				camDisMin = DebugParam6
				camDisMax = DebugParam7
				camRateMin = DebugParam8
				camRateMax = DebugParam9
			end

			disRate = MathHelper.getValueInRadioRange(tmpDis, camDisMin, camDisMax, camRateMin, camRateMax)

			if self.isPad == true then
				disRate = disRate * camIpadRate
			end

			ret = disBase * disRate
		end
	else
		ret = Mathf.Max(ret, disBase * disRate)
	end

	return ret
end

function CameraMain:IsFollowingType(m_type)
	if m_type == self.following then
		return true
	end

	return false
end

function CameraMain:SetFollowingType(m_type)
	if m_type ~= self.following then
		local oldType = self.following

		self.following = m_type
		self.followingTime = TimeHelper.getNowTime()

		if oldType == CameraMain.FollowingType.Normal or oldType == CameraMain.FollowingType.Stair then
			self:RotateFollowCameraEnd()
		end

		if self.following == CameraMain.FollowingType.AimEnter then
			self.cameraAimColliderCheck = true
			self.cameraAimColliderToPivotDistance = CameraMain.CameraAimToPivotDis

			self.cameraPosSave:SetVector3(self:GetCameraLogicPosition())
			self.cameraLookAtSave:SetVector3(self:GetCameraLookAt())
			self:PauseBrownianMotion(true)
		elseif self.following == CameraMain.FollowingType.StairEnter or self.following == CameraMain.FollowingType.StairExit then
			local lookPlayer = self:GetLookPlayer()

			self:SetCameraRotateVerticalAngle(CameraMain.CameraVerticaleAngle)
			self.cameraLookAtToPos:SetVector3(lookPlayer:GetBack())
		elseif self.following == CameraMain.FollowingType.Dead or self.following == CameraMain.FollowingType.DeadMonster then
			self:UseCameraPosCollider()
		elseif self.following == CameraMain.FollowingType.TimeLine or self.following == CameraMain.FollowingType.TimeLineMove then
			self:PauseBrownianMotion(true)
		elseif self.following == CameraMain.FollowingType.StoryEnterMove then
			self:PauseBrownianMotion(true)
		elseif self.following == self.followingBase then
			self:PauseBrownianMotion(false)
		end

		return true
	end

	return false
end

function CameraMain:SetCameraRotateVerticalAngle(angle)
	self.cameraRotateVerticalAngle = Mathf.Clamp(angle, -40, 70)
end

function CameraMain:GetDeadMonsterStep()
	return self.deadMonsterStep
end

function CameraMain:SetDeadMonsterPos(pos, dis, height)
	local cameraPos = self:GetCameraLogicPosition()

	self.deadMonsterPosOld:SetVector3(cameraPos)
	self.deadMonsterRotOld:SetQuaternion(self:GetCameraRotation())

	local lookAtToPos = cameraPos - pos

	lookAtToPos.y = 0

	local smoothDis = lookAtToPos.magnitude

	lookAtToPos:SetNormalize()
	lookAtToPos:Mul(dis)

	local look = pos:Clone()

	look.y = look.y + CameraMain.DeadMonsterCenterY

	local cameraPos = pos:Clone()

	cameraPos:Add(lookAtToPos)

	cameraPos.y = look.y + height

	local dir = look - cameraPos
	local cameraRot = Quaternion.LookRotation(dir)

	self:SetCameraTargetPosAndRot(cameraPos, cameraRot)

	self.deadMonsterSmoothTime = MathHelper.getValueInRadioRange(smoothDis, CameraMain.DeadMonsterSmoothTimeByDisMin, CameraMain.DeadMonsterSmoothTimeByDisMax, CameraMain.DeadMonsterSmoothTimeMin, CameraMain.DeadMonsterSmoothTimeMax)
	self.deadMonsterStep = 0
	self.deadMonsterStepTime = TimeHelper.getNowTime()
	dir = nil
	look = nil
	cameraRot = nil
	lookAtToPos = nil
end

function CameraMain:ResetCameraPositionAndLookAt()
	local lookPlayer = self:GetLookPlayer()

	self.cameraLookAtToPos:SetVector3(lookPlayer:GetBack())
	self:SetCameraRotateVerticalAngle(CameraMain.CameraVerticaleAngle)

	local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(false)

	self:SetCameraPosAndLookAtPos(cameraPos, look, useCollider, colliderCheckPoint, false)

	cameraPos = nil
	look = nil
	colliderCheckPoint = nil
end

function CameraMain:ResetFollowingBase()
	self:SetFollowingType(self.followingBase)
	self:RotateFollowCameraEnd()
	self:ResetCameraPositionAndLookAt()
end

function CameraMain:ApproachFollowingBase(force, smoothTime)
	if force == false and self.following == CameraMain.FollowingType.Dead then
		return
	end

	local ret = self:SetFollowingType(self.followingBase)

	if ret == true and smoothTime > 0 then
		self:RotateFollowCameraEnd()
		self:UpdateCameraFollowParam(self:GetCameraLogicPosition())
		self:StartSmooth(smoothTime)
	end
end

function CameraMain:ReturnFollowingBase(force, reset, smoothTime)
	if force == false and (self.following == CameraMain.FollowingType.Dead or self.following == CameraMain.FollowingType.DeadMonster) then
		return
	end

	local ret = self:SetFollowingType(self.followingBase)

	if reset == true then
		ret = self:IsFollowingBaseNow()
	end

	if ret == true and smoothTime > 0 then
		local lookPlayer = self:GetLookPlayer()

		self:SetCameraRotateVerticalAngle(CameraMain.CameraVerticaleAngle)
		self.cameraLookAtToPos:SetVector3(lookPlayer:GetBack())
		self:StartSmooth(smoothTime)
	end
end

function CameraMain:RotateFollowCameraBegin()
	if self.following ~= CameraMain.FollowingType.Normal and self.following ~= CameraMain.FollowingType.Stair then
		return
	end

	self.cameraLookAtToPosOld:SetVector3(self.cameraLookAtToPos)

	self.cameraRotateVerticalAngleOld = self.cameraRotateVerticalAngle
	self.cameraRotateView = true
end

function CameraMain:RotateFollowCameraEnd()
	self.cameraRotateView = false
end

function CameraMain:IsRotatingFollowCamera()
	return self.cameraRotateView
end

function CameraMain:RotateFollowCamera(angleHorizontal, angleVertical, rotInputType)
	if self.following ~= CameraMain.FollowingType.Normal and self.following ~= CameraMain.FollowingType.Stair then
		return
	end

	if self.cameraRotateView == false then
		return
	end

	if self:GetLockPlayer() ~= nil then
		return
	end

	local lookPlayer = self:GetLookPlayer()
	local rotate = Quaternion.Euler(0, angleHorizontal, 0)

	if rotInputType == ControllerMain.RotateInputType.Screen then
		self.cameraLookAtToPosOld.y = 0

		self.cameraLookAtToPosOld:SetNormalize()
		self.cameraLookAtToPos:SetVector3(self.cameraLookAtToPosOld)
		self:SetCameraRotateVerticalAngle(self.cameraRotateVerticalAngleOld)

		self.cameraUseSmooth = true
	else
		local lookPos = lookPlayer:GetPosByWorldPosLast()
		local tmpDir = self:GetCameraLogicPosition() - lookPos

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			tmpDir:SetNormalize()

			if Vector3.Angle(tmpDir, self.cameraLookAtToPos) > 1 then
				self.cameraUseSmooth = true
			else
				self.cameraUseSmooth = false
			end
		else
			self.cameraUseSmooth = false
		end

		tmpDir = nil
	end

	self.cameraLookAtToPos.y = 0

	self.cameraLookAtToPos:MulQuat(rotate)
	self.cameraLookAtToPos:SetNormalize()

	if self.following == CameraMain.FollowingType.Stair then
		local tmpAngle = Vector3.Angle(self.cameraLookAtToPos, lookPlayer:GetBack())

		if tmpAngle > 90 then
			local tmpRotate = Quaternion.Euler(0, 90, 0)
			local tmpDirLeft = Vector3.zero

			tmpDirLeft:SetVector3(lookPlayer:GetBack())
			tmpDirLeft:MulQuat(tmpRotate)

			tmpDirLeft.y = 0

			tmpDirLeft:SetNormalize()

			local tmpDot = Vector3.Dot(self.cameraLookAtToPos, tmpDirLeft)

			self.cameraLookAtToPos:SetVector3(tmpDirLeft)

			if tmpDot < 0 then
				self.cameraLookAtToPos:Unm()
			end

			tmpDirLeft = nil
		end
	end

	self:SetCameraRotateVerticalAngle(self.cameraRotateVerticalAngle - angleVertical)
end

function CameraMain:RotateAimCameraBegin()
	if self.following ~= CameraMain.FollowingType.Aim then
		return
	end

	local lookPlayer = self:GetLookPlayer()
	local tfCameraBox = lookPlayer:GetCameraBox()

	if tfCameraBox == nil then
		return
	end

	local pivotPos = tfCameraBox.position
	local look = lookPlayer:GetSkillAimTarget()
	local tmpDir = look - pivotPos

	tmpDir:SetNormalize()
	self.cameraAimLookAtToPos:SetVector3(tmpDir)
	self.cameraAimLookAtToPosOld:SetVector3(self.cameraAimLookAtToPos)

	tmpDir = nil
end

function CameraMain:RotateAimCamera(angleHorizontal, angleVertical)
	if self.following ~= CameraMain.FollowingType.Aim then
		return false
	end

	local lookPlayer = self:GetLookPlayer()
	local tfCameraBox = lookPlayer:GetCameraBox()

	if tfCameraBox == nil then
		return
	end

	local rotateH = Quaternion.Euler(0, angleHorizontal, 0)
	local tmpDir = rotateH * self.cameraAimLookAtToPosOld

	tmpDir:SetNormalize()

	local left = Vector3.Cross(tmpDir, Vector3.s_up)
	local rotateV = Quaternion.AngleAxis(angleVertical, left)
	local tmpDir2 = rotateV * tmpDir

	self.cameraAimLookAtToPos:SetVector3(tmpDir2)
	self.cameraAimLookAtToPos:SetNormalize()

	tmpDir = nil
	tmpDir2 = nil

	return true
end

function CameraMain:IsFollowingBaseNow()
	if self.following == self.followingBase then
		return true
	end

	return false
end

function CameraMain:GetLockPlayer()
	if self.skillingPlayerForce ~= nil then
		return self.skillingPlayerForce
	elseif self:IsLockFollowingPlayer() == true then
		return self.followingPlayer
	elseif self.skillingPlayerLock == true and self:IsLockSkillingPlayer() == true then
		return self.skillingPlayer
	end

	return nil
end

function CameraMain:IsLockFollowingPlayer()
	if self.followingPlayer ~= nil and self.followingPlayer:IsDead() == false and self.hostPlayer:IsDead() == false and self.followingPlayer:IsShow() == true then
		return true
	end

	return false
end

function CameraMain:LockPlayer(player)
	local lookPlayer = self:GetLookPlayer()

	if lookPlayer ~= nil and lookPlayer == player then
		return
	end

	if self.followingPlayer ~= player and player == nil and lookPlayer ~= nil then
		self:UpdateCameraFollowParam(self:GetCameraLogicPosition())
	end

	self.followingPlayer = player
end

function CameraMain:SwitchSkillingPlayerLock()
	self.skillingPlayerLock = not self.skillingPlayerLock
end

function CameraMain:IsLockSkillingPlayer()
	if self.skillingPlayer ~= nil and self.skillingPlayer:IsDead() == false and self.hostPlayer:IsDead() == false and self.skillingPlayer:IsShow() == true then
		return true
	end

	return false
end

function CameraMain:LockSkillingPlayer(player)
	local lookPlayer = self:GetLookPlayer()

	if lookPlayer ~= nil and lookPlayer == player then
		self.skillingPlayerLock = false

		return
	end

	if player ~= nil and (player:IsDead() == true or player:IsShow() == false) then
		self.skillingPlayerLock = false

		return
	end

	if self.skillingPlayer ~= player then
		if player == nil and lookPlayer ~= nil and self.skillingPlayerLock == true then
			self:UpdateCameraFollowParam(self:GetCameraLogicPosition())
		end

		if self:IsLockFollowingPlayer() == true and player ~= nil then
			self.skillingPlayerLock = true
		else
			self.skillingPlayerLock = false
		end
	end

	self.skillingPlayer = player
end

function CameraMain:LockSkillingPlayerForce(player)
	self.skillingPlayerForce = player
end

function CameraMain:UpdateCameraFollowParam(pos)
	local lookPlayer = self:GetLookPlayer()
	local lookPos = lookPlayer:GetPosByWorldPos():Clone()
	local lookHeightDiff = lookPlayer:GetCameraLookHeightDiff()

	lookPos.y = lookPos.y + lookPlayer:GetGravityCenterY() + lookHeightDiff

	local dis = self:GetCameraDistance(lookPlayer)

	dis = dis * self.cameraStoryDistanceRate

	local tmpDir = pos - lookPos
	local tmpForward = tmpDir:Clone()

	tmpForward.y = 0

	tmpForward:SetNormalize()
	self:SetCameraRotateVerticalAngle(Mathf.Abs(Vector3.Angle(tmpForward, tmpDir)))

	if tmpDir.y < 0 then
		self:SetCameraRotateVerticalAngle(-self.cameraRotateVerticalAngle)
	end

	self.cameraLookAtToPos:SetVector3(tmpForward)

	tmpDir = nil
	tmpForward = nil
	lookPos = nil
end

function CameraMain:SmoothToBase(speed)
	local deltaTime = ControllerMain.GetLogicDeltaTime()
	local lookPlayer = self:GetLookPlayer()
	local targetDir = lookPlayer:GetBack():Clone()
	local heightY = Mathf.Tan(CameraMain.CameraVerticaleAngle * Mathf.Deg2Rad)

	targetDir.y = heightY

	targetDir:SetNormalize()
	targetDir:Unm()

	local rotTarget = Quaternion.LookRotation(targetDir)

	heightY = Mathf.Tan(self.cameraRotateVerticalAngle * Mathf.Deg2Rad)
	self.cameraLookAtToPos.y = heightY

	self.cameraLookAtToPos:SetNormalize()
	self.cameraLookAtToPos:Unm()

	local rotOld = Quaternion.LookRotation(self.cameraLookAtToPos)
	local rotNew = Quaternion.RotateTowards(rotOld, rotTarget, speed * deltaTime)

	targetDir:Set(0, 0, 1)
	targetDir:MulQuat(rotNew)
	targetDir:Unm()
	targetDir:SetNormalize()

	local forward = targetDir:Clone()

	forward.y = 0

	forward:SetNormalize()
	self:SetCameraRotateVerticalAngle(Mathf.Abs(Vector3.Angle(forward, targetDir)))

	if targetDir.y < 0 then
		self:SetCameraRotateVerticalAngle(-self.cameraRotateVerticalAngle)
	end

	self.cameraLookAtToPos:SetVector3(forward)

	rotTarget = nil
	rotOld = nil
	rotNew = nil
	targetDir = nil
	forward = nil
end

function CameraMain:SmoothToPositionAndRotation(posOld, pos, rotOld, rot, startTime, timeMax)
	if timeMax <= 0 then
		return true
	end

	local nowTime = TimeHelper.getNowTime()
	local rate = (nowTime - startTime) / timeMax

	rate = Mathf.Clamp(rate, 0, 1)

	local retPos = pos
	local retRot = rot

	if rate < 1 then
		retPos = Vector3.Lerp(posOld, pos, rate)
		retRot = Quaternion.Lerp(rotOld, rot, rate)
	end

	self:SynchronizePosAndRot(retPos, retRot)

	if rate >= 1 then
		return true
	end

	return false
end

function CameraMain:SmoothToRotation(rot, speed)
	local deltaTime = ControllerMain.GetLogicDeltaTime()
	local heightY = Mathf.Tan(self.cameraRotateVerticalAngle * Mathf.Deg2Rad)

	self.cameraLookAtToPos.y = heightY

	self.cameraLookAtToPos:SetNormalize()
	self.cameraLookAtToPos:Unm()

	local rotOld = Quaternion.LookRotation(self.cameraLookAtToPos)
	local rotNew = Quaternion.Lerp(rotOld, rot, speed * deltaTime)
	local dir = Vector3.forward

	dir:MulQuat(rotNew)
	dir:Unm()
	dir:SetNormalize()

	local forward = dir:Clone()

	forward.y = 0

	forward:SetNormalize()
	self:SetCameraRotateVerticalAngle(Mathf.Abs(Vector3.Angle(forward, dir)))

	if dir.y < 0 then
		self:SetCameraRotateVerticalAngle(-self.cameraRotateVerticalAngle)
	end

	self.cameraLookAtToPos:SetVector3(forward)

	rotOld = nil
	rotNew = nil
	dir = nil
	forward = nil
end

function CameraMain:GetCameraFollowPositionAndLookAt(isSmooth)
	local lookPlayer = self:GetLookPlayer()

	self.lookPlayerPosOld:SetVector3(lookPlayer:GetPosByWorldPosLast())
	self.lookPlayerPos:SetVector3(lookPlayer:GetPosByWorldPos())

	local lookPlayerPosY = self.lookPlayerPos.y

	self.lookPlayerPos.y = self.lookPlayerPos.y + lookPlayer:GetGravityCenterY()
	self.lookPlayerPosOld.y = self.lookPlayerPosOld.y + lookPlayer:GetGravityCenterY()

	local cameraPos = Vector3.zero
	local look = Vector3.forward
	local dis = self:GetCameraDistance(lookPlayer)

	if self:GetLockPlayer() ~= nil then
		local lockPlayer = self:GetLockPlayer()

		dis = dis + self.bossCameraDistanceSkill

		local diffLockHeight, diffLockAngleByHeight, diffLockAngleByDis, diffLockLookY = lockPlayer:GetCameraLockedInfo()
		local diffLockAngleBase = 10
		local tmpDisRate = 0.3

		if DebugAdjustCameraLock == true then
			diffLockHeight = DebugParam1
			diffLockAngleByHeight = DebugParam2
			diffLockAngleByDis = DebugParam3
			diffLockLookY = DebugParam4
		end

		local lockPlayerPosY = 0
		local lockPlayerPos = Vector3.zero

		if lockPlayer.parasitic > 0 then
			lockPlayerPos = lockPlayer:GetAimPosition() or Vector3.zero

			self.lockPlayerPos:SetVector3(lockPlayerPos)

			lockPlayerPosY = self.lockPlayerPos.y
			self.lockPlayerPos.y = self.lockPlayerPos.y
		else
			lockPlayerPos = lockPlayer:GetPosByWorldPos() or Vector3.zero

			self.lockPlayerPos:SetVector3(lockPlayerPos)

			lockPlayerPosY = self.lockPlayerPos.y
			self.lockPlayerPos.y = self.lockPlayerPos.y + lockPlayer:GetGravityCenterY()
		end

		local relative = self.lookPlayerPos - self.lockPlayerPos
		local targetDis = relative.magnitude

		relative:SetNormalize()
		self.cameraLookAtToPos:SetVector3(relative)

		self.cameraLookAtToPos.y = 0

		self.cameraLookAtToPos:SetNormalize()

		local angleY = Mathf.Abs(Vector3.Angle(relative, self.cameraLookAtToPos))

		if self.lockPlayerPos.y > self.lookPlayerPos.y then
			angleY = -angleY
		end

		angleY = Mathf.Clamp(angleY, CameraMain.CameraLockTargetAngleMin, CameraMain.CameraLockTargetAngleMax)

		local diffLockHeight2 = MathHelper.getValueInRadioRange(angleY, CameraMain.CameraLockTargetAngleMin, CameraMain.CameraLockTargetAngleMax, -0.5, 0.5)
		local rotateVerticalAngleDiff = MathHelper.getValueInRadioRange(angleY, CameraMain.CameraLockTargetAngleMin, CameraMain.CameraLockTargetAngleMax, -diffLockAngleByHeight, diffLockAngleByHeight)
		local diffLockLookY2 = MathHelper.getValueInRadioRange(angleY, CameraMain.CameraLockTargetAngleMin, CameraMain.CameraLockTargetAngleMax, 0.5, -0.5)
		local rotateVerticalAngle = MathHelper.getValueInRadioRange(targetDis, CameraMain.CameraLockTargetDisMin, CameraMain.CameraLockTargetDisMax, diffLockAngleBase + diffLockAngleByDis, diffLockAngleBase)
		local rotateVerticalAngleRate = MathHelper.getValueInRadioRange(angleY, CameraMain.CameraLockTargetAngleMin, CameraMain.CameraLockTargetAngleMax, -1, 1)
		local tmpAdjustAngle = rotateVerticalAngleDiff + rotateVerticalAngle * (1 - Mathf.Abs(rotateVerticalAngleRate))
		local lookDiffY = MathHelper.getValueInRadioRange(targetDis, CameraMain.CameraLockTargetDisMin, CameraMain.CameraLockTargetDisMax, 0, diffLockLookY)
		local lookDiffY2 = Mathf.Clamp(Mathf.Abs(angleY / CameraMain.CameraLockTargetAngleMax), 0, 1) * 0.5
		local tmpRotateAngle = MathHelper.getValueInRadioRange(targetDis, CameraMain.CameraLockTargetDisMin, CameraMain.CameraLockTargetDisMax, -10, -20)
		local tmpRotate = Quaternion.Euler(0, tmpRotateAngle, 0)

		self.cameraLookAtToPos:MulQuat(tmpRotate)
		self.cameraLookAtToPos:SetNormalize()

		local tmpY = Mathf.Sin(tmpAdjustAngle * Mathf.Deg2Rad) * dis
		local tmpZ = Mathf.Cos(tmpAdjustAngle * Mathf.Deg2Rad) * dis
		local tmpDir = self.cameraLookAtToPos * tmpZ

		cameraPos:SetVector3(self.lookPlayerPos)
		cameraPos:Add(tmpDir)

		cameraPos.y = cameraPos.y + diffLockHeight + diffLockHeight2 + tmpY

		relative:SetVector3(self.lookPlayerPos)
		relative:Mul(1 - tmpDisRate)
		look:SetVector3(relative)
		relative:SetVector3(self.lockPlayerPos)
		relative:Mul(tmpDisRate)
		look:Add(relative)

		look.y = look.y + lookDiffY + lookDiffY2
		relative = nil
		tmpRotate = nil
		tmpDir = nil
	else
		if DebugAutoRun == true and lookPlayer:IsDebugAutoRun() == true then
			self.cameraLookAtToPos:SetVector3(lookPlayer:GetBack())
		end

		dis = dis * self.cameraStoryDistanceRate

		local lookHeightDiff = lookPlayer:GetCameraLookHeightDiff()
		local baseY = self.lookPlayerPos.y + lookHeightDiff

		self.cameraLookAtToPos:SetNormalize()

		local tmpY = Mathf.Sin(self.cameraRotateVerticalAngle * Mathf.Deg2Rad) * dis
		local tmpZ = Mathf.Cos(self.cameraRotateVerticalAngle * Mathf.Deg2Rad) * dis
		local tmpDir = self.cameraLookAtToPos * tmpZ

		cameraPos:SetVector3(self.lookPlayerPos)
		cameraPos:Add(tmpDir)

		cameraPos.y = baseY + tmpY
		look = self.lookPlayerPos:Clone()
		look.y = baseY

		if cameraPos.y > look.y then
			local checkDiffY = cameraPos.y - look.y

			checkDiffY = checkDiffY * CameraMain.CameraFollowLookRatio
			look.y = look.y + checkDiffY
		end

		tmpDir = nil
	end

	if isSmooth == true then
		if lookPlayer:IsSpecialCameraFollow() then
			cameraPos, look = self:UseSmooth(cameraPos, look, self.lookPlayerPos, self.lookPlayerPos, self.cameraUseSmooth, true)
		else
			cameraPos, look = self:UseSmooth(cameraPos, look, self.lookPlayerPos, self.lookPlayerPosOld, self.cameraUseSmooth, self.cameraUseSmooth)
		end
	else
		self:EndSmooth()
	end

	local checkPoint = self.lookPlayerPos:Clone()
	local checkDiffY = cameraPos.y - self.lookPlayerPos.y

	checkDiffY = MathHelper.getValueInRadioRange(checkDiffY, CameraMain.CameraFollowHeightMin, CameraMain.CameraFollowHeightMax, 0, lookPlayer:GetGravityCenterY())
	checkPoint.y = checkPoint.y + checkDiffY

	return cameraPos, look, true, checkPoint
end

function CameraMain:UpdateCameraFollow()
	if self.following == CameraMain.FollowingType.Normal then
		local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(true)

		self:SetCameraPosAndLookAtPos(cameraPos, look, useCollider, colliderCheckPoint, false)

		cameraPos = nil
		look = nil
		colliderCheckPoint = nil
	elseif self.following == CameraMain.FollowingType.TimeLine then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.followingTime + MS_StoryTimeLine.TimeLineTriggerTime1 then
			self:UpdateCameraFollowParam(self.cameraPosTarget)

			local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(false)

			self:SetCameraPosAndLookAtPos(cameraPos, look, false, colliderCheckPoint, true)

			cameraPos = nil
			look = nil
			colliderCheckPoint = nil
		end
	elseif self.following == CameraMain.FollowingType.TimeLineMove then
		self:SmoothToRotation(self.cameraRotTarget, CameraMain.CameraSmoothTimeLineSpeed)

		local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(true)

		self:SetCameraPosAndLookAtPos(cameraPos, look, false, colliderCheckPoint, false)

		cameraPos = nil
		look = nil
		colliderCheckPoint = nil
	elseif self.following == CameraMain.FollowingType.StoryEnterMove then
		self:SynchronizePosAndRot(self.cameraPosTarget, self.cameraRotTarget)
	elseif self.following == CameraMain.FollowingType.AimEnter then
		local lookPlayer = self:GetLookPlayer()
		local tfCameraBox = lookPlayer:GetCameraBox()

		if tfCameraBox ~= nil then
			local timeDiff = TimeHelper.getNowTime() - self.followingTime
			local rate = timeDiff / CameraMain.CameraAimEnterTime
			local pivotPos = tfCameraBox.position
			local look = lookPlayer:GetSkillAimTarget()
			local tmpDir = look - pivotPos

			tmpDir:SetNormalize()

			local cameraPos = pivotPos - tmpDir * self.cameraAimColliderToPivotDistance

			if self.cameraAimColliderCheck == true then
				local tmpCollider = self:CheckCameraBlock(pivotPos, cameraPos)

				if tmpCollider == true then
					self.cameraAimColliderCheck = false
					self.cameraAimColliderToPivotDistance = 0

					cameraPos:SetVector3(pivotPos)
				end
			end

			if timeDiff >= CameraMain.CameraAimEnterTime then
				self:SetCameraPosAndLookAtPos(cameraPos, look, false, look, false)
				self:SetFollowingType(CameraMain.FollowingType.Aim)
				self:RotateAimCameraBegin()
			else
				local tmpPos = Vector3.Lerp(self.cameraPosSave, cameraPos, rate)

				self:SetCameraPosAndLookAtPos(tmpPos, look, false, look, false)
			end
		end
	elseif self.following == CameraMain.FollowingType.Aim then
		local lookPlayer = self:GetLookPlayer()
		local tfCameraBox = lookPlayer:GetCameraBox()

		if tfCameraBox ~= nil then
			local pivotPos = tfCameraBox.position
			local cameraPos = pivotPos - self.cameraAimLookAtToPos * self.cameraAimColliderToPivotDistance

			if self.cameraAimColliderCheck == true then
				local tmpCollider = self:CheckCameraBlock(pivotPos, cameraPos)

				if tmpCollider == true then
					self.cameraAimColliderCheck = false
					self.cameraAimColliderToPivotDistance = 0

					cameraPos:SetVector3(pivotPos)
				end
			end

			local look = cameraPos + self.cameraAimLookAtToPos * CameraMain.CameraAimToLookAtDis

			self:SetCameraPosAndLookAtPos(cameraPos, look, false, look, false)
		end
	elseif self.following == CameraMain.FollowingType.StairEnter or self.following == CameraMain.FollowingType.StairExit then
		local lookPlayer = self:GetLookPlayer()
		local targetBack = lookPlayer:GetBack()
		local tmpDir = Vector3.Lerp(self.cameraLookAtToPos, targetBack, CameraMain.CameraStairRotateSpeed * ControllerMain.GetLogicDeltaTime())

		self.cameraLookAtToPos:SetVector3(tmpDir)

		self.cameraLookAtToPos.y = 0

		self.cameraLookAtToPos:SetNormalize()

		local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(true)

		self:SetCameraPosAndLookAtPos(cameraPos, look, useCollider, colliderCheckPoint, false)

		cameraPos = nil
		look = nil
		colliderCheckPoint = nil
	elseif self.following == CameraMain.FollowingType.Stair then
		local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(true)

		self:SetCameraPosAndLookAtPos(cameraPos, look, useCollider, colliderCheckPoint, false)

		cameraPos = nil
		look = nil
		colliderCheckPoint = nil
	elseif self.following == CameraMain.FollowingType.Dead then
		local timeDiff = TimeHelper.getNowTime() - self.followingTime

		if timeDiff >= CameraMain.CameraDeadTime then
			if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true then
				local subPlayer = self:GetSubPlayer()

				if subPlayer == nil or subPlayer:IsDead() == true then
					local selectPlayer = self:SelectSubPlayer()

					if selectPlayer ~= nil then
						self:ChangeSubPlayer(selectPlayer, true)
					end
				end

				local cameraPos, look, useCollider, colliderCheckPoint = self:GetCameraFollowPositionAndLookAt(true)

				self:SetCameraPosAndLookAtPos(cameraPos, look, useCollider, colliderCheckPoint, false)

				cameraPos = nil
				look = nil
				colliderCheckPoint = nil
			end
		else
			local lookPlayer = self:GetLookPlayer()
			local lookPos = lookPlayer:GetPosByWorldPos()

			if lookPlayer:GetBodyHips() ~= nil then
				lookPos = lookPlayer:GetBodyHips().position
			end

			local cameraPos = self:GetCameraLogicPosition()

			self:SetCameraPosAndLookAtPos(cameraPos, lookPos, false, lookPos, false)
		end
	elseif self.following == CameraMain.FollowingType.DeadMonster then
		local nowTime = TimeHelper.getNowTime()

		if self.deadMonsterStep == 0 then
			local ret = self:SmoothToPositionAndRotation(self.deadMonsterPosOld, self.cameraPosTarget, self.deadMonsterRotOld, self.cameraRotTarget, self.deadMonsterStepTime, self.deadMonsterSmoothTime)

			if ret == true then
				self.deadMonsterStep = self.deadMonsterStep + 1
				self.deadMonsterStepTime = nowTime

				local forward = Vector3.forward

				forward:MulQuat(self.cameraRotTarget)

				forward.y = 0

				forward:SetNormalize()
				self.deadMonsterRotOld:SetQuaternion(self.cameraRotTarget)

				self.cameraRotTarget = Quaternion.LookRotation(forward)
				self.deadMonsterSmoothTime = CameraMain.DeadMonsterSmoothTime2
			end
		elseif self.deadMonsterStep == 1 or self.deadMonsterStep == 2 then
			local rate = (nowTime - self.deadMonsterStepTime) / self.deadMonsterSmoothTime

			rate = Mathf.Clamp(rate, 0, 1)

			local rot = Quaternion.Lerp(self.deadMonsterRotOld, self.cameraRotTarget, rate)

			self:SynchronizePosAndRot(self.cameraPosTarget, rot)

			if self.deadMonsterStep == 1 and rate >= 0.5 then
				self.deadMonsterStep = self.deadMonsterStep + 1
			end
		end
	elseif self.following == CameraMain.FollowingType.Meeting then
		-- block empty
	end
end

function CameraMain:UpdateCameraDialog()
	return
end

function CameraMain:UpdateCameraMenu()
	return
end

function CameraMain:Update()
	CameraBase.Update(self)

	if self.mode == CameraMain.ModeType.Following then
		self:UpdateCameraFollow()
	elseif self.mode == CameraMain.ModeType.Dialog then
		self:UpdateCameraDialog()
	elseif self.mode == CameraMain.ModeType.Menu then
		self:UpdateCameraMenu()
	end

	self.cameraUseSmooth = true
end

function CameraMain:Exit()
	if self.cameraEffect ~= nil then
		self.cameraEffect:Clear()

		self.cameraEffect = nil
	end

	self.followingPlayer = nil
	self.skillingPlayer = nil
	self.skillingPlayerForce = nil
	self.lookPlayerPos = nil
	self.lockPlayerPos = nil
	self.cameraLookAtToPos = nil
	self.cameraLookAtToPosOld = nil
	self.cameraAimLookAtToPos = nil
	self.cameraAimLookAtToPosOld = nil
	self.cameraAimLookAtToPivotOld = nil
	self.cameraPosSave = nil
	self.cameraLookAtSave = nil
	self.deadMonsterPosOld = nil
	self.deadMonsterRotOld = nil

	CameraBase.Exit(self)
end
