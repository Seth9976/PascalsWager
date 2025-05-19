-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerMain.lua

require("LuaScript/Controller/ControllerBase")
require("LuaScript/Logic/Scene/SceneMain")
require("LuaScript/Logic/Camera/CameraMain")
require("LuaScript/StructData/FS_Battle_Frame")
require("LuaScript/Network/NI_BattleBattle")
require("LuaScript/Network/NI_BattleResult")
require("LuaScript/Logic/Battle/LoadCharacterManager")
require("LuaScript/Logic/Battle/VirtualPlayer")
require("LuaScript/Logic/Item/ItemScene")
require("LuaScript/Controller/ControllerShell")
require("LuaScript/Controller/ControllerBullet")
require("LuaScript/Controller/ControllerCollider")
require("LuaScript/Controller/ControllerGuardMode")
require("LuaScript/Controller/ControllerStoryMode")
require("LuaScript/Controller/ControllerOccupyMode")
require("LuaScript/Controller/ControllerFreeMode")
require("LuaScript/Controller/ControllerLoadCharacter")
require("LuaScript/Controller/ControllerLoadScene")
require("LuaScript/Controller/ControllerTimer")
require("GameData/PlayerDefine/AnimalBase_Define")

ControllerMain = class("ControllerMain", ControllerBase)
ControllerMain.static.TeamNumMax = 3
ControllerMain.static.LockHorizontalAngle = 120
ControllerMain.static.SendLoadProgressInterval = 1
ControllerMain.static.CameraShadowDistance = 15
ControllerMain.static.CameraProjectorHeight = 5
ControllerMain.static.CameraShadowSize = 8
ControllerMain.static.CameraShadowNearClip = 0.1
ControllerMain.static.CameraShadowFarClip = 30
ControllerMain.static.CameraTextureSize = 1024
ControllerMain.static.CameraProjectorNearClip = 0.1
ControllerMain.static.CameraProjectorFarClip = 10
ControllerMain.static.CameraProjectorSize = 8
ControllerMain.static.CameraFastShadowUpdateMargin = 0.5
ControllerMain.static.CameraAspectWidth = 16
ControllerMain.static.CameraAspectHeight = 9
ControllerMain.static.LocatorBornUnit = 1000
ControllerMain.static.LocatorBornJump = 0
ControllerMain.static.LocatorBornCarriage = 10
ControllerMain.static.LocatorBornForest = 20
ControllerMain.static.LocatorBornSave = 30
ControllerMain.static.LocatorBornMaze = 40
ControllerMain.static.LocatorBornBoss = 999
ControllerMain.static.PointLightHeight = 0.68
ControllerMain.static.QualityLevel_Shadow = LS_Setting.QualityLevel.Medium
ControllerMain.static.QualityLevel_Plants = LS_Setting.QualityLevel.Ultra
ControllerMain.static.LoadStep = {
	LoadVfxWait = 14,
	LoadCharacterData = 10,
	LoadUI = 11,
	LoadCharacter = 8,
	LoadEnterRoom = 2,
	LoadLip = 15,
	LoadLipWait = 16,
	LoadWait = 1,
	LoadFinish = 17,
	LoadCharacterWait = 9,
	LoadUIWait = 12,
	LoadSceneWait = 5,
	LoadVfx = 13,
	LoadWaitRoom = 3,
	LoadScene = 4,
	LoadScenePathFindingGraph = 6,
	LoadCamera = 7,
	Empty = 0
}
ControllerMain.static.LoadProgressStep = {
	{
		ControllerMain.LoadStep.LoadEnterRoom,
		1
	},
	{
		ControllerMain.LoadStep.LoadScene,
		10
	},
	{
		ControllerMain.LoadStep.LoadScenePathFindingGraph,
		1
	},
	{
		ControllerMain.LoadStep.LoadCamera,
		1
	},
	{
		ControllerMain.LoadStep.LoadCharacter,
		10
	},
	{
		ControllerMain.LoadStep.LoadCharacterData,
		1
	},
	{
		ControllerMain.LoadStep.LoadUI,
		5
	},
	{
		ControllerMain.LoadStep.LoadVfx,
		10
	},
	{
		ControllerMain.LoadStep.LoadLip,
		1
	}
}
ControllerMain.static.MoveStep = {
	EnterMazeFirst = 14,
	EnterMazeStart = 12,
	ShowResult = 7,
	Dialog = 4,
	Restart = 17,
	EnterOrExitDarkForest = 11,
	Movie = 3,
	Ready = 0,
	BackToTitle = 8,
	Normal = 1,
	TimeLineMove = 6,
	TimeLine = 5,
	EnterNextMaze = 15,
	ExitMazeStart = 13,
	EnterNextFloorMaze = 16,
	GoToNextStage = 10,
	Menu = 2,
	GoToCarriage = 9
}
ControllerMain.static.StateType = {
	LoadArea = 2,
	End = 3,
	Load = 0,
	Move = 1
}
ControllerMain.static.LoadAreaStep = {
	LoadEnterRoom = 6,
	UnloadCharacter = 3,
	LoadScene = 8,
	LoadSceneWait = 9,
	SwitchSceneFinish = 15,
	LoadWaitRoom = 7,
	LoadFinish = 12,
	SwitchScene = 13,
	LoadWait = 1,
	UnloadSceneWait = 5,
	ExitArea = 2,
	UnloadScene = 4,
	LoadCharacterWait = 11,
	SwitchSceneWait = 14,
	LoadCharacter = 10,
	Empty = 0
}
ControllerMain.static.LoadAreaProgressStep = {
	{
		ControllerMain.LoadAreaStep.ExitArea,
		1
	},
	{
		ControllerMain.LoadAreaStep.UnloadCharacter,
		1
	},
	{
		ControllerMain.LoadAreaStep.UnloadScene,
		1
	},
	{
		ControllerMain.LoadAreaStep.LoadEnterRoom,
		1
	},
	{
		ControllerMain.LoadAreaStep.LoadScene,
		5
	},
	{
		ControllerMain.LoadAreaStep.LoadCharacter,
		5
	},
	{
		ControllerMain.LoadAreaStep.SwitchScene,
		1
	}
}
ControllerMain.static.SkillButton = {
	Option = 5,
	Dodge = 4,
	NewHeavy = 8,
	Threat = 6,
	NewLight = 9,
	NewThreat = 12,
	Light = 3,
	NewDodge = 10,
	Heavy = 2,
	Special = 1,
	NewOption = 11,
	NewSpecial = 7,
	None = 0
}
ControllerMain.static.SkillButtonStart = 1
ControllerMain.static.SkillButtonEnd = 12
ControllerMain.static.SwitchType = {
	Reborn = 4,
	Bonefire = 6,
	ChangeReborn = 3,
	ChangeNext = 1,
	Quest = 5,
	ChangeNextDead = 2
}
ControllerMain.static.PressType = {
	PressDown = 2,
	Click = 1,
	Drag = 4,
	PressUp = 3
}
ControllerMain.static.AssistButton = {
	MovieEnd = 102,
	Dialog = 3,
	ActionMax = 28,
	Honeypot = 27,
	Entrance = 24,
	VirtualWallHint = 21,
	GateHint = 16,
	DoorHint = 11,
	ViewMapEnd = 105,
	Bridge = 17,
	ChangeEnd = 106,
	VirtualWall = 20,
	Fountain = 26,
	Cage = 23,
	Execute = 9,
	Change = 6,
	ChangeRebornEnd = 108,
	BonefireEnd = 109,
	WorshipingEnd = 103,
	Crate = 14,
	None = 0,
	WorshipingRest = 104,
	Door = 10,
	CoverKick = 18,
	StairKick = 13,
	Statue = 25,
	Climb = 2,
	Carriage = 7,
	Gate = 15,
	Backstab = 8,
	CoverKickHint = 19,
	ViewMap = 5,
	Picking = 1,
	Worshiping = 4,
	TimeLine = 22,
	Bonefire = 28,
	DialogEnd = 101,
	CarriageEnd = 107,
	Elevator = 12
}
ControllerMain.static.ActionPriority = {
	ControllerMain.AssistButton.Execute,
	ControllerMain.AssistButton.Backstab,
	ControllerMain.AssistButton.Picking,
	ControllerMain.AssistButton.Dialog,
	ControllerMain.AssistButton.Worshiping,
	ControllerMain.AssistButton.Climb,
	ControllerMain.AssistButton.TimeLine,
	ControllerMain.AssistButton.VirtualWallHint,
	ControllerMain.AssistButton.VirtualWall,
	ControllerMain.AssistButton.DoorHint,
	ControllerMain.AssistButton.Door,
	ControllerMain.AssistButton.Elevator,
	ControllerMain.AssistButton.Cage,
	ControllerMain.AssistButton.CoverKickHint,
	ControllerMain.AssistButton.CoverKick,
	ControllerMain.AssistButton.StairKick,
	ControllerMain.AssistButton.GateHint,
	ControllerMain.AssistButton.Gate,
	ControllerMain.AssistButton.Crate,
	ControllerMain.AssistButton.Bridge,
	ControllerMain.AssistButton.ViewMap,
	ControllerMain.AssistButton.Carriage,
	ControllerMain.AssistButton.Change,
	ControllerMain.AssistButton.Entrance,
	ControllerMain.AssistButton.Statue,
	ControllerMain.AssistButton.Fountain,
	ControllerMain.AssistButton.Honeypot,
	ControllerMain.AssistButton.Bonefire
}
ControllerMain.static.CameraShadowLayerMask = {
	LayerAnimal,
	LayerHost
}
ControllerMain.static.CameraShadowMovieLayerMask = {
	LayerMovie
}
ControllerMain.static.CameraProjectorLayerMaskL = {
	LayerDefault,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerDefaultNoShadow
}
ControllerMain.static.CameraProjectorFastLayerMaskL = {
	LayerDefault,
	LayerItem1,
	LayerItem2,
	LayerItem3
}
ControllerMain.static.CameraProjectorLayerMaskH = {
	LayerDefault,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerDefaultNoShadow,
	LayerWater
}
ControllerMain.static.CameraProjectorFastLayerMaskH = {
	LayerDefault,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerWater
}
ControllerMain.static.CameraProjectorLayerMaskForUI = {}
ControllerMain.static.ShadowStrengthSpeed = 0.8
ControllerMain.static.ShadowStrength = 0.525
ControllerMain.static.GameMovieFrameRate = 60
ControllerMain.static.GameTimeLineFrameRate = 60
ControllerMain.static.GameDialogFrameRate = 60
ControllerMain.static.GameMenuFrameRate = 60
ControllerMain.static.GameLoadAreaFrameRate = 60
ControllerMain.GameFrameRate = 60
ControllerMain.AnimatorFrameRate = 30
ControllerMain.LogicFrame = 0
ControllerMain.static.RotateInputType = {
	Screen = 1,
	Unknown = 0,
	Mouse = 3,
	Joystick = 2
}

function ControllerMain.SetFrameRate(framesPerSecond, temp)
	framesPerSecond = Mathf.Clamp(framesPerSecond, 0, LS_Setting.FrameRate[LS_Setting.graphics.framerate])

	if temp == false then
		ControllerMain.GameFrameRate = framesPerSecond
	end

	if LS_Setting.graphics.framerate == LS_Setting.FrameRateLevel.Unlimited then
		UnityEngine.Application.targetFrameRate = -1
	else
		UnityEngine.Application.targetFrameRate = framesPerSecond
	end
end

function ControllerMain:RecoveryFrameRate()
	if LS_Setting.graphics.framerate == LS_Setting.FrameRateLevel.Unlimited then
		UnityEngine.Application.targetFrameRate = -1
	else
		UnityEngine.Application.targetFrameRate = ControllerMain.GameFrameRate
	end
end

function ControllerMain:initialize()
	ControllerBase.initialize(self)

	ControllerMain.GameFrameRate = LS_Setting.FrameRate[LS_Setting.graphics.framerate]

	local go = GoFind("CharacterRoot")

	self.tfCharacterRoot = go.transform
	go = GoFind("SceneRoot")
	self.tfSceneRoot = go.transform
	go = GoFind("HomeBaseRoot")
	self.tfHomeBaseRoot = go.transform
	go = GoFind("ShadowRoot")
	self.tfShadowRoot = go.transform
	go = GoFind("AstarPath")
	self.tfAstarPath = go.transform
	go = GoFind("SceneRoot")
	self.arenaController = go:GetComponent("ArenaController")
	self.dragInitPosX = 0
	self.dragInitPosY = 0
	self.dragAngleHorizontal = 0
	self.dragAngleVertical = 0
	self.viewRotateHorizontal = 0
	self.viewRotateVertical = 0
	self.rotateInputType = ControllerMain.RotateInputType.Unknown
	go = nil
	self.sceneLoadList = nil
	self.sceneUnloadList = nil
	self.sceneFocusName = ""
	self.sceneList = nil
	self.controllerShell = nil
	self.controllerBullet = nil
	self.controllerCollider = nil
	self.controllerGameMode = nil
	self.controllerTimer = nil
	self.loadCharacterManager = LoadCharacterManager:new()
	self.loadUIList = nil
	self.playerList = {}
	self.teamList = {}
	self.playerDeleteList = nil
	self.roomPlayerMineList = {}
	self.hostPlayerUserId = 0
	self.hostPlayer = nil
	self.hostPlayerLockTargetLast = nil
	self.hostPlayerList = {}
	self.hostFakePlayer = nil
	self.homeBase = nil
	self.isLoaded = false
	self.isSwitched = false
	self.loadAreaAsync = false
	ControllerMain.LogicFrame = 0
	self.startGame = false
	self.pointLightPos = Vector3.zero
	self.shadowEnabled = false
	self.tfCameraShadow = nil
	self.tfCameraShadowEnable = false
	self.cameraShadow = nil
	self.cameraShadowSize = ControllerMain.CameraShadowSize
	self.useFastShadow = false
	self.tfCameraProjector = nil
	self.tfCameraProjectorEnable = false
	self.cameraProjector = nil
	self.cameraProjectorMaterial = nil
	self.shadowStrength = 0
	self.shadowTexture = nil
	self.shadowLightDir = nil

	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_CLIENT_LOADING_UPDATE, ControllerMain.OnMatchGameLoad, false)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_START_GAME, ControllerMain.OnMatchGameStart, true)

	self.debugPnlEnabledGraphics = false
	self.debugPnlEnabledSystem = false
	self.debugPanelGraphics = nil
	self.debugPanelSystem = nil
	self.debugBtnUiEnabled = true
	self.debugBtnTagEnabled = true
	self.debugBtnSceneEnabled = true
	self.debugBtnCharsEnabled = true
	self.debugBtnVfxEnabled = true
	self.debugSysPrintStatus = 0

	if DebugShow == true then
		local goDebugLogText = GoFind("LogText")

		if goDebugLogText ~= nil then
			self.debugLogText = goDebugLogText:GetComponent("Text")
		end
	end

	self.stateType = 0
	self.stateSubType = 0
	self.stateSubNextType = 0
	self.stateSubNextParam1 = 0
	self.stateSubNextParam2 = 0

	self:ChangeState(ControllerMain.StateType.Load)

	self.JPadTime = 0
	self.JPadDeltaTime = 0
	self.JPadInput = 0
	self.JPadRotInput = 0
	self.GPadTime = 0
	self.GPadDeltaTime = 0
	self.GPadInput = 0
	self.DPadInput = 0
	self.DPadTime = 0
	self.DPadDeltaTime = 0
	self.timeLineSwitchPlayerStart = false
end

function ControllerMain:Exit()
	self.startGame = false

	if DebugShowCtrlPanel then
		UIManager.Close("Debug")
	end

	for k, tmpPlayer in pairs(self.playerList) do
		if tmpPlayer ~= nil then
			tmpPlayer:ExitBattle()
		end
	end

	XNetworkBattleUdp.Disconnect()
	networkMgrBattleUdp:Disconnect()
	ST_Base.StopBattleUdpPing()
	XNetwork.RemoveListener(XProtocol.BattleProtocolToBattle.RESP_BATTLE_FRAME)
	XNetworkBattleUdp.RemoveListener(XProtocol.BattleProtocolToBattle.RESP_BATTLE_FRAME)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_CLIENT_LOADING_UPDATE)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_START_GAME)
	XCollider.Exit()
	XAnimator.Exit()
	XTransform.Exit()
	ProjectXPathFindingAI.Exit()
	FS_UserData.story:ClearDropItemAll(false)
	DialogueManager.Clear()
	VfxManager.Clear()
	VirtualGroup.Clear()

	if self.controllerShell ~= nil then
		self.controllerShell:Exit()

		self.controllerShell = nil
	end

	if self.controllerBullet ~= nil then
		self.controllerBullet:Exit()

		self.controllerBullet = nil
	end

	if self.controllerCollider ~= nil then
		self.controllerCollider:Exit()

		self.controllerCollider = nil
	end

	if self.controllerGameMode ~= nil then
		self.controllerGameMode:Exit()

		self.controllerGameMode = nil
	end

	if self.controllerTimer ~= nil then
		self.controllerTimer:Exit()

		self.controllerTimer = nil
	end

	if self.arenaController ~= nil then
		self.arenaController:Exit()
	end

	self.arenaController = nil
	self.sceneLoadList = nil

	if self.sceneList ~= nil then
		for _, tmpScene in pairs(self.sceneList) do
			if tmpScene ~= nil then
				tmpScene:Exit()
			end
		end

		self.sceneList = nil
	end

	for k, tmpPlayer in pairs(self.playerList) do
		if tmpPlayer ~= nil then
			tmpPlayer:Exit()

			tmpPlayer = nil
		end
	end

	if self.crow ~= nil then
		self.crow:Exit()
	end

	self.crow = nil

	if self.loadCharacterManager ~= nil then
		self.loadCharacterManager:Exit()

		self.loadCharacterManager = nil
	end

	self.hostPlayer = nil
	self.hostPlayerLockTargetLast = nil
	self.playerList = nil
	self.teamList = nil
	self.playerDeleteList = nil
	self.pointLightPos = nil
	self.tfCameraShadow = nil
	self.cameraShadow = nil
	self.tfCameraProjector = nil
	self.cameraProjector = nil
	self.cameraProjectorMaterial = nil
	self.shadowTexture = nil
	self.shadowLightDir = nil

	UICtrlBase.CloseAndRelease("Curtain")
	UICtrlBase.CloseAndRelease("Subtitle")
	UICtrlBase.CloseAndRelease("PlayerInfo")
	UICtrlBase.CloseAndRelease("Dialog")
	UICtrlBase.CloseAndRelease("Mainmenu")
	UICtrlBase.CloseAndRelease("HitNumber")
	UICtrlBase.CloseAndRelease("HeadInfo")
	UICtrlBase.CloseAndRelease("Exchange")

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local storyId = FS_UserData.story:GetStoryId()

		if MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
			UICtrlBase.CloseAndRelease("StatueUI")
		elseif MS_StoryList.IsStoryCarriage(storyId) then
			UICtrlBase.CloseAndRelease("Wear")
		end
	end

	UICtrlBase.CloseAndRelease("Frog")

	if DebugShowCtrlPanel then
		UICtrlBase.CloseAndRelease("Debug")
	end

	if DebugBehaviorLog == true then
		LS_BehaviorLog.Save()
	end

	ControllerBase.Exit(self)
end

function ControllerMain:ChangeState(state)
	self.stateType = state

	if state == ControllerMain.StateType.Load then
		self:EnterLoad()
	elseif state == ControllerMain.StateType.Move then
		self:EnterMove()
	elseif state == ControllerMain.StateType.LoadArea then
		self:EnterLoadArea()
	end
