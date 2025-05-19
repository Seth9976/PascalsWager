-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/LobbyMainCtrl.lua

LobbyMainCtrl = class("LobbyMainCtrl", UICtrlBase)

local this = LobbyMainCtrl

LobbyMainCtrl.static.PgIdx = 1
LobbyMainCtrl.static.BtnKeyIdx = 2
LobbyMainCtrl.static.BtnCbIdx = 3
LobbyMainCtrl.static.Status = {
	InUse = 2,
	Blank = 1,
	InCopy = 3
}
LobbyMainCtrl.static.CH_ANDROID_TAP_TAP = "ANDROID_TAP_TAP"

if SdkHelper.CHANNEL == "EPIC" then
	require("GameData/LobbyMainCfgEpic")
elseif AppVer == AppMaster then
	require("GameData/LobbyMainCfg")
elseif AppVer == AppAppleDemo then
	require("GameData/LobbyMainCfgGame1909")
elseif AppVer == AppAppleShow then
	require("GameData/LobbyMainCfgEvt1909")
elseif AppVer == AppDemoPax1903 or AppVer == AppDemoE3_1906 then
	require("GameData/LobbyMainCfgE31906")
elseif AppVer == AppAppleLight then
	require("GameData/LobbyMainCfgLight")
elseif AppVer == AppTapTapCloudDemo then
	require("GameData/LobbyMainCfgTapTapCloudDemo")
elseif AppVer == AppComReview then
	require("GameData/LobbyMainCfgComReview")
elseif AppVer == AppTapTapEA then
	require("GameData/LobbyMainCfgTapTapEA")
elseif AppVer == AppCJ2020 then
	require("GameData/LobbyMainCfgCJ2020")
else
	require("GameData/LobbyMainCfgDev")
end

local strTCadpaTitle = "适龄提示"
local strCadpaContents = "适龄提示\n\n1、本游戏是一款动作角色扮演类游戏，适用于年满 16 周岁及以上的用户，建议未成年人在家长监护下使用游戏产品。\n\n2、本游戏基于架空的故事背景和世界观，游戏内角色为虚构，没有基于真实历史和现实事件的改编内容。游戏玩法基于肢体操作，鼓励玩家提升和挑战自我。游戏中没有基于文字和语音的陌生人社交系统。\n\n3、本游戏中有用户实名认证系统，认证为未成年人的用户将接受以下管理。\n　　根据国家规定未成年人用户仅可在周五、周六、周日和法定节假日每日20时至21时使用。\n\n4、本游戏需要玩家根据实际情况控制游戏角色迅速作出反应，有助于锻炼玩家的大脑反应速度和手眼协调能力。"
local currentBtnIndex = 0
local previousBtnIndex = 0
local currentBtnCount = 0
local subNavIndex = 0
local subNavSelect = 0
local subNavScrollGap = 1
local subNavListCount = 13
local btnActivation, pnlRoot, pnlUser, pnlDLC, loaderNewGame, loaderAutosave, loaderLoadGame, loaderLevelList, loaderItemList, waitMenu, teamMenu, exitConfirmDialog, waitText, maskTween, btnTap, imageLogo, renderTextureCamera, vfxRenderTex, uiGroup, dlcLogo, dlcElena
local runStep = 0
local RunStep = {
	PressStart = 2,
	ChooseOnline = 5,
	WatchHero = 10,
	WaitLogin = 1,
	Confirm = 8,
	ChooseHero = 11,
	MakeTeam = 4,
	Setting = 12,
	MatchWait = 7,
	Homepage = 3,
	ChooseMatchMode = 6,
	Confirmed = 9,
	Empty = 0
}
local isWait = false
local watchHero = false
local sceneController
local controlEnable = true
local lobbyPanelTop, labelVersion, uiFeedback, challengeMode, AnnouncementGO, AnnouncementLoader, AnnouncementConfirmBtn, AnnouncementOpenBtn, TapTapBtn, NewChannelBtn, AuthorityBtn, CadpaBtn
local popQuit = false
local isBackFromArcadeMode = false
local isNeedSyncArcade = false
local previousArcadeModeIdx = 0
local chooseHeroMode = 1
local gameDifficulty = LS_Setting.ArcadeMode.Casual
local bRefresh = false
local gameConfig = {
	carriageId = 0,
	heroId = 0,
	skinId = 0,
	storyId = 0,
	difficulty = 1,
	lastArcadeSlot = 0,
	storyMode = FS_SaveStory.StoryMode.Normal,
	arcadeMode = FS_SaveStory.ArcadeMode.Normal
}

function LobbyMainCtrl.ResetGameConfig()
	gameConfig.storyMode = FS_SaveStory.StoryMode.Normal
	gameConfig.storyId = 0
	gameConfig.carriageId = 0
	gameConfig.difficulty = 1
	gameConfig.heroId = 0
	gameConfig.skinId = 0
	gameConfig.arcadeMode = FS_SaveStory.ArcadeMode.Normal
	gameConfig.lastArcadeSlot = 0
end

function LobbyMainCtrl.ActiveTab(tabIndex)
	return
end

function LobbyMainCtrl.ShowCurrentPanel(tabIndex, visiable)
	if tabIndex > 0 and pnlRoot.pnls[tabIndex] ~= nil then
		pnlRoot.pnls[tabIndex]:SetActive(visiable)
	end
end

function LobbyMainCtrl.ShowNavBar(show)
	if pnlRoot and pnlRoot.navBar and pnlRoot.navBar.show ~= show then
		pnlRoot.navBar.show = show

		pnlRoot.navBar.go:SetActive(show)
	end
end

function LobbyMainCtrl.GetNavBtnIndices(btnIndex, maxCount, hasAutoSaved, hasGameSaved)
	local keyPrev = 0
	local keyNext = 0

	if hasAutoSaved and hasGameSaved then
		keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
		keyNext = btnIndex % maxCount + 1
	elseif hasAutoSaved and not hasGameSaved then
		if btnIndex == 1 then
			keyPrev = maxCount
			keyNext = 3
		elseif btnIndex == 3 then
			keyPrev = 1
			keyNext = 4
		else
			keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
			keyNext = btnIndex % maxCount + 1
		end
	elseif not hasAutoSaved and hasGameSaved then
		if btnIndex == 2 then
			keyPrev = maxCount
			keyNext = 3
		elseif btnIndex == maxCount then
			keyPrev = maxCount - 1
			keyNext = 2
		else
			keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
			keyNext = btnIndex % maxCount + 1
		end
	elseif btnIndex == 3 then
		keyPrev = maxCount
		keyNext = 4
	elseif btnIndex == maxCount then
		keyPrev = maxCount - 1
		keyNext = 3
	else
		keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
		keyNext = btnIndex % maxCount + 1
	end

	return keyPrev, keyNext
end

function LobbyMainCtrl.GetLoadMenuIndices(btnIndex, maxCount, hasAutosaved)
	local keyPrev = 0
	local keyNext = 0

	if hasAutosaved then
		keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
		keyNext = btnIndex % maxCount + 1
	elseif btnIndex <= 2 then
		keyPrev = maxCount
		keyNext = 3
	elseif btnIndex == maxCount then
		keyPrev = maxCount - 1
		keyNext = 2
	else
		keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
		keyNext = btnIndex % maxCount + 1
	end

	SystemHelper.Log(keyPrev .. " <-- " .. btnIndex .. " --> " .. keyNext)

	return keyPrev, keyNext
end

function LobbyMainCtrl.GetNavIndices(btnIndex, maxCount)
	local keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
	local keyNext = btnIndex % maxCount + 1

	return keyPrev, keyNext
end

function LobbyMainCtrl.GetSubIndices(currIdx, maxCount, excluded)
	local keyPrev = (currIdx - 2 + maxCount) % maxCount + 1
	local keyNext = currIdx % maxCount + 1

	while keyPrev == excluded do
		keyPrev = (keyPrev - 2 + maxCount) % maxCount + 1
	end

	while keyNext == excluded do
		keyNext = keyNext % maxCount + 1
	end

	return keyPrev, keyNext
end

function LobbyMainCtrl.UpdateRootBtns()
	local hasAutosaved = LS_Autosave.IsReadable(LS_Account.userId)
	local hasGameSaved = LS_Game.HasSaveData(LS_Account.userId)
	local idxHead = 3

	if hasAutosaved then
		idxHead = 1
	elseif hasGameSaved then
		idxHead = 2
	end

	local buttons = pnlRoot.navBar.navRoot.btns
	local idxTail = pnlRoot.navBar.navRoot.btnCnt
	local btnCount = idxTail
	local btnHead = buttons[idxHead]
	local btnTail = buttons[idxTail]
	local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
	local btnCfgArr = LobbyMainCfg.LobbyRoot

	if btnHead then
		local keyPrev, keyNext = LobbyMainCtrl.GetNavBtnIndices(idxHead, btnCount, hasAutosaved, hasGameSaved)

		btnHead:SetAdjacent(XButton.Adjacent.UP, btnCfgArr[keyPrev][btnKeyIdx])
		btnHead:SetAdjacent(XButton.Adjacent.DOWN, btnCfgArr[keyNext][btnKeyIdx])
	end

	if btnTail then
		local keyPrev, keyNext = LobbyMainCtrl.GetNavBtnIndices(idxTail, btnCount, hasAutosaved, hasGameSaved)

		btnTail:SetAdjacent(XButton.Adjacent.UP, btnCfgArr[keyPrev][btnKeyIdx])
		btnTail:SetAdjacent(XButton.Adjacent.DOWN, btnCfgArr[keyNext][btnKeyIdx])
	end
end

