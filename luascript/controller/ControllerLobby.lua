-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerLobby.lua

require("LuaScript/Controller/ControllerBase")
require("LuaScript/Logic/Scene/SceneLobby")
require("LuaScript/Logic/Player/AnimalLobby")
require("LuaScript/Logic/Camera/CameraLobby")
require("LuaScript/Network/NI_BattleLogin")
require("LuaScript/Network/NI_BattleRoom")
require("LuaScript/StructData/FS_Battle_CommonResponse")
require("LuaScript/StructData/FS_Battle_MatchGame")
require("LuaScript/StructData/FS_Battle_MatchRoom")
require("LuaScript/SDK/SdkHelper")

ControllerLobby = class("ControllerLobby", ControllerBase)
ControllerLobby.static.BeginMatchTimeout = 5
ControllerLobby.static.ScreenIdleTime = 20
ControllerLobby.static.DynamicBoneGroupEnabledDelay = 2
ControllerLobby.static.SelectHeroCacheMax = 3
ControllerLobby.LoadStep = {
	LoadCharacter = 7,
	LoadSceneWait = 3,
	LoadCharacterAnimator = 5,
	LoadCharacterAnimatorWait = 6,
	LoadWaitUI = 10,
	LoadUI = 9,
	LoadLogin = 11,
	LoadWaitLogin = 12,
	LoadWait = 1,
	LoadScene = 2,
	LoadFinish = 13,
	LoadCharacterWait = 8,
	LoadCamera = 4,
	Empty = 0
}
ControllerLobby.static.LoadProgressStep = {
	{
		ControllerLobby.LoadStep.LoadScene,
		10
	},
	{
		ControllerLobby.LoadStep.LoadCamera,
		1
	},
	{
		ControllerLobby.LoadStep.LoadCharacterAnimator,
		4
	},
	{
		ControllerLobby.LoadStep.LoadCharacter,
		10
	},
	{
		ControllerLobby.LoadStep.LoadUI,
		5
	}
}
ControllerLobby.SceneStatus = {
	StartBattle = 3,
	PressStart = 1,
	Choose = 5,
	Main = 2,
	Pvp = 4,
	SinglePlayer = 6,
	Empty = 0
}
ControllerLobby.StateType = {
	BattleUdpCreate = 5,
	Load = 0,
	BattleMatchRoom = 3,
	WaitLogin = 1,
	BattleJoinGame = 8,
	BattleSceneChange = 12,
	BattleReady = 11,
	BattleJoinGameConfirm = 9,
	BattleMatchRoomWait = 4,
	BattleUdpPing = 7,
	BattleUdpLogin = 6,
	Menu = 2,
	BattleChooseHero = 10
}
ControllerLobby.static.LobbyShowHero = {
	10001,
	10002,
	10004
}
ControllerLobby.Step = {
	Out = 3,
	Show = 2,
	In = 1
}

function ControllerLobby:initialize()
	ControllerBase.initialize(self)

	local go = GoFind("CharacterRoot")

	self.tfCharacterRoot = go.transform

	local go = GoCreate("ChooseHeroRoot")

	self.tfChooseHeroRoot = go.transform
	self.scene = nil
	self.inRoomNow = false
	self.movieObj = nil
	self.arObj = nil
	self.ARController = nil
	self.loadStep = ControllerLobby.LoadStep.Empty
	self.heroLoadFinish = true
	self.heroLoadFinishDelay = 0
	self.sceneStatus = 0
	self.nextSceneStatus = 0
	self.stateType = 0
	self.lobbyMainCtrl = nil
	self.matchTime = 0
	self.waitTime = 0
	self.readyWait = 0
	self.lobbyShowHeroIndex = 0
	self.lobbyShowHeroList = {}
	self.lobbyShowHeroAnimatorList = {}
	self.heroList = {}
	self.heroAnimatorList = {}
	self.heroMaxList = {}
	self.openStep = 0
	self.challengeMode = MS_StoryChallenge.ChallengeMode.Normal

	SystemHelper.LogTest("=============SdkHelper.InitSdk===================")
	self:initializeStep2()
end

function ControllerLobby:initializeStep2()
	self:ChangeState(ControllerLobby.StateType.Load)
	self:ExitRoom()

	self.sceneName = ""
	self.JPadTime = 0
	self.JPadDeltaTime = 0
	self.JPadInput = 0
	self.DPadInput = 0
	self.DPadTime = 0
	self.DPadDeltaTime = 0
	self.recordTime = 0
	self.idleTime = 0
	self.isInMovie = false
	self.readControllerInput = false

	SystemHelper.LogTest("################################ SDK是否初始化 " .. tostring(SdkHelper.IsInited()))
end

function ControllerLobby:Exit()
	self.sceneStatus = ControllerLobby.SceneStatus.Empty
	self.nextSceneStatus = ControllerLobby.SceneStatus.Empty
	self.openStep = 0
	self.tfCharacterRoot = nil
	self.tfChooseHeroRoot = nil
	self.hostPlayer = nil

	if self.scene ~= nil then
		self.scene:Exit()

		self.scene = nil
	end

	if self.movieObj ~= nil then
		GoDestroy(self.movieObj)
	end

	if self.arObj ~= nil then
		GoDestroy(self.arObj)
	end

	self.movieObj = nil
	self.ARController = nil
	self.arObj = nil
	self.lobbyMainCtrl = nil

	if self.lobbyShowHeroAnimatorList ~= nil then
		for _, animatorCtrl in pairs(self.lobbyShowHeroAnimatorList) do
			if animatorCtrl ~= nil then
				GoDestroyImmediate(animatorCtrl)
			end
		end
	end

	self.lobbyShowHeroAnimatorList = nil

	if self.lobbyShowHeroList ~= nil then
		for _, hero in pairs(self.lobbyShowHeroList) do
			if hero ~= nil then
				hero:Exit()
			end
		end
	end

	self.lobbyShowHeroList = nil

	if self.heroAnimatorList ~= nil then
		for _, animatorCtrl in pairs(self.heroAnimatorList) do
			if animatorCtrl ~= nil then
				GoDestroyImmediate(animatorCtrl)
			end
		end
	end

	self.heroAnimatorList = nil

	if self.heroList ~= nil then
		for _, hero in pairs(self.heroList) do
			if hero ~= nil then
				hero:Exit()
			end
		end
	end

	self.heroMaxList = nil
	self.heroList = nil

	UICtrlBase.CloseAndRelease("ChooseHero")
	UICtrlBase.CloseAndRelease("Arcade")
	UICtrlBase.CloseAndRelease("LobbyMain")
	UICtrlBase.CloseAndRelease("Login")
	ControllerBase.Exit(self)
end

function ControllerLobby:GetScene()
	return self.scene
end

function ControllerLobby:EnterLoad()
	self.isLoaded = false

	LoadProgress.Init(ControllerLobby.LoadProgressStep)

	self.loadStep = ControllerLobby.LoadStep.LoadScene
end

