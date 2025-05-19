-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_Scene.lua

local lpeg = require("lpeg")
local print_r = require("3rd/sproto/print_r")

require("GameData/ClientVersion")
require("GameData/XDefine")
require("LuaScript/Common/SystemHelper")
require("LuaScript/Common/MathHelper")
require("LuaScript/Common/TimeHelper")
require("LuaScript/Common/StringHelper")
require("bit")
require("Logic/CtrlManager")
require("LuaScript/XFunctions")

Event = require("events")
class = require("LuaScript/Lib/middleclass")
json = require("LuaScript/Lib/dkjson")

require("LuaScript/Lib/Tween/Easing")
require("LuaScript/Lib/Tween/TweenPath")
require("LuaScript/Lib/Tween/Tween")
require("LuaScript/Lib/Tween/TweenManager")
require("LuaScript/UI/Core/XButton")
require("LuaScript/UI/Core/XText")
require("LuaScript/UI/Core/XGroup")
require("LuaScript/UI/Core/XRawImage")
require("LuaScript/UI/Core/XImage")
require("LuaScript/UI/Core/XScrollRect")
require("LuaScript/UI/Core/XLoader")
require("LuaScript/UI/Core/XComponent")
require("LuaScript/UI/Core/XObjectPool")
require("LuaScript/UI/UIManager")
require("LuaScript/UI/UILayerCtrl")

UICtrlBase = require("LuaScript/UI/Controller/UICtrlBase")