function LobbyMainCtrl.OnCreate()
	popQuit = false
	sceneController = ST_Lobby.GetSceneController()

	UILayerCtrl.SetSceneController(sceneController)

	isWait = false
	previousBtnIndex = 0
	currentBtnIndex = 1
	subNavIndex = 1
	subNavSelect = 1
	controlEnable = true
	bRefresh = true

	if AppVer == AppAppleLight then
		inputMgr:SetLuaReturnToTitle(function()
			if UIManager.IsMovieMode() then
				UIManager.MovieMode(false)
			end

			LS_Setting.Reset()
			LS_Setting.Load(1)
			UIManager.RefreshLanguage()
			UIManager.SendMessage("MsgBoxSimple", "CloseMessage")
			UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
			UIManager.SendMessage("Setting", "ClosePanel")
			LobbyMainCtrl.SetLogoLocalized()
			XObjectPool.ClearImage()
			UILayerCtrl.Clear()
			ST_Scene.ChangeScene(ST_Scene.SceneType.LobbyReload)
		end)
	end

	UILayerCtrl.Add("AnnouncementLobby", LobbyMainCtrl.CloseAnnouncement)
	UILayerCtrl.Add("LobbyRoot", LobbyMainCtrl.ClosePanel)
	UILayerCtrl.Add("SubNavGame")
	UILayerCtrl.Add("SubNavLevel")
	UILayerCtrl.Add("SubNavItem")
	UILayerCtrl.Add("Local")
	UILayerCtrl.Add("Heroes")
	UILayerCtrl.Add("HeroesAR")
	UILayerCtrl.Add("Season")
	UILayerCtrl.Add("MsgBoxSimple")
	UILayerCtrl.Add("LobbyTopBar")
	UILayerCtrl.Add("SubGameMode", LobbyMainCtrl.HidePanelGameMode)
	UILayerCtrl.Add("SubNewGame", LobbyMainCtrl.HidePanelNewGame)
	UILayerCtrl.Add("SubLoadGame", LobbyMainCtrl.HidePanelLoadGame)
	UILayerCtrl.Add("SubEditSave", LobbyMainCtrl.HideSubLoadEdit)
	UILayerCtrl.Add("Feedback", LobbyMainCtrl.ClosePanelFeedback)
	UILayerCtrl.Add("ChallengeMode", LobbyMainCtrl.ClosePanelChallengeMode)
	UILayerCtrl.Add("Arcade", LobbyMainCtrl.ClosePanelArcadeMode)
	UILayerCtrl.Add("SubNavDLC", LobbyMainCtrl.BackToNavRoot)
	UILayerCtrl.Add("PanelDLC", LobbyMainCtrl.BackToSubNavDLC)

	uiGroup = {}

	local homeGroup = {}

	homeGroup.show = false
	homeGroup.com = this.mainComponent:GetGroupByName("homepage")

	homeGroup.com:SetActive(homeGroup.show)

	uiGroup.home = homeGroup
	dlcLogo = this.mainComponent:GetGameObject("Panel_Root_DLC_Logo_LB")
	dlcLogo = XImage:new(dlcLogo)
	dlcElena = this.mainComponent:GetGameObject("Panel_Root_DLC_Elena")
	dlcElena = XImage:new(dlcElena)

	if AppVer == AppTapTapCloudDemo then
		dlcLogo.gameObject:SetActive(false)
	end

	dlcElena.gameObject:SetActive(false)
	dlcLogo.gameObject:SetActive(false)

	local imageSceneMask = this.mainComponent:GetGameObject("Image_SceneMask")

	imageSceneMask:SetActive(true)

	local imageCg = imageSceneMask:GetComponent("CanvasGroup")

	imageCg.alpha = 0
	maskTween = Tween:new(imageCg)
	imageLogo = this.mainComponent:GetGameObject("Image_Logo")
	renderTextureCamera = imageLogo.transform:Find("vfx_LogoGroup/RenderTextureCamera").gameObject:GetComponent("Camera")

	UIManager.RefreshLanguage()
	LobbyMainCtrl.SetLogoLocalized()

	pnlRoot = {}
	pnlRoot.go = this.mainComponent:GetGameObject("LobbyMain_Root")
	pnlRoot.pnls = {}
	pnlRoot.twPnls = {}

	local pnlArr = LobbyMainCfg.PanelRoot
	local pnlCnt = table.nums(pnlArr)

	for i = 1, pnlCnt do
		pnlRoot.pnls[i] = this.mainComponent:GetGameObject(pnlArr[i])

		pnlRoot.pnls[i]:SetActive(false)

		pnlRoot.twPnls[i] = pnlRoot.pnls[i]:GetComponent("XTween")
	end

	pnlUser = {}
	pnlUser.go = this.mainComponent:GetGameObject("LobbyMain_User_L")
	pnlUser.textName = this.mainComponent:GetText("LobbyMain_User_Name")
	pnlUser.textLevel = this.mainComponent:GetText("LobbyMain_User_Level")

	if LS_Account ~= nil and LS_Account.userName ~= nil then
		LobbyMainCtrl.SetNameAndLevel(LS_Account.userName, "Lv 1")
	end

	pnlUser.button = this.mainComponent:GetButton("LobbyMain_User_L")

	pnlUser.button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LobbyMainCtrl.ShowPanelTop(false)
		UIManager.CreateCtrl("SelfInfo")
	end, 0)
	pnlUser.button:SetAdjacent(XButton.Adjacent.RIGHT, "Panel_Start_Panel_Top_Button_Active")
	UILayerCtrl.AddButton("LobbyTopBar", "LobbyMain_User_L", pnlUser.button)

	pnlUser.portraitFrame = this.mainComponent:GetGameObject("LobbyMain_User_PortraitFrame")
	pnlUser.portraitIcon = this.mainComponent:GetGameObject("LobbyMain_User_PortraitIcon")
	pnlRoot.activation = {}

	if AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs then
		pnlRoot.activation.show = not LS_Setting.activated
	elseif AppVer == AppTapTapEA and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
		pnlRoot.activation.show = not LS_Setting.activated
	else
		pnlRoot.activation.show = false
	end

	pnlRoot.activation.go = this.mainComponent:GetGameObject("LobbyMain_Root_Activation")

	pnlRoot.activation.go:SetActive(pnlRoot.activation.show)

	pnlRoot.activation.btnActivation = this.mainComponent:GetButton("LobbyMain_Root_Activation_ButtonActivate_LB")

	pnlRoot.activation.btnActivation:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.OpenDialog()
		UIManager.CreateCtrl("Activation")
	end, 0)

	pnlRoot.activation.showBtnActivation = false

	pnlRoot.activation.btnActivation.gameObject:SetActive(false)
	UILayerCtrl.AddButton("LobbyRoot", "LobbyMain_Root_Activation_ButtonActivate_LB", pnlRoot.activation.btnActivation)

	pnlDLC = {}
	pnlDLC.go = this.mainComponent:GetGameObject("LobbyMain_PanelDLC")
	pnlDLC.show = false
	pnlDLC.button = this.mainComponent:GetButton("LobbyMain_PanelDLC_BtnPurchase")

	pnlDLC.button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LobbyMainCtrl.BackToSubNavDLC()
		LobbyMainCtrl.BackToNavRoot()
		LobbyMainCtrl.OnButtonDLCs()
	end, 0)
	UILayerCtrl.AddButton("PanelDLC", "LobbyMain_PanelDLC_BtnPurchase", pnlDLC.button)

	pnlDLC.btnBack = this.mainComponent:GetButton("LobbyMain_PanelDLC_BtnBack")

	pnlDLC.btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LobbyMainCtrl.BackToSubNavDLC()
	end, 0)
	UILayerCtrl.AddIndividual("PanelDLC", "LobbyMain_PanelDLC_BtnBack", pnlDLC.btnBack)

	pnlDLC.goImage = this.mainComponent:GetGameObject("LobbyMain_PanelDLC_Image")
	pnlDLC.image = XImage:new(pnlDLC.goImage)
	pnlDLC.goScroll = this.mainComponent:GetGameObject("PanelDLC_Detail_Scroll")
	pnlDLC.scrollRect = XScrollRect:new(pnlDLC.goScroll)
	pnlDLC.txtIntro = this.mainComponent:GetText("PanelDLC_Detail_Text")
	pnlDLC.introRectTf = pnlDLC.txtIntro.gameObject:GetComponent("RectTransform")
	pnlDLC.normalizedY = 1

	pnlDLC.txtIntro:SetGameTextContent(function()
		return GameText.UI_DLC_ITEM_DETAIL_INTRO_dlcarcade
	end)

	pnlDLC.scrollRect.scrollRectCom.normalizedPosition = Vector2.one

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(pnlDLC.introRectTf)

	local rBtnName = {
		"LobbyMain_Reserved_SpBtns_LT",
		"LobbyMain_Reserved_SpBtns_RT",
		"LobbyMain_Reserved_SpBtns_LB",
		"LobbyMain_Reserved_SpBtns_RB"
	}

	pnlRoot.reserved = {}
	pnlRoot.reserved.show = true
	pnlRoot.reserved.go = this.mainComponent:GetGameObject("LobbyMain_Reserved_SpBtns")

	pnlRoot.reserved.go:SetActive(pnlRoot.reserved.show)

	pnlRoot.reserved.btns = {}
	pnlRoot.reserved.btnState = {
		0,
		0,
		0,
		0
	}
	pnlRoot.reserved.btnPattern = {
		{
			1,
			1,
			1,
			0,
			3
		},
		{
			1,
			1,
			1,
			1,
			4
		}
	}

	function pnlRoot.reserved.btnProcess(obj, data)
		for i = 2, #pnlRoot.reserved.btnPattern do
			local btnCount = 0

			for j = 1, 4 do
				if pnlRoot.reserved.btnState[j] == 1 and pnlRoot.reserved.btnPattern[i][j] > 0 then
					btnCount = btnCount + 1
				end
			end

			if btnCount == pnlRoot.reserved.btnPattern[i][5] then
				SystemHelper.Log("Trigger Special: " .. i)

				if i == 1 then
					sceneController:ForcePlaying()
				elseif i == 2 then
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", "TIPSWORKS PRESENTS", function()
						for i = 1, 4 do
							if pnlRoot.reserved.btnState[i] == 1 then
								pnlRoot.reserved.btnState[i] = 0
							end
						end
					end, function()
						for i = 1, 4 do
							if pnlRoot.reserved.btnState[i] == 1 then
								pnlRoot.reserved.btnState[i] = 0
							end
						end
					end, true)
				end

				SystemHelper.Log("Found $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

				break
			end

			local print_r = require("3rd/sproto/print_r")

			print_r(pnlRoot.reserved.btnState)
		end

		SystemHelper.Log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
	end

	for i = 1, 4 do
		local btn = this.mainComponent:GetButton(rBtnName[i])

		btn:SetAudioEnable(false)
		btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			pnlRoot.reserved.btnState[i] = 3

			SystemHelper.Log("PDn " .. i)
		end, 0)
		btn:SetEventCallBack(EventTriggerType.BeginDrag, function(obj, data)
			pnlRoot.reserved.btnState[i] = 2

			SystemHelper.Log("PDg Begin " .. i)
		end, 0)
		btn:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
			SystemHelper.Log("PDg Grag " .. i)
		end, 0)
		btn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
			pnlRoot.reserved.btnState[i] = 1

			SystemHelper.Log("PUp " .. i)
			pnlRoot.reserved.btnProcess(obj, data)
		end, 0)
		btn:SetEventCallBack(EventTriggerType.EndDrag, function(obj, data)
			SystemHelper.Log("PDg End " .. i)
		end, 0)

		pnlRoot.reserved.btns[i] = btn
	end

	pnlRoot.navBar = {}
	pnlRoot.navBar.show = true
	pnlRoot.navBar.go = this.mainComponent:GetGameObject("LobbyMain_Root_NavBar")

	pnlRoot.navBar.go:SetActive(true)

	pnlRoot.navBar.navRoot = {}
	pnlRoot.navBar.navRoot.show = true
	pnlRoot.navBar.navRoot.go = this.mainComponent:GetGameObject("LobbyMain_Root_NavBtns_RB")

	pnlRoot.navBar.navRoot.go:SetActive(pnlRoot.navBar.navRoot.show)

	pnlRoot.navBar.navRoot.btns = {}
	pnlRoot.navBar.navRoot.cb = {}

	local hasAutosaved = LS_Autosave.IsReadable(LS_Account.userId)
	local hasGameSaved = LS_Game.HasSaveData(LS_Account.userId)
	local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
	local btnCbIdx = LobbyMainCtrl.BtnCbIdx
	local btnCfgArr = LobbyMainCfg.LobbyRoot
	local btnCount = table.nums(btnCfgArr)
	local hasQuitGame = Platform == PlatformType.MAC or Platform == PlatformType.PC

	if not hasQuitGame then
		btnCount = btnCount - 1
	end

	pnlRoot.navBar.navRoot.btnCnt = btnCount
	pnlRoot.navBar.navRoot.hasQuit = hasQuitGame

	for i = 1, btnCount do
		local btnKey = btnCfgArr[i][btnKeyIdx]
		local keyPrev, keyNext = LobbyMainCtrl.GetNavBtnIndices(i, btnCount, hasAutosaved, hasGameSaved)

		pnlRoot.navBar.navRoot.cb[i] = LobbyMainCtrl[btnCfgArr[i][btnCbIdx]]

		local btn = this.mainComponent:GetButton(btnKey)

		if btn then
			btn.gameObject.transform:SetAsLastSibling()

			if i == 1 then
				btn.gameObject:SetActive(hasAutosaved)
			elseif i == 2 then
				btn.gameObject:SetActive(hasGameSaved)
			else
				btn.gameObject:SetActive(true)
			end

			btn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
				bRefresh = true
			end, 0)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				SystemHelper.Log("[ > NavBtn " .. i .. " ]")

				currentBtnIndex = i
				previousBtnIndex = i

				LobbyMainCtrl.BackToNavRoot()
				UILayerCtrl.OnSelect(btnKey)
				btn:SetSelectedLight(false)
				pnlRoot.navBar.navRoot.cb[i]()
			end, 0)
			btn:SetAdjacent(XButton.Adjacent.UP, btnCfgArr[keyPrev][btnKeyIdx])
			btn:SetAdjacent(XButton.Adjacent.DOWN, btnCfgArr[keyNext][btnKeyIdx])

			if DLC_Elena then
				btn:SetAdjacent(XButton.Adjacent.LEFT, "LobbyMain_Root_DLC_Entry_LB")
			end

			pnlRoot.navBar.navRoot.btns[i] = btn

			UILayerCtrl.AddButton("LobbyRoot", btnKey, btn)
		end
	end

	local btnDlcEntry = this.mainComponent:GetButton("LobbyMain_Root_DLC_Entry_LB")

	if btnDlcEntry then
		btnDlcEntry.gameObject:SetActive(true)
		btnDlcEntry:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LobbyMainCtrl.OpenPanelDLC()
		end, 0)
		btnDlcEntry:SetAdjacent(XButton.Adjacent.RIGHT, btnCfgArr[currentBtnIndex][btnKeyIdx])

		pnlRoot.navBar.navRoot.btnDlcEntry = btnDlcEntry
		dlcEntry = btnDlcEntry

		UILayerCtrl.AddButton("SubNavDLC", "LobbyMain_Root_DLC_Entry_LB", btnDlcEntry)
	end

	if btnDlcEntry then
		btnDlcEntry:SetAudioEnable(false)
		btnDlcEntry:SetInteractable(false)
		btnDlcEntry.gameObject:SetActive(false)
	end

	pnlRoot.navBar.navGame = {}
	pnlRoot.navBar.navGame.show = false
	pnlRoot.navBar.navGame.go = this.mainComponent:GetGameObject("LobbyMain_Game_NavBtns_R")

	pnlRoot.navBar.navGame.go:SetActive(pnlRoot.navBar.navGame.show)

	pnlRoot.navBar.navGame.btns = {}
	pnlRoot.navBar.navGame.cb = {}
	pnlRoot.navBar.navGame.idxSel = 1
	pnlRoot.navBar.navLevel = {}
	pnlRoot.navBar.navLevel.show = false
	pnlRoot.navBar.navLevel.selecting = false
	pnlRoot.navBar.navLevel.go = this.mainComponent:GetGameObject("LobbyMain_Level_NavBtns_R")

	pnlRoot.navBar.navLevel.go:SetActive(pnlRoot.navBar.navLevel.show)

	pnlRoot.navBar.navLevel.btns = {}
	pnlRoot.navBar.navLevel.cb = {}
	pnlRoot.navBar.navLevel.idxSel = 1
	pnlRoot.navBar.navLevel.btnCnt = 0
	pnlRoot.navBar.navItem = {}
	pnlRoot.navBar.navItem.show = false
	pnlRoot.navBar.navItem.selecting = false
	pnlRoot.navBar.navItem.go = this.mainComponent:GetGameObject("LobbyMain_Item_NavBtns_R")

	pnlRoot.navBar.navItem.go:SetActive(pnlRoot.navBar.navItem.show)

	pnlRoot.navBar.navItem.btns = {}
	pnlRoot.navBar.navItem.cb = {}
	pnlRoot.navBar.navItem.idxSel = 1

	local subGameMode = {}

	pnlRoot.subGameMode = subGameMode
	subGameMode.selectedGameMode = BattleData.GlobalDifficultyLevel.Normal
	subGameMode.show = false
	subGameMode.go = this.mainComponent:GetGameObject("LobbyMain_SubMode")
	subGameMode.intro = this.mainComponent:GetText("LobbyMain_SubMode_IntroText")

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubMode_BtnBack")

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LobbyMainCtrl.HidePanelGameMode()
		end, 0)
		UILayerCtrl.AddIndividual("SubGameMode", "LobbyMain_Root_SubMode_BtnBack", btn)
	end

	subGameMode.btnBack = btn

	local btn = this.mainComponent:GetButton("LobbyMain_SubMode_BtnCasual")

	if btn then
		btn:SetAdjacent(XButton.Adjacent.RIGHT, "LobbyMain_SubMode_BtnNormal")
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			subGameMode.selectedGameMode = BattleData.GlobalDifficultyLevel.Casual
			subGameMode.btnCasualSelShow = true

			subGameMode.btnCasualSel:SetActive(true)

			subGameMode.btnNormalSelShow = false

			subGameMode.btnNormalSel:SetActive(false)
			subGameMode.btnCasual:SetNormal()
			subGameMode.btnNormal:SetNormal()
			subGameMode.intro:SetContent(GameText.UI_ANNO_GAMEMODE_CASUAL)
			UILayerCtrl.OnSelect("LobbyMain_SubMode_BtnCasual")
		end, 0)
		UILayerCtrl.AddButton("SubGameMode", "LobbyMain_SubMode_BtnCasual", btn)
	end

	subGameMode.btnCasual = btn
	subGameMode.btnCasualSel = this.mainComponent:GetGameObject("LobbyMain_SubMode_BtnCasualSel")
	subGameMode.btnCasualSelShow = false

	local btn = this.mainComponent:GetButton("LobbyMain_SubMode_BtnNormal")

	if btn then
		btn:SetAdjacent(XButton.Adjacent.LEFT, "LobbyMain_SubMode_BtnCasual")
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			subGameMode.selectedGameMode = BattleData.GlobalDifficultyLevel.Normal
			subGameMode.btnCasualSelShow = false

			subGameMode.btnCasualSel:SetActive(false)

			subGameMode.btnNormalSelShow = true

			subGameMode.btnNormalSel:SetActive(true)
			subGameMode.btnCasual:SetNormal()
			subGameMode.btnNormal:SetNormal()
			subGameMode.intro:SetContent(GameText.UI_ANNO_GAMEMODE_NORMAL)
			UILayerCtrl.OnSelect("LobbyMain_SubMode_BtnNormal")
		end, 0)
		UILayerCtrl.AddButton("SubGameMode", "LobbyMain_SubMode_BtnNormal", btn)
	end

	subGameMode.btnNormal = btn
	subGameMode.btnNormalSel = this.mainComponent:GetGameObject("LobbyMain_SubMode_BtnNormalSel")
	subGameMode.btnNormalSelShow = false

	local btn = this.mainComponent:GetButton("LobbyMain_SubMode_BtnConfirm")

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ANNO_NEWGAME_MODECONFIRM, function()
				this.HidePanelGameMode()
				this.ShowPanelNewGame()
			end, function()
				return
			end, false)
		end, 0)
		UILayerCtrl.AddIndividual("SubGameMode", "LobbyMain_SubMode_BtnConfirm", btn)
	end

	subGameMode.btnConfirm = btn

	local subNewGame = {}

	pnlRoot.subNewGame = subNewGame
	subNewGame.show = false
	subNewGame.go = this.mainComponent:GetGameObject("LobbyMain_Root_SubNew")
	subNewGame.idxNav = 1
	subNewGame.idxSel = 1
	subNewGame.startupQueue = {}

	table.insert(subNewGame.startupQueue, 0)

	subNewGame.startupShow = false

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubNew_BtnBack")

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LobbyMainCtrl.HidePanelNewGame()
		end, 0)
		UILayerCtrl.AddIndividual("SubNewGame", "LobbyMain_Root_SubNew_BtnBack", btn)
	end

	subNewGame.btnBack = btn
	subNewGame.showCmdBar = false
	subNewGame.pnlCmd = this.mainComponent:GetGameObject("LobbyMain_Root_SubNew_Buttons")

	subNewGame.pnlCmd:SetActive(false)

	subNewGame.showNew = true

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubNew_BtnNew")

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			return
		end, 0)
	end

	subNewGame.btnNew = btn
	subNewGame.btns = {}

	local slotBtnNamePrefix = "NewGame_SlotBtn"
	local userId = LS_Account.userId

	loaderNewGame = this.mainComponent:GetLoader("LobbyMain_Root_SubNew_Loader")
	loaderNewGame.loadCount = 3
	loaderNewGame.loadStepping = 0
	loaderNewGame.loadFinished = false

	function loaderNewGame.loadCallback(index, com, data)
		local bodyBtn = {}

		bodyBtn.idx = index
		bodyBtn.status = LobbyMainCtrl.Status.Blank
		bodyBtn.selected = com:GetGameObject("Lobby_SaveSlot_Sel")
		bodyBtn.blank = com:GetGameObject("Lobby_SaveSlot_Blank")
		bodyBtn.inEdit = com:GetGameObject("Lobby_SaveSlot_InEdit")
		bodyBtn.inCopy = com:GetGameObject("Lobby_SaveSlot_InCopy")

		local inUse = {}

		inUse.go = com:GetGameObject("Lobby_SaveSlot_InUse")
		inUse.location = com:GetText("Lobby_SaveSlot_InUse_PlaceValue")
		inUse.level = com:GetText("Lobby_SaveSlot_InUse_LevelValue")
		inUse.playtime = com:GetText("Lobby_SaveSlot_InUse_PlaytimeValue")
		inUse.savetime = com:GetText("Lobby_SaveSlot_InUse_SavetimeValue")
		inUse.gamemode = com:GetText("Lobby_SaveSlot_InUse_ModeValue")
		inUse.roundcount = com:GetText("Lobby_SaveSlot_InUse_RoundValue")
		bodyBtn.inUse = inUse

		local hasSaveData = LS_Game.IsReadable(userId, index)

		if hasSaveData then
			local slotData = LS_Setting.saveSlotStatus[index]

			if slotData then
				local location = slotData[LS_Setting.SlotStatus.Location]

				if location > 0 then
					local level = slotData[LS_Setting.SlotStatus.Level]
					local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
					local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
					local gMode = slotData[LS_Setting.SlotStatus.GameMode]
					local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

					SystemHelper.Log("[ " .. index .. " ===> L: " .. location .. ", Lv." .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")

					local pnl = bodyBtn.inUse
					local playTime = TimeHelper.getTimeSpan(pTime)

					pnl.location:SetGameTextContent(function()
						local siteData = MS_SiteInfo.GetSite(location)

						if siteData then
							return siteData.Name
						else
							return "Not defined"
						end
					end)

					local ts, tzo = TimeHelper.getUtcTime()

					SystemHelper.Log(os.time())
					SystemHelper.Log(TimeHelper.getUTC())
					SystemHelper.Log(ts .. " - " .. tzo / 3600)
					pnl.level:SetContent(level)
					pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
					pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

					if gMode == BattleData.GlobalDifficultyLevel.Casual then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
					else
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
					end

					pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
					bodyBtn.inUse.go:SetActive(true)
				end
			end
		else
			bodyBtn.blank:SetActive(true)
		end

		local btn = com:GetButton("Lobby_SaveSlot_Btn")

		if btn then
			btn.idx = index

			btn.gameObject:SetActive(true)
			btn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				SystemHelper.Log(string.format("[ SubNewGame: => %d ]", index))
				UILayerCtrl.OnSelect(string.format("NewGame_SlotBtn%d", index))

				if LS_Game.IsReadable(LS_Account.userId, index) then
					UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_LOBBY_CAUSION_REPLACE_SAVEDATA, function()
						LS_Setting.SetLastSaveSlot(bodyBtn.idx)
						LS_Setting.Update()
						this.OnButtonGameStart(pnlRoot.subGameMode.selectedGameMode)
					end, function()
						return
					end, false)
				else
					LS_Setting.SetLastSaveSlot(bodyBtn.idx)
					LS_Setting.Update()
					this.OnButtonGameStart(pnlRoot.subGameMode.selectedGameMode)
				end
			end, 0)

			local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(index, 3)
			local keyC = string.format("%s%d", slotBtnNamePrefix, index)

			btn:SetAdjacent(XButton.Adjacent.UP, string.format("%s%d", slotBtnNamePrefix, keyPrev))
			btn:SetAdjacent(XButton.Adjacent.DOWN, string.format("%s%d", slotBtnNamePrefix, keyNext))
			UILayerCtrl.AddButton("SubNewGame", keyC, btn)

			bodyBtn.btn = btn
			subNewGame.btns[index] = bodyBtn
			loaderNewGame.loadStepping = loaderNewGame.loadStepping + 1
			loaderNewGame.loadFinished = loaderNewGame.loadStepping == loaderNewGame.loadCount
		end
	end

	loaderNewGame:PreloadTemplate(function()
		loaderNewGame:Load()
	end)

	local subLoadGame = {}

	pnlRoot.subLoadGame = subLoadGame
	subLoadGame.show = false
	subLoadGame.go = this.mainComponent:GetGameObject("LobbyMain_Root_SubLoad")
	subLoadGame.isInEditMode = false
	subLoadGame.idxNav = 1
	subLoadGame.idxSel = 1
	subLoadGame.idxCpySrc = 0

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubLoad_BtnBack")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LobbyMainCtrl.HidePanelLoadGame()
		end, 0)
		UILayerCtrl.AddIndividual("SubLoadGame", "LobbyMain_Root_SubLoad_BtnBack", btn)
	end

	subLoadGame.btnBack = btn
	subLoadGame.showCmdBar = true
	subLoadGame.pnlCmd = this.mainComponent:GetGameObject("LobbyMain_Root_SubLoad_Buttons")

	subLoadGame.pnlCmd:SetActive(true)

	subLoadGame.showLoad = true
	subLoadGame.showConfirm = false
	subLoadGame.showBack = false

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubLoad_Edit_BtnLoad")

	subLoadGame.btnCmdLoad = btn

	UILayerCtrl.AddIndividual("SubLoadGame", "LobbyMain_Root_SubLoad_Edit_BtnLoad", btn)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local slotIdx = subLoadGame.idxSel
			local userId = LS_Account.userId

			if slotIdx == 1 and LS_Autosave.IsReadable(userId) then
				SystemHelper.Log("[ Continue autosave: 0 ]")
				LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
				FS_UserData.Reset()
				BattleData.SetHeroId(0)

				if LS_Autosave.Load(userId) then
					if gameConfig.storyMode == FS_SaveStory.StoryMode.BossTimeChallenge then
						FS_UserData.challenge:SetSaveSlot(slotIdx)
						LobbyMainCtrl.ShowPanelchallengeMode(true)
					else
						local difficulty = FS_UserData.story:GetDifficulty()

						BattleData.SetDifficulty(difficulty)
						LS_PlayerBehavior.Load(userId, true)

						local ret = FS_UserData.story:ContinueGame()

						if ret == true then
							sceneController:ChooseHeroIdConfirm()
						end
					end
				end
			elseif LS_Game.IsReadable(userId, slotIdx - 1) then
				slotIdx = slotIdx - 1

				SystemHelper.Log("[ Save last slot index: " .. slotIdx)
				LS_Setting.SetLastSaveSlot(slotIdx)
				LS_Setting.Update()
				LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
				FS_UserData.Reset()
				BattleData.SetHeroId(0)

				if LS_Game.Load(userId, slotIdx) then
					if gameConfig.storyMode == FS_SaveStory.StoryMode.BossTimeChallenge then
						FS_UserData.challenge:SetSaveSlot(slotIdx + 1)
						LobbyMainCtrl.ShowPanelchallengeMode(true)
					else
						local difficulty = FS_UserData.story:GetDifficulty()

						BattleData.SetDifficulty(difficulty)
						LS_PlayerBehavior.Load(userId)

						local ret = FS_UserData.story:ContinueGame()

						if ret == true then
							sceneController:ChooseHeroIdConfirm()
						end
					end
				end
			else
				SystemHelper.Log("[ No savedata " .. userId .. " - " .. slotIdx .. " ]")
			end
		end, 0)
	end

	subLoadGame.goCmdLoad = this.mainComponent:GetGameObject("LobbyMain_Root_SubLoad_Edit_BtnLoad")

	subLoadGame.goCmdLoad:SetActive(subLoadGame.showLoad)

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubLoad_Edit_BtnConfirm")

	subLoadGame.btnCmdConfirm = btn

	UILayerCtrl.AddIndividual("SubEditSave", "LobbyMain_Root_SubLoad_Edit_BtnConfirm", btn)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local userId = LS_Account.userId
			local slotIdx = subLoadGame.idxSel - 1

			if LS_Game.IsReadable(userId, slotIdx) then
				SystemHelper.Log("[ => Save exists @ slot " .. slotIdx .. " ]")
				UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_LOBBY_CAUSION_REPLACE_SAVEDATA, function()
					SystemHelper.Log("R复制到这里 确定" .. subLoadGame.idxCpySrc .. " => " .. slotIdx)

					local ret = this.CopySaveData(subLoadGame.idxCpySrc, subLoadGame.idxSel - 1)

					if ret == true then
						SystemHelper.Log("R复制 成功")
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CAUSION_COPY_SAVEDATA_FAILED)
						SystemHelper.Log("R复制 失败!!!!!!!!!!!!")
					end

					local idxCpySrc = this.ExitSubLoadEdit()

					subLoadGame.idxSel = idxCpySrc

					UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. idxCpySrc)
					LobbyMainCtrl.RevalidateTitle()
					LobbyMainCtrl.RevalidateNewGame()
					LobbyMainCtrl.RevalidateLoadGame()
				end, function()
					return
				end, false)
			else
				SystemHelper.Log("ECopy to empty slot: " .. subLoadGame.idxCpySrc .. " => " .. slotIdx)

				local ret = this.CopySaveData(subLoadGame.idxCpySrc, subLoadGame.idxSel - 1)

				if ret == true then
					SystemHelper.Log("E复制 成功")
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CAUSION_COPY_SAVEDATA_FAILED)
					SystemHelper.Log("E复制 失败!!!!!!!!!!!!")
				end

				local idxCpySrc = this.ExitSubLoadEdit()

				subLoadGame.idxSel = idxCpySrc

				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. idxCpySrc)
				LobbyMainCtrl.RevalidateTitle()
				LobbyMainCtrl.RevalidateNewGame()
				LobbyMainCtrl.RevalidateLoadGame()
			end
		end, 0)
	end

	subLoadGame.goCmdConfirm = this.mainComponent:GetGameObject("LobbyMain_Root_SubLoad_Edit_BtnConfirm")

	subLoadGame.goCmdConfirm:SetActive(subLoadGame.showConfirm)

	local btn = this.mainComponent:GetButton("LobbyMain_Root_SubLoad_Edit_BtnBack")

	subLoadGame.btnCmdBack = btn

	UILayerCtrl.AddIndividual("SubEditSave", "LobbyMain_Root_SubLoad_Edit_BtnBack", btn)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LobbyMainCtrl.HideSubLoadEdit()
		end, 0)
	end

	subLoadGame.goCmdBack = this.mainComponent:GetGameObject("LobbyMain_Root_SubLoad_Edit_BtnBack")

	subLoadGame.goCmdBack:SetActive(subLoadGame.showBack)

	subLoadGame.showNavBar = true
	subLoadGame.navBar = this.mainComponent:GetGameObject("LobbyMain_SubLoad_NavBar_B")
	subLoadGame.btns = {}

	local slotBtnNamePrefix = "LoadGame_SlotBtn"
	local userId = LS_Account.userId

	subLoadGame.goAutosave = this.mainComponent:GetGameObject("LobbyMain_Root_SubAuto_Loader")

	subLoadGame.goAutosave:SetActive(hasAutosaved)

	loaderAutosave = this.mainComponent:GetLoader("LobbyMain_Root_SubAuto_Loader")
	loaderAutosave.loadCount = 1
	loaderAutosave.loadStepping = 0
	loaderAutosave.loadFinished = false

	function loaderAutosave.loadCallback(index, com, data)
		local bodyBtn = {}

		bodyBtn.idx = index
		bodyBtn.status = LobbyMainCtrl.Status.Blank
		bodyBtn.selected = com:GetGameObject("Lobby_SaveSlot_Sel")
		bodyBtn.blank = com:GetGameObject("Lobby_SaveSlot_Blank")
		bodyBtn.inEdit = com:GetGameObject("Lobby_SaveSlot_InEdit")
		bodyBtn.inCopy = com:GetGameObject("Lobby_SaveSlot_InCopy")

		local inUse = {}

		inUse.go = com:GetGameObject("Lobby_SaveSlot_InUse")
		inUse.location = com:GetText("Lobby_SaveSlot_InUse_PlaceValue")
		inUse.level = com:GetText("Lobby_SaveSlot_InUse_LevelValue")
		inUse.playtime = com:GetText("Lobby_SaveSlot_InUse_PlaytimeValue")
		inUse.savetime = com:GetText("Lobby_SaveSlot_InUse_SavetimeValue")
		inUse.gamemode = com:GetText("Lobby_SaveSlot_InUse_ModeValue")
		inUse.roundcount = com:GetText("Lobby_SaveSlot_InUse_RoundValue")
		bodyBtn.inUse = inUse

		local btnDel = com:GetButton("Lobby_SaveSlot_InEdit_Delete")

		btnDel.gameObject:SetActive(false)

		bodyBtn.btnDel = btnDel

		local btnCpy = com:GetButton("Lobby_SaveSlot_InEdit_Copy")

		btnCpy.gameObject:SetActive(false)

		bodyBtn.btnCpy = btnCpy

		local hasSaveData = LS_Autosave.IsReadable(userId)

		if hasSaveData then
			local slotData = LS_Setting.saveSlotStatus[LS_Setting.IndexAutosave]

			if slotData then
				local location = slotData[LS_Setting.SlotStatus.Location]

				if location > 0 then
					local level = slotData[LS_Setting.SlotStatus.Level]
					local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
					local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
					local gMode = slotData[LS_Setting.SlotStatus.GameMode]
					local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

					SystemHelper.Log("[ Autosave ===> L: " .. location .. ", Lv." .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")

					local pnl = bodyBtn.inUse
					local playTime = TimeHelper.getTimeSpan(pTime)

					pnl.location:SetGameTextContent(function()
						local siteData = MS_SiteInfo.GetSite(location)

						if siteData then
							return siteData.Name .. GameText.UI_COMMON_AUTOSAVE
						else
							return "Not defined"
						end
					end)

					local ts, tzo = TimeHelper.getUtcTime()

					pnl.level:SetContent(level)
					pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
					pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

					if gMode == BattleData.GlobalDifficultyLevel.Casual then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
					else
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
					end

					pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
					bodyBtn.inUse.go:SetActive(true)
				else
					bodyBtn.inUse.go:SetActive(false)
				end
			end

			bodyBtn.blank:SetActive(false)
		else
			bodyBtn.blank:SetActive(true)
		end

		local btn = com:GetButton("Lobby_SaveSlot_Btn")

		if btn then
			btn.idx = index

			btn.gameObject:SetActive(true)
			btn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				subLoadGame.idxSel = bodyBtn.idx

				FS_UserData.challenge:SetSaveSlot(index)
				this.RefreshLoadGame(subLoadGame.idxSel)
				SystemHelper.Log("SubLoadGame @ Touch index: " .. subLoadGame.idxSel)
				SystemHelper.Log("[ SubLoadGame: => 0 (Autosave) ]")
				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. index)
				bodyBtn.selected:SetActive(true)
			end, 0)

			local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(index, 4)
			local keyC = slotBtnNamePrefix .. index

			btn:SetAdjacent(XButton.Adjacent.UP, slotBtnNamePrefix .. keyPrev)
			btn:SetAdjacent(XButton.Adjacent.DOWN, slotBtnNamePrefix .. keyNext)
			UILayerCtrl.AddButton("SubLoadGame", keyC, btn)

			bodyBtn.btn = btn
			subLoadGame.btns[index] = bodyBtn
			loaderAutosave.loadStepping = loaderAutosave.loadStepping + 1
			loaderAutosave.loadFinished = loaderAutosave.loadStepping == loaderAutosave.loadCount
		end
	end

	loaderAutosave:PreloadTemplate(function()
		loaderAutosave:Load()
	end)

	local btnIdxOffset = 1

	loaderLoadGame = this.mainComponent:GetLoader("LobbyMain_Root_SubLoad_Loader")
	loaderLoadGame.loadCount = 3
	loaderLoadGame.loadStepping = 0
	loaderLoadGame.loadFinished = false

	function loaderLoadGame.loadCallback(index, com, data)
		local bodyBtn = {}

		bodyBtn.idx = index + btnIdxOffset
		bodyBtn.status = LobbyMainCtrl.Status.Blank
		bodyBtn.selected = com:GetGameObject("Lobby_SaveSlot_Sel")
		bodyBtn.blank = com:GetGameObject("Lobby_SaveSlot_Blank")
		bodyBtn.inEdit = com:GetGameObject("Lobby_SaveSlot_InEdit")
		bodyBtn.inCopy = com:GetGameObject("Lobby_SaveSlot_InCopy")

		local inUse = {}

		inUse.go = com:GetGameObject("Lobby_SaveSlot_InUse")
		inUse.location = com:GetText("Lobby_SaveSlot_InUse_PlaceValue")
		inUse.level = com:GetText("Lobby_SaveSlot_InUse_LevelValue")
		inUse.playtime = com:GetText("Lobby_SaveSlot_InUse_PlaytimeValue")
		inUse.savetime = com:GetText("Lobby_SaveSlot_InUse_SavetimeValue")
		inUse.gamemode = com:GetText("Lobby_SaveSlot_InUse_ModeValue")
		inUse.roundcount = com:GetText("Lobby_SaveSlot_InUse_RoundValue")
		bodyBtn.inUse = inUse

		local btn = com:GetButton("Lobby_SaveSlot_InEdit_Delete")

		if btn then
			btn.idx = bodyBtn.idx

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				LobbyMainCtrl.EraseSaveSlot(btn.idx - 1)
			end, 0)
		end

		bodyBtn.btnDel = btn

		local btn = com:GetButton("Lobby_SaveSlot_InEdit_Copy")

		if btn then
			btn.idx = bodyBtn.idx

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				subLoadGame.idxCpySrc = LobbyMainCtrl.EnterSubLoadEdit(btn.idx - 1)
			end, 0)
		end

		bodyBtn.btnCpy = btn

		local hasSaveData = LS_Game.IsReadable(userId, bodyBtn.idx - 1)

		if hasSaveData then
			local slotData = LS_Setting.saveSlotStatus[bodyBtn.idx - 1]

			if slotData then
				local location = slotData[LS_Setting.SlotStatus.Location]

				if location > 0 then
					local level = slotData[LS_Setting.SlotStatus.Level]
					local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
					local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
					local gMode = slotData[LS_Setting.SlotStatus.GameMode]
					local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

					SystemHelper.Log("[ Slot " .. bodyBtn.idx - 1 .. " ===> Lc: " .. location .. ", Lv: " .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")

					local pnl = bodyBtn.inUse
					local playTime = TimeHelper.getTimeSpan(pTime)

					pnl.location:SetGameTextContent(function()
						local siteData = MS_SiteInfo.GetSite(location)

						if siteData then
							return siteData.Name
						else
							return "Not defined"
						end
					end)

					local ts, tzo = TimeHelper.getUtcTime()

					pnl.level:SetContent(level)
					pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
					pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

					if gMode == BattleData.GlobalDifficultyLevel.Casual then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
					else
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
					end

					pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
					bodyBtn.inUse.go:SetActive(true)
				else
					bodyBtn.inUse.go:SetActive(false)
				end
			end

			bodyBtn.blank:SetActive(false)
		else
			bodyBtn.inUse.go:SetActive(false)
			bodyBtn.blank:SetActive(true)
		end

		local btn = com:GetButton("Lobby_SaveSlot_Btn")

		if btn then
			btn.idx = bodyBtn.idx

			btn.gameObject:SetActive(true)
			btn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				FS_UserData.challenge:SetSaveSlot(bodyBtn.idx)

				subLoadGame.idxSel = btn.idx

				local userId = LS_Account.userId
				local lName = UILayerCtrl.GetCurrentLayerName()

				if lName == "SubLoadGame" then
					SystemHelper.Log("Touch in " .. lName .. " @ " .. subLoadGame.idxSel)

					if LS_Game.IsReadable(userId, btn.idx - 1) then
						bodyBtn.inEdit:SetActive(true)
						SystemHelper.Log("[ EXIST game_" .. userId .. "_" .. btn.idx - 1 .. " ]")
					else
						bodyBtn.inEdit:SetActive(false)
						SystemHelper.Log("[ NO game_" .. userId .. "_" .. btn.idx - 1 .. " ]")
					end
				elseif lName == "SubEditSave" then
					SystemHelper.Log("Touch in " .. lName .. " @ " .. subLoadGame.idxSel)
				end

				this.RefreshLoadGame(subLoadGame.idxSel)
				SystemHelper.Log("[ SubLoadGame: => " .. btn.idx - 1 .. " ]")
				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. subLoadGame.idxSel)
				bodyBtn.selected:SetActive(true)
			end, 0)

			local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(btn.idx - 1 + btnIdxOffset, 3 + btnIdxOffset)
			local keyC = slotBtnNamePrefix .. bodyBtn.idx

			btn:SetAdjacent(XButton.Adjacent.UP, slotBtnNamePrefix .. keyPrev)
			btn:SetAdjacent(XButton.Adjacent.DOWN, slotBtnNamePrefix .. keyNext)
			UILayerCtrl.AddButton("SubLoadGame", keyC, btn)
			UILayerCtrl.AddButton("SubEditSave", keyC, btn)

			bodyBtn.btn = btn
			subLoadGame.btns[btn.idx - 1 + btnIdxOffset] = bodyBtn
			loaderLoadGame.loadStepping = loaderLoadGame.loadStepping + 1
			loaderLoadGame.loadFinished = loaderLoadGame.loadStepping == loaderLoadGame.loadCount
		end
	end

	loaderLoadGame:PreloadTemplate(function()
		loaderLoadGame:Load()
	end)

	btnCfgArr = LobbyMainCfg.LevelDifficulty
	btnCount = table.nums(btnCfgArr)

	for i = 1, btnCount do
		local btnKey = btnCfgArr[i][btnKeyIdx]
		local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(i, btnCount)
		local btn = this.mainComponent:GetButton(btnKey)

		if btn then
			btn.gameObject:SetActive(true)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				SystemHelper.Log(">    SubBtn " .. i)

				subNavIndex = i
				subNavSelect = i

				UILayerCtrl.OnSelect(btnKey)
				btn:SetSelectedLight(false)
				pnlRoot.navBar.navGame.cb[i]()
			end, 0)
			btn:SetAdjacent(XButton.Adjacent.UP, btnCfgArr[keyPrev][btnKeyIdx])
			btn:SetAdjacent(XButton.Adjacent.DOWN, btnCfgArr[keyNext][btnKeyIdx])

			pnlRoot.navBar.navGame.btns[i] = btn

			UILayerCtrl.AddButton("SubNavGame", btnKey, btn)
		end
	end

	loaderLevelList = this.mainComponent:GetLoader("LobbyMain_Level_NavBtns_ScrollViewContent")

	if AppVer ~= AppDemoE3_1906 then
		loaderLevelList.loadCount = MS_StoryList.LevelCount() + 1
	else
		loaderLevelList.loadCount = 2
	end

	pnlRoot.navBar.navLevel.btnCnt = loaderLevelList.loadCount

	local scrollRect = XScrollRect:new(this.mainComponent:GetGameObject("LobbyMain_Level_NavBtns_ScrollView"))
	local rectTf = this.mainComponent:GetGameObject("LobbyMain_Level_NavBtns_ScrollViewContent"):GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 50 * loaderLevelList.loadCount)
	pnlRoot.navBar.navLevel.scrollRect = scrollRect

	function loaderLevelList.loadCallback(index, com, data)
		local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(index, loaderLevelList.loadCount)
		local keyC = "LobbyMain_BtnLv" .. index
		local keyP = "LobbyMain_BtnLv" .. keyPrev
		local keyN = "LobbyMain_BtnLv" .. keyNext
		local storyId = MS_StoryList.GetStoryIdByIndex(index)
		local txt = com:GetText("LobbyMain_BtnLvText")

		if index < loaderLevelList.loadCount then
			txt:SetGameTextContent(function()
				return string.gsub(GameText.UI_LOBBY_TEXT_LEVEL_NUM, "{0}", tostring(storyId))
			end)
		else
			txt:SetGameTextContent(function()
				return GameText.UI_LOBBY_TEXT_COMMON_BACK
			end)
		end

		local btn = com:GetButton("LobbyMain_BtnLv")

		if btn then
			btn.show = true
			btn.storyId = storyId
			btn.prevIdx = keyPrev
			btn.nextIdx = keyNext

			btn:SetParentScroll(scrollRect)
			btn.gameObject:SetActive(true)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				subNavIndex = storyId
				pnlRoot.navBar.navLevel.idxSel = index

				UILayerCtrl.OnSelect(keyC)
				btn:SetSelectedLight(false)
				pnlRoot.navBar.navLevel.cb[index]()
			end, 0)
			btn:SetAdjacent(XButton.Adjacent.UP, keyP)
			btn:SetAdjacent(XButton.Adjacent.DOWN, keyN)

			pnlRoot.navBar.navLevel.btns[index] = btn

			UILayerCtrl.AddButton("SubNavLevel", keyC, btn)
		end
	end

	loaderLevelList:PreloadTemplate(function()
		loaderLevelList:Load()
	end)

	loaderItemList = this.mainComponent:GetLoader("LobbyMain_Items_NavBtns_ScrollViewContent")
	loaderItemList.loadCount = MS_StoryList.MazeLevelCount() + 1

	local scrollRect = XScrollRect:new(this.mainComponent:GetGameObject("LobbyMain_Items_NavBtns_ScrollView"))
	local rectTf = this.mainComponent:GetGameObject("LobbyMain_Items_NavBtns_ScrollViewContent"):GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 50 * loaderItemList.loadCount)
	pnlRoot.navBar.navItem.scrollRect = scrollRect

	function loaderItemList.loadCallback(index, com, data)
		local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(index, loaderItemList.loadCount)
		local keyC = "LobbyMain_BtnLv" .. index
		local keyP = "LobbyMain_BtnLv" .. keyPrev
		local keyN = "LobbyMain_BtnLv" .. keyNext
		local storyId = MS_StoryList.GetMazeStoryIdByIndex(index)
		local txt = com:GetText("LobbyMain_BtnLvText")

		if index < loaderItemList.loadCount then
			txt:SetGameTextContent(function()
				return string.gsub(GameText.UI_LOBBY_TEXT_LEVEL_NUM, "{0}", tostring(storyId))
			end)
		else
			txt:SetGameTextContent(function()
				return GameText.UI_LOBBY_TEXT_COMMON_BACK
			end)
		end

		local btn = com:GetButton("LobbyMain_BtnLv")

		if btn then
			btn:SetParentScroll(scrollRect)
			btn.gameObject:SetActive(true)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				SystemHelper.Log(">>   SubBtn " .. index)

				subNavIndex = storyId
				pnlRoot.navBar.navItem.idxSel = index

				UILayerCtrl.OnSelect(keyC)
				btn:SetSelectedLight(false)
				pnlRoot.navBar.navItem.cb[index]()
			end, 0)
			btn:SetAdjacent(XButton.Adjacent.UP, keyP)
			btn:SetAdjacent(XButton.Adjacent.DOWN, keyN)

			pnlRoot.navBar.navItem.btns[index] = btn

			UILayerCtrl.AddButton("SubNavItem", keyC, btn)
		end
	end

	loaderItemList:PreloadTemplate(function()
		loaderItemList:Load()
	end)
	SystemHelper.Log("---------------------UserId-------------------------" .. LS_Account.userId)

	if hasAutosaved then
		currentBtnIndex = 1
	else
		currentBtnIndex = 3
	end

	subNavIndex = 1
	subNavSelect = 1

	pnlRoot.navBar.navRoot.btns[currentBtnIndex]:SelectOnStart(true)
	pnlRoot.navBar.navGame.btns[subNavIndex]:SelectOnStart(true)

	btn = this.mainComponent:GetButton("Panel_Start_Panel_PveBattle_Button")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end, 0)
	btn:SetDisabled()
	UILayerCtrl.AddButton("Local", "Panel_Start_Panel_PveBattle_Button", btn)

	btn = this.mainComponent:GetButton("Panel_Start_Panel_PveBattle_Button1")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.OpenDialog()
		UIManager.CreateCtrl("Room")
	end, 0)
	UILayerCtrl.AddButton("Local", "Panel_Start_Panel_PveBattle_Button1", btn)

	local GamePadControllerForMovement = imageSceneMask:AddComponent(typeof(GamePadController))

	if GamePadControllerForMovement ~= nil then
		sceneController:SetGamePadControllerForMovement(GamePadControllerForMovement)
	end

	local GamePadControllerForRotation = imageSceneMask:AddComponent(typeof(GamePadController))

	if GamePadControllerForRotation ~= nil then
		sceneController:SetGamePadControllerForRotation(GamePadControllerForRotation)
	end

	local vGamePad = imageSceneMask:AddComponent(typeof(GamePadController))

	if vGamePad ~= nil then
		sceneController:SetGamePadControllerForDPad(vGamePad)
	end

	if FS_UserData.playerList:IsHavePlayer() == true then
		LobbyMainCtrl.SetNameAndLevel(FS_UserData.playerList:GetPlayer():GetName(), "Lv " .. FS_UserData.playerList:GetPlayer():GetLevel())
		LobbyMainCtrl.SetPortrait(FS_UserData.playerList:GetPlayer():GetIcon(), FS_UserData.playerList:GetPlayer():GetIconUrl())
	end

	lobbyPanelTop = {}
	lobbyPanelTop.show = false
	lobbyPanelTop.showBg = false
	lobbyPanelTop.com = this.mainComponent:GetGameObject("Start_Top_Bg")

	lobbyPanelTop.com:SetActive(lobbyPanelTop.showBg)

	lobbyPanelTop.btnKey = "Panel_Start_Button_Set"

	LobbyMainCtrl.ResetGameConfig()
	UILayerCtrl.Pop()

	if hasAutosaved then
		SystemHelper.Log("[ ......Save file is found...... ]")

		currentBtnIndex = 1
	else
		SystemHelper.Log("[ ......No save file...... ]")

		currentBtnIndex = 3
	end

	UILayerCtrl.Push("LobbyRoot", LobbyMainCfg.LobbyRoot[currentBtnIndex][LobbyMainCtrl.BtnKeyIdx])

	labelVersion = this.mainComponent:GetText("LobbyMain_Reserved_TextVersion_LB")

	if AppVer == AppAppleLight or AppVer == AppTapTapCloudDemo then
		-- block empty
	elseif AppVer == AppCJ2020 then
		labelVersion:SetContent("       ChinaJoy 2020")
		labelVersion.gameObject:SetActive(true)
		labelVersion:SetFontSize(22)
	else
		labelVersion:SetContent("v " .. ClientVersion.Version .. " (" .. ClientVersion.Package .. ")")
		labelVersion.gameObject:SetActive(true)
		labelVersion:SetFontSize(22)
	end

	uiFeedback = {}
	uiFeedback.show = true
	uiFeedback.goRoot = this.mainComponent:GetGameObject("LobbyMain_Root_Feedback")

	uiFeedback.goRoot:SetActive(uiFeedback.show)

	local btnEntry = this.mainComponent:GetButton("LobbyMain_Root_Feedback_Btn_L")

	uiFeedback.btnEntry = btnEntry

	btnEntry:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AudioCtrl.SetUIAudio("save_click")
		LobbyMainCtrl.ShowPanelFeedback(true)
	end, 0)

	uiFeedback.panel = {}

	if (AppVer == AppAppleLight or AppVer == AppCJ2020 or Platform == PlatformType.MAC or Platform == PlatformType.PC) and not DebugOpenFeedback then
		uiFeedback.show = false

		uiFeedback.goRoot:SetActive(false)
	end

	uiFeedback.panel.show = false
	uiFeedback.panel.go = this.mainComponent:GetGameObject("LobbyMain_Root_Feedback_Panel")

	uiFeedback.panel.go:SetActive(uiFeedback.panel.show)

	uiFeedback.panel.feedBackPanel = this.mainComponent:GetGameObject("Panel_Root_Panel_Feedback_Panel_Feedback_FeedBack_ScrollView")
	uiFeedback.panel.historyPanel = this.mainComponent:GetGameObject("Panel_Root_Panel_Feedback_Panel_Feedback_History_ScrollView")

	uiFeedback.panel.feedBackPanel:SetActive(true)
	uiFeedback.panel.historyPanel:SetActive(false)

	uiFeedback.panel.newPoint1 = this.mainComponent:GetGameObject("Panel_Root_Panel_Feedback_Button_Feedback_newPoint")
	uiFeedback.panel.newPoint2 = this.mainComponent:GetGameObject("Panel_Root_Panel_Feedback_Panel_Feedback_Feedback_Type_FbTypeButton3_newPoint2")

	local btnClose = this.mainComponent:GetButton("LobbyMain_Root_FeedbackPanel_BtnClose_L")

	uiFeedback.panel.btnClose = btnClose

	btnClose:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LobbyMainCtrl.ClosePanelFeedback()
	end, 0)

	local group = XGroup:new()

	group:SetMode(XGroup.GroupMode.Button)

	uiFeedback.feedbackType = 1

	local btnType1 = this.mainComponent:GetButton("Panel_Feedback_TypeButton1")

	group:Add(btnType1)
	btnType1:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SystemHelper.Log("Feedback Type 1......")
		uiFeedback.panel.feedBackPanel:SetActive(true)
		uiFeedback.panel.historyPanel:SetActive(false)

		uiFeedback.feedbackType = 1
	end, 0)

	local btnType2 = this.mainComponent:GetButton("Panel_Feedback_TypeButton2")

	group:Add(btnType2)
	btnType2:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SystemHelper.Log("Feedback Type 2......")

		uiFeedback.feedbackType = 2
	end, 0)

	local btnType3 = this.mainComponent:GetButton("Panel_Feedback_TypeButton3")

	group:Add(btnType3)
	btnType3:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SystemHelper.Log("Feedback Type 3......")
		uiFeedback.panel.feedBackPanel:SetActive(false)
		uiFeedback.panel.historyPanel:SetActive(true)

		uiFeedback.feedbackType = 3

		LobbyMainCtrl.LoadFeedbackMessage()
		FS_UserData.feedback:SetAllOld()
		LobbyMainCtrl.SetNewFeedback(false)
	end, 0)

	uiFeedback.panel.inputField = this.mainComponent:GetGameObject("LobbyMain_Root_FeedbackPanel_InputField")
	uiFeedback.panel.textContent = uiFeedback.panel.inputField:GetComponent("InputField")

	uiFeedback.panel.textContent.onValueChanged:RemoveAllListeners()
	uiFeedback.panel.textContent.onValueChanged:AddListener(function(st)
		uiFeedback.panel.textNum:SetContent(StringHelper.GetStringWordNum(uiFeedback.panel.textContent.text) .. "/200")
	end)

	uiFeedback.panel.textNum = this.mainComponent:GetText("Panel_Root_Panel_Feedback_Panel_Feedback_FeedBack_ScrollView_TextNum")

	uiFeedback.panel.textNum:SetContent("0/200")

	local btnSubmit = this.mainComponent:GetButton("LobbyMain_Root_FeedbackPanel_BtnSubmit")

	uiFeedback.btnSubmit = btnSubmit

	btnSubmit:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local content = tostring(uiFeedback.panel.textContent.text)

		if string.len(content) > 0 then
			local function trim(s)
				return s:match("^()%s*$") and "" or s:match("^%s*(.*%S)")
			end

			if string.len(trim(content)) > 0 then
				LobbyMainCtrl.OnButtonSubmit(uiFeedback.feedbackType, content)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_FEEDBACK_SUBMIT_FAILED_BLANK, function()
					return
				end, function()
					return
				end, true)
			end
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_FEEDBACK_SUBMIT_FAILED_BLANK, function()
				return
			end, function()
				return
			end, true)
		end
	end, 0)

	uiFeedback.panel.messageLoader = this.mainComponent:GetLoader("Panel_Root_Panel_Feedback_Panel_Feedback_History_ScrollView_History_Viewport_History_Content")
	AnnouncementGO = this.mainComponent:GetGameObject("Panel_Root_Panel_Announcement")
	AnnouncementLoader = this.mainComponent:GetLoader("Panel_Root_Panel_Announcement_Announcement_ScrollView_Announcement_Viewport_Announcement_Content")
	AnnouncementLoader.RT = AnnouncementLoader.gameObject:GetComponent("RectTransform")
	AnnouncementConfirmBtn = this.mainComponent:GetButton("Panel_Root_Panel_Announcement_Button")

	AnnouncementConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LobbyMainCtrl.CloseAnnouncement()
	end)
	UILayerCtrl.AddButton("AnnouncementLobby", "Panel_Announcement_Button1", AnnouncementConfirmBtn)

	AnnouncementOpenBtn = this.mainComponent:GetButton("Panel_Root_AnnouncementBtn_L")

	AnnouncementOpenBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.SendMessage("Loading", "SimpleLoading", true)
		SdkHelper.openBoard(LS_Setting.GetLanguage(), LobbyMainCtrl.LoadAnnouncementAlwaysCallback)
	end)

	if AppVer == AppAppleLight or AppVer == AppCJ2020 or AppVer == AppTapTapCloudDemo then
		AnnouncementOpenBtn.gameObject:SetActive(false)
	end

	TapTapBtn = this.mainComponent:GetButton("Panel_Root_TapTapBtn_L")

	TapTapBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if SdkHelper.SdkFacade ~= nil then
			SdkHelper.SdkFacade:GoToAppForum()
		end
	end)

	NewChannelBtn = this.mainComponent:GetButton("Panel_Root_NewChannelBtn_L")

	NewChannelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if SdkHelper.SdkFacade ~= nil then
			SdkHelper.SdkFacade:GoToAppForum()
		end
	end)
	TapTapBtn.gameObject:SetActive(false)
	NewChannelBtn.gameObject:SetActive(false)

	if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
		TapTapBtn.gameObject:SetActive(true)
	elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_UNION then
		NewChannelBtn.gameObject:SetActive(true)
	end

	AuthorityBtn = this.mainComponent:GetButton("Panel_Root_AuthorityBtn_L")

	if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
		AuthorityBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if SdkHelper.SdkFacade ~= nil then
				UnityEngine.Application.OpenURL("http://www.tips-works.com/permissionDesc.html")
			end
		end)
		AuthorityBtn.gameObject:SetActive(true)
	else
		AuthorityBtn.gameObject:SetActive(false)
	end

	CadpaBtn = this.mainComponent:GetButton("Panel_Root_CadpaBtn_R")

	if CadpaBtn ~= nil then
		CadpaBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			UIManager.SendMessage("Loading", "SimpleLoading", true)

			local titleAnnouncement = this.mainComponent:GetText("Panel_Root_Panel_Announcement_Text")

			if titleAnnouncement ~= nil then
				titleAnnouncement:SetContent(strTCadpaTitle)
			end

			LobbyMainCtrl.LoadAnnouncementAlwaysCallback(strCadpaContents)
		end)

		if SdkHelper.CHANNEL == "ANDROID_UNION" then
			CadpaBtn.gameObject:SetActive(true)
		end
	end

	challengeMode = {}
	challengeMode.show = false
	challengeMode.goRoot = this.mainComponent:GetGameObject("Panel_Root_Panel_SelectChallengeMode")
	challengeMode.mode = MS_StoryChallenge.ChallengeMode.Normal
	challengeMode.Des = this.mainComponent:GetText("Panel_Root_Panel_SelectChallengeMode_Description")

	challengeMode.Des:SetGameTextContent(function()
		return GameText.UI_CHALLENGE_NORMAL
	end)

	challengeMode.mode1BtnLight = this.mainComponent:GetGameObject("Panel_Root_Panel_SelectChallengeMode_Mode1_CustomLight1")
	challengeMode.mode2BtnLight = this.mainComponent:GetGameObject("Panel_Root_Panel_SelectChallengeMode_Mode2_CustomLight2")

	challengeMode.mode1BtnLight:SetActive(true)
	challengeMode.mode2BtnLight:SetActive(false)

	challengeMode.mode1Btn = this.mainComponent:GetButton("Panel_Root_Panel_SelectChallengeMode_Mode1")

	challengeMode.mode1Btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("Mode1Btn")
		challengeMode.mode1BtnLight:SetActive(true)
		challengeMode.mode2BtnLight:SetActive(false)

		challengeMode.mode = MS_StoryChallenge.ChallengeMode.Normal

		FS_UserData.challenge:SetGameMode(challengeMode.mode)
		sceneController:SetChallegeMode(challengeMode.mode)
		challengeMode.Des:SetGameTextContent(function()
			return GameText.UI_CHALLENGE_NORMAL
		end)
	end)
	challengeMode.mode1Btn:SetAdjacent(XButton.Adjacent.LEFT, "Mode2Btn")
	challengeMode.mode1Btn:SetAdjacent(XButton.Adjacent.RIGHT, "Mode2Btn")

	challengeMode.mode2Btn = this.mainComponent:GetButton("Panel_Root_Panel_SelectChallengeMode_Mode2")

	challengeMode.mode2Btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("Mode2Btn")
		challengeMode.mode1BtnLight:SetActive(false)
		challengeMode.mode2BtnLight:SetActive(true)

		challengeMode.mode = MS_StoryChallenge.ChallengeMode.Custom

		FS_UserData.challenge:SetGameMode(challengeMode.mode)
		sceneController:SetChallegeMode(challengeMode.mode)
		challengeMode.Des:SetGameTextContent(function()
			return GameText.UI_CHALLENGE_CUSTOM
		end)
	end)
	challengeMode.mode2Btn:SetAdjacent(XButton.Adjacent.LEFT, "Mode1Btn")
	challengeMode.mode2Btn:SetAdjacent(XButton.Adjacent.RIGHT, "Mode1Btn")

	challengeMode.BackBtn = this.mainComponent:GetButton("Panel_Root_Panel_SelectChallengeMode_Back")

	challengeMode.BackBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	challengeMode.BackBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LobbyMainCtrl.ClosePanelChallengeMode()
	end)

	challengeMode.confirmBtn = this.mainComponent:GetButton("Panel_Root_Panel_SelectChallengeMode_Confirm")

	challengeMode.confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.ForceUpdate(0.7)

		if challengeMode.mode == MS_StoryChallenge.ChallengeMode.Normal then
			FS_UserData.challenge:SetGameMode(challengeMode.mode)
			UIManager.CreateCtrl("Challenge")
			UIManager.SendMessage("Challenge", "InitMode", challengeMode.mode)
		elseif challengeMode.mode == MS_StoryChallenge.ChallengeMode.Custom then
			FS_UserData.challenge:SetGameMode(challengeMode.mode)
			UIManager.CreateCtrl("Challenge")
			UIManager.SendMessage("Challenge", "InitMode", challengeMode.mode)
		end
	end)
	UILayerCtrl.AddButton("ChallengeMode", "Mode1Btn", challengeMode.mode1Btn)
	UILayerCtrl.AddButton("ChallengeMode", "Mode2Btn", challengeMode.mode2Btn)
	UILayerCtrl.AddIndividual("ChallengeMode", "BackBtn", challengeMode.BackBtn)
	UILayerCtrl.AddIndividual("ChallengeMode", "ConfirmBtn", challengeMode.confirmBtn)

	if FS_UserData.challenge:GetIsInChallengeMode() then
		LobbyMainCtrl.OnButtonChallengeMode()
		UILayerCtrl.OnSelect(slotBtnNamePrefix .. FS_UserData.challenge:GetSaveSlot())
		UILayerCtrl.OnCursorClickMute()
		UILayerCtrl.OnButtonClickMute("LobbyMain_Root_SubLoad_Edit_BtnLoad")
		UILayerCtrl.OnSelect("Mode" .. FS_UserData.challenge:GetGameMode() .. "Btn")
		UILayerCtrl.OnCursorClickMute()
		UILayerCtrl.OnButtonClickMute("ConfirmBtn")
	end

	isBackFromArcadeMode = false
	isNeedSyncArcade = true
	previousArcadeModeIdx = 0

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		isBackFromArcadeMode = true
		isNeedSyncArcade = false

		if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) then
			previousArcadeModeIdx = FS_SaveStory.ArcadeMode.Normal
		else
			previousArcadeModeIdx = FS_SaveStory.ArcadeMode.StageSelect
		end
	end

	this.loadFinish = true