function ControllerLobby:UpdateLoad()
	if self.loadStep == ControllerLobby.LoadStep.LoadScene then
		self.sceneName = "UILobby"

		local function cbFun(name)
			SystemHelper.LogTest("###################loadStep=LoadScene==" .. name)
			loadMgr:SetFocusScene(name)

			local go = GoFind(name)

			go.transform.localScale = Vector3.one
			go.transform.localPosition = Vector3.zero
			self.scene = SceneLobby:new(go.transform, go.name)

			local goPostProcessing = GoFind("PostProcessing")

			if goPostProcessing ~= nil then
				self.scene:SetPostProcessing(goPostProcessing.transform)
			end

			self.loadStep = ControllerLobby.LoadStep.LoadCamera

			loadMgr:EndLoad()

			local tmpPackage = loadMgr:GetCurrentLoadName()

			LoadProgress.SetItemProgress(ControllerLobby.LoadStep.LoadScene, tmpPackage, 100)
			Common.ClearMemory()
		end

		local tmpPackage = ""

		if DebugUseSceneBuild == false then
			tmpPackage = "Scene/" .. self.sceneName

			loadMgr:LoadLevelAppendFromAssetBundle(tmpPackage, self.sceneName, true, cbFun)
		else
			tmpPackage = "Scenes/Common/" .. self.sceneName

			loadMgr:LoadLevelAppend(tmpPackage, self.sceneName, true, cbFun)
		end

		LoadProgress.CreateAndAddItem(ControllerLobby.LoadStep.LoadScene, tmpPackage, nil)

		self.loadStep = ControllerLobby.LoadStep.LoadSceneWait
	elseif self.loadStep == ControllerLobby.LoadStep.LoadSceneWait then
		local tmpPackage = loadMgr:GetCurrentLoadName()
		local progress = loadMgr:GetCurrentProgress()

		LoadProgress.SetItemProgress(ControllerLobby.LoadStep.LoadScene, tmpPackage, progress)
	elseif self.loadStep == ControllerLobby.LoadStep.LoadCamera then
		LoadProgress.CreateAndAddItem(ControllerLobby.LoadStep.LoadCamera, "LoadCamera", nil)

		local go_camera = GoFind("CameraMain")

		if go_camera ~= nil then
			local camera = CameraLobby:new(go_camera.transform, go_camera.transform)

			self:SetCameraCtrl(camera)

			if self.scene ~= nil then
				self.scene:SetBrightness(LS_Setting.graphics.brightness)

				if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Ultra then
					self.scene:SetPostProcessType(SceneBase.PostProcessType.MainSuper)
				elseif LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
					self.scene:SetPostProcessType(SceneBase.PostProcessType.MainPro)
				else
					self.scene:SetPostProcessType(SceneBase.PostProcessType.Main)
				end
			end

			self.loadStep = ControllerLobby.LoadStep.LoadCharacterAnimator

			Common.ClearMemory()
		end

		LoadProgress.SetItemProgress(ControllerLobby.LoadStep.LoadCamera, "LoadCamera", 100)
	elseif self.loadStep == ControllerLobby.LoadStep.LoadCharacterAnimator then
		if self.lobbyShowHeroIndex < #ControllerLobby.LobbyShowHero then
			local heroId = ControllerLobby.LobbyShowHero[self.lobbyShowHeroIndex + 1]
			local modelName = "hero" .. heroId
			local tmpPackage = "character/" .. modelName .. "_anim_ui.unity3d"
			local tmpAsset = {
				"ui_" .. modelName .. ".controller"
			}

			LoadProgress.CreateAndAddItem(ControllerLobby.LoadStep.LoadCharacterAnimator, tmpPackage, tmpAsset)
			resMgr:LoadPrefabWithProgress(tmpPackage, tmpAsset, true, function(objs)
				if self.lobbyShowHeroAnimatorList ~= nil then
					local heroId = ControllerLobby.LobbyShowHero[self.lobbyShowHeroIndex + 1]

					self.lobbyShowHeroAnimatorList[heroId] = objs[0]
					self.lobbyShowHeroIndex = self.lobbyShowHeroIndex + 1

					if self.lobbyShowHeroIndex >= #ControllerLobby.LobbyShowHero then
						self.lobbyShowHeroIndex = 0
						self.loadStep = ControllerLobby.LoadStep.LoadCharacter
					else
						self.loadStep = ControllerLobby.LoadStep.LoadCharacterAnimator
					end
				end
			end, function(packageName, index, request, isFinish)
				LoadProgress.SetSubItemRequest(ControllerLobby.LoadStep.LoadCharacterAnimator, packageName, index, request, isFinish)
			end)

			self.loadStep = ControllerLobby.LoadStep.LoadCharacterAnimatorWait
		else
			self.loadStep = ControllerLobby.LoadStep.LoadCharacter
		end
	elseif self.loadStep == ControllerLobby.LoadStep.LoadCharacter then
		if self.lobbyShowHeroIndex < #ControllerLobby.LobbyShowHero then
			local heroId = ControllerLobby.LobbyShowHero[self.lobbyShowHeroIndex + 1]
			local modelName = "hero" .. heroId
			local tmpPackage = "character/" .. modelName .. ".unity3d"

			LoadProgress.CreateAndAddItem(ControllerLobby.LoadStep.LoadCharacter, tmpPackage, {
				modelName .. ".prefab"
			})
			resMgr:LoadPrefabWithProgress(tmpPackage, LoadProgress.GetSubItemNameList(ControllerLobby.LoadStep.LoadCharacter, tmpPackage), true, function(objs)
				local heroId = ControllerLobby.LobbyShowHero[self.lobbyShowHeroIndex + 1]
				local goChara = GoInstantiate(objs[0])

				goChara.name = objs[0].name

				goChara.transform:SetParent(self.tfCharacterRoot)

				goChara.transform.localScale = Vector3.one * MS_HeroData.GetHero(heroId).UIScale
				goChara.transform.localPosition = Vector3.zero

				local animator = goChara:GetComponent("Animator")

				animator.runtimeAnimatorController = self.lobbyShowHeroAnimatorList[heroId]

				local hero = AnimalLobby:new(heroId, goChara.transform, LayerAnimal, 1)

				animator.applyRootMotion = false
				self.lobbyShowHeroList[heroId] = hero
				self.lobbyShowHeroIndex = self.lobbyShowHeroIndex + 1

				if self.lobbyShowHeroIndex >= #ControllerLobby.LobbyShowHero then
					self.loadStep = ControllerLobby.LoadStep.LoadUI
				else
					self.loadStep = ControllerLobby.LoadStep.LoadCharacter
				end
			end, function(packageName, index, request, isFinish)
				LoadProgress.SetSubItemRequest(ControllerLobby.LoadStep.LoadCharacter, packageName, index, request, isFinish)
			end)

			self.loadStep = ControllerLobby.LoadStep.LoadCharacterWait
		else
			self.loadStep = ControllerLobby.LoadStep.LoadUI
		end
	elseif self.loadStep == ControllerLobby.LoadStep.LoadCharacterWait then
		-- block empty
	elseif self.loadStep == ControllerLobby.LoadStep.LoadUI then
		LoadProgress.CreateAndAddItem(ControllerLobby.LoadStep.LoadUI, "LoadUI", nil)

		self.lobbyMainCtrl = UIManager.CreateCtrl("LobbyMain")
		self.loadStep = ControllerLobby.LoadStep.LoadWaitUI
	elseif self.loadStep == ControllerLobby.LoadStep.LoadWaitUI then
		if self.lobbyMainCtrl.loadFinish == true then
			UIManager.CreateCtrl("Skip")

			if ST_Lobby.needLogin then
				UIManager.CreateCtrl("Login")

				self.loadStep = ControllerLobby.LoadStep.LoadWaitLogin
			else
				LoadProgress.SetItemProgress(ControllerLobby.LoadStep.LoadUI, "LoadUI", 100)

				self.loadStep = ControllerLobby.LoadStep.LoadFinish

				Common.ClearMemory()
			end
		end
	elseif self.loadStep == ControllerLobby.LoadStep.LoadWaitLogin then
		local ctrl = UIManager.GetCtrl("Login")

		if ctrl ~= nil and ctrl.loadFinish == true then
			LoadProgress.SetItemProgress(ControllerLobby.LoadStep.LoadUI, "LoadUI", 100)

			self.loadStep = ControllerLobby.LoadStep.LoadFinish

			Common.ClearMemory()
		end
	elseif self.loadStep == ControllerLobby.LoadStep.LoadFinish then
		self.isLoaded = true

		self:UpdateQuality(true)

		if gameMgr:IsShowHotUpdateView() then
			gameMgr:ShowHotUpdateView(false)
			gameMgr:ShowHotUpdate(false)
		end

		UIManager.SendMessage("Loading", "SetActive", false)

		if ST_Lobby.needLogin then
			self:ChangeState(ControllerLobby.StateType.WaitLogin)
			self:ChangeSceneStatus(ControllerLobby.SceneStatus.PressStart)

			ST_Lobby.needLogin = false
		else
			self:ChangeState(ControllerLobby.StateType.Menu)
			self:ChangeSceneStatus(ControllerLobby.SceneStatus.SinglePlayer)
		end

		self.loadStep = ControllerLobby.LoadStep.Empty
	end