require("LuaScript/Logic/Vfx/Vfx")
require("LuaScript/Logic/Vfx/VfxManager")
require("LuaScript/Logic/Story/DialogueManager")
require("LuaScript/Logic/Audio/AudioCtrl")
require("LuaScript/Logic/Battle/BattleData")
require("LuaScript/Lib/behaviourtree")
require("LuaScript/Lib/func")
require("LuaScript/Common/XCube")
require("LuaScript/Common/GameAI")
require("LuaScript/Common/GameCollider")
require("LuaScript/Common/VirtualGroup")
require("LuaScript/Common/DebugSynTools")
require("LuaScript/Common/DebugTestTools")
require("LuaScript/Common/LoadProgress")
require("LuaScript/Common/SensitiveMsgParser")
require("LuaScript/XGame")
require("LuaScript/XNetwork")
require("LuaScript/XNetworkBattleTcp")
require("LuaScript/XNetworkBattleUdp")
require("LuaScript/StructData/FS_UserData")
require("LuaScript/StructData/LS_Account")
require("LuaScript/StructData/LS_Setting")
require("LuaScript/StructData/LS_Game")
require("LuaScript/StructData/LS_Autosave")
require("LuaScript/StructData/LS_BehaviorLog")
require("LuaScript/StructData/LS_PlayerBehavior")
require("LuaScript/StructData/LS_Achievement")
require("LuaScript/StructData/LS_Challenge")
require("LuaScript/StructData/LS_Arcade")
require("LuaScript/StructData/LS_Feedback")
require("LuaScript/State/ST_Launch")
require("LuaScript/State/ST_Start")
require("LuaScript/State/ST_Main")
require("LuaScript/State/ST_MainReload")
require("LuaScript/State/ST_Lobby")
require("LuaScript/State/ST_LobbyReload")
require("LuaScript/StructData/MS_SceneEffect")
require("LuaScript/StructData/MS_SceneData")
require("LuaScript/StructData/MS_HeroData")
require("LuaScript/StructData/MS_HeroPropertyData")
require("LuaScript/StructData/MS_HeroAttributeData")
require("LuaScript/StructData/MS_EnemyAttributeData")
require("LuaScript/StructData/MS_HeroExtData")
require("LuaScript/StructData/MS_SkillData")
require("LuaScript/StructData/MS_SkillChainData")
require("LuaScript/StructData/MS_SkillIconData")
require("LuaScript/StructData/MS_StatusData")
require("LuaScript/StructData/MS_ShellData")
require("LuaScript/StructData/MS_TrapData")
require("LuaScript/StructData/MS_TrickData")
require("LuaScript/StructData/MS_AnimalAnimator")
require("LuaScript/StructData/MS_AnimalDirection")
require("LuaScript/StructData/MS_GuardModeSpawn")
require("LuaScript/StructData/MS_BufferData")
require("LuaScript/StructData/MS_ItemData")
require("LuaScript/StructData/MS_StoryMaze")
require("LuaScript/StructData/MS_StoryMazeCrate")
require("LuaScript/StructData/MS_StoryMazeDrop")
require("LuaScript/StructData/MS_StoryMazeStatue")
require("LuaScript/StructData/MS_StoryList")
require("LuaScript/StructData/MS_StoryQuest")
require("LuaScript/StructData/MS_StoryMonster")
require("LuaScript/StructData/MS_StoryMonsterProperty")
require("LuaScript/StructData/MS_StoryMazeMonster")
require("LuaScript/StructData/MS_StoryMazeMonsterProperty")
require("LuaScript/StructData/MS_StoryItem")
require("LuaScript/StructData/MS_StoryItemDrop")
require("LuaScript/StructData/MS_StoryDialog")
require("LuaScript/StructData/MS_StorySituationDialog")
require("LuaScript/StructData/MS_StoryMovie")
require("LuaScript/StructData/MS_StorySubtitle")
require("LuaScript/StructData/MS_StoryTimeLineSubtitle")
require("LuaScript/StructData/MS_StoryWall")
require("LuaScript/StructData/MS_StorySave")
require("LuaScript/StructData/MS_StoryDoor")
require("LuaScript/StructData/MS_StoryDoorHint")
require("LuaScript/StructData/MS_StoryGate")
require("LuaScript/StructData/MS_StoryGateHint")
require("LuaScript/StructData/MS_StoryVirtualWall")
require("LuaScript/StructData/MS_StoryVirtualWallHint")
require("LuaScript/StructData/MS_StoryBridge")
require("LuaScript/StructData/MS_StoryCrate")
require("LuaScript/StructData/MS_StoryElevator")
require("LuaScript/StructData/MS_StoryCarriage")
require("LuaScript/StructData/MS_StoryStair")
require("LuaScript/StructData/MS_StoryStairKick")
require("LuaScript/StructData/MS_StoryCoverKick")
require("LuaScript/StructData/MS_StoryCoverKickHint")
require("LuaScript/StructData/MS_StoryMazeBonefire")
require("LuaScript/StructData/MS_StoryTimeLine")
require("LuaScript/StructData/MS_StoryEffect")
require("LuaScript/StructData/MS_StoryTutorial")
require("LuaScript/StructData/MS_StoryArea")
require("LuaScript/StructData/MS_UISkillInfo")
require("LuaScript/StructData/MS_UIHeroInfo")
require("LuaScript/StructData/MS_HeroTalentCondition")
require("LuaScript/StructData/MS_HeroTalent")
require("LuaScript/StructData/MS_HeroExp")
require("LuaScript/StructData/MS_FormulaData")
require("LuaScript/StructData/MS_SiteInfo")
require("LuaScript/StructData/MS_TrophyProperty")
require("LuaScript/StructData/MS_TransactionData")
require("LuaScript/StructData/MS_StoryGuide")
require("LuaScript/StructData/MS_UIMenu")
require("LuaScript/StructData/MS_UIQuest")
require("LuaScript/StructData/MS_StoryFrog")
require("LuaScript/StructData/MS_Achievement")
require("LuaScript/StructData/MS_StoryGuideSort")
require("LuaScript/StructData/MS_StoryTips")
require("LuaScript/StructData/MS_StorySkin")
require("LuaScript/StructData/MS_StoryPatch")
require("LuaScript/StructData/MS_TrophyRandomProperty")
require("LuaScript/StructData/MS_StoryChallenge")
require("LuaScript/StructData/MS_StoryChallengeHero")
require("LuaScript/StructData/MS_ArcadeHero")
require("LuaScript/StructData/MS_StoryChallengeMonsterProperty")
require("LuaScript/StructData/MS_ArcadeMonsterProperty")

ST_Scene = {}

local this = ST_Scene
local scene = ""
local sceneNext = ""
local step, stepNext, stepDelay
local gameTimestamp = 0
local gameElapsedTime = 0
local appTime = 0
local appRecordTime = 0
local appOnSuspend = false
local inAntiAddictionTime = false
local ChildrenPlayTime = 5400

ST_Scene.StepType = {
	Loaded = 2,
	WaitDelay = 3,
	Loading = 1,
	Normal = 0
}
ST_Scene.SceneType = {
	Lobby = "Lobby",
	LobbyReload = "LobbyReload",
	TestScene = "TestScene",
	Launch = "Launch",
	MainReload = "MainReload",
	Main = "Main",
	Start = "Start",
	Empty = ""
}