end

function LobbyMainCtrl.ShowHome(show)
	if show then
		SystemHelper.Log("[ LobbyMainCtrl.ShowHome...... ]")
		LobbyMainCtrl.RefreshDLCLogo()
	else
		SystemHelper.Log("[ LobbyMainCtrl.HideHome...... ]")
	end

	if uiGroup.home.show ~= show then
		uiGroup.home.show = show

		uiGroup.home.com:SetActive(show)

		if show and UILayerCtrl.GetCurrentButton() then
			UILayerCtrl.GetCurrentButton():SetSelectedLight(false)
			UILayerCtrl.GetCurrentButton():SetSelectedLight(true)
		end
	end
end

function LobbyMainCtrl.ReturnHomepage()
	SystemHelper.Log("[ LobbyMainCtrl.ReturnHomepage() ]")
	sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.SinglePlayer)
end

function LobbyMainCtrl.ShowNavRoot(show)
	if pnlRoot.navBar.navRoot.show ~= show then
		pnlRoot.navBar.navRoot.show = show

		pnlRoot.navBar.navRoot.go:SetActive(show)
	end
end

function LobbyMainCtrl.ShowNavGame(show)
	if pnlRoot.navBar.navGame.show ~= show then
		pnlRoot.navBar.navGame.show = show

		pnlRoot.navBar.navGame.go:SetActive(show)

		subNavIndex = 1
	end