end

function ControllerLobby:RetryLoginUdp()
	NI_BattleLogin.LoginUdp()
end

function ControllerLobby:GetMatchPlayerNum()
	local playerNum = FS_Battle_MatchGame.GetMatchPlayerNum()

	return playerNum
end

function ControllerLobby:GetTeamPlayer(isMyTeam)
	return FS_Battle_MatchGame.GetTeamPlayer(isMyTeam)
end

function ControllerLobby:LoadHero(heroId)
	heroId = tonumber(heroId)

	local heroParent = self.scene:GetChooseHeroParent()
	local hero

	for _k, _v in pairs(self.heroList) do
		local tf = _v:GetTransform()

		if not IsNil(tf) then
			tf.gameObject:SetActive(false)

			if heroId == _k then
				tf.gameObject:SetActive(true)
				_v:SetTarget(heroParent, true, true)

				local heroIdWithoutSkin = BattleData.ConvertHeroIdWithoutSkin(heroId)
				local data = MS_HeroData.GetHero(heroIdWithoutSkin)

				_v:SetScaleP(data.UIScale, data.UIScale, data.UIScale)
				_v:SetPositionY(data.UIYOffset)

				hero = _v
				self.heroLoadFinishDelay = ControllerLobby.DynamicBoneGroupEnabledDelay
			end
		end
	end

	if hero == nil then
		UIManager.SendMessage("Loading", "SimpleLoading", true, true)

		if self.hostPlayer ~= nil then
			self.hostPlayer:GetTransform().gameObject:SetActive(false)
		end

		self.heroLoadFinish = false

		self:LoadHeroAnimator(heroId)
	else
		self.hostPlayer = hero

		self.hostPlayer:Stand()
	end
end

function ControllerLobby:LoadHeroAnimator(heroId)
	local modelName = "hero" .. heroId
	local packageName, assets

	if heroId > 20000 then
		packageName = "character/" .. modelName .. "_anim.unity3d"
		assets = {
			modelName .. ".controller"
		}
	else
		packageName = "character/" .. modelName .. "_anim_ui.unity3d"
		assets = {
			"ui_" .. modelName .. ".controller"
		}
	end

	resMgr:LoadPrefab(packageName, assets, true, function(objs)
		if UILayerCtrl.GetCurrentLayerName() ~= "ChooseHero" and UILayerCtrl.GetCurrentLayerName() ~= "HeroCostume" and UILayerCtrl.GetCurrentLayerName() ~= "Heroes" then
			self.heroLoadFinish = true

			return
		end

		self.heroAnimatorList[heroId] = objs[0]

		self:LoadHeroPrefab(heroId)
	end)
end

function ControllerLobby:LoadHeroPrefab(heroId)
	local modelName = "hero" .. heroId
	local packageName = "character/" .. modelName .. ".unity3d"
	local assets = {
		modelName .. ".prefab"
	}

	resMgr:LoadPrefab(packageName, assets, true, function(objs)
		if UILayerCtrl.GetCurrentLayerName() ~= "ChooseHero" and UILayerCtrl.GetCurrentLayerName() ~= "HeroCostume" and UILayerCtrl.GetCurrentLayerName() ~= "Heroes" then
			self.heroLoadFinish = true

			return
		end

		local goChara = GoInstantiate(objs[0])

		goChara.name = objs[0].name

		goChara.transform:SetParent(self.tfChooseHeroRoot)

		goChara.transform.localEulerAngles = Vector3.zero
		goChara.transform.localPosition = Vector3.zero

		goChara:SetActive(true)

		local animator = goChara:GetComponent("Animator")

		animator.runtimeAnimatorController = self.heroAnimatorList[heroId]

		local tempHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)
		local data = MS_HeroData.GetHero(tempHeroId)
		local hero = AnimalLobby:new(heroId, goChara.transform, LayerAnimal, data.UIScale)

		hero:SetEnableDynamicBoneGroup(false)
		hero:SetTarget(self.scene:GetChooseHeroParent(), false)
		hero:SetScaleP(data.UIScale, data.UIScale, data.UIScale)
		hero:SetPositionY(data.UIYOffset)

		self.heroLoadFinishDelay = ControllerLobby.DynamicBoneGroupEnabledDelay
		self.heroList[heroId] = hero

		table.insert(self.heroMaxList, heroId)

		if next(self.heroMaxList) ~= nil and #self.heroMaxList > ControllerLobby.SelectHeroCacheMax then
			local delHeroId = self.heroMaxList[1]

			if self.heroAnimatorList[delHeroId] ~= nil then
				GoDestroyImmediate(self.heroAnimatorList[delHeroId])
			end

			self.heroAnimatorList[delHeroId] = nil

			local heroMdl = self.heroList[delHeroId]

			if heroMdl ~= nil then
				heroMdl:Exit()
			end

			self.heroList[delHeroId] = nil

			table.remove(self.heroMaxList, 1)
		end

		self.hostPlayer = hero

		self.hostPlayer:Stand()

		self.heroLoadFinish = true

		UIManager.SendMessage("Loading", "SimpleLoading", false)
	end)
end

function ControllerLobby:GetHero()
	return self.hostPlayer
end

function ControllerLobby:GetHeroLoadFinish()
	return self.heroLoadFinish
end

