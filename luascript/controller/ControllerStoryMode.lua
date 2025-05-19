-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerStoryMode.lua

require("LuaScript/Controller/ControllerModeBase")
require("LuaScript/StructData/FS_Battle_MatchGame")
require("LuaScript/StructData/FS_BattleData_StoryMode")
require("LuaScript/Controller/ControllerMovie")

ControllerStoryMode = class("ControllerStoryMode", ControllerModeBase)
ControllerStoryMode.static.CarriageColliderRadiusAdd = 0.2
ControllerStoryMode.static.StoryHostPlayerId = 10001
ControllerStoryMode.static.MonsterUnloadReadyTime = 2
ControllerStoryMode.static.TutorialIntervalTime = 12
ControllerStoryMode.static.TutorialQuestMax = 3
ControllerStoryMode.static.ForceMoveColliderWallTime = 1
ControllerStoryMode.static.CurtainHeightMax = 3
ControllerStoryMode.static.CurtainHeightMin = -1
ControllerStoryMode.static.EnemyTeamId = 2
ControllerStoryMode.static.SanLockTime = 5
ControllerStoryMode.static.SanCrazySubPerSecond = 0.5
ControllerStoryMode.static.SanSubDarkForestPerSecond = 0.5
ControllerStoryMode.static.SanSubMazePerTime = 0.5
ControllerStoryMode.static.SanSubMazeTimeInterval = 2
ControllerStoryMode.static.SanSubMazeCrazyPerTime = 5
ControllerStoryMode.static.SanMonsterDistanceMin = 2
ControllerStoryMode.static.SanMonsterChangePosMin = 1
ControllerStoryMode.static.SanLevelAdd = 10
ControllerStoryMode.static.CallHeroAddSanRate = 0.1
ControllerStoryMode.static.SanPositionExpireTime = 1
ControllerStoryMode.static.StoryEnterDuration = 2
ControllerStoryMode.static.StoryEnterPressCount = 3
ControllerStoryMode.static.StoryEnterUITime = 2
ControllerStoryMode.static.StoryEnterTime = 4
ControllerStoryMode.static.StoryEnterFogStart = 25
ControllerStoryMode.static.StoryEnterFogEnd = 80
ControllerStoryMode.static.BossDeadSlowTime = 0.3
ControllerStoryMode.static.BossDeadBlackTime = 2
ControllerStoryMode.static.BossGradeUpBlackTime = 2
ControllerStoryMode.static.BossBlackAlphaTarget = 1
ControllerStoryMode.static.SaveTimeInterval = 60
ControllerStoryMode.static.Status = {
	TimeLineLoadScene = 8,
	DeadMonster = 11,
	SelectHero = 16,
	Locator = 20,
	Result = 19,
	DeadMonsterWait = 12,
	MapReady = 14,
	Movie = 5,
	Ready = 2,
	DarkForestConfirm = 17,
	Normal = 3,
	MazeConfirm = 18,
	MapOpen = 15,
	Start = 1,
	TimeLineMove = 6,
	TimeLine = 7,
	StoryEnterMove = 10,
	Dialog = 4,
	TimeLineSwitchScene = 9,
	Menu = 13
}
ControllerStoryMode.static.VfxList = {
	{
		vfx_Arena10003 = "vfx_Arena10003_005"
	}
}
ControllerStoryMode.monsterIdStart = 0
ControllerStoryMode.static.QuestType = {
	DoorHint = 12,
	Formula = 14,
	OpenCrate = 11,
	HpLow = 18,
	SkillStartByTime = 10,
	RageMax = 8,
	KillMonster = 1,
	Death = 19,
	FinishDialog = 5,
	SanNotNormal = 20,
	SanCrazy = 21,
	CheckItem = 16,
	TimeLimit = 6,
	FirstDrop = 13,
	RageEnough = 23,
	PowerEnough = 24,
	Save = 4,
	FinishMovie = 3,
	GetItem = 2,
	MeetMonster = 7,
	SkillStartByCount = 9,
	TimeLine = 17,
	InDarkForest = 22,
	Kick = 15
}
ControllerStoryMode.static.QuestActionType = {
	ItemToBag = 2,
	EnterSeriesStory = 26,
	SelectHero = 12,
	OpenDialog = 6,
	DisableHero = 11,
	ShowMessageTask = 19,
	OpenDoor = 15,
	CloseBridge = 32,
	OpenSystem = 17,
	ExitBossMode = 9,
	AchievementQuest = 30,
	GoToCarriage = 20,
	ResetAttribute = 34,
	ChangeMonsterAnimator = 3,
	AutoSave = 13,
	CloseGate = 22,
	DeleteItem = 18,
	SetShortcut = 33,
	OpenTimeLine = 25,
	RecoveryHp = 35,
	RecoverySan = 36,
	ExitSeriesStory = 27,
	ChangeMonsterDialog = 4,
	GoToNextStage = 24,
	EnterStoryRule = 28,
	CloseDoor = 16,
	EquipTrophy = 39,
	OpenBridge = 31,
	ExitStoryRule = 29,
	GameOver = 37,
	ChangeMonsterAI = 1,
	OpenGate = 21,
	StoryLogicRule = 14,
	DestroyMonster = 5,
	EnterBossMode = 8,
	ShakeCamera = 38,
	EnableHero = 10,
	OpenMovie = 7,
	AddRage = 23
}
ControllerStoryMode.static.ItemType = {
	MonsterItem = 2,
	QuestItem = 1
}
ControllerStoryMode.static.ItemGetType = {
	Bag = 2,
	Eat = 1
}
ControllerStoryMode.static.ItemHpNum = 4
ControllerStoryMode.static.ItemExpNum = 10
ControllerStoryMode.static.SaveStatus = {
	SaveQuickMenu = 2,
	SaveBag = 1,
	SaveEnd = 4,
	Start = 0,
	SaveStage = 3
}
ControllerStoryMode.static.SaveType = {
	SaveExit = 5,
	SaveAuto = 1,
	SaveAutoTime = 2,
	SaveMenu = 6,
	SaveSuspend = 7,
	SavePoint = 3,
	SaveReborn = 4
}
ControllerStoryMode.static.SaveAuto = {
	Time = 1,
	Exit = 2
}
ControllerStoryMode.static.SceneMapId = 1
ControllerStoryMode.static.HeroSelPos = {
	HeroSelMax = 2,
	RightChair = 2,
	LeftChair = 1
}
ControllerStoryMode.static.RouteWallLayerMask = LayerMask.GetMask("WallOpaque", "WallTransparent", "WallInvisible")
ControllerStoryMode.static.RouteWallHeight = 1
ControllerStoryMode.static.RouteWallDistance = 0.2
ControllerStoryMode.static.SanFirstRate = {
	{
		10,
		1
	},
	{
		5,
		0.6
	},
	{
		1,
		0.2
	}
}
ControllerStoryMode.static.TimeLinePlayType = {
	ControlPlayer = 2,
	NoPlayer = 1,
	None = 0
}
ControllerStoryMode.static.StoryRule = {
	StoryWalk = 1,
	None = 0
}
ControllerStoryMode.static.SlowTimeStep = {
	Wait = 1,
	End = 2,
	Empty = 0
}
ControllerStoryMode.static.StoryWalkDodge = 0.4
ControllerStoryMode.static.CallHeroType = {
	Friend = 1,
	Unknown = 0,
	Enemy = 2
}
ControllerStoryMode.static.CallHeroTypeMax = 2

function ControllerStoryMode:initialize()
	ControllerModeBase.initialize(self)

	local go = GoFind("CharacterRoot")

	self.tfCharacterRoot = go.transform
	go = GoFind("SceneRoot")
	self.tfSceneRoot = go.transform
	self.transferPortId = 0
	self.transferUse = false
	self.transferItemId = 0

	self:InitArea()
	self:InitData()
	self:InitPlayer()
	self:InitUI()
	self:InitAudio()
	self:InitItem()
	self:InitSceneWall()
	self:CheckSceneWall()
	self:InitSceneEffect()
	self:CheckSceneEffect()
	self:ChangeStatus(ControllerStoryMode.Status.Normal)

	self.controllerMovie = ControllerMovie:new()

	self:EnterArea(true)

	self.SceneBossKillIdQuestDict = {}
	self.SceneBossKillIdQuestDict[1] = 11003
	self.SceneBossKillIdQuestDict[2] = 21006
	self.SceneBossKillIdQuestDict[3] = 31002
	self.SceneBossKillIdQuestDict[4] = 41001
	self.SceneBossKillIdQuestDict[5] = 51001
	self.SceneBossKillIdQuestDict[6] = 61001
	self.SceneBossKillIdQuestDict[7] = 71001
	self.SceneBossKillIdQuestDict[8] = 81001
	self.SceneBossKillIdQuestDict[9] = 99103

	if DebugAlwaysShowRoadSign or BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual then
		self:InitRoadSign()

		self.roadSignInited = true
	end

	if MS_StoryList.IsStoryDLC(self.storyId) == true then
		self:InitRain()
	end

	if ReqLogin then
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.ADD_BAG_ITEM, ControllerStoryMode.OnAddBagItem, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.UPDATE_BAG_ITEM, ControllerStoryMode.OnUpdateBagItem, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.REMOVE_BAG_ITEM, ControllerStoryMode.OnRemoveBagItem, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.BAG_IS_FULL, ControllerStoryMode.OnBagIsFull, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.BAG_ITEM_NOT_FOUND, ControllerStoryMode.OnBagItemNotFound, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.BAG_ITEM_CONFIG_NOT_FOUND, ControllerStoryMode.OnBagItemConfigNotFound, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToBag.BAG_ITEM_NOT_ENOUGH, ControllerStoryMode.OnBagItemNotEnough, false)
	end
end

function ControllerStoryMode:UpdateStatus()
	if self:IsStatus(ControllerStoryMode.Status.Ready) or self:IsStatus(ControllerStoryMode.Status.Start) then
		-- block empty
	elseif self:IsStatus(ControllerStoryMode.Status.Normal) then
		self:UpdateZoneAndArea(false)
		self:UpdateAudio()
		self:UpdateSan()
		self:UpdateEnemySpace()
		self:UpdateMonster()
		self:CheckCreateMonster()
		self:CheckSceneTimeLine(false)
		self:CheckDestroyMonster()
		self:CheckSceneMovie(false)
		self:CheckSceneDialog(false)
		self:UpdateSceneItem()
		self:CheckCarriage()
		self:CheckCurtain()
		self:CheckDoor()
		self:CheckGate()
		self:CheckBridge()
		self:CheckElevator()
		self:CheckCage()
		self:CheckCoverKick()
		self:CheckStairKick()
		self:CheckStair()
		self:CheckCrate()
		self:CheckVirtualWall()
		self:CheckRouteWall()
		self:CheckTutorial()
		self:CheckRoadSign()
		self:UpdateRecordTime()

		if MS_StoryList.IsStoryCarriage(self.storyId) == true then
			self:CheckMap()
			self:UpdateSceneMark()
		elseif MS_StoryList.IsStoryMazeStart(self.storyId) == true then
			self:CheckBonefire()

			if self.mazeHero ~= nil then
				for _, hero in pairs(self.mazeHero) do
					if hero ~= nil then
						hero:Update()
					end
				end
			end

			self:UpdateSceneMark()
		elseif MS_StoryList.IsStoryMaze(self.storyId) == true then
			self:CheckEntrance()
			self:CheckStatue()
			self:CheckFountain()
			self:CheckHoneypot()
			self:UpdateSceneMarkMaze()
		elseif MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self:CheckEntrance()
			self:UpdateSceneMarkMaze()
		elseif MS_StoryList.IsStoryDLC(self.storyId) == true then
			self:CheckRain()
			self:UpdateSceneMark()
		else
			self:UpdateSceneMark()
		end

		self:CheckSave()
	elseif self:IsStatus(ControllerStoryMode.Status.Dialog) then
		self.hostPlayer:Stop()

		if self.wearHero ~= nil then
			self.wearHero:Update()
		end
	elseif self:IsStatus(ControllerStoryMode.Status.Movie) then
		self.hostPlayer:Stop()

		if self.controllerMovie:IsPlaying() == true then
			self.controllerMovie:Update()
		else
			self:ExitMovie()
		end
	elseif self:IsStatus(ControllerStoryMode.Status.StoryEnterMove) then
		-- block empty
	elseif self:IsStatus(ControllerStoryMode.Status.TimeLineMove) then
		if self.hostPlayer:IsInTimeLine() == true then
			self:ChangeStatus(ControllerStoryMode.Status.TimeLine)
		end
	elseif self:IsStatus(ControllerStoryMode.Status.TimeLineLoadScene) then
		if self.sceneController:IsLoaded() == true then
			self.sceneController:StartSwitchScene()
			self:ChangeStatus(ControllerStoryMode.Status.TimeLineSwitchScene)
		end
	elseif self:IsStatus(ControllerStoryMode.Status.TimeLineSwitchScene) then
		if self.sceneController:IsLoaded() == true and self.sceneController:IsSwitchSceneFinish() == true then
			if self.timeLineChangeAreaPos ~= nil and self.timeLineChangeAreaRot ~= nil then
				self.hostPlayer:StopMovementImmediately(true)
				self.hostPlayer:SetPosByWorldPos(self.timeLineChangeAreaPos, true)
				self.hostPlayer:SetRotation(self.timeLineChangeAreaRot, true)

				self.timeLineChangeAreaPos = nil
				self.timeLineChangeAreaRot = nil
			end

			self:ChangeStatus(ControllerStoryMode.Status.Normal)
			self.sceneController:BackToBattle()
			self:CheckCreateMonster()
			self:CheckSceneDialog(false)
			self:CheckSceneMovie(false)
			self:CheckSceneTimeLine(false)

			if self.timeLineId == 450 or self.timeLineId == 540 then
				self.hostPlayer:PressResetState()
			end
		end
	elseif self:IsStatus(ControllerStoryMode.Status.TimeLine) then
		if self.timeLinePlayListControl ~= nil then
			local nowTime = TimeHelper.getNowTime()
			local diffTime = nowTime - self.statusTime

			if self.timeLineTimeOld <= MS_StoryTimeLine.TimeLineTriggerTime1 and diffTime > MS_StoryTimeLine.TimeLineTriggerTime1 then
				self:HandleTimeLineMiddle()
			elseif diffTime > MS_StoryTimeLine.TimeLineTriggerTime1 then
				local battleMode = self.timeLinePlayListControl:IsPlayerInBattleMode()

				if battleMode == true then
					self.hostPlayer:SetBattleMode(true)
				end
			end

			self.timeLineTimeOld = diffTime
		end
	elseif self:IsStatus(ControllerStoryMode.Status.Menu) then
		self.hostPlayer:Stop()
	elseif self:IsStatus(ControllerStoryMode.Status.Locator) then
		self.hostPlayer:Stop()
	elseif self:IsStatus(ControllerStoryMode.Status.MapReady) then
		self.hostPlayer:Stop()

		if self.cameraScene:IsAnimatorPlaying() == false then
			self:OpenMap()
		end
	elseif self:IsStatus(ControllerStoryMode.Status.MapOpen) then
		self.hostPlayer:Stop()

		if self.cameraScene:IsAnimatorPlaying() == false then
			UIManager.MovieMode(false)
			UIManager.SendMessage("Mainmenu", "OpenMap")
		end
	elseif self:IsStatus(ControllerStoryMode.Status.SelectHero) and self.selectedCompanion then
		for _, hero in pairs(self.selectedCompanion) do
			hero:Update()
		end
	end

	if self:IsStatus(ControllerStoryMode.Status.Normal) or self:IsStatus(ControllerStoryMode.Status.TimeLine) then
		self:UpdateTimeLine()
	end

	if self.monsterTempDeleteList ~= nil then
		for monsterId, _ in pairs(self.monsterTempDeleteList) do
			self:DestroyMonster(monsterId)
		end

		self.monsterTempDeleteList = nil
	end
end

function ControllerStoryMode:Exit()
	self.sanMonsterIndex = 0

	self:ClearAllTimeLine()

	if self.selectedCompanion ~= nil then
		for _, hero in pairs(self.selectedCompanion) do
			if hero ~= nil then
				hero:Exit()
			end
		end
	end

	self.selectedCompanion = nil

	if self.mazeHero ~= nil then
		for _, hero in pairs(self.mazeHero) do
			if hero ~= nil then
				hero:Exit()
			end
		end
	end

	self.mazeHero = nil

	if self.controllerMovie ~= nil then
		self.controllerMovie:Exit()

		self.controllerMovie = nil
	end

	self.enemySpaceList = nil
	self.monsterList = nil
	self.monsterDeadList = nil
	self.monsterAllList = nil
	self.monsterTempDeleteList = nil
	self.storySceneItemAllList = nil
	self.storySceneItemList = nil
	self.storySceneAttachItemList = nil
	self.storySceneItemPos = nil
	self.quickMenuList = nil
	self.storyMovieList = nil
	self.storyMovieAllList = nil
	self.storyTimeLineAllList = nil
	self.storyQuestWallList = nil
	self.storyQuestWallEnableList = nil
	self.storyQuestWallAllList = nil

	self:ClearSceneEffect()

	self.storyQuestEffectAllList = nil
	self.dialogSceneList = nil
	self.dialogRevertList = nil
	self.sanMonster = nil
	self.callHero = nil
	self.savePosition = nil
	self.carriagePosition = nil
	self.curtainList = nil
	self.doorSwitchPosition = nil
	self.doorHintPosition = nil
	self.gateStandPosition = nil
	self.gateStandLookPos = nil
	self.gateHintPosition = nil
	self.bridgeSwitchPosition = nil
	self.elevatorSwitchPosition = nil
	self.cageSwitchPosition = nil
	self.cageStandPosition = nil
	self.cageStandLook = nil
	self.stairTouchPos = nil
	self.stairTouchRot = nil
	self.stairKickStandPosition = nil
	self.stairKickStandLookPos = nil
	self.coverKickStandPosition = nil
	self.coverKickStandLookPos = nil
	self.cratePosition = nil
	self.crateStandPosition = nil
	self.virtualWallPosition = nil
	self.virtualWallHintPosition = nil
	self.entrancePosition = nil
	self.statuePosition = nil
	self.statueLook = nil
	self.fountainPosition = nil
	self.honeypotPosition = nil
	self.tutorialQuestList = nil

	if self.tutorialQuest ~= nil then
		for k, v in pairs(self.tutorialQuest) do
			local questData = MS_StoryQuest.GetQuestData(k)
			local questType = questData.QuestType

			if questType == ControllerStoryMode.QuestType.TimeLimit then
				self:CompleteQuest(k)
			end
		end
	end

	self.tutorialQuest = nil
	self.mapList = nil
	self.selectedCompanion = nil

	if self.wearHero ~= nil then
		self.wearHero:Exit()
	end

	self.wearHero = nil
	self.sceneMapData = nil
	self.timeLinePlant = nil
	self.timeLineChangeAreaPos = nil
	self.timeLineChangeAreaRot = nil
	self.trickList = nil
	self.storyRuleParam = nil
	self.frogSatisfyList = nil
	self.tutorialDelayList = nil
	self.markSceneItemQueue = nil
	self.markSceneItemMazeQueue = nil
	self.dynamicMeetingList = nil

	if self.roadSignList ~= nil then
		for id, roadSign in pairs(self.roadSignList) do
			if roadSign ~= nil then
				roadSign:Exit()
			end
		end

		self.roadSignList = nil
	end

	if self.rainList ~= nil then
		for k, rain in pairs(self.rainList) do
			if rain ~= nil then
				rain:Exit()
			end
		end

		self.rainList = nil
	end

	if ReqLogin then
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.ADD_BAG_ITEM)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.UPDATE_BAG_ITEM)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.REMOVE_BAG_ITEM)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.BATTLE_BAG_UPDATE_DONE)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.REQ_UPDATE_BATTLE_BAG)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.RESP_SAVE_SHORTCUT_DONE)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.RESP_SAVE_STAGE_DONE)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.BAG_IS_FULL)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.BAG_ITEM_NOT_FOUND)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.BAG_ITEM_CONFIG_NOT_FOUND)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBag.BAG_ITEM_NOT_ENOUGH)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_BATTLE_RESULT)
	end

	ControllerModeBase.Exit(self)
end

function ControllerStoryMode:ChangeStatus(status)
	local oldStatus = self.status

	self.status = status

	if self.status ~= oldStatus then
		self.statusTime = TimeHelper.getNowTime()

		if oldStatus == ControllerStoryMode.Status.Movie then
			self:RestartMonster()
			self.hostPlayer:Restart()
			self.sceneController:ExitMovie()
			self:UpdateQuality(false)
			Common.ClearMemory()
		elseif oldStatus == ControllerStoryMode.Status.TimeLine then
			if self:IsStatus(ControllerStoryMode.Status.TimeLineLoadScene) == false then
				self:RestartMonster()
				self.hostPlayer:Restart()
				self.sceneController:ExitTimeLine()
			end
		elseif oldStatus == ControllerStoryMode.Status.TimeLineSwitchScene then
			self:RestartMonster()
			self.hostPlayer:Restart()
			self.sceneController:ExitTimeLineLoadScene()
		elseif oldStatus == ControllerStoryMode.Status.Dialog then
			self:RestartMonster()
			self.hostPlayer:Restart()
			self.sceneController:ExitDialog()
			self:UpdateQuality(false)
			Common.ClearMemory()
		elseif oldStatus == ControllerStoryMode.Status.Menu then
			self:RestartMonster()
			self.hostPlayer:Restart()
		elseif oldStatus == ControllerStoryMode.Status.Locator then
			UIManager.SendMessage("Mainmenu", "FadeIn")
			self:RestartMonster()
			self.hostPlayer:Restart()
		elseif oldStatus == ControllerStoryMode.Status.MapOpen then
			self.hostPlayer:Restart()
		elseif oldStatus == ControllerStoryMode.Status.Normal then
			self.sanSceneTimeEnd = 0

			self:ClearIconAll()
		elseif oldStatus == ControllerStoryMode.Status.SelectHero then
			self:ShowAnimalAll(true)
		elseif oldStatus == ControllerStoryMode.Status.DarkForestConfirm or oldStatus == ControllerStoryMode.Status.MazeConfirm then
			self.controllerTimer:ResumeTime(ControllerTimer.Priority.Menu)
		end

		if self:IsStatus(ControllerStoryMode.Status.Normal) then
			self.saveTime = 0
		elseif self:IsStatus(ControllerStoryMode.Status.Movie) then
			if self.storyMovieAllList ~= nil then
				self.loadCharacterManager:DestroyCharacterCache()
				VfxManager.ClearCache()
				self:ResetAndStopMonster()
				self.sceneController:EnterMovie()
			end

			self.scene:ShowPointLight(false, true)
		elseif self:IsStatus(ControllerStoryMode.Status.StoryEnterMove) then
			self:StoryEnterMoveInit()
		elseif self:IsStatus(ControllerStoryMode.Status.TimeLineMove) then
			self.timeLineTimeOld = 0

			self.sceneController:EnterTimeLineMove()
			UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.TimeLine, false)
			UIManager.SendMessage("Mainmenu", "SetTimeLineButton", 0)
		elseif self:IsStatus(ControllerStoryMode.Status.TimeLineLoadScene) then
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
			UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.TimeLine, false)
			UIManager.SendMessage("Mainmenu", "SetTimeLineButton", 0)
		elseif self:IsStatus(ControllerStoryMode.Status.TimeLine) then
			self:ResetAndStopMonster()

			self.timeLineTimeOld = 0

			if self.timeLinePlayListControl ~= nil then
				local animalNum, monsterIdList = self.timeLinePlayListControl:GetBindMonsterIdList()
				local animalList

				if animalNum > 0 and monsterIdList ~= nil then
					for i = 0, animalNum - 1 do
						local tmpMonsterId = monsterIdList[i]

						if tmpMonsterId > 0 then
							local monster = self:GetMonsterIncludeDead(tmpMonsterId)

							if monster ~= nil then
								if animalList == nil then
									animalList = {}
								end

								animalList[tmpMonsterId] = monster
							else
								local monster = self:CheckCreateMonsterById(tmpMonsterId)

								if monster ~= nil then
									if animalList == nil then
										animalList = {}
									end

									animalList[tmpMonsterId] = monster
								else
									SystemHelper.LogError("===========TimeLine==Monster Not Found!!======tmpMonsterId=" .. tmpMonsterId .. ",timeLineId=" .. self.timeLinePlayListControl:GetTimeLineId())
								end
							end
						end
					end
				end

				self.timeLineAnimalListControl = animalList

				local switchPlayer = self.timeLinePlayListControl:IsSwitchPlayer()

				self.timeLineSwitchPlayer = nil

				if switchPlayer == true then
					self.timeLineSwitchPlayer = self.sceneController:StartSwitchHostPlayerInTimeLine()
				end

				local controlCrow = self.timeLinePlayListControl:IsControlCrow()
				local crow

				if controlCrow == true then
					crow = self.sceneController:GetCrow()
				end

				local colliderIgnore = self.timeLinePlayListControl:IsColliderIgnore()

				if colliderIgnore == true then
					self.hostPlayer:SetMoveGhost(true)
				end

				self.timeLinePlayListControl:Play(self.timeLineSwitchPlayer, crow, animalList)

				if self.timeLineSwitchPlayer == nil then
					if self.storyId == MS_StoryData.StoryId10004 and self.timeLineId == 1 then
						local hostPlayer2 = self.sceneController:GetSecondaryHostPlayer()

						if hostPlayer2 ~= nil and hostPlayer2:GetHeroId() ~= 10001 and hostPlayer2:GetHeroId() ~= hostPlayer2:GetHeroIdWithSkin() then
							self.timeLinePlayListControl:PlaySecondaryPlayer(hostPlayer2:GetHeroIdWithSkin(), hostPlayer2:GetHeroId())
						end
					elseif self.storyId == MS_StoryData.StoryId10008 and self.timeLineId == 7 then
						local hostPlayer2 = self.sceneController:GetSecondaryHostPlayer()

						if hostPlayer2 ~= nil then
							if hostPlayer2:GetHeroId() == 10001 then
								self.timeLinePlayListControl:PlaySecondaryPlayer(hostPlayer2:GetHeroIdWithSkin(), hostPlayer2:GetHeroIdWithSkin())
							elseif hostPlayer2:GetHeroId() ~= hostPlayer2:GetHeroIdWithSkin() then
								self.timeLinePlayListControl:PlaySecondaryPlayer(hostPlayer2:GetHeroIdWithSkin(), hostPlayer2:GetHeroId())
							end
						end
					end
				end

				self.sceneController:StartTimeLineConfig()

				local areaId = self.timeLinePlayListControl:GetToArea()

				if areaId > 0 then
					self.scene:InitArea(areaId, true)
					self.sceneController:ChangeArea(areaId, true)
				else
					self.sceneController:EnterTimeLine()
				end

				local tmpRet, inBlackCurtain = UIManager.ReceiveMessage("Curtain", "IsInBlackCurtain")

				if tmpRet == true and inBlackCurtain == true then
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
				end
			end

			UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.TimeLine, false)
			UIManager.SendMessage("Mainmenu", "SetTimeLineButton", 0)
		elseif self:IsStatus(ControllerStoryMode.Status.Dialog) then
			self:ResetAndStopMonster()
			self.sceneController:EnterDialog()
			self.scene:ShowPointLight(false, true)
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.2)
		elseif self:IsStatus(ControllerStoryMode.Status.Menu) then
			self:ResetAndStopMonster()
			Common.ClearMemory()
		elseif self:IsStatus(ControllerStoryMode.Status.Locator) then
			UIManager.SendMessage("Mainmenu", "FadeOut", 0.7, true)
			self:ResetAndStopMonster()
		elseif self:IsStatus(ControllerStoryMode.Status.SelectHero) then
			self:ShowAnimalAll(false)
		elseif self:IsStatus(ControllerStoryMode.Status.DarkForestConfirm) or self:IsStatus(ControllerStoryMode.Status.MazeConfirm) then
			UIManager.SendMessage("Mainmenu", "ForceClosingShortcutItems")
			self.controllerTimer:PauseTime(ControllerTimer.Priority.Menu)
		end
	end

	self.gameFrame = 0
end

function ControllerStoryMode:IsStatus(status)
	if self.status == status then
		return true
	end

	return false
end

function ControllerStoryMode:IsBossMode()
	return self.bossMode
end

function ControllerStoryMode:GetBossId()
	return self.bossId
end

function ControllerStoryMode:IsHaveBossMovie(movieType, monsterId)
	if self.storyMovieAllList ~= nil then
		local hostPos = self.hostPlayer:GetPosByWorldPos()

		for id, movieData in pairs(self.storyMovieAllList) do
			if movieData ~= nil and movieData.Type == movieType and monsterId == tonumber(movieData.MonsterId) then
				return true
			end
		end
	end

	return false
end

function ControllerStoryMode:CheckMovieByType(type, param)
	if self.storyMovieAllList ~= nil then
		local hostPos = self.hostPlayer:GetPosByWorldPos()

		for id, movieData in pairs(self.storyMovieAllList) do
			if movieData ~= nil and movieData.Type == type then
				local posIndex = tonumber(movieData.Position)

				if posIndex > 0 and self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
					if type == MS_StoryMovie.Type.BossShow then
						if movieData.ZoneId == param then
							return id, 1
						end
					elseif type == MS_StoryMovie.Type.HostPlayerDead then
						return id, 1
					else
						local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Movie, posIndex)

						if locatorData ~= nil then
							local indexList = locatorData.MovieIndex

							for i = 1, #indexList do
								local tmpIndex = indexList[i]
								local dis = Vector3.DistanceSquare(locatorData["StartPosition" .. tmpIndex], hostPos)
								local radius = locatorData["StartRadius" .. tmpIndex]

								if dis < radius * radius then
									return id, tmpIndex
								end
							end
						end
					end
				end
			end
		end
	end

	return 0, 0
end

function ControllerStoryMode:TestBoss()
	if self.bossMode == true and self.bossId > 0 and self.bossId > 0 and self.monsterList[self.bossId] ~= nil then
		local tmpBoss = self.monsterList[self.bossId].monster

		if tmpBoss ~= nil then
			tmpBoss:GetValue():SetPropertyToZero(MS_HeroData.Property.Hp)

			if tmpBoss:IsWillDead() == true then
				tmpBoss:WillDead(nil, nil)
			end
		end
	end
end

function ControllerStoryMode:EnterBossMode(id)
	if self.bossMode == false and id > 0 then
		self.bossId = id
		self.bossMode = true
		self.bossZone = false
		self.hpAddItemUseNumForAI = 0
		self.bossFinalHitTimeStep = ControllerStoryMode.SlowTimeStep.Empty
		self.bossGradeUpTimeStep = ControllerStoryMode.SlowTimeStep.Empty

		if self.bossId > 0 then
			local data = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self.bossId)

			if data ~= nil then
				if data.BossFinal > 0 then
					self.sceneController:BossEnterConfig()

					if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.storyId ~= FS_SaveStory.ArcadeStoryIdMax - 1000 then
						local bgmStoryId = self.storyId - 1000

						AudioCtrl.SetBattleBGM(bgmStoryId, true)
					else
						AudioCtrl.SetBattleBGM(self.storyId, true)
					end
				elseif data.IsBoss > 0 and MS_StoryList.IsStoryDLC(self.storyId) == true then
					AudioCtrl.SetBattleBGM(self.storyId, true)
				end
			end

			local tmpBoss = self:GetMonster(self.bossId)

			if tmpBoss ~= nil and tmpBoss:IsDead() == false and tmpBoss:IsShow() == true then
				tmpBoss:StartBattle()
			end
		end

		self.cameraScene:SetBossMode(true, self.bossId)
		self:ClearMonsterAll(false)
		self.loadCharacterManager:DestroyCharacterCache()
		self:LockSanMin(true)
	end
end

function ControllerStoryMode:ExitBossMode()
	if self.bossMode == true then
		self:LockSanMin(false)

		if self.bossId > 0 then
			local tmpBoss = self:GetMonsterIncludeDead(self.bossId)

			if tmpBoss ~= nil then
				tmpBoss:ResetGrade()
				tmpBoss:ExitBattle()
			end

			local data = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self.bossId)

			if data ~= nil then
				if data.BossFinal > 0 then
					self:ClearCallMonsterAll()
					self.sceneController:BossEndConfig(false)

					if MS_StoryList.IsStoryMazeBoss(self.storyId) == false then
						self:RecoveryProperty(true)
					else
						self:RecoveryProperty(false)
					end

					if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.storyId ~= FS_SaveStory.ArcadeStoryIdMax - 1000 then
						local bgmStoryId = self.storyId - 1000

						AudioCtrl.SetBattleBGM(bgmStoryId, false)
					else
						AudioCtrl.SetBattleBGM(self.storyId, false)
					end
				else
					self:RecoveryProperty(false)

					if data.IsBoss > 0 and MS_StoryList.IsStoryDLC(self.storyId) == true then
						AudioCtrl.SetBattleBGM(self.storyId, false)
					end
				end
			end
		end

		if self.hostPlayer ~= nil then
			self.hostPlayer:ExitBattle()
		end

		if self.controllerBullet ~= nil then
			self.controllerBullet:ClearBulletAll()
		end

		if self.controllerCollider ~= nil then
			self.controllerCollider:ClearColliderAll()
		end

		self.scene:ClearTrapAll()

		self.bossId = 0
		self.bossMode = false
		self.bossZone = false
		self.bossFinalHitTimeStep = ControllerStoryMode.SlowTimeStep.Empty
		self.bossGradeUpTimeStep = ControllerStoryMode.SlowTimeStep.Empty

		UIManager.SendMessage("Mainmenu", "ShowBossHpBar", false)
		self.cameraScene:SetBossMode(false, 0)
		self:ResumeAttack()

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) and FS_UserData.story:GetStoryId() ~= FS_SaveStory.ArcadeStoryIdMax - 1000 then
			self:Save(ControllerStoryMode.SaveType.SaveAutoTime)
		end
	end
end

function ControllerStoryMode:Start()
	ControllerModeBase.Start(self)
	UIManager.SendMessage("Mainmenu", "SetGuideStoryId", self.storyId)

	local storyData = MS_StoryList.GetStoryData(self.storyId)

	if self.cameraScene ~= nil and storyData ~= nil then
		self.cameraScene:SetPositionMinY(storyData.cameraMinY)
	end

	self.sanSceneTimeEnd = 0

	self.scene:StartAltar()

	if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		local mazeId = FS_UserData.story:GetMazeId()
		local mazeFloor = FS_UserData.story:GetMazeFloor()
		local bossId = MS_StoryMaze.GetMazeBossId(mazeId, mazeFloor, self.storyId, self.areaId)

		if bossId > 0 and FS_UserData.story:IsMonsterDead(bossId) == false then
			self:EnterBossMode(bossId)
			UIManager.SendMessage("Mainmenu", "ShowMazeBar", false)
			UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", false)
		else
			local tmpPos = self.scene:GetSceneSkillPointPos(SceneBase.MazeBossEntrancePoint)

			if FS_UserData.story:IsMazeFloorMax() == true then
				self.scene:AddEntrance(tmpPos, Vector3.s_forward, Entrance.Type.Final)

				if FS_UserData.story:IsHaveMazeFinalFloor() == true then
					local tmpPos2 = self.scene:GetSceneSkillPointPos(SceneBase.MazeBossEntrancePoint2)

					self.scene:AppendEntrance(tmpPos2, Vector3.s_forward, Entrance.Type.Additional)
				end
			else
				self.scene:AddEntrance(tmpPos, Vector3.s_forward, Entrance.Type.Common)
			end

			UIManager.SendMessage("Mainmenu", "ShowMazeBar", true)
			UIManager.SendMessage("Mainmenu", "SetMazeProgress", 1)

			if MS_StoryMaze.IsMazeFinalFloor(mazeId, mazeFloor) then
				UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", false)
			else
				UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", true)
				UIManager.SendMessage("Mainmenu", "InitMazeBossBar", MS_StoryMaze.GetMazeFloorMax(mazeId))
				UIManager.SendMessage("Mainmenu", "SetMazeBossStep", mazeFloor)
			end
		end
	elseif MS_StoryList.IsStoryMaze(self.storyId) == true then
		local mazeId = FS_UserData.story:GetMazeId()
		local mazeFloor = FS_UserData.story:GetMazeFloor()

		UIManager.SendMessage("Mainmenu", "ShowMazeBar", true)
		FS_UserData.story:AddMazeBossBar(0)
		UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", true)
		UIManager.SendMessage("Mainmenu", "InitMazeBossBar", MS_StoryMaze.GetMazeFloorMax(mazeId))
		UIManager.SendMessage("Mainmenu", "SetMazeBossStep", mazeFloor - 1)

		if FS_UserData.story:IsMazeBossBarFull() == true then
			self.scene:AddEntrance(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), Entrance.Type.Common)
		end
	elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		self.bossChallengeStartTime = ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime()

		if MS_StoryList.IsBossChallenge(self.storyId) then
			local bossId = MS_StoryChallenge.GetBossId(self.storyId, self.areaId)

			self:EnterBossMode(bossId)
		end

		UIManager.SendMessage("Mainmenu", "ShowMazeBar", false)
		UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", false)
	else
		UIManager.SendMessage("Mainmenu", "ShowMazeBar", false)
		UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", false)
	end
end

function ControllerStoryMode.EnterStoryCallBack()
	local gameController = ST_Main.GetSceneController():GetGameController()

	gameController:StoryEnterMove()
end

function ControllerStoryMode:StoryEnterMove()
	return
end

function ControllerStoryMode:StoryEnterMoveInit()
	return
end

function ControllerStoryMode:BossDead()
	ControllerModeBase.BossDead(self)
end

function ControllerStoryMode:IsHaveGradeUpMovie(animal)
	if self.storyMovieAllList ~= nil and animal ~= nil and self.hostPlayer:IsWillDead() == false then
		local monsterId = animal:GetStoryMonsterId()

		for id, movieData in pairs(self.storyMovieAllList) do
			if movieData ~= nil and movieData.Type == MS_StoryMovie.Type.BossGradeUp and monsterId == tonumber(movieData.MonsterId) and self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
				return true
			end
		end
	end

	return false
end

function ControllerStoryMode:BossGradeUpReady(animal)
	if self.bossGradeUpTimeStep == ControllerStoryMode.SlowTimeStep.Empty then
		self.bossGradeUpTimeStep = ControllerStoryMode.SlowTimeStep.Wait

		UIManager.SendMessage("Mainmenu", "ForceClosingShortcutItems")
		self.controllerTimer:SetTimeScale(ControllerTimer.Priority.GameMode, ControllerStoryMode.BossDeadSlowTime, 0, -1, 0)
		UIManager.SendMessage("Curtain", "BlackFadeIn", ControllerStoryMode.BossGradeUpBlackTime, 0, function()
			self.bossGradeUpTimeStep = ControllerStoryMode.SlowTimeStep.End
		end, ControllerStoryMode.BossBlackAlphaTarget)
		self:StopAttack()

		return true
	end

	return false
end

function ControllerStoryMode:BossGradeUp(animal)
	ControllerModeBase.BossGradeUp(self, animal)

	if self.storyMovieAllList ~= nil and animal ~= nil and self.hostPlayer:IsWillDead() == false then
		local monsterId = animal:GetStoryMonsterId()

		for id, movieData in pairs(self.storyMovieAllList) do
			if movieData ~= nil and movieData.Type == MS_StoryMovie.Type.BossGradeUp and monsterId == tonumber(movieData.MonsterId) and self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
				if AppVer ~= AppDemoCJReview and DebugSkipMovie == false then
					self:EnterMovie(id, 1)

					self.storyMovieTarget = animal

					if self.bossMode == true and self.bossId > 0 and animal:GetStoryMonsterId() == self.bossId then
						local data = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self.bossId)

						if data ~= nil and data.BossFinal > 0 and animal:GetGrade() > animal:GetGradeThreshold() then
							self.sceneController:BossGradeUpConfig()
						end
					end

					return true
				else
					self:CompleteQuest(movieData.CompleteQuestId)
				end
			end
		end
	end

	return false
end

function ControllerStoryMode:InitArea()
	self.storyId = FS_UserData.story:GetStoryId()
	self.pattern = FS_UserData.story:GetPattern()
	self.areaId = FS_UserData.story:GetAreaId()
	self.storyLoop = FS_UserData.story:GetLogicLoop()
	self.levelKey = "Level_" .. self.storyLoop

	if DebugTestMemory == true then
		self.monsterAllList = {}
	else
		self.monsterAllList = MS_StoryMonster.GetStoryMonsterArea(self.storyId, self.pattern, self.areaId)

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			self.monsterAllList[8023] = nil
		end
	end

	self.monsterSanAllList = MS_StoryMonster.GetSanStoryMonster(self.storyId, self.pattern, self.areaId)

	self.scene:InitArea(self.areaId, false)
end

function ControllerStoryMode:SetScene(tmpScene)
	ControllerModeBase.SetScene(self, tmpScene)

	if self.scene ~= nil then
		self.scene:InitArea(self.areaId, false)
	end

	if self.controllerMovie ~= nil then
		self.controllerMovie:SetScene(tmpScene)
	end

	self:InitSceneWall()
	self:CheckSceneWall()
	self:InitSceneEffect()
	self:CheckSceneEffect()
end

function ControllerStoryMode:ExitScene(tmpScene)
	ControllerModeBase.ExitScene(self, tmpScene)

	if tmpScene ~= nil and self.scene ~= nil and tmpScene:GetSceneId() == self.scene:GetSceneId() then
		self:ClearSceneEffect()
	end
end

function ControllerStoryMode:EnterArea(changeScene)
	if self.transferPortId <= 0 or self.transferUse == false then
		local ret = self:CheckSceneMovie(true)

		if ret == false then
			ret = self:CheckSceneTimeLine(true)

			if ret == false then
				ret = self:CheckCarriageArrive()

				if ret == false then
					self.sceneController:EnterNormal()
					self:SwitchMovieAudio(1)
				end
			end
		end

		FS_UserData.story:ClearCarriageArriveId()
	else
		self.hostPlayer:ChangeToTransferEnd(self.transferPortId)
		self.cameraScene:ChangeSubPlayer(nil, true)
		self.sceneController:EnterNormal()
		self:SwitchMovieAudio(1)
	end

	self.transferPortId = 0
	self.transferItemId = 0
	self.transferUse = false

	if self.hostPlayer:IsDead() == true then
		self:HostPlayerReborn()
	end

	if FS_UserData.story:IsFirstLoad() == false and changeScene == true then
		self:Save(ControllerStoryMode.SaveType.SaveReborn)
	end

	FS_UserData.story:SetFirstLoad(false)
	FS_UserData.story:RecordStageTime(self.storyId, self.sceneController:GetHostPlayerHeroId())
end

function ControllerStoryMode:DebugRefreshArea()
	local pos = self.hostPlayer:GetPosByWorldPos()
	local ret = XPhysics.Raycast(pos.x, pos.y + 0.5, pos.z, 0, -1, 0, 100, LayerMask.GetMask("Ground"))

	if ret == true then
		local sceneName = XPhysics.GetHitGroundSceneName()

		if StringHelper.StartsWith(sceneName, "Arena") == true then
			local areaStr = StringHelper.Substring(sceneName, 7, 7)
			local areaId = tonumber(areaStr)

			self.sceneController:ChangeArea(areaId, false)
			SystemHelper.LogTest("===DebugRefreshArea=====areaId=" .. areaId)
		end
	end
end

function ControllerStoryMode:InitData()
	self.enemySpaceList = nil
	self.monsterList = {}
	self.monsterDeadList = {}
	self.monsterTempDeleteList = nil
	self.storySceneItemAllList = MS_StoryItem.GetStoryItem(self.storyId)
	self.storySceneItemList = {}
	self.storySceneAttachItemList = {}
	self.storySceneItemPos = {}
	self.storySceneItemEatId = 0
	self.storyDropItemEatIndex = 0
	self.storyGetItemEffectCD = 0
	self.hpAddItemUseNumForAI = 0
	self.frogItemId = 0
	self.frogItemNum = 0
	self.bossChallengeStartTime = 0
	self.bossChallengeTotalTime = 0
	self.ChallengePerfect = true
	self.challengeSuccess = false
	self.roadSignList = {}
	self.rainList = {}
	self.quickMenuList = {}

	local num = self.sceneController:GetHostPlayerListNum()

	for i = 1, num do
		local player = self.sceneController:GetHostPlayerByIndex(i)

		if player ~= nil then
			local tmpHeroId = player:GetHeroId()
			local tmpHeroData = FS_UserData.heroList:GetHero(tmpHeroId)

			if tmpHeroData then
				self.quickMenuList[tmpHeroId] = {}

				local tmpMainShortcutId = tmpHeroData:GetMainShortcutIndex()

				for j = 1, FS_HeroData.QuickMenuMax do
					local t = {
						itemId = 0,
						default = false,
						lock = false
					}
					local tmpItemId = tmpHeroData:GetShortcut(j)

					if tmpItemId > 0 then
						t.itemId = tmpItemId
					end

					if tmpMainShortcutId == j then
						t.default = true
					end

					self.quickMenuList[tmpHeroId][j] = t
				end
			end
		end
	end

	self.storyMovieList = {}
	self.storyMovieAllList = MS_StoryMovie.GetStoryMovie(self.storyId)
	self.storyMovieIdNow = 0
	self.storyMovieTarget = nil
	self.storyMoviePosIndex = 0
	self.storyTimeLineAllList = MS_StoryTimeLine.GetStoryTimeLineAll(self.storyId)
	self.storyQuestWallEnableList = nil
	self.storyQuestWallList = nil
	self.storyQuestWallAllList = MS_StoryWall.GetStoryQuestWall(self.storyId)
	self.storyQuestEffectEnableList = nil
	self.storyQuestEffectList = nil
	self.storyMazeEntrance = nil
	self.storyMazeBossEntranceList = nil
	self.storyQuestEffectAllList = MS_StoryEffect.GetStoryQuestEffect(self.storyId)

	if MS_StoryList.IsStoryMaze(self.storyId) == false and MS_StoryList.IsStoryMazeBoss(self.storyId) == false then
		self.dialogSceneList = MS_StoryDialog.GetStorySceneDialogList(self.storyId)
	else
		self.dialogSceneList = MS_StoryDialog.GetStorySceneDialogList(MS_StoryData.StoryIdMazeStart)
	end

	self.dialogRevertList = nil
	self.dialogIdNext = 0
	self.dialogIdNow = 0
	self.dialogInteractType = 0
	self.saveId = 0
	self.savePosition = Vector3.s_zero
	self.saveStatus = ControllerStoryMode.SaveStatus.Start
	self.saveTime = 0
	self.saveHeroIndex = 0
	self.carriageId = 0
	self.carriagePosition = Vector3.s_zero
	self.curtainList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Curtain)
	self.doorId = 0
	self.doorSwitchId = 0
	self.doorAnimatorType = 0
	self.doorSwitchPosition = Vector3.s_zero
	self.doorHintId = 0
	self.doorHintForward = false
	self.doorHintPosition = Vector3.s_zero
	self.gateId = 0
	self.gateStandPosition = Vector3.s_zero
	self.gateStandLookPos = Vector3.s_zero
	self.gateHintId = 0
	self.gateHintFoward = false
	self.gateHintPosition = Vector3.s_zero
	self.bridgeId = 0
	self.bridgeSwitchPosition = Vector3.s_zero
	self.elevatorId = 0
	self.elevatorFloor = 0
	self.evevatorInner = 0
	self.elevatorSwitchIndex = 0
	self.elevatorSwitchPosition = Vector3.s_zero
	self.cageId = 0
	self.cageSwitchIndex = 0
	self.cageSwitchPosition = Vector3.s_zero
	self.cageStandPosition = Vector3.s_zero
	self.cageStandLook = Vector3.s_zero
	self.stairId = 0
	self.stairTouchType = AnimalBase_Define.StairTouch.Empty
	self.stairTouchPos = Vector3.s_zero
	self.stairTouchRot = Quaternion.s_identity
	self.stairKickId = 0
	self.stairKickStandPosition = Vector3.s_zero
	self.stairKickStandLookPos = Vector3.s_zero
	self.coverKickId = 0
	self.coverKickStandPosition = Vector3.s_zero
	self.coverKickStandLookPos = Vector3.s_zero
	self.coverKickHintId = 0
	self.coverKickHintPosition = Vector3.s_zero
	self.crateId = 0
	self.cratePosition = Vector3.s_zero
	self.crateStandPosition = Vector3.s_zero
	self.virtualWallId = 0
	self.virtualWallPosition = Vector3.s_zero
	self.virtualWallHintId = 0
	self.virtualWallHintPosition = Vector3.s_zero
	self.entranceId = 0
	self.entrancePosition = Vector3.s_zero
	self.statueId = 0
	self.statuePosition = Vector3.s_zero
	self.statueLook = Vector3.s_forward
	self.fountainId = 0
	self.fountainPosition = Vector3.s_zero
	self.honeypotId = 0
	self.honeypotPosition = Vector3.s_zero
	self.timeLineId = 0
	self.timeLinePlayList = nil
	self.timeLinePlayListControl = nil
	self.timeLineAnimalListControl = nil
	self.timeLinePlayTrigger = 0
	self.timeLineSwitchPlayer = nil
	self.timeLineSkip = false
	self.timeLineChangeAreaPos = nil
	self.timeLineChangeAreaRot = nil
	self.tutorialQuestList = MS_StoryTutorial.GetStoryTutorial(MS_StoryList.IsStoryMaze(self.storyId))
	self.tutorialQuest = {}
	self.tutorialDelayList = {}
	self.markSceneItemQueue = {}
	self.markSceneItemMazeQueue = {}
	self.tutorialCompleteId = 0
	self.tutorialCompleteTime = 0
	self.bossZone = false
	self.bossMode = false
	self.bossId = 0
	self.bossFinalHitTimeStep = ControllerStoryMode.SlowTimeStep.Empty
	self.bossGradeUpTimeStep = ControllerStoryMode.SlowTimeStep.Empty
	self.bossRevertQuest = nil
	self.seriesStoryRevertQuest = nil
	self.groundIdOld = nil
	self.groundId = nil
	self.areaTypeOld = 0
	self.areaType = 0
	self.zoneTypeOld = 0
	self.zoneType = 0
	self.zoneId = 0
	self.reverbIdOld = 0
	self.reverbId = 0
	self.groundType = 0
	self.altitudeOld = 0
	self.altitude = 0
	self.trickList = nil

	self:UpdateUIBag()
	self:UpdateUITrophy()
	self:UpdateUIQuickMenu()

	self.mapList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Map)
	self.bornSanPosList = {}

	local bornSanList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.BornSan)

	for id, locatorData in pairs(bornSanList) do
		local pos = locatorData.Position
		local tmpData = {}

		tmpData.Position = pos
		tmpData.Time = 0
		tmpData.Distance = -1
		self.bornSanPosList[id] = tmpData
	end

	self.selectedCompanion = nil
	self.wearHero = nil
	self.mazeHero = nil
	self.sceneMapData = nil

	self:InitSceneMapData()

	self.sanSceneTimeEnd = 0

	self:InitCrow()

	self.status = 0
	self.statusTime = 0
	self.timeLineTimeOld = 0
	self.deadMonsterHeroId = 0
	self.roadSignIndex = 0
	self.storyEnterMoving = false
	self.storyEnterTime = 0
	self.storyEnterTimeOld = 0
	self.timeLinePlant = {}
	self.frogSatisfyList = {}
	self.storyRuleParam = nil
	self.rebornPropertyRateList = {}
	self.rebornPropertyRateList[MS_HeroData.Property.Hp] = AnimalBase_Value_Define.ForceRebornHpRate
	self.rebornPropertyRateList[MS_HeroData.Property.San] = AnimalBase_Value_Define.ForceRebornSanRate
	self.dynamicMeetingList = {}

	if FS_UserData.itemList:GetItemNum(MS_ItemData.SceneMarkItem) == 0 then
		self:AddBagItem(MS_ItemData.SceneMarkItem, 1, true)
	end

	self:Patch()

	if FS_UserData.story:IsFirstLoad() == false and MS_StoryList.IsStoryMaze(self.storyId) == false and MS_StoryList.IsStoryMazeBoss(self.storyId) == false then
		FS_UserData.heroList:AddHpToMax()
	end

	if AppVer == AppDemoCJReview then
		self:AddBagItem(MS_ItemData.ItemID_ExpAdd, 20, true)
		self:AddBagItem(40002, 20, true)
		self:AddBagItem(40003, 10, true)
		self:AddBagItem(40004, 5, true)
		self:AddBagItem(30001, 10, true)
		self:SetQuickList(1, 30001)
		self:SetQuickMenu(1)
	end

	self:UpdateUIBag()

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		UIManager.SendMessage("Mainmenu", "ShowRecordScore", FS_UserData.story:GetStageScoreAll())

		if FS_UserData.itemList:GetItemNum(MS_ItemData.TeleportInArcadeMode) == 0 then
			self:AddBagItem(MS_ItemData.TeleportInArcadeMode, 1, true)
		end

		self:SetQuickList(1, MS_ItemData.TeleportInArcadeMode)
		self:SetQuickMenu(1)

		if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
			FS_UserData.InitArcadeHeroTalent(10007)
		end

		if FS_UserData.story:IsFirstLoad() == false then
			FS_UserData.heroList:AddHpToMax()
			self:HostPlayerReborn()
		end
	end
end

function ControllerStoryMode:Patch()
	local patchList = MS_StoryPatch.GetPatchList()

	for k, v in pairs(patchList) do
		if self:CheckShowQuestComplete(v.ShowQuestId) == true and self:CheckHideQuestComplete(v.HideQuestId) == false then
			self:CompleteQuest(v.CompleteQuestId)
		end
	end

	local patchId = FS_UserData.story:GetPatchId()

	if patchId < 20200410 then
		local loop = FS_UserData.story:GetLoop()

		if loop > 4 then
			self:RecordAchievement(MS_Achievement.AchievementIdType.CompleteFourTimesGameWithoutNoobItem, 1)
		elseif loop == 4 then
			if self:IsQuestAllComplete("88888") then
				self:RecordAchievement(MS_Achievement.AchievementIdType.CompleteFourTimesGameWithoutNoobItem, 1)
			elseif FS_UserData.itemList:GetItemNum(MS_ItemData.NoobItem) == 0 then
				FS_UserData.story:ResetHadNoobItem()
			end
		end

		if FS_UserData.heroList:IsAllTalentMax() then
			self:RecordAchievement(MS_Achievement.AchievementIdType.AddAllTalent, 1)
		end

		local trophyCount = 0
		local trophylist = FS_UserData.itemList:GetTrophyList()

		for k, v in pairs(trophylist) do
			if v:GetLevel() == MS_ItemData.TrophyStrengthLevelMax then
				trophyCount = trophyCount + 1
			end
		end

		for i = 1, 6 do
			local trophy = FS_UserData.trophy:GetTrophy(i)

			if trophy ~= nil and trophy:GetLevel() == MS_ItemData.TrophyStrengthLevelMax then
				trophyCount = trophyCount + 1
			end
		end

		if trophyCount > 5 then
			for i = 1, 6 do
				self:RecordAchievement(MS_Achievement.AchievementIdType.StrengthTrophySix, 1)
			end
		end

		if FS_UserData.story:GetLoop() > 1 then
			self:RecordAchievement(MS_Achievement.AchievementIdType.PlaySecondTime, 1)
		end

		FS_UserData.story:SetPatchId(20200410)
	end
end

function ControllerStoryMode:InitPlayer()
	ControllerStoryMode.monsterIdStart = BattleData.AnimalId_Enemy

	FS_BattleData_StoryMode.initialize()
	self.hostPlayer:GetValue():SetRebornFrame(0)
	self.hostPlayer:GetValue():SetRebornEnable(false)

	self.sanMonster = nil
	self.sanMonsterIndex = 0
	self.callHero = nil
end

function ControllerStoryMode:UpdateHostPlayer(isReborn)
	ControllerModeBase.UpdateHostPlayer(self, isReborn)
	self.hostPlayer:GetValue():SetRebornFrame(0)
	self.hostPlayer:GetValue():SetRebornEnable(false)
	self.hostPlayer:GetValue():ShowValue()

	if self.quickMenuList ~= nil then
		local tmpHeroId = self.hostPlayer:GetHeroId()
		local tmpHeroData = FS_UserData.heroList:GetHero(tmpHeroId)

		if tmpHeroData ~= nil and tmpHeroData:IsShowcutEmpty() == true then
			local tmpHeroId2 = FS_UserData.story:GetNextHeroId()

			if tmpHeroId2 > 0 then
				local tmpHeroData2 = FS_UserData.heroList:GetHero(tmpHeroId2)

				if tmpHeroData2 ~= nil and tmpHeroData2:IsShowcutEmpty() == false then
					self.quickMenuList[tmpHeroId] = {}

					local tmpMainShortcutId2 = tmpHeroData2:GetMainShortcutIndex()

					for j = 1, FS_HeroData.QuickMenuMax do
						local t = {
							itemId = 0,
							default = false,
							lock = false
						}
						local tmpItemId = tmpHeroData2:GetShortcut(j)

						if tmpItemId > 0 then
							t.itemId = tmpItemId
						end

						if tmpMainShortcutId2 == j then
							t.default = true

							tmpHeroData:SetMainShortcutIndex(j)
						end

						self.quickMenuList[tmpHeroId][j] = t

						tmpHeroData:SetShortcut(j, tmpItemId)
					end

					self:UpdateUIQuickMenu()
				end
			end
		end
	end

	UIManager.SendMessage("PlayerInfo", "UpdateItemList", FS_UserData.itemList:GetItemList())
	self:CloseTutorial()

	if isReborn == true and MS_StoryList.IsStoryMaze(self.storyId) == true and FS_UserData.story:IsMazeBossBarFull() == true then
		self.scene:ChangeEntrancePositionByType(Entrance.Type.Common, self.hostPlayer:GetPosByWorldPos())
	end

	if DebugBehaviorLog == true then
		LS_BehaviorLog.Log(LS_BehaviorLog.Type.ChangePlayer, self.hostPlayer:GetHeroId(), "")
	end
end

function ControllerStoryMode:InitUI()
	return
end

function ControllerStoryMode:InitAudio()
	if MS_StoryList.IsStoryNew(self.storyId) then
		local retStoryId = MS_StoryList.ConvertArcadeToNormal(self.storyId)

		FmodManager.LoadBank("story" .. retStoryId)
	else
		FmodManager.LoadBank("story" .. self.storyId)
	end

	if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		FmodManager.LoadBank("story" .. MS_StoryData.StoryIdMazeStart)
	end

	if MS_StoryList.IsStoryNew(self.storyId) then
		local retStoryId = MS_StoryList.ConvertArcadeToNormal(self.storyId)

		AudioCtrl.SetSceneBGM("main_story", retStoryId)
	else
		AudioCtrl.SetSceneBGM("main_story", self.storyId)
	end

	if MS_StoryList.IsStoryNormal(self.storyId) and self.storyId ~= MS_StoryData.StoryId10011 then
		FmodManager.PlaySceneSe("BGM/main_story_san")
	end

	AudioCtrl.SetSceneAmbienceAudio(self.storyId)
	self:SwitchMovieAudio(0)
end

function ControllerStoryMode:SwitchMovieAudio(value)
	FmodManager.SetSnapshot("Movie", "switchIndex", value)
	FmodManager.SetSnapshot("SFX", "switchIndex", value)
	FmodManager.SetSnapshot("BGM", "switchIndex", value)
end

function ControllerStoryMode:ChangeDifficulty(difficulty)
	if difficulty == BattleData.GlobalDifficultyLevel.Casual and (self.roadSignInited == nil or self.roadSignInited == false) then
		self:InitRoadSign()

		self.roadSignInited = true
	end
end

function ControllerStoryMode:HostPlayerNotNormal(flg)
	FS_UserData.story:RecordDuration(FS_PlayerBehavior.RecordType.InSanDuration, flg, self.sceneController:GetHostPlayerHeroId())

	if self.monsterList ~= nil then
		for id, tmpMonsterData in pairs(self.monsterList) do
			local tmpMonster = tmpMonsterData.monster

			if tmpMonster ~= nil and tmpMonster:IsDead() == false and tmpMonster:IsShow() == true and tmpMonster:IsShowByAct() == true and self.hostPlayer:IsMyTeam(tmpMonster:GetTeamId()) == false and tmpMonster:IsBoss() == false and tmpMonster:IsMoveFix() == false and tmpMonster:GetHeroExtAIId() ~= GameAI.BehaviourMode.DoNotAttack and tmpMonster:GetHeroExtAIId() ~= GameAI.BehaviourMode.Guide and tmpMonster:GetHeroExtAIId() ~= GameAI.BehaviourMode.BossRoomMode then
				tmpMonster:SetMonsterNotNormal(flg)
				tmpMonster:GetBrain():SetAnimalCrazy(flg)
			end
		end
	end
end

function ControllerStoryMode:HostPlayerCrazy(flg)
	self:RecordAchievement(MS_Achievement.AchievementIdType.FirstTimeInSan, 1)

	self.hpAddItemUseNumForAI = 0
end

function ControllerStoryMode:AddTalent(TalentAdd)
	if TalentAdd > 0 and self.sceneController:GetHostPlayerHeroId() == 10007 then
		local p_data = {}

		p_data.talentId = tonumber(TalentAdd)
		p_data.level = 1

		FS_UserData.heroList:GetHero(10007):ParseTalent(p_data)
		self.sceneController:HeroAttribUpdate(false)

		local talentData = MS_HeroTalent.GetHeroTalentData(TalentAdd)

		if talentData.Achievement and talentData.Achievement ~= 0 then
			FS_UserData.achievement:AddAchievementValue(talentData.Achievement)
		end
	end
end

function ControllerStoryMode:FinalHit()
	if self.bossFinalHitTimeStep == ControllerStoryMode.SlowTimeStep.Empty then
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			self.bossChallengeTotalTime = self.bossChallengeTotalTime + ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime() - self.bossChallengeStartTime
			self.challengeSuccess = true
		end

		self.bossFinalHitTimeStep = ControllerStoryMode.SlowTimeStep.Wait

		UIManager.SendMessage("Mainmenu", "ForceClosingShortcutItems")
		self.controllerTimer:SetTimeScale(ControllerTimer.Priority.GameMode, ControllerStoryMode.BossDeadSlowTime, 0, -1, 0)
		UIManager.SendMessage("Curtain", "BlackFadeIn", ControllerStoryMode.BossDeadBlackTime, 0, function()
			self.bossFinalHitTimeStep = ControllerStoryMode.SlowTimeStep.End
		end, ControllerStoryMode.BossBlackAlphaTarget)
	elseif self.bossFinalHitTimeStep == ControllerStoryMode.SlowTimeStep.End then
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			UIManager.SendMessage("Mainmenu", "ShowChallengeResult", self.challengeSuccess, self.bossChallengeTotalTime, self.ChallengePerfect)
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			local data = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self.bossId)

			if data ~= nil and data.BossFinal > 0 then
				local ArcadePropertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(data.HeroId, FS_UserData.story:GetDifficulty(), 1)

				if ArcadePropertyData and ArcadePropertyData.Score > 0 then
					local eachKillScore = FS_UserData.arcade:GetKillScoreEach(self.storyId, ArcadePropertyData.Score)

					UIManager.SendMessage("Mainmenu", "ShowRecordUpdateScore", eachKillScore)
					FS_UserData.story:AddStageScore(self.storyId, eachKillScore)
					UIManager.SendMessage("Mainmenu", "ShowRecordScore", FS_UserData.story:GetStageScoreAll())
				end

				self:AddTalent(data.TalentAdd)

				if table.contains(MS_Achievement.ArcadeMonsterList, self.bossId) then
					FS_UserData.story:AddAchievementValue(MS_Achievement.AchievementIdType.killAllArcadeMonster, 1, self.bossId)
				end

				FS_UserData.story:RecordStageTime(self.storyId, self.hostPlayer:GetHeroId())
				FS_UserData.story:SetIsInRelaxTime(true)

				if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
					UIManager.SendMessage("Mainmenu", "ShowArcadeResult")
					self:Save(ControllerStoryMode.SaveType.SaveAutoTime)

					if data.StoryMonsterId == 2002068 or data.StoryMonsterId == 2002070 or data.StoryMonsterId == 2001001 then
						UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 1)
						UIManager.SendMessage("Mainmenu", "ShowArcadeResultAnim")
					end
				elseif not FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) or FS_UserData.story:GetStoryId() == FS_SaveStory.ArcadeStoryIdMax - 1000 then
					-- block empty
				else
					local altarForNext = self.scene:GetAltar(SceneBase.AltarForNextStageId)

					if altarForNext then
						altarForNext:ShowAltar(true)
						altarForNext:SetFocus(true)
					end

					self:Save(ControllerStoryMode.SaveType.SaveReborn)
				end
			end
		end

		return true
	end

	return false
end

function ControllerStoryMode:SetNotPerfect()
	self.ChallengePerfect = false
end

function ControllerStoryMode:GetChallengeSuccess()
	return self.challengeSuccess
end

function ControllerStoryMode:IsHaveFinalHit(isBoss, isHost)
	if isHost == true then
		local movieId, movieIndex = self:CheckMovieByType(MS_StoryMovie.Type.HostPlayerDead, 0)

		if movieId > 0 then
			return true
		end
	elseif isBoss == true and self.bossId > 0 then
		local data = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self.bossId)

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and (self.bossId == 9068 or self.bossId == 9070) then
			return true
		end

		if data ~= nil and data.FinalHit > 0 then
			return true
		end
	end

	return false
end

function ControllerStoryMode:HostPlayerDead()
	UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")

	local movieId, movieIndex = self:CheckMovieByType(MS_StoryMovie.Type.HostPlayerDead, 0)

	if movieId > 0 then
		local movieData = self.storyMovieAllList[movieId]

		if movieData ~= nil then
			self:EnterMovie(movieId, movieIndex)
			self.hostPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Hp)
			self:ResumeAttack()

			return false
		end
	end

	if self.sceneController:IsSecondaryHostPlayerDead() == true then
		FS_UserData.trophy:Dead()

		self.frogItemId, self.frogItemNum = self:HostPlayerDeadDrop()
	end

	self:RecordAchievement(MS_Achievement.AchievementIdType.Death, 1)
	UIManager.SendMessage("Dialog", "StopDialog")
	self:CloseTutorial()
	FS_UserData.story:ClearMonsterMeet()

	return true
end

function ControllerStoryMode:HostPlayerDeadFinish()
	ControllerModeBase.HostPlayerDeadFinish(self)
	self:RecoveryProperty(true)

	self.storyRuleParam = nil
end

function ControllerStoryMode:HostPlayerDeadDrop()
	local ExpPercent = MS_ItemData.ExpItemDropProbabilityMin + (MS_ItemData.ExpItemDropProbabilityMax - MS_ItemData.ExpItemDropProbabilityMin) * Mathf.Random()
	local itemNum = FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[1])
	local dropNum = itemNum * ExpPercent
	local intNum = Mathf.Floor(dropNum)

	if dropNum - intNum > 0 and Mathf.Random() < MS_ItemData.ExpItemDropIndependentProbability then
		intNum = intNum + 1
	end

	local subNum = self:UseBagItem(MS_ItemData.ItemID_ExpAddList[1], intNum)

	if subNum > 0 then
		UIManager.SendMessage("Mainmenu", "SetPanelDeathExtraInfo", subNum)
	end

	return MS_ItemData.ItemID_ExpAddList[1], subNum
end

function ControllerStoryMode:SanMonsterDead(animal)
	self.hostPlayer:GetValue():SetSanPropertyLockCrazy(false)
	self.hostPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.San)
	self:CreateNightmareDropItem(AnimalBase_Define.SanMonsterDropId, animal)

	self.hpAddItemUseNumForAI = 0
end

function ControllerStoryMode:CallHeroDead(animal)
	FS_UserData.story:ClearHeroCall()
	self.hostPlayer:ClearStatusById(MS_StatusData.CallHeroId)

	if animal ~= nil and animal:IsHostTeam() == false then
		self.hostPlayer:GetValue():AddSanPercentInMaze(ControllerStoryMode.CallHeroAddSanRate)

		local mazeLevel = FS_UserData.story:GetMazeLevel()
		local rndParam = animal:GetAnimalId()
		local itemPos = animal:GetFootprintPos():Clone()
		local disY = Mathf.Abs(animal:GetDeadPosition().y - itemPos.y)

		if disY < GameAI.EnableHeight then
			itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
			itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
		end

		FS_UserData.story:AddDropItem(MS_ItemData.DarkShard, 10 + mazeLevel * 2, itemPos)
	end
end

function ControllerStoryMode:ShowMainQuest()
	local mainGoalList = MS_UIQuest.GetMainGoalList()
	local currentMainQuestData

	for k, data in pairs(mainGoalList) do
		if self:CheckShowQuestComplete(data.ShowQuestId) and not self:IsQuestAllComplete(data.CompleteQuestId) then
			if MS_StoryList.IsStoryOriginal(self.storyId) and data.DLCQuest == 0 then
				currentMainQuestData = data
			elseif MS_StoryList.IsStoryDLC(self.storyId) and data.DLCQuest == 1 then
				currentMainQuestData = data
			end
		end
	end

	if currentMainQuestData then
		self:ShowMessageTask(tostring(currentMainQuestData.QuestId))
	end
end

function ControllerStoryMode:OnMenuReborn()
	ControllerModeBase.OnMenuReborn(self)
	FS_UserData.story:ClearHeroShareStatusAll()

	if MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		self:ChangeStatus(ControllerStoryMode.Status.Normal)
		self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterMazeStart, MS_StoryData.StoryIdMazeStart, 1)
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
	else
		local rebornAreaId = FS_UserData.story:GetRebornAreaId()
		local ret = false

		if rebornAreaId > 0 then
			ret = self.sceneController:ChangeArea(rebornAreaId, false)
		end

		if ret == false then
			self:HostPlayerReborn()
		end
	end
end

function ControllerStoryMode:HostPlayerReborn()
	ControllerModeBase.HostPlayerReborn(self)

	if self.hostPlayer ~= nil then
		self.hostPlayer:Reborn(self.hostPlayer:IsDead(), nil)
		self.hostPlayer:SetPosByWorldPos(self.hostPlayer:GetRebornPosition(), true)
		self.hostPlayer:LookAt(self.hostPlayer:GetRebornLook(), true)
		self.hostPlayer:UpdatePositionLast()

		local heroId = FS_UserData.story:GetNextHeroId()

		if heroId > 0 and self.hostPlayer:GetHeroId() ~= heroId and FS_UserData.story:CheckHeroEnable(heroId) then
			local tmpHost, tmpHostIndex = self.sceneController:GetHostPlayerById(heroId)

			if tmpHost ~= nil then
				tmpHost:Reborn(tmpHost:IsDead(), nil)
			end
		end

		local rebornId = FS_UserData.story:GetRebornHeroId()

		if rebornId > 0 and rebornId ~= self.hostPlayer:GetHeroId() and heroId == rebornId then
			self.sceneController:SwitchHostPlayer(rebornId, ControllerMain.SwitchType.Reborn, false, nil)
		end

		FS_UserData.story:RefreshTransactionNum()

		if self:IsBossMode() == true then
			if self.bossRevertQuest ~= nil then
				self:RevertCompleteQuest(self.bossRevertQuest)
			end

			self.bossRevertQuest = nil

			self:ExitBossMode()
		end

		if self.seriesStoryRevertQuest ~= nil then
			self:RevertCompleteQuest(self.seriesStoryRevertQuest)

			self.seriesStoryRevertQuest = nil
		end

		self.trickList = nil

		self:DestroySanMonster()
		self:DestroyCallHero(true)
		self:RefreshMonster()
		self:RefreshSceneItem()
		FS_UserData.story:ClearDropItemAll(true)
		FS_UserData.heroList:AddHpToMax()
		self:UpdateHostPlayer(true)
		self.sceneController:GetCrow():Reset()
		self:RefreshFrogSatisfyList()
		self.cameraScene:ChangeSubPlayer(nil, true)

		if self.hostPlayer:GetValue():IsPropertyMax(MS_HeroData.Property.Rage) == true then
			UIManager.SendMessage("Mainmenu", "ShowTempGuideBottom", self.heroId)
		else
			UIManager.SendMessage("Mainmenu", "CloseTempGuideBottom")
		end

		AudioCtrl.StopHeroAudio("sfx_death", "")
		AudioCtrl.SetBGMAudio(1)
		UIManager.SendMessage("Curtain", "BlackFadeOut", 1)
		self:ShowMainQuest()

		if self.frogItemId > 0 and self.frogItemNum > 0 then
			local tmpTrophyDeathDrop = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.GetDeathDropItem)

			if tmpTrophyDeathDrop > 0 then
				self:CreateHostPlayerDropItem(MS_StoryItemDrop.FrogDropId, self.frogItemId, self.frogItemNum, self.hostPlayer:GetFootprintPos())
			end
		end

		self.frogItemId = 0
		self.frogItemNum = 0

		self.hostPlayer:PressReborn()
	end
end

function ControllerStoryMode:SecondaryHostReborn(hpPer)
	if self.sceneController:IsSecondaryHostPlayerDead() then
		local tmpHost = self.sceneController:GetSecondaryHostPlayer()

		if tmpHost ~= nil then
			local rebornPropertyList = {}

			rebornPropertyList[MS_HeroData.Property.Hp] = hpPer / 1000
			rebornPropertyList[MS_HeroData.Property.San] = 1

			tmpHost:Reborn(true, rebornPropertyList)
			UIManager.SendMessage("Mainmenu", "ShowButtonHeroReborn")

			local tfVfxRoot = self.hostPlayer:GetBodyChest()

			if tfVfxRoot ~= nil then
				VfxManager.PlayBindMulti(tfVfxRoot, AnimalBase_Define.VfxName_Reborn)
			end

			AudioCtrl.SetUIAudio("refresh")

			return true
		end
	end

	return false
end

function ControllerStoryMode:UpdateZoneAndArea(force)
	self.groundIdOld = self.groundId
	self.zoneTypeOld = self.zoneType
	self.areaTypeOld = self.areaType
	self.altitudeOld = self.altitude
	self.reverbIdOld = self.reverbId

	local tmpFogColor, tmpFogStartDis, tmpFogEndDis

	self.groundId, self.altitude, self.areaType, self.groundType, self.zoneType, self.zoneId, self.reverbId, tmpFogColor, tmpFogStartDis, tmpFogEndDis = self.hostPlayer:GetTouchGroundData()

	if self.groundId == nil then
		return
	end

	if self.hostPlayer:IsOnStair() and self.stairId > 0 then
		local stairData = MS_StoryStair.GetStoryStair(self.storyId, self.stairId)

		if stairData ~= nil then
			self.areaType = stairData.AreaType
			self.reverbId = stairData.ReverbId
		end
	end

	if self.groundIdOld ~= self.groundId or force == true then
		local groundData = self.scene:GetGroundData(self.groundId)

		if DebugLog and groundData ~= nil then
			SystemHelper.LogTest("===========UpdateZone=groundData=" .. groundData.name .. ",self.groundId=" .. self.groundId .. ",self.groundType=" .. self.groundType .. ",self.areaType=" .. self.areaType .. ",self.zoneType=" .. self.zoneType .. ",self.zoneId=" .. self.zoneId .. ",self.reverbId=" .. self.reverbId)
		end

		if self.zoneType == SceneBase.ZoneType.ZoneC then
			if self:IsBossMode() == false then
				self.bossZone = true
			end
		elseif self.zoneType == SceneBase.ZoneType.ZoneTrick then
			if self.trickList == nil then
				self.trickList = {}
			end

			if self.trickList[self.zoneId] == nil then
				self.scene:OpenTrick(self.zoneId, nil, nil)

				self.trickList[self.zoneId] = 1
			end
		end

		self:UpdateLightAndShadow(false)
		self.sceneController:SetFogByGroundConfig(tmpFogColor, tmpFogStartDis, tmpFogEndDis, false)
	end

	if self:IsBossMode() == false and self.bossZone == true and self.zoneType == SceneBase.ZoneType.ZoneC and self.hostPlayer:IsMovieAndDialogueEnable() == true then
		local movieId, movieIndex = self:CheckMovieByType(MS_StoryMovie.Type.BossShow, self.zoneId)

		if movieId > 0 then
			local movieData = self.storyMovieAllList[movieId]

			if movieData ~= nil then
				self:EnterMovie(movieId, movieIndex)

				self.bossZone = false
			end
		end
	end
end

function ControllerStoryMode:UpdateAudio()
	AudioCtrl.SetReverb(self.storyId, self.areaType, self.areaTypeOld, self.reverbId, self.reverbIdOld)

	if self.altitudeOld >= AudioCtrl.HighAltitude and self.altitude < AudioCtrl.HighAltitude then
		AudioCtrl.SetAmbienceChange(self.storyId, false)
	elseif self.altitudeOld <= AudioCtrl.LowAltitude and self.altitude > AudioCtrl.LowAltitude then
		AudioCtrl.SetAmbienceChange(self.storyId, true)
	end

	local bgmIndex = self.hostPlayer:GetValue():GetPropertyMax(MS_HeroData.Property.San) - self.hostPlayer:GetValue():GetProperty(MS_HeroData.Property.San)

	if self.hostPlayer:IsDead() == true then
		bgmIndex = 0
	end

	if BattleData.IsDarkForestScene() == true or MS_StoryList.IsStoryMaze(self.storyId) == true then
		FmodManager.SetParameterValue("BGM/main_story_san", "BGMIndex", bgmIndex)
	elseif MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		FmodManager.SetSnapshot("BGM_san", "switchIndex", 0)
		FmodManager.SetSnapshot("BGM_temp", "switchIndex", 1)
	elseif self.storyId ~= MS_StoryData.StoryId10011 then
		if self:IsBossMode() == true then
			FmodManager.SetSnapshot("BGM_san", "switchIndex", 0)
			FmodManager.SetSnapshot("BGM_temp", "switchIndex", 1)
		else
			if self.hostPlayer:IsHeroSanCrazy(0) == true then
				FmodManager.SetSnapshot("BGM_san", "switchIndex", 1)
				FmodManager.SetSnapshot("BGM_temp", "switchIndex", 0)
			else
				FmodManager.SetSnapshot("BGM_san", "switchIndex", 0)
				FmodManager.SetSnapshot("BGM_temp", "switchIndex", 1)
			end

			FmodManager.SetParameterValue("BGM/main_story_san", "BGMIndex", bgmIndex)
		end
	end
end

function ControllerStoryMode:UpdateSan()
	if self.hostPlayer:IsDead() == true then
		return
	end

	if BattleData.IsDarkForestScene() == true then
		if self.scene:GetInProtectSanAreaId(self.hostPlayer:GetPosByWorldPos()) > 0 then
			self.sanSceneTimeEnd = 0
		else
			local nowTime = TimeHelper.getNowTime()

			if self.sanSceneTimeEnd <= 0 then
				self.sanSceneTimeEnd = nowTime + 1
			elseif nowTime > self.sanSceneTimeEnd then
				local sanSub = ControllerStoryMode.SanSubDarkForestPerSecond

				if self.hostPlayer:IsHeroSanCrazy(0) == true then
					local retSub = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.CrazySanSubSlow)

					if retSub > 0 then
						sanSub = MathHelper.subValuePermil(sanSub, retSub)
					end
				end

				self.hostPlayer:GetValue():SubProperty(MS_HeroData.Property.San, sanSub)

				self.sanSceneTimeEnd = nowTime + 1
			end
		end
	elseif MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		-- block empty
	elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		-- block empty
	elseif MS_StoryList.IsStoryMaze(self.storyId) == true then
		local nowTime = TimeHelper.getNowTime()

		if self.sanSceneTimeEnd <= 0 then
			self.sanSceneTimeEnd = nowTime + ControllerStoryMode.SanSubMazeTimeInterval
		elseif nowTime > self.sanSceneTimeEnd then
			if self.hostPlayer:IsHaveStatusByType(MS_StatusData.LogicType.MazeSanFix) == false then
				local sanSub = ControllerStoryMode.SanSubMazePerTime

				if self.hostPlayer:IsHeroSanCrazy(0) == true then
					sanSub = ControllerStoryMode.SanSubMazeCrazyPerTime

					local retSub = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.CrazySanSubSlow)

					if retSub > 0 then
						sanSub = MathHelper.subValuePermil(sanSub, retSub)
					end
				end

				if self.hostPlayer:IsHaveStatusByType(MS_StatusData.LogicType.MazeSanSubSlow) then
					local subRate = self.hostPlayer:GetStatusSimpleValueByType(MS_StatusData.LogicType.MazeSanSubSlow)

					sanSub = MathHelper.subValuePermil(sanSub, subRate)
				end

				self.hostPlayer:GetValue():SubProperty(MS_HeroData.Property.San, sanSub)
			end

			self.sanSceneTimeEnd = nowTime + ControllerStoryMode.SanSubMazeTimeInterval
		end

		if self.hostPlayer:IsWillDead() == false and self.callHero == nil then
			local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

			if tmpHeroId > 0 and tmpHeroType > 0 then
				local ret, targetPos = self:GetSanBornPosition(nil)

				if ret == true then
					self.callHero = self:CreateCallHero(tmpHeroId, tmpHeroType, targetPos)
				end
			end
		end
	elseif self:IsBossMode() == true then
		if self.bossId > 0 and self.monsterList[self.bossId] ~= nil then
			local tmpBoss = self.monsterList[self.bossId].monster

			if tmpBoss ~= nil and tmpBoss:IsDead() == false and tmpBoss:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and tmpBoss:GetGrade() == tmpBoss:GetGradeThreshold() and self.hostPlayer:IsHeroSanCrazy(0) == true and self.hostPlayer:IsWillDead() == false then
				self:BossGradeUpReady(tmpBoss)
			end
		end
	elseif self.hostPlayer:IsHeroSanCrazy(0) == true and self.hostPlayer:IsWillDead() == false and self.storyId ~= MS_StoryData.StoryId10011 then
		if self.sanMonster == nil then
			local ret, targetPos = self:GetSanBornPosition(nil)

			if ret == true then
				self.sanMonster = self:CreateSanMonster(targetPos, self.sanMonsterIndex)
			end
		end

		local nowTime = TimeHelper.getNowTime()

		if self.sanSceneTimeEnd <= 0 then
			self.sanSceneTimeEnd = nowTime + 1
		elseif nowTime > self.sanSceneTimeEnd then
			local sub = ControllerStoryMode.SanCrazySubPerSecond

			if self.hostPlayer:IsHeroSanCrazy(0) == true then
				local retSub = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.CrazySanSubSlow)

				if retSub > 0 then
					sub = MathHelper.subValuePermil(sub, retSub)
				end
			end

			self.hostPlayer:GetValue():SubProperty(MS_HeroData.Property.San, sub)

			self.sanSceneTimeEnd = nowTime + 1
		end
	end
end

function ControllerStoryMode:UpdateQuality(force)
	ControllerModeBase.UpdateQuality(self, force)
	self:UpdateLightAndShadow(force)
end

function ControllerStoryMode:UpdateLightAndShadow(force)
	if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		self.scene:ShowPointLight(true, force)
		self.sceneController:ShowShadow(false)

		if self:IsStatus(ControllerStoryMode.Status.Dialog) == false and self:IsStatus(ControllerStoryMode.Status.Movie) == false then
			self.scene:ShowPointLight(true, force)
		else
			self.scene:ShowPointLight(false, force)
		end
	else
		if self.areaType == SceneBase.Area.InDoor then
			self.sceneController:ShowShadow(false)
		else
			self.scene:ShowPointLight(false, force)

			if self.storyId == MS_StoryData.StoryId10011 then
				self.sceneController:ShowShadow(false)
			else
				self.sceneController:ShowShadow(true)
			end
		end

		if self:IsStatus(ControllerStoryMode.Status.Dialog) == false and self:IsStatus(ControllerStoryMode.Status.Movie) == false then
			self.scene:ShowPointLight(true, true)
		else
			self.scene:ShowPointLight(false, true)
		end
	end
end

function ControllerStoryMode:GetSanBornPosition(oldPos)
	local nowPos = self.hostPlayer:GetPosByWorldPos()
	local nowForward = self.hostPlayer:GetForward()
	local camFoward = self.cameraScene:GetCameraRealForward()
	local targetPos
	local score = 99999
	local nowTime = TimeHelper.getNowTime()

	if oldPos ~= nil then
		local isBlocked = GameAI.IsAnimalMoveToTargetBlocked(self.hostPlayer, oldPos, GameAI.CheckMoveLayerMask)

		if isBlocked == false then
			local retDis = ProjectXPathFindingAI.GetPathDistance(self.hostPlayer:GetAnimalId(), nowPos.x, nowPos.y, nowPos.z, oldPos.x, oldPos.y, oldPos.z)

			if retDis >= ControllerStoryMode.SanMonsterDistanceMin and retDis <= SceneDefine.DistanceForSanCreatePathMax then
				local tmpDir = oldPos - nowPos
				local angle = Vector3.Angle(tmpDir, camFoward)

				score = retDis * (angle / 180)
				tmpDir = nil
			end
		end
	end

	if self.bornSanPosList ~= nil then
		for id, posData in pairs(self.bornSanPosList) do
			local tmpTargetPos = posData.Position
			local disSquare = Vector3.DistanceSquare(tmpTargetPos, nowPos)

			if disSquare < SceneDefine.DistanceForSanCreateMax * SceneDefine.DistanceForSanCreateMax then
				local diffTime = nowTime - posData.Time

				if diffTime >= ControllerStoryMode.SanPositionExpireTime then
					posData.Time = nowTime + MathHelper.getRandom(0, 100, id) / 500

					local retDis = ProjectXPathFindingAI.GetPathDistance(self.hostPlayer:GetAnimalId(), nowPos.x, nowPos.y, nowPos.z, tmpTargetPos.x, tmpTargetPos.y, tmpTargetPos.z)

					if retDis > 0 then
						posData.Distance = retDis
					else
						posData.Distance = -1
					end
				end

				if posData.Distance > 0 and posData.Distance >= ControllerStoryMode.SanMonsterDistanceMin and posData.Distance <= SceneDefine.DistanceForSanCreatePathMax then
					local isBlocked = GameAI.IsAnimalMoveToTargetBlocked(self.hostPlayer, tmpTargetPos, GameAI.CheckMoveLayerMask)

					if isBlocked == false then
						local tmpDir = tmpTargetPos - nowPos
						local angle = Vector3.Angle(tmpDir, camFoward)
						local tmpScore = posData.Distance * (angle / 180)

						if tmpScore < score then
							SystemHelper.LogTest("=======GetSanBornPosition==2222===id=" .. id .. ",tmpScore=" .. tmpScore)

							targetPos = tmpTargetPos
							score = tmpScore
						end

						tmpDir = nil
					end
				end
			end
		end
	end

	if targetPos ~= nil then
		return true, targetPos
	end

	return false, Vector3.s_zero
end

function ControllerStoryMode:GetSanFirst(monsterType, sanFirst)
	if sanFirst <= 1 then
		return 1
	end

	local killCnt = FS_UserData.story:GetMonsterKillCnt(monsterType)

	for i = 1, #ControllerStoryMode.SanFirstRate do
		local tmpCnt = ControllerStoryMode.SanFirstRate[i][1]
		local tmpRate = ControllerStoryMode.SanFirstRate[i][2]

		if tmpCnt <= killCnt then
			sanFirst = Mathf.Ceil(sanFirst * (1 - tmpRate))

			break
		end
	end

	if sanFirst <= 1 then
		sanFirst = 1
	end

	return sanFirst
end

function ControllerStoryMode:RecoveryProperty(all)
	local num = self.sceneController:GetHostPlayerListNum()

	for i = 1, num do
		local player = self.sceneController:GetHostPlayerByIndex(i)

		if player ~= nil then
			player:ClearStatusAllDebuffer()
			player:GetValue():SetSanPropertyLockCrazy(false)
			player:GetValue():SetPropertyToMax(MS_HeroData.Property.San)

			if all == true then
				player:GetValue():SetPropertyToMax(MS_HeroData.Property.Hp)
			end
		end
	end

	self:DisappearSanMonster()
	self:DisappearCallHero()
end

function ControllerStoryMode:LockSanMin(flg)
	local num = self.sceneController:GetHostPlayerListNum()

	for i = 1, num do
		local player = self.sceneController:GetHostPlayerByIndex(i)

		if player ~= nil then
			player:GetValue():SetSanPropertyLockBoss(flg)
		end
	end
end

function ControllerStoryMode:UpdateEnemySpace()
	local hostPos = self.hostPlayer:GetPosByWorldPos()

	self.enemySpaceList = self.scene:GetEnemySpaceList(hostPos)
end

function ControllerStoryMode:IsLockedByEnemy()
	if self.hostPlayer == nil then
		return false
	end

	for id, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if tmpMonster ~= nil and tmpMonster:IsDead() == false and tmpMonster:IsShow() == true and tmpMonster:GetAITarget() == self.hostPlayer then
			return true
		end
	end

	if self.sanMonster ~= nil and self.sanMonster:IsDead() == false and self.sanMonster:IsShow() == true and self.sanMonster:GetAITarget() == self.hostPlayer then
		return true
	end

	if self.callHero ~= nil and self.callHero:IsHostTeam() == false and self.callHero:IsDead() == false and self.callHero:IsShow() == true and self.callHero:GetAITarget() == self.hostPlayer then
		return true
	end

	return false
end

function ControllerStoryMode:IsCreateFromCallAnimal(monsterId)
	for id, data in pairs(self.monsterAllList) do
		local tmpCallList = data.CallMonsterIdList

		if tmpCallList ~= nil and #tmpCallList > 0 then
			for i = 1, #tmpCallList do
				local callId = tonumber(tmpCallList[i])

				if callId == monsterId then
					return true
				end
			end
		end
	end

	return false
end

function ControllerStoryMode:CheckCreateMonsterById(monsterId)
	if self.monsterAllList ~= nil and self.monsterAllList[monsterId] ~= nil and self.monsterList[monsterId] == nil and self.monsterDeadList[monsterId] == nil and FS_UserData.story:IsMonsterDead(monsterId) == false then
		local data = self.monsterAllList[monsterId]
		local posIndex = tonumber(data.Position)
		local posFix = tonumber(data.PositionFix)
		local show = false

		if tonumber(data.PositionHide) <= 0 and tonumber(data.CrateId) <= 0 and self:CheckShowQuestComplete(data.ShowQuestId) == true and self:CheckHideQuestComplete(data.HideQuestId) == false then
			show = true
		end

		if show and FS_UserData.story:GetFrogFinish(monsterId) then
			show = false
		end

		if show == true and self:IsCreateFromCallAnimal(monsterId) == true and FS_UserData.story:IsMonsterCall(monsterId) == false then
			show = false
		end

		if show == true and posIndex > 0 then
			local tmpPosIndex = ControllerStoryMode.EnemyTeamId * ControllerMain.LocatorBornUnit + posIndex
			local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornEnemy, tmpPosIndex)

			if locatorData ~= nil then
				local fix = posFix > 0
				local player = self:CreateMonster(data, locatorData.Position, locatorData.Orientation, fix, AnimalBase_Define.MonsterType.Normal)

				if fix and player ~= nil and data.FixOrientation ~= nil and data.FixOrientation ~= "" then
					local starr = StringHelper.Split(data.FixOrientation, ";")
					local fixRotation = Quaternion.New(tonumber(starr[1]), tonumber(starr[2]), tonumber(starr[3]), tonumber(starr[4]))

					player:SetRotation(fixRotation, true)

					fixRotation = nil
				end

				return player
			end
		end
	end

	return nil
end

function ControllerStoryMode:CheckCreateMonster()
	local hostPos = self.hostPlayer:GetPosByWorldPos()
	local showMonster, showPos, showLook
	local fix = false
	local fixRotation

	if self.monsterAllList ~= nil then
		for id, data in pairs(self.monsterAllList) do
			local monsterId = tonumber(data.StoryMonsterId)

			if self.monsterList[monsterId] == nil and self.monsterDeadList[monsterId] == nil and FS_UserData.story:IsMonsterDead(monsterId) == false then
				local posIndex = tonumber(data.Position)
				local detectDis = data.Radius
				local posFix = tonumber(data.PositionFix)

				if data.FixOrientation ~= nil and data.FixOrientation ~= "" then
					local starr = StringHelper.Split(data.FixOrientation, ";")

					fixRotation = Quaternion.New(tonumber(starr[1]), tonumber(starr[2]), tonumber(starr[3]), tonumber(starr[4]))
				else
					fixRotation = nil
				end

				local show = false

				if tonumber(data.PositionHide) <= 0 and tonumber(data.CrateId) <= 0 and (self:CheckShowQuestComplete(data.ShowQuestId) == true and self:CheckHideQuestComplete(data.HideQuestId) == false or self.storyLoop > 1 and data.AlwaysShow == 1) then
					show = true
				end

				if show == true and self:IsBossMode() == true and monsterId ~= self.bossId and (data.BossId <= 0 or data.BossId ~= self.bossId) then
					show = false
				end

				if show == true and FS_UserData.story:GetFrogFinish(monsterId) then
					show = false
				end

				if show == true and self:IsCreateFromCallAnimal(monsterId) == true and FS_UserData.story:IsMonsterCall(monsterId) == false then
					show = false
				end

				if show == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and data.HeroId == 20003 then
					show = false
				end

				if show == true and posIndex > 0 and self.enemySpaceList ~= nil then
					local tmpPosIndex = ControllerStoryMode.EnemyTeamId * ControllerMain.LocatorBornUnit + posIndex

					if self.enemySpaceList[tmpPosIndex] ~= nil then
						local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornEnemy, tmpPosIndex)

						if locatorData ~= nil then
							showMonster = data
							showPos = locatorData.Position
							showLook = locatorData.Orientation
							fix = posFix > 0

							break
						end
					end
				end
			end

			if showMonster ~= nil then
				break
			end
		end
	end

	if showMonster ~= nil and showPos ~= nil and showLook ~= nil then
		local player = self:CreateMonster(showMonster, showPos, showLook, fix, AnimalBase_Define.MonsterType.Normal)

		if fix and fixRotation ~= nil and player ~= nil then
			player:SetRotation(fixRotation, true)

			fixRotation = nil
		end
	end
end

function ControllerStoryMode:CreateCrateMonster(crateId)
	local crate

	if crateId > 0 then
		crate = self.scene:GetCrate(crateId)
	end

	if crate ~= nil and self.monsterAllList ~= nil then
		for id, data in pairs(self.monsterAllList) do
			local monsterId = tonumber(data.StoryMonsterId)

			if self.monsterList[monsterId] == nil and FS_UserData.story:IsMonsterDead(monsterId) == false then
				local show = false
				local posIndex = tonumber(data.Position)

				if tonumber(data.PositionHide) <= 0 and tonumber(data.CrateId) == crateId and self:CheckShowQuestComplete(data.ShowQuestId) == true and self:CheckHideQuestComplete(data.HideQuestId) == false then
					show = true
				end

				if show == true and posIndex > 0 then
					local tmpPosIndex = ControllerStoryMode.EnemyTeamId * ControllerMain.LocatorBornUnit + posIndex
					local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornEnemy, tmpPosIndex)

					if locatorData ~= nil then
						local showPos = Vector3.zero
						local showLook = Vector3.zero

						showPos:SetVector3(locatorData.Position)
						showLook:SetVector3(locatorData.Orientation)

						local pos = crate:GetPosition()
						local rot = crate:GetRotation()

						showPos:Add(pos)
						showLook:MulQuat(rot)

						local player = self:CreateMonster(data, showPos, showLook, false, AnimalBase_Define.MonsterType.CrateMonster)

						if player ~= nil then
							crate:AddMonster(data.StoryMonsterId)
							AudioCtrl.SetHeroAudio("crate_monster_show", player:GetModel(), player:GetAnimalId())
						end

						showPos = nil
						showLook = nil
					end
				end
			end
		end
	end
end

function ControllerStoryMode:CreateOrGetMonster(monsterId)
	if self.monsterList[monsterId] ~= nil then
		local tmpMonster = self.monsterList[monsterId].monster

		if tmpMonster ~= nil and tmpMonster:IsDead() == false then
			return tmpMonster
		end
	end

	if self.monsterList[monsterId] == nil and FS_UserData.story:IsMonsterDead(monsterId) == false and self.monsterAllList ~= nil then
		local monsterData = self.monsterAllList[monsterId]

		if monsterData ~= nil and tonumber(monsterData.PositionHide) <= 0 and tonumber(monsterData.CrateId) <= 0 and self:CheckShowQuestComplete(monsterData.ShowQuestId) == true and self:CheckHideQuestComplete(monsterData.HideQuestId) == false then
			local posIndex = tonumber(monsterData.Position)

			posIndex = ControllerStoryMode.EnemyTeamId * ControllerMain.LocatorBornUnit + posIndex

			local posFix = tonumber(monsterData.PositionFix)
			local fixRotation

			if monsterData.FixOrientation ~= nil and monsterData.FixOrientation ~= "" then
				local starr = StringHelper.Split(monsterData.FixOrientation, ";")

				fixRotation = Quaternion.New(tonumber(starr[1]), tonumber(starr[2]), tonumber(starr[3]), tonumber(starr[4]))
			else
				fixRotation = nil
			end

			local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornEnemy, posIndex)

			if locatorData ~= nil then
				local showPos = locatorData.Position
				local showLook = locatorData.Orientation
				local fix = posFix > 0
				local player = self:CreateMonster(monsterData, showPos, showLook, fix, AnimalBase_Define.MonsterType.Normal)

				if fix and fixRotation ~= nil and player ~= nil then
					player:SetRotation(fixRotation, true)

					fixRotation = nil
				end

				return player
			end
		end
	end

	return nil
end

function ControllerStoryMode:CheckDestroyMonster()
	local nowPos = self.hostPlayer:GetPosByWorldPos()
	local deleteIdList

	for id, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if tmpMonster ~= nil and tmpMonster:IsWillDead() == false and tmpMonster:IsMonsterType(AnimalBase_Define.MonsterType.CrateMonster) == false and self.hostPlayer:IsMyTeam(tmpMonster:GetTeamId()) == false then
			local tmpData = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, id)
			local posIndex = tonumber(tmpData.Position)
			local isDelete = true

			if self.enemySpaceList ~= nil then
				local tmpPosIndex = ControllerStoryMode.EnemyTeamId * ControllerMain.LocatorBornUnit + posIndex

				if self.enemySpaceList[tmpPosIndex] ~= nil then
					isDelete = false
				end
			end

			if isDelete == true then
				local tmpMonsterTarget = tmpMonster:GetAITarget()

				if tmpMonsterTarget ~= nil then
					isDelete = false
				end
			end

			if isDelete == true then
				local monsterPos = tmpMonster:GetPosByWorldPos()
				local rebornPos = tmpMonster:GetRebornPosition()
				local tmpRebornDis = Vector3.DistanceSquare(monsterPos, rebornPos)

				isDelete = (tmpRebornDis < GameAI.ArriveDistance * GameAI.ArriveDistance or tmpMonster:GetBrain().isArrivePos == true) and true or false
			end

			if isDelete == true then
				if tmpMonsterData.delete == true then
					if TimeHelper.getNowTime() > tmpMonsterData.deleteTime then
						if deleteIdList == nil then
							deleteIdList = {}
						end

						table.insert(deleteIdList, id)
					end
				else
					tmpMonsterData.delete = true
					tmpMonsterData.deleteTime = TimeHelper.getNowTime() + ControllerStoryMode.MonsterUnloadReadyTime
				end
			end
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			self:UnloadMonster(deleteIdList[i])
		end
	end

	deleteIdList = nil
end

function ControllerStoryMode:UpdateMonster()
	local deleteIdList

	for id, tmpMonster in pairs(self.monsterDeadList) do
		if tmpMonster ~= nil and tmpMonster:IsDeadHide() == true and tmpMonster:IsInTimeLine() == false then
			if deleteIdList == nil then
				deleteIdList = {}
			end

			table.insert(deleteIdList, id)
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			local id = deleteIdList[i]

			self:DestroyMonster(id)
		end
	end

	deleteIdList = nil

	if self.sanMonster ~= nil then
		if self.sanMonster:IsDead() == true and self.sanMonster:IsDeadHide() == true then
			self:DestroySanMonster()
		elseif self.sanMonster:IsShow() == false then
			self:DestroySanMonster()
		elseif self.sanMonster:IsReadyNightmareEnd() == true then
			local sanPos = self.sanMonster:GetPosByWorldPos()
			local ret, targetPos = self:GetSanBornPosition(sanPos)

			if ret == true then
				local nowPos = self.hostPlayer:GetPosByWorldPos()
				local tmpDisNew = Vector3.DistanceSquare(nowPos, targetPos)
				local tmpDisOld = Vector3.DistanceSquare(nowPos, sanPos)
				local tmpDisDiff = Vector3.DistanceSquare(sanPos, targetPos)

				if tmpDisNew < tmpDisOld and tmpDisDiff > ControllerStoryMode.SanMonsterChangePosMin * ControllerStoryMode.SanMonsterChangePosMin then
					self.sanMonster:ChangeToNightmareEnd()
				end
			end
		end
	end

	if self.callHero ~= nil then
		if self.callHero:IsReadyCallEnd(true) == true and self.callHero:IsShow() == true then
			local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

			if tmpHeroId <= 0 then
				self.callHero:ChangeToCallEnd()
			end
		end

		if self.callHero:IsStateCallEnd() == false then
			if self.callHero:IsDead() == true and self.callHero:IsDeadHide() == true then
				self:DestroyCallHero(true)
			elseif self.callHero:IsShow() == false then
				self:DestroyCallHero(false)
			elseif self.callHero:IsReadyCallEnd(false) == true then
				local sanPos = self.callHero:GetPosByWorldPos()
				local ret, targetPos = self:GetSanBornPosition(sanPos)

				if ret == true then
					local nowPos = self.hostPlayer:GetPosByWorldPos()
					local tmpDisNew = Vector3.DistanceSquare(nowPos, targetPos)
					local tmpDisOld = Vector3.DistanceSquare(nowPos, sanPos)
					local tmpDisDiff = Vector3.DistanceSquare(sanPos, targetPos)

					if tmpDisNew < tmpDisOld and tmpDisDiff > ControllerStoryMode.SanMonsterChangePosMin * ControllerStoryMode.SanMonsterChangePosMin then
						self.callHero:ChangeToCallEnd()
					end
				end
			end
		end
	end

	if self:IsBossMode() == true and self.bossId > 0 and self.monsterList[self.bossId] ~= nil then
		local tmpBoss = self.monsterList[self.bossId].monster

		if tmpBoss ~= nil and tmpBoss:IsDead() == false and tmpBoss:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == false and self.hostPlayer:IsWillDead() == false and self.bossGradeUpTimeStep == ControllerStoryMode.SlowTimeStep.End then
			self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.GameMode)
			tmpBoss:AddGrade(false)

			self.bossGradeUpTimeStep = ControllerStoryMode.SlowTimeStep.Empty
		end
	end
end

function ControllerStoryMode:CallAnimalCommon(fromAnimal, id, toBorn)
	local isHost = false
	local storyMonsterId = id
	local storyMonsterData = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, id)

	if storyMonsterData == nil then
		return nil
	end

	local heroId = tonumber(storyMonsterData.HeroId)
	local level = tonumber(storyMonsterData[self.levelKey])
	local nickName = storyMonsterData.StoryMonsterName
	local teamId = tonumber(storyMonsterData.Team)
	local heroExtData = storyMonsterData
	local heroPropertyData

	if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		local mazeLevel = FS_UserData.story:GetMazeLevel()

		heroPropertyData = MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(heroId, mazeLevel, 1)
		level = MS_StoryMazeMonster.GetMonsterLevel(heroId, mazeLevel)
	elseif BattleData.IsDarkForestScene() == true then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			level = level + tmpHeroData:GetLevel() + ControllerStoryMode.SanLevelAdd
		end
	else
		heroPropertyData = MS_StoryMonsterProperty.GetStoryMonsterProperty(self.storyId, storyMonsterId, 1)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		heroPropertyData = MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetChallengeLevel(), 1)
		level = fromAnimal:GetLevel()
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		if heroId == 20040 then
			heroPropertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetDifficulty(), 4)
		else
			heroPropertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetDifficulty(), 1)
		end

		if heroPropertyData then
			level = heroPropertyData.MonsterLevel
		end
	end

	if teamId <= 0 then
		teamId = fromAnimal:GetTeamId()
		isHost = fromAnimal:IsHost()
	end

	local player = self.sceneController:CreatePlayerInPlay(heroId, storyMonsterId, nickName, level, heroExtData, heroPropertyData, ControllerModeBase.callIdStart, teamId, isHost, AnimalBase_Define.MonsterType.CallMonster, toBorn)

	if player ~= nil then
		player:GetValue():SetRebornEnable(false)
		player:SetCallFromAnimal(fromAnimal:GetAnimalId(), fromAnimal:GetHeroId())

		ControllerModeBase.callIdStart = ControllerModeBase.callIdStart + 1

		return player
	end

	return nil
end

function ControllerStoryMode:CallAnimal(fromAnimal, id, toBorn)
	local retPlayer = self:CallAnimalCommon(fromAnimal, id, toBorn)

	if retPlayer ~= nil then
		local tmpData = {}

		tmpData.monster = retPlayer
		tmpData.delete = false
		tmpData.deleteTime = 0
		self.monsterList[id] = tmpData

		if fromAnimal:IsBoss() == false then
			FS_UserData.story:AddMonsterCall(id)
		end
	end

	return retPlayer
end

function ControllerStoryMode:CallAnimalDynamic(fromAnimal, id, toBorn)
	local retPlayer = self:CallAnimalCommon(fromAnimal, id, toBorn)

	return retPlayer
end

function ControllerStoryMode:CreateMonster(data, pos, look, fix, monsterType)
	local monsterId = tonumber(data.StoryMonsterId)

	if self.monsterList[monsterId] ~= nil then
		return nil
	end

	local heroId = tonumber(data.HeroId)
	local level = tonumber(data[self.levelKey])
	local nickName = data.StoryMonsterName
	local teamId = tonumber(data.Team)
	local isHost = false

	if DebugAIControl == true then
		isHost = true
	end

	local propertyData

	if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		local mazeLevel = FS_UserData.story:GetMazeLevel()

		propertyData = MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(heroId, mazeLevel, 1)
		level = MS_StoryMazeMonster.GetMonsterLevel(heroId, mazeLevel)
	elseif BattleData.IsDarkForestScene() == true then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			level = level + tmpHeroData:GetLevel() + ControllerStoryMode.SanLevelAdd
		end
	else
		propertyData = MS_StoryMonsterProperty.GetStoryMonsterProperty(self.storyId, monsterId, 1)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		function nickName()
			local heroData = MS_HeroData.GetHero(heroId)

			return heroData.Name
		end

		local challengeData = MS_StoryChallenge.GetDataByHeroId(heroId)

		if challengeData ~= nil then
			propertyData = MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetChallengeLevel(), 1)
			level = challengeData["Level_" .. FS_UserData.story:GetChallengeLevel()]
		end
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		propertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetDifficulty(), 1)

		if propertyData then
			level = propertyData.MonsterLevel
		end
	end

	local player = self.sceneController:CreatePlayerInPlay(heroId, monsterId, nickName, level, data, propertyData, ControllerStoryMode.monsterIdStart, teamId, isHost, monsterType, false)

	if player ~= nil then
		ControllerStoryMode.monsterIdStart = ControllerStoryMode.monsterIdStart + 1

		local tmpData = {}

		tmpData.monster = player
		tmpData.delete = false
		tmpData.deleteTime = 0
		self.monsterList[monsterId] = tmpData

		player:GetValue():SetRebornEnable(false)
		player:SetMoveFix(fix)
		player:SetPosByWorldPos(pos, true)
		player:LookAt(look, true)
		player:SetRebornPosition(pos)
		player:SetRebornLook(look)
		player:UpdatePositionLast()

		if data.DefaultAnimator > 0 then
			player:ChangeToSpecial(data.DefaultAnimator)
		end

		player:Start()

		if fix == false and (self.hostPlayer:IsHeroSanNotNormal(0) == true or MS_StoryList.IsStoryMaze(self.storyId) == true) and self.hostPlayer:IsMyTeam(player:GetTeamId()) == false and player:IsBoss() == false and player:IsMoveFix() == false and data.AiId ~= GameAI.BehaviourMode.DoNotAttack and data.AiId ~= GameAI.BehaviourMode.Guide and data.AiId ~= GameAI.BehaviourMode.BossRoomMode then
			if self.hostPlayer:IsHeroSanNotNormal(0) == true then
				player:SetMonsterNotNormal(true)
			end

			player:GetBrain():SetAnimalCrazy(true)
		end

		if heroId == MS_HeroData.FrogHeroId then
			player:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self:GetFrogSatisfy(monsterId), 0, 0)
		end

		return player
	end

	return nil
end

function ControllerStoryMode:CreateSanMonster(pos, index)
	local count = self.sceneController:GetHostPlayerListNum()

	if index < 1 or count < index then
		if count > 1 then
			index = MathHelper.getRandom(1, count)
		else
			index = 1
		end
	end

	local heroId = 0
	local monsterId = 0
	local nickName
	local level = 1
	local data, propertyData

	if count < index then
		index = index - self.sceneController:GetHostPlayerListNum()
		data = self.monsterSanAllList[index]

		if data ~= nil then
			heroId = tonumber(data.HeroId)
			level = tonumber(data[self.levelKey])
			nickName = data.StoryMonsterName

			if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
				local mazeLevel = FS_UserData.story:GetMazeLevel()

				propertyData = MS_StoryMazeMonsterProperty.GetStoryMonsterProperty(heroId, mazeLevel, 1)
				level = MS_StoryMazeMonster.GetMonsterLevel(heroId, mazeLevel)
			else
				propertyData = MS_StoryMonsterProperty.GetStoryMonsterProperty(self.storyId, tonumber(data.StoryMonsterId), 1)
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
				local challengeData = MS_StoryChallenge.GetDataByHeroId(heroId)

				if challengeData ~= nil then
					propertyData = MS_StoryChallengeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetChallengeLevel(), 1)
					level = challengeData["Level_" .. FS_UserData.story:GetChallengeLevel()]
				end
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				propertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(heroId, FS_UserData.story:GetDifficulty(), 1)

				if propertyData then
					level = propertyData.MonsterLevel
				end
			end
		end
	end

	if data == nil then
		local player = self.sceneController:GetHostPlayerByIndex(index)

		if player ~= nil then
			heroId = player:GetHeroId()
			nickName = player:GetNickName()

			local tmpHeroData = FS_UserData.heroList:GetHero(heroId)

			if tmpHeroData ~= nil then
				level = tmpHeroData:GetLevel()
			end

			propertyData = {
				["Property_" .. MS_HeroData.Property.Toughness] = AnimalBase_Value_Define.SanMonsterHeroToughnessSub
			}
		end
	end

	if heroId <= 0 then
		return
	end

	local nowPos = self.hostPlayer:GetPosByWorldPos()
	local isHost = false

	if DebugAIControl == true then
		isHost = true
	end

	local player = self.sceneController:CreatePlayerInPlay(heroId, monsterId, nickName, level, data, propertyData, ControllerStoryMode.monsterIdStart, 2, isHost, AnimalBase_Define.MonsterType.SanMonster, false)

	if player ~= nil then
		ControllerStoryMode.monsterIdStart = ControllerStoryMode.monsterIdStart + 1

		player:GetValue():SetRebornEnable(false)
		player:SetMoveFix(false)
		player:SetPosByWorldPos(pos, true)

		local tmpDir = nowPos - pos

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			player:LookAt(tmpDir, true)
		end

		player:UpdatePositionLast()
		player:Start()

		tmpDir = nil
		self.sanMonsterIndex = index

		return player
	end

	return nil
end

function ControllerStoryMode:CreateCallHero(heroId, heroType, pos)
	if heroId <= 0 then
		return nil
	end

	local monsterId = 0
	local data, propertyData
	local nickName = self.hostPlayer:GetNickName()
	local tmpHeroData = FS_UserData.heroList:GetHero(heroId)
	local level = 1

	if tmpHeroData ~= nil then
		level = tmpHeroData:GetLevel()
	end

	local teamId = 2

	if heroType == ControllerStoryMode.CallHeroType.Friend then
		teamId = 1
	elseif heroType == ControllerStoryMode.CallHeroType.Enemy then
		teamId = 2
		propertyData = {
			["Property_" .. MS_HeroData.Property.Toughness] = AnimalBase_Value_Define.SanMonsterHeroToughnessSub
		}
	end

	local nowPos = self.hostPlayer:GetPosByWorldPos()
	local isHost = false

	if DebugAIControl == true then
		isHost = true
	end

	local player = self.sceneController:CreatePlayerInPlay(heroId, monsterId, nickName, level, data, propertyData, ControllerStoryMode.monsterIdStart, teamId, isHost, AnimalBase_Define.MonsterType.CallHero, false)

	if player ~= nil then
		ControllerStoryMode.monsterIdStart = ControllerStoryMode.monsterIdStart + 1

		player:GetValue():SetRebornEnable(false)
		player:GetValue():LoadSaveProperty()
		player:SetMoveFix(false)
		player:SetPosByWorldPos(pos, true)

		local tmpDir = nowPos - pos

		tmpDir.y = 0

		if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
			player:LookAt(tmpDir, true)
		end

		player:UpdatePositionLast()
		player:Start()

		tmpDir = nil

		return player
	end

	return nil
end

function ControllerStoryMode:UnloadMonster(id)
	if self.monsterList[id] ~= nil then
		local tmpMonster = self.monsterList[id].monster
		local animalId = tmpMonster:GetAnimalId()

		self.sceneController:RemovePlayerDelay(animalId)

		self.monsterList[id] = nil
	end
end

function ControllerStoryMode:DestroySanMonster()
	if self.sanMonster == nil then
		return
	end

	local animalId = self.sanMonster:GetAnimalId()

	self.sceneController:RemovePlayerDelay(animalId)

	self.sanMonster = nil
	self.sanMonsterIndex = 0
end

function ControllerStoryMode:DisappearSanMonster()
	if self.sanMonster == nil then
		return
	end

	self.sanMonster:ChangeToNightmareEnd()
end

function ControllerStoryMode:DestroyCallHero(real)
	if self.callHero == nil then
		return
	end

	if real == false then
		local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

		if tmpHeroId > 0 and tmpHeroType > 0 then
			self.callHero:SaveProperty()
		end
	else
		FS_UserData.story:ClearHeroCall()
	end

	local animalId = self.callHero:GetAnimalId()

	self.sceneController:RemovePlayerDelay(animalId)

	self.callHero = nil
end

function ControllerStoryMode:DisappearCallHero()
	if self.callHero == nil then
		return
	end

	self.callHero:ChangeToCallEnd()
end

function ControllerStoryMode:DestroyMonster(id)
	if self.monsterList[id] ~= nil then
		local tmpMonster = self.monsterList[id].monster
		local animalId = tmpMonster:GetAnimalId()

		self.sceneController:RemovePlayerDelay(animalId)

		self.monsterList[id] = nil
	end

	if self.monsterDeadList[id] ~= nil then
		local animalId = self.monsterDeadList[id]:GetAnimalId()

		self.sceneController:RemovePlayerDelay(animalId)

		self.monsterDeadList[id] = nil
	end
end

function ControllerStoryMode:KillMonster(id)
	local deadMission = true
	local bossFlg = false
	local bossGradeUp = false
	local data = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, id)

	if self.monsterList[id] ~= nil then
		if self.monsterList[id].monster ~= nil then
			local deadMonster = self.monsterList[id].monster

			if deadMonster:IsDeadReason(AnimalBase_Define.DeadReason.CallAnimal) then
				deadMission = false
			end

			bossFlg = deadMonster:IsBoss()

			if bossFlg == true and data ~= nil and data.BossFinal > 0 and deadMonster:GetGrade() > deadMonster:GetGradeThreshold() then
				bossGradeUp = true
			end

			if self.monsterDeadList[id] == nil then
				self.monsterDeadList[id] = deadMonster
			else
				SystemHelper.LogError("==========monsterDeadList====id=" .. id .. " exist !!!")
			end

			if data.Infinity <= 0 then
				FS_UserData.story:AddMonsterDead(id)
			end

			self:StopMonsterWhisper(deadMonster)
		end

		self.monsterList[id] = nil

		FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.KillEnemyTimes, self.sceneController:GetHostPlayerHeroId(), self.monsterDeadList[id]:GetHeroId())
		FS_UserData.playerBehavior:RecordDurationByBossId(self.monsterDeadList[id]:GetStoryMonsterId())
	end

	if deadMission == true and data ~= nil then
		if bossFlg == true and data.BossFinal > 0 and MS_StoryList.IsStoryMazeBoss(self.storyId) == false then
			if bossGradeUp == true or data.StoryMonsterId == MS_Achievement.LastBossId or data.StoryMonsterId == MS_Achievement.TideLastBossId then
				self:RecordAchievement(MS_Achievement.AchievementIdType.FirstTimeKillBossInSan, 1)
			else
				FS_UserData.story:SetKillBossNotInSan()
			end
		end

		local questStr = data.CompleteQuestId
		local questStr2 = data.CompleteQuestId2

		if bossGradeUp == true and questStr2 ~= "" then
			self:CompleteQuest(questStr2)
		end

		self:CompleteQuest(questStr)

		local dropId = data.DropId

		if dropId ~= nil and dropId ~= "" then
			local firstDropQuestId = data.FirstDropCompleteQuestId

			if firstDropQuestId ~= "" and FS_UserData.story:IsQuestComplete(firstDropQuestId) == false then
				dropId = data.FirstDropId

				self:CompleteQuest(firstDropQuestId)
			end

			local dropIdList = StringHelper.Split(dropId, ";")

			for i, tempDropId in pairs(dropIdList) do
				tempDropId = tonumber(tempDropId)

				if MS_StoryList.IsStoryMazeStart(self.storyId) or MS_StoryList.IsStoryMaze(self.storyId) or MS_StoryList.IsStoryMazeBoss(self.storyId) then
					local tmpPos

					if MS_StoryList.IsStoryMazeBoss(self.storyId) == true and bossFlg == true and data.BossFinal > 0 then
						tmpPos = self.scene:GetSceneSkillPointPos(SceneBase.MazeBossDropItemPoint)
					end

					self:CreateMazeDropItem(tempDropId, id, i, tmpPos)
				else
					self:CreateDropItem(tempDropId, id, i)
				end
			end
		end

		local storyItemId = data.StoryItemId

		if storyItemId ~= nil and storyItemId ~= "" then
			local dropIdList = StringHelper.Split(storyItemId, ";")

			for i, tempDropId in pairs(dropIdList) do
				tempDropId = tonumber(tempDropId)

				self:SetStoryDropItem(tempDropId, id, i)
			end
		end

		if self.hostPlayer:IsHeroSanNotNormal(0) == true then
			local sanDropId = data.SanDropId

			if sanDropId ~= nil and sanDropId ~= "" then
				local dropIdList = StringHelper.Split(sanDropId, ";")

				for i, tempDropId in pairs(dropIdList) do
					tempDropId = tonumber(tempDropId)

					self:CreateSanDropItem(tempDropId, id, i)
				end
			end
		end

		if self.hostPlayer ~= nil and self.hostPlayer:GetHeroId() == 10002 then
			self:CreateDropBullet(self.hostPlayer:GetAnimalId(), id)
		end

		local tmpMonster = self.monsterDeadList[id]

		if tmpMonster ~= nil and tmpMonster:IsType(AnimalBase_Define.Type.Hero) == true and tmpMonster:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
			self:CreateNightmareDropItem(AnimalBase_Define.SanMonsterDropId, tmpMonster)

			self.hpAddItemUseNumForAI = 0
		end

		if self.hostPlayer ~= nil then
			local add = data.SanKill
			local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.hostPlayer:GetAnimalId(), MS_HeroTalent.Type.SanKillAdd, 0, 0)

			if tmpTalentSanAdd > 0 then
				add = MathHelper.addValuePermil(add, tmpTalentSanAdd)
			end

			if bossFlg == true then
				self.hostPlayer:GetValue():SetSanPropertyLockCrazy(false)
			end

			self.hostPlayer:GetValue():AddProperty(MS_HeroData.Property.San, add)
		end

		FS_UserData.story:AddMonsterKillCnt(data.MonsterType)

		if data.CrateId > 0 then
			local crate = self.scene:GetCrate(data.CrateId)

			if crate ~= nil then
				local find = false
				local monsterList = crate:GetMonster()

				if monsterList ~= nil then
					for monsterId, v in pairs(monsterList) do
						if FS_UserData.story:IsMonsterDead(monsterId) == false then
							find = true

							break
						end
					end
				end

				if find == false then
					crate:UnlockCrate()
				end
			end
		end

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			local ArcadePropertyData = MS_ArcadeMonsterProperty.GetStoryMonsterProperty(data.HeroId, FS_UserData.story:GetDifficulty(), 1)

			if data.BossFinal == 0 and ArcadePropertyData and ArcadePropertyData.Score > 0 and table.contains(MS_StoryMonster.ArcadeRefreshMonsterList, id) == false and self:IsCreateFromCallAnimal(id) == false then
				local eachKillScore = FS_UserData.arcade:GetKillScoreEach(self.storyId, ArcadePropertyData.Score)

				UIManager.SendMessage("Mainmenu", "ShowRecordUpdateScore", eachKillScore)
				FS_UserData.story:AddStageScore(self.storyId, eachKillScore)
				UIManager.SendMessage("Mainmenu", "ShowRecordScore", FS_UserData.story:GetStageScoreAll())
			end

			self:AddTalent(data.TalentAdd)

			if table.contains(MS_Achievement.ArcadeMonsterList, id) then
				FS_UserData.story:AddAchievementValue(MS_Achievement.AchievementIdType.killAllArcadeMonster, 1, id)
			end
		end

		if MS_StoryList.IsStoryMaze(self.storyId) then
			local isFull = FS_UserData.story:AddMazeBossBar(data.mazeAdd)

			if isFull == true then
				self.scene:AddEntrance(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), Entrance.Type.Common)
				self:UpdateMazeDoorEffect()
			end
		elseif MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			if bossFlg == true and data.BossFinal > 0 then
				self.bossRevertQuest = nil

				self:ExitBossMode()
				FS_UserData.story:KillMazeBoss(id)
				self.hostPlayer:GetValue():SetSanPropertyLockCrazy(false)
				self.hostPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.San)
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)

				local tmpPos = self.scene:GetSceneSkillPointPos(SceneBase.MazeBossEntrancePoint)
				local mazeId = FS_UserData.story:GetMazeId()
				local mazeFloor = FS_UserData.story:GetMazeFloor()

				if FS_UserData.story:IsMazeFloorMax() == true then
					self.scene:AddEntrance(tmpPos, Vector3.s_forward, Entrance.Type.Final)

					if FS_UserData.story:IsHaveMazeFinalFloor() == true then
						local tmpPos2 = self.scene:GetSceneSkillPointPos(SceneBase.MazeBossEntrancePoint2)

						self.scene:AppendEntrance(tmpPos2, Vector3.s_forward, Entrance.Type.Additional)
					else
						self:CompleteQuest(tostring(MS_StoryQuest.MazeBossDialogQuest))
					end

					if MS_StoryMaze.IsMazeFinalFloor(mazeId, mazeFloor) then
						self:CompleteQuest(tostring(MS_StoryQuest.MazeFinalBossQuest))
					elseif MS_StoryQuest.MazeBossQuest[mazeId] ~= nil then
						self:CompleteQuest(tostring(MS_StoryQuest.MazeBossQuest[mazeId]))
					end
				else
					self.scene:AddEntrance(tmpPos, Vector3.s_forward, Entrance.Type.Common)
				end

				UIManager.SendMessage("Mainmenu", "ShowMazeBar", true)
				UIManager.SendMessage("Mainmenu", "SetMazeProgress", 1)

				if MS_StoryMaze.IsMazeFinalFloor(mazeId, mazeFloor) then
					UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", false)
				else
					UIManager.SendMessage("Mainmenu", "ShowMazeBossBar", true)
					UIManager.SendMessage("Mainmenu", "InitMazeBossBar", MS_StoryMaze.GetMazeFloorMax(mazeId))
					UIManager.SendMessage("Mainmenu", "SetMazeBossUpdated", mazeFloor)
				end
			end
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			if MS_StoryList.IsBossChallenge(self.storyId) then
				if bossFlg == true and data.BossFinal > 0 then
					self:ExitBossMode()
					UIManager.SendMessage("Mainmenu", "ShowChallengeResult", self.challengeSuccess, self.bossChallengeTotalTime, self.ChallengePerfect)
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
				end
			elseif id == 9068 or id == 9070 then
				self:ExitBossMode()
				UIManager.SendMessage("Mainmenu", "ShowChallengeResult", self.challengeSuccess, self.bossChallengeTotalTime, self.ChallengePerfect)
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
			end
		end
	end

	if DebugBehaviorLog == true then
		LS_BehaviorLog.Log(LS_BehaviorLog.Type.KillMonster, id, self.hostPlayer:GetValue():GetProperty(MS_HeroData.Property.Hp))
	end
end

function ControllerStoryMode:FinishArcade()
	if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
		self.sceneController:ExitMenu()
		self.sceneController:BackToTitle()
	elseif FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) then
		if FS_UserData.story:GetStoryId() ~= FS_SaveStory.ArcadeStoryIdMax - 1000 then
			local nextStoryId = FS_UserData.story:GetStoryId() + 1

			if FS_UserData.story:GetStoryId() == 1003 then
				nextStoryId = 1005
			elseif FS_UserData.story:GetStoryId() == 1005 then
				nextStoryId = 1004
			elseif FS_UserData.story:GetStoryId() == 1004 then
				nextStoryId = 1006
			end

			if nextStoryId == FS_SaveStory.ArcadeStoryIdMax then
				nextStoryId = FS_SaveStory.ArcadeStoryIdMax - 1000
			end

			self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.GoToNextStage, nextStoryId, 1)
		else
			self.sceneController:ExitMenu()
			self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.BackToTitle, 0, 0)
		end
	end
end

function ControllerStoryMode:StopMonsterWhisper(animal)
	if animal ~= nil then
		UIManager.SendMessage("Dialog", "StopWhisperBySpeaker", animal)
	end
end

function ControllerStoryMode:GetMonster(id)
	if self.monsterList[id] ~= nil and self.monsterList[id].monster ~= nil then
		return self.monsterList[id].monster
	end

	return nil
end

function ControllerStoryMode:GetMonsterIncludeDead(id)
	if self.monsterList[id] ~= nil and self.monsterList[id].monster ~= nil then
		return self.monsterList[id].monster
	end

	if self.monsterDeadList[id] ~= nil then
		return self.monsterDeadList[id]
	end

	return nil
end

function ControllerStoryMode:ResetAndStopMonster()
	for i, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if tmpMonster:IsDead() == false then
			if tmpMonster:IsBoss() == false and tmpMonster:IsMoveFix() == false and tmpMonster:GetHeroExtAIId() ~= GameAI.BehaviourMode.Companion and tmpMonster:IsInTimeLine() == false and GameAI.IsTimeLineSkillEnable(tmpMonster, self) == false then
				local tmpPos = tmpMonster:GetRebornPosition()
				local tmpLook = tmpMonster:GetRebornLook()

				tmpMonster:SetPosByWorldPos(tmpPos, true)
				tmpMonster:LookAt(tmpLook, true)
				tmpMonster:UpdatePositionLast()
			end

			if tmpMonster:IsSkillingById(AnimalBase_Define.SkillType.Born1, 0) == false and tmpMonster:IsSkillingById(AnimalBase_Define.SkillType.Born2, 0) == false and tmpMonster:IsSkillingById(AnimalBase_Define.SkillType.Born3, 0) == false and GameAI.IsTimeLineSkillEnable(tmpMonster, self) == false then
				tmpMonster:Stop()
			end
		end
	end

	if self.sanMonster ~= nil then
		self:DestroySanMonster()
	end

	if self.callHero ~= nil then
		self:DestroyCallHero(false)
	end
end

function ControllerStoryMode:ShowAnimalAll(flg)
	for i, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if tmpMonster:IsDead() == false then
			tmpMonster:SetRenderAllVisible(AnimalBase_Define.VisibleType.Menu, flg)
		end
	end

	self.hostPlayer:SetRenderAllVisible(AnimalBase_Define.VisibleType.Menu, flg)
end

function ControllerStoryMode:RestartMonster()
	for i, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if tmpMonster:IsDead() == false then
			tmpMonster:Restart()
		end
	end
end

function ControllerStoryMode:RefreshMonster()
	self:ClearMonsterAll(true)

	if not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		FS_UserData.story:ClearMonsterDead()
	else
		for k, v in pairs(MS_StoryMonster.ArcadeRefreshMonsterList) do
			FS_UserData.story:RemoveMonsterDead(v)
		end
	end

	FS_UserData.story:ClearMonsterCall()
end

function ControllerStoryMode:ClearCallMonsterAll()
	local deleteIdList = {}

	for i, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if tmpMonster:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true then
			table.insert(deleteIdList, i)
		end
	end

	local deleteIdListEx = table.keys(self.monsterDeadList)

	table.append(deleteIdList, deleteIdListEx)

	for i = 1, #deleteIdList do
		local id = deleteIdList[i]

		self:DestroyMonster(id)
	end

	if self.sanMonster ~= nil then
		self:DestroySanMonster()
	end

	if self.callHero ~= nil then
		self:DestroyCallHero(false)
	end

	deleteIdList = nil
end

function ControllerStoryMode:ClearMonsterAll(includeBoss)
	local deleteIdList = {}

	for i, tmpMonsterData in pairs(self.monsterList) do
		local tmpMonster = tmpMonsterData.monster

		if includeBoss == true or tmpMonster:IsBoss() == false then
			table.insert(deleteIdList, i)
		elseif self:IsBossMode() == true and self.bossId > 0 and self.bossId ~= i then
			table.insert(deleteIdList, i)
		end
	end

	local deleteIdListEx = table.keys(self.monsterDeadList)

	table.append(deleteIdList, deleteIdListEx)

	for i = 1, #deleteIdList do
		local id = deleteIdList[i]

		self:DestroyMonster(id)
	end

	if self.sanMonster ~= nil then
		self:DestroySanMonster()
	end

	if self.callHero ~= nil then
		self:DestroyCallHero(false)
	end

	deleteIdList = nil
end

function ControllerStoryMode:ExitArea()
	self:ClearMonsterAll(true)
end

function ControllerStoryMode:SetFrogSatisfy(frogId, value)
	self.frogSatisfyList[frogId] = value
end

function ControllerStoryMode:GetFrogSatisfy(frogId)
	if self.frogSatisfyList[frogId] ~= nil then
		return self.frogSatisfyList[frogId]
	else
		local frogData = MS_StoryFrog.GetStoryFrog(frogId)

		if frogData then
			self.frogSatisfyList[frogId] = frogData.Satisfy

			return self.frogSatisfyList[frogId]
		end
	end

	return 0
end

function ControllerStoryMode:RefreshFrogSatisfyList()
	self.frogSatisfyList = {}
end

function ControllerStoryMode:InitSceneWall()
	self.storyQuestWallEnableList = nil
	self.storyQuestWallList = nil

	if self.storyQuestWallAllList ~= nil then
		for id, wallData in pairs(self.storyQuestWallAllList) do
			local storyWallId = tonumber(wallData.WallId)

			if self.storyQuestWallList == nil then
				self.storyQuestWallList = {}
			end

			if self.storyQuestWallEnableList == nil then
				self.storyQuestWallEnableList = {}
			end

			if self.storyQuestWallList[storyWallId] == nil then
				local wallName = wallData.WallName
				local tfWall = self.scene:GetWall(wallName)

				if tfWall ~= nil then
					tfWall.gameObject:SetActive(false)

					self.storyQuestWallList[storyWallId] = tfWall
					self.storyQuestWallEnableList[storyWallId] = false
				end
			end
		end
	end
end

function ControllerStoryMode:CheckSceneWall()
	if self.storyQuestWallAllList ~= nil then
		for id, wallData in pairs(self.storyQuestWallAllList) do
			local storyWallId = tonumber(wallData.WallId)

			if self.storyQuestWallList ~= nil and self.storyQuestWallList[storyWallId] ~= nil and self.storyQuestWallEnableList ~= nil and self.storyQuestWallEnableList[storyWallId] ~= nil then
				if self:CheckShowQuestComplete(wallData.ShowQuestId) == true and self:CheckHideQuestComplete(wallData.HideQuestId) == false then
					if self.storyQuestWallEnableList[storyWallId] == false then
						self.storyQuestWallList[storyWallId].gameObject:SetActive(true)

						self.storyQuestWallEnableList[storyWallId] = true
					end
				elseif self.storyQuestWallEnableList[storyWallId] == true then
					self.storyQuestWallList[storyWallId].gameObject:SetActive(false)

					self.storyQuestWallEnableList[storyWallId] = false
				end
			end
		end
	end
end

function ControllerStoryMode:ClearSceneEffect()
	if self.storyQuestEffectList ~= nil then
		for i, effList in pairs(self.storyQuestEffectList) do
			if effList ~= nil then
				for k, eff in pairs(effList) do
					if eff ~= nil then
						eff:Clear()
					end
				end
			end
		end
	end

	self.storyQuestEffectList = nil
	self.storyQuestEffectEnableList = nil

	if self.storyMazeEntrance ~= nil then
		self.storyMazeEntrance:Clear()
	end

	self.storyMazeEntrance = nil

	if self.storyMazeBossEntranceList ~= nil then
		for i, eff in pairs(self.storyMazeBossEntranceList) do
			if eff ~= nil then
				eff:Clear()
			end
		end
	end

	self.storyMazeBossEntranceList = nil
end

function ControllerStoryMode:InitSceneEffect()
	self:ClearSceneEffect()

	if self.storyQuestEffectAllList ~= nil then
		for storyEffectId, effectData in pairs(self.storyQuestEffectAllList) do
			local effectRootName = effectData.EffectRootName
			local type = effectData.Type
			local tfEffectRoot = self.scene:GetEffectRoot(effectRootName)

			if tfEffectRoot ~= nil then
				if type == MS_StoryEffect.Type.Quest or type == MS_StoryEffect.Type.Boss then
					if self.storyQuestEffectList == nil then
						self.storyQuestEffectList = {}
					end

					if self.storyQuestEffectList[storyEffectId] == nil then
						self.storyQuestEffectList[storyEffectId] = {}
					end

					local len = tfEffectRoot.childCount
					local tmpVfxName = string.lower("vfx_")

					for i = 0, len - 1 do
						local _tf = tfEffectRoot:GetChild(i)
						local childName = _tf.name

						if StringHelper.StartsWith(childName, tmpVfxName) == true then
							local vfx = _tf.gameObject:GetComponent(typeof(XEffect))

							if vfx == nil then
								vfx = _tf.gameObject:AddComponent(typeof(XEffect))
							end

							if vfx ~= nil then
								vfx:Init(true)
								table.insert(self.storyQuestEffectList[storyEffectId], vfx)
							end
						end
					end

					if self.storyQuestEffectEnableList == nil then
						self.storyQuestEffectEnableList = {}
					end

					self.storyQuestEffectEnableList[storyEffectId] = false
				elseif type == MS_StoryEffect.Type.MazeEntrance then
					if MS_StoryList.IsStoryMaze(self.storyId) == true then
						local entranceId = storyEffectId - type * 1000

						if entranceId > 0 and entranceId == FS_UserData.story:GetMazeEntrance() and self.storyMazeEntrance == nil then
							local _tf = tfEffectRoot:GetChild(0)

							if _tf ~= nil then
								local childName = _tf.name
								local tmpVfxName = string.lower("vfx_")

								if StringHelper.StartsWith(childName, tmpVfxName) == true then
									local vfx = _tf.gameObject:GetComponent(typeof(XEffect))

									if vfx == nil then
										vfx = _tf.gameObject:AddComponent(typeof(XEffect))
									end

									if vfx ~= nil then
										vfx:Init(true)
										vfx:SetHost(nil)
										vfx:SetDelayClear(true, nil)

										self.storyMazeEntrance = vfx
									end
								end
							end
						else
							tfEffectRoot.gameObject:SetActive(false)
						end
					else
						tfEffectRoot.gameObject:SetActive(false)
					end
				elseif type == MS_StoryEffect.Type.MazeBossEntrance then
					if MS_StoryList.IsStoryMaze(self.storyId) == true then
						if self.storyMazeBossEntranceList == nil then
							self.storyMazeBossEntranceList = {}
						end

						local entranceId = storyEffectId - type * 1000

						if entranceId > 0 and self.storyMazeBossEntranceList[entranceId] == nil then
							local _tf = tfEffectRoot:GetChild(0)

							if _tf ~= nil then
								local childName = _tf.name
								local tmpVfxName = string.lower("vfx_")

								if StringHelper.StartsWith(childName, tmpVfxName) == true then
									local vfx = _tf.gameObject:GetComponent(typeof(XEffect))

									if vfx == nil then
										vfx = _tf.gameObject:AddComponent(typeof(XEffect))
									end

									if vfx ~= nil then
										vfx:Init(true)
										vfx:SetHost(nil)
										vfx:SetDelayClear(true, nil)

										self.storyMazeBossEntranceList[entranceId] = vfx
									end
								end
							end
						else
							tfEffectRoot.gameObject:SetActive(false)
						end
					else
						tfEffectRoot.gameObject:SetActive(false)
					end
				end
			end
		end
	end

	self:UpdateMazeDoorEffect()
end

function ControllerStoryMode:UpdateMazeDoorEffect()
	if MS_StoryList.IsStoryMaze(self.storyId) == true then
		if FS_UserData.story:IsMazeBossBarFull() == true then
			if self.storyMazeBossEntranceList ~= nil then
				for i, eff in pairs(self.storyMazeBossEntranceList) do
					if eff ~= nil then
						eff:Play()
					end
				end
			end

			if self.storyMazeEntrance ~= nil then
				self.storyMazeEntrance:Clear()
			end
		else
			if self.storyMazeBossEntranceList ~= nil then
				for i, eff in pairs(self.storyMazeBossEntranceList) do
					if eff ~= nil then
						eff:Clear()
					end
				end
			end

			if self.storyMazeEntrance ~= nil then
				self.storyMazeEntrance:Play()
			end
		end
	end
end

function ControllerStoryMode:CheckSceneEffect()
	if self.storyQuestEffectAllList ~= nil then
		for storyEffectId, effectData in pairs(self.storyQuestEffectAllList) do
			local type = effectData.Type

			if type == MS_StoryEffect.Type.Quest or type == MS_StoryEffect.Type.Boss then
				if self:CheckShowQuestComplete(effectData.ShowQuestId) == true and self:CheckHideQuestComplete(effectData.HideQuestId) == false then
					if self.storyQuestEffectEnableList ~= nil and self.storyQuestEffectEnableList[storyEffectId] == false then
						if self.storyQuestEffectList ~= nil and self.storyQuestEffectList[storyEffectId] ~= nil then
							local storyEffectDelay = tonumber(effectData.SkillEfffectDelay)

							for i, eff in pairs(self.storyQuestEffectList[storyEffectId]) do
								if eff ~= nil then
									eff:SetHost(nil)

									if storyEffectDelay > 0 then
										eff:SetDelayClear(true, nil)
									end

									eff:Play()
								end
							end
						end

						self.storyQuestEffectEnableList[storyEffectId] = true
					end
				elseif self.storyQuestEffectEnableList ~= nil and self.storyQuestEffectEnableList[storyEffectId] == true then
					if self.storyQuestEffectList ~= nil and self.storyQuestEffectList[storyEffectId] ~= nil then
						for i, eff in pairs(self.storyQuestEffectList[storyEffectId]) do
							if eff ~= nil then
								eff:Clear()
							end
						end
					end

					self.storyQuestEffectEnableList[storyEffectId] = false
				end
			end
		end
	end
end

function ControllerStoryMode:CheckCurtain()
	if self.curtainList == nil then
		return
	end

	local nowPos = self.hostPlayer:GetPosByWorldPos()
	local ret = false

	for id, locatorData in pairs(self.curtainList) do
		local startPos = locatorData.StartPosition
		local startLookZ = locatorData.StartZLook
		local startLookX = locatorData.StartXLook
		local endPos = locatorData.EndPos
		local endLookZ = locatorData.EndZLook
		local endLookX = locatorData.EndXLook
		local heightMax = Mathf.Max(startPos.y, endPos.y) + ControllerStoryMode.CurtainHeightMax
		local heightMin = Mathf.Min(startPos.y, endPos.y) + ControllerStoryMode.CurtainHeightMin

		if heightMax >= nowPos.y and heightMin <= nowPos.y then
			local toStart = nowPos - startPos

			toStart.y = 0

			if Vector3.Dot(toStart, startLookZ) >= 0 and Vector3.Dot(toStart, startLookX) >= 0 then
				local toEnd = nowPos - endPos

				toEnd.y = 0

				if Vector3.Dot(toEnd, endLookZ) >= 0 and Vector3.Dot(toEnd, endLookX) >= 0 then
					local disStart = MathHelper.getDistancePointToLine(startPos, nowPos, startLookZ)
					local disEnd = MathHelper.getDistancePointToLine(endPos, nowPos, endLookZ)
					local rate = disStart / (disStart + disEnd)

					UIManager.SendMessage("Mainmenu", "ShowBlockingCaution", rate)

					ret = true

					break
				end
			end
		end
	end

	if ret == false then
		UIManager.SendMessage("Mainmenu", "ShowBlockingCaution", 0)
	end
end

function ControllerStoryMode:CheckRouteWall()
	local findFlg = false

	if self.storyQuestWallList ~= nil then
		for id, tfWall in pairs(self.storyQuestWallList) do
			if self.storyQuestWallAllList ~= nil then
				local wallData = self.storyQuestWallAllList[id]

				if wallData ~= nil and wallData.Rebound > 0 then
					findFlg = true
				end
			end
		end
	end

	if findFlg == false then
		return
	end

	if self.hostPlayer ~= nil and self.hostPlayer:IsWillDead() == false and self.hostPlayer:IsFreeMoving() == true then
		local forward = self.hostPlayer:GetForward()
		local pos = self.hostPlayer:GetPosByWorldPos()
		local testDis = self.hostPlayer:GetRadius() + self.hostPlayer:GetSkinWidthRouteCollider() + ControllerStoryMode.RouteWallDistance
		local ret = XPhysics.RaycastAll(self.hostPlayer:GetAnimalId(), 0, pos.x, pos.y + ControllerStoryMode.RouteWallHeight, pos.z, forward.x, forward.y, forward.z, testDis, ControllerStoryMode.RouteWallLayerMask)

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

			ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId = XPhysics.GetCastNearestInfo(self.hostPlayer:GetAnimalId(), 0, ControllerStoryMode.RouteWallLayerMask, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitCollider, hitOwnerId)

			if ret == true and hitCollider ~= nil then
				local hitTransform = hitCollider.transform
				local findWallData

				if self.storyQuestWallList ~= nil then
					for id, tfWall in pairs(self.storyQuestWallList) do
						if tfWall == hitTransform and self.storyQuestWallAllList ~= nil then
							local wallData = self.storyQuestWallAllList[id]

							if wallData ~= nil and wallData.Rebound > 0 then
								findWallData = wallData

								break
							end
						end
					end
				end

				if findWallData ~= nil then
					if AppVer == AppDemoPax1903 or AppVer == AppAppleLight or AppVer == AppTapTapEA or AppVer == AppTapTapCloudDemo then
						self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
					elseif findWallData.ToStoryId > 0 and findWallData.ToEntranceId > 0 then
						if MS_StoryList.IsStoryMazeStart(findWallData.ToStoryId) == true then
							if DLC_Maze == true then
								if self:CheckShowQuestComplete(findWallData.NotReboundQuestId) == true then
									if IapData.GetEnterMaze() then
										local uiTxt = GameText.UI_COMMON_ACTION_MAZE_IN

										if MS_StoryList.IsStoryMazeStart(self.storyId) == true then
											uiTxt = GameText.UI_COMMON_ACTION_MAZE_OUT
										end

										self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
										UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
											self:ChangeStatus(ControllerStoryMode.Status.Normal)
											FS_UserData.story:SetReturnEntrance(findWallData.EntranceId)
											self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterMazeStart, findWallData.ToStoryId, findWallData.ToEntranceId)
											UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
										end, function()
											self:ChangeStatus(ControllerStoryMode.Status.Normal)
											self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, true)
										end, false)
									else
										local uiTxt = GameText.UI_COMMON_ACTION_MAZE_WALL

										self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
										UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
											self:ChangeStatus(ControllerStoryMode.Status.Normal)
											self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
										end, function()
											return
										end, true)
									end
								else
									self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
								end
							else
								self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
							end
						elseif MS_StoryList.IsStoryMaze(findWallData.ToStoryId) == true then
							if MS_StoryList.IsStoryMazeStart(self.storyId) == true then
								local uiTxt = GameText["UI_COMMON_ACTION_MAZE_START_" .. FS_UserData.story:GetMazeId()]

								self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
								UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
									self:ChangeStatus(ControllerStoryMode.Status.Normal)
									self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterMazeFirst, 0, 0)
									UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
								end, function()
									self:ChangeStatus(ControllerStoryMode.Status.Normal)
									self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
								end, false)
							elseif FS_UserData.story:IsMazeBossBarFull() == true then
								local uiTxt = GameText.UI_COMMON_ACTION_MAZE_BOSS

								self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
								UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
									self:ChangeStatus(ControllerStoryMode.Status.Normal)
									self:SaveProperty()
									self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterNextMaze, 0, 0)
									UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
								end, function()
									self:ChangeStatus(ControllerStoryMode.Status.Normal)
									self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
								end, false)
							else
								local wallEntranceId = findWallData.WallId - 1000

								if DebugMazeReturnDirect == false and FS_UserData.story:GetMazeEntrance() == wallEntranceId then
									self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
									self:OpenColliderWallDialog(MS_StoryDialog.MazeDoorEntranceId)
								else
									local uiTxt = GameText.UI_COMMON_ACTION_MAZE_NEXT

									self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
									UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
										self:ChangeStatus(ControllerStoryMode.Status.Normal)
										self:SaveProperty()
										self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterNextMaze, 0, 0)
										UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
									end, function()
										self:ChangeStatus(ControllerStoryMode.Status.Normal)
										self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
									end, false)
								end
							end
						elseif MS_StoryList.IsStoryMazeStart(self.storyId) == true then
							local uiTxt = GameText.UI_COMMON_ACTION_MAZE_OUT

							self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
								self:ChangeStatus(ControllerStoryMode.Status.Normal)
								self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.ExitMazeStart, findWallData.ToStoryId, findWallData.ToEntranceId)
								UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
							end, function()
								self:ChangeStatus(ControllerStoryMode.Status.Normal)
								self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
							end, false)
						else
							local uiTxt = GameText.UI_COMMON_ACTION_DARKFOREST_IN

							if BattleData.IsDarkForestScene() == true then
								uiTxt = GameText.UI_COMMON_ACTION_DARKFOREST_OUT
							end

							self:ChangeStatus(ControllerStoryMode.Status.DarkForestConfirm)
							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
								self:ChangeStatus(ControllerStoryMode.Status.Normal)
								self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterOrExitDarkForest, findWallData.ToStoryId, findWallData.ToEntranceId)
								UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
							end, function()
								self:ChangeStatus(ControllerStoryMode.Status.Normal)
								self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
							end, false)
						end
					else
						self:ColliderWithRouteWall(findWallData, normalX, normalY, normalZ, false)
					end
				end
			end
		end
	end
end

function ControllerStoryMode:ColliderWithRouteWall(wallData, normalX, normalY, normalZ, noRebound)
	local dir = Vector3.zero

	dir:Set(normalX, 0, normalZ)
	dir:SetNormalize()
	self.hostPlayer:ChangeToMoveForce(dir, ControllerStoryMode.ForceMoveColliderWallTime)

	dir = nil

	local dialogId = wallData.DialogId

	if noRebound == true then
		dialogId = wallData.NotReboundDialogId
	end

	if dialogId ~= "" then
		local tmpIdList = StringHelper.Split(dialogId, ";")

		for p = 1, #tmpIdList do
			local tmpDialogId = tmpIdList[p]
			local ret = self:OpenColliderWallDialog(tmpDialogId)

			if ret == true then
				break
			end
		end
	end
end

function ControllerStoryMode:OpenColliderWallDialog(tmpDialogId)
	local tmpDialogData = self:GetDialogData(tmpDialogId)

	if tmpDialogData ~= nil and self:CheckDialogShow(tmpDialogData) == true then
		self.sceneController:OpenDialog(tmpDialogId, nil)

		return true
	end

	return false
end

function ControllerStoryMode:InitCrow()
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.CrowFixed, 1)

	if locatorData ~= nil then
		self.sceneController:GetCrow():StartFixed(locatorData.Position, locatorData.Orientation)
		self.sceneController:GetCrow():PlayAnimation(Crow_Define.AnimationName.FixedIdle)
	end
end

function ControllerStoryMode:UpdateSceneItem()
	local isShowActionButton = false

	if self.hostPlayer:IsEventEnable() == true and self.hostPlayer:IsPickingUp() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local heroId = self.hostPlayer:GetHeroId()
		local toRemoveSceneItem

		for id, tmpItem in pairs(self.storySceneItemList) do
			if tmpItem:CheckEatItem(nowPos) then
				if tmpItem:IsAttachItem(heroId) then
					if tmpItem:IsMoving() == false and self:IsHostPlayerVisible(tmpItem:GetPosition()) == true then
						if tmpItem:IsEquipAutoGetItemTrophy() then
							local item, itemNum = self:AutoGetItem(tmpItem, true)

							if itemNum > 0 then
								local ItemTemplate = require("LuaScript/Logic/Item/ItemSceneAttach")
								local itemAttach = ItemTemplate:new(tmpItem, self.hostPlayer, item, itemNum, function(itemAtt)
									self:AttachItemCallback(itemAtt)
								end)

								table.insert(self.storySceneAttachItemList, itemAttach)
							end

							if toRemoveSceneItem == nil then
								toRemoveSceneItem = {}
							end

							table.insert(toRemoveSceneItem, tmpItem)
						else
							self:AutoGetItem(tmpItem)

							if toRemoveSceneItem == nil then
								toRemoveSceneItem = {}
							end

							table.insert(toRemoveSceneItem, tmpItem)
						end
					end
				elseif isShowActionButton == false and tmpItem:CheckShowActionButton(nowPos) then
					UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Picking, true)

					isShowActionButton = true
				end
			end
		end

		if toRemoveSceneItem ~= nil then
			for k, v in pairs(toRemoveSceneItem) do
				self:AutoGetItemRemove(v)
			end

			toRemoveSceneItem = nil
		end

		local toRemoveDropItem
		local drop_list = FS_UserData.story:GetDropItemList()

		for i = 1, #drop_list do
			local tmpItem = drop_list[i]

			if tmpItem ~= nil and tmpItem:CheckEatItem(nowPos) then
				if tmpItem:IsAttachItem(heroId) then
					if tmpItem:IsMoving() == false and self:IsHostPlayerVisible(tmpItem:GetPosition()) == true then
						if tmpItem:IsEquipAutoGetItemTrophy() then
							local item, itemNum = self:AutoGetItem(tmpItem, true)

							if itemNum > 0 then
								local ItemTemplate = require("LuaScript/Logic/Item/ItemSceneAttach")
								local itemAttach = ItemTemplate:new(tmpItem, self.hostPlayer, item, itemNum, function(itemAtt)
									self:AttachItemCallback(itemAtt)
								end)

								table.insert(self.storySceneAttachItemList, itemAttach)
							end

							if toRemoveDropItem == nil then
								toRemoveDropItem = {}
							end

							table.insert(toRemoveDropItem, tmpItem)
						else
							self:AutoGetItem(tmpItem)

							if toRemoveDropItem == nil then
								toRemoveDropItem = {}
							end

							table.insert(toRemoveDropItem, tmpItem)
						end
					end
				elseif isShowActionButton == false and tmpItem:CheckShowActionButton(nowPos) then
					UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Picking, true)

					isShowActionButton = true
				end
			end
		end

		if toRemoveDropItem ~= nil then
			for k, v in pairs(toRemoveDropItem) do
				self:AutoGetItemRemove(v)
			end

			toRemoveDropItem = nil
		end
	end

	if isShowActionButton == false then
		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Picking, false)
	end
end

function ControllerStoryMode:CreateSceneMark(id)
	if self.hostPlayer ~= nil then
		local itemPos = self.hostPlayer:GetPosByWorldPos()
		local retItem

		if id == MS_ItemData.SceneMarkItem then
			retItem = FS_UserData.story:AddDropItem(MS_ItemData.SceneMarkItem, 1, itemPos)

			if retItem ~= nil then
				if #self.markSceneItemQueue == MS_ItemData.SceneMarkItemCountMax then
					self:RecycleSceneMark(self.markSceneItemQueue[1])
				end

				table.insert(self.markSceneItemQueue, retItem)
			end
		elseif id == MS_ItemData.SceneMarkItemMaze then
			self:UseBagItem(id, 1)

			retItem = FS_UserData.story:AddDropItem(MS_ItemData.SceneMarkItemMaze, 1, itemPos)

			if retItem ~= nil then
				table.insert(self.markSceneItemMazeQueue, retItem)
			end
		end
	end
end

function ControllerStoryMode:RecycleSceneMark(markItem)
	table.removeValue(self.markSceneItemQueue, markItem)
	FS_UserData.story:RemoveDropItemValue(markItem)
	markItem:Exit()
end

function ControllerStoryMode:UpdateSceneMark()
	if self.markSceneItemQueue ~= nil and self.hostPlayer ~= nil then
		local tmpPos = self.hostPlayer:GetPosByWorldPos()

		for k, v in pairs(self.markSceneItemQueue) do
			local tmpRet = v:CheckAroundStatus(tmpPos)

			if tmpRet == true then
				self.hostPlayer:AddStatus(self.hostPlayer:GetVirtualPlayer(), MS_ItemData.StatusId_MarkScene, 0, MS_StatusData.SourceType.Item, MS_ItemData.SceneMarkItem, false)

				break
			end
		end
	end
end

function ControllerStoryMode:UpdateSceneMarkMaze()
	if self.markSceneItemMazeQueue ~= nil and self.hostPlayer ~= nil then
		local tmpPos = self.hostPlayer:GetPosByWorldPos()
		local tmpRet = false
		local nowTime = TimeHelper.getNowTime()
		local deleteIdList

		for i = 1, #self.markSceneItemMazeQueue do
			local item = self.markSceneItemMazeQueue[i]

			if item ~= nil then
				if tmpRet == false then
					tmpRet = item:CheckAroundStatus(tmpPos)

					if tmpRet == true then
						self.hostPlayer:AddStatus(self.hostPlayer:GetVirtualPlayer(), MS_ItemData.StatusId_MarkSceneMaze, 0, MS_StatusData.SourceType.Item, MS_ItemData.SceneMarkItemMaze, false)
					end
				end

				local time = item:GetTime()
				local diffTime = nowTime - time

				if diffTime > MS_ItemData.SceneMarkItemMazeTime then
					if deleteIdList == nil then
						deleteIdList = {}
					end

					table.insert(deleteIdList, i)
				end
			end
		end

		if deleteIdList ~= nil and #deleteIdList > 0 then
			for i = #deleteIdList, 1, -1 do
				local delIndex = deleteIdList[i]
				local item = self.markSceneItemMazeQueue[delIndex]

				if item ~= nil then
					FS_UserData.story:RemoveDropItemValue(item)
					item:Exit()
				end

				table.remove(self.markSceneItemMazeQueue, delIndex)
			end
		end

		deleteIdList = nil
	end
end

function ControllerStoryMode:AttachItemCallback(itemAtt)
	local itemId = itemAtt:GetUIItemId()
	local itemNum = itemAtt:GetUIItemNum()

	if itemId and itemNum > 0 then
		self:AddBagItemUI(itemId, itemNum)

		if self.storyGetItemEffectCD < TimeHelper.getNowTime() then
			VfxManager.PlayBindMulti(self.hostPlayer:GetBodyChest(), "vfx_item_self_10001")

			self.storyGetItemEffectCD = TimeHelper.getNowTime() + 1
		end
	end
end

function ControllerStoryMode:AutoGetItem(sceneItem, isIgnoreUI)
	sceneItem:EatItem()

	local tmpItemId = sceneItem:GetItemId()
	local tmpItemNum = sceneItem:GetItemNum()
	local tmpItemData = MS_ItemData.GetItemData(tmpItemId)
	local tmpReplaceItemId = sceneItem:GetReplaceItemId()
	local tmpReplaceItemNum = sceneItem:GetReplaceItemNum()
	local tmpReplacteItemData = sceneItem:GetReplaceItemData()

	if tmpReplacteItemData ~= nil and tmpReplaceItemId > 0 and tmpReplaceItemNum > 0 then
		tmpItemId = tmpReplaceItemId
		tmpItemNum = tmpReplaceItemNum
		tmpItemData = tmpReplacteItemData
	elseif tmpItemData.Type == MS_ItemData.Type.Exp and self.hostPlayer:IsHaveStatusByType(MS_StatusData.LogicType.ExpAdd) == true then
		tmpItemNum = tmpItemNum * 2
	elseif tmpItemData.Type == MS_ItemData.Type.MazeCoin and self.hostPlayer:IsHaveStatusByType(MS_StatusData.LogicType.MazeExpAdd) == true then
		tmpItemNum = tmpItemNum * 2
	end

	if FS_UserData.itemList:GetItemNum(tmpItemId) + tmpItemNum > tmpItemData.NumMax then
		FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemPickUpTimes, tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))
	else
		FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemPickUpTimes, tmpItemId, tmpItemNum)
	end

	local retItem, retNum = self:AddBagItem(tmpItemId, tmpItemNum, isIgnoreUI)

	return retItem, retNum
end

function ControllerStoryMode:AutoGetItemRemove(sceneItem)
	if sceneItem:GetSceneItemType() == ItemScene.Type.Scene then
		local sceneItemId = sceneItem:GetSceneItemId()
		local storyItemData = MS_StoryItem.GetItemData(self.storyId, sceneItemId)

		if storyItemData.CompleteQuestId ~= "" then
			self:CompleteQuest(storyItemData.CompleteQuestId)
		end

		self:ClearSceneItem(sceneItemId)
	elseif sceneItem:GetSceneItemType() == ItemScene.Type.Drop then
		FS_UserData.story:RemoveDropItemValue(sceneItem)
		sceneItem:Exit()
	end
end

function ControllerStoryMode:IsHavePickUpItem()
	local heroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

	if heroData == nil then
		return false
	end

	local nowPos = self.hostPlayer:GetPosByWorldPos()
	local hintFlg = false

	self.storySceneItemEatId = 0
	self.storyDropItemEatIndex = 0

	for id, tmpItem in pairs(self.storySceneItemList) do
		if tmpItem:CheckEatItem(nowPos) then
			local tmpItemId = tmpItem:GetItemId()

			if tmpItemId == MS_ItemData.ItemID_HpAdd then
				if heroData:IsHpNumMax() == true then
					hintFlg = true
				else
					self.storySceneItemEatId = id

					return true
				end
			elseif tmpItemId == MS_ItemData.ItemID_MpAdd then
				if heroData:IsMpNumMax() == true then
					hintFlg = true
				else
					self.storySceneItemEatId = id

					return true
				end
			else
				self.storySceneItemEatId = id

				return true
			end
		end
	end

	local drop_list = FS_UserData.story:GetDropItemList()

	for i = 1, #drop_list do
		local tmpItem = drop_list[i]

		if tmpItem ~= nil and tmpItem:CheckEatItem(nowPos) then
			local tmpItemId = tmpItem:GetItemId()

			if tmpItemId == MS_ItemData.ItemID_HpAdd then
				if heroData:IsHpNumMax() == true then
					self.storyDropItemCanNotEatIndex = i
					hintFlg = true
				else
					self.storyDropItemEatIndex = i

					return true
				end
			elseif tmpItemId == MS_ItemData.ItemID_MpAdd then
				if heroData:IsMpNumMax() == true then
					self.storyDropItemCanNotEatIndex = i
					hintFlg = true
				else
					self.storyDropItemEatIndex = i

					return true
				end
			else
				self.storyDropItemEatIndex = i

				return true
			end
		end
	end

	if hintFlg == true then
		if self.storyDropItemCanNotEatIndex then
			self:ResetItemPos(self.storyDropItemCanNotEatIndex)
		end

		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_INPUT_GAME_ITEMS2 .. GameText.Story_BagIsFull)
	end

	return false
end

function ControllerStoryMode:PickUpItem()
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		if self.storySceneItemEatId > 0 and self.storySceneItemList[self.storySceneItemEatId] ~= nil then
			local tmpItem = self.storySceneItemList[self.storySceneItemEatId]
			local tmpItemId = tmpItem:GetItemId()
			local tmpItemNum = tmpItem:GetItemNum()
			local tmpItemData = tmpItem:GetItemData()
			local tmpReplaceItemId = tmpItem:GetReplaceItemId()
			local tmpReplaceItemNum = tmpItem:GetReplaceItemNum()
			local tmpReplacteItemData = tmpItem:GetReplaceItemData()

			if tmpReplacteItemData ~= nil and tmpReplaceItemId > 0 and tmpReplaceItemNum > 0 then
				tmpItemId = tmpReplaceItemId
				tmpItemNum = tmpReplaceItemNum
				tmpItemData = tmpReplacteItemData
			end

			local quickIndex = -1

			if (tmpItemData.MainType == MS_ItemData.MainType.Consume or tmpItemData.MainType == MS_ItemData.MainType.Attack) and tmpItemId ~= MS_ItemData.ItemID_HpAdd and tmpItemId ~= MS_ItemData.ItemID_MpAdd and tmpItemId ~= MS_ItemData.ItemID_BulletAdd then
				quickIndex = self:GetQuickListEmptyIndex(tmpItemId)

				if quickIndex == -1 then
					local st = SystemHelper.ConvertReplaceRichText(GameText.UI_ARCADE_BAG_IS_FULL, "{(%a)}", "i", tmpItemData.Name)

					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", st)

					self.storySceneItemEatId = 0

					return
				end
			end

			if tmpItemData.MainType == MS_ItemData.MainType.Trophy then
				if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)
				else
					tmpItem:EatItem()
					self:AddBagItem(tmpItemId, tmpItemNum)

					local storyItemData = MS_StoryItem.GetItemData(self.storyId, self.storySceneItemEatId)

					if storyItemData.CompleteQuestId ~= "" then
						self:CompleteQuest(storyItemData.CompleteQuestId)
					end

					tmpItem:Exit()
					self:ClearSceneItem(self.storySceneItemEatId)
				end
			elseif FS_UserData.itemList:GetItemNum(tmpItemId) + tmpItemNum > tmpItemData.NumMax then
				if FS_UserData.itemList:GetItemNum(tmpItemId) == tmpItemData.NumMax then
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
				elseif FS_UserData.itemList:GetItemNum(tmpItemId) < tmpItemData.NumMax then
					tmpItem:EatItem()
					self:AddBagItem(tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))
					self:SetArcadeQuickItemIndex(tmpItemData, tmpItemId, quickIndex)

					local storyItemData = MS_StoryItem.GetItemData(self.storyId, self.storySceneItemEatId)

					if storyItemData.CompleteQuestId ~= "" then
						self:CompleteQuest(storyItemData.CompleteQuestId)
					end

					tmpItem:Exit()
					self:ClearSceneItem(self.storySceneItemEatId)
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
				end
			else
				tmpItem:EatItem()
				self:AddBagItem(tmpItemId, tmpItemNum)
				self:SetArcadeQuickItemIndex(tmpItemData, tmpItemId, quickIndex)

				local storyItemData = MS_StoryItem.GetItemData(self.storyId, self.storySceneItemEatId)

				if storyItemData.CompleteQuestId ~= "" then
					self:CompleteQuest(storyItemData.CompleteQuestId)
				end

				tmpItem:Exit()
				self:ClearSceneItem(self.storySceneItemEatId)
			end

			self.storySceneItemEatId = 0
		elseif self.storyDropItemEatIndex > 0 then
			local tmpItem = FS_UserData.story:GetDropItem(self.storyDropItemEatIndex)

			if tmpItem ~= nil then
				local tmpItemId = tmpItem:GetItemId()
				local tmpItemNum = tmpItem:GetItemNum()
				local tmpItemData = tmpItem:GetItemData()
				local tmpReplaceItemId = tmpItem:GetReplaceItemId()
				local tmpReplaceItemNum = tmpItem:GetReplaceItemNum()
				local tmpReplacteItemData = tmpItem:GetReplaceItemData()

				if tmpReplacteItemData ~= nil and tmpReplaceItemId > 0 and tmpReplaceItemNum > 0 then
					tmpItemId = tmpReplaceItemId
					tmpItemNum = tmpReplaceItemNum
					tmpItemData = tmpReplacteItemData
				end

				local quickIndex = -1

				if (tmpItemData.MainType == MS_ItemData.MainType.Consume or tmpItemData.MainType == MS_ItemData.MainType.Attack) and tmpItemId ~= MS_ItemData.ItemID_HpAdd and tmpItemId ~= MS_ItemData.ItemID_MpAdd and tmpItemId ~= MS_ItemData.ItemID_BulletAdd then
					quickIndex = self:GetQuickListEmptyIndex(tmpItemId)

					if quickIndex == -1 then
						local st = SystemHelper.ConvertReplaceRichText(GameText.UI_ARCADE_BAG_IS_FULL, "{(%a)}", "i", tmpItemData.Name)

						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", st)
						self:ResetItemPos(self.storyDropItemEatIndex)

						self.storyDropItemEatIndex = 0

						return
					end
				end

				local isPickUpItem = true

				if tmpItemId == MS_ItemData.SceneMarkItem then
					self:RecycleSceneMark(tmpItem)
				else
					if tmpItemData.MainType == MS_ItemData.MainType.Trophy then
						if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)
							self:ResetItemPos(self.storyDropItemEatIndex)

							isPickUpItem = false
						end
					elseif FS_UserData.itemList:GetItemNum(tmpItemId) + tmpItemNum > tmpItemData.NumMax then
						if FS_UserData.itemList:GetItemNum(tmpItemId) == tmpItemData.NumMax then
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
							self:ResetItemPos(self.storyDropItemEatIndex)
						elseif FS_UserData.itemList:GetItemNum(tmpItemId) < tmpItemData.NumMax then
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
							tmpItem:EatItem()
							FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemPickUpTimes, tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))
							self:AddBagItem(tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))
							self:SetArcadeQuickItemIndex(tmpItemData, tmpItemId, quickIndex)
							FS_UserData.story:RemoveDropItem(self.storyDropItemEatIndex)
						end

						isPickUpItem = false
					elseif tmpItemId == MS_ItemData.ItemID_BulletAdd then
						local tmpHero = self.sceneController:GetHostPlayerById(10002)

						if tmpHero == nil or tmpHero:IsDead() == true or FS_UserData.story:CheckHeroEnable(10002) == false then
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_ItemCantGet)
							self:ResetItemPos(self.storyDropItemEatIndex)

							isPickUpItem = false
						elseif tmpHero ~= nil and tmpHero:IsBulletMax() == true then
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
							self:ResetItemPos(self.storyDropItemEatIndex)

							isPickUpItem = false
						end
					end

					if isPickUpItem == true then
						tmpItem:EatItem()
						self:AddBagItem(tmpItemId, tmpItemNum)
						self:SetArcadeQuickItemIndex(tmpItemData, tmpItemId, quickIndex)
						FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemPickUpTimes, tmpItemId, tmpItemNum)
						FS_UserData.story:RemoveDropItem(self.storyDropItemEatIndex)
					end
				end
			end

			self.storyDropItemEatIndex = 0
		end
	elseif self.storySceneItemEatId > 0 and self.storySceneItemList[self.storySceneItemEatId] ~= nil then
		local tmpItem = self.storySceneItemList[self.storySceneItemEatId]
		local tmpItemId = tmpItem:GetItemId()
		local tmpItemNum = tmpItem:GetItemNum()
		local tmpItemData = tmpItem:GetItemData()
		local tmpReplaceItemId = tmpItem:GetReplaceItemId()
		local tmpReplaceItemNum = tmpItem:GetReplaceItemNum()
		local tmpReplacteItemData = tmpItem:GetReplaceItemData()

		if tmpReplacteItemData ~= nil and tmpReplaceItemId > 0 and tmpReplaceItemNum > 0 then
			tmpItemId = tmpReplaceItemId
			tmpItemNum = tmpReplaceItemNum
			tmpItemData = tmpReplacteItemData
		end

		if tmpItemData.MainType == MS_ItemData.MainType.Trophy then
			if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)
			else
				tmpItem:EatItem()
				self:AddBagItem(tmpItemId, tmpItemNum)

				local storyItemData = MS_StoryItem.GetItemData(self.storyId, self.storySceneItemEatId)

				if storyItemData.CompleteQuestId ~= "" then
					self:CompleteQuest(storyItemData.CompleteQuestId)
				end

				tmpItem:Exit()
				self:ClearSceneItem(self.storySceneItemEatId)
			end
		elseif FS_UserData.itemList:GetItemNum(tmpItemId) + tmpItemNum > tmpItemData.NumMax then
			if FS_UserData.itemList:GetItemNum(tmpItemId) == tmpItemData.NumMax then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
			elseif FS_UserData.itemList:GetItemNum(tmpItemId) < tmpItemData.NumMax then
				tmpItem:EatItem()
				self:AddBagItem(tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))

				local storyItemData = MS_StoryItem.GetItemData(self.storyId, self.storySceneItemEatId)

				if storyItemData.CompleteQuestId ~= "" then
					self:CompleteQuest(storyItemData.CompleteQuestId)
				end

				tmpItem:Exit()
				self:ClearSceneItem(self.storySceneItemEatId)
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
			end
		else
			tmpItem:EatItem()
			self:AddBagItem(tmpItemId, tmpItemNum)

			local storyItemData = MS_StoryItem.GetItemData(self.storyId, self.storySceneItemEatId)

			if storyItemData.CompleteQuestId ~= "" then
				self:CompleteQuest(storyItemData.CompleteQuestId)
			end

			tmpItem:Exit()
			self:ClearSceneItem(self.storySceneItemEatId)
		end

		self.storySceneItemEatId = 0
	elseif self.storyDropItemEatIndex > 0 then
		local tmpItem = FS_UserData.story:GetDropItem(self.storyDropItemEatIndex)

		if tmpItem ~= nil then
			local tmpItemId = tmpItem:GetItemId()
			local tmpItemNum = tmpItem:GetItemNum()
			local tmpItemData = tmpItem:GetItemData()
			local tmpReplaceItemId = tmpItem:GetReplaceItemId()
			local tmpReplaceItemNum = tmpItem:GetReplaceItemNum()
			local tmpReplacteItemData = tmpItem:GetReplaceItemData()

			if tmpReplacteItemData ~= nil and tmpReplaceItemId > 0 and tmpReplaceItemNum > 0 then
				tmpItemId = tmpReplaceItemId
				tmpItemNum = tmpReplaceItemNum
				tmpItemData = tmpReplacteItemData
			end

			local isPickUpItem = true

			if tmpItemId == MS_ItemData.SceneMarkItem then
				self:RecycleSceneMark(tmpItem)
			else
				if tmpItemData.MainType == MS_ItemData.MainType.Trophy then
					if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)
						self:ResetItemPos(self.storyDropItemEatIndex)

						isPickUpItem = false
					end
				elseif FS_UserData.itemList:GetItemNum(tmpItemId) + tmpItemNum > tmpItemData.NumMax then
					if FS_UserData.itemList:GetItemNum(tmpItemId) == tmpItemData.NumMax then
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
						self:ResetItemPos(self.storyDropItemEatIndex)
					elseif FS_UserData.itemList:GetItemNum(tmpItemId) < tmpItemData.NumMax then
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
						tmpItem:EatItem()
						FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemPickUpTimes, tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))
						self:AddBagItem(tmpItemId, tmpItemData.NumMax - FS_UserData.itemList:GetItemNum(tmpItemId))
						FS_UserData.story:RemoveDropItem(self.storyDropItemEatIndex)
					end

					isPickUpItem = false
				elseif tmpItemId == MS_ItemData.ItemID_BulletAdd then
					local tmpHero = self.sceneController:GetHostPlayerById(10002)

					if tmpHero == nil or tmpHero:IsDead() == true or FS_UserData.story:CheckHeroEnable(10002) == false then
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_ItemCantGet)
						self:ResetItemPos(self.storyDropItemEatIndex)

						isPickUpItem = false
					elseif tmpHero ~= nil and tmpHero:IsBulletMax() == true then
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", tmpItemData.Name .. GameText.Story_BagIsFull)
						self:ResetItemPos(self.storyDropItemEatIndex)

						isPickUpItem = false
					end
				end

				if isPickUpItem == true then
					tmpItem:EatItem()
					self:AddBagItem(tmpItemId, tmpItemNum)
					FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemPickUpTimes, tmpItemId, tmpItemNum)
					FS_UserData.story:RemoveDropItem(self.storyDropItemEatIndex)
				end
			end
		end

		self.storyDropItemEatIndex = 0
	end
end

function ControllerStoryMode:ResetItemPos(itemIndex)
	local tmpItem = FS_UserData.story:GetDropItem(itemIndex)

	if tmpItem ~= nil then
		local itemPos = self.hostPlayer:GetPosByWorldPos()

		itemPos = itemPos:Clone()

		local rndNum = MathHelper.getRandom(-10, 10, 1) * 0.1

		itemPos.x = itemPos.x + rndNum
		itemPos.z = itemPos.z + rndNum

		tmpItem:SetPosition(itemPos)

		itemPos = nil
	end
end

function ControllerStoryMode:ClearSceneItem(storyItemId)
	if self.storySceneItemList ~= nil and self.storySceneItemList[storyItemId] ~= nil then
		local elevatorId = self.storySceneItemList[storyItemId]:GetElevatorId()

		if self.scene ~= nil and elevatorId > 0 then
			local elevator = self.scene:GetElevator(elevatorId)

			if elevator ~= nil then
				elevator:SetItemScene(nil)
			end
		end

		self.storySceneItemList[storyItemId]:Exit()

		self.storySceneItemList[storyItemId] = nil
	end
end

function ControllerStoryMode:CheckCreateSceneItem()
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		return
	end

	if self.storySceneItemAllList ~= nil then
		for id, tmpItem in pairs(self.storySceneItemAllList) do
			local storyItemId = tonumber(tmpItem.StoryItemId)

			if self.storySceneItemList[storyItemId] == nil then
				if self:CheckShowQuestComplete(tmpItem.ShowQuestId) == true and self:CheckHideQuestComplete(tmpItem.HideQuestId) == false then
					self:CreateSceneItem(storyItemId)
				end
			elseif self:CheckHideQuestComplete(tmpItem.HideQuestId) == true then
				self:ClearSceneItem(id)
			end
		end
	end
end

function ControllerStoryMode:InitItem()
	self:CheckCreateSceneItem()
	FS_UserData.story:ShowDropItemAll()
end

function ControllerStoryMode:CreateSceneItem(storyItemId)
	if self.storySceneItemList[storyItemId] ~= nil then
		return
	end

	local storyItemData = MS_StoryItem.GetItemData(self.storyId, storyItemId)

	if storyItemData.ItemId == 0 then
		return
	end

	if storyItemData ~= nil then
		local itemType = tonumber(storyItemData.Type)
		local posIndex = tonumber(storyItemData.Position)

		if storyItemData.ElevatorId > 0 then
			local elevator = self.scene:GetElevator(storyItemData.ElevatorId)

			if elevator ~= nil then
				local ItemTemplate = require("LuaScript/Logic/Item/ItemScene")
				local tmpItem = ItemTemplate:new(ItemScene.Type.Scene, storyItemId, 1, Vector3.s_zero, true)

				self.storySceneItemList[storyItemId] = tmpItem

				elevator:SetItemScene(tmpItem)
			end
		elseif posIndex > 0 then
			local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Item, posIndex)

			if locatorData ~= nil then
				local ItemTemplate = require("LuaScript/Logic/Item/ItemScene")
				local tmpPos = self.storySceneItemPos[storyItemId] or locatorData.Position
				local tmpItem = ItemTemplate:new(ItemScene.Type.Scene, storyItemId, 1, tmpPos, true)

				self.storySceneItemList[storyItemId] = tmpItem
			end
		end
	end
end

function ControllerStoryMode:RefreshSceneItem()
	self:CheckCreateSceneItem()
end

function ControllerStoryMode:CreateDropItem(itemIdDropId, id, index)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		return
	end

	if itemIdDropId ~= nil and itemIdDropId > 0 then
		local tmpMonster = self.monsterDeadList[id]

		if tmpMonster ~= nil then
			local rndParam = tmpMonster:GetAnimalId() + index
			local itemId, itemNum = self:GetStoryDropItem(self.storyId, itemIdDropId, rndParam)

			if itemId > 0 and itemNum > 0 then
				local itemPos = tmpMonster:GetFootprintPos():Clone()
				local disY = Mathf.Abs(tmpMonster:GetDeadPosition().y - itemPos.y)

				if disY < GameAI.EnableHeight then
					itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
					itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
				end

				FS_UserData.story:AddDropItem(itemId, itemNum, itemPos)
			end
		end
	end
end

function ControllerStoryMode:CreateMazeDropItem(itemIdDropId, id, index, pos)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		return
	end

	if itemIdDropId ~= nil and itemIdDropId > 0 then
		local tmpMonster = self.monsterDeadList[id]

		if tmpMonster ~= nil then
			local rndParam = tmpMonster:GetAnimalId() + index
			local itemId, itemNum = self:GetMazeDropItem(FS_UserData.story:GetMazeLevel(), itemIdDropId, rndParam)

			if itemId > 0 and itemNum > 0 then
				local itemPos

				if pos == nil then
					itemPos = tmpMonster:GetFootprintPos():Clone()

					local disY = Mathf.Abs(tmpMonster:GetDeadPosition().y - itemPos.y)

					if disY < GameAI.EnableHeight then
						itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
						itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
					end
				else
					itemPos = pos:Clone()
					itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
					itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
				end

				FS_UserData.story:AddDropItem(itemId, itemNum, itemPos)
			end
		end
	end
end

function ControllerStoryMode:CreateMazeCrateItem(itemIdDropId, crateId)
	if itemIdDropId ~= nil and itemIdDropId > 0 then
		local crate = self.scene:GetCrate(crateId)

		if crate ~= nil then
			local itemId, itemNum = self:GetMazeDropItem(FS_UserData.story:GetMazeLevel(), itemIdDropId, 0)

			if itemId > 0 and itemNum > 0 then
				local itemPos = crate:GetPosition()

				FS_UserData.story:AddDropItem(itemId, itemNum, itemPos)
			end
		end
	end
end

function ControllerStoryMode:CreateSanDropItem(itemIdDropId, id, index)
	if itemIdDropId ~= nil and itemIdDropId > 0 then
		local heroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())
		local tmpMonster = self.monsterDeadList[id]

		if tmpMonster ~= nil then
			local rndParam = tmpMonster:GetAnimalId() + index
			local itemPos = tmpMonster:GetFootprintPos():Clone()
			local itemId, itemNum = self:GetStoryDropItem(self.storyId, itemIdDropId, rndParam)

			if itemId > 0 and itemNum > 0 then
				local ItemTemplate = require("LuaScript/Logic/Item/ItemScene")
				local tmpItem = ItemTemplate:new(ItemScene.Type.Drop, itemId, itemNum, itemPos, true)

				if tmpItem:IsEquipAutoGetItemTrophy() then
					local item, itemNum = self:AutoGetItem(tmpItem, true)

					if itemNum > 0 then
						local ItemTemplate = require("LuaScript/Logic/Item/ItemSceneAttach")
						local itemAttach = ItemTemplate:new(tmpItem, self.hostPlayer, item, itemNum, function(itemAtt)
							self:AttachItemCallback(itemAtt)
						end)

						table.insert(self.storySceneAttachItemList, itemAttach)
					end

					self:AutoGetItemRemove(tmpItem)
				else
					self:AutoGetItem(tmpItem)
					self:AutoGetItemRemove(tmpItem)
				end
			end
		end
	end
end

function ControllerStoryMode:SetStoryDropItem(storyDropId, id, index)
	if storyDropId ~= nil and storyDropId > 0 then
		local tmpMonster = self.monsterDeadList[id]

		if tmpMonster ~= nil then
			local rndParam = tmpMonster:GetAnimalId() + index
			local itemPos = tmpMonster:GetFootprintPos():Clone()
			local disY = Mathf.Abs(tmpMonster:GetDeadPosition().y - itemPos.y)

			if disY < GameAI.EnableHeight then
				itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
				itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
			end

			local item = self.storySceneItemList[storyDropId]

			if item ~= nil then
				self.storySceneItemPos[storyDropId] = itemPos

				item:SetPosition(itemPos)
			end
		end
	end
end

function ControllerStoryMode:CreateDropBullet(animalId, id)
	local add = Hero10002_Define.BulletColorAddRateBase
	local colorBulletAdd = self.sceneController:GetTalentValue(animalId, MS_HeroTalent.Type.ColorBulletAdd, 0, 0)

	if colorBulletAdd > 0 then
		add = add + colorBulletAdd
	end

	local rate = add * 100
	local ret = MathHelper.getRandomResult(rate, animalId)

	if ret == true then
		local tmpMonster = self.monsterDeadList[id]

		if tmpMonster ~= nil then
			local rndParam = tmpMonster:GetAnimalId()
			local itemPos = tmpMonster:GetFootprintPos():Clone()
			local disY = Mathf.Abs(tmpMonster:GetDeadPosition().y - itemPos.y)

			if disY < GameAI.EnableHeight then
				itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
				itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
			end

			FS_UserData.story:AddDropItem(MS_ItemData.ItemID_BulletAdd, add, itemPos)
		end
	end
end

function ControllerStoryMode:CreateNightmareDropItem(dropId, animal)
	if dropId ~= nil and dropId > 0 and animal ~= nil then
		local itemPos = animal:GetFootprintPos():Clone()

		if self.storyId ~= MS_StoryData.StoryId10011 then
			local rndParam = animal:GetAnimalId()
			local itemId, itemNum = self:GetStoryDropItem(self.storyId, dropId, rndParam)

			if itemId > 0 and itemNum > 0 then
				local disY = Mathf.Abs(animal:GetDeadPosition().y - itemPos.y)

				if disY < GameAI.EnableHeight then
					itemPos.x = itemPos.x + MathHelper.getRandom(-5, 5, rndParam + 1) * 0.1
					itemPos.z = itemPos.z + MathHelper.getRandom(-5, 5, rndParam + 2) * 0.1
				end

				FS_UserData.story:AddDropItem(itemId, itemNum, itemPos)
			end
		end

		if self.hpAddItemUseNumForAI > 0 then
			FS_UserData.story:AddDropItem(MS_ItemData.ItemID_HpAdd, self.hpAddItemUseNumForAI, itemPos)
		end
	end
end

function ControllerStoryMode:CreateHostPlayerDropItem(dropId, replaceItemId, replaceItemNum, pos)
	if dropId ~= nil and dropId > 0 then
		local itemId, itemNum = self:GetStoryDropItem(self.storyId, dropId, 0)

		if itemId > 0 and itemNum > 0 and replaceItemId > 0 and replaceItemNum > 0 then
			FS_UserData.story:RemoveDropItemByReplaceId(replaceItemId)

			local retItem = FS_UserData.story:AddDropItem(itemId, itemNum, pos)

			if retItem ~= nil then
				retItem:SetReplaceItem(replaceItemId, replaceItemNum)
			end
		end
	end
end

function ControllerStoryMode:GetHpAddItemUseNumForAI()
	return self.hpAddItemUseNumForAI
end

function ControllerStoryMode:AddHpAddItemUseNumForAI(num)
	self.hpAddItemUseNumForAI = self.hpAddItemUseNumForAI + num
end

function ControllerStoryMode:GetStoryDropItem(storyId, dropId, rndParam)
	local probAll = 0
	local itemDropList = {}
	local probList = {}
	local heroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())
	local itemDropData = MS_StoryItemDrop.GetStoryItemDropData(storyId, dropId)

	if itemDropData ~= nil then
		for i, dropData in pairs(itemDropData) do
			local tmpProb = 0

			if dropData.ItemId > 0 then
				local itemData = MS_ItemData.GetItemData(dropData.ItemId)

				if itemData ~= nil and (heroData:IsHpNumMax() == false or itemData.Type ~= MS_ItemData.Type.HpRecovery) and (heroData:IsMpNumMax() == false or itemData.Type ~= MS_ItemData.Type.MpRecovery) then
					tmpProb = dropData.Prob

					local itemDropProbAdd = self.sceneController:GetTalentValue(self.hostPlayer:GetAnimalId(), MS_HeroTalent.Type.ItemProbAdd, itemData.Type, 0)

					if itemDropProbAdd > 0 then
						local tmpKey = "ProbAdd" .. itemDropProbAdd

						if dropData[tmpKey] ~= nil then
							tmpProb = tmpProb + dropData[tmpKey]
						end
					end

					table.insert(itemDropList, dropData)
					table.insert(probList, tmpProb)
				end
			else
				tmpProb = dropData.Prob
			end

			probAll = probAll + tmpProb
		end
	end

	if probAll > 0 and #itemDropList > 0 then
		local rndNum = MathHelper.getRandom(1, probAll, rndParam)
		local prob = 0

		for i = 1, #itemDropList do
			local dropData = itemDropList[i]

			prob = prob + probList[i]

			if dropData ~= nil and probList[i] > 0 and rndNum <= prob then
				local itemId = dropData.ItemId
				local itemNum = MathHelper.getRandom(tonumber(dropData.Num1), tonumber(dropData.Num2), rndParam)

				SystemHelper.LogTest("===============ItemId=" .. itemId .. ",itemNum=" .. itemNum .. ",rndNum=" .. rndNum .. ",probAll=" .. probAll)

				return itemId, itemNum
			end
		end
	end

	probList = nil
	itemDropList = nil

	return 0, 0
end

function ControllerStoryMode:GetMazeDropItem(mazeLevel, dropId, rndParam)
	local probAll = 0
	local itemDropList = {}
	local probList = {}
	local heroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())
	local itemDropData = MS_StoryMazeDrop.GetMazeDropData(mazeLevel, dropId)

	if itemDropData ~= nil then
		for i, dropData in pairs(itemDropData) do
			local tmpProb = 0

			if dropData.ItemId > 0 then
				local itemData = MS_ItemData.GetItemData(dropData.ItemId)

				if itemData ~= nil and (heroData:IsHpNumMax() == false or itemData.Type ~= MS_ItemData.Type.HpRecovery) and (heroData:IsMpNumMax() == false or itemData.Type ~= MS_ItemData.Type.MpRecovery) then
					tmpProb = dropData.Prob

					local itemDropProbAdd = self.sceneController:GetTalentValue(self.hostPlayer:GetAnimalId(), MS_HeroTalent.Type.ItemProbAdd, itemData.Type, 0)

					if itemDropProbAdd > 0 then
						local tmpKey = "ProbAdd" .. itemDropProbAdd

						if dropData[tmpKey] ~= nil then
							tmpProb = tmpProb + dropData[tmpKey]
						end
					end

					table.insert(itemDropList, dropData)
					table.insert(probList, tmpProb)
				end
			else
				tmpProb = dropData.Prob
			end

			probAll = probAll + tmpProb
		end
	end

	if probAll > 0 and #itemDropList > 0 then
		local rndNum = MathHelper.getRandom(1, probAll, rndParam)
		local prob = 0

		for i = 1, #itemDropList do
			local dropData = itemDropList[i]

			prob = prob + probList[i]

			if dropData ~= nil and probList[i] > 0 and rndNum <= prob then
				local itemId = dropData.ItemId
				local itemNum = MathHelper.getRandom(tonumber(dropData.Num1), tonumber(dropData.Num2), rndParam)

				return itemId, itemNum
			end
		end
	end

	probList = nil
	itemDropList = nil

	return 0, 0
end

function ControllerStoryMode:ResetAllAttributePoints()
	FS_UserData.heroList:RestAllHeroAttribute()
	self.sceneController:HeroAttribUpdate(false)
end

function ControllerStoryMode:SubTrophyItem(trophy)
	local ret = FS_UserData.itemList:SubTrophyItem(trophy)

	if ret then
		self:UpdateUIBag()
	end
end

function ControllerStoryMode:AddBagItem(itemId, itemNum, ignoreUI, level, subProperty)
	local itemData = MS_ItemData.GetItemData(itemId)

	if itemData == nil then
		SystemHelper.LogError("error!!Cannot find item " .. itemId)

		return nil
	end

	local retItemData
	local retName = ""
	local retNum = 0

	if itemData.MainType == MS_ItemData.MainType.Trophy then
		if itemData.UniqueId > 0 then
			local ret = FS_UserData.itemList:CheckExistTrophy(itemData.UniqueId)
			local ret2 = FS_UserData.trophy:CheckExistTrophy(itemData.UniqueId)

			if ret or ret2 then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", itemData.Name .. GameText.Story_BagIsFull)
			else
				retItemData = FS_UserData.itemList:CreateTrophyItem(itemId, level, subProperty, true)

				if retItemData ~= nil then
					if itemId == MS_Achievement.SpecialTrophyId then
						self:RecordAchievement(MS_Achievement.AchievementIdType.GetSpecialTrophy, 1)
					elseif itemId == MS_Achievement.UndeadBottleId then
						self:RecordAchievement(MS_Achievement.AchievementIdType.GetUndeadBottle, 1)
					end

					retNum = 1
				end
			end
		else
			retItemData = FS_UserData.itemList:CreateTrophyItem(itemId, level, subProperty, true)

			if retItemData ~= nil then
				if itemId == MS_Achievement.SpecialTrophyId then
					self:RecordAchievement(MS_Achievement.AchievementIdType.GetSpecialTrophy, 1)
				elseif itemId == MS_Achievement.UndeadBottleId then
					self:RecordAchievement(MS_Achievement.AchievementIdType.GetUndeadBottle, 1)
				end

				retNum = 1
			end
		end
	elseif itemId == MS_ItemData.ItemID_HpAdd then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			retNum = tmpHeroData:AddHpNum(itemNum)
		end
	elseif itemId == MS_ItemData.ItemID_MpAdd then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			retNum = tmpHeroData:AddMpNum(itemNum)
		end
	elseif itemId == MS_ItemData.ItemID_BulletAdd then
		local tmpHero = self.sceneController:GetHostPlayerById(10002)

		if tmpHero ~= nil and tmpHero:IsDead() == false and FS_UserData.story:CheckHeroEnable(10002) == true then
			retNum = tmpHero:PickUpBullet(itemNum)
		end
	elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and itemData.Type == MS_ItemData.Type.SubTime then
		if self.hostPlayer:GetHeroId() ~= 10007 or FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) or FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId()):IsTalentStoneEnough(itemId - 50000) then
			FS_UserData.story:SubGameTime(FS_UserData.story:GetStoryId(), self.hostPlayer:GetHeroId(), itemData.Param1 * itemNum)
			AudioCtrl.SetUIAudio("pickup")
			UIManager.SendMessage("Mainmenu", "ShowRecordUpdateTime", itemData.Param1 * itemNum)
		end
	elseif FS_UserData.itemList:GetItemNum(itemId) + itemNum > itemData.NumMax then
		local addNum = itemData.NumMax - FS_UserData.itemList:GetItemNum(itemId)

		retItemData = FS_UserData.itemList:AddBagItem(itemId, addNum, not self:CheckShowQuestComplete(itemData.CompleteQuestId))

		if retItemData ~= nil then
			retNum = addNum
		end

		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", retItemData:GetItemName() .. GameText.Story_BagIsFull)
	else
		retItemData = FS_UserData.itemList:AddBagItem(itemId, itemNum, not self:CheckShowQuestComplete(itemData.CompleteQuestId))

		if retItemData ~= nil then
			retNum = itemNum
		end
	end

	if retNum > 0 then
		if itemData.CompleteQuestId ~= nil and itemData.CompleteQuestId ~= "" then
			self:CompleteQuest(itemData.CompleteQuestId)
		end

		if itemId == MS_ItemData.UnnormalElement then
			self:RecordAchievement(MS_Achievement.AchievementIdType.GetUnnormalElement, retNum)
		end

		if ignoreUI then
			if itemData.Type == MS_ItemData.Type.Document then
				local questList = StringHelper.Split(itemData.CompleteQuestId, ";")
				local goalId = MS_UIQuest.GetGoalByShowQuest(questList[1])

				if goalId then
					FS_UserData.story:AddDocumentToOrderList(goalId)
				end
			end
		elseif itemData.Type == MS_ItemData.Type.Formula then
			UIManager.SendMessage("Mainmenu", "GetItem", GameText.UI_COMMON_LEARN_FORMULA .. string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)), 0, itemData.Icon)
		elseif itemData.Type == MS_ItemData.Type.Document then
			UIManager.SendMessage("Mainmenu", "AddTempGuide", MS_StoryTutorial.GetDocumentId, itemId)

			local questList = StringHelper.Split(itemData.CompleteQuestId, ";")
			local goalId = MS_UIQuest.GetGoalByShowQuest(questList[1])

			if goalId then
				FS_UserData.story:AddDocumentToOrderList(goalId)
			end
		elseif itemData.Type == MS_ItemData.Type.TrophyScars then
			UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. retNum, 0, MS_ItemData.TrophyItemTypeIconList[1])
		elseif itemData.Type == MS_ItemData.Type.TrophyResistance then
			UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. retNum, 0, MS_ItemData.TrophyItemTypeIconList[2])
		elseif itemData.Type == MS_ItemData.Type.TrophyNightmare then
			UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. retNum, 0, MS_ItemData.TrophyItemTypeIconList[3])
		else
			UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. retNum, 0, itemData.Icon)
		end

		self:UpdateUIBag()

		if DebugBehaviorLog == true then
			LS_BehaviorLog.Log(LS_BehaviorLog.Type.GetItem, itemId, retNum)
		end
	end

	return retItemData, retNum
end

function ControllerStoryMode:AddBagItemUI(itemId, itemNum)
	local itemData = MS_ItemData.GetItemData(itemId)

	if itemData.Type == MS_ItemData.Type.Formula then
		UIManager.SendMessage("Mainmenu", "GetItem", GameText.UI_COMMON_LEARN_FORMULA .. string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)), 0, itemData.Icon)
	elseif itemData.Type == MS_ItemData.Type.TrophyScars then
		UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. itemNum, 0, MS_ItemData.TrophyItemTypeIconList[1])
	elseif itemData.Type == MS_ItemData.Type.TrophyResistance then
		UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. itemNum, 0, MS_ItemData.TrophyItemTypeIconList[2])
	elseif itemData.Type == MS_ItemData.Type.TrophyNightmare then
		UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. itemNum, 0, MS_ItemData.TrophyItemTypeIconList[3])
	else
		UIManager.SendMessage("Mainmenu", "GetItem", string.gsub(GameText.UI_COMMON_GOT_REWARD, "{0}", MS_ItemData.GetItemName(itemId)) .. " x " .. itemNum, 0, itemData.Icon)
	end
end

function ControllerStoryMode:DeleteTrophy(itemId)
	local trophy = FS_UserData.itemList:GetUniqueTrophy(itemId)

	if trophy then
		FS_UserData.itemList:SubTrophyItem(trophy)
	else
		local pos = FS_UserData.trophy:GetUniqueTrophyPos(itemId)

		if pos then
			FS_UserData.trophy:Remove(pos, true)
		end
	end

	self.sceneController:HeroAttribUpdate(false)
end

function ControllerStoryMode:UseBagItem(itemId, itemNum)
	if itemId == MS_ItemData.ItemID_HpAdd then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			local retNum = tmpHeroData:SubHpNum(itemNum)

			self:UpdateUIBag()

			return retNum
		end
	elseif itemId == MS_ItemData.ItemID_MpAdd then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			local retNum = tmpHeroData:SubMpNum(itemNum)

			self:UpdateUIBag()

			return retNum
		end
	else
		local use = FS_UserData.itemList:UseBagItem(itemId, itemNum)
		local itemData = MS_ItemData.GetItemData(itemId)

		if itemData.RevertQuestId ~= "" then
			self:RevertCompleteQuest(itemData.RevertQuestId)
		end

		if use > 0 then
			self:UpdateUIBag()

			if DebugBehaviorLog == true then
				local param2 = ""

				if itemId == MS_ItemData.ItemID_HpAdd then
					param2 = self.hostPlayer:GetValue():GetProperty(MS_HeroData.Property.Hp)
				end

				LS_BehaviorLog.Log(LS_BehaviorLog.Type.UseItem, itemId, param2)
			end

			return use
		end
	end

	return 0
end

function ControllerStoryMode:GetBagItemNum(itemId)
	if itemId == MS_ItemData.ItemID_HpAdd then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			return tmpHeroData:GetHpNum()
		end
	elseif itemId == MS_ItemData.ItemID_MpAdd then
		local tmpHeroData = FS_UserData.heroList:GetHero(self.hostPlayer:GetHeroId())

		if tmpHeroData ~= nil then
			return tmpHeroData:GetMpNum()
		end
	else
		return FS_UserData.itemList:GetItemNum(itemId)
	end

	return 0
end

function ControllerStoryMode:SetQuickList(index, itemId)
	local heroId = self.hostPlayer:GetHeroId()

	if self.quickMenuList[heroId][index] ~= nil and self.quickMenuList[heroId][index].lock == false then
		for i = 1, #self.quickMenuList[heroId] do
			local qData = self.quickMenuList[heroId][i]

			if qData.itemId == itemId then
				qData.itemId = 0
			end
		end

		self.quickMenuList[heroId][index].itemId = itemId

		local count = 0
		local quickIndex

		for i = 1, #self.quickMenuList[heroId] do
			local qData = self.quickMenuList[heroId][i]

			if qData.itemId ~= 0 then
				count = count + 1
				quickIndex = i
			end
		end

		if count == 1 then
			self:SetQuickMenu(quickIndex)
		end

		FS_UserData.heroList:GetHero(heroId):SetShortcut(index, itemId)
		self:UpdateUIQuickMenu()
	end
end

function ControllerStoryMode:SetQuickMenu(index)
	local heroId = self.hostPlayer:GetHeroId()

	if self.quickMenuList[heroId][index] ~= nil and self.quickMenuList[heroId][index].lock == false then
		for i = 1, #self.quickMenuList[heroId] do
			local qData = self.quickMenuList[heroId][i]

			qData.default = false
		end

		self.quickMenuList[heroId][index].default = true

		FS_UserData.heroList:GetHero(heroId):SetMainShortcutIndex(index)
		self:UpdateUIQuickMenu()
	end
end

function ControllerStoryMode:GetQuickListEmptyIndex(newItemId)
	local heroId = self.hostPlayer:GetHeroId()

	for index, v in pairs(self.quickMenuList[heroId]) do
		if index ~= 7 and v.lock == false and v.itemId == newItemId then
			return index
		end
	end

	for index, v in pairs(self.quickMenuList[heroId]) do
		if index ~= 7 and v.lock == false and FS_UserData.itemList:GetItemNum(v.itemId) < 1 then
			return index
		end
	end

	return -1
end

function ControllerStoryMode:SetArcadeQuickItemIndex(tmpItemData, tmpItemId, quickIndex)
	if (tmpItemData.MainType == MS_ItemData.MainType.Consume or tmpItemData.MainType == MS_ItemData.MainType.Attack) and tmpItemId ~= MS_ItemData.ItemID_HpAdd and tmpItemId ~= MS_ItemData.ItemID_MpAdd and tmpItemId ~= MS_ItemData.ItemID_BulletAdd then
		self:SetQuickList(quickIndex, tmpItemId)
		self:SetQuickMenu(quickIndex)
	end
end

function ControllerStoryMode:GetQuickMenuItemId()
	local heroId = self.hostPlayer:GetHeroId()

	for i = 1, #self.quickMenuList[heroId] do
		local qData = self.quickMenuList[heroId][i]

		if qData.default == true then
			return qData.itemId
		end
	end

	return 0
end

function ControllerStoryMode:CheckDialogShow(dialogData)
	if dialogData ~= nil then
		local permit = true
		local showHeroId = dialogData.ShowHeroId

		if showHeroId > 0 then
			local tmpHost, tmpHostIndex = self.sceneController:GetHostPlayerById(showHeroId)

			if tmpHost == nil then
				permit = false
			end
		end

		if IapData.GetEnterTide() then
			if dialogData.DLCShow == MS_StoryDialog.DLCShowType.NoDLCShow then
				permit = false
			end
		elseif dialogData.DLCShow == MS_StoryDialog.DLCShowType.HaveDLCShow then
			permit = false
		end

		if not self:CheckTrophyPermit(dialogData.TrophyShow) then
			permit = false
		end

		if permit == true then
			if DebugLogVoiceId and DebugCtrl.curId and DebugCtrl.curId == dialogData.DialogId then
				return true
			end

			if self:CheckShowQuestComplete(dialogData.ShowQuestId) == true and self:CheckHideQuestComplete(dialogData.HideQuestId) == false then
				return true
			end
		end
	end

	return false
end

function ControllerStoryMode:CheckTrophyPermit(trophyIdSt)
	trophyIdSt = tostring(trophyIdSt)

	if trophyIdSt == "" then
		return true
	end

	local trophyIdList = StringHelper.Split(trophyIdSt, ";")

	for i, tId in pairs(trophyIdList) do
		if FS_UserData.trophy:IsTrophyEquip(tonumber(tId)) == true then
			return true
		end
	end

	return false
end

function ControllerStoryMode:CheckSceneDialog(isStart)
	if self:IsStatus(ControllerStoryMode.Status.Normal) == false then
		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Dialog, false)

		return
	end

	if self.dialogIdNext > 0 then
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:GetStoryId() == 8 and not table.contains(DialogCtrl.ArcadeShowDialogId, self.dialogIdNext) then
			-- block empty
		else
			self.dialogIdNow = self.dialogIdNext

			self:SwitchToDialog()
		end

		self.dialogIdNext = 0

		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Dialog, false)

		return
	end

	if isStart == false and self.hostPlayer:IsMovieAndDialogueEnable() == false then
		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Dialog, false)

		return
	end

	local showFlg = false
	local hostPos = self.hostPlayer:GetPosByWorldPos()

	if showFlg == false and self.hostPlayer:IsEventEnable() == true then
		for id, tmpMonsterData in pairs(self.monsterList) do
			local tmpMonster = tmpMonsterData.monster

			if tmpMonster:IsDead() == false and tmpMonster:IsShow() == true then
				local tmpIdStr, tmpDialogDis = tmpMonster:GetHeroExtDialogInfo()

				if tmpIdStr ~= "" and tmpDialogDis > 0 then
					local tmpDis = GameAI.GetAnimalDistance(self.hostPlayer, tmpMonster, false)

					if showFlg == false and tmpDis <= tmpDialogDis then
						local tmpIdList = StringHelper.Split(tmpIdStr, ";")
						local tmpDialogList

						for p = 1, #tmpIdList do
							local tmpDialogId = tonumber(tmpIdList[p])
							local tmpDialogData = self:GetDialogData(tmpDialogId)

							if tmpDialogData ~= nil and self:CheckDialogShow(tmpDialogData) == true then
								if tmpDialogList == nil then
									tmpDialogList = {}
								end

								table.insert(tmpDialogList, tmpDialogId)
							end
						end

						if tmpDialogList ~= nil and #tmpDialogList > 0 then
							local rndIndex = MathHelper.getRandom(1, #tmpDialogList)

							self.dialogIdNow = tonumber(tmpDialogList[rndIndex])
							showFlg = true

							local tmpDialogData = self:GetDialogData(self.dialogIdNow)

							self.dialogInteractType = tmpDialogData.InteractType
						end
					end

					if tmpDis <= SceneDefine.IconDistanceForDialog then
						local tmpIdList = StringHelper.Split(tmpIdStr, ";")
						local tmpDialogList

						for p = 1, #tmpIdList do
							local tmpDialogId = tonumber(tmpIdList[p])
							local tmpDialogData = self:GetDialogData(tmpDialogId)

							if tmpDialogData ~= nil and self:CheckDialogShow(tmpDialogData) == true then
								local nowPos = tmpMonster:GetPosByWorldPos()
								local heroId = tmpMonster:GetHeroId()
								local heroData = MS_HeroData.GetHero(heroId)

								self:ShowIcon(MS_SceneData.LocatorType.Dialog, tmpDialogId, 0, nowPos.x, nowPos.y + heroData.DialogHeight, nowPos.z)

								break
							end
						end
					end
				end
			end
		end
	end

	if self.dialogSceneList ~= nil and DebugSkipMovie == false and self.hostPlayer:IsInChangeOrTransferState() == false then
		if showFlg == false then
			local tmpMonologueList, tmpNpclogueList, tmpDialogList

			for id, tmpDialogData in pairs(self.dialogSceneList) do
				if self:CheckDialogShow(tmpDialogData) == true then
					local posIndex = tonumber(tmpDialogData.Position)

					if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) and posIndex >= 100 then
						-- block empty
					elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.sceneController:GetHostPlayerHeroId() ~= MS_HeroData.ArcadeHeroId and posIndex >= 100 then
						-- block empty
					elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:GetStoryId() == 8 and not table.contains(DialogCtrl.ArcadeShowDialogId, tmpDialogData.DialogId) then
						-- block empty
					elseif tmpDialogData.Type == MS_StoryDialog.Type.HostWhisper or tmpDialogData.Type == MS_StoryDialog.Type.CrowWhisper then
						if posIndex > 0 then
							local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Dialog, posIndex)

							if locatorData ~= nil then
								local dis = Vector3.DistanceSquare(locatorData.Position, hostPos)
								local radius = locatorData.StartRadius

								if dis < radius * radius then
									if tmpMonologueList == nil then
										tmpMonologueList = {}
									end

									table.insert(tmpMonologueList, id)
								end
							end
						end
					elseif tmpDialogData.Type == MS_StoryDialog.Type.NpcWhisper then
						if posIndex > 0 then
							local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Dialog, posIndex)

							if locatorData ~= nil then
								local dis = Vector3.DistanceSquare(locatorData.Position, hostPos)
								local radius = locatorData.StartRadius

								if dis < radius * radius then
									if tmpNpclogueList == nil then
										tmpNpclogueList = {}
									end

									table.insert(tmpNpclogueList, id)
								end
							end
						end
					elseif posIndex > 0 then
						local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Dialog, posIndex)

						if locatorData ~= nil then
							local dis = Vector3.DistanceSquare(locatorData.Position, hostPos)
							local radius = locatorData.StartRadius

							if dis < radius * radius then
								if tmpDialogList == nil then
									tmpDialogList = {}
								end

								table.insert(tmpDialogList, id)
							end

							if dis < SceneDefine.IconDistanceForDialog * SceneDefine.IconDistanceForDialog then
								local tmpPos = locatorData.Position
								local tmpHeight = tmpDialogData.InteractHeight

								if tmpHeight >= 0 then
									self:ShowIcon(MS_SceneData.LocatorType.Dialog, id, 0, tmpPos.x, tmpPos.y + tmpDialogData.InteractHeight, tmpPos.z)
								end
							end
						end
					end
				end
			end

			if showFlg == false then
				if tmpDialogList ~= nil and #tmpDialogList > 0 and self.hostPlayer:IsEventEnable() == true then
					local rndIndex = MathHelper.getRandom(1, #tmpDialogList)
					local tmpDialogId = tonumber(tmpDialogList[rndIndex])
					local tmpDialogData = self.dialogSceneList[tmpDialogId]
					local posIndex = tonumber(tmpDialogData.Position)
					local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Dialog, posIndex)

					if locatorData ~= nil then
						self.dialogIdNow = tmpDialogId
						showFlg = true
						self.dialogInteractType = tmpDialogData.InteractType
					end
				elseif tmpMonologueList ~= nil and #tmpMonologueList > 0 then
					local rndIndex = MathHelper.getRandom(1, #tmpMonologueList)
					local tmpDialogId = tmpMonologueList[rndIndex]

					self.sceneController:OpenDialog(tmpDialogId, nil)
				elseif tmpNpclogueList ~= nil and #tmpNpclogueList > 0 then
					local rndIndex = MathHelper.getRandom(1, #tmpNpclogueList)
					local tmpDialogId = tmpNpclogueList[rndIndex]

					self.sceneController:OpenDialog(tmpDialogId, nil)
				end
			end
		end

		for id, tmpDialogData in pairs(self.dialogSceneList) do
			local posIndex = tonumber(tmpDialogData.Position)
			local revertQuestStr = tmpDialogData.RevertQuestId

			if revertQuestStr ~= "" then
				local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Dialog, posIndex)

				if locatorData ~= nil then
					local dis = Vector3.DistanceSquare(locatorData.Position, hostPos)
					local radius = locatorData.RevertRadius

					if dis > radius * radius then
						if self.dialogRevertList ~= nil and self.dialogRevertList[id] ~= nil then
							self:RevertCompleteQuest(revertQuestStr)
						end
					else
						if self.dialogRevertList == nil then
							self.dialogRevertList = {}
						end

						if self.dialogRevertList[id] == nil then
							self.dialogRevertList[id] = 1
						end
					end
				end
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Dialog, showFlg)
	UIManager.SendMessage("Mainmenu", "SetDialogButton", self.dialogInteractType)
end

function ControllerStoryMode:GetDialogMonster(monsterId)
	if monsterId > 0 and self.monsterList[monsterId] ~= nil then
		local tmpMonster = self.monsterList[monsterId].monster

		if tmpMonster ~= nil then
			return tmpMonster
		end
	end

	return nil
end

function ControllerStoryMode:RemoveDialogMonster(monsterId)
	local tempIndex

	for k, monster in pairs(self.dialogMemberList) do
		if monster:GetStoryMonsterId() == monsterId then
			tempIndex = k
		end
	end

	if tempIndex then
		self.dialogMemberList[tempIndex] = nil
	end
end

function ControllerStoryMode:SwitchToDialog()
	if self.dialogIdNow > 0 then
		local tmpDialogData = self:GetDialogData(self.dialogIdNow)

		if tmpDialogData ~= nil and self:CheckDialogShow(tmpDialogData) == true then
			if tmpDialogData.Type == MS_StoryDialog.Type.HostWhisper or tmpDialogData.Type == MS_StoryDialog.Type.CrowWhisper or tmpDialogData.Type == MS_StoryDialog.Type.NpcWhisper then
				self.sceneController:OpenDialog(self.dialogIdNow, nil)

				return true
			elseif (tmpDialogData.Type == MS_StoryDialog.Type.IncludeOption or tmpDialogData.Type == MS_StoryDialog.Type.ClickNext or tmpDialogData.Type == MS_StoryDialog.Type.Frog or tmpDialogData.Type == MS_StoryDialog.Type.Transaction or tmpDialogData.Type == MS_StoryDialog.Type.Statue) and self.hostPlayer:IsMovieAndDialogueEnable() == true then
				local meetingId = tmpDialogData.MeetingId
				local meetingData = self:GetMeetingData(self.dialogIdNow)

				if meetingData ~= nil then
					self.dialogMemberList = nil

					local standIndexList = meetingData.StandIndex

					for i = 1, #standIndexList do
						local standIndex = standIndexList[i]

						if standIndex < 10 then
							local heroId = FS_UserData.story:GetSelectHeroId(standIndex)

							if heroId > 0 then
								local tmpHostPlayer, tmpHostIndex = self.sceneController:GetHostPlayerById(heroId)

								if tmpHostPlayer ~= nil and FS_UserData.story:CheckHeroEnable(tmpHostPlayer:GetHeroId()) == true then
									if self.dialogMemberList == nil then
										self.dialogMemberList = {}
									end

									self.dialogMemberList[standIndex] = tmpHostPlayer
								end
							end
						else
							local monsterId = meetingData["StandMonsterId" .. standIndex]

							if monsterId > 0 then
								local tmpMonster = self:CreateOrGetMonster(monsterId)

								if tmpMonster ~= nil then
									if self.dialogMemberList == nil then
										self.dialogMemberList = {}
									end

									self.dialogMemberList[standIndex] = tmpMonster
								end
							end
						end
					end

					if self.dialogMemberList ~= nil then
						self:ChangeStatus(ControllerStoryMode.Status.Dialog)
						UILayerCtrl.Push("Dialog")
						self:StartDialog(tmpDialogData, self.dialogMemberList)

						if self.sceneController ~= nil and self.sceneController:GetCrow() ~= nil then
							self.sceneController:GetCrow():StartMeeting(meetingData.CrowPosition1, meetingData.CrowOrientation1, meetingData.CrowAnimatorType1)
						end

						return true
					end
				end
			end
		end
	end

	return false
end

function ControllerStoryMode:GetDialogData(dialogId)
	local storyId = self.storyId

	if MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
		storyId = MS_StoryData.StoryIdMazeStart
	end

	local dialogData = MS_StoryDialog.GetDialogData(storyId, dialogId)

	return dialogData
end

function ControllerStoryMode:ExitDialogFinish()
	self:CheckSceneDialog(false)
	self:CheckSceneMovie(false)
	self:CheckSceneTimeLine(false)

	if self:IsStatus(ControllerStoryMode.Status.Normal) == false then
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 1)
	end
end

function ControllerStoryMode:ExitDialog()
	ControllerModeBase.ExitDialog(self)

	if self:IsStatus(ControllerStoryMode.Status.Dialog) == true then
		self:ChangeStatus(ControllerStoryMode.Status.Normal)
	end

	if self.sceneController ~= nil and self.sceneController:GetCrow() ~= nil then
		self.sceneController:GetCrow():QuitMeeting()
	end

	self:UpdateQuality(false)
end

function ControllerStoryMode:AddDynamicMeeting(dialogId, pos, look, standPos, standLook)
	self.dynamicMeetingList[dialogId] = {}
	self.dynamicMeetingList[dialogId].position = pos
	self.dynamicMeetingList[dialogId].look = look
	self.dynamicMeetingList[dialogId].meetingData = {}
	self.dynamicMeetingList[dialogId].meetingData.StandMonsterId1 = 0
	self.dynamicMeetingList[dialogId].meetingData.StandPosition1 = standPos
	self.dynamicMeetingList[dialogId].meetingData.StandOrientation1 = standLook
	self.dynamicMeetingList[dialogId].meetingData.StandMonsterId2 = 0
	self.dynamicMeetingList[dialogId].meetingData.StandPosition2 = standPos
	self.dynamicMeetingList[dialogId].meetingData.StandOrientation2 = standLook
	self.dynamicMeetingList[dialogId].meetingData.StandIndex = {
		1,
		2
	}

	local right = Vector3.Cross(look, Vector3.s_up):Mul(1.2)
	local up = Vector3.up:Mul(1.6)
	local lookup = (-look):Add(up)

	self.dynamicMeetingList[dialogId].meetingData.CameraPosition1_169 = (look * 4):Add(pos):Add(up):Add(right)
	self.dynamicMeetingList[dialogId].meetingData.CameraRotation1_169 = Quaternion.LookRotation(-look)
	self.dynamicMeetingList[dialogId].meetingData.CameraPosition1_43 = (look * 4):Add(pos):Add(up):Add(right)
	self.dynamicMeetingList[dialogId].meetingData.CameraRotation1_43 = Quaternion.LookRotation(-look)
	self.dynamicMeetingList[dialogId].meetingData.CameraIndex = {
		1
	}
	right = nil
	up = nil
	lookup = nil
end

function ControllerStoryMode:CancelDynamicMeeting(dialogId)
	self.dynamicMeetingList[dialogId] = nil
end

function ControllerStoryMode:GetMeetingData(dialogId)
	if self.dynamicMeetingList[dialogId] ~= nil then
		return self.dynamicMeetingList[dialogId].meetingData
	else
		local dialogData = self:GetDialogData(dialogId)

		return MS_SceneData.GetData(MS_SceneData.LocatorType.Meeting, dialogData.MeetingId)
	end
end

function ControllerStoryMode:RecordAchievement(achievementId, value, recordId)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		return false
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and (achievementId < 60000 or achievementId > 70000) then
		return false
	end

	local achievementData = MS_Achievement.GetAchievement(achievementId)

	if achievementData.leastUnlockDiff > BattleData.GetDifficulty() then
		return false
	end

	local ret = FS_UserData.story:AddAchievementValue(achievementId, value, recordId)

	if ret and achievementId < MS_Achievement.BeforeSecondTime then
		self:RecordAchievement(MS_Achievement.AchievementIdType.GetAllAchievement, 1, achievementId)
	end

	return ret
end

function ControllerStoryMode:CheckCarriage()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpCarriageId, tmpCarriagePos = self.scene:CheckCarriage(nowPos, nowForward)

		if tmpCarriageId > 0 then
			self.carriageId = tmpCarriageId
			self.carriagePosition = tmpCarriagePos
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Carriage, showFlg)
end

function ControllerStoryMode:IsCarriageReady()
	if self.carriageId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetCarriagePosition()
	if self.carriageId > 0 then
		return self.carriagePosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:CheckCarriageArrive()
	local carriageArrId = FS_UserData.story:GetCarriageArriveId()

	if carriageArrId > 0 then
		local movieData = MS_StoryMovie.GetMovieCarriageArrive(self.storyId, carriageArrId)

		if movieData ~= nil then
			local id = tonumber(movieData.MovieId)
			local ret = self.controllerMovie:StartMovieCarriage(self.storyId, carriageArrId)

			if ret == true then
				self.storyMovieIdNow = id
				self.storyMovieList[id] = 1
				self.storyMoviePosIndex = 0

				self:ChangeStatus(ControllerStoryMode.Status.Movie)
				UIManager.SendMessage("Dialog", "StopDialog")

				return true
			end
		end
	end

	return false
end

function ControllerStoryMode:CarriageCall(carriageId)
	if carriageId then
		self.carriageId = carriageId
	end

	local movieData = MS_StoryMovie.GetMovieCarriageCall(self.storyId, self.carriageId)

	if movieData ~= nil then
		local id = tonumber(movieData.MovieId)
		local ret = self.controllerMovie:StartMovieCarriage(self.storyId, self.carriageId)

		if ret == true then
			self.storyMovieIdNow = id
			self.storyMovieList[id] = 1
			self.storyMoviePosIndex = 0

			self:ChangeStatus(ControllerStoryMode.Status.Movie)
			UIManager.SendMessage("Dialog", "StopDialog")
		end
	end
end

function ControllerStoryMode:CheckBridge()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpBridgeId, tmpBridgeSwitchPos = self.scene:CheckBridge(nowPos, nowForward)

		if tmpBridgeId > 0 then
			local bridgeData = MS_StoryBridge.GetStoryBridge(self.storyId, tmpBridgeId)

			if bridgeData ~= nil then
				if self:CheckShowQuestComplete(bridgeData.ShowQuestId) == true and self:CheckHideQuestComplete(bridgeData.HideQuestId) == false then
					self.bridgeId = tmpBridgeId
					self.bridgeSwitchPosition = tmpBridgeSwitchPos
					showFlg = true
				end
			else
				self.bridgeId = tmpBridgeId
				self.bridgeSwitchPosition = tmpBridgeSwitchPos
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Bridge, showFlg)
end

function ControllerStoryMode:IsBridgeReady()
	if self.bridgeId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetBridgePosition()
	if self.bridgeId > 0 then
		return self.bridgeSwitchPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenBridge()
	if self.bridgeId > 0 then
		local bridge = self.scene:GetBridge(self.bridgeId)

		if bridge ~= nil then
			bridge:OpenBridge()

			local bridgeData = MS_StoryBridge.GetStoryBridge(self.storyId, self.bridgeId)

			if bridgeData ~= nil then
				self:CompleteQuest(bridgeData.CompleteQuestId)
			end
		end
	end
end

function ControllerStoryMode:CheckDoor()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpDoorId, tmpDoorSwitchPos, tmpDoorSwitchId, tmpDoorAnimatorType = self.scene:CheckDoor(nowPos, nowForward)

		if tmpDoorId > 0 then
			local doorData = MS_StoryDoor.GetStoryDoor(self.storyId, tmpDoorId)

			if doorData ~= nil then
				if self:CheckShowQuestComplete(doorData.ShowQuestId) == true and self:CheckHideQuestComplete(doorData.HideQuestId) == false then
					self.doorId = tmpDoorId
					self.doorSwitchId = tmpDoorSwitchId
					self.doorSwitchPosition = tmpDoorSwitchPos
					self.doorAnimatorType = tmpDoorAnimatorType
					showFlg = true
				end
			else
				self.doorId = tmpDoorId
				self.doorSwitchId = tmpDoorSwitchId
				self.doorSwitchPosition = tmpDoorSwitchPos
				self.doorAnimatorType = tmpDoorAnimatorType
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Door, showFlg)
	self:CheckDoorHint(showFlg)
end

function ControllerStoryMode:IsDoorReady()
	if self.doorId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetDoorPosition()
	if self.doorId > 0 then
		return self.doorSwitchPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenDoor()
	if self.doorId > 0 then
		local door = self.scene:GetDoor(self.doorId)

		if door ~= nil then
			local doorData = MS_StoryDoor.GetStoryDoor(self.storyId, self.doorId)
			local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Door, self.doorId)

			if locatorData["CameraAnimator" .. self.doorSwitchId .. "_2" .. ControllerModeBase.CameraScreenRatioKey] ~= nil then
				self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, self.doorId, self.doorSwitchId, 1, function()
					self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, self.doorId, self.doorSwitchId, 2, nil)

					if door:IsSwitchable() then
						door:SwitchDoor(self.doorAnimatorType)
					else
						door:OpenDoor(self.doorAnimatorType)
					end

					if doorData ~= nil then
						self:CompleteQuest(doorData.CompleteQuestId)
					end
				end)
			else
				if door:IsSwitchable() then
					door:SwitchDoor(self.doorAnimatorType)
				else
					door:OpenDoor(self.doorAnimatorType)
				end

				self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, self.doorId, self.doorSwitchId, 1)

				if doorData ~= nil then
					self:CompleteQuest(doorData.CompleteQuestId)
				end
			end
		end
	end
end

function ControllerStoryMode:CheckDoorHint(doorShow)
	local showFlg = false

	if doorShow == false and self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpDoorHintId, tmpDoorHintPos, tmpDoorHintForward = self.scene:CheckDoorHint(nowPos, nowForward)

		if tmpDoorHintId > 0 then
			local doorHintData = MS_StoryDoorHint.GetStoryDoorHint(self.storyId, tmpDoorHintId)

			if doorHintData ~= nil and self:CheckShowQuestComplete(doorHintData.ShowQuestId) == true and self:CheckHideQuestComplete(doorHintData.HideQuestId) == false then
				if tmpDoorHintForward == true and doorHintData.DialogId > 0 or doorHintData.CompleteQuestId ~= "" then
					self.doorHintId = tmpDoorHintId
					self.doorHintPosition = tmpDoorHintPos
					self.doorHintForward = true
					showFlg = true
				elseif tmpDoorHintForward == false and doorHintData.OppositeDialogId > 0 or doorHintData.CompleteQuestId ~= "" then
					self.doorHintId = tmpDoorHintId
					self.doorHintPosition = tmpDoorHintPos
					self.doorHintForward = false
					showFlg = true
				end
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.DoorHint, showFlg)
end

function ControllerStoryMode:IsDoorHintReady()
	if self.doorHintId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetDoorHintPosition()
	if self.doorHintId > 0 then
		return self.doorHintPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenDoorHint()
	if self.doorHintId > 0 then
		local doorHintData = MS_StoryDoorHint.GetStoryDoorHint(self.storyId, self.doorHintId)

		if doorHintData ~= nil then
			if self.doorHintForward == true and doorHintData.DialogId > 0 then
				self.dialogIdNow = doorHintData.DialogId

				self:SwitchToDialog()
			elseif self.doorHintForward == false and doorHintData.OppositeDialogId > 0 then
				self.dialogIdNow = doorHintData.OppositeDialogId

				self:SwitchToDialog()
			end

			if doorHintData.CompleteQuestId ~= "" then
				self:CompleteQuest(doorHintData.CompleteQuestId)
			end
		end
	end
end

function ControllerStoryMode:CheckGate()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpGateId, tmpGateStandPos, tmpGateLookPos = self.scene:CheckGate(nowPos, nowForward)

		if tmpGateId > 0 then
			local gateData = MS_StoryGate.GetStoryGate(self.storyId, tmpGateId)

			if gateData ~= nil then
				if self:CheckShowQuestComplete(gateData.ShowQuestId) == true and self:CheckHideQuestComplete(gateData.HideQuestId) == false then
					self.gateId = tmpGateId
					self.gateStandPosition = tmpGateStandPos
					self.gateStandLookPos = tmpGateLookPos
					showFlg = true
				end
			else
				self.gateId = tmpGateId
				self.gateStandPosition = tmpGateStandPos
				self.gateStandLookPos = tmpGateLookPos
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Gate, showFlg)
	self:CheckGateHint(showFlg)
end

function ControllerStoryMode:IsGateReady()
	if self.gateId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetGateStandInfo()
	if self.gateId > 0 then
		return self.gateStandPosition, self.gateStandLookPos
	end

	return Vector3.s_zero, Vector3.s_zero
end

function ControllerStoryMode:OpenGate()
	if self.gateId > 0 then
		local gate = self.scene:GetGate(self.gateId)

		if gate ~= nil then
			gate:OpenGate()
			self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Gate, self.gateId, 1, 1)

			local gateData = MS_StoryGate.GetStoryGate(self.storyId, self.gateId)

			if gateData ~= nil then
				self:CompleteQuest(gateData.CompleteQuestId)
			end
		end
	end
end

function ControllerStoryMode:CheckGateHint(gateShow)
	local showFlg = false

	if gateShow == false and self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpGateHintId, tmpGateHintPos, tmpGateHintForward = self.scene:CheckGateHint(nowPos, nowForward)

		if tmpGateHintId > 0 then
			local gateHintData = MS_StoryGateHint.GetStoryGateHint(self.storyId, tmpGateHintId)

			if gateHintData ~= nil and self:CheckShowQuestComplete(gateHintData.ShowQuestId) == true and self:CheckHideQuestComplete(gateHintData.HideQuestId) == false then
				if tmpGateHintForward == true and gateHintData.DialogId > 0 then
					self.gateHintId = tmpGateHintId
					self.gateHintPosition = tmpGateHintPos
					self.gateHintFoward = true
					showFlg = true
				elseif tmpGateHintForward == false and gateHintData.OppositeDialogId > 0 then
					self.gateHintId = tmpGateHintId
					self.gateHintPosition = tmpGateHintPos
					self.gateHintFoward = false
					showFlg = true
				end
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.GateHint, showFlg)
end

function ControllerStoryMode:IsGateHintReady()
	if self.gateHintId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetGateHintPosition()
	if self.gateHintId > 0 then
		return self.gateHintPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenGateHint()
	if self.gateHintId > 0 then
		local gateHintData = MS_StoryGateHint.GetStoryGateHint(self.storyId, self.gateHintId)

		if gateHintData ~= nil then
			if self.gateHintFoward == true and gateHintData.DialogId > 0 then
				self.dialogIdNow = gateHintData.DialogId

				self:SwitchToDialog()
			elseif self.gateHintFoward == false and gateHintData.OppositeDialogId > 0 then
				self.dialogIdNow = gateHintData.OppositeDialogId

				self:SwitchToDialog()
			end

			if gateHintData.CompleteQuestId ~= "" then
				self:CompleteQuest(gateHintData.CompleteQuestId)
			end
		end
	end
end

function ControllerStoryMode:GetRoadSign(id)
	return self.roadSignList[id]
end

function ControllerStoryMode:GetRain(id)
	return self.rainList[id]
end

function ControllerStoryMode:InitRoadSign()
	local roadSignDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.RoadSign)

	for id, locatorData in pairs(roadSignDataList) do
		local pos = locatorData.Position
		local rot = locatorData.Orientation

		if self.roadSignList[id] == nil then
			local roadSign = RoadSign:new(id, pos, rot)

			self.roadSignList[id] = roadSign
		end
	end
end

function ControllerStoryMode:CheckRoadSignPos(nowPos, nowForward)
	local roadSignDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.RoadSign)

	for id, locatorData in pairs(roadSignDataList) do
		local pos = locatorData.Position
		local disSqr = Vector3.DistanceSquare(nowPos, pos)

		if disSqr < SceneDefine.DistanceForRoadSign * SceneDefine.DistanceForRoadSign then
			return id
		end
	end

	return 0
end

function ControllerStoryMode:InitRain()
	local rainDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Rain)

	for id, locatorData in pairs(rainDataList) do
		local pos = locatorData.Position
		local rot = locatorData.Orientation
		local type = locatorData.RainType

		if self.rainList ~= nil and self.rainList[id] == nil then
			local rain = Rain:new(id, pos, rot, type)

			self.rainList[id] = rain
		end
	end
end

function ControllerStoryMode:CheckRainPos(nowPos, nowForward)
	local rainDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Rain)
	local rainIdList = {}
	local noRainIdList = {}

	for id, locatorData in pairs(rainDataList) do
		local pos = locatorData.Position
		local disSqr = Vector3.Distance2DSquare(nowPos, pos)

		if disSqr < SceneDefine.DistanceForRain * SceneDefine.DistanceForRain then
			table.insert(rainIdList, id)
		else
			table.insert(noRainIdList, id)
		end
	end

	return rainIdList, noRainIdList
end

function ControllerStoryMode:CheckRoadSign()
	if self.roadSignInited == nil or self.roadSignInited == false then
		return
	end

	if DebugAlwaysShowRoadSign == false and BattleData.GetDifficulty() ~= BattleData.GlobalDifficultyLevel.Casual then
		return
	end

	local tmpRoadSignId = 0

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		tmpRoadSignId = self:CheckRoadSignPos(nowPos, nowForward)
	end

	if self.roadSignIndex ~= tmpRoadSignId then
		if self.roadSignIndex ~= 0 then
			local roadSign = self:GetRoadSign(self.roadSignIndex)

			roadSign:FarAway()
		end

		self.roadSignIndex = tmpRoadSignId

		if self.roadSignIndex ~= 0 then
			local roadSign = self:GetRoadSign(tmpRoadSignId)

			if self.SceneBossKillIdQuestDict[self.storyId] ~= nil and FS_UserData.story:IsQuestComplete(self.SceneBossKillIdQuestDict[self.storyId]) == true then
				roadSign:Approach(false)
			else
				roadSign:Approach(true)
			end
		end
	end
end

function ControllerStoryMode:CheckRain()
	local rainIdList, noRainIdList

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false and self.storyId == MS_StoryData.StoryId10012 then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		rainIdList, noRainIdList = self:CheckRainPos(nowPos, nowForward)
	end

	if rainIdList ~= nil and #rainIdList > 0 then
		for k, v in pairs(rainIdList) do
			local rain = self:GetRain(v)

			if rain ~= nil then
				rain:Approach()
			end
		end
	end

	if noRainIdList ~= nil and #noRainIdList > 0 then
		for k, v in pairs(noRainIdList) do
			local rain = self:GetRain(v)

			if rain ~= nil then
				rain:FarAway()
			end
		end
	end
end

function ControllerStoryMode:CheckStair()
	local showStairFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		self.stairId, self.stairTouchType, self.stairTouchPos, self.stairTouchRot = self.scene:CheckStairTouch(nowPos, nowForward)

		if self.stairId > 0 and (self.stairTouchType == AnimalBase_Define.StairTouch.Down or self.stairTouchType == AnimalBase_Define.StairTouch.Up) then
			local stairData = MS_StoryStair.GetStoryStair(self.storyId, self.stairId)

			if stairData ~= nil then
				if self:CheckShowQuestComplete(stairData.ShowQuestId) == true and self:CheckHideQuestComplete(stairData.HideQuestId) == false then
					showStairFlg = true
				end
			else
				showStairFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Climb, showStairFlg)
end

function ControllerStoryMode:CheckStairKick()
	local showStairKickFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		self.stairKickId, self.stairKickStandPosition, self.stairKickStandLookPos = self.scene:CheckStairKick(nowPos, nowForward)

		if self.stairKickId > 0 then
			local stairKickData = MS_StoryStairKick.GetStoryStairKick(self.storyId, self.stairKickId)

			if stairKickData ~= nil and self:CheckShowQuestComplete(stairKickData.ShowQuestId) == true and self:CheckHideQuestComplete(stairKickData.HideQuestId) == false then
				showStairKickFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.StairKick, showStairKickFlg)
end

function ControllerStoryMode:CheckCoverKick()
	local showCoverKickFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		self.coverKickId, self.coverKickStandPosition, self.coverKickStandLookPos = self.scene:CheckCoverKick(nowPos, nowForward)

		if self.coverKickId > 0 then
			local coverKickData = MS_StoryCoverKick.GetStoryCoverKick(self.storyId, self.coverKickId)

			if coverKickData ~= nil and self:CheckShowQuestComplete(coverKickData.ShowQuestId) == true and self:CheckHideQuestComplete(coverKickData.HideQuestId) == false then
				showCoverKickFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.CoverKick, showCoverKickFlg)
	self:CheckCoverKickHint(showCoverKickFlg)
end

function ControllerStoryMode:CheckCoverKickHint(coverKickShow)
	local showFlg = false

	if coverKickShow == false and self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpCoverKickHintId, tmpCoverKickHintPos = self.scene:CheckCoverKickHint(nowPos, nowForward)

		if tmpCoverKickHintId > 0 then
			local coverKickHintData = MS_StoryCoverKickHint.GetStoryCoverKickHint(self.storyId, tmpCoverKickHintId)

			if coverKickHintData ~= nil and self:CheckShowQuestComplete(coverKickHintData.ShowQuestId) == true and self:CheckHideQuestComplete(coverKickHintData.HideQuestId) == false and (coverKickHintData.DialogId > 0 or coverKickHintData.CompleteQuestId ~= "") then
				self.coverKickHintId = tmpCoverKickHintId
				self.coverKickHintPosition = tmpCoverKickHintPos
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.CoverKickHint, showFlg)
end

function ControllerStoryMode:UpdateRecordTime()
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		UIManager.SendMessage("Mainmenu", "ShowRecordTime", FS_UserData.story:GetGameTime())
	end
end

function ControllerStoryMode:IsCoverKickHintReady()
	if self.coverKickHintId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetCoverKickHintPosition()
	if self.coverKickHintId > 0 then
		return self.coverKickHintPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenCoverKickHint()
	if self.coverKickHintId > 0 then
		local coverKickHintData = MS_StoryCoverKickHint.GetStoryCoverKickHint(self.storyId, self.coverKickHintId)

		if coverKickHintData ~= nil then
			if coverKickHintData.DialogId > 0 then
				self.dialogIdNow = coverKickHintData.DialogId

				self:SwitchToDialog()
			end

			if coverKickHintData.CompleteQuestId ~= "" then
				self:CompleteQuest(coverKickHintData.CompleteQuestId)
			end
		end
	end
end

function ControllerStoryMode:GetStairInfo()
	if self.stairId > 0 and (self.stairTouchType == AnimalBase_Define.StairTouch.Down or self.stairTouchType == AnimalBase_Define.StairTouch.Up) then
		local permit = false
		local stairData = MS_StoryStair.GetStoryStair(self.storyId, self.stairId)

		if stairData ~= nil then
			if self:CheckShowQuestComplete(stairData.ShowQuestId) == true and self:CheckHideQuestComplete(stairData.HideQuestId) == false then
				permit = true
			end
		else
			permit = true
		end

		if permit == true then
			return self.stairId, self.stairTouchType, self.stairTouchPos, self.stairTouchRot
		end
	end

	return 0, AnimalBase_Define.StairTouch.Empty, Vector3.s_zero, Quaternion.s_identity
end

function ControllerStoryMode:IsStairKickReady()
	if self.stairKickId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetStairKickStandInfo()
	if self.stairKickId > 0 then
		return self.stairKickStandPosition, self.stairKickStandLookPos
	end

	return Vector3.s_zero, Vector3.s_forward
end

function ControllerStoryMode:KickStair()
	if self.stairKickId > 0 then
		local permit = false
		local stairKickData = MS_StoryStairKick.GetStoryStairKick(self.storyId, self.stairKickId)

		if stairKickData ~= nil then
			if self:CheckShowQuestComplete(stairKickData.ShowQuestId) == true and self:CheckHideQuestComplete(stairKickData.HideQuestId) == false then
				permit = true
			end
		else
			permit = true
		end

		if permit == true then
			local stairKick = self.scene:GetStairKick(self.stairKickId)

			if stairKick ~= nil then
				stairKick:KickStair()

				if stairKickData ~= nil and stairKickData.CompleteQuestId ~= "" then
					self:CompleteQuest(stairKickData.CompleteQuestId)
				end
			end
		end
	end
end

function ControllerStoryMode:IsCoverKickReady()
	if self.coverKickId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetCoverKickStandInfo()
	if self.coverKickId > 0 then
		return self.coverKickStandPosition, self.coverKickStandLookPos
	end

	return Vector3.s_zero, Vector3.s_forward
end

function ControllerStoryMode:KickCover()
	if self.coverKickId > 0 then
		local permit = false
		local coverKickData = MS_StoryCoverKick.GetStoryCoverKick(self.storyId, self.coverKickId)

		if coverKickData ~= nil then
			if self:CheckShowQuestComplete(coverKickData.ShowQuestId) == true and self:CheckHideQuestComplete(coverKickData.HideQuestId) == false then
				permit = true
			end
		else
			permit = true
		end

		if permit == true then
			local coverKick = self.scene:GetCoverKick(self.coverKickId)

			if coverKick ~= nil then
				coverKick:KickCover()

				if coverKickData ~= nil and coverKickData.CompleteQuestId ~= "" then
					self:CompleteQuest(coverKickData.CompleteQuestId)
				end
			end
		end
	end
end

function ControllerStoryMode:CheckCage()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		self.cageId, self.cageSwitchIndex, self.cageStandPosition, self.cageStandLook = self.scene:CheckCage(nowPos, nowForward)

		if self.cageId > 0 then
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Cage, showFlg)
end

function ControllerStoryMode:CallCage()
	if self.cageId > 0 then
		local cage = self.scene:GetCage(self.cageId)

		if cage ~= nil then
			if self.cageSwitchIndex == 1 then
				if self:IsQuestAllComplete(MS_StoryQuest.CageQuest) then
					self.sceneController:OpenDialog(MS_StoryQuest.CageDialogId, nil)

					return
				else
					self:CompleteQuest(MS_StoryQuest.CageQuest)
				end
			end

			cage:SetTriggerAudio(self.cageSwitchIndex)
			self:StartSceneCameraAnimator(MS_SceneData.LocatorType.Cage, self.cageId, self.cageSwitchIndex, 1, function()
				cage:Call(self.cageSwitchIndex, self)
			end)
			self:ChangeStatus(ControllerStoryMode.Status.Locator)
		end
	end
end

function ControllerStoryMode:GetCageStandInfo()
	if self.cageId > 0 then
		return self.cageStandPosition, self.cageStandLook
	end

	return Vector3.s_zero, Vector3.s_forward
end

function ControllerStoryMode:IsCageReady()
	if self.cageId > 0 then
		local cage = self.scene:GetCage(self.cageId)

		return not cage:IsRunning()
	end

	return false
end

function ControllerStoryMode:CheckElevator()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local autoFlg = false

		self.elevatorId, self.elevatorFloor, self.evevatorInner, self.elevatorSwitchPosition, self.elevatorSwitchIndex, autoFlg = self.scene:CheckElevator(nowPos, nowForward)

		if self.elevatorId > 0 and self.elevatorFloor > 0 then
			if autoFlg then
				self:CallElevator()
			else
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Elevator, showFlg)
end

function ControllerStoryMode:IsElevatorReady()
	if self.elevatorId > 0 and self.elevatorFloor > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetElevatorPosition()
	if self.elevatorId > 0 and self.elevatorFloor > 0 then
		return self.elevatorSwitchPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:CallElevator()
	if self.elevatorId > 0 and self.elevatorFloor > 0 then
		local elevator = self.scene:GetElevator(self.elevatorId)

		if elevator ~= nil then
			elevator:Call(self.elevatorFloor, self.evevatorInner, self.elevatorSwitchIndex)
		end
	end
end

function ControllerStoryMode:CheckCrate()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		self.crateId, self.crateStandPosition, self.cratePosition = self.scene:CheckCrate(nowPos, nowForward)

		if self.crateId > 0 then
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Crate, showFlg)
end

function ControllerStoryMode:GetCrateStandInfo()
	if self.crateId > 0 then
		return self.crateStandPosition, self.cratePosition
	end

	return Vector3.s_zero, Vector3.s_forward
end

function ControllerStoryMode:GetCrateStatus()
	if self.crateId > 0 then
		local crate = self.scene:GetCrate(self.crateId)

		return crate:GetStatus()
	end

	return Crate.Status.Empty
end

function ControllerStoryMode:GetCrateType()
	if self.crateId > 0 then
		local crate = self.scene:GetCrate(self.crateId)

		return crate:GetType()
	end

	return Crate.Type.Common
end

function ControllerStoryMode:OpenCrate()
	if self.crateId > 0 then
		local crate = self.scene:GetCrate(self.crateId)

		if crate ~= nil then
			crate:OpenCrate()

			local type = crate:GetType()
			local status = crate:GetStatus()

			if type == Crate.Type.Common then
				local crateData = MS_StoryCrate.GetStoryCrate(self.storyId, self.crateId)

				if crateData ~= nil then
					self:CompleteQuest(crateData.CompleteQuestId)
				end
			elseif type == Crate.Type.Maze then
				if status == Crate.Status.Lock then
					local crateData = crate:GetMazeData()

					if crateData ~= nil then
						self:CompleteQuest(crateData.CompleteQuestId)
						self:CreateCrateMonster(self.crateId)
					end
				elseif status == Crate.Status.Open then
					local crateData = crate:GetMazeData()

					if crateData.DropId > 0 then
						self:CreateMazeCrateItem(crateData.DropId, self.crateId)
					end
				end
			end
		end
	end
end

function ControllerStoryMode:CheckVirtualWall()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpVirtualWallId, tmpVirtualWallPos = self.scene:CheckVirtualWall(nowPos, nowForward)

		if tmpVirtualWallId > 0 then
			local virtualWallData = MS_StoryVirtualWall.GetStoryVirtualWall(self.storyId, tmpVirtualWallId)

			if virtualWallData ~= nil then
				if self:CheckShowQuestComplete(virtualWallData.ShowQuestId) == true and self:CheckHideQuestComplete(virtualWallData.HideQuestId) == false then
					self.virtualWallId = tmpVirtualWallId
					self.virtualWallPosition = tmpVirtualWallPos
					showFlg = true
				end
			else
				self.virtualWallId = tmpVirtualWallId
				self.virtualWallPosition = tmpVirtualWallPos
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.VirtualWall, showFlg)
	self:CheckVirtualWallHint(showFlg)
end

function ControllerStoryMode:IsVirtualWallReady()
	if self.virtualWallId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetVirtualWallPosition()
	if self.virtualWallId > 0 then
		return self.virtualWallPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenVirtualWall()
	if self.virtualWallId > 0 then
		local virtualWallData = MS_StoryVirtualWall.GetStoryVirtualWall(self.storyId, self.virtualWallId)

		if virtualWallData ~= nil then
			self:CompleteQuest(virtualWallData.CompleteQuestId)
		end
	end
end

function ControllerStoryMode:CheckVirtualWallHint(virtualWallShow)
	local showFlg = false

	if virtualWallShow == false and self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpVirtualWallHintId, tmpVirtualWallHintPos = self.scene:CheckVirtualWallHint(nowPos, nowForward)

		if tmpVirtualWallHintId > 0 then
			local virtualWallHintData = MS_StoryVirtualWallHint.GetStoryVirtualWallHint(self.storyId, tmpVirtualWallHintId)

			if virtualWallHintData ~= nil and self:CheckShowQuestComplete(virtualWallHintData.ShowQuestId) == true and self:CheckHideQuestComplete(virtualWallHintData.HideQuestId) == false and (virtualWallHintData.DialogId > 0 or virtualWallHintData.CompleteQuestId ~= "") then
				self.virtualWallHintId = tmpVirtualWallHintId
				self.virtualWallHintPosition = tmpVirtualWallHintPos
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.VirtualWallHint, showFlg)
end

function ControllerStoryMode:IsVirtualWallHintReady()
	if self.virtualWallHintId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetVirtualWallHintPosition()
	if self.virtualWallHintId > 0 then
		return self.virtualWallHintPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenVirtualWallHint()
	if self.virtualWallHintId > 0 then
		local virtualWallHintData = MS_StoryVirtualWallHint.GetStoryVirtualWallHint(self.storyId, self.virtualWallHintId)

		if virtualWallHintData ~= nil then
			if virtualWallHintData.DialogId > 0 then
				self.dialogIdNow = virtualWallHintData.DialogId

				self:SwitchToDialog()
			end

			if virtualWallHintData.CompleteQuestId ~= "" then
				self:CompleteQuest(virtualWallHintData.CompleteQuestId)
			end
		end
	end
end

function ControllerStoryMode:CheckEntrance()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpEntranceId, tmpEntrancePos = self.scene:CheckEntrance(nowPos, nowForward)

		if tmpEntranceId > 0 then
			self.entranceId = tmpEntranceId
			self.entrancePosition = tmpEntrancePos
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Entrance, showFlg)
end

function ControllerStoryMode:IsEntranceReady()
	if self.entranceId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetEntrancePosition()
	if self.entranceId > 0 then
		return self.entrancePosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenEntrance()
	if self.entranceId <= 0 then
		return
	end

	SystemHelper.LogTest("===============OpenEntrance===========================")

	if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		if FS_UserData.story:IsMazeFloorMax() == false then
			local uiTxt = GameText.UI_COMMON_ACTION_MAZE_NEXT_FLOOR

			self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
				self:ChangeStatus(ControllerStoryMode.Status.Normal)
				self:SaveProperty()
				self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterNextFloorMaze, 0, 0)
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
			end, function()
				self:ChangeStatus(ControllerStoryMode.Status.Normal)
			end, false)
		else
			local entranceType = self.scene:GetEntranceType(self.entranceId)

			if entranceType == Entrance.Type.Additional then
				local uiTxt = GameText.UI_COMMON_ACTION_MAZE_FINALBOSS

				self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
					self:ChangeStatus(ControllerStoryMode.Status.Normal)
					self:SaveProperty()
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterNextMaze, 1, 0)
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
				end, function()
					self:ChangeStatus(ControllerStoryMode.Status.Normal)
				end, false)
			else
				local uiTxt = GameText.UI_COMMON_ACTION_MAZE_BACK

				self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
					self:ChangeStatus(ControllerStoryMode.Status.Normal)
					FS_UserData.story:ResetRandomSeed()
					FS_UserData.story:ClearHeroShareStatusAll()
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterMazeStart, MS_StoryData.StoryIdMazeStart, 1)
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
				end, function()
					self:ChangeStatus(ControllerStoryMode.Status.Normal)
				end, false)
			end
		end
	else
		local uiTxt = GameText.UI_COMMON_ACTION_MAZE_BOSS

		self:ChangeStatus(ControllerStoryMode.Status.MazeConfirm)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", uiTxt, function()
			self:ChangeStatus(ControllerStoryMode.Status.Normal)
			self:SaveProperty()
			self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.EnterNextMaze, 0, 0)
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
		end, function()
			self:ChangeStatus(ControllerStoryMode.Status.Normal)
		end, false)
	end
end

function ControllerStoryMode:CheckStatue()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpStatueId, tmpStatuePos, tmpStatueLook = self.scene:CheckStatue(nowPos, nowForward)

		if tmpStatueId > 0 then
			self.statueId = tmpStatueId
			self.statuePosition = tmpStatuePos
			self.statueLook = tmpStatueLook
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Statue, showFlg)
end

function ControllerStoryMode:IsStatueReady()
	if self.statueId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetStatuePosition()
	if self.statueId > 0 then
		return self.statuePosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:GetStatueForward()
	if self.statueId > 0 then
		return self.statueLook
	end

	return Vector3.s_zero
end

function ControllerStoryMode:TouchStatue()
	if self.statueId > 0 then
		local statue = self.scene:GetStatue(self.statueId)

		if statue ~= nil then
			self.dialogIdNow = MS_StoryDialog.StatueDialogId

			local nowPos = self.hostPlayer:GetPosByWorldPos()
			local nowForward = self.hostPlayer:GetForward()

			self:AddDynamicMeeting(self.dialogIdNow, self.statuePosition, self.statueLook, nowPos, nowForward)
			self:SwitchToDialog()
		end
	end
end

function ControllerStoryMode:GetStatueDataList()
	local statue = self.scene:GetStatue(self.statueId)

	return statue:GetDataList()
end

function ControllerStoryMode:StatueEffect()
	local statue = self.scene:GetStatue(self.statueId)

	if statue ~= nil then
		statue:TouchStatue()

		local tfVfxRoot = self.hostPlayer:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

		if tfVfxRoot ~= nil then
			local type = statue:GetType()

			if type == Statue.Type.Holy then
				VfxManager.PlayBindMulti(tfVfxRoot, AnimalBase_Define.VfxName_StatueBuff1)
			elseif type == Statue.Type.Demon then
				VfxManager.PlayBindMulti(tfVfxRoot, AnimalBase_Define.VfxName_StatueBuff2)
			end
		end

		AudioCtrl.SetHeroAudio("add_buff", self.hostPlayer:GetModel(), self.hostPlayer:GetAnimalId())
	end
end

function ControllerStoryMode:CheckFountain()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpFountainId, tmpFountainPos = self.scene:CheckFountain(nowPos, nowForward)

		if tmpFountainId > 0 then
			self.fountainId = tmpFountainId
			self.fountainPosition = tmpFountainPos
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Fountain, showFlg)
end

function ControllerStoryMode:IsFountainReady()
	if self.fountainId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetFountainPosition()
	if self.fountainId > 0 then
		return self.fountainPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:TouchFountain()
	if self.fountainId > 0 then
		local fountain = self.scene:GetFountain(self.fountainId)

		if fountain ~= nil then
			self.hostPlayer:GetValue():AddSanPercentInMaze(Fountain.AddSanPer)

			local tfVfxRoot = self.hostPlayer:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

			if tfVfxRoot ~= nil then
				VfxManager.PlayBindMulti(tfVfxRoot, AnimalBase_Define.VfxName_FountainBuff)
			end

			AudioCtrl.SetHeroAudio("add_buff", self.hostPlayer:GetModel(), self.hostPlayer:GetAnimalId())
			fountain:TouchFountain()
		end
	end
end

function ControllerStoryMode:CheckHoneypot()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

		if tmpHeroId <= 0 and self.callHero == nil then
			local nowPos = self.hostPlayer:GetPosByWorldPos()
			local nowForward = self.hostPlayer:GetForward()
			local tmpHoneypotId, tmpHoneypotPos = self.scene:CheckHoneypot(nowPos, nowForward)

			if tmpHoneypotId > 0 then
				self.honeypotId = tmpHoneypotId
				self.honeypotPosition = tmpHoneypotPos
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Honeypot, showFlg)
end

function ControllerStoryMode:IsHoneypotReady()
	if self.honeypotId > 0 then
		local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

		if tmpHeroId <= 0 and self.callHero == nil then
			return true
		end
	end

	return false
end

function ControllerStoryMode:GetHoneypotPosition()
	if self.honeypotId > 0 then
		return self.honeypotPosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:TouchHoneypot()
	if self.honeypotId > 0 then
		local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

		if tmpHeroId <= 0 and self.callHero == nil then
			local honeypot = self.scene:GetHoneypot(self.honeypotId)

			if honeypot ~= nil then
				honeypot:TouchHoneypot()
			end
		end
	end
end

function ControllerStoryMode:TouchHoneypotAfter()
	if self.honeypotId > 0 then
		local tmpHeroId, tmpHeroType = FS_UserData.story:GetHeroCall()

		if tmpHeroId <= 0 and self.callHero == nil then
			local honeypot = self.scene:GetHoneypot(self.honeypotId)

			if honeypot ~= nil then
				tmpHeroId, tmpHeroType = honeypot:GetHeroData()

				local nowPos = self.hostPlayer:GetPosByWorldPos()
				local tmpDir = self.honeypotPosition - nowPos

				tmpDir.y = 0

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == true then
					tmpDir:SetVector3(self.hostPlayer:GetForward())
				end

				tmpDir:SetNormalize()
				tmpDir:Mul(Honeypot.Radius)
				tmpDir:Add(self.honeypotPosition)
				FS_UserData.story:ClearHeroCall()

				self.callHero = self:CreateCallHero(tmpHeroId, tmpHeroType, tmpDir)

				local tfVfxRoot = self.callHero:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

				if tfVfxRoot ~= nil then
					VfxManager.PlayBindMulti(tfVfxRoot, Honeypot.VfxAppearName)
				end

				if self.callHero ~= nil then
					FS_UserData.story:SetHeroCall(tmpHeroId, tmpHeroType)

					if self.callHero:IsHostTeam() == true then
						self.hostPlayer:AddStatus(self.hostPlayer:GetVirtualPlayer(), MS_StatusData.CallHeroId, 0, MS_StatusData.SourceType.Honeypot, self.honeypotId, false)
					end
				end

				tmpDir = nil

				honeypot:TouchHoneypotAfter()
			end
		end
	end
end

function ControllerStoryMode:CheckBonefire()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()
		local tmpBonefireId, tmpBonefirePos = self.scene:CheckBonefire(nowPos, nowForward)

		if tmpBonefireId > 0 then
			self.bonefireId = tmpBonefireId
			self.bonefirePosition = tmpBonefirePos
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Bonefire, showFlg)
end

function ControllerStoryMode:IsBonefireReady()
	if self.bonefireId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetBonefirePosition()
	if self.bonefireId > 0 then
		return self.bonefirePosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:OpenBonefire()
	if self.bonefireId > 0 then
		local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Bonefire, self.bonefireId)

		if locatorData ~= nil then
			self:StartSceneCamera(MS_SceneData.LocatorType.Bonefire, self.bonefireId, 1)
			self.sceneController:SetCameraLayerMaskToMovie(true)
			UIManager.CreateCtrl("Maze")
			UIManager.SendMessage("Maze", "SetupScene", locatorData.StandPosition1, locatorData.StandOrientation1, locatorData.StandPosition2, locatorData.StandOrientation2)
		end
	end
end

function ControllerStoryMode:MoveBonefireCamera(id, revert, cbFun)
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Bonefire, self.bonefireId)

	if locatorData ~= nil then
		local key = "CameraAnimator1_" .. id .. ControllerModeBase.CameraScreenRatioKey

		if revert == true then
			key = key .. "_r"
		end

		self.cameraScene:SetAnimatorTemplate(locatorData[key], false, CameraBase.AnimatorPurpose.Other, nil)
		self.cameraScene:StartAnimator(cbFun)
	end
end

function ControllerStoryMode:CloseBonefire(heroId1, heroId2)
	FS_UserData.story:ChangeMazeSelectHero(heroId1, heroId2)
	SystemHelper.LogTest("========heroId====" .. self.hostPlayer:GetHeroId() .. ",selecId=" .. FS_UserData.story:GetSelectHeroIdNow())
	self.sceneController:SetCameraLayerMaskToMovie(false)
	self:ExitSceneCamera()

	if self.hostPlayer:GetHeroId() ~= FS_UserData.story:GetSelectHeroIdNow() then
		self.sceneController:SwitchHostPlayer(FS_UserData.story:GetSelectHeroIdNow(), ControllerMain.SwitchType.Bonefire, false, self.rebornPropertyRateList)
	else
		self.sceneController:SetActionAssist(ControllerMain.AssistButton.BonefireEnd)
	end
end

function ControllerStoryMode:CheckSceneTimeLine(isStart)
	local showFlg = false
	local interactType = 0

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:GetStoryId() == 8 then
		return false
	end

	if self:IsStatus(ControllerStoryMode.Status.Normal) == false or self.storyTimeLineAllList == nil then
		UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.TimeLine, showFlg)
		UIManager.SendMessage("Mainmenu", "SetTimeLineButton", interactType)

		return false
	end

	local isBreak = false

	if isStart == true or self.hostPlayer:IsMovieAndDialogueEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		for id, timeLineData in pairs(self.storyTimeLineAllList) do
			if timeLineData ~= nil and self:CheckShowQuestComplete(timeLineData.ShowQuestId) == true and self:CheckHideQuestComplete(timeLineData.HideQuestId) == false then
				local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.TimeLine, id)

				if locatorData ~= nil and locatorData.RadiusIndex ~= nil then
					local radiusIndex = locatorData.RadiusIndex

					for _, index in pairs(radiusIndex) do
						local pos = locatorData["Position" .. index]
						local look = locatorData["Orientation" .. index]
						local radius = tonumber(locatorData["Radius" .. index])
						local auto = tonumber(locatorData["Auto" .. index])
						local dis = Vector3.DistanceSquare(nowPos, pos)

						if dis < radius * radius then
							if auto <= 0 then
								if isStart == false then
									local tmpDir = nowPos - pos

									tmpDir.y = 0

									tmpDir:SetNormalize()

									if locatorData["IgnoreAngle" .. index] == 1 then
										tmpDir = nil

										if self.hostPlayer:IsEventEnable() == true then
											self.timeLineId = id
											showFlg = true
											isBreak = true
											interactType = timeLineData.InteractType

											break
										end
									elseif Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
										tmpDir = nil

										if self.hostPlayer:IsEventEnable() == true then
											self.timeLineId = id
											showFlg = true
											isBreak = true
											interactType = timeLineData.InteractType

											break
										end
									end

									tmpDir = nil
								end
							else
								self.timeLineId = id

								local ret = self:OpenTimeLine(isStart)

								if ret == ControllerStoryMode.TimeLinePlayType.ControlPlayer then
									return true
								elseif ret == ControllerStoryMode.TimeLinePlayType.NoPlayer then
									isBreak = true

									break
								end
							end
						end
					end

					if isBreak then
						break
					end
				end
			end
		end
	end

	local nowPos = self.hostPlayer:GetPosByWorldPos()

	for id, timeLineData in pairs(self.storyTimeLineAllList) do
		if timeLineData ~= nil and self:CheckShowQuestComplete(timeLineData.ShowQuestId) == true and self:CheckHideQuestComplete(timeLineData.HideQuestId) == false then
			local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.TimeLine, id)

			if locatorData ~= nil and locatorData.RadiusIndex ~= nil then
				local radiusIndex = locatorData.RadiusIndex

				if #radiusIndex == 1 then
					local pos = locatorData.Position1
					local look = locatorData.Orientation1
					local auto = tonumber(locatorData.Auto1)

					if auto <= 0 then
						local dis = Vector3.DistanceSquare(nowPos, pos)

						if dis < SceneDefine.IconDistanceForTimeLine * SceneDefine.IconDistanceForTimeLine then
							local showIcon = true

							if locatorData.IgnoreAngle1 <= 0 then
								local tmpDir = nowPos - pos

								tmpDir.y = 0

								tmpDir:SetNormalize()

								if Vector3.Dot(tmpDir, look) <= 0 then
									showIcon = false
								end

								tmpDir = nil
							end

							if showIcon == true then
								self:ShowIcon(MS_SceneData.LocatorType.TimeLine, id, 0, pos.x, pos.y + SceneDefine.IconHeightForTimeLine, pos.z)
							end
						end
					end
				end
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.TimeLine, showFlg)
	UIManager.SendMessage("Mainmenu", "SetTimeLineButton", interactType)

	return false
end

function ControllerStoryMode:IsTimeLineReady()
	if self.timeLineId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:SetTimeLineReady(id)
	self.timeLineId = id
end

function ControllerStoryMode:HandleTimeLineMiddle()
	if self.timeLineSwitchPlayer ~= nil then
		self.cameraScene:SetHostPlayer(self.timeLineSwitchPlayer, false)
	end

	self.cameraScene:SetCameraTargetPosAndRot(self.timeLinePlayListControl:GetCameraEndInfo())

	local timeLineId = self.timeLinePlayListControl:GetTimeLineId()
	local timeLineData = MS_StoryTimeLine.GetStoryTimeLine(self.storyId, timeLineId)

	if timeLineData ~= nil and timeLineData.CompleteQuestPreId ~= "" then
		self:CompleteQuest(timeLineData.CompleteQuestPreId)
	end
end

function ControllerStoryMode:OpenTimeLine(isStart)
	if self.timeLineId > 0 and self.hostPlayer ~= nil then
		local timeLine = self.scene:GetTimeLine(self.timeLineId)

		if timeLine ~= nil then
			local playerControl = timeLine:IsControlPlayer()

			if playerControl == true then
				if self.timeLinePlayListControl ~= nil then
					return ControllerStoryMode.TimeLinePlayType.None
				end

				if DebugAutoRun == true then
					self.hostPlayer:SetDebugAutoRun(false, 0, 0, 0)
				end

				local transition = timeLine:IsUseTransition()
				local ret = timeLine:Ready(self.cameraScene, self.hostPlayer, transition)

				if ret == true then
					if self:IsHaveTimeLinePlaying() == false then
						UIManager.SendMessage("Subtitle", "Show", true)
					end

					UIManager.SendMessage("Subtitle", "SetButtonSkip", true, ControllerStoryMode.SkipTimeLineCB)

					self.timeLinePlayListControl = timeLine
					self.timeLinePlayTrigger = 0
					self.timeLineSwitchPlayer = nil
					self.timeLineSkip = false

					if transition == true then
						self:ChangeStatus(ControllerStoryMode.Status.TimeLineMove)
					else
						self:ChangeStatus(ControllerStoryMode.Status.TimeLine)
					end

					return ControllerStoryMode.TimeLinePlayType.ControlPlayer
				end
			else
				if isStart == true or self.timeLinePlayList ~= nil and self.timeLinePlayList[self.timeLineId] ~= nil then
					return ControllerStoryMode.TimeLinePlayType.None
				end

				local ret = timeLine:Ready(nil, nil, false)

				if ret == true then
					if self:IsHaveTimeLinePlaying() == false then
						UIManager.SendMessage("Subtitle", "Show", true)
					end

					if self.timeLinePlayList == nil then
						self.timeLinePlayList = {}
					end

					self.timeLinePlayList[self.timeLineId] = timeLine

					local timeLineData = MS_StoryTimeLine.GetStoryTimeLine(self.storyId, self.timeLineId)

					if timeLineData ~= nil then
						self:CompleteQuest(timeLineData.CompleteQuestId)
					end

					timeLine:Play(nil, nil, nil)
				end

				return ControllerStoryMode.TimeLinePlayType.NoPlayer
			end
		end
	end

	return ControllerStoryMode.TimeLinePlayType.None
end

function ControllerStoryMode:ClearAllTimeLine()
	if self.timeLinePlayList ~= nil then
		for timeLineId, timeLine in pairs(self.timeLinePlayList) do
			if timeLine ~= nil then
				timeLine:Stop()
			end
		end
	end

	self.timeLinePlayList = nil

	if self.timeLinePlayListControl ~= nil then
		self.timeLinePlayListControl:Stop()
		UIManager.SendMessage("Subtitle", "SetButtonSkip", false, nil)
	end

	self.timeLinePlayListControl = nil
	self.timeLineSwitchPlayer = nil
	self.timeLinePlayTrigger = 0
	self.timeLineAnimalListControl = nil
	self.timeLineSwitchPlayer = nil

	UIManager.SendMessage("Subtitle", "ClearAllTexts")
	UIManager.SendMessage("Subtitle", "Show", false)
end

function ControllerStoryMode:IsHaveTimeLinePlaying()
	local have = false

	if self.timeLinePlayList ~= nil then
		for timeLineId, timeLine in pairs(self.timeLinePlayList) do
			if timeLine ~= nil then
				have = true
			end
		end
	end

	if self.timeLinePlayListControl ~= nil then
		have = true
	end

	return have
end

function ControllerStoryMode.SkipTimeLineCB()
	local gameController = ST_Main.GetSceneController():GetGameController()

	gameController:SkipTimeLineReady()
end

function ControllerStoryMode:UpdateTimeLine()
	local deleteIdList

	if self.timeLinePlayList ~= nil then
		for timeLineId, timeLine in pairs(self.timeLinePlayList) do
			if timeLine ~= nil then
				local ret = timeLine:IsPlaying()

				if ret == false then
					if deleteIdList == nil then
						deleteIdList = {}
					end

					table.insert(deleteIdList, timeLineId)
				end
			end
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			self.timeLinePlayList[deleteIdList[i]] = nil
		end

		if self:IsHaveTimeLinePlaying() == false then
			UIManager.SendMessage("Subtitle", "ClearAllTexts")
			UIManager.SendMessage("Subtitle", "Show", false)
		end
	end

	deleteIdList = nil

	if self.timeLinePlayListControl ~= nil then
		local ret = self.timeLinePlayListControl:IsPlaying()

		if ret == false then
			self:ExitTimeLine(false)
		end
	end

	if self.timeLineSkip == true then
		self:SkipTimeLine()

		self.timeLineSkip = false
	end
end

function ControllerStoryMode:SkipTimeLineReady()
	self.timeLineSkip = true
end

function ControllerStoryMode:SkipTimeLine()
	if self.timeLinePlayListControl == nil then
		return
	end

	if self:IsStatus(ControllerStoryMode.Status.TimeLineMove) then
		self:ChangeStatus(ControllerStoryMode.Status.TimeLine)
	end

	if self.timeLineTimeOld <= MS_StoryTimeLine.TimeLineTriggerTime1 then
		self:HandleTimeLineMiddle()
	end

	local battleMode = self.timeLinePlayListControl:IsPlayerInBattleMode()

	if battleMode == true then
		self.hostPlayer:SetBattleMode(true)
	end

	UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
	self.timeLinePlayListControl:Skip(self.hostPlayer, self.timeLineSwitchPlayer, self.timeLineAnimalListControl)
	self:ExitTimeLine(true)
end

function ControllerStoryMode:ExitTimeLine(skip)
	if self.timeLinePlayListControl ~= nil then
		local timeLineId = self.timeLinePlayListControl:GetTimeLineId()
		local areaId = self.timeLinePlayListControl:GetToArea()
		local retTarget = false
		local posTarget, rotTarget

		if areaId > 0 then
			retTarget, posTarget, rotTarget = self.timeLinePlayListControl:GetHeroTargetEnd(self.hostPlayer)
		end

		if self.timeLineSwitchPlayer ~= nil then
			self.sceneController:EndSwitchHostPlayerInTimeLine()
		end

		if self.hostPlayer ~= nil then
			self.hostPlayer:ExitTimeLine()
		end

		local controlCrow = self.timeLinePlayListControl:IsControlCrow()

		if controlCrow == true then
			self.sceneController:GetCrow():ExitTimeLine()
		end

		if self.timeLineAnimalListControl ~= nil then
			for animalId, tmpAnimal in pairs(self.timeLineAnimalListControl) do
				if tmpAnimal ~= nil then
					tmpAnimal:ExitTimeLine()
				end
			end
		end

		self.timeLinePlayListControl:Stop()
		self.sceneController:EndTimeLineConfig()

		self.timeLinePlayListControl = nil
		self.timeLineSwitchPlayer = nil
		self.timeLinePlayTrigger = 0
		self.timeLineAnimalListControl = nil
		self.timeLineSwitchPlayer = nil

		UIManager.SendMessage("Subtitle", "SetButtonSkip", false, nil)
		UIManager.SendMessage("Subtitle", "ClearAllTexts")

		if self:IsHaveTimeLinePlaying() == false then
			UIManager.SendMessage("Subtitle", "Show", false)
		end

		local timeLineData = MS_StoryTimeLine.GetStoryTimeLine(self.storyId, timeLineId)

		if timeLineData ~= nil then
			if timeLineData.RevertQuestId ~= "" then
				self:RevertCompleteQuest(timeLineData.RevertQuestId)
			end

			self:CompleteQuest(timeLineData.CompleteQuestId)
		end

		if areaId > 0 then
			self.timeLineChangeAreaPos = nil
			self.timeLineChangeAreaRot = nil

			if retTarget == true and posTarget ~= nil and rotTarget ~= nil then
				self.hostPlayer:StopMovementImmediately(true)
				self.hostPlayer:SetPosByWorldPos(posTarget, true)
				self.hostPlayer:SetRotation(rotTarget, true)

				self.timeLineChangeAreaPos = posTarget
				self.timeLineChangeAreaRot = rotTarget
			end

			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
			self:ChangeStatus(ControllerStoryMode.Status.TimeLineLoadScene)
		else
			self:ChangeStatus(ControllerStoryMode.Status.Normal)

			if skip == true then
				self.cameraScene:ResetFollowingBase()
			end

			self:CheckCreateMonster()
			self:CheckSceneDialog(false)
			self:CheckSceneMovie(false)
			self:CheckSceneTimeLine(false)
		end
	end
end

function ControllerStoryMode:CheckSave()
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self:IsBossMode() then
		return
	end

	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()
		local nowForward = self.hostPlayer:GetForward()

		self.saveId, self.savePosition = self.scene:CheckSave(nowPos, nowForward)

		if self.saveId > 0 and (FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == false or FS_UserData.story:IsSelectStageGameOver() or self.saveId ~= SceneBase.AltarForNextStageId) then
			showFlg = true
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Worshiping, showFlg)
	self:CheckSaveAuto(ControllerStoryMode.SaveAuto.Time)
end

function ControllerStoryMode:CheckSaveAuto(autoType)
	if self:IsStatus(ControllerStoryMode.Status.Normal) == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false and MS_StoryList.IsStoryDream(self.storyId) == false and self.storyId ~= MS_StoryData.StoryId10011 and AppVer ~= AppAppleLight and AppVer ~= AppCJ2020 and self.seriesStoryRevertQuest == nil and self:IsBossMode() == false and self.hostPlayer ~= nil and self.hostPlayer:IsPermitAutoSave(autoType) == true and (autoType == ControllerStoryMode.SaveAuto.Exit or self.sceneController:IsInMenu() == false) then
		self.saveTime = self.saveTime + ControllerMain.GetLogicDeltaTime()

		if autoType == ControllerStoryMode.SaveAuto.Exit or self.saveTime > ControllerStoryMode.SaveTimeInterval then
			local inHostWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.HostWhisper)
			local inNpcWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.NpcWhisper)
			local inCrowWhisper = UIManager.SendMessage("Dialog", "IsWhisperPlayingByType", MS_StoryDialog.Type.CrowWhisper)

			if inHostWhisper == false and inCrowWhisper == false and inNpcWhisper == false then
				local crow = self.sceneController:GetCrow()

				if crow == nil or crow:IsComingIn() == false then
					local ret = self:Save(ControllerStoryMode.SaveType.SaveAutoTime)

					if ret == true then
						self.saveTime = 0
					end
				end
			end
		end
	end
end

function ControllerStoryMode:IsSaveReady()
	if self.saveId > 0 then
		return true
	end

	return false
end

function ControllerStoryMode:GetSavePosition()
	if self.saveId > 0 then
		return self.savePosition
	end

	return Vector3.s_zero
end

function ControllerStoryMode:StartSave()
	local status = FS_UserData.story:GetAltarStatus(self.saveId)

	if status == Altar.Status.Close then
		local altar = self.scene:GetAltar(self.saveId)

		if altar ~= nil then
			altar:OpenAltar()
		end
	end
end

function ControllerStoryMode:IsSaveEnd()
	local altar = self.scene:GetAltar(self.saveId)

	if altar ~= nil then
		return altar:IsAnimatorEnd()
	end

	return true
end

function ControllerStoryMode:Dedicate()
	local altar = self.scene:GetAltar(self.saveId)

	if altar ~= nil then
		altar:Dedicate()
	end
end

function ControllerStoryMode:DoAlchemy()
	local altar = self.scene:GetAltar(self.saveId)

	if altar ~= nil then
		altar:DoAlchemy()
	end
end

function ControllerStoryMode:OpenSaveMenu()
	if self:IsStatus(ControllerStoryMode.Status.Normal) == false then
		return false
	end

	if self.saveId > 0 then
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.saveId == SceneBase.AltarForNextStageId then
			UIManager.SendMessage("PlayerInfo", "OpenPlayerInfoEditor", true)
		else
			UIManager.SendMessage("PlayerInfo", "OpenPlayerInfoEditor")
		end

		local altar = self.scene:GetAltar(self.saveId)

		if altar ~= nil then
			altar:ChangeOpenVfx()
		end

		local saveData = self.scene:GetSaveData(self.saveId)

		if saveData ~= nil and saveData["CameraPosition1" .. ControllerModeBase.CameraScreenRatioKey] ~= nil and saveData["CameraRotation1" .. ControllerModeBase.CameraScreenRatioKey] ~= nil then
			self:StartSceneCamera(MS_SceneData.LocatorType.Save, self.saveId, 1)
		end

		self:ChangeStatus(ControllerStoryMode.Status.Menu)
		self:Save(ControllerStoryMode.SaveType.SavePoint)

		return true
	end

	return false
end

function ControllerStoryMode:CloseSaveMenu()
	self.sceneController:HeroAttribUpdate(false)
	self.cameraScene:SetLayerMask(CameraMain.CameraLayerMask)
	self:ChangeStatus(ControllerStoryMode.Status.Normal)
	self:ExitSceneCamera()
	self:Save(ControllerStoryMode.SaveType.SavePoint)
	UIManager.SendMessage("Dialog", "ResetWhisperTime")
end

function ControllerStoryMode:SaveProperty()
	local heroNum = FS_UserData.story:GetSelectHeroNum()

	for i = 1, heroNum do
		local heroId = FS_UserData.story:GetSelectHeroId(i)
		local tmpHero = self.sceneController:GetHostPlayerById(heroId)

		if tmpHero ~= nil then
			tmpHero:SaveProperty()
		end
	end

	if self.callHero ~= nil then
		self.callHero:SaveProperty()
	end
end

function ControllerStoryMode:Save(type)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		return
	end

	local locationId = self.storyId

	if self.storyId == MS_StoryData.StoryId10011 and not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		if type == ControllerStoryMode.SaveType.SaveAuto then
			FS_UserData.story:SetSaveStoryData(self.storyId, self.areaId, self.pattern)
		elseif type == ControllerStoryMode.SaveType.SavePoint then
			locationId = MS_StoryData.StoryId10011 - 1

			FS_UserData.story:SetSaveStoryData(MS_StoryData.StoryId10011 - 1, 1, 0)
		else
			return false
		end
	end

	SystemHelper.LogTest("================Save=========type=" .. type .. ",self.storyId=" .. self.storyId)

	if type == ControllerStoryMode.SaveType.SaveAuto then
		-- block empty
	elseif type == ControllerStoryMode.SaveType.SaveAutoTime then
		local tmpPos = self.hostPlayer:GetRebornPosition()
		local tmpLook = self.hostPlayer:GetRebornLook()

		FS_UserData.story:SetBornPosAndLook(tmpPos, tmpLook, true)
	elseif type == ControllerStoryMode.SaveType.SavePoint then
		local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornSave + self.saveId)

		if locatorData ~= nil then
			if self.storyId ~= MS_StoryData.StoryId10011 or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				FS_UserData.story:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, true)
				FS_UserData.story:SetBornPosAndLook(locatorData.Position, locatorData.Orientation, true)
			else
				FS_UserData.story:SetRebornPosAndLook(locatorData.Position, locatorData.Orientation, false)
			end
		end
	elseif type == ControllerStoryMode.SaveType.SaveReborn then
		if self.storyId ~= MS_StoryData.StoryId10011 or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			FS_UserData.story:SetRebornPosAndLook(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), true)
			FS_UserData.story:SetBornPosAndLook(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), true)
		else
			FS_UserData.story:SetRebornPosAndLook(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), false)
			FS_UserData.story:SetBornPosAndLook(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), false)
		end
	elseif type == ControllerStoryMode.SaveType.SaveExit then
		if self.storyId ~= MS_StoryData.StoryId10011 or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			FS_UserData.story:SetBornPosAndLook(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), true)
		end
	elseif type == ControllerStoryMode.SaveType.SaveSuspend then
		-- block empty
	elseif type == ControllerStoryMode.SaveType.SaveMenu then
		-- block empty
	end

	local altarLevel = FS_UserData.heroList:GetHero(FS_SaveStory.DefaultHeroId):GetLevel()

	FS_UserData.story:RecordStageTime(self.storyId, self.sceneController:GetHostPlayerHeroId())

	local playTime = FS_UserData.story:GetGameTime()
	local saveTime = os.time()
	local utcTime = TimeHelper.getUTC()
	local gameMode = FS_UserData.story:GetDifficulty()
	local roundCount = FS_UserData.story:GetLoop()

	if (self.storyId ~= MS_StoryData.StoryId10011 or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade)) and (type == ControllerStoryMode.SaveType.SaveAuto or type == ControllerStoryMode.SaveType.SaveAutoTime or type == ControllerStoryMode.SaveType.SavePoint or type == ControllerStoryMode.SaveType.SaveReborn or type == ControllerStoryMode.SaveType.SaveExit) then
		self:SaveProperty()

		if self.hostPlayer ~= nil then
			self.hostPlayer:SaveStatus()
		end
	end

	if type == ControllerStoryMode.SaveType.SavePoint then
		if not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			LS_Game.Update(false, "other", locationId, altarLevel, playTime, saveTime, utcTime, gameMode, roundCount)
		end

		LS_Achievement.Update()
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		if FS_UserData.story:IsQuestComplete(MS_StoryQuest.QuestArcadeStart) or FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
			local heroId = self.hostPlayer:GetHeroId()

			LS_Game.UpdateArcade(false, "other", locationId, heroId, playTime, saveTime, utcTime, gameMode, roundCount, FS_UserData.story.arcadeMode)
		end
	else
		LS_Autosave.Update(true, type, locationId, altarLevel, playTime, saveTime, utcTime, gameMode, roundCount)
	end

	if type == ControllerStoryMode.SaveType.SavePoint then
		local saveQuestList = MS_StorySave.GetStorySaveList(self.storyId, self.saveId)

		if saveQuestList ~= nil then
			for k, questData in pairs(saveQuestList) do
				if self:CheckShowQuestComplete(questData.ShowQuestId) == true and self:CheckHideQuestComplete(questData.HideQuestId) == false then
					local questStr = questData.CompleteQuestId

					self:CompleteQuest(questStr)
				end
			end
		end
	end

	return true
end

function ControllerStoryMode:CheckSceneMovie(isStart)
	if self:IsStatus(ControllerStoryMode.Status.Normal) == false then
		return false
	end

	if self.storyMovieAllList == nil then
		return false
	end

	if isStart == false and self.hostPlayer:IsMovieAndDialogueEnable() == false then
		return false
	end

	local hostPos = self.hostPlayer:GetPosByWorldPos()

	for id, movieData in pairs(self.storyMovieAllList) do
		if movieData ~= nil then
			local movieType = tonumber(movieData.Type)
			local posIndex = tonumber(movieData.Position)

			if movieType == MS_StoryMovie.Type.Quest and posIndex > 0 and self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
				local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Movie, posIndex)

				if locatorData ~= nil then
					local indexList = locatorData.MovieIndex

					for i = 1, #indexList do
						local tmpIndex = indexList[i]
						local dis = Vector3.DistanceSquare(locatorData["StartPosition" .. tmpIndex], hostPos)
						local radius = locatorData["StartRadius" .. tmpIndex]

						if dis < radius * radius then
							if AppVer ~= AppDemoCJReview and DebugSkipMovie == false then
								if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:GetStoryId() == FS_SaveStory.ArcadeStoryIdMax - 1000 and id == 1009 then
									self:CompleteQuest(movieData.CompleteQuestId)

									return true
								else
									local ret = self:EnterMovie(id, tmpIndex)

									if ret == true then
										return true
									end
								end
							else
								self:CompleteQuest(movieData.CompleteQuestId)

								return true
							end
						end
					end
				end
			end
		end
	end

	return false
end

function ControllerStoryMode:EnterMovie(id, posIndex)
	local ret = false

	if self.storyMovieAllList ~= nil then
		local movieData = self.storyMovieAllList[id]

		if movieData ~= nil then
			ret = self.controllerMovie:StartMovie(self.storyId, id)

			if ret == true then
				UIManager.SendMessage("Mainmenu", "ForceClosingShortcutItems")

				self.storyMovieIdNow = id
				self.storyMovieList[id] = 1
				self.storyMoviePosIndex = posIndex

				self:ChangeStatus(ControllerStoryMode.Status.Movie)

				if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
					self.bossChallengeTotalTime = self.bossChallengeTotalTime + ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime() - self.bossChallengeStartTime
				elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
					FS_UserData.story:SetIsInMovieTime(true)
					FS_UserData.story:RecordStartMovieTime()
				end
			end
		end
	end

	return ret
end

function ControllerStoryMode:ExitMovie()
	if self.storyMovieAllList ~= nil then
		local movieData = self.storyMovieAllList[self.storyMovieIdNow]

		if movieData ~= nil then
			local posIndex = movieData.Position

			if posIndex > 0 then
				local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Movie, posIndex)

				if locatorData ~= nil then
					local tmpIndex = 1

					if self.storyMoviePosIndex > 0 then
						tmpIndex = self.storyMoviePosIndex
					end

					local tmpPos = locatorData["EndPosition" .. tmpIndex]

					self.hostPlayer:SetPosByWorldPos(locatorData["EndPosition" .. tmpIndex], true)
					self.hostPlayer:LookAt(locatorData["EndOrientation" .. tmpIndex], true)
					self.hostPlayer:UpdatePositionLast()
				end
			end

			if movieData.Type == MS_StoryMovie.Type.BossShow then
				-- block empty
			elseif movieData.Type == MS_StoryMovie.Type.BossDead then
				if movieData.MonsterId ~= nil and movieData.MonsterId > 0 then
					if self.monsterTempDeleteList == nil then
						self.monsterTempDeleteList = {}
					end

					self.monsterTempDeleteList[movieData.MonsterId] = 1

					FS_UserData.story:AddMonsterDead(movieData.MonsterId)
				end
			elseif movieData.Type == MS_StoryMovie.Type.BossGradeUp then
				if self.storyMovieTarget ~= nil then
					local tmpPos = self.storyMovieTarget:GetRebornPosition()
					local tmpLook = self.storyMovieTarget:GetRebornLook()

					self.storyMovieTarget:SetPosByWorldPos(tmpPos, true)
					self.storyMovieTarget:LookAt(tmpLook, true)
					self.storyMovieTarget:AddGradeAfter(true)
					self.storyMovieTarget:UpdatePositionLast()
				end
			elseif movieData.Type == MS_StoryMovie.Type.CarriageCall then
				local skip = false

				if movieData.CompleteQuestId ~= "" and self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
					skip = true
				end

				if skip == false then
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.GoToCarriage, 0, 0)
				end

				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
			elseif movieData.Type == MS_StoryMovie.Type.CarriageArrive then
				self:Save(ControllerStoryMode.SaveType.SaveReborn)
				UIManager.SendMessage("Mainmenu", "ShowDestination", MS_SiteInfo.GetSite(self.storyId).Name)
			end
		end
	end

	if self:IsStatus(ControllerStoryMode.Status.Movie) == true then
		self:ChangeStatus(ControllerStoryMode.Status.Normal)
	end

	UIManager.SendMessage("Mainmenu", "ForceClosingShortcutItems")

	if self.storyMovieAllList ~= nil then
		local movieData = self.storyMovieAllList[self.storyMovieIdNow]

		if movieData ~= nil then
			if movieData.ToArea > 0 then
				self.sceneController:ChangeArea(movieData.ToArea, false)
			end

			if movieData.Type ~= MS_StoryMovie.Type.CarriageCall then
				self:CompleteQuest(movieData.CompleteQuestId)
			elseif self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
				self:CompleteQuest(movieData.CompleteQuestId)
			end

			SystemHelper.LogTest("==================ExitMovie=====================")
			self:CheckSceneDialog(false)
			self:CheckSceneMovie(false)
			self:CheckSceneTimeLine(false)
			self:UpdateZoneAndArea(true)
			self:UpdateAudio()

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
				self.bossChallengeStartTime = ST_Scene.GetCurrentElapsedTime() + ST_Scene.GetRecordedElapsedTime()
			elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				FS_UserData.story:RecordEndMovieTime(FS_UserData.story:GetStoryId(), self.hostPlayer:GetHeroId())
				FS_UserData.story:SetIsInMovieTime(false)
			end
		end
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:IsSelectStageGameOver() then
		if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
			UIManager.SendMessage("Mainmenu", "ShowArcadeResultAnim")
		elseif FS_UserData.story:GetStoryId() == FS_SaveStory.ArcadeStoryIdMax - 1000 then
			if self.storyMovieIdNow == 1015 then
				self:FinishArcade()
			else
				inputMgr:SetPointerLocked(false)
				UIManager.SendMessage("Mainmenu", "ShowArcadeResult")
				UIManager.SendMessage("Mainmenu", "ShowArcadeResultAnim")
				self:Save(ControllerStoryMode.SaveType.SaveAutoTime)
			end
		end
	end
end

function ControllerStoryMode:IsInMovie()
	if self.controllerMovie then
		return self.controllerMovie:IsPlaying()
	end

	return false
end

function ControllerStoryMode:IsInTimeLine()
	local isInStatus = self:IsStatus(ControllerStoryMode.Status.TimeLineMove) or self:IsStatus(ControllerStoryMode.Status.TimeLine)

	return isInStatus
end

function ControllerStoryMode:IsInDialog()
	local isInStatus = self:IsStatus(ControllerStoryMode.Status.Dialog)

	return isInStatus
end

function ControllerStoryMode:CompleteQuest(questStr)
	ControllerModeBase.CompleteQuest(self, questStr)
	self:CheckCreateSceneItem()
	self:CheckSceneWall()
	self:CheckSceneEffect()
end

function ControllerStoryMode:RevertCompleteQuest(questStr)
	ControllerModeBase.RevertCompleteQuest(self, questStr)
	self:CheckCreateSceneItem()
	self:CheckSceneWall()
	self:CheckSceneEffect()
end

function ControllerStoryMode:CompleteQuestEach(qId)
	local questData = MS_StoryQuest.GetQuestData(qId)

	if questData ~= nil then
		local questType = questData.QuestType
		local questCondition = questData.Condition
		local permit = true

		if DebugIgnoreCompleteQuestCondition then
			-- block empty
		elseif questType == ControllerStoryMode.QuestType.KillMonster then
			if questCondition ~= "" then
				local tmpConditionList = StringHelper.Split(questCondition, ";")

				for i, id in pairs(tmpConditionList) do
					id = tonumber(id)

					if id > 0 and FS_UserData.story:IsMonsterDead(id) == false then
						permit = false

						break
					end
				end
			end
		elseif questType == ControllerStoryMode.QuestType.CheckItem and questCondition ~= "" then
			local tmpConditionList = StringHelper.Split(questCondition, ";")

			for i, id in pairs(tmpConditionList) do
				local ret = StringHelper.Split(id, ",")

				if FS_UserData.itemList:GetItemNum(tonumber(ret[1])) < tonumber(ret[2]) and FS_UserData.itemList:GetUniqueTrophy(tonumber(ret[1])) == nil and FS_UserData.trophy:GetUniqueTrophyPos(tonumber(ret[1])) == nil then
					permit = false

					self:RevertCompleteQuestEach(qId)

					break
				end
			end
		end

		if permit == true then
			if qId == MS_StoryQuest.GameOverQuestId then
				self:OnCompleteOneGame()
			end

			local isComplete = FS_UserData.story:CompleteQuest(qId, questData.ExitGameNotSave)

			if isComplete then
				FS_UserData.playerBehavior:RecordDurationByQuest(qId)
				FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.QuestCompleteTime, qId, FS_UserData.story:GetGameTime())

				if questData.Achievement and questData.Achievement ~= "" then
					local achList = StringHelper.Split(questData.Achievement, ";")

					for _k, _v in pairs(achList) do
						local achievementData = MS_Achievement.GetAchievement(_v)

						if achievementData ~= nil then
							if achievementData.Type == MS_Achievement.AchievementType.Quest then
								self:RecordAchievement(achievementData.AchievementId, 1)
							else
								self:RecordAchievement(achievementData.AchievementId, 1, qId)
							end
						end
					end
				end
			end

			local questActionType = questData.ActionType
			local questAction = questData.Action
			local questActionList = StringHelper.Split(questAction, ";")

			if questActionType == ControllerStoryMode.QuestActionType.ChangeMonsterAI then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local tmpMonster = self:GetMonster(tonumber(tmpAction[1]))

						if tmpMonster ~= nil then
							tmpMonster:ChangeAIMode(tonumber(tmpAction[2]))
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.ItemToBag then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local tmpItemId = tonumber(tmpAction[1])
						local tmpItemNum = tonumber(tmpAction[2])

						self:AddBagItem(tmpItemId, tmpItemNum)
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.ChangeMonsterAnimator then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local tmpMonster = self:GetMonster(tonumber(tmpAction[1]))

						if tmpMonster ~= nil then
							tmpMonster:ChangeToSpecial(tonumber(tmpAction[2]))
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.DestroyMonster then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local monsterId = tonumber(questActionList[i])

						if self.monsterTempDeleteList == nil then
							self.monsterTempDeleteList = {}
						end

						self.monsterTempDeleteList[monsterId] = 1
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenDialog then
				if #questActionList > 0 then
					local tmpAction = StringHelper.Split(questActionList[1], ",")

					self.dialogIdNext = tonumber(tmpAction[1])
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenMovie then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local movieId = tonumber(questActionList[i])
						local movieData = MS_StoryMovie.GetMovieData(self.storyId, movieId)

						if movieData ~= nil and self:CheckShowQuestComplete(movieData.ShowQuestId) == true and self:CheckHideQuestComplete(movieData.HideQuestId) == false then
							self:EnterMovie(movieId, 1)

							break
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.EnterBossMode then
				if #questActionList > 0 then
					local bossId = tonumber(questActionList[1])

					self:EnterBossMode(bossId)

					self.bossRevertQuest = questData.RevertQuestId
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.ExitBossMode then
				self.bossRevertQuest = nil

				self:ExitBossMode()
			elseif questActionType == ControllerStoryMode.QuestActionType.EnableHero then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local heroId = tonumber(questActionList[i])

						if heroId > 0 and (heroId ~= 10005 or self:IsQuestAllComplete(MS_StoryQuest.DLCHeroJoinQuest)) then
							FS_UserData.story:SetHeroEnable(heroId, true)
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.DisableHero then
				if #questActionList > 0 then
					local changeId = 0

					for i = 1, #questActionList do
						local heroId = tonumber(questActionList[i])

						if heroId > 0 then
							FS_UserData.story:SetHeroEnable(heroId, false)

							if self.hostPlayer:GetHeroId() == heroId then
								changeId = FS_SaveStory.DefaultHeroId
							end
						end
					end

					if changeId > 0 then
						self.sceneController:SwitchHostPlayer(changeId, ControllerMain.SwitchType.Quest, false, self.rebornPropertyRateList)
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.SelectHero then
				if #questActionList > 0 then
					local heroId = tonumber(questActionList[1])

					if heroId > 0 then
						FS_UserData.story:ChangeSelectHeroId(heroId)

						if self.hostPlayer:GetHeroId() ~= FS_UserData.story:GetSelectHeroIdNow() then
							self.sceneController:SwitchHostPlayer(FS_UserData.story:GetSelectHeroIdNow(), ControllerMain.SwitchType.Quest, false, self.rebornPropertyRateList)
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.AutoSave then
				if #questActionList > 0 then
					local param = tonumber(questActionList[1])

					if param > 0 then
						FS_UserData.story:SetBornPosAndLook(self.hostPlayer:GetPosByWorldPos(), self.hostPlayer:GetForward(), true)
					end

					self:Save(ControllerStoryMode.SaveType.SaveAuto)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.StoryLogicRule then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local logicType = tonumber(tmpAction[1])
						local logicParam = tonumber(tmpAction[2])

						if logicType > 0 then
							self.hostPlayer:SetStoryLogicRule(logicType, logicParam)
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenDoor then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local storyId = tonumber(tmpAction[1])
						local doorId = tonumber(tmpAction[2])

						FS_UserData.story:SetDoorStatus(doorId, Door.Status.Open, storyId)

						if storyId == self.storyId then
							local door = self.scene:GetDoor(doorId)

							if door ~= nil then
								local instantly = tonumber(tmpAction[3]) == 0
								local cameraId

								if tmpAction[4] then
									cameraId = tonumber(tmpAction[4])
								end

								if not instantly then
									if cameraId then
										self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, doorId, cameraId, 1, function()
											self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, doorId, cameraId, 2, nil, true)

											local doorTemp = self.scene:GetDoor(doorId)

											doorTemp:SetState(Door.Status.Open, instantly)
										end)
									else
										door:SetState(Door.Status.Open, instantly)
									end
								else
									door:SetState(Door.Status.Open, instantly)
								end
							end
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.CloseDoor then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local storyId = tonumber(tmpAction[1])
						local doorId = tonumber(tmpAction[2])

						FS_UserData.story:SetDoorStatus(doorId, Door.Status.Close, storyId)

						if storyId == self.storyId then
							local door = self.scene:GetDoor(doorId)

							if door ~= nil then
								local instantly = tonumber(tmpAction[3]) == 0
								local cameraId

								if tmpAction[4] then
									cameraId = tonumber(tmpAction[4])
								end

								if not instantly then
									if cameraId then
										self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, doorId, cameraId, 1, function()
											self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Door, doorId, cameraId, 2, nil, true)

											local doorTemp = self.scene:GetDoor(doorId)

											doorTemp:SetState(Door.Status.Open, instantly)
										end)
									else
										door:SetState(Door.Status.Close, instantly)
									end
								else
									door:SetState(Door.Status.Close, instantly)
								end
							end
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenBridge then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local storyId = tonumber(tmpAction[1])
						local bridgeId = tonumber(tmpAction[2])

						FS_UserData.story:SetBridgeStatus(bridgeId, Bridge.Status.Open, storyId)

						if storyId == self.storyId then
							local bridge = self.scene:GetBridge(bridgeId)

							if bridge ~= nil then
								local instantly = tonumber(tmpAction[3]) == 0

								bridge:SetState(Bridge.Status.Open, instantly)

								if not instantly then
									self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Bridge, bridgeId, 1, 1)
								end
							end
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.CloseBridge then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local storyId = tonumber(tmpAction[1])
						local bridgeId = tonumber(tmpAction[2])

						FS_UserData.story:SetBridgeStatus(bridgeId, Bridge.Status.Close, storyId)

						if storyId == self.storyId then
							local bridge = self.scene:GetBridge(bridgeId)

							if bridge ~= nil then
								local instantly = tonumber(tmpAction[3]) == 0

								bridge:SetState(Bridge.Status.Close, instantly)

								if not instantly then
									self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Bridge, bridgeId, 1, 1)
								end
							end
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.SetShortcut then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local index = tonumber(tmpAction[1])
						local itemId = tonumber(tmpAction[2])

						self:SetQuickList(index, itemId)
						self:SetQuickMenu(index)
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.EquipTrophy then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local index = tonumber(tmpAction[1])
						local trophyId = tonumber(tmpAction[2])
						local retTrophy = FS_UserData.itemList:GetUniqueTrophy(trophyId)

						if retTrophy ~= nil then
							FS_UserData.trophy:Equip(index, retTrophy)
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.ResetAttribute then
				self:ResetAllAttributePoints()
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenGate then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local storyId = tonumber(tmpAction[1])
						local gateId = tonumber(tmpAction[2])

						FS_UserData.story:SetGateStatus(gateId, Gate.Status.Open, storyId)

						if storyId == self.storyId then
							local gate = self.scene:GetGate(gateId)

							if gate ~= nil then
								local instantly = tonumber(tmpAction[3]) == 0

								gate:SetState(Gate.Status.Open, instantly)

								if not instantly then
									self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Gate, gateId, 1, 1)
								end
							end
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.CloseGate then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local storyId = tonumber(tmpAction[1])
						local gateId = tonumber(tmpAction[2])

						FS_UserData.story:SetGateStatus(gateId, Gate.Status.Close, storyId)

						if storyId == self.storyId then
							local gate = self.scene:GetGate(gateId)

							if gate ~= nil then
								local instantly = tonumber(tmpAction[3]) == 0

								gate:SetState(Gate.Status.Close, instantly)

								if not instantly then
									self:OpenLocatorCameraAnimator(MS_SceneData.LocatorType.Gate, gateId, 1, 1)
								end
							end
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.AddRage then
				if #questActionList > 0 then
					local rage = tonumber(questActionList[1])
					local hero = self.sceneController:GetHostPlayer()
					local heroValue = hero:GetValue()
					local oriRage = heroValue:GetProperty(MS_HeroData.Property.Rage)

					if oriRage < rage then
						heroValue:AddProperty(MS_HeroData.Property.Rage, rage - oriRage)
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenSystem then
				-- block empty
			elseif questActionType == ControllerStoryMode.QuestActionType.ShowMessageTask then
				self:ShowMessageTask(questAction)
			elseif questActionType == ControllerStoryMode.QuestActionType.DeleteItem then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpAction = StringHelper.Split(questActionList[i], ",")
						local tmpItemId = tonumber(tmpAction[1])
						local tmpItemNum = tonumber(tmpAction[2])
						local itemData = MS_ItemData.GetItemData(tmpItemId)

						if itemData.MainType == MS_ItemData.MainType.Trophy then
							self:DeleteTrophy(tmpItemId)
						else
							self:UseBagItem(tmpItemId, tmpItemNum)
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.GoToCarriage then
				if AppVer == AppAppleLight or AppVer == AppTapTapCloudDemo then
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.BackToTitle, 0, 0)
				elseif AppVer == AppTapTapEA then
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.BackToTitle, 0, 0)
				else
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.GoToCarriage, 0, 0)
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.GoToNextStage then
				if AppVer == AppAppleLight or AppVer == AppTapTapCloudDemo then
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.BackToTitle, 0, 0)
				elseif AppVer == AppTapTapEA then
					self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.BackToTitle, 0, 0)
				elseif #questActionList > 0 and questActionList[1] ~= "" then
					local tmpAction = StringHelper.Split(questActionList[1], ",")
					local storyId = tonumber(tmpAction[1])
					local portalId = tonumber(tmpAction[2])

					self:StartOff(FS_UserData.story:GetSecondaryHeroId(), storyId, portalId)
					UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.OpenTimeLine then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local tmpId = tonumber(questActionList[i])
						local timeLineData = MS_StoryTimeLine.GetStoryTimeLine(self.storyId, tmpId)

						if timeLineData ~= nil and self:CheckShowQuestComplete(timeLineData.ShowQuestId) == true and self:CheckHideQuestComplete(timeLineData.HideQuestId) == false then
							self.timeLineId = tmpId

							self:OpenTimeLine(false)

							break
						end
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.EnterSeriesStory then
				self.seriesStoryRevertQuest = questData.RevertQuestId
			elseif questActionType == ControllerStoryMode.QuestActionType.ExitSeriesStory then
				self.seriesStoryRevertQuest = nil
			elseif questActionType == ControllerStoryMode.QuestActionType.EnterStoryRule then
				if #questActionList > 0 then
					for i = 1, #questActionList do
						local rule = tonumber(questActionList[i])

						self:AddStoryRule(rule)
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.ExitStoryRule then
				local rule = 0

				if #questActionList > 0 then
					for i = 1, #questActionList do
						rule = tonumber(questActionList[i])

						self:ClearStoryRule(rule)
					end
				end

				if rule <= 0 then
					self:ClearStoryRule(rule)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.AchievementQuest then
				for k, v in pairs(questActionList) do
					self:RecordAchievement(tonumber(v), 1, qId)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.RecoveryHp then
				if self.hostPlayer ~= nil then
					self.hostPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Hp)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.RecoverySan then
				if self.hostPlayer ~= nil then
					self.hostPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.San)
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.GameOver then
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)
				self:RestartConfirm(questAction)
			elseif questActionType == ControllerStoryMode.QuestActionType.ShakeCamera then
				self.cameraScene:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateSkill5, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateSkill5)
				self.cameraScene:StartAnimator()
				AudioCtrl.SetObjectAudio("Object/scene/whale_bellow", nil, "")
			end

			if questData.SanAdd > 0 and self.hostPlayer ~= nil then
				local add = questData.SanAdd
				local tmpTalentSanAdd = self.sceneController:GetTalentValue(self.hostPlayer:GetAnimalId(), MS_HeroTalent.Type.SanEventAdd, 0, 0)

				if tmpTalentSanAdd > 0 then
					add = MathHelper.addValuePermil(add, tmpTalentSanAdd)
				end

				self.hostPlayer:GetValue():AddProperty(MS_HeroData.Property.San, add)
			end

			if questData.SanSub > 0 and self.hostPlayer ~= nil then
				self.hostPlayer:GetValue():SubProperty(MS_HeroData.Property.San, questData.SanSub)
			end

			if DebugBehaviorLog == true then
				LS_BehaviorLog.Log(LS_BehaviorLog.Type.CompleteQuest, qId, "")
			end

			return true
		end
	end

	return false
end

function ControllerStoryMode:RestartConfirm(questAction)
	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_GAMEOVER_TEXT, function()
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CONFIRM_RESTART_GAME, function()
			self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.Restart, 0, 0)
		end, function()
			self:RestartConfirm(questAction)
		end, false, GameText.UI_RESTART_GAME)
	end, function()
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CONFIRM_CONTINUE_GAME, function()
			self:CompleteQuest(questAction)
		end, function()
			self:RestartConfirm(questAction)
		end, false)
	end, false, GameText.UI_RESTART_GAME, GameText.UI_CONTINUE_TEXT)
end

function ControllerStoryMode:RevertCompleteQuestEach(qId)
	local questData = MS_StoryQuest.GetQuestData(qId)

	if questData ~= nil then
		local questType = questData.QuestType
		local questActionType = questData.ActionType
		local questAction = questData.Action
		local questActionList = StringHelper.Split(questAction, ";")

		FS_UserData.story:RevertQuest(qId)

		if questType == ControllerStoryMode.QuestType.TimeLimit and self.tutorialQuest[tostring(qId)] ~= nil then
			self.tutorialQuest[tostring(qId)] = nil
		end

		if questActionType > 0 then
			if questActionType == ControllerStoryMode.QuestActionType.EnableHero then
				if #questActionList > 0 then
					local changeId = 0

					for i = 1, #questActionList do
						local heroId = tonumber(questActionList[i])

						if heroId > 0 then
							FS_UserData.story:SetHeroEnable(heroId, false)

							if self.hostPlayer:GetHeroId() == heroId then
								changeId = FS_SaveStory.DefaultHeroId
							end
						end
					end

					if changeId > 0 then
						self.sceneController:SwitchHostPlayer(changeId, ControllerMain.SwitchType.Quest, false, self.rebornPropertyRateList)
					end
				end
			elseif questActionType == ControllerStoryMode.QuestActionType.DisableHero and #questActionList > 0 then
				for i = 1, #questActionList do
					local heroId = tonumber(questActionList[i])

					if heroId > 0 and (heroId ~= 10005 or self:IsQuestAllComplete(MS_StoryQuest.DLCHeroJoinQuest)) then
						FS_UserData.story:SetHeroEnable(heroId, true)
					end
				end
			end
		end

		return true
	end

	return false
end

function ControllerStoryMode:OnCompleteOneGame()
	if FS_UserData.heroList:GetHero(10001):GetLevel() == 1 then
		self:RecordAchievement(MS_Achievement.AchievementIdType.OnlyUseTalenceInOneGame, 1)
	end

	if FS_UserData.story:GetKillBossNotInSan() == 0 then
		self:RecordAchievement(MS_Achievement.AchievementIdType.KillAllBossInSanInOneGame, 1)
	end

	if FS_UserData.story:GetLoop() >= BattleData.GameLoopMax and FS_UserData.story:GetHadNoobItem() == false then
		self:RecordAchievement(MS_Achievement.AchievementIdType.CompleteFourTimesGameWithoutNoobItem, 1)
	end
end

function ControllerStoryMode:ShowMessageTask(uiQuestId)
	local uiQuestIdList = StringHelper.Split(uiQuestId, ";")

	for k, qId in pairs(uiQuestIdList) do
		local uiQuestData = MS_UIQuest.GetQuest(qId)

		if uiQuestData ~= nil and self:CheckShowQuestComplete(uiQuestData.ShowQuestId) then
			if self:IsQuestAllComplete(uiQuestData.CompleteQuestId) then
				self:ShowMessageTask(uiQuestData.NextQuestId)
			elseif uiQuestData.QuestType == MS_UIQuest.QuestType.MainTitle or uiQuestData.QuestType == MS_UIQuest.QuestType.MainGoal then
				UIManager.SendMessage("Mainmenu", "ShowMessageTask", MainmenuCtrl.TaskType.Mainplot, uiQuestData.Name)
			elseif uiQuestData.QuestType == MS_UIQuest.QuestType.BranchTitle or uiQuestData.QuestType == MS_UIQuest.QuestType.BranchGoal then
				UIManager.SendMessage("Mainmenu", "ShowMessageTask", MainmenuCtrl.TaskType.Subplot, uiQuestData.Name)
			end

			return
		end
	end
end

function ControllerStoryMode:IsPermitRageMax(heroId)
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true then
		local questId = MS_StoryTutorial.GetOpenRageQuestId(heroId)

		if questId > 0 then
			if FS_UserData.story:IsQuestComplete(questId) == true then
				return true
			else
				return false
			end
		end
	end

	return true
end

function ControllerStoryMode:OpenSpecialTutorial(tutorialId)
	local tutorialData = MS_StoryTutorial.GetTutorialData(tutorialId)
	local ret = self:IsQuestAllComplete(tutorialData.CompleteQuestId)

	if not ret then
		if AppVer == AppAppleLight then
			self:CompleteQuest(tutorialData.CompleteQuestId)

			return
		end

		if LS_Setting.isJoystickConnected then
			UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", tutorialData.Title, tutorialData.DescriptionJoystick, function()
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end, tutorialData.ImageId, tutorialData.HeroId, tutorialData.TutorialId, true)
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", tutorialData.Title, tutorialData.DescriptionTouch, function()
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end, tutorialData.ImageId, tutorialData.HeroId, tutorialData.TutorialId, true)
		end
	end
end

function ControllerStoryMode:CheckTutorial()
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == false or self.sceneController:IsInMenu() or self:IsStatus(ControllerStoryMode.Status.Movie) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		return
	end

	local showTutorial = false
	local nowTime = TimeHelper.getNowTime()

	if self.tutorialQuestList ~= nil then
		for tutorialId, tutorialData in pairs(self.tutorialQuestList) do
			if tutorialData ~= nil and tutorialData.HeroId == self.hostPlayer:GetHeroId() and tutorialData.TutorialId ~= MS_StoryTutorial.GetDocumentId and (FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == false or FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) == false or tutorialId > 9100 and tutorialId < 9143) then
				if self:CheckShowQuestComplete(tutorialData.ShowQuestId) == true and self:CheckHideQuestComplete(tutorialData.HideQuestId) == false then
					if self.tutorialDelayList[tutorialData.TutorialId] == nil then
						self.tutorialDelayList[tutorialData.TutorialId] = nowTime + tutorialData.Delay
					end

					if nowTime >= self.tutorialDelayList[tutorialData.TutorialId] then
						if tutorialData.HideQuestId ~= "" then
							local questList = StringHelper.Split(tutorialData.HideQuestId, ";")

							for k, qId in pairs(questList) do
								if FS_UserData.story:IsQuestComplete(qId) == false then
									local ret = self:CheckTutorialCompleteQuest(tutorialId, qId, true)

									if ret == true then
										break
									end
								end
							end
						end

						if AppVer == AppAppleLight then
							self:CompleteQuest(tutorialData.CompleteQuestId)
						elseif tutorialData.IsPause == 1 then
							self.sceneController:EnterMenu(false, true)

							if LS_Setting.isJoystickConnected then
								UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", tutorialData.Title, tutorialData.DescriptionJoystick, function()
									self:CompleteQuest(tutorialData.CompleteQuestId)
									self.sceneController:ExitMenu()
									UIManager.SendMessage("Captured", "Show", false)
								end, tutorialData.ImageId, tutorialData.HeroId, tutorialData.TutorialId)
							else
								UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", tutorialData.Title, tutorialData.DescriptionTouch, function()
									self:CompleteQuest(tutorialData.CompleteQuestId)
									self.sceneController:ExitMenu()
									UIManager.SendMessage("Captured", "Show", false)
								end, tutorialData.ImageId, tutorialData.HeroId, tutorialData.TutorialId)
							end

							break
						else
							if tutorialData.IsCenter == 1 then
								if LS_Setting.isJoystickConnected then
									UIManager.SendMessage("Mainmenu", "ShowGuideMiddle", tutorialData.DescriptionJoystick)
								else
									UIManager.SendMessage("Mainmenu", "ShowGuideMiddle", tutorialData.DescriptionTouch)
								end
							else
								UIManager.SendMessage("Mainmenu", "AddTempGuide", tutorialData.TutorialId)
							end

							showTutorial = true
						end
					end
				elseif self:CheckShowQuestComplete(tutorialData.ShowQuestId) == false then
					self.tutorialDelayList[tutorialData.TutorialId] = nil

					if tutorialData.ShowQuestId ~= "" then
						local questList = StringHelper.Split(tutorialData.ShowQuestId, ";")

						for k, qId in pairs(questList) do
							if FS_UserData.story:IsQuestComplete(qId) == false then
								local questData = MS_StoryQuest.GetQuestData(qId)

								if questData ~= nil and (questData.QuestType == ControllerStoryMode.QuestType.MeetMonster or questData.QuestType == ControllerStoryMode.QuestType.HpLow or questData.QuestType == ControllerStoryMode.QuestType.Death or questData.QuestType == ControllerStoryMode.QuestType.RageEnough or questData.QuestType == ControllerStoryMode.QuestType.PowerEnough or questData.QuestType == ControllerStoryMode.QuestType.SanNotNormal or questData.QuestType == ControllerStoryMode.QuestType.SanCrazy or questData.QuestType == ControllerStoryMode.QuestType.InDarkForest) then
									self:CheckTutorialCompleteQuest(tutorialId, qId, false)
								end

								break
							end
						end
					end
				else
					self.tutorialDelayList[tutorialData.TutorialId] = nil
				end
			else
				self.tutorialDelayList[tutorialData.TutorialId] = nil
			end
		end
	end

	if showTutorial == false then
		UIManager.SendMessage("Mainmenu", "CloseTempGuide")
	end
end

function ControllerStoryMode:CheckTutorialCompleteQuest(tutorialId, qId, completeFlg)
	local tutorialData = self.tutorialQuestList[tutorialId]
	local questData = MS_StoryQuest.GetQuestData(qId)

	if tutorialData == nil or questData == nil then
		return false
	end

	if questData.QuestType == ControllerStoryMode.QuestType.TimeLimit then
		local tmpTime = tonumber(questData.Condition)

		if self.tutorialQuest[qId] ~= nil then
			local nowTime = TimeHelper.getNowTime()

			if nowTime > self.tutorialQuest[qId] + tmpTime then
				self:CompleteQuest(qId)

				if completeFlg == true then
					self:CompleteQuest(tutorialData.CompleteQuestId)
				end

				return true
			end
		else
			self.tutorialQuest[qId] = TimeHelper.getNowTime()
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.SkillStartByCount then
		local tmpStr1List = StringHelper.Split(questData.Condition, ";")

		for p, tmpStr in pairs(tmpStr1List) do
			local tmpStr2List = StringHelper.Split(tmpStr, ",")
			local tmpHeroId = tonumber(tmpStr2List[1])
			local tmpSkillIndex = tonumber(tmpStr2List[2])
			local tmpSkillCombo = tonumber(tmpStr2List[3])
			local tmpCount = tonumber(tmpStr2List[4])
			local tmpRecordSkillType = tonumber(tmpStr2List[5])

			if self.tutorialQuest[qId] ~= nil then
				if self:IsHaveHeroSkillLog(tmpHeroId, tmpRecordSkillType, tmpSkillIndex, tmpSkillCombo) == true then
					self:ClearHeroSkillLog()

					self.tutorialQuest[qId] = self.tutorialQuest[qId] + 1

					if tmpCount <= self.tutorialQuest[qId] then
						self:CompleteQuest(qId)

						if completeFlg == true then
							self:CompleteQuest(tutorialData.CompleteQuestId)
						end

						return true
					end
				end
			else
				self.tutorialQuest[qId] = 0
			end
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.SkillStartByTime then
		local tmpStr1List = StringHelper.Split(questData.Condition, ";")

		for p, tmpStr in pairs(tmpStr1List) do
			local tmpStr2List = StringHelper.Split(tmpStr, ",")
			local tmpHeroId = tonumber(tmpStr2List[1])
			local tmpSkillIndex = tonumber(tmpStr2List[2])
			local tmpSkillCombo = tonumber(tmpStr2List[3])
			local tmpTime = tonumber(tmpStr2List[4])
			local tmpRecordSkillType = tonumber(tmpStr2List[5])

			if self.tutorialQuest[qId] == nil then
				self.tutorialQuest[qId] = {
					false,
					TimeHelper.getNowTime()
				}
			end

			local tmpUseSkill = self.tutorialQuest[qId][1]
			local tmpStartTime = self.tutorialQuest[qId][2]

			if tmpUseSkill == false then
				if self:IsHaveHeroSkillLog(tmpHeroId, tmpRecordSkillType, tmpSkillIndex, tmpSkillCombo) == true then
					self:ClearHeroSkillLog()

					self.tutorialQuest[qId][1] = true
				end
			else
				local nowTime = TimeHelper.getNowTime()

				if nowTime > tmpStartTime + tmpTime then
					self:CompleteQuest(qId)

					if completeFlg == true then
						self:CompleteQuest(tutorialData.CompleteQuestId)
					end

					return true
				end
			end
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.MeetMonster then
		local permit = false
		local questCondition = questData.Condition

		if questCondition ~= "" then
			local tmpConditionList = StringHelper.Split(questCondition, ";")

			for i, storyMonsterId in pairs(tmpConditionList) do
				storyMonsterId = tonumber(storyMonsterId)

				if storyMonsterId > 0 then
					local enemy

					if self.hostPlayer:IsLockingPlayer() == true then
						enemy = self.hostPlayer:GetLockPlayer()

						if enemy ~= nil and enemy:GetStoryMonsterId() == storyMonsterId then
							permit = true

							break
						end
					end

					enemy = self.sceneController:FindPlayerByStoryMonsterId(storyMonsterId)

					if enemy ~= nil then
						local tmpAnimal, forceLock = self.hostPlayer:CheckLockPlayer(enemy, false)

						if tmpAnimal ~= nil then
							permit = true

							break
						end
					end
				end
			end
		elseif self.hostPlayer:IsLockingPlayer() == true or self.sceneController:CheckHaveLockPlayer() then
			permit = true
		end

		if permit == true then
			self:CompleteQuest(qId)

			if completeFlg == true then
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end

			return true
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.RageMax then
		if self.hostPlayer:GetValue():IsPropertyMax(MS_HeroData.Property.Rage) == true then
			self:CompleteQuest(qId)

			if completeFlg == true then
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end

			return true
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.HpLow then
		if self:IsLockedByEnemy() == false and self.hostPlayer:IsLockingPlayer() == false and self.hostPlayer:IsWillDead() == false then
			local hpNow = self.hostPlayer:GetValue():GetProperty(MS_HeroData.Property.Hp)
			local hpMax = self.hostPlayer:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)

			if hpNow < hpMax / 2 then
				self:CompleteQuest(qId)

				if completeFlg == true then
					self:CompleteQuest(tutorialData.CompleteQuestId)
				end

				return true
			end
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.RageEnough then
		if self.hostPlayer:GetHeroId() == tutorialData.HeroId and self:IsLockedByEnemy() == false and self.hostPlayer:IsLockingPlayer() == false and self.hostPlayer:IsWillDead() == false then
			local rageNow = self.hostPlayer:GetValue():GetProperty(MS_HeroData.Property.Rage)

			if rageNow > 30 then
				self:CompleteQuest(qId)

				if completeFlg == true then
					self:CompleteQuest(tutorialData.CompleteQuestId)
				end

				return true
			end
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.PowerEnough then
		if self.hostPlayer:GetHeroId() == tutorialData.HeroId and self:IsLockedByEnemy() == false and self.hostPlayer:IsLockingPlayer() == false and self.hostPlayer:IsWillDead() == false then
			local powerNow = self.hostPlayer:GetValue():GetProperty(MS_HeroData.Property.Hp)

			if powerNow > 40 then
				self:CompleteQuest(qId)

				if completeFlg == true then
					self:CompleteQuest(tutorialData.CompleteQuestId)
				end

				return true
			end
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.Death then
		if self.hostPlayer:IsDead() == true and self.hostPlayerDeadFinish == true then
			self:CompleteQuest(qId)

			if completeFlg == true then
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end

			return true
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.SanNotNormal then
		if self:IsLockedByEnemy() == false and self.hostPlayer:IsLockingPlayer() == false and self.hostPlayer:IsWillDead() == false and self.hostPlayer:IsHeroSanNotNormal(0) == true then
			self:CompleteQuest(qId)

			if completeFlg == true then
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end

			return true
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.SanCrazy then
		if self:IsLockedByEnemy() == false and self.hostPlayer:IsLockingPlayer() == false and self.hostPlayer:IsWillDead() == false and self.hostPlayer:IsHeroSanCrazy(0) == true then
			self:CompleteQuest(qId)

			if completeFlg == true then
				self:CompleteQuest(tutorialData.CompleteQuestId)
			end

			return true
		end
	elseif questData.QuestType == ControllerStoryMode.QuestType.InDarkForest and BattleData.IsDarkForestScene() == true then
		self:CompleteQuest(qId)

		if completeFlg == true then
			self:CompleteQuest(tutorialData.CompleteQuestId)
		end

		return true
	end

	return false
end

function ControllerStoryMode:CloseTutorial()
	UIManager.SendMessage("Mainmenu", "CloseTempGuide")

	self.tutorialTime = 0
end

function ControllerStoryMode:GetShadowPosition()
	if self:IsStatus(ControllerStoryMode.Status.Movie) == true then
		if self.controllerMovie ~= nil then
			return self.controllerMovie:GetShadowPosition()
		end
	elseif self:IsStatus(ControllerStoryMode.Status.TimeLine) == true then
		if self.timeLinePlayListControl ~= nil then
			local pos = self.timeLinePlayListControl:GetShadowPosition()

			if pos ~= nil then
				return pos
			end
		end
	elseif self:IsStatus(ControllerStoryMode.Status.Dialog) == true then
		return self.shadowPosition
	end

	if self.hostPlayer ~= nil then
		return self.hostPlayer:GetPosByWorldPos()
	end

	return nil
end

function ControllerStoryMode:GetShadowSize()
	if self:IsStatus(ControllerStoryMode.Status.Movie) == true then
		if self.controllerMovie ~= nil then
			return self.controllerMovie:GetShadowSize()
		end
	elseif self:IsStatus(ControllerStoryMode.Status.Dialog) == true then
		return self.shadowSize
	end

	return ControllerMain.CameraShadowSize
end

function ControllerStoryMode:UpdateUIBag()
	UIManager.SendMessage("PlayerInfo", "UpdateItemList", FS_UserData.itemList:GetItemList())
end

function ControllerStoryMode:UpdateUITrophy()
	UIManager.SendMessage("PlayerInfo", "UpdateTrophyList", FS_UserData.itemList:GetTrophyList())
end

function ControllerStoryMode:UpdateUIQuickMenu()
	local heroId = self.hostPlayer:GetHeroId()

	UIManager.SendMessage("PlayerInfo", "UpdateQuickList", self.quickMenuList[heroId])
end

function ControllerStoryMode:InitSceneMapData()
	local poiRaw = MS_SceneData.GetData(MS_SceneData.LocatorType.Map, ControllerStoryMode.SceneMapId)

	if poiRaw then
		local poi = {}

		poi.id = poiRaw.Id

		local pos = poiRaw.Position

		poi.x = pos.x
		poi.y = pos.y
		poi.z = pos.z

		local cams = {}

		poi.cameraCount = #poiRaw.CameraIndex

		for i = 1, poi.cameraCount do
			local cam = {}
			local rawPos = poiRaw["CameraPosition" .. i .. ControllerModeBase.CameraScreenRatioKey]
			local rawRot = poiRaw["CameraRotation" .. i .. ControllerModeBase.CameraScreenRatioKey]

			cam.x = rawPos.x
			cam.y = rawPos.y
			cam.z = rawPos.z
			cam.rx = rawRot.x
			cam.ry = rawRot.y
			cam.rz = rawRot.z
			cam.rw = rawRot.w
			cams[i] = cam
		end

		poi.camera = cams

		local stnds = {}

		poi.standCount = #poiRaw.StandIndex

		for i = 1, poi.standCount do
			local stnd = {}
			local rawPos = poiRaw["StandPosition" .. i]
			local rawRot = poiRaw["StandOrientation" .. i]

			stnd.x = rawPos.x
			stnd.y = rawPos.y
			stnd.z = rawPos.z
			stnd.rx = rawRot.x
			stnd.ry = rawRot.y
			stnd.rz = rawRot.z
			stnds[i] = stnd
		end

		poi.stand = stnds
		self.sceneMapData = poi
	end
end

function ControllerStoryMode:LoadHeroFromMap(posIdx, heroId)
	local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)

	if self.selectedCompanion ~= nil and self.selectedCompanion[posIdx] ~= nil then
		if self.selectedCompanion[posIdx]:GetHeroId() == heroIdSkin then
			return
		end

		self.selectedCompanion[posIdx]:Exit()

		self.selectedCompanion[posIdx] = nil
	end

	local goChar = self.loadCharacterManager:LoadCharacter(heroIdSkin, LoadCharacterManager.LoadType.UI)

	if goChar then
		goChar.name = "Selected" .. posIdx

		goChar.gameObject:SetActive(true)

		local selectedHero = AnimalLobby:new(heroIdSkin, goChar.transform, LayerMovie, 1)

		if selectedHero then
			local poi = self.sceneMapData

			if poi then
				local stands = poi.stand
				local stand = stands[posIdx]

				if stand then
					selectedHero:LookAt(Vector3.New(stand.rx, stand.ry, stand.rz))
					selectedHero:SetPosition(Vector3.New(stand.x, stand.y, stand.z))
					selectedHero:SitDown()
				end
			end

			if self.selectedCompanion == nil then
				self.selectedCompanion = {}
			end

			self.selectedCompanion[posIdx] = selectedHero
		else
			GoDestroy(goChar)

			goChar = nil
		end
	end
end

function ControllerStoryMode:LoadHeroInMaze(posIdx, heroId, pos, lookat)
	if self.mazeHero == nil then
		self.mazeHero = {}
	end

	SystemHelper.LogTest("LoadHeroInMaze....................." .. posIdx .. ", " .. heroId)

	local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)

	if self.mazeHero ~= nil and self.mazeHero[posIdx] ~= nil then
		if self.mazeHero[posIdx]:GetHeroId() == heroIdSkin then
			SystemHelper.LogTest("aaaa....................." .. heroId)

			return
		end

		SystemHelper.LogTest("Exit....................." .. heroIdSkin)
		self.mazeHero[posIdx]:Exit()

		self.mazeHero[posIdx] = nil
	end

	local goChar = self.loadCharacterManager:LoadCharacter(heroIdSkin, LoadCharacterManager.LoadType.UI)

	if goChar then
		goChar.name = "HeroMaze"

		goChar.gameObject:SetActive(true)

		local tempHeroId = BattleData.ConvertHeroIdWithoutSkin(heroIdSkin)
		local data = MS_HeroData.GetHero(tempHeroId)
		local hero = AnimalLobby:new(heroIdSkin, goChar.transform, LayerMovie, data.UIScale)

		if hero then
			hero:LookAt(lookat)
			hero:SetPosition(pos)
			hero:Stand()

			self.mazeHero[posIdx] = hero
			self.mazeHero[posIdx].heroId = heroId
		else
			SystemHelper.Log("GoDestroy....................." .. heroId)
			GoDestroy(goChar)

			goChar = nil
		end
	end
end

function ControllerStoryMode:ExitHeroMaze()
	if self.mazeHero ~= nil then
		for _, hero in pairs(self.mazeHero) do
			if hero ~= nil then
				hero:Exit()
			end
		end
	end

	self.mazeHero = nil
end

function ControllerStoryMode:LoadHeroWear(heroId, pos, lookat)
	if self.wearHero ~= nil then
		if self.wearHero:GetHeroId() == heroId then
			return
		end

		self.wearHero:Exit()

		self.wearHero = nil
	end

	local goChar = self.loadCharacterManager:LoadCharacter(heroId, LoadCharacterManager.LoadType.UI)

	if goChar then
		goChar.name = "HeroWeared"

		goChar.gameObject:SetActive(true)

		local tempHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

		AudioCtrl.SetHeroAudio("hero" .. tempHeroId .. "/idle", nil, "")

		local data = MS_HeroData.GetHero(tempHeroId)

		self.wearHero = AnimalLobby:new(heroId, goChar.transform, LayerMovie, data.UIScale)

		if self.wearHero then
			self.wearHero:LookAt(lookat)
			self.wearHero:SetPosition(pos)
			self.wearHero:Stand()

			self.wearHeroId = heroId
		else
			GoDestroy(goChar)

			goChar = nil
		end
	end
end

function ControllerStoryMode:EnterHeroWear()
	self.sceneController:SetCameraLayerMaskToMovie(true)
end

function ControllerStoryMode:ExitHeroWear()
	if self.wearHero ~= nil then
		self.wearHero:Exit()

		self.wearHero = nil
	end

	self.sceneController:UpdateSkin()
	self.sceneController:SetCameraLayerMaskToMovie(false)
end

function ControllerStoryMode:RotatePlayer(data, isJoystick, fps)
	if fps == nil then
		fps = tonumber(LS_Setting.FrameRate[LS_Setting.graphics.framerate])

		if fps == -1 then
			fps = 144
		end
	end

	if isJoystick then
		local rate = MathHelper.getValueInRadioRange(LS_Setting.sensitivity * 2, 0, 200, 0, 120)

		rate = rate / fps

		self.wearHero:RotateY(rate * data)
	else
		if self.wearHero == nil then
			return
		end

		local angle = data.delta.x + 0.5 * data.delta.y

		self.wearHero:RotateY(-angle)
	end
end

function ControllerStoryMode:StartOff(heroId, storyId, portalId)
	if self.sceneController ~= nil then
		if heroId > 0 and heroId ~= 10001 then
			BattleData.SetHeroId(heroId)
		end

		self.sceneController:ChangeNextSubState(ControllerMain.MoveStep.GoToNextStage, storyId, portalId)
	end
end

function ControllerStoryMode:TransferReady()
	if self.hostPlayer:IsEventEnable() == true and self:IsBossMode() == false and self.seriesStoryRevertQuest == nil then
		self.transferPortId = 0

		if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self.transferPortId = 1

			return true
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			self.transferPortId = 99

			return true
		else
			local portList = MS_SiteInfo.GetStoryPortalList(self.storyId)

			if portList ~= nil then
				local disMin = 9999999
				local nowPos = self.hostPlayer:GetPosByWorldPos()
				local selectPortId = 0

				for i, portalData in pairs(portList) do
					local portalId = portalData.PortalId

					if self:CheckShowQuestComplete(portalData.ShowQuestId) == true and self:CheckHideQuestComplete(portalData.HideQuestId) == false then
						local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornHost, ControllerMain.LocatorBornUnit + ControllerMain.LocatorBornCarriage + portalId)

						if locatorData ~= nil then
							local tmpDis = Vector3.DistanceSquare(nowPos, locatorData.Position)

							if tmpDis < disMin then
								selectPortId = portalData.PortalId
								disMin = tmpDis
							end
						end
					end
				end

				if selectPortId > 0 then
					self.transferPortId = selectPortId

					return true
				end
			end
		end
	end

	return false
end

function ControllerStoryMode:TransferStart(itemId)
	self.transferItemId = itemId
end

function ControllerStoryMode:Transfer()
	if self.transferPortId > 0 then
		self.transferUse = true

		if self.transferItemId == MS_ItemData.TeleportUseExpItem then
			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				-- block empty
			else
				self:HostPlayerDeadDrop()
			end
		elseif self.transferItemId == MS_ItemData.TeleportUseSelf then
			self:UseBagItem(self.transferItemId, 1)
		end

		if MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self:OnMenuReborn()
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			self.sceneController:Transfer(self.transferPortId, FS_UserData.story:GetRebornAreaId())
		else
			local carriageData = MS_StoryCarriage.GetStoryCarriageData(self.storyId, self.transferPortId)

			if carriageData ~= nil then
				self.sceneController:Transfer(self.transferPortId, carriageData.AreaId)
			end
		end

		self.transferItemId = 0
	end
end

function ControllerStoryMode:BeginChoosingHero(defCompanionHeroId)
	local player = self.sceneController:GetHostPlayer()

	if player then
		self:LoadHeroFromMap(1, player:GetHeroId())
		AudioCtrl.SetUIAudio("pick_carriage")
	end

	local poi = self.sceneMapData
	local stands = poi.stand

	for posIdx = 1, ControllerStoryMode.HeroSelPos.HeroSelMax do
		local stand = stands[posIdx]
		local hero = self.selectedCompanion[posIdx]

		if hero then
			hero:LookAt(Vector3.New(stand.rx, stand.ry, stand.rz))
			hero:SetPosition(Vector3.New(stand.x, stand.y, stand.z))
		end
	end

	self:StartSceneCamera(MS_SceneData.LocatorType.Map, ControllerStoryMode.SceneMapId, 2)
	self.sceneController:SetCameraLayerMaskToMovie(true)
end

function ControllerStoryMode:ExitChoosingHero()
	self.sceneController:SetCameraLayerMaskToMovie(false)
	self:ExitSceneCamera()

	if self.selectedCompanion ~= nil then
		for _, hero in pairs(self.selectedCompanion) do
			if hero ~= nil then
				hero:Exit()
			end
		end
	end

	self.selectedCompanion = nil
end

function ControllerStoryMode:CheckMap()
	local showFlg = false

	if self.hostPlayer:IsEventEnable() == true then
		local nowPos = self.hostPlayer:GetPosByWorldPos()

		for mapId, locatorData in pairs(self.mapList) do
			local dis = Vector3.DistanceSquare(nowPos, locatorData.Position)

			if dis < SceneDefine.IconDistanceForMap * SceneDefine.IconDistanceForMap then
				local tmpPos = locatorData.Position

				self:ShowIcon(MS_SceneData.LocatorType.Map, mapId, 0, tmpPos.x, tmpPos.y + SceneDefine.IconHeightForMap, tmpPos.z)
			end

			if dis < SceneDefine.DistanceForMap * SceneDefine.DistanceForMap then
				showFlg = true
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.ViewMap, showFlg)
end

function ControllerStoryMode:OpenMapReady()
	UIManager.SendMessage("Mainmenu", "SetInteractive", false)
	self:ChangeStatus(ControllerStoryMode.Status.MapReady)

	local mapData = MS_SceneData.GetData(MS_SceneData.LocatorType.Map, ControllerStoryMode.SceneMapId)

	if mapData ~= nil then
		UIManager.MovieMode(true)
		UIManager.SendMessage("Mainmenu", "ShowActionButtons", false)
		self.cameraScene:SetMode(CameraMain.ModeType.Menu)

		local rotOld = self.cameraScene:GetCameraRotation()
		local rotNew = mapData["CameraRotation1" .. ControllerModeBase.CameraScreenRatioKey]
		local posOld = self.cameraScene:GetCameraLogicPosition()
		local posNew = mapData["CameraPosition1" .. ControllerModeBase.CameraScreenRatioKey]
		local angle = Quaternion.Angle(rotOld, rotNew)
		local dis = Vector3.Distance(posOld, posNew)
		local timeRot = MathHelper.getValueInRadioRange(angle, SceneDefine.OpenMapAngleMin, SceneDefine.OpenMapAngleMax, SceneDefine.OpenMapTimeMin, SceneDefine.OpenMapAngleTimeMax)
		local timeDis = MathHelper.getValueInRadioRange(dis, SceneDefine.OpenMapDisMin, SceneDefine.OpenMapDisMax, SceneDefine.OpenMapTimeMin, SceneDefine.OpenMapDisTimeMax)

		self.cameraScene:MoveTo(mapData["CameraPosition1" .. ControllerModeBase.CameraScreenRatioKey], mapData["CameraRotation1" .. ControllerModeBase.CameraScreenRatioKey], Mathf.Max(timeRot, timeDis))
		self.cameraScene:StartAnimator()
	end
end

function ControllerStoryMode:OpenMap()
	self:ChangeStatus(ControllerStoryMode.Status.MapOpen)

	local mapData = MS_SceneData.GetData(MS_SceneData.LocatorType.Map, ControllerStoryMode.SceneMapId)

	if mapData ~= nil then
		self.cameraScene:SetMode(CameraMain.ModeType.Menu)
		self.cameraScene:SetAnimatorTemplate(mapData["CameraAnimator1_1" .. ControllerModeBase.CameraScreenRatioKey], false, CameraBase.AnimatorPurpose.Other, nil)
		self.cameraScene:StartAnimator()
		AudioCtrl.DepressOrRiseAudio(true)
		AudioCtrl.SetUIAudio("map_show")
	end
end

function ControllerStoryMode:CloseMap()
	self.cameraScene:SetMode(CameraMain.ModeType.Following)
	self.cameraScene:ResetFollowingBase()
	self.cameraScene:SetAnimatorBack()
	self:ChangeStatus(ControllerStoryMode.Status.Normal)
	AudioCtrl.DepressOrRiseAudio(false)
	UIManager.SendMessage("Mainmenu", "SetInteractive", true)
end

function ControllerStoryMode:ShowIcon(type, id, index, x, y, z)
	local ret, pos = self:IsIconVisible(type, id, index, x, y, z)

	if ret == true and pos ~= nil then
		UIManager.SendMessage("Mainmenu", "SetPoi", type, id, index, pos)
	end
end

function ControllerStoryMode:ClearIconAll()
	UIManager.SendMessage("Mainmenu", "ResetPoi")
end

function ControllerStoryMode:IsIconVisible(type, id, index, x, y, z)
	if self.cameraScene == nil then
		return false, nil
	end

	local key = type * 1000 + id * 10 + index

	if self.iconVisible == nil then
		self.iconVisible = {}
	end

	local nowTime = TimeHelper.getNowTime()

	if self.iconVisible[key] ~= nil then
		if nowTime < self.iconVisible[key][1] then
			return self.iconVisible[key][2], self.iconVisible[key][3]
		end
	else
		self.iconVisible[key] = {
			0,
			false,
			Vector3.New(x, y, z)
		}
	end

	self.iconVisible[key][1] = nowTime + SceneDefine.IconUpdateIntervalTime

	local pos = self.iconVisible[key][3]
	local camPos = self.cameraScene:GetCameraRealPosition()
	local rayDirection = camPos - pos
	local camFoward = self.cameraScene:GetCameraRealForward()
	local dot = Vector3.Dot(rayDirection, camFoward)

	if dot <= 0 then
		local dis = rayDirection.magnitude

		rayDirection:SetNormalize()

		local ret = XPhysics.Raycast(pos.x, pos.y, pos.z, rayDirection.x, rayDirection.y, rayDirection.z, dis, GameAI.CheckIconInsightLayerMask)

		self.iconVisible[key][2] = not ret
	else
		self.iconVisible[key][2] = false
	end

	return self.iconVisible[key][2], pos
end

function ControllerStoryMode:IsCameraVisible(pos)
	local camPos = self.cameraScene:GetCameraRealPosition()
	local rayDirection = camPos - pos
	local dis = rayDirection.magnitude

	rayDirection:SetNormalize()

	local ret = XPhysics.Raycast(pos.x, pos.y, pos.z, rayDirection.x, rayDirection.y, rayDirection.z, dis, GameAI.CheckInsightLayerMask)

	return not ret
end

function ControllerStoryMode:IsHostPlayerVisible(pos)
	if self.hostPlayer ~= nil then
		local tmpPos = self.hostPlayer:GetGravityCenterPosition()
		local itemTmpPos = Vector3.New(pos.x, pos.y + 0.2, pos.z)
		local rayDirection = tmpPos - itemTmpPos
		local dis = rayDirection.magnitude

		rayDirection:SetNormalize()

		local ret = XPhysics.Raycast(itemTmpPos.x, itemTmpPos.y, itemTmpPos.z, rayDirection.x, rayDirection.y, rayDirection.z, dis, GameAI.CheckInsightLayerMask)

		itemTmpPos = nil
		rayDirection = nil

		return not ret
	end

	return false
end

function ControllerStoryMode:AddStoryRule(rule)
	if self.storyRuleParam == nil then
		self.storyRuleParam = {}
	end

	self.storyRuleParam[rule] = 1
end

function ControllerStoryMode:ClearStoryRule(rule)
	if rule == nil or rule <= 0 then
		self.storyRuleParam = nil
	elseif self.storyRuleParam ~= nil and self.storyRuleParam[rule] ~= nil then
		self.storyRuleParam[rule] = nil
	end
end

function ControllerStoryMode:IsHaveStoryRule(rule)
	if self.storyRuleParam ~= nil and self.storyRuleParam[rule] ~= nil then
		return true
	end

	return false
end

function ControllerStoryMode:GameResultSubmit()
	ControllerModeBase.GameResultSubmit(self)
	ControllerStoryMode.GameResult(nil)
end

function ControllerStoryMode.GameResult(buffer)
	UIManager.CreateCtrl("BattleResult")
end

function ControllerStoryMode:Update()
	ControllerModeBase.Update(self)
	self:UpdateStatus()
end

function ControllerStoryMode:UpdateLoadArea()
	ControllerModeBase.UpdateLoadArea(self)

	if self:IsStatus(ControllerStoryMode.Status.TimeLine) or self:IsStatus(ControllerStoryMode.Status.TimeLineLoadScene) or self:IsStatus(ControllerStoryMode.Status.TimeLineSwitchScene) then
		self:UpdateStatus()
	else
		SystemHelper.LogError("===UpdateLoadArea=111111=self.status=" .. self.status)
	end
end

function ControllerStoryMode:LateUpdate()
	self:UpdateAttachItem()
end

function ControllerStoryMode:UpdateAttachItem()
	if self.sceneController and not self.sceneController:IsInMenu() then
		local toExitAttItemList

		for k, v in pairs(self.storySceneAttachItemList) do
			if v:GetIsComplete() then
				if toExitAttItemList == nil then
					toExitAttItemList = {}
				end

				table.insert(toExitAttItemList, v)
			else
				v:Update()
			end
		end

		if toExitAttItemList ~= nil then
			for k, v in pairs(toExitAttItemList) do
				table.removeValue(self.storySceneAttachItemList, v)
				v:Exit()
			end

			toExitAttItemList = nil
		end
	end
end

function ControllerStoryMode.OnUpdateBagItem(buffer)
	SystemHelper.Log("---------->> OnUpdateBagItem")
	NI_Bag.ParseUpdateBagItem(buffer)
end

function ControllerStoryMode.OnAddBagItem(buffer)
	SystemHelper.Log("---------->> OnAddBagItem")
	NI_Bag.ParseAddBagItem(buffer)
end

function ControllerStoryMode.OnRemoveBagItem(buffer)
	SystemHelper.Log("---------->> OnRemoveBagItem")
	NI_Bag.ParseRemoveBagItem(buffer)
end

function ControllerStoryMode.OnBagIsFull(buffer)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_BagIsFull)
end

function ControllerStoryMode.OnBagItemNotFound(buffer)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_BagItemNotFound)
end

function ControllerStoryMode.OnBagItemConfigNotFound(buffer)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_BagItemConfigNotFound)
end

function ControllerStoryMode.OnBagItemNotEnough(buffer)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_BagItemNotEnough)
end

return ControllerStoryMode