end

function LobbyMainCtrl.ShowNavLevel(show)
	if pnlRoot.navBar.navLevel.show ~= show then
		pnlRoot.navBar.navLevel.show = show

		pnlRoot.navBar.navLevel.go:SetActive(show)

		subNavIndex = 1
		subNavSelect = 1
	end
end

function LobbyMainCtrl.ShowNavItem(show)
	if pnlRoot.navBar.navItem.show ~= show then
		pnlRoot.navBar.navItem.show = show

		pnlRoot.navBar.navItem.go:SetActive(show)

		subNavIndex = 1
	end
end

function LobbyMainCtrl.InitMenuItem(tbl)
	local count = #tbl

	loaderItemList = this.mainComponent:GetLoader("LobbyMain_Item_NavBtns_R")
	loaderItemList.loadCount = count + 1

	function loaderItemList.loadCallback(index, com, data)
		local keyPrev, keyNext = LobbyMainCtrl.GetNavIndices(index, loaderItemList.loadCount)
		local keyC = "LobbyMain_BtnItem" .. index
		local keyP = "LobbyMain_BtnItem" .. keyPrev
		local keyN = "LobbyMain_BtnItem" .. keyNext
		local txt = com:GetText("LobbyMain_BtnLvText")

		if index < loaderItemList.loadCount then
			txt:SetGameTextContent(function()
				return string.gsub(GameText.UI_LOBBY_TEXT_LEVEL_NUM, "{0}", tostring(index))
			end)
		else
			txt:SetGameTextContent(function()
				return GameText.UI_LOBBY_TEXT_COMMON_BACK
			end)
		end

		local btn = com:GetButton("LobbyMain_BtnLv")

		if btn then
			btn.gameObject:SetActive(true)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				subNavIndex = index
				pnlRoot.navBar.navItem.idxSel = index

				UILayerCtrl.OnSelect(keyC)
				btn:SetSelectedLight(false)
				pnlRoot.navBar.navItem.cb[index]()
			end, 0)
			btn:SetAdjacent(XButton.Adjacent.UP, keyP)
			btn:SetAdjacent(XButton.Adjacent.DOWN, keyN)

			pnlRoot.navBar.navLevel.btns[index] = btn

			UILayerCtrl.AddButton("SubNavItem", keyC, btn)
		end
	end

	loaderItemList:PreloadTemplate(function()
		loaderItemList:Load()
	end)
end

function LobbyMainCtrl.OnButtonStoryModeContinue(obj, data)
	if not LS_Setting.activated and AppVer == AppTapTapEA and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
		LobbyMainCtrl.ShowActivation()

		return
	end

	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	local userId = LS_Account.userId

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
	FS_UserData.Reset()
	BattleData.SetHeroId(0)

	if LS_Autosave.Load(userId) then
		local difficulty = FS_UserData.story:GetDifficulty()

		BattleData.SetDifficulty(difficulty)
		LS_PlayerBehavior.Load(userId, true)

		local ret = FS_UserData.story:ContinueGame()

		if ret == true then
			sceneController:ChooseHeroIdConfirm()
		end
	end
end

function LobbyMainCtrl.OnButtonStoryModeLoad(obj, data)
	if not LS_Setting.activated and AppVer == AppTapTapEA and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
		LobbyMainCtrl.ShowActivation()

		return
	end

	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	local userId = LS_Account.userId

	sceneController:ResetIdleState()
	this.ShowPanelLoadGame()
end