function ControllerLobby:RotatePlayer(data)
	if self.hostPlayer == nil then
		return
	end

	local angle = data.delta.x + 0.5 * data.delta.y

	self.hostPlayer:RotateY(-angle)
end

function ControllerLobby:RotatePlayerVec(vec2)
	if self.hostPlayer == nil then
		return
	end

	local angle = 0.25 * vec2.x + 1e-05 * vec2.y

	self.hostPlayer:RotateY(-angle)
end

function ControllerLobby:SetChallegeMode(mode)
	self.challengeMode = mode
end

function ControllerLobby:GetChallengeMode()
	return self.challengeMode
end

function ControllerLobby:ChangeState(state)
	self.stateType = state

	if state == ControllerLobby.StateType.Load then
		self:EnterLoad()
		ControllerLobby.StartLogin()
	elseif state == ControllerLobby.StateType.Menu then
		ControllerLobby.EndLogin()
		SdkHelper.GetFeedback(ControllerLobby.OnGetFeedback)
		self:ExitRoom()
		FS_Battle_MatchRoom.initialize()
		XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_CHECK_IS_IN_ZONE, ControllerLobby.OnCheckMatchRoom, true)

		if ReqLogin then
			NI_BattleRoom.CheckMatchRoom()
		end
	elseif state == ControllerLobby.StateType.BattleMatchRoom then
		-- block empty
	elseif state == ControllerLobby.StateType.BattleMatchRoomWait then
		-- block empty
	elseif state == ControllerLobby.StateType.BattleUdpCreate then
		networkMgrBattleUdp:SendConnect()
	elseif state == ControllerLobby.StateType.BattleUdpLogin then
		NI_BattleLogin.LoginUdp()
	elseif state == ControllerLobby.StateType.BattleUdpPing then
		XNetworkBattleUdp.AddListener(XProtocol.BattleProtocolToBattle.RESP_BATTLE_FRAME, ControllerMain.OnBattleFrame, false)
		ST_Base.StartBattleUdpPing()
	elseif state == ControllerLobby.StateType.BattleJoinGame then
		XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_BEGIN_CHOOSING_HERO, ControllerLobby.OnMatchGameFinish, true)
		XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_CHOOSE_HERO, ControllerLobby.OnChooseHeroId, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_CONFIRM_HERO, ControllerLobby.OnChooseHeroIdConfirm, false)
		XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_BEGIN_GAME_LOADING, ControllerLobby.OnChooseHeroFinish, true)
		XNetwork.AddListener(XProtocol.BattleProtocolToBattle.RESP_BATTLE_FRAME, ControllerMain.OnBattleFrame, false)
		NI_BattleRoom.JoinGame()
	elseif state == ControllerLobby.StateType.BattleJoinGameConfirm then
		UIManager.SendMessage("Loading", "SimpleLoading", false)

		if self.lobbyMainCtrl ~= nil then
			self.lobbyMainCtrl.MatchConfirm()
		end

		self:InitWaitTime()
	elseif state == ControllerLobby.StateType.BattleChooseHero then
		UIManager.SendMessage("Loading", "SimpleLoading", false)

		if self.lobbyMainCtrl ~= nil then
			self.lobbyMainCtrl.FinishMatch()
		end

		self:InitWaitTime()
	elseif state == ControllerLobby.StateType.BattleReady then
		self.readyWait = 1
	elseif state == ControllerLobby.StateType.BattleSceneChange then
		UIManager.SendMessage("Loading", "SimpleLoading", false)
		ST_Base.StopBattleUdpPing()
		ST_Scene.ChangeScene(ST_Scene.SceneType.MainReload)
	end
end

function ControllerLobby:Update()
	ControllerBase.Update(self)

	if self.stateType == ControllerLobby.StateType.Load then
		self:UpdateLoad()
	elseif self.stateType == ControllerLobby.StateType.BattleMatchRoomWait then
		self:UpdateMatchWaitTime()
	elseif self.stateType == ControllerLobby.StateType.BattleUdpCreate then
		self:UpdateMatchWaitTime()

		if XNetworkBattleUdp.IsConnecting() == true then
			self:ChangeState(ControllerLobby.StateType.BattleUdpLogin)
		end
	elseif self.stateType == ControllerLobby.StateType.BattleUdpLogin then
		self:UpdateMatchWaitTime()

		local code = FS_Battle_CommonResponse.GetResponse(XProtocol.Type.BattleUdp, XProtocol.BattleProtocolToSystem.REQ_UDP_LOGIN)

		if code == FS_Battle_CommonResponse.CodeType.Success then
			self:ChangeState(ControllerLobby.StateType.BattleUdpPing)
		elseif code == FS_Battle_CommonResponse.CodeType.Fail then
			self:StopMatch()
		else
			self:RetryLoginUdp()
		end
	elseif self.stateType == ControllerLobby.StateType.BattleUdpPing then
		self:UpdateMatchWaitTime()

		if FS_Battle_PingPong.IsGetFirstPong() == true then
			self:ChangeState(ControllerLobby.StateType.BattleJoinGame)
		end
	elseif self.stateType == ControllerLobby.StateType.BattleJoinGame then
		self:UpdateMatchWaitTime()

		if FS_Battle_MatchGame.isRoomMax() == true then
			local sceneController = ST_Lobby.GetSceneController()

			sceneController:ChangeState(ControllerLobby.StateType.BattleJoinGameConfirm)
		end
	elseif self.stateType == ControllerLobby.StateType.BattleJoinGameConfirm then
		local playerNum = FS_Battle_MatchGame.GetMatchPlayerNum()

		for index = 1, playerNum do
			local fs_player = FS_Battle_MatchGame.GetMatchPlayer(index)
			local confirm = fs_player:isMatchConfirmed()

			if confirm then
				UIManager.SendMessage("ConfirmEnter", "UpdateConfirmStatus", index)
			end
		end

		self:UpdateWaitTime()
		UIManager.SendMessage("ConfirmEnter", "SetConfirmWaitText", Mathf.Floor(self.waitTime))
	elseif self.stateType == ControllerLobby.StateType.BattleChooseHero then
		self:UpdateWaitTime()
		UIManager.SendMessage("ChooseHero", "SetWaitTime", self.waitTime)
	elseif self.stateType == ControllerLobby.StateType.BattleReady then
		self.readyWait = self.readyWait - Time.deltaTime

		if self.readyWait < 0 then
			self:ChangeState(ControllerLobby.StateType.BattleSceneChange)
		end
	end

	if self.lobbyShowHeroList then
		for _, hero in pairs(self.lobbyShowHeroList) do
			hero:Update()
		end
	end

	if self.hostPlayer then
		self.hostPlayer:Update()

		if self.heroLoadFinishDelay > 0 and self.heroLoadFinish then
			self.heroLoadFinishDelay = self.heroLoadFinishDelay - 1

			if self.heroLoadFinishDelay == 0 then
				self.hostPlayer:SetEnableDynamicBoneGroup(true)
			end
		end
	end

	self:UpdateScene()
end