function ST_Scene.Init()
	ST_Scene.InitData()
	FmodManager.Init()
	LS_Account.Load()
	LS_Setting.Load(LS_Account.userId)
	FS_UserData.Init()
	LS_Achievement.Load(LS_Account.userId)
	LS_Challenge.Load(LS_Account.userId)
	LS_Arcade.Load(LS_Account.userId)
	LS_Feedback.Load(LS_Account.userId)

	if Platform == PlatformType.IOS or Platform == PlatformType.TVOS then
		LS_Setting.IsKeyboardConnected()
		LS_Setting.IsMouseConnected()
	end

	luaLateMgr:SetLateLateUpdate(ST_Scene.LateLateUpdate)
	ST_Scene.StartScene()
	ST_Scene.ChangeStep(ST_Scene.StepType.Normal, 0)
	SceneFacade.SetOnChangeScreenForLua(ST_Scene.OnChangeScreen)
end

function ST_Scene.OnChangeScreen(width, height)
	SystemHelper.SetSreenWidthAndHeight(width, height)

	if step == ST_Scene.StepType.Normal then
		if scene == ST_Scene.SceneType.Launch then
			ST_Launch.OnChangeScreen(width, height)
		elseif scene == ST_Scene.SceneType.Start then
			ST_Start.OnChangeScreen(width, height)
		elseif scene == ST_Scene.SceneType.Lobby then
			ST_Lobby.OnChangeScreen(width, height)
			LS_Setting.UpdateTouchUi()
			UIManager.SendMessage("Mainmenu", "ScheduleUiAutoAdaption")
			UIManager.SendMessage("Setting", "ScheduleUiAutoAdaption")
			UIManager.SendMessage("Setting", "ResizeGuideList")
		elseif scene == ST_Scene.SceneType.Main then
			ST_Main.OnChangeScreen(width, height)
			LS_Setting.UpdateTouchUi()
			UIManager.SendMessage("Mainmenu", "ScheduleUiAutoAdaption")
			UIManager.SendMessage("Setting", "ScheduleUiAutoAdaption")
			UIManager.SendMessage("Setting", "ResizeGuideList")
		end
	end

	UIManager.SimpleAdapt()
end

function ST_Scene.Exit()
	FmodManager.Exit()
end

function ST_Scene.Update()
	if step == ST_Scene.StepType.Normal then
		if scene == ST_Scene.SceneType.Launch then
			ST_Launch.Update()
		elseif scene == ST_Scene.SceneType.Start then
			ST_Start.Update()
		elseif scene == ST_Scene.SceneType.Lobby then
			ST_Lobby.Update()
		elseif scene == ST_Scene.SceneType.Main then
			ST_Main.Update()
		end
	elseif step == ST_Scene.StepType.Loading then
		local isFinish = loadMgr:IsFinish()

		if isFinish == false then
			local index = loadMgr:GetCurrentLoadIndex()
			local progress = loadMgr:GetCurrentProgress()
		end
	elseif step == ST_Scene.StepType.Loaded then
		scene = sceneNext

		if scene == ST_Scene.SceneType.Start then
			FmodManager.EnterScene()
			ST_Start.Enter()
			this.ChangeStep(ST_Scene.StepType.Normal, 0)
		elseif scene == ST_Scene.SceneType.Lobby then
			FmodManager.EnterScene()
			ST_Lobby.Enter()
			this.ChangeStep(ST_Scene.StepType.Normal, 0)
		elseif scene == ST_Scene.SceneType.LobbyReload then
			Common.ClearMemory()
			ST_Scene.ChangeScene(ST_Scene.SceneType.Lobby)
		elseif scene == ST_Scene.SceneType.Main then
			FmodManager.EnterScene()
			ST_Main.Enter()
			this.ChangeStep(ST_Scene.StepType.Normal, 0)
			this.StopwatchReset()
			this.StopwatchStart()
		elseif scene == ST_Scene.SceneType.MainReload then
			Common.ClearMemory()
			BattleData.InitBattleMode()
			BattleData.InitBattleData()
			ST_Scene.ChangeScene(ST_Scene.SceneType.Main)
		end
	elseif step == ST_Scene.StepType.WaitDelay then
		-- block empty
	end

	this.UpdateStep()

	if DebugOpenAntiAddiction then
		ST_Scene.UpdateAntiAddiction()
	end
end

function ST_Scene.LateUpdate()
	if step == ST_Scene.StepType.Normal then
		if scene == ST_Scene.SceneType.Launch then
			ST_Launch.LateUpdate()
		elseif scene == ST_Scene.SceneType.Start then
			ST_Start.LateUpdate()
		elseif scene == ST_Scene.SceneType.Lobby then
			ST_Lobby.LateUpdate()
		elseif scene == ST_Scene.SceneType.LobbyReload then
			ST_LobbyReload.LateUpdate()
		elseif scene == ST_Scene.SceneType.Main then
			ST_Main.LateUpdate()
		elseif scene == ST_Scene.SceneType.MainReload then
			ST_MainReload.LateUpdate()
		end
	end