function LobbyMainCtrl.OnButtonStoryModeStart(obj, data)
	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	if not LS_Setting.activated and (AppVer == AppTapTapEA and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP or AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs) then
		LobbyMainCtrl.ShowActivation()

		return
	end

	sceneController:ResetIdleState()

	if AppVer == AppAppleLight then
		if pnlRoot ~= nil and pnlRoot.go ~= nil then
			UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
			UIManager.SendMessage("MsgBoxSimple", "OpenMassageBox", GameText.UI_DEMO_FEATURE_CONTENT)

			local tween = Tween:new(pnlRoot.go)

			tween:SetAutoKill(true)
			tween:MoveTo({}, 1.5)
			tween:OnComplete(function()
				MsgBoxSimpleCtrl.CloseMessage()
				UIManager.SendMessage("Loading", "SimpleLoading", false, false, false)

				gameConfig.storyMode = FS_SaveStory.StoryMode.Normal
				gameConfig.storyId = 1

				this.OnButtonGameNormal()
			end)
			tween:Start()
		end
	elseif AppVer == AppTapTapCloudDemo then
		this.ShowPanelGameMode()
	elseif AppVer == AppCJ2020 then
		local userId = LS_Account.userId

		sceneController:ResetIdleState()

		if not LS_Game.IsReadable(userId, 20200801) then
			LS_Game.GenerateSaveData(userId, 20200801)
		end

		if LS_Game.IsReadable(userId, 20200801) then
			LS_Setting.Update()
			LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
			FS_UserData.Reset()
			BattleData.SetHeroId(0)

			if LS_Game.Load(userId, 20200801) then
				LS_Setting.SetLastSaveSlot(1)

				local difficulty = FS_UserData.story:GetDifficulty()

				BattleData.SetDifficulty(difficulty)

				local ret = FS_UserData.story:ContinueGame()

				if ret == true then
					sceneController:ChooseHeroIdConfirm()
				end
			end
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ANNO_AUTOSAVE_MECH, function()
			this.ShowPanelGameMode()
		end, function()
			return
		end, true)
	end
end

function LobbyMainCtrl.OnButtonLevelMode(obj, data)
	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnLoad)

	gameConfig.storyMode = FS_SaveStory.StoryMode.JumpGame

	sceneController:ResetIdleState()

	local btnCnt = MS_StoryList.LevelCount()

	if btnCnt > 0 then
		for btnIdx = 1, btnCnt do
			pnlRoot.navBar.navLevel.cb[btnIdx] = LobbyMainCtrl.OnButtonLevel
		end
	end

	currentBtnCount = btnCnt + 1
	pnlRoot.navBar.navLevel.cb[currentBtnCount] = LobbyMainCtrl.OnButtonLevelBack

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)

	subNavIndex = 1
	subNavSelect = 1
	pnlRoot.navBar.navLevel.selecting = true

	LobbyMainCtrl.ShowNavRoot(false)
	LobbyMainCtrl.ShowNavGame(false)
	LobbyMainCtrl.ShowNavLevel(true)
	LobbyMainCtrl.ShowNavItem(false)
	UILayerCtrl.Push("SubNavLevel", "LobbyMain_BtnLv1")
end

function LobbyMainCtrl.OnButtonArcade(obj, data)
	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	UILayerCtrl.ForceUpdate(0.7)

	if not IapData.GetEnterArcade() then
		LobbyMainCtrl.OnButtonDLCs()
	else
		if isNeedSyncArcade then
			FS_UserData.arcade:SyncArcade()
		end

		LobbyMainCtrl.EnterSceneArcade()
		UIManager.CreateCtrl("Arcade")
		this.ChangeState(RunStep.Setting)
	end
end

function LobbyMainCtrl.SetNeedSyncArcade()
	isNeedSyncArcade = true
end

function LobbyMainCtrl.OnButtonArcadeStage(obj, data)
	LobbyMainCtrl.OnButtonArcade()
end

function LobbyMainCtrl.ResumeArcade()
	LobbyMainCtrl.EnterSceneArcade()
	UIManager.SendMessage("Arcade", "LeaveChoosingHero")
	this.ChangeState(RunStep.Setting)
end

function LobbyMainCtrl.OnButtonBossMode(obj, data)
	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	if not LS_Setting.activated and (AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs) then
		LobbyMainCtrl.ShowActivation()

		return
	end

	if AppVer == AppCJ2020 then
		local userId = LS_Account.userId

		sceneController:ResetIdleState()

		if not LS_Game.IsReadable(userId, 20200802) then
			LS_Game.GenerateSaveData(userId, 20200802)
		end

		if LS_Game.IsReadable(userId, 20200802) then
			LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
			FS_UserData.Reset()
			BattleData.SetHeroId(0)

			if LS_Game.Load(userId, 20200802) then
				LS_Setting.SetLastSaveSlot(2)

				local difficulty = FS_UserData.story:GetDifficulty()

				BattleData.SetDifficulty(difficulty)
				LS_PlayerBehavior.Load(userId)

				local ret = FS_UserData.story:ContinueGame()

				if ret == true then
					sceneController:ChooseHeroIdConfirm()
				end
			end
		end
	else
		gameConfig.storyMode = FS_SaveStory.StoryMode.BossChallenge

		sceneController:ResetIdleState()

		local btnCnt = MS_StoryList.LevelCount()

		if AppVer == AppDemoE3_1906 then
			btnCnt = 1
		end

		if btnCnt > 0 then
			for btnIdx = 1, btnCnt do
				pnlRoot.navBar.navLevel.cb[btnIdx] = LobbyMainCtrl.OnButtonBossLevel
			end
		end

		pnlRoot.navBar.navLevel.cb[btnCnt + 1] = LobbyMainCtrl.OnButtonBossLevelBack

		LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)

		subNavIndex = 1
		subNavSelect = 1
		pnlRoot.navBar.navLevel.selecting = true

		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavLevel(true)
		LobbyMainCtrl.ShowNavItem(false)
		UILayerCtrl.Push("SubNavLevel", "LobbyMain_BtnLv1")
	end
end

function LobbyMainCtrl.OnButtonChallengeMode(obj, data)
	if not LS_Setting.activated and AppVer == AppTapTapEA and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
		LobbyMainCtrl.ShowActivation()

		return
	end

	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	local hasAutosaved = LS_Autosave.IsReadable(LS_Account.userId)
	local hasGameSaved = LS_Game.HasSaveData(LS_Account.userId)

	if not hasAutosaved and not hasGameSaved then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CHALLENGE_CANT_CHALLENGE, function()
			return
		end, function()
			return
		end, true)

		return
	end

	if FS_UserData.challenge:GetIsInChallengeMode() == false then
		FS_UserData.challenge:SyncChallenge()
	end

	gameConfig.storyMode = FS_SaveStory.StoryMode.BossTimeChallenge

	local userId = LS_Account.userId

	sceneController:ResetIdleState()
	this.ShowPanelLoadGame()
end

function LobbyMainCtrl.OnButtonMazeMode(obj, data)
	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnLoad)

	gameConfig.storyMode = FS_SaveStory.StoryMode.Maze

	sceneController:ResetIdleState()

	local btnCnt = MS_StoryList.MazeLevelCount()

	if btnCnt > 0 then
		for btnIdx = 1, btnCnt do
			pnlRoot.navBar.navItem.cb[btnIdx] = LobbyMainCtrl.OnButtonMazeLevel
		end
	end

	currentBtnCount = btnCnt + 1
	pnlRoot.navBar.navItem.cb[currentBtnCount] = LobbyMainCtrl.OnButtonMazeLevelBack

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)

	subNavIndex = 1
	subNavSelect = 1
	pnlRoot.navBar.navItem.selecting = true

	LobbyMainCtrl.ShowNavRoot(false)
	LobbyMainCtrl.ShowNavGame(false)
	LobbyMainCtrl.ShowNavLevel(false)
	LobbyMainCtrl.ShowNavItem(true)
	UILayerCtrl.Push("SubNavItem", "LobbyMain_BtnLv1")
end

function LobbyMainCtrl.OnButtonFreeModeLocal(obj, data)
	sceneController:ResetIdleState()
	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnLocal)
	this.OpenDialog()
	UIManager.CreateCtrl("Room")
end

function LobbyMainCtrl.OnButtonCarriageStart(obj, data)
	if not LobbyMainCtrl.CheckComfirmedName() then
		return
	end

	if not LS_Setting.activated and (AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs) then
		LobbyMainCtrl.ShowActivation()

		return
	end

	gameConfig.storyMode = FS_SaveStory.StoryMode.Travel
	subNavIndex = 1

	sceneController:ResetIdleState()

	if not DebugSelectDifficulty then
		this.OnButtonGameNormal()
	else
		local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
		local btnCbIdx = LobbyMainCtrl.BtnCbIdx
		local btnCfgArr = LobbyMainCfg.LevelDifficulty
		local btnCount = table.nums(btnCfgArr)

		for i = 1, btnCount do
			pnlRoot.navBar.navGame.cb[i] = LobbyMainCtrl[btnCfgArr[i][btnCbIdx]]
		end

		LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavGame(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
		UILayerCtrl.Push("SubNavGame", "LobbyMain_Game_NavBtn_Casual")
	end
end

function LobbyMainCtrl.OnButtonHeroViewer(obj, data)
	sceneController:ResetIdleState()
	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnHeroes)
	pnlRoot.navBar.go:SetActive(false)
	pnlRoot.go:SetActive(false)

	if not LS_Setting.activated and (AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs) then
		LobbyMainCtrl.ShowActivation()
	end

	UIManager.CreateCtrl("HeroViewer")

	watchHero = true

	sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Choose)
end

function LobbyMainCtrl.OnButtonSettings(obj, data)
	if sceneController ~= nil then
		sceneController:ResetIdleState()
	end

	UIManager.CreateCtrl("Setting")
	UIManager.SendMessage("Setting", "OpenFromGame", false)
	this.ChangeState(RunStep.Setting)
end

function LobbyMainCtrl.OnButtonAchievement(obj, data)
	sceneController:ResetIdleState()
	UIManager.CreateCtrl("Achievement")
end

function LobbyMainCtrl.OnButtonDLCs(obj, data)
	if not LS_Setting.activated and AppVer == AppTapTapEA and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
		LobbyMainCtrl.ShowActivation()

		return
	end

	sceneController:ResetIdleState()
	UIManager.CreateCtrl("Additions")
end

function LobbyMainCtrl.OnButtonQuitGame(obj, data)
	if Platform == PlatformType.MAC or Platform == PlatformType.PC then
		LobbyMainCtrl.ClosePanel()
	end
end

function LobbyMainCtrl.OnStartupQueue()
	local subNewGame = pnlRoot.subNewGame

	if subNewGame and table.nums(subNewGame.startupQueue) > 0 and not subNewGame.startupShow then
		local content = table.remove(subNewGame.startupQueue)

		SystemHelper.Log("==========>> " .. content)

		if type(content) == "number" then
			if content == 0 then
				SystemHelper.Log("Real START................................................")
				sceneController:ChooseHeroIdConfirm()
			end
		else
			subNewGame.startupShow = true

			local text = GameText[content]

			if text == nil then
				text = "..."
			end

			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", text, function()
				subNewGame.startupShow = false

				LobbyMainCtrl.OnStartupQueue()
			end, function()
				return
			end, true)
		end
	end
end

function LobbyMainCtrl.OnButtonGameStart(gameMode)
	gameConfig.difficulty = gameMode

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
	FS_UserData.Reset()
	BattleData.SetHeroId(0)

	if gameConfig.storyMode == FS_SaveStory.StoryMode.Normal then
		FS_UserData.story:NewGame(gameConfig.difficulty)
	elseif gameConfig.storyMode == FS_SaveStory.StoryMode.BossChallenge then
		FS_UserData.story:BossChallenge(gameConfig.storyId, gameConfig.difficulty)
	elseif gameConfig.storyMode == FS_SaveStory.StoryMode.JumpGame then
		FS_UserData.story:JumpGame(gameConfig.storyId, gameConfig.difficulty)
	elseif gameConfig.storyMode == FS_SaveStory.StoryMode.Maze then
		FS_UserData.story:JumpMaze(gameConfig.storyId, gameConfig.difficulty)
	elseif gameConfig.storyMode == FS_SaveStory.StoryMode.Travel then
		FS_UserData.story:Travel(gameConfig.difficulty)
	elseif gameConfig.storyMode == FS_SaveStory.StoryMode.Arcade then
		BattleData.SetHeroId(gameConfig.heroId)

		if gameConfig.arcadeMode == FS_SaveStory.ArcadeMode.Normal then
			FS_UserData.story:ArcadeNewGame(gameConfig.difficulty, gameConfig.heroId)
		elseif gameConfig.arcadeMode == FS_SaveStory.ArcadeMode.StageSelect then
			FS_UserData.story:ArcadeStageSelect(gameConfig.difficulty, gameConfig.heroId, gameConfig.storyId)
		end

		FS_UserData.story:InitSelectSkin(gameConfig.heroId, gameConfig.skinId)
	else
		SystemHelper.LogError("=====error===OnButtonGameCasual==gameConfig.storyMode=" .. gameConfig.storyMode)
	end

	if SdkHelper.IsIapInfosInited == true and SdkHelper.IsPaidListInited == true then
		local iapInfos = SdkHelper.IapInfos

		for _, iapInfo in pairs(iapInfos) do
			if iapInfo.valid == true and gameConfig.storyMode == FS_SaveStory.StoryMode.Normal and iapInfo.id ~= "dlcarcade" then
				table.insert(pnlRoot.subNewGame.startupQueue, "UI_DLC_MSG_" .. iapInfo.id)
			end
		end
	end

	LobbyMainCtrl.OnStartupQueue()
end

function LobbyMainCtrl.OnButtonGameCasual(obj, data)
	this.OnButtonGameStart(BattleData.GlobalDifficultyLevel.Casual)
end

function LobbyMainCtrl.OnButtonGameNormal(obj, data)
	this.OnButtonGameStart(BattleData.GlobalDifficultyLevel.Normal)
end

function LobbyMainCtrl.OnButtonBossCasual(obj, data)
	gameConfig.difficulty = FS_UserData.story:GetDifficulty()

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnBoss)
	FS_UserData.Reset()
	FS_UserData.story:BossChallenge(gameConfig.storyId, gameConfig.difficulty)
	this.ChooseMode(false)
end

function LobbyMainCtrl.OnButtonBossNormal(obj, data)
	gameConfig.difficulty = BattleData.GlobalDifficultyLevel.Normal

	LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnBoss)
	FS_UserData.Reset()
	FS_UserData.story:BossChallenge(gameConfig.storyId, gameConfig.difficulty)
	this.ChooseMode(false)
end

function LobbyMainCtrl.OnButtonLevel(obj, data)
	SystemHelper.Log("Level " .. subNavIndex)

	gameConfig.storyId = subNavIndex

	if not DebugSelectDifficulty then
		this.OnButtonGameNormal()
	else
		local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
		local btnCbIdx = LobbyMainCtrl.BtnCbIdx
		local btnCfgArr = LobbyMainCfg.LevelDifficulty
		local btnCount = table.nums(btnCfgArr)

		for i = 1, btnCount do
			pnlRoot.navBar.navGame.cb[i] = LobbyMainCtrl[btnCfgArr[i][btnCbIdx]]
		end

		LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavGame(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
		UILayerCtrl.Push("SubNavGame", "LobbyMain_Game_NavBtn_Casual")
	end
end

function LobbyMainCtrl.OnButtonLevelBack(obj, data)
	LobbyMainCtrl.ResetGameConfig()
	LobbyMainCtrl.ShowNavRoot(true)
	LobbyMainCtrl.ShowNavGame(false)
	LobbyMainCtrl.ShowNavLevel(false)
	LobbyMainCtrl.ShowNavItem(false)
	UILayerCtrl.Pop()

	pnlRoot.navBar.navLevel.selecting = false
end

function LobbyMainCtrl.OnButtonGameBack(obj, data)
	LobbyMainCtrl.ResetGameConfig()

	if pnlRoot.navBar.navLevel.selecting then
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavLevel(true)
		LobbyMainCtrl.ShowNavItem(false)
	else
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavRoot(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
	end

	UILayerCtrl.Pop()
end

function LobbyMainCtrl.OnButtonBossLevel(obj, data)
	SystemHelper.Log("BOSS Level " .. subNavIndex)

	gameConfig.storyId = subNavIndex

	if not DebugSelectDifficulty then
		this.OnButtonBossNormal()
	else
		local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
		local btnCbIdx = LobbyMainCtrl.BtnCbIdx
		local btnCfgArr = LobbyMainCfg.BossDifficulty
		local btnCount = table.nums(btnCfgArr)

		for i = 1, btnCount do
			pnlRoot.navBar.navGame.cb[i] = LobbyMainCtrl[btnCfgArr[i][btnCbIdx]]
		end

		LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavGame(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
		UILayerCtrl.Push("SubNavGame", "LobbyMain_Game_NavBtn_Casual")
	end
end

function LobbyMainCtrl.OnButtonBossLevelBack(obj, data)
	LobbyMainCtrl.ResetGameConfig()
	LobbyMainCtrl.ShowNavRoot(true)
	LobbyMainCtrl.ShowNavGame(false)
	LobbyMainCtrl.ShowNavLevel(false)
	LobbyMainCtrl.ShowNavItem(false)
	UILayerCtrl.Pop()

	pnlRoot.navBar.navLevel.selecting = false
end

function LobbyMainCtrl.OnButtonBossBack(obj, data)
	if pnlRoot.navBar.navLevel.selecting then
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavLevel(true)
		LobbyMainCtrl.ShowNavItem(false)
	else
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavRoot(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
	end

	UILayerCtrl.Pop()
end

function LobbyMainCtrl.OnButtonMazeLevel(obj, data)
	SystemHelper.Log("Maze " .. subNavIndex)

	gameConfig.storyId = subNavIndex

	if not DebugSelectDifficulty then
		this.OnButtonGameNormal()
	else
		local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
		local btnCbIdx = LobbyMainCtrl.BtnCbIdx
		local btnCfgArr = LobbyMainCfg.LevelDifficulty
		local btnCount = table.nums(btnCfgArr)

		for i = 1, btnCount do
			pnlRoot.navBar.navGame.cb[i] = LobbyMainCtrl[btnCfgArr[i][btnCbIdx]]
		end

		LobbyMainCtrl.ActiveTab(LobbyMainCtrl.BtnStory)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavGame(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
		UILayerCtrl.Push("SubNavGame", "LobbyMain_Game_NavBtn_Casual")
	end
end

function LobbyMainCtrl.OnButtonMazeLevelBack(obj, data)
	LobbyMainCtrl.ResetGameConfig()
	LobbyMainCtrl.ShowNavRoot(true)
	LobbyMainCtrl.ShowNavGame(false)
	LobbyMainCtrl.ShowNavLevel(false)
	LobbyMainCtrl.ShowNavItem(false)
	UILayerCtrl.Pop()

	pnlRoot.navBar.navLevel.selecting = false
end

function LobbyMainCtrl.OnButtonMazeBack(obj, data)
	LobbyMainCtrl.ResetGameConfig()

	if pnlRoot.navBar.navLevel.selecting then
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavRoot(false)
		LobbyMainCtrl.ShowNavLevel(true)
		LobbyMainCtrl.ShowNavItem(false)
	else
		LobbyMainCtrl.ShowNavGame(false)
		LobbyMainCtrl.ShowNavRoot(true)
		LobbyMainCtrl.ShowNavLevel(false)
		LobbyMainCtrl.ShowNavItem(false)
	end

	UILayerCtrl.Pop()
end

function LobbyMainCtrl.OpenDialog()
	if UIManager.GetCtrl("ChooseHero") ~= nil then
		ChooseHeroCtrl:SetBlurEnabled(true)
	else
		LobbyMainCtrl:SetBlurEnabled(true)
	end
end

function LobbyMainCtrl.CloseDialog()
	SystemHelper.Log("[ LobbyMainCtrl.CloseDialog() ]")
	this.ChangeState(RunStep.Homepage)
	sceneController:ResetIdleState()
	LobbyMainCtrl.ReturnHomepage()

	if UIManager.GetCtrl("ChooseHero") ~= nil then
		ChooseHeroCtrl:SetBlurEnabled(false)
	else
		LobbyMainCtrl:SetBlurEnabled(false)
	end
end

function LobbyMainCtrl.SetChoosingHeroMode(modeIdx)
	chooseHeroMode = modeIdx
end

function LobbyMainCtrl.SetGameConfigStoryMode(storyMode)
	gameConfig.storyMode = storyMode
end

function LobbyMainCtrl.SetGameConfigArcadeMode(arcadeMode)
	gameConfig.arcadeMode = arcadeMode
end

function LobbyMainCtrl.SetGameConfigDifficulty(difficulty)
	gameConfig.difficulty = difficulty
end

function LobbyMainCtrl.SetGameConfigHeroId(heroId)
	gameConfig.heroId = heroId
end

function LobbyMainCtrl.SetGameConfigSkinId(skinId)
	gameConfig.skinId = skinId
end

function LobbyMainCtrl.SetGameConfigStoryId(storyId)
	gameConfig.storyId = storyId
end

function LobbyMainCtrl.SetGameConfigLastArcadeSlot(slotIndex)
	gameConfig.lastArcadeSlot = slotIndex
end

function LobbyMainCtrl.StartWithGameConfig()
	if gameConfig ~= nil then
		LS_Setting.SetLastArcadeSaveSlot(gameConfig.lastArcadeSlot)
		LS_Setting.Update()
		this.OnButtonGameStart(gameConfig.difficulty)
	end
end

function LobbyMainCtrl.StartWithLoadedData()
	sceneController:ChooseHeroIdConfirm()
end

function LobbyMainCtrl.EnterChoosingHero()
	if sceneController ~= nil then
		sceneController:ResetIdleState()
		sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Choose)
	end
end

function LobbyMainCtrl.EnterSceneArcade()
	if sceneController ~= nil then
		sceneController:ResetIdleState()
		sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.StartBattle)
	end
end

function LobbyMainCtrl.StartInArcadeMode(slotIdx)
	SystemHelper.LogError("[ LobbyMainCtrl.StartInArcadeMode() ]")

	if sceneController ~= nil then
		FS_UserData.Reset()
		BattleData.SetHeroId(0)

		if LS_Game.Load(LS_Account.userId, slotIdx, true) then
			if FS_UserData.story:IsArcadeOver() == true then
				UIManager.SendMessage("Arcade", "RequestRestartWithSaveData", slotIdx)
			else
				LS_Setting.SetLastArcadeSaveSlot(slotIdx)
				LS_Setting.Update()

				local difficulty = FS_UserData.story:GetDifficulty()

				BattleData.SetDifficulty(difficulty)

				local ret = FS_UserData.story:ContinueGame()

				if ret == true then
					sceneController:ChooseHeroIdConfirm()
				end
			end
		end
	end
end

function LobbyMainCtrl.RestartInArcadeMode(difficulty)
	SystemHelper.LogError(string.format("[ LobbyMainCtrl.StartInArcadeMode( %d ) ]", difficulty))

	if sceneController ~= nil then
		LS_Setting.SetLastArcadeSaveSlot(gameConfig.lastArcadeSlot)
		LS_Setting.Update()
		BattleData.SetDifficulty(difficulty)
		FS_UserData.story:ArcadeRestart(difficulty)
		sceneController:ChooseHeroIdConfirm()
	end
end

function LobbyMainCtrl.ChooseMode(isOnline)
	if sceneController:isNowInRoom() then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_WARNING_ISMATCHING)
	elseif isOnline then
		sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Pvp)
	else
		watchHero = false

		UIManager.SendMessage("LobbyMain", "SetChoosingHeroMode", 0)
		sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Choose)

		return
	end