end

function ControllerMain:BackToState(state)
	self.stateType = state
end

function ControllerMain:ChangeSubState(subState, param1, param2)
	local stateSubTypeOld = self.stateSubType

	self.stateSubType = subState

	if self.stateType == ControllerMain.StateType.Move then
		if self.stateSubType == ControllerMain.MoveStep.Normal then
			if stateSubTypeOld == ControllerMain.MoveStep.Movie or stateSubTypeOld == ControllerMain.MoveStep.Dialog or stateSubTypeOld == ControllerMain.MoveStep.Ready then
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 1)
			end

			self.hostPlayer:Restart()
		elseif self.stateSubType == ControllerMain.MoveStep.Menu then
			self.hostPlayer:StopToMenu()
		elseif self.stateSubType == ControllerMain.MoveStep.ShowResult then
			for i, tmpPlayer in pairs(self.playerList) do
				tmpPlayer:End()
			end

			if self.controllerGameMode ~= nil then
				self.controllerGameMode:GameResultSubmit()
			end
		elseif self.stateSubType == ControllerMain.MoveStep.BackToTitle then
			self:BackToTitle()
		elseif self.stateSubType == ControllerMain.MoveStep.GoToCarriage then
			self:GoToCarriage(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.GoToNextStage then
			if param1 <= 0 or param2 <= 0 then
				SystemHelper.LogError("============ChangeSubState=subState=" .. subState .. ",param1=" .. param1 .. ",param2=" .. param2)
			end

			self:GoToNextStage(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.Restart then
			self:Restart()
		elseif self.stateSubType == ControllerMain.MoveStep.EnterOrExitDarkForest then
			self:EnterOrExitDarkForest(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.EnterMazeStart then
			self:EnterMazeStart(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.ExitMazeStart then
			self:ExitMazeStart(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.EnterMazeFirst then
			self:EnterMazeFirst(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.EnterNextMaze then
			self:EnterNextMaze(param1, param2)
		elseif self.stateSubType == ControllerMain.MoveStep.EnterNextFloorMaze then
			self:EnterNextFloorMaze(param1, param2)
		end
	end
end

function ControllerMain:ChangeNextSubState(subState, param1, param2)
	self.stateSubNextType = subState
	self.stateSubNextParam1 = param1
	self.stateSubNextParam2 = param2
end

function ControllerMain:UpdateNextSubState()
	if self.stateSubNextType > 0 then
		self:ChangeSubState(self.stateSubNextType, self.stateSubNextParam1, self.stateSubNextParam2)

		self.stateSubNextType = 0
	end
end

function ControllerMain:OnSuspend()
	Common.LogTest("=============================OnSuspend===================================")
end

function ControllerMain:EnterLoad()
	self.controllerShell = ControllerShell:new()
	self.isLoaded = false
	self.isSwitched = false

	LoadProgress.Init(ControllerMain.LoadProgressStep)
	self:ChangeSubState(ControllerMain.LoadStep.LoadEnterRoom, 0, 0)
end

function ControllerMain:UpdateLoad()
	if self.stateSubType == ControllerMain.LoadStep.LoadEnterRoom then
		loadMgr:SetLoadingPriorityHigh(true)
		LoadProgress.CreateAndAddItem(ControllerMain.LoadStep.LoadEnterRoom, "LoadEnterRoom", nil)
		NI_BattleRoom.EnterRoomPVE()
		self:ChangeSubState(ControllerMain.LoadStep.LoadWaitRoom, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadStep.LoadWaitRoom then
		if FS_Battle_MatchGame.isGetAllTeamData() == true then
			LoadProgress.SetItemProgress(ControllerMain.LoadStep.LoadEnterRoom, "LoadEnterRoom", 100)
			self:ChangeSubState(ControllerMain.LoadStep.LoadScene, 0, 0)
			Common.ClearMemory()
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadScene then
		self.sceneLoadList = {}
		self.sceneList = {}

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
			local storyId = FS_UserData.story:GetStoryId()
			local areaId = FS_UserData.story:GetAreaId()
			local sceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)

			if sceneId > 0 then
				self.sceneLoadList[sceneId] = 1
				self.sceneFocusName = BattleData.GetSceneName(sceneId)
			else
				self.sceneLoadList[BattleData.GetLoadSceneId()] = 1
				self.sceneFocusName = BattleData.GetSceneName(BattleData.GetLoadSceneId())
			end

			if MS_StoryArea.UseAreaLink == true or DebugDLCSceneAll == true then
				local linkArea = MS_StoryArea.GetStoryAreaLink(storyId, areaId)

				if linkArea ~= nil and #linkArea > 0 then
					for i = 1, #linkArea do
						local linkSceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, linkArea[i])

						if linkSceneId > 0 then
							self.sceneLoadList[linkSceneId] = 1
						end
					end
				end
			end

			if MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
				local mazeLevel = FS_UserData.story:GetMazeLevel()

				self:SetMazeTrapAndTrickData(mazeLevel)
			else
				self:SetMazeTrapAndTrickData(0)
			end
		else
			self.sceneLoadList[BattleData.GetLoadSceneId()] = 1
			self.sceneFocusName = BattleData.GetSceneName(BattleData.GetLoadSceneId())

			self:SetMazeTrapAndTrickData(0)
		end

		ControllerLoadScene.Init(loadMgr)
		ControllerLoadScene.LoadStart(self.sceneLoadList, ControllerMain.LoadStep.LoadScene, true)
		self:ChangeSubState(ControllerMain.LoadStep.LoadSceneWait, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadStep.LoadSceneWait then
		ControllerLoadScene.Update()

		if ControllerLoadScene.IsFinish() then
			self.sceneLoadList = nil

			self:SetFocusScene(self.sceneFocusName, true)
			self:ChangeSubState(ControllerMain.LoadStep.LoadScenePathFindingGraph, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadScenePathFindingGraph then
		LoadProgress.CreateAndAddItem(ControllerMain.LoadStep.LoadScenePathFindingGraph, "LoadScenePathFindingGraph", nil)

		local storyId = FS_UserData.story:GetStoryId()
		local areaId = FS_UserData.story:GetAreaId()
		local sceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and sceneId > 0 then
			self.pathDataList = {}

			for i = 1, 6 do
				local sceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, i)
				local tmpPackage = "PathFindingGraph/Arena" .. sceneId .. "_graph"
				local data = loadMgr:LoadBytes(tmpPackage)

				if data ~= nil and data.bytes ~= nil then
					self.pathDataList[sceneId] = data.bytes

					table.insert(self.pathDataList, data.bytes)
					SystemHelper.LogTest("============LoadScenePathFindingGraph success!!!==============" .. sceneId)
				else
					SystemHelper.LogTest("============LoadScenePathFindingGraph fail!!!==============" .. sceneId)
				end
			end

			self:SetPathFindingGraph(self.pathDataList[sceneId])
		else
			local sceneName = BattleData.GetSceneName(BattleData.GetPathSceneId())
			local tmpPackage = "PathFindingGraph/" .. sceneName .. "_graph"
			local data = loadMgr:LoadBytes(tmpPackage)

			if data ~= nil and data.bytes ~= nil then
				SystemHelper.LogTest("============LoadScenePathFindingGraph success!!!==============")
			else
				SystemHelper.LogTest("============LoadScenePathFindingGraph fail!!!==============")
			end

			self:SetPathFindingGraph(data.bytes)
		end

		self:ChangeSubState(ControllerMain.LoadStep.LoadCamera, 0, 0)
		LoadProgress.SetItemProgress(ControllerMain.LoadStep.LoadScenePathFindingGraph, "LoadScenePathFindingGraph", 100)
	elseif self.stateSubType == ControllerMain.LoadStep.LoadCamera then
		LoadProgress.CreateAndAddItem(ControllerMain.LoadStep.LoadCamera, "LoadCamera", nil)

		local go_cameraRoot = GoFind("CameraMain")
		local go_cameraVirtual = GoFind("CameraVirtual")

		if go_cameraRoot ~= nil and go_cameraVirtual ~= nil then
			local camera = CameraMain:new(go_cameraVirtual.transform, go_cameraRoot.transform)

			self:SetCameraCtrl(camera)

			if self.sceneList ~= nil then
				for i, tmpScene in pairs(self.sceneList) do
					if tmpScene ~= nil then
						tmpScene:SetCameraCtrl(camera)
						tmpScene:SetBrightness(LS_Setting.graphics.brightness)

						if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Ultra then
							tmpScene:SetPostProcessType(SceneBase.PostProcessType.MainSuper)
						elseif LS_Setting.graphics.quality >= LS_Setting.QualityLevel.High then
							tmpScene:SetPostProcessType(SceneBase.PostProcessType.MainPro)
						else
							tmpScene:SetPostProcessType(SceneBase.PostProcessType.Main)
						end
					end
				end
			end

			self:ChangeSubState(ControllerMain.LoadStep.LoadCharacter, 0, 0)
		end

		LoadProgress.SetItemProgress(ControllerMain.LoadStep.LoadCamera, "LoadCamera", 100)
	elseif self.stateSubType == ControllerMain.LoadStep.LoadCharacter then
		ControllerLoadCharacter.Init(self.loadCharacterManager)
		ControllerLoadCharacter.LoadStart(BattleData.GetLoadHeroIdList(), ControllerMain.LoadStep.LoadCharacter, true)
		self:ChangeSubState(ControllerMain.LoadStep.LoadCharacterWait, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadStep.LoadCharacterWait then
		ControllerLoadCharacter.Update()

		if ControllerLoadCharacter.IsFinish() then
			self.loadCharacterManager:InitCharacterAll()
			self:ChangeSubState(ControllerMain.LoadStep.LoadCharacterData, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadCharacterData then
		LoadProgress.CreateAndAddItem(ControllerMain.LoadStep.LoadCharacterData, "LoadCharacterData", nil)

		self.hostPlayerList = {}

		if FS_Battle_MatchGame.isRoomMax() then
			local num = FS_Battle_MatchGame.GetMatchPlayerNum()

			for i = 1, num do
				local tmpPlayerIndex = i
				local roomPlayer = FS_Battle_MatchGame.GetMatchPlayer(tmpPlayerIndex)

				if roomPlayer ~= nil then
					if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) or BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
						if roomPlayer:getTeamId() == 1 then
							self:CreatePlayer(roomPlayer.heroId, roomPlayer)
						end
					elseif roomPlayer:getTeamId() > 0 then
						self:CreatePlayer(roomPlayer.heroId, roomPlayer)
					end
				end
			end
		else
			SystemHelper.LogError("=========IsRoomMax error!!!")
		end

		self:InitHostPlayer()

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local storyId = FS_UserData.story:GetStoryId()

			if MS_StoryList.IsStoryMaze(storyId) == true then
				self.loadCharacterManager:LoadSpecialSanMaterial()
			end
		end

		LoadProgress.SetItemProgress(ControllerMain.LoadStep.LoadCharacterData, "LoadCharacterData", 100)
		self:ChangeSubState(ControllerMain.LoadStep.LoadUI, 0, 0)
		Common.ClearMemory()
	elseif self.stateSubType == ControllerMain.LoadStep.LoadUI then
		LoadProgress.CreateAndAddItem(ControllerMain.LoadStep.LoadUI, "LoadUI", nil)
		UIManager.CreateCtrl("HeadInfo")
		UIManager.CreateCtrl("HitNumber")
		UIManager.CreateCtrl("Mainmenu")
		UIManager.CreateCtrl("Subtitle")
		UIManager.CreateCtrl("Dialog")
		UIManager.CreateCtrl("PlayerInfo")
		UIManager.CreateCtrl("Exchange")
		UIManager.CreateCtrl("Frog")
		UIManager.CreateCtrl("Curtain")

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local storyId = FS_UserData.story:GetStoryId()

			if MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
				UIManager.CreateCtrl("StatueUI")
			elseif MS_StoryList.IsStoryCarriage(storyId) == true then
				UIManager.CreateCtrl("Wear")
			end
		end

		if DebugShowCtrlPanel then
			UIManager.CreateCtrl("Debug")
		end

		self:ChangeSubState(ControllerMain.LoadStep.LoadUIWait, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadStep.LoadUIWait then
		local ret = true

		if ret == true then
			if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
				UIManager.SendMessage("Mainmenu", "ShowMainUI", false)
				UIManager.SendMessage("Mainmenu", "ShowHostUI", false)
				UIManager.SendMessage("Mainmenu", "ShowButtonChangeHero", 0)
			end

			LoadProgress.SetItemProgress(ControllerMain.LoadStep.LoadUI, "LoadUI", 100)
			self:ChangeSubState(ControllerMain.LoadStep.LoadVfx, 0, 0)

			if DebugTestButton == true then
				local goDebug = GoFind("Debug")
				local tfDebug = goDebug.transform
				local tfDbgCanvas = TfFindChild(tfDebug, "DebugCanvas")

				tfDbgCanvas.gameObject:SetActive(true)

				self.debugPanelGraphics = TfFindChild(tfDbgCanvas, "DbgPnlGraphics").gameObject
				self.debugPanelSystem = TfFindChild(tfDbgCanvas, "DbgPnlSystem").gameObject

				local tfPnlGraphics = self.debugPanelGraphics.transform
				local tfPnlSystem = self.debugPanelSystem.transform
				local goBtn = TfFindChild(tfDbgCanvas, "DbgBtnGraphics").gameObject

				if goBtn ~= nil then
					goBtn:SetActive(true)

					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugPnlEnabledGraphics = not self.debugPnlEnabledGraphics

						if self.debugPanelGraphics ~= nil then
							self.debugPanelGraphics:SetActive(self.debugPnlEnabledGraphics)
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlGraphics, "DbgBtnUI").gameObject

				if goBtn ~= nil then
					local uiRoot = GoFind("UIRoot")
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugBtnUiEnabled = not self.debugBtnUiEnabled

						local text = "UI " .. (self.debugBtnUiEnabled and "On" or "Off")
						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end

						if uiRoot then
							uiRoot:SetActive(self.debugBtnUiEnabled)
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlGraphics, "DbgBtnScene").gameObject

				if goBtn ~= nil then
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugBtnSceneEnabled = not self.debugBtnSceneEnabled

						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")
						local text = "Scene " .. (self.debugBtnSceneEnabled and "On" or "Off")

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end

						for _, tmpScene in pairs(self.sceneList) do
							local tfVisible = tmpScene:GetVisibleRoot()

							if tfVisible ~= nil then
								tfVisible.gameObject:SetActive(self.debugBtnSceneEnabled)
							end
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlGraphics, "DbgBtnSnd").gameObject

				if goBtn ~= nil then
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						FmodManager.Enabled = not FmodManager.Enabled

						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")
						local text = "Snd " .. (FmodManager.Enabled and "On" or "Off")

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end

						if FmodManager.Enabled then
							AudioCtrl.SetSceneAmbienceAudio(FS_UserData.story:GetStoryId())
						else
							FmodManager.DbgStopAllSceneSe()
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlGraphics, "DbgBtnChars").gameObject

				if goBtn ~= nil then
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugBtnCharsEnabled = not self.debugBtnCharsEnabled

						local text = "Chars " .. (self.debugBtnCharsEnabled and "On" or "Off")
						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end

						if self.tfCharacterRoot ~= nil then
							self.tfCharacterRoot.gameObject:SetActive(self.debugBtnCharsEnabled)
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlGraphics, "DbgBtnVfx").gameObject

				if goBtn ~= nil then
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugBtnVfxEnabled = not self.debugBtnVfxEnabled

						local vfxRoot = GoFind("VfxRoot")
						local vfxInstanceRoot = TfFindChild(vfxRoot.transform, "Vfx_Instance")

						vfxInstanceRoot.gameObject:SetActive(self.debugBtnVfxEnabled)

						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")
						local text = "Vfx " .. (self.debugBtnVfxEnabled and "On" or "Off")

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlGraphics, "DbgBtnHeadHud").gameObject

				if goBtn ~= nil then
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugBtnTagEnabled = not self.debugBtnTagEnabled

						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")
						local text = "Head " .. (self.debugBtnTagEnabled and "On" or "Off")

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end

						ctrl = UIManager.GetCtrl("HeadInfo")

						if ctrl ~= nil then
							local goTag = ctrl.mainComponent.gameObject

							if goTag ~= nil then
								goTag:SetActive(self.debugBtnTagEnabled)
							end
						end
					end, 0)
				end

				goBtn = TfFindChild(tfDbgCanvas, "DbgBtnSystem").gameObject

				if goBtn ~= nil then
					goBtn:SetActive(true)

					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugPnlEnabledSystem = not self.debugPnlEnabledSystem

						if self.debugPanelSystem ~= nil then
							self.debugPanelSystem:SetActive(self.debugPnlEnabledSystem)
						end
					end, 0)
				end

				goBtn = TfFindChild(tfPnlSystem, "DbgBtnPrt").gameObject

				if goBtn ~= nil then
					local xBtn = XButton:new(goBtn)

					xBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						self.debugSysPrintStatus = (self.debugSysPrintStatus + 1) % 3

						if self.debugSysPrintStatus == 1 then
							DebugTestTools.PrintOn()
						elseif self.debugSysPrintStatus == 2 then
							DebugTestTools.Print()
						else
							DebugTestTools.PrintOff()
						end

						local btnText = TfFindChild(xBtn.transform, "Text"):GetComponent("Text")
						local text = "Print off"

						if self.debugSysPrintStatus == 1 then
							text = "Print on"
						elseif self.debugSysPrintStatus == 2 then
							text = "Print ok"
						end

						if btnText ~= nil then
							btnText.text = text
						else
							SystemHelper.Log(text)
						end
					end, 0)
				end
			end
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadVfx then
		VirtualGroup.Init()
		VfxManager.Init()

		local vfxNameList

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
			vfxNameList = BattleData.GetVfxNameList(nil)
		else
			vfxNameList = BattleData.GetVfxNameList(BattleData.GetLoadHeroIdAllList())
		end

		if vfxNameList ~= nil then
			VfxManager.LoadStart(vfxNameList, ControllerMain.LoadStep.LoadVfx, true)
			self:ChangeSubState(ControllerMain.LoadStep.LoadVfxWait, 0, 0)
		else
			self:ChangeSubState(ControllerMain.LoadStep.LoadLip, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadVfxWait then
		local ret = VfxManager.IsFinish()

		if ret == true then
			self:ChangeSubState(ControllerMain.LoadStep.LoadLip, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadLip then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
			DialogueManager.LoadStart(ControllerMain.LoadStep.LoadLip, true)
			self:ChangeSubState(ControllerMain.LoadStep.LoadLipWait, 0, 0)
		else
			self:ChangeSubState(ControllerMain.LoadStep.LoadFinish, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadLipWait then
		local ret = DialogueManager.IsFinish()

		if ret == true then
			self:ChangeSubState(ControllerMain.LoadStep.LoadFinish, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadStep.LoadFinish then
		local gameFps = LS_Setting.FrameRate[LS_Setting.graphics.framerate]

		if gameFps > 0 then
			ControllerMain.SetFrameRate(gameFps, false)
		end

		self:InitCrow()
		LoadProgress.Finish()

		if DebugTestButton == true then
			if self.debugPanelGraphics ~= nil then
				self.debugPanelGraphics:SetActive(self.debugPnlEnabledGraphics)
			end

			if self.debugPanelSystem ~= nil then
				self.debugPanelSystem:SetActive(self.debugPnlEnabledSystem)
			end
		end

		Common.ClearMemory()
		self:GoToBattle()

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) and FS_UserData.story:GetStoryId() == 1001 and not FS_UserData.story:IsQuestComplete(MS_StoryQuest.QuestArcadeStart) then
				FS_UserData.story:ClearAllStageTime()
				FS_UserData.story:RecordStageTime(FS_UserData.story:GetStoryId(), self:GetHostPlayerHeroId())
				FS_UserData.story:CompleteQuest(MS_StoryQuest.QuestArcadeStart, 0)
				self.controllerGameMode:Save(ControllerStoryMode.SaveType.SaveReborn)
			end

			if not FS_UserData.story:IsQuestComplete(MS_StoryQuest.QuestArcadeAllModeStart) then
				FS_UserData.story:CompleteQuest(MS_StoryQuest.QuestArcadeAllModeStart, 0)
			end
		end
	end
end

function ControllerMain:InitScene(name)
	local go = GoFindInScene(name, name)

	go.transform.localScale = Vector3.one
	go.transform.localPosition = Vector3.zero

	local loadScene = SceneMain:new(go.transform, go.name)

	if self.sceneList[name] == nil then
		self.sceneList[name] = loadScene
	end

	local goDirLight = GoFindInScene(name, "RealtimeLight")

	if goDirLight ~= nil then
		loadScene:SetDirLight(goDirLight.transform)
	end

	local goPointLight = GoFindInScene(name, "PointLight")

	if goPointLight ~= nil then
		loadScene:SetPointLight(goPointLight.transform)
	end

	local goBakeLight = GoFindInScene(name, "BakeLight")

	if goBakeLight ~= nil then
		local tfMainLight = TfFindChild(goBakeLight.transform, "MainLight")

		if tfMainLight ~= nil then
			loadScene:SetMixLight(tfMainLight)
		end
	end

	local goPostProcessing = GoFindInScene(name, "PostProcessing")

	if goPostProcessing ~= nil then
		loadScene:SetPostProcessing(goPostProcessing.transform)
	end

	local goReflectionProbe = GoFindInScene(name, "ReflectionProbeGroup")

	if goReflectionProbe ~= nil then
		loadScene:SetReflectionProbeGroup(goReflectionProbe.transform)
	end

	local goEffectRoot = GoFindInScene(name, "EffectGroup")

	if goEffectRoot ~= nil then
		loadScene:SetEffectRoot(goEffectRoot.transform)
	end

	loadScene:SetFocus(false, true)
end

function ControllerMain:EnterLoadArea()
	self.isLoaded = false
	self.isSwitched = false

	LoadProgress.Init(ControllerMain.LoadAreaProgressStep)
	self:ChangeSubState(ControllerMain.LoadAreaStep.ExitArea, 0, 0)
end

function ControllerMain:UpdateLoadArea()
	if self.stateSubType == ControllerMain.LoadAreaStep.ExitArea then
		loadMgr:SetLoadingPriorityHigh(false)

		if self.controllerGameMode ~= nil then
			self.controllerGameMode:ExitArea()
		end

		if self.controllerBullet ~= nil then
			self.controllerBullet:ClearBulletAll()
		end

		if self.controllerCollider ~= nil then
			self.controllerCollider:ClearColliderAll()
		end

		self:ClearSceneTrapAll()
		BattleData.InitBattleMode()
		BattleData.InitBattleData()
		self:ChangeSubState(ControllerMain.LoadAreaStep.UnloadCharacter, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadAreaStep.UnloadCharacter then
		local heroIdList = BattleData.GetLoadHeroIdList()

		self.loadCharacterManager:UnloadAreaCharacter(heroIdList)
		self:ChangeSubState(ControllerMain.LoadAreaStep.UnloadScene, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadAreaStep.UnloadScene then
		local storyId = FS_UserData.story:GetStoryId()
		local areaId = FS_UserData.story:GetAreaId()

		self.sceneLoadList = nil
		self.sceneUnloadList = nil

		local needUnload = false
		local tmpSceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)

		if tmpSceneId > 0 then
			self.sceneLoadList = {}
			self.sceneLoadList[tmpSceneId] = 1

			SystemHelper.LogTest("================load !!!!!!=name=" .. tmpSceneId)

			if MS_StoryArea.UseAreaLink == true or DebugDLCSceneAll == true then
				local linkArea = MS_StoryArea.GetStoryAreaLink(storyId, areaId)

				if linkArea ~= nil and #linkArea > 0 then
					for i = 1, #linkArea do
						local linkSceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, linkArea[i])

						if linkSceneId > 0 then
							self.sceneLoadList[linkSceneId] = 1

							SystemHelper.LogTest("================load !!!!!!=name=" .. linkSceneId)
						end
					end
				end
			else
				local nowSceneId = BattleData.ConvertSceneId(self.sceneFocusName)

				self.sceneLoadList[nowSceneId] = 1
			end

			if self.sceneList ~= nil then
				for name, scene in pairs(self.sceneList) do
					if scene ~= nil then
						local sceneId = scene:GetSceneId()

						if self.sceneLoadList[sceneId] == nil then
							if self.sceneUnloadList == nil then
								self.sceneUnloadList = {}
							end

							if self.sceneUnloadList ~= nil then
								table.insert(self.sceneUnloadList, name)
							end
						else
							self.sceneLoadList[sceneId] = nil
						end
					end
				end
			end

			if self.sceneUnloadList ~= nil and #self.sceneUnloadList > 0 then
				for i = #self.sceneUnloadList, 1, -1 do
					local name = self.sceneUnloadList[i]

					if self.sceneList ~= nil and self.sceneList[name] ~= nil then
						if self.controllerGameMode ~= nil then
							self.controllerGameMode:ExitScene(self.sceneList[name])
						end

						if self.sceneList[name] ~= nil then
							self.sceneList[name]:Exit()
						end

						self.sceneList[name] = nil
					end

					local function cbFun(name)
						for i = 1, #self.sceneUnloadList do
							if self.sceneUnloadList[i] == name then
								table.remove(self.sceneUnloadList, i)
							end
						end

						SystemHelper.LogTest("==========finish======unload !!!!!!=name=" .. name)

						if #self.sceneUnloadList <= 0 then
							self.sceneUnloadList = nil

							loadMgr:EndLoad()
							self:ChangeSubState(ControllerMain.LoadAreaStep.LoadEnterRoom, 0, 0)
						end
					end

					loadMgr:UnloadLevel(name, true, cbFun)
				end

				needUnload = true
			end
		end

		if needUnload == true then
			self:ChangeSubState(ControllerMain.LoadAreaStep.UnloadSceneWait, 0, 0)
		else
			self:ChangeSubState(ControllerMain.LoadAreaStep.LoadEnterRoom, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.UnloadSceneWait then
		-- block empty
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadEnterRoom then
		if self.loadAreaAsync == true then
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
		end

		NI_BattleRoom.EnterRoomPVE()
		self:ChangeSubState(ControllerMain.LoadAreaStep.LoadWaitRoom, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadWaitRoom then
		if FS_Battle_MatchGame.isGetAllTeamData() == true then
			self:ChangeSubState(ControllerMain.LoadAreaStep.LoadScene, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadScene then
		if self.sceneLoadList ~= nil then
			ControllerLoadScene.Init(loadMgr)
			ControllerLoadScene.LoadStart(self.sceneLoadList, ControllerMain.LoadAreaStep.LoadScene, true)
			self:ChangeSubState(ControllerMain.LoadAreaStep.LoadSceneWait, 0, 0)
		else
			self:ChangeSubState(ControllerMain.LoadAreaStep.LoadCharacter, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadSceneWait then
		ControllerLoadScene.Update()

		if ControllerLoadScene.IsFinish() then
			if self.sceneList ~= nil then
				for _, tmpScene in pairs(self.sceneList) do
					if tmpScene ~= nil then
						tmpScene:SetCameraCtrl(self.cameraCtrl)
						tmpScene:SetBrightness(LS_Setting.graphics.brightness)

						if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Ultra then
							tmpScene:SetPostProcessType(SceneBase.PostProcessType.MainSuper)
						elseif LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
							tmpScene:SetPostProcessType(SceneBase.PostProcessType.MainPro)
						else
							tmpScene:SetPostProcessType(SceneBase.PostProcessType.Main)
						end

						tmpScene:Start()
					end
				end
			end

			self:ChangeSubState(ControllerMain.LoadAreaStep.LoadCharacter, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadCharacter then
		ControllerLoadCharacter.Init(self.loadCharacterManager)
		ControllerLoadCharacter.LoadStart(BattleData.GetLoadHeroIdList(), ControllerMain.LoadAreaStep.LoadCharacter, false)
		self:ChangeSubState(ControllerMain.LoadAreaStep.LoadCharacterWait, 0, 0)
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadCharacterWait then
		ControllerLoadCharacter.Update()

		if ControllerLoadCharacter.IsFinish() then
			self:ChangeSubState(ControllerMain.LoadAreaStep.LoadFinish, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.LoadFinish then
		self.isLoaded = true

		if self.loadAreaAsync == false then
			self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchScene, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.SwitchScene then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local storyId = FS_UserData.story:GetStoryId()
			local areaId = FS_UserData.story:GetAreaId()
			local tmpSceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)

			if tmpSceneId > 0 then
				local sceneNameOld = self.sceneFocusName

				if MS_StoryArea.UseAreaLink == true or DebugDLCSceneAll == true then
					self.sceneFocusName = BattleData.GetSceneName(tmpSceneId)

					self:SetFocusScene(self.sceneFocusName, false)
					self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchSceneFinish, 0, 0)
				else
					if self.sceneList ~= nil and self.sceneList[sceneNameOld] ~= nil then
						if self.controllerGameMode ~= nil then
							self.controllerGameMode:ExitScene(self.sceneList[sceneNameOld])
						end

						if self.sceneList[sceneNameOld] ~= nil then
							self.sceneList[sceneNameOld]:Exit()
						end

						self.sceneList[sceneNameOld] = nil
					end

					local function cbFun(name)
						SystemHelper.LogTest("==========finish======unload !!!!!!=name=" .. name)
						loadMgr:EndLoad()

						local storyId = FS_UserData.story:GetStoryId()
						local areaId = FS_UserData.story:GetAreaId()
						local tmpSceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)

						self.sceneFocusName = BattleData.GetSceneName(tmpSceneId)

						self:SetFocusScene(self.sceneFocusName, false)
						self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchSceneFinish, 0, 0)
					end

					loadMgr:UnloadLevel(sceneNameOld, true, cbFun)
					self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchSceneWait, 0, 0)
				end
			else
				self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchSceneFinish, 0, 0)
			end
		else
			self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchSceneFinish, 0, 0)
		end
	elseif self.stateSubType == ControllerMain.LoadAreaStep.SwitchSceneWait then
		-- block empty
	elseif self.stateSubType == ControllerMain.LoadAreaStep.SwitchSceneFinish then
		self.isSwitched = true

		if self.loadAreaAsync == false then
			self:BackToBattle()
			UIManager.SendMessage("Loading", "SetActive", false)
		end
	end

	if self.playerDeleteList ~= nil then
		for id, _ in pairs(self.playerDeleteList) do
			self:RemovePlayer(id)
		end

		self.playerDeleteList = nil
	end

	if self.loadAreaAsync == true then
		if self.sceneList ~= nil then
			for name, scene in pairs(self.sceneList) do
				if scene ~= nil then
					scene:UpdateLoadArea()
				end
			end
		end

		if self.controllerGameMode ~= nil then
			self.controllerGameMode:UpdateLoadArea()
		end
	end
end

function ControllerMain:LateUpdateLoadArea()
	if self.loadAreaAsync == true and self.hostPlayer ~= nil then
		self.hostPlayer:LateUpdateLoadArea()
	end
end

function ControllerMain:IsLoaded()
	return self.isLoaded
end

function ControllerMain:IsSwitchSceneFinish()
	return self.isSwitched
end

function ControllerMain:GoToBattle()
	if self.stateType == ControllerMain.StateType.Load and self.stateSubType == ControllerMain.LoadStep.LoadFinish then
		self.isLoaded = true
		self.isSwitched = true

		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
		self:ChangeSubState(ControllerMain.LoadStep.Empty, 0, 0)
		self:ChangeState(ControllerMain.StateType.Move)
		inputMgr:SetPointerLocked(true)
		inputMgr:SetInGameMode()
	end
end

function ControllerMain:StartSwitchScene()
	if self.stateType == ControllerMain.StateType.LoadArea and self.stateSubType == ControllerMain.LoadAreaStep.LoadFinish then
		self:ChangeSubState(ControllerMain.LoadAreaStep.SwitchScene, 0, 0)
	end
end

function ControllerMain:BackToBattle()
	if self.stateType == ControllerMain.StateType.LoadArea and self.stateSubType == ControllerMain.LoadAreaStep.SwitchSceneFinish then
		SystemHelper.LogTest("==============BackToBattle======LoadArea======")

		self.isLoaded = true
		self.isSwitched = true

		self.loadCharacterManager:InitCharacterAll()
		Common.ClearMemory()
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
		self:ChangeSubState(ControllerMain.LoadStep.Empty, 0, 0)
		self:BackToState(ControllerMain.StateType.Move)

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:ResetFollowingBase()
		end

		if self.controllerGameMode ~= nil then
			self.controllerGameMode:InitArea()
			self.controllerGameMode:EnterArea(false)
		end

		ControllerMain.RecoveryFrameRate()
	else
		SystemHelper.LogTest("==============BackToBattle===========self.stateType=" .. self.stateType .. ",self.stateSubType=" .. self.stateSubType)
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
	end
end

function ControllerMain:ChangeArea(areaId, async)
	SystemHelper.LogTest("=========ChangeArea===========areaId=" .. areaId .. ",nowAreaId=" .. FS_UserData.story:GetAreaId())

	if areaId == FS_UserData.story:GetAreaId() then
		return false
	end

	self.loadAreaAsync = async

	ControllerMain.SetFrameRate(ControllerMain.GameLoadAreaFrameRate, true)
	FS_UserData.story:SetArea(areaId)
	self:ChangeState(ControllerMain.StateType.LoadArea)

	if self.loadAreaAsync == false then
		UIManager.SendMessage("Loading", "SetActive", true)
	else
		UIManager.SendMessage("Mainmenu", "FadeOut", 0.7, true)
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
	end

	UIManager.SendMessage("Dialog", "StopDialog")
	UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")

	return true
end

function ControllerMain:Transfer(portId, areaId)
	if areaId == FS_UserData.story:GetAreaId() then
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)

		if self.controllerGameMode ~= nil then
			self.controllerGameMode:ExitArea()

			if self.controllerBullet ~= nil then
				self.controllerBullet:ClearBulletAll()
			end

			if self.controllerCollider ~= nil then
				self.controllerCollider:ClearColliderAll()
			end

			self:ClearSceneTrapAll()
			self.controllerGameMode:InitArea()
			self.controllerGameMode:EnterArea(false)
		end

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:ResetFollowingBase()
		end
	else
		self:ChangeArea(areaId, false)
	end
end

function ControllerMain:IsNormalPlaying()
	if self.stateType == ControllerMain.StateType.Move and self.stateSubType == ControllerMain.MoveStep.Normal then
		return true
	end

	return false
end

function ControllerMain:GetScene()
	return self.sceneList[self.sceneFocusName]
end

function ControllerMain:ClearSceneTrapAll()
	if self.sceneList ~= nil then
		for i, tmpScene in pairs(self.sceneList) do
			if tmpScene ~= nil then
				tmpScene:ClearTrapAll()
			end
		end
	end
end

function ControllerMain:SetFocusScene(sceneName, first)
	if self.sceneList[sceneName] ~= nil then
		self.sceneFocusName = sceneName

		loadMgr:SetFocusScene(sceneName)
		self:UpdateFocusScene(first)

		local storyId = FS_UserData.story:GetStoryId()
		local areaId = FS_UserData.story:GetAreaId()
		local tmpSceneId = MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)

		if self.pathDataList ~= nil then
			local pathData = self.pathDataList[tmpSceneId]

			if pathData ~= nil then
				self:SetPathFindingGraph(pathData)
			end
		end
	end