function ControllerLobby:ChangeSceneStatus(status)
	if self.sceneStatus == status then
		return
	end

	if self.openStep == ControllerLobby.Step.In or self.openStep == ControllerLobby.Step.Out then
		return
	end

	self.nextSceneStatus = status

	if self.sceneStatus == ControllerLobby.SceneStatus.Empty then
		self:ChangeCameraStep(ControllerLobby.Step.In, true)
	else
		self:ChangeCameraStep(ControllerLobby.Step.Out, false)
	end
end

function ControllerLobby:UpdateScene()
	if self.stateType == ControllerLobby.StateType.Load then
		return
	end

	if self.openStep == ControllerLobby.Step.In then
		local isEnd = self.scene:IsAnimationEnd()

		if isEnd then
			self:ChangeCameraStep(ControllerLobby.Step.Show, false)
		end
	elseif self.openStep == ControllerLobby.Step.Out then
		local isEnd = self.scene:IsAnimationEnd()

		if isEnd then
			self:ChangeCameraStep(ControllerLobby.Step.In, false)
		end
	end

	self.scene:Update()
	self:UpdateCamera()
end

function ControllerLobby:UpdateQuality(force)
	ControllerBase.UpdateQuality(self, force)
end

function ControllerLobby:ReadControllerInput()
	return self.readControllerInput
end

function ControllerLobby:ChangeCameraStep(step, immediately)
	if step == ControllerLobby.Step.Out then
		self.readControllerInput = false

		self.lobbyMainCtrl.SetRaycasterEnabled(false)
		self.lobbyMainCtrl.SceneFadeOut()
		self.scene:PlayMoveOut(immediately)
	elseif step == ControllerLobby.Step.In then
		self.readControllerInput = false

		self.lobbyMainCtrl.SetRaycasterEnabled(false)
		self.lobbyMainCtrl.SceneFadeIn()
		self.scene:ChangeSceneStatus(self.nextSceneStatus)

		local target = self.scene:GetFollowingCamera()

		if self.cameraCtrl ~= nil then
			self.cameraCtrl:SetTarget(target)
		end

		self.scene:PlayMoveIn(immediately)

		if self.hostPlayer then
			self.hostPlayer:GetTransform().gameObject:SetActive(false)
		end

		local heroTbl = self.scene:GetHeroParent()

		for _k, _v in pairs(self.lobbyShowHeroList) do
			local tf = _v:GetTransform()

			tf.gameObject:SetActive(false)
		end

		for _k, _v in pairs(heroTbl) do
			if self.lobbyShowHeroList[_k] ~= nil then
				local tf = self.lobbyShowHeroList[_k]:GetTransform()

				tf.gameObject:SetActive(true)
				self.lobbyShowHeroList[_k]:SetTarget(_v, false)
			end
		end

		self.lobbyMainCtrl.OnChangeScene(self.nextSceneStatus)

		self.sceneStatus = self.nextSceneStatus
	elseif step == ControllerLobby.Step.Show then
		self.readControllerInput = true

		self.lobbyMainCtrl.SetRaycasterEnabled(true)
	end

	self.openStep = step
end

function ControllerLobby:GetGamePadControllerForRotation()
	return self.GamePadControllerForRotation
end

function ControllerLobby:SetGamePadControllerForRotation(GamePad)
	self.GamePadControllerForRotation = GamePad

	self.GamePadControllerForRotation:SetType(GamePadController.GamePadType.Rotation)
	self.GamePadControllerForRotation:SetEvent(GamePadController.GamePadEventType.InputBegin, ControllerLobby.JoystickForRotationTouchBegin)
	self.GamePadControllerForRotation:SetEvent(GamePadController.GamePadEventType.InputRotation, ControllerLobby.JoystickForRotationTouchMove)
	self.GamePadControllerForRotation:SetEvent(GamePadController.GamePadEventType.InputEnd, ControllerLobby.JoystickForRotationTouchEnd)
end

function ControllerLobby:GetGamePadControllerForMovement()
	return self.GamePadControllerForMovement
end

function ControllerLobby:SetGamePadControllerForMovement(GamePad)
	self.GamePadControllerForMovement = GamePad

	self.GamePadControllerForMovement:SetType(GamePadController.GamePadType.Move)
	self.GamePadControllerForMovement:SetEvent(GamePadController.GamePadEventType.InputBegin, ControllerLobby.JoystickForJPadTouchBegin)
	self.GamePadControllerForMovement:SetEvent(GamePadController.GamePadEventType.InputMove, ControllerLobby.JoystickForJPadTouchMove)
	self.GamePadControllerForMovement:SetEvent(GamePadController.GamePadEventType.InputEnd, ControllerLobby.JoystickForJPadTouchEnd)
end

function ControllerLobby:GetGamePadControllerForDPad()
	return self.GamePadControllerForDPad
end

function ControllerLobby:SetGamePadControllerForDPad(GamePad)
	self.GamePadControllerForDPad = GamePad

	self.GamePadControllerForDPad:SetType(GamePadController.GamePadType.DPad)
	self.GamePadControllerForDPad:SetEvent(GamePadController.GamePadEventType.InputBegin, ControllerLobby.JoystickForDPadTouchBegin)
	self.GamePadControllerForDPad:SetEvent(GamePadController.GamePadEventType.InputDPad, ControllerLobby.JoystickForDPadTouchMove)
	self.GamePadControllerForDPad:SetEvent(GamePadController.GamePadEventType.InputEnd, ControllerLobby.JoystickForDPadTouchEnd)
end