end

function LobbyMainCtrl.ChooseMatchMode(battleType)
	if sceneController:isNowInRoom() then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_PVP_ISMATCHING)
	else
		SystemHelper.LogTest("==========LobbyMainCtrl.ChooseMatchMode==========")
		BattleData.SetBattleType(battleType)
		sceneController:StartMatchRoom()
	end
end

function LobbyMainCtrl.MatchGame()
	this.ShowWaitDlg(true)
end

function LobbyMainCtrl.IsMatchingGame()
	return isWait
end

function LobbyMainCtrl.MatchGameRematch()
	UIManager.Close("ConfirmEnter")
	this.ShowWaitDlg(true)
end

function LobbyMainCtrl.ShowWaitDlg(flag)
	isWait = flag

	if flag then
		if IsNil(waitMenu) then
			waitMenu = UIManager.SendMessage("MsgBoxSimple", "OpenMatchWait", this.CancelMatchConfirm)
			waitText = waitMenu:GetText("Text_WaitTime")
		end
	elseif waitMenu ~= nil then
		waitMenu:ReturnToPool()

		waitMenu = nil
	end
end

function LobbyMainCtrl.CancelMatchConfirm()
	exitConfirmDialog = UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", "退出匹配队列?", this.CancelMatch)
end

function LobbyMainCtrl.CancelMatch()
	sceneController:MatchGameCancel()
end

function LobbyMainCtrl.CloseMatch()
	this.ShowWaitDlg(false)
	UIManager.Close("ConfirmEnter")
end

function LobbyMainCtrl.MatchConfirm()
	this.ShowCurrentPanel(LobbyMainCtrl.BtnMulti, false)
	this.ShowWaitDlg(false)
	UIManager.CreateCtrl("ConfirmEnter")
end

function LobbyMainCtrl.SetWaitText(timeVal)
	if isWait == false then
		return
	end

	waitText:SetContent("匹配时间:" .. math.floor(timeVal))
end

function LobbyMainCtrl.ShowPanelGameMode()
	UILayerCtrl.Push("SubGameMode", "LobbyMain_SubMode_BtnNormal")

	local subGameMode = pnlRoot.subGameMode

	subGameMode.selectedGameMode = BattleData.GlobalDifficultyLevel.Normal
	subGameMode.btnCasualSelShow = false
	subGameMode.btnNormalSelShow = true

	subGameMode.btnCasualSel:SetActive(false)
	subGameMode.btnNormalSel:SetActive(true)
	subGameMode.intro:SetContent(GameText.UI_ANNO_GAMEMODE_NORMAL)

	subGameMode.show = true

	subGameMode.go:SetActive(true)
end

function LobbyMainCtrl.HidePanelGameMode()
	local subGameMode = pnlRoot.subGameMode

	subGameMode.show = false

	subGameMode.go:SetActive(false)
	UILayerCtrl.Pop()
end

function LobbyMainCtrl.ShowPanelNewGame(showSubMode)
	UILayerCtrl.Push("SubNewGame", "NewGame_SlotBtn1")

	local subNewGame = pnlRoot.subNewGame

	subNewGame.idxNav = 1
	subNewGame.idxSel = 1
	subNewGame.show = true

	subNewGame.go:SetActive(true)

	subNavIndex = 1
	subNavSelect = 1

	LobbyMainCtrl.RevalidateNewGame()
end

function LobbyMainCtrl.HidePanelNewGame()
	local subNewGame = pnlRoot.subNewGame

	subNewGame.show = false

	subNewGame.go:SetActive(false)

	subNewGame.idxNav = 1
	subNewGame.idxSel = 1
	subNavIndex = 0
	subNavSelect = 0

	UILayerCtrl.Pop()
end

function LobbyMainCtrl.ShowPanelLoadGame()
	local subLoadGame = pnlRoot.subLoadGame

	subLoadGame.show = true

	subLoadGame.go:SetActive(true)
	this.SetSubLoadGameState(true, false, false)
	this.ShowSubLoadNavBar(true)
	LobbyMainCtrl.RevalidateLoadGame()

	local hasAutosaved = LS_Autosave.IsReadable(LS_Account.userId)
	local hasGameSaved = LS_Game.HasSaveData(LS_Account.userId)

	if hasAutosaved then
		this.RefreshLoadGame(1)
		UILayerCtrl.Push("SubLoadGame", "LoadGame_SlotBtn1")
	elseif hasGameSaved then
		this.RefreshLoadGame(2)
		UILayerCtrl.Push("SubLoadGame", "LoadGame_SlotBtn2")
	end
end

function LobbyMainCtrl.HidePanelLoadGame()
	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "SubEditSave" then
		LobbyMainCtrl.HideSubLoadEdit()
	end

	local subLoadGame = pnlRoot.subLoadGame

	subLoadGame.show = false

	subLoadGame.go:SetActive(false)

	subLoadGame.isInEditMode = false

	LobbyMainCtrl.ResetGameConfig()
	UILayerCtrl.Pop()
end

function LobbyMainCtrl.HideSubLoadEdit()
	local idxCpySrc = this.ExitSubLoadEdit()

	UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. idxCpySrc)
end

function LobbyMainCtrl.ChangeState(step)
	runStep = step

	if step == RunStep.WaitLogin then
		pnlRoot.go:SetActive(false)
		imageLogo:SetActive(true)
		LobbyMainCtrl.LoadRenderTexture(true)
		SystemHelper.Log("WaitLogin~~~~")
		LobbyMainCtrl.ShowHome(false)
	elseif step == RunStep.PressStart then
		local camera = sceneController:GetCameraCtrl()

		if camera ~= nil then
			camera:SetBlurEnabled(false)
		end

		pnlRoot.go:SetActive(false)
		imageLogo:SetActive(true)

		local tw = imageLogo:GetComponent("XTween")

		tw:Play()
	elseif step == RunStep.Homepage then
		pnlRoot.go:SetActive(true)
		imageLogo:SetActive(false)
		LobbyMainCtrl.LoadRenderTexture(false)
		LobbyMainCtrl.ShowHome(true)
		pnlRoot.navBar.go:SetActive(true)
		pnlUser.go:SetActive(false)
	elseif step == RunStep.ChooseOnline then
		pnlRoot.go:SetActive(true)
	elseif step == RunStep.ChooseMatchMode then
		-- block empty
	elseif step == RunStep.WatchHero then
		pnlRoot.go:SetActive(false)
	elseif step == RunStep.Setting then
		pnlRoot.go:SetActive(false)
		imageLogo:SetActive(false)
		LobbyMainCtrl.LoadRenderTexture(false)
		this.OpenDialog()
	end
end

function LobbyMainCtrl.LoadRenderTexture(flg)
	if flg == true then
		if vfxRenderTex == nil or vfxRenderTex:IsCreated() == false then
			vfxRenderTex = UnityEngine.RenderTexture.New(512, 512, 0, UnityEngine.RenderTextureFormat.ARGB32)
			vfxRenderTex.name = "vfxRenderTex"
			renderTextureCamera.targetTexture = vfxRenderTex

			vfxRenderTex:SetGlobalShaderProperty("_GlobaRenderTex_vfxlogo")
		end
	elseif vfxRenderTex ~= nil and vfxRenderTex:IsCreated() == true then
		vfxRenderTex:Release()
	end
end

function LobbyMainCtrl.OnChangeScene(step)
	if step == ControllerLobby.SceneStatus.PressStart then
		Common.AllowExitToHome(true)
		this.ChangeState(RunStep.WaitLogin)
	elseif step == ControllerLobby.SceneStatus.Main then
		this.ChangeState(RunStep.Homepage)
	elseif step == ControllerLobby.SceneStatus.StartBattle then
		-- block empty
	elseif step == ControllerLobby.SceneStatus.Pvp then
		this.ChangeState(RunStep.ChooseMatchMode)
	elseif step == ControllerLobby.SceneStatus.Choose then
		if watchHero then
			this.ChangeState(RunStep.WatchHero)
			UILayerCtrl.Push("Heroes", "HeroSel1")
			UILayerCtrl.OnCursorClick()
		else
			LobbyMainCtrl.ShowHome(false)
			pnlRoot.go:SetActive(false)
			this.ChangeState(RunStep.ChooseHero)
			UIManager.CreateCtrl("ChooseHero")
			UIManager.SendMessage("ChooseHero", "UpdateHeroList", chooseHeroMode)
			UIManager.SendMessage("ChooseHero", "SetDifficulty", gameDifficulty)
		end
	elseif step == ControllerLobby.SceneStatus.SinglePlayer then
		if isBackFromArcadeMode == true then
			isBackFromArcadeMode = false

			FS_UserData.Reset()
			BattleData.SetHeroId(0)

			if previousArcadeModeIdx == FS_SaveStory.ArcadeMode.Normal then
				LobbyMainCtrl.OnButtonArcade()
			elseif previousArcadeModeIdx == FS_SaveStory.ArcadeMode.StageSelect then
				LobbyMainCtrl.OnButtonArcadeStage(false)
			else
				this.ChangeState(RunStep.Homepage)
			end

			previousArcadeModeIdx = 0
		else
			this.ChangeState(RunStep.Homepage)
		end
	end
end

function LobbyMainCtrl.OnLoginFinish()
	Common.AllowExitToHome(false)
	SystemHelper.Log("[ ______LobbyMainCtrl.OnLoginFinish() ]")

	local camera = sceneController:GetCameraCtrl()

	if camera ~= nil then
		camera:SetBlurEnabled(false)
	end

	sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.SinglePlayer)
	LobbyMainCtrl.RevalidateTitle()
end

function LobbyMainCtrl.SetNameAndLevel(name, level)
	pnlUser.textName:SetContent(name)
	pnlUser.textLevel:SetContent(level)
end

function LobbyMainCtrl.SetPortrait(id, url)
	local img = XImage:new(pnlUser.portraitIcon)

	XObjectPool.SetPortraitIcon(id, url, img)
end

function LobbyMainCtrl.SetFrame(icon)
	local img = XImage:new(pnlUser.portraitFrame)
	local sprite = XObjectPool.GetIcon("headFrame" .. string.format("%02d", icon))

	img:SetSprite(sprite)
end

function LobbyMainCtrl.PlayStartMenuAni(isIn)
	return
end

function LobbyMainCtrl.PlayChooseOnlineAni(isIn)
	return
end

function LobbyMainCtrl.PlaySubMenuAni(isIn)
	local comps = subMenu:GetComponentsInChildren(typeof(XTween), true)

	if comps.Length > 0 then
		for i = 0, comps.Length - 1 do
			comps[i].reversed = isIn

			comps[i]:Play()
		end
	end
end

function LobbyMainCtrl.FinishMatch()
	watchHero = false

	sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Choose)
	this.PlayStartMenuAni(false)
	UIManager.Close("ConfirmEnter")
end

function LobbyMainCtrl.SceneFadeIn()
	this.SceneFade(0)
end

function LobbyMainCtrl.SceneFadeOut()
	maskTween:Delay(0.05)
	this.SceneFade(1)
end

function LobbyMainCtrl.SceneFade(to)
	local tbl = {
		alpha = to
	}

	maskTween:MoveTo(tbl, 0.2)
	maskTween:Start()
end

function LobbyMainCtrl.SetRaycasterEnabled(flag)
	local raycast = this.gameObject:GetComponent("GraphicRaycaster")

	raycast.enabled = flag
	controlEnable = flag
end

function LobbyMainCtrl.SetFog(level)
	local camera = sceneController:GetCameraCtrl()

	if camera ~= nil then
		camera:SetFog(level)
	end
end

function LobbyMainCtrl.Update()
	if sceneController and sceneController:isLoadEnd() and loaderNewGame and loaderNewGame.loadFinished and loaderLoadGame and loaderLoadGame.loadFinished and loaderAutosave.loadFinished then
		if AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs then
			sceneController:ResetIdleState()
		end

		UILayerCtrl.Update()
		this.GamePadControl()

		if not IapData.GetEnterArcade() then
			local lName = UILayerCtrl.GetCurrentLayerName()

			if (lName == "LobbyRoot" or lName == "SubNavDLC" or lName == "PanelDLC") and bRefresh == true then
				local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
				local btnCfgArr = LobbyMainCfg.LobbyRoot
				local btnCount = table.nums(btnCfgArr)
				local currentBtnName = UILayerCtrl.GetCurrentButtonName()

				for i = 1, btnCount do
					local btnName = btnCfgArr[i][btnKeyIdx]

					if btnName == "LobbyMain_Root_NavBtn_Arcade" then
						local btn = pnlRoot.navBar.navRoot.btns[i]

						if btn ~= nil then
							bRefresh = false

							btn:TriggerAnimation(btn.btnCom.animationTriggers.disabledTrigger)

							if btnName == currentBtnName then
								local btnAnimator = btn.gameObject:GetComponent("Animator")

								if btnAnimator ~= nil then
									btnAnimator:SetTrigger("DisabledSelected")
								end
							end

							break
						end
					end
				end

				bRefresh = false
			end
		end

		UILayerCtrl.PostUpdate()
	end
end

