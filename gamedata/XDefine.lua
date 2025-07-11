﻿-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/XDefine.lua

ProtocalType = {
	SPROTO = 3,
	PB_LUA = 1,
	BINARY = 0,
	PBC = 2
}
TestProtoType = ProtocalType.BINARY
Util = LuaFramework.Util
AppConst = LuaFramework.AppConst
LuaHelper = LuaFramework.LuaHelper
ByteBuffer = LuaFramework.ByteBuffer
UILuaBehaviour = LuaFramework.UILuaBehaviour
resMgr = LuaHelper.GetResManager()
panelMgr = LuaHelper.GetPanelManager()
soundMgr = LuaHelper.GetSoundManager()
networkMgr = LuaHelper.GetNetManager()
networkMgrBattleUdp = LuaHelper.GetNetManagerBattleUdp()
networkMgrBattleTcp = LuaHelper.GetNetManagerBattleTcp()
networkMgrHttp = LuaHelper.GetNetManagerHttp()
loadMgr = LuaHelper.GetLoadManager()
luaLateMgr = LuaHelper.GetLuaLateManager()
inputMgr = require("LuaScript/Controller/ControllerInputManager")
gameMgr = LuaHelper.GetGameManager()
WWW = UnityEngine.WWW
GameObject = UnityEngine.GameObject
EventTriggerType = UnityEngine.EventSystems.EventTriggerType
RectTransformUtility = UnityEngine.RectTransformUtility
GameVersion = 3
Platform = AppConst.PlatformDir
PlatformType = {
	PC = "pc",
	PS4 = "ps4",
	NS = "ns",
	TVOS = "tvos",
	ANDROID = "android",
	MAC = "mac",
	XBOXONE = "xboxone",
	IOS = "ios"
}
AppVer = AppConst.AppVer
AppDevVer = AppConst.DevVer
AppDemoE3 = AppConst.DemoE3
AppDemoInner = AppConst.DemoInner
AppDemoCJReview = AppConst.DemoCJReview
AppDemoCJ = AppConst.DemoCJ
AppDemoCJMedia = AppConst.DemoCJMedia
AppDemoAppStore = AppConst.DemoAppStore
AppDemoAlphaUs = AppConst.DemoAlphaUs
AppDemoAlphaZhs = AppConst.DemoAlphaZhs
AppDemoGCores = AppConst.DemoGCores
AppDemoPax1903 = AppConst.DemoPax1903
AppDemoE3_1906 = AppConst.DemoE3_1906
AppAppleDemo = AppConst.AppleDemo
AppAppleShow = AppConst.AppleShow
AppAppleLight = AppConst.AppleLight
AppComReview = AppConst.ComReview
AppTapTapEA = AppConst.TapTapEA
AppCJ2020 = AppConst.CJ2020
AppMaster = AppConst.Master
LayerDefault = LayerMask.NameToLayer("Default")
LayerWater = LayerMask.NameToLayer("Water")
LayerUI = LayerMask.NameToLayer("UI")
LayerGround = LayerMask.NameToLayer("Ground")
LayerWallOpaque = LayerMask.NameToLayer("WallOpaque")
LayerWallTransparent = LayerMask.NameToLayer("WallTransparent")
LayerWallMonster = LayerMask.NameToLayer("WallMonster")
LayerWallInvisible = LayerMask.NameToLayer("WallInvisible")
LayerItem1 = LayerMask.NameToLayer("Item1")
LayerItem2 = LayerMask.NameToLayer("Item2")
LayerItem3 = LayerMask.NameToLayer("Item3")
LayerEffect1 = LayerMask.NameToLayer("Effect1")
LayerEffect2 = LayerMask.NameToLayer("Effect2")
LayerEffectLight = LayerMask.NameToLayer("EffectLight")
LayerEffectMovie = LayerMask.NameToLayer("EffectMovie")
LayerHost = LayerMask.NameToLayer("Host")
LayerAnimal = LayerMask.NameToLayer("Animal")
LayerAnimalBone = LayerMask.NameToLayer("AnimalBone")
LayerAnimalBody = LayerMask.NameToLayer("AnimalBody")
LayerAnimalBodyBone = LayerMask.NameToLayer("AnimalBodyBone")
LayerAnimalSkill = LayerMask.NameToLayer("AnimalSkill")
LayerAnimalDeath = LayerMask.NameToLayer("AnimalDeath")
LayerMovie = LayerMask.NameToLayer("Movie")
LayerShell = LayerMask.NameToLayer("Shell")
LayerDefaultNoShadow = LayerMask.NameToLayer("DefaultNoShadow")
LayerUINotRender = LayerMask.NameToLayer("UINotRender")
DLC_Maze = true
DebugShowSkin = true
DebugOpenFeedback = true
DebugEnterMaze = true
DebugEnterTide = true
DLC_Elena = true
DebugEnterArcade = true
DebugShow = false
DebugLog = false
DebugBehaviorLog = false
DebugValueLog = false
DebugTestButton = false
DebugLocatorBorn = false
DebugLocatorId = 4
DebugPropertyMax = false
DebugHostPropertyMax = false
DebugSkipMovie = false
DebugNoVoice = false
DebugLogVoiceId = false
DebugUseSceneBuild = false
DebugUseFastShadow = false
DebugAIOff = false
DebugAIControl = false
DebugDontDeadSelf = false
DebugDontDeadMonster = false
DebugDontUseTweenFrame = false
DebugDontUseFreezeFrame = false
DebugDontUseCameraShake = false
DebugMonsterAI = false
DebugMonsterAISkill = false
DebugMonsterAISkillId = 0
DebugShowAllMonster = false
DebugTestSkillBeatBack = false
DebugTestSkillCounterAttack = false
DebugDontDamageSelf = false
DebugDamageUpSelf = false
DebugWeaknessUpSelf = false
DebugEnergySubLessSelf = false
DebugHitCritSelf = false
DebugHitBone = false
DebugItemTest = false
DebugSanUp = false
DebugDontUseSan = false
DebugFly = false
DebugAutoRun = false
DebugTalentOpenAll = false
DebugSkillAnimatorSpeed = false
DebugIgnoreCompleteQuestCondition = false
DebugCanChallengeAllMonster = false
DebugDontShowEffect = false
DebugDontShowDebugButton = false
DebugShowAttackBox = false
DebugShowBulletRoute = false
DebugShowHostHeader = false
DebugShowUnitInfo = false
DebugShowCtrlPanel = false
DebugExecuteBackstabDistance = false
DebugCreateSavePoint = false
DebugOpenAntiAddiction = false
DebugAlwaysShowRoadSign = false
DebugMazeRandom = false
DebugMazeId = 1
DebugMazeEntrance = 1
DebugMazePattern = 1
DebugMazeBossUp = false
DebugMazeStatue = false
DebugMazeStatueType = 0
DebugMazeStatueIndex1 = 0
DebugMazeStatueIndex2 = 0
DebugMazeFountain = false
DebugMazeHoneypot = false
DebugMazeCallHeroIndex = 0
DebugMazeCallHeroType = 0
DebugMazeCrate = false
DebugMazeCrateType = 0
DebugMazeBossSelect = false
DebugMazeBossIndex = 0
DebugMazeReturnDirect = false
DebugDLCSceneAll = false
DebugAdjustCameraLock = false
DebugTestDeadAnimation = false
DebugParam1 = 0
DebugParam2 = 0
DebugParam3 = 0
DebugParam4 = 0
DebugParam5 = 0
DebugParam6 = 0
DebugParam7 = 0
DebugParam8 = 0
DebugParam9 = 0
DebugParam10 = 0
DebugParam11 = 0
DebugParam12 = 0
DebugPropertyTest = false
DebugProperty1 = 1
DebugProperty2 = 1
DebugProperty3 = 1
DebugProperty4 = 1
DebugProperty5 = 1
DebugProperty6 = 1
DebugUnnamedPlayTime = 0
DebugSeeTruth = false
DebugScreenshot = false
DebugRenderInIdle = false
DebugTestMemory = false
DebugSelectDifficulty = false
DebugLoadPrefab = false
DebugShowFullMap = false
DebugArcadeUnlockExpert = false
DebugArcadeUnlockLevels = false
DebugAllHeroesInArcade = false
DebugConsole = false
ReqLogin = false
RiverCrab = {}
RiverCrab.Alive = false
RiverCrab.CutScene = false
RiverCrab.VisualFx = false
RiverCrab.Subtitle = false
DebugVideoCaptureMode = false
DeviceNX = false