end

function ControllerMain:UpdateFocusScene(first)
	if self.sceneList ~= nil then
		for name, tmpScene in pairs(self.sceneList) do
			if DebugDLCSceneAll == true then
				Common.SetRootObjectActiveFromScene(name, true)
			end

			if name == self.sceneFocusName then
				tmpScene:SetFocus(true, false)

				if self.arenaController ~= nil then
					self.arenaController:SetConfig(tmpScene:GetConfig())
				end
			else
				tmpScene:SetFocus(false, false)
			end
		end

		if first == false then
			local activeScene = self.sceneList[self.sceneFocusName]

			if activeScene ~= nil then
				if self.playerList ~= nil then
					for i, tmpPlayer in pairs(self.playerList) do
						tmpPlayer:SetScene(activeScene)
					end
				end

				if self.controllerGameMode ~= nil then
					self.controllerGameMode:SetScene(activeScene)
				end

				self.shadowLightDir = activeScene:GetMixLightDir()

				self:UpdateQuality(true)
			end
		end
	end
end

function ControllerMain:GetLoadCharacterManager()
	return self.loadCharacterManager
end

function ControllerMain:UpdateLight()
	if self.hostPlayer ~= nil and self.timeLineSwitchPlayerStart == false then
		self.pointLightPos:SetVector3(self.hostPlayer:GetPosByWorldPos())

		self.pointLightPos.y = self.pointLightPos.y + ControllerMain.PointLightHeight

		if self.sceneList ~= nil and self.sceneList[self.sceneFocusName] ~= nil then
			self.sceneList[self.sceneFocusName]:SetPointLightPosition(self.pointLightPos)
		end
	end
end

