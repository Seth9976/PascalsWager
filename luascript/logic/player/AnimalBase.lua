-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/AnimalBase.lua

require("GameData/PlayerDefine/AnimalBase_Define")
require("LuaScript/Logic/Battle/HitData")
require("LuaScript/Logic/Battle/SkillTouchAttackData")
require("LuaScript/Logic/Battle/SkillTouchHitData")
require("LuaScript/Logic/Battle/TrickTouchData")
require("LuaScript/Logic/Battle/SkillTouchHitComboData")
require("LuaScript/Logic/Battle/AttackerInfo")
require("LuaScript/Logic/Battle/SkillTouchHitShellData")
require("LuaScript/Logic/Battle/TrickTouchShellData")

AnimalBase = class("AnimalBase")
AnimalBase.Config = {}

function AnimalBase:initialize(transformSelf, transformModel, id, name, teamId, isHost, type)
	self.exitFlg = false
	self.exitDoneFlg = false
	self.tfSelf = transformSelf
	self.tfSelfName = self.tfSelf.name
	self.tfModel = transformModel

	self.tfModel.gameObject:SetActive(true)

	self.animalId = id
	self.teamId = teamId
	self.isHost = isHost
	self.isHostBack = isHost
	self.memberId = 0
	self.storyMonsterId = 0
	self.storyId = 0
	self.pattern = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.storyId = FS_UserData.story:GetStoryId()
		self.pattern = FS_UserData.story:GetPattern()
	end

	self.type = type
	self.modelName = name
	self.modelScale = 1
	self.heroId = BattleData.ConvertHeroNameToId(name)
	self.heroIdWithSkin = BattleData.ConvertHeroIdWithSkin(self.heroId)
	self.modelNameWithSkin = BattleData.GetHeroName(self.heroIdWithSkin)
	self.heroData = MS_HeroData.GetHero(self.heroId)
	self.nickName = nil
	self.animalLevel = 1
	self.animalGrade = 1
	self.animalValue = nil
	self.animalConfig = nil
	self.animalBrain = nil
	self.heroExtData = nil
	self.heroExtAiMode = 0
	self.heroVariety = 1
	self.heroBornType = 0
	self.heroPropertyData = nil
	self.isStart = false
	self.monsterType = AnimalBase_Define.MonsterType.Normal
	self.animatorSpeed = 1
	self.animatorSkillSpeed = 1
	self.animatorParamList = {}
	self.animatorParamRecovery = false
	self.animatorStateName = AnimalBase_Define.AnimatorStateGroundMove
	self.animatorStateHash = MS_AnimalAnimator.GetStateNameHash(self.animatorStateName)
	self.animatorStateHashOld = self.animatorStateHash
	self.animatorStateMoveHash = nil
	self.animatorStateMoveHashOld = self.animatorStateMoveHash
	self.animatorLayer = 0
	self.animatorLayerOld = self.animatorLayer
	self.animatorLayerMove = 0
	self.animatorStateSpecialHash = nil
	self.animatorStateSpecialHashOld = self.animatorStateSpecialHash
	self.animatorLayerSpecial = 0
	self.animatorStateStartTime = 0
	self.animatorIsLeft = false
	self.animatorFrame = 0
	self.animatorLoop = false
	self.animatorEnd = false
	self.animatorTime = 0
	self.animatorLoopCnt = 0
	self.animatorLoopCntLast = 0
	self.animatorTimeLast = 0
	self.animatorTrigger = 0
	self.animatorParry = 0
	self.animatorGround = 0
	self.animatorInTransition = false
	self.animatorReset = false
	self.animatorResetTime = 0
	self.animatorOffsetTime = 0
	self.animatorOffsetStart = false
	self.animatorDelayScale = 1
	self.animatorDelayRestTime = 0
	self.animatorDelayStartTime = 0
	self.animatorDelayFreezeTime = 0
	self.animatorDelayFadeOutTime = 0
	self.animatorDelayFreezeSpeed = 0
	self.animatorSpecialId = 0
	self.scene = nil
	self.groundY = 0
	self.groundNormal = Vector3.up
	self.groundSlopeAngle = 0
	self.groundForward = Vector3.forward
	self.targetWorldPos = Vector3.zero
	self.gravityCenterPosition = Vector3.zero
	self.aimPosition = Vector3.zero
	self.moveStateNow = AnimalBase_Define.MoveStateType.Move
	self.moveStateNext = 0
	self.moveStateOld = 0
	self.moveStateNextSpecial = 0
	self.moveStateRecovery = 0
	self.moveStateDebugFly = false
	self.joystickMoveDir = Vector2.zero
	self.joystickMoveDirLast = Vector2.zero
	self.joystickMoveChangeAngle = 0
	self.joystickMoveInnerEndTime = 0
	self.joystickRadiusForMoveInner = JoystickController.JoystickRadiusForMoveInner
	self.joystickRadiusForMoveOuter = JoystickController.JoystickRadiusForMoveOuter - 15
	self.moveDir = Vector3.zero
	self.moveDirLookAt = Vector3.zero
	self.moveDirInertia = Vector3.zero
	self.moveDirFramePos = Vector3.zero
	self.moveDirFrameRotY = 0
	self.moveDirLocal = Vector3.forward
	self.moveDirLocalDodge = Vector3.forward
	self.moveDirSkillForward = 0
	self.moveDirDodge = Vector3.forward
	self.moveDirChangeAngle = 0
	self.moveDirAim = Vector3.forward
	self.moveDirAimOld = Vector3.forward
	self.moveDirAimTarget = Vector3.forward
	self.moveDirAimStartAngle = 0
	self.moveDirAimStartHorizontalDir = Vector3.zero
	self.moveDirAimTargetDistance = 0
	self.moveSpeedVertical = 0
	self.moveSpeedVerticalSpecial = 0
	self.moveSpeedHorizontalSpecial = 0
	self.moveSpeedVerticalSkill = 0
	self.moveSpeedHorizontalSkill = 0
	self.moveSpeed = 0
	self.moveSpeedTarget = 0
	self.moveSpeedOld = 0
	self.moveSpeedWalkAccelerate = self.heroData.WalkAccelerate
	self.moveSpeedWalkDecelerate = self.heroData.WalkDecelerate
	self.moveSpeedRunAccelerate = self.heroData.RunAccelerate
	self.moveSpeedRunDecelerate = self.heroData.RunDecelerate
	self.moveSpeedSprintAccelerate = self.heroData.SprintAccelerate
	self.moveSpeedSprintDecelerate = self.heroData.SprintDecelerate
	self.moveSpeedSpecialAccelerate = self.heroData.SpecialAccelerate
	self.moveSpeedSpecialDecelerate = self.heroData.SpecialDecelerate
	self.moveSpeedSpecialChange = self.heroData.SpecialChange
	self.moveSpeedSmooth = true
	self.moveSpeedMode = AnimalBase_Define.SpeedMode.Fast
	self.moveSpeedStandTurnAI = self.heroData.StandTurnSpeed
	self.moveSpeedMoveTurnAI = self.heroData.MoveTurnSpeed
	self.moveAngleStandTurnMinAI = self.heroData.StandRotationAngleMin
	self.moveAngleMoveTurnMinAI = self.heroData.MoveRotationAngleMin
	self.moveTurnTypeAI = 0
	self.moveTurnTarget = 0
	self.moveTurn = 0
	self.moveTurnEnable = false
	self.moveSlopeAngleForward = 0
	self.moveSlopeSlipSpeed = Vector3.zero
	self.moveOnGround = true
	self.moveOnGroundOld = self.moveOnGround
	self.moveTouchGroundId = nil
	self.moveTouchGroundType = SceneBase.GroundType.Unknown
	self.moveTouchZoneType = SceneBase.ZoneType.Unknown
	self.moveTouchArea = SceneBase.Area.Unknown
	self.moveTouchZoneId = 0
	self.moveTouchReverbId = 0
	self.moveTouchWaterHeight = SceneBase.DefaultWaterHeight
	self.moveTouchFogStartDistance = 0
	self.moveTouchFogEndDistance = 0
	self.moveTouchFogColor = nil
	self.moveFall = 0
	self.moveFallPos = Vector3.zero
	self.moveFallStart = 0
	self.moveFallHeight = 0
	self.moveFallDir = Vector3.zero
	self.moveDropDamageHeight = 0
	self.moveBattleMode = 0
	self.moveBattleEndTime = 0
	self.moveForceEndTime = 0
	self.moveForceDir = Vector3.zero
	self.movePathPos = Vector3.zero
	self.moveCagePos = Vector3.zero
	self.moveCageRange = 0
	self.moveCageUse = false
	self.moveLock = false
	self.deadPosition = Vector3.zero
	self.rebornPosition = Vector3.zero
	self.rebornLook = Vector3.zero
	self.rebornPropertyList = nil
	self.uiHeadInfoPosition = Vector3.zero
	self.uiDamageInfoPosition = Vector3.zero
	self.deadSkillFlg = false
	self.deadFlg = false
	self.deadHide = false
	self.deadSkillReason = AnimalBase_Define.DeadReason.None
	self.deadReason = AnimalBase_Define.DeadReason.None
	self.bornReason = AnimalBase_Define.BornReason.None
	self.rebornFrame = 0
	self.showFlg = false
	self.showByActFlg = false
	self.moveFlg = false
	self.endFlg = false
	self.stopFlg = true
	self.stopRest = 0
	self.hatredTargetId = 0
	self.counterAttackTarget = nil
	self.lockDisable = false
	self.paramDisable = {}
	self.paramThreshold = {}
	self.moveRevertFlg = false
	self.movePositionOld = Vector3.zero
	self.movePositionLast = Vector3.zero
	self.movePosition = Vector3.zero
	self.movePositionNew = Vector3.zero
	self.moveRotationNew = Quaternion.identity
	self.moveFootprintPosition = Vector3.zero
	self.moveFindPathPositionForAI = Vector3.zero
	self.moveFixBoneHostTf = nil
	self.moveFixBoneSyncRotation = false
	self.moveFixBoneType = 0
	self.moveRotationOld = Quaternion.identity
	self.moveRotation = Quaternion.identity
	self.moveRotationInverse = self.moveRotation:Inverse()
	self.moveRotationForward = Vector3.forward
	self.moveRotationBack = Vector3.back
	self.moveRotationLeft = Vector3.left
	self.moveRotationRight = Vector3.right
	self.moveJumpY = -1
	self.moveFix = false
	self.moveFly = false
	self.moveThroughWall = false
	self.moveThroughBody = false
	self.moveThroughAll = false
	self.moveGhost = false
	self.moveWindEnable = false
	self.moveWindDir = Vector3.zero
	self.moveTurnEnable = true
	self.moveMuteki = false
	self.moveMutekiIgnoreId = 0
	self.moveNoDamage = false
	self.moveNoWeakness = false
	self.moveNoHitTime = 0
	self.moveNoDropDamage = false
	self.moveTimeLineTargetPos = Vector3.zero
	self.moveTimeLineTargetRot = Quaternion.identity
	self.moveTimeLineDir = Vector3.zero
	self.moveAutoRunTarget = Vector3.zero
	self.moveAutoRunFlg = false
	self.moveDialogPos = Vector3.zero
	self.moveDialogLook = Vector3.zero
	self.dissolveShow = false
	self.dissolveStartTime = 0
	self.dissolveEndTime = 0
	self.callFromAnimalId = 0
	self.callFromHeroId = 0
	self.nightmareEndReady = false
	self.callEndReady = false
	self.moveType = AnimalBase_Define.MoveType.Move
	self.moveMoveType = AnimalBase_Define.MoveType.Move
	self.moveHitType = AnimalBase_Define.HitType.None
	self.moveHitTypeOld = self.moveHitType
	self.moveHitStatusWeak = false
	self.moveHitStatusWeakRecovery = false
	self.moveHitStatusWeakToward = false
	self.moveHitData = HitData:new()
	self.moveHitPeriodFrame = 0
	self.moveHitRate = 1
	self.moveHitLock = false
	self.moveDropType = AnimalBase_Define.DropType.HeadUp
	self.moveDropHeightType = AnimalBase_Define.DropHeightType.Low
	self.moveDeadType = 0
	self.moveStairId = 0
	self.moveStairDir = AnimalBase_Define.StairTouch.Empty
	self.moveStairTouchTime = 0
	self.moveStairTouchType = 0
	self.moveStairClimbSpeed = AnimalBase_Define.StairClimbSpeed.Normal
	self.moveStairClimbStart = 0
	self.moveStairClimbTargetPos = Vector3.zero
	self.moveStairClimbTargetRot = Quaternion.identity
	self.itemUseId = 0
	self.skillStop = false
	self.skillBlock = false
	self.skillBlockIndex = 0
	self.skillBlockCombo = 0
	self.skillBlockParam = 0
	self.skillBlockJump = {}
	self.skillPull = false
	self.skillPullIndex = 0
	self.skillPullCombo = 0
	self.skillIndex = 0
	self.skillIndexOld = 0
	self.skillButtonRunExit = 0
	self.skillButtonRunExitTime = 0
	self.skillCombo = 0
	self.skillComboOld = 0
	self.skillNextList = {}
	self.skillNextWaitTimeStart = 0
	self.skillNextWaitTime = 0
	self.skillNextId = 0
	self.skillLastHitBehind = false
	self.skillAimMode = false
	self.skillExecuteTarget = nil
	self.skillExecuteAttack = false
	self.skillExecuteAttackPosition = Vector3.zero
	self.skillExecuteReady = false
	self.skillExecuteHit = false
	self.skillExecuteHitEnable = self.heroData.HitExecute
	self.skillExecuteHitPosition = Vector3.zero
	self.skillExecuteHost = nil
	self.skillExecuteHitFix = false
	self.skillBackstabTarget = nil
	self.skillBackstabAttack = false
	self.skillBackstabAttackPosition = Vector3.zero
	self.skillBackstabReady = false
	self.skillBackstabHit = false
	self.skillBackstabHitEnable = self.heroData.HitBackstab
	self.skillBackstabHitPosition = Vector3.zero
	self.skillBackstabHost = nil
	self.skillBackstabHitFix = false
	self.skillHitTowardPosition = nil
	self.skillThrowItemId = 0
	self.skillThrowSpeed = Vector3.zero
	self.skillThrowSpeedAcc = Vector3.zero
	self.skillTargetReady = nil
	self.skillTarget = nil
	self.skillTargetAI = nil
	self.skillLockAnimal = nil
	self.skillLockAnimalIdLast = 0
	self.skillColliderCubeList = nil
	self.skillColliderCubeConfigList = nil
	self.skillColliderParryList = nil
	self.skillTouchHitList = nil
	self.skillTouchAttackList = nil
	self.skillTouchHitComboList = nil
	self.skillTouchHitShellList = nil
	self.skillAttackerList = nil
	self.skillCondition = {}
	self.skillToughness = 0
	self.skillExtendIndex = 0
	self.skillExtendCombo = 0
	self.skillExtendTime = 0
	self.trickTouchList = nil
	self.statusList = nil
	self.statusPropertyMaxValueList = nil
	self.skillButtonLongPressOld = 0
	self.skillButtonLongPress = 0
	self.skillButtonLongPressTime = 0
	self.skillButtonLongPressUsed = false
	self.skillButtonPressUp = 0
	self.skillButtonPressDown = 0
	self.skillButtonRefresh = false
	self.skillButtonLongPressReset = false
	self.skillButtonTarget = Vector3.zero
	self.skillAimTarget = Vector3.zero
	self.eventAssistButtonClick = 0
	self.eventUseItemId = 0
	self.eventReborn = false
	self.eventTransferEnd = false
	self.eventBeaconId = 0
	self.eventTestButtonE = false
	self.eventTestButtonAlt = false
	self.eventResetState = false
	self.cameraScene = nil
	self.controllerBullet = nil
	self.controllerCollider = nil
	self.controllerTimer = nil
	self.sceneController = ST_Main.GetSceneController()
	self.loadCharacterManager = self.sceneController:GetLoadCharacterManager()
	self.gameController = nil
	self.characterLogicRuleList = nil
	self.characterStoryLogicRuleList = {}
	self.skillEffect = nil
	self.skillEffectLoop = nil
	self.selfEffectLoop = nil
	self.monsterEffect = nil
	self.sanMonsterCrazyEffect = nil
	self.skillAudio = nil
	self.moveRate = 1
	self.cameraLookHeight = self.heroData.CameraLookHeight
	self.cameraLockHeight = self.heroData.CameraLockHeight
	self.cameraLockAngleByHeight = self.heroData.CameraLockAngleByHeight
	self.cameraLockAngleByDis = self.heroData.CameraLockAngleByDis
	self.cameraLockLookY = self.heroData.CameraLockLookY
	self.cameraDistanceRate = self.heroData.CameraDistanceRate
	self.boss = self.heroData.Boss
	self.parasitic = self.heroData.Parasitic
	self.useHitBone = self.heroData.UseHitBone_PC
	self.useBodyBone = self.heroData.UseBodyBone_PC
	self.hugeBody = self.heroData.HugeBody
	self.routeCapsuleCenterY = 0
	self.routeCapsuleHeight = 0
	self.routeCapsuleRadius = 0
	self.footCapsuleRadius = 0
	self.animalRadius = 0
	self.animalSkinWidth = 0
	self.animalHeight = 0
	self.animalBackstabRadius = 0
	self.animalExecuteRadius = 0
	self.headInfoHeight = self.heroData.HeadInfoHeight
	self.damageInfoHeight = self.heroData.DamageInfoHeight
	self.damageWeakHeight = {}

	for i = 1, AnimalBase_Define.AnimalColliderWeakMax do
		self.damageWeakHeight[i] = self.heroData["DamageWeakHeight" .. i]
	end

	self.damageWeakEffect = self.heroData.WeakHitEffect
	self.damageWeakAudio = self.heroData.WeakHitAudio
	self.hitHandEffect = self.heroData.HitHandEffect
	self.hitHandAudio = self.heroData.HitHandAudio
	self.lastLeftFootWeight = 0
	self.lastRightFootWeight = 0
	self.materialChanged = false
	self.sight = {}
	self.characterLookAtPos = Vector3.zero
	self.characterLookAtPosTarget = Vector3.zero
	self.characterLookAtChangeTime = 0
	self.characterLookAtSpeed = 0
	self.ArcadeAfterDropHp = 0

	if self.isHost == true then
		self.characterColliderLayerMaskOnlyWall = AnimalBase_Define.HostColliderLayerMaskForWall

		if self.useBodyBone > 0 then
			self.characterColliderLayerMask = AnimalBase_Define.HostBodyBoneColliderLayerMask
		else
			self.characterColliderLayerMask = AnimalBase_Define.HostColliderLayerMask
		end
	else
		self.characterColliderLayerMaskOnlyWall = AnimalBase_Define.MonsterColliderLayerMaskForWall

		if MS_StoryList.IsStoryCarriage(self.storyId) == true then
			self.characterColliderLayerMask = self.characterColliderLayerMaskOnlyWall
		elseif self.useBodyBone > 0 then
			self.characterColliderLayerMask = AnimalBase_Define.MonsterBodyBoneColliderLayerMask
		else
			self.characterColliderLayerMask = AnimalBase_Define.MonsterColliderLayerMask
		end
	end

	self:AddConfig()
	self:InitSkillCondition()
	self:InitModel()
end

function AnimalBase:ExitModel()
	self:StopSkillAudio()
	self:ClearSkillEffectAll()
	self:ClearSkillEffectLoopAll()
	self:ClearSelfEffectLoopAll()

	if self.monsterEffect ~= nil then
		self.monsterEffect:Clear()
	end

	self.monsterEffect = nil

	if self.sanMonsterCrazyEffect ~= nil then
		self.sanMonsterCrazyEffect:Clear()
	end

	self.sanMonsterCrazyEffect = nil

	XAnimator.RemoveAnimalAnimator(self.animalId)
	XTransform.RemoveAnimalTransform(self.animalId)
	XCollider.RemoveAnimalCollider(self.animalId)
	ProjectXPathFindingAI.RemovePathFinder(self.animalId)
	FmodManager.ReleaseHeroSe(self.animalId)

	if self.tfLipSync ~= nil then
		self.tfLipSync.gameObject:SetActive(false)
	end

	self.tfLipSync = nil
	self.characterLipSync = nil
	self.characterEyeCtrl = nil
	self.dynamicBone = nil
	self.characterMove = nil
	self.characterConfig = nil
	self.characterCollider = nil
	self.characterRouteCollider = nil
	self.characterColliderIndexList = nil
	self.skillColliderIndexList = nil
	self.tfAimPin = nil
	self.tfPuppetMaster = nil
	self.characterPuppetMaster = nil
	self.tfCameraBox = nil

	if self.tfAttackBox ~= nil then
		for k, v in pairs(self.tfAttackBox) do
			self.tfAttackBox[k] = nil
		end

		self.tfAttackBox = nil
	end

	self.goParryBox = nil
	self.goParryBoxRender = nil

	if self.tfHandBox ~= nil then
		for k, v in pairs(self.tfHandBox) do
			self.tfHandBox[k] = nil
		end

		self.tfHandBox = nil
	end

	if self.bodyAttackCube ~= nil then
		for skillId, v in pairs(self.bodyAttackCube) do
			if self.bodyAttackCube[skillId] ~= nil then
				for skillCombo, _v in pairs(self.bodyAttackCube[skillId]) do
					if _v ~= nil then
						_v:Exit()
					end

					self.bodyAttackCube[skillId][skillCombo] = nil
				end

				self.bodyAttackCube[skillId] = nil
			end
		end

		self.bodyAttackCube = nil
	end

	if self.bodyHitCube ~= nil then
		for skillId, v in pairs(self.bodyHitCube) do
			if self.bodyHitCube[skillId] ~= nil then
				for skillCombo, _v in pairs(self.bodyHitCube[skillId]) do
					if _v ~= nil then
						_v:Exit()
					end

					self.bodyHitCube[skillId][skillCombo] = nil
				end

				self.bodyHitCube[skillId] = nil
			end
		end

		self.bodyHitCube = nil
	end

	if self.bodyHandCube ~= nil then
		for handId, v in pairs(self.bodyHandCube) do
			if self.bodyHandCube[handId] ~= nil then
				for index, _v in pairs(self.bodyHandCube[handId]) do
					if _v ~= nil then
						_v:Exit()
					end

					self.bodyHandCube[handId][index] = nil
				end

				self.bodyHandCube[handId] = nil
			end
		end

		self.bodyHandCube = nil
	end

	if self.bodyHandBoxConfig ~= nil then
		for handId, v in pairs(self.bodyHandBoxConfig) do
			self.bodyHandBoxConfig[handId] = nil
		end

		self.bodyHandBoxConfig = nil
	end

	self.tfWeaponBox = nil
	self.tfWeapon = nil
	self.tfWeaponRender = nil
	self.tfWeaponRenderEnable = nil
	self.tfWeaponRenderVisible = nil
	self.tfEquipment = nil
	self.tfEquipmentRender = nil
	self.tfEquipmentRenderEnable = nil
	self.tfEquipmentRenderVisible = nil
	self.tfBody = nil
	self.tfBodyRender = nil
	self.tfBodyRenderVisible = nil
	self.tfBodyHair = nil
	self.tfBodyHairRender = nil
	self.tfBodyHairRenderVisible = nil
	self.tfBodyParts = nil
	self.tfBodyPartsRender = nil
	self.tfBodyPartsRenderVisible = nil
	self.tfBodyGrounder = nil
	self.tfBodyPoseTilt = nil
	self.finalIkBipedIK = nil
	self.finalIkBodyTilt = nil
	self.finalIkAimIK = nil
	self.finalIkLookAtIK = nil
	self.lookAtController = nil
	self.animalAim = nil
	self.finalIkHitReaction = nil
	self.tfBoneLeftFoot = nil
	self.tfBoneRightFoot = nil
	self.tfBoneHips = nil
	self.tfBoneHead = nil
	self.tfBoneChest = nil
	self.tfBoneSpine = nil
end

function AnimalBase:InitModel()
	if self.isHost == true and self.isHostBack == false then
		XTransform.AddAnimalTransform(self.animalId, self.tfModel, true)
	else
		XTransform.AddAnimalTransform(self.animalId, self.tfModel, false)
	end

	local animator = self.tfModel:GetComponent("Animator")

	XAnimator.AddAnimalAnimator(self.animalId, animator, self.heroData.AlwaysAnimate > 0)

	self.dynamicBone = self.tfModel:GetComponent("DynamicBoneGroup")
	self.dynamicBoneEnable = false

	if self.dynamicBone ~= nil then
		self.dynamicBone.enabled = true
		self.dynamicBoneEnable = true
	end

	self.characterMove = self.tfModel:GetComponent("CharacterMove")

	if self.characterMove == nil then
		self.characterMove = self.tfModel.gameObject:AddComponent(typeof(CharacterMove))
	end

	self.characterMove:Init()
	self.characterMove:SetAnimalId(self.animalId)
	self.characterMove:SetOnAnimatorMove(AnimalBase.OnAnimatorMove)

	self.characterConfig = self.tfModel:GetComponent("AnimalConfig")

	local handBoxConfig = self.tfModel:GetComponent("AnimalHandBoxConfig")

	if handBoxConfig ~= nil then
		handBoxConfig:Init(self.animalId, true)
	end

	self.tfLipSync = nil
	self.characterLipSync = nil
	self.characterEyeCtrl = nil
	self.tfAimPin = nil
	self.tfPuppetMaster = nil
	self.characterPuppetMaster = nil
	self.characterPuppetMasterEnable = false
	self.tfCameraBox = nil
	self.tfAttackBox = {}
	self.goParryBox = {}
	self.goParryBoxRender = {}
	self.tfHandBox = {}
	self.tfWeaponBox = {}
	self.tfWeapon = {}
	self.tfWeaponRender = {}
	self.tfWeaponMaterial = {}
	self.tfWeaponRenderEnable = {}
	self.tfWeaponRenderVisible = {}
	self.tfEquipment = {}
	self.tfEquipmentRender = {}
	self.tfEquipmentMaterial = {}
	self.tfEquipmentRenderEnable = {}
	self.tfEquipmentRenderVisible = {}
	self.bodyAttackCube = {}
	self.bodyHandCube = {}
	self.bodyHandBoxConfig = nil
	self.bodyHitCube = {}
	self.tfBody = nil
	self.tfBodyRender = nil
	self.tfBodyMaterial = nil
	self.tfBodyRenderEnable = false
	self.tfBodyRenderVisible = {}
	self.tfBodyHair = nil
	self.tfBodyHairRender = nil
	self.tfBodyHairMaterial = nil
	self.tfBodyHairRenderEnable = false
	self.tfBodyHairRenderVisible = {}
	self.tfBodyParts = nil
	self.tfBodyPartsRender = nil
	self.tfBodyPartsMaterial = nil
	self.tfBodyPartsRenderEnable = false
	self.tfBodyPartsRenderVisible = {}
	self.tfBodyGrounder = nil
	self.tfBodyPoseTilt = {}
	self.finalIkBipedIK = nil
	self.finalIkBodyTilt = nil
	self.finalIkAimIK = nil
	self.finalIkHitReaction = nil
	self.finalIkHitReactionEnable = false
	self.finalIkLookAtIK = nil
	self.characterRouteCollider = nil
	self.characterBodyColliderEnable = false
	self.characterCollider = nil
	self.characterColliderIndexList = {}
	self.characterColliderWeak = false
	self.skillColliderIndexList = {}

	local layerName = LayerAnimal

	if self.isHost == true then
		layerName = LayerHost
	end

	if self.heroId == 90010 then
		layerName = LayerEffect2
	end

	local layerBoneName = LayerAnimalBone
	local layerBodyName = LayerAnimalBody
	local layerBodyBoneName = LayerAnimalBodyBone
	local layerParryName = LayerAnimalSkill

	XTransform.SetLayer(self.animalId, layerName)

	if self.type ~= AnimalBase_Define.Type.HomeBase then
		local len = self.tfModel.childCount
		local tmpModelName = string.lower(self.modelNameWithSkin)

		for i = 0, len - 1 do
			local _tf = self.tfModel:GetChild(i)
			local childName = _tf.name

			if StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_AttackBox) == true then
				self:InitAttackBox(_tf, childName, AnimalBase_Define.ObjName_AttackBox)
			elseif StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_ParryBox) == true then
				self:InitParryBox(_tf, childName, AnimalBase_Define.ObjName_ParryBox)

				_tf.gameObject.layer = layerParryName
			elseif StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_CameraBox) == true then
				self.tfCameraBox = _tf
			elseif StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_WeaponBox) == true then
				self:InitWeaponBox(_tf, childName, AnimalBase_Define.ObjName_WeaponBox)
			elseif StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_Weapon) == true then
				self:InitWeapon(_tf, childName, AnimalBase_Define.ObjName_Weapon)

				_tf.gameObject.layer = layerName
			elseif StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_BodyPoseTilt) == true then
				table.insert(self.tfBodyPoseTilt, _tf)
			elseif StringHelper.StartsWith(childName, AnimalBase_Define.ObjName_Equipment) == true then
				self:InitEquipment(_tf, childName, AnimalBase_Define.ObjName_Equipment)

				_tf.gameObject.layer = layerName
			elseif childName == AnimalBase_Define.ObjName_AimPinBox then
				self.tfAimPin = _tf
			elseif childName == tmpModelName .. "_PuppetMaster" then
				self.tfPuppetMaster = _tf
			elseif childName == AnimalBase_Define.ObjName_HitReaction then
				self.finalIkHitReaction = _tf:GetComponent("RootMotion.FinalIK.HitReaction")

				if self.finalIkHitReaction ~= nil then
					self.finalIkHitReaction.enabled = true
					self.finalIkHitReactionEnable = true
				end
			elseif childName == AnimalBase_Define.ObjName_RouteCollider then
				if self.parasitic <= 0 then
					self.characterRouteCollider = _tf:GetComponent(typeof("UnityEngine.CapsuleCollider"))
				end

				if self.characterRouteCollider ~= nil then
					self.characterRouteCollider.enabled = true

					XCollider.SetAnimalRouteCollider(self.animalId, self.characterRouteCollider)
				else
					_tf.gameObject:SetActive(false)
				end
			elseif childName == AnimalBase_Define.ObjName_BodyCollider then
				if self.useBodyBone <= 0 and self.parasitic <= 0 then
					self.characterCollider = _tf:GetComponent(typeof("UnityEngine.CapsuleCollider"))
				end

				if self.characterCollider ~= nil then
					self.characterCollider.enabled = true
					self.characterBodyColliderEnable = true

					XCollider.SetAnimalBodyCollider(self.animalId, self.characterCollider)

					_tf.gameObject.layer = layerBodyName
				else
					_tf.gameObject:SetActive(false)
				end
			elseif childName == AnimalBase_Define.ObjName_HitCollider then
				if self.useHitBone <= 0 then
					local _tf_collider = _tf:GetComponent(typeof("UnityEngine.Collider"))

					if _tf_collider ~= nil then
						if self.useBodyBone > 0 then
							_tf.gameObject.layer = layerBodyBoneName
						else
							_tf.gameObject.layer = layerBoneName
						end

						local colliderIndex = XCollider.AddAnimalBoneCollider(self.animalId, _tf_collider)

						_tf_collider.enabled = true

						self:AddAnimalBoneCollider(colliderIndex, _tf_collider)
					end
				else
					_tf.gameObject:SetActive(false)
				end
			elseif childName == "m_" .. self.heroIdWithSkin then
				self.tfBody = _tf
				self.tfBodyRender = _tf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

				if self.tfBodyRender == nil then
					self.tfBodyRender = _tf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))
				end

				if self.tfBodyRender ~= nil then
					self.tfBodyRender.enabled = true
					self.tfBodyRenderEnable = true

					self:InitVisibleValue(self.tfBodyRenderVisible, true)
				else
					self.tfBodyRenderEnable = false

					self:InitVisibleValue(self.tfBodyRenderVisible, false)
				end

				_tf.gameObject.layer = layerName
			elseif childName == "m_" .. self.heroIdWithSkin .. "_hair" then
				self.tfBodyHair = _tf
				self.tfBodyHairRender = _tf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

				if self.tfBodyHairRender == nil then
					self.tfBodyHairRender = _tf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))
				end

				if self.tfBodyHairRender ~= nil then
					self.tfBodyHairRender.enabled = true
					self.tfBodyHairRenderEnable = true

					self:InitVisibleValue(self.tfBodyHairRenderVisible, true)
				else
					self.tfBodyHairRenderEnable = false

					self:InitVisibleValue(self.tfBodyHairRenderVisible, false)
				end

				_tf.gameObject.layer = layerName
			elseif childName == "m_" .. self.heroIdWithSkin .. "_parts" then
				self.tfBodyParts = _tf
				self.tfBodyPartsRender = _tf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

				if self.tfBodyPartsRender == nil then
					self.tfBodyPartsRender = _tf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))
				end

				if self.tfBodyPartsRender ~= nil then
					self.tfBodyPartsRender.enabled = true
					self.tfBodyPartsRenderEnable = true

					self:InitVisibleValue(self.tfBodyPartsRenderVisible, true)
				else
					self.tfBodyPartsRenderEnable = false

					self:InitVisibleValue(self.tfBodyPartsRenderVisible, false)
				end

				_tf.gameObject.layer = layerName
			elseif childName == AnimalBase_Define.ObjName_BoneRoot1 or childName == AnimalBase_Define.ObjName_BoneRoot2 then
				local _tfs = _tf:GetComponentsInChildren(typeof("UnityEngine.Transform"), true)
				local _len = _tfs.Length

				for j = 0, _len - 1 do
					local _tf_child = _tfs[j]
					local _childName = _tf_child.name

					if self.useBodyBone > 0 or self.useHitBone > 0 then
						if StringHelper.StartsWith(_childName, AnimalBase_Define.ObjName_WallBox) == true then
							_tf_child.gameObject.layer = LayerWallOpaque
						else
							local _tf_child_collider = _tf_child.gameObject:GetComponent(typeof("UnityEngine.Collider"))

							if _tf_child_collider ~= nil then
								if self.useBodyBone > 0 then
									_tf_child.gameObject.layer = layerBodyBoneName
								else
									_tf_child.gameObject.layer = layerBoneName
								end

								local colliderIndex = XCollider.AddAnimalBoneCollider(self.animalId, _tf_child_collider)

								_tf_child_collider.enabled = true

								self:AddAnimalBoneCollider(colliderIndex, _tf_child_collider)

								self.characterBodyColliderEnable = true
							end
						end
					end

					if StringHelper.StartsWith(_childName, AnimalBase_Define.ObjName_WeaponBox) == true then
						self:InitWeaponBox(_tf_child, _childName, AnimalBase_Define.ObjName_WeaponBox)
					elseif StringHelper.StartsWith(_childName, AnimalBase_Define.ObjName_Weapon) == true then
						self:InitWeapon(_tf_child, _childName, AnimalBase_Define.ObjName_Weapon)

						_tf_child.gameObject.layer = layerName
					elseif StringHelper.StartsWith(_childName, AnimalBase_Define.ObjName_AttackBox) == true then
						self:InitAttackBox(_tf_child, _childName, AnimalBase_Define.ObjName_AttackBox)
					elseif StringHelper.StartsWith(_childName, AnimalBase_Define.ObjName_ParryBox) == true then
						self:InitParryBox(_tf_child, _childName, AnimalBase_Define.ObjName_ParryBox)

						_tf_child.gameObject.layer = layerParryName
					elseif StringHelper.StartsWith(_childName, AnimalBase_Define.ObjName_Equipment) == true then
						self:InitEquipment(_tf_child, _childName, AnimalBase_Define.ObjName_Equipment)

						_tf_child.gameObject.layer = layerName
					elseif _childName == AnimalBase_Define.ObjName_AimTransform then
						self.tfAimTransform = _tf_child
					end
				end
			elseif childName == AnimalBase_Define.ObjName_LipSync then
				self.tfLipSync = _tf
				self.characterLipSync = _tf:GetComponent("RogoDigital.Lipsync.LipSync")
				self.characterEyeCtrl = _tf:GetComponent("RogoDigital.EyeController")

				self.tfLipSync.gameObject:SetActive(false)
			elseif childName == AnimalBase_Define.ObjName_BodyGrounder then
				self.tfBodyGrounder = _tf
			end
		end

		self.finalIkBipedIK = self.tfModel:GetComponent("RootMotion.FinalIK.FullBodyBipedIK")

		if self.finalIkBipedIK ~= nil then
			self.finalIkBipedIK.enabled = true
		end

		self.finalIkBodyTilt = self.tfModel:GetComponent("RootMotion.FinalIK.BodyTilt")

		if self.finalIkBodyTilt ~= nil then
			self.finalIkBodyTilt.enabled = false
		end

		self.finalIkAimIK = self.tfModel:GetComponent("RootMotion.FinalIK.AimIK")

		if self.finalIkAimIK ~= nil then
			self.finalIkAimIK.enabled = false
		end

		self.finalIkAimIKWeight = 0
		self.finalIkLookAtIK = self.tfModel:GetComponent("RootMotion.FinalIK.LookAtIK")

		if self.finalIkLookAtIK ~= nil then
			self.finalIkLookAtIK.enabled = false
		end

		self.lookAtController = self.tfModel:GetComponent("LookAtController")

		if self.lookAtController ~= nil then
			self.lookAtController.enabled = false
		end

		self.animalAim = self.tfModel:GetComponent("AnimalAim")

		if self.animalAim ~= nil then
			self.animalAim.enabled = true
		end

		if self.finalIkBodyTilt == nil or self.finalIkBodyTilt.enabled == false then
			for k, _tf in pairs(self.tfBodyPoseTilt) do
				_tf.gameObject:SetActive(false)
			end
		end

		if self.tfPuppetMaster ~= nil then
			self.characterPuppetMaster = self.tfPuppetMaster:GetComponent("RootMotion.Dynamics.PuppetMaster")

			if self.characterPuppetMaster ~= nil then
				self.characterPuppetMaster.pinWeight = 1
				self.characterPuppetMaster.muscleWeight = 1
				self.characterPuppetMaster.enabled = true

				self.tfPuppetMaster.gameObject:SetActive(true)
			end

			self.characterPuppetMasterEnable = true
		end

		self.tfBoneLeftFoot = XAnimator.GetBoneTransform(self.animalId, UnityEngine.HumanBodyBones.LeftFoot)
		self.tfBoneRightFoot = XAnimator.GetBoneTransform(self.animalId, UnityEngine.HumanBodyBones.RightFoot)
		self.tfBoneHips = XAnimator.GetBoneTransform(self.animalId, UnityEngine.HumanBodyBones.Hips)
		self.tfBoneHead = XAnimator.GetBoneTransform(self.animalId, UnityEngine.HumanBodyBones.Head)
		self.tfBoneChest = XAnimator.GetBoneTransform(self.animalId, UnityEngine.HumanBodyBones.Chest)
		self.tfBoneSpine = XAnimator.GetBoneTransform(self.animalId, UnityEngine.HumanBodyBones.Spine)
	end

	self:SetBodyScale(self.heroData.Scale)

	for skillIndex, comboMax in pairs(self.animalConfig.skillComboMax) do
		if self.tfAttackBox[skillIndex] ~= nil then
			for combo, tfBox in pairs(self.tfAttackBox[skillIndex]) do
				if tfBox ~= nil then
					local shape = self:GetSkillColliderShape(skillIndex, combo)
					local tmpCube = XCube.CreateXCube(self:GetName(), tfBox, shape, XCube.ColliderType.SkillBox)

					if tmpCube ~= nil then
						if self.bodyAttackCube[skillIndex] == nil then
							self.bodyAttackCube[skillIndex] = {}
						end

						self.bodyAttackCube[skillIndex][combo] = tmpCube
					end
				end
			end
		end
	end

	for handId, boxList in pairs(self.tfHandBox) do
		if boxList ~= nil then
			for index, tfBox in pairs(boxList) do
				if tfBox ~= nil then
					local tmpCube = XCube.CreateXCube(self:GetName(), tfBox, XCube.ShapeType.Cube, XCube.ColliderType.SkillBox)

					if tmpCube ~= nil then
						if self.bodyHandCube[handId] == nil then
							self.bodyHandCube[handId] = {}
						end

						table.insert(self.bodyHandCube[handId], tmpCube)

						local handBoxConfig = tfBox:GetComponent("AnimalHandBoxConfig")

						if handBoxConfig ~= nil then
							if self.bodyHandBoxConfig == nil then
								self.bodyHandBoxConfig = {}
							end

							if self.bodyHandBoxConfig[handId] == nil then
								self.bodyHandBoxConfig[handId] = {}
							end

							handBoxConfig:Init(self.animalId, false)
							table.insert(self.bodyHandBoxConfig[handId], handBoxConfig)
						end
					end
				end
			end
		end
	end

	if self.type ~= AnimalBase_Define.Type.HomeBase and self.type ~= AnimalBase_Define.Type.Other then
		local pathFindingAI = self.tfModel:GetComponent(typeof(ProjectXPathFindingAI))

		if pathFindingAI == nil then
			pathFindingAI = self.tfModel.gameObject:AddComponent(typeof(ProjectXPathFindingAI))
		end

		ProjectXPathFindingAI.AddPathFinder(self.animalId, pathFindingAI)
	end
end

function AnimalBase:UpdateSkin()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false then
		return
	end

	local newSkin = BattleData.ConvertHeroIdWithSkin(self.heroId)

	if newSkin == self.heroIdWithSkin then
		return
	end

	if self.loadCharacterManager == nil then
		return
	end

	local tfCharaObj = self.loadCharacterManager:LoadCharacter(newSkin, LoadCharacterManager.LoadType.Game)

	if tfCharaObj == nil then
		return
	end

	tfCharaObj:SetParent(self.tfSelf)
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
	self:StopSkill()
	self:ExitModel()
	self.loadCharacterManager:UnloadCharacter(self.heroIdWithSkin, self.tfModel)

	self.tfModel = tfCharaObj

	self.tfModel.gameObject:SetActive(true)

	self.heroIdWithSkin = newSkin
	self.modelNameWithSkin = BattleData.GetHeroName(self.heroIdWithSkin)

	self:InitModel()
	self:InitSkin()
end

function AnimalBase:InitSkin()
	self:SetHeroMaterial()
	self:InitAnimatorParamFloat()
	ProjectXPathFindingAI.InitPathFinder(self.animalId)
	self:RefreshTransform(true)
	self:SetCharacterPuppetMaster(false, 1, 1)
	self:SetBodyCollider(true)

	if self.parasitic <= 0 then
		if DebugAIControl == true then
			if self.isHostBack == false or self:IsHostTeam() == false then
				self:Show()
			else
				self:Hide()
			end
		elseif self.isHostBack == false then
			self:Show()
		else
			self:Hide()
		end
	end

	self:UpdateQuality(false)
	self:Restart()
end

function AnimalBase:InitAttackBox(childTf, childName, attackBoxName)
	local boxName = StringHelper.Substring(childName, string.len(attackBoxName) + 1, string.len(childName))
	local boxNames = StringHelper.Split(boxName, "_")
	local tmpSkillIndex = tonumber(boxNames[1])
	local tmpSkillCombo = tonumber(boxNames[2])

	if tmpSkillIndex > 900 then
		local handId = tmpSkillIndex - 900

		if handId > 0 then
			if self.tfHandBox[handId] == nil then
				self.tfHandBox[handId] = {}
			end

			self.tfHandBox[handId][tmpSkillCombo] = childTf
		end
	else
		if self.tfAttackBox[tmpSkillIndex] == nil then
			self.tfAttackBox[tmpSkillIndex] = {}
		end

		self.tfAttackBox[tmpSkillIndex][tmpSkillCombo] = childTf
	end
end

function AnimalBase:InitParryBox(childTf, childName, parryBoxName)
	if childTf ~= nil then
		table.insert(self.goParryBox, childTf.gameObject)

		if DebugShowAttackBox == true then
			local childRender = childTf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

			if childRender == nil then
				childRender = childTf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))
			end

			table.insert(self.goParryBoxRender, childRender)
		end

		local collider = childTf.gameObject:GetComponent(typeof("UnityEngine.Collider"))

		if collider ~= nil then
			local colliderIndex = XCollider.AddAnimalSkillCollider(self.animalId, collider)

			self:AddAnimalSkillCollider(colliderIndex, collider)
		end

		childTf.gameObject:SetActive(false)
	end
end

function AnimalBase:InitWeaponBox(childTf, childName, weaponBoxName)
	local boxName = StringHelper.Substring(childName, string.len(weaponBoxName) + 1, string.len(childName))
	local weaponBoxIndex = tonumber(boxName)

	self.tfWeaponBox[weaponBoxIndex] = childTf
end

function AnimalBase:InitWeapon(childTf, childName, weaponName)
	local indexName = StringHelper.Substring(childName, string.len(weaponName) + 1, string.len(childName))
	local weaponIndex = tonumber(indexName)

	self.tfWeapon[weaponIndex] = childTf
	self.tfWeaponRender[weaponIndex] = childTf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

	if self.tfWeaponRender[weaponIndex] == nil then
		self.tfWeaponRender[weaponIndex] = childTf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))
	end

	self.tfWeaponRender[weaponIndex].enabled = true
	self.tfWeaponRenderEnable[weaponIndex] = true

	if self.tfWeaponRenderVisible[weaponIndex] == nil then
		self.tfWeaponRenderVisible[weaponIndex] = {}
	end

	self:InitVisibleValue(self.tfWeaponRenderVisible[weaponIndex], true)
end

function AnimalBase:InitEquipment(childTf, childName, equipName)
	local indexName = StringHelper.Substring(childName, string.len(equipName) + 1, string.len(childName))
	local equipIndex = tonumber(indexName)

	self.tfEquipment[equipIndex] = childTf
	self.tfEquipmentRender[equipIndex] = childTf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

	if self.tfEquipmentRender[equipIndex] == nil then
		self.tfEquipmentRender[equipIndex] = childTf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))
	end

	self.tfEquipmentRender[equipIndex].enabled = true
	self.tfEquipmentRenderEnable[equipIndex] = true

	if self.tfEquipmentRenderVisible[equipIndex] == nil then
		self.tfEquipmentRenderVisible[equipIndex] = {}
	end

	self:InitVisibleValue(self.tfEquipmentRenderVisible[equipIndex], true)
end

function AnimalBase:StartBattle()
	return
end

function AnimalBase:ExitBattle()
	if self:IsDead() == false then
		self:ResetState()
	end

	self:SetMoveCage(false, Vector3.s_zero, 0)
	self:ClearSkillEffectAll()
	self:ClearSkillEffectLoopAll()
	self:ClearSelfEffectLoopAll()

	if self.monsterEffect ~= nil then
		self.monsterEffect:Clear()
	end

	self.monsterEffect = nil

	if self.sanMonsterCrazyEffect ~= nil then
		self.sanMonsterCrazyEffect:Clear()
	end

	self.sanMonsterCrazyEffect = nil

	self:ClearTrickTouch()
	self:ClearSkillTouchAttackPlayer()
	self:ClearSkillTouchHitPlayer()
	self:ClearSkillTouchHitShell()
	self:ClearTouchHitCombo()
	self:ClearStatusAll()
end

function AnimalBase:Exit()
	self.exitFlg = true

	self:ExitDone()
end

function AnimalBase:ExitDone()
	if self.exitDoneFlg == true then
		return
	end

	self:UnloadChangeMaterial()
	self:ExitModel()

	if self.loadCharacterManager ~= nil then
		self.loadCharacterManager:UnloadCharacter(self.heroIdWithSkin, self.tfModel)
	end

	if self.tfSelf ~= nil then
		GoDestroy(self.tfSelf.gameObject)

		self.tfSelf = nil
		self.tfModel = nil
	end

	if self.animalValue ~= nil then
		self.animalValue:Exit()

		self.animalValue = nil
	end

	self.animalConfig = nil
	self.heroExtData = nil
	self.heroPropertyData = nil
	self.beTree = nil

	if self.animalBrain ~= nil then
		self.animalBrain:Exit()

		self.animalBrain = nil
	end

	self.sceneController = nil
	self.loadCharacterManager = nil
	self.scene = nil
	self.gameController = nil
	self.characterLogicRuleList = nil
	self.characterStoryLogicRuleList = nil
	self.cameraScene = nil
	self.controllerBullet = nil
	self.controllerCollider = nil
	self.controllerTimer = nil
	self.groundNormal = nil
	self.groundForward = nil
	self.moveTouchGroundId = nil
	self.moveTouchFogColor = nil
	self.targetWorldPos = nil
	self.gravityCenterPosition = nil
	self.aimPosition = nil
	self.joystickMoveDir = nil
	self.joystickMoveDirLast = nil
	self.animatorParamList = nil
	self.paramDisable = nil
	self.paramThreshold = nil
	self.moveDir = nil
	self.moveDirLookAt = nil
	self.moveDirInertia = nil
	self.moveDirFramePos = nil
	self.moveDirLocal = nil
	self.moveDirLocalDodge = nil
	self.moveDirDodge = nil
	self.moveDirAim = nil
	self.moveDirAimOld = nil
	self.moveDirAimTarget = nil
	self.moveDirAimStartHorizontalDir = nil
	self.moveFallDir = nil
	self.deadPosition = nil
	self.rebornPosition = nil
	self.rebornLook = nil
	self.rebornPropertyList = nil
	self.uiHeadInfoPosition = nil
	self.uiDamageInfoPosition = nil
	self.movePositionOld = nil
	self.movePositionLast = nil
	self.movePosition = nil
	self.movePositionNew = nil
	self.moveRotationNew = nil
	self.moveFootprintPosition = nil
	self.moveFindPathPositionForAI = nil
	self.moveFixBoneHostTf = nil
	self.moveRotationOld = nil
	self.moveRotation = nil
	self.moveRotationInverse = nil
	self.moveRotationForward = nil
	self.moveRotationBack = nil
	self.moveRotationLeft = nil
	self.moveRotationRight = nil
	self.moveWindDir = nil
	self.moveTimeLineTargetPos = nil
	self.moveTimeLineTargetRot = nil
	self.moveTimeLineDir = nil
	self.moveAutoRunTarget = nil
	self.moveDialogPos = nil
	self.moveDialogLook = nil
	self.moveSlopeSlipSpeed = nil

	if self.moveHitData ~= nil then
		self.moveHitData:Clear()
	end

	self.moveHitData = nil
	self.skillBlockJump = nil
	self.skillNextList = nil
	self.skillThrowSpeed = nil
	self.skillThrowSpeedAcc = nil
	self.skillButtonTarget = nil
	self.skillAimTarget = nil
	self.skillTargetReady = nil
	self.skillTarget = nil
	self.skillTargetAI = nil
	self.skillLockAnimal = nil
	self.skillExecuteTarget = nil
	self.skillExecuteAttackPosition = nil
	self.skillExecuteHitPosition = nil
	self.skillExecuteHost = nil
	self.skillBackstabTarget = nil
	self.skillBackstabAttackPosition = nil
	self.skillBackstabHitPosition = nil
	self.skillBackstabHost = nil
	self.skillHitTowardPosition = nil
	self.skillColliderCubeList = nil
	self.skillColliderCubeConfigList = nil
	self.skillColliderParryList = nil
	self.skillTouchHitList = nil
	self.skillTouchAttackList = nil
	self.skillTouchHitComboList = nil
	self.skillTouchHitShellList = nil
	self.skillAttackerList = nil
	self.trickTouchList = nil
	self.statusList = nil
	self.statusPropertyMaxValueList = nil
	self.heroData = nil
	self.damageWeakHeight = nil
	self.sight = nil

	if self.vPlayer ~= nil then
		self.vPlayer:Exit()
	end

	self.vPlayer = nil
	self.exitDoneFlg = true
end

function AnimalBase:SetType(type)
	self.type = type
end

function AnimalBase:IsType(type)
	if self.type == type then
		return true
	end

	return false
end

function AnimalBase:SetMonsterType(type)
	local oldType = self.monsterType

	self.monsterType = type

	if self.monsterType == AnimalBase_Define.MonsterType.SanMonster then
		if oldType ~= AnimalBase_Define.MonsterType.SanMonster then
			self:ChangeMaterial(self.loadCharacterManager:GetSanMaterial())
		end
	elseif self.monsterType == AnimalBase_Define.MonsterType.CallHero and oldType ~= AnimalBase_Define.MonsterType.CallHero then
		if self:IsHostTeam() == true then
			self:ChangeMaterial(self.loadCharacterManager:GetSanBlueMaterial())
		else
			self:ChangeMaterial(self.loadCharacterManager:GetSanRedMaterial())
		end
	end
end

function AnimalBase:IsMonsterType(type)
	if self.monsterType == type then
		return true
	end

	return false
end

function AnimalBase:SetMemberId(id)
	self.memberId = id
end

function AnimalBase:SetStoryMonsterId(id)
	self.storyMonsterId = id
end

function AnimalBase:SetNickName(name)
	self.nickName = name
end

function AnimalBase:GetNickName()
	return self.nickName
end

function AnimalBase:GetTeamId()
	return self.teamId
end

function AnimalBase:GetHeroId()
	return self.heroId
end

function AnimalBase:GetHeroIdWithSkin()
	return self.heroIdWithSkin
end

function AnimalBase:GetAnimalId()
	return self.animalId
end

function AnimalBase:GetMemberId()
	return self.memberId
end

function AnimalBase:GetStoryMonsterId()
	return self.storyMonsterId
end

function AnimalBase:SetLevel(level)
	self.animalLevel = level
end

function AnimalBase:GetLevel()
	return self.animalLevel
end

function AnimalBase:AddGrade(isStart)
	local toMovie = false

	if self.boss > 0 and BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self.gameController:IsBossMode() == false then
		return toMovie
	end

	self.animalGrade = self.animalGrade + 1

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		if self.isHost == false then
			local propertyData

			if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
				local mazeLevel = FS_UserData.story:GetMazeLevel()

				propertyData = MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(self.heroId, mazeLevel, self.animalGrade)
			else
				propertyData = MS_StoryMonsterProperty.GetStoryMonsterProperty(self.storyId, self:GetStoryMonsterId(), self.animalGrade)
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
				local challengeData = MS_StoryChallenge.GetDataByHeroId(self.heroId)

				if challengeData ~= nil then
					propertyData = MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(self.heroId, FS_UserData.story:GetChallengeLevel(), self.animalGrade)
				end
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				propertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(self.heroId, FS_UserData.story:GetDifficulty(), self.animalGrade)
			end

			if propertyData ~= nil then
				self.animalValue:SetHeroPropertyData(propertyData)
				self.animalValue:RefreshPropertyAll(isStart, false, nil)
			end

			if self.boss > 0 and self.heroExtData.BossFinal > 0 then
				local hpNow = self.animalValue:GetProperty(MS_HeroData.Property.Hp)
				local hpMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
				local diff = hpMax * 0.5 - hpNow

				if diff > 0 then
					self.animalValue:AddProperty(MS_HeroData.Property.Hp, diff)
				end

				toMovie = self.gameController:BossGradeUp(self)

				if toMovie == true then
					self.gameController:ClearCallMonsterAll()
				end
			end
		end

		if toMovie == false then
			self:AddGradeAfter(false)
		else
			self:ClearSkillButtonAll()
			self:ClearMoveButtonAll()
			self:StopSkill()
			self:StopSkillAudio()
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
		end
	else
		self:AddGradeAfter(false)
	end

	return toMovie
end

function AnimalBase:AddGradeAfter(fromMovie)
	if fromMovie == true then
		self:ClearSkillButtonAll()
		self:ClearMoveButtonAll()
		self:StopSkill()
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	end

	self:ShowGradeEffect()

	if self.boss > 0 then
		self.gameController:BossGradeUpAfter(self)
	end
end

function AnimalBase:ResetGrade()
	self.animalGrade = 1

	self:ShowGradeEffect()

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self.isHost == false then
		local propertyData

		if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			local mazeLevel = FS_UserData.story:GetMazeLevel()

			propertyData = MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(self.heroId, mazeLevel, self.animalGrade)
		else
			propertyData = MS_StoryMonsterProperty.GetStoryMonsterProperty(self.storyId, self:GetStoryMonsterId(), self.animalGrade)
		end

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			local challengeData = MS_StoryChallenge.GetDataByHeroId(self.heroId)

			if challengeData ~= nil then
				propertyData = MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(self.heroId, FS_UserData.story:GetChallengeLevel(), self.animalGrade)
			end
		end

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			propertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(self.heroId, FS_UserData.story:GetDifficulty(), self.animalGrade)
		end

		if propertyData ~= nil then
			self.animalValue:SetHeroPropertyData(propertyData)
			self.animalValue:RefreshPropertyAll(false, false, nil)
		end
	end
end

function AnimalBase:GetGradeThreshold()
	return 1
end

function AnimalBase:GetGrade()
	return self.animalGrade
end

function AnimalBase:GetName()
	return self.tfSelfName
end

function AnimalBase:GetTransform()
	return self.tfModel
end

function AnimalBase:GetModel()
	return self.tfModel
end

function AnimalBase:GetModelName()
	return self.modelName
end

function AnimalBase:GetVirtualPlayer()
	if self.vPlayer ~= nil then
		self.vPlayer:UpdateInfo(self)

		return self.vPlayer
	end

	return nil
end

function AnimalBase:AddAnimalSkillCollider(colliderIndex, collider)
	if colliderIndex >= 0 then
		if self.skillColliderIndexList[colliderIndex] == nil then
			self.skillColliderIndexList[colliderIndex] = collider
		else
			SystemHelper.LogError("=========AddAnimalSkillCollider====error!!!colliderIndex=" .. colliderIndex)
		end
	end
end

function AnimalBase:GetAnimalSkillCollider(colliderIndex)
	if self.skillColliderIndexList[colliderIndex] ~= nil then
		return self.skillColliderIndexList[colliderIndex]
	end

	return nil
end

function AnimalBase:AddAnimalBoneCollider(colliderIndex, collider)
	if colliderIndex >= 0 then
		local weakIndex = -1

		if self.characterConfig ~= nil then
			weakIndex = self.characterConfig:GetWeakColliderIndex(collider)

			if weakIndex >= 0 then
				self.characterColliderWeak = true
			end
		end

		if self.characterColliderIndexList[colliderIndex] == nil then
			self.characterColliderIndexList[colliderIndex] = {
				collider,
				weakIndex
			}
		else
			SystemHelper.LogError("=========AddAnimalBoneCollider====error!!!colliderIndex=" .. colliderIndex)
		end
	end
end

function AnimalBase:GetAnimalCollider(colliderIndex)
	if self.characterColliderIndexList[colliderIndex] ~= nil then
		return self.characterColliderIndexList[colliderIndex][1]
	end

	return nil
end

function AnimalBase:GetAnimalColliderByWeakIndex(weakIndex)
	for k, v in pairs(self.characterColliderIndexList) do
		if v ~= nil and v[2] == weakIndex then
			return v[1]
		end
	end

	return nil
end

function AnimalBase:GetAnimalColliderWeakIndex(colliderIndex)
	if self.characterColliderIndexList[colliderIndex] ~= nil then
		return self.characterColliderIndexList[colliderIndex][2]
	end

	return -1
end

function AnimalBase:IsSightVisible(animal)
	if self:IsWillDead() == true or self:IsShow() == false then
		return false
	end

	if animal == nil or animal:IsWillDead() == true or animal:IsShow() == false then
		return false
	end

	if self.isHost == true and self.isHostBack == true then
		return false
	end

	local nowTime = TimeHelper.getNowTime()
	local id = animal.animalId

	if self.sight[id] ~= nil then
		local tmpVisible = self.sight[id][1]
		local tmpTime = self.sight[id][2]

		if nowTime < tmpTime + AnimalBase_Define.SightUpdateTimeInterval then
			return tmpVisible
		end
	else
		self.sight[id] = {}
	end

	local myPos = self:GetGravityCenterPosition()

	if self.isHost == true and self.isHostBack == false then
		myPos = self.cameraScene:GetCameraRealPosition()
	elseif self:GetBodyHead() ~= nil then
		myPos = self:GetBodyHead().position
	end

	local targetPos = animal:GetGravityCenterPosition()

	if animal:GetBodyHead() ~= nil then
		targetPos = animal:GetBodyHead().position
	end

	local rayDirection = targetPos - myPos
	local ret = XPhysics.Raycast(myPos.x, myPos.y, myPos.z, rayDirection.x, rayDirection.y, rayDirection.z, rayDirection.magnitude, GameAI.CheckInsightLayerMask)

	self.sight[id][1] = not ret
	self.sight[id][2] = nowTime

	return not ret
end

function AnimalBase:UpdateSightVisible()
	local deleteList

	for k, v in pairs(self.sight) do
		local tmpAnimal = self.sceneController:FindPlayerById(k)

		if tmpAnimal == nil then
			if deleteList == nil then
				deleteList = {}
			end

			table.insert(deleteList, k)
		end
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local k = deleteList[i]

			self.sight[k] = nil
		end
	end

	deleteList = nil
end

function AnimalBase:IsShow()
	return self.showFlg
end

function AnimalBase:IsShowByAct()
	return self.showByActFlg
end

function AnimalBase:SetDynamicBoneEnabled(flg)
	if self.dynamicBone ~= nil and self.dynamicBoneEnable ~= flg then
		self.dynamicBone.enabled = flg
		self.dynamicBoneEnable = flg
	end
end

function AnimalBase:ResetDynamicBone()
	if self.dynamicBone ~= nil and self.dynamicBoneEnable == true then
		self.dynamicBone:Reset()
	end
end

function AnimalBase:Hide()
	self:SetDynamicBoneEnabled(false)
	self:Stop()

	self.showFlg = false

	if self.isHost == false and self.beTree ~= nil then
		self.beTree:Stop()
	end

	if self.isHost == true then
		local oldFix = self.moveFix

		self:SetMoveFix(true)
		self:SetPosByWorldPos(AnimalBase_Define.MotionPositionHide, true)
		self:SetMoveFix(oldFix)
		self:SetCharacterPuppetMaster(false, 1, 1)
		XTransform.HideAnimal(self.animalId)
	else
		XTransform.HideAnimal(self.animalId)
	end

	self:ClearSelfEffectLoopAll()

	if self.monsterEffect ~= nil then
		self.monsterEffect:Clear()
	end

	self.monsterEffect = nil

	if self.sanMonsterCrazyEffect ~= nil then
		self.sanMonsterCrazyEffect:Clear()
	end

	self.sanMonsterCrazyEffect = nil
	self.animatorParamRecovery = true
end

function AnimalBase:Show()
	if self.showFlg == true then
		return
	end

	self.showFlg = true

	if self.isHost == false and self.beTree ~= nil then
		self.beTree:Reset()
	end

	if self.isHost == true then
		self:SetCharacterPuppetMaster(false, 1, 1)
		XTransform.ShowAnimal(self.animalId)
	else
		XTransform.ShowAnimal(self.animalId)
	end

	self:SetDynamicBoneEnabled(true)
	self:UpdateQuality(false)
	self:Restart()
	self:ShowGradeEffect()
	self:RecoveryAnimatorParamFloat()

	if self.animalValue ~= nil then
		self.animalValue:ShowValue()
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self.isHost == true and self.isHostBack == false then
		if self.animalValue:IsPropertyMax(MS_HeroData.Property.Rage) == true then
			UIManager.SendMessage("Mainmenu", "ShowTempGuideBottom", self.heroId)
		else
			UIManager.SendMessage("Mainmenu", "CloseTempGuideBottom")
		end
	end
end

function AnimalBase:SetHeroMaterial()
	local heroId = self.heroIdWithSkin

	if self.loadCharacterManager:IsHaveCharacterMaterial(heroId) == true then
		return
	end

	if self.tfBodyRender ~= nil then
		self.loadCharacterManager:SetCharacterMaterial(heroId, AnimalBase_Define.RenderType.Body, self.tfBodyRender.sharedMaterial)
	end

	if self.tfBodyHairRender ~= nil then
		self.loadCharacterManager:SetCharacterMaterial(heroId, AnimalBase_Define.RenderType.BodyHair, self.tfBodyHairRender.sharedMaterial)
	end

	if self.tfBodyPartsRender ~= nil then
		self.loadCharacterManager:SetCharacterMaterial(heroId, AnimalBase_Define.RenderType.BodyParts, self.tfBodyPartsRender.sharedMaterial)
	end

	if self.tfEquipmentRender ~= nil then
		for index, render in pairs(self.tfEquipmentRender) do
			if render ~= nil then
				self.loadCharacterManager:SetCharacterMaterial2(heroId, AnimalBase_Define.RenderType.Equipment, index, render.sharedMaterial)
			end
		end
	end

	if self.tfWeaponRender ~= nil then
		for index, render in pairs(self.tfWeaponRender) do
			if render ~= nil then
				self.loadCharacterManager:SetCharacterMaterial2(heroId, AnimalBase_Define.RenderType.Weapon, index, render.sharedMaterial)
			end
		end
	end
end

function AnimalBase:RecoveryHeroMaterial()
	local heroId = self.heroIdWithSkin

	if self.loadCharacterManager:IsHaveCharacterMaterial(heroId) == false then
		return
	end

	if self.tfBodyRender ~= nil and self.loadCharacterManager:GetCharacterMaterial(heroId, AnimalBase_Define.RenderType.Body) ~= nil then
		self.tfBodyRender.sharedMaterial = self.loadCharacterManager:GetCharacterMaterial(heroId, AnimalBase_Define.RenderType.Body)
	end

	if self.tfBodyHairRender ~= nil and self.loadCharacterManager:GetCharacterMaterial(heroId, AnimalBase_Define.RenderType.BodyHair) ~= nil then
		self.tfBodyHairRender.sharedMaterial = self.loadCharacterManager:GetCharacterMaterial(heroId, AnimalBase_Define.RenderType.BodyHair)
	end

	if self.tfBodyPartsRender ~= nil and self.loadCharacterManager:GetCharacterMaterial(heroId, AnimalBase_Define.RenderType.BodyParts) ~= nil then
		self.tfBodyPartsRender.sharedMaterial = self.loadCharacterManager:GetCharacterMaterial(heroId, AnimalBase_Define.RenderType.BodyParts)
	end

	if self.tfWeaponRender ~= nil then
		for index, render in pairs(self.tfWeaponRender) do
			if render ~= nil and self.loadCharacterManager:GetCharacterMaterial2(heroId, AnimalBase_Define.RenderType.Weapon, index) ~= nil then
				render.sharedMaterial = self.loadCharacterManager:GetCharacterMaterial2(heroId, AnimalBase_Define.RenderType.Weapon, index)
			end
		end
	end

	if self.tfEquipmentRender ~= nil then
		for index, render in pairs(self.tfEquipmentRender) do
			if render ~= nil and self.loadCharacterManager:GetCharacterMaterial2(heroId, AnimalBase_Define.RenderType.Equipment, index) ~= nil then
				render.sharedMaterial = self.loadCharacterManager:GetCharacterMaterial2(heroId, AnimalBase_Define.RenderType.Equipment, index)
			end
		end
	end
end

function AnimalBase:ChangeMaterial(mat)
	if self.materialChanged == true or mat == nil then
		return
	end

	if self.tfBodyRender ~= nil and self.tfBodyMaterial == nil then
		self.tfBodyRender.materials = {}
		self.tfBodyRender.material = mat
		self.tfBodyMaterial = self.tfBodyRender.material
	end

	if self.tfBodyHairRender ~= nil and self.tfBodyHairMaterial == nil then
		self.tfBodyHairRender.materials = {}
		self.tfBodyHairRender.material = mat
		self.tfBodyHairMaterial = self.tfBodyHairRender.material
	end

	if self.tfBodyPartsRender ~= nil and self.tfBodyPartsMaterial == nil then
		self.tfBodyPartsRender.materials = {}
		self.tfBodyPartsRender.material = mat
		self.tfBodyPartsMaterial = self.tfBodyPartsRender.material
	end

	if self.tfWeaponRender ~= nil and self.tfWeaponMaterial ~= nil then
		for index, render in pairs(self.tfWeaponRender) do
			if render ~= nil and self.tfWeaponMaterial[index] == nil then
				render.materials = {}
				render.material = mat
				self.tfWeaponMaterial[index] = render.material
			end
		end
	end

	if self.tfEquipmentRender ~= nil and self.tfEquipmentMaterial ~= nil then
		for index, render in pairs(self.tfEquipmentRender) do
			if render ~= nil and self.tfEquipmentMaterial[index] == nil then
				render.materials = {}
				render.material = mat
				self.tfEquipmentMaterial[index] = render.material
			end
		end
	end

	self.materialChanged = true
end

function AnimalBase:GetMainMaterialColor()
	if self.tfBodyMaterial ~= nil then
		return self.tfBodyMaterial:GetColor("_Color")
	end

	return nil
end

function AnimalBase:ChangeMaterialColor(color)
	if self.tfBodyMaterial ~= nil then
		self.tfBodyMaterial:SetColor("_Color", color)
	end

	if self.tfBodyHairMaterial ~= nil then
		self.tfBodyHairMaterial:SetColor("_Color", color)
	end

	if self.tfBodyPartsMaterial ~= nil then
		self.tfBodyPartsMaterial:SetColor("_Color", color)
	end

	if self.tfWeaponMaterial ~= nil then
		for index, mat in pairs(self.tfWeaponMaterial) do
			if mat ~= nil then
				mat:SetColor("_Color", color)
			end
		end
	end

	if self.tfEquipmentMaterial ~= nil then
		for index, mat in pairs(self.tfEquipmentMaterial) do
			if mat ~= nil then
				mat:SetColor("_Color", color)
			end
		end
	end
end

function AnimalBase:ChangeDissolveThreshold(value)
	if self.materialChanged == false then
		return
	end

	if self.tfBodyMaterial ~= nil then
		self.tfBodyMaterial:SetFloat("_DissolveThreshold", value)
	end

	if self.tfBodyHairMaterial ~= nil then
		self.tfBodyHairMaterial:SetFloat("_DissolveThreshold", value)
	end

	if self.tfBodyPartsMaterial ~= nil then
		self.tfBodyPartsMaterial:SetFloat("_DissolveThreshold", value)
	end

	for index, material in pairs(self.tfWeaponMaterial) do
		if material ~= nil then
			material:SetFloat("_DissolveThreshold", value)
		end
	end

	for index, material in pairs(self.tfEquipmentMaterial) do
		if material ~= nil then
			material:SetFloat("_DissolveThreshold", value)
		end
	end
end

function AnimalBase:UnloadChangeMaterial()
	if self.tfBodyMaterial ~= nil then
		GoDestroy(self.tfBodyMaterial)
	end

	self.tfBodyMaterial = nil

	if self.tfBodyHairMaterial ~= nil then
		GoDestroy(self.tfBodyHairMaterial)
	end

	self.tfBodyHairMaterial = nil

	if self.tfBodyPartsMaterial ~= nil then
		GoDestroy(self.tfBodyPartsMaterial)
	end

	self.tfBodyPartsMaterial = nil

	if self.tfWeaponMaterial ~= nil then
		for index, material in pairs(self.tfWeaponMaterial) do
			if material ~= nil then
				GoDestroy(material)
			end
		end
	end

	self.tfWeaponMaterial = nil

	if self.tfEquipmentMaterial ~= nil then
		for index, material in pairs(self.tfEquipmentMaterial) do
			if material ~= nil then
				GoDestroy(material)
			end
		end
	end

	self.tfEquipmentMaterial = nil
	self.materialChanged = false

	self:RecoveryHeroMaterial()
end

function AnimalBase:Ready()
	if self.boss > 0 and self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
		self.boss = 0
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.HomeBase, 1)

		if locatorData ~= nil then
			self:SetPosByWorldPos(locatorData.Position, true)
			self:UpdatePositionLast()
		end
	elseif self.type == AnimalBase_Define.Type.Other then
		-- block empty
	else
		if self:GetMemberId() > 0 then
			local locatorData

			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
				if self.isHost == true then
					self:SetPosByWorldPos(FS_UserData.story:GetBornPos(), true)
					self:LookAt(FS_UserData.story:GetBornLook(), true)
					self:SetRebornPosition(FS_UserData.story:GetRebornPos())
					self:SetRebornLook(FS_UserData.story:GetRebornLook())
					self:UpdatePositionLast()
				end
			else
				locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, self:GetTeamId() * ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornJump + self:GetMemberId())
			end

			if locatorData ~= nil then
				self:SetPosByWorldPos(locatorData.Position, true)
				self:LookAt(locatorData.Orientation, true)
				self:SetRebornPosition(locatorData.Position)
				self:SetRebornLook(locatorData.Orientation)
				self:UpdatePositionLast()
			end
		end

		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Born then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.Force)
		end
	end

	self:AddValue()

	self.vPlayer = VirtualPlayer:new(self)

	self:SetHeroMaterial()
	self:InitAnimatorParamFloat()

	if self.isHost == false and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		if BattleData.IsDarkForestScene() == true or BattleData.IsDreamScene() == true then
			self:ChangeMaterial(self.loadCharacterManager:GetSanMaterial())
		elseif MS_StoryList.IsStoryMaze(self.storyId) and self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == false then
			self:ChangeMaterial(self.loadCharacterManager:GetSanMaterial())
		end
	end
end

function AnimalBase:Start()
	self.animalValue:Start()
	ProjectXPathFindingAI.InitPathFinder(self.animalId)
	self:SetCharacterPuppetMaster(false, 1, 1)
	self:SetBodyCollider(true)

	if self.isHost == true then
		if self.isHostBack == false then
			self:SetUI()
		end
	else
		self:AddBrain()
	end

	self.showByActFlg = true

	if self.parasitic <= 0 then
		if DebugAIControl == true then
			if self.isHostBack == false or self:IsHostTeam() == false then
				self:Show()
			else
				self:Hide()
			end
		elseif self.isHostBack == false then
			self:Show()
		else
			self:Hide()
		end
	end

	self:UpdateQuality(false)

	self.gameController = self.sceneController:GetGameController()
	self.isStart = true

	self:Restart()

	if self.isHost == false and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		if self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.NightmareStart, AnimalBase_Define.MoveStateChangeLevel.Force)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ChangeDissolveThreshold(1)
			VfxManager.PlayBindMulti(self:GetTransform(), AnimalBase_Define.VfxName_NightmareStart)

			if self.monsterEffect == nil then
				self.monsterEffect = VfxManager.PlayBindMulti(self:GetTransform(), AnimalBase_Define.VfxName_Nightmare)
			end
		elseif self:IsMonsterType(AnimalBase_Define.MonsterType.CrateMonster) == true then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.NightmareStart, AnimalBase_Define.MoveStateChangeLevel.Force)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ChangeDissolveThreshold(1)
			VfxManager.PlayBindMulti(self:GetTransform(), AnimalBase_Define.VfxName_NightmareStart)

			if self.monsterEffect == nil then
				self.monsterEffect = VfxManager.PlayBindMulti(self:GetBodyChest(), AnimalBase_Define.VfxName_CrateMonster)
			end
		elseif self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == true then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.CallStart, AnimalBase_Define.MoveStateChangeLevel.Force)
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:ChangeDissolveThreshold(1)
			VfxManager.PlayBindMulti(self:GetTransform(), AnimalBase_Define.VfxName_NightmareStart)

			if self.monsterEffect == nil then
				self.monsterEffect = VfxManager.PlayBindMulti(self:GetTransform(), AnimalBase_Define.VfxName_Nightmare)
			end
		elseif BattleData.IsDarkForestScene() == true or BattleData.IsDreamScene() == true then
			self:ChangeDissolveThreshold(0)

			if self.monsterEffect == nil then
				self.monsterEffect = VfxManager.PlayBindMulti(self:GetTransform(), AnimalBase_Define.VfxName_Nightmare)
			end

			self.animalBrain:SetAnimalCrazy(true)
		end
	end
end

function AnimalBase:IsStart()
	return self.isStart
end

function AnimalBase:IsHost()
	return self.isHost
end

function AnimalBase:SetHostBack(flg)
	if self.isHostBack == true and flg == false then
		if self.animalValue ~= nil then
			self.animalValue:RefreshPropertyAll(false, false, nil)
		end

		self:ClearSkillButtonAll()
		self:ClearMoveButtonAll()
		XTransform.SetHostId(self.animalId)
	end

	self.isHostBack = flg

	if self.isHost == true then
		self:SetCharacterPuppetMaster(false, 1, 1)
	end
end

function AnimalBase:IsHostBack()
	return self.isHostBack
end

function AnimalBase:IsHostTeam()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.teamId == 1 then
		return true
	end

	return false
end

function AnimalBase:IsBoss()
	if self.boss > 0 then
		return true
	end

	return false
end

function AnimalBase:IsMyTeam(teamId)
	if self.teamId == teamId then
		return true
	end

	return false
end

function AnimalBase:GetHeight()
	if self.type == AnimalBase_Define.Type.HomeBase or self.type == AnimalBase_Define.Type.Other then
		return AnimalBase_Define.HomeBaseHeight
	else
		return self.animalHeight
	end
end

function AnimalBase:GetRadius()
	return self.animalRadius
end

function AnimalBase:GetSkinWidth()
	return self.animalSkinWidth
end

function AnimalBase:GetSkinWidthRouteCollider()
	return self.animalSkinWidth
end

function AnimalBase:GetCameraLookHeightDiff()
	return self.cameraLookHeight
end

function AnimalBase:GetCameraLockedInfo()
	return self.cameraLockHeight, self.cameraLockAngleByHeight, self.cameraLockAngleByDis, self.cameraLockLookY
end

function AnimalBase:GetCameraDistanceRate()
	if self.moveTouchZoneType == SceneBase.ZoneType.ZoneElevator then
		return AnimalBase_Define.CameraDistanceRateElevator
	else
		return self.cameraDistanceRate
	end
end

function AnimalBase:SetBodyScale(scale)
	self.animalSkinWidth = self.heroData.BodySkinWidth

	local bodyRadius = self.heroData.BodyRadius

	if MS_StoryList.IsStoryCarriage(self.storyId) == true then
		bodyRadius = AnimalBase_Define.CarriageBodyRadius
	end

	local bodyHeight = self.heroData.BodyHeight
	local bodyCenterY = self.heroData.BodyCenterY
	local bodyBackstabRadius = self.heroData.BodyBackstabRadius
	local bodyExecuteRadius = self.heroData.BodyExecuteRadius

	self:SetBodyScaleDetail(scale, bodyRadius, bodyHeight, bodyCenterY, bodyBackstabRadius, bodyExecuteRadius)
end

function AnimalBase:SetBodyScaleDetail(scale, radius, height, centerY, backstabRadius, executeRadius)
	if self.tfModel ~= nil then
		self.tfModel.localScale = Vector3.one * scale
	end

	self.modelScale = scale

	if self.characterCollider ~= nil then
		self.characterCollider.center = Vector3.New(0, centerY, 0)
		self.characterCollider.radius = radius
		self.characterCollider.height = height
	end

	local tmpHeight = Mathf.Max(centerY + height / 2, radius * 2)

	self.animalRadius = radius * scale
	self.footCapsuleRadius = self.animalRadius * AnimalBase_Define.AnimalFootRadiusRatio
	self.routeCapsuleRadius = self.animalRadius + AnimalBase_Define.AnimalRouteColliderSkin

	local tmpBottom = AnimalBase_Define.AnimalRouteColliderOffsetY
	local tmpTop = Mathf.Max(tmpBottom + radius * 2, tmpHeight)

	self.routeCapsuleCenterY = (tmpTop + tmpBottom) * scale / 2
	self.routeCapsuleHeight = (tmpTop - tmpBottom) * scale

	if self.characterRouteCollider ~= nil then
		self.characterRouteCollider.center = Vector3.New(0, self.routeCapsuleCenterY / scale, 0)
		self.characterRouteCollider.radius = self.routeCapsuleRadius / scale
		self.characterRouteCollider.height = self.routeCapsuleHeight / scale
	end

	self.animalBackstabRadius = backstabRadius
	self.animalExecuteRadius = executeRadius
	self.animalHeight = tmpHeight * scale
end

function AnimalBase:SetScene(tmpScene)
	self.scene = tmpScene

	if self.animalValue ~= nil then
		self.animalValue:SetScene(self.scene)
	end
end

function AnimalBase:GetScene()
	return self.scene
end

function AnimalBase:SetSceneCamera(camera)
	self.cameraScene = camera
end

function AnimalBase:IsPermitOpenMenu()
	if self:IsWillDead() == true or self:IsStop() == true or self.gameController:IsStopAttack() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove or self:IsEvent(self.moveStateNow) == true or self:IsEventLoop(self.moveStateNow) == true or self:IsEventEnd(self.moveStateNow) == true or self:IsSkilling() == true then
		return false
	end

	return true
end

function AnimalBase:IsPermitUseQuickItem()
	if self:IsWillDead() == true or self:IsStop() == true or self.gameController:IsStopAttack() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove or self:IsEvent(self.moveStateNow) == true or self:IsEventLoop(self.moveStateNow) == true or self:IsEventEnd(self.moveStateNow) == true then
		return false
	end

	if self:IsSkilling() == true then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if skillData.BtnPressType == MS_SkillData.PressType.LongPress or skillData.BtnComboPressType == MS_SkillData.PressType.LongPress then
			local buttonLongPress = self:GetLongPressButton()

			if buttonLongPress > 0 then
				return false
			end
		end
	end

	return true
end

function AnimalBase:GetUIRageLineDiff()
	return 0
end

function AnimalBase:SetUI()
	UIManager.SendMessage("Mainmenu", "ShowHeroPanel", self.modelName, self.animalId)
	self.animalValue:RefreshPropertyAll(false, false, nil)
end

function AnimalBase:GetSceneCamera()
	return self.cameraScene
end

function AnimalBase:SetControllerBullet(bulletCtrl)
	self.controllerBullet = bulletCtrl
end

function AnimalBase:SetControllerCollider(colliderCtrl)
	self.controllerCollider = colliderCtrl
end

function AnimalBase:SetControllerTimer(timerCtrl)
	self.controllerTimer = timerCtrl
end

function AnimalBase:UpdateQuality(force)
	if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
		if self.finalIkBodyTilt ~= nil then
			self.finalIkBodyTilt.enabled = true
		end

		if self.tfBodyGrounder ~= nil then
			self.tfBodyGrounder.gameObject:SetActive(true)
		end
	else
		if self.finalIkBodyTilt ~= nil then
			self.finalIkBodyTilt.enabled = false
		end

		if self.tfBodyGrounder ~= nil then
			self.tfBodyGrounder.gameObject:SetActive(false)
		end
	end

	if self.finalIkBodyTilt == nil or self.finalIkBodyTilt.enabled == false then
		for k, _tf in pairs(self.tfBodyPoseTilt) do
			_tf.gameObject:SetActive(false)
		end
	else
		for k, _tf in pairs(self.tfBodyPoseTilt) do
			_tf.gameObject:SetActive(true)
		end
	end
end

function AnimalBase:SetCharacterBodyIKEnable(enable)
	if enable == true and (self.moveFix == true or self.moveGhost == true) then
		return
	end

	if self.finalIkBipedIK ~= nil then
		self.finalIkBipedIK.enabled = enable
	end
end

function AnimalBase:SetCharacterLookAt(defaultPos, targetPos, delayTime, speed)
	if defaultPos == nil then
		return
	end

	self.characterLookAtPos:SetVector3(defaultPos)

	self.characterLookAtChangeTime = 0
	self.characterLookAtSpeed = 0

	if targetPos ~= nil then
		self.characterLookAtPosTarget:SetVector3(targetPos)

		if delayTime > 0 then
			self.characterLookAtChangeTime = TimeHelper.getNowTime() + delayTime
		else
			self.characterLookAtPos:SetVector3(self.characterLookAtPosTarget)
		end

		self.characterLookAtSpeed = speed
	else
		self.characterLookAtPosTarget:SetVector3(defaultPos)
	end

	if self.finalIkLookAtIK ~= nil then
		self.finalIkLookAtIK.solver.IKPosition = self.characterLookAtPos
	end
end

function AnimalBase:UpdateCharacterLookAt()
	if self.characterLookAtChangeTime > 0 then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.characterLookAtChangeTime then
			if self.characterLookAtSpeed > 0 then
				local pos = self:GetPosByWorldPos()
				local dirToPos = self.characterLookAtPos - pos
				local dirToPosDis = dirToPos.magnitude

				dirToPos:SetNormalize()

				local dirToPosTarget = self.characterLookAtPosTarget - pos
				local dirToPosTargetDis = dirToPosTarget.magnitude

				dirToPosTarget:SetNormalize()

				local dirRot = Quaternion.LookRotation(dirToPos)
				local dirRotTarget = Quaternion.LookRotation(dirToPosTarget)
				local speed = self.characterLookAtSpeed * ControllerMain.GetLogicDeltaTime()
				local rot = Quaternion.Lerp(dirRot, dirRotTarget, speed)

				dirToPos:SetVector3(Vector3.s_forward)
				dirToPos:MulQuat(rot)

				local dis = Mathf.Lerp(dirToPosDis, dirToPosTargetDis, speed)

				dirToPos:SetNormalize()
				dirToPos:Mul(dis)
				self.characterLookAtPos:SetVector3(pos)
				self.characterLookAtPos:Add(dirToPos)

				dirToPos = nil
				dirToPosTarget = nil
				dirRot = nil
				dirRotTarget = nil
				rot = nil
			else
				self.characterLookAtPos:SetVector3(self.characterLookAtPosTarget)
			end

			if self.finalIkLookAtIK ~= nil then
				self.finalIkLookAtIK.solver.IKPosition = self.characterLookAtPos
			end
		end
	end
end

function AnimalBase:CreateHeadInfo()
	if self.isHost ~= true and self.type ~= AnimalBase_Define.Type.HomeBase and self.type ~= AnimalBase_Define.Type.Other or DebugShowHostHeader and self.isHost == true then
		-- block empty
	else
		return
	end

	UIManager.SendMessage("HeadInfo", "CreateInfo", self.animalId, self.heroId, self.teamId)

	if self.boss > 0 then
		local hpMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)

		UIManager.SendMessage("Mainmenu", "CreateBossHpBar", self:GetNickName(), 1, hpMax)
		UIManager.SendMessage("HeadInfo", "SetAlwaysHide", self.animalId)
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == false and self:IsHostTeam() == true and self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == false then
		UIManager.SendMessage("HeadInfo", "SetAlwaysHide", self.animalId)
	end

	UIManager.SendMessage("HeadInfo", "SetName", self.animalId, self:GetNickName(), self:IsHostTeam(), false)
end

function AnimalBase:UpdateHeadInfo()
	if self.isHost == true and not DebugShowHostHeader then
		return
	end

	if self:IsDead() == true then
		return
	end

	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase or self.type == AnimalBase_Define.Type.Other then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == false and self:IsHostTeam() == true and self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == false then
		return
	end

	if self.boss > 0 then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			if self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
				UIManager.SendMessage("Mainmenu", "ShowBossHpBar", true)
			else
				UIManager.SendMessage("Mainmenu", "ShowBossHpBar", false)
			end
		else
			UIManager.SendMessage("Mainmenu", "ShowBossHpBar", self:GetAITarget() ~= nil)
		end
	else
		UIManager.SendMessage("HeadInfo", "UpdateInfo", self.animalId, self:GetUIHeadInfoPosition())
	end
end

function AnimalBase:GetUIHeadInfoPosition()
	self.uiHeadInfoPosition:SetVector3(self:GetPosByWorldPos())

	if self.parasitic > 0 and self:GetBodyHead() ~= nil then
		self.uiHeadInfoPosition:SetVector3(self:GetBodyHead().position)
	end

	self.uiHeadInfoPosition.y = self.uiHeadInfoPosition.y + self.headInfoHeight

	return self.uiHeadInfoPosition
end

function AnimalBase:GetUIDamageInfoPosition(colliderWeakIndex)
	local tmpHeight = self.damageInfoHeight

	self.uiDamageInfoPosition:SetVector3(self:GetPosByWorldPos())

	if colliderWeakIndex >= 0 and colliderWeakIndex < AnimalBase_Define.AnimalColliderWeakMax then
		local colliderWeak = self:GetAnimalColliderByWeakIndex(colliderWeakIndex)

		if colliderWeak ~= nil then
			tmpHeight = self.damageWeakHeight[colliderWeakIndex + 1]

			self.uiDamageInfoPosition:SetVector3(colliderWeak.transform.position)
		end
	end

	self.uiDamageInfoPosition.y = self.uiDamageInfoPosition.y + tmpHeight

	return self.uiDamageInfoPosition
end

function AnimalBase:ShowLockMark(flag)
	if self.type == AnimalBase_Define.Type.HomeBase or self.type == AnimalBase_Define.Type.Other then
		return
	end

	UIManager.SendMessage("HeadInfo", "ShowLock", self.animalId, flag)
end

function AnimalBase:GetRotation()
	return self.moveRotation
end

function AnimalBase:GetRotationInverse()
	return self.moveRotationInverse
end

function AnimalBase:SetTurnSpeedAI(standSpeed, moveSpeed)
	self.moveSpeedStandTurnAI = standSpeed
	self.moveSpeedMoveTurnAI = moveSpeed
end

function AnimalBase:SetTurnAngleMinAI(standAngleMin, moveAngleMin)
	self.moveAngleStandTurnMinAI = standAngleMin
	self.moveAngleMoveTurnMinAI = moveAngleMin
end

function AnimalBase:SetTurnTypeAI(turnType)
	self.moveTurnTypeAI = turnType
end

function AnimalBase:LookAt(look, immediately)
	self.moveDirLookAt:SetVector3(look)
	self.moveDirLookAt:SetNormalize()

	if immediately == true then
		local targetRot = Quaternion.LookRotation(look)

		self:SetRotation(targetRot, false)

		targetRot = nil
	else
		local lookLocal = self:GetRotationInverse() * look

		lookLocal.y = 0

		lookLocal:SetNormalize()

		self.moveTurnTarget = Mathf.Atan2(lookLocal.x, lookLocal.z)

		if self.isHost == true and self.moveStateNow ~= AnimalBase_Define.MoveStateType.StoryEnterMove and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMove and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMoveForce then
			local targetRot = Quaternion.LookRotation(look)
			local angle = Quaternion.Angle(self:GetRotation(), targetRot)
			local angleMin = AnimalBase_Define.MotionMoveRotationAngleMin

			if self.moveSpeed <= 0 then
				angleMin = AnimalBase_Define.MotionStandRotationAngleMin
			end

			if angle < angleMin then
				self:SetRotation(targetRot, false)

				self.moveTurnTarget = 0
			else
				local targetRot2 = targetRot
				local turnSpeed = AnimalBase_Define.MotionMoveRotationSpeed

				if self.moveSpeed <= 0 then
					turnSpeed = AnimalBase_Define.MotionStandRotationSpeed
				end

				targetRot2 = Quaternion.Lerp(self:GetRotation(), targetRot, ControllerMain.GetLogicDeltaTime() * turnSpeed)

				self:SetRotation(targetRot2, false)

				targetRot2 = nil
			end

			targetRot = nil
		else
			local turnSpeed = self.moveSpeedMoveTurnAI

			if self.moveSpeed <= 0 then
				turnSpeed = self.moveSpeedStandTurnAI
			end

			if self:IsSkilling() == true then
				local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

				if skillData ~= nil then
					turnSpeed = skillData.TurnSpeed
				end
			end

			local angleMin = self.moveAngleMoveTurnMinAI

			if self.moveSpeed <= 0 then
				angleMin = self.moveAngleStandTurnMinAI
			end

			local tmpAngle = Vector3.Angle(self:GetForward(), look)

			if angleMin > Mathf.Abs(tmpAngle) then
				if self.moveSpeed > 0 and self:IsSkilling() == false then
					local targetRot = Quaternion.LookRotation(look)

					self:SetRotation(targetRot, false)

					targetRot = nil
				else
					self:RotateY(self.moveTurnTarget * turnSpeed * ControllerMain.GetLogicDeltaTime())
				end

				self.moveTurnTarget = 0
			elseif self.moveTurnTypeAI == AnimalBase_Define.TurnType.Fast or self:IsLockingPlayer() == true then
				local targetRot = Quaternion.LookRotation(look)
				local targetRot2 = Quaternion.Lerp(self:GetRotation(), targetRot, ControllerMain.GetLogicDeltaTime() * turnSpeed)

				self:SetRotation(targetRot2, false)

				targetRot = nil
				targetRot2 = nil
			else
				self:RotateY(self.moveTurnTarget * turnSpeed * ControllerMain.GetLogicDeltaTime())
			end
		end
	end
end

function AnimalBase:SetRotation(rot, isStart)
	self.moveRotation:SetFixed(false)
	self.moveRotation:SetQuaternion(rot)
	self.moveRotation:SetFixed(true)
	self:UpdateRotationOption()

	if isStart == true then
		self:RefreshTransform(isStart)
	end
end

function AnimalBase:RotateY(angle)
	if MathHelper.IsZero(angle) == false then
		local rot = Quaternion.Euler(0, angle, 0)

		self.moveRotation:SetFixed(false)
		self.moveRotation:MulQuat(rot)
		self.moveRotation:SetFixed(true)
		self:UpdateRotationOption()

		rot = nil
	end
end

function AnimalBase:UpdateRotationOption()
	self.moveRotationInverse = self.moveRotation:Inverse()

	self.moveRotationForward:Set(0, 0, 1)
	self.moveRotationForward:MulQuat(self:GetRotation())
	self.moveRotationForward:SetNormalize()

	self.moveRotationForward.y = 0

	self.moveRotationBack:SetVector3(self.moveRotationForward)
	self.moveRotationBack:Unm()
	self.moveRotationRight:Set(1, 0, 0)
	self.moveRotationRight:MulQuat(self:GetRotation())
	self.moveRotationRight:SetNormalize()

	self.moveRotationRight.y = 0

	self.moveRotationLeft:SetVector3(self.moveRotationRight)
	self.moveRotationLeft:Unm()
end

function AnimalBase:GetForward()
	return self.moveRotationForward
end

function AnimalBase:GetBack()
	return self.moveRotationBack
end

function AnimalBase:GetRight()
	return self.moveRotationRight
end

function AnimalBase:GetLeft()
	return self.moveRotationLeft
end

function AnimalBase:SetMoveFix(flg)
	local oldFix = self.moveFix

	self.moveFix = flg

	if oldFix == true and self.moveFix == false then
		local nowPos = self:GetPosByWorldPos()

		self:AdjustPositionByGround(nowPos, nowPos, true)
		self:SetCharacterBodyIKEnable(true)
	elseif oldFix == false and self.moveFix == true then
		self:SetCharacterBodyIKEnable(false)
	end
end

function AnimalBase:IsMoveFix()
	return self.moveFix
end

function AnimalBase:SetMoveFly(flg)
	self.moveFly = flg
end

function AnimalBase:IsMoveFly()
	return self.moveFly
end

function AnimalBase:SetMoveThroughWall(flg)
	self.moveThroughWall = flg
end

function AnimalBase:SetMoveThroughBody(flg)
	self.moveThroughBody = flg
end

function AnimalBase:SetMoveThroughAll(flg)
	self.moveThroughAll = flg
end

function AnimalBase:SetMoveGhost(flg)
	if self.moveGhost == true and flg == false then
		local nowPos = self:GetPosByWorldPos()

		self:AdjustPositionByGround(nowPos, nowPos, true)
		self:SetCharacterBodyIKEnable(true)
	elseif self.moveGhost == false and flg == true then
		self:SetCharacterBodyIKEnable(false)
	end

	self.moveGhost = flg
end

function AnimalBase:IsMoveGhost()
	return self.moveGhost
end

function AnimalBase:GetPosByWorldPos()
	return self.movePosition
end

function AnimalBase:GetPosByWorldPosLast()
	return self.movePositionLast
end

function AnimalBase:UpdatePositionLast()
	self.movePositionLast:SetVector3(self.movePositionNew)
end

function AnimalBase:GetFootprintPos()
	return self.moveFootprintPosition
end

function AnimalBase:GetFindPathPosForAI()
	return self.moveFindPathPositionForAI
end

function AnimalBase:SetFixBoneHost(fixType, tf, syncRot)
	self.moveFixBoneType = fixType
	self.moveFixBoneHostTf = tf
	self.moveFixBoneSyncRotation = syncRot
end

function AnimalBase:SetPosByWorldPos(pos, isStart)
	local posNew = pos

	if self.moveFix == false and self.moveFly == false and self.moveGhost == false and isStart == true then
		posNew = pos:Clone()

		self:AdjustPositionByGroundFix(posNew)
		self:AdjustPositionByGround(posNew, posNew, isStart)
	end

	self.movePosition:SetFixed(false)
	self.movePosition:SetVector3(posNew)

	if self.moveFix == false and self.moveFly == false and self.moveGhost == false and isStart == true then
		self.movePosition.y = self.groundY
	end

	self.movePosition:SetFixed(true)

	if isStart == true then
		self:RefreshTransform(isStart)
		self:UpdateGravityCenterPosition()

		posNew = nil
	end
end

function AnimalBase:SetTimeLineTargetByWorldPos(pos)
	if self:IsStop() == true or self:IsWillDead() == true or self.moveLock == true then
		return false
	end

	local nowPos = self:GetPosByWorldPos()
	local tmpDir = pos - nowPos

	tmpDir.y = 0

	local disMax = Mathf.Max(GameAI.GetPathDistance, self.animalRadius)

	if tmpDir.sqrMagnitude <= disMax * disMax or Vector3.Dot(tmpDir, self.moveTimeLineDir) <= 0 then
		tmpDir = nil

		return false
	end

	pos = self:FindPathPos(pos)

	self.targetWorldPos:SetVector3(pos)
	self.moveDir:SetVector3(tmpDir)
	self.moveDirLookAt:SetVector3(self.moveDir)
	self.moveDirLookAt:SetNormalize()
	self.moveTimeLineDir:SetVector3(self.moveDir)
	self:UpdateTargetByMoveDir()

	tmpDir = nil

	return true
end

function AnimalBase:SetTargetByWorldPos(pos, isFindPath)
	if self:IsStop() == true or self:IsWillDead() == true or self.moveLock == true then
		return
	end

	local nowPos = self:GetPosByWorldPos()

	if isFindPath == true then
		pos = self:FindPathPos(pos)

		local retPosX, retPosY, retPosZ = 0
		local ret = false

		ret, retPosX, retPosY, retPosZ = ProjectXPathFindingAI.GetPathLastPos(self.animalId, retPosX, retPosY, retPosZ)

		if ret == true then
			local tmpPos = Vector3.New(retPosX, retPosY, retPosZ)
			local dis = Vector3.DistanceSquare(nowPos, tmpPos)

			tmpPos = nil

			if dis < GameAI.GetPathDistance * GameAI.GetPathDistance then
				self:StopMovement()

				return
			end
		end
	else
		ProjectXPathFindingAI.ReleasePath(self.animalId)
	end

	self.targetWorldPos:SetVector3(pos)

	local tmpDir = self.targetWorldPos - nowPos

	self.moveDir:SetVector3(tmpDir)

	self.moveDir.y = 0

	if MathHelper.IsZero(self.moveDir.sqrMagnitude) == false then
		self.moveDirLookAt:SetVector3(self.moveDir)
		self.moveDirLookAt:SetNormalize()
	end

	self:UpdateTargetByMoveDir()

	tmpDir = nil
end

function AnimalBase:GetTargetByWorldPos()
	return self.targetWorldPos
end

function AnimalBase:ChangePullHit(hitType, dir)
	if MathHelper.IsZero(dir.sqrMagnitude) == false then
		local dot = Vector3.Dot(dir, self:GetForward())

		if self:IsHitByType(AnimalBase_Define.HitType.PullBack) == false and self:IsHitByType(AnimalBase_Define.HitType.PullFront) == false and self:IsHitByType(AnimalBase_Define.HitType.PullBackDizzy) == false and self:IsHitByType(AnimalBase_Define.HitType.PullFrontDizzy) == false and self:IsHitByType(AnimalBase_Define.HitType.PullBackFreeze) == false and self:IsHitByType(AnimalBase_Define.HitType.PullFrontFreeze) == false and self:IsHitByType(AnimalBase_Define.HitType.PullBackTackle) == false and self:IsHitByType(AnimalBase_Define.HitType.PullFrontTackle) == false then
			if hitType == AnimalBase_Define.HitType.PullFrontDizzy or hitType == AnimalBase_Define.HitType.PullBackDizzy then
				if dot < 0 then
					self:ChangeHit(AnimalBase_Define.HitType.PullBackDizzy, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				else
					self:ChangeHit(AnimalBase_Define.HitType.PullFrontDizzy, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				end
			elseif hitType == AnimalBase_Define.HitType.PullFrontFreeze or hitType == AnimalBase_Define.HitType.PullBackFreeze then
				if dot < 0 then
					self:ChangeHit(AnimalBase_Define.HitType.PullBackFreeze, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				else
					self:ChangeHit(AnimalBase_Define.HitType.PullFrontFreeze, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				end
			elseif hitType == AnimalBase_Define.HitType.PullFrontTackle or hitType == AnimalBase_Define.HitType.PullBackTackle then
				if dot < 0 then
					self:ChangeHit(AnimalBase_Define.HitType.PullBackTackle, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				else
					self:ChangeHit(AnimalBase_Define.HitType.PullFrontTackle, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				end
			elseif hitType == AnimalBase_Define.HitType.PullFront or hitType == AnimalBase_Define.HitType.PullBack then
				if dot < 0 then
					self:ChangeHit(AnimalBase_Define.HitType.PullBack, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				else
					self:ChangeHit(AnimalBase_Define.HitType.PullFront, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				end
			end
		end

		if self.moveFix == false then
			if self:IsHitByType(AnimalBase_Define.HitType.PullBack) == true or self:IsHitByType(AnimalBase_Define.HitType.PullBackDizzy) == true or self:IsHitByType(AnimalBase_Define.HitType.PullBackFreeze) == true or self:IsHitByType(AnimalBase_Define.HitType.PullBackTackle) == true then
				local tmpDir = -dir

				self:LookAt(tmpDir, true)

				tmpDir = nil
			elseif self:IsHitByType(AnimalBase_Define.HitType.PullFront) == true or self:IsHitByType(AnimalBase_Define.HitType.PullFrontDizzy) == true or self:IsHitByType(AnimalBase_Define.HitType.PullFrontFreeze) == true or self:IsHitByType(AnimalBase_Define.HitType.PullFrontTackle) == true then
				self:LookAt(dir, true)
			end
		end
	end
end

function AnimalBase:PullToPos(pos, dir)
	local posNew = pos:Clone()

	self:AdjustMoveFlash(posNew)
	self:SetPosByWorldPos(posNew, true)

	posNew = nil
end

function AnimalBase:RefreshTransform(isStart)
	if isStart == false and self:IsOnStair() == false and self.moveFly == false and self.moveStateDebugFly == false then
		local addHeight = false

		if self.moveOnGround == true then
			if self.groundSlopeAngle > AnimalBase_Define.MotionSlopeAngleMax then
				addHeight = true
			end
		else
			addHeight = true
		end

		if addHeight == true then
			self.moveDropDamageHeight = self.moveDropDamageHeight + self.movePositionOld.y - self.movePosition.y
		end
	end

	XTransform.SetTransformPosition(self.animalId, self.movePosition.x, self.movePosition.y, self.movePosition.z)
	XTransform.SetTransformRotation(self.animalId, self.moveRotation.x, self.moveRotation.y, self.moveRotation.z, self.moveRotation.w)
	self.movePositionOld:SetVector3(self.movePosition)
	self.moveRotationOld:SetQuaternion(self.moveRotation)
end

function AnimalBase:SetOrientation(pos)
	if self.moveFix == true then
		return false
	end

	local skillDelay = self:IsAnimatorDelay()

	if skillDelay == true then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	local immediately = false
	local orientEnable = false

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self:IsStanding() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.Get or self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CarriageStart or self.moveStateNow == AnimalBase_Define.MoveStateType.BridgeStart or self.moveStateNow == AnimalBase_Define.MoveStateType.DoorStart or self.moveStateNow == AnimalBase_Define.MoveStateType.DoorHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ElevatorStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CageStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKickHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.GateHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallStart or self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.EntranceStart or self.moveStateNow == AnimalBase_Define.MoveStateType.StatueStart or self.moveStateNow == AnimalBase_Define.MoveStateType.FountainStart or self.moveStateNow == AnimalBase_Define.MoveStateType.HoneypotStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CrateStart or self.moveStateNow == AnimalBase_Define.MoveStateType.BonefireStart then
		orientEnable = true
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.OpenCrate or self.moveStateNow == AnimalBase_Define.MoveStateType.OpenGate or self.moveStateNow == AnimalBase_Define.MoveStateType.StairKick or self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKick then
		orientEnable = true
		immediately = true
	end

	if orientEnable == true then
		self:ClearLockPlayer()

		local nowPos = self:GetPosByWorldPos()
		local tmpDir = pos - nowPos

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			self:LookAt(tmpDir, immediately)

			tmpDir = nil

			return true
		end

		tmpDir = nil
	end

	return false
end

function AnimalBase:SetSkillOrientation(pos)
	if self.moveFix == true then
		return false
	end

	local skillDelay = self:IsAnimatorDelay()

	if skillDelay == true then
		return false
	end

	if self:IsFreeSkillEnable() == true then
		self:ClearLockPlayer()
		self:StopMovementImmediately()

		local nowPos = self:GetPosByWorldPos()
		local lookPos = pos:Clone()

		lookPos.y = nowPos.y

		local tmpDir = lookPos - nowPos

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			self:LookAt(tmpDir, true)
		end

		return true
	end

	return false
end

function AnimalBase:RotateAngleY(angle)
	if self.moveOnGround == true and self.moveLock == false and (self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self:IsStanding() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove or self.moveStateNow == AnimalBase_Define.MoveStateType.Revert or self:IsSkilling() == true) then
		self:RotateY(angle)

		return true
	end

	return false
end

function AnimalBase:GetBodyHips()
	return self.tfBoneHips
end

function AnimalBase:GetBodyHead()
	return self.tfBoneHead
end

function AnimalBase:GetBodyChest()
	return self.tfBoneChest
end

function AnimalBase:GetBodySpine()
	return self.tfBoneSpine
end

function AnimalBase:GetGravityCenterPosition()
	return self.gravityCenterPosition
end

function AnimalBase:GetGravityCenterY()
	local ret = self:GetHeight() / 2

	if self.moveJumpY > 0 then
		ret = ret + self.moveJumpY
	end

	return ret
end

function AnimalBase:UpdateGravityCenterPosition()
	self.gravityCenterPosition:SetFixed(false)
	self.gravityCenterPosition:SetVector3(self:GetPosByWorldPos())

	self.gravityCenterPosition.y = self.gravityCenterPosition.y + self:GetGravityCenterY()

	self.gravityCenterPosition:SetFixed(true)
end

function AnimalBase:GetAimY()
	return self:GetHeight() * 3 / 4
end

function AnimalBase:GetAimPosition()
	if self:GetBodyChest() ~= nil then
		self.aimPosition:SetVector3(self:GetBodyChest().position)
	else
		self.aimPosition:SetVector3(self:GetPosByWorldPos())

		self.aimPosition.y = self.aimPosition.y + self:GetAimY()
	end

	return self.aimPosition
end

function AnimalBase:UpdateTargetByMoveDir()
	if MathHelper.IsZero(self.moveDir.sqrMagnitude) == true then
		self.moveDir:Set(0, 0, 0)
		self.targetWorldPos:SetVector3(self:GetPosByWorldPos())

		self.moveFlg = false
	else
		local nowPos = self:GetPosByWorldPos()

		self.targetWorldPos:SetVector3(nowPos + self.moveDir)

		self.moveFlg = true
	end
end

function AnimalBase:CheckJoystickMoveDir(dir, touch)
	if touch == true then
		self.joystickMoveDir:Set(dir.x, dir.z)

		if self.joystickMoveDir.sqrMagnitude >= self.joystickRadiusForMoveInner * self.joystickRadiusForMoveInner then
			if MathHelper.IsZero(self.joystickMoveDirLast.sqrMagnitude) == false then
				self.joystickMoveChangeAngle = Vector2.Angle(self.joystickMoveDirLast, self.joystickMoveDir)
			end

			self.joystickMoveDirLast:SetVector2(self.joystickMoveDir)

			self.joystickMoveInnerEndTime = TimeHelper.getNowTime() + AnimalBase_Define.JoystickInnerClearTimeLimit

			if self.joystickMoveDir.sqrMagnitude > self.joystickRadiusForMoveOuter * self.joystickRadiusForMoveOuter then
				self:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Fast)
			else
				self:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
			end
		elseif TimeHelper.getNowTime() > self.joystickMoveInnerEndTime then
			self.joystickMoveDir:Set(0, 0)
		else
			self.joystickMoveDir:SetVector2(self.joystickMoveDirLast)
		end
	else
		self:ResetJoystickMoveDir()
	end
end

function AnimalBase:ResetJoystickMoveDir()
	if self.joystickMoveDir ~= nil then
		self.joystickMoveDir:Set(0, 0)
	end

	if self.joystickMoveDirLast ~= nil then
		self.joystickMoveDirLast:Set(0, 0)
	end

	self.joystickMoveChangeAngle = 0
	self.joystickMoveInnerEndTime = 0
end

function AnimalBase:SetDebugAutoRun(flg, x, y, z)
	ProjectXPathFindingAI.ReleasePath(self.animalId)

	self.moveAutoRunFlg = flg

	if flg == true then
		self:LogTest("SetDebugAutoRun x = " .. x .. ", y = " .. y .. ",z = " .. z)
		self.moveAutoRunTarget:Set(x, y, z)
	end
end

function AnimalBase:IsDebugAutoRun()
	return self.moveAutoRunFlg
end

function AnimalBase:SetJoystickMoveDir(dir, touch)
	if self:IsStop() == true or self:IsWillDead() == true or self.moveLock == true or self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.Special or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce then
		return
	end

	if DebugAutoRun == true and touch == true and self.moveAutoRunFlg == true then
		self:SetTargetByWorldPos(self.moveAutoRunTarget, true)

		return
	end

	self:CheckJoystickMoveDir(dir, touch)

	self.moveDir.x = self.joystickMoveDir.x
	self.moveDir.y = 0
	self.moveDir.z = self.joystickMoveDir.y
	self.moveDirChangeAngle = self.joystickMoveChangeAngle

	if MathHelper.IsZero(self.moveDir.sqrMagnitude) == false then
		self.moveDirLookAt:SetVector3(self.moveDir)
		self.moveDirLookAt:SetNormalize()
	end

	self:UpdateTargetByMoveDir()

	self.moveStairClimbSpeed = AnimalBase_Define.StairClimbSpeed.Normal

	if touch == true then
		local nowTime = TimeHelper.getNowTime()

		if self.moveStairTouchTime <= 0 then
			self.moveStairTouchTime = nowTime
		elseif dir.y < 0 and self.moveStairDir == AnimalBase_Define.StairTouch.Down or dir.y > 0 and self.moveStairDir == AnimalBase_Define.StairTouch.Up then
			local diffTime = nowTime - self.moveStairTouchTime

			if diffTime > AnimalBase_Define.StairTouchSpeedUpTime then
				self.moveStairClimbSpeed = AnimalBase_Define.StairClimbSpeed.Fast
			end
		end

		if dir.y < 0 then
			self.moveStairDir = AnimalBase_Define.StairTouch.Down
		elseif dir.y > 0 then
			self.moveStairDir = AnimalBase_Define.StairTouch.Up
		else
			self.moveStairDir = AnimalBase_Define.StairTouch.Empty
		end
	else
		self.moveStairDir = AnimalBase_Define.StairTouch.Empty
	end
end

function AnimalBase:SetMoveChangeAngle(angle)
	self.moveDirChangeAngle = angle
end

function AnimalBase:PressUpSkillButton(button)
	if button > 0 and self.skillButtonLongPress == button then
		self.skillButtonPressUp = button
		self.skillButtonRefresh = true
	end
end

function AnimalBase:LongPressSkillButton(button)
	if self.skillButtonLongPress ~= button then
		if button > 0 then
			self.skillButtonPressDown = button
			self.skillButtonLongPressUsed = false
		end

		self.skillButtonRefresh = true
	end

	self.skillButtonLongPressOld = self.skillButtonLongPress
	self.skillButtonLongPress = button
	self.skillButtonLongPressReset = false
end

function AnimalBase:GetLongPressButton()
	if self.skillButtonLongPressUsed == false then
		return self.skillButtonLongPress
	end

	return 0
end

function AnimalBase:GetLongPressButtonTime(button)
	if self.skillButtonLongPressUsed == false and self.skillButtonLongPress == button and self.skillButtonLongPressOld == self.skillButtonLongPress then
		return self.skillButtonLongPressTime
	end

	return 0
end

function AnimalBase:SetSkillButtonLongPressUsed()
	if self.skillButtonLongPress > 0 then
		self.skillButtonLongPressUsed = true
	end
end

function AnimalBase:ResetSkillButtonLongPressTime()
	self.skillButtonLongPressReset = true
	self.skillButtonLongPressTime = Time.deltaTime
end

function AnimalBase:IsResetSkillButtonLongPressTime()
	return self.skillButtonLongPressReset
end

function AnimalBase:CheckSkillButtonRefresh()
	self.skillButtonRefresh = false
end

function AnimalBase:IsSkillButtonRefresh()
	return self.skillButtonRefresh
end

function AnimalBase:SetSkillButtonTargetForAI(pos)
	self.skillButtonTarget:SetVector3(pos)
end

function AnimalBase:GetSkillButtonTarget()
	if self.isHost == true then
		return self:GetSkillButtonAimTarget()
	else
		return self.skillButtonTarget
	end
end

function AnimalBase:SetSkillAimTarget(pos)
	self.skillAimTarget:SetVector3(pos)
end

function AnimalBase:GetSkillAimTarget()
	return self.skillAimTarget
end

function AnimalBase:ClearSkillButtonAll()
	self.skillButtonLongPress = 0
	self.skillButtonLongPressOld = 0
	self.skillButtonLongPressTime = 0
	self.skillButtonLongPressUsed = false
	self.skillButtonPressUp = 0
	self.skillButtonPressDown = 0
	self.skillButtonRefresh = false

	if self.isHost == true and self.isHostBack == false then
		self.sceneController:ClearSkillButton()
	end
end

function AnimalBase:ClearMoveButtonAll()
	self:ResetJoystickMoveDir()

	if self.isHost == true and self.isHostBack == false then
		self.sceneController:ClearInputJoystickController()
	end

	self:ResetAnimatorParamFloat()
end

function AnimalBase:CheckSkillButton()
	local buttonPressUpTime = 0

	if self.skillButtonPressUp > 0 and self.skillButtonPressUp == self.skillButtonLongPressOld then
		buttonPressUpTime = self.skillButtonLongPressTime + Time.deltaTime
	end

	local buttonLongPress = self:GetLongPressButton()

	if buttonLongPress > 0 then
		if self.skillButtonLongPressOld == buttonLongPress then
			self.skillButtonLongPressTime = self.skillButtonLongPressTime + Time.deltaTime
		else
			self.skillButtonLongPressTime = Time.deltaTime
		end
	else
		self.skillButtonLongPressTime = 0
	end

	local buttonLongPressTime = self.skillButtonLongPressTime
	local buttonPressDown = self.skillButtonPressDown
	local buttonPressUp = self.skillButtonPressUp

	self.skillButtonPressDown = 0
	self.skillButtonPressUp = 0

	return buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime
end

function AnimalBase:HandleTargetExit(animal)
	if animal == nil then
		return
	end

	if self.skillTargetReady == animal then
		self.skillTargetReady = nil
	end

	if self.skillTarget == animal then
		self.skillTarget = nil
	end

	if self.skillTargetAI == animal then
		self.skillTargetAI = nil
	end

	if self.skillLockAnimal == animal then
		self:ClearLockPlayer()
	end

	if self.skillExecuteTarget == animal then
		self.skillExecuteTarget = nil
	end

	if self.skillBackstabTarget == animal then
		self.skillBackstabTarget = nil
	end

	if self.animalBrain ~= nil and self.animalBrain:GetAnimalTarget() == animal then
		self.animalBrain:ClearAnimalTarget()
	end
end

function AnimalBase:GetLockDistance()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		if self.isHost == true then
			return AnimalBase_Define.LockDistancePlayer
		else
			return AnimalBase_Define.LockDistanceEnemy
		end
	else
		return AnimalBase_Define.LockDistanceEnemy
	end
end

function AnimalBase:GetSkillTargetReady()
	return self.skillTargetReady
end

function AnimalBase:SetSkillTargetReady(animal)
	self.skillTargetReady = animal
end

function AnimalBase:GetSkillTarget()
	return self.skillTarget
end

function AnimalBase:SetSkillTarget(animal)
	self.skillTarget = animal

	if animal == nil then
		self.skillTargetReady = nil
	end
end

function AnimalBase:SetSkillTargetForAI(animal)
	self.skillTargetAI = animal
end

function AnimalBase:GetSkillTargetForAI()
	return self.skillTargetAI
end

function AnimalBase:IsLockingPlayer()
	if self.skillLockAnimal ~= nil and self.skillLockAnimal:IsWillDead() == false then
		return true
	end

	return false
end

function AnimalBase:ClearLockPlayer()
	if self.skillLockAnimal ~= nil then
		if self.isHost == true then
			self.skillLockAnimal:ShowLockMark(false)
		end

		self.skillLockAnimal = nil
		self.moveTurnEnable = true
	end
end

function AnimalBase:SetLockPlayer(animal)
	if animal ~= nil then
		self:ClearLockPlayer()

		self.skillLockAnimal = animal

		if self.skillLockAnimal ~= nil and self.isHost == true then
			self.skillLockAnimal:ShowLockMark(true)

			self.moveTurnEnable = false
		end

		return true
	end

	return false
end

function AnimalBase:GetLockPlayer()
	return self.skillLockAnimal
end

function AnimalBase:SetLockId(id)
	if id > 0 then
		if self:IsAimMode() == false and self:IsOnStair() == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Fly and self.moveFly == false then
			local enemy = self.sceneController:FindPlayerById(id)
			local animalNew, forceLock = self:CheckLockPlayer(enemy, false)

			return self:SetLockPlayer(animalNew)
		end

		return false
	elseif id < 0 then
		self:ClearLockPlayer()
	end

	return true
end

function AnimalBase:SetLockDisable(flg)
	self.lockDisable = flg
end

function AnimalBase:CheckLockPlayer(animal, isLock)
	if MS_StoryList.IsStoryCarriage(self.storyId) == true then
		return nil, false
	end

	if self:IsWillDead() == false and self:CheckAttackTargetEnable(animal) == true then
		if self.isHost == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == animal:GetStoryMonsterId() then
			return animal, true
		end

		local nowPos = self:GetPosByWorldPos()
		local tmpPos = animal:GetPosByWorldPos()
		local dis = Vector3.DistanceSquare(tmpPos, nowPos)
		local heroLockDis = self:GetLockDistance()

		if isLock == true then
			if dis <= heroLockDis * heroLockDis then
				local tmpDir = tmpPos - nowPos
				local tmpDir2 = tmpDir:Clone()

				tmpDir2.y = 0

				local tmpAngle = Mathf.Abs(Vector3.Angle(tmpDir2, tmpDir))

				if tmpAngle <= AnimalBase_Define.LockAngleMax then
					return animal, false
				end
			end
		elseif dis <= heroLockDis * heroLockDis and self:IsSightVisible(animal) == true then
			local tmpDir = tmpPos - nowPos
			local tmpDir2 = tmpDir:Clone()

			tmpDir2.y = 0

			local tmpAngle = Mathf.Abs(Vector3.Angle(tmpDir2, tmpDir))

			if tmpAngle <= AnimalBase_Define.LockAngle then
				tmpDir = nil
				tmpDir2 = nil

				return animal, false
			end

			tmpDir = nil
			tmpDir2 = nil
		end
	end

	return nil, false
end

function AnimalBase:UpdateLockPlayer()
	if self.skillLockAnimal ~= nil then
		local animalNew, forceLock = self:CheckLockPlayer(self.skillLockAnimal, true)

		if animalNew == nil then
			self:ClearLockPlayer()
		end
	end
end

function AnimalBase:UpdateMoveTrigger()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
		local normalizedTime = self.animatorTime
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnSkillTrigger(self.animatorTrigger)

			if self.animatorTrigger == 1 then
				self.animalValue:UseSkillEnergy(self.skillIndex, self.skillCombo)
				self.animalValue:UseSkillRage(self.skillIndex, self.skillCombo)
				self.animalValue:UseSkillPower(self.skillIndex, self.skillCombo)

				if self.isHost == true then
					self.gameController:RecordHeroSkillLog(self.heroId, MS_StoryTutorial.RecordSkillType.SkillTrigger, self.skillIndex, self.skillCombo)
				end
			end
		end

		local tmpParry = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillParry)

		if tmpParry > self.animatorParry then
			self.animatorParry = tmpParry

			self:OnSkillParryTrigger(self.animatorParry)
		end

		local tmpGround = self:GetAnimatorParam(AnimalBase_Define.ParamType.Ground)

		if tmpGround > self.animatorGround then
			self:OnGround(tmpGround)

			self.animatorGround = tmpGround
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery then
		local normalizedTime = self.animatorTime
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnSkillRecoveryTrigger(self.animatorTrigger)
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self:OnHitTrigger(tmpTrigger)

			self.animatorTrigger = tmpTrigger
		end

		local tmpGround = self:GetAnimatorParam(AnimalBase_Define.ParamType.Ground)

		if tmpGround > self.animatorGround then
			self:OnGround(tmpGround)

			self.animatorGround = tmpGround
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnTouchGroundTrigger(self.animatorTrigger)
		end

		local tmpGround = self:GetAnimatorParam(AnimalBase_Define.ParamType.Ground)

		if tmpGround > self.animatorGround then
			self:OnGround(tmpGround)

			self.animatorGround = tmpGround
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartDown then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnStairInTrigger(self.animatorTrigger)
		end

		self:UpdateStairInTrigger(self.animatorTrigger)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnStairOutTrigger(self.animatorTrigger)
		end

		self:UpdateStairOutTrigger(self.animatorTrigger)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2 then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger
		end

		self:UpdateStairClimpTrigger(self.animatorTrigger)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Get then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnGetTrigger(self.animatorTrigger)
		end
	elseif self:IsEvent(self.moveStateNow) == true then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnEventTrigger(self.animatorTrigger)
		end
	elseif self:IsEventEnd(self.moveStateNow) == true then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnEventEndTrigger(self.animatorTrigger)
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dead then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnDeadTrigger(self.animatorTrigger)
		end

		local tmpGround = self:GetAnimatorParam(AnimalBase_Define.ParamType.Ground)

		if tmpGround > self.animatorGround then
			self:OnGround(tmpGround)

			self.animatorGround = tmpGround
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Reborn then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnRebornTrigger(self.animatorTrigger)
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Born then
		local tmpTrigger = self:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger)

		if tmpTrigger > self.animatorTrigger then
			self.animatorTrigger = tmpTrigger

			self:OnBornTrigger(self.animatorTrigger)
		end
	end

	if self.animatorOffsetStart == false and self.animatorTime >= self.animatorOffsetTime then
		self.animatorOffsetStart = true

		if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
			self:OnSkillOffsetStart()
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery then
			self:OnSkillRecoveryOffsetStart()
		end
	end
end

function AnimalBase:UpdateSkillState()
	if self:IsWillDead() == true then
		self:EndSkillCollider()
		self:EndSkillParryCollider()

		self.moveBattleMode = 0
		self.moveBattleEndTime = 0

		return
	end

	if self:IsSkilling() == true then
		if self:IsSkillingById(AnimalBase_Define.SkillType.Eat, 1) == false and self:IsSkillingById(AnimalBase_Define.SkillType.EatFast, 1) == false then
			self.moveBattleMode = 1
			self.moveBattleEndTime = TimeHelper.getNowTime() + AnimalBase_Define.MotionBattleModeToNormalTime
		elseif self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			self.moveBattleMode = 1
			self.moveBattleEndTime = TimeHelper.getNowTime() + AnimalBase_Define.MotionBattleModeToNormalTime
		else
			self.moveBattleMode = 0
			self.moveBattleEndTime = 0
		end

		if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
			local isRunExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit)

			if isRunExit > 0 and self.moveFlg == true then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)

				if self.skillIndexOld == AnimalBase_Define.SkillType.Dodge or self.skillIndexOld == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndexOld == AnimalBase_Define.SkillType.DodgeJump or self.skillIndexOld == AnimalBase_Define.SkillType.DodgeJumpSpecial then
					if self:GetMoveSpeedMode() ~= AnimalBase_Define.SpeedMode.Slow then
						self:SetMoveSpeed(AnimalBase_Define.MotionSprintSpeed)
					end
				elseif self.isHost == true then
					local buttonIgnore = ControllerMain.SkillButton.None

					if self.skillComboOld == 1 then
						local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndexOld, 1)

						if skillData.BtnIndex == ControllerMain.SkillButton.Light or skillData.BtnIndex == ControllerMain.SkillButton.Heavy then
							buttonIgnore = skillData.BtnIndex
						end
					elseif self.skillComboOld == 2 then
						local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndexOld, 1)

						if skillData.BtnPressType == MS_SkillData.PressType.LongPress and (skillData.BtnIndex == ControllerMain.SkillButton.Light or skillData.BtnIndex == ControllerMain.SkillButton.Heavy) then
							buttonIgnore = skillData.BtnIndex
						end
					end

					if buttonIgnore ~= ControllerMain.SkillButton.None then
						self.skillButtonRunExit = buttonIgnore
						self.skillButtonRunExitTime = TimeHelper.getNowTime() + AnimalBase_Define.SkillRunExitIgnoreTime
					else
						self.skillButtonRunExit = ControllerMain.SkillButton.None
						self.skillButtonRunExitTime = 0
					end
				end
			end

			local toughness = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillToughness)

			if toughness ~= self.skillToughness then
				if self.skillToughness <= 0 and toughness > 0 then
					self.animalValue:InitPropertySkill(AnimalBase_Value.PropertySkill.Toughness, self.skillIndex, self.skillCombo)
					self.animalValue:InitPropertySkill(AnimalBase_Value.PropertySkill.DamageSub, self.skillIndex, self.skillCombo)
				elseif self.skillToughness > 0 and toughness <= 0 then
					self.animalValue:ClearPropertySkill(AnimalBase_Value.PropertySkill.Toughness)
					self.animalValue:ClearPropertySkill(AnimalBase_Value.PropertySkill.DamageSub)
				end

				self.skillToughness = toughness
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery then
			local isRunExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit)

			if isRunExit > 0 and self.moveFlg == true then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
			end
		end
	else
		self:EndSkillCollider()
		self:EndSkillParryCollider()

		self.skillIndexOld = 0
		self.skillComboOld = 0
		self.skillIndex = 0
		self.skillCombo = 0

		if TimeHelper.getNowTime() >= self.moveBattleEndTime then
			if self.moveBattleMode > 0 then
				self.moveBattleMode = self.moveBattleMode - 2 * ControllerMain.GetLogicDeltaTime()
			end

			if self.moveBattleMode < 0 then
				self.moveBattleMode = 0
			end
		end
	end

	if DebugShowHostHeader == true then
		self:CheckCounterAttack()
	end
end

function AnimalBase:CheckSkillCommandEnable()
	if MS_StoryList.IsStoryCarriage(self.storyId) == true then
		return false
	end

	if self:IsEnd() == true or self:IsStop() == true or self.moveLock == true then
		return false
	end

	if self:IsWillDead() == true then
		return false
	end

	if self:IsSkillNextWait() == true then
		return false
	end

	if self.nightmareEndReady == true or self.callEndReady == true then
		return false
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround or self.moveStateNow == AnimalBase_Define.MoveStateType.Get or self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.Special or self.moveStateNow == AnimalBase_Define.MoveStateType.Reborn or self.moveStateNow == AnimalBase_Define.MoveStateType.Born or self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareStart or self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CallStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly or self:IsEvent(self.moveStateNow) == true or self:IsEventLoop(self.moveStateNow) == true or self:IsEventEnd(self.moveStateNow) == true then
		return false
	end

	if self:IsOnStair() == true then
		return false
	end

	return true
end

function AnimalBase:CheckSkillCommand()
	local ret = self:CheckSkillCommandEnable()

	if ret == false then
		return
	end

	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = self:CheckSkillButton()

	if self.moveOnGround == false then
		if (buttonPressDown == ControllerMain.SkillButton.Light or buttonPressDown == ControllerMain.SkillButton.Heavy) and self.moveStateNow == AnimalBase_Define.MoveStateType.Drop and self:IsHaveSkill(AnimalBase_Define.SkillType.Drop) == true then
			local skillDataDrop = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.Drop, 1)

			if skillDataDrop ~= nil and (skillDataDrop.SkillTalent <= 0 or self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, skillDataDrop.SkillIndex, skillDataDrop.SkillCombo) >= skillDataDrop.SkillTalent) then
				self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Drop, 1, MS_SkillData.PressType.PressDown, buttonPressDown)
			end
		end

		return
	else
		if buttonPressDown == ControllerMain.SkillButton.Light or buttonPressDown == ControllerMain.SkillButton.Heavy then
			if self.skillExecuteAttack == true and self.skillExecuteTarget ~= nil and self:CheckSkillExecuteEnable(self.skillExecuteTarget) == true and self:IsPermitExecuteButton(buttonPressDown, self.skillExecuteTarget) then
				self:ReadySkillExecute(self.skillExecuteTarget)

				return
			end

			if self.skillBackstabAttack == true and self.skillBackstabTarget ~= nil and self:CheckSkillBackstabEnable(self.skillBackstabTarget) == true and self:IsPermitBackstabButton(buttonPressDown, self.skillBackstabTarget) then
				self:ReadySkillBackstab(self.skillBackstabTarget)

				return
			end
		end

		local ret = false

		if self:IsSkilling() == true then
			if ret == false and buttonPressDown > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandCombo(buttonPressDown, MS_SkillData.PressType.PressDown, 0)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.PressDown, buttonPressDown)
				end
			end

			if ret == false and buttonPressUp > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandCombo(buttonPressUp, MS_SkillData.PressType.PressUp, buttonPressUpTime)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.PressUp, buttonPressUp)
				end
			end

			if ret == false and buttonLongPress > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandCombo(buttonLongPress, MS_SkillData.PressType.LongPress, buttonLongPressTime)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.LongPress, buttonLongPress)
				end
			end
		else
			if ret == false and buttonPressDown > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandExtend(buttonPressDown, MS_SkillData.PressType.PressDown, 0)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.PressDown, buttonPressDown)
				end
			end

			if ret == false and buttonPressUp > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandExtend(buttonPressUp, MS_SkillData.PressType.PressUp, buttonPressUpTime)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.PressUp, buttonPressUp)
				end
			end

			if ret == false and buttonLongPress > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandExtend(buttonLongPress, MS_SkillData.PressType.LongPress, buttonLongPressTime)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.LongPress, buttonLongPress)
				end
			end

			if ret == false and buttonPressDown > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandStart(buttonPressDown, MS_SkillData.PressType.PressDown, 0)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.PressDown, buttonPressDown)
				end
			end

			if ret == false and buttonPressUp > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandStart(buttonPressUp, MS_SkillData.PressType.PressUp, buttonPressUpTime)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.PressUp, buttonPressUp)
				end
			end

			if ret == false and buttonLongPress > 0 then
				local tmpIndex, tmpCombo = self:CheckSkillCommandStart(buttonLongPress, MS_SkillData.PressType.LongPress, buttonLongPressTime)

				if tmpIndex > 0 and tmpCombo > 0 then
					ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, tmpIndex, tmpCombo, MS_SkillData.PressType.LongPress, buttonLongPress)
				end
			end
		end
	end

	return buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime
end

function AnimalBase:CheckSkillDataConditionPermit(skillData, inputComboType, button, pressType, pressTime, checkRage, checkPower, checkCondition)
	if skillData == nil then
		return false
	end

	if inputComboType == AnimalBase_Define.InputComboType.Start then
		if skillData.BtnIndex ~= button or pressTime < skillData.BtnPressTime then
			return false
		end

		if skillData.BtnPressType == pressType or pressType == MS_SkillData.PressType.PressDown and skillData.BtnPressType == MS_SkillData.PressType.LongPress and skillData.BtnPressTime <= 0 then
			-- block empty
		else
			return false
		end
	elseif inputComboType == AnimalBase_Define.InputComboType.Jump then
		if skillData.BtnIndex ~= button or skillData.BtnComboPressType ~= pressType or pressTime < skillData.BtnComboPressTime then
			return false
		end
	else
		if skillData.BtnIndex ~= button or pressTime < skillData.BtnComboPressTime then
			return false
		end

		if skillData.BtnComboPressType == pressType or pressType == MS_SkillData.PressType.PressDown and skillData.BtnComboPressType == MS_SkillData.PressType.LongPress and skillData.BtnComboPressTime <= 0 then
			-- block empty
		else
			return false
		end
	end

	if skillData.SkillGrade ~= nil and #skillData.SkillGrade > 0 then
		local find = false

		for k = 1, #skillData.SkillGrade do
			if skillData.SkillGrade[k] == self.animalGrade then
				find = true

				break
			end
		end

		if find == false then
			return false
		end
	end

	if checkCondition == true and skillData.SkillCondition ~= nil and #skillData.SkillCondition > 0 then
		local find = false

		for k = 1, #skillData.SkillCondition do
			if skillData.SkillIndex == AnimalBase_Define.SkillType.Born1 or skillData.SkillIndex == AnimalBase_Define.SkillType.Born2 or skillData.SkillIndex == AnimalBase_Define.SkillType.Born3 then
				if skillData.SkillCondition[k] == self.heroBornType then
					find = true

					break
				end
			elseif skillData.SkillCondition[k] == self.skillCondition[skillData.SkillIndex] then
				find = true

				break
			end
		end

		if find == false then
			return false
		end
	end

	if skillData.SkillSpeed > 0 and self:GetMoveSpeed() > skillData.SkillSpeed then
		return false
	end

	if skillData.SkillSan == AnimalBase_Define.SkillSanType.Normal and self:IsHeroSanNotNormal(0) == true then
		local tmpTalentPermit = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillSanPermit, skillData.SkillIndex, skillData.SkillCombo)

		if tmpTalentPermit <= 0 then
			return false
		end
	end

	if skillData.SkillSan == AnimalBase_Define.SkillSanType.NotNormal and self:IsHeroSanNotNormal(0) == false then
		return false
	end

	if skillData.SkillTalent > 0 and self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, skillData.SkillIndex, skillData.SkillCombo) < skillData.SkillTalent then
		return false
	end

	local needRage = self:GetSkillRequiredRage(skillData)

	if needRage > 0 and needRage > self.animalValue:GetProperty(MS_HeroData.Property.Rage) then
		if checkRage == true and skillData.Tips > 0 and self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "ShowRageInsufficient")
		end

		return false
	end

	local needPower = skillData.RequiredPower

	if needPower > 0 and needPower > self.animalValue:GetProperty(MS_HeroData.Property.Power) then
		if checkPower == true and skillData.Tips > 0 and self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "ShowKarmaInsufficient")
		end

		return false
	end

	return true
end

function AnimalBase:CheckSkillDataRagePowerPermit(skillData)
	local needRage = self:GetSkillRequiredRage(skillData)

	if needRage > 0 and needRage > self.animalValue:GetProperty(MS_HeroData.Property.Rage) then
		if skillData.Tips > 0 and self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "ShowRageInsufficient")
		end

		return false
	end

	local needPower = skillData.RequiredPower

	if needPower > 0 and needPower > self.animalValue:GetProperty(MS_HeroData.Property.Power) then
		if skillData.Tips > 0 and self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "ShowKarmaInsufficient")
		end

		return false
	end

	return true
end

function AnimalBase:GetSkillRequiredRage(skillData)
	return skillData.RequiredRage
end

function AnimalBase:CheckSkillCommandStart(button, pressType, pressTime)
	if self:IsSkilling() == false then
		local priority = -1
		local retSkillIndex = 0
		local skillList = MS_SkillData.GetSkillList(self.heroId)
		local nowTime = TimeHelper.getNowTime()

		for skillIndexNew, tmpData in pairs(skillList) do
			if tmpData ~= nil and tmpData[1] ~= nil and tmpData[1].SkillStart > 0 then
				local tmpRet = self:CheckSkillDataConditionPermit(tmpData[1], AnimalBase_Define.InputComboType.Start, button, pressType, pressTime, true, true, true)

				if tmpRet == true and (self.skillButtonRunExit ~= tmpData[1].BtnIndex or nowTime > self.skillButtonRunExitTime) and priority < tmpData[1].SkillPriority then
					retSkillIndex = skillIndexNew
					priority = tmpData[1].SkillPriority
				end
			end
		end

		if retSkillIndex > 0 then
			return retSkillIndex, 1
		end
	end

	return 0, 0
end

function AnimalBase:GetSkillComboNextIndex(skillIndex, skillComboNow, skillComboNext, button, pressType, pressTime)
	local skillList = MS_SkillData.GetSkillList(self.heroId)

	if skillList == nil then
		return 0
	end

	local skillDataList = skillList[skillIndex]

	if skillDataList == nil then
		return 0
	end

	local retSkillIndex = 0
	local skillPriority = -1

	if skillComboNext <= #skillDataList then
		for i = skillComboNext, #skillDataList do
			local skillData = skillDataList[i]

			if skillData ~= nil and skillData.BtnIndex > 0 then
				local ret = self:CheckSkillDataConditionPermit(skillData, AnimalBase_Define.InputComboType.Combo, button, pressType, pressTime, true, true, true)

				if ret == true then
					local inRange = false
					local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, skillIndex, skillComboNow, skillIndex, skillComboNext)
					local comboStartIndex = 1
					local comboEndIndex = 1

					if skillChainData ~= nil then
						comboStartIndex = skillChainData.SkillComboStart1
						comboEndIndex = skillChainData.SkillComboEnd1
					end

					inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)

					if inRange == false and skillChainData ~= nil then
						comboStartIndex = skillChainData.SkillComboStart2
						comboEndIndex = skillChainData.SkillComboEnd2

						if comboStartIndex >= 0 then
							inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)
						end
					end

					if inRange == true then
						if skillData.SkillAddPriority <= 0 then
							do return skillIndex end

							break
						end

						retSkillIndex = skillIndex
						skillPriority = skillData.SkillPriority
					end
				end

				break
			end
		end
	end

	local skillButtonList = {}
	local skillButtonPressTypeList = {}
	local skillButtonPressTimeList = {}
	local buttonMax = 0

	for i = 1, skillComboNext - 1 do
		if skillDataList[i] ~= nil and skillDataList[i].BtnIndex ~= nil and skillDataList[i].BtnIndex > 0 then
			buttonMax = buttonMax + 1
			skillButtonList[buttonMax] = skillDataList[i].BtnIndex
			skillButtonPressTypeList[buttonMax] = skillDataList[i].BtnComboPressType
			skillButtonPressTimeList[buttonMax] = skillDataList[i].BtnComboPressTime
		end
	end

	if buttonMax > 0 then
		buttonMax = buttonMax + 1
		skillButtonList[buttonMax] = button
		skillButtonPressTypeList[buttonMax] = pressType
		skillButtonPressTimeList[buttonMax] = pressTime

		for skillIndexNew, tmpData in pairs(skillList) do
			if skillIndex ~= skillIndexNew and tmpData ~= nil and buttonMax <= #tmpData and skillComboNext <= self.animalConfig.skillComboMax[skillIndexNew] then
				local testButtonCnt = 0

				for i = 1, #tmpData do
					local skillData = tmpData[i]

					if skillData == nil then
						break
					end

					if skillData.BtnIndex ~= nil and skillData.BtnIndex > 0 then
						if buttonMax > testButtonCnt + 1 and skillData.BtnComboPressTime ~= skillButtonPressTimeList[testButtonCnt + 1] then
							break
						end

						local tmpRet = self:CheckSkillDataConditionPermit(skillData, AnimalBase_Define.InputComboType.Jump, skillButtonList[testButtonCnt + 1], skillButtonPressTypeList[testButtonCnt + 1], skillButtonPressTimeList[testButtonCnt + 1], false, false, false)

						if tmpRet == false then
							break
						end

						testButtonCnt = testButtonCnt + 1

						if buttonMax <= testButtonCnt then
							if skillData.SkillCondition ~= nil and #skillData.SkillCondition > 0 then
								local find = false

								for k = 1, #skillData.SkillCondition do
									if skillData.SkillCondition[k] == self.skillCondition[skillIndexNew] then
										find = true

										break
									end
								end

								if find == false then
									break
								end
							end

							local inRange = false
							local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, skillIndex, skillComboNow, skillIndexNew, skillComboNext)
							local comboStartIndex = 1
							local comboEndIndex = 1

							if skillChainData ~= nil then
								comboStartIndex = skillChainData.SkillComboStart1
								comboEndIndex = skillChainData.SkillComboEnd1
							end

							inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)

							if inRange == false and skillChainData ~= nil then
								comboStartIndex = skillChainData.SkillComboStart2
								comboEndIndex = skillChainData.SkillComboEnd2

								if comboStartIndex >= 0 then
									inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)
								end
							end

							if inRange == true and skillPriority < tmpData[i].SkillPriority then
								skillPriority = tmpData[i].SkillPriority
								retSkillIndex = skillIndexNew
							end

							break
						end
					end
				end
			end
		end

		if retSkillIndex > 0 then
			skillButtonList = nil
			skillButtonPressTypeList = nil
			skillButtonPressTimeList = nil

			return retSkillIndex
		end
	end

	skillButtonList = nil
	skillButtonPressTypeList = nil
	skillButtonPressTimeList = nil

	return retSkillIndex
end

function AnimalBase:CheckSkillCommandCombo(button, pressType, pressTime)
	local tmpIndex = 0
	local tmpCombo = 0

	if self:IsSkillingSkill() == true then
		local priority = -1
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if (self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillLoop or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillLoopAndRecovery) and pressType == MS_SkillData.PressType.LongPress then
			return tmpIndex, tmpCombo
		end

		if skillData.RefuseOtherBtn > 0 and skillData.BtnIndex > 0 and skillData.BtnIndex ~= button then
			return tmpIndex, tmpCombo
		end

		if tmpIndex <= 0 and tmpCombo <= 0 and self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] ~= AnimalBase_Define.SkillNextType.SkillAndComboExit and self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] ~= AnimalBase_Define.SkillNextType.Exit then
			local nextCombo = self.skillCombo + 1

			if self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndJump or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillBind then
				nextCombo = nextCombo + 1
			end

			local skillIndexNew = self:GetSkillComboNextIndex(self.skillIndex, self.skillCombo, nextCombo, button, pressType, pressTime)

			if skillIndexNew > 0 then
				tmpIndex = skillIndexNew
				tmpCombo = nextCombo

				if skillData.SkillAddPriority <= 0 and tmpIndex > 0 and tmpCombo > 0 then
					return tmpIndex, tmpCombo
				end

				if tmpIndex > 0 and tmpCombo > 0 then
					local skillDataNew = MS_SkillData.GetSkillData(self.heroId, tmpIndex, tmpCombo)

					priority = skillDataNew.SkillPriority
				end
			end
		end

		if (self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndRecovery or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndComboExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.Skill or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillBind) and #self.animalConfig.skillComboSkill[self.skillIndex] > 0 then
			for i = 1, #self.animalConfig.skillComboSkill[self.skillIndex] do
				local tmpSkillId = self.animalConfig.skillComboSkill[self.skillIndex][i]
				local tmpSkillData = MS_SkillData.GetSkillData(self.heroId, tmpSkillId, 1)

				if priority < tmpSkillData.SkillPriority then
					local tmpRet = self:CheckSkillDataConditionPermit(tmpSkillData, AnimalBase_Define.InputComboType.Combo, button, pressType, pressTime, true, true, true)

					if tmpRet == true then
						if tmpSkillData.NoActionInSkill > 0 then
							tmpIndex = tmpSkillId
							tmpCombo = 1
							priority = tmpSkillData.SkillPriority
						else
							local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, self.skillIndex, self.skillCombo, tmpSkillId, 1)
							local comboStartIndex = 1
							local comboEndIndex = 1

							if skillChainData ~= nil then
								comboStartIndex = skillChainData.SkillComboStart1
								comboEndIndex = skillChainData.SkillComboEnd1
							end

							local inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)

							if inRange == true then
								tmpIndex = tmpSkillId
								tmpCombo = 1
								priority = tmpSkillData.SkillPriority
							elseif skillChainData ~= nil then
								comboStartIndex = skillChainData.SkillComboStart2
								comboEndIndex = skillChainData.SkillComboEnd2

								if comboStartIndex >= 0 then
									inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)

									if inRange == true then
										tmpIndex = tmpSkillId
										tmpCombo = 1
										priority = tmpSkillData.SkillPriority
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return tmpIndex, tmpCombo
end

function AnimalBase:CheckSkillCommandExtend(button, pressType, pressTime)
	local tmpIndex = 0
	local tmpCombo = 0

	if self:IsSkillingSkill() == false and self.skillExtendIndex > 0 and self.skillExtendCombo > 0 and (self.animalConfig.skillNextType[self.skillExtendIndex][self.skillExtendCombo] == AnimalBase_Define.SkillNextType.SkillAndRecovery or self.animalConfig.skillNextType[self.skillExtendIndex][self.skillExtendCombo] == AnimalBase_Define.SkillNextType.SkillAndExit or self.animalConfig.skillNextType[self.skillExtendIndex][self.skillExtendCombo] == AnimalBase_Define.SkillNextType.SkillAndComboExit) and #self.animalConfig.skillComboSkill[self.skillExtendIndex] > 0 then
		for i = 1, #self.animalConfig.skillComboSkill[self.skillExtendIndex] do
			local tmpSkillId = self.animalConfig.skillComboSkill[self.skillExtendIndex][i]
			local tmpSkillData = MS_SkillData.GetSkillData(self.heroId, tmpSkillId, 1)
			local tmpRet = self:CheckSkillDataConditionPermit(tmpSkillData, AnimalBase_Define.InputComboType.Combo, button, pressType, pressTime, false, false, true)

			if tmpRet == true then
				local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, self.skillExtendIndex, self.skillExtendCombo, tmpSkillId, 1)

				if skillChainData ~= nil and skillChainData.SkillExtendTime > 0 then
					local nowTime = TimeHelper.getNowTime()
					local diffTime = nowTime - self.skillExtendTime

					if diffTime < skillChainData.SkillExtendTime then
						tmpRet = self:CheckSkillDataRagePowerPermit(tmpSkillData)

						if tmpRet == true then
							tmpIndex = tmpSkillId
							tmpCombo = 1

							break
						end
					end
				end
			end
		end
	end

	return tmpIndex, tmpCombo
end

function AnimalBase:ThrowItem(itemId)
	if itemId <= 0 then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	if self:CheckSkillCommandEnable() == false then
		return false
	end

	if self:IsSkillingById(AnimalBase_Define.SkillType.Throw, 1) == true or self:IsSkillingById(AnimalBase_Define.SkillType.ThrowLow, 1) == true then
		return false
	end

	self.skillThrowItemId = itemId

	local ret = false
	local itemData = MS_ItemData.GetItemData(self.skillThrowItemId)

	if itemData ~= nil then
		if itemData.BulletType == ControllerBullet.BulletType.Parabola then
			ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.ThrowLow, 1, MS_SkillData.PressType.PressDown, 0)
		else
			ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Throw, 1, MS_SkillData.PressType.PressDown, 0)
		end
	end

	return ret
end

function AnimalBase:EatItem(itemId)
	if itemId <= 0 then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	if self:CheckSkillCommandEnable() == false then
		return false
	end

	if self:IsSkillingById(AnimalBase_Define.SkillType.Eat, 1) == true or self:IsSkillingById(AnimalBase_Define.SkillType.EatFast, 1) == true then
		return false
	end

	self.itemUseId = itemId

	local ret = false
	local tmpTalentEat = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.EatSpeedUp, 0, 0)

	if tmpTalentEat > 0 then
		ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.EatFast, 1, MS_SkillData.PressType.PressDown, 0)
	else
		ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Eat, 1, MS_SkillData.PressType.PressDown, 0)
	end

	return ret
end

function AnimalBase:UpdateMoveType()
	local moveType = AnimalBase_Define.MoveType.Move

	if self:IsSkilling() == true then
		if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
			local moveTypeList = self.animalConfig.skillMoveTypeList[self.skillIndex]

			if moveTypeList ~= nil and moveTypeList[self.skillCombo] ~= nil then
				moveType = moveTypeList[self.skillCombo]
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery then
			local moveTypeList = self.animalConfig.skillRecoveryMoveTypeList[self.skillIndex]

			if moveTypeList ~= nil and moveTypeList[self.skillCombo] ~= nil then
				moveType = moveTypeList[self.skillCombo]
			end
		end
	else
		moveType = self.moveMoveType
	end

	if self:IsLockingPlayer() == true and (moveType == AnimalBase_Define.MoveType.Move or moveType == AnimalBase_Define.MoveType.SpecialMove) then
		moveType = AnimalBase_Define.MoveType.SpecialMove
	end

	self:SetMoveType(moveType)
end

function AnimalBase:SetMoveType(type)
	local oldType = self.moveType

	self.moveType = type

	if self.moveType ~= oldType then
		self:ResetAnimatorState()
	end
end

function AnimalBase:SetMoveMoveType(type)
	self.moveMoveType = type
end

function AnimalBase:IsMoveType(type)
	if self.moveType == type then
		return true
	end

	return false
end

function AnimalBase:SetPull(flg, skillIndex, skillCombo)
	self.skillPull = flg
	self.skillPullIndex = skillIndex
	self.skillPullCombo = skillCombo
end

function AnimalBase:IsPulling()
	if self.skillPull == true and self.skillPullIndex > 0 and self.skillPullCombo > 0 then
		return true
	end

	return false
end

function AnimalBase:GetPullSkill()
	return self.skillPullIndex, self.skillPullCombo
end

function AnimalBase:GetCaptureDistanceAndHeight()
	return 0, 0.01, 0.01
end

function AnimalBase:CheckBlock()
	self:SetBlock(false, 0, 0, 0)

	if self:IsSkillingSkill() == true then
		local skillAI = self:GetSkillTypeForAI()

		if skillAI == AnimalBase_Define.SkillTypeForAI.Defence then
			local tmpDefence = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDefence)

			if tmpDefence > 0 then
				local tmpSkillCombo = self.skillCombo + 1

				if self.skillBlockJump[self.skillIndex] ~= nil then
					tmpSkillCombo = self.skillBlockJump[self.skillIndex][AnimalBase_Define.SkillBlockJump.HitBackCombo]
				end

				self:SetBlock(true, self.skillIndex, tmpSkillCombo, tmpDefence)
			end
		elseif skillAI == AnimalBase_Define.SkillTypeForAI.DefenceLoop then
			self:SetBlock(true, self.skillIndex, self.skillCombo, 1)
		elseif skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit then
			local tmpSkillCombo = self.skillCombo - 2

			if self.skillBlockJump[self.skillIndex] ~= nil then
				tmpSkillCombo = self.skillBlockJump[self.skillIndex][AnimalBase_Define.SkillBlockJump.HitCombo]
			end

			self:SetBlock(true, self.skillIndex, tmpSkillCombo, 1)
		end
	end
end

function AnimalBase:SetBlockJump(skillIndex, hitCombo, hitBackCombo)
	if self.skillBlockJump[skillIndex] == nil then
		self.skillBlockJump[skillIndex] = {}
		self.skillBlockJump[skillIndex][AnimalBase_Define.SkillBlockJump.HitCombo] = hitCombo
		self.skillBlockJump[skillIndex][AnimalBase_Define.SkillBlockJump.HitBackCombo] = hitBackCombo
	end
end

function AnimalBase:SetBlock(flg, skillIndex, skillCombo, param)
	self.skillBlock = flg
	self.skillBlockIndex = skillIndex
	self.skillBlockCombo = skillCombo
	self.skillBlockParam = param
end

function AnimalBase:IsBlocked(fromVPlayer, originVPlayer, skillIndex, skillCombo)
	if fromVPlayer == nil or originVPlayer == nil or skillIndex <= 0 or skillCombo <= 0 then
		return false
	end

	if self:IsBlocking() == true and AnimalBase.IsSkillBlockedEnable(originVPlayer:GetHeroId(), skillIndex, skillCombo) == true and self.animalValue:IsHaveSkillEnergy() == true then
		local isBehind = GameAI.IsAnimalBehindPosition(self, fromVPlayer:GetPosition())

		if isBehind == false then
			return true
		end
	end

	return false
end

function AnimalBase:IsBlocking()
	if self.skillBlock == true and self.skillBlockIndex > 0 and self.skillBlockCombo > 0 and self.skillBlockParam > 0 then
		return true
	end

	return false
end

function AnimalBase:GetBlockSkill()
	return self.skillBlockIndex, self.skillBlockCombo, self.skillBlockParam
end

function AnimalBase:IsHitHand(fromVPlayer, originVPlayer, skillIndex, skillCombo)
	if fromVPlayer == nil or originVPlayer == nil or skillIndex <= 0 or skillCombo <= 0 then
		return false
	end

	local hitHand = false

	if self:IsSkilling() == true then
		local tmpSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if tmpSkillData ~= nil then
			local defHitHand = self:GetAnimatorParam(AnimalBase_Define.ParamType.DefenceHitHand)

			if defHitHand > 0 then
				hitHand = true
			end
		end
	end

	if hitHand == true and AnimalBase.IsHitHandEnable(originVPlayer:GetHeroId(), skillIndex, skillCombo) == true and self.animalValue:IsHaveSkillEnergy() == true then
		local isBehind = GameAI.IsAnimalBehindPosition(self, fromVPlayer:GetPosition())

		if isBehind == false then
			return true
		end
	end

	return false
end

function AnimalBase:IsHitHandTrick(trick)
	local trickData = trick:GetTrickData()

	if trickData ~= nil and trickData.HitHandEnable > 0 and self:IsSkilling() == true and self.animalValue:IsHaveSkillEnergy() == true then
		local tmpSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if tmpSkillData ~= nil then
			local defHitHand = self:GetAnimatorParam(AnimalBase_Define.ParamType.DefenceHitHand)

			if defHitHand > 0 then
				return true
			end
		end
	end

	return false
end

function AnimalBase:ShowCounterAttackSign()
	UIManager.SendMessage("HeadInfo", "ShowSign", self.animalId, true, HeadInfoCtrl.Sign.ExclamationRed)
end

function AnimalBase:CloseCounterAttackSign()
	UIManager.SendMessage("HeadInfo", "ShowSign", self.animalId, false, HeadInfoCtrl.Sign.Blank)
end

function AnimalBase:CheckCounterAttack()
	self:CloseCounterAttackSign()

	if self.type == AnimalBase_Define.Type.Hero and self:IsSkillingSkill() == true then
		local tmpSkillCounterAttack = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillCounterAttack)

		if tmpSkillCounterAttack > 0 then
			self:ShowCounterAttackSign()
		end
	end
end

function AnimalBase:SetHatredTargetId(animalId)
	self.hatredTargetId = animalId
end

function AnimalBase:GetHatredTargetId()
	return self.hatredTargetId
end

function AnimalBase:AddSkillTouchHitShell(hitShell, skillData, itemData, attackDir)
	local findTouchData

	if self.skillTouchHitShellList ~= nil then
		for i, touchHitData in pairs(self.skillTouchHitShellList) do
			if touchHitData ~= nil and touchHitData:IsEnable() == false then
				findTouchData = touchHitData

				break
			end
		end
	end

	if findTouchData == nil then
		findTouchData = SkillTouchHitShellData:new(self, hitShell:GetShellId(), skillData, itemData, attackDir)

		if self.skillTouchHitShellList == nil then
			self.skillTouchHitShellList = {}
		end

		table.insert(self.skillTouchHitShellList, findTouchData)
	else
		findTouchData:Reset(self, hitShell:GetShellId(), skillData, itemData, attackDir)
	end

	return findTouchData
end

function AnimalBase:ClearSkillTouchHitShell()
	if self.skillTouchHitShellList ~= nil then
		for i, touchHitData in pairs(self.skillTouchHitShellList) do
			if touchHitData ~= nil then
				touchHitData:Clear()

				touchHitData = nil
			end
		end
	end

	self.skillTouchHitShellList = nil
end

function AnimalBase:DisableSkillTouchHitShell()
	if self.skillTouchHitShellList ~= nil then
		for i, touchHitData in pairs(self.skillTouchHitShellList) do
			if touchHitData ~= nil and touchHitData:IsEnable() == true then
				local hitShell = touchHitData:GetHitShell()

				if hitShell ~= nil then
					hitShell:DisableSkillTouchAttackPlayer(self)
				end

				touchHitData:Disable()
			end
		end
	end
end

function AnimalBase:AddSkillTouchHitPlayer(hitVPlayer, skillData, itemData, attackDir, colliderIndexList)
	local findTouchData

	if self.skillTouchHitList ~= nil then
		for i, touchHitData in pairs(self.skillTouchHitList) do
			if touchHitData ~= nil and touchHitData:IsEnable() == false then
				findTouchData = touchHitData

				break
			end
		end
	end

	if findTouchData == nil then
		findTouchData = SkillTouchHitData:new(self, hitVPlayer, skillData, itemData, attackDir, colliderIndexList)

		if self.skillTouchHitList == nil then
			self.skillTouchHitList = {}
		end

		table.insert(self.skillTouchHitList, findTouchData)
	else
		findTouchData:Reset(self, hitVPlayer, skillData, itemData, attackDir, colliderIndexList)
	end

	return findTouchData
end

function AnimalBase:AddSkillTouchAttackPlayer(attVPlayer, skillData, itemData, attackDir, colliderIndexList)
	local findTouchData

	if self.skillTouchAttackList ~= nil then
		for i, touchAttackData in pairs(self.skillTouchAttackList) do
			if touchAttackData ~= nil and touchAttackData:IsEnable() == false then
				findTouchData = touchAttackData

				break
			end
		end
	end

	if findTouchData == nil then
		findTouchData = SkillTouchAttackData:new(self, attVPlayer, skillData, itemData, attackDir, colliderIndexList)

		if self:IsMyTeam(attVPlayer:GetTeamId()) == false then
			self:SetHatredTargetId(attVPlayer:GetAnimalId())
		end

		if self.skillTouchAttackList == nil then
			self.skillTouchAttackList = {}
		end

		table.insert(self.skillTouchAttackList, findTouchData)
	else
		if self:IsMyTeam(attVPlayer:GetTeamId()) == false then
			self:SetHatredTargetId(attVPlayer:GetAnimalId())
		end

		findTouchData:Reset(self, attVPlayer, skillData, itemData, attackDir, colliderIndexList)
	end

	return findTouchData
end

function AnimalBase:AddTrickTouch(trick, trickDir, colliderIndexList)
	local findTouchData

	if self.trickTouchList ~= nil then
		for i, touchTrickData in pairs(self.trickTouchList) do
			if touchTrickData ~= nil and touchTrickData:IsEnable() == false then
				findTouchData = touchTrickData

				break
			end
		end
	end

	if findTouchData == nil then
		findTouchData = TrickTouchData:new(self, trick, trickDir, colliderIndexList)

		if self.trickTouchList == nil then
			self.trickTouchList = {}
		end

		table.insert(self.trickTouchList, findTouchData)
	else
		findTouchData:Reset(self, trick, trickDir, colliderIndexList)
	end

	return findTouchData
end

function AnimalBase:AddTouchHitCombo(attackVPlayer, skillData)
	if attackVPlayer == nil or skillData == nil or self.isHost == true then
		return nil
	end

	local findTouchData

	if self.skillTouchHitComboList ~= nil then
		for i, touchComboData in pairs(self.skillTouchHitComboList) do
			if touchComboData:IsAttacker(attackVPlayer) == true then
				findTouchData = touchComboData

				break
			end
		end

		if findTouchData == nil then
			findTouchData = SkillTouchHitComboData:new(attackVPlayer, skillData)

			if self.skillTouchHitComboList == nil then
				self.skillTouchHitComboList = {}
			end

			table.insert(self.skillTouchHitComboList, findTouchData)
		else
			findTouchData:AddCombo(skillData)
		end
	end

	return findTouchData
end

function AnimalBase:GetTouchHitCombo(attackVPlayer)
	if self.skillTouchHitComboList ~= nil then
		for i, touchComboData in pairs(self.skillTouchHitComboList) do
			if touchComboData:IsAttacker(attackVPlayer) == true then
				return touchComboData:GetCombo()
			end
		end
	end

	return 0
end

function AnimalBase:ClearTouchHitCombo()
	if self.skillTouchHitComboList ~= nil then
		for i, touchComboData in pairs(self.skillTouchHitComboList) do
			if touchComboData ~= nil then
				touchComboData:Clear()

				touchComboData = nil
			end
		end
	end

	self.skillTouchHitComboList = nil
end

function AnimalBase:DisableTrickTouch(trick)
	if self.trickTouchList ~= nil then
		for i, touchData in pairs(self.trickTouchList) do
			if touchData ~= nil and touchData:GetTrick() == trick then
				touchData:Disable()
			end
		end
	end
end

function AnimalBase:ClearTrickTouch()
	if self.trickTouchList ~= nil then
		for i, touchData in pairs(self.trickTouchList) do
			if touchData ~= nil then
				touchData:Clear()

				touchData = nil
			end
		end
	end

	self.trickTouchList = nil
end

function AnimalBase:ClearSkillTouchAttackPlayer()
	if self.skillTouchAttackList ~= nil then
		for i, touchAttackData in pairs(self.skillTouchAttackList) do
			if touchAttackData ~= nil then
				touchAttackData:Clear()

				touchAttackData = nil
			end
		end
	end

	self.skillTouchAttackList = nil
end

function AnimalBase:DisableSkillTouchHitPlayer()
	if self.skillTouchHitList ~= nil then
		for i, touchHitData in pairs(self.skillTouchHitList) do
			if touchHitData ~= nil and touchHitData:IsEnable() == true then
				local hitPlayer = touchHitData:GetHitPlayer()

				if hitPlayer ~= nil then
					hitPlayer:DisableSkillTouchAttackPlayer(self)
				end

				touchHitData:Disable()
			end
		end
	end
end

function AnimalBase:DisableSkillTouchAttackPlayer(attPlayer)
	if attPlayer ~= nil and self.skillTouchAttackList ~= nil then
		for i, touchAttackData in pairs(self.skillTouchAttackList) do
			if touchAttackData ~= nil and touchAttackData:IsEnable() == true then
				local tmpAttVPlayer = touchAttackData:GetAttackVirtualPlayer()

				if tmpAttVPlayer:GetAnimalId() == attPlayer.animalId then
					touchAttackData:Disable()
				end
			end
		end
	end
end

function AnimalBase:ClearSkillTouchHitPlayer()
	if self.skillTouchHitList ~= nil then
		for i, touchHitData in pairs(self.skillTouchHitList) do
			if touchHitData ~= nil then
				touchHitData:Clear()

				touchHitData = nil
			end
		end
	end

	self.skillTouchHitList = nil
end

function AnimalBase:AddAttacker(attackVPlayer, damage)
	local animalId = attackVPlayer:GetAnimalId()

	if self.skillAttackerList == nil then
		self.skillAttackerList = {}
	end

	if self.skillAttackerList[animalId] == nil then
		self.skillAttackerList[animalId] = AttackerInfo:new(attackVPlayer)
	end

	self.skillAttackerList[animalId]:Update(damage, ControllerMain.LogicFrame)
end

function AnimalBase:ResetAttacker(lastAttackVPlayer)
	local assistNum = 0

	if self.skillAttackerList ~= nil then
		for k, v in pairs(self.skillAttackerList) do
			if v:CheckAssistEnable(lastAttackVPlayer, ControllerMain.LogicFrame) == true then
				assistNum = assistNum + 1

				local attackVPlayer = v:GetAttackVPlayer()

				if attackVPlayer ~= nil and (BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true or BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true) then
					FS_BattleData_OccupyMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_OccupyMode.DataType.AssistNum, 1)
				end
			end
		end
	end

	self.skillAttackerList = nil

	return assistNum
end

function AnimalBase:AddStatus(fromVPlayer, statusId, damage, srcType, srcId, isPeriod)
	if statusId <= 0 then
		return nil
	end

	local statusData = MS_StatusData.GetStatusData(statusId)

	if statusData == nil then
		return nil
	end

	local addStack = 0
	local priority = statusData.Priority
	local debuffer = statusData.IsDebuffer
	local stackAddPer = statusData.StackAddPer
	local logicType = statusData.LogicType
	local excludeOther = statusData.ExcludeOther

	if isPeriod == true then
		stackAddPer = stackAddPer * ControllerMain.GetLogicDeltaTime()
	end

	if debuffer > 0 and self:IsHaveStatusByType(MS_StatusData.LogicType.NoDebuffer) then
		return nil
	end

	if logicType == MS_StatusData.LogicType.DamageOverlayClear and self:IsHaveStatusByType(MS_StatusData.LogicType.DamageOverlay) == false then
		return nil
	end

	if self.statusList ~= nil then
		if self.statusList[statusId] ~= nil then
			local tmpStatus = self.statusList[statusId]

			if tmpStatus:IsActive() == true then
				if excludeOther > 0 then
					return nil
				end

				if tmpStatus:IsOverlay() == true then
					tmpStatus:AddOverlay()
				end

				if tmpStatus:IsRefresh() == true then
					tmpStatus:RefreshTime()
				end
			else
				tmpStatus:AddStack(stackAddPer)
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("=======########====AddStatus==111==statusData.LogicType=" .. logicType .. ",statusId=" .. statusId)
			end

			return tmpStatus
		else
			for id, tmpStatus in pairs(self.statusList) do
				if tmpStatus:GetStatusType() == statusData.StatusType then
					if tmpStatus:IsActive() == true and tmpStatus:IsRefresh() == false then
						return tmpStatus
					else
						addStack = tmpStatus:GetStack()

						self:ClearStatusById(id)

						break
					end
				end
			end
		end
	else
		self.statusList = {}
	end

	if self.statusList[statusId] == nil then
		if DebugValueLog == true then
			SystemHelper.LogTest("=======########====AddStatus==222==statusData.LogicType=" .. logicType .. ",statusId=" .. statusId)
		end

		local status = require("LuaScript/Logic/Status/Status" .. logicType)
		local fromAnimalId = 0

		if fromVPlayer ~= nil then
			damage = fromVPlayer:GetDamage(statusData.AttackType)
			fromAnimalId = fromVPlayer:GetAnimalId()
		end

		local tmpStatus = status:new(fromAnimalId, self, statusId, damage, srcType, srcId)

		if tmpStatus ~= nil then
			addStack = addStack + stackAddPer

			if addStack > 0 then
				tmpStatus:AddStack(addStack)
			end

			self.statusList[statusId] = tmpStatus

			return tmpStatus
		end
	end

	return nil
end

function AnimalBase:IsHaveStatusById(id)
	if self.statusList ~= nil and self.statusList[id] ~= nil and self.statusList[id]:IsActive() == true then
		return true
	end

	return false
end

function AnimalBase:GetStatusById(id)
	if self.statusList ~= nil and self.statusList[id] ~= nil and self.statusList[id]:IsActive() == true then
		return self.statusList[id]
	end

	return nil
end

function AnimalBase:GetStatusOverlayByType(logicType)
	local overlay = 0

	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil and tmpStatus:GetStatusLogicType() == logicType and tmpStatus:IsActive() == true then
				overlay = overlay + tmpStatus:GetOverlay()
			end
		end
	end

	return overlay
end

function AnimalBase:IsHaveBloodStatus()
	if self.statusList ~= nil then
		for k, id in pairs(MS_StatusData.BloodIdList) do
			if self.statusList[id] ~= nil and self.statusList[id]:IsActive() == true then
				return true
			end
		end
	end

	return false
end

function AnimalBase:IsHaveStatusByType(logicType)
	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil and tmpStatus:GetStatusLogicType() == logicType and tmpStatus:IsActive() == true then
				return true
			end
		end
	end

	return false
end

function AnimalBase:GetStatusSimpleValueByType(logicType)
	local ret = 0

	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil and tmpStatus:GetStatusLogicType() == logicType and tmpStatus:IsActive() == true then
				ret = ret + tmpStatus:GetSimpleValue()
			end
		end
	end

	return ret
end

function AnimalBase:GetStatusPropertyMaxValue()
	return self.statusPropertyMaxValueList
end

function AnimalBase:UpdateStatus()
	self.statusPropertyMaxValueList = nil

	if self.statusList == nil then
		return
	end

	if self:IsEnd() == true or self:IsWillDead() == true or self:IsShow() == false then
		return
	end

	local deleteList

	for id, tmpStatus in pairs(self.statusList) do
		if tmpStatus ~= nil then
			local ret = tmpStatus:Update()

			if ret == false then
				if deleteList == nil then
					deleteList = {}
				end

				table.insert(deleteList, id)
			else
				local tmpPropertyId = 0
				local tmpValue = 0

				tmpPropertyId, tmpValue = tmpStatus:GetPropertyValue(MS_StatusData.LogicType.PropertyMaxAdd)

				if tmpPropertyId > 0 and tmpValue > 0 then
					if self.statusPropertyMaxValueList == nil then
						self.statusPropertyMaxValueList = {}
					end

					if self.statusPropertyMaxValueList[tmpPropertyId] == nil then
						self.statusPropertyMaxValueList[tmpPropertyId] = 0
					end

					self.statusPropertyMaxValueList[tmpPropertyId] = self.statusPropertyMaxValueList[tmpPropertyId] + tmpValue
				end

				tmpPropertyId, tmpValue = tmpStatus:GetPropertyValue(MS_StatusData.LogicType.PropertyMaxSub)

				if tmpPropertyId > 0 and tmpValue > 0 then
					if self.statusPropertyMaxValueList == nil then
						self.statusPropertyMaxValueList = {}
					end

					if self.statusPropertyMaxValueList[tmpPropertyId] == nil then
						self.statusPropertyMaxValueList[tmpPropertyId] = 0
					end

					self.statusPropertyMaxValueList[tmpPropertyId] = self.statusPropertyMaxValueList[tmpPropertyId] - tmpValue
				end

				tmpPropertyId, tmpValue = tmpStatus:GetPropertyValue(MS_StatusData.LogicType.PropertyPeriodAdd)

				if tmpPropertyId > 0 and tmpValue > 0 then
					self.animalValue:AddProperty(tmpPropertyId, tmpValue, 0)
				end

				tmpPropertyId, tmpValue = tmpStatus:GetPropertyValue(MS_StatusData.LogicType.PropertyPeriodSub)

				if tmpPropertyId > 0 and tmpValue > 0 then
					if tmpStatus:IsNoDeath() == true and (tmpPropertyId == MS_HeroData.Property.Hp or tmpPropertyId == MS_HeroData.Property.San) then
						self.animalValue:SubProperty(tmpPropertyId, tmpValue, -1, -1, 1)
					else
						if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.isHost == true and self.isHostBack == false and self.animalId ~= tmpStatus:GetFromAnimalId() and tmpPropertyId == MS_HeroData.Property.Hp and tmpValue > 0 then
							self.gameController:SetNotPerfect()
						end

						self.animalValue:SubProperty(tmpPropertyId, tmpValue, -1, -1, -1)
					end
				end
			end
		end
	end

	if self:IsWillDead() == true then
		self:WillDead(nil, nil)
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local id = deleteList[i]

			self:ClearStatusById(id)
		end
	end

	deleteList = nil
end

function AnimalBase:PauseStatusAll()
	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil then
				tmpStatus:Pause()
			end
		end
	end
end

function AnimalBase:ResumeStatusAll()
	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil then
				tmpStatus:Resume()
			end
		end
	end
end

function AnimalBase:ClearStatusById(id)
	if self.statusList ~= nil and self.statusList[id] ~= nil then
		self.statusList[id]:Clear()

		self.statusList[id] = nil
	end
end

function AnimalBase:ClearStatusByType(logicType)
	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil and tmpStatus:GetStatusLogicType() == logicType then
				self:ClearStatusById(id)

				break
			end
		end
	end
end

function AnimalBase:ClearStatusAllByType(logicType)
	local deleteList

	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil and tmpStatus:GetStatusLogicType() == logicType then
				if deleteList == nil then
					deleteList = {}
				end

				table.insert(deleteList, id)
			end
		end
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local id = deleteList[i]

			self:ClearStatusById(id)
		end
	end

	deleteList = nil
end

function AnimalBase:ClearStatusAll()
	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil then
				tmpStatus:Clear()
			end
		end
	end

	self.statusList = nil
	self.statusPropertyMaxValueList = nil
end

function AnimalBase:ClearStatusAllDebuffer()
	local deleteList

	if self.statusList ~= nil then
		for id, tmpStatus in pairs(self.statusList) do
			if tmpStatus ~= nil and tmpStatus:IsDebuffer() == true then
				if deleteList == nil then
					deleteList = {}
				end

				table.insert(deleteList, id)
			end
		end
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local id = deleteList[i]

			self:ClearStatusById(id)
		end
	end

	deleteList = nil
end

function AnimalBase:LoadStatus()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true then
		self:ClearStatusAll()

		local statusList = FS_UserData.story:GetHeroShareStatusList()

		if statusList ~= nil then
			local vp = self:GetVirtualPlayer()

			for id, saveData in pairs(statusList) do
				local statusId = tonumber(id)

				if statusId > 0 and saveData ~= nil then
					local status = self:AddStatus(vp, statusId, 0, MS_StatusData.SourceType.Unknown, 0, false)

					if status ~= nil then
						status:LoadSaveData(saveData)
					end
				end
			end
		end
	end
end

function AnimalBase:SaveStatus()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true then
		FS_UserData.story:ClearHeroShareStatusAll()

		if self.statusList ~= nil then
			for id, tmpStatus in pairs(self.statusList) do
				if tmpStatus:IsActive() == true and tmpStatus:IsShare() == true then
					FS_UserData.story:SetHeroShareStatus(id, tmpStatus:GetSaveData())
				end
			end
		end
	end
end

function AnimalBase:SaveProperty()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local isCall = false

		if self.isHost == false then
			isCall = self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero)
		end

		if self.isHost == true or isCall == true then
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.Property.Hp, self.animalValue:GetProperty(MS_HeroData.Property.Hp), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.Property.Rage, self.animalValue:GetProperty(MS_HeroData.Property.Rage), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.Property.Power, self.animalValue:GetProperty(MS_HeroData.Property.Power), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.Property.San, self.animalValue:GetProperty(MS_HeroData.Property.San), isCall)

			if heroId == 10002 then
				FS_UserData.story:SetHeroProperty(heroId, MS_HeroData.SpecialProperty.BulletWhiteNow, player:GetBulletNum(Hero10002_Define.BulletType.White), isCall)
				FS_UserData.story:SetHeroProperty(heroId, MS_HeroData.SpecialProperty.BulletWhiteMax, player:GetBulletMax(Hero10002_Define.BulletType.White), isCall)
				FS_UserData.story:SetHeroProperty(heroId, MS_HeroData.SpecialProperty.BulletBlueNow, player:GetBulletNum(Hero10002_Define.BulletType.Blue), isCall)
				FS_UserData.story:SetHeroProperty(heroId, MS_HeroData.SpecialProperty.BulletBlueMax, player:GetBulletMax(Hero10002_Define.BulletType.Blue), isCall)
				FS_UserData.story:SetHeroProperty(heroId, MS_HeroData.SpecialProperty.BulletRedNow, player:GetBulletNum(Hero10002_Define.BulletType.Red), isCall)
				FS_UserData.story:SetHeroProperty(heroId, MS_HeroData.SpecialProperty.BulletRedMax, player:GetBulletMax(Hero10002_Define.BulletType.Red), isCall)
			end
		end
	end
end

function AnimalBase:SetStoryLogicRule(type, param)
	self.characterStoryLogicRuleList[type] = param
end

function AnimalBase:IsHaveStoryLogicRule(type)
	if self.characterStoryLogicRuleList[type] ~= nil and self.characterStoryLogicRuleList[type] > 0 then
		return true
	end

	return false
end

function AnimalBase:GetStoryLogicRuleParam(type)
	if self.characterStoryLogicRuleList[type] ~= nil then
		return self.characterStoryLogicRuleList[type]
	end

	return 0
end

function AnimalBase:AddLogicRule(type, param)
	if self.characterLogicRuleList == nil then
		self.characterLogicRuleList = {}
	end

	if self.characterLogicRuleList[type] == nil then
		self.characterLogicRuleList[type] = param
	elseif type == AnimalBase_Define.LogicRule.DodgeClose then
		if param < self.characterLogicRuleList[type] then
			self.characterLogicRuleList[type] = param
		end
	elseif param > self.characterLogicRuleList[type] then
		self.characterLogicRuleList[type] = param
	end
end

function AnimalBase:IsHaveLogicRule(type)
	if self.characterLogicRuleList ~= nil and self.characterLogicRuleList[type] ~= nil then
		return true
	end

	return false
end

function AnimalBase:GetLogicRuleParam(type)
	if self.characterLogicRuleList ~= nil and self.characterLogicRuleList[type] ~= nil then
		return self.characterLogicRuleList[type]
	end

	return 0
end

function AnimalBase:IsToHit(hitType, skillData)
	if self:IsOnStair() == true then
		return false
	end

	if self.moveNoDamage == true then
		return false
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Drop or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		return false
	end

	if hitType == AnimalBase_Define.HitType.Toward or hitType == AnimalBase_Define.HitType.BodyBreak then
		return true
	end

	if DebugHitBone == true then
		return false
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		if self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop1 or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop2 then
			if self:IsWillDead() == false then
				if self.hugeBody > 0 then
					if self.animatorTrigger < AnimalBase_Define.TriggerHit.FollowAttack then
						return false
					elseif self.animatorTrigger == AnimalBase_Define.TriggerHit.FollowAttack and hitType ~= AnimalBase_Define.HitType.Execute then
						return false
					end
				elseif self.moveHitType ~= AnimalBase_Define.HitType.StatusWeakLoop1 and self.moveHitType ~= AnimalBase_Define.HitType.StatusWeakLoop2 then
					if self.animatorTrigger < AnimalBase_Define.TriggerHit.FollowAttack then
						return false
					elseif self.animatorTrigger == AnimalBase_Define.TriggerHit.FollowAttack and skillData ~= nil and skillData.SkillIndex == AnimalBase_Define.SkillType.CounterAttack then
						return false
					end
				end
			end
		elseif self.moveHitType == AnimalBase_Define.HitType.StatusBreak then
			if self.hugeBody > 0 and self:IsWillDead() == false and self.animatorTrigger <= AnimalBase_Define.TriggerHit.FollowAttack then
				return false
			end
		elseif self.moveHitType == AnimalBase_Define.HitType.Up then
			if self.animatorTrigger < AnimalBase_Define.TriggerHit.Drop then
				return false
			elseif self.animatorTrigger == AnimalBase_Define.TriggerHit.Drop then
				if hitType ~= AnimalBase_Define.HitType.Down and (hitType ~= AnimalBase_Define.HitType.Up or self.type ~= AnimalBase_Define.Type.Hero) then
					return false
				end
			elseif self.animatorTrigger == AnimalBase_Define.TriggerHit.FollowAttack and hitType ~= AnimalBase_Define.HitType.FrontFly and hitType ~= AnimalBase_Define.HitType.FrontFlyFar and hitType ~= AnimalBase_Define.HitType.FrontFlyCrow and hitType ~= AnimalBase_Define.HitType.BackFly and hitType ~= AnimalBase_Define.HitType.BackFlyFar and hitType ~= AnimalBase_Define.HitType.BackFlyCrow and hitType ~= AnimalBase_Define.HitType.Up then
				return false
			end
		elseif self.moveHitType == AnimalBase_Define.HitType.FrontFly or self.moveHitType == AnimalBase_Define.HitType.FrontFlyFar or self.moveHitType == AnimalBase_Define.HitType.FrontFlyCrow or self.moveHitType == AnimalBase_Define.HitType.BackFly or self.moveHitType == AnimalBase_Define.HitType.BackFlyFar or self.moveHitType == AnimalBase_Define.HitType.BackFlyCrow then
			if self.animatorTrigger < AnimalBase_Define.TriggerHit.FollowAttack then
				return false
			elseif self.animatorTrigger == AnimalBase_Define.TriggerHit.FollowAttack and hitType ~= AnimalBase_Define.HitType.FrontFly and hitType ~= AnimalBase_Define.HitType.FrontFlyFar and hitType ~= AnimalBase_Define.HitType.FrontFlyCrow and hitType ~= AnimalBase_Define.HitType.BackFly and hitType ~= AnimalBase_Define.HitType.BackFlyFar and hitType ~= AnimalBase_Define.HitType.BackFlyCrow and hitType ~= AnimalBase_Define.HitType.Up then
				return false
			end
		elseif self.moveHitType == AnimalBase_Define.HitType.Toward or self.moveHitType == AnimalBase_Define.HitType.BodyBreak then
			return false
		elseif (self.moveHitType == AnimalBase_Define.HitType.Dizzy or self.moveHitType == AnimalBase_Define.HitType.Freeze or self.moveHitType == AnimalBase_Define.HitType.Tackle) and self.moveHitLock == true and hitType ~= self.moveHitType then
			return false
		end

		if self.moveNoHitTime > 0 then
			local nowTime = TimeHelper.getNowTime()

			if nowTime < self.moveNoHitTime then
				return false
			else
				self.moveNoHitTime = 0
			end
		end
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround and self.moveDropType ~= AnimalBase_Define.DropType.HeadUp and (hitType == AnimalBase_Define.HitType.Light or hitType == AnimalBase_Define.HitType.Heavy or hitType == AnimalBase_Define.HitType.Super or hitType == AnimalBase_Define.HitType.Down) then
		return false
	end

	return true
end

function AnimalBase:SetMoveNoDamage(flag)
	self.moveNoDamage = flag
end

function AnimalBase:IsNoDamage()
	if self.moveNoDamage == true then
		return self.moveNoDamage
	elseif self:IsHaveStatusByType(MS_StatusData.LogicType.NoDamage) == true then
		return true
	end

	return false
end

function AnimalBase:SetMoveNoWeakness(flag)
	self.moveNoWeakness = flag
end

function AnimalBase:IsNoWeakness()
	return self.moveNoWeakness
end

function AnimalBase:SetMoveNoHitTime(time)
	self.moveNoHitTime = TimeHelper.getNowTime() + time
end

function AnimalBase:SetMoveNoDropDamage(flag)
	self.moveNoDropDamage = flag
end

function AnimalBase:IsNoDropDamage()
	return self.moveNoDropDamage
end

function AnimalBase:IsMutekiForSkill(hitAnimal)
	if self:IsSkillingById(AnimalBase_Define.SkillType.Execute, 1) then
		if self.skillExecuteTarget ~= nil and self.skillExecuteTarget ~= hitAnimal then
			return true
		end
	elseif self:IsSkillingById(AnimalBase_Define.SkillType.Backstab, 1) and self.skillBackstabTarget ~= nil and self.skillBackstabTarget ~= hitAnimal then
		return true
	end

	return false
end

function AnimalBase:SetMoveMuteki(flag)
	self.moveMuteki = flag
end

function AnimalBase:IsMuteki(attackAnimal)
	if self:IsStop() == false and self:IsWillDead() == false and self:IsShow() == true then
		if self.moveMuteki == true then
			return true
		end

		if self.moveMutekiIgnoreId > 0 and self.moveMutekiIgnoreId ~= attackAnimal:GetAnimalId() then
			return true
		end

		if self.heroExtData ~= nil and (self.heroExtAiMode == GameAI.BehaviourMode.DoNotAttack or self.heroExtAiMode == GameAI.BehaviourMode.Guide) then
			return true
		end

		if self.moveLock == true then
			return true
		end

		if self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.MoveForce then
			return true
		end

		if self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareStart or self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CallStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly or self:IsEventMuteki(self.moveStateNow) then
			return true
		end

		local tmpSkillMuteki = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillMuteki)

		if tmpSkillMuteki > 0 then
			return true
		elseif self:IsSkillingSkill() == true then
			local tmpTalentValue = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillMuteki, self.skillIndex, self.skillCombo)

			if tmpTalentValue > 0 then
				local tmpSkillMuteki2 = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillMuteki2)

				if tmpSkillMuteki2 > 0 then
					return true
				end
			end
		end

		if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
			if self.moveHitType == AnimalBase_Define.HitType.FrontFly or self.moveHitType == AnimalBase_Define.HitType.FrontFlyFar or self.moveHitType == AnimalBase_Define.HitType.FrontFlyCrow or self.moveHitType == AnimalBase_Define.HitType.BackFly or self.moveHitType == AnimalBase_Define.HitType.BackFlyFar or self.moveHitType == AnimalBase_Define.HitType.BackFlyCrow or self.moveHitType == AnimalBase_Define.HitType.Down then
				if self.animatorTrigger < AnimalBase_Define.TriggerHit.FollowAttack then
					return true
				end
			elseif self.moveHitType == AnimalBase_Define.HitType.Up then
				if self.animatorTrigger < AnimalBase_Define.TriggerHit.Drop then
					return true
				end
			elseif self.moveHitType == AnimalBase_Define.HitType.Execute then
				if attackAnimal == nil or attackAnimal ~= self.skillExecuteHost or attackAnimal:IsSkillingById(AnimalBase_Define.SkillType.Execute, 1) == false then
					return true
				end
			elseif (self.moveHitType == AnimalBase_Define.HitType.Backstab or self.moveHitType == AnimalBase_Define.HitType.Backstab2) and (attackAnimal == nil or attackAnimal ~= self.skillBackstabHost or attackAnimal:IsSkillingById(AnimalBase_Define.SkillType.Backstab, 1) == false) then
				return true
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
			return true
		end

		return false
	end

	return true
end

function AnimalBase:CheckSkillCollider()
	if self:IsSkilling() == false or self:IsWillDead() == true then
		return
	end

	if self:IsShow() == false then
		return
	end

	local colliderCubeList = self:GetSkillColliderList()

	if colliderCubeList == nil or #colliderCubeList <= 0 then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
	local targetType = AnimalBase.GetSkillTargetType(self.heroId, self.skillIndex, self.skillCombo)
	local hitAnimalIdList, hitShellIdList
	local parryEnable = AnimalBase.IsSkillParryEnable(self.heroId, self.skillIndex, self.skillCombo)
	local multiTargetFlg = self:IsSkillMultiTarget(self.skillIndex, self.skillCombo)
	local retColliderNum, retOwnerIdList, retLayerList = GameCollider.CheckCubeCollider(self, colliderCubeList, parryEnable)

	if retColliderNum > 0 and retOwnerIdList ~= nil and retLayerList ~= nil then
		for j = 0, retColliderNum - 1 do
			local ownerId = retOwnerIdList[j]
			local hitlayer = retLayerList[j]

			if ownerId ~= nil and hitlayer ~= nil then
				if hitlayer == LayerShell then
					if hitShellIdList == nil then
						hitShellIdList = {}
					end

					hitShellIdList[ownerId] = 1
				elseif hitlayer == LayerAnimalSkill then
					local animal = self.sceneController:FindPlayerById(ownerId)

					if animal ~= nil then
						local isParry = GameAI.IsSkillParryCloseSuccess(self, animal)

						if isParry == true then
							if self.animalValue:GetProperty(MS_HeroData.Property.Weakness) <= AnimalBase_Define.ParryWeaknessMin and AnimalBase.IsSkillParryRebound(self.heroId, self.skillIndex, self.skillCombo) == true then
								self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
								self:HitCounterAttack(skillData)
							end

							animal:OnSkillParry(self, skillData)

							hitAnimalIdList = nil

							return
						end
					end
				else
					if hitAnimalIdList == nil then
						hitAnimalIdList = {}
					end

					hitAnimalIdList[ownerId] = 1
				end
			end
		end
	end

	if targetType == GameAI.SkillTargetType.Self or targetType == GameAI.SkillTargetType.FriendAndSelf or targetType == GameAI.SkillTargetType.All then
		if hitAnimalIdList == nil then
			hitAnimalIdList = {}
		end

		hitAnimalIdList[self.animalId] = 1
	end

	if hitAnimalIdList ~= nil then
		if multiTargetFlg == true then
			for tmpAnimalId, _ in pairs(hitAnimalIdList) do
				if tmpAnimalId == self.animalId then
					if self:CheckHitFromSkillCollider(self) == true then
						GameCollider.SkillCollider(self, self, skillData, nil)
					end
				else
					local animal = self.sceneController:FindPlayerById(tmpAnimalId)

					if animal ~= nil then
						local retIn = GameAI.IsInSelectTarget(self.animalId, self:GetTeamId(), targetType, animal)

						if retIn == true and animal:IsWillDead() == false and animal:IsShow() == true and self:CheckHitFromSkillCollider(animal) == true then
							if animal.useHitBone > 0 then
								local colliderIndexList = {}
								local tmpColliderNum, tmpColliderlIdList, tmpLayerList = GameCollider.GetOverlapColliderBone(tmpAnimalId)

								if tmpColliderNum > 0 and tmpColliderlIdList ~= nil then
									for k = 0, tmpColliderNum - 1 do
										local colliderIndex = tmpColliderlIdList[k]

										if colliderIndex ~= nil and colliderIndex >= 0 then
											table.insert(colliderIndexList, colliderIndex)
										end
									end
								end

								if #colliderIndexList > 0 then
									colliderIndexList = table.unique(colliderIndexList, true)
								end

								if #colliderIndexList > 0 then
									GameCollider.SkillCollider(self, animal, skillData, colliderIndexList)
								end
							else
								GameCollider.SkillCollider(self, animal, skillData, nil)
							end
						end
					end
				end
			end
		else
			local closeHitAnimal, colliderIndexList
			local closeHitDis = 9999
			local nowPos = self:GetPosByWorldPos()

			for tmpAnimalId, _ in pairs(hitAnimalIdList) do
				if tmpAnimalId == self.animalId then
					if self:CheckHitFromSkillCollider(self) == true then
						closeHitAnimal = self
						closeHitDis = 0
						colliderIndexList = nil
					end
				else
					local animal = self.sceneController:FindPlayerById(tmpAnimalId)

					if animal ~= nil then
						local retIn = GameAI.IsInSelectTarget(self.animalId, self:GetTeamId(), targetType, animal)

						if retIn == true and animal:IsWillDead() == false and animal:IsShow() == true and self:CheckHitFromSkillCollider(animal) == true then
							local tmpDis = Vector3.DistanceSquare(nowPos, animal:GetPosByWorldPos())

							if tmpDis < closeHitDis then
								if animal.useHitBone > 0 then
									local colliderIndexList = {}
									local tmpColliderNum, tmpColliderlIdList, tmpLayerList = GameCollider.GetOverlapColliderBone(tmpAnimalId)

									if tmpColliderNum > 0 and tmpColliderlIdList ~= nil then
										for k = 0, tmpColliderNum - 1 do
											local colliderIndex = tmpColliderlIdList[k]

											if colliderIndex ~= nil and colliderIndex >= 0 then
												table.insert(colliderIndexList, colliderIndex)
											end
										end
									end

									if #colliderIndexList > 0 then
										colliderIndexList = table.unique(colliderIndexList, true)
									end

									if #colliderIndexList > 0 then
										closeHitAnimal = animal
										closeHitDis = tmpDis
									end
								else
									closeHitAnimal = animal
									closeHitDis = tmpDis
									colliderIndexList = nil
								end
							end
						end
					end
				end
			end

			if closeHitAnimal ~= nil then
				GameCollider.SkillCollider(self, closeHitAnimal, skillData, colliderIndexList)
			end
		end
	end

	if hitShellIdList ~= nil then
		SystemHelper.LogTest("=======AnimalBase=====CheckSkillCollider=====hitShellIdList!!!==")

		if multiTargetFlg == true then
			for tmpShellId, _ in pairs(hitShellIdList) do
				local hitShell = self.sceneController:FindShellById(tmpShellId)

				if hitShell ~= nil then
					local retIn = GameAI.IsInSelectTargetForShell(self.animalId, self:GetTeamId(), targetType, hitShell)

					if retIn == true and hitShell:IsWillDead() == false and hitShell:IsShow() == true and self:CheckHitShellFromSkillCollider(hitShell) == true then
						GameCollider.SkillColliderShell(self, hitShell, skillData)
					end
				end
			end
		else
			local closeHitShell
			local closeHitDis = 9999
			local nowPos = self:GetPosByWorldPos()

			for tmpShellId, _ in pairs(hitShellIdList) do
				local hitShell = self.sceneController:FindShellById(tmpShellId)

				if hitShell ~= nil then
					local retIn = GameAI.IsInSelectTargetForShell(self.animalId, self:GetTeamId(), targetType, hitShell)

					if retIn == true and hitShell:IsWillDead() == false and hitShell:IsShow() == true and self:CheckHitShellFromSkillCollider(hitShell) == true then
						local tmpDis = Vector3.DistanceSquare(nowPos, hitShell:GetPosByWorldPos())

						if tmpDis < closeHitDis then
							closeHitShell = hitShell
							closeHitDis = tmpDis
						end
					end
				end
			end

			if closeHitShell ~= nil then
				GameCollider.SkillColliderShell(self, closeHitShell, skillData)
			end
		end
	end

	hitShellIdList = nil
end

function AnimalBase:CheckHitFromSkillCollider(hitPlayer)
	if hitPlayer == nil then
		return false
	end

	if self.animalId == hitPlayer.animalId then
		if self:IsWillDead() == true then
			return false
		end
	elseif hitPlayer:IsWillDead() == true or hitPlayer:IsMuteki(self) == true or self:IsMutekiForSkill(hitPlayer) == true then
		return false
	end

	if self:IsSkilling() == true then
		if self:IsSkillMultiTarget(self.skillIndex, self.skillCombo) == true then
			if self.skillTouchHitList ~= nil then
				for i, touchHitData in pairs(self.skillTouchHitList) do
					if touchHitData ~= nil and touchHitData:IsEnable() == true then
						local tmpPlayer = touchHitData:GetHitPlayer()

						if tmpPlayer == hitPlayer then
							return false
						end
					end
				end
			end

			return true
		else
			if self.skillTouchHitList ~= nil then
				for i, touchHitData in pairs(self.skillTouchHitList) do
					if touchHitData ~= nil and touchHitData:IsEnable() == true then
						return false
					end
				end
			end

			return true
		end
	end

	return false
end

function AnimalBase:CheckHitShellFromSkillCollider(hitShell)
	if hitShell == nil then
		return false
	end

	if hitShell:IsWillDead() == true then
		return false
	end

	local shellId = hitShell:GetShellId()

	if self:IsSkilling() == true then
		if self:IsSkillMultiTarget(self.skillIndex, self.skillCombo) == true then
			if self.skillTouchHitShellList ~= nil then
				for i, touchHitData in pairs(self.skillTouchHitShellList) do
					if touchHitData ~= nil and touchHitData:IsEnable() == true and touchHitData:GetHitShellId() == shellId then
						return false
					end
				end
			end

			return true
		else
			if self.skillTouchHitShellList ~= nil then
				for i, touchHitData in pairs(self.skillTouchHitShellList) do
					if touchHitData ~= nil and touchHitData:IsEnable() == true then
						return false
					end
				end
			end

			return true
		end
	end

	return false
end

function AnimalBase:StartAnimatorDelay(startTime, freezeTime, fadeoutTime, freezeSpeed)
	if DebugDontUseFreezeFrame == true then
		return
	end

	if freezeTime > 0 then
		self.animatorDelayFreezeTime = freezeTime * self.animatorDelayScale
		self.animatorDelayFadeOutTime = fadeoutTime * self.animatorDelayScale
		self.animatorDelayRestTime = self.animatorDelayFreezeTime + self.animatorDelayFadeOutTime
		self.animatorDelayStartTime = startTime
		self.animatorDelayFreezeSpeed = freezeSpeed
		self.animatorDelayScale = 0.5
	else
		self.animatorDelayFreezeTime = 0
		self.animatorDelayFadeOutTime = 0
		self.animatorDelayRestTime = 0
		self.animatorDelayStartTime = 0
		self.animatorDelayFreezeSpeed = 0
	end
end

function AnimalBase:UpdateAnimatorDelay()
	local retSpeed = 1

	if DebugSkillAnimatorSpeed then
		retSpeed = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillSpeed)

		if retSpeed <= 0 then
			retSpeed = 1
		end
	elseif self.animatorSkillSpeed > 1 then
		retSpeed = self.animatorSkillSpeed
	end

	if self:IsAnimatorDelay() == true then
		if self.animatorDelayRestTime > self.animatorDelayFadeOutTime then
			retSpeed = self.animatorDelayFreezeSpeed
		else
			local t = self.animatorDelayFadeOutTime - self.animatorDelayRestTime

			t = t / self.animatorDelayFadeOutTime

			if retSpeed > self.animatorDelayFreezeSpeed then
				retSpeed = Mathf.Clamp(Mathf.Pow(t, 3), self.animatorDelayFreezeSpeed, retSpeed)
			end
		end
	elseif self:IsAnimatorDelayEnd() == true then
		self:EndAnimatorDelay()
	end

	if self.animatorDelayStartTime > 0 then
		self.animatorDelayStartTime = Mathf.Max(0, self.animatorDelayStartTime - ControllerMain.GetLogicDeltaTime())
	elseif self.animatorDelayRestTime > 0 then
		self.animatorDelayRestTime = Mathf.Max(0, self.animatorDelayRestTime - ControllerMain.GetLogicDeltaTime())
	end

	return retSpeed
end

function AnimalBase:IsAnimatorDelay()
	if self.animatorDelayStartTime > 0 then
		return false
	elseif self.animatorDelayRestTime > 0 then
		return true
	end

	return false
end

function AnimalBase:IsAnimatorDelayEnd()
	if self.animatorDelayRestTime > 0 then
		return false
	end

	return true
end

function AnimalBase:EndAnimatorDelay()
	self.animatorDelayRestTime = 0
	self.animatorDelayStartTime = 0
end

function AnimalBase:GetSkillDirection(hitPos)
	local attackDir = Vector3.forward

	if self:IsSkillingSkill() == true then
		local skillDir = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillDir)

		if skillDir <= 0 then
			local nowPos = self:GetPosByWorldPos()

			attackDir:SetVector3(hitPos)
			attackDir:Sub(nowPos)

			attackDir.y = 0

			if MathHelper.IsZero(attackDir.sqrMagnitude) then
				attackDir:Set(0, 0, 1)
			else
				attackDir:SetNormalize()
			end
		else
			local skillDirNew = (skillDir - 1) % 4

			skillDirNew = skillDirNew / 4

			local skillRot = Quaternion.Euler(0, 360 * skillDirNew, 0)

			attackDir:MulQuat(skillRot)
			attackDir:MulQuat(self:GetRotation())

			skillRot = nil
		end
	end

	return attackDir
end

function AnimalBase:IsShowSkillCollider()
	if self.skillColliderCubeList ~= nil and #self.skillColliderCubeList > 0 then
		return true
	end

	return false
end

function AnimalBase:GetSkillColliderList()
	return self.skillColliderCubeList
end

function AnimalBase:StartSkillCollider()
	if self:IsSkillingSkill() == true then
		if self.skillColliderCubeList == nil then
			self.skillColliderCubeList = {}
		end

		if self.skillColliderCubeConfigList == nil then
			self.skillColliderCubeConfigList = {}
		end

		local boxType = self:GetAttackBoxType(self.skillIndex, self.skillCombo)

		if boxType == AnimalBase_Define.AttackBoxType.Skill then
			table.insert(self.skillColliderCubeList, self.bodyAttackCube[self.skillIndex][self.skillCombo])
		elseif boxType == AnimalBase_Define.AttackBoxType.Hand then
			local handId = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillHand)

			if handId > 0 then
				if handId < AnimalBase_Define.SkillHandBody then
					local tmpId = (handId - 1) % 3 + 1

					if tmpId == AnimalBase_Define.SkillHand.LeftAndRight then
						if self.bodyHandCube[handId - 2] ~= nil and #self.bodyHandCube[handId - 2] > 0 then
							for i = 1, #self.bodyHandCube[handId - 2] do
								table.insert(self.skillColliderCubeList, self.bodyHandCube[handId - 2][i])

								if self.bodyHandBoxConfig ~= nil and self.bodyHandBoxConfig[handId - 2] ~= nil and self.bodyHandBoxConfig[handId - 2][i] ~= nil then
									table.insert(self.skillColliderCubeConfigList, self.bodyHandBoxConfig[handId - 2][i])
								end
							end
						end

						if self.bodyHandCube[handId - 1] ~= nil and #self.bodyHandCube[handId - 1] > 0 then
							for i = 1, #self.bodyHandCube[handId - 1] do
								table.insert(self.skillColliderCubeList, self.bodyHandCube[handId - 1][i])

								if self.bodyHandBoxConfig ~= nil and self.bodyHandBoxConfig[handId - 1] ~= nil and self.bodyHandBoxConfig[handId - 1][i] ~= nil then
									table.insert(self.skillColliderCubeConfigList, self.bodyHandBoxConfig[handId - 1][i])
								end
							end
						end
					elseif self.bodyHandCube[handId] ~= nil and #self.bodyHandCube[handId] > 0 then
						for i = 1, #self.bodyHandCube[handId] do
							table.insert(self.skillColliderCubeList, self.bodyHandCube[handId][i])

							if self.bodyHandBoxConfig ~= nil and self.bodyHandBoxConfig[handId] ~= nil and self.bodyHandBoxConfig[handId][i] ~= nil then
								table.insert(self.skillColliderCubeConfigList, self.bodyHandBoxConfig[handId][i])
							end
						end
					end
				elseif self.bodyHandCube[handId] ~= nil and #self.bodyHandCube[handId] > 0 then
					for i = 1, #self.bodyHandCube[handId] do
						table.insert(self.skillColliderCubeList, self.bodyHandCube[handId][i])

						if self.bodyHandBoxConfig ~= nil and self.bodyHandBoxConfig[handId] ~= nil and self.bodyHandBoxConfig[handId][i] ~= nil then
							table.insert(self.skillColliderCubeConfigList, self.bodyHandBoxConfig[handId][i])
						end
					end
				end
			end
		end

		if self.skillColliderCubeConfigList ~= nil and #self.skillColliderCubeConfigList > 0 then
			for i = 1, #self.skillColliderCubeConfigList do
				local tmpCubeConfig = self.skillColliderCubeConfigList[i]

				if tmpCubeConfig ~= nil then
					tmpCubeConfig:OpenAttackBox()
				end
			end
		end

		if DebugShowAttackBox == true and self.skillColliderCubeList ~= nil and #self.skillColliderCubeList > 0 then
			for i = 1, #self.skillColliderCubeList do
				local cube = self.skillColliderCubeList[i]

				if cube ~= nil then
					cube:ShowTestCube()
				end
			end
		end

		self:UpdateColliderBox()
	end
end

function AnimalBase:EndSkillCollider()
	if DebugShowAttackBox == true and self.skillColliderCubeList ~= nil and #self.skillColliderCubeList > 0 then
		for i = 1, #self.skillColliderCubeList do
			local cube = self.skillColliderCubeList[i]

			if cube ~= nil then
				cube:HideTestCube()
			end
		end
	end

	if self.skillColliderCubeConfigList ~= nil and #self.skillColliderCubeConfigList > 0 then
		for i = 1, #self.skillColliderCubeConfigList do
			local tmpCubeConfig = self.skillColliderCubeConfigList[i]

			if tmpCubeConfig ~= nil then
				tmpCubeConfig:CloseAttackBox()
			end
		end
	end

	self.skillColliderCubeConfigList = nil
	self.skillColliderCubeList = nil
end

function AnimalBase:OnSkillRecoveryTrigger(trigger)
	if self:IsSkilling() == false then
		return
	end
end

function AnimalBase:OnSkillTrigger(trigger)
	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == AnimalBase_Define.SkillType.Throw or self.skillIndex == AnimalBase_Define.SkillType.ThrowLow then
		if trigger == 1 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, false)
		elseif trigger == 2 then
			if self.skillThrowItemId > 0 then
				local subNum = self.gameController:UseBagItem(self.skillThrowItemId, 1)

				if subNum > 0 then
					FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemUseTimes, self.skillThrowItemId, 1)

					local itemData = MS_ItemData.GetItemData(self.skillThrowItemId)

					if skillData ~= nil and itemData ~= nil and (itemData.BulletType == ControllerBullet.BulletType.StraightLine or itemData.BulletType == ControllerBullet.BulletType.Parabola) then
						local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
						local targetPos
						local bulletIndex = -1

						if itemData.BulletType == ControllerBullet.BulletType.Parabola then
							if itemData.BulletTargetType == ControllerBullet.BulletTargetType.Foot then
								targetPos = GameAI.GetFootTargetByParabola(self, startPos, MS_ItemData.WeaponParabolaRange, MS_ItemData.WeaponParabolaRangeMin, MS_ItemData.WeaponParabolaRangeMax, MS_ItemData.WeaponParabolaAngleMax)
							else
								targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, MS_ItemData.WeaponParabolaRange, MS_ItemData.WeaponParabolaRangeMin, MS_ItemData.WeaponParabolaRangeMax, MS_ItemData.WeaponParabolaAngleMax)
							end

							local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, MS_ItemData.WeaponParabolaStartAngle, MS_ItemData.WeaponParabolaGravity)

							self.skillThrowSpeed:Set(0, tmpSpeedY, tmpSpeedZ)
							self.skillThrowSpeedAcc:Set(0, MS_ItemData.WeaponParabolaGravity, 0)

							if self.controllerBullet ~= nil then
								bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, itemData, startPos, targetPos, self.skillThrowSpeed, self.skillThrowSpeedAcc)
							end
						else
							targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, itemData.FlyDistance, itemData.FlyDistance, itemData.FlyDistance, MS_ItemData.WeaponParabolaAngleMax)

							if self.controllerBullet ~= nil then
								self.skillThrowSpeed:Set(0, itemData.FlySpeedY, itemData.FlySpeedZ)
								self.skillThrowSpeedAcc:Set(0, itemData.FlySpeedAccY, 0)

								bulletIndex = self.controllerBullet:CreateBullet(itemData.BulletType, self, skillData, itemData, startPos, targetPos, self.skillThrowSpeed, self.skillThrowSpeedAcc)
							end
						end

						if bulletIndex > 0 then
							local bullet = self.controllerBullet:GetBullet(bulletIndex)

							if bullet ~= nil then
								bullet:Ready()
								bullet:Start()

								if self.isHost == true and self.isHostBack == false and itemData.SanSub ~= nil and itemData.SanSub > 0 then
									self.animalValue:SubProperty(MS_HeroData.Property.San, itemData.SanSub)
								end
							end
						end
					end
				end

				self.skillThrowItemId = 0
			end
		elseif trigger == 3 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Eat or self.skillIndex == AnimalBase_Define.SkillType.EatFast then
		if trigger == 1 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, false)

			if self.itemUseId > 0 then
				local itemData = MS_ItemData.GetItemData(self.itemUseId)

				if itemData ~= nil then
					local tmpVfxRoot = self:GetEffectRoot(itemData.HoldEffectRoot)
					local eff = VfxManager.PlayBindMulti(tmpVfxRoot, itemData.HoldEffect)

					self:AddSkillEffectLoop(AnimalBase_Define.VfxSkillKey1, eff)
				end
			end
		elseif trigger == 2 then
			if self.itemUseId > 0 then
				local subNum = 0

				if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
					if self.isHost == true then
						subNum = self.gameController:UseBagItem(self.itemUseId, 1)
					else
						subNum = self.gameController:UseBagItem(self.itemUseId, 1)

						if subNum > 0 then
							self.gameController:AddHpAddItemUseNumForAI(1)

							local itemData = MS_ItemData.GetItemData(MS_ItemData.ItemID_HpAdd)

							UIManager.SendMessage("Mainmenu", "GetItem", MS_ItemData.GetItemName(MS_ItemData.ItemID_HpAdd), -1, itemData.Icon)
						end
					end
				end

				if subNum > 0 then
					FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemUseTimes, self.itemUseId, 1)

					local itemData = MS_ItemData.GetItemData(self.itemUseId)

					if itemData ~= nil then
						local tmpVfxRoot = self:GetEffectRoot(itemData.UseEffectRoot)
						local eff = VfxManager.PlayBindMulti(tmpVfxRoot, itemData.UseEffect)

						self:AddSkillEffect(AnimalBase_Define.VfxSkillKey1, eff)

						local type = itemData.Type

						if type == MS_ItemData.Type.HpRecovery then
							local hpMax = self.animalValue:GetPropertyBase(MS_HeroData.Property.Hp)
							local addRate = tonumber(itemData.Param1) / 1000
							local tmpTalentValueAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.ItemValueAdd, self.itemUseId, 0)

							if tmpTalentValueAdd > 0 then
								addRate = MathHelper.addValuePermil(addRate, tmpTalentValueAdd)
							end

							addRate = Mathf.Clamp(addRate, 0, 1)

							if self:IsHeroSanNotNormal(10003) == true and (self:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId1) == true or self:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId2) == true or self:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId3) == true) then
								addRate = MathHelper.subValuePermil(addRate, Hero10003_Define.SanItemValueSubRate)
							end

							local hpAdd = Mathf.Ceil(hpMax * addRate)

							self.animalValue:AddProperty(MS_HeroData.Property.Hp, hpAdd)
						elseif type == MS_ItemData.Type.NoDebuffer then
							self:ClearStatusAllDebuffer()
						end

						if itemData.StatusId1 > 0 then
							self:AddStatus(self:GetVirtualPlayer(), itemData.StatusId1, 0, MS_StatusData.SourceType.Item, itemData.ItemId, false)
						end

						if itemData.StatusId2 > 0 then
							self:AddStatus(self:GetVirtualPlayer(), itemData.StatusId2, 0, MS_StatusData.SourceType.Item, itemData.ItemId, false)
						end

						local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.ItemSanAdd, self.itemUseId, 0)

						if tmpTalentSanAdd > 0 then
							self.animalValue:AddProperty(MS_HeroData.Property.San, tmpTalentSanAdd)
						end

						if self:IsHeroSanNotNormal(10003) == true then
							local tmpStatusIdAdd = 0
							local tmpTalentChange = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SanItemStatusChange, 0, 0)

							if tmpTalentChange > 0 and tmpTalentChange <= 2 then
								tmpStatusIdAdd = tmpStatusIdAdd + tmpTalentChange
							end

							self:AddStatus(self:GetVirtualPlayer(), Hero10003_Define.SanItemValueSubStatusId1 + tmpStatusIdAdd, 0, MS_StatusData.SourceType.Item, itemData.ItemId, false)
						end
					end
				end

				self.itemUseId = 0
			end
		elseif trigger == 3 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:ClearSkillEffectLoop(AnimalBase_Define.VfxSkillKey1)
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Execute then
		if self.skillExecuteTarget ~= nil then
			GameCollider.SkillCollider(self, self.skillExecuteTarget, skillData, nil)

			if trigger == 1 and self.isHost == true and self.isHostBack == false then
				local sanAdd = skillData.SanAdd
				local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillSanAdd, self.skillIndex, self.skillCombo)

				if tmpTalentSanAdd > 0 then
					sanAdd = MathHelper.addValuePermil(sanAdd, tmpTalentSanAdd)
				end

				self.animalValue:AddProperty(MS_HeroData.Property.San, sanAdd)
			end
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Backstab then
		if self.skillBackstabTarget ~= nil then
			GameCollider.SkillCollider(self, self.skillBackstabTarget, skillData, nil)

			if trigger == 1 and self.isHost == true and self.isHostBack == false then
				local sanAdd = skillData.SanAdd
				local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillSanAdd, self.skillIndex, self.skillCombo)

				if tmpTalentSanAdd > 0 then
					sanAdd = MathHelper.addValuePermil(sanAdd, tmpTalentSanAdd)
				end

				self.animalValue:AddProperty(MS_HeroData.Property.San, sanAdd)
			end
		end
	else
		local skillAI = self:GetSkillTypeForAI()

		if skillAI == AnimalBase_Define.SkillTypeForAI.PullFix and trigger == 1 then
			self:SetPull(true, self.skillIndex, self.skillCombo)
			self:SetSkillTarget(nil)
		end

		if self.animalConfig.skillColliderShape[self.skillIndex][self.skillCombo] ~= nil and self.animalConfig.skillColliderShape[self.skillIndex][self.skillCombo] ~= XCube.ShapeType.None and self.animalConfig.skillColliderShape[self.skillIndex][self.skillCombo] ~= XCube.ShapeType.Point then
			if trigger % 2 == 1 then
				if self:IsShowSkillCollider() == false then
					self:DisableSkillTouchHitPlayer()
					self:DisableSkillTouchHitShell()
					self:StartSkillCollider()
				end
			elseif trigger % 2 == 0 and self:IsShowSkillCollider() == true then
				self:EndSkillCollider()
			end
		end
	end
end

function AnimalBase:OnSkillStart()
	self.skillButtonRunExit = ControllerMain.SkillButton.None
	self.skillButtonRunExitTime = 0
	self.animatorDelayScale = 1

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
	local skillAI = self:GetSkillTypeForAI()

	if skillAI ~= AnimalBase_Define.SkillTypeForAI.DefenceHit and (skillData.BtnPressType ~= MS_SkillData.PressType.LongPress and skillData.BtnComboPressType ~= MS_SkillData.PressType.LongPress or self.skillCombo >= self.animalConfig.skillComboMax[self.skillIndex]) then
		self:SetSkillButtonLongPressUsed()
	end

	self:ResetSkillButtonLongPressTime()

	if self.moveStateOld == AnimalBase_Define.MoveStateType.Skill and self.skillIndexOld > 0 and self.skillComboOld > 0 then
		if self.animalConfig.skillNextType[self.skillIndexOld][self.skillComboOld] ~= AnimalBase_Define.SkillNextType.SkillBind then
			self.skillToughness = 0
		end
	else
		self.skillToughness = 0
	end

	if skillData.ToughnessSet > 0 then
		self.animalValue:SetToughness(skillData.ToughnessSet)
	end

	if self:IsSkillingById(AnimalBase_Define.SkillType.CounterAttack, 1) == true then
		-- block empty
	elseif self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 2) == true then
		self:ApplyLockAnimalOrientForSkill(true)
	elseif self:IsSkillingById(AnimalBase_Define.SkillType.Eat, 1) == true or self:IsSkillingById(AnimalBase_Define.SkillType.EatFast, 1) == true then
		self.moveBattleMode = 0
	end

	if self.isHost == true and self.isHostBack == false and skillData.IsRecord > 0 then
		FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.SkillCastTimes, self:GetHeroId(), self.skillIndex)
	end

	if self.isHost == true then
		self.gameController:RecordHeroSkillLog(self.heroId, MS_StoryTutorial.RecordSkillType.SkillStart, self.skillIndex, self.skillCombo)
	end
end

function AnimalBase:OnSkillStartNoAction(skillIndex, skillCombo)
	return
end

function AnimalBase:OnSkillLoopEnd()
	self:EndAnimatorDelay()
	self:EndSkillCollider()
	self:EndSkillParryCollider()
	self:DisableSkillTouchHitPlayer()
	self:DisableSkillTouchHitShell()
end

function AnimalBase:OnSkillRecovery()
	self:EndAnimatorDelay()
	self:EndSkillCollider()
	self:EndSkillParryCollider()
	self:DisableSkillTouchHitPlayer()
	self:DisableSkillTouchHitShell()
end

function AnimalBase:OnSkillEnd(skillIndexNext, skillComboNext)
	self.animatorDelayScale = 1

	self:EndAnimatorDelay()
	self:EndSkillCollider()
	self:EndSkillParryCollider()
	self:DisableSkillTouchHitPlayer()
	self:DisableSkillTouchHitShell()
	self.animalValue:ResetDamageAdd()

	if self:IsSkillingSkill() == true and self.skillIndex > 0 and self.skillCombo > 0 then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] ~= AnimalBase_Define.SkillNextType.SkillBind then
			self.skillToughness = 0

			self.animalValue:ClearPropertySkill(AnimalBase_Value.PropertySkill.Toughness)
			self.animalValue:ClearPropertySkill(AnimalBase_Value.PropertySkill.DamageSub)
		end

		if self.skillIndex ~= skillIndexNext then
			if self.skillIndex == AnimalBase_Define.SkillType.Throw or self.skillIndex == AnimalBase_Define.SkillType.ThrowLow or self.skillIndex == AnimalBase_Define.SkillType.Eat or self.skillIndex == AnimalBase_Define.SkillType.EatFast then
				self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
				self:ClearSkillEffectLoop(AnimalBase_Define.VfxSkillKey1)
			elseif self.skillIndex == AnimalBase_Define.SkillType.Born1 or self.skillIndex == AnimalBase_Define.SkillType.Born2 or self.skillIndex == AnimalBase_Define.SkillType.Born3 then
				if self:IsMoveFix() == true then
					self:SetMoveFix(false)
				end
			elseif self.skillIndex == AnimalBase_Define.SkillType.Execute or self.skillIndex == AnimalBase_Define.SkillType.Backstab then
				self:ClearSkillExecuteStatus()
				self:ClearSkillBackstabStatus()
			end

			XCollider.ClearRouteColliderIgnore(self.animalId)
			self:SetPull(false, 0, 0)
			self:SetSkillTarget(nil)

			if skillData.SkillAim ~= AnimalBase_Define.AimMode.None then
				if self.isHost == true then
					self.cameraScene:ReturnFollowingBase(false, false, CameraMain.CameraSmoothTimeMax)
				end

				if self:IsAimMode() == true then
					self:EndAimControl()
					self:EndAimDelay()
					self:EndAim()
				end
			end
		end
	else
		self.skillToughness = 0

		self.animalValue:ClearPropertySkill(AnimalBase_Value.PropertySkill.Toughness)
		self.animalValue:ClearPropertySkill(AnimalBase_Value.PropertySkill.DamageSub)
	end

	if skillIndexNext <= 0 or skillComboNext <= 0 then
		if self.boss > 0 then
			self.cameraScene:SetBossCameraDistanceSkill(0)
			self.cameraScene:LockSkillingPlayer(nil)
		end

		if self.moveJumpY >= 0 then
			self:SetBodyCollider(false)
		end

		self.moveJumpY = -1
	end

	if self.isHost == true then
		self.gameController:RecordHeroSkillLog(self.heroId, MS_StoryTutorial.RecordSkillType.SkillEnd, self.skillIndex, self.skillCombo)
	end
end

function AnimalBase:OnSkillOffsetStart()
	if self:IsSkillingSkill() == false then
		return
	end

	if self.skillIndex == AnimalBase_Define.SkillType.CounterAttack then
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end
end

function AnimalBase:OnSkillRecoveryOffsetStart()
	return
end

function AnimalBase:InitSkillCondition()
	for skillIndex, v in pairs(self.animalConfig.skillComboMax) do
		self.skillCondition[skillIndex] = 0
	end
end

function AnimalBase:SetSkillCondition(skillIndex, param)
	self.skillCondition[skillIndex] = param
end

function AnimalBase:SetSkillConditionByData(skillIndex)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, 1)

	if skillData ~= nil then
		self.skillCondition[skillIndex] = skillData.SkillCondition
	end
end

function AnimalBase:GetSkillCondition(skillIndex)
	return self.skillCondition[skillIndex]
end

function AnimalBase:IsSkillCondition(skillIndex, param)
	if self.skillCondition[skillIndex] == param then
		return true
	end

	return false
end

function AnimalBase:SetSkillConditionAll(param)
	for skillIndex, v in pairs(self.animalConfig.skillComboMax) do
		self.skillCondition[skillIndex] = param
	end
end

function AnimalBase:ChangeToMoveForce(targetDir, moveTime)
	if self:IsFreeMoving() == true then
		local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.MoveForce, AnimalBase_Define.MoveStateChangeLevel.Low)

		if ret == true then
			self.moveForceDir:SetVector3(targetDir)

			self.moveForceEndTime = TimeHelper.getNowTime() + moveTime
		end
	end
end

function AnimalBase:SetMoveForceDir(targetDir)
	self.moveForceDir:SetVector3(targetDir)
end

function AnimalBase:ExitGet()
	if self.exitFlg == true then
		return
	end

	self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
	self:ClearSkillEffectAll()
end

function AnimalBase:OnGetTrigger(trigger)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true then
		if trigger == 1 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, false)
		elseif trigger == 2 then
			local ret = self.gameController:PickUpItem()
		elseif trigger == 3 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
		end
	end
end

function AnimalBase:ResetState()
	self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.Force)

	self.moveStateNext = 0
	self.moveStateOld = 0

	self:ResetMoveStateNext()
	self:ResetAnimatorState()
	self:ResetAnimator(0)
end

function AnimalBase:IsEventEnable()
	if self.isHost == true and self.isHostBack == false and self:IsWillDead() == false and self:IsShow() == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
		return true
	end

	return false
end

function AnimalBase:IsMovieAndDialogueEnable()
	if self.isHost == false or self.isHostBack == true then
		return false
	end

	if self:IsWillDead() == true or self:IsShow() == false then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Fly or self.moveStateNow == AnimalBase_Define.MoveStateType.Drop or self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround or self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.Special or self.moveStateNow == AnimalBase_Define.MoveStateType.Reborn or self.moveStateNow == AnimalBase_Define.MoveStateType.Born or self:IsOnStair() == true or self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 0) == true then
		return false
	end

	return true
end

function AnimalBase:ChangeToEvent(type)
	if self.isHost == true then
		local ret = self:ChangeMoveState(type, AnimalBase_Define.MoveStateChangeLevel.High)

		if ret == true then
			self:ClearLockPlayer()

			if self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart then
				self.gameController:StartSave()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SaveEnd then
				self.gameController:CloseSaveMenu()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeStart then
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_ChangeStart)
				AudioCtrl.SetHeroAudio(self.modelName .. "/change_start", self.tfModel, self.animalId)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeEnd then
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_ChangeEnd)
				AudioCtrl.SetHeroAudio(self.modelName .. "/change_end", self.tfModel, self.animalId)
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornStart then
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_ChangeRebornStart)
				AudioCtrl.SetHeroAudio(self.modelName .. "/change_start", self.tfModel, self.animalId)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornEnd then
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_ChangeRebornEnd)
				AudioCtrl.SetHeroAudio(self.modelName .. "/change_end", self.tfModel, self.animalId)
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TransferStart then
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_TransferStart)
				AudioCtrl.SetHeroAudio(self.modelName .. "/change_start", self.tfModel, self.animalId)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TransferEnd then
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_TransferEnd)
				AudioCtrl.SetHeroAudio(self.modelName .. "/change_end", self.tfModel, self.animalId)
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
				VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_TransferStart)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.OpenGate then
				local tmpPos, tmpLookPos = self.gameController:GetGateStandInfo()

				self:SetPosByWorldPos(tmpPos, true)
				self:SetOrientation(tmpLookPos)
				self.gameController:OpenGate()
				self:SetMoveThroughAll(true)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.OpenCrate then
				local tmpPos, tmpLookPos = self.gameController:GetCrateStandInfo()

				self:SetPosByWorldPos(tmpPos, true)
				self:SetOrientation(tmpLookPos)
				self.gameController:OpenCrate()
				self:SetMoveThroughAll(true)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.StairKick then
				local tmpPos, tmpLookPos = self.gameController:GetStairKickStandInfo()

				self:SetPosByWorldPos(tmpPos, true)
				self:SetOrientation(tmpLookPos)
				self.gameController:KickStair()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKick then
				local tmpPos, tmpLookPos = self.gameController:GetCoverKickStandInfo()

				self:SetPosByWorldPos(tmpPos, true)
				self:SetOrientation(tmpLookPos)
				self.gameController:KickCover()
			end
		end

		return ret
	end

	return false
end

function AnimalBase:OnEventTrigger(trigger)
	if self.isHost == true then
		if trigger == 1 then
			self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, false)
		elseif trigger == 2 and self:IsWillDead() == false then
			if self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart then
				if self.gameController:IsSaveEnd() == true then
					self:ClearStatusAllDebuffer()
					self.gameController:OpenSaveMenu()
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CarriageStart then
				self.gameController:CarriageCall()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornStart then
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TransferStart then
				if self.gameController:Transfer() == true then
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.BridgeStart then
				self.gameController:OpenBridge()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.DoorStart then
				self.gameController:OpenDoor()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.DoorHintStart then
				self.gameController:OpenDoorHint()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ElevatorStart then
				self.gameController:CallElevator()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CageStart then
				self.gameController:CallCage()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKickHintStart then
				self.gameController:OpenCoverKickHint()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.GateHintStart then
				self.gameController:OpenGateHint()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallStart then
				self.gameController:OpenVirtualWall()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallHintStart then
				self.gameController:OpenVirtualWallHint()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.BeaconStart then
				self.gameController:CreateSceneMark(self.eventBeaconId)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.EntranceStart then
				self.gameController:OpenEntrance()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.StatueStart then
				self.gameController:TouchStatue()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.FountainStart then
				self.gameController:TouchFountain()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.HoneypotStart then
				self.gameController:TouchHoneypot()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CrateStart then
				self.gameController:OpenCrate()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.BonefireStart then
				self.gameController:OpenBonefire()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.OpenGate or self.moveStateNow == AnimalBase_Define.MoveStateType.OpenCrate or self.moveStateNow == AnimalBase_Define.MoveStateType.StairKick or self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKick then
				self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
			end
		end
	end
end

function AnimalBase:OnEventEndTrigger(trigger)
	if self.isHost == true and trigger == 1 then
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)

		if self:IsWillDead() == false and self.moveStateNow == AnimalBase_Define.MoveStateType.HoneypotEnd then
			self.gameController:TouchHoneypotAfter()
		end
	end
end

function AnimalBase:ExitEvent()
	if self.exitFlg == true then
		return
	end

	self:SetMoveThroughAll(false)

	if self.isHost == true then
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
		self:ClearSkillButtonAll()
	end
end

function AnimalBase:IsEvent(state)
	if state == AnimalBase_Define.MoveStateType.OpenCrate or state == AnimalBase_Define.MoveStateType.OpenGate or state == AnimalBase_Define.MoveStateType.StairKick or state == AnimalBase_Define.MoveStateType.CoverKick or state == AnimalBase_Define.MoveStateType.ChangeStart or state == AnimalBase_Define.MoveStateType.ChangeRebornStart or state == AnimalBase_Define.MoveStateType.TransferStart or state == AnimalBase_Define.MoveStateType.BeaconStart or state == AnimalBase_Define.MoveStateType.SaveStart or state == AnimalBase_Define.MoveStateType.CarriageStart or state == AnimalBase_Define.MoveStateType.BridgeStart or state == AnimalBase_Define.MoveStateType.DoorStart or state == AnimalBase_Define.MoveStateType.DoorHintStart or state == AnimalBase_Define.MoveStateType.ElevatorStart or state == AnimalBase_Define.MoveStateType.CageStart or state == AnimalBase_Define.MoveStateType.CoverKickHintStart or state == AnimalBase_Define.MoveStateType.GateHintStart or state == AnimalBase_Define.MoveStateType.VirtualWallStart or state == AnimalBase_Define.MoveStateType.VirtualWallHintStart or state == AnimalBase_Define.MoveStateType.EntranceStart or state == AnimalBase_Define.MoveStateType.StatueStart or state == AnimalBase_Define.MoveStateType.FountainStart or state == AnimalBase_Define.MoveStateType.HoneypotStart or state == AnimalBase_Define.MoveStateType.CrateStart or state == AnimalBase_Define.MoveStateType.BonefireStart then
		return true
	end

	return false
end

function AnimalBase:IsEventLoop(state)
	if state == AnimalBase_Define.MoveStateType.SaveLoop or state == AnimalBase_Define.MoveStateType.BonefireLoop then
		return true
	end

	return false
end

function AnimalBase:IsEventEnd(state)
	if state == AnimalBase_Define.MoveStateType.ChangeEnd or state == AnimalBase_Define.MoveStateType.ChangeRebornEnd or state == AnimalBase_Define.MoveStateType.TransferEnd or state == AnimalBase_Define.MoveStateType.BeaconEnd or state == AnimalBase_Define.MoveStateType.SaveEnd or state == AnimalBase_Define.MoveStateType.CarriageEnd or state == AnimalBase_Define.MoveStateType.BridgeEnd or state == AnimalBase_Define.MoveStateType.DoorEnd or state == AnimalBase_Define.MoveStateType.DoorHintEnd or state == AnimalBase_Define.MoveStateType.ElevatorEnd or state == AnimalBase_Define.MoveStateType.CageEnd or state == AnimalBase_Define.MoveStateType.CoverKickHintEnd or state == AnimalBase_Define.MoveStateType.GateHintEnd or state == AnimalBase_Define.MoveStateType.VirtualWallEnd or state == AnimalBase_Define.MoveStateType.VirtualWallHintEnd or state == AnimalBase_Define.MoveStateType.EntranceEnd or state == AnimalBase_Define.MoveStateType.StatueEnd or state == AnimalBase_Define.MoveStateType.FountainEnd or state == AnimalBase_Define.MoveStateType.HoneypotEnd or state == AnimalBase_Define.MoveStateType.CrateEnd or state == AnimalBase_Define.MoveStateType.BonefireEnd then
		return true
	end

	return false
end

function AnimalBase:IsEventMuteki(state)
	if state == AnimalBase_Define.MoveStateType.SaveStart or state == AnimalBase_Define.MoveStateType.SaveLoop then
		if self.sceneController:IsInMenu() == true then
			return true
		else
			return false
		end
	elseif state == AnimalBase_Define.MoveStateType.TransferStart then
		if self.animatorTrigger >= 2 then
			return true
		else
			return false
		end
	elseif state == AnimalBase_Define.MoveStateType.BeaconStart or state == AnimalBase_Define.MoveStateType.BeaconEnd then
		return false
	elseif self:IsEvent(state) == true or self:IsEventEnd(state) == true then
		return true
	end

	return false
end

function AnimalBase:IsInChangeOrTransferState()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.TransferStart or self.moveStateNow == AnimalBase_Define.MoveStateType.TransferEnd then
		return true
	end

	return false
end

function AnimalBase:OnRebornTrigger(trigger)
	if self.isHost == true and trigger == 1 then
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
	end
end

function AnimalBase:ExitReborn()
	if self.exitFlg == true then
		return
	end

	self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
	self:ClearSkillButtonAll()
end

function AnimalBase:OnBornTrigger(trigger)
	if self.isHost == true and trigger == 1 then
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
	end
end

function AnimalBase:ExitBorn()
	if self.exitFlg == true then
		return
	end

	if self.skillNextWaitTimeStart > 0 and self.skillNextId > 0 then
		self.skillNextWaitTimeStart = TimeHelper.getNowTime()
	end

	self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
	self:ClearSkillButtonAll()
end

function AnimalBase:OnHitTrigger(trigger)
	if (self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop1 or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop2) and self.animatorTrigger <= AnimalBase_Define.TriggerHit.FollowAttack and trigger > AnimalBase_Define.TriggerHit.FollowAttack then
		self.animalValue:SetPropertyToMax(MS_HeroData.Property.Weakness)
		self.animalValue:SetPropertyToMax(MS_HeroData.Property.Toughness)

		self.moveHitStatusWeakRecovery = true
		self.moveHitStatusWeak = false
	end
end

function AnimalBase:OnTouchGroundTrigger(trigger)
	return
end

function AnimalBase:OnStairInTrigger(trigger)
	if trigger == 1 then
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, false)
	elseif trigger == 2 then
		-- block empty
	end
end

function AnimalBase:UpdateStairInTrigger(trigger)
	if trigger == 2 then
		XAnimator.SetMatchTarget(self.animalId, self.animatorLayer, self.moveStairClimbTargetPos.x, self.moveStairClimbTargetPos.y, self.moveStairClimbTargetPos.z, self.animatorTime, 1)
	end
end

function AnimalBase:OnStairOutTrigger(trigger)
	if trigger == 1 then
		self:SetWeaponAllVisible(AnimalBase_Define.VisibleType.Act, true)
	elseif trigger == 2 then
		-- block empty
	end
end

function AnimalBase:UpdateStairOutTrigger(trigger)
	local tmpTimeStart = 0

	if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp then
		tmpTimeStart = AnimalBase_Define.ClimbEndUpMatchTime
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 then
		tmpTimeStart = AnimalBase_Define.ClimbEndUp2MatchTime
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown then
		tmpTimeStart = AnimalBase_Define.ClimbEndDownMatchTime
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 then
		tmpTimeStart = AnimalBase_Define.ClimbEndDown2MatchTime
	end

	if tmpTimeStart < self.animatorTime then
		XAnimator.SetMatchTarget(self.animalId, self.animatorLayer, self.moveStairClimbTargetPos.x, self.moveStairClimbTargetPos.y, self.moveStairClimbTargetPos.z, self.animatorTime, 1)
	end
end

function AnimalBase:UpdateStairClimpTrigger(trigger)
	if self.animatorTime >= AnimalBase_Define.ClimbingMatchTime then
		XAnimator.SetMatchTarget(self.animalId, self.animatorLayer, self.moveStairClimbTargetPos.x, self.moveStairClimbTargetPos.y, self.moveStairClimbTargetPos.z, self.animatorTime, 1)
	end
end

function AnimalBase:CheckHit()
	if self:IsEnd() == true or self:IsWillDead() == true or self:IsShow() == false or self.gameController:IsStopAttack() == true then
		return
	end

	if self.moveHitPeriodFrame > 0 then
		self.moveHitPeriodFrame = self.moveHitPeriodFrame - 1

		if self.moveHitPeriodFrame <= 0 then
			self:StopHit()
		end
	end

	if self.skillExecuteHit == true and self.skillExecuteHost ~= nil and self.skillExecuteHost:IsReadySkillExecute() == true then
		local ret = self:HitExecute(self.skillExecuteHost)

		if ret == true then
			self.skillExecuteHost:StartSkillExecute(self)

			return
		end
	end

	self.skillExecuteHit = false

	if self.skillBackstabHit == true and self.skillBackstabHost ~= nil and self.skillBackstabHost:IsReadySkillBackstab() == true then
		local ret = self:HitBackstab(self.skillBackstabHost)

		if ret == true then
			self.skillBackstabHost:StartSkillBackstab(self)

			return
		end
	end

	self.skillBackstabHit = false

	local hpSub = 0
	local hpAdd = 0
	local isFirstHit = true
	local isFirstBlock = true
	local isFirstBeatBack = true
	local isFirstCounterAttack = true
	local isFirstAutoSkill = true
	local isFirstSkillHit = true
	local isFirtHitHand = true

	if self.skillTouchAttackList ~= nil then
		for k, attackerData in pairs(self.skillTouchAttackList) do
			if attackerData ~= nil and attackerData:IsEnable() == true then
				local attackVPlayer = attackerData:GetAttackVirtualPlayer()
				local skillData = attackerData:GetSkillData()
				local itemData = attackerData:GetItemData()
				local retBlock = false
				local retHitHand = AnimalBase_Define.HitHandType.Fail

				if attackVPlayer ~= nil and skillData ~= nil then
					local damageType = attackerData:GetDamageType()
					local damageFlg = false

					if damageType == AnimalBase_Define.DamageType.Instant then
						if attackerData:IsChecked() == false then
							damageFlg = true
						end
					elseif damageType == AnimalBase_Define.DamageType.Period then
						damageFlg = true
					end

					if damageFlg == true then
						local useCounterAttack = false
						local useBeatBack = false
						local useAutoSkill = false

						if self:IsSkillCounterAttackedStart(attackVPlayer, skillData.SkillIndex, skillData.SkillCombo) == true then
							local counterAttackSkillData

							if self:IsSkilling() == true and AnimalBase.IsSkillCounterAttackedKeep(self.heroId, self.skillIndex, self.skillCombo) == true then
								useCounterAttack = true
								counterAttackSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
							else
								useCounterAttack = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.CounterAttack, 1, MS_SkillData.PressType.PressDown, ControllerMain.SkillButton.Special)
								counterAttackSkillData = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.CounterAttack, 1)
							end

							if useCounterAttack == true and counterAttackSkillData ~= nil then
								local attackPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

								if attackPlayer ~= nil then
									local hitTouchData = attackPlayer:AddSkillTouchHitPlayer(self:GetVirtualPlayer(), counterAttackSkillData, nil, Vector3.s_forward, nil)

									if hitTouchData ~= nil then
										hitTouchData:SetHitCounterAttack(true)
									end
								end

								local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

								if vfxRoot ~= nil then
									VfxManager.PlayTransformFreezeMulti(vfxRoot, AnimalBase_Define.VfxName_CounterAttack)
								end

								AudioCtrl.SetHeroAudio("skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
								self:OnCounterAttack(isFirstCounterAttack, attackerData)

								isFirstCounterAttack = false

								if self.isHost == true and self.isHostBack == false then
									local sanAdd = counterAttackSkillData.SanAdd
									local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillSanAdd, self.skillIndex, self.skillCombo)

									if tmpTalentSanAdd > 0 then
										sanAdd = MathHelper.addValuePermil(sanAdd, tmpTalentSanAdd)
									end

									self.animalValue:AddProperty(MS_HeroData.Property.San, sanAdd)
								end
							end
						end

						if useCounterAttack == false and self:IsSkillBeatBackStart() == true then
							self:OnBeatBack(isFirstBeatBack, attackerData)

							isFirstBeatBack = false
							useBeatBack = true
						end

						if useCounterAttack == false and useBeatBack == false and damageType == AnimalBase_Define.DamageType.Instant and self:IsSkillAutoSkillStart() == true then
							self:OnAutoSkill(isFirstBeatBack, attackerData)

							isFirstAutoSkill = false
							useAutoSkill = true

							if attackerData:IsSkillBlocked() == true then
								useAutoSkill = false
							end
						end

						if useCounterAttack == false and useBeatBack == false and useAutoSkill == false then
							local isPeriod = false
							local tmpHpSub, tmpHpAdd, tmpHpSubReal, tmpHpAddReal = self:CalculateDamage(attackerData)

							if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
								if self:IsWillDead() == true then
									FS_BattleData_GuardMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_GuardMode.DataType.KillNum, 1)
									FS_BattleData_GuardMode.AddBattleData(self.animalId, FS_BattleData_GuardMode.DataType.DeathNum, 1)

									local tmpAssistNum = self:ResetAttacker(attackVPlayer)
								else
									self:AddAttacker(attackVPlayer, tmpHpSubReal)
								end
							elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
								if self:IsWillDead() == true then
									local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

									if attackAnimal ~= nil and attackAnimal:IsDead() == false and attackAnimal:IsShow() == true then
										attackAnimal:KillEnemy(self.animalId)
									end
								end
							elseif BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true or BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true then
								if tmpHpSubReal > 0 then
									FS_BattleData_OccupyMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_OccupyMode.DataType.AttackDamage, tmpHpSubReal)
									FS_BattleData_OccupyMode.AddBattleData(self.animalId, FS_BattleData_OccupyMode.DataType.AcceptDamage, tmpHpSubReal)
								end

								if tmpHpAddReal > 0 then
									FS_BattleData_OccupyMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_OccupyMode.DataType.Heal, tmpHpAddReal)
								end

								if self:IsWillDead() == true then
									FS_BattleData_OccupyMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_OccupyMode.DataType.LastKillNum, 1)
									FS_BattleData_OccupyMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_OccupyMode.DataType.KillNum, 1)
									FS_BattleData_OccupyMode.AddBattleData(self.animalId, FS_BattleData_OccupyMode.DataType.DeathNum, 1)
									FS_BattleData_OccupyMode.OverrideBattleData(self.animalId, FS_BattleData_OccupyMode.DataType.LiveTime, ControllerMain.ConvertFrameToSec(ControllerMain.LogicFrame - self.rebornFrame))

									local tmpAssistNum = self:ResetAttacker(attackVPlayer)

									if tmpAssistNum <= 0 then
										FS_BattleData_OccupyMode.AddBattleData(attackVPlayer:GetAnimalId(), FS_BattleData_OccupyMode.DataType.SingleKillNum, 1)
									end
								else
									self:AddAttacker(attackVPlayer, tmpHpSubReal)
								end
							end

							if damageType == AnimalBase_Define.DamageType.Instant then
								if attackerData:IsChecked() == false then
									local isSkillBlocked = attackerData:IsSkillBlocked()
									local blockSkillData, blockParam = attackerData:GetSkillBlockedData()
									local isSkillHitHand = attackerData:IsSkillHitHand()
									local hitHandSkillData = attackerData:GetSkillHitHandData()

									if isSkillBlocked == true then
										local blockStatus = attackerData:GetSkillBlockStatus()

										if blockStatus == SkillTouchAttackData.BlockStatus.Fail then
											self.animalValue:SetPropertyToZero(MS_HeroData.Property.Toughness)
											self:OnHit(isFirstHit, attackerData)

											isFirstHit = false
										else
											retBlock = self:OnBlock(isFirstBlock, attackerData)
											isFirstBlock = false
										end
									elseif isSkillHitHand == true then
										local hitHandStatus = attackerData:GetSkillHitHandStatus()

										if hitHandStatus == SkillTouchAttackData.HitHandStatus.Fail then
											self.animalValue:SetPropertyToZero(MS_HeroData.Property.Toughness)
											self:OnHit(isFirstHit, attackerData)

											isFirstHit = false
										else
											retHitHand = self:OnHitHand(isFirtHitHand, attackerData)
											isFirtHitHand = false
										end
									else
										self:OnHit(isFirstHit, attackerData)

										isFirstHit = false
									end
								end

								FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.SkillHitTimes, attackVPlayer:GetHeroId(), self:GetHeroId(), skillData.SkillIndex)
							elseif damageType == AnimalBase_Define.DamageType.Period then
								local ret = self:OnHitPeriod(isFirstHit, attackerData)

								if ret == true then
									isFirstHit = false
								end

								isPeriod = true
							end

							if skillData.StatusId1 > 0 then
								local statusId = skillData.StatusId1
								local statusIdAdd = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.StatusChange, statusId, 0)

								if statusIdAdd > 0 then
									statusId = statusId + statusIdAdd
								end

								local addFlg = true

								if retBlock == true or retHitHand == AnimalBase_Define.HitHandType.Success then
									local statusData = MS_StatusData.GetStatusData(statusId)

									if statusData.GuardEnable > 0 then
										addFlg = false
									end
								end

								if addFlg == true then
									self:AddStatus(attackVPlayer, statusId, 0, MS_StatusData.SourceType.Skill, skillData.SkillIndex, isPeriod)
								end
							end

							if skillData.StatusId2 > 0 then
								local statusId = skillData.StatusId2
								local statusIdAdd = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.StatusChange, statusId, 0)

								if statusIdAdd > 0 then
									statusId = statusId + statusIdAdd
								end

								local addFlg = true

								if retBlock == true or retHitHand == AnimalBase_Define.HitHandType.Success then
									local statusData = MS_StatusData.GetStatusData(statusId)

									if statusData.GuardEnable > 0 then
										addFlg = false
									end
								end

								if addFlg == true then
									self:AddStatus(attackVPlayer, statusId, 0, MS_StatusData.SourceType.Skill, skillData.SkillIndex, isPeriod)
								end
							end

							if itemData ~= nil then
								if itemData.StatusId1 > 0 then
									local addFlg = true

									if retBlock == true or retHitHand == AnimalBase_Define.HitHandType.Success then
										local statusData = MS_StatusData.GetStatusData(itemData.StatusId1)

										if statusData.GuardEnable > 0 then
											addFlg = false
										end
									end

									if addFlg == true then
										self:AddStatus(attackVPlayer, itemData.StatusId1, 0, MS_StatusData.SourceType.Item, itemData.ItemId, isPeriod)
									end
								end

								if itemData.StatusId2 > 0 then
									local addFlg = true

									if retBlock == true or retHitHand == AnimalBase_Define.HitHandType.Success then
										local statusData = MS_StatusData.GetStatusData(itemData.StatusId2)

										if statusData.GuardEnable > 0 then
											addFlg = false
										end
									end

									if addFlg == true then
										self:AddStatus(attackVPlayer, itemData.StatusId2, 0, MS_StatusData.SourceType.Item, itemData.ItemId, isPeriod)
									end
								end

								if itemData.SubStatusId1 > 0 then
									self:ClearStatusById(itemData.SubStatusId1)
								end

								if itemData.SubStatusId2 > 0 then
									self:ClearStatusById(itemData.SubStatusId2)
								end

								if itemData.TrapId > 0 and self:IsOnStair() == false and self.moveFix == false and self.moveFly == false and self.moveOnGround == true and self:IsBornSkilling() == false and self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 0) == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Drop and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Fly then
									self.scene:AddTrap(itemData.TrapId, self:GetPosByWorldPos(), attackVPlayer, attackVPlayer:GetTeamId())
								end
							end

							if self:IsHeroSanNotNormal(10002) and isPeriod == false then
								local addFlg = true

								if retBlock == true or retHitHand == AnimalBase_Define.HitHandType.Success then
									local statusData = MS_StatusData.GetStatusData(Hero10002_Define.SanHitStatusId)

									if statusData.GuardEnable > 0 then
										addFlg = false
									end
								end

								if addFlg == true then
									self:AddStatus(attackVPlayer, Hero10002_Define.SanHitStatusId, 0, MS_StatusData.SourceType.San, 0, isPeriod)
								end
							end
						end
					end
				end

				attackerData:SetChecked()
			end
		end
	end

	if self.trickTouchList ~= nil then
		for k, touchData in pairs(self.trickTouchList) do
			if touchData ~= nil and touchData:IsEnable() == true then
				local trick = touchData:GetTrick()
				local trickData = touchData:GetTrickData()
				local retHitHand = AnimalBase_Define.HitHandType.Fail

				if trick ~= nil and trickData ~= nil then
					local damageType = trick:GetDamageType()
					local damageFlg = false
					local isPeriod = false

					if damageType == AnimalBase_Define.DamageType.Instant then
						if touchData:IsChecked() == false then
							damageFlg = true
						end
					elseif damageType == AnimalBase_Define.DamageType.Period then
						damageFlg = true
						isPeriod = true
					end

					if damageFlg == true then
						local useCounterAttack = false
						local useBeatBack = false
						local useAutoSkill = false

						if self:IsTrickCounterAttackedStart(trick, trickData) == true then
							if self:IsSkilling() == true and AnimalBase.IsSkillCounterAttackedKeep(self.heroId, self.skillIndex, self.skillCombo) == false then
								useCounterAttack = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.CounterAttack, 1, MS_SkillData.PressType.PressDown, ControllerMain.SkillButton.Special)
							end

							if useCounterAttack == true then
								local counterAttackSkillData = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.CounterAttack, 1)
								local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

								if vfxRoot ~= nil then
									VfxManager.PlayTransformFreezeMulti(vfxRoot, AnimalBase_Define.VfxName_CounterAttack)
								end

								AudioCtrl.SetHeroAudio("skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
								self:OnCounterAttack(isFirstCounterAttack, attackerData)

								isFirstCounterAttack = false

								if self.isHost == true and self.isHostBack == false then
									local sanAdd = counterAttackSkillData.SanAdd
									local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillSanAdd, self.skillIndex, self.skillCombo)

									if tmpTalentSanAdd > 0 then
										sanAdd = MathHelper.addValuePermil(sanAdd, tmpTalentSanAdd)
									end

									self.animalValue:AddProperty(MS_HeroData.Property.San, sanAdd)
								end
							end
						end

						if useCounterAttack == false and self:IsSkillBeatBackStart() == true then
							self:OnBeatBack(isFirstBeatBack, attackerData)

							isFirstBeatBack = false
							useBeatBack = true
						end

						if useCounterAttack == false and useBeatBack == false and self:IsSkillAutoSkillStart() == true then
							self:OnAutoSkill(isFirstBeatBack, attackerData)

							isFirstAutoSkill = false
							useAutoSkill = true

							if self.autoSkill ~= nil and self.autoSkill <= 0 then
								useAutoSkill = false
							end
						end

						if useCounterAttack == false and useBeatBack == false and useAutoSkill == false then
							local tmpHpSub, tmpHpAdd, tmpHpSubReal, tmpHpAddReal = self:CalculateTrickDamage(touchData)

							if damageType == AnimalBase_Define.DamageType.Instant then
								if touchData:IsChecked() == false then
									local isSkillHitHand = touchData:IsSkillHitHand()
									local hitHandSkillData = touchData:GetSkillHitHandData()

									if isSkillHitHand == true then
										local hitHandStatus = touchData:GetSkillHitHandStatus()

										if hitHandStatus == TrickTouchData.HitHandStatus.Fail then
											self.animalValue:SetPropertyToZero(MS_HeroData.Property.Toughness)
											self:OnHitTrick(isFirstHit, touchData)

											isFirstHit = false
										else
											retHitHand = self:OnHitHandTrick(isFirtHitHand, touchData)
											isFirtHitHand = false
										end
									else
										self:OnHitTrick(isFirstHit, touchData)

										isFirstHit = false
									end
								end
							elseif damageType == AnimalBase_Define.DamageType.Period then
								self:OnHitTrickPeriod(isFirstHit, touchData)

								isFirstHit = false
							end

							if trickData.StatusId1 > 0 then
								self:AddStatus(nil, trickData.StatusId1, trickData.Damage, MS_StatusData.SourceType.Trick, 0, isPeriod)
							end

							if trickData.StatusId2 > 0 then
								self:AddStatus(nil, trickData.StatusId2, trickData.Damage, MS_StatusData.SourceType.Trick, 0, isPeriod)
							end
						end
					end
				end

				touchData:SetChecked()
			end
		end
	end

	if self:IsOnStair() == true or self.moveFly == true or self.moveStateDebugFly == true or self.moveNoDropDamage == true then
		self.moveDropDamageHeight = 0
	elseif self.moveOnGround == true then
		local calcDamage = false

		if self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 1) == true then
			calcDamage = false
		elseif self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 2) == true then
			if self.animatorTrigger >= 2 then
				calcDamage = true
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround then
			calcDamage = true
		elseif self.groundSlopeAngle <= AnimalBase_Define.MotionSlopeAngleMax then
			calcDamage = true
		end

		if calcDamage == true then
			local hpSub, hpSubReal = self.animalValue:DamageDrop(self.moveDropDamageHeight)

			self.moveDropDamageHeight = 0

			if hpSub > 0 and self.isHost == true and self.isHostBack == false then
				UIManager.SendMessage("Mainmenu", "ShowHitImage")
				self:HitShakeSimple(1)
			end

			if DebugBehaviorLog == true and self.isHost == true and self.isHostBack == false and self:IsWillDead() == true and hpSubReal > 0 then
				LS_BehaviorLog.Log(LS_BehaviorLog.Type.Death, 0, 0)
			end
		end
	end
end

function AnimalBase:CheckSkillHit()
	if self:IsEnd() == true or self:IsWillDead() == true or self:IsShow() == false or self.gameController:IsStopAttack() == true then
		return
	end

	local isFirstSkillHit = true

	if self.skillTouchHitList ~= nil then
		for k, hitData in pairs(self.skillTouchHitList) do
			if hitData ~= nil and hitData:IsEnable() == true then
				local hitPlayer = hitData:GetHitPlayer()
				local skillData = hitData:GetSkillData()

				if hitData:IsChecked() == false and skillData ~= nil then
					if self:IsSkillingSkill() == true then
						local isHitCounterAttack = hitData:IsHitCounterAttack()
						local isHitBlock = hitData:IsHitBlock()
						local isHitHand = hitData:IsHitHand()

						if isHitCounterAttack == true and AnimalBase.IsSkillCounterAttackedRebound(self.heroId, self.skillIndex, self.skillCombo) == true then
							self:HitCounterAttack(skillData)

							if hitPlayer ~= nil and AnimalBase.IsSkillCounterAttackedKeep(hitPlayer.heroId, skillData.SkillIndex, skillData.SkillCombo) == true then
								self:SetMoveNoHitTime(AnimalBase_Define.HitCounterAttackNoHitTime)
							end
						elseif isHitBlock == true and AnimalBase.IsSkillBlockedRebound(self.heroId, self.skillIndex, self.skillCombo) == true or isHitHand == true and AnimalBase.IsHitHandRebound(self.heroId, self.skillIndex, self.skillCombo) == true then
							self:HitBlock(skillData)
						else
							self:OnSkillHit(isFirstSkillHit, hitData)

							isFirstSkillHit = false
						end
					end

					hitData:SetChecked()
				end
			end
		end
	end

	if self.skillTouchHitShellList ~= nil then
		for k, hitData in pairs(self.skillTouchHitShellList) do
			if hitData ~= nil and hitData:IsEnable() == true then
				local skillData = hitData:GetSkillData()

				if hitData:IsChecked() == false and skillData ~= nil then
					if self:IsSkillingSkill() == true then
						local isHitHand = hitData:IsHitHand()

						if isHitHand == true and AnimalBase.IsHitHandRebound(self.heroId, self.skillIndex, self.skillCombo) == true then
							self:HitBlock(skillData)
						end
					end

					hitData:SetChecked()
				end
			end
		end
	end
end

function AnimalBase:OnHit(isFirst, attackerData)
	if isFirst == true then
		self:Hit(attackerData)
	end
end

function AnimalBase:OnHitTrick(isFirst, attackerData)
	if isFirst == true then
		self:HitTrick(attackerData)
	end
end

function AnimalBase:OnHitPeriod(isFirst, attackerData)
	if isFirst == true then
		local attackVPlayer = attackerData:GetAttackVirtualPlayer()
		local skillData = attackerData:GetSkillData()
		local itemData = attackerData:GetItemData()
		local hitType = attackerData:GetHitType()
		local ret = self:ChangeHitPeriod(hitType, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)

		if ret == true and (self.moveStateOld ~= AnimalBase_Define.MoveStateType.Hit or self.moveHitTypeOld ~= self.moveHitType) then
			self:HitShake(attackerData)
		end

		return ret
	end

	return false
end

function AnimalBase:OnHitTrickPeriod(isFirst, attackerData)
	if isFirst == true then
		local hitType = attackerData:GetHitType()

		self:ChangeHitPeriod(hitType, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
	end
end

function AnimalBase:OnHitExit()
	if self:IsWillDead() == false then
		if self.moveHitStatusWeak == true then
			if self.moveHitStatusWeakRecovery == false or self.animalValue:IsWeaknessEmpty() == true then
				self.animalValue:SetPropertyToMax(MS_HeroData.Property.Weakness)
				self.animalValue:SetPropertyToMax(MS_HeroData.Property.Toughness)
			end
		elseif self.moveHitData ~= nil and self.moveHitData:IsEnable() == true then
			local skillData = self.moveHitData:GetSkillData()

			if skillData ~= nil then
				local needRecovery = skillData.ToughnessRecovery

				if needRecovery <= 0 and self.animalValue:GetProperty(MS_HeroData.Property.Toughness) <= 0 then
					self.animalValue:SetPropertyToMax(MS_HeroData.Property.Toughness)
				end
			end
		end
	end

	self.moveBattleMode = 1
	self.moveBattleEndTime = TimeHelper.getNowTime() + AnimalBase_Define.MotionBattleModeToNormalTime
	self.moveHitType = AnimalBase_Define.HitType.None
	self.moveHitStatusWeak = false
	self.moveHitStatusWeakRecovery = false
	self.moveHitStatusWeakToward = false

	if self.moveHitData ~= nil then
		self.moveHitData:Disable()
	end

	self.moveHitPeriodFrame = 0
	self.moveHitLock = false
	self.moveMutekiIgnoreId = 0

	XCollider.ClearRouteColliderIgnore(self.animalId)
end

function AnimalBase:GetHitUpUpTimeConfig()
	return 0, 0, 0, 0
end

function AnimalBase:OnHitReset()
	local resetTime = 0

	if self:IsWillDead() == false then
		if self.moveHitTypeOld == AnimalBase_Define.HitType.Up then
			if self.moveHitType == AnimalBase_Define.HitType.Up then
				local hitTime1, hitTime2, resetTime1, resetTime2 = self:GetHitUpUpTimeConfig()

				resetTime = MathHelper.getValueInRadioRange(self.animatorTime, hitTime1, hitTime2, resetTime1, resetTime2)
			end
		elseif self.moveHitTypeOld == AnimalBase_Define.HitType.Freeze and self.moveHitType ~= AnimalBase_Define.HitType.Freeze then
			self:ClearStatusAllByType(MS_StatusData.LogicType.Dizzy)
		end
	end

	return resetTime
end

function AnimalBase:HitExecute(attackAnimal)
	if self:IsEnd() == true then
		return false
	end

	if attackAnimal == nil then
		return false
	end

	local skillData = MS_SkillData.GetSkillData(attackAnimal:GetHeroId(), AnimalBase_Define.SkillType.Execute, 1)

	if skillData == nil then
		return false
	end

	local ret = self:ChangeHit(AnimalBase_Define.HitType.Execute, skillData, nil, AnimalBase_Define.MoveStateChangeLevel.High)

	if ret == true and self.skillExecuteHitFix == false then
		XCollider.AddRouteColliderIgnore(self.animalId, attackAnimal.animalId)

		local attackBoxPos = attackAnimal:GetExecuteAttackPosition()
		local hitPos = self:GetPosByWorldPos()
		local hitBoxPos = self:GetExecuteHitPosition()
		local hitDis = Vector3.Distance(hitPos, hitBoxPos)
		local newPos = attackAnimal:GetForward() * hitDis

		newPos:Add(attackBoxPos)
		self:SetPosByWorldPos(newPos, true)
		self:LookAt(attackAnimal:GetBack(), true)

		newPos = nil
	end

	return ret
end

function AnimalBase:HitBackstab(attackAnimal)
	if self:IsEnd() == true then
		return false
	end

	if attackAnimal == nil then
		return false
	end

	local skillData = MS_SkillData.GetSkillData(attackAnimal:GetHeroId(), AnimalBase_Define.SkillType.Backstab, 1)
	local hitType = AnimalBase.GetSkillHitType(attackAnimal:GetHeroId(), AnimalBase_Define.SkillType.Backstab, 1)

	if skillData == nil then
		return false
	end

	local ret = self:ChangeHit(hitType, skillData, nil, AnimalBase_Define.MoveStateChangeLevel.High)

	if ret == true and self.skillBackstabHitFix == false then
		XCollider.AddRouteColliderIgnore(self.animalId, attackAnimal.animalId)

		local attackBoxPos = attackAnimal:GetBackstabAttackPosition()
		local hitPos = self:GetPosByWorldPos()
		local hitBoxPos = self:GetBackstabHitPosition()
		local hitDis = Vector3.Distance(hitPos, hitBoxPos)
		local newPos = attackAnimal:GetForward() * hitDis

		newPos:Add(attackBoxPos)
		self:SetPosByWorldPos(newPos, true)
		self:LookAt(attackAnimal:GetForward(), true)

		newPos = nil
	end

	return ret
end

function AnimalBase:Hit(attackerData)
	if self:IsEnd() == true then
		return
	end

	if attackerData == nil then
		return
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local skillAI = attackerData:GetSkillTypeForAI()
	local isBehind = attackerData:IsAttackFromBehind()
	local hitType = attackerData:GetHitType()
	local skillDir = attackerData:GetSkillDir()
	local colliderIndexList = attackerData:GetColliderIndexList()
	local skillData = attackerData:GetSkillData()
	local itemData = attackerData:GetItemData()

	if skillData == nil then
		return
	end

	if hitType == AnimalBase_Define.HitType.None then
		return
	end

	if hitType == AnimalBase_Define.HitType.Execute or hitType == AnimalBase_Define.HitType.Backstab or hitType == AnimalBase_Define.HitType.Backstab2 then
		if self.moveHitData ~= nil then
			self.moveHitData:Set(attackerData)
		end

		self:HitShake(attackerData)
		self:HitEffectAndAudio(attackerData)

		return
	end

	local toHit = false
	local toughnessEmpty = self.animalValue:IsToughnessEmpty()
	local weaknessEmpty = self.animalValue:IsWeaknessEmpty()
	local ignoreToughness = skillData.ToughnessIgnore > 0

	hitType = self:ConvertHitType(hitType)

	if weaknessEmpty == true and self.moveHitStatusWeak == false and self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:IsHitByType(AnimalBase_Define.HitType.Execute) == false then
		hitType = AnimalBase_Define.HitType.StatusWeak
	end

	if skillAI == AnimalBase_Define.SkillTypeForAI.OffensePull then
		if self:IsHitByType(AnimalBase_Define.HitType.LeftHandWeak) == true or self:IsHitByType(AnimalBase_Define.HitType.RightHandWeak) == true or self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == true or self:IsHitByType(AnimalBase_Define.HitType.DefenceBreak) == true then
			local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

			if attackAnimal ~= nil then
				self.skillHitTowardPosition = GameAI.GetPositionTargetForward(attackAnimal, self:GetRadius())

				if self.skillHitTowardPosition ~= nil then
					hitType = AnimalBase_Define.HitType.Toward
				end
			end
		end
	elseif skillAI == AnimalBase_Define.SkillTypeForAI.PullFix or skillAI == AnimalBase_Define.SkillTypeForAI.Pull then
		self.moveMutekiIgnoreId = attackVPlayer:GetAnimalId()
	end

	if self:IsWillDead() == false then
		if toughnessEmpty == true or ignoreToughness == true or weaknessEmpty == true then
			toHit = true
		end
	else
		toHit = true

		if self:IsSkillingSkill() == true then
			local tmpSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

			if tmpSkillData.DeathNoHit > 0 then
				toHit = false
			end
		end

		if self.isHost == false and self.boss > 0 then
			AudioCtrl.SetHeroAudio("sfx_skill_hit_mid", self:GetPosByWorldPos(), self.animalId, nil, nil, true)
		end
	end

	if toHit == true and self:IsToHit(hitType, skillData) == false then
		toHit = false
	end

	if toHit == true then
		local hitTypeNew = self:UpdateHitType(hitType, isBehind, skillDir)

		toHit = self:ChangeHit(hitTypeNew, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
	else
		toHit = self:HitBone(skillData.HitPower, skillDir, colliderIndexList)
	end

	self:HitShake(attackerData)
	self:HitEffectAndAudio(attackerData)

	if attackVPlayer:IsHost() == true then
		local tmpDelay = 0

		if skillAI == AnimalBase_Define.SkillTypeForAI.OffenseClose then
			local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

			if attackAnimal ~= nil then
				attackAnimal:StartAnimatorDelay(tmpDelay, skillData.FrameFreeze, skillData.FrameFadeOut, skillData.FrameFreezeSpeed)
			end

			self:StartAnimatorDelay(skillData.FrameDelay + tmpDelay, skillData.FrameFreeze, skillData.FrameFadeOut, skillData.FrameFreezeSpeed)
		elseif skillAI == AnimalBase_Define.SkillTypeForAI.OffenseFar then
			self:StartAnimatorDelay(skillData.FrameDelay + tmpDelay, skillData.FrameFreeze, skillData.FrameFadeOut, skillData.FrameFreezeSpeed)
		end
	end

	if toHit == true and self.moveHitData ~= nil then
		self.moveHitData:Set(attackerData)
	end
end

function AnimalBase:HitTrick(attackerData)
	if self:IsEnd() == true then
		return
	end

	if attackerData == nil then
		return
	end

	local isBehind = attackerData:IsAttackFromBehind()
	local hitType = attackerData:GetHitType()
	local trickDir = attackerData:GetTrickDir()
	local colliderIndexList = attackerData:GetColliderIndexList()
	local trickData = attackerData:GetTrickData()

	if trickData == nil then
		return
	end

	if hitType == AnimalBase_Define.HitType.None then
		return
	end

	local toHit = false
	local toughnessEmpty = self.animalValue:IsToughnessEmpty()
	local weaknessEmpty = self.animalValue:IsWeaknessEmpty()
	local ignoreToughness = trickData.ToughnessIgnore > 0

	hitType = self:ConvertHitType(hitType)

	if weaknessEmpty == true and self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:IsHitByType(AnimalBase_Define.HitType.Execute) == false then
		hitType = AnimalBase_Define.HitType.StatusWeak
	end

	if self:IsWillDead() == false then
		if toughnessEmpty == true or ignoreToughness == true or weaknessEmpty == true then
			toHit = true
		end
	else
		toHit = true

		if self.isHost == false and self.boss > 0 then
			AudioCtrl.SetHeroAudio("sfx_skill_hit_mid", self:GetPosByWorldPos(), self.animalId, nil, nil, true)
		end
	end

	if toHit == true and self:IsToHit(hitType, nil) == false then
		toHit = false
	end

	if toHit == true then
		local hitTypeNew = self:UpdateHitType(hitType, isBehind, trickDir)

		toHit = self:ChangeHit(hitTypeNew, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
	else
		toHit = self:HitBone(trickData.HitPower, trickDir, colliderIndexList)
	end

	if toHit == true and self.moveHitData ~= nil then
		self.moveHitData:Disable()
	end

	self:HitTrickShake(attackerData)
	self:HitTrickEffectAndAudio(attackerData)
end

function AnimalBase:HitElevator()
	if self:IsEnd() == true then
		return
	end

	local toHit = self:ChangeHit(AnimalBase_Define.HitType.Down, nil, nil, AnimalBase_Define.MoveStateChangeLevel.High)

	if toHit == true and self.moveHitData ~= nil then
		self.moveHitData:Disable()
	end

	if self.isHost == true and self.cameraScene ~= nil then
		self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit4)
		self.cameraScene:StartAnimator()
	end

	AudioCtrl.SetHeroAudio("hitType/elevator_hit", self.tfModel, self.animalId)

	if self:IsHit() == true then
		AudioCtrl.SetHeroAudio(self.modelName .. "/voice_gethit", self.tfModel, self.animalId)
	end
end

function AnimalBase:HitStatus(statusData, hitType, hitShake)
	if statusData == nil then
		return
	end

	if self:IsHit() == true and self:IsHitByType(AnimalBase_Define.HitType.Light) == false and self:IsHitByType(AnimalBase_Define.HitType.Heavy) == false and self:IsHitByType(AnimalBase_Define.HitType.Super) == false then
		self:HitShakeSimple(hitShake)
		self:HitStatusEffectAndAudio(statusData)

		return
	end

	local toHit = false
	local toughnessEmpty = self.animalValue:IsToughnessEmpty()
	local weaknessEmpty = self.animalValue:IsWeaknessEmpty()

	hitType = self:ConvertHitType(hitType)

	if weaknessEmpty == true and self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:IsHitByType(AnimalBase_Define.HitType.Execute) == false then
		hitType = AnimalBase_Define.HitType.StatusWeak
	end

	if self:IsWillDead() == false then
		if toughnessEmpty == true or weaknessEmpty == true then
			toHit = true
		end
	else
		toHit = true

		if self.isHost == false and self.boss > 0 then
			AudioCtrl.SetHeroAudio("sfx_skill_hit_mid", self:GetPosByWorldPos(), self.animalId, nil, nil, true)
		end
	end

	if toHit == true and self:IsToHit(hitType, nil) == false then
		toHit = false
	end

	if toHit == true then
		local hitTypeNew = self:UpdateHitType(hitType, false, Vector3.s_forward)

		toHit = self:ChangeHit(hitTypeNew, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
	else
		toHit = self:HitBone(statusData.HitPower, Vector3.s_forward, nil)
	end

	self:HitShakeSimple(hitShake)
	self:HitStatusEffectAndAudio(statusData)
end

function AnimalBase:HitTrickEffectAndAudio(attackerData)
	local trickData = attackerData:GetTrickData()

	if trickData == nil then
		return
	end

	if trickData.HitEffect ~= "" then
		local tmpVfxRoot = self:GetEffectRoot(trickData.HitEffectRoot)

		if tmpVfxRoot ~= nil then
			if trickData.HitEfffectBind > 0 then
				VfxManager.PlayBindMulti(tmpVfxRoot, trickData.HitEffect)
			else
				VfxManager.PlayTransformFreezeMulti(tmpVfxRoot, trickData.HitEffect)
			end
		end
	end

	if trickData.HitAudio ~= "" then
		AudioCtrl.SetObjectAudio(trickData.HitAudio, self.tfModel, trickData.TrickId)
	end

	if self:IsHit() == true then
		AudioCtrl.SetHeroAudio(self.modelName .. "/voice_gethit", self.tfModel, self.animalId)
	end
end

function AnimalBase:HitStatusEffectAndAudio(statusData)
	if statusData == nil then
		return
	end

	if statusData.HitEffect ~= "" then
		local tmpVfxRoot = self:GetEffectRoot(statusData.HitEffectRoot)

		if tmpVfxRoot ~= nil then
			if statusData.HitEfffectBind > 0 then
				VfxManager.PlayBindMulti(tmpVfxRoot, statusData.HitEffect)
			else
				VfxManager.PlayTransformFreezeMulti(tmpVfxRoot, statusData.HitEffect)
			end
		end
	end

	if statusData.HitAudio ~= "" then
		AudioCtrl.SetHeroAudio(statusData.HitAudio, self.tfModel, self.animalId)
	end

	if self:IsHit() == true then
		AudioCtrl.SetHeroAudio(self.modelName .. "/voice_gethit", self.tfModel, self.animalId)
	end
end

function AnimalBase:HitEffectAndAudio(attackerData)
	if attackerData == nil then
		return
	end

	local fromBullet = attackerData:IsFromBullet()
	local colliderIndexList = attackerData:GetColliderIndexList()
	local crit = attackerData:IsCrit()
	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local hitType = attackerData:GetHitType()
	local hitEffect = ""
	local hitEffectRoot = 0
	local hitEffectBind = 0
	local hitAudio = ""
	local hitDir

	if DebugHitCritSelf == true then
		crit = true
	end

	if fromBullet == true then
		hitDir = attackerData:GetBulletDirection()
		hitEffect, hitEffectRoot, hitEffectBind, hitAudio = attackerData:GetBulletHitEffectAndAudio(crit)
	else
		local skillData = attackerData:GetSkillData()

		if skillData ~= nil then
			hitDir = attackerData:GetSkillDir()

			if crit == true and skillData.HitCritEffect ~= "" then
				hitEffect = skillData.HitCritEffect
			else
				hitEffect = skillData.HitEffect
			end

			hitEffectRoot = skillData.HitEffectRoot
			hitEffectBind = skillData.HitEfffectBind

			if crit == true and skillData.HitCritAudio ~= "" then
				hitAudio = skillData.HitCritAudio
			else
				hitAudio = skillData.HitAudio
			end
		else
			return
		end
	end

	local isWeakHit = false

	if self.damageWeakEffect ~= "" and self.characterColliderWeak == true and colliderIndexList ~= nil and #colliderIndexList > 0 then
		for i = 1, #colliderIndexList do
			local weakIndex = self:GetAnimalColliderWeakIndex(colliderIndexList[i])
			local tmpCollider = self:GetAnimalCollider(colliderIndexList[i])

			if tmpCollider ~= nil and weakIndex >= 0 then
				isWeakHit = true

				local eff = VfxManager.PlayTransformFreezeMulti(tmpCollider.transform, self.damageWeakEffect)

				if self.damageWeakAudio ~= "" then
					AudioCtrl.SetHeroAudio(self.damageWeakAudio, tmpCollider.transform, self.animalId)
				end
			end
		end
	end

	if isWeakHit == false and hitEffect ~= "" and hitDir ~= nil then
		local tmpVfxRoot = self:GetEffectRoot(hitEffectRoot)

		if tmpVfxRoot ~= nil then
			local eff

			if hitEffectBind > 0 then
				eff = VfxManager.PlayBindMulti(tmpVfxRoot, hitEffect)
			else
				eff = VfxManager.PlayTransformFreezeMulti(tmpVfxRoot, hitEffect)
			end

			if eff ~= nil then
				local tmpDir = hitDir:Clone()

				tmpDir.y = 0

				tmpDir:Unm()

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					local rot = Quaternion.LookRotation(tmpDir)

					eff:SetRotation(rot.x, rot.y, rot.z, rot.w)

					rot = nil
				end

				tmpDir = nil
			end
		end
	end

	if hitAudio ~= "" then
		AudioCtrl.SetHeroAudio(hitAudio, self.tfModel, attackVPlayer:GetAnimalId())
	end

	if self:IsHit() == true or hitType == AnimalBase_Define.HitType.Execute or hitType == AnimalBase_Define.HitType.Backstab or hitType == AnimalBase_Define.HitType.Backstab2 then
		AudioCtrl.SetHeroAudio(self.modelName .. "/voice_gethit", self.tfModel, self.animalId)
	end
end

function AnimalBase:HitBone(hitPower, skillDir, colliderIndexList)
	if colliderIndexList == nil or #colliderIndexList <= 0 or hitPower <= 0 or self.finalIkHitReactionEnable == false or self.finalIkHitReaction == nil then
		return false
	end

	local hitDir = Vector3.forward

	hitDir:SetVector3(skillDir)
	hitDir:SetNormalize()
	hitDir:Mul(hitPower)

	for i = 1, #colliderIndexList do
		local collider = self:GetAnimalCollider(colliderIndexList[i])

		if collider ~= nil then
			self.finalIkHitReaction:Hit(collider, hitDir, collider.transform.position)
		end

		collider = nil
	end

	hitDir = nil

	return true
end

function AnimalBase:OnTouchGroundFinish()
	self.moveDropType = AnimalBase_Define.DropType.HeadUp

	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Drop, self.moveDropType, 0, 0)
end

function AnimalBase:GetEffectRoot(type)
	local tmpVfxRoot

	if type == AnimalBase_Define.EffectRootType.Root then
		tmpVfxRoot = self.tfModel
	elseif type == AnimalBase_Define.EffectRootType.Chest then
		tmpVfxRoot = self:GetBodyChest()
	elseif type == AnimalBase_Define.EffectRootType.Head then
		tmpVfxRoot = self:GetBodyHead()
	elseif type == AnimalBase_Define.EffectRootType.Hips then
		tmpVfxRoot = self:GetBodyHips()
	elseif type > AnimalBase_Define.EffectRootType.WeaponBox then
		local id = type - AnimalBase_Define.EffectRootType.WeaponBox

		tmpVfxRoot = self:GetWeaponBox(id)
	end

	return tmpVfxRoot
end

function AnimalBase:OnBlock(isFirst, attackerData)
	local ret = false
	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local blockSkillData, blockParam = attackerData:GetSkillBlockedData()
	local skillData = attackerData:GetSkillData()
	local skillDir = attackerData:GetSkillDir()

	if blockSkillData ~= nil then
		if isFirst == true then
			if self:IsWillDead() == false and attackerData:GetSkillBlockStatus() == SkillTouchAttackData.BlockStatus.Success then
				local skillAI = self:GetSkillTypeForAI()

				if skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit then
					self:ResetAnimator(0)
				else
					local blockSkillIndex, blockSkillCombo, blockParam = self:GetBlockSkill()
					local tmpSkillCombo = blockSkillCombo + 2

					if self.skillBlockJump[blockSkillIndex] ~= nil then
						tmpSkillCombo = self.skillBlockJump[blockSkillIndex][AnimalBase_Define.SkillBlockJump.HitCombo]
					end

					if tmpSkillCombo <= self.animalConfig.skillComboMax[blockSkillIndex] then
						self:StopMovementImmediately(true)
						self:OnSkillEnd(blockSkillIndex, tmpSkillCombo)
						self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, blockSkillIndex, tmpSkillCombo, false)
					end
				end

				self:BlockShake(attackerData, false)

				if blockParam > 1 then
					self:StartAnimatorDelay(0, AnimalBase_Define.BlockFrameFreeze, AnimalBase_Define.BlockFrameFadeOut, AnimalBase_Define.BlockFrameFreezeSpeed)
				end

				ret = true
			else
				self:ChangeHit(AnimalBase_Define.HitType.DefenceBreak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				self:BlockShake(attackerData, true)
				self.animalValue:SetEnergyRecoveryDelayTime(AnimalBase_Value_Define.DefenceBreakEnergyRecoveryDelay)
				AudioCtrl.SetHeroAudio("hitType/defence_break", self.tfModel, self.animalId)

				if self:IsHeroSanNotNormal(10004) == true then
					self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
				end
			end
		end

		if blockSkillData.HitAudio ~= "" then
			AudioCtrl.SetHeroAudio(blockSkillData.HitAudio, self.tfModel, self.animalId)
		end

		if blockSkillData.HitEffect ~= "" then
			local tmpVfxRoot = self:GetEffectRoot(blockSkillData.HitEffectRoot)

			if tmpVfxRoot ~= nil then
				local eff = VfxManager.PlayBindMulti(tmpVfxRoot, blockSkillData.HitEffect)

				if eff ~= nil and attackVPlayer ~= nil then
					local nowPos = self:GetPosByWorldPos()
					local attackPos = attackVPlayer:GetPosition()
					local tmpDir = attackPos - nowPos

					tmpDir.y = 0

					if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
						tmpDir:SetNormalize()

						local rot = Quaternion.LookRotation(tmpDir)

						eff:SetRotation(rot.x, rot.y, rot.z, rot.w)

						rot = nil
					end

					tmpDir = nil
				end
			end
		end
	end

	return ret
end

function AnimalBase:OnHitHand(isFirst, attackerData)
	local ret = AnimalBase_Define.HitHandType.Fail
	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local hitHandSkillData = attackerData:GetSkillHitHandData()
	local skillData = attackerData:GetSkillData()
	local skillDir = attackerData:GetSkillDir()
	local hitHandStatus = attackerData:GetSkillHitHandStatus()

	if hitHandSkillData ~= nil then
		if isFirst == true then
			if self:IsWillDead() == false and hitHandStatus == SkillTouchAttackData.HitHandStatus.Success then
				if AnimalBase.IsHitHandRebound(attackVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo) == true then
					self:HitBlock(skillData)
				end

				self:BlockShake(attackerData, true)
				self:StartAnimatorDelay(0, AnimalBase_Define.BlockFrameFreeze, AnimalBase_Define.BlockFrameFadeOut, AnimalBase_Define.BlockFrameFreezeSpeed)

				ret = AnimalBase_Define.HitHandType.Success
			elseif self:IsWillDead() == false and hitHandStatus == SkillTouchAttackData.HitHandStatus.NoDamage then
				self:BlockShake(attackerData, true)
				self:StartAnimatorDelay(0, AnimalBase_Define.BlockFrameFreeze, AnimalBase_Define.BlockFrameFadeOut, AnimalBase_Define.BlockFrameFreezeSpeed)

				ret = AnimalBase_Define.HitHandType.NoDamage
			else
				self:ChangeHit(AnimalBase_Define.HitType.DefenceBreak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				self:BlockShake(attackerData, true)
				self.animalValue:SetEnergyRecoveryDelayTime(AnimalBase_Value_Define.DefenceBreakEnergyRecoveryDelay)
				AudioCtrl.SetHeroAudio("hitType/defence_break", self.tfModel, self.animalId)

				if self:IsHeroSanNotNormal(10004) == true then
					self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
				end
			end
		end

		if hitHandSkillData.HitAudio ~= "" then
			AudioCtrl.SetHeroAudio(hitHandSkillData.HitAudio, self.tfModel, self.animalId)
		end

		local tmpVfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest)

		if tmpVfxRoot ~= nil and self.hitHandEffect ~= "" then
			local eff = VfxManager.PlayBindMulti(tmpVfxRoot, self.hitHandEffect)

			if eff ~= nil and attackVPlayer ~= nil then
				local nowPos = self:GetPosByWorldPos()
				local attackPos = attackVPlayer:GetPosition()
				local tmpDir = attackPos - nowPos

				tmpDir.y = 0

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					tmpDir:SetNormalize()

					local rot = Quaternion.LookRotation(tmpDir)

					eff:SetRotation(rot.x, rot.y, rot.z, rot.w)

					rot = nil
				end

				tmpDir = nil
			end
		end
	end

	return ret
end

function AnimalBase:OnHitHandTrick(isFirst, touchData)
	local ret = AnimalBase_Define.HitHandType.Fail
	local hitHandSkillData = touchData:GetSkillHitHandData()
	local hitHandStatus = touchData:GetSkillHitHandStatus()

	if hitHandSkillData ~= nil then
		if isFirst == true then
			if self:IsWillDead() == false and (hitHandStatus == TrickTouchData.HitHandStatus.Success or hitHandStatus == TrickTouchData.HitHandStatus.NoDamage) then
				self:BlockShake(nil, true)
				self:StartAnimatorDelay(0, AnimalBase_Define.BlockFrameFreeze, AnimalBase_Define.BlockFrameFadeOut, AnimalBase_Define.BlockFrameFreezeSpeed)

				ret = AnimalBase_Define.HitHandType.Success
			else
				self:ChangeHit(AnimalBase_Define.HitType.DefenceBreak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				self:BlockShake(nil, true)
				self.animalValue:SetEnergyRecoveryDelayTime(AnimalBase_Value_Define.DefenceBreakEnergyRecoveryDelay)
				AudioCtrl.SetHeroAudio("hitType/defence_break", self.tfModel, self.animalId)

				if self:IsHeroSanNotNormal(10004) == true then
					self.animalValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
				end
			end
		end

		if hitHandSkillData.HitAudio ~= "" then
			AudioCtrl.SetHeroAudio(hitHandSkillData.HitAudio, self.tfModel, self.animalId)
		end

		local tmpVfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

		if tmpVfxRoot ~= nil and self.hitHandEffect ~= "" then
			VfxManager.PlayBindMulti(tmpVfxRoot, self.hitHandEffect)
		end
	end

	return ret
end

function AnimalBase:OnCounterAttack(isFirst, attackerData)
	return
end

function AnimalBase:OnBeatBack(isFirst, attackerData)
	return
end

function AnimalBase:OnAutoSkill(isFirst, attackerData)
	return
end

function AnimalBase:OnSkillHit(isFirst, hitData)
	if isFirst == true and self:IsSkillingSkill() == true and self.skillIndex == AnimalBase_Define.SkillType.Drop then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil then
			self.moveDropDamageHeight = 0
		end
	end
end

function AnimalBase:OnSkillParryTrigger(parry)
	if self:IsSkilling() == false then
		return
	end

	if parry <= 0 then
		return
	end

	local parry = (parry - 1) % 4 + 1

	if parry >= 4 then
		self:EndSkillParryCollider()
	elseif parry >= 1 then
		self:StartSkillParryCollider()
	end
end

function AnimalBase:IsSkillParryCloseEnable()
	if self:IsSkilling() == true and self.animatorParry >= 2 and self.animatorParry < 3 then
		return true
	end

	return false
end

function AnimalBase:StartSkillParryCollider()
	if self.skillColliderParryList == nil and self:IsSkillingSkill() == true then
		local tmpTalentParry = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.ParryUse, 0, 0)

		if tmpTalentParry > 0 or self.type == AnimalBase_Define.Type.Monster then
			if self.goParryBox ~= nil then
				for i, box in pairs(self.goParryBox) do
					if box ~= nil then
						box:SetActive(true)
					end
				end
			end

			if DebugShowAttackBox == true and self.goParryBoxRender ~= nil then
				for i, render in pairs(self.goParryBoxRender) do
					if render ~= nil then
						render.enabled = true
					end
				end
			end

			self.skillColliderParryList = self.goParryBox
		end
	end
end

function AnimalBase:EndSkillParryCollider()
	if self.skillColliderParryList ~= nil then
		if self.goParryBox ~= nil then
			for i, box in pairs(self.goParryBox) do
				if box ~= nil then
					box:SetActive(false)
				end
			end
		end

		if DebugShowAttackBox == true and self.goParryBoxRender ~= nil then
			for i, render in pairs(self.goParryBoxRender) do
				if render ~= nil then
					render.enabled = false
				end
			end
		end
	end

	self.skillColliderParryList = nil
end

function AnimalBase:OnSkillParry(target, targetSkillData)
	return
end

function AnimalBase:OnSkillParryBullet(bullet)
	return
end

function AnimalBase:IsSpecialCameraFollow()
	if self:IsOnStair() == true or self.moveFix == true or self.moveStateNow == AnimalBase_Define.MoveStateType.Drop or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
		return true
	end

	return false
end

function AnimalBase:IsDrop()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
		return true
	end

	return false
end

function AnimalBase:IsHit()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		return true
	end

	return false
end

function AnimalBase:GetHitType()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		return self.moveHitType
	end

	return AnimalBase_Define.HitType.None
end

function AnimalBase:IsHitByType(hitType)
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit and self.moveHitType == hitType then
		return true
	end

	return false
end

function AnimalBase:IsHitBySkill(attackAnimal, skillIndex, skillCombo)
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit and self.moveHitData ~= nil and self.moveHitData:IsEnable() == true then
		local attackVPlayer = self.moveHitData:GetAttackVirtualPlayer()
		local hitType = self.moveHitData:GetHitType()
		local skillData = self.moveHitData:GetSkillData()

		if attackVPlayer:GetAnimalId() == attackAnimal.animalId and skillData.SkillIndex == skillIndex then
			if skillCombo > 0 then
				if skillData.SkillCombo == skillCombo then
					return true
				end
			else
				return true
			end
		end
	end

	return false
end

function AnimalBase:SetHitLock(flg)
	self.moveHitLock = flg
end

function AnimalBase:KeepHitPeriod()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit and (self.moveHitType == AnimalBase_Define.HitType.Dizzy or self.moveHitType == AnimalBase_Define.HitType.Freeze or self.moveHitType == AnimalBase_Define.HitType.Tackle) then
		if self.moveHitData ~= nil and self.moveHitData:IsEnable() == true then
			self:ChangeHitPeriod(self.moveHitType, self.moveHitData:GetSkillData(), self.moveHitData:GetItemData(), AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
		else
			self:ChangeHitPeriod(self.moveHitType, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
		end
	end
end

function AnimalBase:ChangeHitPeriod(hitType, skillData, itemData, changeLevel)
	local ret = false

	if hitType == AnimalBase_Define.HitType.None then
		return ret
	end

	if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Hit then
		ret = self:ChangeHit(hitType, skillData, itemData, changeLevel)

		if ret == true then
			self.moveHitPeriodFrame = 2
		end
	elseif hitType ~= self.moveHitType then
		ret = self:ChangeHit(hitType, skillData, itemData, changeLevel)

		if ret == true then
			self.moveHitPeriodFrame = 2
		end
	elseif self.moveHitType ~= AnimalBase_Define.HitType.None then
		self.moveHitPeriodFrame = 2
		ret = true
	end

	return ret
end

function AnimalBase:ChangeHitSimple(attackAnimal, hitType, skillData, skillDir, force)
	if self:IsEnd() == true or self:IsWillDead() == true or self:IsShow() == false or self.gameController:IsStopAttack() == true then
		return false
	end

	local ret = false

	if force == false and (self:IsMuteki(nil) == true or self:IsNoDamage() == true) then
		return ret
	end

	local attackVPlayer = attackAnimal:GetVirtualPlayer()
	local attackerData = self:AddSkillTouchAttackPlayer(attackVPlayer, skillData, nil, skillDir, nil)

	if attackerData ~= nil then
		local damageType = AnimalBase.GetSkillDamageType(attackVPlayer:GetHeroId(), skillData.SkillIndex, skillData.SkillCombo)

		attackerData:SetDamageType(damageType)
		attackerData:SetAttackFromBehind(false)

		if force == false and self:IsSkillBeatBackStart() == true then
			self:OnBeatBack(true, attackerData)
		else
			local tmpHpSub, tmpHpAdd, tmpHpSubReal, tmpHpAddReal = self:CalculateDamage(attackerData)
			local toHit = true
			local skillAI = attackerData:GetSkillTypeForAI()
			local ignoreToughness = skillData.ToughnessIgnore > 0

			if skillAI == AnimalBase_Define.SkillTypeForAI.PullFix then
				local toughnessEmpty = self.animalValue:IsToughnessEmpty()

				if toughnessEmpty == false and ignoreToughness == false then
					toHit = false
				end
			end

			self:HitShake(attackerData)
			self:HitEffectAndAudio(attackerData)

			if toHit == true then
				local isBehind = GameAI.IsAnimalBehindPosition(self, attackVPlayer:GetPosition())
				local hitTypeNew = self:UpdateHitType(hitType, isBehind, skillDir)

				if hitType == AnimalBase_Define.HitType.Dizzy or hitType == AnimalBase_Define.HitType.Freeze or hitType == AnimalBase_Define.HitType.Tackle then
					ret = self:ChangeHitPeriod(hitType, skillData, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				else
					ret = self:ChangeHit(hitTypeNew, skillData, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
				end

				if ret == true and self.moveHitData ~= nil then
					self.moveHitData:Set(attackerData)
				end
			end
		end

		attackerData:SetChecked()
	end

	return ret
end

function AnimalBase:ChangeHit(hitType, skillData, itemData, changeLevel)
	self:StopSkillAudio()
	self:ClearSkillEffectAll()

	local oldType = self.moveHitType

	self.moveHitType = hitType

	local isSkilling = self:IsSkillingSkill()
	local skillToughness = 0

	if isSkilling == true then
		skillToughness = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillToughness)
	end

	local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Hit, changeLevel)

	if ret == false then
		self.moveHitType = oldType
	else
		if skillToughness > 0 and self:IsHeroSanNotNormal(10005) == true then
			local subRage = Hero10005_Define.SanHitSubRage
			local tmpTalentSubRate = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SanRageSubInSkillToughness, 0, 0)

			if tmpTalentSubRate > 0 then
				subRage = MathHelper.subValuePermil(subRage, tmpTalentSubRate)
			end

			self.animalValue:SubProperty(MS_HeroData.Property.Rage, subRage)
		end

		local needRecovery = 1

		if skillData ~= nil then
			needRecovery = skillData.ToughnessRecovery
		end

		if needRecovery > 0 and self.animalValue:GetProperty(MS_HeroData.Property.Toughness) <= 0 then
			self.animalValue:SetPropertyToMax(MS_HeroData.Property.Toughness)
		end

		if self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop1 or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop2 then
			self.moveHitStatusWeak = true

			self.animalValue:SetPropertyToZero(MS_HeroData.Property.Toughness)
		elseif self.moveHitType == AnimalBase_Define.HitType.LeftHandWeak or self.moveHitType == AnimalBase_Define.HitType.RightHandWeak then
			self.animalValue:SetPropertyToZero(MS_HeroData.Property.Toughness)
		end

		self.moveHitRate = 1
		self.moveHitPeriodFrame = 0

		if self.hugeBody <= 0 then
			if itemData ~= nil then
				self.moveHitRate = itemData.HitMoveRate
			elseif skillData ~= nil then
				if self.storyId == MS_StoryData.StoryIdForAppleShow then
					self.moveHitRate = 0
				else
					self.moveHitRate = skillData.HitMoveRate
				end
			end
		end

		self:ClearSkillButtonAll()
		self:CheckSkillButtonRefresh()
	end

	return ret
end

function AnimalBase:StopHit()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
	end
end

function AnimalBase:GetDamageWeakEffect()
	return self.damageWeakEffect
end

function AnimalBase:GetDamageWeakAudio()
	return self.damageWeakAudio
end

function AnimalBase:SkillShake(skillShake)
	if DebugDontUseCameraShake == true then
		return
	end

	if self.cameraScene ~= nil and skillShake > 0 then
		if skillShake == 4 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateSkill4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateSkill4)
		elseif skillShake == 3 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateSkill3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateSkill3)
		elseif skillShake == 2 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateSkill2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateSkill2)
		elseif skillShake == 1 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateSkill1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateSkill1)
		else
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateSkill1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateSkill1)
		end

		self.cameraScene:StartAnimator()
	end
end

function AnimalBase:HitShake(attackerData)
	if DebugDontUseCameraShake == true then
		return
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local skillAI = attackerData:GetSkillTypeForAI()
	local hitType = attackerData:GetHitType()
	local skillData = attackerData:GetSkillData()
	local itemData = attackerData:GetItemData()

	if skillData ~= nil then
		local hitShake = skillData.HitShake

		if itemData ~= nil then
			hitShake = itemData.HitShake
		end

		if self.isHost == true then
			if self.cameraScene ~= nil then
				if hitShake > 0 then
					if hitShake == 4 then
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit4)
					elseif hitShake == 3 then
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
					elseif hitShake == 2 then
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
					elseif hitShake == 1 then
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
					else
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
					end

					self.cameraScene:StartAnimator()
				elseif hitShake == 0 then
					if hitType == AnimalBase_Define.HitType.Light then
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
					else
						self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
					end

					self.cameraScene:StartAnimator()
				end
			end
		elseif attackVPlayer:IsHost() == true and skillAI == AnimalBase_Define.SkillTypeForAI.OffenseClose then
			local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

			if attackAnimal ~= nil then
				local camera = attackAnimal:GetSceneCamera()

				if camera ~= nil then
					if hitShake > 0 then
						if hitShake == 4 then
							camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit4)
						elseif hitShake == 3 then
							camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
						elseif hitShake == 2 then
							camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
						elseif hitShake == 1 then
							camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
						else
							camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
						end
					elseif hitType == AnimalBase_Define.HitType.Light then
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
					else
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
					end

					camera:StartAnimator()
				end
			end
		end
	end
end

function AnimalBase:HitTrickShake(attackerData)
	if DebugDontUseCameraShake == true then
		return
	end

	local hitType = attackerData:GetHitType()
	local trickData = attackerData:GetTrickData()

	if trickData ~= nil and trickData.HitShake > 0 then
		local hitShake = trickData.HitShake

		if self.isHost == true and self.cameraScene ~= nil then
			if hitShake > 0 then
				if hitShake == 4 then
					self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit4)
				elseif hitShake == 3 then
					self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
				elseif hitShake == 2 then
					self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
				elseif hitShake == 1 then
					self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
				else
					self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
				end
			end

			if hitType == AnimalBase_Define.HitType.Light then
				self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
			else
				self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
			end

			self.cameraScene:StartAnimator()
		end
	end
end

function AnimalBase:HitShakeSimple(hitShake)
	if self.cameraScene ~= nil and hitShake > 0 then
		if hitShake == 4 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit4)
		elseif hitShake == 3 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
		elseif hitShake == 2 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
		elseif hitShake == 1 then
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
		else
			self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
		end

		self.cameraScene:StartAnimator()
	end
end

function AnimalBase:BlockShake(attackerData, isBreak)
	if DebugDontUseCameraShake == true then
		return
	end

	local attackVPlayer

	if attackerData ~= nil then
		attackVPlayer = attackerData:GetAttackVirtualPlayer()
	end

	if self.isHost == true then
		if self.cameraScene ~= nil then
			if isBreak == true then
				self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
			else
				self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
			end

			self.cameraScene:StartAnimator()
		end
	elseif attackVPlayer ~= nil and attackVPlayer:IsHost() == true then
		local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

		if attackAnimal ~= nil then
			local camera = attackAnimal:GetSceneCamera()

			if camera ~= nil then
				camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
				camera:StartAnimator()
			end
		end
	end
end

function AnimalBase:CustomizedShake(cameraTemplate, isBack, purpose, shakeTemplate)
	if self.cameraScene ~= nil then
		self.cameraScene:SetAnimatorTemplate(cameraTemplate, isBack, purpose, shakeTemplate)
		self.cameraScene:StartAnimator()
	end
end

function AnimalBase:HitBlock(skillData)
	if self:IsEnd() == true then
		return
	end

	if self:IsWillDead() == true then
		return
	end

	if self:IsShow() == false then
		return
	end

	local handId = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillHand)
	local hitType = AnimalBase_Define.HitType.LeftHand

	if handId > 0 and handId < AnimalBase_Define.SkillHandBody then
		local tmpId = (handId - 1) % 3 + 1

		if tmpId == AnimalBase_Define.SkillHand.Right then
			hitType = AnimalBase_Define.HitType.RightHand
		end
	end

	self:ChangeHit(hitType, nil, nil, AnimalBase_Define.MoveStateChangeLevel.Low)
end

function AnimalBase:HitCounterAttack(skillData)
	if self:IsEnd() == true then
		return
	end

	if self:IsWillDead() == true then
		return
	end

	if self:IsShow() == false then
		return
	end

	local handId = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillHand)
	local hitType = AnimalBase_Define.HitType.LeftHandBreak

	if handId > 0 and handId < AnimalBase_Define.SkillHandBody then
		local tmpId = (handId - 1) % 3 + 1

		if tmpId == AnimalBase_Define.SkillHand.Right then
			hitType = AnimalBase_Define.HitType.RightHandBreak
		end
	end

	if self.animalValue:IsWeaknessEmpty() == true then
		if hitType == AnimalBase_Define.HitType.LeftHandBreak then
			hitType = AnimalBase_Define.HitType.LeftHandWeak
		elseif hitType == AnimalBase_Define.HitType.RightHandBreak then
			hitType = AnimalBase_Define.HitType.RightHandWeak
		end
	end

	self:ChangeHit(hitType, skillData, nil, AnimalBase_Define.MoveStateChangeLevel.Low)
end

function AnimalBase:UpdateHitType(hitType, isBehind, skillDir)
	local retType = hitType

	if hitType == AnimalBase_Define.HitType.Light or hitType == AnimalBase_Define.HitType.Heavy or hitType == AnimalBase_Define.HitType.Super or hitType == AnimalBase_Define.HitType.LightDizzy or hitType == AnimalBase_Define.HitType.HeavyDizzy or hitType == AnimalBase_Define.HitType.SuperDizzy or hitType == AnimalBase_Define.HitType.LightFreeze or hitType == AnimalBase_Define.HitType.HeavyFreeze or hitType == AnimalBase_Define.HitType.SuperFreeze then
		local forward = Vector3.forward

		forward:SetVector3(skillDir)
		forward:MulQuat(self:GetRotationInverse())

		forward.y = 0

		forward:SetNormalize()
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.VerticalHit, -forward.z, 0, 0)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalHit, -forward.x, 0, 0)

		forward = nil
	elseif hitType == AnimalBase_Define.HitType.FrontFly or hitType == AnimalBase_Define.HitType.FrontFlyFar or hitType == AnimalBase_Define.HitType.FrontFlyCrow then
		if isBehind == false then
			retType = hitType

			if retType == AnimalBase_Define.HitType.FrontFlyFar then
				AudioCtrl.SetHeroAudio("hitType/hit_front_far", self.tfModel, self.animalId)
			else
				AudioCtrl.SetHeroAudio("hitType/hit_front", self.tfModel, self.animalId)
			end

			if self.moveFix == false then
				local tmpDir = skillDir:Clone()

				tmpDir.y = 0

				tmpDir:Unm()

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					self:LookAt(tmpDir, true)
				end

				tmpDir = nil
			end
		else
			if hitType == AnimalBase_Define.HitType.FrontFlyCrow then
				retType = AnimalBase_Define.HitType.BackFlyCrow
			elseif hitType == AnimalBase_Define.HitType.FrontFlyFar then
				retType = AnimalBase_Define.HitType.BackFlyFar
			else
				retType = AnimalBase_Define.HitType.BackFly
			end

			if retType == AnimalBase_Define.HitType.BackFlyFar then
				AudioCtrl.SetHeroAudio("hitType/hit_back_far", self.tfModel, self.animalId)
			else
				AudioCtrl.SetHeroAudio("hitType/hit_back", self.tfModel, self.animalId)
			end

			if self.moveFix == false then
				local tmpDir = skillDir:Clone()

				tmpDir.y = 0

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					self:LookAt(tmpDir, true)
				end

				tmpDir = nil
			end
		end
	elseif hitType == AnimalBase_Define.HitType.Up then
		AudioCtrl.SetHeroAudio("hitType/hit_up", self.tfModel, self.animalId)
	elseif hitType == AnimalBase_Define.HitType.Down then
		AudioCtrl.SetHeroAudio("hitType/hit_down", self.tfModel, self.animalId)
	end

	return retType
end

function AnimalBase:GetHitData()
	return self.moveHitData
end

function AnimalBase:SetCounterAttackTarget(target)
	self.counterAttackTarget = target
end

function AnimalBase:GetCounterAttackTarget()
	return self.counterAttackTarget
end

function AnimalBase:IsStanding()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
		local speed = self:GetMoveSpeed()

		if speed <= 0 then
			return true
		end
	end

	return false
end

function AnimalBase:ChangeToDrop(force)
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
		return
	end

	if force == true or self.moveStateNow ~= AnimalBase_Define.MoveStateType.Hit or self.moveStateNow == AnimalBase_Define.MoveStateType.Hit and self.animatorTrigger >= AnimalBase_Define.TriggerHit.Drop then
		self.moveDropType = AnimalBase_Define.DropType.HeadUp

		if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
			local tmpDrop = Mathf.Round(self:GetAnimatorParam(AnimalBase_Define.ParamType.Roll))

			self.moveDropType = Mathf.Clamp(tmpDrop, 0, 3)
		end

		local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Drop, AnimalBase_Define.MoveStateChangeLevel.Low)

		if ret == true then
			local nowPos = self:GetPosByWorldPos()

			self.moveDirInertia:Set(0, 0, 0)
			self.moveFallPos:Set(nowPos.x, nowPos.y, nowPos.z)

			self.moveFallStart = nowPos.y
			self.moveOnGround = false
			self.moveOnGroundOld = false

			self:AdjustPositionByGround(nowPos, nowPos, true)
		end
	end
end

function AnimalBase:IsDead()
	return self.deadFlg
end

function AnimalBase:IsDeadHide()
	return self.deadHide
end

function AnimalBase:IsDeadReason(reason)
	if self.deadReason == reason then
		return true
	end

	return false
end

function AnimalBase:IsBornReason(reason)
	if self.bornReason == reason then
		return true
	end

	return false
end

function AnimalBase:IsEnd()
	return self.endFlg
end

function AnimalBase:IsStop()
	if self.stopFlg == false and self.stopRest <= 0 then
		return false
	end

	return true
end

function AnimalBase:IsWillDead()
	if self:IsDead() == true then
		return true
	end

	if self.deadSkillFlg == true then
		return true
	end

	if self.animalValue ~= nil then
		return self.animalValue:IsWillDead()
	end

	return false
end

function AnimalBase:IsSkilling()
	if (self.moveStateNow == AnimalBase_Define.MoveStateType.Skill or self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery) and self.skillIndex > 0 and self.skillCombo > 0 then
		return true
	end

	return false
end

function AnimalBase:IsSkillingSkill()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill and self.skillIndex > 0 and self.skillCombo > 0 then
		return true
	end

	return false
end

function AnimalBase:IsSkillingAttack()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill and self.skillIndex > 0 and self.skillCombo > 0 then
		local targetType = AnimalBase.GetSkillTargetType(self.heroId, self.skillIndex, self.skillCombo)

		if targetType == GameAI.SkillTargetType.Enemy then
			return true
		end
	end

	return false
end

function AnimalBase:IsSkillingRecovery()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery and self.skillIndex > 0 and self.skillCombo > 0 then
		return true
	end

	return false
end

function AnimalBase:IsSkillingById(index, combo)
	if (self.moveStateNow == AnimalBase_Define.MoveStateType.Skill or self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery) and self.skillIndex == index and (combo <= 0 or combo > 0 and self.skillCombo == combo) then
		return true
	end

	return false
end

function AnimalBase:GetSkillingData()
	return self.skillIndex, self.skillCombo
end

function AnimalBase:IsSwitchPlayerReady()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		if self.isHost == false then
			return false
		end

		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Move and self.moveStateNow ~= AnimalBase_Define.MoveStateType.MoveForce then
			return false
		end

		if self:IsMoveType(AnimalBase_Define.MoveType.Move) == false then
			return false
		end

		if self:IsLockingPlayer() == true then
			return false
		end

		if self.gameController:IsBossMode() == true then
			return false
		end

		if self.gameController:IsLockedByEnemy() == true then
			return false
		end

		if self:IsHeroSanCrazy(0) == true then
			return false
		end

		if AppVer == AppDemoCJReview then
			return false
		end

		return true
	end

	return false
end

function AnimalBase:SwitchReady(show)
	self:ClearTrickTouch()
	self:ClearSkillTouchAttackPlayer()
	self:ClearSkillTouchHitPlayer()
	self:ClearSkillTouchHitShell()
	self:ClearTouchHitCombo()
	self:ClearStatusAll()
end

function AnimalBase:IsFreeMoving()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self:IsMoveType(AnimalBase_Define.MoveType.Move) == true then
		return true
	end
end

function AnimalBase:IsFreeMoveEnable()
	if self:IsWillDead() == false and self:IsStop() == false and self.moveOnGround == true and self.moveLock == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Hit and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Revert and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TouchGround and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Get and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dialog and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Special and self.moveStateNow ~= AnimalBase_Define.MoveStateType.MoveForce and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Reborn and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Born and self.moveStateNow ~= AnimalBase_Define.MoveStateType.NightmareStart and self.moveStateNow ~= AnimalBase_Define.MoveStateType.NightmareEnd and self.moveStateNow ~= AnimalBase_Define.MoveStateType.CallStart and self.moveStateNow ~= AnimalBase_Define.MoveStateType.CallEnd and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLine and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLinePrev and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMove and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMoveForce and self.moveStateNow ~= AnimalBase_Define.MoveStateType.StoryEnterMove and self:IsEvent(self.moveStateNow) == false and self:IsEventLoop(self.moveStateNow) == false and self:IsEventEnd(self.moveStateNow) == false then
		return true
	end

	return false
end

function AnimalBase:IsFreeSkillEnable()
	if self:IsWillDead() == true then
		return false
	end

	if self:IsStop() == true or self.moveLock == true then
		return false
	end

	if self.moveOnGround == false or self.moveStateNow == AnimalBase_Define.MoveStateType.Hit or self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround or self.moveStateNow == AnimalBase_Define.MoveStateType.Get or self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.Special or self.moveStateNow == AnimalBase_Define.MoveStateType.Reborn or self.moveStateNow == AnimalBase_Define.MoveStateType.Born or self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareStart or self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CallStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove or self:IsEvent(self.moveStateNow) == true or self:IsEventLoop(self.moveStateNow) == true or self:IsEventEnd(self.moveStateNow) == true then
		return false
	end

	return true
end

function AnimalBase:IsPermitAutoSave(autoType)
	if (autoType == ControllerStoryMode.SaveAuto.Exit or self:IsStop() == false) and self:IsWillDead() == false and self.moveOnGround == true and self:IsOnStair() == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Fly and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dialog and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Special and self.moveStateNow ~= AnimalBase_Define.MoveStateType.MoveForce and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLine and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLinePrev and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMove and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMoveForce and self.moveStateNow ~= AnimalBase_Define.MoveStateType.StoryEnterMove and self:IsEvent(self.moveStateNow) == false and self:IsEventLoop(self.moveStateNow) == false and self:IsEventEnd(self.moveStateNow) == false then
		return true
	end

	return false
end

function AnimalBase:CloseHeadInfo()
	if self.type ~= AnimalBase_Define.Type.HomeBase and self.type ~= AnimalBase_Define.Type.Other then
		self:ShowLockMark(false)
	end

	if self.boss > 0 then
		UIManager.SendMessage("Mainmenu", "ShowBossHpBar", false)
	end
end

function AnimalBase:CheckSkillExecuteStatus()
	self.skillExecuteAttack = false

	if self.isHost == true and self.isHostBack == false and self:IsHaveSkill(AnimalBase_Define.SkillType.Execute) == true then
		if self:IsWillDead() == false and self:IsShow() == true then
			local skillDataExecute = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.Execute, 1)

			if skillDataExecute ~= nil and (skillDataExecute.SkillTalent <= 0 or self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, skillDataExecute.SkillIndex, skillDataExecute.SkillCombo) >= skillDataExecute.SkillTalent) and self:IsPermitExecuteAttack() == true then
				local targetAnimal

				if self:IsLockingPlayer() == true then
					if self:CheckSkillExecuteEnable(self.skillLockAnimal) == true then
						targetAnimal = self.skillLockAnimal
					end
				else
					local attackBoxPos = self:GetExecuteAttackPosition()
					local targetType = AnimalBase.GetSkillTargetType(self.heroId, AnimalBase_Define.SkillType.Execute, 1)
					local targetList = GameAI.GetSelectTarget(self, targetType)
					local minDis = 9999

					for k, tmpAnimal in pairs(targetList) do
						if tmpAnimal:IsWillDead() == false and tmpAnimal:IsShow() == true then
							local hitBoxPos = tmpAnimal:GetExecuteHitPosition()
							local tmpDis = Vector3.DistanceSquare(attackBoxPos, hitBoxPos)

							if tmpDis < minDis and self:CheckSkillExecuteEnable(tmpAnimal) == true then
								minDis = tmpDis
								targetAnimal = tmpAnimal
							end
						end
					end
				end

				if targetAnimal ~= nil then
					self.skillExecuteTarget = targetAnimal
					self.skillExecuteAttack = true
				end
			end
		end

		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Execute, self.skillExecuteAttack, self.skillExecuteAttack and self.skillExecuteTarget and self.skillExecuteTarget.animalId or nil)
	end
end

function AnimalBase:CheckSkillExecuteStatusForAI(hitAnimal)
	self.skillExecuteAttack = self:CheckSkillExecuteEnable(hitAnimal)

	if self.skillExecuteAttack == true then
		self.skillExecuteTarget = hitAnimal
	end

	return self.skillExecuteAttack
end

function AnimalBase:ClearSkillExecuteStatus()
	self.skillExecuteAttack = false
	self.skillExecuteTarget = nil
end

function AnimalBase:CheckSkillExecuteEnable(hitAnimal)
	if MS_StoryList.IsStoryCarriage(self.storyId) == true or self:IsHaveSkill(AnimalBase_Define.SkillType.Execute) == false or self:IsPermitExecuteAttack() == false or hitAnimal:IsPermitExecuteHit() == false then
		return false
	end

	local nowForward = self:GetForward()
	local attackBoxPos = self:GetExecuteAttackPosition()
	local hitBoxPos = hitAnimal:GetExecuteHitPosition()
	local tmpDis = Vector3.DistanceSquare(hitBoxPos, attackBoxPos)
	local tmpDisReal = Vector3.DistanceSquare(hitBoxPos, self:GetPosByWorldPos())
	local disMax = AnimalBase_Define.SkillExecuteDistance * AnimalBase_Define.SkillExecuteDistance

	if tmpDisReal < disMax or tmpDis < disMax then
		local tmpAngle = Vector3.Angle(nowForward, hitAnimal:GetBack())

		if tmpAngle < AnimalBase_Define.SkillExecuteAngle and self:CheckSkillExecutePosition(hitAnimal) == true then
			return true
		end
	end

	return false
end

function AnimalBase:CheckSkillExecutePosition(hitAnimal)
	local hitDontMove = false

	if hitAnimal.moveFix == true then
		hitDontMove = true
	end

	local attackNowPos = self:GetPosByWorldPos()
	local attackBoxPos = self:GetExecuteAttackPosition()
	local hitPos = hitAnimal:GetPosByWorldPos()
	local hitBoxPos = hitAnimal:GetExecuteHitPosition()

	if hitDontMove == false then
		local hitDis = Vector3.Distance(hitPos, hitBoxPos)
		local newPos = self:GetForward() * hitDis

		newPos:Add(attackBoxPos)

		local ret = hitAnimal:AdjustPositionByGroundFix(newPos)

		if ret == true then
			ret = hitAnimal:IsRouteCapsuleOverlap(self.animalId, newPos, hitAnimal.routeCapsuleRadius, hitAnimal.routeCapsuleHeight, hitAnimal:GetCharacterColliderLayerMask())

			if ret == false then
				hitAnimal.skillExecuteHitFix = hitDontMove
				newPos = nil

				return true
			end
		end

		newPos = nil
		hitDontMove = true
	end

	if hitDontMove == true then
		local attDis = Vector3.Distance(attackNowPos, attackBoxPos)
		local newPos = hitAnimal:GetForward() * attDis

		newPos:Add(hitBoxPos)

		local ret = self:AdjustPositionByGroundFix(newPos)

		if ret == true then
			ret = self:IsRouteCapsuleOverlap(hitAnimal.animalId, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, self:GetCharacterColliderLayerMask())

			if ret == false then
				hitAnimal.skillExecuteHitFix = hitDontMove
				newPos = nil

				return true
			end
		end

		newPos = nil
	end

	return false
end

function AnimalBase:IsPermitExecuteButton(button, targetAnimal)
	if button == ControllerMain.SkillButton.Light then
		if self.isHost == false then
			return true
		end
	elseif button == ControllerMain.SkillButton.Heavy and self.isHost == false then
		return true
	end

	return false
end

function AnimalBase:IsPermitExecuteAttack()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
		return true
	end

	if self:IsSkilling() == true and self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0 then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if skillData ~= nil and skillData.BtnComboPressType == MS_SkillData.PressType.LongPress and skillData.BtnIndex > 0 then
			return false
		end

		return true
	end

	return false
end

function AnimalBase:IsPermitExecuteHit()
	if self.skillExecuteHitEnable <= 0 then
		return false
	end

	if self:IsWillDead() == true or self:IsShow() == false then
		return false
	end

	if self.parasitic > 0 then
		return false
	end

	if self.lockDisable == true then
		return false
	end

	if self:IsMuteki(nil) == true then
		return false
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		if self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop2 then
			return true
		elseif (self.moveHitType == AnimalBase_Define.HitType.StatusWeak or self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop1) and self.animatorTrigger == AnimalBase_Define.TriggerHit.FollowAttack then
			return true
		end
	end

	if DebugExecuteBackstabDistance == true then
		return true
	end

	return false
end

function AnimalBase:GetExecuteHitPosition()
	local tmpRadius = self.animalExecuteRadius

	if DebugExecuteBackstabDistance == true then
		tmpRadius = DebugParam1
	end

	if tmpRadius > 0 then
		self.skillExecuteHitPosition:SetVector3(self:GetForward())
		self.skillExecuteHitPosition:Mul(tmpRadius)
		self.skillExecuteHitPosition:Add(self:GetPosByWorldPos())
	else
		self.skillExecuteHitPosition:SetVector3(self:GetPosByWorldPos())
	end

	return self.skillExecuteHitPosition
end

function AnimalBase:GetExecuteAttackPosition()
	local skillData = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.Execute, 1)

	self.skillExecuteAttackPosition:SetVector3(self:GetForward())
	self.skillExecuteAttackPosition:Mul(skillData.ColliderRadius)
	self.skillExecuteAttackPosition:Add(self:GetPosByWorldPos())

	return self.skillExecuteAttackPosition
end

function AnimalBase:ReadySkillExecute(hitAnimal)
	local ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Execute, 1, MS_SkillData.PressType.PressDown, ControllerMain.SkillButton.None)

	if ret == true then
		hitAnimal:ReadySkillExecuteHit(self)
		AudioCtrl.SetHeroAudio("skill_108_stinger", self:GetPosByWorldPos(), self.animalId)

		self.skillExecuteReady = true
	end
end

function AnimalBase:ReadySkillExecuteHit(attackAnimal)
	self.skillExecuteHost = attackAnimal
	self.skillExecuteHit = true
end

function AnimalBase:IsReadySkillExecute()
	if self.skillExecuteReady == true then
		return true
	end

	return false
end

function AnimalBase:StartSkillExecute(hitAnimal)
	if self:IsSkilling() == true then
		self:OnSkillEnd(AnimalBase_Define.SkillType.Execute, 1)
	end

	local ret = self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Execute, 1, false)

	if ret == true and hitAnimal ~= nil then
		XCollider.AddRouteColliderIgnore(self.animalId, hitAnimal.animalId)

		if hitAnimal.skillExecuteHitFix == true then
			local hitBoxPos = hitAnimal:GetExecuteHitPosition()
			local attPos = self:GetPosByWorldPos()
			local attackBoxPos = self:GetExecuteAttackPosition()
			local attDis = Vector3.Distance(attPos, attackBoxPos)
			local newPos = hitAnimal:GetForward() * attDis

			newPos:Add(hitBoxPos)
			self:SetPosByWorldPos(newPos, true)
			self:LookAt(hitAnimal:GetBack(), true)

			newPos = nil
		end
	end
end

function AnimalBase:CheckSkillBackstabStatus()
	if self.isHost == true and self.isHostBack == false and self:IsHaveSkill(AnimalBase_Define.SkillType.Backstab) == true then
		self.skillBackstabAttack = false

		if self:IsWillDead() == false and self:IsShow() == true then
			local skillDataBackstab = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.Backstab, 1)

			if skillDataBackstab ~= nil and (skillDataBackstab.SkillTalent <= 0 or self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, skillDataBackstab.SkillIndex, skillDataBackstab.SkillCombo) >= skillDataBackstab.SkillTalent) and self:IsPermitBackstabAttack() == true then
				local targetAnimal

				if self:IsLockingPlayer() == true then
					if self:CheckSkillBackstabEnable(self.skillLockAnimal) == true then
						targetAnimal = self.skillLockAnimal
					end
				else
					local attackBoxPos = self:GetBackstabAttackPosition()
					local targetType = AnimalBase.GetSkillTargetType(self.heroId, AnimalBase_Define.SkillType.Backstab, 1)
					local targetList = GameAI.GetSelectTarget(self, targetType)
					local minDis = 9999

					for k, tmpAnimal in pairs(targetList) do
						if tmpAnimal:IsWillDead() == false and tmpAnimal:IsShow() == true then
							local hitBoxPos = tmpAnimal:GetBackstabHitPosition()
							local tmpDis = Vector3.DistanceSquare(attackBoxPos, hitBoxPos)

							if tmpDis < minDis and self:CheckSkillBackstabEnable(tmpAnimal) == true then
								minDis = tmpDis
								targetAnimal = tmpAnimal
							end
						end
					end
				end

				if targetAnimal ~= nil then
					self.skillBackstabTarget = targetAnimal
					self.skillBackstabAttack = true
				end
			end
		end

		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Backstab, self.skillBackstabAttack, self.skillBackstabAttack and self.skillBackstabTarget and self.skillBackstabTarget.animalId or nil)
	end
end

function AnimalBase:CheckSkillBackstabStatusForAI(hitAnimal)
	self.skillBackstabAttack = self:CheckSkillBackstabEnable(hitAnimal)

	if self.skillBackstabAttack == true then
		self.skillBackstabTarget = hitAnimal
	end

	return self.skillBackstabAttack
end

function AnimalBase:ClearSkillBackstabStatus()
	self.skillBackstabAttack = false
	self.skillBackstabTarget = nil
end

function AnimalBase:CheckSkillBackstabEnable(hitAnimal)
	if MS_StoryList.IsStoryCarriage(self.storyId) == true or self:IsHaveSkill(AnimalBase_Define.SkillType.Backstab) == false or self:IsPermitBackstabAttack() == false or hitAnimal:IsPermitBackstabHit() == false then
		return false
	end

	local nowForward = self:GetForward()
	local attackBoxPos = self:GetBackstabAttackPosition()
	local hitBoxPos = hitAnimal:GetBackstabHitPosition()
	local tmpDis = Vector3.DistanceSquare(hitBoxPos, attackBoxPos)
	local tmpDisReal = Vector3.DistanceSquare(hitBoxPos, self:GetPosByWorldPos())
	local disMax = AnimalBase_Define.SkillBackstabDistance * AnimalBase_Define.SkillBackstabDistance

	if tmpDisReal < disMax and tmpDis < disMax then
		local tmpAngle = Vector3.Angle(nowForward, hitAnimal:GetForward())

		if tmpAngle < AnimalBase_Define.SkillBackstabAngle and self:CheckSkillBackstabPosition(hitAnimal) == true then
			return true
		end
	end

	return false
end

function AnimalBase:CheckSkillBackstabPosition(hitAnimal)
	local hitDontMove = false

	if hitAnimal.moveFix == true then
		hitDontMove = true
	end

	local attackNowPos = self:GetPosByWorldPos()
	local attackBoxPos = self:GetBackstabAttackPosition()
	local hitPos = hitAnimal:GetPosByWorldPos()
	local hitBoxPos = hitAnimal:GetBackstabHitPosition()

	if hitDontMove == false then
		local hitDis = Vector3.Distance(hitPos, hitBoxPos)
		local newPos = self:GetForward() * hitDis

		newPos:Add(attackBoxPos)

		local ret = hitAnimal:AdjustPositionByGroundFix(newPos)

		if ret == true then
			ret = hitAnimal:IsRouteCapsuleOverlap(self.animalId, newPos, hitAnimal.routeCapsuleRadius, hitAnimal.routeCapsuleHeight, hitAnimal:GetCharacterColliderLayerMask())

			if ret == false then
				hitAnimal.skillBackstabHitFix = hitDontMove
				newPos = nil

				return true
			end
		end

		hitDontMove = true
		newPos = nil
	end

	if hitDontMove == true then
		local attDis = Vector3.Distance(attackNowPos, attackBoxPos)
		local newPos = hitAnimal:GetBack() * attDis

		newPos:Add(hitBoxPos)

		local ret = self:AdjustPositionByGroundFix(newPos)

		if ret == true then
			ret = self:IsRouteCapsuleOverlap(hitAnimal.animalId, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, self:GetCharacterColliderLayerMask())

			if ret == false then
				hitAnimal.skillBackstabHitFix = hitDontMove
				newPos = nil

				return true
			end
		end

		newPos = nil
	end

	return false
end

function AnimalBase:IsPermitBackstabButton(button, targetAnimal)
	if button == ControllerMain.SkillButton.Light then
		if self.isHost == false then
			return true
		end
	elseif button == ControllerMain.SkillButton.Heavy and self.isHost == false then
		return true
	end

	return false
end

function AnimalBase:IsPermitBackstabAttack()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
		return true
	end

	if self:IsSkilling() == true and self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0 then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if skillData ~= nil and skillData.BtnComboPressType == MS_SkillData.PressType.LongPress and skillData.BtnIndex > 0 then
			return false
		end

		return true
	end

	return false
end

function AnimalBase:IsPermitBackstabHit()
	if self.skillBackstabHitEnable <= 0 then
		return false
	end

	if self:IsWillDead() == true or self:IsShow() == false then
		return false
	end

	if self.parasitic > 0 then
		return false
	end

	if self:IsMuteki(nil) == true then
		return false
	end

	if self:GetAITarget() ~= nil and self:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:IsHitByType(AnimalBase_Define.HitType.StatusWeakLoop1) == false and self:IsHitByType(AnimalBase_Define.HitType.StatusWeakLoop2) == false then
		return false
	end

	return true
end

function AnimalBase:GetBackstabHitPosition()
	local tmpRadius = self.animalBackstabRadius

	if DebugExecuteBackstabDistance == true then
		tmpRadius = DebugParam1
	end

	if tmpRadius > 0 then
		self.skillBackstabHitPosition:SetVector3(self:GetBack())
		self.skillBackstabHitPosition:Mul(tmpRadius)
		self.skillBackstabHitPosition:Add(self:GetPosByWorldPos())
	else
		self.skillBackstabHitPosition:SetVector3(self:GetPosByWorldPos())
	end

	return self.skillBackstabHitPosition
end

function AnimalBase:GetBackstabAttackPosition()
	local skillData = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.Backstab, 1)

	self.skillBackstabAttackPosition:SetVector3(self:GetForward())
	self.skillBackstabAttackPosition:Mul(skillData.ColliderRadius)
	self.skillBackstabAttackPosition:Add(self:GetPosByWorldPos())

	return self.skillBackstabAttackPosition
end

function AnimalBase:ReadySkillBackstab(hitAnimal)
	local ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Backstab, 1, MS_SkillData.PressType.PressDown, ControllerMain.SkillButton.None)

	if ret == true then
		hitAnimal:ReadySkillBackstabHit(self)
		AudioCtrl.SetHeroAudio("skill_107_stinger", self:GetPosByWorldPos(), self.animalId)

		self.skillBackstabReady = true
	end
end

function AnimalBase:ReadySkillBackstabHit(attackAnimal)
	self.skillBackstabHost = attackAnimal
	self.skillBackstabHit = true
end

function AnimalBase:IsReadySkillBackstab()
	if self.skillBackstabReady == true then
		return true
	end

	return false
end

function AnimalBase:StartSkillBackstab(hitAnimal)
	if self:IsSkilling() == true then
		self:OnSkillEnd(AnimalBase_Define.SkillType.Backstab, 1)
	end

	local ret = self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, AnimalBase_Define.SkillType.Backstab, 1, false)

	if ret == true and hitAnimal ~= nil then
		XCollider.AddRouteColliderIgnore(self.animalId, hitAnimal.animalId)

		if hitAnimal.skillBackstabHitFix == true then
			local hitBoxPos = hitAnimal:GetBackstabHitPosition()
			local attPos = self:GetPosByWorldPos()
			local attackBoxPos = self:GetBackstabAttackPosition()
			local attDis = Vector3.Distance(attPos, attackBoxPos)
			local newPos = hitAnimal:GetBack() * attDis

			newPos:Add(hitBoxPos)
			self:SetPosByWorldPos(newPos, true)
			self:LookAt(hitAnimal:GetForward(), true)

			newPos = nil
		end
	end
end

function AnimalBase:ChangeMoveSkillState(state, skillIndex, skillCombo, isDelay)
	local tmpSkillIndex = self.skillIndex
	local tmpSkillCombo = self.skillCombo

	self.skillIndex = skillIndex
	self.skillCombo = skillCombo

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if skillData == nil then
		return
	end

	if self.skillIndex == AnimalBase_Define.SkillType.Dodge or self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump or self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial then
		self:ApplyDodgeDirection()
	elseif skillData.SkillForward > 0 then
		self:ApplySkillForwardDirection()
	end

	local ret = self:ChangeMoveState(state, AnimalBase_Define.MoveStateChangeLevel.High)

	if ret == true then
		self.animatorOffsetTime = MS_AnimalAnimator.GetAnimatorOffsetTime(self.heroId, self.animatorStateHash)

		self:OnSkillStart()

		if (self.skillIndex == AnimalBase_Define.SkillType.Dodge or self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump or self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial) and (self:IsLockingPlayer() == false or self.skillLockAnimal == nil) then
			self.moveDirDodge.y = 0

			if MathHelper.IsZero(self.moveDirDodge.sqrMagnitude) == false then
				self:LookAt(self.moveDirDodge, true)
			end
		end

		if skillData.SkillAim == AnimalBase_Define.AimMode.Aim then
			self:ReadyAim()

			local lookPos = self:GetSkillButtonTarget()

			self:SetSkillAimTarget(lookPos)

			if self.isHost == true then
				self:SetSkillOrientation(lookPos)
			end

			self:StartAim()

			if self.isHost == true then
				self.cameraScene:SetFollowingType(CameraMain.FollowingType.AimEnter)
			end
		elseif skillData.SkillAim == AnimalBase_Define.AimMode.AimEnd and self:IsAimMode() == true then
			self:EndAimControl()
			self:EndAimDelay()
		end

		self:ResetAnimator(0)
	else
		self.skillIndex = tmpSkillIndex
		self.skillCombo = tmpSkillCombo
	end

	return ret
end

function AnimalBase:ChangeSkillState(state, tmpSkillIndex, tmpSkillCombo, pressType, button)
	if self:IsWillDead() == true or self:IsOnStair() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		return false
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		if self:IsSkillButtonRefresh() == false then
			return false
		end

		if self:IsSkillHitComboEnable(tmpSkillIndex, self.moveHitType) == false then
			return false
		end
	end

	if state == AnimalBase_Define.MoveStateType.Skill then
		if tmpSkillCombo == 1 and (self:IsSkilling() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.Hit) then
			local skillData = MS_SkillData.GetSkillData(self.heroId, tmpSkillIndex, tmpSkillCombo)

			if skillData.NoActionInSkill > 0 then
				self:OnSkillStartNoAction(tmpSkillIndex, 1)

				return true
			end
		end

		if tmpSkillIndex == AnimalBase_Define.SkillType.Drop and self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
			local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, 1)

			if haveEnergy == true then
				self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, 1, pressType, button)
				self:ResetDodgeDirection()

				return true
			end
		end

		if tmpSkillIndex == AnimalBase_Define.SkillType.Execute and tmpSkillCombo == 1 then
			if self:IsPermitExecuteAttack() == true then
				return true
			end

			return false
		end

		if tmpSkillIndex == AnimalBase_Define.SkillType.Backstab and tmpSkillCombo == 1 then
			if self:IsPermitBackstabAttack() == true then
				return true
			end

			return false
		end

		if self:IsSkilling() == true then
			if self.skillIndex == AnimalBase_Define.SkillType.CounterAttack then
				local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, tmpSkillCombo)

				if haveEnergy == true then
					self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, tmpSkillCombo, pressType, button)
					self:ResetDodgeDirection()

					return true
				end
			end

			if self.skillIndex ~= tmpSkillIndex then
				local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, tmpSkillCombo)

				if haveEnergy == true then
					self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, tmpSkillCombo, pressType, button)
					self:ResetDodgeDirection()

					return true
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
				if self.skillCombo < self.animalConfig.skillComboMax[tmpSkillIndex] then
					if tmpSkillCombo <= self.animalConfig.skillComboMax[tmpSkillIndex] then
						local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, tmpSkillCombo)

						if haveEnergy == true then
							self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, tmpSkillCombo, pressType, button)
							self:ResetDodgeDirection()

							return true
						end
					end
				else
					local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, 1)

					if haveEnergy == true then
						self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, 1, pressType, button)
						self:ResetDodgeDirection()

						return true
					end
				end
			else
				local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, 1)

				if haveEnergy == true then
					self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, 1, pressType, button)
					self:ResetDodgeDirection()

					return true
				end
			end
		elseif state > self.moveStateNow or self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
			local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndex, 1)

			if haveEnergy == true then
				self:AddSkillNext(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndex, 1, pressType, button)
				self:ResetDodgeDirection()

				return true
			end
		end
	end

	return false
end

function AnimalBase:StopSkill()
	self.skillStop = true
end

function AnimalBase:AddSkillNextWaitTime(skillIndex, delayTime)
	if delayTime > 0 and skillIndex > 0 then
		self.skillNextId = skillIndex
		self.skillNextWaitTimeStart = TimeHelper.getNowTime()
		self.skillNextWaitTime = delayTime
	end
end

function AnimalBase:IsSkillNextWait()
	if self.skillNextWaitTimeStart > 0 and self.skillNextId > 0 then
		return true
	end

	return false
end

function AnimalBase:CheckSkillNext()
	if self.skillStop == true and self:IsSkilling() == true then
		self:ResetState()

		self.skillNextWaitTimeStart = 0
		self.skillNextWaitTime = 0
		self.skillNextId = 0
	end

	self.skillStop = false

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Born then
		return
	end

	if self.skillNextWaitTimeStart > 0 and self.skillNextId > 0 and self:IsSkilling() == false then
		local nowTime = TimeHelper.getNowTime()

		if nowTime - self.skillNextWaitTimeStart > self.skillNextWaitTime then
			local ret = self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillNextId, 1, MS_SkillData.PressType.PressDown, ControllerMain.SkillButton.None)

			if ret == true then
				self.skillNextWaitTimeStart = 0
				self.skillNextWaitTime = 0
				self.skillNextId = 0
			end
		end
	end
end

function AnimalBase:IsHaveSkillNext(skillIndex, skillCombo)
	for i = 1, #self.skillNextList do
		local tmpSkillIndex = self.skillNextList[i][1]
		local tmpSkillCombo = self.skillNextList[i][2]

		if tmpSkillIndex == skillIndex and tmpSkillCombo == skillCombo then
			return true
		end
	end

	return false
end

function AnimalBase:GetSkillNext()
	local retSkillIndex = 0
	local retSkillCombo = 0

	if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill then
		local priority = -1

		for i = 1, #self.skillNextList do
			local tmpSkillIndex = self.skillNextList[i][1]
			local tmpSkillCombo = self.skillNextList[i][2]
			local tmpPermit = true
			local skillData = MS_SkillData.GetSkillData(self.heroId, tmpSkillIndex, tmpSkillCombo)

			if skillData ~= nil then
				if self:IsSkilling() == true and skillData.BtnComboPressType == MS_SkillData.PressType.LongPress and skillData.BtnIndex > 0 then
					local buttonLongPress = self:GetLongPressButton()

					if buttonLongPress <= 0 or buttonLongPress ~= skillData.BtnIndex then
						tmpPermit = false
					end
				end

				if tmpPermit == true and priority < skillData.SkillPriority then
					retSkillIndex = tmpSkillIndex
					retSkillCombo = tmpSkillCombo
					priority = skillData.SkillPriority
				end
			end
		end
	end

	return retSkillIndex, retSkillCombo
end

function AnimalBase:AddSkillNext(state, skillIndex, skillCombo, pressType, button)
	if state == AnimalBase_Define.MoveStateType.Skill then
		local find = false
		local refresh = false
		local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

		if skillData == nil then
			return
		end

		local addPriority = skillData.SkillAddPriority

		for i = 1, #self.skillNextList do
			local tmpSkillIndex = self.skillNextList[i][1]
			local tmpSkillCombo = self.skillNextList[i][2]
			local tmpPressType = self.skillNextList[i][3]
			local tmpButton = self.skillNextList[i][4]
			local tmpAddPriority = self.skillNextList[i][5]

			if tmpSkillIndex == skillIndex and tmpSkillCombo == skillCombo then
				find = true

				break
			end

			if tmpButton ~= button then
				refresh = true

				break
			elseif pressType == tmpPressType and tmpAddPriority > 0 and addPriority > 0 then
				if addPriority <= tmpAddPriority then
					return
				else
					self.skillNextList[i][1] = skillIndex
					self.skillNextList[i][2] = skillCombo
					self.skillNextList[i][3] = pressType
					self.skillNextList[i][4] = button
					self.skillNextList[i][5] = addPriority

					break
				end
			end
		end

		if refresh == true then
			self.skillNextList = {}

			table.insert(self.skillNextList, {
				skillIndex,
				skillCombo,
				pressType,
				button,
				addPriority
			})
		elseif find == false then
			table.insert(self.skillNextList, {
				skillIndex,
				skillCombo,
				pressType,
				button,
				addPriority
			})
		end

		if #self.skillNextList > 0 then
			self.moveStateNext = state
		else
			self.moveStateNext = 0
		end
	end
end

function AnimalBase:SetSkillLastHitBehind(flg)
	self.skillLastHitBehind = flg
end

function AnimalBase:ChangeMoveState(state, changeLevel)
	local oldState = self.moveStateNow
	local change = false
	local oldInStair = self:IsOnStair()

	if changeLevel == AnimalBase_Define.MoveStateChangeLevel.Low then
		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dead then
			if state > self.moveStateNow then
				change = true
			else
				local isRunExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit)

				if isRunExit > 0 then
					change = true
				end
			end
		end
	elseif changeLevel == AnimalBase_Define.MoveStateChangeLevel.LowAndEqual then
		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dead then
			if state >= self.moveStateNow then
				change = true
			else
				local isRunExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit)

				if isRunExit > 0 then
					change = true
				end
			end
		end
	elseif changeLevel == AnimalBase_Define.MoveStateChangeLevel.High then
		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dead then
			change = true
		end
	elseif changeLevel == AnimalBase_Define.MoveStateChangeLevel.Force then
		change = true
	end

	if change == true then
		local isInSkillOld = self:IsSkilling()
		local tmpSkillIndexOld, tmpSkillComboOld = self:GetSkillingData()
		local isOnStairOld = self:IsOnStair()

		if isInSkillOld == true and state ~= AnimalBase_Define.MoveStateType.Skill and state ~= AnimalBase_Define.MoveStateType.SkillRecovery then
			self:OnSkillEnd(0, 0)
		end

		self.moveStateNow = state

		self:ResetMoveStateNext()
		self:ResetAnimatorState()

		self.skillExecuteReady = false
		self.skillBackstabReady = false

		if oldState ~= self.moveStateNow then
			self.moveStateRecovery = oldState
			self.animatorStateStartTime = TimeHelper.getNowTime()

			if self:IsOnStair() == false and isOnStairOld == true then
				if self.isHost == true then
					self:SetCharacterBodyIKEnable(true)
					self.cameraScene:ReturnFollowingBase(false, false, CameraMain.CameraSmoothTimeMax)
					self:ClearSkillButtonAll()
				end
			elseif self:IsOnStair() == true and isOnStairOld == false and self.isHost == true then
				self:SetCharacterBodyIKEnable(false)
			end

			if self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLineMove and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLinePrev and oldState ~= AnimalBase_Define.MoveStateType.TimeLine and oldState ~= AnimalBase_Define.MoveStateType.TimeLineMove and oldState ~= AnimalBase_Define.MoveStateType.TimeLineMoveForce and oldState ~= AnimalBase_Define.MoveStateType.StoryEnterMove then
				self:ResetAnimator(0)
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Revert then
				self.animatorIsLeft = self:IsLeftFootBehind()

				if self.animatorIsLeft == true then
					self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.IsLeft, 1, 0, 0)
				else
					self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.IsLeft, 0, 0, 0)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
				self.moveStateDebugFly = true

				if self.isHost == true then
					self.cameraScene:LockPosition(false)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
				self.moveDropDamageHeight = 0
			end

			self.skillExtendIndex = 0
			self.skillExtendCombo = 0
			self.skillExtendTime = 0

			if oldState == AnimalBase_Define.MoveStateType.Skill then
				if self.moveStateNow == AnimalBase_Define.MoveStateType.Move or self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery then
					self.skillExtendIndex = tmpSkillIndexOld
					self.skillExtendCombo = tmpSkillComboOld
					self.skillExtendTime = TimeHelper.getNowTime()
				end
			elseif oldState == AnimalBase_Define.MoveStateType.Hit then
				self:OnHitExit()
			elseif oldState == AnimalBase_Define.MoveStateType.TouchGround then
				self:OnTouchGroundFinish()
			elseif oldState == AnimalBase_Define.MoveStateType.Dialog then
				self:ExitDialog()
			elseif oldState == AnimalBase_Define.MoveStateType.Special then
				self:ExitSpecial()
			elseif oldState == AnimalBase_Define.MoveStateType.Get then
				self:ExitGet()
			elseif self:IsEvent(oldState) == true and self:IsEventLoop(self.moveStateNow) == false and self:IsEventEnd(self.moveStateNow) == false then
				self:ExitEvent()
			elseif self:IsEventLoop(oldState) == true and self:IsEventEnd(self.moveStateNow) == false then
				self:ExitEvent()
			elseif self:IsEventEnd(oldState) == true then
				self:ExitEvent()
			elseif oldState == AnimalBase_Define.MoveStateType.Reborn then
				self:ExitReborn()
			elseif oldState == AnimalBase_Define.MoveStateType.Born then
				self:ExitBorn()
			elseif oldState == AnimalBase_Define.MoveStateType.Fly then
				self.moveStateDebugFly = false
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
				if isInSkillOld == true then
					self:ClearSkillEffectAll()
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
				if isInSkillOld == true then
					self:ClearSkillEffectAll()
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartReady then
				if self.isHost == true then
					self.cameraScene:SetFollowingType(CameraMain.FollowingType.StairEnter)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 then
				if self.isHost == true then
					self.cameraScene:SetFollowingType(CameraMain.FollowingType.StairExit)
				end
			elseif self:IsStairClimbing() == true and self.isHost == true then
				self.cameraScene:SetFollowingType(CameraMain.FollowingType.Stair)
			end

			if self:IsOnStair() == true then
				self:PlayStairAudio()
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Hit or self.moveStateNow == AnimalBase_Define.MoveStateType.Special then
			local resetTime = 0

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
				resetTime = self:OnHitReset()
			end

			self:ResetAnimator(resetTime)
		end
	else
		return false
	end

	return true
end

function AnimalBase:ResetDialogPosAndRot()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog then
		self:SetPosByWorldPos(self.moveDialogPos, true)
		self:LookAt(self.moveDialogLook, true)
	end
end

function AnimalBase:RecordPosAndRotBeforeDialog(bool)
	self.resetPosAndRotAfterDialog = bool

	if bool then
		self.beforeDialogPos = self:GetPosByWorldPos():Clone()
		self.beforeDialogLook = self:GetForward():Clone()
	else
		self.beforeDialogPos = nil
		self.beforeDialogLook = nil
	end
end

function AnimalBase:ResetPosAndRotAfterDialog()
	if self.resetPosAndRotAfterDialog then
		self.resetPosAndRotAfterDialog = false

		if self.beforeDialogPos ~= nil and self.beforeDialogLook ~= nil then
			self:SetPosByWorldPos(self.beforeDialogPos, true)
			self:LookAt(self.beforeDialogLook, true)

			self.beforeDialogPos = nil
			self.beforeDialogLook = nil
		end
	end
end

function AnimalBase:ChangeToDialog(pos, look)
	local ret = false

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Dialog, AnimalBase_Define.MoveStateChangeLevel.High)

		if ret == true then
			self:SetDynamicBoneEnabled(false)
			self.moveDialogPos:SetVector3(pos)
			self:SetPosByWorldPos(self.moveDialogPos, true)
			self.moveDialogLook:SetVector3(look)
			self:LookAt(self.moveDialogLook, true)

			self.moveBattleMode = 0

			if self.tfLipSync ~= nil then
				self.tfLipSync.gameObject:SetActive(true)
			end

			if self.finalIkLookAtIK ~= nil then
				self.finalIkLookAtIK.enabled = true
			end

			self:SetLookAtIkEnabled(true)
			self:PauseStatusAll()
			self:ClearSkillEffectAll()
			self:ClearSkillEffectLoopAll()
			self:StopSkillAudio()
			self:ClearLockPlayer()
			self:ClearSkillButtonAll()
			self:ClearMoveButtonAll()
		end
	end

	return ret
end

function AnimalBase:SetLookAtIkEnabled(bool)
	if self.lookAtController ~= nil then
		self.lookAtController.enabled = bool
	end
end

function AnimalBase:StopDialog()
	local ret = false

	if self.moveStateRecovery == AnimalBase_Define.MoveStateType.Special then
		ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Special, AnimalBase_Define.MoveStateChangeLevel.High)
	else
		ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
	end

	if ret == true then
		self:StopMovementImmediately(true)
		self:UpdateAnimatorRender()
	end
end

function AnimalBase:ExitDialog()
	if self.exitFlg == true then
		return
	end

	self:ResumeStatusAll()
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
	self:StopMovementImmediately(true)

	self.moveBattleMode = 0
	self.moveBattleEndTime = 0

	self:SetDynamicBoneEnabled(true)

	if self.tfLipSync ~= nil then
		self.tfLipSync.gameObject:SetActive(false)
	end

	if self.finalIkLookAtIK ~= nil then
		self.finalIkLookAtIK.enabled = false
	end

	self:SetLookAtIkEnabled(false)
end

function AnimalBase:PlayLipSyn(id, fmodInstance)
	local lipData = DialogueManager.GetLip(id)

	if lipData ~= nil and self.characterLipSync ~= nil and fmodInstance ~= nil then
		self.characterLipSync:Play(lipData, fmodInstance)
	end
end

function AnimalBase:StopLipSyn(stopAudio)
	local ret = false

	if self.characterLipSync ~= nil then
		ret = self.characterLipSync:Stop(stopAudio)
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog then
		XAnimator.PlayAnimator(self.animalId, MS_AnimalAnimator.GetStateNameHash(AnimalBase_Define.AnimatorStateDialogue), 0, 0, 0.2, 0, false)
	end

	return ret
end

function AnimalBase:ExitSpecial()
	return
end

function AnimalBase:ChangeToSpecial(id)
	if self.isHost == false then
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
	end

	self.animatorSpecialId = id
	self.moveBattleMode = 0
	self.moveStateNextSpecial = AnimalBase_Define.MoveStateType.Special

	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
end

function AnimalBase:ChangeToTransferStart()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.gameController:TransferReady() == true then
		local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.TransferStart, AnimalBase_Define.MoveStateChangeLevel.High)

		if ret == true then
			self:ClearSkillButtonAll()
			self:ClearMoveButtonAll()
		end

		return ret
	end

	return false
end

function AnimalBase:ChangeToTransferEnd(portalId)
	if portalId > 0 then
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			self:SetPosByWorldPos(FS_UserData.story:GetRebornPos(), true)
			self:LookAt(FS_UserData.story:GetRebornLook(), true)

			self.eventTransferEnd = true
		else
			local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + portalId)

			if locatorData ~= nil then
				self:SetPosByWorldPos(locatorData.Position, true)
				self:LookAt(locatorData.Orientation, true)

				self.eventTransferEnd = true
			end
		end
	end
end

function AnimalBase:HandleTransfer()
	if self.eventTransferEnd == true then
		local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.TransferEnd, AnimalBase_Define.MoveStateChangeLevel.High)

		if ret == true then
			self.moveBattleMode = 0

			self:ClearSkillButtonAll()
			self:ClearMoveButtonAll()
		end

		self.eventTransferEnd = false
	end
end

function AnimalBase:IsInTimeLine()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev then
		return true
	end

	return false
end

function AnimalBase:ChangeToTimeLineMove(pos, rot)
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()

	local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.TimeLineMove, AnimalBase_Define.MoveStateChangeLevel.High)

	if ret == true then
		self.moveTimeLineTargetPos:SetVector3(pos)
		self.moveTimeLineTargetRot:SetQuaternion(rot)
		self.moveTimeLineDir:SetVector3(self.moveTimeLineTargetPos)
		self.moveTimeLineDir:Sub(self:GetPosByWorldPos())
		self:ClearLockPlayer()
		self:SetDynamicBoneEnabled(false)
		self:PauseStatusAll()
	end

	return ret
end

function AnimalBase:ChangeToTimeLine(transition)
	if transition == false then
		self:ClearSkillButtonAll()
		self:ClearMoveButtonAll()
	end

	local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.TimeLinePrev, AnimalBase_Define.MoveStateChangeLevel.Force)

	if ret == true then
		if transition == false then
			self:StopMovementImmediately(true)
			self:UpdateAnimatorRender()
			self:SetDynamicBoneEnabled(false)
		end

		self:ClearLockPlayer()
		self:PauseStatusAll()
		self:CheckCameraPenetrate()
		self:UpdateRenderVisible()
	end

	return ret
end

function AnimalBase:SetDistanceThreshold(dis)
	if self.characterMove ~= nil then
		self.characterMove:SetDistanceThreshold(dis)
	end
end

function AnimalBase:SetBattleMode(flg)
	if flg == true then
		self.moveBattleMode = 1
	else
		self.moveBattleMode = 0
	end

	self.moveBattleEndTime = TimeHelper.getNowTime() + AnimalBase_Define.MotionBattleModeToNormalTime
end

function AnimalBase:ExitTimeLine()
	if self.exitFlg == true then
		return
	end

	self:SetMoveGhost(false)
	self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
	self.moveDirLookAt:SetVector3(self:GetForward())
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
	self:SetDynamicBoneEnabled(true)
	self:ResumeStatusAll()

	if self:GetHeroExtAIId() ~= GameAI.BehaviourMode.DoNotAttack and self:GetHeroExtAIId() ~= GameAI.BehaviourMode.Guide then
		self:SetMoveFix(false)
	end
end

function AnimalBase:PressResetState()
	self.eventResetState = true
end

function AnimalBase:HandleResetState()
	if self.eventResetState == true then
		self:ClearLockPlayer()
		self:ClearSkillButtonAll()
		self:ClearMoveButtonAll()
		self:ResetState()

		self.eventResetState = false
	end
end

function AnimalBase:ChangeToMap()
	return
end

function AnimalBase:IsReadyNightmareEnd()
	if self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == false then
		return false
	end

	if self:IsDead() == true then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Move then
		return false
	end

	if self:GetAITarget() ~= nil then
		return false
	end

	return true
end

function AnimalBase:ChangeToNightmareEnd()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareEnd then
		return
	end

	self.nightmareEndReady = true
end

function AnimalBase:IsReadyCallEnd(force)
	if self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == false then
		return false
	end

	if self:IsDead() == true then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Move then
		return false
	end

	if force == false then
		if self:IsHostTeam() == true then
			if self:GetAICompanion() ~= nil then
				return false
			end
		elseif self:GetAITarget() ~= nil then
			return false
		end
	end

	return true
end

function AnimalBase:IsStateCallEnd()
	if self.callEndReady == true or self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd then
		return true
	end

	return false
end

function AnimalBase:ChangeToCallEnd()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd then
		return
	end

	self.callEndReady = true
end

function AnimalBase:SetMonsterNotNormal(flg)
	if flg == true then
		if self.sanMonsterCrazyEffect == nil and self.tfBoneChest ~= nil then
			self.sanMonsterCrazyEffect = VfxManager.PlayBindMulti(self.tfBoneChest, AnimalBase_Define.VfxName_MonsterCrazy)

			if self.sanMonsterCrazyEffect ~= nil then
				self.sanMonsterCrazyEffect:SetRotation(0, 0, 0, 1)
			end
		end
	else
		if self.sanMonsterCrazyEffect ~= nil then
			self.sanMonsterCrazyEffect:Clear()
		end

		self.sanMonsterCrazyEffect = nil
	end
end

function AnimalBase:OnDissolveEnd()
	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
		self:SkillDeadReady(AnimalBase_Define.DeadReason.Skill)
	elseif self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true or self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == true then
		self:Hide()
	end
end

function AnimalBase:DissolveEnd(time)
	self.dissolveShow = false
	self.dissolveStartTime = TimeHelper.getNowTime()
	self.dissolveEndTime = self.dissolveStartTime + time
end

function AnimalBase:DissolveStart(time)
	self.dissolveShow = true
	self.dissolveStartTime = TimeHelper.getNowTime()
	self.dissolveEndTime = self.dissolveStartTime + time

	self:ChangeMaterial(self.loadCharacterManager:GetSanMaterial())
	self:ChangeDissolveThreshold(1)
	self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
end

function AnimalBase:SetCallFromAnimal(animalId, heroId)
	self.callFromAnimalId = animalId
	self.callFromHeroId = heroId
end

function AnimalBase:ResetDodgeDirection()
	return
end

function AnimalBase:ApplyDodgeDirection()
	if self.moveFlg == true then
		self.moveDirDodge:SetVector3(self.moveDir)

		if self:IsLockingPlayer() == true then
			if self.isHost == true and self.cameraScene ~= nil then
				local camRotInverse = self.cameraScene:GetCameraRotationInverse()

				self.moveDirLocalDodge:SetVector3(self.moveDir)
				self.moveDirLocalDodge:MulQuat(camRotInverse)
				self.moveDirLocalDodge:SetNormalize()
			else
				self.moveDirLocalDodge:SetVector3(self.moveDir)
				self.moveDirLocalDodge:MulQuat(self:GetRotationInverse())
				self.moveDirLocalDodge:SetNormalize()
			end
		else
			self.moveDirLocalDodge:SetVector3(Vector3.s_forward)
		end
	else
		self.moveDirDodge:SetVector3(self:GetForward())
		self.moveDirLocalDodge:SetVector3(Vector3.s_back)
	end
end

function AnimalBase:ApplySkillForwardDirection()
	self.moveDirSkillForward = 0

	if self.moveFlg == true then
		local dot = Vector3.Dot(self.moveDir, self:GetForward())

		if dot > 0 then
			self.moveDirSkillForward = 1
		else
			self.moveDirSkillForward = -1
		end
	end
end

function AnimalBase:ResetAnimator(resetTime)
	self.animatorTrigger = 0
	self.animatorGround = 0
	self.animatorParry = 0
	self.animatorTime = 0
	self.animatorTimeLast = 0
	self.animatorLoop = self:IsAnimatorLoop()
	self.animatorLoopCnt = 0
	self.animatorLoopCntLast = 0
	self.animatorOffsetStart = false
	self.animatorReset = true
	self.animatorResetTime = resetTime
	self.animatorEnd = false
end

function AnimalBase:ResetMoveStateNext()
	if self.skillNextList ~= nil and #self.skillNextList > 0 or self.moveStateNext ~= 0 then
		self.moveStateNext = 0
		self.skillNextList = {}
	end
end

function AnimalBase:UpdateAnimatorFrame()
	self.animatorTimeLast = self.animatorTime
	self.animatorLoopCntLast = self.animatorLoopCnt
	self.animatorTime, self.animatorFrame, self.animatorInTransition = XAnimator.GetTime(self.animalId, self.animatorLayer, self.animatorFrame, self.animatorInTransition)
	self.animatorLoop = self:IsAnimatorLoop()
	self.animatorEnd = false

	if self.animatorLoop == false then
		if self.animatorTime >= 1 then
			self.animatorTime = 1
			self.animatorEnd = true
		end
	elseif self.animatorTime > 1 then
		local loopCnt = MathHelper.ToIntCut(self.animatorTime)

		self.animatorTime = self.animatorTime - loopCnt

		if loopCnt > self.animatorLoopCnt then
			self.animatorLoopCnt = loopCnt
			self.animatorTrigger = 0
			self.animatorParry = 0

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
				self:OnSkillLoopEnd()
			end
		end
	end
end

function AnimalBase:IsAnimatorLoop()
	return MS_AnimalAnimator.IsAnimatorLoop(self.heroId, self.animatorStateHash)
end

function AnimalBase:GetAnimatorOffsetAndBlendTime(stateHash)
	local offsetTime = -1
	local blendEndTime = -1

	if self:IsSkillingSkill() == true then
		local offsetIndex = 0
		local blendEndIndex = 1

		if self.moveStateOld == AnimalBase_Define.MoveStateType.Skill and self.skillIndexOld > 0 and self.skillComboOld > 0 and (self.skillIndex ~= self.skillIndexOld or self.skillCombo ~= self.skillComboOld) then
			local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, self.skillIndexOld, self.skillComboOld, self.skillIndex, self.skillCombo)

			if skillChainData ~= nil then
				offsetIndex = skillChainData.SkillOffset
				blendEndIndex = skillChainData.SkillBlend
			end
		end

		offsetTime = self:GetAnimatorParamTime(AnimalBase_Define.ParamType.SkillOffset, offsetIndex)
		blendEndTime = self:GetAnimatorParamTime(AnimalBase_Define.ParamType.SkillBlend, blendEndIndex)
	elseif self:IsHit() == true then
		if self.moveHitType == AnimalBase_Define.HitType.StatusWeak and (self.moveHitTypeOld == AnimalBase_Define.HitType.Toward or self.moveHitTypeOld == AnimalBase_Define.HitType.BodyBreak or self.moveHitTypeOld == AnimalBase_Define.HitType.FrontFly or self.moveHitTypeOld == AnimalBase_Define.HitType.FrontFlyFar or self.moveHitTypeOld == AnimalBase_Define.HitType.FrontFlyCrow or self.moveHitTypeOld == AnimalBase_Define.HitType.BackFly or self.moveHitTypeOld == AnimalBase_Define.HitType.BackFlyFar or self.moveHitTypeOld == AnimalBase_Define.HitType.BackFlyCrow or self.moveHitTypeOld == AnimalBase_Define.HitType.Up or self.moveHitTypeOld == AnimalBase_Define.HitType.Down or self.moveHitTypeOld == AnimalBase_Define.HitType.DefenceBreak or self.moveHitTypeOld == AnimalBase_Define.HitType.LeftHandWeak or self.moveHitTypeOld == AnimalBase_Define.HitType.RightHandWeak or self.moveHitTypeOld == AnimalBase_Define.HitType.LeftHand or self.moveHitTypeOld == AnimalBase_Define.HitType.RightHand) then
			offsetTime = self:GetAnimatorParamTime(AnimalBase_Define.ParamType.SkillOffset, 1)
			blendEndTime = self:GetAnimatorParamTime(AnimalBase_Define.ParamType.SkillBlend, 2)
		elseif self.moveHitType == AnimalBase_Define.HitType.StatusBreak and (self.moveHitTypeOld == AnimalBase_Define.HitType.LeftHandBreak or self.moveHitTypeOld == AnimalBase_Define.HitType.RightHandBreak or self.moveHitTypeOld == AnimalBase_Define.HitType.LeftHand or self.moveHitTypeOld == AnimalBase_Define.HitType.RightHand) then
			offsetTime = self:GetAnimatorParamTime(AnimalBase_Define.ParamType.SkillOffset, 1)
			blendEndTime = self:GetAnimatorParamTime(AnimalBase_Define.ParamType.SkillBlend, 2)
		else
			offsetTime = 0
			blendEndTime = MS_AnimalAnimator.GetAnimatorBlendTime(self.heroId, stateHash)
		end
	else
		offsetTime = 0
		blendEndTime = MS_AnimalAnimator.GetAnimatorBlendTime(self.heroId, stateHash)
	end

	if offsetTime >= 0 and blendEndTime >= 0 then
		local blendTime = Mathf.Max(0, blendEndTime - offsetTime)

		return offsetTime, blendTime
	elseif blendEndTime >= 0 then
		return 0, blendEndTime
	elseif offsetTime >= 0 then
		return offsetTime, 0
	end

	return 0, 0
end

function AnimalBase:SetParamDisable(param, disable)
	if self.paramDisable ~= nil then
		self.paramDisable[param] = disable
	end
end

function AnimalBase:SetParamThreshold(param, value)
	if self.paramThreshold ~= nil then
		self.paramThreshold[param] = value
	end
end

function AnimalBase:IsAnimatorInParamTime(param1, value1, param2, value2)
	if self.paramDisable ~= nil then
		if param1 ~= nil and self.paramDisable[param1] == true then
			return false
		end

		if param2 ~= nil and self.paramDisable[param2] == true then
			return false
		end
	end

	local ret = MS_AnimalAnimator.IsInTimeRange(self.heroId, self.animatorStateHash, self.animatorTime, param1, value1, param2, value2)

	return ret
end

function AnimalBase:GetAnimatorParamTime(param, value)
	if self.paramDisable ~= nil and param ~= nil and self.paramDisable[param] == true then
		return -1
	end

	local retTime = MS_AnimalAnimator.GetAnimatorTimeByValue(self.heroId, self.animatorStateHash, param, value)

	return retTime
end

function AnimalBase:GetAnimatorParam(param)
	local ret = 0

	if self.paramDisable ~= nil and param ~= nil and self.paramDisable[param] == true then
		return ret
	end

	if param == AnimalBase_Define.ParamType.SkillHand or param == AnimalBase_Define.ParamType.SkillRot or param == AnimalBase_Define.ParamType.SkillBeatBack or param == AnimalBase_Define.ParamType.SkillExit or param == AnimalBase_Define.ParamType.SkillComboStart or param == AnimalBase_Define.ParamType.SkillComboEnd or param == AnimalBase_Define.ParamType.SkillOffset or param == AnimalBase_Define.ParamType.SkillBlend or param == AnimalBase_Define.ParamType.SkillMuteki or param == AnimalBase_Define.ParamType.SkillMuteki2 or param == AnimalBase_Define.ParamType.SkillCounterAttack or param == AnimalBase_Define.ParamType.SkillSpeed or param == AnimalBase_Define.ParamType.SkillToughness or param == AnimalBase_Define.ParamType.SkillDefence or param == AnimalBase_Define.ParamType.SkillShake or param == AnimalBase_Define.ParamType.SkillParry or param == AnimalBase_Define.ParamType.CamLock or param == AnimalBase_Define.ParamType.Trigger or param == AnimalBase_Define.ParamType.DeadExit or param == AnimalBase_Define.ParamType.RunExit or param == AnimalBase_Define.ParamType.Jump or param == AnimalBase_Define.ParamType.Vfx or param == AnimalBase_Define.ParamType.Ground or param == AnimalBase_Define.ParamType.DefenceHitHand then
		ret = MS_AnimalAnimator.GetAnimatorData(self.heroId, self.animatorStateHash, self.animatorTime, param)
	else
		ret = XAnimator.GetAnimatorFloat(self.animalId, param)
	end

	if ret > 0 and self.paramThreshold ~= nil and self.paramThreshold[param] ~= nil then
		ret = ret - self.paramThreshold[param]

		if ret <= 0 then
			ret = 0
		end
	end

	return ret
end

function AnimalBase:ResetAnimatorParamFloat()
	for k, v in pairs(self.animatorParamList) do
		if k ~= AnimalBase_Define.ParamType.Pose and k ~= AnimalBase_Define.ParamType.SlopeAngle and k ~= AnimalBase_Define.ParamType.SlopeForwardAngle and k ~= AnimalBase_Define.ParamType.Battle then
			local ret = XAnimator.SetAnimatorFloat(self.animalId, k, 0, 0, 0)

			if ret == true then
				self.animatorParamList[k] = 0
			end
		end
	end
end

function AnimalBase:InitAnimatorParamFloat()
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Vertical, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.VerticalSpecial, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalSpecial, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.VerticalSkill, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalSkill, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Turn, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Drop, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Fall, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.SlopeAngle, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.SlopeForwardAngle, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Battle, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.VerticalHit, 0, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalHit, 0, 0, 0)
end

function AnimalBase:RecoveryAnimatorParamFloat()
	if self.animatorParamRecovery == true then
		if self.animatorParamList[AnimalBase_Define.ParamType.Pose] ~= nil then
			XAnimator.SetAnimatorFloat(self.animalId, AnimalBase_Define.ParamType.Pose, self.animatorParamList[AnimalBase_Define.ParamType.Pose], 0, 0)
		end

		if self.animatorParamList[AnimalBase_Define.ParamType.Battle] ~= nil then
			XAnimator.SetAnimatorFloat(self.animalId, AnimalBase_Define.ParamType.Battle, self.animatorParamList[AnimalBase_Define.ParamType.Battle], 0, 0)
		end

		self.animatorParamRecovery = false
	end
end

function AnimalBase:SetAnimatorParamFloat(param, value, dampTime, deltaTime)
	if self.animatorParamList[param] == nil then
		self.animatorParamList[param] = -1
	end

	if dampTime <= 0 then
		if MathHelper.Approximately(value, self.animatorParamList[param]) == false then
			local ret = XAnimator.SetAnimatorFloat(self.animalId, param, value, dampTime, deltaTime)

			if ret == true then
				self.animatorParamList[param] = value
			end
		end
	else
		local ret = XAnimator.SetAnimatorFloat(self.animalId, param, value, dampTime, deltaTime)

		if ret == true then
			self.animatorParamList[param] = value
		end
	end
end

function AnimalBase:IsAnimatorInTransition()
	return self.animatorInTransition
end

function AnimalBase:ResetAnimatorState()
	self.animatorStateMoveHash = nil

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Revert then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateRevert
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Get then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateGet
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateDialogue
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Special then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateSpecial .. self.animatorSpecialId
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.OpenCrate then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateCrate
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.OpenGate then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateGate
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.StairKick then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateStairKick
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKick then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateCoverKick
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CarriageStart or self.moveStateNow == AnimalBase_Define.MoveStateType.BridgeStart or self.moveStateNow == AnimalBase_Define.MoveStateType.DoorStart or self.moveStateNow == AnimalBase_Define.MoveStateType.DoorHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ElevatorStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CageStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKickHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.GateHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallStart or self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallHintStart or self.moveStateNow == AnimalBase_Define.MoveStateType.BeaconStart or self.moveStateNow == AnimalBase_Define.MoveStateType.EntranceStart or self.moveStateNow == AnimalBase_Define.MoveStateType.StatueStart or self.moveStateNow == AnimalBase_Define.MoveStateType.FountainStart or self.moveStateNow == AnimalBase_Define.MoveStateType.HoneypotStart or self.moveStateNow == AnimalBase_Define.MoveStateType.CrateStart or self.moveStateNow == AnimalBase_Define.MoveStateType.BonefireStart then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateSaveStart
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SaveLoop or self.moveStateNow == AnimalBase_Define.MoveStateType.BonefireLoop then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateSaveLoop
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SaveEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CarriageEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.BridgeEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.DoorEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.DoorHintEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.ElevatorEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CageEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKickHintEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.GateHintEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallHintEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.BeaconEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.EntranceEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.StatueEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.FountainEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.HoneypotEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.CrateEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.BonefireEnd then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateSaveEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeStart then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateChangeStart
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeEnd then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateChangeEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornStart then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateChangeRebornStart
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornEnd then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateChangeRebornEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TransferStart then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateTransferStart
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TransferEnd then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateTransferEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Reborn then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateChangeEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Born then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateBorn
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareStart then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateNightmareStart
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareEnd then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateNightmareEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CallStart then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateCallStart
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateCallEnd
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev then
		return
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
		self.animatorStateName = AnimalBase_Define.AnimatorStateGroundMove
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		self.animatorStateName = AnimalBase_Define.AnimatorStateGroundMove
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateDrop
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround then
		self:StopMovementImmediately(false)

		self.animatorStateName = AnimalBase_Define.AnimatorStateTouchGround .. self.moveDropType

		if self.moveDropType == AnimalBase_Define.DropType.HeadUp then
			if self.moveDropHeightType == AnimalBase_Define.DropHeightType.High then
				self.animatorStateName = self.animatorStateName .. "_H"
			else
				self.animatorStateName = self.animatorStateName .. "_L"
			end
		end

		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
		self.animatorStateName = "skill" .. self.skillIndex .. ".skill" .. self.skillIndex .. "_" .. self.skillCombo
		self.animatorLayer = self:GetAnimatorLayerIndex(self.animalConfig.skillLayer[self.skillIndex][self.skillCombo])

		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.DontMove) == true then
			self:StopMovementImmediately(false)
		end

		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			self.animatorStateMoveHash = MS_AnimalAnimator.GetStateNameHash(AnimalBase_Define.AnimatorStateSpecialMove)
		elseif self:IsMoveType(AnimalBase_Define.MoveType.Move) == true then
			self.animatorStateMoveHash = MS_AnimalAnimator.GetStateNameHash(AnimalBase_Define.AnimatorStateGroundMove)
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery then
		self.animatorStateName = "skill" .. self.skillIndex .. ".recoverySkill" .. self.skillIndex .. "_" .. self.skillCombo
		self.animatorLayer = self:GetAnimatorLayerIndex(self.animalConfig.skillRecoveryLayer[self.skillIndex][self.skillCombo])

		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.DontMove) == true then
			self:StopMovementImmediately(false)
		end

		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			self.animatorStateMoveHash = MS_AnimalAnimator.GetStateNameHash(AnimalBase_Define.AnimatorStateSpecialMove)
		elseif self:IsMoveType(AnimalBase_Define.MoveType.Move) == true then
			self.animatorStateMoveHash = MS_AnimalAnimator.GetStateNameHash(AnimalBase_Define.AnimatorStateGroundMove)
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		self:StopMovementImmediately(false)

		if self.animalConfig.skillHitName[self.moveHitType] ~= nil then
			self.animatorStateName = self.animalConfig.skillHitName[self.moveHitType]
		else
			self.animatorStateName = self.animalConfig.skillHitName[AnimalBase_Define.HitType.Light]
		end

		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dead then
		self:StopMovementImmediately(false)

		if self.moveDeadType == AnimalBase_Define.DeadType.Drop then
			self.animatorStateName = AnimalBase_Define.AnimatorStateDrop
		elseif self.moveDeadType == AnimalBase_Define.DeadType.Lie then
			self.animatorStateName = AnimalBase_Define.AnimatorStateDieLie
		elseif self.moveDeadType == AnimalBase_Define.DeadType.Back then
			self.animatorStateName = AnimalBase_Define.AnimatorStateDieStandBack
		else
			self.animatorStateName = AnimalBase_Define.AnimatorStateDieStandFront
		end

		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			self.animatorStateName = AnimalBase_Define.AnimatorStateSpecialMove
		else
			self.animatorStateName = AnimalBase_Define.AnimatorStateGroundMove
		end

		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.MoveForce then
		self.animatorStateName = AnimalBase_Define.AnimatorStateGroundMove
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartReady then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateGroundMove
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartDown then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbStartDown
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartUp then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbStartUp
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbEndDown
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbEndDown2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbEndUp
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 then
		self:StopMovementImmediately(true)

		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbEndUp2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbLeftUp
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbLeftUp2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbLeftDown
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbLeftDownReady2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbLeftDownToIdle2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftIdle then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbLeftIdle
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbRightUp
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbRightUp2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbRightDown
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbRightDownReady2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbDown2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2 then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbRightDownToIdle2
		self.animatorLayer = 0
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightIdle then
		self.animatorStateName = AnimalBase_Define.AnimatorStateClimbRightIdle
		self.animatorLayer = 0
	else
		return
	end

	self.animatorStateHash = MS_AnimalAnimator.GetStateNameHash(self.animatorStateName)
end

function AnimalBase:SetAnimatorStateSpecial(state, layer)
	self.animatorStateSpecialHash = MS_AnimalAnimator.GetStateNameHash(state)
	self.animatorLayerSpecial = layer
end

function AnimalBase:UpdateAnimatorRender()
	local tmpSpeed = self:UpdateAnimatorDelay()

	if tmpSpeed ~= self.animatorSpeed then
		XAnimator.SetSpeed(self.animalId, tmpSpeed)
		self:SetSkillEffectAllSpeed(tmpSpeed)

		self.animatorSpeed = tmpSpeed
	end

	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.VerticalSkill, self.moveSpeedVerticalSkill, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalSkill, self.moveSpeedHorizontalSkill, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Vertical, self.moveSpeedVertical, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.VerticalSpecial, self.moveSpeedVerticalSpecial, 0, 0)
	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.HorizontalSpecial, self.moveSpeedHorizontalSpecial, 0, 0)

	if self.moveTurnEnable == true then
		if self.moveTurn * self.moveTurnTarget >= 0 and Mathf.Abs(self.moveTurnTarget) < Mathf.Abs(self.moveTurn) then
			self.moveTurn = Mathf.Lerp(self.moveTurn, self.moveTurnTarget, AnimalBase_Define.MotionMoveTurnSpeed * ControllerMain.GetLogicDeltaTime())
		else
			self.moveTurn = self.moveTurnTarget
		end

		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Turn, self.moveTurn, 0, 0)
	end

	if self.animatorStateMoveHashOld ~= self.animatorStateMoveHash and self.animatorStateMoveHash ~= nil then
		local offsetTime, blendTime = self:GetAnimatorOffsetAndBlendTime(self.animatorStateMoveHash)

		XAnimator.PlayAnimator(self.animalId, self.animatorStateMoveHash, self.animatorLayerMove, offsetTime, blendTime, 0, false)
	end

	if self.animatorStateSpecialHashOld ~= self.animatorStateSpecialHash and self.animatorStateSpecialHash ~= nil then
		local offsetTime, blendTime = self:GetAnimatorOffsetAndBlendTime(self.animatorStateSpecialHash)

		XAnimator.PlayAnimator(self.animalId, self.animatorStateSpecialHash, self.animatorLayerSpecial, offsetTime, blendTime, 0, false)

		self.animatorStateSpecialHashOld = self.animatorStateSpecialHash
	end

	if self.animatorStateHashOld ~= self.animatorStateHash or self.animatorReset == true then
		local changeLayer = false

		if self.animatorLayer ~= self.animatorLayerOld then
			changeLayer = true
		end

		local offsetTime, blendTime = self:GetAnimatorOffsetAndBlendTime(self.animatorStateHash)
		local resetTime = 0

		if self.animatorReset == true then
			resetTime = self.animatorResetTime
		end

		XAnimator.PlayAnimator(self.animalId, self.animatorStateHash, self.animatorLayer, offsetTime, blendTime, resetTime, changeLayer)
	end
end

function AnimalBase:ChangeNextStairStatus(idleStatus)
	if idleStatus == AnimalBase_Define.MoveStateType.ClimbRightIdle then
		if self.moveStairDir == AnimalBase_Define.StairTouch.Up then
			local ret = self:CheckStairOut(self.moveStairDir)

			if ret == false then
				if self.moveStairClimbSpeed == AnimalBase_Define.StairClimbSpeed.Fast then
					ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftUp2, AnimalBase_Define.MoveStateChangeLevel.High)
				else
					ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftUp, AnimalBase_Define.MoveStateChangeLevel.High)
				end

				if ret == true then
					self.moveStairClimbTargetPos.y = self.moveStairClimbTargetPos.y + SceneDefine.TouchStairClimbMaxY
				end
			end
		elseif self.moveStairDir == AnimalBase_Define.StairTouch.Down then
			local ret = self:CheckStairOut(self.moveStairDir)

			if ret == false then
				if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 then
					if self.animatorLoopCnt > self.animatorLoopCntLast then
						if self.moveStairClimbSpeed == AnimalBase_Define.StairClimbSpeed.Fast then
							self.moveStateNow = AnimalBase_Define.MoveStateType.ClimbRightDown2
							ret = true
						else
							self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2, AnimalBase_Define.MoveStateChangeLevel.Low)

							ret = false
						end
					end
				elseif self.moveStairClimbSpeed == AnimalBase_Define.StairClimbSpeed.Fast then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightDownReady2, AnimalBase_Define.MoveStateChangeLevel.High)

					ret = false
				else
					ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightDown, AnimalBase_Define.MoveStateChangeLevel.High)
				end

				if ret == true then
					self.moveStairClimbTargetPos.y = self.moveStairClimbTargetPos.y - SceneDefine.TouchStairClimbMaxY
				end
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 then
			if self.animatorLoopCnt > self.animatorLoopCntLast then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2, AnimalBase_Define.MoveStateChangeLevel.Low)
			end
		elseif self.moveStateNow ~= AnimalBase_Define.MoveStateType.ClimbRightIdle then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightIdle, AnimalBase_Define.MoveStateChangeLevel.Low)
		end
	elseif idleStatus == AnimalBase_Define.MoveStateType.ClimbLeftIdle then
		if self.moveStairDir == AnimalBase_Define.StairTouch.Up then
			local ret = self:CheckStairOut(self.moveStairDir)

			if ret == false then
				if self.moveStairClimbSpeed == AnimalBase_Define.StairClimbSpeed.Fast then
					ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightUp2, AnimalBase_Define.MoveStateChangeLevel.High)
				else
					ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightUp, AnimalBase_Define.MoveStateChangeLevel.High)
				end

				if ret == true then
					self.moveStairClimbTargetPos.y = self.moveStairClimbTargetPos.y + SceneDefine.TouchStairClimbMaxY
				end
			end
		elseif self.moveStairDir == AnimalBase_Define.StairTouch.Down then
			local ret = self:CheckStairOut(self.moveStairDir)

			if ret == false then
				if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 then
					if self.animatorLoopCnt > self.animatorLoopCntLast then
						if self.moveStairClimbSpeed == AnimalBase_Define.StairClimbSpeed.Fast then
							self.moveStateNow = AnimalBase_Define.MoveStateType.ClimbLeftDown2
							ret = true
						else
							self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2, AnimalBase_Define.MoveStateChangeLevel.Low)

							ret = false
						end
					end
				elseif self.moveStairClimbSpeed == AnimalBase_Define.StairClimbSpeed.Fast then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftDownReady2, AnimalBase_Define.MoveStateChangeLevel.High)

					ret = false
				else
					ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftDown, AnimalBase_Define.MoveStateChangeLevel.High)
				end

				if ret == true then
					self.moveStairClimbTargetPos.y = self.moveStairClimbTargetPos.y - SceneDefine.TouchStairClimbMaxY
				end
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 then
			if self.animatorLoopCnt > self.animatorLoopCntLast then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2, AnimalBase_Define.MoveStateChangeLevel.Low)
			end
		elseif self.moveStateNow ~= AnimalBase_Define.MoveStateType.ClimbLeftIdle then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftIdle, AnimalBase_Define.MoveStateChangeLevel.Low)
		end
	end
end

function AnimalBase:UpdateMoveState()
	if self.moveOnGroundOld ~= self.moveOnGround and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dialog and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Special and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Born then
		if self.moveOnGround == true then
			if self.moveFallHeight > AnimalBase_Define.MotionFallHighHeight then
				self.moveDropHeightType = AnimalBase_Define.DropHeightType.High
			else
				self.moveDropHeightType = AnimalBase_Define.DropHeightType.Low
			end

			if self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 1) then
				self:OnSkillEnd(self.skillIndex, self.skillCombo + 1)
				self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
			else
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.TouchGround, AnimalBase_Define.MoveStateChangeLevel.High)

				if self.moveDropType == AnimalBase_Define.DropType.HeadUp then
					if self.moveDropHeightType == AnimalBase_Define.DropHeightType.High or self.moveDropHeightType == AnimalBase_Define.DropHeightType.Low then
						AudioCtrl.SetHeroAudio("fall_down", self.tfModel, self.animalId)
					end
				elseif self.moveDropType == AnimalBase_Define.DropType.HeadFoward then
					-- block empty
				elseif self.moveDropType == AnimalBase_Define.DropType.HeadDown then
					-- block empty
				elseif self.moveDropType == AnimalBase_Define.DropType.HeadBack then
					-- block empty
				end
			end

			self.moveStateDebugFly = false
		else
			self:ChangeToDrop(false)
		end
	end

	self.moveOnGroundOld = self.moveOnGround

	if self:IsOnStair() == true then
		if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartUp then
			if self.animatorEnd == true then
				self:SetPosByWorldPos(self.moveStairClimbTargetPos, false)
				self:ChangeNextStairStatus(AnimalBase_Define.MoveStateType.ClimbLeftIdle)
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2 then
			if self.animatorEnd == true then
				self:SetPosByWorldPos(self.moveStairClimbTargetPos, false)
				self:ChangeNextStairStatus(AnimalBase_Define.MoveStateType.ClimbRightIdle)
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftIdle then
			self:ChangeNextStairStatus(AnimalBase_Define.MoveStateType.ClimbLeftIdle)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightIdle then
			self:ChangeNextStairStatus(AnimalBase_Define.MoveStateType.ClimbRightIdle)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 then
			self:ChangeNextStairStatus(AnimalBase_Define.MoveStateType.ClimbLeftIdle)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 then
			self:ChangeNextStairStatus(AnimalBase_Define.MoveStateType.ClimbRightIdle)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 then
			if self.animatorEnd == true then
				local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbRightDown2, AnimalBase_Define.MoveStateChangeLevel.Low)

				if ret == true then
					self.moveStairClimbTargetPos.y = self.moveStairClimbTargetPos.y - SceneDefine.TouchStairClimbMaxY
				end
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 then
			if self.animatorEnd == true then
				local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbLeftDown2, AnimalBase_Define.MoveStateChangeLevel.Low)

				if ret == true then
					self.moveStairClimbTargetPos.y = self.moveStairClimbTargetPos.y - SceneDefine.TouchStairClimbMaxY
				end
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 then
			if self.animatorEnd == true then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartReady then
			if self.moveStairClimbStart > 2 then
				if self.moveStairTouchType == AnimalBase_Define.StairTouch.Down then
					self:ClearLockPlayer()

					local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbStartDown, AnimalBase_Define.MoveStateChangeLevel.Low)

					if ret == true then
						self.scene:GetStairStartTargetPosition(self.moveStairId, self.moveStairClimbTargetPos, self.moveStairTouchType)
					end
				elseif self.moveStairTouchType == AnimalBase_Define.StairTouch.Up then
					self:ClearLockPlayer()

					local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbStartUp, AnimalBase_Define.MoveStateChangeLevel.Low)

					if ret == true then
						self.scene:GetStairStartTargetPosition(self.moveStairId, self.moveStairClimbTargetPos, self.moveStairTouchType)
					end
				else
					SystemHelper.LogError("=========self.moveStairTouchType error !!")
				end
			else
				self.moveStairClimbStart = self.moveStairClimbStart + 1
			end
		end
	else
		if DebugFly == true then
			if self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self.moveFlg == false or self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
				if self.isHost == true and self.isHostBack == false and inputMgr:GetButton(LS_Setting.Btn.L1) then
					local tmpRet = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Fly, AnimalBase_Define.MoveStateChangeLevel.High)

					if tmpRet == true then
						self:SetCharacterBodyIKEnable(false)

						self.moveBattleMode = 0
						self.moveBattleEndTime = 0
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
				local tmpRet = false

				if self.isHost == true and self.isHostBack == false and inputMgr:GetButton(LS_Setting.Btn.L1) then
					tmpRet = true
				end

				if tmpRet == false then
					tmpRet = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)

					if tmpRet == true then
						self:SetCharacterBodyIKEnable(true)
					end
				end
			end
		end

		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.Move then
			if self.moveStateNow == AnimalBase_Define.MoveStateType.Revert or self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround or self.moveStateNow == AnimalBase_Define.MoveStateType.Get or self.moveStateNow == AnimalBase_Define.MoveStateType.OpenCrate or self.moveStateNow == AnimalBase_Define.MoveStateType.OpenGate or self.moveStateNow == AnimalBase_Define.MoveStateType.StairKick or self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKick then
				if self.animatorEnd == true then
					if self.animalValue:IsWeaknessEmpty() then
						self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
					else
						self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)

						if self.moveStateOld == AnimalBase_Define.MoveStateType.Revert and self:GetMoveSpeedMode() ~= AnimalBase_Define.SpeedMode.Slow then
							self:SetMoveSpeed(AnimalBase_Define.MotionRunSpeed)
						end
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.MoveForce then
				local nowTime = TimeHelper.getNowTime()

				if nowTime < self.moveForceEndTime then
					self.moveFlg = true
				else
					self.moveFlg = false

					local speed = self:GetMoveSpeed()

					if speed <= 0 then
						self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
					end

					self.moveForceEndTime = 0
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart then
				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.SaveLoop, AnimalBase_Define.MoveStateChangeLevel.Low)
				else
					self:SetOrientation(self.gameController:GetSavePosition())
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SaveLoop then
				if self.gameController:IsSaveEnd() == true then
					self.gameController:OpenSaveMenu()
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.BridgeStart then
				self:SetOrientation(self.gameController:GetBridgePosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.BridgeEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.DoorStart then
				self:SetOrientation(self.gameController:GetDoorPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.DoorEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.DoorHintStart then
				self:SetOrientation(self.gameController:GetDoorHintPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.DoorHintEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.GateHintStart then
				self:SetOrientation(self.gameController:GetGateHintPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.GateHintEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallStart then
				self:SetOrientation(self.gameController:GetVirtualWallPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.VirtualWallEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.VirtualWallHintStart then
				self:SetOrientation(self.gameController:GetVirtualWallHintPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.VirtualWallHintEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CoverKickHintStart then
				self:SetOrientation(self.gameController:GetCoverKickHintPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.CoverKickHintEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.EntranceStart then
				self:SetOrientation(self.gameController:GetEntrancePosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.EntranceEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.StatueStart then
				self:SetOrientation(self.gameController:GetStatuePosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.StatueEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.FountainStart then
				self:SetOrientation(self.gameController:GetFountainPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.FountainEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.HoneypotStart then
				self:SetOrientation(self.gameController:GetHoneypotPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.HoneypotEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CrateStart then
				local tmpPos, tmpLookPos = self.gameController:GetCrateStandInfo()

				self:SetOrientation(tmpLookPos)

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.CrateEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.BonefireStart then
				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.BonefireLoop, AnimalBase_Define.MoveStateChangeLevel.Low)
				else
					self:SetOrientation(self.gameController:GetBonefirePosition())
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ElevatorStart then
				self:SetOrientation(self.gameController:GetElevatorPosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.ElevatorEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CageStart then
				local tmpPos, tmpLook = self.gameController:GetCageStandInfo()

				self:SetOrientation(tmpPos, true)

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.CageEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeStart then
				if self.animatorEnd == true then
					self.sceneController:SwitchHostPlayer(0, ControllerMain.SwitchType.ChangeNext, self.gameController:IsBossMode(), nil)
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornStart then
				if self.animatorEnd == true then
					self.sceneController:SwitchHostPlayer(0, ControllerMain.SwitchType.ChangeReborn, self.gameController:IsBossMode(), self.rebornPropertyList)
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.BeaconStart then
				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.BeaconEnd, AnimalBase_Define.MoveStateChangeLevel.High)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CarriageStart then
				self:SetOrientation(self.gameController:GetCarriagePosition())

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.CarriageEnd, AnimalBase_Define.MoveStateChangeLevel.Low)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Reborn or self.moveStateNow == AnimalBase_Define.MoveStateType.Born or self:IsEventEnd(self.moveStateNow) == true then
				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareStart then
				local nowTime = TimeHelper.getNowTime()
				local diff = nowTime - self.animatorStateStartTime

				if diff >= AnimalBase_Define.NightmareStartMoveTime then
					self:ChangeDissolveThreshold(0)
					self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
				elseif diff >= AnimalBase_Define.NightmareShowTime then
					self:ChangeDissolveThreshold(0)
					self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
				elseif diff >= 0 then
					local ratio = diff / AnimalBase_Define.NightmareShowTime

					ratio = Mathf.Clamp(1 - ratio, 0, 1)

					self:ChangeDissolveThreshold(ratio)
					self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.NightmareEnd then
				local nowTime = TimeHelper.getNowTime()
				local diff = nowTime - self.animatorStateStartTime

				if diff >= AnimalBase_Define.NightmareEndTime then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
					self:ChangeDissolveThreshold(1)
					self:OnDissolveEnd()
				else
					local ratio = diff / AnimalBase_Define.NightmareEndTime

					ratio = Mathf.Clamp(ratio, 0, 1)

					self:ChangeDissolveThreshold(ratio)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CallStart then
				if self.animatorTime >= AnimalBase_Define.CallStartDissolveEndTime then
					self:ChangeDissolveThreshold(0)
					self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
				elseif self.animatorTime >= AnimalBase_Define.CallStartDissolveStartTime then
					local ratio = (self.animatorTime - AnimalBase_Define.CallStartDissolveStartTime) / (AnimalBase_Define.CallStartDissolveEndTime - AnimalBase_Define.CallStartDissolveStartTime)

					ratio = Mathf.Clamp(1 - ratio, 0, 1)

					self:ChangeDissolveThreshold(ratio)
					self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
				end

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.CallEnd then
				if self.animatorTime >= AnimalBase_Define.CallEndDissolveEndTime then
					self:ChangeDissolveThreshold(1)
				elseif self.animatorTime >= AnimalBase_Define.CallEndDissolveStartTime then
					local ratio = (self.animatorTime - AnimalBase_Define.CallStartDissolveStartTime) / (AnimalBase_Define.CallStartDissolveEndTime - AnimalBase_Define.CallStartDissolveStartTime)

					ratio = Mathf.Clamp(ratio, 0, 1)

					self:ChangeDissolveThreshold(ratio)
				end

				if self.animatorEnd == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
					self:OnDissolveEnd()
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog then
				self:UpdateCharacterLookAt()
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Special then
				if self.moveFlg == true then
					if self.animalValue:IsWeaknessEmpty() then
						self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
					else
						self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
				-- block empty
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove then
				local ret = self:SetTimeLineTargetByWorldPos(self.moveTimeLineTargetPos)

				if ret == false then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.TimeLineMoveForce, AnimalBase_Define.MoveStateChangeLevel.High)
					ProjectXPathFindingAI.ReleasePath(self.animalId)
				end

				self.moveFlg = true
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce then
				local tmpSpeed = GameAI.HeroWalkSpeed * ControllerMain.GetLogicDeltaTime()
				local nowPos = self:GetPosByWorldPos()
				local tmpDir = self.moveTimeLineTargetPos - nowPos

				tmpDir.y = 0

				if tmpDir.sqrMagnitude <= tmpSpeed * tmpSpeed or MathHelper.IsZero(tmpDir.sqrMagnitude) == true then
					self:SetPosByWorldPos(self.moveTimeLineTargetPos, true)
					self:ChangeToTimeLine(true)
				else
					tmpDir:SetNormalize()
					tmpDir:Mul(tmpSpeed)
					tmpDir:Add(nowPos)
					self:SetPosByWorldPos(tmpDir, false)
				end

				tmpDir = nil
				self.moveFlg = true
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev then
				local nowTime = TimeHelper.getNowTime()

				if nowTime > self.animatorStateStartTime + MS_StoryTimeLine.TimeLineTriggerTime1 then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.TimeLine, AnimalBase_Define.MoveStateChangeLevel.High)
					self:StopMovementImmediately(true)
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine then
				-- block empty
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
				if self.animatorLoop == false then
					if self.animatorEnd == true then
						local skillData, itemData

						if self.moveHitData ~= nil and self.moveHitData:IsEnable() == true then
							skillData = self.moveHitData:GetSkillData()
							itemData = self.moveHitData:GetItemData()
						end

						if self.moveHitType == AnimalBase_Define.HitType.LeftHandBreak or self.moveHitType == AnimalBase_Define.HitType.RightHandBreak then
							self:ChangeHit(AnimalBase_Define.HitType.StatusBreak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.LeftHandWeak or self.moveHitType == AnimalBase_Define.HitType.RightHandWeak then
							self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.LightDizzy or self.moveHitType == AnimalBase_Define.HitType.HeavyDizzy or self.moveHitType == AnimalBase_Define.HitType.SuperDizzy then
							self:ChangeHitPeriod(AnimalBase_Define.HitType.Dizzy, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.LightFreeze or self.moveHitType == AnimalBase_Define.HitType.HeavyFreeze or self.moveHitType == AnimalBase_Define.HitType.SuperFreeze then
							self:ChangeHitPeriod(AnimalBase_Define.HitType.Freeze, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.LightTackle or self.moveHitType == AnimalBase_Define.HitType.HeavyTackle or self.moveHitType == AnimalBase_Define.HitType.SuperTackle then
							self:ChangeHitPeriod(AnimalBase_Define.HitType.Tackle, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.PullFrontDizzy or self.moveHitType == AnimalBase_Define.HitType.PullBackDizzy then
							self:ChangeHitPeriod(AnimalBase_Define.HitType.Dizzy, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.PullFrontFreeze or self.moveHitType == AnimalBase_Define.HitType.PullBackFreeze then
							self:ChangeHitPeriod(AnimalBase_Define.HitType.Freeze, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.PullFrontTackle or self.moveHitType == AnimalBase_Define.HitType.PullBackTackle then
							self:ChangeHitPeriod(AnimalBase_Define.HitType.Tackle, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.StatusWeakLoop1 then
							self:ChangeHit(AnimalBase_Define.HitType.StatusWeakLoop2, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						elseif self.moveHitType == AnimalBase_Define.HitType.Toward or self.moveHitType == AnimalBase_Define.HitType.BodyBreak then
							if self.animalValue:IsWeaknessEmpty() then
								local ret = self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)

								if ret == true then
									self.moveHitStatusWeakToward = true
								end
							else
								self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
							end
						elseif self.animalValue:IsWeaknessEmpty() and self.moveHitType ~= AnimalBase_Define.HitType.StatusWeak and self.moveHitStatusWeak == false then
							self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
						else
							self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
						end
					else
						local skillExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit)

						if self.moveHitType == AnimalBase_Define.HitType.Toward then
							if self.skillHitTowardPosition ~= nil and self.animatorTime > AnimalBase_Define.HitTowardTimeStart and self.animatorTime <= AnimalBase_Define.HitTowardTimeEnd then
								XAnimator.SetMatchTarget(self.animalId, self.animatorLayer, self.skillHitTowardPosition.x, self.skillHitTowardPosition.y, self.skillHitTowardPosition.z, self.animatorTime, AnimalBase_Define.HitTowardTimeEnd)
							end

							if self.animatorTime > AnimalBase_Define.HitTowardExit and self.animalValue:IsWeaknessEmpty() then
								local ret = self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)

								if ret == true then
									self.moveHitStatusWeakToward = true
								end
							end
						elseif self.moveHitType == AnimalBase_Define.HitType.LeftHandBreak or self.moveHitType == AnimalBase_Define.HitType.RightHandBreak then
							if skillExit > 0 and self.moveHitData ~= nil and self.moveHitData:IsEnable() == true then
								local skillData = self.moveHitData:GetSkillData()

								if skillData ~= nil and skillExit >= skillData.CounterAttackExit then
									self:ChangeHit(AnimalBase_Define.HitType.StatusBreak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
								end
							end
						elseif self.moveHitType == AnimalBase_Define.HitType.LeftHandWeak or self.moveHitType == AnimalBase_Define.HitType.RightHandWeak then
							if skillExit > 0 and self.moveHitData ~= nil and self.moveHitData:IsEnable() == true then
								local skillData = self.moveHitData:GetSkillData()

								if skillData ~= nil and skillExit >= skillData.CounterAttackExit then
									self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
								end
							end
						elseif skillExit > 0 then
							if self.animalValue:IsWeaknessEmpty() == true and self.moveHitStatusWeak == false then
								self:ChangeHit(AnimalBase_Define.HitType.StatusWeak, skillData, itemData, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
							else
								local tmpSkillIndexNext, tmpSkillComboNext = self:GetSkillNext()

								if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
									local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

									if haveEnergy == true then
										self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
									end
								end
							end
						end
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dead then
				if self.moveDeadType == AnimalBase_Define.DeadType.Drop then
					if self.deadHide == false then
						self.deadHide = true

						self:OnDeadFinish()
					end
				else
					if self.characterPuppetMaster ~= nil and self.characterPuppetMasterEnable == true then
						if self.characterPuppetMaster.pinWeight > 0 then
							self.characterPuppetMaster.pinWeight = Mathf.MoveTowards(self.characterPuppetMaster.pinWeight, 0, ControllerMain.GetLogicDeltaTime() * AnimalBase_Define.MotionFadeOutPinWeightSpeed)
						end

						if self.characterPuppetMaster.muscleWeight > 0 then
							self.characterPuppetMaster.muscleWeight = Mathf.MoveTowards(self.characterPuppetMaster.muscleWeight, AnimalBase_Define.MotionMuscleWeightMin, ControllerMain.GetLogicDeltaTime() * AnimalBase_Define.MotionFadeOutMuscleWeightSpeed)
						end
					end

					if self.isHost == false and (self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true or self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == true or BattleData.IsDarkForestScene() == true or BattleData.IsDreamScene() == true) then
						local nowTime = TimeHelper.getNowTime()
						local diff = nowTime - self.animatorStateStartTime

						if diff >= AnimalBase_Define.NightmareEndTime then
							if self.deadHide == false then
								self.deadHide = true

								self:OnDeadFinish()
							end
						else
							local ratio = diff / AnimalBase_Define.NightmareEndTime

							ratio = Mathf.Clamp(ratio, 0, 1)

							self:ChangeDissolveThreshold(ratio)
						end
					end

					if self.animatorEnd == true and self.deadHide == false then
						self.deadHide = true

						self:OnDeadFinish()
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Drop then
				local tmpSkillIndexNext, tmpSkillComboNext = self:GetSkillNext()

				if tmpSkillIndexNext == AnimalBase_Define.SkillType.Drop and tmpSkillComboNext > 0 then
					local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

					if haveEnergy == true then
						self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Skill then
				local isCounter = false
				local tmpSkillIndexNext, tmpSkillComboNext = self:GetSkillNext()

				if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext == AnimalBase_Define.SkillType.CounterAttack and tmpSkillComboNext > 0 then
					local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

					if haveEnergy == true then
						self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
						self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)

						isCounter = true
					else
						self:ResetMoveStateNext()

						tmpSkillIndexNext = 0
						tmpSkillComboNext = 0
					end
				end

				if isCounter == false then
					if self.animatorLoop == false then
						if self.animatorEnd == true then
							local skillAI = self:GetSkillTypeForAI()

							if skillAI == AnimalBase_Define.SkillTypeForAI.DefenceHit and self.moveStateNext ~= AnimalBase_Define.MoveStateType.Skill then
								if self:IsBlocking() == true then
									local blockSkillIndex, blockSkillCombo, blockParam = self:GetBlockSkill()

									self:OnSkillEnd(blockSkillIndex, blockSkillCombo)
									self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, blockSkillIndex, blockSkillCombo, false)
								else
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndRecovery then
								if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
									local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

									if haveEnergy == true then
										self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
										self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
									else
										self:OnSkillRecovery()
										self:ChangeMoveState(AnimalBase_Define.MoveStateType.SkillRecovery, AnimalBase_Define.MoveStateChangeLevel.High)
									end
								else
									self:OnSkillRecovery()
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.SkillRecovery, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndComboExit then
								if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
									local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

									if haveEnergy == true then
										self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
										self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
									else
										self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
									end
								else
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillRecovery then
								self:OnSkillRecovery()
								self:ChangeMoveState(AnimalBase_Define.MoveStateType.SkillRecovery, AnimalBase_Define.MoveStateChangeLevel.High)
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.Skill or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndJump then
								if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
									self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
									self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
								elseif self.skillCombo < self.animalConfig.skillComboMax[self.skillIndex] then
									self:OnSkillEnd(self.skillIndex, self.skillCombo + 1)
									self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, true)
								else
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillBind then
								if self.skillCombo < self.animalConfig.skillComboMax[self.skillIndex] then
									local tmpNext = self.moveStateNext
									local tmpSkillNextList = {}

									for i = 1, #self.skillNextList do
										table.insert(tmpSkillNextList, self.skillNextList[i])
									end

									self:OnSkillEnd(self.skillIndex, self.skillCombo + 1)
									self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, true)

									self.moveStateNext = tmpNext
									self.skillNextList = tmpSkillNextList
								else
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							else
								self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
							end
						else
							local nextSkillChange = false

							if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
								local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, self.skillIndex, self.skillCombo, tmpSkillIndexNext, tmpSkillComboNext)
								local exitIndex = 1

								if skillChainData ~= nil then
									exitIndex = skillChainData.SkillExit
								end

								local inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillExit, exitIndex, nil, nil)

								if inRange == true and (self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndRecovery or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndComboExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.Skill or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndJump) then
									local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

									if haveEnergy == true then
										self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
										self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)

										nextSkillChange = true
									else
										self:ResetMoveStateNext()

										tmpSkillIndexNext = 0
										tmpSkillComboNext = 0
									end
								end
							end

							if nextSkillChange == false and self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillBind and self.skillCombo < self.animalConfig.skillComboMax[self.skillIndex] then
								local skillChainData = MS_SkillChainData.GetSkillChainData(self.heroId, self.skillIndex, self.skillCombo, self.skillIndex, self.skillCombo + 1)
								local exitIndex = 1

								if skillChainData ~= nil then
									exitIndex = skillChainData.SkillExit
								end

								local inRange = self:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillExit, exitIndex, nil, nil)

								if inRange == true then
									local tmpNext = self.moveStateNext
									local tmpSkillNextList = {}

									for i = 1, #self.skillNextList do
										table.insert(tmpSkillNextList, self.skillNextList[i])
									end

									self:OnSkillEnd(self.skillIndex, self.skillCombo + 1)
									self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, true)

									self.moveStateNext = tmpNext
									self.skillNextList = tmpSkillNextList
								end
							end
						end
					else
						local nextFlg = true
						local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

						if skillData.SkillBreakType > 0 then
							nextFlg = false
						end

						if self.skillIndexOld == self.skillIndex and self.skillComboOld == self.skillCombo and self.animatorTime < self.animatorTimeLast then
							nextFlg = true
						end

						if nextFlg == true then
							if self.moveStateNext == AnimalBase_Define.MoveStateType.SkillRecovery then
								if self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndRecovery or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillRecovery then
									self:OnSkillRecovery()
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.SkillRecovery, AnimalBase_Define.MoveStateChangeLevel.High)
								else
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							elseif self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
								if self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndRecovery or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndComboExit or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.Skill or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillLoop or self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillAndJump then
									local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

									if haveEnergy == true then
										self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
										self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
									else
										self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
									end
								elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillLoopAndRecovery then
									local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

									if haveEnergy == true then
										self:OnSkillEnd(tmpSkillIndexNext, tmpSkillComboNext)
										self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, true)
									else
										self:OnSkillRecovery()
										self:ChangeMoveState(AnimalBase_Define.MoveStateType.SkillRecovery, AnimalBase_Define.MoveStateChangeLevel.High)
									end
								end
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillLoop then
								if skillData.BtnPressType == MS_SkillData.PressType.LongPress or skillData.BtnComboPressType == MS_SkillData.PressType.LongPress then
									local buttonLongPress = self:GetLongPressButton()

									if buttonLongPress <= 0 or buttonLongPress ~= skillData.BtnIndex then
										if self.skillCombo < self.animalConfig.skillComboMax[self.skillIndex] then
											self:OnSkillEnd(self.skillIndex, self.skillCombo + 1)
											self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, true)
										else
											self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
										end
									end
								end
							elseif self.animalConfig.skillNextType[self.skillIndex][self.skillCombo] == AnimalBase_Define.SkillNextType.SkillLoopAndRecovery and (skillData.BtnPressType == MS_SkillData.PressType.LongPress or skillData.BtnComboPressType == MS_SkillData.PressType.LongPress) then
								local buttonLongPress = self:GetLongPressButton()

								if buttonLongPress <= 0 or buttonLongPress ~= skillData.BtnIndex then
									self:OnSkillRecovery()
									self:ChangeMoveState(AnimalBase_Define.MoveStateType.SkillRecovery, AnimalBase_Define.MoveStateChangeLevel.High)
								end
							end
						end
					end
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.SkillRecovery and self.animatorEnd == true then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.High)
			end
		end
	end

	if self.nightmareEndReady == true then
		if self:IsWillDead() == false and self:IsStop() == false and self.moveOnGround == true and self:IsSkilling() == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Hit and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TouchGround and self.moveStateNow ~= AnimalBase_Define.MoveStateType.NightmareStart and self.moveStateNow ~= AnimalBase_Define.MoveStateType.NightmareEnd then
			local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.NightmareEnd, AnimalBase_Define.MoveStateChangeLevel.High)

			if ret == true then
				self.nightmareEndReady = false
			end
		end
	elseif self.callEndReady == true and self:IsWillDead() == false and self:IsStop() == false and self.moveOnGround == true and self:IsSkilling() == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Hit and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TouchGround and self.moveStateNow ~= AnimalBase_Define.MoveStateType.CallStart and self.moveStateNow ~= AnimalBase_Define.MoveStateType.CallEnd then
		local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.CallEnd, AnimalBase_Define.MoveStateChangeLevel.High)

		if ret == true then
			self.callEndReady = false
		end
	end

	if self.dissolveStartTime > 0 and self.dissolveEndTime > 0 then
		local nowTime = TimeHelper.getNowTime()

		if nowTime >= self.dissolveEndTime then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)

			self.dissolveStartTime = 0
			self.dissolveEndTime = 0

			if self.dissolveShow == true then
				self:ChangeDissolveThreshold(0)
			else
				self:ChangeDissolveThreshold(1)
				self:OnDissolveEnd()
			end
		elseif nowTime >= self.dissolveStartTime then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)

			local diffTime = nowTime - self.dissolveStartTime
			local ratio = diffTime / (self.dissolveEndTime - self.dissolveStartTime)

			if self.dissolveShow == true then
				ratio = Mathf.Clamp(1 - ratio, 0, 1)
			else
				ratio = Mathf.Clamp(ratio, 0, 1)
			end

			self:ChangeDissolveThreshold(ratio)
		end
	end

	if self:IsSkilling() == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Hit then
		local tmpSkillIndexNext, tmpSkillComboNext = self:GetSkillNext()

		if self.moveStateNext == AnimalBase_Define.MoveStateType.Skill and tmpSkillIndexNext > 0 and tmpSkillComboNext > 0 then
			local haveEnergy = self.animalValue:CheckSkillEnergy(tmpSkillIndexNext, tmpSkillComboNext)

			if haveEnergy == true then
				self:ChangeMoveSkillState(AnimalBase_Define.MoveStateType.Skill, tmpSkillIndexNext, tmpSkillComboNext, false)
			end
		end

		self:ResetMoveStateNext()
	end

	self:CheckSkillExecuteStatus()
	self:CheckSkillBackstabStatus()

	if self.isHost == true and self.isHostBack == false then
		if self.moveTouchGroundType == SceneBase.GroundType.SlowMud or self:IsHaveStatusById(AnimalBase_Define.StatusIdSlow) == true then
			self:AddLogicRule(AnimalBase_Define.LogicRule.WalkOnly, 0)
			self:AddLogicRule(AnimalBase_Define.LogicRule.DodgeClose, SceneBase.SlowMudDodge)
		elseif self.moveTouchGroundType == SceneBase.GroundType.PoisonMud then
			self:AddStatus(self:GetVirtualPlayer(), AnimalBase_Define.StatusIdPoisonMud, 0, MS_StatusData.SourceType.Ground, 0, true)
			self:AddLogicRule(AnimalBase_Define.LogicRule.WalkOnly, 0)
			self:AddLogicRule(AnimalBase_Define.LogicRule.DodgeClose, SceneBase.PoisonMudDodge)
		end

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.gameController:IsHaveStoryRule(ControllerStoryMode.StoryRule.StoryWalk) then
			self:AddLogicRule(AnimalBase_Define.LogicRule.WalkOnly, 0)
			self:AddLogicRule(AnimalBase_Define.LogicRule.DodgeClose, ControllerStoryMode.StoryWalkDodge)
		end
	end
end

function AnimalBase:LateUpdateMoveStateLogic()
	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self:IsPulling() == true then
		local tmpSkillIndex, tmpSkillCombo = self:GetPullSkill()
		local skillAI = self:GetSkillTypeForAI()

		if skillAI == AnimalBase_Define.SkillTypeForAI.PullFix and self.animatorTrigger >= 1 and self.animatorTrigger < 2 then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal == nil then
				local skillData = MS_SkillData.GetSkillData(self.heroId, tmpSkillIndex, tmpSkillCombo)
				local attPos = self:GetAttackBoxPosition(tmpSkillIndex, tmpSkillCombo)
				local captureOffset, captureDis, captureHeight = self:GetCaptureDistanceAndHeight()

				targetAnimal = GameAI.GetSkillCaptureTarget(self, skillData, attPos, captureOffset, captureDis, captureHeight, false)

				if targetAnimal ~= nil then
					self:SetSkillTargetReady(targetAnimal)
				end
			end
		end

		if skillAI == AnimalBase_Define.SkillTypeForAI.PullFix or skillAI == AnimalBase_Define.SkillTypeForAI.Pull then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				XCollider.AddRouteColliderIgnore(self.animalId, targetAnimal.animalId)
				XCollider.AddRouteColliderIgnore(targetAnimal.animalId, self.animalId)

				local attPos = self:GetAttackBoxPosition(tmpSkillIndex, tmpSkillCombo)

				targetAnimal:PullToPos(attPos, self:GetBack())

				local nowPos = self:GetPosByWorldPos()
				local newPos = targetAnimal:GetPosByWorldPos()
				local captureOffset, captureDis, captureHeight = self:GetCaptureDistanceAndHeight()
				local ret, dis = GameAI.IsInSkillCaptureRange(nowPos, attPos, newPos, captureOffset, captureDis, captureHeight, false)

				if ret == false then
					self:SetSkillTarget(nil)
					XCollider.RemoveRouteColliderIgnore(self.animalId, targetAnimal.animalId)
					XCollider.RemoveRouteColliderIgnore(targetAnimal.animalId, self.animalId)
				end
			end
		end
	end
end

function AnimalBase:UpdateMoveStateLogic()
	if self:IsDead() == true then
		return
	end

	self:CheckBlock()

	if self:IsSkillingSkill() == true then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if self:IsPulling() == true then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal == nil then
				local targetAnimalReady = self:GetSkillTargetReady()

				if targetAnimalReady ~= nil then
					local skillAI = self:GetSkillTypeForAI()

					if skillAI == AnimalBase_Define.SkillTypeForAI.PullFix then
						local hitType = AnimalBase.GetSkillHitType(self.heroId, self.skillIndex, self.skillCombo)
						local attackDir = self:GetSkillDirection(targetAnimalReady:GetPosByWorldPos())
						local ret = targetAnimalReady:ChangeHitSimple(self, hitType, skillData, attackDir, false)

						if ret == true then
							self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
							self:SetSkillTarget(targetAnimalReady)
						end
					end

					self:SetSkillTargetReady(nil)
				end
			else
				local skillAI = self:GetSkillTypeForAI()

				if skillAI == AnimalBase_Define.SkillTypeForAI.Pull then
					local hitType = AnimalBase.GetSkillHitType(self.heroId, self.skillIndex, self.skillCombo)

					targetAnimal:ChangePullHit(hitType, self:GetBack())
				end

				targetAnimal:KeepHitPeriod()
			end
		end

		local skillShake = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillShake)

		if skillShake > 0 then
			self:SkillShake(skillShake)
		end

		if skillData.Jump > 0 then
			local skillJump = self:GetAnimatorParam(AnimalBase_Define.ParamType.Jump)

			if self.moveJumpY < 0 then
				if skillJump > 0 and skillJump % 2 == 1 then
					self.moveJumpY = 0

					self:SetBodyCollider(false)
				end
			elseif skillJump > 0 and skillJump % 2 == 0 then
				self.moveJumpY = -1

				self:SetBodyCollider(true)
			else
				self.moveJumpY = self:GetAnimatorParam(AnimalBase_Define.ParamType.JumpY)
			end
		end

		if self.boss > 0 and self.isHost == false then
			self.cameraScene:SetBossCameraDistanceSkill(0)

			local camLock = self:GetAnimatorParam(AnimalBase_Define.ParamType.CamLock)

			if camLock > 0 then
				self.cameraScene:LockSkillingPlayer(self)

				local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

				if skillData ~= nil then
					self.cameraScene:SetBossCameraDistanceSkill(skillData.CameraDistance)
				end

				self.sceneController:UnlockPlayer(self)
			else
				self.cameraScene:LockSkillingPlayer(nil)
			end
		end
	end
end

function AnimalBase:HandleMoveStateNextSpecial()
	if self.moveStateNextSpecial > 0 then
		local ret = self:ChangeMoveState(self.moveStateNextSpecial, AnimalBase_Define.MoveStateChangeLevel.High)

		if ret == true and self.isHost == false then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
		end
	end

	self.moveStateNextSpecial = 0
end

function AnimalBase:IsPickingUp()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.Get then
		return true
	end

	return false
end

function AnimalBase:IsOnStair()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightIdle or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftIdle or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartReady then
		return true
	end

	return false
end

function AnimalBase:IsStairClimbing()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightIdle or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftIdle then
		return true
	end

	return false
end

function AnimalBase:IsStairClimbingEnd()
	if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 then
		return true
	end

	return false
end

function AnimalBase:PressUseItem(itemId)
	if self:IsWillDead() == true or self:IsShow() == false or itemId <= 0 then
		return
	end

	if self.isHost == false or self.isHostBack == true then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local itemData = MS_ItemData.GetItemData(itemId)
		local type = itemData.Type
		local itemId = itemData.ItemId

		if type == MS_ItemData.Type.Teleport then
			if self.gameController:TransferReady() == true then
				local txt = GameText.UI_TELEPORT_USE_TELEPORT_ITEM

				if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
					if itemId == MS_ItemData.TeleportUseExpItem then
						txt = GameText.UI_TELEPORT_USE_EXP_ITEM_Maze
					elseif itemId == MS_ItemData.TeleportUseSelf then
						txt = GameText.UI_TELEPORT_USE_TELEPORT_ITEM_Maze
					end
				elseif itemId == MS_ItemData.TeleportUseExpItem then
					txt = GameText.UI_TELEPORT_USE_EXP_ITEM
				elseif itemId == MS_ItemData.TeleportUseSelf then
					txt = GameText.UI_TELEPORT_USE_TELEPORT_ITEM
				end

				if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
					txt = GameText.UI_TELEPORT_USE_TELEPORT_ITEM_Arcade
				end

				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", txt, function()
					self.eventUseItemId = itemId
				end, function()
					return
				end)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_ItemUseError)
			end

			return
		end

		if itemId == MS_ItemData.ItemID_SanAdd then
			if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_ItemUseErrorInMaze)

				return
			end
		elseif (itemId == MS_ItemData.ItemID_MoveFast or itemId == MS_ItemData.ItemID_FogFar or itemId == MS_ItemData.ItemID_SanAddMaze or itemId == MS_ItemData.SceneMarkItemMaze) and MS_StoryList.IsStoryMaze(self.storyId) == false and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == false then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_ItemUseErrorNotInMaze)

			return
		end
	end

	self.eventUseItemId = itemId
end

function AnimalBase:HandleUseItem()
	if self:IsWillDead() == true or self:IsShow() == false or self:IsStop() == true then
		return
	end

	if self.eventUseItemId <= 0 then
		return
	end

	local ret = true
	local errorStr = GameText.Story_ItemUseError

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.eventUseItemId > 0 and self:IsFreeSkillEnable() == true then
		local num = self.gameController:GetBagItemNum(self.eventUseItemId)

		if num > 0 then
			local itemData = MS_ItemData.GetItemData(self.eventUseItemId)
			local type = itemData.Type

			if type == MS_ItemData.Type.HpRecovery then
				if self.animalValue:IsPropertyMax(MS_HeroData.Property.Hp) == false then
					self:EatItem(self.eventUseItemId)
				end
			elseif type == MS_ItemData.Type.MpRecovery then
				-- block empty
			elseif type == MS_ItemData.Type.MedcineRecovery or type == MS_ItemData.Type.MedcineDefense or type == MS_ItemData.Type.MedcineStrengthen or type == MS_ItemData.Type.NoDebuffer then
				self:EatItem(self.eventUseItemId)
			elseif type == MS_ItemData.Type.ThrowStraightLine or type == MS_ItemData.Type.ThrowParabola then
				self:ThrowItem(self.eventUseItemId)
			elseif type == MS_ItemData.Type.Exp then
				-- block empty
			elseif type == MS_ItemData.Type.Talent then
				-- block empty
			elseif type == MS_ItemData.Type.Teleport then
				ret = self:ChangeToTransferStart()

				if ret == true then
					self.gameController:TransferStart(self.eventUseItemId)
					AudioCtrl.SetUIAudio("refresh")
				end
			elseif type == MS_ItemData.Type.SceneMark then
				if self.moveTouchZoneType ~= SceneBase.ZoneType.ZoneElevator and self:IsOnStair() == false then
					self.eventBeaconId = self.eventUseItemId
					ret = self:ChangeToEvent(AnimalBase_Define.MoveStateType.BeaconStart)
				end
			elseif type == MS_ItemData.Type.Reborn and MS_StoryList.IsStoryDream(self.storyId) == false then
				ret = self.gameController:SecondaryHostReborn(itemData.Param1)

				if ret == true then
					self.gameController:UseBagItem(self.eventUseItemId, 1)
				end
			end
		else
			errorStr = GameText.Story_BagItemNotEnough
		end
	end

	if ret == false then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", errorStr)
	end

	self.eventUseItemId = 0
end

function AnimalBase:PressAssistButton(assistButton)
	self.eventAssistButtonClick = assistButton
end

function AnimalBase:HandleAssistButton()
	if self:IsWillDead() == true or self:IsShow() == false then
		return
	end

	if self.eventAssistButtonClick <= 0 then
		return
	end

	if self.eventAssistButtonClick == ControllerMain.AssistButton.Climb then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local stairId, stairTouchType, stairTouchPos, stairTouchRot = self.gameController:GetStairInfo()

			if stairId > 0 then
				local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbStartReady, AnimalBase_Define.MoveStateChangeLevel.Low)

				if ret == true then
					self:ClearLockPlayer()

					self.moveStairTouchType = stairTouchType
					self.moveStairId = stairId
					self.moveStairClimbStart = 0

					self.moveStairClimbTargetPos:SetVector3(stairTouchPos)
					self.moveStairClimbTargetRot:SetQuaternion(stairTouchRot)
					self:SetPosByWorldPos(stairTouchPos, false)
					self:SetRotation(stairTouchRot, false)
				end
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Dialog then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			self.gameController:SwitchToDialog()
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Picking then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsHavePickUpItem()

			if ret == true then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.Get, AnimalBase_Define.MoveStateChangeLevel.High)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Worshiping then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsSaveReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.SaveStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.WorshipingEnd then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and (self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart or self.moveStateNow == AnimalBase_Define.MoveStateType.SaveLoop) then
			self:ChangeToEvent(AnimalBase_Define.MoveStateType.SaveEnd)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.WorshipingRest then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and (self.moveStateNow == AnimalBase_Define.MoveStateType.SaveStart or self.moveStateNow == AnimalBase_Define.MoveStateType.SaveLoop) then
			self.gameController:HostPlayerReborn()
			self.gameController:CloseSaveMenu()
			VfxManager.PlayBind(self:GetTransform(), AnimalBase_Define.VfxName_Rest)

			local tmpNoDeath = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.NoDeath)

			if tmpNoDeath > 0 then
				self:ClearStatusById(MS_ItemData.StatusId_TrophyNoDeath)
			end

			local tmpShield = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.Shield)

			if tmpShield > 0 then
				self:ClearStatusById(MS_ItemData.StatusId_TrophyShield)
			end

			local tmpShieldSmall = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.ShieldSmall)

			if tmpShieldSmall > 0 then
				self:ClearStatusById(MS_ItemData.StatusId_TrophyShieldSmall)
			end

			if tmpNoDeath > 0 then
				self:AddStatus(self:GetVirtualPlayer(), MS_ItemData.StatusId_TrophyNoDeath, 0, MS_StatusData.SourceType.Trophy, 0, false)
			end

			if tmpShield > 0 then
				self:AddStatus(self:GetVirtualPlayer(), MS_ItemData.StatusId_TrophyShield, 0, MS_StatusData.SourceType.Trophy, 0, false)
			end

			if tmpShieldSmall > 0 then
				self:AddStatus(self:GetVirtualPlayer(), MS_ItemData.StatusId_TrophyShieldSmall, 0, MS_StatusData.SourceType.Trophy, 0, false)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Carriage then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsCarriageReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.CarriageStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.CarriageEnd then
		-- block empty
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.ViewMap then
		if MS_StoryList.IsStoryCarriage(self.storyId) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:OpenMapReady()

			if ret == true then
				self:ChangeToMap()
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.ViewMapEnd then
		if MS_StoryList.IsStoryCarriage(self.storyId) == true and self.isHost == true then
			self.gameController:CloseMap()
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Change then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self:IsSkilling() == false then
			self:ChangeToEvent(AnimalBase_Define.MoveStateType.ChangeStart)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.ChangeEnd then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true then
			self:ChangeToEvent(AnimalBase_Define.MoveStateType.ChangeEnd)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.ChangeRebornEnd then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true then
			self:ChangeToEvent(AnimalBase_Define.MoveStateType.ChangeRebornEnd)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Execute then
		if self.skillExecuteAttack == true and self.skillExecuteTarget ~= nil and self:CheckSkillExecuteEnable(self.skillExecuteTarget) == true then
			self:ReadySkillExecute(self.skillExecuteTarget)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Backstab then
		if self.skillBackstabAttack == true and self.skillBackstabTarget ~= nil and self:CheckSkillBackstabEnable(self.skillBackstabTarget) == true then
			self:ReadySkillBackstab(self.skillBackstabTarget)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Bridge then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsBridgeReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.BridgeStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Door then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsDoorReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.DoorStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.DoorHint then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsDoorHintReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.DoorHintStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Gate then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsGateReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.OpenGate)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.GateHint then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsGateHintReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.GateHintStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.VirtualWall then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsVirtualWallReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.VirtualWallStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.VirtualWallHint then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsVirtualWallHintReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.VirtualWallHintStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Entrance then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsEntranceReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.EntranceStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Statue then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsStatueReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.StatueStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Fountain then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsFountainReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.FountainStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Honeypot then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsHoneypotReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.HoneypotStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.TimeLine then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			self:ClearLockPlayer()
			self.sceneController:UpdateLockPlayer()
			self.gameController:OpenTimeLine(false)
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Elevator then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsElevatorReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.ElevatorStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Cage then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsCageReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.CageStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.StairKick then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsStairKickReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.StairKick)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.CoverKick then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsCoverKickReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.CoverKick)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.CoverKickHint then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsCoverKickHintReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.CoverKickHintStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Crate then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local status = self.gameController:GetCrateStatus()

			if status ~= Crate.Status.Empty then
				local type = self.gameController:GetCrateType()

				if type == Crate.Type.Common then
					if status == Crate.Status.Close then
						self:ChangeToEvent(AnimalBase_Define.MoveStateType.OpenCrate)
					end
				elseif type == Crate.Type.Maze then
					if status == Crate.Status.Close then
						self:ChangeToEvent(AnimalBase_Define.MoveStateType.CrateStart)
					elseif status == Crate.Status.Unlock then
						self:ChangeToEvent(AnimalBase_Define.MoveStateType.OpenCrate)
					end
				end
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.Bonefire then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move then
			local ret = self.gameController:IsBonefireReady()

			if ret == true then
				self:ChangeToEvent(AnimalBase_Define.MoveStateType.BonefireStart)
			end
		end
	elseif self.eventAssistButtonClick == ControllerMain.AssistButton.BonefireEnd and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.isHost == true then
		self:ChangeToEvent(AnimalBase_Define.MoveStateType.BonefireEnd)
	end

	self.eventAssistButtonClick = 0
end

function AnimalBase:CheckStairOut(dir)
	if dir ~= AnimalBase_Define.StairTouch.Up and dir ~= AnimalBase_Define.StairTouch.Down then
		return false
	end

	local nowPos = self:GetPosByWorldPos()
	local stairOut = self.scene:CheckStairArrive(self.moveStairId, dir, nowPos)

	if stairOut == true then
		if dir == AnimalBase_Define.StairTouch.Up then
			if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbEndUp2, AnimalBase_Define.MoveStateChangeLevel.High)
			else
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbEndUp, AnimalBase_Define.MoveStateChangeLevel.High)
			end

			self.scene:GetStairEndPosition(self.moveStairId, self.moveStairClimbTargetPos, dir)
			self:AdjustPositionByGround(self.moveStairClimbTargetPos, self.moveStairClimbTargetPos, true)

			return true
		elseif dir == AnimalBase_Define.StairTouch.Down then
			if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 then
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbEndDown2, AnimalBase_Define.MoveStateChangeLevel.High)
			else
				self:ChangeMoveState(AnimalBase_Define.MoveStateType.ClimbEndDown, AnimalBase_Define.MoveStateChangeLevel.High)
			end

			self.scene:GetStairEndPosition(self.moveStairId, self.moveStairClimbTargetPos, dir)
			self:AdjustPositionByGround(self.moveStairClimbTargetPos, self.moveStairClimbTargetPos, true)

			return true
		end
	end

	return false
end

function AnimalBase:GetDeadPosition()
	return self.deadPosition
end

function AnimalBase:PressTestButtonE()
	self.eventTestButtonE = true
end

function AnimalBase:PressTestButtonAlt()
	self.eventTestButtonAlt = true
end

function AnimalBase:HandleTestButtonE()
	if self.eventTestButtonE == true then
		if DebugTestDeadAnimation == true then
			self:TestDeath(true)
		end

		self.eventTestButtonE = false
	end
end

function AnimalBase:HandleTestButtonAlt()
	if self.eventTestButtonAlt == true then
		if DebugTestDeadAnimation == true then
			self:TestDeath(false)
		end

		self.eventTestButtonAlt = false
	end
end

function AnimalBase:TestDeath(flg)
	if DebugTestDeadAnimation == true then
		if self.moveStateNow == AnimalBase_Define.MoveStateType.Dead then
			SystemHelper.LogTest("========TestDeath===333=flg==" .. tostring(flg))
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.Force)
			self:SetCharacterPuppetMaster(false, 1, 1)
		else
			SystemHelper.LogTest("========TestDeath===111=flg==" .. tostring(flg))

			if flg == true then
				self.moveDeadType = AnimalBase_Define.DeadType.Back
			else
				self.moveDeadType = AnimalBase_Define.DeadType.Front
			end

			local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Dead, AnimalBase_Define.MoveStateChangeLevel.Force)

			if ret == true then
				SystemHelper.LogTest("========TestDeath===222=flg==" .. tostring(flg))
				self:OnDeadStart()
			end
		end
	end
end

function AnimalBase:SetCharacterPuppetMaster(flg, pinWeight, muscleWeight)
	if self.characterPuppetMasterEnable == false and flg == true then
		if self.characterPuppetMaster ~= nil then
			self.characterPuppetMaster.pinWeight = pinWeight
			self.characterPuppetMaster.muscleWeight = muscleWeight
			self.characterPuppetMaster.enabled = flg

			self.tfPuppetMaster.gameObject:SetActive(flg)
		end

		self.characterPuppetMasterEnable = true
	elseif self.characterPuppetMasterEnable == true and flg == false then
		if self.characterPuppetMaster ~= nil then
			self.characterPuppetMaster.enabled = flg

			self.tfPuppetMaster.gameObject:SetActive(flg)
		end

		self.characterPuppetMasterEnable = false
	end
end

function AnimalBase:OnDeadTrigger(trigger)
	if trigger == 1 then
		if self.type == AnimalBase_Define.Type.Hero then
			self:SetCharacterPuppetMaster(true, 1, 1)
		end
	elseif trigger == 2 then
		self:OnDeadHide()
	end
end

function AnimalBase:OnDeadStart()
	if self.isHost == false and (self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true or self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == true or BattleData.IsDarkForestScene() == true or BattleData.IsDreamScene() == true) then
		local tfVfxRoot = self:GetBodyChest()

		if tfVfxRoot ~= nil then
			VfxManager.PlayFreezeMulti(AnimalBase_Define.VfxName_NightmareDeath, tfVfxRoot.position, nil, nil)
		end

		AudioCtrl.SetHeroAudio("death", self:GetPosByWorldPos(), self.animalId, nil, nil, true)
	end
end

function AnimalBase:OnDeadHide()
	if self.isHost == false and self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == false and self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == false and BattleData.IsDarkForestScene() == false and BattleData.IsDreamScene() == false then
		local tfVfxRoot = self:GetBodyHips()

		if tfVfxRoot ~= nil then
			VfxManager.PlayFreezeMulti("vfx_common_death", tfVfxRoot.position, nil, nil)
		end

		AudioCtrl.SetHeroAudio("death", self:GetPosByWorldPos(), self.animalId, nil, nil, true)
		UIManager.SendMessage("HeadInfo", "SetDead", self.animalId)
		self:Hide()

		if self.deadHide == false then
			self.deadHide = true

			self:OnDeadFinish()
		end
	end
end

function AnimalBase:OnDeadFinish()
	if DebugTestDeadAnimation == true then
		return
	end

	self:ClearTrickTouch()
	self:ClearSkillTouchAttackPlayer()
	self:ClearSkillTouchHitPlayer()
	self:ClearSkillTouchHitShell()
	self:ClearTouchHitCombo()
	self:ClearStatusAll()
	self:ClearSelfEffectLoopAll()

	if self.isHost == true then
		if self.isHostBack == false then
			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
				local allDead = self.sceneController:IsHostPlayerAllDead()

				if allDead == true or MS_StoryList.IsStoryDream(self.storyId) == true then
					if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and self.moveDeadType == AnimalBase_Define.DeadType.Drop and self.ArcadeAfterDropHp > 0 then
						self.gameController:DisappearSanMonster()
						self.gameController:DisappearCallHero()
						UIManager.SendMessage("Curtain", "BlackFadeIn", 1, 0, function()
							UIManager.SendMessage("Curtain", "BlackFadeOut", 1)
							self.gameController:HostPlayerReborn()
						end)
					else
						self.gameController:HostPlayerDeadFinish()
						UIManager.SendMessage("Mainmenu", "SetDead", true)

						if self.gameController:IsBossMode() == true then
							AudioCtrl.SetBGMAudio(0)
						else
							AudioCtrl.SetBGMAudio(AudioCtrl.DepressAudioRadio)
						end
					end
				else
					self.gameController:DisappearSanMonster()
					self.gameController:DisappearCallHero()
					UIManager.SendMessage("Curtain", "BlackFadeIn", 1, 0, function()
						local sceneController = ST_Main.GetSceneController()

						if sceneController ~= nil then
							sceneController:SwitchHostPlayer(0, ControllerMain.SwitchType.ChangeNextDead, sceneController:GetGameController():IsBossMode(), nil)
						end
					end)
				end
			else
				UIManager.SendMessage("Mainmenu", "SetReborn", self.animalValue:IsRebornEnable())
			end
		end
	else
		UIManager.SendMessage("HeadInfo", "SetDead", self.animalId)
	end
end

function AnimalBase:WillDead(attackVPlayer, skillData)
	if self.gameController ~= nil then
		if self.isHost == true and self.isHostBack == false then
			if attackVPlayer ~= nil and skillData ~= nil then
				FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.DeathTimes, self.heroId, attackVPlayer:GetHeroId(), skillData.SkillIndex)
			end

			self.gameController:StopAttack()
		elseif self.boss > 0 then
			self.gameController:StopAttack()
		end
	end
end

function AnimalBase:RevertDead()
	if self.gameController ~= nil then
		if self.isHost == true and self.isHostBack == false then
			self.gameController:ResumeAttack()
		elseif self.boss > 0 then
			self.gameController:ResumeAttack()
		end
	end
end

function AnimalBase:ChangeToDeath(reason)
	self.deadSkillFlg = false
	self.deadFlg = true
	self.deadHide = true
	self.deadReason = reason

	self.deadPosition:SetVector3(self:GetPosByWorldPos())

	self.moveMuteki = false
	self.moveMutekiIgnoreId = 0
	self.moveNoDamage = false
	self.moveNoWeakness = false
end

function AnimalBase:ChangeToDead(reason)
	if self:IsDead() == true then
		return
	end

	if reason == AnimalBase_Define.DeadReason.Drop then
		if self.moveOnGround == true then
			return
		end
	else
		if self.moveOnGround == false then
			return
		end

		if self:IsSkillingById(AnimalBase_Define.SkillType.Execute, 1) == true or self:IsSkillingById(AnimalBase_Define.SkillType.Backstab, 1) == true then
			return
		end

		if self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround then
			local deadExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.DeadExit)

			if deadExit <= 0 then
				return
			end
		end
	end

	local finalHit = false

	if self.boss > 0 or self.isHost == true and self.isHostBack == false then
		finalHit = self.gameController:IsHaveFinalHit(self.boss > 0, self.isHost)
	end

	if finalHit == true then
		local finish = self.gameController:FinalHit()

		if finish == true then
			self:Dead(false, reason, true)
		end
	else
		if reason ~= AnimalBase_Define.DeadReason.Drop and self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
			local deadExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.DeadExit)

			if deadExit <= 0 then
				return
			end
		end

		self:Dead(false, reason, false)
	end
end

function AnimalBase:SkillDeadReady(reason)
	if self:IsWillDead() == true then
		return
	end

	self.deadSkillFlg = true
	self.deadSkillReason = reason
end

function AnimalBase:CheckSkillDead()
	if self.deadSkillFlg == true then
		self.deadSkillFlg = false

		if self:IsDead() == false then
			self:Dead(true, self.deadSkillReason, false)

			if self.deadHide == false then
				self:OnDeadFinish()

				self.deadHide = true

				self:Hide()
			end
		end
	end
end

function AnimalBase:KillEnemy(id)
	return
end

function AnimalBase:PickUpBullet(addNum)
	return
end

function AnimalBase:Dead(isFromSkill, reason, isFinalHit)
	if isFinalHit == true then
		self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.GameMode)
	end

	if self.isHost == true and self.isHostBack == false then
		local ret = self.gameController:HostPlayerDead()

		if ret == false then
			return false
		end
	end

	if isFromSkill == true then
		self.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
	elseif self.type == AnimalBase_Define.Type.HomeBase or self.type == AnimalBase_Define.Type.Other then
		-- block empty
	else
		if reason == AnimalBase_Define.DeadReason.Drop then
			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual then
				local hpValue = self.animalValue:GetProperty(MS_HeroData.Property.Hp)
				local hpValueMax = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
				local subHp = hpValueMax * 0.15

				self.animalValue:SubProperty(MS_HeroData.Property.Hp, subHp)

				self.ArcadeAfterDropHp = self.animalValue:GetProperty(MS_HeroData.Property.Hp)
			else
				self.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
			end

			self.moveDeadType = AnimalBase_Define.DeadType.Drop
		else
			local deadLie = false

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
				if (self.moveHitType == AnimalBase_Define.HitType.FrontFly or self.moveHitType == AnimalBase_Define.HitType.FrontFlyFar or self.moveHitType == AnimalBase_Define.HitType.FrontFlyCrow or self.moveHitType == AnimalBase_Define.HitType.BackFly or self.moveHitType == AnimalBase_Define.HitType.BackFlyFar or self.moveHitType == AnimalBase_Define.HitType.BackFlyCrow or self.moveHitType == AnimalBase_Define.HitType.Up or self.moveHitType == AnimalBase_Define.HitType.Down or self.moveHitType == AnimalBase_Define.HitType.Execute or self.moveHitType == AnimalBase_Define.HitType.Backstab or self.moveHitType == AnimalBase_Define.HitType.Backstab2) and self.animatorTrigger < AnimalBase_Define.TriggerHit.StandUp then
					deadLie = true
				end
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround and self.moveDropType ~= AnimalBase_Define.DropType.HeadUp and self.animatorTrigger < 1 then
				deadLie = true
			end

			if deadLie == true then
				self.moveDeadType = AnimalBase_Define.DeadType.Lie
			elseif self.skillLastHitBehind == true then
				self.moveDeadType = AnimalBase_Define.DeadType.Back
			else
				self.moveDeadType = AnimalBase_Define.DeadType.Front
			end
		end

		local ret = self:ChangeMoveState(AnimalBase_Define.MoveStateType.Dead, AnimalBase_Define.MoveStateChangeLevel.Force)

		if ret == true then
			self:OnDeadStart()
		end
	end

	self.deadSkillFlg = false
	self.deadFlg = true
	self.deadHide = false
	self.deadReason = reason

	self.deadPosition:SetVector3(self:GetPosByWorldPos())

	self.moveMuteki = false
	self.moveMutekiIgnoreId = 0
	self.moveNoDamage = false
	self.moveNoWeakness = false

	self:DisableSkillTouchHitPlayer()
	self:DisableSkillTouchHitShell()
	self:ClearSelfEffectLoopAll()
	self:CloseHeadInfo()
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
	self:SaveStatus()
	self:ClearStatusAll()
	self:ClearLockPlayer()

	if self.isHost == false then
		self.beTree:Stop()
		self:SetBodyCollider(false)
	end

	self:EndAimControl()
	self:EndAimDelay()
	self:EndAim()
	self:ClearSkillEffectAll()
	self:ClearSkillEffectLoopAll()
	self.animalValue:Dead()
	self:StopSkillAudio()
	self:ExitBattle()
	AudioCtrl.SetHeroAudio(self.modelName .. "/dead", self:GetPosByWorldPos(), self.animalId, nil, nil, true)

	if self.isHost == true and self.isHostBack == false then
		self.cameraScene:SetFollowingType(CameraMain.FollowingType.Dead)
		AudioCtrl.SetHeroAudio("sfx_death", nil, "")
	elseif self:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
			self.gameController:SanMonsterDead(self)
		end
	elseif self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == true then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
			self.gameController:CallHeroDead(self)
		end
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		self.gameController:KillMonster(self:GetStoryMonsterId())
	end

	if self.boss > 0 then
		self.gameController:BossDead()
		self.cameraScene:SetBossCameraDistanceSkill(0)
		self.cameraScene:LockSkillingPlayer(nil)
	end

	return true
end

function AnimalBase:Born(reason, toBorn)
	self.bornReason = reason

	if toBorn == true then
		self:ChangeMoveState(AnimalBase_Define.MoveStateType.Born, AnimalBase_Define.MoveStateChangeLevel.Force)

		local isAudioExit = AudioCtrl.isAudioExist("Character/" .. self.modelName .. "/born")

		if isAudioExit == true then
			AudioCtrl.SetHeroAudio(self.modelName .. "/born", self.tfModel, self.animalId)
		end
	end
end

function AnimalBase:PressReborn()
	self.eventReborn = true
end

function AnimalBase:HandleReborn()
	if self.eventReborn == true then
		if self.isHost == true then
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.Reborn, AnimalBase_Define.MoveStateChangeLevel.Force)
		else
			self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.Force)
		end

		self.eventReborn = false
	end
end

function AnimalBase:Reborn(reset, propertyRateList)
	if self.type == AnimalBase_Define.Type.HomeBase or self.type == AnimalBase_Define.Type.Other then
		-- block empty
	else
		self.deadSkillFlg = false
		self.deadFlg = false
		self.rebornFrame = ControllerMain.LogicFrame
		self.deadHide = false
		self.deadReason = AnimalBase_Define.DeadReason.None
		self.moveBattleMode = 0
		self.moveBattleEndTime = 0
		self.moveDropDamageHeight = 0
		self.moveMuteki = false
		self.moveMutekiIgnoreId = 0
		self.moveNoDamage = false
		self.moveNoWeakness = false
		self.moveHitType = AnimalBase_Define.HitType.None
		self.moveHitTypeOld = self.moveHitType
		self.moveHitStatusWeak = false
		self.moveHitStatusWeakRecovery = false
		self.moveHitStatusWeakToward = false

		if self.moveHitData ~= nil then
			self.moveHitData:Disable()
		end

		self.moveHitPeriodFrame = 0

		self:StopMovementImmediately(true)
		self:SetMoveCage(false, Vector3.s_zero, 0)
		self:ClearSkillButtonAll()
		self:ClearMoveButtonAll()
		self:ClearTrickTouch()
		self:ClearSkillTouchAttackPlayer()
		self:ClearSkillTouchHitPlayer()
		self:ClearSkillTouchHitShell()
		self:ClearTouchHitCombo()

		if reset == true then
			self:ClearStatusAll()
		else
			self:ClearStatusAllDebuffer()
		end

		self:ResetGrade()
		self.animalValue:Reborn(reset, propertyRateList)

		if self.isHost == true then
			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
				if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and self.moveDeadType == AnimalBase_Define.DeadType.Drop and self.ArcadeAfterDropHp > 0 then
					local nowHp = self.animalValue:GetProperty(MS_HeroData.Property.Hp)
					local subHp = nowHp - self.ArcadeAfterDropHp

					self.ArcadeAfterDropHp = 0

					self.animalValue:SubProperty(MS_HeroData.Property.Hp, subHp)
				else
					self:SetRebornPosition(FS_UserData.story:GetRebornPos())
					self:SetRebornLook(FS_UserData.story:GetRebornLook())

					if not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) or FS_UserData.story:GetStoryId() ~= 1301 then
						AudioCtrl.SetUIAudio("refresh")
					end
				end
			end

			self:SetCharacterPuppetMaster(false, 1, 1)
		end

		self:SetBodyCollider(true)
		self:ResetState()

		if MS_StoryList.IsStoryCarriage(self.storyId) == false then
			ProjectXPathFindingAI.InitPathFinder(self.animalId)
		end

		if self.animalBrain ~= nil then
			self.animalBrain:initialize(self)

			if self.beTree ~= nil then
				self.beTree:Reset()
			end
		end
	end
end

function AnimalBase:SetRebornPosition(pos)
	self.rebornPosition:SetVector3(pos)
end

function AnimalBase:GetRebornPosition()
	return self.rebornPosition
end

function AnimalBase:SetRebornLook(look)
	self.rebornLook:SetVector3(look)
end

function AnimalBase:GetRebornLook()
	return self.rebornLook
end

function AnimalBase:StopMovement()
	self.moveFlg = false
end

function AnimalBase:StopMovementImmediately(resetParam)
	self:StopMovement()
	self:ResetMoveSpeed()
	self:ResetMoveSlopeSlipSpeed()

	if resetParam == true then
		self:ResetMoveSpeedParam()
		self.moveDir:Set(0, 0, 0)
	end
end

function AnimalBase:Stop()
	self:StopSkill()
	self:ResetJoystickMoveDir()
	self:PauseStatusAll()
	self:ClearLockPlayer()
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
	self:StopMovementImmediately(true)

	self.moveBattleMode = 0
	self.moveBattleEndTime = 0
	self.stopFlg = true
end

function AnimalBase:StopToMenu()
	self:StopSkill()
	self:ResetJoystickMoveDir()
	self:PauseStatusAll()
	self:ClearSkillButtonAll()
	self:ClearMoveButtonAll()
	self:StopMovementImmediately(true)

	self.moveBattleMode = 0
	self.moveBattleEndTime = 0
	self.stopFlg = true
end

function AnimalBase:Restart()
	self:ResumeStatusAll()

	local clearSkill = true

	if self.isHost == false and self:IsBornSkilling() == true then
		clearSkill = false
	end

	if clearSkill == true then
		self:ClearSkillButtonAll()
	end

	self:ClearMoveButtonAll()
	self:StopMovementImmediately(true)

	self.skillNextWaitTimeStart = 0
	self.skillNextWaitTime = 0
	self.skillNextId = 0

	self:ResetMoveStateNext()

	self.stopFlg = false
	self.stopRest = 2
end

function AnimalBase:End()
	self.endFlg = true

	self:Stop()

	if self.type == AnimalBase_Define.Type.Hero and self:IsDead() == false and self:IsShow() == true and (BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true or BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true) then
		FS_BattleData_OccupyMode.OverrideBattleData(self.animalId, FS_BattleData_OccupyMode.DataType.LiveTime, ControllerMain.ConvertFrameToSec(ControllerMain.LogicFrame - self.rebornFrame))
	end

	self:StopMovementImmediately(true)
	self:ChangeMoveState(AnimalBase_Define.MoveStateType.Move, AnimalBase_Define.MoveStateChangeLevel.Force)

	if self.isHost == false and self.animalBrain ~= nil then
		self.animalBrain.isEnd = true
	end

	self.animalValue:SetRebornEnable(false)
end

function AnimalBase:SetMoveLock(flg)
	self.moveLock = flg

	if flg == true then
		self:ClearSkillButtonAll()
		self:ClearMoveButtonAll()
		self:StopMovementImmediately(true)
	end
end

function AnimalBase:UpdateMoveSpeed()
	self.moveSpeedTarget = 0

	local deltaTime = ControllerMain.GetLogicDeltaTime()

	if self.moveFlg == true then
		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			if self.moveTurnEnable == true and self.moveSpeed <= 0 and Mathf.Abs(self.moveTurnTarget) > 0 then
				self.moveSpeedTarget = 0
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Slow then
				self.moveSpeedTarget = AnimalBase_Define.MotionSpecialWalkSpeed
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Normal then
				self.moveSpeedTarget = AnimalBase_Define.MotionSpecialRunSpeed
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Fast then
				self.moveSpeedTarget = AnimalBase_Define.MotionSpecialSprintSpeed
			end

			if self:IsHaveLogicRule(AnimalBase_Define.LogicRule.WalkOnly) and self.moveSpeedTarget > AnimalBase_Define.MotionSpecialWalkSpeed then
				self.moveSpeedTarget = AnimalBase_Define.MotionSpecialWalkSpeed
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
				self.moveSpeedTarget = AnimalBase_Define.MotionSpecialWalkSpeed
			end

			if MS_StoryList.IsStoryDream(self.storyId) == true then
				if self.moveSpeedTarget > AnimalBase_Define.MotionSpecialRunSpeed then
					self.moveSpeedTarget = AnimalBase_Define.MotionSpecialRunSpeed
				end
			elseif MS_StoryList.IsStoryCarriage(self.storyId) == true and self.moveSpeedTarget > AnimalBase_Define.MotionCarriageSpeed then
				self.moveSpeedTarget = AnimalBase_Define.MotionCarriageSpeed
			end

			if self.moveSpeedSmooth == false then
				self.moveSpeed = self.moveSpeedTarget
			elseif self.moveSpeed < self.moveSpeedTarget then
				self.moveSpeed = self.moveSpeed + self.moveSpeedSpecialAccelerate * deltaTime
				self.moveSpeed = Mathf.Clamp(self.moveSpeed, 0, self.moveSpeedTarget)
			elseif self.moveSpeed > self.moveSpeedTarget then
				local tmpDecelerate = self.moveSpeedSprintDecelerate

				if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce then
					tmpDecelerate = AnimalBase_Define.MotionTimeLineMoveDecelerate
				end

				self.moveSpeed = self.moveSpeed - self.moveSpeedSpecialDecelerate * deltaTime
				self.moveSpeed = Mathf.Clamp(self.moveSpeed, self.moveSpeedTarget, AnimalBase_Define.MotionSpecialSprintSpeed)
			end
		else
			if self.moveTurnEnable == true and self.moveSpeed <= 0 and Mathf.Abs(self.moveTurnTarget) > 0 then
				self.moveSpeedTarget = 0
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Slow then
				self.moveSpeedTarget = AnimalBase_Define.MotionWalkSpeed
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Normal then
				self.moveSpeedTarget = AnimalBase_Define.MotionRunSpeed
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Fast then
				self.moveSpeedTarget = AnimalBase_Define.MotionSprintSpeed
			end

			if self:IsHaveLogicRule(AnimalBase_Define.LogicRule.WalkOnly) and self.moveSpeedTarget > AnimalBase_Define.MotionWalkSpeed then
				self.moveSpeedTarget = AnimalBase_Define.MotionWalkSpeed
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
				self.moveSpeedTarget = AnimalBase_Define.MotionWalkSpeed
			end

			if MS_StoryList.IsStoryDream(self.storyId) == true then
				if self.moveSpeedTarget > AnimalBase_Define.MotionRunSpeed then
					self.moveSpeedTarget = AnimalBase_Define.MotionRunSpeed
				end
			elseif MS_StoryList.IsStoryCarriage(self.storyId) == true and self.moveSpeedTarget > AnimalBase_Define.MotionCarriageSpeed then
				self.moveSpeedTarget = AnimalBase_Define.MotionCarriageSpeed
			end

			if self.moveSpeedSmooth == false then
				self.moveSpeed = self.moveSpeedTarget
			elseif self.moveSpeed < self.moveSpeedTarget then
				if self.moveSpeed < AnimalBase_Define.MotionWalkSpeed then
					self.moveSpeed = self.moveSpeed + self.moveSpeedWalkAccelerate * deltaTime
				elseif self.moveSpeed < AnimalBase_Define.MotionRunSpeed then
					self.moveSpeed = self.moveSpeed + self.moveSpeedRunAccelerate * deltaTime
				else
					self.moveSpeed = self.moveSpeed + self.moveSpeedSprintAccelerate * deltaTime
				end

				self.moveSpeed = Mathf.Clamp(self.moveSpeed, 0, self.moveSpeedTarget)
			elseif self.moveSpeed > self.moveSpeedTarget then
				if self.moveSpeed > AnimalBase_Define.MotionRunSpeed then
					local tmpDecelerate = self.moveSpeedSprintDecelerate

					if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce then
						tmpDecelerate = AnimalBase_Define.MotionTimeLineMoveDecelerate
						self.moveSpeed = AnimalBase_Define.MotionRunSpeed
					end

					self.moveSpeed = self.moveSpeed - tmpDecelerate * deltaTime
				elseif self.moveSpeed > AnimalBase_Define.MotionWalkSpeed then
					local tmpDecelerate = self.moveSpeedSprintDecelerate

					if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce then
						tmpDecelerate = AnimalBase_Define.MotionTimeLineMoveDecelerate
					end

					self.moveSpeed = self.moveSpeed - tmpDecelerate * deltaTime
				else
					self.moveSpeed = self.moveSpeed - self.moveSpeedWalkDecelerate * deltaTime
				end

				self.moveSpeed = Mathf.Clamp(self.moveSpeed, self.moveSpeedTarget, AnimalBase_Define.MotionSprintSpeed)
			end
		end
	else
		if self.moveSpeedSmooth == false then
			self.moveSpeed = 0
		elseif self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			self.moveSpeed = self.moveSpeed - self.moveSpeedSpecialDecelerate * deltaTime
			self.moveSpeed = Mathf.Clamp(self.moveSpeed, 0, AnimalBase_Define.MotionSpecialSprintSpeed)
		else
			if self.moveSpeed > AnimalBase_Define.MotionRunSpeed then
				self.moveSpeed = self.moveSpeed - self.moveSpeedSprintDecelerate * deltaTime
			elseif self.moveSpeed > AnimalBase_Define.MotionWalkSpeed then
				self.moveSpeed = self.moveSpeed - self.moveSpeedRunDecelerate * deltaTime
			else
				self.moveSpeed = self.moveSpeed - self.moveSpeedWalkDecelerate * deltaTime
			end

			self.moveSpeed = Mathf.Clamp(self.moveSpeed, 0, AnimalBase_Define.MotionSprintSpeed)
		end

		if self.moveSpeed <= 0 then
			self.moveDir:Set(0, 0, 0)
		end
	end

	if self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true or self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
		if self.type == AnimalBase_Define.Type.Monster then
			local tmpSpeed = AnimalBase_Define.MotionSpecialSprintSpeed

			if self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Slow then
				tmpSpeed = AnimalBase_Define.MotionSpecialWalkSpeed
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Normal then
				tmpSpeed = AnimalBase_Define.MotionSpecialRunSpeed
			elseif self:GetMoveSpeedMode() == AnimalBase_Define.SpeedMode.Fast then
				tmpSpeed = AnimalBase_Define.MotionSpecialSprintSpeed
			end

			if tmpSpeed < self.moveSpeed then
				self.moveSpeed = tmpSpeed
			end
		elseif self:IsSkilling() == true then
			if self.moveSpeed > AnimalBase_Define.MotionSpecialWalkSpeed then
				self.moveSpeed = AnimalBase_Define.MotionSpecialWalkSpeed
			end
		elseif self.moveSpeed > AnimalBase_Define.MotionSpecialRunSpeed then
			self.moveSpeed = AnimalBase_Define.MotionSpecialRunSpeed
		end
	elseif self:IsMoveType(AnimalBase_Define.MoveType.Move) == true then
		if self:IsSkilling() == true then
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
			local skillMoveSpeed = AnimalBase_Define.MotionWalkSpeed

			if skillData ~= nil then
				skillMoveSpeed = skillData.SkillMoveSpeed
			end

			if skillMoveSpeed < self.moveSpeed then
				self.moveSpeed = skillMoveSpeed
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.MoveForce and self.moveSpeed > AnimalBase_Define.MotionWalkSpeed then
			self.moveSpeed = AnimalBase_Define.MotionWalkSpeed
		end
	end

	if self.groundSlopeAngle > AnimalBase_Define.MotionSlopeAngleMax then
		-- block empty
	else
		local tmpSpeedLenOld = self.moveSlopeSlipSpeed.magnitude
		local tmpSpeedLen = tmpSpeedLenOld - AnimalBase_Define.MotionSlipDownDecelerate * deltaTime

		if tmpSpeedLen <= 0 then
			self.moveSlopeSlipSpeed:Set(0, 0, 0)
		else
			tmpSpeedLen = Mathf.Clamp(tmpSpeedLen, 0, AnimalBase_Define.MotionSlopeSlipSpeed * ControllerMain.GetLogicDeltaTime())

			if MathHelper.IsZero(tmpSpeedLenOld) == false and MathHelper.IsZero(tmpSpeedLen) == false then
				self.moveSlopeSlipSpeed:SetNormalize()
				self.moveSlopeSlipSpeed:Mul(tmpSpeedLen)
			else
				self.moveSlopeSlipSpeed:Set(0, 0, 0)
			end
		end
	end
end

function AnimalBase:SetSpeedSmooth(flg)
	self.moveSpeedSmooth = flg
end

function AnimalBase:SetMoveSpeed(speed)
	self.moveSpeed = speed
	self.moveSpeed = Mathf.Clamp(self.moveSpeed, 0, AnimalBase_Define.MotionSprintSpeed)
end

function AnimalBase:SetMoveSpeedMode(mode)
	self.moveSpeedMode = mode
end

function AnimalBase:GetMoveSpeedMode()
	return self.moveSpeedMode
end

function AnimalBase:ResetMoveSpeed()
	self.moveSpeed = 0
end

function AnimalBase:GetMoveSpeed()
	return self.moveSpeed
end

function AnimalBase:ResetMoveSpeedParam()
	self.moveSpeedVertical = 0
	self.moveSpeedVerticalSpecial = 0
	self.moveSpeedHorizontalSpecial = 0
	self.moveSpeedVerticalSkill = 0
	self.moveSpeedHorizontalSkill = 0
end

function AnimalBase:SetMoveSlopeSlipSpeed(dir, speed)
	if speed > 0 then
		self.moveSlopeSlipSpeed:SetVector3(dir)

		if MathHelper.IsZero(self.moveSlopeSlipSpeed.sqrMagnitude) == false and MathHelper.IsZero(speed) == false then
			self.moveSlopeSlipSpeed:SetNormalize()
			self.moveSlopeSlipSpeed:Mul(speed)
		end
	else
		self.moveSlopeSlipSpeed:Set(0, 0, 0)
	end
end

function AnimalBase:ResetMoveSlopeSlipSpeed()
	self.moveSlopeSlipSpeed:Set(0, 0, 0)
end

function AnimalBase:IsLeftFootBehind()
	local nowPos = self:GetPosByWorldPos()
	local lpos = self.tfBoneLeftFoot:TransformPoint(Vector3.zero)
	local rpos = self.tfBoneRightFoot:TransformPoint(Vector3.zero)
	local lDir = lpos - nowPos
	local rDir = rpos - nowPos

	lDir.y = 0
	rDir.y = 0

	local ret = Vector3.Dot(lDir, rDir)

	if ret >= 0 then
		if rDir.sqrMagnitude > lDir.sqrMagnitude then
			return true
		else
			return false
		end
	else
		local forward = self:GetForward()

		ret = Vector3.Dot(rDir, forward)

		if ret >= 0 then
			return true
		else
			return false
		end
	end

	return false
end

function AnimalBase:GetCameraBox()
	return self.tfCameraBox
end

function AnimalBase:GetHitBoxPosition(tmpSkillIndex, tmpSkillCombo)
	if self.bodyHitCube[tmpSkillIndex] ~= nil and self.bodyHitCube[tmpSkillIndex][tmpSkillCombo] ~= nil then
		return self.bodyHitCube[tmpSkillIndex][tmpSkillCombo]:GetPosition()
	end

	SystemHelper.LogError("========GetHitBoxPosition error , skillIndex=" .. tmpSkillIndex .. ",skillCombo=" .. tmpSkillCombo .. ",heroId=" .. self.heroId)

	return Vector3.s_zero
end

function AnimalBase:GetAttackBoxTF(tmpSkillIndex, tmpSkillCombo)
	if self.tfAttackBox[tmpSkillIndex] ~= nil and self.tfAttackBox[tmpSkillIndex][tmpSkillCombo] ~= nil then
		return self.tfAttackBox[tmpSkillIndex][tmpSkillCombo]
	end

	return nil
end

function AnimalBase:GetAttackBoxPosition(tmpSkillIndex, tmpSkillCombo)
	local attBox = self:GetAttackBox(tmpSkillIndex, tmpSkillCombo)

	if attBox ~= nil then
		return attBox:GetPosition()
	end

	return Vector3.s_zero
end

function AnimalBase:GetAttackBoxRotation(tmpSkillIndex, tmpSkillCombo)
	local attBox = self:GetAttackBox(tmpSkillIndex, tmpSkillCombo)

	if attBox ~= nil then
		return attBox:GetRotation()
	end

	return Quaternion.s_identity
end

function AnimalBase:GetAttackBox(tmpSkillIndex, tmpSkillCombo)
	local boxType = self:GetAttackBoxType(tmpSkillIndex, tmpSkillCombo)

	if boxType == AnimalBase_Define.AttackBoxType.Skill then
		if self.bodyAttackCube[tmpSkillIndex] ~= nil and self.bodyAttackCube[tmpSkillIndex][tmpSkillCombo] ~= nil then
			return self.bodyAttackCube[tmpSkillIndex][tmpSkillCombo]
		end
	elseif boxType == AnimalBase_Define.AttackBoxType.Hand then
		if self:IsSkilling() == false then
			SystemHelper.LogError("========GetAttackBox error , self:IsSkilling() == false")
		end

		local handId = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillHand)

		if handId > 0 then
			if handId < AnimalBase_Define.SkillHandBody then
				local tmpId = (handId - 1) % 3 + 1

				if tmpId == AnimalBase_Define.SkillHand.LeftAndRight then
					if self.bodyHandCube[handId - 2] ~= nil and #self.bodyHandCube[handId - 2] > 0 then
						return self.bodyHandCube[handId - 2][1]
					end

					if self.bodyHandCube[handId - 1] ~= nil and #self.bodyHandCube[handId - 1] > 0 then
						return self.bodyHandCube[handId - 1][1]
					end
				elseif self.bodyHandCube[handId] ~= nil and #self.bodyHandCube[handId] > 0 then
					return self.bodyHandCube[handId][1]
				end
			elseif self.bodyHandCube[handId] ~= nil and #self.bodyHandCube[handId] > 0 then
				return self.bodyHandCube[handId][1]
			end
		end
	end

	SystemHelper.LogError("========GetAttackBox error , skillIndex=" .. tmpSkillIndex .. ",skillCombo=" .. tmpSkillCombo)

	return nil
end

function AnimalBase:UpdateFootEffect()
	if self:IsDead() == true then
		return
	end

	if self.moveOnGround == false or self:IsStanding() == true or self:IsOnStair() == true and self:IsStairClimbingEnd() == false or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		return
	end

	if self.boss <= 0 then
		local dis = Vector3.DistanceSquare(self:GetPosByWorldPos(), self.cameraScene:GetCameraRealPosition())

		if dis > AnimalBase_Define.AnimalFootstepsDistance * AnimalBase_Define.AnimalFootstepsDistance then
			return
		end
	end

	local leftFootWeight = math.floor(self:GetAnimatorParam(AnimalBase_Define.ParamType.LeftFoot) + 0.5)
	local rightFootWeight = math.floor(self:GetAnimatorParam(AnimalBase_Define.ParamType.RightFoot) + 0.5)

	if leftFootWeight < 1 and self.lastLeftFootWeight >= 1 then
		self:PlayFootstepsAudioAndEffect(self.tfBoneLeftFoot, 0)
	end

	if rightFootWeight < 1 and self.lastRightFootWeight >= 1 then
		self:PlayFootstepsAudioAndEffect(self.tfBoneRightFoot, 1)
	end

	self.lastLeftFootWeight = leftFootWeight
	self.lastRightFootWeight = rightFootWeight
end

function AnimalBase:PlayFootstepsAudioAndEffect(tfFoot, footIndex)
	AudioCtrl.SetFootstepsAudio(self.modelName, self.tfModel, self.animalId, self.moveTouchGroundType, self.type, footIndex)

	local vfxName = SceneBase.GetGroundVfxName(self.moveTouchGroundType)

	if vfxName ~= nil then
		local tmpPos = tfFoot.position

		if self.moveTouchWaterHeight > SceneBase.DefaultWaterHeight then
			tmpPos.y = self.moveTouchWaterHeight
		end

		VfxManager.PlayFreezeMulti(vfxName, tmpPos, nil, nil)
	end
end

function AnimalBase:UpdateLogicForAI()
	if self.isHost == false and self.beTree ~= nil then
		if DebugAIOff == true then
			self:StopMovementImmediately(true)

			if self.animalBrain ~= nil and self:GetAITarget() ~= nil then
				self.animalBrain:ClearAnimalTarget()
			end
		else
			self.beTree:Update()
		end
	end
end

function AnimalBase:UpdateLogicStart()
	if self:IsStart() == false then
		return
	end

	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		return
	end

	if self.stopFlg == false and self.stopRest > 0 then
		self.stopRest = self.stopRest - 1
	end

	self.animatorReset = false
	self.animatorResetTime = 0
	self.moveRevertFlg = false
	self.moveSpeedOld = self.moveSpeed
	self.animatorStateHashOld = self.animatorStateHash
	self.animatorLayerOld = self.animatorLayer
	self.animatorStateMoveHashOld = self.animatorStateMoveHash
	self.moveStateOld = self.moveStateNow
	self.skillIndexOld = self.skillIndex
	self.skillComboOld = self.skillCombo
	self.moveHitTypeOld = self.moveHitType
	self.moveTurnTarget = 0
	self.skillExecuteReady = false
	self.skillBackstabReady = false
	self.characterLogicRuleList = nil

	self.moveDirFramePos:Set(0, 0, 0)
	self:UpdatePositionLast()

	if self.isHost == true and self.isHostBack == false then
		self.cameraScene:SetWaterHeight(SceneBase.DefaultWaterHeight)
	end
end

function AnimalBase:UpdateLogicMovement()
	if self:IsStart() == false then
		return
	end

	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		return
	end

	if DebugConsole == true then
		self:HandleTestButtonE()
		self:HandleTestButtonAlt()
	end

	if self.deadSkillFlg == true then
		self:CheckSkillDead()

		self.deadSkillFlg = false
	end

	self:UpdateMoveTrigger()
	self:UpdateStatus()
	self:UpdateLogicForAI()
	self:CheckSkillCommand()
	self:CheckSkillNext()
	self:UpdateMoveState()
	self:UpdateSkillState()
	self:HandleTransfer()
	self:HandleReborn()
	self:HandleResetState()
	self:HandleAssistButton()
	self:HandleUseItem()
	self:HandleMoveStateNextSpecial()
	self:UpdateMoveStateLogic()
	self:UpdateLockPlayer()
	self:UpdateSightVisible()
	self:UpdateMoveType()

	if self:IsOnStair() == true then
		self.moveDirInertia:Set(0, 0, 0)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		self.moveDirInertia:SetVector3(self.moveDir)

		self.moveDirInertia.y = 0

		self.moveDirInertia:SetNormalize()
		self.moveDirInertia:Mul(self:GetMoveSpeed() * AnimalBase_Define.MotionFlyMove)

		self.moveDirInertia.y = self.moveDirInertia.y + AnimalBase_Define.MotionFly

		if self.moveDirInertia.y > AnimalBase_Define.MotionFlyHeightMax then
			self.moveDirInertia.y = AnimalBase_Define.MotionFlyHeightMax
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Born then
		self.moveDirInertia:Set(0, 0, 0)
	elseif self.moveOnGround == false then
		if self.moveStateDebugFly == false and self.groundY <= SceneBase.DefaultGroundPosition.y then
			if self.isHost == true then
				self.cameraScene:LockPosition(true)
			end

			if self:IsDead() == false then
				local nowPos = self:GetPosByWorldPos()
				local dropHeight = self.moveFallStart - nowPos.y

				if self.animalValue:IsDropDead(dropHeight) == true then
					self:ChangeToDead(AnimalBase_Define.DeadReason.Drop)
				end
			end
		end

		if self.moveStateNow == AnimalBase_Define.MoveStateType.Drop or self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 0) or self:IsDead() == true then
			local tmpPos = self:GetPosByWorldPos()

			self.moveFall = self.moveDirInertia.y * 2
			self.moveDirInertia.x = self.moveFallDir.x * AnimalBase_Define.MotionDropFrontSpeedMin
			self.moveDirInertia.z = self.moveFallDir.z * AnimalBase_Define.MotionDropFrontSpeedMin
			self.moveDirInertia.y = self.moveDirInertia.y + AnimalBase_Define.MotionGravity * ControllerMain.GetLogicDeltaTimeRange()
			self.moveSlopeAngleForward = 0
			self.moveFall = Mathf.Clamp(self.moveFall, AnimalBase_Define.MotionFallMin, AnimalBase_Define.MotionFallMax)

			self:StopMovementImmediately(false)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Drop, self.moveDropType, 0, 0)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Fall, self.moveFall, 0, 0)
		else
			self:ChangeToDrop(false)
		end
	else
		self.moveDirInertia:Set(0, 0, 0)

		if self.moveFly == false then
			self.moveDirInertia.y = 5 * AnimalBase_Define.MotionGravity * ControllerMain.GetLogicDeltaTimeRange()
		end

		if MathHelper.IsZero(self.moveDir.sqrMagnitude) == false then
			self.moveDirLocal:SetVector3(self.moveDir)
			self.moveDirLocal:MulQuat(self:GetRotationInverse())

			self.moveDirLocal.y = 0

			self.moveDirLocal:SetNormalize()
		end

		local forward = self:GetForward()

		if self.type == AnimalBase_Define.Type.Hero then
			local tmpForward = Vector3.ProjectOnPlane(forward, self.groundNormal)

			self.groundForward:SetVector3(tmpForward)

			self.moveSlopeAngleForward = Mathf.Asin(self.groundForward.y / self.groundForward.magnitude) * Mathf.Rad2Deg
			tmpForward = nil
		end

		self.moveFall = 0

		self.moveFallDir:Set(0, 0, 0)

		if self:IsMoveType(AnimalBase_Define.MoveType.DontMove) == true then
			self:StopMovementImmediately(false)
		end

		if self.moveFlg == false then
			self:StopMovement()
		elseif self.type == AnimalBase_Define.Type.Hero and self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self:IsMoveType(AnimalBase_Define.MoveType.Move) == true then
			local speed = self:GetMoveSpeed()

			if speed >= AnimalBase_Define.MotionRunSpeed and MathHelper.IsZero(self.moveDir.sqrMagnitude) == false then
				self.moveDir:SetNormalize()

				local revertAngle = Vector3.Angle(forward, self.moveDir, true, true)
				local revertCondition = false

				if self.isHost == false then
					if revertAngle > AnimalBase_Define.MotionRevertAngle then
						revertCondition = true
					end
				elseif revertAngle > AnimalBase_Define.MotionRevertAngle and self.moveDirChangeAngle > AnimalBase_Define.MotionRevertAngle then
					revertCondition = true
				end

				if revertCondition == true then
					self:ChangeMoveState(AnimalBase_Define.MoveStateType.Revert, AnimalBase_Define.MoveStateChangeLevel.Low)

					self.moveRevertFlg = true
				end
			end
		end
	end

	if self.type == AnimalBase_Define.Type.Hero then
		local animSlopeAngle = 0
		local animSlopeForwardAngle = 0

		if MathHelper.IsZero(self.groundSlopeAngle) == false and MathHelper.IsZero(self.moveSlopeAngleForward) == false then
			animSlopeAngle = MathHelper.getValueInRadioRange(Mathf.Abs(self.groundSlopeAngle), 0, AnimalBase_Define.MotionSlopeAngleMax, 0, 1)
			animSlopeForwardAngle = Mathf.Clamp(Mathf.Abs(self.moveSlopeAngleForward / self.groundSlopeAngle), 0, 1)
		end

		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.SlopeAngle, animSlopeAngle, 0, 0)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.SlopeForwardAngle, animSlopeForwardAngle, 0, 0)
	end

	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Battle, self.moveBattleMode, 0, 0)
	self:ApplyMoveSpeedAndRotation()
end

function AnimalBase:GetGroundNormal()
	return self.groundNormal
end

function AnimalBase:GetGroundY()
	return self.groundY
end

function AnimalBase:ApplyAnimatorIK()
	if self:IsAimMode() == true then
		if self.finalIkAimIK ~= nil then
			if self.finalIkAimIKWeight < 1 then
				self.finalIkAimIKWeight = self.finalIkAimIKWeight + AnimalBase_Define.AimWeightSpeedAdd * ControllerMain.GetLogicDeltaTime()

				if self.finalIkAimIKWeight >= 1 then
					self.finalIkAimIKWeight = 1
				end

				self.finalIkAimIK.solver.IKPositionWeight = self.finalIkAimIKWeight
			end

			self.finalIkAimIK.solver.transform:LookAt(self.tfAimPin.position)

			self.finalIkAimIK.solver.IKPosition = self.moveDirAimTarget
		end
	elseif self.finalIkAimIK ~= nil and self.finalIkAimIKWeight > 0 then
		self.finalIkAimIKWeight = self.finalIkAimIKWeight - AnimalBase_Define.AimWeightSpeedSub * ControllerMain.GetLogicDeltaTime()

		if self.finalIkAimIKWeight <= 0 then
			self:EndAim()
		else
			self.finalIkAimIK.solver.transform:LookAt(self.tfAimPin.position)

			self.finalIkAimIK.solver.IKPosition = self.moveDirAimTarget
			self.finalIkAimIK.solver.IKPositionWeight = self.finalIkAimIKWeight
		end
	end
end

function AnimalBase:ApplyMoveSpeedAndRotation()
	local skillDelay = self:IsAnimatorDelay()

	if skillDelay == true then
		return
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		local tmpDir = self.moveDir

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			self:LookAt(tmpDir, false)
		end

		self:UpdateMoveSpeed()

		self.moveSpeedVertical = 0
	end

	if self.moveOnGround == false then
		return
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.MoveForce then
		local tmpDir = self.moveForceDir

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			self:LookAt(tmpDir, true)
		end
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
		if (self.moveFlg == true or self:IsStanding() == true) and MathHelper.IsZero(self.moveDirLookAt.sqrMagnitude) == false then
			self:LookAt(self.moveDirLookAt, false)
		end
	elseif self:IsFreeMoveEnable() == true and self:IsOnStair() == false and self.moveRevertFlg == false and self.moveFix == false then
		if self:IsLockingPlayer() == false and self:IsAimMode() == false and (self.moveFlg == true or self:IsStanding() == true) and MathHelper.IsZero(self.moveDirLookAt.sqrMagnitude) == false then
			self:LookAt(self.moveDirLookAt, false)
		end

		self:ApplyLockAnimalOrient()
	end

	self:UpdateMoveSpeed()

	if self.moveStateNow == AnimalBase_Define.MoveStateType.MoveForce then
		local tmpSpeed = self:GetMoveSpeed()

		self.moveSpeedVertical = tmpSpeed
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMove or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce or self.moveStateNow == AnimalBase_Define.MoveStateType.StoryEnterMove then
		local tmpSpeed = self:GetMoveSpeed()

		self.moveSpeedVertical = tmpSpeed
	elseif self:IsFreeMoveEnable() == true and self:IsOnStair() == false and self.moveRevertFlg == false then
		if self:IsMoveType(AnimalBase_Define.MoveType.SpecialMove) == true then
			local tmpSpeed = self:GetMoveSpeed()

			if self:IsLockingPlayer() == true or self:IsAimMode() == true then
				local tmpForward = self.moveDirLocal.z * tmpSpeed
				local tmpRight = self.moveDirLocal.x * tmpSpeed

				self.moveSpeedVerticalSpecial, self.moveSpeedHorizontalSpecial = MathHelper.MoveTowardsVector2(self.moveSpeedVerticalSpecial, self.moveSpeedHorizontalSpecial, tmpForward, tmpRight, self.moveSpeedSpecialChange * ControllerMain.GetLogicDeltaTime())
			else
				self.moveSpeedVerticalSpecial = tmpSpeed
				self.moveSpeedHorizontalSpecial = 0
			end
		elseif self:IsMoveType(AnimalBase_Define.MoveType.SpecialDontMove) == true then
			self.moveFlg = false

			self:ResetMoveSpeed()
			self:ResetMoveSlopeSlipSpeed()
		elseif self:IsMoveType(AnimalBase_Define.MoveType.Move) == true then
			local tmpSpeed = self:GetMoveSpeed()

			self.moveSpeedVertical = tmpSpeed
		elseif self:IsMoveType(AnimalBase_Define.MoveType.DontMove) == true then
			self.moveFlg = false

			self:ResetMoveSpeed()
			self:ResetMoveSlopeSlipSpeed()
		end
	end

	if self:IsSkilling() == true then
		if self.skillIndex == AnimalBase_Define.SkillType.Dodge or self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump or self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial then
			self.moveSpeedHorizontalSkill = self.moveDirLocalDodge.x * 2
			self.moveSpeedVerticalSkill = self.moveDirLocalDodge.z * 2
		else
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

			if skillData.SkillForward > 0 then
				self.moveSpeedHorizontalSkill = 0
				self.moveSpeedVerticalSkill = self.moveDirSkillForward
			end
		end
	end
end

function AnimalBase:IsPermitAutoLock(targetPos, targetDis)
	local nowForward = self:GetForward()
	local nowPos = self:GetPosByWorldPos()

	if targetDis < AnimalBase_Define.AutoLockDistance then
		local lockAngle = MathHelper.getValueInRadioRange(targetDis, 0, AnimalBase_Define.AutoLockDistance, AnimalBase_Define.AutoLockAngleDistanceMin, AnimalBase_Define.AutoLockAngleDistanceMax)
		local tmpLockDir = targetPos - nowPos

		tmpLockDir.y = 0

		local tmpAngle = Vector3.Angle(tmpLockDir, nowForward)

		if tmpAngle < lockAngle then
			tmpLockDir = nil

			return true
		end

		tmpLockDir = nil
	end

	return false
end

function AnimalBase:ApplyLockAnimalOrient()
	if self.moveFix == true then
		return
	end

	if self:IsAimMode() == true then
		return
	end

	if self:IsSkilling() == true then
		local skillDelay = self:IsAnimatorDelay()

		if skillDelay == false and self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 0) == false then
			local skillRot = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillRot)

			if skillRot >= 1 then
				self:ApplyLockAnimalOrientForSkill(false)
			end
		end
	elseif self:IsLockingPlayer() == true then
		local nowPos = self:GetPosByWorldPos()
		local lockPos = self.skillLockAnimal:GetPosByWorldPos()

		if self.skillLockAnimal.parasitic > 0 then
			lockPos = self.skillLockAnimal:GetAimPosition()
		end

		local tmpDir = lockPos - nowPos

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			self:LookAt(tmpDir, false)
		end

		tmpDir = nil
	end
end

function AnimalBase:ApplyLockAnimalOrientForSkill(immediately)
	if self.moveFix == true then
		return
	end

	local nowPos = self:GetPosByWorldPos()
	local tmpDir = self.moveDirLookAt

	if self:IsLockingPlayer() == true then
		local lockPos = self.skillLockAnimal:GetPosByWorldPos()

		if self.skillLockAnimal.parasitic > 0 then
			lockPos = self.skillLockAnimal:GetAimPosition()
		end

		tmpDir = lockPos - nowPos
	elseif self:IsSkillingAttack() == true and self.isHost == true then
		local targetType = AnimalBase.GetSkillTargetType(self.heroId, self.skillIndex, self.skillCombo)
		local targetList = GameAI.GetSelectTarget(self, targetType)
		local targetPos
		local minDis = 9999

		for k, tmpAnimal in pairs(targetList) do
			if tmpAnimal:IsWillDead() == false and tmpAnimal:IsShow() == true then
				local tmpPos = tmpAnimal:GetPosByWorldPos()

				if tmpAnimal.parasitic > 0 then
					tmpPos = tmpAnimal:GetAimPosition()
				end

				local tmpDis = Vector3.Distance(nowPos, tmpPos)

				if tmpDis < minDis and self:IsPermitAutoLock(tmpPos, tmpDis) == true then
					minDis = tmpDis
					targetPos = tmpPos
				end
			end
		end

		local shell = self.sceneController:GetAutoLockTarget(nowPos)

		if shell ~= nil then
			local tmpPos = shell:GetPosByWorldPos()
			local tmpDis = Vector3.Distance(nowPos, tmpPos)

			if tmpDis < minDis then
				minDis = tmpDis
				targetPos = tmpPos
			end
		end

		shell = nil

		if targetPos ~= nil then
			tmpDir = targetPos - nowPos
		end
	end

	tmpDir.y = 0

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		self:LookAt(tmpDir, immediately)
	end

	tmpDir = nil
end

function AnimalBase:SetWindDir(dir)
	if self.moveWindDir ~= nil then
		self.moveWindDir:SetVector3(dir)
	end
end

function AnimalBase:SetCharacterMove(animMoveX, animMoveY, animMoveZ, animRotateY)
	self.moveDirFramePos:Set(animMoveX, animMoveY, animMoveZ)

	self.moveDirFrameRotY = animRotateY
end

function AnimalBase:ApplyCharacterMove()
	local nowPos = self:GetPosByWorldPos()
	local deltaTime = ControllerMain.GetLogicDeltaTimeRange()

	if self.moveFix == true then
		if self.moveFixBoneHostTf ~= nil then
			local nowRot = self:GetRotation()
			local newBonePos = self.moveFixBoneHostTf.position

			if self.moveFixBoneSyncRotation == false then
				if self.moveFixBoneType == AnimalBase_Define.FixBoneType.Root then
					self:SetPosByWorldPos(newBonePos, false)
				else
					local bonePos

					if self.moveFixBoneType == AnimalBase_Define.FixBoneType.Chest then
						bonePos = self:GetBodyChest().position
					end

					if bonePos ~= nil then
						local tmpPosNew = nowPos - bonePos

						tmpPosNew:Add(newBonePos)
						self:SetPosByWorldPos(tmpPosNew, false)

						tmpPosNew = nil
					end
				end
			else
				local newBoneRot = self.moveFixBoneHostTf.rotation

				if self.moveFixBoneType == AnimalBase_Define.FixBoneType.Root then
					self:SetPosByWorldPos(newBonePos, false)
					self:SetRotation(newBoneRot, false)
				else
					local bonePos

					if self.moveFixBoneType == AnimalBase_Define.FixBoneType.Chest then
						bonePos = self:GetBodyChest().position
					end

					if bonePos ~= nil then
						local tmpForward = Vector3.forward

						tmpForward:MulQuat(newBoneRot)

						tmpForward.y = 0

						if MathHelper.IsZero(tmpForward.sqrMagnitude) == false then
							tmpForward:SetNormalize()

							local targetRot = Quaternion.LookRotation(tmpForward)
							local tmpPosNew = nowPos - bonePos
							local tmpRotI = Quaternion.Inverse(nowRot)

							tmpPosNew:MulQuat(tmpRotI)
							tmpPosNew:MulQuat(targetRot)
							tmpPosNew:Add(newBonePos)
							self:SetPosByWorldPos(tmpPosNew, false)
							self:SetRotation(targetRot, false)

							targetRot = nil
							tmpRotI = nil
							tmpPosNew = nil
						end

						tmpForward = nil
					end
				end
			end
		elseif self:IsBornSkilling() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev then
			if Mathf.Abs(self.moveDirFrameRotY) > 0 then
				self:RotateAngleY(self.moveDirFrameRotY)
			end

			self.movePositionNew:SetVector3(self.moveDirFramePos)
			self.movePositionNew:Add(nowPos)
			self:SetPosByWorldPos(self.movePositionNew, false)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog and self.moveStateOld == self.moveStateNow then
			if Mathf.Abs(self.moveDirFrameRotY) > 0 then
				self:RotateAngleY(self.moveDirFrameRotY)
			end

			self.movePositionNew:SetVector3(self.moveDirFramePos)
			self.movePositionNew:Add(nowPos)
			self:SetPosByWorldPos(self.movePositionNew, false)
		end
	elseif self.moveGhost == true then
		if Mathf.Abs(self.moveDirFrameRotY) > 0 then
			self:RotateAngleY(self.moveDirFrameRotY)
		end

		self.movePositionNew:SetVector3(self.moveDirFramePos)
		self.movePositionNew:Add(nowPos)
		self:SetPosByWorldPos(self.movePositionNew, false)
	else
		if self:IsOnStair() == true then
			if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartReady then
				self:SetPosByWorldPos(self.moveStairClimbTargetPos, false)
				self:SetRotation(self.moveStairClimbTargetRot, false)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftIdle or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightIdle then
				self:SetPosByWorldPos(self.moveStairClimbTargetPos, false)
			elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 then
				self.movePositionNew:SetVector3(nowPos)

				local tmpTime = self.animatorTime

				if self.animatorLoopCnt > self.animatorLoopCntLast then
					tmpTime = tmpTime + self.animatorLoopCnt - self.animatorLoopCntLast
				end

				if tmpTime > self.animatorTimeLast then
					local diff = tmpTime - self.animatorTimeLast
					local diffY = diff * SceneDefine.TouchStairClimbMaxY

					self.movePositionNew.y = self.movePositionNew.y - diffY

					local nowPos = self:GetPosByWorldPos()
					local stairOut = self.scene:CheckStairArrive(self.moveStairId, AnimalBase_Define.StairTouch.Down, self.movePositionNew)

					if stairOut == true then
						self:SetPosByWorldPos(self.moveStairClimbTargetPos, false)
					else
						self:SetPosByWorldPos(self.movePositionNew, false)
					end
				end
			else
				self.movePositionNew:SetVector3(nowPos)
				self.movePositionNew:Add(self.moveDirFramePos)
				self:SetPosByWorldPos(self.movePositionNew, false)
			end
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
			self.moveDirFramePos:SetVector3(self.moveDirInertia)
			self.moveDirFramePos:Mul(deltaTime)
			self.movePositionNew:SetVector3(nowPos)
			self.movePositionNew:Add(self.moveDirFramePos)

			if self.movePositionNew.y < self.groundY then
				self.movePositionNew.y = self.groundY
			end

			self:AdjustPositionByGround(nowPos, self.movePositionNew, false)
			self:SetPosByWorldPos(self.movePositionNew, false)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Born then
			if Mathf.Abs(self.moveDirFrameRotY) > 0 then
				self:RotateAngleY(self.moveDirFrameRotY)
			end

			self.movePositionNew:SetVector3(self.moveDirFramePos)
			self.movePositionNew:Add(nowPos)
			self:AdjustPositionByGroundElevator(nowPos, self.movePositionNew)
			self:AdjustPositionByGround(nowPos, self.movePositionNew, false)
			self:SetPosByWorldPos(self.movePositionNew, false)
		elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLineMoveForce then
			-- block empty
		else
			if self:IsSkillingById(AnimalBase_Define.SkillType.Execute, 1) == true or self:IsSkillingById(AnimalBase_Define.SkillType.Backstab, 1) == true then
				if self:IsAnimatorInTransition() == true then
					self.moveDirFramePos:Set(0, 0, 0)
				end
			elseif self:IsEvent(self.moveStateNow) == true and (self.animatorStateHashOld ~= self.animatorStateHash or self.animatorReset == true) then
				self.moveDirFramePos:Set(0, 0, 0)
			end

			if Mathf.Abs(self.moveDirFrameRotY) > 0 then
				self:RotateAngleY(self.moveDirFrameRotY)
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit or self:IsSkillingSkill() == true and self:GetSkillTypeForAI() == AnimalBase_Define.SkillTypeForAI.DefenceHit then
				if self.moveHitRate > 1 then
					self.moveRate = 1 + self:GetAnimatorParam(AnimalBase_Define.ParamType.HitMoveRate) * (self.moveHitRate - 1)
				elseif self.moveHitRate == 1 then
					self.moveRate = 1
				elseif self.moveHitRate > 0 then
					self.moveRate = self:GetAnimatorParam(AnimalBase_Define.ParamType.HitMoveRate) * self.moveHitRate
				else
					self.moveRate = 0
				end
			else
				self.moveRate = 1
			end

			if self:IsSkillingById(AnimalBase_Define.SkillType.Dodge, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.DodgeSpecial, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.DodgeJump, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.DodgeJumpSpecial, 0) == true then
				if self:IsHaveLogicRule(AnimalBase_Define.LogicRule.DodgeClose) then
					local ruleParam = self:GetLogicRuleParam(AnimalBase_Define.LogicRule.DodgeClose)

					if ruleParam > 0 then
						self.moveRate = self.moveRate * ruleParam
					end
				end

				if self.moveSlopeAngleForward > 0 then
					local slopeAngle = self.moveSlopeAngleForward

					self.moveRate = self.moveRate * Mathf.Cos(slopeAngle * Mathf.Deg2Rad)
				end
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Dialog or self.moveStateNow == AnimalBase_Define.MoveStateType.TouchGround or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornStart or self.moveStateNow == AnimalBase_Define.MoveStateType.ChangeRebornEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.TransferStart or self.moveStateNow == AnimalBase_Define.MoveStateType.TransferEnd or self.moveStateNow == AnimalBase_Define.MoveStateType.BeaconStart or self.moveStateNow == AnimalBase_Define.MoveStateType.BeaconEnd then
				self.moveRate = 0
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Hit and (self.moveHitType == AnimalBase_Define.HitType.Dizzy or self.moveHitType == AnimalBase_Define.HitType.Freeze or self.moveHitType == AnimalBase_Define.HitType.Tackle) then
				self.moveRate = 0
			end

			if DebugFly == true and self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self.moveFlg == true and self.isHost == true and self.isHostBack == false and inputMgr:GetButton(LS_Setting.Btn.L1) then
				self.moveRate = self.moveRate * 5
			end

			if self.moveStateNow == AnimalBase_Define.MoveStateType.Move and self.moveFlg == true and self.isHost == true and self.isHostBack == false and self:IsHaveStatusByType(MS_StatusData.LogicType.MoveFast) == true then
				local tmpAdd = self:GetStatusSimpleValueByType(MS_StatusData.LogicType.MoveFast)

				self.moveRate = MathHelper.addValuePermil(self.moveRate, tmpAdd)
			end

			self.moveDirFramePos.x = self.moveDirFramePos.x * self.moveRate
			self.moveDirFramePos.z = self.moveDirFramePos.z * self.moveRate

			if self.moveFly == false then
				self.moveDirFramePos.y = 0
			end

			self.moveDirFramePos.x = self.moveDirFramePos.x + self.moveWindDir.x * deltaTime
			self.moveDirFramePos.z = self.moveDirFramePos.z + self.moveWindDir.z * deltaTime

			self.movePositionNew:SetVector3(self.moveDirInertia)
			self.movePositionNew:Mul(deltaTime)
			self.movePositionNew:Add(self.moveDirFramePos)
			self.movePositionNew:Add(nowPos)

			if self.moveCageUse == true then
				local tmpDir = self.movePositionNew - self.moveCagePos
				local tmpDis = Vector3.DistanceSquare(self.movePositionNew, self.moveCagePos)

				if self.moveCageRange <= 0 then
					self.movePositionNew:SetVector3(self.moveCagePos)
				elseif tmpDir.sqrMagnitude >= self.moveCageRange * self.moveCageRange then
					tmpDir:SetNormalize()
					tmpDir:Mul(self.moveCageRange)
					tmpDir:Add(self.moveCagePos)
					self.movePositionNew:SetVector3(tmpDir)
				end

				tmpDir = nil
			end

			self:AdjustPositionByGroundElevator(nowPos, self.movePositionNew)

			if self.moveFly == false then
				if self.moveOnGround == true then
					self.movePositionNew.y = self.groundY
				elseif self.movePositionNew.y < self.groundY then
					self.movePositionNew.y = self.groundY
				end
			end

			self:AdjustAnimalSlopeGround(nowPos, self.movePositionNew)
			self:AdjustPositionByCollider(nowPos, self.movePositionNew)
			self:SetPosByWorldPos(self.movePositionNew, false)
		end

		if self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLine and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLinePrev then
			self:UpdateFootEffect()
		end
	end

	if self:IsWillDead() == false and self:IsOnStair() == false and self.moveFix == false and self.moveFly == false and self.moveOnGround == true and self:IsSkillingById(AnimalBase_Define.SkillType.Drop, 0) == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TouchGround and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Drop and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Fly and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Born and self.moveTouchZoneType ~= SceneBase.ZoneType.ZoneElevator then
		if self.isHost == false or self.groundSlopeAngle <= AnimalBase_Define.MotionSlopeAngleSave then
			self.moveFootprintPosition:SetVector3(self.movePosition)

			if self.isHost == true then
				self:SetRebornPosition(self.movePosition)
				self:SetRebornLook(self.moveRotationForward)
			end
		end

		self.moveFindPathPositionForAI:SetVector3(self.movePosition)
	end

	self:RefreshTransform(false)
end

function AnimalBase:IsInState(state)
	if self.moveStateNow == state then
		return true
	end

	return false
end

function AnimalBase:UpdateColliderBox()
	local colliderCubeList = self:GetSkillColliderList()

	if colliderCubeList == nil or #colliderCubeList <= 0 then
		return
	end

	for i = 1, #colliderCubeList do
		local cube = colliderCubeList[i]

		if cube ~= nil then
			cube:UpdateInfo(ControllerMain.LogicFrame)
		end
	end
end

function AnimalBase:OnGround(ground)
	if self.moveFly == true then
		return
	end

	if self.moveOnGround == false then
		return
	end

	if (self.moveTouchGroundType == SceneBase.GroundType.Water or self.moveTouchGroundType == SceneBase.GroundType.River or self.moveTouchGroundType == SceneBase.GroundType.Lake) and self.moveTouchWaterHeight <= SceneBase.DefaultWaterHeight then
		VfxManager.PlayFreezeMulti(AnimalBase_Define.VfxTouchGroundWater, self:GetPosByWorldPos(), nil, nil)
		AudioCtrl.SetHeroAudio("fall_down_water", self.tfModel, self.animalId)
	end

	if self.isHost == true and self.isHostBack == false and self.moveStateNow == AnimalBase_Define.MoveStateType.Hit then
		self:HitShakeSimple(1)
	end
end

function AnimalBase:OnWater()
	if self.moveTouchGroundType == SceneBase.GroundType.Water or self.moveTouchGroundType == SceneBase.GroundType.River or self.moveTouchGroundType == SceneBase.GroundType.Lake then
		local tmpPos = self:GetPosByWorldPos():Clone()

		if self.moveTouchWaterHeight > SceneBase.DefaultWaterHeight then
			tmpPos.y = self.moveTouchWaterHeight
		end

		VfxManager.PlayFreezeMulti(AnimalBase_Define.VfxTouchGroundWater, tmpPos, nil, nil)
		AudioCtrl.SetHeroAudio("fall_down_water", self.tfModel, self.animalId)
	end
end

function AnimalBase.CheckMoveOnGround(moveOnGround, groundY, nowY)
	local checkDis = 0

	if moveOnGround == true then
		checkDis = SceneDefine.OnGroundCheckRayDistanceDrop
	else
		checkDis = SceneDefine.OnGroundCheckRayDistanceLand
	end

	if groundY < nowY then
		local diff = nowY - groundY

		if checkDis < diff then
			return false
		end
	end

	return true
end

function AnimalBase:SetMoveCage(use, pos, range)
	self.moveCagePos:SetVector3(pos)

	self.moveCageRange = range
	self.moveCageUse = use
end

function AnimalBase:ChangeMoveCageRange(range)
	if self.moveCageUse == true then
		self.moveCageRange = range
	end
end

function AnimalBase:AdjustPositionByGroundFix(newPos)
	if self.moveFly == true then
		return false
	end

	local ret, tmpGroundY, tmpGroundNormal, tmpMoveTouchInstanceID = self:GetFootGroundInfo(newPos)

	if ret == true then
		newPos.y = tmpGroundY
	end

	tmpGroundNormal = nil

	return ret
end

function AnimalBase:AdjustPositionByGroundSimple(oldPos, newPos)
	if self.moveFly == true then
		return false
	end

	local moveOnGroundOld = self.moveOnGround
	local ret, tmpGroundY, tmpGroundNormal, tmpMoveTouchInstanceID = self:GetFootGroundInfo(newPos)

	if ret == true and tmpGroundY > newPos.y then
		newPos.y = tmpGroundY
	end

	tmpGroundNormal = nil

	return ret
end

function AnimalBase:AdjustPositionByGroundElevator(oldPos, newPos)
	if self.moveFly == true then
		return false
	end

	if self.moveOnGround == false then
		return false
	end

	if self.moveTouchZoneType ~= SceneBase.ZoneType.ZoneElevator then
		return false
	end

	local ret, tmpGroundY, tmpGroundNormal, tmpMoveTouchInstanceID = self:GetFootGroundInfo(newPos)

	if ret == false then
		return false
	end

	local tmpGroundData = self:CheckTouchZoneData(tmpMoveTouchInstanceID)

	if tmpGroundData == nil then
		return false
	end

	if tmpGroundData.useZoneType and tmpGroundData.zoneType ~= SceneBase.ZoneType.ZoneElevator then
		return false
	end

	local tmpSlopeAngle = Vector3.Angle(tmpGroundNormal, Vector3.s_up, true, true)

	self.groundY = tmpGroundY

	self.groundNormal:SetVector3(tmpGroundNormal)

	self.groundSlopeAngle = tmpSlopeAngle
	self.moveTouchGroundId = tmpMoveTouchInstanceID
	self.moveTouchGroundData = tmpGroundData
	self.moveTouchGroundType = tmpGroundData.groundType

	if tmpGroundData.useZoneType then
		self.moveTouchZoneType = tmpGroundData.zoneType
		self.moveTouchZoneId = tmpGroundData.zoneId
		self.moveTouchArea = tmpGroundData.area
	end

	if tmpGroundData.useReverb then
		self.moveTouchReverbId = tmpGroundData.reverbId
	end

	self.moveTouchWaterHeight = tmpGroundData.waterHeight

	if tmpGroundData.useFog then
		self.moveTouchFogStartDistance = tmpGroundData.startDistance
		self.moveTouchFogEndDistance = tmpGroundData.endDistance
		self.moveTouchFogColor = tmpGroundData.fogColor
	elseif self.moveTouchFogColor == nil or self.moveTouchArea == SceneBase.Area.OutDoor then
		self.moveTouchFogColor, self.moveTouchFogStartDistance, self.moveTouchFogEndDistance = self.scene:GetDefaultFogData()
	end

	oldPos.y = self.groundY
	newPos.y = self.groundY
	tmpGroundNormal = nil

	return true
end

function AnimalBase:AdjustPositionByGround(oldPos, newPos, force)
	if self.moveFly == true then
		return
	end

	if force == false then
		local diffDis = Vector3.DistanceSquare(oldPos, newPos)

		if MathHelper.IsZero(diffDis) == true then
			return
		end
	end

	local moveOnGroundOld = self.moveOnGround
	local ret, tmpGroundY, tmpGroundNormal, tmpMoveTouchInstanceID = self:GetFootGroundInfo(newPos)
	local tmpOnGround = AnimalBase.CheckMoveOnGround(moveOnGroundOld, tmpGroundY, newPos.y)

	if self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		self.moveOnGround = false

		self.moveFallPos:Set(newPos.x, newPos.y, newPos.z)

		self.moveFallStart = newPos.y
		ret = false
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.Born then
		self.moveOnGround = tmpOnGround

		if tmpGroundY > newPos.y then
			newPos.y = tmpGroundY
		end
	elseif self:IsOnStair() == true then
		-- block empty
	else
		if tmpOnGround == true then
			newPos.y = tmpGroundY

			local tmpDiff = newPos.y - oldPos.y

			if tmpDiff > AnimalBase_Define.AnimalRouteColliderOffsetY then
				local tmpDir = newPos - oldPos

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					tmpDir:SetNormalize()

					local tmpAngle = Vector3.Angle(tmpDir, Vector3.s_up, true, true)

					tmpAngle = 90 - tmpAngle

					if tmpAngle > AnimalBase_Define.MotionSlopeAngleMax then
						newPos:SetVector3(oldPos)

						tmpGroundNormal = nil
						tmpDir = nil

						return
					end
				end

				tmpDir = nil
			end

			if moveOnGroundOld == false then
				self.moveDirInertia:Set(0, 0, 0)

				self.moveFallHeight = self.moveFallStart - newPos.y

				if self.isHost == true then
					self.cameraScene:LockPosition(false)
				end
			end
		else
			if tmpGroundY > newPos.y then
				newPos.y = tmpGroundY
			end

			if moveOnGroundOld == true then
				self.moveDirInertia:Set(0, 0, 0)
				self.moveFallPos:Set(newPos.x, newPos.y, newPos.z)

				self.moveFallStart = newPos.y

				local tmpDir = newPos - self.movePositionOld

				self.moveFallDir:SetVector3(tmpDir)

				tmpDir = nil
				self.moveFallDir.y = 0

				if MathHelper.IsZero(self.moveFallDir.sqrMagnitude) == false then
					self.moveFallDir:SetNormalize()
				else
					self.moveFallDir:Set(0, 0, 0)
				end
			end
		end

		self.moveOnGround = tmpOnGround
	end

	local tmpSlopeAngle = Vector3.Angle(tmpGroundNormal, Vector3.s_up, true, true)

	self.groundY = tmpGroundY

	self.groundNormal:SetVector3(tmpGroundNormal)

	self.groundSlopeAngle = tmpSlopeAngle

	if ret == true then
		local tmpGroundData = self:CheckTouchZoneData(tmpMoveTouchInstanceID)

		if tmpGroundData ~= nil then
			self.moveTouchGroundId = tmpMoveTouchInstanceID
			self.moveTouchGroundType = tmpGroundData.groundType

			if tmpGroundData.useZoneType then
				if self.moveTouchZoneType ~= SceneBase.ZoneType.ZoneElevator and tmpGroundData.zoneType == SceneBase.ZoneType.ZoneElevator then
					self:SetCharacterBodyIKEnable(false)
				elseif self.moveTouchZoneType == SceneBase.ZoneType.ZoneElevator and tmpGroundData.zoneType ~= SceneBase.ZoneType.ZoneElevator then
					self:SetCharacterBodyIKEnable(true)
				end

				self.moveTouchZoneType = tmpGroundData.zoneType
				self.moveTouchZoneId = tmpGroundData.zoneId
				self.moveTouchArea = tmpGroundData.area
			end

			if tmpGroundData.useReverb then
				self.moveTouchReverbId = tmpGroundData.reverbId
			end

			self.moveTouchWaterHeight = tmpGroundData.waterHeight

			if tmpGroundData.useFog then
				self.moveTouchFogStartDistance = tmpGroundData.startDistance
				self.moveTouchFogEndDistance = tmpGroundData.endDistance
				self.moveTouchFogColor = tmpGroundData.fogColor
			elseif self.moveTouchFogColor == nil or self.moveTouchArea == SceneBase.Area.OutDoor then
				self.moveTouchFogColor, self.moveTouchFogStartDistance, self.moveTouchFogEndDistance = self.scene:GetDefaultFogData()
			end

			if (self.moveTouchGroundType == SceneBase.GroundType.Water or self.moveTouchGroundType == SceneBase.GroundType.River or self.moveTouchGroundType == SceneBase.GroundType.Lake) and self.moveTouchWaterHeight > SceneBase.DefaultWaterHeight then
				if self.isHost == true and self.isHostBack == false then
					self.cameraScene:SetWaterHeight(self.moveTouchWaterHeight + 0.05)
				end

				if oldPos.y > self.moveTouchWaterHeight and newPos.y <= self.moveTouchWaterHeight then
					self:OnWater()
				end

				local diffHeight = self.moveTouchWaterHeight - newPos.y

				if self:IsDead() == false and diffHeight > AnimalBase_Define.WaterDeadHeight then
					self:ChangeToDead(AnimalBase_Define.DeadReason.Drop)
				end
			end
		end
	end

	tmpGroundNormal = nil
end

function AnimalBase:CheckTouchZoneData(groundInstanceID)
	local useGroundType = false

	if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true then
		useGroundType = true
	elseif self.isHost == true then
		useGroundType = true
	end

	if useGroundType == true and self.scene ~= nil then
		return self.scene:GetGroundData(groundInstanceID)
	end

	return nil
end

function AnimalBase:GetTouchGroundData()
	return self.moveTouchGroundId, self.groundY, self.moveTouchArea, self.moveTouchGroundType, self.moveTouchZoneType, self.moveTouchZoneId, self.moveTouchReverbId, self.moveTouchFogColor, self.moveTouchFogStartDistance, self.moveTouchFogEndDistance
end

function AnimalBase:GetTouchGroundDataSimple()
	return self.moveTouchGroundType, self.moveTouchZoneType, self.moveTouchZoneId
end

function AnimalBase:GetFootGroundInfo(nowPos)
	if self.scene ~= nil then
		local tmpOffset = self.routeCapsuleCenterY

		if self.moveTouchZoneType == SceneBase.ZoneType.ZoneElevator then
			local elevatorDeltaY = 0
			local elevator = self.scene:GetElevatorByinstanceID(self.moveTouchGroundId)

			if elevator ~= nil then
				elevatorDeltaY = elevator:GetMoveGroundDeltaY()

				if elevatorDeltaY < 0 then
					elevatorDeltaY = 0
				end
			end

			tmpOffset = Mathf.Max(self.routeCapsuleCenterY + self.routeCapsuleHeight / 2 - self.footCapsuleRadius + elevatorDeltaY, tmpOffset)
		end

		return self.scene:GetGroundInfo(self.moveOnGround, nowPos, self.footCapsuleRadius, tmpOffset)
	end

	return false, SceneBase.DefaultGroundPosition.y, Vector3.s_up, 0
end

function AnimalBase:AdjustShootTargetByDistance(startPos, endPos, dis)
	local tmpDir = endPos - startPos

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		tmpDir:SetNormalize()
		tmpDir:Mul(dis)
		tmpDir:Add(startPos)

		return tmpDir
	end

	return endPos
end

function AnimalBase:GetShootDistanceMax()
	return 0
end

function AnimalBase:GetSkillButtonAimTarget()
	local shootDistance = Mathf.Max(AnimalBase_Define.AimDistanceMin, self:GetShootDistanceMax())
	local target = self:GetCameraRayColliderPosition(self.cameraScene:GetCameraRealPosition(), self.cameraScene:GetCameraRealForward(), shootDistance, false)

	if target ~= nil and DebugShowBulletRoute == true then
		UnityEngine.Debug.DrawLine(self.cameraScene:GetCameraRealPosition(), target, Color.blue)
	end

	return target
end

function AnimalBase:SetBodyCollider(flg)
	if self.characterBodyColliderEnable ~= flg then
		XCollider.SetAnimalBodyColliderEnable(self.animalId, flg)

		self.characterBodyColliderEnable = flg
	end
end

function AnimalBase:GetCharacterColliderLayerMask()
	if self:IsDead() == true then
		return self.characterColliderLayerMaskOnlyWall
	end

	return self.characterColliderLayerMask
end

function AnimalBase:GetCharacterColliderLayerMaskOnlyWall()
	return self.characterColliderLayerMaskOnlyWall
end

function AnimalBase:AdjustMoveFlash(newPos)
	local oldPos = self:GetPosByWorldPos()

	self:AdjustPositionByCollider(oldPos, newPos)
end

function AnimalBase:CheckColliderThrough(oldPos, newPos)
	if self.moveThroughAll == true then
		return
	end

	if self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLine or self.moveStateNow == AnimalBase_Define.MoveStateType.TimeLinePrev then
		return
	end

	local diffDis = Vector3.Distance(oldPos, newPos)

	if MathHelper.IsZero(diffDis) == true then
		return
	end

	local tmpLayerMask = self:GetCharacterColliderLayerMaskOnlyWall()

	if self.moveThroughWall == true then
		tmpLayerMask = AnimalBase_Define.AnimalColliderLayerMaskForGround
	end

	local relative = newPos - oldPos
	local checkDis = diffDis + self.animalRadius

	relative:SetNormalize()

	local ret = XPhysics.RaycastAll(self.animalId, 0, oldPos.x, oldPos.y + self.routeCapsuleCenterY, oldPos.z, relative.x, relative.y, relative.z, checkDis, tmpLayerMask)

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

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(self.animalId, 0, tmpLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

		if ret == true then
			local nearestNormal = Vector3.New(normalX, normalY, normalZ)
			local angle = Vector3.Angle(nearestNormal, Vector3.s_up, true, true)
			local angleDiff = Mathf.Abs(angle - 90)

			if angleDiff <= AnimalBase_Define.AnimalRouteColliderAngleMax then
				newPos:SetVector3(oldPos)
			end

			nearestNormal = nil
		end
	end

	relative = nil
end

function AnimalBase:AdjustPositionByCollider(oldPos, newPos)
	if self.moveThroughAll == false and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLinePrev and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLine and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Special and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dialog then
		local moveDis = Vector3.Distance2D(oldPos, newPos)

		if self.moveThroughWall == true then
			local tmpLayerMask = AnimalBase_Define.AnimalColliderLayerMaskForGroundAndBody

			if self.moveThroughBody == true then
				tmpLayerMask = AnimalBase_Define.AnimalColliderLayerMaskForGround
			end

			self:CheckRouteCapsuleCast(0, oldPos, newPos, moveDis, tmpLayerMask)

			if self:IsRouteCapsuleOverlap(0, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, tmpLayerMask) then
				self:CheckRouteCapsulePenetration(0, newPos, tmpLayerMask)

				if self:IsRouteCapsuleOverlap(0, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, tmpLayerMask) then
					self:CheckRouteCapsulePenetration(0, newPos, tmpLayerMask)
				end
			end
		elseif self.moveThroughBody == true then
			local tmpLayerMask = self:GetCharacterColliderLayerMaskOnlyWall()

			self:CheckRouteCapsuleCast(0, oldPos, newPos, moveDis, tmpLayerMask)

			if self:IsRouteCapsuleOverlap(0, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, tmpLayerMask) then
				self:CheckRouteCapsulePenetration(0, newPos, tmpLayerMask)

				if self:IsRouteCapsuleOverlap(0, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, tmpLayerMask) then
					self:CheckRouteCapsulePenetration(0, newPos, tmpLayerMask)
				end
			end
		else
			self:CheckRouteCapsuleCast(0, oldPos, newPos, moveDis, self:GetCharacterColliderLayerMask())

			if self:IsRouteCapsuleOverlap(0, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, self:GetCharacterColliderLayerMask()) then
				self:CheckRouteCapsulePenetration(0, newPos, self:GetCharacterColliderLayerMask())

				if self:IsRouteCapsuleOverlap(0, newPos, self.routeCapsuleRadius, self.routeCapsuleHeight, self:GetCharacterColliderLayerMaskOnlyWall()) then
					self:CheckRouteCapsulePenetration(0, newPos, self:GetCharacterColliderLayerMaskOnlyWall())
				end
			end
		end
	end

	if self.isHost == true then
		self:CheckColliderThrough(oldPos, newPos)
		self:AdjustPositionByGround(oldPos, newPos, false)
		self:CheckColliderThrough(oldPos, newPos)
	else
		self:AdjustPositionByGround(oldPos, newPos, false)
		self:CheckColliderThrough(oldPos, newPos)
	end
end

function AnimalBase:CheckRouteCapsuleCast(ignoreAnimalId, posStart, posEnd, moveDisMax, useLayerMask)
	if MathHelper.IsZero(moveDisMax) == true then
		return
	end

	local relative = posEnd - posStart
	local checkDis = relative.magnitude + AnimalBase_Define.AnimalRouteColliderSkin + AnimalBase_Define.AnimalRouteColliderMicroDistance

	relative:SetNormalize()

	local ret = XPhysics.RouteCapsuleCastAll(self.animalId, ignoreAnimalId, posStart.x, posStart.y, posStart.z, self.routeCapsuleCenterY, self.animalRadius, self.routeCapsuleHeight, relative.x, relative.y, relative.z, checkDis, useLayerMask)

	if ret == true then
		local posX = 0
		local posY = 0
		local posZ = 0
		local normalX = 0
		local normalY = 0
		local normalZ = 0
		local hitDistance = 0
		local hitLayer = 0
		local hitOwnerId = 0

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitOwnerId = XPhysics.GetCastRouteNearestInfo(self.animalId, ignoreAnimalId, useLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitOwnerId)

		if ret == true and hitDistance > 0 then
			self:ReboundRouteCollider(posStart, posEnd, moveDisMax, hitDistance, hitLayer, hitOwnerId, posX, posY, posZ, normalX, normalY, normalZ)
		end
	end
end

function AnimalBase:ReboundRouteCollider(posStart, posEnd, moveDis, hitDistance, hitLayer, hitOwnerId, posX, posY, posZ, normalX, normalY, normalZ)
	local newPosY = posEnd.y
	local nearestNormal = Vector3.New(normalX, 0, normalZ)

	if hitLayer == LayerAnimalBody then
		local hitRadius = 0

		posEnd.x = posX
		posEnd.z = posZ

		if hitOwnerId > 0 then
			local hitAnimal = self.sceneController:FindPlayerById(hitOwnerId)

			if hitAnimal ~= nil then
				local hitPos = hitAnimal:GetPosByWorldPos()

				posEnd.x = hitPos.x
				posEnd.z = hitPos.z
				hitRadius = hitAnimal:GetRadius()
			end
		end

		if MathHelper.IsZero(nearestNormal.sqrMagnitude) == false then
			nearestNormal:SetNormalize()
			nearestNormal:Mul(hitRadius + self.routeCapsuleRadius + AnimalBase_Define.AnimalRouteColliderMicroDistance)
			posEnd:Add(nearestNormal)
		else
			posEnd:SetVector3(posStart)
		end
	else
		local tmpMoveDir = posEnd - posStart

		tmpMoveDir:SetNormalize()
		tmpMoveDir:Mul(hitDistance)
		posEnd:SetVector3(posStart)
		posEnd:Add(tmpMoveDir)

		if MathHelper.IsZero(nearestNormal.sqrMagnitude) == false then
			nearestNormal:SetNormalize()
			nearestNormal:Mul(AnimalBase_Define.AnimalRouteColliderSkin + AnimalBase_Define.AnimalRouteColliderMicroDistance)
			posEnd:Add(nearestNormal)
		end

		tmpMoveDir = nil
	end

	if self.moveOnGround == false then
		if newPosY < self.groundY then
			newPosY = self.groundY
		end

		posEnd.y = newPosY
	end

	nearestNormal = nil
end

function AnimalBase:IsRouteCapsuleOverlap(ignoreAnimalId, pos, radius, height, useLayerMask)
	local ret = XPhysics.OverlapRouteCapsule(self.animalId, ignoreAnimalId, pos.x, pos.y, pos.z, self.routeCapsuleCenterY, radius, height, useLayerMask, 1)

	return ret
end

function AnimalBase:CheckRouteCapsulePenetration(ignoreAnimalId, posNew, useLayerMask)
	local nowRot = self:GetRotation()
	local ret = false
	local penetratePosX = 0
	local penetratePosY = 0
	local penetratePosZ = 0
	local penetrateDistance = 0

	ret, penetratePosX, penetratePosY, penetratePosZ, penetrateDistance = XPhysics.ComputeRoutePenetration(self.animalId, ignoreAnimalId, posNew.x, posNew.y, posNew.z, nowRot.x, nowRot.y, nowRot.z, nowRot.w, penetratePosX, penetratePosY, penetratePosZ, penetrateDistance)

	if ret == true and penetrateDistance > 0 then
		posNew.x = posNew.x + penetratePosX
		posNew.z = posNew.z + penetratePosZ
	end
end

function AnimalBase:AdjustAnimalSlopeGround(oldPos, newPos)
	if self.moveOnGround == false then
		return
	end

	if self.moveFly == true then
		return
	end

	if self.groundSlopeAngle > AnimalBase_Define.MotionSlopeAngleMax then
		local tmpSlipSpeed = AnimalBase_Define.MotionSlopeSlipSpeed * ControllerMain.GetLogicDeltaTime()
		local tmpGroundNormal = self.groundNormal:Clone()

		tmpGroundNormal.y = 0

		tmpGroundNormal:SetNormalize()
		self:SetMoveSlopeSlipSpeed(tmpGroundNormal, tmpSlipSpeed)
		tmpGroundNormal:Mul(tmpSlipSpeed)
		newPos:Add(tmpGroundNormal)

		tmpGroundNormal = nil
	else
		local tmpSlipSpeed = self.moveSlopeSlipSpeed.magnitude

		tmpSlipSpeed = Mathf.Clamp(tmpSlipSpeed, 0, AnimalBase_Define.MotionSlopeSlipSpeed * ControllerMain.GetLogicDeltaTime())

		if MathHelper.IsZero(tmpSlipSpeed) == false then
			newPos:Add(self.moveSlopeSlipSpeed)
		end
	end
end

function AnimalBase:GetCameraRayColliderPosition(camPos, camDir, dis, isShoot)
	local nowPos = self:GetPosByWorldPos()
	local camToHostDis = Vector3.Distance2D(nowPos, camPos) + 1
	local startPos = camDir:Clone()

	startPos:SetNormalize()
	startPos:Mul(camToHostDis)
	startPos:Add(camPos)

	local nearestPos = camDir:Clone()

	nearestPos:SetNormalize()
	nearestPos:Mul(dis)
	nearestPos:Add(camPos)

	local ret = XPhysics.RaycastAll(self.animalId, 0, startPos.x, startPos.y, startPos.z, camDir.x, camDir.y, camDir.z, dis, BulletBase.BulletLayerMask)

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

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(self.animalId, 0, BulletBase.BulletLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

		if ret ~= true or hitDistance < AnimalBase_Define.AimDistanceMin then
			-- block empty
		else
			nearestPos:Set(posX, posY, posZ)
		end
	end

	startPos = nil

	return nearestPos
end

function AnimalBase:ReadyAim()
	local buttonLongPress = self:GetLongPressButton()

	if buttonLongPress > 0 then
		if self:IsLockingPlayer() == true then
			self.skillLockAnimalIdLast = self.skillLockAnimal.animalId
		else
			self.skillLockAnimalIdLast = 0
		end
	end
end

function AnimalBase:StartAim()
	local buttonLongPress = self:GetLongPressButton()

	if buttonLongPress > 0 then
		local attPos = self:GetAttackBoxPosition(self.skillIndex, 1)

		if self.isHost == false then
			local tmpTarget = attPos:Clone()
			local tmpDir = self:GetForward() * AnimalBase_Define.AimDistanceMin

			tmpTarget:Add(tmpDir)
			self.moveDirAimTarget:SetVector3(tmpTarget)
			self.moveDirAim:SetVector3(tmpDir)

			tmpTarget = nil
			tmpDir = nil
		else
			self.moveDirAimTarget:SetVector3(self:GetSkillButtonTarget())
			self.moveDirAim:SetVector3(self.moveDirAimTarget - attPos)
		end

		self.moveDirAimOld:SetVector3(self.moveDirAim)

		self.moveDirAimTargetDistance = self.moveDirAim.magnitude

		self.moveDirAimStartHorizontalDir:SetVector3(self.moveDirAim)

		self.moveDirAimStartHorizontalDir.y = 0
		self.moveDirAimStartAngle = Vector3.Angle(self.moveDirAimStartHorizontalDir, self.moveDirAimOld)

		if self.moveDirAimOld.y < 0 then
			self.moveDirAimStartAngle = -self.moveDirAimStartAngle
		end

		if self.finalIkAimIK ~= nil then
			if self.isHost == true and self.isHostBack == false then
				self.finalIkAimIKWeight = 1
			else
				self.finalIkAimIKWeight = 0
			end

			self.finalIkAimIK.solver.IKPositionWeight = self.finalIkAimIKWeight
			self.finalIkAimIK.enabled = true
		end

		self.skillAimMode = true

		self:SetCharacterBodyIKEnable(false)

		if self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "ShowDragPanel", buttonLongPress)
		end
	end
end

function AnimalBase:EndAim()
	if self.finalIkAimIK ~= nil then
		self.finalIkAimIK.enabled = false
	end

	self.finalIkAimIKWeight = 0
end

function AnimalBase:EndAimDelay()
	if self:IsAimMode() == true then
		self.skillAimMode = false

		if self.skillLockAnimalIdLast > 0 then
			self:SetLockId(self.skillLockAnimalIdLast)

			self.skillLockAnimalIdLast = 0
		end

		self:SetCharacterBodyIKEnable(true)
	end
end

function AnimalBase:EndAimControl()
	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "HideAllDragPanel")
	end
end

function AnimalBase:GetAimTargetPosition()
	return self.moveDirAimTarget
end

function AnimalBase:IsAimMode()
	return self.skillAimMode
end

function AnimalBase:GetWeaponBox(index)
	if self.tfWeaponBox ~= nil and self.tfWeaponBox[index] ~= nil then
		return self.tfWeaponBox[index]
	end

	return nil
end

function AnimalBase:GetWeapon(index)
	if self.tfWeapon ~= nil and self.tfWeapon[index] ~= nil then
		return self.tfWeapon[index]
	end

	return nil
end

function AnimalBase:SetWeaponVisible(type, index, flg)
	if self.tfWeaponRenderVisible[index] ~= nil then
		self:SetVisibleValue(self.tfWeaponRenderVisible[index], type, flg)
	end
end

function AnimalBase:SetWeaponAllVisible(type, flg)
	for index, visible in pairs(self.tfWeaponRenderVisible) do
		if visible ~= nil then
			self:SetVisibleValue(visible, type, flg)
		end
	end
end

function AnimalBase:GetEquipment(index)
	if self.tfEquipment ~= nil and self.tfEquipment[index] ~= nil then
		return self.tfEquipment[index]
	end

	return nil
end

function AnimalBase:GetEquipmentRender(index)
	if self.tfEquipmentRender ~= nil and self.tfEquipmentRender[index] ~= nil then
		return self.tfEquipmentRender[index]
	end

	return nil
end

function AnimalBase:IsEquipmentVisible(index)
	if self.tfEquipmentRenderVisible[index] ~= nil then
		return self:GetVisibleValue(self.tfEquipmentRenderVisible[index])
	end

	return false
end

function AnimalBase:SetEquipmentVisible(type, index, flg)
	if self.tfEquipmentRenderVisible[index] ~= nil then
		self:SetVisibleValue(self.tfEquipmentRenderVisible[index], type, flg)
	end
end

function AnimalBase:SetEquipmentAllVisible(type, flg)
	for index, visible in pairs(self.tfEquipmentRenderVisible) do
		if visible ~= nil then
			self:SetVisibleValue(visible, type, flg)
		end
	end
end

function AnimalBase:SetRenderAllVisible(type, flg)
	if type == AnimalBase_Define.VisibleType.Act then
		self.showByActFlg = flg
	end

	self:SetBodyVisible(type, flg)
	self:SetBodyHairVisible(type, flg)
	self:SetBodyPartsVisible(type, flg)
	self:SetWeaponAllVisible(type, flg)
	self:SetEquipmentAllVisible(type, flg)
end

function AnimalBase:SetBodyVisible(type, flg)
	self:SetVisibleValue(self.tfBodyRenderVisible, type, flg)
end

function AnimalBase:SetBodyHairVisible(type, flg)
	self:SetVisibleValue(self.tfBodyHairRenderVisible, type, flg)
end

function AnimalBase:SetBodyPartsVisible(type, flg)
	self:SetVisibleValue(self.tfBodyPartsRenderVisible, type, flg)
end

function AnimalBase:UpdateRenderVisible()
	local ret = false

	if self.tfBodyRender ~= nil then
		ret = self:GetVisibleValue(self.tfBodyRenderVisible)

		if self.tfBodyRenderEnable ~= ret then
			self.tfBodyRender.enabled = ret
			self.tfBodyRenderEnable = ret
		end
	end

	if self.tfBodyHairRender ~= nil then
		ret = self:GetVisibleValue(self.tfBodyHairRenderVisible)

		if self.tfBodyHairRenderEnable ~= ret then
			self.tfBodyHairRender.enabled = ret
			self.tfBodyHairRenderEnable = ret
		end
	end

	if self.tfBodyPartsRender ~= nil then
		ret = self:GetVisibleValue(self.tfBodyPartsRenderVisible)

		if self.tfBodyPartsRenderEnable ~= ret then
			self.tfBodyPartsRender.enabled = ret
			self.tfBodyPartsRenderEnable = ret
		end
	end

	for index, render in pairs(self.tfWeaponRender) do
		if self.tfWeaponRender[index] ~= nil and self.tfWeaponRenderEnable[index] ~= nil and self.tfWeaponRenderVisible[index] ~= nil then
			ret = self:GetVisibleValue(self.tfWeaponRenderVisible[index])

			if self.tfWeaponRenderEnable[index] ~= ret then
				self.tfWeaponRender[index].enabled = ret
				self.tfWeaponRenderEnable[index] = ret
			end
		end
	end

	for index, render in pairs(self.tfEquipmentRender) do
		if self.tfEquipmentRender[index] ~= nil and self.tfEquipmentRenderEnable[index] ~= nil and self.tfEquipmentRenderVisible[index] ~= nil then
			ret = self:GetVisibleValue(self.tfEquipmentRenderVisible[index])

			if self.tfEquipmentRenderEnable[index] ~= ret then
				self.tfEquipmentRender[index].enabled = ret
				self.tfEquipmentRenderEnable[index] = ret
			end
		end
	end
end

function AnimalBase:InitVisibleValue(visible, flg)
	if visible ~= nil then
		visible[AnimalBase_Define.VisibleType.Act] = flg
		visible[AnimalBase_Define.VisibleType.Grade] = flg
		visible[AnimalBase_Define.VisibleType.Variety] = flg
		visible[AnimalBase_Define.VisibleType.Camera] = flg
		visible[AnimalBase_Define.VisibleType.Dialog] = flg
	end
end

function AnimalBase:GetVisibleValue(visible)
	if visible ~= nil then
		for type, flg in pairs(visible) do
			if flg == false then
				return false
			end
		end
	end

	return true
end

function AnimalBase:SetVisibleValue(visible, type, flg)
	if visible ~= nil then
		visible[type] = flg
	end
end

function AnimalBase:CheckCameraPenetrate()
	if self.cameraScene ~= nil and self.moveStateNow ~= AnimalBase_Define.MoveStateType.Dialog and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLinePrev and self.moveStateNow ~= AnimalBase_Define.MoveStateType.TimeLine then
		local camPos = self.cameraScene:GetCameraRealPosition()
		local nowPos = self:GetPosByWorldPos()
		local height = self:GetHeight() * 1.2
		local radius = self.heroData.BodyRadius * self.modelScale * 1
		local tmpDis = Vector3.Distance2DSquare(camPos, nowPos)

		if tmpDis < radius * radius and camPos.y < nowPos.y + height and camPos.y > nowPos.y then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Camera, false)
		else
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Camera, true)
		end
	else
		self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Camera, true)
	end
end

function AnimalBase:CheckAimTarget(angleHorizontal, angleVertical)
	if self:IsAimMode() == true then
		local buttonLongPress = self:GetLongPressButton()

		if buttonLongPress > 0 then
			angleVertical = MathHelper.getAngleHalf(angleVertical)

			local angleUpRange = AnimalBase_Define.AimUpDownAngleMax - self.moveDirAimStartAngle
			local angleDownRange = -AnimalBase_Define.AimUpDownAngleMax - self.moveDirAimStartAngle

			angleVertical = Mathf.Clamp(angleVertical, angleDownRange, angleUpRange)

			if DebugShowBulletRoute == true then
				local aimPivotPos = self:GetAttackBoxPosition(self.skillIndex, 1)
				local rot = Quaternion.Euler(0, angleHorizontal, 0)
				local forwardAim = rot * self.moveDirAimStartHorizontalDir
				local leftAim = Vector3.Cross(Vector3.up, -forwardAim)
				local rotateV = Quaternion.AngleAxis(angleVertical + self.moveDirAimStartAngle, leftAim)
				local forwardAimOld = forwardAim

				forwardAim = rotateV * forwardAim

				local testTarget = aimPivotPos + forwardAim.normalized * 30

				UnityEngine.Debug.DrawLine(aimPivotPos, testTarget, Color.green)

				local testTarget = aimPivotPos + forwardAimOld.normalized * 30

				UnityEngine.Debug.DrawLine(aimPivotPos, testTarget, Color.red)
			end

			return true, angleHorizontal, angleVertical
		end
	end

	return false, 0, 0
end

function AnimalBase:CheckAttackTargetEnable(tmpAnimal)
	if tmpAnimal ~= nil and tmpAnimal:IsWillDead() == false and tmpAnimal.lockDisable == false and self:IsMyTeam(tmpAnimal:GetTeamId()) == false and tmpAnimal:IsShow() == true and tmpAnimal:IsShowByAct() == true and tmpAnimal:GetHeroExtAIId() ~= GameAI.BehaviourMode.DoNotAttack and tmpAnimal:GetHeroExtAIId() ~= GameAI.BehaviourMode.Guide and tmpAnimal.moveStateNow ~= AnimalBase_Define.MoveStateType.Fly and tmpAnimal.moveStateNow ~= AnimalBase_Define.MoveStateType.Drop and tmpAnimal.moveStateNow ~= AnimalBase_Define.MoveStateType.Special then
		return true
	end

	return false
end

function AnimalBase:CheckAimAuto()
	if self.isHost == false then
		return false, 0, 0
	end

	if self.cameraScene:IsFollowingType(CameraMain.FollowingType.Aim) == false then
		return false, 0, 0
	end

	local cameraPos = self.cameraScene:GetCameraRealPosition()
	local cameraDir = self.cameraScene:GetCameraRealForward()
	local targetList = GameAI.GetSelectTarget(self, AnimalBase.GetSkillTargetType(self.heroId, self.skillIndex, 1))
	local findAnimal
	local disMin = 10

	for k, tmpAnimal in pairs(targetList) do
		if self:CheckAttackTargetEnable(tmpAnimal) == true then
			local aimPos = tmpAnimal:GetAimPosition()
			local dis = MathHelper.getDistancePointToLine(cameraPos, aimPos, cameraDir)
			local aimDir = aimPos - cameraPos
			local testAngle = Vector3.Angle(aimDir, cameraDir)

			if dis < disMin and dis < AnimalBase_Define.AimAutoDis and testAngle < 90 then
				findAnimal = tmpAnimal
				disMin = dis
			end
		end
	end

	local ret = false

	if findAnimal ~= nil then
		local targetPos = findAnimal:GetAimPosition()
		local targetDir = targetPos - cameraPos

		targetDir:SetNormalize()

		local targetBaseDir = targetDir:Clone()

		targetBaseDir.y = 0

		targetBaseDir:SetNormalize()

		local tmpAngleVertical = Vector3.Angle(targetBaseDir, targetDir)

		if targetDir.y < 0 then
			tmpAngleVertical = -tmpAngleVertical
		end

		tmpAngleVertical = MathHelper.getAngleHalf(tmpAngleVertical)

		if Mathf.Abs(tmpAngleVertical) <= AnimalBase_Define.AimUpDownAngleMax then
			local tmpCamBaseDir = cameraDir:Clone()

			tmpCamBaseDir.y = 0

			tmpCamBaseDir:SetNormalize()

			local tmpCamAngleVertical = Vector3.Angle(tmpCamBaseDir, cameraDir)

			if cameraDir.y < 0 then
				tmpCamAngleVertical = -tmpCamAngleVertical
			end

			tmpCamAngleVertical = MathHelper.getAngleHalf(tmpCamAngleVertical)

			local testAngleVertical = tmpAngleVertical - tmpCamAngleVertical
			local testHorizontalRot = Quaternion.FromToRotation(cameraDir, targetDir)
			local testAngleHorizontal = testHorizontalRot.eulerAngles.y

			testAngleHorizontal = MathHelper.getAngleHalf(testAngleHorizontal)

			return true, testAngleHorizontal, testAngleVertical
		end
	end

	return false, 0, 0
end

function AnimalBase:TryAimTarget(targetPos)
	if self:IsAimMode() == true then
		local targetList = GameAI.GetSelectTarget(self, AnimalBase.GetSkillTargetType(self.heroId, self.skillIndex, 1))
		local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
		local dir = Vector3.zero

		dir:SetVector3(targetPos)
		dir:Sub(startPos)

		local dis = self:GetShootDistanceMax()
		local ret = XPhysics.RaycastAll(self.animalId, 0, startPos.x, startPos.y, startPos.z, dir.x, dir.y, dir.z, dis, BulletBase.BulletLayerMask)

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

			ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(self.animalId, 0, BulletBase.BulletLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

			if ret == true and hitCollider ~= nil then
				local nearestAnimal

				if hitOwnerId > 0 and hitLayer ~= LayerShell then
					for i, tmpPlayer in pairs(targetList) do
						if tmpPlayer.animalId == hitOwnerId and self:CheckAttackTargetEnable(tmpPlayer) == true then
							nearestAnimal = tmpPlayer

							break
						end
					end
				end

				if nearestAnimal ~= nil then
					dir = nil

					return true, nearestAnimal
				end
			end
		end

		dir = nil
	end

	return false, nil
end

function AnimalBase:SetSkillDirection(angleHorizontal, angleVertical)
	if self:IsAimMode() == true then
		local buttonLongPress = self:GetLongPressButton()

		if buttonLongPress > 0 then
			self:ClearLockPlayer()

			local rot = Quaternion.Euler(0, angleHorizontal, 0)
			local forwardAim = rot * self.moveDirAim
			local forward = forwardAim:Clone()

			forward.y = 0

			self:LookAt(forward, true)

			local backAim = -forwardAim
			local leftAim = Vector3.Cross(Vector3.s_up, backAim)
			local rotateV = Quaternion.AngleAxis(angleVertical, leftAim)
			local tmpPivotPos = self:GetAttackBoxPosition(self.skillIndex, 1)

			forwardAim:MulQuat(rotateV)
			forwardAim:SetNormalize()
			forwardAim:Mul(self.moveDirAimTargetDistance)
			forwardAim:Add(tmpPivotPos)
			self.moveDirAimTarget:SetVector3(forwardAim)

			rot = nil
			rotateV = nil
			forward = nil
			forwardAim = nil
			backAim = nil
			leftAim = nil
		end
	end
end

function AnimalBase:SetAimDirectionForAI(targetPos)
	if self:IsAimMode() == true then
		local buttonLongPress = self:GetLongPressButton()

		if buttonLongPress > 0 then
			self:ClearLockPlayer()

			local nowPos = self:GetPosByWorldPos()
			local pivotPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local tmpDir = targetPos - pivotPos
			local targetPosNew = targetPos:Clone()

			if tmpDir.sqrMagnitude < AnimalBase_Define.AimDistanceMin * AnimalBase_Define.AimDistanceMin then
				tmpDir:SetNormalize()
				tmpDir:Mul(AnimalBase_Define.AimDistanceMin)
				targetPosNew:SetVector3(tmpDir)
				targetPosNew:Add(pivotPos)
			end

			tmpDir = nil
			tmpDir = targetPosNew - nowPos

			local height = tmpDir.y

			tmpDir.y = 0

			local tmpLen = tmpDir.magnitude

			if MathHelper.IsZero(tmpLen) == false then
				self:LookAt(tmpDir, false)
			end

			self.moveDirAimTarget:SetVector3(Vector3.s_forward)
			self.moveDirAimTarget:MulQuat(self:GetRotation())
			self.moveDirAimTarget:SetNormalize()
			self.moveDirAimTarget:Mul(tmpLen)

			self.moveDirAimTarget.y = height

			self.moveDirAimTarget:Add(nowPos)

			tmpDir = nil
			targetPosNew = nil

			return true
		end
	end

	return false
end

function AnimalBase:Update()
	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		return
	end

	self:UpdateAnimatorRender()
end

function AnimalBase:LateUpdateLoadArea()
	if self:IsStart() == false then
		return
	end

	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		return
	end

	self:ApplyCharacterMove()
	self:UpdateGravityCenterPosition()
end

function AnimalBase:LateUpdate()
	if self:IsStart() == false then
		return
	end

	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		return
	end

	self:UpdateAnimatorFrame()
	self:LateUpdateMoveStateLogic()
	self:ApplyCharacterMove()
	self:ApplyAnimatorIK()
	self:UpdateGravityCenterPosition()
	self:UpdateColliderBox()
	self:CheckCameraPenetrate()
	self:UpdateRenderVisible()
end

function AnimalBase:UpdateLogic()
	if self:IsShow() == false then
		return
	end

	if self.type == AnimalBase_Define.Type.HomeBase then
		return
	end

	self:UpdateLogicMovement()
end

function AnimalBase:AddBrain()
	local Brain

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		Brain = require("LuaScript/Logic/AI/BrainGuardMode")
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true then
		Brain = require("LuaScript/Logic/AI/BrainOccupyMode")
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true then
		Brain = require("LuaScript/Logic/AI/BrainFreeMode")
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		if MS_StoryList.IsStoryCarriage(self.storyId) == false then
			Brain = require("LuaScript/Logic/AI/BrainStoryMode")
		end
	else
		SystemHelper.LogError("=================addBrain ruleMode error!!!!!")

		return
	end

	if Brain ~= nil then
		self.animalBrain = Brain:new(self)

		self.animalBrain:SetHeroExtData(self.heroExtData)

		if self.heroExtData ~= nil then
			self.heroExtAiMode = tonumber(self.heroExtData.AiId)

			self.animalBrain:SetBehaviourMode(self.heroExtData.AiId)
		end

		self.beTree = self.animalBrain:createTree()

		self.animalBrain:SetBehaviorTree(self.beTree)
	end
end

function AnimalBase:ChangeAIMode(aiId)
	if self.animalBrain ~= nil then
		self.heroExtAiMode = aiId

		self.animalBrain:ChangeBehaviourMode(aiId)
	end
end

function AnimalBase:AddValue()
	local name = StringHelper.ToUpperFirst(self.modelName)
	local value = require("LuaScript/Logic/PlayerValue/" .. name .. "_Value")

	self.animalValue = value:new(self)

	if self.animalValue ~= nil then
		self.animalValue:SetScene(self.scene)
		self.animalValue:SetHeroPropertyData(self.heroPropertyData)
		self.animalValue:PrepareValue(self.animalLevel)
	end
end

function AnimalBase:AddConfig()
	local config = AnimalBase.Config[self.heroId]

	if config == nil then
		local name = StringHelper.ToUpperFirst(self.modelName)

		config = require("GameData/PlayerConfig/" .. name .. "_Config")
		AnimalBase.Config[self.heroId] = config
	end

	self.animalConfig = config
end

function AnimalBase:ResetData()
	self.animalValue:SetHeroPropertyData(self.heroPropertyData)
	self.animalValue:PrepareValue(self.animalLevel)
	self.animalValue:ShowValue()
end

function AnimalBase:UpdateValue()
	if self.animalValue ~= nil then
		self.animalValue:Update()
	end
end

function AnimalBase:GetValue()
	return self.animalValue
end

function AnimalBase:GetBrain()
	return self.animalBrain
end

function AnimalBase:GetAITarget()
	if self:IsWillDead() == true or self:IsShow() == false then
		return nil
	end

	if self.isHost == false and self.animalBrain ~= nil then
		return self.animalBrain:GetAnimalTarget()
	end

	return nil
end

function AnimalBase:GetAICompanion()
	if self:IsWillDead() == true or self:IsShow() == false then
		return nil
	end

	if self.isHost == false and self.animalBrain ~= nil then
		return self.animalBrain:GetAnimalCompanion()
	end

	return nil
end

function AnimalBase:CalculateDamage(attackerData)
	if self:IsEnd() == true or self:IsWillDead() == true or self:IsShow() == false or self.gameController:IsStopAttack() == true then
		return 0, 0, 0, 0, false
	end

	local hpSub = 0
	local hpAdd = 0
	local hpSubReal = 0
	local hpAddReal = 0
	local isWeak = false
	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local skillData = attackerData:GetSkillData()

	if attackVPlayer ~= nil and self.animalValue ~= nil then
		local damageType = attackerData:GetDamageType()

		if damageType == AnimalBase_Define.DamageType.Instant then
			hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = self.animalValue:DamageInstant(attackerData)
		elseif damageType == AnimalBase_Define.DamageType.Period then
			hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = self.animalValue:DamagePeriod(attackerData)
		end

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and BattleData.IsDarkForestScene() == false then
			local attackPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

			if attackPlayer ~= nil and attackPlayer.isHost == true and self.heroExtData ~= nil then
				local subSan = self.heroExtData.SanDamage * hpSubReal / self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)

				if subSan > 0 then
					local tmpTalentSanSub = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SanAttackSub, 0, 0)

					if tmpTalentSanSub > 0 then
						subSan = MathHelper.subValuePermil(subSan, tmpTalentSanSub)
					end

					if DebugSanUp == true then
						subSan = 30
					end

					attackPlayer.animalValue:SubProperty(MS_HeroData.Property.San, subSan)
				end
			end
		end
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.isHost == true and self.isHostBack == false and attackVPlayer:IsHost() == false and hpSubReal > 0 then
		self.gameController:SetNotPerfect()
	end

	if self:IsWillDead() == true then
		self:WillDead(attackVPlayer, skillData)
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function AnimalBase:CalculateTrickDamage(trickTouchData)
	local hpSub = 0
	local hpAdd = 0
	local hpSubReal = 0
	local hpAddReal = 0

	if self.animalValue ~= nil then
		local damageType = trickTouchData:GetDamageType()

		if damageType == AnimalBase_Define.DamageType.Instant then
			hpSub, hpAdd, hpSubReal, hpAddReal = self.animalValue:DamageTrickInstant(trickTouchData)
		elseif damageType == AnimalBase_Define.DamageType.Period then
			hpSub, hpAdd, hpSubReal, hpAddReal = self.animalValue:DamageTrickPeriod(trickTouchData)
		end
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.isHost == true and self.isHostBack == false and hpSubReal > 0 then
		self.gameController:SetNotPerfect()
	end

	if self:IsWillDead() == true then
		self:WillDead(nil, nil)
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal
end

function AnimalBase:CalculateStatusDamage(statusData, damage, overlay)
	self.animalValue:SubProperty(MS_HeroData.Property.Hp, damage * overlay, -1, -1, -1)

	local subToughness = statusData.ToughnessSub * overlay
	local subWeakness = statusData.WeaknessSub * overlay

	self.animalValue:SubToughness(subToughness)
	self.animalValue:SubProperty(MS_HeroData.Property.Weakness, subWeakness)

	if self:IsWillDead() == true then
		self:WillDead(nil, nil)
	end
end

function AnimalBase:FindPathPos(targetPos)
	local nowPos = self:GetPosByWorldPos()
	local x, y, z

	x, y, z = ProjectXPathFindingAI.FindPathPosition(self.animalId, nowPos.x, nowPos.y, nowPos.z, targetPos.x, targetPos.y, targetPos.z, x, y, z)

	self.movePathPos:Set(x, y, z)

	return self.movePathPos
end

function AnimalBase:GetWanderPoint()
	if self.scene ~= nil then
		local wanderList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Wander)

		return SystemHelper.GetRandomValueInTable(wanderList, self.animalId)
	end

	return nil
end

function AnimalBase:GetSightRange()
	if self.heroExtData ~= nil and self.heroExtData.SightRadius >= 0 then
		return self.heroExtData.SightRadius
	else
		return AnimalBase_Define.AISightRadiusDefault
	end
end

function AnimalBase:GetHearingRange()
	if self.heroExtData ~= nil and self.heroExtData.HearingRadius >= 0 then
		return self.heroExtData.HearingRadius
	else
		return AnimalBase_Define.AIHearingRadiusDefault
	end
end

function AnimalBase:GetHearingAngle()
	if self.heroExtData ~= nil and self.heroExtData.HearingAngle >= 0 then
		return self.heroExtData.HearingAngle
	else
		return AnimalBase_Define.AIHearingAngleDefault
	end
end

function AnimalBase:GetSightAngle()
	if self.heroExtData ~= nil and self.heroExtData.SightAngle >= 0 then
		return self.heroExtData.SightAngle
	else
		return AnimalBase_Define.AISightAngleDefault
	end
end

function AnimalBase:ShowGradeEffect()
	return
end

function AnimalBase:AddSelfEffectLoop(key, eff)
	if self.selfEffectLoop == nil then
		self.selfEffectLoop = {}
	end

	if self.selfEffectLoop[key] == nil then
		self.selfEffectLoop[key] = eff
	end
end

function AnimalBase:CreateSelfEffectLoop(key, tfRoot, effName)
	if self.selfEffectLoop == nil then
		self.selfEffectLoop = {}
	end

	if self.selfEffectLoop[key] == nil and tfRoot ~= nil and effName ~= "" then
		local effect = VfxManager.PlayBindMulti(tfRoot, effName)

		if effect ~= nil then
			self:AddSelfEffectLoop(key, effect)

			return effect
		end
	end

	return nil
end

function AnimalBase:ClearSelfEffectLoop(key)
	if self.selfEffectLoop ~= nil and self.selfEffectLoop[key] ~= nil then
		self.selfEffectLoop[key]:Clear()

		self.selfEffectLoop[key] = nil
	end
end

function AnimalBase:ClearSelfEffectLoopAll()
	if self.selfEffectLoop ~= nil then
		for k, v in pairs(self.selfEffectLoop) do
			if v ~= nil then
				v:Clear()
			end
		end

		self.selfEffectLoop = nil
	end
end

function AnimalBase:StopSkillAudio()
	if self.skillAudio ~= nil then
		AudioCtrl.StopHeroAudio(self.skillAudio, self.animalId)

		self.skillAudio = nil
	end
end

function AnimalBase:PlayStairAudio()
	local stairData = MS_StoryStair.GetStoryStair(self.storyId, self.moveStairId)

	if self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightUp2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownReady2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbStartReady then
		if stairData ~= nil then
			if stairData.Type == 1 then
				AudioCtrl.SetHeroAudio("climb_stairs_wood", self.tfModel, self.animalId)
			elseif stairData.Type == 2 then
				AudioCtrl.SetHeroAudio("climb_stairs_metal", self.tfModel, self.animalId)
			end
		end

		AudioCtrl.StopHeroAudio("climb_stairs_fast", self.animalId)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbEndUp2 then
		if stairData ~= nil then
			if stairData.Type == 1 then
				AudioCtrl.SetHeroAudio("climb_stairs_wood", self.tfModel, self.animalId)
			elseif stairData.Type == 2 then
				AudioCtrl.SetHeroAudio("climb_stairs_metal", self.tfModel, self.animalId)
			end
		end

		AudioCtrl.StopHeroAudio("climb_stairs_fast", self.animalId)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDown2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDown2 then
		AudioCtrl.SetHeroAudio("climb_stairs_fast", self.tfModel, self.animalId)
	elseif self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbLeftDownToIdle2 or self.moveStateNow == AnimalBase_Define.MoveStateType.ClimbRightDownToIdle2 then
		AudioCtrl.StopHeroAudio("climb_stairs_fast", self.animalId)
	end
end

function AnimalBase:PlayEffect(vfxRoot, vfxName, vfxBind)
	local eff

	if vfxBind > 0 then
		eff = VfxManager.PlayBindMulti(vfxRoot, vfxName)
	else
		eff = VfxManager.PlayTransformFreezeMulti(vfxRoot, vfxName)
	end

	return eff
end

function AnimalBase:PlaySkillAudio(isOneshot, paramName, param)
	if self:IsSkillingSkill() == true then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if skillData ~= nil then
			local skillAuido = skillData.SkillAudio

			if skillAuido ~= "" then
				self.skillAudio = skillAuido

				AudioCtrl.SetHeroAudio(self.skillAudio, self.tfModel, self.animalId, paramName, param, isOneshot)
			end
		end
	end
end

function AnimalBase:PlaySkillEffect(isTrigger)
	if self:IsSkillingSkill() == true then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if skillData ~= nil then
			for i = 1, AnimalBase_Define.VfxSkillKeyNum do
				local tmpTrigger = 0
				local tmpEffKey = AnimalBase_Define.VfxSkillKey .. i
				local tmpEffTrigger = AnimalBase_Define.VfxSkillTriggerKey .. i
				local tmpKey = tmpEffKey

				if isTrigger == true then
					tmpTrigger = 1
					tmpKey = tmpEffTrigger
				end

				if skillData[tmpEffKey] ~= "" and skillData[tmpEffTrigger] == tmpTrigger then
					local vfxRoot = self:GetEffectRoot(skillData[AnimalBase_Define.VfxSkillRootKey .. i])

					if vfxRoot ~= nil then
						local eff = self:PlayEffect(vfxRoot, skillData[tmpEffKey], skillData[AnimalBase_Define.VfxSkillBindKey .. i])

						if eff ~= nil then
							self:AddSkillEffect(tmpKey, eff)

							if skillData[AnimalBase_Define.VfxSkillDelayKey .. i] > 0 then
								eff:SetDelayClear(true, nil)
							end
						end
					end
				end
			end
		end
	end
end

function AnimalBase:AddSkillEffect(key, eff)
	if self.skillEffect == nil then
		self.skillEffect = {}
	end

	if self.skillEffect[key] ~= nil then
		self.skillEffect[key]:SetSpeed(1)

		self.skillEffect[key] = nil
	end

	self.skillEffect[key] = eff
end

function AnimalBase:ClearSkillEffect(key)
	if self.skillEffect ~= nil and self.skillEffect[key] ~= nil then
		self.skillEffect[key]:Clear()

		self.skillEffect[key] = nil
	end
end

function AnimalBase:ClearSkillEffectAll()
	if self.skillEffect ~= nil then
		for k, v in pairs(self.skillEffect) do
			if v ~= nil then
				v:Clear()
			end
		end

		self.skillEffect = nil
	end
end

function AnimalBase:SetSkillEffectAllSpeed(speed)
	if self.skillEffect ~= nil then
		for k, v in pairs(self.skillEffect) do
			if v ~= nil then
				v:SetSpeed(speed)
			end
		end
	end
end

function AnimalBase:AddSkillEffectLoop(key, eff)
	if self.skillEffectLoop == nil then
		self.skillEffectLoop = {}
	end

	if self.skillEffectLoop[key] == nil then
		self.skillEffectLoop[key] = eff
	end
end

function AnimalBase:GetSkillEffectLoop(key)
	if self.skillEffectLoop ~= nil and self.skillEffectLoop[key] ~= nil then
		return self.skillEffectLoop[key]
	end

	return nil
end

function AnimalBase:ClearSkillEffectLoop(key)
	if self.skillEffectLoop ~= nil and self.skillEffectLoop[key] ~= nil then
		self.skillEffectLoop[key]:Clear()

		self.skillEffectLoop[key] = nil
	end
end

function AnimalBase:ClearSkillEffectLoopAll()
	if self.skillEffectLoop ~= nil then
		for k, v in pairs(self.skillEffectLoop) do
			if v ~= nil then
				v:Clear()
			end
		end

		self.skillEffectLoop = nil
	end
end

function AnimalBase:LogTest(txt)
	if self.isHost == true then
		SystemHelper.LogTest(txt)
	end
end

function AnimalBase:LogVector3(vec3, txt)
	if self.animalId == 1 then
		local txt2 = txt .. "=vec3.x=" .. vec3.x .. ",y=" .. vec3.y .. ",vec3.z=" .. vec3.z

		SystemHelper.LogTest(txt2)
	end
end

function AnimalBase:SetHeroPropertyData(propertyData)
	self.heroPropertyData = propertyData
end

function AnimalBase:SetHeroExtData(heroExtData)
	self.heroExtData = heroExtData

	if self.heroExtData == nil then
		return
	end

	if self.heroExtData.IsBoss > 0 then
		self.boss = self.heroExtData.IsBoss
	end

	if self.heroExtData.HeadInfoHeight ~= nil and self.heroExtData.HeadInfoHeight > 0 then
		self.headInfoHeight = self.heroExtData.HeadInfoHeight
	end

	if self.heroExtData.DamageInfoHeight ~= nil and self.heroExtData.DamageInfoHeight > 0 then
		self.damageInfoHeight = self.heroExtData.DamageInfoHeight
	end

	for i = 1, AnimalBase_Define.AnimalColliderWeakMax do
		if self.heroExtData["DamageWeakHeight" .. i] > 0 then
			self.damageWeakHeight[i] = self.heroExtData["DamageWeakHeight" .. i]
		end
	end

	if self.heroExtData.EffectId > 0 and self.heroExtData.EffectRoot > 0 then
		local effRoot = self:GetEffectRoot(self.heroExtData.EffectRoot)

		if effRoot ~= nil then
			local effect = VfxManager.PlayBindMulti(effRoot, "vfx_self_" .. self.heroExtData.EffectId)

			if effect ~= nil then
				if self.heroExtData.Scale > 0 then
					effect:SetScale(self.heroExtData.Scale, self.heroExtData.Scale, self.heroExtData.Scale)
				end

				effect:SetRotation(0, 0, 0, 1)
				self:AddSelfEffectLoop("self_0", effect)
			end
		end
	end

	self.heroVariety = self.heroExtData.EquipmentId

	self:InitHeroVariety()

	self.heroBornType = self.heroExtData.BornType
end

function AnimalBase:InitHeroVariety()
	return
end

function AnimalBase:GetHeroVariety()
	return self.heroVariety
end

function AnimalBase:GetHeroBornType()
	return self.heroBornType
end

function AnimalBase:SetHeroBornType(bornType)
	self.heroBornType = bornType
end

function AnimalBase:IsBornSkilling()
	if self:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == true then
		return true
	end

	return false
end

function AnimalBase:GetMonsterAILevel()
	if self.type == AnimalBase_Define.Type.Monster and self.heroExtData ~= nil then
		return self.heroExtData.AILevel
	end

	return 1
end

function AnimalBase:GetHeroExtDialogInfo()
	if self.isHost == false and self.heroExtData ~= nil then
		return self.heroExtData.DialogId, self.heroExtData.DialogRadius
	end

	return "", 0
end

function AnimalBase:GetHeroExtAIId()
	if self.isHost == false and self.heroExtData ~= nil then
		return self.heroExtAiMode
	end

	return 0
end

function AnimalBase:GetHeroExtBornIndex()
	if self.isHost == false and self.heroExtData ~= nil then
		return tonumber(self.heroExtData.PositionID)
	end

	return 0
end

function AnimalBase:GetHeroExtGetHitTeamId()
	if self.isHost == false and self.heroExtData ~= nil then
		return tonumber(self.heroExtData.OnlyGetHitByTeam)
	end

	return 0
end

function AnimalBase:IsHeroSanNotNormal(heroId)
	if self.isHost == true and (heroId <= 0 or heroId > 0 and self.heroId == heroId) then
		local sanType = self.animalValue:GetSanType()

		if sanType ~= AnimalBase_Define.SanType.Normal then
			return true
		end
	end

	return false
end

function AnimalBase:IsHeroSanCrazy(heroId)
	if self.isHost == true and (heroId <= 0 or heroId > 0 and self.heroId == heroId) then
		local sanType = self.animalValue:GetSanType()

		if sanType == AnimalBase_Define.SanType.Crazy then
			return true
		end
	end

	return false
end

function AnimalBase.OnAnimatorMove(animalId, posX, posY, posZ, rotY)
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		local player = sceneController:FindPlayerById(animalId)

		if player ~= nil and player:IsDead() == false and player:IsShow() == true then
			player:SetCharacterMove(posX, posY, posZ, rotY)
		end
	end
end

function AnimalBase:GetSkillTypeForAI()
	if self:IsSkillingSkill() == true then
		return self.animalConfig.skillTypeForAI[self.skillIndex][self.skillCombo]
	end

	return AnimalBase_Define.SkillTypeForAI.None
end

function AnimalBase:GetSkillRotForAI()
	if self:IsSkillingSkill() == true then
		return self.animalConfig.skillRotationTypeAI[self.skillIndex][self.skillCombo]
	end

	return AnimalBase_Define.SkillRotTypeAI.Normal
end

function AnimalBase:GetSkillColliderShape(skillIndex, skillCombo)
	if self.animalConfig.skillColliderShape[skillIndex] ~= nil and self.animalConfig.skillColliderShape[skillIndex][skillCombo] ~= nil then
		return self.animalConfig.skillColliderShape[skillIndex][skillCombo]
	end

	return XCube.ShapeType.None
end

function AnimalBase:GetAttackBoxType(skillIndex, skillCombo)
	if self.animalConfig.skillAttackBoxType[skillIndex] ~= nil and self.animalConfig.skillAttackBoxType[skillIndex][skillCombo] ~= nil then
		return self.animalConfig.skillAttackBoxType[skillIndex][skillCombo]
	end

	return AnimalBase_Define.AttackBoxType.None
end

function AnimalBase:IsSkillHitComboEnable(skillIndex, hitType)
	local hitCombo = self.animalConfig.skillHitCombo

	if self.isHost == false then
		hitCombo = self.animalConfig.skillHitComboAI
	end

	if hitCombo[skillIndex] ~= nil then
		for k, v in pairs(hitCombo[skillIndex]) do
			if v == hitType then
				return true
			end
		end
	end

	return false
end

function AnimalBase:IsSkillComboSkill(skillIndex, comboSkillIndex)
	if #self.animalConfig.skillComboSkill[skillIndex] > 0 then
		for i = 1, #self.animalConfig.skillComboSkill[skillIndex] do
			local tmpSkillId = self.animalConfig.skillComboSkill[skillIndex][i]

			if tmpSkillId == comboSkillIndex then
				return true
			end
		end
	end

	return false
end

function AnimalBase:IsSkillMultiTarget(skillIndex, skillCombo)
	if self.animalConfig.skillMultiTarget[skillIndex] ~= nil and self.animalConfig.skillMultiTarget[skillIndex][skillCombo] ~= nil then
		return self.animalConfig.skillMultiTarget[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.GetSkillTypeForAIById(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillTypeForAI[skillIndex] ~= nil and config.skillTypeForAI[skillIndex][skillCombo] ~= nil then
		return config.skillTypeForAI[skillIndex][skillCombo]
	end

	return AnimalBase_Define.SkillTypeForAI.None
end

function AnimalBase.GetSkillTargetType(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillTargetType[skillIndex] ~= nil and config.skillTargetType[skillIndex][skillCombo] ~= nil then
		return config.skillTargetType[skillIndex][skillCombo]
	end

	return GameAI.SkillTargetType.None
end

function AnimalBase.IsSkillBlockedEnable(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillBlockedEnable[skillIndex] ~= nil and config.skillBlockedEnable[skillIndex][skillCombo] ~= nil then
		return config.skillBlockedEnable[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.GetSkillDamageType(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillDamageType[skillIndex] ~= nil and config.skillDamageType[skillIndex][skillCombo] ~= nil then
		return config.skillDamageType[skillIndex][skillCombo]
	end

	return AnimalBase_Define.DamageType.None
end

function AnimalBase.IsSkillBlockedRebound(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillBlockedRebound[skillIndex] ~= nil and config.skillBlockedRebound[skillIndex][skillCombo] ~= nil then
		return config.skillBlockedRebound[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.IsHitHandEnable(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.hitHandEnable[skillIndex] ~= nil and config.hitHandEnable[skillIndex][skillCombo] ~= nil then
		return config.hitHandEnable[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.IsHitHandRebound(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.hitHandRebound[skillIndex] ~= nil and config.hitHandRebound[skillIndex][skillCombo] ~= nil then
		return config.hitHandRebound[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.IsSkillCounterAttackedEnable(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillCounterAttackedEnable[skillIndex] ~= nil and config.skillCounterAttackedEnable[skillIndex][skillCombo] ~= nil then
		return config.skillCounterAttackedEnable[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase:IsSkillCounterAttackedStart(attackVPlayer, skillIndex, skillCombo)
	local attHeroId = attackVPlayer:GetHeroId()

	if self:IsHaveSkill(AnimalBase_Define.SkillType.CounterAttack) == true and AnimalBase.IsSkillCounterAttackedEnable(attHeroId, skillIndex, skillCombo) == true and self:IsSkilling() == true and self:IsSkillingById(AnimalBase_Define.SkillType.CounterAttack, 0) == false then
		local attSkillData = MS_SkillData.GetSkillData(attHeroId, skillIndex, skillCombo)
		local hitSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if attSkillData ~= nil and hitSkillData ~= nil and hitSkillData.CounterAttack > attSkillData.CounterAttack then
			local tmpSkillCounterAttack = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillCounterAttack)

			if DebugTestSkillCounterAttack == true then
				tmpSkillCounterAttack = 1
			end

			if tmpSkillCounterAttack > 0 then
				local skillDataCounterAttack = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.CounterAttack, 1)

				if skillDataCounterAttack ~= nil and (skillDataCounterAttack.SkillTalent <= 0 or self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, skillDataCounterAttack.SkillIndex, skillDataCounterAttack.SkillCombo) >= skillDataCounterAttack.SkillTalent) then
					local nowPos = self:GetPosByWorldPos()
					local attackPos = attackVPlayer:GetPosition()
					local attackDis = Vector3.Distance(nowPos, attackPos)

					if self:IsPermitAutoLock(attackPos, attackDis) == true then
						return true
					end
				end
			end
		end
	end

	return false
end

function AnimalBase:IsTrickCounterAttackedStart(trick, trickData)
	if trickData ~= nil and trick ~= nil and self:IsHaveSkill(AnimalBase_Define.SkillType.CounterAttack) == true and self:IsSkilling() == true and self:IsSkillingById(AnimalBase_Define.SkillType.CounterAttack, 0) == false then
		local hitSkillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if hitSkillData ~= nil and hitSkillData.CounterAttack > trickData.CounterAttack then
			local tmpSkillCounterAttack = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillCounterAttack)

			if DebugTestSkillCounterAttack == true then
				tmpSkillCounterAttack = 1
			end

			if tmpSkillCounterAttack > 0 then
				local skillDataCounterAttack = MS_SkillData.GetSkillData(self.heroId, AnimalBase_Define.SkillType.CounterAttack, 1)

				if skillDataCounterAttack ~= nil and (skillDataCounterAttack.SkillTalent <= 0 or self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillOpen, skillDataCounterAttack.SkillIndex, skillDataCounterAttack.SkillCombo) >= skillDataCounterAttack.SkillTalent) then
					return true
				end
			end
		end
	end

	return false
end

function AnimalBase.IsSkillCounterAttackedRebound(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillCounterAttackedRebound[skillIndex] ~= nil and config.skillCounterAttackedRebound[skillIndex][skillCombo] ~= nil then
		return config.skillCounterAttackedRebound[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.IsSkillCounterAttackedKeep(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillCounterAttackedKeep[skillIndex] ~= nil and config.skillCounterAttackedKeep[skillIndex][skillCombo] ~= nil then
		return config.skillCounterAttackedKeep[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.IsSkillBeatBackEnable(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillBeatBackEnable[skillIndex] ~= nil and config.skillBeatBackEnable[skillIndex][skillCombo] ~= nil then
		return config.skillBeatBackEnable[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase:IsSkillBeatBackStart()
	if self:IsSkilling() == true and AnimalBase.IsSkillBeatBackEnable(self.heroId, self.skillIndex, self.skillCombo) == true then
		local ret = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillBeatBack, self.skillIndex, self.skillCombo)

		if ret > 0 then
			local tmpSkillBeatBack = self:GetAnimatorParam(AnimalBase_Define.ParamType.SkillBeatBack)

			if DebugTestSkillBeatBack == true then
				tmpSkillBeatBack = 1
			end

			if tmpSkillBeatBack > 0 then
				return true
			end
		end
	end

	return false
end

function AnimalBase.IsSkillParryEnable(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillParryEnable[skillIndex] ~= nil and config.skillParryEnable[skillIndex][skillCombo] ~= nil then
		return config.skillParryEnable[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.IsSkillParryRebound(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillParryRebound[skillIndex] ~= nil and config.skillParryRebound[skillIndex][skillCombo] ~= nil then
		return config.skillParryRebound[skillIndex][skillCombo]
	end

	return false
end

function AnimalBase.GetSkillHitType(heroId, skillIndex, skillCombo)
	local config = AnimalBase.Config[heroId]

	if config ~= nil and config.skillHitType[skillIndex] ~= nil and config.skillHitType[skillIndex][skillCombo] ~= nil then
		return config.skillHitType[skillIndex][skillCombo]
	end

	return AnimalBase_Define.HitType.FontL
end

function AnimalBase:IsHaveSkill(skillIndex)
	if self.animalConfig.skillComboMax[skillIndex] ~= nil and self.animalConfig.skillComboMax[skillIndex] > 0 then
		return true
	end

	return false
end

function AnimalBase:ConvertHitType(hitType)
	if self.animalConfig.hitTypeConvert[hitType] ~= nil then
		return self.animalConfig.hitTypeConvert[hitType]
	end

	return hitType
end

function AnimalBase:GetAnimatorLayerIndex(name)
	return self.animalConfig.animatorLayerConfig[name]
end

function AnimalBase:IsSkillAutoSkillStart()
	return false
end

return AnimalBase
