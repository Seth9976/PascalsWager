-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerDefine/AnimalBase_Define.lua

AnimalBase_Define = {}
AnimalBase_Define.MotionGravity = -29.43
AnimalBase_Define.MotionFly = 3
AnimalBase_Define.MotionFlyMove = 5
AnimalBase_Define.MotionFlyHeightMax = 100
AnimalBase_Define.MotionSlopeSlipSpeed = 6
AnimalBase_Define.MotionSlopeAngleMin = 12
AnimalBase_Define.MotionSlopeAngleMax = 40
AnimalBase_Define.MotionSlopeAngleSave = 20
AnimalBase_Define.MotionWalkSpeed = 1
AnimalBase_Define.MotionRunSpeed = 2
AnimalBase_Define.MotionSprintSpeed = 3
AnimalBase_Define.MotionSpecialWalkSpeed = 1
AnimalBase_Define.MotionSpecialRunSpeed = 2
AnimalBase_Define.MotionSpecialSprintSpeed = 2
AnimalBase_Define.MotionCarriageSpeed = 1
AnimalBase_Define.MotionTimeLineMoveDecelerate = 0.8
AnimalBase_Define.MotionSlipDownDecelerate = 1
AnimalBase_Define.MotionDropFrontSpeedMax = 3
AnimalBase_Define.MotionDropFrontSpeedMin = 3
AnimalBase_Define.MotionFallMin = -9
AnimalBase_Define.MotionFallMax = 0
AnimalBase_Define.MotionFallHighHeight = 2
AnimalBase_Define.MotionRevertAngle = 150
AnimalBase_Define.MotionFadeOutPinWeightSpeed = 0.26
AnimalBase_Define.MotionFadeOutMuscleWeightSpeed = 0.5
AnimalBase_Define.MotionMuscleWeightMin = 0.05
AnimalBase_Define.MotionStandRotationAngleMin = 5
AnimalBase_Define.MotionStandRotationSpeed = 9
AnimalBase_Define.MotionMoveRotationSpeed = 25
AnimalBase_Define.MotionMoveRotationAngleMin = 15
AnimalBase_Define.MotionMoveTurnSpeed = 7
AnimalBase_Define.MotionPositionHide = Vector3.NewS(0, -100, 0)
AnimalBase_Define.AimChangeAngleMaxVertical = 90
AnimalBase_Define.AimChangeAngleMaxHorizontal = 90
AnimalBase_Define.AimUpDownAngleMax = 30
AnimalBase_Define.AimDistanceMin = 5
AnimalBase_Define.AimAutoDis = 1
AnimalBase_Define.AimAutoSpeed = 1
AnimalBase_Define.AimWeightSpeedSub = 1
AnimalBase_Define.AimWeightSpeedAdd = 2
AnimalBase_Define.ShootTargetAngleMax = 15
AnimalBase_Define.MotionBattleModeToNormalTime = 7
AnimalBase_Define.NightmareShowTime = 3
AnimalBase_Define.NightmareStartMoveTime = 2
AnimalBase_Define.NightmareEndTime = 3
AnimalBase_Define.CallStartDissolveStartTime = 0
AnimalBase_Define.CallStartDissolveEndTime = 0.5
AnimalBase_Define.CallEndDissolveStartTime = 0.5
AnimalBase_Define.CallEndDissolveEndTime = 1
AnimalBase_Define.JoystickInnerClearTimeLimit = 1
AnimalBase_Define.HomeBaseHeight = 3
AnimalBase_Define.HitCubeScale = 1
AnimalBase_Define.CarriageBodyRadius = 0.25
AnimalBase_Define.AISightRadiusDefault = 10
AnimalBase_Define.AISightAngleDefault = 55
AnimalBase_Define.AIHearingRadiusDefault = 8
AnimalBase_Define.AIHearingAngleDefault = 180
AnimalBase_Define.LockDistancePlayer = 15
AnimalBase_Define.LockDistanceEnemy = 30
AnimalBase_Define.LockAngleMax = 55
AnimalBase_Define.LockAngle = 50
AnimalBase_Define.LockAngleForMoveTurn = 30
AnimalBase_Define.CameraDistanceRateElevator = 0.3
AnimalBase_Define.SightUpdateTimeInterval = 1
AnimalBase_Define.SkillExecuteAngle = 60
AnimalBase_Define.SkillExecuteDistance = 1.2
AnimalBase_Define.SkillBackstabAngle = 60
AnimalBase_Define.SkillBackstabDistance = 1.5
AnimalBase_Define.SkillTouchHitComboTime = 2
AnimalBase_Define.SkillTouchHitComboMin = 3
AnimalBase_Define.SkillRunExitIgnoreTime = 0.3
AnimalBase_Define.SkillCallCondition = 11
AnimalBase_Define.CallHost_10006 = 10006
AnimalBase_Define.CallHost_20040 = 20040
AnimalBase_Define.CallHost_20027 = 20027
AnimalBase_Define.HitTowardTimeStart = 0
AnimalBase_Define.HitTowardTimeEnd = 0.1
AnimalBase_Define.HitTowardExit = 0.2
AnimalBase_Define.HitCounterAttackNoHitTime = 0.1
AnimalBase_Define.AutoLockDistance = 5
AnimalBase_Define.AutoLockAngleDistanceMin = 75
AnimalBase_Define.AutoLockAngleDistanceMax = 30
AnimalBase_Define.WaterDeadHeight = 2
AnimalBase_Define.AnimalFootstepsDistance = 15
AnimalBase_Define.AnimalHostRadiusAdd = 0.2
AnimalBase_Define.AnimalMonsterRadiusMinRatio = 0.5
AnimalBase_Define.AnimalFootRadiusRatio = 0.5
AnimalBase_Define.AnimalRouteColliderMicroDistance = 0.01
AnimalBase_Define.AnimalRouteColliderSkin = 0.03
AnimalBase_Define.AnimalRouteColliderOffsetY = 0.2
AnimalBase_Define.AnimalRouteColliderAngleMax = 45
AnimalBase_Define.AnimalRouteColliderResult = {
	NewUnknown = 1,
	Old = 0,
	New = 2
}
AnimalBase_Define.AnimalColliderLayerMaskForGround = LayerMask.GetMask("Ground")
AnimalBase_Define.AnimalColliderLayerMaskForGroundAndBody = LayerMask.GetMask("AnimalBody", "AnimalBodyBone", "Shell", "Ground")
AnimalBase_Define.AnimalColliderLayerMaskForBody = LayerMask.GetMask("WallOpaque", "WallTransparent", "WallInvisible", "WallMonster", "Ground")
AnimalBase_Define.HostColliderLayerMaskForWall = LayerMask.GetMask("WallOpaque", "WallTransparent", "WallInvisible", "Ground")
AnimalBase_Define.MonsterColliderLayerMaskForWall = LayerMask.GetMask("WallOpaque", "WallTransparent", "WallInvisible", "WallMonster", "Ground")
AnimalBase_Define.HostColliderLayerMask = LayerMask.GetMask("AnimalBody", "AnimalBodyBone", "Shell", "WallOpaque", "WallTransparent", "WallInvisible", "Ground")
AnimalBase_Define.HostBodyBoneColliderLayerMask = LayerMask.GetMask("WallOpaque", "WallTransparent", "WallInvisible", "Ground")
AnimalBase_Define.MonsterColliderLayerMask = LayerMask.GetMask("AnimalBody", "AnimalBodyBone", "Shell", "WallOpaque", "WallTransparent", "WallInvisible", "WallMonster", "Ground")
AnimalBase_Define.MonsterBodyBoneColliderLayerMask = LayerMask.GetMask("WallOpaque", "WallTransparent", "WallInvisible", "WallMonster", "Ground")
AnimalBase_Define.VfxName_Nightmare = "vfx_nightmare"
AnimalBase_Define.VfxName_NightmareStart = "vfx_nightmare_appear"
AnimalBase_Define.VfxName_NightmareDeath = "vfx_nightmare_death"
AnimalBase_Define.VfxName_MonsterCrazy = "vfx_nightmare_low"
AnimalBase_Define.VfxName_CounterAttack = "vfx_common_counterattack"
AnimalBase_Define.VfxName_ChangeStart = "vfx_common_changestart"
AnimalBase_Define.VfxName_ChangeEnd = "vfx_common_changeend"
AnimalBase_Define.VfxName_ChangeRebornStart = "vfx_common_changestart"
AnimalBase_Define.VfxName_ChangeRebornEnd = "vfx_save_character"
AnimalBase_Define.VfxName_TransferStart = "vfx_common_changestart"
AnimalBase_Define.VfxName_TransferEnd = "vfx_common_changeend"
AnimalBase_Define.VfxName_Rest = "vfx_save_character"
AnimalBase_Define.VfxName_Reborn = "vfx_common_reborn"
AnimalBase_Define.VfxName_HitCrit = "vfx_hit_70025"
AnimalBase_Define.VfxName_HitBlock = "vfx_hit_70005"
AnimalBase_Define.VfxName_StatueBuff1 = "vfx_maze_getstatus1"
AnimalBase_Define.VfxName_StatueBuff2 = "vfx_maze_getstatus2"
AnimalBase_Define.VfxName_FountainBuff = "vfx_maze_fountain_status1"
AnimalBase_Define.VfxName_CrateMonster = "vfx_maze_crate_self"
AnimalBase_Define.VfxSkillKeyNum = 3
AnimalBase_Define.VfxSkillKey = "SkillEffect"
AnimalBase_Define.VfxSkillKey1 = "SkillEffect1"
AnimalBase_Define.VfxSkillKey2 = "SkillEffect2"
AnimalBase_Define.VfxSkillKey3 = "SkillEffect3"
AnimalBase_Define.VfxSkillTriggerKey = "SkillEffectTrigger"
AnimalBase_Define.VfxSkillRootKey = "SkillEffectRoot"
AnimalBase_Define.VfxSkillRootKey1 = "SkillEffectRoot1"
AnimalBase_Define.VfxSkillBindKey = "SkillEfffectBind"
AnimalBase_Define.VfxSkillBindKey1 = "SkillEfffectBind1"
AnimalBase_Define.VfxSkillDelayKey = "SkillEfffectDelay"
AnimalBase_Define.VfxSkillDelayKey1 = "SkillEfffectDelay1"
AnimalBase_Define.VfxGroundMud = "vfx_run_01"
AnimalBase_Define.VfxGroundGrass = "vfx_run_01"
AnimalBase_Define.VfxGroundStone = "vfx_run_01"
AnimalBase_Define.VfxGroundWater = "vfx_run_04"
AnimalBase_Define.VfxGroundRiver = "vfx_run_03"
AnimalBase_Define.VfxGroundLake = "vfx_run_04"
AnimalBase_Define.VfxGroundWood = "vfx_run_01"
AnimalBase_Define.VfxGroundGold = "vfx_run_05"
AnimalBase_Define.VfxTouchGroundWater = "vfx_run_02"
AnimalBase_Define.ObjName_AttackBox = "attackBoxSkill"
AnimalBase_Define.ObjName_ParryBox = "parryBox"
AnimalBase_Define.ObjName_CameraBox = "cameraBox"
AnimalBase_Define.ObjName_WeaponBox = "weaponBox"
AnimalBase_Define.ObjName_Weapon = "weapon"
AnimalBase_Define.ObjName_Equipment = "equipment"
AnimalBase_Define.ObjName_BodyGrounder = "grounderFBBIK"
AnimalBase_Define.ObjName_BodyPoseTilt = "offsetPoseTilt"
AnimalBase_Define.ObjName_AimPinBox = "aimPinBox"
AnimalBase_Define.ObjName_AimBox = "aimBox"
AnimalBase_Define.ObjName_HitReaction = "HitReaction"
AnimalBase_Define.ObjName_AimTransform = "aimTransform"
AnimalBase_Define.ObjName_BoneRoot1 = "Bip001"
AnimalBase_Define.ObjName_BoneRoot2 = "boneRoot"
AnimalBase_Define.ObjName_HitCollider = "hitCollider"
AnimalBase_Define.ObjName_RouteCollider = "routeCollider"
AnimalBase_Define.ObjName_BodyCollider = "bodyCollider"
AnimalBase_Define.ObjName_LipSync = "lipsync"
AnimalBase_Define.ObjName_WallBox = "wall_box_"
AnimalBase_Define.AnimatorStateEmpty = "Null"
AnimalBase_Define.AnimatorStateState2 = "state2"
AnimalBase_Define.AnimatorStateRevert = "Revert.revert"
AnimalBase_Define.AnimatorStateGet = "Get"
AnimalBase_Define.AnimatorStateDialogue = "Dialogue.Idle"
AnimalBase_Define.AnimatorStateSpecial = "Movie.movie_"
AnimalBase_Define.AnimatorStateCrate = "OpenCrate"
AnimalBase_Define.AnimatorStateGate = "OpenGate"
AnimalBase_Define.AnimatorStateStairKick = "KickStair"
AnimalBase_Define.AnimatorStateCoverKick = "KickStair"
AnimalBase_Define.AnimatorStateSaveStart = "SaveStart"
AnimalBase_Define.AnimatorStateSaveLoop = "SaveLoop"
AnimalBase_Define.AnimatorStateSaveEnd = "SaveEnd"
AnimalBase_Define.AnimatorStateChangeStart = "ChangeStart"
AnimalBase_Define.AnimatorStateChangeEnd = "ChangeEnd"
AnimalBase_Define.AnimatorStateChangeRebornStart = "ChangeStart"
AnimalBase_Define.AnimatorStateChangeRebornEnd = "ChangeEnd"
AnimalBase_Define.AnimatorStateTransferStart = "ChangeStart"
AnimalBase_Define.AnimatorStateTransferEnd = "ChangeEnd"
AnimalBase_Define.AnimatorStateBorn = "Born"
AnimalBase_Define.AnimatorStateNightmareStart = "NightmareStart"
AnimalBase_Define.AnimatorStateNightmareEnd = "NightmareEnd"
AnimalBase_Define.AnimatorStateCallStart = "ChangeEnd"
AnimalBase_Define.AnimatorStateCallEnd = "ChangeStart"
AnimalBase_Define.AnimatorStateGroundMove = "OnGround.OnGroundMove"
AnimalBase_Define.AnimatorStateUpHillMove = "UpHill.UpHillMove"
AnimalBase_Define.AnimatorStateDownHillMove = "DownHill.DownHillMove"
AnimalBase_Define.AnimatorStateDrop = "Airborne.Drop"
AnimalBase_Define.AnimatorStateTouchGround = "Airborne.TouchGround"
AnimalBase_Define.AnimatorStateSpecialMove = "SpecialMove"
AnimalBase_Define.AnimatorStateDieLie = "Dead.dieLie"
AnimalBase_Define.AnimatorStateDieStandBack = "Dead.dieStandBack"
AnimalBase_Define.AnimatorStateDieStandFront = "Dead.dieStandFront"
AnimalBase_Define.AnimatorStateClimbStartDown = "OnStair.climbStartDown"
AnimalBase_Define.AnimatorStateClimbStartUp = "OnStair.climbStartUp"
AnimalBase_Define.AnimatorStateClimbEndDown = "OnStair.climbEndDown"
AnimalBase_Define.AnimatorStateClimbEndDown2 = "OnStair.climbEndDown2"
AnimalBase_Define.AnimatorStateClimbEndUp = "OnStair.climbEndUp"
AnimalBase_Define.AnimatorStateClimbEndUp2 = "OnStair.climbEndUp2"
AnimalBase_Define.AnimatorStateClimbLeftUp = "OnStair.climbLeftUp"
AnimalBase_Define.AnimatorStateClimbLeftUp2 = "OnStair.climbLeftUp2"
AnimalBase_Define.AnimatorStateClimbLeftDown = "OnStair.climbLeftDown"
AnimalBase_Define.AnimatorStateClimbLeftDownReady2 = "OnStair.climbLeftDownReady2"
AnimalBase_Define.AnimatorStateClimbLeftDownToIdle2 = "OnStair.climbLeftDownToIdle2"
AnimalBase_Define.AnimatorStateClimbLeftIdle = "OnStair.climbLeftIdle"
AnimalBase_Define.AnimatorStateClimbRightUp = "OnStair.climbRightUp"
AnimalBase_Define.AnimatorStateClimbRightUp2 = "OnStair.climbRightUp2"
AnimalBase_Define.AnimatorStateClimbRightDown = "OnStair.climbRightDown"
AnimalBase_Define.AnimatorStateClimbRightDownReady2 = "OnStair.climbRightDownReady2"
AnimalBase_Define.AnimatorStateClimbRightDownToIdle2 = "OnStair.climbRightDownToIdle2"
AnimalBase_Define.AnimatorStateClimbRightIdle = "OnStair.climbRightIdle"
AnimalBase_Define.AnimatorStateClimbDown2 = "OnStair.climbDown2"
AnimalBase_Define.AnimatorStateClimbRightDown2 = "OnStair.climbRightDown2"
AnimalBase_Define.AnimalColliderWeakMax = 3
AnimalBase_Define.StatusIdSanUnusual = 10027
AnimalBase_Define.StatusIdPoisonMud = 10029
AnimalBase_Define.StatusIdSlow = 10076
AnimalBase_Define.StatusIdBlind = 10077
AnimalBase_Define.StatusIdBeAttracted = 10105
AnimalBase_Define.StatusIdClearCrazy = 10106
AnimalBase_Define.SanMonsterHp = 500
AnimalBase_Define.SanMonsterPhysicDamage = 2000
AnimalBase_Define.SanMonsterWeakness = 5
AnimalBase_Define.SanMonsterWeaknessRecovery = 0.4
AnimalBase_Define.SanMonsterDropId = 99999
AnimalBase_Define.CallHeroHp = 2000
AnimalBase_Define.CallHeroPhysicDamage = 500
AnimalBase_Define.ParryWeaknessMin = 35
AnimalBase_Define.BlockFrameFreeze = 0.06
AnimalBase_Define.BlockFrameFreezeSpeed = 0
AnimalBase_Define.BlockFrameFadeOut = 0.06
AnimalBase_Define.BlockEnergyRateMax = 0.45
AnimalBase_Define.BlockGuardLevelHigh = 2.5
AnimalBase_Define.BlockGuardLevelLow = 1
AnimalBase_Define.Type = {
	HomeBase = 2,
	Hero = 0,
	Monster = 1,
	Other = 3
}
AnimalBase_Define.AimMode = {
	Aim = 1,
	AimEnd = 2,
	None = 0
}
AnimalBase_Define.MoveStateChangeLevel = {
	LowAndEqual = 1,
	High = 2,
	Low = 0,
	Force = 3
}
AnimalBase_Define.MoveStateType = {
	CarriageStart = 32,
	CoverKickHintEnd = 49,
	OpenCrate = 50,
	SaveLoop = 30,
	VirtualWallEnd = 55,
	ClimbRightUp2 = 10,
	ElevatorEnd = 45,
	GateHintStart = 52,
	ClimbEndDown = 21,
	SaveStart = 29,
	StatueStart = 66,
	Revert = 3,
	CageEnd = 59,
	HoneypotEnd = 71,
	ChangeRebornStart = 36,
	HoneypotStart = 70,
	ClimbStartDown = 5,
	ClimbRightUp = 9,
	ClimbLeftUp = 7,
	ElevatorStart = 44,
	FountainEnd = 69,
	ClimbLeftDown = 11,
	Skill = 25,
	TimeLineMove = 87,
	StatueEnd = 67,
	DoorHintStart = 42,
	BridgeEnd = 39,
	DoorStart = 40,
	ClimbLeftDownReady2 = 12,
	CrateStart = 72,
	EntranceEnd = 65,
	CrateEnd = 73,
	CageStart = 58,
	BonefireStart = 74,
	TimeLinePrev = 89,
	Drop = 80,
	ClimbEndDown2 = 22,
	Hit = 77,
	StairKick = 46,
	CallEnd = 93,
	OpenGate = 51,
	Special = 79,
	BonefireEnd = 76,
	Reborn = 83,
	ClimbRightDown = 15,
	ChangeRebornEnd = 37,
	ClimbStartUp = 6,
	TouchGround = 27,
	Born = 84,
	NightmareStart = 85,
	NightmareEnd = 86,
	ChangeStart = 34,
	CallStart = 92,
	TimeLine = 90,
	BonefireLoop = 75,
	Dialog = 78,
	ClimbStartReady = 4,
	ClimbLeftDownToIdle2 = 14,
	SkillRecovery = 26,
	BeaconEnd = 63,
	DoorEnd = 41,
	CarriageEnd = 33,
	Empty = 0,
	GateHintEnd = 53,
	ClimbEndUp = 23,
	VirtualWallHintEnd = 57,
	ClimbRightDownReady2 = 16,
	ClimbRightDownToIdle2 = 18,
	VirtualWallHintStart = 56,
	ClimbRightIdle = 20,
	TransferStart = 60,
	ClimbLeftIdle = 19,
	SaveEnd = 31,
	ClimbLeftDown2 = 13,
	DoorHintEnd = 43,
	CoverKickHintStart = 48,
	VirtualWallStart = 54,
	TransferEnd = 61,
	ClimbRightDown2 = 17,
	Get = 28,
	MoveForce = 2,
	FountainStart = 68,
	CoverKick = 47,
	BridgeStart = 38,
	ClimbEndUp2 = 24,
	ChangeEnd = 35,
	BeaconStart = 62,
	Dead = 82,
	ClimbLeftUp2 = 8,
	TimeLineMoveForce = 88,
	Fly = 81,
	StoryEnterMove = 91,
	EntranceStart = 64,
	Move = 1
}
AnimalBase_Define.StairTouch = {
	Down = 2,
	Up = 1,
	Empty = 0
}
AnimalBase_Define.StairTouchSpeedUpTime = 2
AnimalBase_Define.ClimbingMatchTime = 0.3
AnimalBase_Define.ClimbEndDownMatchTime = 0.7
AnimalBase_Define.ClimbEndDown2MatchTime = 0
AnimalBase_Define.ClimbEndUpMatchTime = 0.8
AnimalBase_Define.ClimbEndUp2MatchTime = 0.8
AnimalBase_Define.StairClimbSpeed = {
	Fast = 2,
	Normal = 1
}
AnimalBase_Define.InputComboType = {
	Combo = 2,
	Start = 1,
	Jump = 3
}
AnimalBase_Define.SpeedMode = {
	Normal = 2,
	Slow = 1,
	Fast = 3,
	Empty = 0
}
AnimalBase_Define.SkillBlockJump = {
	HitBackCombo = 2,
	HitCombo = 1
}
AnimalBase_Define.SkillTypeForAI = {
	OffenseFar = 1,
	Chase = 7,
	DefenceHit = 5,
	Other = 11,
	Heal = 6,
	Defence = 3,
	Pull = 9,
	DefenceLoop = 4,
	OffensePull = 10,
	PullFix = 8,
	OffenseClose = 2,
	None = 0
}
AnimalBase_Define.SkillType = {
	EatFast = 113,
	Eat = 112,
	Throw = 103,
	Drop = 111,
	Threat = 106,
	Alert = 109,
	Relax = 110,
	Born2 = 115,
	ThrowLow = 104,
	Execute = 108,
	Backstab = 107,
	DodgeJumpSpecial = 117,
	Born1 = 114,
	DodgeSpecial = 101,
	DodgeJump = 118,
	CounterAttack = 105,
	Born3 = 116,
	Dodge = 102
}
AnimalBase_Define.SkillNextType = {
	SkillLoop = 7,
	Skill = 1,
	SkillAndRecovery = 4,
	SkillBind = 2,
	SkillAndJump = 6,
	SkillLoopAndRecovery = 8,
	SkillAndExit = 5,
	SkillRecovery = 3,
	Exit = 0,
	SkillAndComboExit = 9
}
AnimalBase_Define.HitTypeCommonMax = 99
AnimalBase_Define.HitType = {
	Light = 1,
	Backstab2 = 24,
	Backstab = 23,
	LeftHandBreak = 12,
	PullFront = 21,
	StatusBreak = 19,
	StatusWeak = 16,
	BackFlyCrow = 47,
	BackFly = 7,
	Up = 4,
	Heavy = 2,
	StatusWeakLoop1 = 17,
	Super = 3,
	LightTackle = 34,
	Execute = 25,
	HeavyTackle = 35,
	PullFrontDizzy = 37,
	PullFrontFreeze = 39,
	LeftHand = 10,
	PullFrontTackle = 41,
	PullBackTackle = 42,
	LightDizzy = 26,
	SuperTackle = 36,
	HeavyDizzy = 27,
	Toward = 43,
	DefenceBreak = 44,
	FrontFlyFar = 8,
	RightHandBreak = 13,
	FrontFlyCrow = 46,
	StatusWeakLoop2 = 18,
	SuperFreeze = 32,
	None = 0,
	RightHand = 11,
	Tackle = 33,
	Bury = 45,
	LightFreeze = 30,
	PullBackFreeze = 40,
	BackFlyFar = 9,
	Dizzy = 22,
	PullBackDizzy = 38,
	BodyBreak = 48,
	FrontFly = 6,
	Down = 5,
	HeavyFreeze = 31,
	SuperDizzy = 28,
	RightHandWeak = 15,
	LeftHandWeak = 14,
	PullBack = 20,
	Freeze = 29
}
AnimalBase_Define.TriggerHit = {
	FollowAttack = 2,
	StandUp = 3,
	Start = 0,
	Drop = 1
}
AnimalBase_Define.DropType = {
	HeadDown = 2,
	HeadUp = 0,
	HeadBack = 3,
	HeadFoward = 1
}
AnimalBase_Define.DropHeightType = {
	Low = 0,
	High = 1
}
AnimalBase_Define.EffectRootType = {
	Head = 2,
	Point = 4,
	Root = 0,
	WeaponBox = 100,
	Chest = 1,
	Hips = 3
}
AnimalBase_Define.DeadType = {
	Drop = 4,
	Front = 2,
	Back = 1,
	Lie = 3,
	None = 0
}
AnimalBase_Define.DamageReason = {
	Drop = 1,
	Skill = 2,
	Trick = 3,
	None = 0
}
AnimalBase_Define.DeadReason = {
	MustDeath = 4,
	Skill = 3,
	Drop = 2,
	CallAnimal = 1,
	None = 0
}
AnimalBase_Define.BornReason = {
	FindTarget = 1,
	CallAnimal = 1,
	None = 0
}
AnimalBase_Define.LogicRule = {
	WalkOnly = 1,
	DodgeClose = 2,
	None = 0
}
AnimalBase_Define.SanType = {
	Unusual = 1,
	Special = 3,
	Crazy = 2,
	Normal = 0
}
AnimalBase_Define.SkillSanType = {
	NotNormal = 2,
	Normal = 1,
	None = 0
}
AnimalBase_Define.FixBoneType = {
	Chest = 2,
	Root = 1,
	None = 0
}
AnimalBase_Define.VisibleType = {
	Act = 1,
	Variety = 3,
	Grade = 2,
	Dialog = 6,
	Menu = 5,
	Camera = 4
}
AnimalBase_Define.RenderType = {
	Equipment = 4,
	Body = 1,
	BodyHair = 2,
	Weapon = 5,
	BodyParts = 3
}
AnimalBase_Define.CameraShakeTemplateHit4 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		-0.05,
		-0.2,
		0,
		0,
		0,
		0.65
	},
	{
		2,
		-0.03,
		0.2,
		0,
		0,
		0,
		-0.25
	},
	{
		5,
		-0.01,
		-0.15,
		0,
		0,
		0,
		0.57
	},
	{
		8,
		0.01,
		0.11,
		0,
		0,
		0,
		-0.14
	},
	{
		11,
		0.008,
		-0.12,
		0,
		0,
		0,
		0.5
	},
	{
		14,
		0.004,
		0.06,
		0,
		0,
		0,
		-0.07
	},
	{
		17,
		0.003,
		-0.11,
		0,
		0,
		0,
		0.4
	},
	{
		20,
		0,
		0.038,
		0,
		0,
		0,
		0
	},
	{
		23,
		0.001,
		-0.08,
		0,
		0,
		0,
		0.4
	},
	{
		26,
		0,
		0.03,
		0,
		0,
		0,
		0
	},
	{
		28,
		0,
		-0.03,
		0,
		0,
		0,
		0.3
	},
	{
		30,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateHit4 = {
	0.8,
	0.5,
	0,
	0.3,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateHit3 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		-0.03,
		-0.3,
		0,
		0,
		0,
		0
	},
	{
		2,
		0.02,
		0.15,
		0,
		0,
		0,
		0
	},
	{
		4,
		0.04,
		-0.1,
		-0,
		0,
		0,
		0
	},
	{
		6,
		0.01,
		0.1,
		0,
		0,
		0,
		0
	},
	{
		8,
		-0.01,
		-0.02,
		0,
		0,
		0,
		0
	},
	{
		10,
		0.02,
		0.02,
		0,
		0,
		0,
		0
	},
	{
		12,
		0.01,
		-0.01,
		0,
		0,
		0,
		0
	},
	{
		14,
		0,
		0.01,
		0,
		0,
		0,
		0
	},
	{
		16,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateHit3 = {
	0.6,
	0.3,
	0,
	0.1,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateHit2 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		-0.002,
		-0.05,
		0,
		0,
		0,
		0
	},
	{
		2,
		-0.005,
		0.035,
		0,
		0,
		0,
		0
	},
	{
		4,
		0.0025,
		-0.025,
		0,
		0,
		0,
		0
	},
	{
		5,
		0.005,
		0,
		0,
		0,
		0,
		0
	},
	{
		6,
		0.0025,
		0.005,
		0,
		0,
		0,
		0
	},
	{
		8,
		0,
		-0.005,
		0,
		0,
		0,
		0
	},
	{
		9,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateHit2 = {
	0.3,
	0.2,
	0,
	0.1,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateHit1 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		0,
		-0.05,
		0.006,
		0,
		0,
		0
	},
	{
		2,
		0,
		0.02,
		-0.004,
		0,
		0,
		0
	},
	{
		4,
		0,
		-0.02,
		0.004,
		0,
		0,
		0
	},
	{
		7,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateHit1 = {
	0.1,
	0.1,
	0,
	0.1,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateSkill5 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		90,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		94,
		0,
		-0.155,
		0,
		0,
		0,
		0.6
	},
	{
		98,
		0,
		0.1575,
		0,
		0,
		0,
		0.136
	},
	{
		104,
		0,
		-0.151,
		0,
		0,
		0,
		-0.715
	},
	{
		108,
		0,
		0.1518,
		0,
		0,
		0,
		-0.4
	},
	{
		112,
		0,
		-0.151,
		0,
		0,
		0,
		0.147
	},
	{
		116,
		0,
		0.147,
		0,
		0,
		0,
		0.5
	},
	{
		120,
		0,
		-0.147,
		0,
		0,
		0,
		0.0042
	},
	{
		125,
		0,
		0.1466,
		0,
		0,
		0,
		-0.688
	},
	{
		129,
		0,
		-0.146,
		0,
		0,
		0,
		-0.45
	},
	{
		133,
		0,
		0.14,
		0,
		0,
		0,
		-0.21
	},
	{
		138,
		0,
		-0.1,
		0,
		0,
		0,
		-0.616
	},
	{
		142,
		0,
		0.115,
		0,
		0,
		0,
		-0.9
	},
	{
		147,
		0,
		-0.05,
		0,
		0,
		0,
		-0.139
	},
	{
		151,
		0,
		0.1,
		0,
		0,
		0,
		0.406
	},
	{
		156,
		0,
		-0.07,
		0,
		0,
		0,
		-0.057
	},
	{
		161,
		0,
		0.087,
		0,
		0,
		0,
		-0.52
	},
	{
		168,
		0,
		-0.06,
		0,
		0,
		0,
		0.468
	},
	{
		170,
		0,
		-0.015,
		0,
		0,
		0,
		0.61
	},
	{
		174,
		0,
		0.06,
		0,
		0,
		0,
		0.395
	},
	{
		180,
		0,
		-0.03,
		0,
		0,
		0,
		0
	},
	{
		186,
		0,
		0.048,
		0,
		0,
		0,
		0
	},
	{
		191,
		0,
		-0.01,
		0,
		0,
		0,
		0
	},
	{
		197,
		0,
		0.04,
		0,
		0,
		0,
		0
	},
	{
		203,
		0,
		-0.01,
		0,
		0,
		0,
		0
	},
	{
		210,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateSkill5 = {
	1,
	4,
	1,
	2,
	0,
	3
}
AnimalBase_Define.CameraShakeTemplateSkill4 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		-0.05,
		-0.2,
		0,
		0,
		0,
		0.65
	},
	{
		2,
		-0.03,
		0.2,
		0,
		0,
		0,
		-0.25
	},
	{
		5,
		-0.01,
		-0.15,
		0,
		0,
		0,
		0.57
	},
	{
		8,
		0.01,
		0.11,
		0,
		0,
		0,
		-0.14
	},
	{
		11,
		0.008,
		-0.12,
		0,
		0,
		0,
		0.5
	},
	{
		14,
		0.004,
		0.06,
		0,
		0,
		0,
		-0.07
	},
	{
		17,
		0.003,
		-0.11,
		0,
		0,
		0,
		0.4
	},
	{
		20,
		0,
		0.038,
		0,
		0,
		0,
		0
	},
	{
		23,
		0.001,
		-0.08,
		0,
		0,
		0,
		0.4
	},
	{
		26,
		0,
		0.03,
		0,
		0,
		0,
		0
	},
	{
		28,
		0,
		-0.03,
		0,
		0,
		0,
		0.3
	},
	{
		30,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateSkill4 = {
	0.8,
	1,
	0,
	0.6,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateSkill3 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		-0.03,
		-0.3,
		0,
		0,
		0,
		0
	},
	{
		2,
		0.02,
		0.15,
		0,
		0,
		0,
		0
	},
	{
		4,
		0.04,
		-0.1,
		-0,
		0,
		0,
		0
	},
	{
		6,
		0.01,
		0.1,
		0,
		0,
		0,
		0
	},
	{
		8,
		-0.01,
		-0.02,
		0,
		0,
		0,
		0
	},
	{
		10,
		0.02,
		0.02,
		0,
		0,
		0,
		0
	},
	{
		12,
		0.01,
		-0.01,
		0,
		0,
		0,
		0
	},
	{
		14,
		0,
		0.01,
		0,
		0,
		0,
		0
	},
	{
		16,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateSkill3 = {
	0.6,
	0.5,
	0,
	0.3,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateSkill2 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		-0.002,
		-0.05,
		0,
		0,
		0,
		0
	},
	{
		2,
		-0.005,
		0.035,
		0,
		0,
		0,
		0
	},
	{
		4,
		0.0025,
		-0.025,
		0,
		0,
		0,
		0
	},
	{
		5,
		0.005,
		0,
		0,
		0,
		0,
		0
	},
	{
		6,
		0.0025,
		0.005,
		0,
		0,
		0,
		0
	},
	{
		8,
		0,
		-0.005,
		0,
		0,
		0,
		0
	},
	{
		9,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateSkill2 = {
	0.4,
	0.3,
	0,
	0.2,
	0,
	0
}
AnimalBase_Define.CameraShakeTemplateSkill1 = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		1,
		0,
		-0.05,
		0.006,
		0,
		0,
		0
	},
	{
		2,
		0,
		0.02,
		-0.004,
		0,
		0,
		0
	},
	{
		4,
		0,
		-0.02,
		0.004,
		0,
		0,
		0
	},
	{
		7,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
AnimalBase_Define.ControllerShakeTemplateSkill1 = {
	0.2,
	0.2,
	0,
	0.1,
	0,
	0
}
AnimalBase_Define.MoveType = {
	Move = 1,
	SpecialDontMove = 3,
	SpecialMove = 2,
	DontMove = 0
}
AnimalBase_Define.TurnType = {
	Fast = 1,
	Slow = 0
}
AnimalBase_Define.SkillHand = {
	LeftAndRight = 3,
	Right = 2,
	Left = 1,
	None = 0
}
AnimalBase_Define.SkillHandBody = 19
AnimalBase_Define.DamageType = {
	Period = 2,
	Instant = 1,
	None = 0
}
AnimalBase_Define.SlopeType = {
	DownHill = 2,
	UpHill = 1,
	Normal = 0
}
AnimalBase_Define.AttackBoxType = {
	Hand = 2,
	Skill = 1,
	None = 0
}
AnimalBase_Define.ParamType = {}
AnimalBase_Define.ParamTypeTemple = {
	SkillSpeed = "skillSpeed",
	Vertical = "vertical",
	SkillOffset = "skillOffset",
	LeftFoot = "leftFoot",
	CamLock = "camLock",
	SlopeForwardAngle = "slopeForwardAngle",
	SkillBlend = "skillBlend",
	SkillMuteki2 = "skillMuteki2",
	HorizontalHit = "horizontalHit",
	SkillToughness = "skillToughness",
	Turn = "turn",
	SlopeAngle = "slopeAngle",
	Roll = "roll",
	SkillDefence = "skillDefence",
	RightFoot = "rightFoot",
	SkillParry = "skillParry",
	VerticalSkill = "verticalSkill",
	IsLeft = "isLeft",
	JumpY = "jumpY",
	Vfx = "vfx",
	Ground = "ground",
	Fall = "fall",
	DefenceHitHand = "defenceHitHand",
	DeadExit = "deadExit",
	SkillComboEnd = "skillComboEnd",
	Battle = "battle",
	VerticalSpecial = "verticalSpecial",
	SkillDir = "skillDir",
	VerticalHit = "verticalHit",
	SkillCounterAttack = "skillCounterAttack",
	MoveSpeed = "MoveSpeed",
	Drop = "drop",
	SkillRot = "skillRot",
	SkillExit = "skillExit",
	SkillComboStart = "skillComboStart",
	SkillMuteki = "skillMuteki",
	SkillShake = "skillShake",
	HorizontalSpecial = "horizontalSpecial",
	Pose = "pose",
	SkillBeatBack = "skillBeatBack",
	SkillHand = "skillHand",
	Trigger = "trigger",
	HitMoveRate = "hitMoveRate",
	Jump = "jump",
	RunExit = "runExit",
	HorizontalSkill = "horizontalSkill"
}
AnimalBase_Define.SkillRotTypeAI = {
	Normal = 2,
	Chase = 1,
	TurnBack = 3,
	Stay = 0
}
AnimalBase_Define.MonsterType = {
	CallMonster = 2,
	CallHero = 3,
	CrateMonster = 4,
	SanMonster = 1,
	Normal = 0
}
AnimalBase_Define.HitHandType = {
	NoDamage = 1,
	Fail = 2,
	Success = 0
}

return AnimalBase_Define