function ControllerLobby:JPadHold(vec2)
	local currentInput = SystemHelper.GetDirPressed(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if self.JPadInput == 0 and currentInput > 0 then
		self.JPadInput = currentInput

		if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
			UIManager.SendMessage("Setting", "JPadPress", currentInput)
		elseif lName == "Additions" then
			UIManager.SendMessage("Additions", "JPadPress", currentInput)
		elseif lName == "Heroes" then
			UIManager.SendMessage("HeroViewer", "JPadPress", currentInput)
		elseif lName == "ChooseHero" or lName == "HeroCostume" then
			UIManager.SendMessage("ChooseHero", "JPadPress", currentInput)
		elseif lName == "RoomPanel_SelectPanel" or lName == "RoomPanel_RoomMainPanel" or lName == "RoomPanel_SelectAIPanel" then
			UIManager.SendMessage("Room", "JPadPress", currentInput)
		elseif lName == "AchievementPanel" then
			UIManager.SendMessage("Achievement", "JPadPress", currentInput)
		elseif lName == "MsgBoxSimple" then
			-- block empty
		elseif lName == "Challenge" then
			UIManager.SendMessage("Challenge", "JPadPress", currentInput)
		elseif lName == "ChallengeRank" then
			UIManager.SendMessage("Challenge", "JPadPress", currentInput)
		elseif lName == "Arcade_Main" or lName == "Arcade_Mode" or lName == "Arcade_Level" or lName == "Arcade_New" or lName == "Arcade_Load" or lName == "Arcade_Record" or lName == "Arcade_Ranking" or lName == "Arcade_Edit" then
			UIManager.SendMessage("Arcade", "JPadPress", currentInput)
		else
			UIManager.SendMessage("LobbyMain", "JPadPress", currentInput)
		end
	end

	if currentInput > 0 then
		self:ResetIdleState()

		if self.JPadInput ~= currentInput or self.JPadTime == 0 then
			self.JPadTime = TimeHelper.getNowTimeNoScale()
		end

		self.JPadInput = currentInput
		self.JPadDeltaTime = TimeHelper.getNowTimeNoScale() - self.JPadTime

		if self.JPadDeltaTime > 0.4 then
			if lName == "Settings1" or lName == "Settings2" or lName == "Settings3" or lName == "Settings4" or lName == "Settings5" or lName == "Settings6" or lName == "InputConfig1" or lName == "InputConfig2" or lName == "InputConfig3" then
				UIManager.SendMessage("Setting", "JPadLongPress", currentInput)
			elseif lName == "Additions" then
				UIManager.SendMessage("Additions", "JPadPress", currentInput)
			elseif lName == "Heroes" then
				UIManager.SendMessage("HeroViewer", "JPadPress", currentInput)
			elseif lName == "ChooseHero" or lName == "HeroCostume" then
				UIManager.SendMessage("ChooseHero", "JPadPress", currentInput)
			elseif lName == "RoomPanel_SelectPanel" or lName == "RoomPanel_RoomMainPanel" or lName == "RoomPanel_SelectAIPanel" then
				UIManager.SendMessage("Room", "JPadPress", currentInput)
			elseif lName == "AchievementPanel" then
				UIManager.SendMessage("Achievement", "JPadPress", currentInput)
			elseif lName == "MsgBoxSimple" then
				UIManager.SendMessage("MsgBoxSimple", "DPadPress", currentInput)
			elseif lName == "Challenge" then
				UIManager.SendMessage("Challenge", "JPadPress", currentInput)
			elseif lName == "ChallengeRank" then
				UIManager.SendMessage("Challenge", "JPadPress", currentInput)
			elseif lName == "Arcade_Main" or lName == "Arcade_Mode" or lName == "Arcade_Level" or lName == "Arcade_New" or lName == "Arcade_Load" or lName == "Arcade_Record" or lName == "Arcade_Ranking" or lName == "Arcade_Edit" then
				UIManager.SendMessage("Arcade", "JPadPress", currentInput)
			else
				UIManager.SendMessage("LobbyMain", "JPadPress", currentInput)
			end

			self.JPadTime = self.JPadTime + 0.2
		end
	end
end

function ControllerLobby:JPadRelease()
	self.JPadInput = 0
	self.JPadTime = 0
	self.JPadDeltaTime = 0
end

function ControllerLobby.JoystickForRotationTouchBegin()
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "Heroes" then
			-- block empty
		elseif lName == "Additions" then
			-- block empty
		end
	end
end

function ControllerLobby.JoystickForRotationTouchMove(vec2, touch)
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "Heroes" or lName == "ChooseHero" or lName == "HeroCostume" then
			sceneController:RotatePlayerVec(vec2)
		elseif lName == "Additions" then
			local dir = SystemHelper.GetDirPressedJpad(vec2)

			UIManager.SendMessage("Additions", "JPadRot", dir)
		elseif lName == "ChallengeRank" then
			local dir = SystemHelper.GetDirPressedJpad(vec2)

			UIManager.SendMessage("Challenge", "JPadRot", dir)
		elseif lName == "Arcade_Record" or lName == "Arcade_Ranking" then
			local dir = SystemHelper.GetDirPressedJpad(vec2)

			UIManager.SendMessage("Arcade", "JPadRot", dir)
		elseif lName == "PanelDLC" then
			local dir = SystemHelper.GetDirPressedJpad(vec2)

			UIManager.SendMessage("LobbyMain", "JPadRot", dir)
		end
	end
end

function ControllerLobby.JoystickForRotationTouchEnd()
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController ~= nil then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "Heroes" then
			-- block empty
		elseif lName == "Additions" then
			-- block empty
		end
	end
end

function ControllerLobby.JoystickForJPadTouchBegin()
	return
end

function ControllerLobby.JoystickForJPadTouchMove(vec2, touch)
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController then
		sceneController:JPadHold(vec2)
	end
end

function ControllerLobby.JoystickForJPadTouchEnd()
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController then
		sceneController:JPadRelease()
	end
end

function ControllerLobby.JoystickForDPadTouchBegin()
	return
end

function ControllerLobby.JoystickForDPadTouchMove(vec2, touch)
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController then
		sceneController:JPadHold(vec2)
	end
end

function ControllerLobby.JoystickForDPadTouchEnd()
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController then
		sceneController:JPadRelease()
	end
end

function ControllerLobby:PlayMovie()
	if self.movieObj == nil then
		self.movieObj = GoInstantiate(loadMgr:LoadPrefab("VideoPlayer"))
	end

	local vp = self.movieObj:GetComponent("VPController")

	vp:SetUrl("mp4/opening.mp4")
	vp:SetVolume(LS_Setting.sound / 100)
	vp:SetLuaOnStopMovie(ControllerLobby.StopMovie)
	self:SetIsInMovie(true)
	UIManager.MovieMode(true)
	UIManager.SendMessage("Skip", "SetSkipFunc", ControllerLobby.StopMovie)
	UIManager.SendMessage("Skip", "Show")
	AudioCtrl.SetSceneBGM(nil)
end

function ControllerLobby.StopMovie()
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController then
		sceneController:ExitMovie()
	end

	if LS_Setting.isFirstLaunched == true then
		LS_Setting.isFirstLaunched = false

		if IapData.GetEnterArcade() == false then
			UIManager.SendMessage("LobbyMain", "OpenPanelDLC")
		end
	end
end

function ControllerLobby:ExitMovie()
	if self.movieObj ~= nil then
		GoDestroyImmediate(self.movieObj)
	end

	self.movieObj = nil

	self:SetIsInMovie(false)
	self:ResetIdleState()
	AudioCtrl.SetSceneBGM(ST_Scene.SceneType.Lobby)
	UIManager.SendMessage("Skip", "Hide")
	UIManager.MovieMode(false)
	Common.ClearMemory()

	if AppVer == AppTapTapEA and (SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP or SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY) and (LS_Setting.activated == false or LS_Setting.activeTime <= 0) then
		UIManager.SendMessage("LobbyMain", "ShowActivation")
	end
end

function ControllerLobby:EnterAR(callBack)
	if self.hostPlayer == nil then
		return
	end

	if self.arObj == nil then
		self.arObj = GoInstantiate(loadMgr:LoadPrefab("ARRoot"))
	end

	self.ARController = self.arObj:GetComponent("ARController")

	self.ARController:InitAR(callBack, "ChooseHeroRoot/hero" .. self.hostPlayer:GetHeroId())
end

function ControllerLobby:ExitAR(callBack)
	if self.ARController then
		self.ARController:CloseAR(callBack)
	end
end

function ControllerLobby:UnloadAR()
	if self.arObj ~= nil then
		GoDestroyImmediate(self.arObj)
	end

	self.ARController = nil
	self.arObj = nil
end

function ControllerLobby:TakeARPhoto(callback)
	if self.ARController then
		self.ARController:TakePhoto(callback)
	end
end

function ControllerLobby:SetFindPlaneCallback(callBack)
	if self.ARController then
		self.ARController:SetFindPlaneCallback(callBack)
	end
end

function ControllerLobby:SetSelectPlaneCallback(callBack)
	if self.ARController then
		self.ARController:SetSelectPlaneCallback(callBack)
	end
end

function ControllerLobby:SetShowHeroCallback(callBack)
	if self.ARController then
		self.ARController:SetShowHeroCallback(callBack)
	end
end

function ControllerLobby:ForcePlaying()
	self:ChangeState(ControllerLobby.StateType.WaitLogin)
	self:ChangeSceneStatus(ControllerLobby.SceneStatus.PressStart)
	UIManager.CreateCtrl("Login")

	self.recordTime = 0
	self.idleTime = 0
end

function ControllerLobby:ResetIdleState()
	self.recordTime = 0
end

function ControllerLobby:SetIsInMovie(bool)
	self.isInMovie = bool
end

function ControllerLobby.OnCheckMatchRoom(buffer)
	NI_BattleRoom.ParseCheckRoom(buffer)

	if FS_Battle_MatchRoom.IsHaveRoom() then
		local bType = FS_Battle_MatchRoom.GetRoomBattleType()

		BattleData.SetBattleType(bType)
		UIManager.SendMessage("Loading", "SimpleLoading", true)

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:EnterRoom()
		NI_BattleRoom.MatchRoom()
		sceneController:ChangeState(ControllerLobby.StateType.BattleMatchRoom)
	end
end

function ControllerLobby:StartMatchRoom()
	if self.lobbyMainCtrl ~= nil and self.lobbyMainCtrl.IsMatchingGame() == false then
		UIManager.SendMessage("Loading", "SimpleLoading", true)
		self:EnterRoom()
		NI_BattleRoom.MatchRoom()
		self:ChangeState(ControllerLobby.StateType.BattleMatchRoom)
	end
end

function ControllerLobby.OnMatchGameRematch(buffer)
	if self.lobbyMainCtrl ~= nil then
		self.lobbyMainCtrl.MatchGameRematch()

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:EnterRoom()
		sceneController:ChangeState(ControllerLobby.StateType.BattleMatchRoomWait)

		self.matchTime = 0
	end
end

function ControllerLobby.OnMatchGameNotConfirm(buffer)
	if self.lobbyMainCtrl ~= nil then
		local sceneController = ST_Lobby.GetSceneController()

		self.lobbyMainCtrl.CloseMatch()
		sceneController:ExitRoom()
		sceneController:ChangeState(ControllerLobby.StateType.Menu)
	end
end

function ControllerLobby:EnterRoom()
	BattleData.InitBattleData()
	self:StopConnect()
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_PROGRESS, ControllerLobby.OnMatchRoomWait, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_ZONE, ControllerLobby.OnMatchRoom, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.REQ_MATCH_GAME_IN_ZONE, ControllerLobby.OnMatchRoomError, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_MATCHED_PLAYER_LIST, ControllerLobby.OnMatchGetPlayer, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_REMATCH_GAME, ControllerLobby.OnMatchGameRematch, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_KICK_OUT_UNCONFIRMED_USER, ControllerLobby.OnMatchGameNotConfirm, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToRoom.RESP_CONFIRM_ENTER_GAME, ControllerLobby.OnMatchGameConfirm, false)

	self.inRoomNow = true