end

function ST_Scene.LateLateUpdate()
	if step == ST_Scene.StepType.Normal and scene == ST_Scene.SceneType.Main then
		ST_Main.LateLateUpdate()
	end

	UIManager.Update()
	TweenManager.Update()
	inputMgr:ClearButtonInfo()
end

function ST_Scene:OnResume()
	ST_Scene.StopwatchStart()

	appOnSuspend = false
	appTime = TimeHelper.getNowTimeNoScale()

	Common.ClearMemory()
end

function ST_Scene:OnSuspend()
	if step == ST_Scene.StepType.Normal and scene == ST_Scene.SceneType.Main then
		ST_Main.OnSuspend()
		ST_Scene.StopwatchTickOff()
	end

	appOnSuspend = true
end

function ST_Scene.ChangeStep(st_step, st_delay)
	stepDelay = st_delay

	if stepDelay > 0 then
		stepNext = st_step
		step = ST_Scene.StepType.WaitDelay
	else
		step = st_step
	end
end

function ST_Scene.UpdateStep()
	if stepDelay > 0 then
		stepDelay = stepDelay - 1

		if stepDelay <= 0 and step == ST_Scene.StepType.WaitDelay then
			stepDelay = 0
			step = stepNext
		end
	end
end

function ST_Scene.InitData()
	MS_SkillData.Init()
	MS_SkillChainData.Init()
	MS_HeroData.Init()
	MS_HeroPropertyData.Init()
	MS_HeroAttributeData.Init()
	MS_EnemyAttributeData.Init()
	MS_HeroExtData.Init()
	MS_StatusData.Init()
	MS_ShellData.Init()
	MS_TrapData.Init()
	MS_TrickData.Init()
	MS_SkillIconData.Init()
	MS_AnimalAnimator.Init()
	MS_AnimalDirection.Init()
	MS_GuardModeSpawn.Init()
	MS_BufferData.Init()
	MS_ItemData.Init()
	MS_StoryMaze.Init()
	MS_StoryMazeCrate.Init()
	MS_StoryMazeDrop.Init()
	MS_StoryMazeStatue.Init()
	MS_StoryList.Init()
	MS_StoryQuest.Init()
	MS_StoryMonster.Init()
	MS_StoryMonsterProperty.Init()
	MS_StoryMazeMonster.Init()
	MS_StoryMazeMonsterProperty.Init()
	MS_StoryItem.Init()
	MS_StoryItemDrop.Init()
	MS_StoryDialog.Init()
	MS_StorySituationDialog.Init()
	MS_StoryMovie.Init()
	MS_StorySubtitle.Init()
	MS_StoryTimeLineSubtitle.Init()
	MS_StoryWall.Init()
	MS_StorySave.Init()
	MS_StoryDoor.Init()
	MS_StoryDoorHint.Init()
	MS_StoryGate.Init()
	MS_StoryGateHint.Init()
	MS_StoryVirtualWall.Init()
	MS_StoryVirtualWallHint.Init()
	MS_StoryBridge.Init()
	MS_StoryCrate.Init()
	MS_StoryElevator.Init()
	MS_StoryCarriage.Init()
	MS_StoryStair.Init()
	MS_StoryStairKick.Init()
	MS_StoryCoverKick.Init()
	MS_StoryCoverKickHint.Init()
	MS_StoryMazeBonefire.Init()
	MS_StoryArea.Init()
	MS_StoryTimeLine.Init()
	MS_StoryEffect.Init()
	MS_StoryTutorial.Init()
	MS_UIHeroInfo.Init()
	MS_UISkillInfo.Init()
	MS_HeroTalent.Init()
	MS_HeroExp.Init()
	MS_FormulaData.Init()
	MS_SiteInfo.Init()
	MS_TrophyProperty.Init()
	MS_TransactionData.Init()
	MS_StoryGuide.Init()
	MS_UIMenu.Init()
	MS_UIQuest.Init()
	MS_StoryFrog.Init()
	MS_Achievement.Init()
	MS_StoryGuideSort.Init()
	MS_StoryTips.Init()
	MS_StorySkin.Init()
	MS_StoryPatch.Init()
	MS_SceneEffect.Init()
	MS_SceneData.Init()
	MS_TrophyRandomProperty.Init()
	MS_StoryChallenge.Init()
	MS_StoryChallengeHero.Init()
	MS_ArcadeHero.Init()
	MS_StoryChallengeMonsterProperty.Init()
	MS_ArcadeMonsterProperty.Init()