function ControllerMain:CreateShadow()
	local captureDepthShader = XObjectPool.GetShader("Cy/DepthCaptureWithDissolve")

	if self.tfShadowRoot ~= nil then
		self.tfCameraShadow = TfFindChild(self.tfShadowRoot, "CameraForAnimal")

		if self.tfCameraShadow ~= nil then
			self.cameraShadow = self.tfCameraShadow:GetComponent("Camera")

			if self.cameraShadow ~= nil then
				self.cameraShadow.nearClipPlane = ControllerMain.CameraShadowNearClip
				self.cameraShadow.farClipPlane = ControllerMain.CameraShadowFarClip
				self.cameraShadow.orthographic = true
				self.cameraShadow.orthographicSize = ControllerMain.CameraShadowSize
				self.cameraShadowSize = ControllerMain.CameraShadowSize
				self.shadowTexture = self.cameraShadow.targetTexture

				self.cameraShadow:SetReplacementShader(captureDepthShader, "")

				self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowLayerMask)
			end

			self.tfCameraShadow.gameObject:SetActive(false)

			self.tfCameraShadowEnable = false
		end

		self.useFastShadow = DebugUseFastShadow

		if self.useFastShadow == true then
			self.useFastShadow = false

			local goFastShadow = GoFind("FastShadow")

			if goFastShadow ~= nil then
				self.tfCameraProjector = TfFindChild(goFastShadow.transform, "ShadowProjector")

				local tmptfShadowReceiver = TfFindChild(goFastShadow.transform, "MeshShadowReceiver")

				if self.tfCameraProjector ~= nil and tmptfShadowReceiver ~= nil then
					self.cameraProjector = self.tfCameraProjector:GetComponent("Projector")

					local shadowReceiver = tmptfShadowReceiver:GetComponent("FastShadowReceiver.MeshShadowReceiver")

					if self.cameraProjector ~= nil and shadowReceiver ~= nil then
						if LS_Setting.graphics.reflection > 0 then
							self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorFastLayerMaskH)
						else
							self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorFastLayerMaskL)
						end

						shadowReceiver.scissorEnabled = true
						shadowReceiver.scissorMargin = 0
						shadowReceiver.cullBackFace = false
						shadowReceiver.predictEnabled = false
						shadowReceiver.updateOnlyWhenProjectorMoved = true
						shadowReceiver.margin = ControllerMain.CameraFastShadowUpdateMargin
						self.useFastShadow = true
					end
				end
			end
		end

		if self.useFastShadow == false then
			local goFastShadow = GoFind("FastShadow")

			if goFastShadow ~= nil then
				goFastShadow:SetActive(false)
			end

			self.tfCameraProjector = TfFindChild(self.tfShadowRoot, "ProjectorForAnimal")

			if self.tfCameraProjector ~= nil then
				self.cameraProjector = self.tfCameraProjector:GetComponent("Projector")

				if self.cameraProjector ~= nil then
					if LS_Setting.graphics.reflection > 0 then
						self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorLayerMaskH)
					else
						self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorLayerMaskL)
					end
				end
			end
		end

		if self.tfCameraProjector ~= nil and self.cameraProjector ~= nil then
			self.cameraProjector.nearClipPlane = ControllerMain.CameraProjectorNearClip
			self.cameraProjector.farClipPlane = ControllerMain.CameraProjectorFarClip
			self.cameraProjector.orthographic = true
			self.cameraProjector.orthographicSize = ControllerMain.CameraProjectorSize
			self.cameraProjectorMaterial = self.cameraProjector.material

			self.cameraProjectorMaterial:SetFloat("_Strength", 0)

			self.shadowStrength = 0

			self.tfCameraProjector.gameObject:SetActive(false)

			self.tfCameraProjectorEnable = false
		end

		self.shadowLightDir = self.sceneList[self.sceneFocusName]:GetMixLightDir()
		self.shadowEnabled = false
	end
end

function ControllerMain:OpenShadow()
	if LS_Setting.graphics.quality >= ControllerMain.QualityLevel_Shadow then
		self:UpdateShadowQuality(true)
	else
		self:UpdateShadowQuality(false)
	end
end

function ControllerMain:CloseShadow()
	self:UpdateShadowQuality(false)
end

function ControllerMain:UpdateShadowQuality(flg)
	if self.cameraShadow ~= nil and self.cameraProjector ~= nil then
		if flg == true then
			if self.shadowEnabled == true then
				self.shadowStrength = ControllerMain.ShadowStrength

				self.cameraProjectorMaterial:SetFloat("_Strength", ControllerMain.ShadowStrength)

				if self.tfCameraShadow ~= nil and self.tfCameraShadowEnable == false then
					self.tfCameraShadow.gameObject:SetActive(true)

					self.tfCameraShadowEnable = true
				end

				if self.tfCameraProjector ~= nil and self.tfCameraProjectorEnable == false then
					self.tfCameraProjector.gameObject:SetActive(true)

					self.tfCameraProjectorEnable = true
				end

				if self.shadowTexture ~= nil then
					self.cameraProjector.material:SetTexture("_ShadowDepthMap", self.shadowTexture)
				end
			end
		elseif flg == false then
			self.shadowStrength = 0

			self.cameraProjectorMaterial:SetFloat("_Strength", 0)

			if self.tfCameraShadow ~= nil and self.tfCameraShadowEnable == true then
				self.tfCameraShadow.gameObject:SetActive(false)

				self.tfCameraShadowEnable = false
			end

			if self.tfCameraProjector ~= nil and self.tfCameraProjectorEnable == true then
				self.tfCameraProjector.gameObject:SetActive(false)

				self.tfCameraProjectorEnable = false
			end
		end

		if LS_Setting.graphics.reflection > 0 then
			if self.useFastShadow == false then
				self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorLayerMaskH)
			else
				self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorFastLayerMaskH)
			end
		elseif self.useFastShadow == false then
			self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorLayerMaskL)
		else
			self.cameraProjector.ignoreLayers = Common.GetOneBitLeftMoveMinus(ControllerMain.CameraProjectorFastLayerMaskL)
		end
	end
end

function ControllerMain:ShowShadow(flg)
	if self.cameraShadow ~= nil and self.cameraProjector ~= nil then
		if self.shadowEnabled == false and flg == true then
			self.shadowEnabled = true

			if LS_Setting.graphics.quality >= ControllerMain.QualityLevel_Shadow then
				self.shadowStrength = self.cameraProjectorMaterial:GetFloat("_Strength")

				if self.tfCameraShadow ~= nil and self.tfCameraShadowEnable == false then
					self.tfCameraShadow.gameObject:SetActive(true)

					self.tfCameraShadowEnable = true
				end

				if self.tfCameraProjector ~= nil and self.tfCameraProjectorEnable == false then
					self.tfCameraProjector.gameObject:SetActive(true)

					self.tfCameraProjectorEnable = true
				end
			end
		elseif self.shadowEnabled == true and flg == false then
			self.shadowEnabled = false
			self.shadowStrength = self.cameraProjectorMaterial:GetFloat("_Strength")
		end
	end
end

function ControllerMain:UpdateShadow()
	if self.cameraShadow ~= nil and self.cameraProjector ~= nil then
		if self.shadowEnabled == false then
			if self.shadowStrength > 0 then
				self.shadowStrength = self.shadowStrength - ControllerMain.ShadowStrengthSpeed * ControllerMain.GetLogicDeltaTime()

				if self.shadowStrength <= 0 then
					self.shadowStrength = 0

					self.cameraProjectorMaterial:SetFloat("_Strength", 0)

					if self.tfCameraShadow ~= nil and self.tfCameraShadowEnable == true then
						self.tfCameraShadow.gameObject:SetActive(false)

						self.tfCameraShadowEnable = false
					end

					if self.tfCameraProjector ~= nil and self.tfCameraProjectorEnable == true then
						self.tfCameraProjector.gameObject:SetActive(false)

						self.tfCameraProjectorEnable = false
					end
				else
					self.cameraProjectorMaterial:SetFloat("_Strength", self.shadowStrength)
				end
			end
		elseif self.shadowEnabled == true and LS_Setting.graphics.quality >= ControllerMain.QualityLevel_Shadow then
			if self.shadowStrength < ControllerMain.ShadowStrength then
				self.shadowStrength = self.shadowStrength + ControllerMain.ShadowStrengthSpeed * ControllerMain.GetLogicDeltaTime()

				if self.shadowStrength >= ControllerMain.ShadowStrengthSpeed then
					self.shadowStrength = ControllerMain.ShadowStrengthSpeed
				end

				self.cameraProjectorMaterial:SetFloat("_Strength", self.shadowStrength)
			end

			if self.cameraCtrl ~= nil and self.shadowLightDir ~= nil then
				local tmpShadowPos = self.controllerGameMode:GetShadowPosition()
				local tmpShadowSize = self.controllerGameMode:GetShadowSize()

				if tmpShadowPos ~= nil and tmpShadowSize ~= nil and self.cameraShadowSize ~= tmpShadowSize then
					self.cameraShadow.orthographicSize = tmpShadowSize
					self.cameraShadowSize = tmpShadowSize
				end

				local tmpPos = self.shadowLightDir * ControllerMain.CameraShadowDistance

				tmpPos:Add(tmpShadowPos)

				self.tfCameraShadow.position = tmpPos

				self.tfCameraShadow:LookAt(tmpShadowPos)
				tmpPos:SetVector3(Vector3.s_up)
				tmpPos:Mul(ControllerMain.CameraProjectorHeight)
				tmpPos:Add(tmpShadowPos)

				self.tfCameraProjector.position = tmpPos

				self.tfCameraProjector:LookAt(tmpShadowPos)
				Common.SetShadowMatrix(self.cameraShadow, "_ShadowCameraVP")

				tmpPos = nil
			end
		end
	end
end

function ControllerMain:BackToTitle()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.controllerGameMode ~= nil then
		if AppVer ~= AppTapTapEA then
			if DebugCreateSavePoint == true then
				self.controllerGameMode:Save(ControllerStoryMode.SaveType.SaveExit)
			elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true then
				self.controllerGameMode:CheckSaveAuto(ControllerStoryMode.SaveAuto.Exit)
			end
		elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP or SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
			LS_Autosave.OverwriteWithLastSaveSlot()
		end
	end

	ST_Scene.ChangeScene(ST_Scene.SceneType.LobbyReload)
end

function ControllerMain:GoToCarriage(storyId, carriageId)
	FS_UserData.story:RecordStageTime(FS_UserData.story:GetStoryId(), self:GetHostPlayerHeroId())
	FS_UserData.story:ResetAllStageTime()
	FS_UserData.story:GoToCarriage(storyId, carriageId)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:GoToNextStage(storyId, carriageId)
	FS_UserData.story:RecordStageTime(FS_UserData.story:GetStoryId(), self:GetHostPlayerHeroId())
	FS_UserData.story:ResetAllStageTime()

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		FS_UserData.story:StartOffArcade(storyId, carriageId)
	else
		FS_UserData.story:StartOff(storyId, carriageId)
	end

	FS_UserData.story:SetIsInRelaxTime(false)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:Restart()
	if FS_UserData.story:GetIsLoopMax() then
		return
	end

	self.controllerGameMode:CompleteQuest(MS_StoryQuest.GameLoopQuestId)
	FS_UserData.story:RecordStageTime(FS_UserData.story:GetStoryId(), self:GetHostPlayerHeroId())
	FS_UserData.story:ResetAllStageTime()
	FS_UserData.itemList:Restart()
	FS_UserData.story:Restart()

	for i, tmpPlayer in pairs(self.hostPlayerList) do
		if tmpPlayer ~= nil then
			tmpPlayer:ClearStatusAll()
		end
	end

	self:GetGameController():RecordAchievement(MS_Achievement.AchievementIdType.PlaySecondTime, 1)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:ArcadeRestart()
	FS_UserData.itemList:Restart()
	FS_UserData.story:ArcadeRestart()

	for i, tmpPlayer in pairs(self.hostPlayerList) do
		if tmpPlayer ~= nil then
			tmpPlayer:ClearStatusAll()
		end
	end

	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:EnterOrExitDarkForest(storyId, entranceId)
	local pattern = 0

	if BattleData.IsDarkForestScene() == false then
		self:GetGameController():RecordAchievement(MS_Achievement.AchievementIdType.FirstTimeIntoDarkFog, 1)
		self:GetGameController():RecordAchievement(MS_Achievement.AchievementIdType.FindAllDarkFog, 1, storyId)

		pattern = MS_StoryMonster.GetStoryRandomPattern(storyId)
	end

	FS_UserData.story:EnterOrExitForest(storyId, entranceId, pattern)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:EnterMazeStart(storyId, entranceId)
	for i, tmpPlayer in pairs(self.hostPlayerList) do
		if tmpPlayer ~= nil then
			tmpPlayer:ClearStatusAll()
		end
	end

	local pattern = 0

	FS_UserData.story:EnterMazeStart(storyId, entranceId, pattern)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:ExitMazeStart(storyId, entranceId)
	local pattern = 0

	FS_UserData.story:ExitMazeStart(storyId, entranceId, pattern)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:EnterMazeFirst(param1, param2)
	FS_UserData.story:ClearHeroShareStatusAll()
	FS_UserData.story:EnterNextMaze(param1)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:EnterNextMaze(param1, param2)
	self.hostPlayer:SaveStatus()
	FS_UserData.story:EnterNextMaze(param1)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:EnterNextFloorMaze(param1, param2)
	self.hostPlayer:SaveStatus()
	FS_UserData.story:NextMazeFloor()
	FS_UserData.story:EnterNextMaze(param1)
	ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
end

function ControllerMain:EnterNormal()
	if self.stateType == ControllerMain.StateType.Move then
		self:ChangeSubState(ControllerMain.MoveStep.Normal, 0, 0)
	end
end

function ControllerMain:EnterMenu(closeCamera, pause)
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.SetFrameRate(ControllerMain.GameMenuFrameRate, true)

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			FS_UserData.story:SetIsInMovieTime(true)
			FS_UserData.story:RecordStartMovieTime()
		end

		self:ChangeSubState(ControllerMain.MoveStep.Menu, 0, 0)
		AudioCtrl.DepressOrRiseAudio(true)

		if closeCamera == true then
			if not DebugRenderInIdle then
				self.cameraCtrl:Disable()
			end

			if self.controllerTimer ~= nil then
				self.controllerTimer:PauseTime(ControllerTimer.Priority.Menu)
			end

			AudioCtrl.SetPause(true)
		else
			if not DebugRenderInIdle then
				self:SetCameraLayerMaskToMovie(true)
			end

			if pause then
				if self.controllerTimer ~= nil then
					self.controllerTimer:PauseTime(ControllerTimer.Priority.Menu)
				end

				AudioCtrl.SetPause(true)
			end
		end

		self:CloseShadow()
		UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
		inputMgr:SetInMenuMode()
		inputMgr:SetPointerLocked(false)
	end
end

function ControllerMain:ExitMenu()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.RecoveryFrameRate()

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			FS_UserData.story:RecordEndMovieTime(FS_UserData.story:GetStoryId(), self.hostPlayer:GetHeroId())
			FS_UserData.story:SetIsInMovieTime(false)
		end

		self:ChangeSubState(ControllerMain.MoveStep.Normal, 0, 0)
		AudioCtrl.DepressOrRiseAudio(false)

		if not DebugRenderInIdle then
			self.cameraCtrl:Enable()
			self:SetCameraLayerMaskToMovie(false)
		end

		self:OpenShadow()

		if self.controllerTimer ~= nil then
			self.controllerTimer:ResumeTime(ControllerTimer.Priority.Menu)
		end

		AudioCtrl.SetPause(false)
		inputMgr:SetInGameMode()
		inputMgr:SetPointerLocked(true)
	end
end

function ControllerMain:IsInMenu()
	return self.stateSubType == ControllerMain.MoveStep.Menu
end

function ControllerMain:SetCameraLayerMaskToMovie(flg)
	if flg == true then
		if self.cameraCtrl ~= nil then
			self.cameraCtrl:SetLayerMask(CameraMain.CameraLayerMaskMovie)
		end

		if self.cameraShadow ~= nil then
			self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowMovieLayerMask)
		end
	else
		if self.cameraCtrl ~= nil then
			self.cameraCtrl:SetLayerMask(CameraMain.CameraLayerMask)
		end

		if self.cameraShadow ~= nil then
			self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowLayerMask)
		end
	end
end

function ControllerMain:EnterMovie()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.SetFrameRate(ControllerMain.GameMovieFrameRate, true)
		self.sceneList[self.sceneFocusName]:ShowPostProcess(false)
		self.cameraCtrl:Disable()

		if self.cameraShadow ~= nil then
			self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowMovieLayerMask)
		end

		if self.controllerBullet ~= nil then
			self.controllerBullet:ClearBulletAll()
		end

		if self.controllerCollider ~= nil then
			self.controllerCollider:ClearColliderAll()
		end

		self:ClearSceneTrapAll()
		self:ChangeSubState(ControllerMain.MoveStep.Movie, 0, 0)
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
		UIManager.SendMessage("Dialog", "StopDialog")
		UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
	end
end

function ControllerMain:ExitMovie()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.RecoveryFrameRate()
		self.cameraCtrl:Enable()
		self.sceneList[self.sceneFocusName]:ShowPostProcess(true)

		if self.cameraShadow ~= nil then
			self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowLayerMask)
		end

		self:ChangeSubState(ControllerMain.MoveStep.Normal, 0, 0)

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:ResetFollowingBase()
		end
	end
end

function ControllerMain:EnterTimeLineMove()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.SetFrameRate(ControllerMain.GameTimeLineFrameRate, true)

		if self.controllerBullet ~= nil then
			self.controllerBullet:ClearBulletAll()
		end

		if self.controllerCollider ~= nil then
			self.controllerCollider:ClearColliderAll()
		end

		self:ClearSceneTrapAll()
		UIManager.SendMessage("Mainmenu", "FadeOut", 0.7, true)
		UIManager.SendMessage("Dialog", "StopDialog")
		UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
		self.cameraCtrl:SetFollowingType(CameraMain.FollowingType.TimeLineMove)
		self:ChangeSubState(ControllerMain.MoveStep.TimeLineMove, 0, 0)
	end
end

function ControllerMain:EnterTimeLine()
	if self.stateType == ControllerMain.StateType.Move then
		if self.stateSubType ~= ControllerMain.MoveStep.TimeLineMove then
			ControllerMain.SetFrameRate(ControllerMain.GameTimeLineFrameRate, true)

			if self.controllerBullet ~= nil then
				self.controllerBullet:ClearBulletAll()
			end

			if self.controllerCollider ~= nil then
				self.controllerCollider:ClearColliderAll()
			end

			self:ClearSceneTrapAll()
			UIManager.SendMessage("Mainmenu", "FadeOut", 0.7, true)
			UIManager.SendMessage("Dialog", "StopDialog")
			UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
		end

		self.cameraCtrl:SetFollowingType(CameraMain.FollowingType.TimeLine)
		self:ChangeSubState(ControllerMain.MoveStep.TimeLine, 0, 0)
	end
end

function ControllerMain:ExitTimeLine()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.RecoveryFrameRate()

		if self.cameraShadow ~= nil then
			self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowLayerMask)
		end

		self:ChangeSubState(ControllerMain.MoveStep.Normal, 0, 0)

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:ApproachFollowingBase(false, CameraMain.CameraSmoothTimeMax)
		end

		UIManager.SendMessage("Mainmenu", "FadeIn", 0.7, true)
	end
end

function ControllerMain:ExitTimeLineLoadScene()
	if self.stateType == ControllerMain.StateType.LoadArea and self.stateSubType == ControllerMain.LoadAreaStep.SwitchSceneFinish then
		SystemHelper.LogTest("=======ExitTimeLineLoadScene=========")
		ControllerMain.RecoveryFrameRate()

		if self.cameraShadow ~= nil then
			self.cameraShadow.cullingMask = Common.GetOneBitLeftMove(ControllerMain.CameraShadowLayerMask)
		end

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:ApproachFollowingBase(false, CameraMain.CameraSmoothTimeMax)
		end

		UIManager.SendMessage("Mainmenu", "FadeIn", 0.7, true)
	end
end

function ControllerMain:EnterDialog()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.SetFrameRate(ControllerMain.GameDialogFrameRate, true)

		if self.controllerBullet ~= nil then
			self.controllerBullet:ClearBulletAll()
		end

		if self.controllerCollider ~= nil then
			self.controllerCollider:ClearColliderAll()
		end

		self:ClearSceneTrapAll()
		self:ChangeSubState(ControllerMain.MoveStep.Dialog, 0, 0)
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
		UIManager.SendMessage("Dialog", "StopDialog")
		UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
		AudioCtrl.DepressOrRiseAudio(true)
	end
end

function ControllerMain:ExitDialog()
	if self.stateType == ControllerMain.StateType.Move then
		ControllerMain.RecoveryFrameRate()
		self:ChangeSubState(ControllerMain.MoveStep.Normal, 0.2, 0)

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:ResetFollowingBase()
		end

		AudioCtrl.DepressOrRiseAudio(false)
	end
end