end

function ControllerLobby:ExitRoom()
	BattleData.InitBattleData()

	self.inRoomNow = false
end

function ControllerLobby:StopConnect()
	ST_Base.StopBattleUdpPing()
	XNetworkBattleUdp.Disconnect()
	networkMgrBattleUdp:Disconnect()
end

function ControllerLobby:StopMatch()
	UIManager.SendMessage("Loading", "SimpleLoading", false)
	self:StopConnect()

	if self.lobbyMainCtrl ~= nil then
		self.lobbyMainCtrl.CloseMatch()
	end

	self:ExitRoom()
	self:ChangeState(ControllerLobby.StateType.Menu)
end

function ControllerLobby:isNowInRoom()
	return self.inRoomNow
end

function ControllerLobby.OnMatchRoomWait(buffer)
	if self.lobbyMainCtrl ~= nil then
		if FS_Battle_MatchRoom.IsHaveRoom() == false then
			UIManager.SendMessage("Loading", "SimpleLoading", false)
			self.lobbyMainCtrl.MatchGame()
		end

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:ChangeState(ControllerLobby.StateType.BattleMatchRoomWait)

		self.matchTime = 0
	end
end

function ControllerLobby:UpdateMatchWaitTime()
	self.matchTime = self.matchTime + Time.deltaTime

	if self.lobbyMainCtrl ~= nil then
		self.lobbyMainCtrl.SetWaitText(self.matchTime)
	end
end

function ControllerLobby.OnMatchRoom(buffer)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.REQ_MATCH_GAME_IN_ZONE)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_PROGRESS)
	NI_BattleRoom.ParseMatchRoom(buffer)

	local host = FS_Battle_MatchRoom.GetHost()
	local port = FS_Battle_MatchRoom.GetPort()
	local sign = FS_Battle_MatchRoom.GetSign()

	if FS_Battle_MatchRoom.IsHaveRoom() == false then
		UIManager.SendMessage("Loading", "SimpleLoading", false)
	end

	if host ~= "" and port > 0 and sign > 0 then
		networkMgrBattleUdp:SetHostAndPort(host, port)

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:ChangeState(ControllerLobby.StateType.BattleUdpCreate)
	end
end

function ControllerLobby.OnMatchRoomError(code)
	local sceneController = ST_Lobby.GetSceneController()

	sceneController:StopMatch()
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Battle_Match_Error .. code)
end

function ControllerLobby.OnMatchGetPlayer(buffer)
	NI_BattleRoom.ParseMatchGame(buffer)
end

function ControllerLobby:MatchGameCancel()
	if self.stateType >= ControllerLobby.StateType.BattleMatchRoom and self.stateType <= ControllerLobby.StateType.BattleJoinGame then
		XNetwork.AddListener(XProtocol.BattleProtocolToRoom.REQ_CANCEL_MATCH_GAME, ControllerLobby.OnMatchGameCancel, true)
		NI_BattleRoom.MatchGameCancel()
	end
end

function ControllerLobby.OnMatchGameCancel(code)
	if code == FS_Battle_CommonResponse.CodeType.Success then
		local sceneController = ST_Lobby.GetSceneController()

		sceneController:StopMatch()
	elseif code == FS_Battle_CommonResponse.CodeType.Fail then
		-- block empty
	end
end

function ControllerLobby.OnMatchGameConfirm(buffer)
	NI_BattleRoom.ParseMatchGameConfirm(buffer)
end

function ControllerLobby.MatchGameConfirm()
	if self.stateType == ControllerLobby.StateType.BattleJoinGameConfirm then
		NI_BattleRoom.MatchGameConfirm()
	end
end

function ControllerLobby.IsHeroConfirmed(index)
	local fs_player = FS_Battle_MatchGame.GetMatchPlayer(index)
	local confirmed = fs_player:isHeroConfirmed()

	return confirmed
end

function ControllerLobby.ChoosedHeroId(index)
	local fs_player = FS_Battle_MatchGame.GetMatchPlayer(index)
	local heroId = fs_player:choosedHeroId()

	return heroId
end