function LobbyMainCtrl.JPadPress(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	SystemHelper.Log("LobbyMainCtrl.JPadPress: " .. dir .. " @" .. lName)

	if lName == "LobbyRoot" then
		local btnCount = pnlRoot.navBar.navRoot.btnCnt

		UILayerCtrl.Select(dir)

		previousBtnIndex = currentBtnIndex

		local hasAutosaved = LS_Autosave.IsReadable(LS_Account.userId)

		if hasAutosaved then
			if dir == XButton.Adjacent.UP then
				currentBtnIndex = (currentBtnIndex - 2 + btnCount) % btnCount + 1

				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

				bRefresh = true
			elseif dir == XButton.Adjacent.DOWN then
				currentBtnIndex = currentBtnIndex % btnCount + 1

				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

				bRefresh = true
			elseif DLC_Elena and dir == XButton.Adjacent.LEFT then
				bRefresh = true

				UILayerCtrl.Push("SubNavDLC", "LobbyMain_Root_DLC_Entry_LB")
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
			end
		elseif dir == XButton.Adjacent.UP then
			currentBtnIndex = currentBtnIndex - 1

			if currentBtnIndex < 3 then
				currentBtnIndex = btnCount
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		elseif dir == XButton.Adjacent.DOWN then
			currentBtnIndex = currentBtnIndex + 1

			if btnCount < currentBtnIndex then
				currentBtnIndex = 3
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		elseif DLC_Elena and dir == XButton.Adjacent.LEFT then
			UILayerCtrl.Push("SubNavDLC", "LobbyMain_Root_DLC_Entry_LB")
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end

		SystemHelper.Log("Menu: " .. previousBtnIndex .. " => " .. currentBtnIndex)
	elseif lName == "SubNavDLC" then
		if dir == XButton.Adjacent.RIGHT then
			UILayerCtrl.Pop()
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end
	elseif lName == "SubNavGame" then
		btnCount = table.nums(LobbyMainCfg.LevelDifficulty)

		UILayerCtrl.Select(dir)

		if dir == 1 then
			subNavIndex = subNavIndex - 1

			if subNavIndex < 1 then
				subNavIndex = btnCount
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		elseif dir == 2 then
			subNavIndex = subNavIndex + 1

			if subNavIndex > btnCount then
				subNavIndex = 1
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end
	elseif lName == "SubNavLevel" then
		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

		local normalizedY = -1
		local btnCount = MS_StoryList.LevelCount() + 1

		if AppVer == AppDemoE3_1906 then
			btnCount = 2
		end

		UILayerCtrl.Select(dir)

		normalizedY, subNavIndex, subNavSelect = SystemHelper.SelectLineInScrollRect(dir, subNavIndex, btnCount, subNavSelect, subNavListCount, subNavScrollGap, true)

		if normalizedY >= 0 then
			local scrollRectCom = pnlRoot.navBar.navLevel.scrollRect.scrollRectCom

			scrollRectCom.normalizedPosition = Vector2.New(scrollRectCom.normalizedPosition.x, normalizedY)
		end
	elseif lName == "SubNavItem" then
		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

		local normalizedY = -1
		local btnCount = MS_StoryList.MazeLevelCount() + 1

		UILayerCtrl.Select(dir)

		normalizedY, subNavIndex, subNavSelect = SystemHelper.SelectLineInScrollRect(dir, subNavIndex, btnCount, subNavSelect, subNavListCount, subNavScrollGap, true)

		if normalizedY >= 0 then
			local scrollRectCom = pnlRoot.navBar.navItem.scrollRect.scrollRectCom

			scrollRectCom.normalizedPosition = Vector2.New(scrollRectCom.normalizedPosition.x, normalizedY)
		end
	elseif lName == "SubGameMode" then
		if dir >= 3 and dir <= 4 then
			local nextBtn = UILayerCtrl.Select(dir)

			UILayerCtrl.OnCursorClick()
		end
	elseif lName == "SubNewGame" then
		if dir >= 1 and dir <= 2 then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
			UILayerCtrl.Select(dir)
		end
	elseif lName == "SubLoadGame" then
		if dir >= 1 and dir <= 2 then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

			local nextBtn = UILayerCtrl.Select(dir)

			if nextBtn then
				local subLoadGame = pnlRoot.subLoadGame

				if subLoadGame then
					subLoadGame.idxSel = nextBtn.idx

					this.RefreshLoadGame(subLoadGame.idxSel)
					SystemHelper.Log("Button index: " .. nextBtn.idx)
					nextBtn:OnDown(nil, nil)
					nextBtn:OnClick(nil, nil)
				end
			end
		end
	elseif lName == "SubEditSave" then
		if dir >= 1 and dir <= 2 then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

			local nextBtn = UILayerCtrl.Select(dir)

			if nextBtn then
				local subLoadGame = pnlRoot.subLoadGame

				if subLoadGame then
					subLoadGame.idxSel = nextBtn.idx

					SystemHelper.Log(string.format("[ Button index: %d]", nextBtn.idx))
				end
			end
		end
	elseif lName == "Skill" then
		UIManager.SendMessage("SkillView", "SkillScroll", dir)
	elseif lName == "ChallengeMode" then
		UILayerCtrl.Select(dir)
		UILayerCtrl.OnCursorClick()
	end
end

function LobbyMainCtrl.DPadPress(dir)
	LobbyMainCtrl.JPadPress(dir)
end

function LobbyMainCtrl.JPadRot(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "PanelDLC" and pnlDLC ~= nil and pnlDLC.scrollRect ~= nil then
		if dir == XButton.Adjacent.DOWN then
			local scrollRectCom = pnlDLC.scrollRect.scrollRectCom

			if pnlDLC.normalizedY > 0 then
				pnlDLC.normalizedY = pnlDLC.normalizedY - 0.05
			else
				pnlDLC.normalizedY = 0
			end

			scrollRectCom.normalizedPosition = Vector2.New(1, pnlDLC.normalizedY)
		elseif dir == XButton.Adjacent.UP then
			local scrollRectCom = pnlDLC.scrollRect.scrollRectCom

			if pnlDLC.normalizedY < 1 then
				pnlDLC.normalizedY = pnlDLC.normalizedY + 0.05
			else
				pnlDLC.normalizedY = 1
			end

			scrollRectCom.normalizedPosition = Vector2.New(1, pnlDLC.normalizedY)
		end
	end
end

function LobbyMainCtrl.GamePadControl()
	if controlEnable == false then
		return
	end

	if UILayerCtrl.IsProcessed() then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "LobbyRoot" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif (inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown()) and labelVersion ~= nil and UIManager.IsSteamDeck() then
			labelVersion:SetContent("v " .. ClientVersion.Version .. " (" .. ClientVersion.Package .. ") SteamDeck Optimized")
		end
	elseif layerName == "SubNavDLC" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			LobbyMainCtrl.BackToNavRoot()
		end
	elseif layerName == "PanelDLC" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			LobbyMainCtrl.BackToSubNavDLC()
		end
	elseif layerName == "SubNavGame" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
			UILayerCtrl.OnSelect(LobbyMainCfg.LevelDifficulty[LobbyMainCtrl.BtnKeyIdx])
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "SubNavLevel" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			local btnIdx = MS_StoryList.LevelCount() + 1

			if AppVer == AppDemoE3_1906 then
				btnIdx = 2
			end

			UILayerCtrl.OnSelect("LobbyMain_BtnLv" .. btnIdx)
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "SubNavItem" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			local btnIdx = MS_StoryList.MazeLevelCount() + 1

			UILayerCtrl.OnSelect("LobbyMain_BtnLv" .. btnIdx)
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "Local" then
		-- block empty
	elseif layerName == "ChooseHero" then
		-- block empty
	elseif layerName == "SubGameMode" then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
			this.HidePanelGameMode()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnButtonClick("LobbyMain_SubMode_BtnConfirm")
		end
	elseif layerName == "SubNewGame" then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
			this.HidePanelNewGame()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "AnnouncementLobby" then
		if inputMgr:GetButtonUp(GBKey.A) then
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "SubLoadGame" then
		local subLoadGame = pnlRoot.subLoadGame

		if subLoadGame then
			local slotIdx = subLoadGame.idxSel
			local slot = subLoadGame.btns[slotIdx]

			if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
				this.HidePanelLoadGame()
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
			elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnButtonClick("LobbyMain_Root_SubLoad_Edit_BtnLoad")
			elseif inputMgr:GetButtonDown(GBKey.X) then
				slot.btnDel:OnDown(nil, nil)
				slot.btnDel:OnClick(nil, nil)
			elseif inputMgr:GetButtonDown(GBKey.Y) then
				slot.btnCpy:OnDown(nil, nil)
				slot.btnCpy:OnClick(nil, nil)
			end
		end
	elseif layerName == "SubEditSave" then
		local subLoadGame = pnlRoot.subLoadGame

		if subLoadGame then
			local slotIdx = subLoadGame.idxSel
			local slot = subLoadGame.btns[slotIdx]

			if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)

				local idxCpySrc = this.ExitSubLoadEdit()

				subLoadGame.idxSel = idxCpySrc

				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. idxCpySrc)
			elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnButtonClick("LobbyMain_Root_SubLoad_Edit_BtnConfirm")
			end
		end
	elseif layerName == "ChallengeMode" then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			this.ShowPanelchallengeMode(false)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmUp() then
			UILayerCtrl.OnButtonClick("ConfirmBtn")
		end
	end
end

function LobbyMainCtrl.ShowPanelTopBg(show)
	if lobbyPanelTop and lobbyPanelTop.com and lobbyPanelTop.showBg ~= show then
		lobbyPanelTop.showBg = show

		lobbyPanelTop.com:SetActive(show)
	end
end

function LobbyMainCtrl.ShowActivation()
	this.OpenDialog()
	UIManager.CreateCtrl("Activation")
end

function LobbyMainCtrl.ShowActivationButton(show)
	pnlRoot.activation.show = show

	pnlRoot.activation.go:SetActive(show)
end

function LobbyMainCtrl.SetLogoLocalized()
	if imageLogo ~= nil and not IsNil(imageLogo) then
		local xImageLogo = XImage:new(imageLogo)

		SystemHelper.Log("_________________________Materials/LogoGroup_Txtmask_" .. LS_Setting.GetLanguage())
		xImageLogo:SetMaterial("Materials/LogoGroup_Txtmask_" .. LS_Setting.GetLanguage())
	end
end

function LobbyMainCtrl.ShowPanelTop(show)
	return
end

function LobbyMainCtrl.ShowBtnSelfInfo(show)
	local btn = UILayerCtrl.GetButton("LobbyTopBar", "Panel_Start_Panel_Top_Button_Active")

	if btn then
		if show then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "LobbyMain_User_L")
		else
			if lobbyPanelTop.btnKey == "LobbyMain_User_L" then
				lobbyPanelTop.btnKey = "Panel_Start_Panel_Top_Button_Active"
			end

			btn:SetAdjacent(XButton.Adjacent.LEFT, nil)
		end
	end
end

function LobbyMainCtrl.RefreshLoadGame(slotIdxEditable)
	if slotIdxEditable then
		SystemHelper.Log(string.format("RefreshLoadGame......%d", slotIdxEditable))
	else
		SystemHelper.Log("RefreshLoadGame......")
	end

	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame then
		local userId = LS_Account.userId
		local hasAutosaved = LS_Autosave.IsReadable(userId)
		local btns = subLoadGame.btns
		local count = table.nums(btns)
		local slotIdx = subLoadGame.idxSel

		for idx = 1, count do
			local bodyBtn = btns[idx]

			if bodyBtn then
				bodyBtn.selected:SetActive(false)
			end
		end

		local hasSetNavBar = false
		local bodyBtn = btns[1]

		if bodyBtn then
			local readable = LS_Autosave.IsReadable(userId)

			subLoadGame.goAutosave:SetActive(readable)
			bodyBtn.blank:SetActive(not readable)
			bodyBtn.inEdit:SetActive(false)
			bodyBtn.inUse.go:SetActive(readable)

			if hasAutosaved and not hasSetNavBar and slotIdxEditable and slotIdxEditable == 1 then
				hasSetNavBar = true

				this.SetSubLoadGameState(true, false, false)
			end
		end

		local lName = UILayerCtrl.GetCurrentLayerName()

		for idx = 2, count do
			local readable = LS_Game.IsReadable(userId, idx - 1)
			local bodyBtn = btns[idx]

			if bodyBtn then
				bodyBtn.blank:SetActive(not readable)
				bodyBtn.inUse.go:SetActive(readable)

				if readable then
					if slotIdxEditable and idx == slotIdxEditable and not subLoadGame.isInEditMode then
						bodyBtn.inEdit:SetActive(true)
					else
						bodyBtn.inEdit:SetActive(false)
					end

					if not hasSetNavBar and slotIdxEditable and idx == slotIdxEditable then
						hasSetNavBar = true

						if lName == "SubLoadGame" then
							this.SetSubLoadGameState(true, false, false)
						else
							this.SetSubLoadGameState(false, true, true)
						end
					end
				else
					bodyBtn.inEdit:SetActive(false)

					if not hasSetNavBar and slotIdxEditable and idx == slotIdxEditable then
						hasSetNavBar = true

						if lName == "SubLoadGame" then
							this.SetSubLoadGameState(false, false, false)
						end
					end
				end
			end
		end

		if not hasSetNavBar then
			hasSetNavBar = true

			this.SetSubLoadGameState(true, false, false)
		end
	end
end

function LobbyMainCtrl.RevalidateSaveSlots(panelName)
	SystemHelper.Log("[ RevalidateSaveSlots for " .. panelName .. " ]")

	if pnlRoot and panelName then
		local panel = pnlRoot[panelName]

		if panel and panel.btns then
			local userId = LS_Account.userId
			local btns = panel.btns
			local count = table.nums(btns)
			local bodyBtn = btns[1]

			if bodyBtn then
				local readable = LS_Autosave.IsReadable(userId)

				bodyBtn.blank:SetActive(not readable)
				bodyBtn.inEdit:SetActive(false)
				bodyBtn.inUse.go:SetActive(readable)
			end

			for idx = 2, count do
				btns[idx].selected:SetActive(false)

				local bodyBtn = btns[idx]
				local hasSaveData = LS_Game.IsReadable(userId, idx - 1)

				if hasSaveData then
					local slotData = LS_Setting.saveSlotStatus[idx]

					if slotData then
						local location = slotData[LS_Setting.SlotStatus.Location]

						if location > 0 then
							local level = slotData[LS_Setting.SlotStatus.Level]
							local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
							local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
							local gMode = slotData[LS_Setting.SlotStatus.GameMode]
							local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

							SystemHelper.Log("[ " .. idx .. " ===> L: " .. location .. ", Lv." .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")

							local pnl = bodyBtn.inUse
							local playTime = TimeHelper.getTimeSpan(pTime)

							pnl.location:SetGameTextContent(function()
								local siteData = MS_SiteInfo.GetSite(location)

								if siteData then
									return siteData.Name
								else
									return "Not defined"
								end
							end)

							local ts, tzo = TimeHelper.getUtcTime()

							pnl.level:SetContent(level)
							pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
							pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

							if gMode == BattleData.GlobalDifficultyLevel.Casual then
								pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
							else
								pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
							end

							pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
							bodyBtn.inUse.go:SetActive(true)
						end
					end

					bodyBtn.blank:SetActive(false)
				else
					bodyBtn.blank:SetActive(true)
				end
			end
		end
	end
end

function LobbyMainCtrl.SetSubLoadGameState(showLoad, showConfirm, showBack)
	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame then
		if subLoadGame.goCmdLoad and subLoadGame.showLoad ~= showLoad then
			subLoadGame.showLoad = showLoad

			subLoadGame.goCmdLoad:SetActive(showLoad)
		end

		if subLoadGame.goCmdConfirm and subLoadGame.showCmdConfirm ~= showConfirm then
			subLoadGame.showCmdConfirm = showConfirm

			subLoadGame.goCmdConfirm:SetActive(showConfirm)
		end

		if subLoadGame.goCmdBack and subLoadGame.showBack ~= showBack then
			subLoadGame.showBack = showBack

			subLoadGame.goCmdBack:SetActive(showBack)
		end
	end
end

function LobbyMainCtrl.ShowSubLoadCmdBar(show)
	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame and subLoadGame.pnlCmd and subLoadGame.showCmdBar ~= show then
		subLoadGame.showCmdBar = show

		subLoadGame.pnlCmd:SetActive(show)
	end
end

function LobbyMainCtrl.ShowSubLoadNavBar(show)
	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame and subLoadGame.navBar and subLoadGame.showNavBar ~= show then
		subLoadGame.showNavBar = show

		subLoadGame.navBar:SetActive(show)
	end
end

function LobbyMainCtrl.EraseSaveSlot(slotIdx)
	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame then
		local userId = LS_Account.userId
		local hasSaveData = LS_Game.IsReadable(userId, slotIdx)

		if hasSaveData then
			this.SetSubLoadGameState(true, false, false)
			this.ShowSubLoadNavBar(false)
			SystemHelper.Log("[ => EraseSaveSlot " .. slotIdx .. "? ]")
			UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_LOBBY_CAUSION_DELETE_SAVEDATA, function()
				if LS_Game.Delete(LS_Game.GetKey(slotIdx)) then
					LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetKey(slotIdx))
					LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetDeltaKey(slotIdx))
					LS_Setting.EraseSaveSlot(slotIdx)
					LS_Setting.Update()

					local btns = subLoadGame.btns
					local bodyBtn = btns[slotIdx]

					bodyBtn.blank:SetActive(true)
					bodyBtn.inUse.go:SetActive(false)
					bodyBtn.inEdit:SetActive(false)
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CAUSION_DELETE_SAVEDATA_FAILED)
				end

				this.RefreshLoadGame(slotIdx + 1)
				this.SetSubLoadGameState(true, false, false)
				this.ShowSubLoadNavBar(true)
				LobbyMainCtrl.RevalidateTitle()
				LobbyMainCtrl.RevalidateNewGame()
				LobbyMainCtrl.RevalidateLoadGame()
				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. slotIdx)
			end, function()
				this.ShowSubLoadNavBar(true)
			end, false)
		else
			SystemHelper.Log("[ Ignore => No savedata to erase @ " .. slotIdx .. " ]")
		end
	end
end

function LobbyMainCtrl.ExitSubLoad()
	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame then
		local userId = LS_Account.userId
		local btns = subLoadGame.btns
		local idxOffset = 1
		local count = table.nums(btns)

		for i = 2, count do
			local bodyBtn = btns[i]

			bodyBtn.inEdit:SetActive(false)
			bodyBtn.btn:SetNormal()
		end

		UILayerCtrl.Pop()
	end
end

function LobbyMainCtrl.FindNextSlotIdx(currIdx, maxCount)
	local nextIndex = 1

	for idx = 1, maxCount do
		if idx ~= currIdx then
			nextIndex = idx

			break
		end
	end

	return nextIndex
end

function LobbyMainCtrl.EnterSubLoadEdit(idxCpy)
	SystemHelper.Log("[ LobbyMainCtrl.EnterSubLoadEdit( " .. idxCpy .. " ) ]")

	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame then
		subLoadGame.isInEditMode = true

		local userId = LS_Account.userId
		local btns = subLoadGame.btns
		local hasSaveData = LS_Game.IsReadable(userId, idxCpy)
		local idxOffset = 1

		btns[1].btn:SetDisabled(true)

		if hasSaveData then
			this.SetSubLoadGameState(false, true, true)
			this.ShowSubLoadNavBar(false)

			local count = table.nums(btns) - idxOffset
			local nextIdx = this.FindNextSlotIdx(idxCpy, count)
			local namePrefix = "LoadGame_SlotBtn"
			local slotSrc = btns[idxCpy + idxOffset]

			if slotSrc then
				slotSrc.inEdit:SetActive(false)
				slotSrc.inCopy:SetActive(true)
				slotSrc.btn:SetInteractable(false)
			end

			for i = 1, count do
				local bodyBtn = btns[i + idxOffset]
				local btn = bodyBtn.btn
				local keyPrev, keyNext = this.GetSubIndices(i, count, idxCpy)

				btn:SetAdjacent(XButton.Adjacent.UP, namePrefix .. keyPrev + idxOffset)
				btn:SetAdjacent(XButton.Adjacent.DOWN, namePrefix .. keyNext + idxOffset)
				SystemHelper.Log(keyPrev + idxOffset .. " <= " .. i + idxOffset .. " => " .. keyNext + idxOffset)
			end

			subLoadGame.idxSel = nextIdx + idxOffset

			UILayerCtrl.Push("SubEditSave", "LoadGame_SlotBtn" .. nextIdx + idxOffset)
			SystemHelper.Log("[ => Copy Slot " .. idxCpy .. " to " .. nextIdx .. " (in " .. count .. ") ]")
		else
			SystemHelper.Log("[ => No savedata to copy from " .. idxCpy .. " ]")

			idxCpy = 0
		end
	end

	return idxCpy
end

function LobbyMainCtrl.ExitSubLoadEdit()
	UILayerCtrl.Pop()

	local subLoadGame = pnlRoot.subLoadGame

	if subLoadGame then
		subLoadGame.isInEditMode = false

		local idxCpy = subLoadGame.idxCpySrc
		local namePrefix = "LoadGame_SlotBtn"
		local btns = subLoadGame.btns
		local userId = LS_Account.userId
		local hasAutosaved = LS_Autosave.IsReadable(userId)
		local idxOffset = 1

		if hasAutosaved then
			local bodyBtn = btns[1]
			local btn = bodyBtn.btn

			btn:SetNormal(true)
		end

		local count = table.nums(btns)

		for i = 2, count do
			local bodyBtn = btns[i]
			local btn = bodyBtn.btn
			local keyPrev, keyNext = this.GetNavIndices(i, count)

			btn:SetAdjacent(XButton.Adjacent.UP, namePrefix .. keyPrev)
			btn:SetAdjacent(XButton.Adjacent.DOWN, namePrefix .. keyNext)
		end

		this.SetSubLoadGameState(true, false, false)
		this.RefreshLoadGame()

		local slotSrc = btns[idxCpy + idxOffset]

		if slotSrc then
			slotSrc.inEdit:SetActive(true)
			slotSrc.inCopy:SetActive(false)
			slotSrc.btn:SetInteractable(true)
		end

		subLoadGame.idxCpySrc = 0

		return idxCpy + idxOffset
	end

	return 0
end

function LobbyMainCtrl.CopySaveData(slotSrc, slotDst)
	SystemHelper.Log("[ Copy save " .. slotSrc .. " to save " .. slotDst .. " ]")

	local keySrc = LS_Game.GetKey(slotSrc)
	local keyDst = LS_Game.GetKey(slotDst)

	LS_Setting.CopySaveSlotInfo(slotSrc, slotDst)
	LS_Setting.Update()
	LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetKey(slotSrc), LS_PlayerBehavior.GetKey(slotDst))
	LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetDeltaKey(slotSrc), LS_PlayerBehavior.GetDeltaKey(slotDst))

	return LS_Game.Copy(LS_Game.GetKey(slotSrc), LS_Game.GetKey(slotDst))
end

function LobbyMainCtrl.SetSlotSelected(subName, selIdx)
	if pnlRoot and subName then
		local panel = pnlRoot[subName]

		if panel and panel.btns then
			local btns = pnlRoot.subNewGame.btns
			local count = table.nums(btns)

			for i = 1, count do
				local btn = btns[i]

				btn.selected:SetActive(false)
				btn.btn:SetSelectedLight(false)
				btn.btn:SetNormal()
			end

			btns[selIdx].selected:SetActive(true)
		end
	end
end

function LobbyMainCtrl.SetSlotsUnselected(subName)
	if pnlRoot and subName then
		local panel = pnlRoot[subName]

		if panel and panel.btns then
			local btns = pnlRoot.subNewGame.btns
			local count = table.nums(btns)

			for i = 1, count do
				btns[i].selected:SetActive(false)
			end
		end
	end
end