function ControllerMain:CreateHomeBase(modelName)
	local goHomeBase = GoCreate(modelName)

	goHomeBase.transform.parent = self.tfHomeBaseRoot
	goHomeBase.transform.localScale = Vector3.one
	goHomeBase.transform.localPosition = Vector3.zero
	goHomeBase.transform.localRotation = Quaternion.identity

	local HomeBase = require("LuaScript/Logic/Player/" .. modelName)

	self.homeBase = HomeBase:new(goHomeBase.transform, goHomeBase.transform, BattleData.AnimalId_HomeBase, modelName, 1, false)
end

function ControllerMain:CreatePlayerInPlay(heroId, storyMonsterId, nickName, level, heroExtData, heroPropertyData, index, teamId, isHost, monsterType, toBorn)
	local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)
	local heroIdNoSkin = BattleData.ConvertHeroIdWithoutSkin(heroId)
	local heroName = BattleData.GetHeroName(heroIdNoSkin)
	local modelName = StringHelper.ToUpperFirst(heroName)
	local goHost = GoCreate("Player" .. index)

	goHost.transform:SetParent(self.tfCharacterRoot)

	goHost.transform.localScale = Vector3.one
	goHost.transform.position = Vector3.zero
	goHost.transform.rotation = Quaternion.identity

	local tfCharaObj = self.loadCharacterManager:LoadCharacter(heroIdSkin, LoadCharacterManager.LoadType.Game)

	if tfCharaObj ~= nil then
		tfCharaObj:SetParent(goHost.transform)

		local Hero = require("LuaScript/Logic/Player/" .. modelName)
		local player = Hero:new(goHost.transform, tfCharaObj, index, heroName, teamId, isHost)

		if player ~= nil then
			player:SetStoryMonsterId(storyMonsterId)
			player:SetMemberId(0)
			player:SetHeroExtData(heroExtData)
			player:SetHeroPropertyData(heroPropertyData)
			player:SetLevel(level)
			player:SetNickName(nickName)
			player:SetMonsterType(monsterType)

			if monsterType == AnimalBase_Define.MonsterType.CallMonster then
				player:Born(AnimalBase_Define.BornReason.CallAnimal, toBorn)
			end

			self:AddPlayer(index, player)
			self:InitPlayer(player)

			return player
		end
	end

	return nil
end

function ControllerMain:CreatePlayer(heroId, roomPlayer)
	local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)
	local heroIdNoSkin = BattleData.ConvertHeroIdWithoutSkin(heroId)
	local tfChara = self.loadCharacterManager:LoadCharacter(heroIdSkin, LoadCharacterManager.LoadType.Game)

	if tfChara == nil then
		return
	end

	local heroName = BattleData.GetHeroName(heroIdNoSkin)
	local modelName = StringHelper.ToUpperFirst(heroName)
	local goHost = GoCreate("Player" .. roomPlayer:getIndex())
	local tfHost = goHost.transform

	tfHost:SetParent(self.tfCharacterRoot)

	tfHost.localScale = Vector3.one
	tfHost.position = Vector3.zero
	tfHost.rotation = Quaternion.identity

	tfChara:SetParent(tfHost)

	local Hero = require("LuaScript/Logic/Player/" .. modelName)
	local player

	if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) then
		player = Hero:new(tfHost, tfChara, roomPlayer:getIndex(), heroName, roomPlayer:getTeamId(), roomPlayer:isMine() == true or DebugAIControl == true)

		if roomPlayer:isMine() == true then
			table.insert(self.hostPlayerList, player)
			table.insert(self.roomPlayerMineList, roomPlayer)
		end
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Guard) then
		player = Hero:new(tfHost, tfChara, roomPlayer:getIndex(), heroName, roomPlayer:getTeamId(), roomPlayer:isMine() == true or DebugAIControl == true)

		if roomPlayer:isMine() == true then
			table.insert(self.hostPlayerList, player)
			table.insert(self.roomPlayerMineList, roomPlayer)
		end
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		player = Hero:new(tfHost, tfChara, roomPlayer:getIndex(), heroName, roomPlayer:getTeamId(), roomPlayer:isMine() == true or roomPlayer:isMyTeam() == true or DebugAIControl == true)

		if roomPlayer:isMine() == true or roomPlayer:isMyTeam() == true then
			table.insert(self.hostPlayerList, player)
			table.insert(self.roomPlayerMineList, roomPlayer)
		end
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Custom) then
		player = Hero:new(tfHost, tfChara, roomPlayer:getIndex(), heroName, roomPlayer:getTeamId(), roomPlayer:isMine() == true or DebugAIControl == true)

		if roomPlayer:isMine() == true then
			table.insert(self.hostPlayerList, player)
			table.insert(self.roomPlayerMineList, roomPlayer)
		end
	end

	if player ~= nil then
		player:SetMemberId(roomPlayer:getMemberIndex())
		player:SetNickName(nil)
		self:AddPlayer(roomPlayer:getIndex(), player)
	end
end

function ControllerMain:InitPlayer(animal)
	if animal ~= nil then
		animal:SetScene(self.sceneList[self.sceneFocusName])
		animal:SetControllerBullet(self.controllerBullet)
		animal:SetControllerCollider(self.controllerCollider)
		animal:SetControllerTimer(self.controllerTimer)
		animal:SetSceneCamera(self.cameraCtrl)
		animal:Ready()
		animal:CreateHeadInfo()
	end
end

function ControllerMain:GetGameController()
	return self.controllerGameMode
end

function ControllerMain:GetHomeBase()
	return self.homeBase
end

function ControllerMain:GetPlayerList()
	return self.playerList
end

function ControllerMain:FindPlayerById(animalId)
	if animalId > 0 and self.playerList[animalId] ~= nil then
		return self.playerList[animalId]
	end

	return nil
end

function ControllerMain:FindPlayerByStoryMonsterId(storyMonsterId)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and storyMonsterId > 0 and self.playerList ~= nil then
		for i, tmpPlayer in pairs(self.playerList) do
			if tmpPlayer ~= nil and tmpPlayer:GetStoryMonsterId() == storyMonsterId then
				return tmpPlayer
			end
		end
	end

	return nil
end

function ControllerMain:AddPlayer(animalId, animal)
	if self.playerList[animalId] == nil then
		self.playerList[animalId] = animal

		local teamId = animal:GetTeamId()

		if self.teamList[teamId] == nil then
			self.teamList[teamId] = {}
		end

		self.teamList[teamId][animalId] = animal
	end
end

function ControllerMain:RemovePlayerDelay(animalId)
	if self.playerDeleteList == nil then
		self.playerDeleteList = {}
	end

	self.playerDeleteList[animalId] = 1
end

function ControllerMain:RemovePlayer(animalId)
	if self.playerList[animalId] ~= nil then
		local animal = self.playerList[animalId]

		for i, tmpPlayer in pairs(self.playerList) do
			if i ~= animalId and tmpPlayer ~= nil then
				tmpPlayer:HandleTargetExit(animal)
			end
		end

		if self.hostPlayerLockTargetLast == animal then
			self.hostPlayerLockTargetLast = nil
		end

		if self.controllerBullet ~= nil then
			self.controllerBullet:HandleTargetExit(animal)
		end

		local teamId = animal:GetTeamId()

		if self.teamList[teamId] ~= nil then
			self.teamList[teamId][animalId] = nil
		end

		self.playerList[animalId]:ExitBattle()
		self.playerList[animalId]:Exit()

		self.playerList[animalId] = nil

		UIManager.SendMessage("HeadInfo", "RemoveInfo", animalId)
	end
end

function ControllerMain:GetTeamList(teamId)
	return self.teamList[teamId]
end

function ControllerMain:GetEnemyList(teamId)
	local ret = {}

	for k, list in pairs(self.teamList) do
		if k ~= teamId and list ~= nil then
			table.merge(ret, list)
		end
	end

	return ret
end

function ControllerMain:GetControllerTimer()
	return self.controllerTimer
end

function ControllerMain:GetControllerBullet()
	return self.controllerBullet
end

function ControllerMain:GetControllerCollider()
	return self.controllerCollider
end

function ControllerMain:GetControllerShell()
	return self.controllerShell
end

function ControllerMain:FindShellById(shellId)
	if self.controllerShell ~= nil then
		return self.controllerShell:GetShell(shellId)
	end

	return nil
end

function ControllerMain:GetAutoLockTarget(nowPos)
	if self.controllerShell ~= nil then
		return self.controllerShell:GetAutoLockTarget(nowPos)
	end

	return nil
end

function ControllerMain:IsFriend(animalId)
	local animal = self.playerList[animalId]

	if animal == nil then
		return false
	end

	if self.hostPlayer:IsMyTeam(animal:GetTeamId()) == true then
		return true
	end

	return false
end

function ControllerMain:GetHpDegree(animalId)
	local animal = self.playerList[animalId]

	if animal == nil then
		return 2
	end

	local animalVal = animal:GetValue()

	return animalVal:GetHpDegree()
end

function ControllerMain:UpdateSkin()
	for k, tmpPlayer in pairs(self.playerList) do
		if tmpPlayer ~= nil then
			tmpPlayer:UpdateSkin()
		end
	end
end

function ControllerMain:GetTeamPlayer(isMyTeam)
	return FS_Battle_MatchGame.GetTeamPlayer(isMyTeam)
end

function ControllerMain.OnMatchGameLoad(buffer)
	local sceneController = ST_Main.GetSceneController()

	if sceneController.stateType == ControllerMain.StateType.Load then
		NI_BattleRoom.ParseLoadProgress(buffer)
	end
end

function ControllerMain.OnMatchGameStart(buffer)
	local sceneController = ST_Main.GetSceneController()

	if sceneController.stateType == ControllerMain.StateType.Load then
		sceneController:GoToBattle()
	end
end

function ControllerMain:EnterMove()
	self:ChangeSubState(ControllerMain.MoveStep.Ready, 0, 0)

	self.controllerBullet = ControllerBullet:new()
	self.controllerCollider = ControllerCollider:new()
	self.controllerTimer = ControllerTimer:new()
	self.timeLineSwitchPlayerStart = false

	for i, tmpPlayer in pairs(self.playerList) do
		self:InitPlayer(tmpPlayer)
	end

	self:LoadSaveData()

	if self.cameraCtrl ~= nil then
		self.cameraCtrl:SetCameraClippingPlane(0.1, 2000)
		self.cameraCtrl:SetFieldOfView(CameraMain.CameraFieldOfView)
		self.cameraCtrl:SetHostPlayer(self.hostPlayer, true)
		self.cameraCtrl:SetMode(CameraMain.ModeType.Following)
		self.cameraCtrl:SetControllerTimer(self.controllerTimer)
	end

	self:CreateShadow()

	self.touchSkillButton = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) == true then
		self.controllerGameMode = ControllerOccupyMode:new()
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		self:CreateHomeBase("hero90001")

		if self.homeBase ~= nil then
			self:InitPlayer(self.homeBase)
		end

		self.controllerGameMode = ControllerGuardMode:new()
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.controllerGameMode = ControllerStoryMode:new()
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true then
		self.controllerGameMode = ControllerFreeMode:new()
	else
		SystemHelper.LogError("=============RuleMode error !!!!!!!!!!!!")
	end

	self.joystickControllerForMove:SetEnable(true)
	self.joystickControllerForRotation:SetEnable(true)

	if self.sceneList ~= nil then
		for _, tmpScene in pairs(self.sceneList) do
			if tmpScene ~= nil then
				tmpScene:Start()
			end
		end
	end

	for i, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:Start()
	end

	self.controllerGameMode:Start()

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		self.homeBase:Start()
	end

	self:UpdateQuality(true)

	self.startGame = true

	if DebugBehaviorLog == true then
		LS_BehaviorLog.CreateKey()
		LS_BehaviorLog.Log(LS_BehaviorLog.Type.GameMode, FS_UserData.story.storyMode, FS_UserData.story:GetDifficulty())
	end
end

function ControllerMain.OnBattleFrame(buffer)
	NI_BattleBattle.ParseFrameResponse(buffer)
end

function ControllerMain:IsGameStart()
	return self.startGame
end

function ControllerMain:DragSkillInit()
	self.dragInitPosX = 0
	self.dragInitPosY = 0
	self.dragAngleHorizontal = 0
	self.dragAngleVertical = 0
end

function ControllerMain:DragSkillDirection(delta, button)
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	self.dragAngleHorizontal = Mathf.Floor(delta.x * AnimalBase_Define.AimChangeAngleMaxHorizontal)
	self.dragAngleVertical = Mathf.Floor(delta.y * AnimalBase_Define.AimChangeAngleMaxVertical)
end

function ControllerMain:ClearSkillButton()
	self.touchSkillButton = 0

	UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")
end

function ControllerMain:PressDownSkillButton(button)
	if self.touchSkillButton > 0 then
		self:PressUpSkillButton(self.touchSkillButton)
	end

	if self.touchSkillButton <= 0 then
		self.touchSkillButton = button

		local tmpPlayer = self.hostPlayer

		if DebugAIControl == true and self.hostFakePlayer ~= nil then
			tmpPlayer = self.hostFakePlayer
		end

		if tmpPlayer ~= nil then
			tmpPlayer:LongPressSkillButton(button)
		end
	end
end

function ControllerMain:PressUpSkillButton(button)
	if self.touchSkillButton == button then
		self.touchSkillButton = 0

		local tmpPlayer = self.hostPlayer

		if DebugAIControl == true and self.hostFakePlayer ~= nil then
			tmpPlayer = self.hostFakePlayer
		end

		if tmpPlayer ~= nil then
			tmpPlayer:PressUpSkillButton(button)
		end
	end
end

function ControllerMain:PressSkillButton(type, button, delta)
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if DebugDontShowDebugButton == false then
		if type == ControllerMain.PressType.PressDown then
			self:PressDownSkillButton(button)
		elseif type == ControllerMain.PressType.PressUp then
			self:PressUpSkillButton(button)
		end

		self:DragSkillDirection(delta, button)
	end
end

function ControllerMain:SetMoveDirection(dir, touch)
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if self.cameraCtrl ~= nil then
		local forward = self.cameraCtrl:GetCameraForward():Clone()

		forward.y = 0

		forward:SetNormalize()

		local right = Vector3.Cross(Vector3.s_up, forward)

		right.y = 0

		right:SetNormalize()
		forward:Mul(dir.y)
		right:Mul(dir.x)
		forward:Add(right)

		forward.y = dir.y

		if DebugAIControl == true and self.hostFakePlayer ~= nil then
			self.hostFakePlayer:SetJoystickMoveDir(forward, touch)
		else
			self.hostPlayer:SetJoystickMoveDir(forward, touch)
		end

		forward = nil
		right = nil
	end
end

function ControllerMain:SetCursorMove(dir, touch)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "MapView" or lName == "MapInfo" then
		UIManager.SendMessage("MapView", "SetCursorMove", dir.x, dir.y, touch)
	elseif lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" then
		UIManager.SendMessage("PlayerInfo", "SetCursorMove", dir.x, dir.y, touch)
	end
end

function ControllerMain:BeginViewRotate()
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if self.cameraCtrl ~= nil then
		self.viewRotateHorizontal = 0
		self.viewRotateVertical = 0
		self.rotateInputType = ControllerMain.RotateInputType.Unknown

		self.cameraCtrl:RotateFollowCameraBegin()
	end
end

function ControllerMain:EndViewRotate()
	if self.cameraCtrl ~= nil then
		self.viewRotateHorizontal = 0
		self.viewRotateVertical = 0
		self.rotateInputType = ControllerMain.RotateInputType.Unknown

		self.cameraCtrl:RotateFollowCameraEnd()
	end
end

function ControllerMain:SetViewRotate(delta, isScreen, isKM)
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if self.cameraCtrl ~= nil then
		local sceneController = ST_Main.GetSceneController()

		if sceneController ~= nil and sceneController:IsLockPlayer() then
			if delta.x < -10 then
				LS_Setting.OnKeyDownList[KMKey.LCKPRV] = true
				LS_Setting.OnKeyDownList[KMKey.LCKNXT] = false
			elseif delta.x > 10 then
				LS_Setting.OnKeyDownList[KMKey.LCKPRV] = false
				LS_Setting.OnKeyDownList[KMKey.LCKNXT] = true
			else
				LS_Setting.OnKeyDownList[KMKey.LCKPRV] = false
				LS_Setting.OnKeyDownList[KMKey.LCKNXT] = false
			end
		elseif self.cameraCtrl:IsRotatingFollowCamera() == true then
			local deltaT = ControllerMain.GetLogicDeltaTime()

			if isScreen then
				local rate = LS_Setting.sensitivity * 1.6 / 100

				self.viewRotateHorizontal = 360 * delta.x * rate * LS_Setting.camera.horizontal / SystemHelper.GetScreenWidth()
				self.viewRotateVertical = 90 * delta.y * rate * LS_Setting.camera.vertical / SystemHelper.GetScreenHeight()
				self.rotateInputType = ControllerMain.RotateInputType.Screen
			elseif isKM then
				local rate = 0.85 * (LS_Setting.sensitivity * deltaT)

				self.viewRotateHorizontal = delta.x * rate * LS_Setting.camera.horizontal
				self.viewRotateVertical = delta.y * rate * LS_Setting.camera.vertical
				self.rotateInputType = ControllerMain.RotateInputType.Mouse
			else
				local rate = 1.2 * (LS_Setting.sensitivity * deltaT)

				self.viewRotateHorizontal = delta.x * rate * LS_Setting.camera.horizontal
				self.viewRotateVertical = delta.y * rate * LS_Setting.camera.vertical
				self.rotateInputType = ControllerMain.RotateInputType.Joystick
			end
		end
	end
end

function ControllerMain:InitCrow()
	local crowTf = GoFind("CrowRoot").transform:Find("crow").transform
	local crowTemplate = require("LuaScript/Logic/Other/Crow")

	self.crow = crowTemplate:new(self.hostPlayer, self.cameraCtrl, crowTf)
end

function ControllerMain:GetCrow()
	return self.crow
end

function ControllerMain:InitHostPlayer()
	local heroId = BattleData.GetHostHeroId(1)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		heroId = FS_UserData.story:GetSelectHeroIdNow()
	end

	local tmpHost, tmpHostIndex = self:GetHostPlayerById(heroId)

	if tmpHost ~= nil and tmpHostIndex > 0 then
		self.hostPlayer = tmpHost

		self.hostPlayer:SetHostBack(false)

		if self.roomPlayerMineList ~= nil and self.roomPlayerMineList[tmpHostIndex] ~= nil then
			self.hostPlayerUserId = self.roomPlayerMineList[tmpHostIndex].userId
		end
	end
end

function ControllerMain:LoadSaveData()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local loadProperty = false
		local storyId = FS_UserData.story:GetStoryId()

		if MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
			loadProperty = true
		elseif FS_UserData.story:IsFirstLoad() == true then
			loadProperty = true
		end

		if loadProperty == true then
			for i = 1, #self.hostPlayerList do
				local player = self.hostPlayerList[i]

				if player ~= nil then
					player:GetValue():LoadSaveProperty()
				end
			end
		end

		self.hostPlayer:LoadStatus()
	end
end

function ControllerMain:ChangeHostPlayer(newPlayer)
	for i = 1, #self.hostPlayerList do
		local player = self.hostPlayerList[i]

		if player ~= nil and player == self.hostPlayer then
			local oldIndex = player:GetAnimalId()

			self.hostPlayerList[i] = newPlayer
			self.hostPlayer = newPlayer

			if self.cameraCtrl ~= nil then
				self.cameraCtrl:SetHostPlayer(self.hostPlayer, false)
			end

			self.controllerGameMode:UpdateHostPlayer(false)

			break
		end
	end