function ControllerLobby:UpdateTeamStatus()
	local team = self:GetTeamPlayer(true)

	UIManager.SendMessage("ChooseHero", "LoadTeammate", team)
end

function ControllerLobby.OnMatchGameFinish(buffer)
	if self.stateType == ControllerLobby.StateType.BattleJoinGameConfirm then
		NI_BattleRoom.ParseMatchGameTeam(buffer)

		if FS_Battle_MatchGame.isTeamMax() == true then
			local sceneController = ST_Lobby.GetSceneController()

			sceneController:ChangeState(ControllerLobby.StateType.BattleChooseHero)
		end
	end
end

function ControllerLobby:ChooseMap(index)
	if index == 1 then
		BattleData.SetBattleType(BattleData.Type.PVE_Guard)
		BattleData.SetSceneId(1002)
	elseif index == 2 then
		BattleData.SetBattleType(BattleData.Type.PVE_Occupy)
		BattleData.SetSceneId(10001)
	end
end

function ControllerLobby:ChooseHeroId(heroId)
	BattleData.SetHeroId(heroId)
	UIManager.SendMessage("ChooseHero", "UpdatePveTeammate")
	self:LoadHero(heroId)
end

function ControllerLobby.OnChooseHeroId(buffer)
	if self.stateType == ControllerLobby.StateType.BattleChooseHero then
		NI_BattleRoom.ParseChooseHero(buffer)

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:UpdateTeamStatus()
	end
end

function ControllerLobby:ChooseHeroIdConfirm()
	UIManager.SendMessage("ChooseHero", "UpdatePveTeammate")
	self:ChangeState(ControllerLobby.StateType.BattleSceneChange)
end

function ControllerLobby.OnChooseHeroIdConfirm(buffer)
	if self.stateType == ControllerLobby.StateType.BattleChooseHero then
		NI_BattleRoom.ParseChooseHeroConfirm(buffer)

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:UpdateTeamStatus()
	end
end

function ControllerLobby.OnChooseHeroFinish(buffer)
	NI_BattleRoom.ParseChooseHeroFinish(buffer)

	if FS_Battle_MatchGame.isGetAllTeamData() == true then
		local sceneController = ST_Lobby.GetSceneController()

		sceneController:ChangeState(ControllerLobby.StateType.BattleReady)
	end
end

function ControllerLobby:InitWaitTime()
	self:SetWaitTime(FS_Battle_MatchGame.matchEndTime - FS_Battle_PingPong.GetServerTime(), true)
end

function ControllerLobby:UpdateWaitTime()
	self:SetWaitTime(FS_Battle_MatchGame.matchEndTime - FS_Battle_PingPong.GetServerTime(), false)
end

function ControllerLobby:SetWaitTime(time, isStart)
	if isStart == true then
		self.waitTime = time
	elseif time < self.waitTime then
		self.waitTime = time
	end

	if self.waitTime < 0 then
		self.waitTime = 0
	end
end

function ControllerLobby:ExitMatchGame()
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_PROGRESS)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_ZONE)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.REQ_MATCH_GAME_IN_ZONE)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.REQ_CANCEL_MATCH_GAME)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_MATCHED_PLAYER_LIST)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_REMATCH_GAME)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_KICK_OUT_UNCONFIRMED_USER)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_CONFIRM_ENTER_GAME)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_BEGIN_CHOOSING_HERO)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_CHOOSE_HERO)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_CONFIRM_HERO)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_BEGIN_GAME_LOADING)

	if ST_Scene.GetNextScene() ~= ST_Scene.SceneType.Main then
		XNetwork.RemoveListener(XProtocol.BattleProtocolToBattle.RESP_BATTLE_FRAME)
		XNetworkBattleUdp.RemoveListener(XProtocol.BattleProtocolToBattle.RESP_BATTLE_FRAME)
		ST_Base.StopBattleUdpPing()
		self:ExitRoom()
	end
end

function ControllerLobby.StartLogin()
	XNetwork.AddListener(XProtocol.BattleProtocolToSystem.RESP_LOGIN_GAME, ControllerLobby.OnLogin, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.RESP_PLAYER_ENTER, ControllerLobby.OnEnter, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.REQ_PLAYER_ENTER, ControllerLobby.OnInit, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.INIT_CHARGE_LOGS, ControllerLobby.OnInitChargeLogs, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.INIT_MAILS, ControllerLobby.OnInitMails, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToBag.INIT_BAG_ITEM_LIST, ControllerLobby.OnInitBagItemList, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToHero.INIT_HERO_INFO_LIST, ControllerLobby.OnInitHeroInfoList, true)
	XNetwork.AddListener(XProtocol.BattleProtocolToStage.INIT_STAGE_SAVE_DATA, ControllerLobby.OnInitStageInfoList, true)
end

function ControllerLobby.EndLogin()
	return
end

function ControllerLobby.OnGetFeedback(ret, json)
	if ret then
		LS_Feedback.SetUserId(LS_Account.userId)
		LS_Feedback.Load(LS_Account.userId)
		FS_UserData.feedback:Refresh(json)
	else
		SystemHelper.Log("[ Get Feedback Failed ]")
	end

	UIManager.SendMessage("LobbyMain", "SetNewFeedback", FS_UserData.feedback:HasNew())
end

function ControllerLobby.OnLogin(buffer)
	SystemHelper.Log("---------->> OnLogin")
	NI_Game.ParseLoginResponse(buffer)
end

function ControllerLobby.OnEnter(buffer)
	SystemHelper.Log("---------->> OnEnter")
	NI_Game.ParsePlayerEnterResponse(buffer)
end

function ControllerLobby.OnInit(value)
	SystemHelper.Log("---------->> OnInit")

	if value == 0 then
		UIManager.SendMessage("Loading", "SimpleLoading", false)
		UIManager.SendMessage("Login", "FinishLogin")
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "LoginFailed, code:" .. value)
	end
end

function ControllerLobby.OnInitChargeLogs(buffer)
	SystemHelper.Log("---------->> OnInitChargeLogs")
	NI_Game.ParseInitChargeResponse(buffer)
end

function ControllerLobby.OnInitMails(buffer)
	SystemHelper.Log("---------->> OnInitMails")
	NI_Game.ParseInitMailsResponse(buffer)
end

function ControllerLobby.OnInitHeroInfoList(buffer)
	SystemHelper.Log("---------->> OnInitHeroInfoList")
end

function ControllerLobby.OnInitStageInfoList(buffer)
	SystemHelper.Log("---------->> OnInitStageInfoList")
end

function ControllerLobby.OnInitBuddyList(buffer)
	SystemHelper.Log("---------->> OnInitBuddyList")
	NI_Buddy.ParseInitBuddyListResponse(buffer)
end

function ControllerLobby.OnInitBuddyRequestList(buffer)
	SystemHelper.Log("---------->> OnInitBuddyRequestList")
	NI_Buddy.ParseInitBuddyRequestListResponse(buffer)
end

function ControllerLobby.OnInitBagItemList(buffer)
	SystemHelper.Log("---------->> OnInitBagItemList")
	NI_Bag.ParseInitBagItemList(buffer)
end

function ControllerLobby:GetSceneState()
	return self.sceneStatus
end