function LobbyMainCtrl.RemoveRootButton(btnKeyToRem)
	if btnKeyToRem == nil or string.len(btnKeyToRem) == 0 then
		return false
	end

	local idxDLC = 0
	local btnCount = pnlRoot.navBar.navRoot.btnCnt
	local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
	local btnCfgArr = LobbyMainCfg.LobbyRoot

	for i = 1, btnCount do
		local btnKey = btnCfgArr[i][1]

		if btnKey ~= nil and btnKey == btnKeyToRem then
			idxDLC = i

			break
		end
	end

	if idxDLC > 0 then
		local btnDLC = pnlRoot.navBar.navRoot.btns[idxDLC]

		if btnDLC ~= nil then
			btnDLC.gameObject:SetActive(false)
		end

		local keyPrev = idxDLC - 1
		local keyNext = idxDLC + 1
		local btnPre = pnlRoot.navBar.navRoot.btns[keyPrev]

		if btnPre ~= nil then
			btnPre:SetAdjacent(XButton.Adjacent.DOWN, btnCfgArr[keyNext][btnKeyIdx])
		end

		local btnAft = pnlRoot.navBar.navRoot.btns[keyNext]

		if btnAft ~= nil then
			btnAft:SetAdjacent(XButton.Adjacent.UP, btnCfgArr[keyPrev][btnKeyIdx])
		end

		return true
	end

	return false
end

function LobbyMainCtrl.RevalidateTitle()
	SystemHelper.Log("[ LobbyMainCtrl.RevalidateTitle() START ]")

	local hasAutosaved = LS_Autosave.IsReadable(LS_Account.userId)
	local hasGameSaved = LS_Game.HasSaveData(LS_Account.userId)
	local btnKeyIdx = LobbyMainCtrl.BtnKeyIdx
	local btnCbIdx = LobbyMainCtrl.BtnCbIdx
	local btnCfgArr = LobbyMainCfg.LobbyRoot
	local btnCount = table.nums(btnCfgArr)
	local hasQuitGame = Platform == PlatformType.MAC or Platform == PlatformType.PC

	if not hasQuitGame then
		btnCount = btnCount - 1
	end

	for i = 1, btnCount do
		local btnKey = btnCfgArr[i][btnKeyIdx]
		local keyPrev, keyNext = LobbyMainCtrl.GetNavBtnIndices(i, btnCount, hasAutosaved, hasGameSaved)
		local btn = pnlRoot.navBar.navRoot.btns[i]

		if btn then
			if i == 1 then
				btn.gameObject:SetActive(hasAutosaved)
			elseif i == 2 then
				btn.gameObject:SetActive(hasGameSaved)
			else
				btn.gameObject:SetActive(true)
			end

			btn:SetAdjacent(XButton.Adjacent.UP, btnCfgArr[keyPrev][btnKeyIdx])
			btn:SetAdjacent(XButton.Adjacent.DOWN, btnCfgArr[keyNext][btnKeyIdx])
		end
	end

	SystemHelper.Log("[ LobbyMainCtrl.RevalidateTitle() END.. ]")
end

function LobbyMainCtrl.RevalidateNewGame()
	if pnlRoot and pnlRoot.subNewGame then
		local subNewGame = pnlRoot.subNewGame

		SystemHelper.Log("[ LobbyMainCtrl.RevalidateNewGame() ]")

		if subNewGame then
			local userId = LS_Account.userId
			local buttons = subNewGame.btns

			for idx, bodyBtn in pairs(buttons) do
				local hasSaveData = LS_Game.IsReadable(userId, idx)

				if hasSaveData then
					local slotData = LS_Setting.saveSlotStatus[idx]

					if slotData then
						local pnl = bodyBtn.inUse
						local location = slotData[LS_Setting.SlotStatus.Location]
						local level = slotData[LS_Setting.SlotStatus.Level]
						local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
						local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
						local gMode = slotData[LS_Setting.SlotStatus.GameMode]
						local rCount = slotData[LS_Setting.SlotStatus.RoundCount]
						local playTime = TimeHelper.getTimeSpan(pTime)
						local ts, tzo = TimeHelper.getUtcTime()

						pnl.level:SetContent(level)
						pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
						pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

						if gMode == BattleData.GlobalDifficultyLevel.Casual then
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
						else
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
						end

						if location > 0 then
							pnl.location:SetGameTextContent(function()
								local siteData = MS_SiteInfo.GetSite(location)

								if siteData then
									return siteData.Name
								else
									return "Not found"
								end
							end)
						end

						pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
						SystemHelper.Log("[ New " .. idx .. " ===> L: " .. location .. ", Lv." .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")
					end

					bodyBtn.blank:SetActive(false)
					bodyBtn.inUse.go:SetActive(true)
				else
					bodyBtn.blank:SetActive(true)
					bodyBtn.inUse.go:SetActive(false)
				end
			end
		end
	end
end

function LobbyMainCtrl.RevalidateLoadGame()
	if pnlRoot and pnlRoot.subLoadGame then
		local subLoadGame = pnlRoot.subLoadGame

		SystemHelper.Log("[ LobbyMainCtrl.RevalidateLoadGame() ]")

		if subLoadGame then
			local userId = LS_Account.userId
			local buttons = subLoadGame.btns
			local count = table.nums(buttons)
			local hasAutosaved = LS_Autosave.IsReadable(userId)
			local slotBtnNamePrefix = "LoadGame_SlotBtn"

			subLoadGame.goAutosave:SetActive(hasAutosaved)

			if hasAutosaved then
				local bodyBtn = buttons[1]
				local slotData = LS_Setting.saveSlotStatus[LS_Setting.IndexAutosave]

				if slotData then
					local location = slotData[LS_Setting.SlotStatus.Location]

					if location > 0 then
						local level = slotData[LS_Setting.SlotStatus.Level]
						local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
						local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
						local gMode = slotData[LS_Setting.SlotStatus.GameMode]
						local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

						SystemHelper.Log("[ A: L." .. location .. ", Lv." .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")

						local pnl = bodyBtn.inUse
						local playTime = TimeHelper.getTimeSpan(pTime)

						pnl.location:SetGameTextContent(function()
							local siteData = MS_SiteInfo.GetSite(location)

							if siteData then
								return siteData.Name .. GameText.UI_COMMON_AUTOSAVE
							else
								return "Not defined"
							end
						end)

						local ts, tzo = TimeHelper.getUtcTime()

						pnl.level:SetContent(level)
						pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
						pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

						if gMode == BattleData.GlobalDifficultyLevel.Casual then
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
						else
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
						end

						pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
						bodyBtn.inUse.go:SetActive(true)
					else
						bodyBtn.inUse.go:SetActive(false)
					end
				end

				bodyBtn.blank:SetActive(false)
			else
				local bodyBtn = buttons[1]

				bodyBtn.inUse.go:SetActive(false)
				bodyBtn.blank:SetActive(true)
			end

			local idxOffset = 1

			for idx = 2, 4 do
				local slotIdx = idx - idxOffset

				bodyBtn = buttons[idx]

				local hasSaveData = LS_Game.IsReadable(userId, slotIdx)

				bodyBtn.blank:SetActive(not hasSaveData)
				bodyBtn.inUse.go:SetActive(hasSaveData)

				if hasSaveData then
					local slotData = LS_Setting.saveSlotStatus[slotIdx]

					if slotData then
						local location = slotData[LS_Setting.SlotStatus.Location]

						if location > 0 then
							local level = slotData[LS_Setting.SlotStatus.Level]
							local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
							local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
							local gMode = slotData[LS_Setting.SlotStatus.GameMode]
							local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

							SystemHelper.Log("[ M: L." .. location .. ", Lv." .. level .. ", " .. "P/S: " .. pTime .. "/" .. sTime .. ", R: " .. rCount .. " ]")

							local pnl = bodyBtn.inUse
							local playTime = TimeHelper.getTimeSpan(pTime)

							pnl.location:SetGameTextContent(function()
								local siteData = MS_SiteInfo.GetSite(location)

								if siteData then
									return siteData.Name
								else
									return "Not defined"
								end
							end)

							local ts, tzo = TimeHelper.getUtcTime()

							pnl.level:SetContent(level)
							pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
							pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

							if gMode == BattleData.GlobalDifficultyLevel.Casual then
								pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
							else
								pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
							end

							pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
							bodyBtn.inUse.go:SetActive(true)
						else
							bodyBtn.inUse.go:SetActive(false)
						end
					end
				end

				local btn = bodyBtn.btn
				local keyPrev, keyNext = LobbyMainCtrl.GetLoadMenuIndices(idx, count, hasAutosaved)

				btn:SetAdjacent(XButton.Adjacent.UP, slotBtnNamePrefix .. keyPrev)
				btn:SetAdjacent(XButton.Adjacent.DOWN, slotBtnNamePrefix .. keyNext)
			end
		end
	end
end

function LobbyMainCtrl.Close()
	if loaderNewGame then
		loaderNewGame:ClearTemplate()
	end

	if loaderAutosave then
		loaderAutosave:ClearTemplate()
	end

	if loaderLoadGame then
		loaderLoadGame:ClearTemplate()
	end

	if loaderLevelList then
		loaderLevelList:ClearTemplate()
	end

	if loaderItemList then
		loaderItemList:ClearTemplate()
	end

	if uiFeedback ~= nil and uiFeedback.panel ~= nil and uiFeedback.panel.messageLoader ~= nil then
		uiFeedback.panel.messageLoader:ClearTemplate()
	end

	if AnnouncementLoader then
		AnnouncementLoader:ClearTemplate()
	end

	UICtrlBase.Close("LobbyMain")
end

function LobbyMainCtrl.ClosePanelChallengeMode()
	LobbyMainCtrl.ShowPanelchallengeMode(false)
end

function LobbyMainCtrl.ShowPanelchallengeMode(show)
	if challengeMode and challengeMode.goRoot and challengeMode.show ~= show then
		challengeMode.show = show

		if show then
			UILayerCtrl.Push("ChallengeMode", "Mode1Btn")
		else
			UILayerCtrl.Pop()
		end

		challengeMode.goRoot:SetActive(show)

		if sceneController then
			sceneController:ResetIdleState()
		end
	end
end

function LobbyMainCtrl.ClosePanelArcadeMode()
	return
end

function LobbyMainCtrl.BackToNavRoot()
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName ~= "LobbyRoot" then
		UILayerCtrl.Pop()
	end

	bRefresh = true
end

function LobbyMainCtrl.BackToSubNavDLC()
	UILayerCtrl.Pop()

	if pnlDLC then
		pnlDLC.go:SetActive(false)

		pnlDLC.show = false

		XObjectPool.ClearImage()
	end

	bRefresh = true
end

function LobbyMainCtrl.ShowFeedbackUi(show)
	if uiFeedback and uiFeedback.goRoot and uiFeedback.show ~= show then
		uiFeedback.show = show

		uiFeedback.goRoot:SetActive(show)
	end
end

function LobbyMainCtrl.ShowPanelFeedback(show)
	if uiFeedback and uiFeedback.panel then
		local panel = uiFeedback.panel

		if panel.go and panel.show ~= show then
			panel.show = show

			if show then
				UILayerCtrl.Push("Feedback", nil)
			else
				UILayerCtrl.Pop()
			end

			panel.go:SetActive(show)

			if sceneController then
				sceneController:ResetIdleState()
			end
		end
	end
end

function LobbyMainCtrl.ClosePanelFeedback()
	LobbyMainCtrl.ShowPanelFeedback(false)
end

function LobbyMainCtrl.OnButtonSubmit(fbType, fbText)
	UIManager.SendMessage("Loading", "SimpleLoading", true)
	SystemHelper.Log("[ LobbyMainCtrl.OnButtonSubmit( " .. fbText .. " ) ]")
	SdkHelper.SetFeedback(0, fbText, function(result, code, ret)
		if result == true then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_FEEDBACK_SUBMIT_SUCCEEDED, function()
				return
			end, function()
				return
			end, true)
			FS_UserData.feedback:GetSendResult(ret)

			uiFeedback.panel.textContent.text = ""
		else
			local errMsg = SystemHelper.ParseErrorCode(code)

			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
				return
			end, function()
				return
			end, true)
		end

		UIManager.SendMessage("Loading", "SimpleLoading", false)
	end)
end

function LobbyMainCtrl.SetNewFeedback(bool)
	uiFeedback.panel.newPoint1:SetActive(bool)
	uiFeedback.panel.newPoint2:SetActive(bool)
end

function LobbyMainCtrl.LoadFeedbackMessage()
	LS_Feedback.Load(LS_Account.userId)

	local feedbackList = FS_UserData.feedback:GetFeedbackList()

	uiFeedback.panel.messageLoader.loadCount = #feedbackList

	function uiFeedback.panel.messageLoader.loadCallback(index, com, data)
		local roleText = com:GetText("Who_Text")
		local timeText = com:GetText("Time_Text")
		local contentText = com:GetText("Text")
		local buttonArea = com:GetGameObject("ButtonGroup")
		local btn = com:GetButton("ButtonGroup_Button")

		buttonArea:SetActive(false)

		if feedbackList[index].content ~= nil then
			roleText:SetContent(GameText.UI_FEEDBACK_MY_FEEDBACK)
			roleText:SetColor(1, 1, 1, 1)
			contentText:SetContent(feedbackList[index].content)
		end

		if feedbackList[index].reply ~= nil then
			if feedbackList[index].isMessage then
				roleText:SetContent(GameText.UI_FEEDBACK_SYSTEM_MESSAGE)
			else
				roleText:SetContent(GameText.UI_FEEDBACK_SYSTEM_REPLY)
			end

			roleText:SetColor(0.858, 0.729, 0.498, 1)
			contentText:SetContent(feedbackList[index].reply)
		end

		local t, delta = TimeHelper.getUtcTime()

		timeText:SetContent(os.date("%Y/%m/%d %H:%M:%S", feedbackList[index].time + delta))
	end

	uiFeedback.panel.messageLoader:PreloadTemplate(function()
		uiFeedback.panel.messageLoader:Load()
	end)
end

function LobbyMainCtrl.LoadAnnouncementAlwaysCallback(txt)
	UIManager.SendMessage("Loading", "SimpleLoading", false)

	if txt ~= "" then
		txt = string.gsub(txt, "\r\n", "\n")

		local stList = StringHelper.Split(txt, "^")

		AnnouncementGO:SetActive(true)
		UILayerCtrl.Push("AnnouncementLobby", "Panel_Announcement_Button1")

		AnnouncementLoader.loadCount = #stList

		function AnnouncementLoader.loadCallback(index, com, data)
			local ost = StringHelper.Split(stList[index], "\n")
			local roleText = com:GetText("Who_Text")
			local timeText = com:GetText("Time_Text")

			timeText.gameObject:SetActive(false)

			local contentText = com:GetText("Text")
			local buttonArea = com:GetGameObject("ButtonGroup")
			local btn = com:GetButton("ButtonGroup_Button")

			buttonArea:SetActive(false)

			local st = {}

			for i = 1, #ost do
				table.insert(st, ost[i])
			end

			roleText:SetContent(st[2])

			local retst = ""
			local retst_s = ""

			for i = 3, #st do
				if string.find(st[i], "url") == 1 then
					buttonArea:SetActive(true)
					btn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
						local url = StringHelper.Substring(st[i], 5, string.len(st[i]))

						UnityEngine.Application.OpenURL(url)
					end)
				else
					retst = retst .. st[i] .. "\n"

					if i < 6 then
						retst_s = retst_s .. st[i] .. "\n"
					end
				end
			end

			retst_s = retst_s .. "...\n"
			contentText.MainText = retst
			contentText.SimpleText = retst_s

			contentText:SetContent(retst)

			contentText.fold = false

			local foldBtn = com:GetButton("Who_Text_FoldBtn")
			local selfRT = com.gameObject:GetComponent("RectTransform")
			local foldIconTF = com:GetGameObject("Who_Text_FoldIcon").transform

			foldIconTF.eulerAngles = Vector3.New(0, 0, 180)

			foldBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
				if contentText.fold then
					contentText:SetContent(contentText.MainText)

					contentText.fold = false
					foldIconTF.eulerAngles = Vector3.New(0, 0, 180)
				else
					contentText:SetContent(contentText.SimpleText)

					contentText.fold = true
					foldIconTF.eulerAngles = Vector3.New(0, 0, 0)
				end

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(AnnouncementLoader.RT)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(selfRT)
			end)
		end

		AnnouncementLoader:PreloadTemplate(function()
			AnnouncementLoader:Load()
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_NETWORK_ERROR)
		AnnouncementGO:SetActive(false)
	end
end

function LobbyMainCtrl.CheckComfirmedName()
	if Platform == PlatformType.PC or Platform == PlatformType.MAC then
		return true
	end

	if DebugOpenAntiAddiction then
		SystemHelper.Log("check account state")

		if ST_Scene.GetIsInAntiAddictionTime() then
			SystemHelper.Log("LS_Account.GetAge() = " .. tostring(LS_Account.GetAge()))

			if LS_Account.GetAge() == 0 then
				SystemHelper.Log("check account state:" .. tostring(SdkHelper.CheckAccountState()))

				if SdkHelper.CheckAccountState() == true then
					SdkHelper.CallRealNameAuth(function(result, jsonStr)
						if result == true then
							LS_Account.SetAge(SdkHelper.GetUserAge())
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CONFIRM_NAME_SUCCESS)
						else
							UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CONFIRM_NAME_FAILED)
							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_RESTART_APP_BECAUSE_SDK, function()
								return
							end, function()
								return
							end, true)
						end
					end)
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_RESTART_APP_BECAUSE_SDK, function()
						return
					end, function()
						return
					end, true)

					return false
				end

				return false
			else
				SystemHelper.Log("代码执行到4345行")
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ANTI_ADDICTION, function()
					return
				end, function()
					return
				end, true)

				return false
			end
		else
			return true
		end

		return false
	else
		return true
	end
end

function LobbyMainCtrl.CloseAnnouncement()
	AnnouncementGO:SetActive(false)
	UILayerCtrl.Pop()
end

function LobbyMainCtrl.ClosePanel()
	if Platform ~= PlatformType.IOS then
		if SdkHelper.CHANNEL == "ANDROID_UNION" then
			SdkHelper.SdkQuitGame()
		elseif popQuit == false then
			popQuit = true

			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_COMMON_EXIT_GAME, function()
				popQuit = false

				UnityEngine.Application.Quit()
			end, function()
				popQuit = false
			end, false)
		end
	end
end

function LobbyMainCtrl.OpenPanelDLC()
	if pnlDLC ~= nil and pnlDLC.image ~= nil then
		local sprite
		local langId = LS_Setting.GetLanguage()
		local imgName = ""

		if langId == "zhs" or langId == "jp" then
			imgName = "additions_post_" .. langId
		else
			imgName = "additions_post_us"
		end

		XObjectPool.LoadImage(imgName, function()
			if pnlDLC ~= nil then
				local sprite = XObjectPool.GetImage(imgName)

				if sprite then
					pnlDLC.image:SetSprite(sprite)
					pnlDLC.goImage:SetActive(true)
				else
					pnlDLC.goImage:SetActive(false)
				end

				UILayerCtrl.Push("PanelDLC", "LobbyMain_PanelDLC_BtnPurchase")
				pnlDLC.go:SetActive(true)

				pnlDLC.show = true
			end
		end)
	end
end

function LobbyMainCtrl.RefreshDLCLogo()
	if AppVer == AppTapTapCloudDemo then
		return
	end

	local sprite
	local langId = LS_Setting.GetLanguage()

	if DLC_Elena then
		dlcElena.gameObject:SetActive(IapData.GetEnterArcade())

		if langId == "zhs" or langId == "jp" then
			sprite = XObjectPool.GetIcon("yln_dlc_" .. langId)
		else
			sprite = XObjectPool.GetIcon("yln_dlc_us")
		end

		if sprite ~= nil then
			dlcElena:SetSprite(sprite)
		end

		dlcElena.gameObject:SetActive(true)
		dlcLogo.gameObject:SetActive(false)
	else
		dlcLogo.gameObject:SetActive(IapData.GetEnterTide())

		local sprite

		if langId == "zhs" then
			sprite = XObjectPool.GetIcon("dlclogo_" .. langId)
		else
			sprite = XObjectPool.GetIcon("dlclogo_us")
		end

		if sprite ~= nil then
			dlcLogo:SetSprite(sprite)
		end

		dlcElena.gameObject:SetActive(false)
		dlcLogo.gameObject:SetActive(true)
	end

	dlcElena.gameObject:SetActive(false)
	dlcLogo.gameObject:SetActive(true)
end

return LobbyMainCtrl