end

function ControllerMain:GetHostPlayer()
	return self.hostPlayer
end

function ControllerMain:GetHostPlayerDirection()
	if self.hostPlayer ~= nil then
		return self.hostPlayer:GetForward()
	end

	return Vector3.s_forward
end

function ControllerMain:GetHostPlayerModelName()
	if self.hostPlayer == nil then
		return ""
	end

	return self.hostPlayer.modelName
end

function ControllerMain:GetHostPlayerHeroId()
	if self.hostPlayer ~= nil then
		return self.hostPlayer:GetHeroId()
	end

	return 0
end

function ControllerMain:HeroAttribUpdate(isStart)
	for k, v in pairs(self.hostPlayerList) do
		if v:GetValue() then
			v:GetValue():RefreshPropertyAll(isStart, false, nil)
		end
	end
end

function ControllerMain:HostPlayerAllRest()
	for k, v in pairs(self.hostPlayerList) do
		if v:GetValue() then
			v:GetValue():SetPropertyToMax(MS_HeroData.Property.Hp)
			v:GetValue():SetPropertyToMax(MS_HeroData.Property.Mp)
			v:GetValue():SetPropertyToMax(MS_HeroData.Property.Energy)
			v:GetValue():SetPropertyToMax(MS_HeroData.Property.San)
		end
	end
end

function ControllerMain:GetHostPlayerListNum()
	return #self.hostPlayerList
end

function ControllerMain:GetHostPlayerByIndex(index)
	if self.hostPlayerList[index] ~= nil then
		return self.hostPlayerList[index]
	end

	return nil
end

function ControllerMain:GetHostPlayerById(heroId)
	for i = 1, #self.hostPlayerList do
		local player = self.hostPlayerList[i]

		if player ~= nil and player:GetHeroId() == heroId then
			return player, i
		end
	end

	return nil, 0
end

function ControllerMain:GetHostPlayerByAnimalId(animalId)
	for i = 1, #self.hostPlayerList do
		local player = self.hostPlayerList[i]

		if player ~= nil and player:GetAnimalId() == animalId then
			return player, i
		end
	end

	return nil, 0
end

function ControllerMain:IsHostPlayerDead()
	if self.hostPlayer == nil or self.hostPlayer:IsDead() == false then
		return false
	end

	return true
end

function ControllerMain:IsHostPlayerAllDead()
	if self:IsHostPlayerDead() == false then
		return false
	end

	return self:IsSecondaryHostPlayerDead()
end

function ControllerMain:IsSecondaryHostPlayerDead()
	local heroId = FS_UserData.story:GetNextHeroId()

	if heroId > 0 and self.hostPlayer:GetHeroId() ~= heroId and FS_UserData.story:CheckHeroEnable(heroId) then
		local tmpHost, tmpHostIndex = self:GetHostPlayerById(heroId)

		if tmpHost ~= nil and tmpHost:IsDead() == false then
			return false
		end
	end

	return true
end

function ControllerMain:GetSecondaryHostPlayer()
	local heroId = FS_UserData.story:GetNextHeroId()

	if heroId > 0 and self.hostPlayer:GetHeroId() ~= heroId and FS_UserData.story:CheckHeroEnable(heroId) then
		local tmpHost, tmpHostIndex = self:GetHostPlayerById(heroId)

		if tmpHost ~= nil then
			return tmpHost
		end
	end

	return nil
end

function ControllerMain:GetHostPlayerState(heroId)
	local curList = {}
	local maxList = {}

	for i = 1, #self.hostPlayerList do
		local player = self.hostPlayerList[i]

		if player ~= nil and player:GetHeroId() == heroId then
			curList[MS_HeroData.Property.Hp] = math.floor(player:GetValue():GetProperty(MS_HeroData.Property.Hp))
			maxList[MS_HeroData.Property.Hp] = math.floor(player:GetValue():GetPropertyMax(MS_HeroData.Property.Hp))
			curList[MS_HeroData.Property.Energy] = math.floor(player:GetValue():GetProperty(MS_HeroData.Property.Energy))
			maxList[MS_HeroData.Property.Energy] = math.floor(player:GetValue():GetPropertyMax(MS_HeroData.Property.Energy))
			curList[MS_HeroData.Property.Mp] = math.floor(player:GetValue():GetProperty(MS_HeroData.Property.Mp))
			maxList[MS_HeroData.Property.Mp] = math.floor(player:GetValue():GetPropertyMax(MS_HeroData.Property.Mp))

			break
		end
	end

	return curList, maxList
end

function ControllerMain:GetTalentValue(animalId, type, param1, param2, level)
	local player, index = self:GetHostPlayerByAnimalId(animalId)

	if player ~= nil then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local tmpHeroData = FS_UserData.heroList:GetHero(player:GetHeroId())

			if tmpHeroData ~= nil then
				if level ~= nil and level > 0 then
					return tmpHeroData:GetHeroTalentValueByLevel(type, param1, param2, level)
				end

				return tmpHeroData:GetHeroTalentValue(type, param1, param2)
			end
		else
			return MS_HeroTalent.GetHeroTalentValue(player:GetHeroId(), type, param1, param2)
		end
	elseif type == MS_HeroTalent.Type.SkillOpen or type == MS_HeroTalent.Type.SkillBeatBack then
		return 1
	end

	return 0
end

function ControllerMain:UpdateSwitchHostPlayer()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
			return
		end

		local showFlg = false
		local storyId = FS_UserData.story:GetStoryId()

		if MS_StoryList.IsStoryDream(storyId) == false then
			local inHostWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.HostWhisper)
			local inCrowWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.CrowWhisper)

			if inHostWhisper == false and inCrowWhisper == false then
				showFlg = self.hostPlayer:IsSwitchPlayerReady()
			end
		end

		local heroId = 0
		local isDead = false
		local nextHeroId = FS_UserData.story:GetNextHeroId()

		if nextHeroId > 0 and nextHeroId ~= self.hostPlayer:GetHeroId() and FS_UserData.story:CheckHeroEnable(nextHeroId) then
			local tmpHost, tmpHostIndex = self:GetHostPlayerById(nextHeroId)

			if tmpHost ~= nil then
				heroId = nextHeroId

				if tmpHost:IsDead() == false then
					isDead = false
				else
					isDead = true
					showFlg = false
				end
			end
		end

		UIManager.SendMessage("Mainmenu", "ShowButtonChangeHero", heroId, not showFlg, isDead)
	end
end

function ControllerMain:StartSwitchHostPlayer()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
			return
		end

		local inHostWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.HostWhisper)
		local inCrowWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.CrowWhisper)

		if inHostWhisper == true or inCrowWhisper == true then
			return
		end

		if self.hostPlayer:IsSwitchPlayerReady() == false then
			return
		end

		local nextHeroId = FS_UserData.story:GetNextHeroId()

		if nextHeroId > 0 and nextHeroId ~= self.hostPlayer:GetHeroId() and FS_UserData.story:CheckHeroEnable(nextHeroId) then
			local tmpHost, tmpHostIndex = self:GetHostPlayerById(nextHeroId)

			if tmpHost ~= nil and tmpHost:IsDead() == false then
				self:SetActionAssist(ControllerMain.AssistButton.Change)
				AudioCtrl.SetUIAudio("exchange")
				UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
			end
		end
	end
end

function ControllerMain:SwitchHostPlayer(selectHeroId, switchType, bossMode, propertyRateList)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		local tmpIndex = 0
		local heroId = selectHeroId

		if heroId <= 0 then
			heroId = FS_UserData.story:GetNextHeroId()
		end

		local rebornFlg = false

		if heroId > 0 and self.hostPlayer:GetHeroId() ~= heroId and FS_UserData.story:CheckHeroEnable(heroId) then
			local tmpHost, tmpHostIndex = self:GetHostPlayerById(heroId)

			if tmpHost ~= nil then
				if propertyRateList ~= nil and propertyRateList[MS_HeroData.Property.Hp] ~= nil and propertyRateList[MS_HeroData.Property.Hp] > 0 and tmpHost:IsDead() == true then
					tmpHost:Reborn(true, propertyRateList)

					rebornFlg = true
				end

				if tmpHost:IsDead() == false then
					tmpIndex = tmpHostIndex
				end
			end
		end

		if tmpIndex > 0 and FS_UserData.story:SelectHeroId(heroId) == true then
			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true then
				FS_UserData.story:RecordStageTime(FS_UserData.story:GetStoryId(), self:GetHostPlayerHeroId())
				FS_UserData.story:ResetAllStageTime()
				FS_UserData.story:RecordStageTime(FS_UserData.story:GetStoryId(), heroId)

				if self.hostPlayer:IsHeroSanNotNormal(0) then
					FS_UserData.story:RecordDuration(FS_PlayerBehavior.RecordType.InSanDuration, false, self:GetHostPlayerHeroId())
				end
			end

			local hostPlayerOld = self.hostPlayer

			UIManager.SendMessage("Mainmenu", "ResetHeroPanel", hostPlayerOld:GetHeroId(), hostPlayerOld:GetAnimalId())

			self.hostPlayer = self.hostPlayerList[tmpIndex]

			if self.hostPlayer:IsHeroSanNotNormal(0) then
				FS_UserData.story:RecordDuration(FS_PlayerBehavior.RecordType.InSanDuration, true, heroId)
			end

			local sanPer = hostPlayerOld:GetValue():GetSanPropertyPercent()

			self.hostPlayerUserId = self.roomPlayerMineList[tmpIndex].userId

			self.hostPlayer:SetRebornPosition(hostPlayerOld:GetRebornPosition())
			self.hostPlayer:SetRebornLook(hostPlayerOld:GetRebornLook())

			if switchType == ControllerMain.SwitchType.ChangeNextDead then
				self.hostPlayer:SetPosByWorldPos(hostPlayerOld:GetRebornPosition(), true)

				local target = GameAI.GetClosestTarget(self.hostPlayer)

				if target ~= nil then
					local lookDir = target:GetPosByWorldPos() - hostPlayerOld:GetRebornPosition()

					lookDir.y = 0

					self.hostPlayer:LookAt(lookDir, true)
				else
					self.hostPlayer:LookAt(hostPlayerOld:GetRebornLook(), true)
				end
			else
				self.hostPlayer:SetPosByWorldPos(hostPlayerOld:GetPosByWorldPos(), true)
				self.hostPlayer:LookAt(hostPlayerOld:GetForward(), true)
			end

			if switchType == ControllerMain.SwitchType.ChangeNext then
				hostPlayerOld:SaveStatus()
			end

			self.hostPlayer:UpdatePositionLast()
			self.hostPlayer:SwitchReady(true)
			hostPlayerOld:SwitchReady(false)
			hostPlayerOld:ResetState()
			hostPlayerOld:SetHostBack(true)
			hostPlayerOld:Hide()
			self.hostPlayer:SetHostBack(false)

			if bossMode == true and rebornFlg == false then
				self.hostPlayer:GetValue():SetSanPropertyPercentMax(sanPer)
			end

			self.hostPlayer:Show()
			self.hostPlayer:SetUI()

			if self.cameraCtrl ~= nil then
				self.cameraCtrl:SetHostPlayer(self.hostPlayer, true)
			end

			if switchType == ControllerMain.SwitchType.ChangeNextDead then
				self.controllerGameMode:UpdateHostPlayer(true)
			else
				self.controllerGameMode:UpdateHostPlayer(false)
			end

			self.hostPlayer:ResetState()
			self.hostPlayer:LoadStatus()

			if switchType == ControllerMain.SwitchType.Bonefire then
				self:SetActionAssist(ControllerMain.AssistButton.BonefireEnd)
			elseif selectHeroId <= 0 then
				if rebornFlg == true then
					self:SetActionAssist(ControllerMain.AssistButton.ChangeRebornEnd)
				else
					self:SetActionAssist(ControllerMain.AssistButton.ChangeEnd)
				end
			end

			UIManager.SendMessage("PlayerInfo", "ReLoadCurrentHero")
		end
	end
end

function ControllerMain:StartSwitchHostPlayerInTimeLine()
	local nextHeroId = FS_UserData.story:GetNextHeroId()

	if nextHeroId > 0 and nextHeroId ~= self.hostPlayer:GetHeroId() and FS_UserData.story:CheckHeroEnable(nextHeroId) then
		local tmpHost, tmpHostIndex = self:GetHostPlayerById(nextHeroId)

		if tmpHost ~= nil and tmpHost:IsDead() == false then
			tmpHost:Show()

			self.timeLineSwitchPlayerStart = true

			return tmpHost
		end
	end
end

function ControllerMain:EndSwitchHostPlayerInTimeLine()
	local nextHeroId = FS_UserData.story:GetNextHeroId()

	if nextHeroId > 0 and nextHeroId ~= self.hostPlayer:GetHeroId() and FS_UserData.story:CheckHeroEnable(nextHeroId) then
		local tmpHost, tmpHostIndex = self:GetHostPlayerById(nextHeroId)

		if tmpHost ~= nil and tmpHost:IsDead() == false then
			local hostPlayerOld = self.hostPlayer

			UIManager.SendMessage("Mainmenu", "ResetHeroPanel", hostPlayerOld:GetHeroId(), hostPlayerOld:GetAnimalId())

			self.hostPlayer = self.hostPlayerList[tmpHostIndex]
			self.hostPlayerUserId = self.roomPlayerMineList[tmpHostIndex].userId

			hostPlayerOld:ResetState()
			hostPlayerOld:SetHostBack(true)
			hostPlayerOld:Hide()
			self.hostPlayer:SetHostBack(false)
			self.hostPlayer:SetUI()
			self.controllerGameMode:UpdateHostPlayer(false)

			self.timeLineSwitchPlayerStart = false

			UIManager.SendMessage("PlayerInfo", "ReLoadCurrentHero")

			return true
		end
	end

	return false
end

function ControllerMain:DebugHostPlayer()
	if self.hostFakePlayer ~= nil then
		return self.hostFakePlayer
	end

	return self.hostPlayer
end

function ControllerMain:DebugChangeHostFakePlayer()
	if DebugAIControl == false then
		return
	end

	if self.hostFakePlayer == nil then
		self.hostFakePlayer = self.hostPlayer
	end

	local next = false
	local oldFakePlayer = self.hostFakePlayer

	self.hostFakePlayer = nil

	local firstFakePlayer

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		if firstFakePlayer == nil and tmpPlayer:IsDead() == false and tmpPlayer:IsShow() == true then
			firstFakePlayer = tmpPlayer
		end

		if next == false then
			if tmpPlayer == oldFakePlayer then
				next = true
			end
		elseif tmpPlayer ~= oldFakePlayer and tmpPlayer:IsDead() == false and tmpPlayer:IsShow() == true then
			self.hostFakePlayer = tmpPlayer

			if self.cameraCtrl ~= nil then
				self.cameraCtrl:SetHostPlayer(self.hostFakePlayer, true)
			end

			return
		end
	end

	if self.hostFakePlayer == nil then
		self.hostFakePlayer = firstFakePlayer

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:SetHostPlayer(self.hostFakePlayer, true)
		end
	end
end

function ControllerMain:SetActionLockPlayer()
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if self.cameraCtrl ~= nil then
		if self.cameraCtrl:IsLockSkillingPlayer() == true then
			self.cameraCtrl:SwitchSkillingPlayerLock()
		else
			local lockPlayer = self.hostPlayer:GetLockPlayer()

			if lockPlayer ~= nil then
				if DebugAIControl == true and self.hostFakePlayer ~= nil then
					self.hostFakePlayer:SetLockId(0 - lockPlayer:GetAnimalId())
				else
					self.hostPlayer:SetLockId(0 - lockPlayer:GetAnimalId())
				end
			else
				lockPlayer = self:ChooseLockPlayer()

				if lockPlayer ~= nil then
					if DebugAIControl == true and self.hostFakePlayer ~= nil then
						self.hostFakePlayer:SetLockId(lockPlayer:GetAnimalId())
					else
						self.hostPlayer:SetLockId(lockPlayer:GetAnimalId())
					end
				elseif self.cameraCtrl:IsFollowingBaseNow() == true and self.cameraCtrl:IsSmoothing() == false then
					self.cameraCtrl:ReturnFollowingBase(false, true, CameraMain.CameraSmoothTimeMax)
				end
			end
		end
	end
end

function ControllerMain:ChangeActionLockPlayer(dragX, dragY)
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return
	end

	local lockPlayer = self:ChangeLockPlayer(dragX, dragY)

	if lockPlayer ~= nil then
		if DebugAIControl == true and self.hostFakePlayer ~= nil then
			self.hostFakePlayer:SetLockId(lockPlayer:GetAnimalId())
		else
			self.hostPlayer:SetLockId(lockPlayer:GetAnimalId())
		end
	end
end

function ControllerMain:UpdateLockPlayer()
	local camera = self.cameraCtrl

	if camera == nil then
		return
	end

	local lockPlayer = self.hostPlayer:GetLockPlayer()

	camera:LockPlayer(lockPlayer)

	if camera:GetLockPlayer() ~= nil then
		UIManager.SendMessage("Mainmenu", "SetLockButtonState", MainmenuCtrl.LockButtonState.LockedOn)

		if DebugShowCtrlPanel == true and DebugShowUnitInfo == true then
			UIManager.SendMessage("Debug", "SetPanelTarget", DebugCtrl.Panel.Target, camera:GetLockPlayer())
		end
	else
		if camera:IsLockSkillingPlayer() == true then
			UIManager.SendMessage("Mainmenu", "SetLockButtonState", MainmenuCtrl.LockButtonState.Enabled)
		else
			local ret = self:CheckHaveLockPlayer()

			if ret == true then
				UIManager.SendMessage("Mainmenu", "SetLockButtonState", MainmenuCtrl.LockButtonState.Enabled)
			else
				UIManager.SendMessage("Mainmenu", "SetLockButtonState", MainmenuCtrl.LockButtonState.Disabled)
			end
		end

		if DebugShowCtrlPanel == true and DebugShowUnitInfo == true then
			UIManager.SendMessage("Debug", "SetPanelTarget", DebugCtrl.Panel.Target, nil)
		end
	end
end