end

function ST_Scene.StartScene()
	scene = ST_Scene.SceneType.Launch

	ST_Launch.Enter()
	this.ChangeStep(ST_Scene.StepType.Normal, 0)
end

function ST_Scene.GetNextScene()
	return sceneNext
end

function ST_Scene.ChangeScene(st_type)
	if scene == st_type then
		return
	end

	SystemHelper.LogTest("=========ChangeScene=======scene=" .. scene .. "=st_type=" .. st_type)

	sceneNext = st_type

	FmodManager.ExitScene()
	UIManager.SendMessage("Loading", "SetActive", true)

	if AppVer == AppAppleLight or AppVer == AppTapTapCloudDemo then
		UIManager.SendMessage("Loading", "SetLoadingText", true, GameText.UI_DEMO_ANNOUNCEMENT)
	end

	if scene == ST_Scene.SceneType.Launch then
		ST_Launch.Exit()
	elseif scene == ST_Scene.SceneType.Start then
		ST_Start.Exit()
	elseif scene == ST_Scene.SceneType.Lobby then
		ST_Lobby.Exit()
	elseif scene == ST_Scene.SceneType.LobbyReload then
		ST_LobbyReload.Exit()
	elseif scene == ST_Scene.SceneType.Main then
		ST_Main.Exit()
	elseif scene == ST_Scene.SceneType.MainReload then
		ST_MainReload.Exit()
	end

	loadMgr:ReadyLoad()
	ST_Scene.ChangeStep(ST_Scene.StepType.Loading, 0)

	if DebugUseSceneBuild == false then
		local tmpPackage = ""

		tmpPackage = "Scene/" .. sceneNext

		loadMgr:LoadLevelFromAssetBundle(tmpPackage, sceneNext, true, this.ChangeSceneFinish)
	else
		loadMgr:LoadLevel(sceneNext, true, this.ChangeSceneFinish)
	end
end

function ST_Scene.ChangeSceneFinish()
	loadMgr:EndLoad()
	this.ChangeStep(ST_Scene.StepType.Loaded, 0)
end

function ST_Scene.StopwatchReset()
	gameTimestamp = 0
	gameElapsedTime = 0
end

function ST_Scene.StopwatchStart()
	gameTimestamp = TimeHelper.getNowTimeNoScale()
end

function ST_Scene.StopwatchTickOff()
	local tickOffTimestamp = TimeHelper.getNowTimeNoScale()

	gameElapsedTime = tickOffTimestamp - gameTimestamp
	gameTimestamp = tickOffTimestamp

	if gameElapsedTime < 0 then
		gameElapsedTime = 0
	end

	SystemHelper.Log("[ ** StopwatchTickOff: " .. gameElapsedTime .. " ]")

	return gameElapsedTime
end

function ST_Scene.GetRecordedElapsedTime()
	return gameElapsedTime
end

function ST_Scene.GetCurrentElapsedTime()
	local tickOffTimestamp = TimeHelper.getNowTimeNoScale()
	local elapsedTime = tickOffTimestamp - gameTimestamp

	if elapsedTime < 0 then
		elapsedTime = 0
	end

	return elapsedTime
end

function ST_Scene.GetIsInAntiAddictionTime()
	if LS_Account.GetAge() == 16 then
		return false
	elseif SdkHelper.playTime == true then
		if LS_Account.GetAge() > 0 then
			return false
		else
			return true
		end
	else
		return true
	end
end

function ST_Scene.UpdateAntiAddiction()
	if appOnSuspend then
		return
	end

	inAntiAddictionTime = false

	local retTime = LS_Setting.GetTodayPlayTime(TimeHelper.getNowTimeNoScale() - appTime)

	appRecordTime = appRecordTime + TimeHelper.getNowTimeNoScale() - appTime
	appTime = TimeHelper.getNowTimeNoScale()

	if appRecordTime > 600 then
		LS_Setting.Update()

		appRecordTime = 0
	end

	if LS_Account.GetAge() == 0 then
		if retTime > DebugUnnamedPlayTime then
			inAntiAddictionTime = true
		end
	elseif LS_Account.GetAge() < 16 then
		local now = tonumber(string.sub(os.date("%X"), 1, 2))

		if now > 21 or now < 8 or retTime > ChildrenPlayTime then
			inAntiAddictionTime = true
		end
	end
end