function ControllerMain:ChangeLockPlayer(dragX, dragY)
	local screenWidth = SystemHelper.GetScreenWidth()
	local screenHeight = SystemHelper.GetScreenHeight()
	local retPlayer
	local lockPlayer = self.hostPlayer:GetLockPlayer()

	if lockPlayer ~= nil and self.hostPlayer ~= nil and self.cameraCtrl ~= nil and self.hostPlayer:IsDead() == false then
		local camForward = self.cameraCtrl:GetCameraRealForward()
		local camPos = self.cameraCtrl:GetCameraRealPosition()
		local lockPos = lockPlayer:GetGravityCenterPosition()

		if lockPlayer.parasitic > 0 then
			lockPos = lockPlayer:GetAimPosition()
		end

		local lockScreenPos = self.cameraCtrl:WorldToScreenPoint(lockPos)
		local dragDir = Vector2.New(dragX, dragY)

		if MathHelper.IsZero(dragDir.sqrMagnitude) == false then
			dragDir:SetNormalize()
		end

		local enemyList = self:GetEnemyList(self.hostPlayer:GetTeamId())
		local angleMin = 999

		for k, enemy in pairs(enemyList) do
			if enemy ~= lockPlayer then
				local tmpAnimal, forceLock = self.hostPlayer:CheckLockPlayer(enemy, false)

				if tmpAnimal ~= nil then
					local tmpPos = tmpAnimal:GetGravityCenterPosition()

					if tmpAnimal.parasitic > 0 then
						tmpPos = tmpAnimal:GetAimPosition()
					end

					local tmpDir = tmpPos - camPos

					if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
						tmpDir:SetNormalize()
					end

					local tmpRet = Vector3.Dot(camForward, tmpDir)

					if tmpRet >= 0 then
						local tmpScreenPos = self.cameraCtrl:WorldToScreenPoint(tmpPos)
						local tmpScreenDir = tmpScreenPos - lockScreenPos

						if MathHelper.IsZero(tmpScreenDir.sqrMagnitude) == false then
							tmpScreenDir:SetNormalize()
						end

						local tmpScreenRet = Vector2.Dot(tmpScreenDir, dragDir)

						if tmpScreenRet >= 0 and tmpScreenPos.x >= 0 and screenWidth >= tmpScreenPos.x and tmpScreenPos.y >= 0 and screenHeight >= tmpScreenPos.y then
							local tmpAngle = Vector2.Angle(dragDir, tmpScreenDir)

							if tmpAngle < angleMin then
								retPlayer = enemy
								angleMin = tmpAngle
							end
						end

						tmpScreenPos = nil
						tmpScreenDir = nil
					end

					tmpPos = nil
					tmpDir = nil
				end
			end
		end

		camForward = nil
		camPos = nil
		dragDir = nil
		lockPos = nil
	end

	return retPlayer
end

function ControllerMain:ChooseLockPlayer()
	local retPlayer

	if self.hostPlayer ~= nil and self.cameraCtrl ~= nil and self.hostPlayer:IsDead() == false then
		local camDir = self.cameraCtrl:GetCameraRealForward()
		local camForward = camDir:Clone()

		camForward.y = 0

		local camRight = Vector3.Cross(Vector3.s_up, camForward)
		local camPos = self.cameraCtrl:GetCameraRealPosition()
		local enemyList = self:GetEnemyList(self.hostPlayer:GetTeamId())
		local scoreMax = -99999

		for k, enemy in pairs(enemyList) do
			local tmpAnimal, forceLock = self.hostPlayer:CheckLockPlayer(enemy, false)

			if tmpAnimal ~= nil then
				local tmpPos = enemy:GetGravityCenterPosition()

				if enemy.parasitic > 0 then
					tmpPos = enemy:GetAimPosition()
				end

				local tmpDir = tmpPos - camPos
				local tmpDirForward = tmpDir:Clone()

				tmpDirForward.y = 0

				tmpDirForward:SetNormalize()

				local tmpRet = Vector3.Dot(camForward, tmpDirForward)

				if tmpRet >= 0 or forceLock == true then
					local angleH = Vector3.Angle(camForward, tmpDirForward)
					local tmpDir2 = Vector3.ProjectOnPlane(tmpDir, camRight)
					local angleV = Vector3.Angle(camDir, tmpDir2)
					local dis = Vector3.Distance(tmpPos, camPos)
					local tmpScore = self:CalcLockScore(angleH, angleV, dis)

					if scoreMax < tmpScore then
						retPlayer = enemy
						scoreMax = tmpScore
					end
				end

				tmpDir = nil
			end
		end
	end

	return retPlayer
end

function ControllerMain:CalcLockScore(angleH, angleV, dis)
	angleV = angleV + 15

	local s1 = 0.012 * angleH * angleH - 2.2127 * angleH + 101.14
	local s2 = 0.0001 * angleV * angleV * angleV - 0.0141 * angleV * angleV - 0.0079 * angleV + 50.214
	local s3 = 0.2347 * dis * dis - 9.9211 * dis + 103.06

	return s1 + s2 + s3
end

function ControllerMain:CheckHaveLockPlayer()
	if self.hostPlayer ~= nil and self.cameraCtrl ~= nil and self.hostPlayer:IsDead() == false then
		if self.hostPlayerLockTargetLast ~= nil then
			local tmpAnimal, forceLock = self.hostPlayer:CheckLockPlayer(self.hostPlayerLockTargetLast, false)

			if tmpAnimal ~= nil then
				return true
			end
		end

		local enemyList = self:GetEnemyList(self.hostPlayer:GetTeamId())

		for k, enemy in pairs(enemyList) do
			if enemy ~= self.hostPlayerLockTargetLast then
				local tmpAnimal, forceLock = self.hostPlayer:CheckLockPlayer(enemy, false)

				if tmpAnimal ~= nil then
					self.hostPlayerLockTargetLast = enemy

					return true
				end
			end
		end
	end

	return false
end

function ControllerMain:IsLockPlayer()
	if self.hostPlayer ~= nil and self.cameraCtrl ~= nil and self.hostPlayer:IsDead() == false then
		local lockPlayer = self.hostPlayer:GetLockPlayer()

		if lockPlayer ~= nil then
			return true
		end
	end

	return false
end

function ControllerMain:UnlockPlayer(targetPlayer)
	if self.hostPlayer ~= nil and self.cameraCtrl ~= nil and self.hostPlayer:IsDead() == false then
		local lockPlayer = self.hostPlayer:GetLockPlayer()

		if lockPlayer ~= nil and lockPlayer == targetPlayer then
			self.hostPlayer:SetLockId(0 - lockPlayer:GetAnimalId())
		end
	end

	return false
end

function ControllerMain:OpenBag(finishFun)
	if self.hostPlayer ~= nil then
		return self.hostPlayer:OpenBag(finishFun)
	end

	return false
end

function ControllerMain:CloseBag()
	if self.hostPlayer ~= nil then
		return self.hostPlayer:CloseBag()
	end

	return false
end

function ControllerMain:OpenMessageUI()
	if self.hostPlayer ~= nil then
		self.hostPlayer:StopMovementImmediately(true)
	end
end

function ControllerMain:SetActionAssist(assistButton)
	if self.stateType ~= ControllerMain.StateType.Move or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if DebugAIControl == true and self.hostFakePlayer ~= nil then
		self.hostFakePlayer:PressAssistButton(assistButton)
	else
		self.hostPlayer:PressAssistButton(assistButton)
	end
end

function ControllerMain:SetActionItem(itemId)
	if self.stateType ~= ControllerMain.StateType.Move or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if DebugAIControl == true and self.hostFakePlayer ~= nil then
		self.hostFakePlayer:PressUseItem(itemId)
	else
		self.hostPlayer:PressUseItem(itemId)
	end
end

function ControllerMain:SetQuickList(index, itemId)
	if self.stateType ~= ControllerMain.StateType.Move or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.controllerGameMode:SetQuickList(index, itemId)
	end
end

function ControllerMain:SetQuickMenu(index)
	if self.stateType ~= ControllerMain.StateType.Move or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.controllerGameMode:SetQuickMenu(index)
	end
end

function ControllerMain:PressQuickMenu()
	if self.stateType ~= ControllerMain.StateType.Move or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local useItemId = self.controllerGameMode:GetQuickMenuItemId()

		if useItemId > 0 and self.controllerGameMode:GetBagItemNum(useItemId) > 0 then
			self:SetActionItem(useItemId)
		end
	end
end

function ControllerMain:UseItem(itemId, itemNum)
	if self.stateType ~= ControllerMain.StateType.Move or self.startGame == false or self.hostPlayer == nil then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and itemId > 0 then
		self:SetActionItem(itemId)
	end
end

function ControllerMain:UpdateSkillButton()
	local tmpPlayer = self.hostPlayer

	if DebugAIControl == true and self.hostFakePlayer ~= nil then
		tmpPlayer = self.hostFakePlayer
	end

	if tmpPlayer ~= nil then
		tmpPlayer:LongPressSkillButton(self.touchSkillButton)
	end
end

function ControllerMain:UpdateMove()
	if self.startGame == false or self.hostPlayer == nil then
		return
	end

	if self.stateSubType == ControllerMain.MoveStep.BackToTitle or self.stateSubType == ControllerMain.MoveStep.ShowResult then
		return
	end

	self:UpdateSkillButton()
	self:UpdateLogicFrame()

	if self.sceneList ~= nil and self.sceneList[self.sceneFocusName] ~= nil then
		self.sceneList[self.sceneFocusName]:UpdateRender()
	end

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:Update()
	end
end

function ControllerMain:LateUpdateMove()
	if self.startGame == false or self.hostPlayer == nil then
		return
	end

	if self.stateSubType == ControllerMain.MoveStep.BackToTitle or self.stateSubType == ControllerMain.MoveStep.ShowResult then
		return
	end

	if self.dontRender == true then
		return
	end

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:LateUpdate()
	end

	if self.controllerBullet ~= nil then
		self.controllerBullet:LateUpdate()
	end

	if self.controllerGameMode ~= nil then
		self.controllerGameMode:LateUpdate()
	end

	self:UpdateLockPlayer()
	self:UpdateSwitchHostPlayer()
	self:UpdateHeadInfo()
	self:UpdateLight()
	self:UpdateShadow()

	if self.sceneList ~= nil and self.sceneList[self.sceneFocusName] ~= nil then
		self.sceneList[self.sceneFocusName]:LateUpdateRender()
	end

	if self.crow ~= nil then
		self.crow:LateUpdate()
	end

	self:UpdateCamera()
end

function ControllerMain:UpdateCamera()
	if self.cameraCtrl ~= nil then
		if self.cameraCtrl:IsFollowingType(CameraMain.FollowingType.Aim) then
			local auto = false
			local autoAngleHorizontalDiff = 0
			local autoAngleVerticalDiff = 0

			auto, autoAngleHorizontalDiff, autoAngleVerticalDiff = self.hostPlayer:CheckAimAuto()

			if auto == true then
				local tmpAngleVec3 = Vector3.New(autoAngleHorizontalDiff, autoAngleVerticalDiff, 0)
				local tmpSpeed = AnimalBase_Define.AimAutoSpeed

				if tmpAngleVec3.sqrMagnitude < tmpSpeed * tmpSpeed then
					self.dragInitPosX = self.dragInitPosX + autoAngleHorizontalDiff
					self.dragInitPosY = self.dragInitPosY + autoAngleVerticalDiff
				else
					tmpAngleVec3:SetNormalize()
					tmpAngleVec3:Mul(tmpSpeed)

					self.dragInitPosX = self.dragInitPosX + tmpAngleVec3.x
					self.dragInitPosY = self.dragInitPosY + tmpAngleVec3.y
				end

				tmpAngleVec3 = nil
			end

			local angleHorizontal = self.dragAngleHorizontal + self.dragInitPosX
			local angleVertical = self.dragAngleVertical + self.dragInitPosY
			local ret

			ret, angleHorizontal, angleVertical = self.hostPlayer:CheckAimTarget(angleHorizontal, angleVertical)

			if ret == true then
				ret = self.cameraCtrl:RotateAimCamera(angleHorizontal, angleVertical)
			end

			if DebugAIControl == true and self.hostFakePlayer ~= nil then
				self.hostFakePlayer:SetSkillDirection(angleHorizontal, angleVertical)
			else
				self.hostPlayer:SetSkillDirection(angleHorizontal, angleVertical)
			end

			local dragTarget = self.hostPlayer:GetSkillButtonAimTarget()
			local hitRet, hitAnimal = self.hostPlayer:TryAimTarget(dragTarget)

			UIManager.SendMessage("Mainmenu", "SetSightFocus", hitRet, hitAnimal)
		end

		if self.cameraCtrl:IsRotatingFollowCamera() == true then
			self.cameraCtrl:RotateFollowCamera(self.viewRotateHorizontal, self.viewRotateVertical, self.rotateInputType)
		end

		self.cameraCtrl:Update()
	end
end

function ControllerMain:UpdateHeadInfo()
	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:UpdateHeadInfo()
	end
end

function ControllerMain:Update()
	ControllerBase.Update(self)
	self:UpdateNextSubState()

	if self.stateType == ControllerMain.StateType.Load then
		self:UpdateLoad()
	elseif self.stateType == ControllerMain.StateType.Move then
		self:UpdateMove()
	elseif self.stateType == ControllerMain.StateType.LoadArea then
		self:UpdateLoadArea()
	end

	if DebugShow == true and self.debugLogText ~= nil and self.loadCharacterManager ~= nil then
		self.debugLogText.text = "PL:" .. table.nums(self.playerList) .. "/TP:" .. self.loadCharacterManager:GetCharacterNum() .. "/CA:" .. self.loadCharacterManager:GetCharacterCacheNum()
	end
end

function ControllerMain:LateUpdate()
	ControllerBase.LateUpdate(self)

	if self.stateType == ControllerMain.StateType.Move then
		self:LateUpdateMove()
	elseif self.stateType == ControllerMain.StateType.LoadArea then
		self:LateUpdateLoadArea()
	end
end

function ControllerMain:LateLateUpdate()
	if self.stateType == ControllerMain.StateType.Move then
		if self.dontRender == true then
			return
		end

		VfxManager.Update()
	end
end

function ControllerMain:UpdateLogicFrame()
	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:UpdateLogicStart()
	end

	if self.sceneList ~= nil and self.sceneList[self.sceneFocusName] ~= nil then
		self.sceneList[self.sceneFocusName]:UpdateLogic()
	end

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		if self.sceneList ~= nil and self.sceneList[self.sceneFocusName] ~= nil then
			self.sceneList[self.sceneFocusName]:CheckTrap(tmpPlayer)
		end

		tmpPlayer:UpdateLogic()
	end

	if self.controllerBullet ~= nil then
		self.controllerBullet:Update()
	end

	if self.controllerCollider ~= nil then
		self.controllerCollider:Update()
	end

	if self.controllerShell ~= nil then
		self.controllerShell:Update()
	end

	if self.controllerGameMode ~= nil then
		self.controllerGameMode:Update()
	end

	if self.controllerTimer ~= nil then
		self.controllerTimer:Update()
	end

	for tmpAttackPlayerIndex, tmpAttackPlayer in pairs(self.playerList) do
		tmpAttackPlayer:CheckSkillCollider()
	end

	if self.controllerBullet ~= nil then
		self.controllerBullet:CheckCollider()
	end

	if self.controllerCollider ~= nil then
		self.controllerCollider:CheckCollider()
	end

	if self.controllerShell ~= nil then
		self.controllerShell:CheckHit()
	end

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:CheckHit()
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		self.homeBase:CheckHit()
	end

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:CheckSkillHit()
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		self.homeBase:CheckSkillHit()
	end

	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:UpdateValue()
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		self.homeBase:UpdateValue()
	end

	if self.playerDeleteList ~= nil then
		for id, _ in pairs(self.playerDeleteList) do
			self:RemovePlayer(id)
		end

		self.playerDeleteList = nil
	end

	ControllerMain.LogicFrame = ControllerMain.LogicFrame + 1
end

function ControllerMain:SetPathFindingGraph(bytes)
	if self.tfAstarPath ~= nil then
		local astar = self.tfAstarPath.gameObject:GetComponent(typeof(AstarPath))

		if astar == nil then
			astar = self.tfAstarPath.gameObject:AddComponent(typeof(AstarPath))
		end

		astar.scanOnStartup = false

		astar.data:DeserializeGraphs(bytes)
	end
end

function ControllerMain:ApplyAnimator(flg)
	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:ApplyAnimator(flg)
	end
end

function ControllerMain:ApplyAnimatorIK()
	for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
		tmpPlayer:ApplyAnimatorIK()
	end
end

function ControllerMain:GetServerTime()
	return Time.time
end

function ControllerMain.ConvertSecondToFrame(sec)
	return Mathf.Round(sec * ControllerMain.GameFrameRate)
end

function ControllerMain.ConvertSecondToFrameForAnimator(sec)
	return Mathf.Round(sec * ControllerMain.AnimatorFrameRate)
end

function ControllerMain.ConvertFrameToSec(frame)
	return frame / ControllerMain.GameFrameRate
end

function ControllerMain:SetJoystickControllerForMove(joystick)
	self.joystickControllerForMove = joystick

	self.joystickControllerForMove:SetType(JoystickController.JoystickType.Move)
	self.joystickControllerForMove:SetEvent(JoystickController.JoystickEventType.TouchBegin, ControllerMain.JoystickForMoveTouchBegin)
	self.joystickControllerForMove:SetEvent(JoystickController.JoystickEventType.TouchMove, ControllerMain.JoystickForMoveTouchMove)
	self.joystickControllerForMove:SetEnable(false)
end

function ControllerMain:SetJoystickControllerForMoveFixed(isFixed)
	if self.joystickControllerForMove then
		self.joystickControllerForMove:SetFixed(isFixed)
	end
end

function ControllerMain:SetJoystickControllerForRotation(joystick)
	self.joystickControllerForRotation = joystick

	self.joystickControllerForRotation:SetType(JoystickController.JoystickType.Rotation)
	self.joystickControllerForRotation:SetEvent(JoystickController.JoystickEventType.TouchBegin, ControllerMain.JoystickForRotationTouchBegin)
	self.joystickControllerForRotation:SetEvent(JoystickController.JoystickEventType.TouchMove, ControllerMain.JoystickForRotationTouchMove)
	self.joystickControllerForRotation:SetEvent(JoystickController.JoystickEventType.TouchEnd, ControllerMain.JoystickForRotationTouchEnd)
	self.joystickControllerForRotation:SetEnable(false)
	self.joystickControllerForRotation:SetVisiable(false)
end

function ControllerMain:ClearInputJoystickController()
	self.joystickControllerForMove:OnDisabled()
	ControllerMain.JoystickForMoveTouchEnd()
end

function ControllerMain:GetGamePadControllerForMovement()
	return self.GamePadControllerForMovement
end

function ControllerMain:GetGamePadControllerForRotation()
	return self.GamePadControllerForRotation
end

function ControllerMain:SetGamePadControllerForMovement(GamePad)
	self.GamePadControllerForMovement = GamePad

	self.GamePadControllerForMovement:SetType(GamePadController.GamePadType.Move)
	self.GamePadControllerForMovement:SetEvent(GamePadController.GamePadEventType.InputBegin, ControllerMain.GamePadForMoveBegin)
	self.GamePadControllerForMovement:SetEvent(GamePadController.GamePadEventType.InputMove, ControllerMain.GamePadForMoveMove)
	self.GamePadControllerForMovement:SetEvent(GamePadController.GamePadEventType.InputEnd, ControllerMain.GamePadForMoveEnd)
end

function ControllerMain:SetGamePadControllerForDPad(GamePad)
	self.GamePadControllerForDPad = GamePad

	self.GamePadControllerForDPad:SetType(GamePadController.GamePadType.DPad)
	self.GamePadControllerForDPad:SetEvent(GamePadController.GamePadEventType.InputBegin, ControllerMain.JoystickForDPadTouchBegin)
	self.GamePadControllerForDPad:SetEvent(GamePadController.GamePadEventType.InputDPad, ControllerMain.JoystickForDPadTouchMove)
	self.GamePadControllerForDPad:SetEvent(GamePadController.GamePadEventType.InputEnd, ControllerMain.JoystickForDPadTouchEnd)
end

function ControllerMain:SetGamePadControllerForRotation(GamePad)
	self.GamePadControllerForRotation = GamePad

	self.GamePadControllerForRotation:SetType(GamePadController.GamePadType.Rotation)
	self.GamePadControllerForRotation:SetEvent(GamePadController.GamePadEventType.InputBegin, ControllerMain.GamePadForRotationBegin)
	self.GamePadControllerForRotation:SetEvent(GamePadController.GamePadEventType.InputRotation, ControllerMain.GamePadForRotationMove)
	self.GamePadControllerForRotation:SetEvent(GamePadController.GamePadEventType.InputEnd, ControllerMain.GamePadForRotationEnd)
end

function ControllerMain:DebugPropertyMax()
	if DebugPropertyMax == true then
		for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
			if tmpPlayer ~= nil then
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Hp)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Mp)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Energy)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Rage)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Power)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.San)
			end
		end
	elseif DebugHostPropertyMax == true then
		for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
			if tmpPlayer ~= nil and tmpPlayer:IsHost() == true and tmpPlayer:IsHostBack() == false then
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Hp)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Mp)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Energy)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Rage)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Power)
				tmpPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.San)
			end
		end
	end
end

function ControllerMain:JPadHold(vec2)
	local currentInput = SystemHelper.GetDirPressed(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if self.JPadInput == 0 and currentInput > 0 then
		self.JPadInput = currentInput

		if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
			UIManager.SendMessage("Setting", "JPadPress", currentInput)
		elseif lName == "MapView" or lName == "MapInfo" or lName == "MapHero" then
			UIManager.SendMessage("MapView", "JPadPress", currentInput)
		elseif lName == "PlayerInfoBag" or lName == "PlayerInfoTalent" or lName == "PlayerInfoTask" or lName == "PlayerInfoBooty" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoAlchemyBag" or lName == "PlayerInfoProperty" or lName == "PlayerInfoLevelup" or lName == "PlayerInfoItemEquip" or lName == "PlayerInfoTalentDetail" or lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" or lName == "PlayerInfoAlchemyConfirm" then
			-- block empty
		elseif lName == "MsgBoxSimple" or lName == "MsgBoxGetItem" or lName == "MsgBoxGuide" then
			UIManager.SendMessage("MsgBoxSimple", "DPadPress", currentInput)
		elseif lName == "Skill" then
			UIManager.SendMessage("SkillView", "SkillScroll", currentInput)
		elseif lName == "MazeMain" or lName == "MazeSub" then
			UIManager.SendMessage("Maze", "JPadPress", currentInput)
		else
			UIManager.SendMessage("Mainmenu", "JPadPress", currentInput)
		end
	end

	if currentInput > 0 then
		if self.JPadInput ~= currentInput or self.JPadTime == 0 then
			self.JPadTime = TimeHelper.getNowTimeNoScale()
		end

		self.JPadInput = currentInput
		self.JPadDeltaTime = TimeHelper.getNowTimeNoScale() - self.JPadTime

		if self.JPadDeltaTime > 0.3 then
			if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
				UIManager.SendMessage("Setting", "JPadLongPress", currentInput)
			elseif lName == "MapView" or lName == "MapInfo" or lName == "MapHero" then
				UIManager.SendMessage("MapView", "JPadLongPress", currentInput)
			elseif lName == "PlayerInfoBag" or lName == "PlayerInfoTask" or lName == "PlayerInfoBooty" or lName == "PlayerInfoProperty" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoAlchemyBag" or lName == "PlayerInfoAlchemyConfirm" then
				UIManager.SendMessage("PlayerInfo", "DPadPress", currentInput)
			elseif lName == "MazeMain" or lName == "MazeSub" then
				UIManager.SendMessage("Maze", "JPadPress", currentInput)
			else
				UIManager.SendMessage("Mainmenu", "JPadLongPress", currentInput)
			end

			self.JPadTime = self.JPadTime + 0.2
		end
	end
end

function ControllerMain:JPadRelease()
	self.JPadInput = 0
	self.JPadTime = 0
	self.JPadDeltaTime = 0
end

function ControllerMain:GPadHold(vec2)
	local currentInput = SystemHelper.GetDirPressed(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if self.GPadInput == 0 and currentInput > 0 then
		self.GPadInput = currentInput

		if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
			UIManager.SendMessage("Setting", "JPadPress", currentInput)
		elseif lName == "MapView" or lName == "MapInfo" or lName == "MapHero" then
			UIManager.SendMessage("MapView", "JPadPress", currentInput)
		elseif lName == "PlayerInfoBag" or lName == "PlayerInfoTalent" or lName == "PlayerInfoTask" or lName == "PlayerInfoBooty" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoAlchemyBag" or lName == "PlayerInfoProperty" or lName == "PlayerInfoLevelup" or lName == "PlayerInfoItemEquip" or lName == "PlayerInfoTalentDetail" or lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" or lName == "PlayerInfoAlchemyConfirm" then
			SystemHelper.Log("GPadInput: " .. self.GPadInput .. ", Current: " .. currentInput)
			UIManager.SendMessage("PlayerInfo", "DPadPress", currentInput)
		elseif lName == "MsgBoxSimple" or lName == "MsgBoxGetItem" or lName == "MsgBoxGuide" then
			UIManager.SendMessage("MsgBoxSimple", "DPadPress", currentInput)
		elseif lName == "Skill" then
			UIManager.SendMessage("SkillView", "SkillScroll", currentInput)
		elseif lName == "MazeMain" or lName == "MazeSub" then
			UIManager.SendMessage("Maze", "JPadPress", currentInput)
		else
			UIManager.SendMessage("Mainmenu", "JPadPress", currentInput)
		end
	end

	if currentInput > 0 then
		if self.GPadInput ~= currentInput or self.GPadTime == 0 then
			self.GPadTime = TimeHelper.getNowTimeNoScale()
		end

		self.GPadInput = currentInput
		self.GPadDeltaTime = TimeHelper.getNowTimeNoScale() - self.GPadTime

		if self.GPadDeltaTime > 0.3 then
			if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
				UIManager.SendMessage("Setting", "JPadLongPress", currentInput)
			elseif lName == "MapView" or lName == "MapInfo" or lName == "MapHero" then
				UIManager.SendMessage("MapView", "JPadLongPress", currentInput)
			elseif lName == "PlayerInfoBag" or lName == "PlayerInfoBooty" or lName == "PlayerInfoTask" or lName == "PlayerInfoProperty" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoAlchemyBag" or lName == "PlayerInfoAlchemyConfirm" then
				UIManager.SendMessage("PlayerInfo", "DPadPress", currentInput)
			elseif lName == "MazeMain" or lName == "MazeSub" then
				UIManager.SendMessage("Maze", "JPadPress", currentInput)
			else
				UIManager.SendMessage("Mainmenu", "JPadLongPress", currentInput)
			end

			self.GPadTime = self.GPadTime + 0.2
		end
	end
end

function ControllerMain:GPadRelease()
	self.GPadInput = 0
	self.GPadTime = 0
	self.GPadDeltaTime = 0
end

function ControllerMain:JPadRotHold(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "SelectItem" then
		UIManager.SendMessage("Mainmenu", "JPadRotPrecise", vec2)
	elseif lName == "PlayerInfoItemEquip" then
		UIManager.SendMessage("PlayerInfo", "JPadRotPrecise", vec2)
	elseif lName == "PlayerInfoBag" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoBooty" or lName == "PlayerInfoTask" then
		local currentInput = SystemHelper.GetDirPressedJpad(vec2)

		UIManager.SendMessage("PlayerInfo", "JPadRot", currentInput)
	elseif lName == "Additions" then
		local currentInput = SystemHelper.GetDirPressedJpad(vec2)

		UIManager.SendMessage("Additions", "JPadRot", currentInput)
	elseif lName == "PanelDLC" then
		UIManager.SendMessage("LobbyMain", "JPadRot", currentInput)
	end
end

function ControllerMain:JPadRotRelease()
	self.JPadRotInput = 0
end

function ControllerMain.JoystickForMoveTouchBegin()
	local sceneController = ST_Main.GetSceneController()

	if sceneController then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" then
			UIManager.SendMessage("Mainmenu", "RecordTouchEvent")
		end
	end
end

function ControllerMain.JoystickForMoveTouchMove(vec2, touch)
	local sceneController = ST_Main.GetSceneController()

	if sceneController then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" or lName == "SelectItem" then
			sceneController:SetMoveDirection(vec2, touch)
		elseif lName == "MapView" or lName == "MapInfo" or lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" then
			sceneController:SetCursorMove(vec2, touch)
		else
			sceneController:JPadHold(vec2)
		end
	end
end

function ControllerMain.JoystickForMoveTouchEnd()
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		sceneController:SetMoveDirection(Vector2.s_zero, false)
		sceneController:JPadRelease()
	end
end

function ControllerMain.GamePadForMoveBegin()
	if DebugShowCtrlPanel then
		UIManager.SendMessage("Debug", "SetJoystickRaw", DebugCtrl.gpjsName.L, 0, 0)
	end
end

function ControllerMain.GamePadForMoveMove(vec2, touch)
	if DebugShowCtrlPanel then
		UIManager.SendMessage("Debug", "SetJoystickRaw", DebugCtrl.gpjsName.L, vec2.x, vec2.y)
	end

	local sceneController = ST_Main.GetSceneController()

	if sceneController then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" or lName == "SelectItem" then
			sceneController:SetMoveDirection(vec2, touch)
		elseif lName == "MapView" or lName == "MapInfo" or lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" then
			sceneController:SetCursorMove(vec2, touch)
		else
			sceneController:GPadHold(vec2)
		end
	end
end

function ControllerMain.GamePadForMoveEnd()
	if DebugShowCtrlPanel then
		UIManager.SendMessage("Debug", "SetJoystickRaw", DebugCtrl.gpjsName.L, 0, 0)
	end

	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		sceneController:SetMoveDirection(Vector2.s_zero, false)
		sceneController:GPadRelease()
	end
end

function ControllerMain.JoystickForRotationTouchBegin()
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" then
			sceneController:BeginViewRotate()
			UIManager.SendMessage("Mainmenu", "RecordTouchEvent")
		end
	end
end

function ControllerMain.JoystickForRotationTouchMove(vec2, touch, isScreen)
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" then
			if isScreen and vec2.sqrMagnitude > 100 then
				sceneController:SetViewRotate(vec2 * 1.5, true)
			else
				sceneController:SetViewRotate(vec2 * 1.5, true)
			end
		else
			sceneController:JPadRotHold(vec2)
		end
	end
end

function ControllerMain.JoystickForRotationTouchEnd()
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		sceneController:SetViewRotate(Vector2.zero)
		sceneController:EndViewRotate()
		sceneController:JPadRotRelease()
	end
end

function ControllerMain.GamePadForRotationBegin()
	if DebugShowCtrlPanel then
		UIManager.SendMessage("Debug", "SetJoystickRaw", DebugCtrl.gpjsName.R, 0, 0)
	end

	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" then
			sceneController:BeginViewRotate()
		end
	end
end

function ControllerMain.GamePadForRotationMove(vec2, touch, isScreen, isMouse)
	if DebugShowCtrlPanel then
		UIManager.SendMessage("Debug", "SetJoystickRaw", DebugCtrl.gpjsName.R, vec2.x, vec2.y)
	end

	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "GameMain" then
			if isScreen and vec2.sqrMagnitude > 100 then
				sceneController:SetViewRotate(vec2 * 1.12, nil)
			else
				sceneController:SetViewRotate(vec2 * 1.12, nil, isMouse)
			end
		else
			sceneController:JPadRotHold(vec2)
		end
	end
end

function ControllerMain.GamePadForRotationEnd()
	if DebugShowCtrlPanel then
		UIManager.SendMessage("Debug", "SetJoystickRaw", DebugCtrl.gpjsName.R, 0, 0)
	end

	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		sceneController:SetViewRotate(Vector2.zero)
		sceneController:EndViewRotate()
		sceneController:JPadRotRelease()
	end
end

function ControllerMain:DPadHold(vec2)
	local currentInput = SystemHelper.GetDirPressed(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if self.DPadInput == 0 and currentInput > 0 then
		self.DPadInput = currentInput

		if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
			UIManager.SendMessage("Setting", "DPadPress", currentInput)
		elseif lName == "MapView" or lName == "MapInfo" or lName == "MapHero" then
			UIManager.SendMessage("MapView", "DPadPress", currentInput)
		elseif lName == "PlayerInfoBag" or lName == "PlayerInfoTalent" or lName == "PlayerInfoTask" or lName == "PlayerInfoBooty" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoAlchemyBag" or lName == "PlayerInfoProperty" or lName == "PlayerInfoLevelup" or lName == "PlayerInfoItemEquip" or lName == "PlayerInfoTalentDetail" or lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" or lName == "PlayerInfoAlchemyConfirm" then
			UIManager.SendMessage("PlayerInfo", "DPadPress", currentInput)
		elseif lName == "MsgBoxSimple" or lName == "MsgBoxGetItem" or lName == "MsgBoxGuide" then
			UIManager.SendMessage("MsgBoxSimple", "DPadPress", currentInput)
		elseif lName == "Skill" then
			UIManager.SendMessage("SkillView", "SkillScroll", currentInput)
		elseif lName == "MazeMain" or lName == "MazeSub" then
			UIManager.SendMessage("Maze", "DPadPress", currentInput)
		else
			UIManager.SendMessage("Mainmenu", "DPadPress", currentInput)
		end
	end

	if currentInput > 0 then
		if self.DPadInput ~= currentInput or self.DPadTime == 0 then
			self.DPadTime = TimeHelper.getNowTimeNoScale()
		end

		self.DPadInput = currentInput
		self.DPadDeltaTime = TimeHelper.getNowTimeNoScale() - self.DPadTime

		if self.DPadDeltaTime > 0.3 then
			if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
				UIManager.SendMessage("Setting", "DPadLongPress", currentInput)
			elseif lName == "MapView" or lName == "MapInfo" or lName == "MapHero" then
				UIManager.SendMessage("MapView", "DPadLongPress", currentInput)
			elseif lName == "PlayerInfoBag" or lName == "PlayerInfoBooty" or lName == "PlayerInfoTask" or lName == "PlayerInfoProperty" or lName == "PlayerInfoAlchemy" or lName == "PlayerInfoAlchemyBag" or lName == "PlayerInfoAlchemyConfirm" then
				UIManager.SendMessage("PlayerInfo", "DPadPress", currentInput)
			elseif lName == "MazeMain" or lName == "MazeSub" then
				UIManager.SendMessage("Maze", "DPadPress", currentInput)
			else
				UIManager.SendMessage("Mainmenu", "DPadLongPress", currentInput)
			end

			self.DPadTime = self.DPadTime + 0.2
		end
	end
end

function ControllerMain:DPadRelease()
	self.DPadTime = 0
	self.DPadInput = 0
	self.DPadDeltaTime = 0

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "Mainmenu" then
		UIManager.SendMessage("Mainmenu", "DPadPress", 0)
	end
end

function ControllerMain.JoystickForDPadTouchBegin()
	return
end

function ControllerMain.JoystickForDPadTouchMove(vec2, touch)
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		sceneController:DPadHold(vec2)
	end
end

function ControllerMain.JoystickForDPadTouchEnd()
	local sceneController = ST_Main.GetSceneController()

	if sceneController ~= nil then
		sceneController:DPadRelease()
	end
end

function ControllerMain:UpdateQuality(force)
	ControllerBase.UpdateQuality(self, force)

	if self.stateType == ControllerMain.StateType.Move or self.stateType == ControllerMain.StateType.LoadArea and self.stateSubType >= ControllerMain.LoadAreaStep.SwitchScene then
		if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Menu then
			self:OpenShadow()
		end

		for tmpPlayerIndex, tmpPlayer in pairs(self.playerList) do
			tmpPlayer:UpdateQuality(force)
		end

		if self.sceneList ~= nil and self.sceneList[self.sceneFocusName] ~= nil then
			self.sceneList[self.sceneFocusName]:UpdateQuality(force)
		end

		if self.controllerGameMode ~= nil then
			self.controllerGameMode:UpdateQuality(force)
		end
	end
end

function ControllerMain:OpenDialog(dialogId, meetingMemberList)
	UIManager.SendMessage("Dialog", "PlayDialogId", dialogId, meetingMemberList)
end

function ControllerMain.GetLogicDeltaTime()
	return Time.deltaTime
end

function ControllerMain.GetLogicDeltaTimeRange()
	return Mathf.Clamp(Time.deltaTime, 0, 0.03)
end

function ControllerMain:PermitUsingQuickItem()
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return false
	end

	return self.hostPlayer:IsPermitUseQuickItem()
end

function ControllerMain:PermitOpeningMenus()
	if self.stateType ~= ControllerMain.StateType.Move or self.stateSubType ~= ControllerMain.MoveStep.Normal or self.startGame == false or self.hostPlayer == nil then
		return false
	end

	return self.hostPlayer:IsPermitOpenMenu()
end

function ControllerMain:GetArenaController()
	return self.arenaController
end

function ControllerMain:SetSpecialChangeConfig(fogStart, fogEnd)
	if self.arenaController ~= nil then
		self.arenaController:SetSpecialChangeConfig(fogStart, fogEnd)
	end
end

function ControllerMain:StartSpecialChangeConfig(speed)
	if self.arenaController ~= nil then
		self.arenaController:StartSpecialChangeConfig(speed)
	end
end

function ControllerMain:EndSpecialChangeConfig(force)
	if self.arenaController ~= nil then
		self.arenaController:EndSpecialChangeConfig(force)
	end
end

function ControllerMain:StartMovieConfig()
	if self.arenaController ~= nil then
		self.arenaController:StartMovieConfig(false, Color.black, 1, -1, true)
	end
end

function ControllerMain:EndMovieConfig()
	if self.arenaController ~= nil then
		self.arenaController:EndMovieConfig()
	end
end

function ControllerMain:StartTimeLineConfig()
	if self.arenaController ~= nil then
		self.arenaController:StartTimeLineConfig(false, Color.black, 1, -1, true)
	end
end

function ControllerMain:EndTimeLineConfig()
	if self.arenaController ~= nil then
		self.arenaController:EndTimeLineConfig()
	end
end

function ControllerMain:BossEnterConfig()
	if self.arenaController ~= nil then
		self.arenaController:BossEnterConfig()
	end
end

function ControllerMain:BossGradeUpConfig()
	if self.arenaController ~= nil then
		self.arenaController:BossGradeUpConfig()
	end
end

function ControllerMain:BossEndConfig(forceQuit)
	if self.arenaController ~= nil then
		self.arenaController:BossEndConfig(forceQuit)
	end
end

function ControllerMain:SetCrazyRateConfig(rate, immediately)
	if self.arenaController ~= nil then
		self.arenaController:SetCrazyRateConfig(rate, immediately)
	end
end

function ControllerMain:SetFogByGroundConfig(color, disStart, disEnd, immediately)
	if self.arenaController ~= nil and color ~= nil then
		self.arenaController:SetFogByGroundConfig(color, disStart, disEnd, immediately)
	end
end

function ControllerMain:SetMazeTrapAndTrickData(level)
	if level == 0 then
		MS_TrapData.SetLoop(FS_UserData.story:GetLogicLoop())
		MS_TrickData.SetLoop(FS_UserData.story:GetLogicLoop())

		return
	end

	if level < 8 then
		MS_TrapData.SetLoop(1)
		MS_TrickData.SetLoop(1)
	elseif level < 15 then
		MS_TrapData.SetLoop(2)
		MS_TrickData.SetLoop(2)
	elseif level < 22 then
		MS_TrapData.SetLoop(3)
		MS_TrickData.SetLoop(3)
	else
		MS_TrapData.SetLoop(4)
		MS_TrickData.SetLoop(4)
	end
end

function ControllerMain:DisableCamera()
	if self.cameraCtrl ~= nil then
		self.cameraCtrl:Disable()
	end
end
