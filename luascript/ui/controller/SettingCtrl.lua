-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/SettingCtrl.lua

SettingCtrl = class("SettingCtrl", UICtrlBase)

local this = SettingCtrl

if AppVer == AppComReview then
	require("GameData/SettingCfgComReview")
elseif AppVer == AppAppleLight then
	require("GameData/SettingCfgAppleLight")
elseif AppVer == AppTapTapCloudDemo then
	require("GameData/SettingCfgTapTapCloudDemo")
elseif AppVer == AppCJ2020 then
	require("GameData/SettingCfgCJ2020")
elseif AppVer == AppTapTapEA then
	require("GameData/SettingCfgTapTapEA")
elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
	require("GameData/SettingCfgTapTap")
elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
	require("GameData/SettingCfgGooglePlay")
elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_HUAWEI then
	require("GameData/SettingCfgHuawei")
elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_UNION then
	require("GameData/SettingCfgUnion")
elseif SdkHelper.CHANNEL == "EPIC" then
	require("GameData/SettingCfgEpic")
elseif SdkHelper.CHANNEL == "MAC_APPLE_SDK" then
	require("GameData/SettingCfgMac")
else
	require("GameData/SettingCfg")
end

if Platform == PlatformType.IOS or Platform == PlatformType.TVOS or Platform == PlatformType.ANDROID then
	SettingCfg.Idx[1].Count = 6
end

require("GameData/InputCfg")

SettingCtrl.static.GlobalTimeOut = 3
SettingCtrl.static.GlobalScrollGap = 1
SettingCtrl.static.marginH = 48
SettingCtrl.static.marginV = 48
SettingCtrl.static.TypeId = {
	VauleSlider = 2,
	ButtonToggle = 3,
	ButtonGroup = 1
}
SettingCtrl.static.ItemData = {
	Node = 2,
	CbFn = 3,
	OneOp = 6,
	Type = 1,
	Value = 5,
	Elem = 4
}
SettingCtrl.static.ElemData = {
	Show = 2,
	Node = 1
}
SettingCtrl.static.DirSel = {
	R = 1,
	L = -1
}
SettingCtrl.static.KMConfig = "KMConfig"
SettingCtrl.static.GPConfig = "GPConfig"
SettingCtrl.static.InputDiagram = "InputDiagram"
SettingCtrl.static.NNConfig = "NNConfig"
SettingCtrl.static.PanelInputCfg = {
	"Setting_KMCfg",
	"Setting_TPCfg",
	"Setting_GPCfg"
}
SettingCtrl.static.BtnTPCTopBar = {
	"Setting_TPCfgPT_BtnCfg1",
	"Setting_TPCfgPT_BtnCfg2",
	"Setting_TPCfgPT_BtnCfg3"
}
SettingCtrl.static.BtnTPC = {
	LOCKON = "Setting_TPCfg_PM_BtnLockOn_RB",
	SKILL1 = "Setting_TPCfg_PM_BtnSkill1_RB",
	CHANGEHERO = "Setting_TPCfg_PM_BtnChangeHero_R",
	SKILL4 = "Setting_TPCfg_PM_BtnSkill4_RB",
	ITEMS2 = "Setting_TPCfg_PM_BtnItemS2_B",
	MOVE = "Setting_TPCfg_PM_Joystick_Move_LB",
	PLAYERINFO = "Setting_TPCfg_PM_BtnPlayerInfo_L",
	SKILL2 = "Setting_TPCfg_PM_BtnSkill2_RB",
	MOVEFIXED = "Setting_TPCfg_PM_Joystick_Move_Fixed_LB",
	SKILL5 = "Setting_TPCfg_PM_BtnSkill5_RB",
	ACTION = "Setting_TPCfg_PM_BtnAction_RB",
	ITEMS1 = "Setting_TPCfg_PM_BtnItemS1_B",
	SKILL3 = "Setting_TPCfg_PM_BtnSkill3_RB",
	SETTINGS = "Setting_TPCfg_PM_BtnSettings_L",
	SKILL6 = "Setting_TPCfg_PM_BtnSkill6_RB"
}
SettingCtrl.static.TPBtnMap = {
	LOCKON = "Button_LockPlayer_RB",
	SKILL1 = "Button_Skill1",
	CHANGEHERO = "Button_ChangeHero_R",
	SKILL4 = "Button_Skill4",
	ITEMS2 = "ComsumeItemPanel_B",
	PLAYERINFO = "Button_PlayerInfo_L",
	SKILL2 = "Button_Skill2",
	SKILL5 = "Button_Skill5",
	ACTION = "Panel_Actions_RB",
	ITEMS1 = "QuickItemPanel_B",
	SKILL3 = "Button_Skill3",
	SETTINGS = "Button_Settings_L",
	SKILL6 = "Button_Skill6"
}
SettingCtrl.static.PanelAccount = {
	Register = 2,
	Login = 1
}

if Platform == PlatformType.MAC then
	SettingCtrl.static.EnabledSignInWithApple = Common.GetOSVersion() >= 14
else
	SettingCtrl.static.EnabledSignInWithApple = Common.GetOSVersion() >= 13
end

SettingCtrl.static.UnavailableButtons = {
	LS_Setting.Btn.C1,
	LS_Setting.Btn.C2
}

if Platform == PlatformType.IOS or Platform == PlatformType.TVOS then
	SettingCtrl.static.UnavailableKeys = {
		Tilde = 53,
		Numlock = 0,
		F3 = 60,
		Help = 0,
		F14 = 0,
		Backspace = 42,
		RightWindows = 0,
		Pause = 0,
		F10 = 67,
		F1 = 58,
		BackQuote = 53,
		Escape = 41,
		F9 = 66,
		Delete = 76,
		F15 = 0,
		F2 = 59,
		F6 = 63,
		Break = 0,
		Return = 40,
		F13 = 0,
		LeftWindows = 0,
		ScrollLock = 0,
		Tab = 43,
		F8 = 65,
		F12 = 69,
		SysReq = 0,
		AltGr = 0,
		CapsLock = 57,
		F7 = 64,
		Print = 0,
		F11 = 68,
		F5 = 62,
		Menu = 0,
		F4 = 61
	}
else
	SettingCtrl.static.UnavailableKeys = {
		Tilde = 126,
		Numlock = 300,
		F3 = 284,
		Help = 315,
		F14 = 295,
		Backspace = 8,
		RightWindows = 312,
		Pause = 19,
		F10 = 291,
		F1 = 282,
		BackQuote = 96,
		Escape = 27,
		F9 = 290,
		Delete = 127,
		F15 = 296,
		F2 = 283,
		F6 = 287,
		Break = 318,
		Return = 13,
		F13 = 294,
		LeftWindows = 311,
		ScrollLock = 302,
		Tab = 9,
		F8 = 289,
		F12 = 293,
		SysReq = 317,
		AltGr = 313,
		CapsLock = 301,
		F7 = 288,
		Print = 316,
		F11 = 292,
		F5 = 286,
		Menu = 319,
		F4 = 285
	}
end

local panelMain, panels, panelInputCfg, panelInputDgm, panelAccount, panelGuide, loaderGuide, loaderKmCfg, panelReserved, panelGamePadSel
local cached = {}
local touchBtnCfg = {}
local gpBtnCfg = {}
local isFromGame = false
local isExitBtn = false
local rowMaxCount = 1
local tabIndex = 1
local rowIndex = 1
local colIndex = 1
local tabPrevious = 1
local rowPrevious = 1
local colPrevious = 1
local subRowIndex = 1
local subRowPrevious = 1
local subColIndex = 1
local subColPrevious = 1
local selInputMode = 1
local isJoystickAttached = LS_Setting.isJoystickConnected
local isKeyboardConnected = LS_Setting.isKeyboardConnected
local isMouseConnected = LS_Setting.isMouseConnected
local btnQuitToLobby, sceneController
local localPosition = Vector3.zero
local dragPosition = Vector3.zero
local configTimeCount = 0
local delayInteractiveTimeCount = 0
local startTimeHoldingButton = 0
local print_r = require("3rd/sproto/print_r")
local panelUser, panelCloud, panelCouldData, panelNoCould, panelCouldIntro, panelBinding, btnEditNickname, btnBindingTapTap, btnUnbindingTapTap, textTapTapUserName, textUnbindingButton, evtLog
local isStarting = false
local isShowingBinding = false
local delayAutoAdaption = 0
local ignoreFirstInput = true
local delaySaving = false
local kmNavBarRectTf, gpNavBarRectTf
local lastStepTime = -1
local lastSetValTime = -1
local dIncrValue = 1
local dStepValueMax = 10

function SettingCtrl.GetKeyCode()
	local keyCode = inputMgr:GetKeyCode()
	local isValid = true

	if ignoreFirstInput == true then
		ignoreFirstInput = false
		keyCode = 0
	end

	if keyCode > 0 then
		for kName, kCode in pairs(SettingCtrl.UnavailableKeys) do
			if keyCode == kCode then
				isValid = false
				keyCode = 0

				break
			end
		end
	end

	return keyCode, isValid
end

function SettingCtrl.GetButtonName()
	local keyCode = inputMgr:RecognizeButton()
	local isValid = true

	if keyCode ~= nil then
		for _, kCode in pairs(SettingCtrl.UnavailableButtons) do
			if keyCode == kCode then
				isValid = false
				keyCode = 0

				break
			end
		end
	end

	return keyCode, isValid
end

function SettingCtrl.GetLineButton(tabIdx, rowIdx)
	return SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Node]
end

function SettingCtrl.GetButtonInLine(tabIdx, rowIdx, colIdx)
	return SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem][colIdx][SettingCtrl.ElemData.Node]
end

function SettingCtrl.CheckExcluded(name)
	if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP and Device.getSysLang() == "zhs" and name == "Facebook" then
		return true
	end

	return false
end

function SettingCtrl.GetSibingBtnNameR(tabIdx, rowIdx)
	local nd = SettingCtrl.ItemData.Node
	local cnt = SettingCfg.Idx[tabIdx].Count
	local tab = SettingCfg.Tab[tabIdx]
	local prevIdx = (rowIdx - 2 + cnt) % cnt + 1
	local nextIdx = rowIdx % cnt + 1

	return tab[rowIdx][nd], tab[prevIdx][nd], tab[nextIdx][nd]
end

function SettingCtrl.GetSibingBtnNameH(tabIdx, rowIdx, colIdx)
	local nd = SettingCtrl.ElemData.Node
	local elements = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem]
	local cnt = #elements
	local prevIdx = colIdx == 1 and 1 or (colIdx - 2 + cnt) % cnt + 1
	local nextIdx = colIdx == cnt and cnt or colIdx % cnt + 1

	return elements[colIdx][nd], elements[prevIdx][nd], elements[nextIdx][nd]
end

function SettingCtrl.GetSliderValName(tabIdx, rowIdx)
	local elements = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem]

	return elements[1], elements[2]
end

function SettingCtrl.SetBrightness(value)
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController == nil then
		sceneController = ST_Main.GetSceneController()
	end

	if sceneController then
		local scene = sceneController:GetScene()

		if scene ~= nil then
			scene:SetBrightness(value)
		end

		LS_Setting.graphics.brightness = value
		delaySaving = true
	end
end

function SettingCtrl.SetFieldOfView(value)
	local sceneController = ST_Lobby.GetSceneController()

	if sceneController == nil then
		sceneController = ST_Main.GetSceneController()
	end

	if sceneController then
		local cameraCtrl = sceneController:GetCameraCtrl()

		if cameraCtrl ~= nil then
			cameraCtrl:SetFieldOfView(value)
		end

		LS_Setting.graphics.fieldofview = value
		delaySaving = true
	end
end

function SettingCtrl.SetSubtitle(btnIdx)
	SystemHelper.Log("SetSubtitle: " .. btnIdx)

	if btnIdx == 1 then
		LS_Setting.subtitle = 1
	else
		LS_Setting.subtitle = 0
	end
end

function SettingCtrl.SetShowTimeAndScore(btnIdx)
	SystemHelper.Log("SetShowTimeAndScore: " .. btnIdx)

	if btnIdx == 1 then
		LS_Setting.showTimeAndScore = 1

		UIManager.SendMessage("Mainmenu", "SetTimeRecordVisible", true)
		UIManager.SendMessage("Mainmenu", "RefreshTimeRecordVisible")
	else
		LS_Setting.showTimeAndScore = 0

		UIManager.SendMessage("Mainmenu", "SetTimeRecordVisible", false)
	end
end

function SettingCtrl.ShowTimeAndScoreSelection(show)
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].TimeAndScore
	local option = panels[tabIdx].item[rowIdx]

	option.show = show

	option.body:SetActive(show)
	option.row.gameObject:SetActive(show)
end

function SettingCtrl.ShowGameModeSelection(show)
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].GameMode
	local option = panels[tabIdx].item[rowIdx]

	option.show = show

	option.body:SetActive(show)
	option.row.gameObject:SetActive(show)
	SettingCtrl.UpdateGameModeSelection()
end

function SettingCtrl.UpdateGameModeSelection()
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].GameMode
	local option = panels[tabIdx].item[rowIdx]
	local btnSetGM = option.btn
	local btnLocked = option.btnLocked
	local currentGameMode = FS_UserData.story:GetDifficulty()

	if currentGameMode == BattleData.GlobalDifficultyLevel.Casual then
		btnSetGM[1]:SetHighlighted(true)
		btnLocked[1]:SetActive(false)
		btnSetGM[2]:SetDisabled(true)
		btnLocked[2]:SetActive(true)
	else
		btnSetGM[1]:SetNormal()
		btnLocked[1]:SetActive(false)
		btnSetGM[2]:SetNormal()
		btnLocked[2]:SetActive(false)
	end

	btnSetGM[FS_UserData.story:GetDifficulty()]:SelectOnStart(true)
	UIManager.SendMessage("Mainmenu", "UpdateHpBarByMode")
end

function SettingCtrl.SetGameMode(btnIdx)
	local currentGameMode = FS_UserData.story:GetDifficulty()

	if btnIdx ~= currentGameMode then
		if currentGameMode > BattleData.GlobalDifficultyLevel.Casual then
			UILayerCtrl.ForceUpdate(0.2)

			local tabIdx = SettingCfg.Pnl.Gameplay
			local rowIdx = SettingCfg.Idx[tabIdx].GameMode
			local option = panels[tabIdx].item[rowIdx]
			local tween = Tween:new(option.body)

			tween:SetAutoKill(true)
			tween:Delay(0.13)
			tween:MoveTo({}, 0)
			tween:OnComplete(function()
				UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_ANNO_CHANGEGAMEMODE, function()
					SystemHelper.Log("You are trying down-grading mode to " .. btnIdx .. " for SaveSlot " .. LS_Setting.lastSlotPlayed)
					FS_UserData.story:SetDifficulty(BattleData.GlobalDifficultyLevel.Casual)

					local gameController = ST_Main.GetSceneController():GetGameController()

					gameController:Save(ControllerStoryMode.SaveType.SavePoint)
					gameController:ChangeDifficulty(BattleData.GlobalDifficultyLevel.Casual)
					SettingCtrl.UpdateGameModeSelection()
				end, function()
					UILayerCtrl.Select(XButton.Adjacent.RIGHT)
					UILayerCtrl.OnCursorClick()
				end, false)
			end)
			tween:Start()
		else
			SystemHelper.Log("You are already in the casual mode for SaveSlot " .. LS_Setting.lastSlotPlayed)
		end
	else
		SystemHelper.Log("Nothing has been changed for SaveSlot " .. LS_Setting.lastSlotPlayed)
	end
end

function SettingCtrl.SetScreenMode(btnIdx)
	LS_Setting.fullscreen = 3 - btnIdx

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].Screen

	cached[tabIdx][rowIdx] = btnIdx

	local currIdx, scrW, scrH, edgeReachedL, edgeReachedR = LS_Setting.GetCurrentResolutionIndex()

	gameMgr:SetScreenResolution(scrW, scrH, LS_Setting.fullscreen)
	gameMgr:ModifyAppCfg()

	delaySaving = true
end

function SettingCtrl.SetCamSensitivity(value)
	LS_Setting.sensitivity = value
	delaySaving = true
end

function SettingCtrl.OnSetRevCameraX(btnIdx)
	if btnIdx == 1 then
		LS_Setting.camera.horizontal = 1
	elseif btnIdx == 2 then
		LS_Setting.camera.horizontal = -1
	end

	SystemHelper.Log("SetCameraX: " .. btnIdx .. " - " .. LS_Setting.camera.horizontal)
end

function SettingCtrl.OnSetRevCameraY(btnIdx)
	if btnIdx == 1 then
		LS_Setting.camera.vertical = 1
	elseif btnIdx == 2 then
		LS_Setting.camera.vertical = -1
	end

	SystemHelper.Log("SetCameraY: " .. btnIdx .. " - " .. LS_Setting.camera.vertical)
end

function SettingCtrl.OnSetFixedLJoystick(btnIdx)
	if btnIdx == 1 then
		LS_Setting.fixedvlj = 0
	elseif btnIdx == 2 then
		LS_Setting.fixedvlj = 1
	end

	sceneController = ST_Main.GetSceneController()

	if sceneController then
		sceneController:SetJoystickControllerForMoveFixed(LS_Setting.fixedvlj > 0)
		SystemHelper.Log("Actual: SetFixedVLJ: " .. btnIdx .. " - " .. LS_Setting.fixedvlj)
	end

	SystemHelper.Log("Value: SetFixedVLJ: " .. btnIdx .. " - " .. LS_Setting.fixedvlj)
end

function SettingCtrl.OnSetVibration(btnIdx)
	if btnIdx == 1 then
		LS_Setting.vibration = 0
	elseif btnIdx == 2 then
		LS_Setting.vibration = 1
	end

	SystemHelper.Log("Value: SetVibration: " .. btnIdx .. " - " .. LS_Setting.vibration)
end

function SettingCtrl.SetVolumeValue(volType, value)
	local decValue = value / 100
	local soundMode = SettingCfg.Idx[SettingCfg.Pnl.Sounds]

	if volType == soundMode.MasVolume then
		LS_Setting.sound = value

		FmodManager.SetVolume(decValue)
	elseif volType == soundMode.BgmVolume then
		LS_Setting.bgm = value

		FmodManager.SetVolume_BGM(decValue)
	elseif volType == soundMode.SfxVolume then
		LS_Setting.sfx = value

		FmodManager.SetVolume_SE(decValue)
	elseif volType == soundMode.VoiceVolume then
		LS_Setting.voice = value

		FmodManager.SetVolume_ADR(decValue)
	else
		return
	end

	delaySaving = true
end

function SettingCtrl.GetNextTabIndex(dir, excludeIdx)
	local count = table.nums(SettingCfg.UiName)
	local enabledTabs = SettingCfg.EnTabs
	local nextTabIndex = tabIndex

	repeat
		nextTabIndex = (nextTabIndex + dir + count - 1) % count + 1

		local manualSkip = isFromGame and nextTabIndex == SettingCfg.Pnl.SaveData
	until enabledTabs[nextTabIndex] and not manualSkip

	return nextTabIndex
end

function SettingCtrl.ResetTabs()
	tabPrevious = tabIndex
	rowPrevious = rowIndex

	if tabPrevious > 0 and rowPrevious > 0 then
		if panels[tabPrevious].sel[rowPrevious] then
			panels[tabPrevious].sel[rowPrevious].alpha = 0

			panels[tabPrevious].go:SetActive(false)
		else
			panels[tabPrevious].go:SetActive(false)
		end
	end

	tabIndex = 1
	rowIndex = 1
	panels[tabIndex].rowIdx = 1

	SettingCtrl.ShowTabAccount(true)
end

function SettingCtrl.SelectTab(nextTabIndex, nextRowIndex)
	tabPrevious = tabIndex
	rowPrevious = rowIndex

	if tabPrevious > 0 and rowPrevious > 0 then
		if panels[tabPrevious].sel[rowPrevious] then
			panels[tabPrevious].sel[rowPrevious].alpha = 0

			panels[tabPrevious].go:SetActive(false)
		else
			panels[tabPrevious].go:SetActive(false)
		end
	end

	if tabPrevious == SettingCfg.Pnl.Guide then
		panelGuide.rowIndex = 1
		panelGuide.rowPrevious = 1

		SettingCtrl.SetGuideBookPage(1)

		panelGuide.last = "BtnGuideP1"
	end

	tabIndex = nextTabIndex
	rowIndex = nextRowIndex
	panels[tabIndex].rowIdx = nextRowIndex

	if tabIndex == SettingCfg.Pnl.SaveData and SdkHelper.CHANNEL == LS_Account.CH_ANDROID_HUAWEI then
		panels[tabIndex].rowIdx = 2
		cached[tabIndex][2] = 1
		panels[tabIndex].last = SettingCfg.Tab[tabIndex][2][4][1][1]
	end

	if isFromGame and SystemHelper.iPhoneX() and btnQuitToLobby ~= nil then
		btnQuitToLobby.gameObject:SetActive(tabIndex ~= SettingCfg.Pnl.Guide)
	end

	local tabType = SettingCfg.Tab[tabIndex][1][SettingCtrl.ItemData.Type]

	if tabType < 3 then
		tabType = SettingCfg.Tab[tabIndex][rowIndex][SettingCtrl.ItemData.Type]
		rowMaxCount = SettingCfg.Idx[tabIndex].Count
	else
		rowMaxCount = table.nums(SettingCfg.Tab[tabIndex][1][SettingCtrl.ItemData.Elem])
	end

	if tabIndex == SettingCfg.Pnl.Control then
		local cfgCount = SettingCfg.Idx[tabIndex].Count

		if LS_Setting.showVib then
			rowMaxCount = Mathf.Max(cfgCount, 5)
		else
			rowMaxCount = 5
		end
	end

	local rowCount = SettingCfg.Idx[tabIndex].Count

	if rowCount > 0 then
		if isJoystickAttached or isKeyboardConnected then
			panels[tabIndex].sel[rowIndex].alpha = 1
		end

		panels[tabIndex].go:SetActive(true)
		panels[tabIndex].btnSel:SetNormal()
		panels[tabIndex].btnSel:SetHighlighted()

		for idx = 1, rowMaxCount do
			local option = panels[tabIndex].item[idx]
			local selIdx = cached[tabIndex][idx]

			if LS_Setting.graphics.vsync > 0 and tabIndex == SettingCfg.Pnl.Basic and idx == SettingCfg.Idx[SettingCfg.Pnl.Basic].GraphicsFrameRate then
				break
			end

			if option.sel then
				local count = table.nums(panels[tabIndex].sel)

				for idxItm = 1, count do
					if option.sel[idxItm] then
						option.sel[idxItm]:SetActive(idxItm == selIdx)
					end

					if option.btn[idxItm] and not option.btn[idxItm]:IsDisabled() then
						option.btn[idxItm]:SetNormal(true)
					end
				end
			end
		end
	elseif tabIndex == SettingCfg.Pnl.SaveData and not SettingCtrl.EnabledSignInWithApple and AppVer ~= AppComReview then
		panels[tabIndex].go:SetActive(true)
	elseif tabIndex == SettingCfg.Pnl.Guide then
		if isJoystickAttached or isKeyboardConnected then
			panels[tabIndex].sel[rowIndex].alpha = 1
		end

		panels[tabIndex].go:SetActive(true)
		panels[tabIndex].btnSel:SetNormal()
		panels[tabIndex].btnSel:SetHighlighted()

		local panel = panels[tabIndex]
		local selIdx = cached[tabIndex][1]
		local count = table.nums(panels[tabIndex].sel)

		for idxItm = 1, count do
			if panel.sel[idxItm] then
				local show = idxItm == selIdx

				panel.sel[idxItm].alpha = show and 1 or 0
			end
		end

		panelGuide.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panelGuide.scrollRect.scrollRectCom.normalizedPosition.x, 1)
		panelGuide.rowIndex = 1
		panelGuide.rowPrevious = 1
		panelGuide.selIndex = 1
		panelGuide.preIndex = 1
		panelGuide.sel[panelGuide.rowIndex].alpha = 1
	else
		panels[tabIndex].go:SetActive(true)
		panels[tabIndex].btnSel:OnDown(nil, nil)
		panels[tabIndex].btnSel:OnClick(nil, nil)
	end

	UILayerCtrl.Push(SettingCfg.UiName[tabIndex], panels[tabIndex].last)

	if panels[tabIndex].last and string.len(panels[tabIndex].last) > 0 then
		UILayerCtrl.OnButtonClickMute(panels[tabIndex].last)
	end

	panels[tabIndex].btnSel:SetHighlighted(true)
end

function SettingCtrl.delightSelectRow()
	local tabMax = table.nums(SettingCfg.Pnl)

	for tabIdx = 1, tabMax do
		local rowMax = SettingCfg.Idx[tabIdx].Count

		for rowIdx = 1, rowMax do
			panels[tabIdx].sel[rowIdx].alpha = 0
		end
	end
end

function SettingCtrl.relightSelectRow()
	panels[tabIndex].sel[rowIndex].alpha = 1
end

function SettingCtrl.SelectRow(tabIdx, nextRowIndex)
	rowPrevious = rowIndex
	rowIndex = nextRowIndex

	local prevBtn = UILayerCtrl.GetButton(SettingCfg.UiName[tabIdx], panels[tabIdx].last)

	if prevBtn then
		prevBtn:SetNormal()
	end

	panels[tabIndex].rowIdx = nextRowIndex

	if panels[tabIndex] then
		if panels[tabIndex].sel[rowPrevious] then
			panels[tabIndex].sel[rowPrevious].alpha = 0
		end

		isJoystickAttached = LS_Setting.isJoystickConnected
		isKeyboardConnected = LS_Setting.isKeyboardConnected
		isMouseConnected = LS_Setting.isMouseConnected

		if (isJoystickAttached or isKeyboardConnected or isMouseConnected) and panels[tabIndex].sel[rowIndex] then
			panels[tabIndex].sel[rowIndex].alpha = 1
		end

		local rowCount = SettingCfg.Idx[tabIndex].Count

		if rowCount > 1 then
			local optData = SettingCfg.Tab[tabIndex][nextRowIndex]
			local optType = optData[SettingCtrl.ItemData.Type]

			if optType == 1 then
				local selIdx = cached[tabIndex][nextRowIndex]
				local elements = optData[SettingCtrl.ItemData.Elem]

				if selIdx == 0 then
					elements = {
						{
							"",
							true
						}
					}
					selIdx = 1
				end

				panels[tabIndex].last = elements[selIdx][SettingCtrl.ElemData.Node]

				if LS_Setting.graphics.vsync > 0 and tabIdx == SettingCfg.Pnl.Basic and nextRowIndex == SettingCfg.Idx[SettingCfg.Pnl.Basic].GraphicsFrameRate then
					-- block empty
				else
					UILayerCtrl.OnSelect(panels[tabIndex].last, true)
				end
			else
				panels[tabIndex].last = ""
			end
		else
			local optData = SettingCfg.Tab[tabIndex][1]
			local optType = optData[SettingCtrl.ItemData.Type]
			local elements = optData[SettingCtrl.ItemData.Elem]

			if optType == 3 then
				local optData = SettingCfg.Tab[tabIndex][1][SettingCtrl.ItemData.Elem][nextRowIndex]

				panels[tabIndex].last = optData[SettingCtrl.ElemData.Node]

				UILayerCtrl.OnSelect(panels[tabIndex].last, true)
				UILayerCtrl.OnCursorClick()
			else
				panels[tabIndex].last = ""
			end
		end
	end

	if prevBtn then
		prevBtn:SetSelectedLight(false)
	end
end

function SettingCtrl.SelectRowInInputCfg(mode, nextRowIndex)
	local panel = panelInputCfg[mode].panel
	local delta = nextRowIndex - panel.rowIndex

	panel.rowPrevious = panel.rowIndex
	panel.rowIndex = nextRowIndex
	panel.selIndex = panel.selIndex + delta
	panel.sel[panel.rowPrevious].alpha = 0
	panel.sel[panel.rowIndex].alpha = 1

	AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
	UILayerCtrl.OnSelect("GPCBS" .. nextRowIndex + 1, false)
end

function SettingCtrl.UpdateSelectRowInInputCfgKM(mode, dir)
	if dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN then
		local panel = panelInputCfg[mode].panel

		if panel then
			local gap = 0
			local showCount = 9
			local btnCnt = table.nums(InputCfg.KeyList)
			local screenWidth = SystemHelper.GetScreenWidth()
			local screenHeight = SystemHelper.GetScreenHeight()
			local screenRatio = screenWidth / screenHeight

			if screenRatio > 1.59 and screenRatio < 1.77 then
				panel.showCount = 10
			elseif screenRatio > 1.34 and screenRatio <= 1.59 then
				panel.showCount = 11
			elseif screenRatio >= 1 and screenRatio <= 1.34 then
				panel.showCount = 13
			end

			showCount = panel.showCount
			gap = 0

			local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, panel.rowIndex, btnCnt, panel.selIndex, showCount, gap, true)

			if normalizedY >= 0 then
				panel.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panel.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
			end

			panel.rowIndex = nextIndex
			panel.selIndex = selIndex
			panel.rowPrevious = prevIndex
			panel.sel[panel.rowPrevious].alpha = 0
			panel.sel[panel.rowIndex].alpha = 1

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
			SystemHelper.Log("[ Mode " .. mode .. ", Stepping Line: " .. panel.rowPrevious .. " -> " .. panel.rowIndex .. "]")
			UILayerCtrl.OnSelect("KMCB" .. nextIndex, true)
		end
	end
end

function SettingCtrl.UpdateSelectRowInInputCfgGP(mode, dir)
	local panel = panelInputCfg[mode].panel

	if panel then
		UILayerCtrl.Select(dir)

		local gap = 0
		local showCount = 9
		local btnCnt = table.nums(LS_Setting.GPItems)

		if SystemHelper.iPhoneX() then
			showCount = 8
		elseif SystemHelper.isSubquadrateScrAS() then
			showCount = 10
			gap = 0
		end

		local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, panel.rowIndex, btnCnt, panel.selIndex, showCount, gap, true)

		if normalizedY >= 0 then
			panel.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panel.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
		end

		panel.rowIndex = nextIndex
		panel.selIndex = selIndex
		panel.rowPrevious = prevIndex
		panel.sel[panel.rowPrevious].alpha = 0
		panel.sel[panel.rowIndex].alpha = 1

		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
		UILayerCtrl.OnSelect("GPCBS" .. nextIndex + 1, false)
		SystemHelper.Log("[ Mode " .. mode .. ", Stepping Line: " .. panel.rowPrevious .. " -> " .. panel.rowIndex .. "]")
	end
end

function SettingCtrl.ResetInputPanelTouchPad(index)
	local mode = LS_Setting.InputMode.TP
	local panel = panelInputCfg[mode].panel

	LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current] = index

	if panel ~= nil then
		panel.slot = index

		local current = panel.current

		if current ~= nil then
			SystemHelper.Log(string.format("[ DeSelect button: %s ]", current))

			local button = panel.buttons[current]

			button.sel:SetActive(false)
			button.btn:SetSelectedLight(false)

			panel.current = nil
			panel.previous = nil
		end
	end
end

function SettingCtrl.UpdateSelectRowInGuideBook(dir)
	if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and panelGuide ~= nil and panelGuide.isLoading == false then
		local gap = 0
		local showCount = panelGuide.showCount
		local listCount = loaderGuide.loadCount
		local step = 1 / (listCount - showCount)
		local toprow = 1 + math.floor((1 - panelGuide.scrollRect.scrollRectCom.normalizedPosition.y) / step + 0.5)
		local botrow = toprow + showCount - 1
		local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, panelGuide.rowIndex, listCount, panelGuide.selIndex, showCount, gap, true)

		if normalizedY >= 0 then
			panelGuide.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panelGuide.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
		end

		panelGuide.rowIndex = nextIndex
		panelGuide.rowPrevious = prevIndex
		panelGuide.sel[panelGuide.rowPrevious].alpha = 0
		panelGuide.sel[panelGuide.rowIndex].alpha = 1

		local tabIdx = SettingCfg.Pnl.Guide

		this.SelectRow(tabIdx, nextIndex)
		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
	end
end

function SettingCtrl.GetSelRowIdx(tabIdx, cellIdx)
	if panels then
		local panel = panels[tabIdx]

		if panel then
			local scrollRect = panel.scrollRect

			if scrollRect then
				local showCnt = panel.showCount
				local listCnt = panel.listCount
				local toprow = 1 + math.floor((1 - scrollRect.scrollRectCom.normalizedPosition.y) / (1 / (listCnt - showCnt)) + 0.5)
				local botrow = toprow + showCnt - 1

				panel.rowIndex = cellIdx
				panel.selIndex = cellIdx - toprow + 1

				return panel.selIndex
			end
		end
	end

	return selIdx
end

function SettingCtrl.OnCreate()
	this.loadFinish = false
	sceneController = ST_Main.GetSceneController()

	if sceneController then
		sceneController:EnterMenu(true)
		UIManager.SendMessage("Captured", "Show", true)
	end

	evtLog = nil
	isStarting = false
	isShowingBinding = false
	lastStepTime = -1
	lastSetValTime = -1
	dIncrValue = 1
	dStepValueMax = 10
	isJoystickAttached = LS_Setting.isJoystickConnected
	isKeyboardConnected = LS_Setting.isKeyboardConnected
	isMouseConnected = LS_Setting.isMouseConnected

	local layers = SettingCfg.Layers
	local count = table.nums(layers)

	for idx = 1, count do
		UILayerCtrl.Add(layers[idx], SettingCtrl.ClosePanel)
	end

	UILayerCtrl.Add("Binding", SettingCtrl.ClosePanelBinding)
	UILayerCtrl.Add(SettingCtrl.KMConfig, SettingCtrl.CloseKmModConfig)
	UILayerCtrl.Add(SettingCtrl.GPConfig, SettingCtrl.CloseGpModConfig)
	UILayerCtrl.Add("GamePadSel")

	panels = {}
	panelGuide = {}

	local tabIdx = SettingCfg.Pnl.Guide

	panels[tabIdx] = panelGuide

	local guideData = MS_StoryGuideSort.GetGuideList()
	local count = table.nums(guideData)

	panelGuide.data = guideData
	panelGuide.itemCount = count
	panelGuide.showCount = 8

	local screenWidth = SystemHelper.GetScreenWidth()
	local screenHeight = SystemHelper.GetScreenHeight()
	local screenRatio = screenWidth / screenHeight

	if screenRatio > 1.59 and screenRatio < 1.77 then
		panelGuide.showCount = 9
	elseif screenRatio > 1.34 and screenRatio <= 1.59 then
		panelGuide.showCount = 10
	elseif screenRatio >= 1 and screenRatio <= 1.34 then
		panelGuide.showCount = 12
	end

	panelGuide.rowIndex = 1
	panelGuide.rowPrevious = 1
	panelGuide.selIdx = 1
	panelGuide.rowIdx = 1
	panelGuide.selIndex = 1
	panelGuide.preIndex = 1
	panelGuide.last = "BtnGuideP1"
	panelGuide.idxPage = 1
	panelGuide.sel = {}
	panelGuide.show = true
	panelGuide.isLoading = false
	panelGuide.inLoading = false
	panelGuide.go = this.mainComponent:GetGameObject("Setting_Main_" .. SettingCfg.UiName[tabIdx])
	panelGuide.item = {}

	local guideElem = {}

	for idx = 1, count do
		local rowData = {}

		rowData[SettingCtrl.ElemData.Node] = "BtnGuideP" .. idx
		rowData[SettingCtrl.ElemData.Show] = true
		guideElem[idx] = rowData
	end

	SettingCfg.Tab[tabIdx][1][SettingCtrl.ItemData.Elem] = guideElem

	local panelList = {}

	panelGuide.panelList = panelList
	panelList.go = this.mainComponent:GetGameObject("Setting_Guide_List")
	panelGuide.scrollRect = XScrollRect:new(panelList.go)
	panels[tabIdx].scrollRect = panelGuide.scrollRect

	local rectTf = panelList.go:GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 51 * panelGuide.showCount + 9 * (panelGuide.showCount + 1))
	panels[tabIdx].rectTf = rectTf

	local panelDiagram = {}

	panelGuide.panelDiagram = panelDiagram
	panelDiagram.go = this.mainComponent:GetGameObject("Setting_Guide_Diagram")
	panelDiagram.img = XImage:new(this.mainComponent:GetGameObject("Setting_Guide_Diagram_Image"))
	panelDiagram.txt = this.mainComponent:GetText("Setting_Guide_Diagram_Text")
	panelGuide.flagRefreshLanguage = false

	local btnNamePrefix = "BtnGuideP"
	local uiName = SettingCfg.UiName[tabIdx]

	loaderGuide = this.mainComponent:GetLoader("Setting_GuideLoader")
	loaderGuide.loadCount = count
	loaderGuide.loadStepping = 0
	loaderGuide.loadFinished = false

	function loaderGuide.loadCallback(index, com, data)
		local bodyBtn = {}

		bodyBtn.idx = index
		bodyBtn.cur = com:GetGameObject("Setting_GuideRowSel")

		bodyBtn.cur:SetActive(true)

		bodyBtn.sel = bodyBtn.cur:GetComponent("CanvasGroup")
		bodyBtn.sel.alpha = 0
		bodyBtn.txt = com:GetText("Setting_GuideRowText")

		local data = MS_StoryGuideSort.GetGuidePage(index)

		if data then
			bodyBtn.txt:SetContent(data.Title)
		end

		local btn = com:GetButton("Setting_GuideRowBtn")

		btn:SetParentScroll(panelGuide.scrollRect)

		bodyBtn.btn = btn

		btn:SetAudioType(AudioCtrl.ButtonClickType.Option)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if panelGuide.isLoading == false then
				panelGuide.isLoading = true

				local toprow = 1 + math.floor((1 - panelGuide.scrollRect.scrollRectCom.normalizedPosition.y) / (1 / (loaderGuide.loadCount - panelGuide.showCount)) + 0.5)
				local botrow = toprow + panelGuide.showCount - 1

				panelGuide.rowIndex = bodyBtn.idx
				panelGuide.selIndex = bodyBtn.idx - toprow + 1

				SettingCtrl.SetGuideBookPage(bodyBtn.idx)
			end
		end, 0)

		local idxPrev, idxNext = this.GetNavIndices(index, loaderGuide.loadCount)

		btn:SetAdjacent(XButton.Adjacent.UP, btnNamePrefix .. idxPrev)
		btn:SetAdjacent(XButton.Adjacent.DOWN, btnNamePrefix .. idxNext)
		UILayerCtrl.AddButton(uiName, btnNamePrefix .. index, btn)

		panelGuide.item[index] = bodyBtn
		panelGuide.sel[index] = bodyBtn.sel
		loaderGuide.loadStepping = loaderGuide.loadStepping + 1
		loaderGuide.loadFinished = loaderGuide.loadStepping == loaderGuide.loadCount
	end

	loaderGuide:PreloadTemplate(function()
		loaderGuide:Load()
	end)

	local difficulty = FS_UserData.story:GetDifficulty()

	if difficulty == nil then
		difficulty = LS_Setting.Difficulty.Normal
	end

	cached = {
		{
			3 - LS_Setting.fullscreen,
			LS_Setting.customresolution,
			LS_Setting.graphics.vsync == 0 and 1 or 2,
			LS_Setting.graphics.framerate,
			LS_Setting.graphics.brightness,
			LS_Setting.graphics.fieldofview,
			LS_Setting.graphics.quality - 1,
			LS_Setting.graphics.antialiasing,
			LS_Setting.graphics.reflection,
			LS_Setting.graphics.ambientocclusion,
			LS_Setting.graphics.vignette == 0 and 1 or 2
		},
		{
			LS_Setting.sound,
			LS_Setting.bgm,
			LS_Setting.sfx,
			LS_Setting.voice
		},
		{
			LS_Setting.sensitivity,
			LS_Setting.lastSetInput,
			LS_Setting.vibration == 0 and 1 or 2,
			LS_Setting.camera.horizontal > 0 and 1 or 2,
			LS_Setting.camera.vertical > 0 and 1 or 2
		},
		{
			LS_Setting.GetLanguageIndex(),
			LS_Setting.subtitle == 1 and 1 or 2,
			difficulty,
			LS_Setting.showTimeAndScore == 1 and 1 or 2
		},
		{
			1,
			1
		},
		{
			1
		}
	}

	UIManager.RefreshLanguage()

	tabIndex = 1
	rowIndex = 1
	colIndex = 1
	tabPrevious = 1
	rowPrevious = 1
	colPrevious = 1

	local tabCount = table.nums(SettingCfg.UiName)
	local btnBackToGame = this.mainComponent:GetButton("Setting_Buttom_Back")

	btnBackToGame:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btnBackToGame:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.ClosePanel()
	end)

	btnQuitToLobby = this.mainComponent:GetButton("Setting_Main_BtnQuit_B")

	btnQuitToLobby:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.RequestExit()
	end)

	for tabIdx = 1, tabCount do
		UILayerCtrl.AddIndividual(SettingCfg.UiName[tabIdx], "Setting_Buttom_Back", btnBackToGame)
		UILayerCtrl.AddIndividual(SettingCfg.UiName[tabIdx], "Setting_Main_BtnQuit_B", btnQuitToLobby)
	end

	if isFromGame then
		btnQuitToLobby.gameObject:SetActive(isExitBtn)
	else
		btnQuitToLobby.gameObject:SetActive(false)
	end

	panelMain = this.mainComponent:GetGameObject("Setting_Main")

	local enabledTabs = SettingCfg.EnTabs
	local totalTabCount = table.nums(enabledTabs)
	local actualTabCount = 0

	for tabIdx = 1, totalTabCount do
		actualTabCount = actualTabCount + (enabledTabs[tabIdx] and 1 or 0)
	end

	local flagL = false
	local flagR = false
	local count = 0

	for tabIdx, pnlName in pairs(SettingCfg.UiName) do
		local isTabEnabled = enabledTabs[tabIdx]

		if tabIdx == SettingCfg.Pnl.Guide then
			panels[tabIdx] = panelGuide
			panels[tabIdx].last = "BtnGuideP1"

			local btn = this.mainComponent:GetButton(SettingCfg.Nav[tabIdx])

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				btn:SetSelected(true)
				UILayerCtrl.Pop()
				this.SelectTab(tabIdx, panels[tabIdx].rowIdx)
			end)
			btn.gameObject:SetActive(isTabEnabled)

			panels[tabIdx].btnSel = btn
		else
			local panel = {}

			panel.rowIndex = 1
			panel.selIdx = 1
			panel.selIndex = 1
			panel.show = true
			panel.go = this.mainComponent:GetGameObject("Setting_Main_" .. pnlName)
			panel.sel = {}
			panel.item = {}
			panel.rowIdx = 1

			if tabIdx == 1 then
				panel.last = SettingCfg.Tab[tabIdx][1][4][cached[tabIdx][1]][1]
			elseif tabIdx == SettingCfg.Pnl.Guide then
				panel.last = "BtnGuideP1"
			elseif SettingCfg.Tab[tabIdx][1][1] == 1 then
				panel.last = SettingCfg.Tab[tabIdx][1][4][1][1]
			else
				panel.last = ""
			end

			local btn = this.mainComponent:GetButton(SettingCfg.Nav[tabIdx])

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				btn:SetSelected(true)
				UILayerCtrl.Pop()
				this.SelectTab(tabIdx, panels[tabIdx].rowIdx)
			end)
			btn.gameObject:SetActive(isTabEnabled)

			panel.btnSel = btn

			local rowMax = SettingCfg.Idx[tabIdx].Count

			if rowMax ~= nil and rowMax > 0 then
				for rowIdx = 1, rowMax do
					local selectedCg = this.mainComponent:GetGameObject(string.format("%s%ds", SettingCfg.UiName[tabIdx], rowIdx)).transform:GetComponent("CanvasGroup")

					if selectedCg == nil then
						selectedCg = panel
					end

					selectedCg.alpha = 0
					panel.sel[rowIdx] = selectedCg
				end
			end

			panel.btnBlank = this.mainComponent:GetButton(string.format("%sBtnBlank", pnlName))

			panel.btnBlank:SetAudioType(AudioCtrl.ButtonClickType.None)

			panels[tabIdx] = panel
		end

		local panel = panels[tabIdx]

		count = count + 1
		panel.cgIconL = this.mainComponent:GetGameObject("Settings_NavBar_Btn" .. tabIdx .. "L_AuxIcon"):GetComponent("CanvasGroup")
		panel.cgIconR = this.mainComponent:GetGameObject("Settings_NavBar_Btn" .. tabIdx .. "R_AuxIcon"):GetComponent("CanvasGroup")

		if not flagL and enabledTabs[tabIdx] then
			flagL = true
			panel.cgIconL.alpha = 1
			panel.cgIconR.alpha = 0
		elseif not flagR and enabledTabs[tabIdx] and count == totalTabCount then
			flagR = true
			panel.cgIconL.alpha = 0
			panel.cgIconR.alpha = 1
		else
			panel.cgIconL.alpha = 0
			panel.cgIconR.alpha = 0
		end
	end

	panels[SettingCfg.Pnl.Basic].btnSel:SelectOnStart(true)

	local tabIdx = SettingCfg.Pnl.Basic
	local panel = panels[tabIdx]

	if panel then
		local scrollRect = panel.go

		panel.scrollRect = XScrollRect:new(scrollRect)
		panel.rowIdx = 1
		panel.rowIndex = 1
		panel.selIndex = 1
		panel.rowPrevious = 1
		panel.showCount = 9
		panel.listCount = 11

		if not UIManager.IsUiAdapted(uiName) then
			local screenWidth = SystemHelper.GetScreenWidth()
			local screenHeight = SystemHelper.GetScreenHeight()
			local screenRatio = screenWidth / screenHeight

			panel.rectTf = scrollRect:GetComponent("RectTransform")

			local rect = panel.rectTf.rect

			if screenRatio > 1.59 and screenRatio < 1.77 then
				panel.showCount = 10
			elseif screenRatio >= 1 and screenRatio <= 1.59 then
				panel.showCount = 11
			end

			panel.rectTf.sizeDelta = Vector2.New(rect.width, 20 + 52 * panel.showCount + 2 * (panel.showCount + 1))
		end
	end

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].Screen
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.GetSelRowIdx(tabIdx, rowIdx)
		this.SelectRow(tabIdx, rowIdx)
		this.SetScreenMode(btnIdx)
	end, XGroup.GroupMode.Button, nil, 3 - LS_Setting.fullscreen)

	option.btn[3 - LS_Setting.fullscreen]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].Resolution
	local resolutionElem = {}
	local resulotionCnt = LS_Setting.resulotionCnt

	for idx = 1, resulotionCnt do
		local rowData = {}

		rowData[SettingCtrl.ElemData.Node] = ""
		rowData[SettingCtrl.ElemData.Show] = true
		resolutionElem[idx] = rowData
	end

	SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem] = resolutionElem

	local option = this.CreateOptionButton(tabIdx, rowIdx, function(obj, data)
		local cIdx, scrW, scrH, edgeReachedL, edgeReachedR = LS_Setting.GetPrevScrResIndex()
		local content = string.format("%d x %d", scrW, scrH)

		delaySaving = true

		this.GetSelRowIdx(tabIdx, rowIdx)
		gameMgr:SetScreenResolution(scrW, scrH, LS_Setting.fullscreen)
		gameMgr:ModifyAppCfg()
		ST_Scene.OnChangeScreen(scrW, scrH)
		SettingCtrl.ResizeGuideList()

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, scrW, scrH, edgeReachedL, edgeReachedR = LS_Setting.GetNextScrResIndex()
		local content = string.format("%d x %d", scrW, scrH)

		delaySaving = true

		this.GetSelRowIdx(tabIdx, rowIdx)
		gameMgr:SetScreenResolution(scrW, scrH, LS_Setting.fullscreen)
		gameMgr:ModifyAppCfg()
		ST_Scene.OnChangeScreen(scrW, scrH)
		SettingCtrl.ResizeGuideList()

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, scrW, scrH, edgeReachedL, edgeReachedR = LS_Setting.GetCurrentResolutionIndex()
		local content = string.format("%d x %d", scrW, scrH)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end)

	option:Select()

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsVSync
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.GetSelRowIdx(tabIdx, rowIdx)
		this.SetVSyncCount(btnIdx)
	end, XGroup.GroupMode.Button, nil, LS_Setting.graphics.vsync == 0 and 1 or 2)

	option.btn[LS_Setting.graphics.vsync == 0 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsFrameRate
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(obj, data, btnIdx, btnName)
		this.GetSelRowIdx(tabIdx, rowIdx)
		this.SetGraphicsFrameRate(btnIdx)
	end, XGroup.GroupMode.Button, nil, LS_Setting.graphics.framerate)

	panels[tabIdx].item[rowIdx] = option

	if LS_Setting.graphics.vsync == 0 then
		option.btn[LS_Setting.graphics.framerate]:SelectOnStart(true)
	else
		SettingCtrl.EnableOptionButtons(tabIdx, rowIdx, false)
	end

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsBrightness
	local option = this.CreateOptionSlider(tabIdx, rowIdx, function(progress, tabIdx, rowIdx)
		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetBrightness(progress)
	end)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsFieldOfView
	local option = this.CreateOptionSlider(tabIdx, rowIdx, function(progress, tabIdx, rowIdx)
		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetFieldOfView(progress)
	end)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsQuality
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.GetSelRowIdx(tabIdx, rowIdx)
		this.SetGraphicsQuality(btnIdx)
	end, XGroup.GroupMode.Button, nil, LS_Setting.graphics.quality - 1)

	option.btn[LS_Setting.graphics.quality - 1]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAntiAliasing
	local option = this.CreateOptionButton(tabIdx, rowIdx, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetPrevGraphicsAntiAliasing()

		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetAntiAliasing(cIdx)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetNextGraphicsAntiAliasing()

		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetAntiAliasing(cIdx)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetCurrentGraphicsAntiAliasing()

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end)

	option:Select()

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsReflection
	local option = this.CreateOptionButton(tabIdx, rowIdx, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetPrevGraphicsReflection()

		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetReflection(cIdx)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetNextGraphicsReflection()

		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetReflection(cIdx)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetCurrGraphicsReflection()

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end)

	option:Select()

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAmbientOcclusion
	local option = this.CreateOptionButton(tabIdx, rowIdx, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetPrevGraphicsAmbientOcculsion()

		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetAmbientOcclusion(cIdx)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetNextGraphicsAmbientOcculsion()

		this.GetSelRowIdx(tabIdx, rowIdx)
		SettingCtrl.SetAmbientOcclusion(cIdx)

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data)
		local cIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetCurrGraphicsAmbientOcculsion()

		return tabIdx, rowIdx, cIdx, content, edgeReachedL, edgeReachedR
	end)

	option:Select()

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsVignette
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.GetSelRowIdx(tabIdx, rowIdx)
		this.SetVignette(btnIdx)
	end, XGroup.GroupMode.Button, nil, LS_Setting.graphics.vignette == 0 and 1 or 2)

	option.btn[LS_Setting.graphics.vignette == 0 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local elements = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem]
	local option = this.CreateOptionButton(tabIdx, rowIdx, function(obj, data, currIdx)
		local currIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetPrevLanguage()

		cached[tabIdx][rowIdx] = currIdx
		delaySaving = true

		UIManager.RefreshLanguage()
		this.RefreshNavBar()

		if not isFromGame then
			UIManager.SendMessage("LobbyMain", "SetLogoLocalized")
		end

		return tabIdx, rowIdx, currIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data, currIdx)
		local currIdx, content, edgeReachedL, edgeReachedR = LS_Setting.GetNextLanguage()

		cached[tabIdx][rowIdx] = currIdx
		delaySaving = true

		UIManager.RefreshLanguage()
		this.RefreshNavBar()

		if not isFromGame then
			UIManager.SendMessage("LobbyMain", "SetLogoLocalized")
		end

		return tabIdx, rowIdx, currIdx, content, edgeReachedL, edgeReachedR
	end, function(obj, data, currIdx)
		UIManager.RefreshLanguage()
		this.RefreshNavBar()

		return tabIdx, rowIdx, LS_Setting.GetCurrLanguage()
	end)

	option:Select()

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Subtitle
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.SetSubtitle(btnIdx)
	end, XGroup.GroupMode.Button)

	option.btn[LS_Setting.subtitle == 1 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].GameMode
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.SetGameMode(btnIdx)
	end, XGroup.GroupMode.Button)

	option.show = false
	option.body = this.mainComponent:GetGameObject("Gameplay3")

	option.body:SetActive(false)

	panels[tabIdx].item[rowIdx] = option
	option.btnLocked = {}
	option.btnLocked[1] = this.mainComponent:GetGameObject("Settings_Basic_GameMode_ButtonCasualLocked")
	option.btnLocked[2] = this.mainComponent:GetGameObject("Settings_Basic_GameMode_ButtonNormalLocked")
	option.btnLocked[3] = this.mainComponent:GetGameObject("Settings_Basic_GameMode_ButtonHardcoreLocked")

	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].TimeAndScore
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.SetShowTimeAndScore(btnIdx)
	end, XGroup.GroupMode.Button)

	option.show = false
	option.body = this.mainComponent:GetGameObject("Gameplay4")

	option.body:SetActive(false)
	option.btn[LS_Setting.showTimeAndScore == 1 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Sounds
	local rowCnt = SettingCfg.Idx[tabIdx].Count

	for rowIdx = 1, rowCnt do
		local option = this.CreateOptionSlider(tabIdx, rowIdx, function(progress, tabIdx, rowIdx)
			SettingCtrl.SetVolumeValue(rowIdx, progress)
		end)

		panels[tabIdx].item[rowIdx] = option
	end

	local tabIdx = SettingCfg.Pnl.Control
	local rowCnt = SettingCfg.Idx[tabIdx].Count
	local tabIdx = SettingCfg.Pnl.Control
	local rowIdx = SettingCfg.Idx[tabIdx].CamSensitivity
	local option = this.CreateOptionSlider(tabIdx, rowIdx, function(progress, tabIdx, rowIdx)
		SettingCtrl.SetCamSensitivity(progress)
	end)

	panels[tabIdx].item[rowIdx] = option

	if AppVer == AppAppleDemo or AppVer == AppAppleShow or AppVer == AppDemoMac2021L then
		option.com.enabled = false

		local goIconLocked = this.mainComponent:GetGameObject("Setting_Basic_CameraSensitivity_SliderLocked")

		if goIconLocked then
			goIconLocked:SetActive(true)
		end

		local text1 = this.mainComponent:GetText("Setting_Panel_x_Panel_BasicSettings_Viewport_Content_Panel_5_Text_sensitivity_low")

		if text1 then
			text1:SetColor(0.6, 0.6, 0.6, 1)
		end

		local text2 = this.mainComponent:GetText("Setting_Panel_x_Panel_BasicSettings_Viewport_Content_Panel_5_Text_sensitivity_high")

		if text2 then
			text2:SetColor(0.6, 0.6, 0.6, 1)
		end
	else
		local goIconLocked = this.mainComponent:GetGameObject("Setting_Basic_CameraSensitivity_SliderLocked")

		if goIconLocked then
			goIconLocked:SetActive(false)
		end
	end

	local tempRow = this.mainComponent:GetGameObject("Control2")

	tempRow:SetActive(LS_Setting.enableCustomInput)

	local tabIdx = SettingCfg.Pnl.Control
	local rowIdx = SettingCfg.Idx[tabIdx].InputConfiguration
	local available = LS_Setting.InputAvailable
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(obj, data, btnIdx, btnName)
		LS_Setting.lastSetInput = btnIdx
		cached[tabIdx][rowIdx] = btnIdx

		this.OpenInputConfiguration(btnIdx)
	end, XGroup.GroupMode.Common)

	panels[tabIdx].item[rowIdx] = option

	option.btn[1]:SetHighlightIndependent(true)
	option.btn[2]:SetHighlightIndependent(true)

	for i = 1, 2 do
		if i == LS_Setting.lastSetInput then
			option.sel[i]:SetActive(true)
		else
			option.sel[i]:SetActive(false)
		end
	end

	local tabIdx = SettingCfg.Pnl.Control
	local rowIdx = SettingCfg.Idx[tabIdx].Vibration
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.OnSetVibration(btnIdx)
	end, XGroup.GroupMode.Button)

	option.btn[LS_Setting.vibration == 0 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Control
	local rowIdx = SettingCfg.Idx[tabIdx].ReverseCameraAxisX
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.OnSetRevCameraX(btnIdx)
	end, XGroup.GroupMode.Button, function(btnIdx, btnCnt, btnName, btn)
		return
	end)

	option.btn[LS_Setting.camera.horizontal > 0 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	local tabIdx = SettingCfg.Pnl.Control
	local rowIdx = SettingCfg.Idx[tabIdx].ReverseCameraAxisY
	local option = this.CreateOptionButtons(tabIdx, rowIdx, function(tabIdx, rowIdx, btnIdx, btnName)
		this.OnSetRevCameraY(btnIdx)
	end, XGroup.GroupMode.Button, function(btnIdx, btnCnt, btnName, btn)
		return
	end)

	option.btn[LS_Setting.camera.vertical > 0 and 1 or 2]:SelectOnStart(true)

	panels[tabIdx].item[rowIdx] = option

	if SdkHelper.CHANNEL == "EPIC" then
		local tabIdx = SettingCfg.Pnl.SaveData
		local rowCnt = SettingCfg.Idx[tabIdx].Count
		local rowIdx = SettingCfg.Idx[tabIdx].Account
		local option = this.CreateOptionButtons(tabIdx, rowIdx, function(obj, data, btnIdx, btnName)
			local tabIdx = SettingCfg.Pnl.SaveData
			local rowIdx = SettingCfg.Idx[tabIdx].Account
			local optData = SettingCfg.Tab[tabIdx][rowIdx]
			local elements = optData[SettingCtrl.ItemData.Elem]

			panels[tabIdx].last = elements[btnIdx][SettingCtrl.ElemData.Node]
			cached[tabIdx][rowIdx] = btnIdx

			local option = panels[tabIdx].item[rowIdx]

			for i = 1, 3 do
				local btn = option.btn[i]

				btn:SetNormal()
			end

			SystemHelper.Log("Btn " .. btnIdx)

			if btnIdx == 1 then
				SettingCtrl.OnButtonSignInWithApple()
			elseif btnIdx == 2 then
				SettingCtrl.OnButtonLoginWithAccount()
			elseif btnIdx == 3 then
				SettingCtrl.OnButtonLogout()
			end
		end, XGroup.GroupMode.Common)

		option.btn[cached[tabIdx][rowIdx]]:SelectOnStart(true)

		panels[tabIdx].item[rowIdx] = option

		local btnText = this.mainComponent:GetText("Settings_Save_Account_Button_SignInWithApple_Text")

		btnText:SetGameTextContent(function()
			return GameText.UI_DO_LOGIN
		end)

		btnText = this.mainComponent:GetText("Settings_Save_Account_Button_SignOut_Text")

		btnText:SetGameTextContent(function()
			return GameText.UI_DO_LOGIN
		end)

		local btn = option.btn[2]

		if btn then
			btn.gameObject:SetActive(false)
		end

		btn = option.btn[3]

		if btn then
			btn.gameObject:SetActive(false)
			btn:SetDisabled(true)
		end

		SettingCtrl.UpdateRowAccount()

		local rowIdx = SettingCfg.Idx[tabIdx].CloudData
		local option = this.CreateOptionButtons(tabIdx, rowIdx, function(obj, data, btnIdx, btnName)
			local tabIdx = SettingCfg.Pnl.SaveData
			local rowIdx = SettingCfg.Idx[tabIdx].CloudData
			local optData = SettingCfg.Tab[tabIdx][rowIdx]
			local elements = optData[SettingCtrl.ItemData.Elem]

			panels[tabIdx].last = elements[btnIdx][SettingCtrl.ElemData.Node]
			cached[tabIdx][rowIdx] = btnIdx

			local option = panels[tabIdx].item[rowIdx]

			option.btn[1]:SetSelectedLight(false)
			option.btn[2]:SetSelectedLight(false)

			if btnIdx == 1 then
				SettingCtrl.OnButtonUpload()
			elseif btnIdx == 2 then
				SettingCtrl.OnButtonDownload()
			end
		end, XGroup.GroupMode.Common)

		option.btn[cached[tabIdx][rowIdx]]:SelectOnStart(true)

		panels[tabIdx].item[rowIdx] = option
		panelNoCould = {}
		panelNoCould.show = true
		panelNoCould.go = this.mainComponent:GetGameObject("SaveDataNoCouldSupport")
		panelNoCould.rectTf = panelNoCould.go:GetComponent("RectTransform")
		panelNoCould.text = this.mainComponent:GetText("SaveDataNoCouldSupportText")

		panelNoCould.go:SetActive(true)

		local accountIcons = {}

		if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP or SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
			for k, v in pairs(LS_Account.LoginType) do
				local idx = tonumber(v)
				local accIcon = {}

				accIcon.idx = idx
				accIcon.go = this.mainComponent:GetGameObject(string.format("SaveDataNoCouldSupportIcon%d", idx))

				if accIcon.go ~= nil then
					accIcon.go:SetActive(false)
				end

				accountIcons[idx] = accIcon
			end
		end

		panelNoCould.accountIcons = accountIcons

		local userId = LS_Account.userId
		local loginType = LS_Account.login

		if userId ~= nil and type(userId) == "string" and string.len(userId) > 1 then
			panelNoCould.text:SetContent(GameText.UI_LOGIN_ACCOUNT .. userId)
		else
			panelNoCould.text:SetContent(GameText.UI_LOGIN_NOT_LOGGED_IN)
		end

		if loginType >= 0 and accountIcons[loginType] ~= nil then
			local accIcon = accountIcons[loginType]

			if accIcon.go ~= nil then
				accIcon.go:SetActive(true)
			end
		end

		panelCouldIntro = {}
		panelCouldIntro.show = true
		panelCouldIntro.go = this.mainComponent:GetGameObject("SaveDataCouldIntro_B")

		panelCouldIntro.go:SetActive(true)

		panelCouldIntro.text = this.mainComponent:GetText("SaveDataCouldIntroText")

		if panelCouldIntro.text then
			panelCouldIntro.text:SetGameTextContent(function()
				return GameText.UI_CLOUD_INTRO_AUTOSAVE
			end)
		end

		btnEditNickname = this.mainComponent:GetButton("Setting_Save_BtnEditNickname_RB")

		if btnEditNickname then
			btnEditNickname:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				SettingCtrl.ShowPanelAccount(true)
				SettingCtrl.ShowPanelRegister(true)
			end, 0)
			btnEditNickname.gameObject:SetActive(string.len(LS_Account.GetNickname()) == 0)
		end

		UILayerCtrl.SetCloseCb(SettingCtrl.NNConfig, function()
			SettingCtrl.ShowPanelRegister(false)
			SettingCtrl.ShowPanelAccount(false)
		end)

		panelAccount = {}
		panelAccount.show = false
		panelAccount.go = this.mainComponent:GetGameObject("Setting_Account")

		panelAccount.go:SetActive(panelAccount.show)

		local messages = {}

		panelAccount.messages = messages
		messages.bar = {}

		local msgBar1 = {}

		msgBar1.show = false
		msgBar1.go = this.mainComponent:GetGameObject("Setting_Account_Msg1")
		msgBar1.text = this.mainComponent:GetText("Setting_Account_Msg1Text")

		msgBar1.go:SetActive(msgBar1.show)

		messages.bar[1] = msgBar1

		local msgBar2 = {}

		msgBar2.show = false
		msgBar2.go = this.mainComponent:GetGameObject("Setting_Account_Msg2")
		msgBar2.text = this.mainComponent:GetText("Setting_Account_Msg2Text")

		msgBar2.go:SetActive(msgBar2.show)

		messages.bar[2] = msgBar2
		panelAccount.panels = {}

		local panelLogin = {}

		panelLogin.show = false
		panelLogin.go = this.mainComponent:GetGameObject("Setting_Account_Login")

		panelLogin.go:SetActive(panelLogin.show)

		local btnBack = this.mainComponent:GetButton("Setting_Account_Login_BtnBack")

		btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SettingCtrl.ShowPanelLogin(false)
			SettingCtrl.ShowPanelAccount(false)
		end)

		panelLogin.btnBack = btnBack

		UILayerCtrl.AddIndividual("AccountLogin", "Setting_Account_Login_BtnBack", btnBack)

		panelLogin.username = this.mainComponent:GetGameObject("Setting_Account_Login_Username_Input"):GetComponent("InputField")
		panelLogin.password = this.mainComponent:GetGameObject("Setting_Account_Login_Password_Input"):GetComponent("InputField")

		local btnLogin = this.mainComponent:GetButton("Setting_Account_Login_Panel_BtnLogin")

		btnLogin:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SettingCtrl.OnButtonLogin(panelLogin.username.text, panelLogin.password.text)
		end)

		panelLogin.btnLogin = btnLogin

		local btnRegister = this.mainComponent:GetButton("Setting_Account_Login_Panel_BtnLink")

		btnRegister:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SettingCtrl.ShowPanelLogin(false)
			SettingCtrl.ShowPanelRegister(true)
		end)

		panelLogin.btnRegister = btnRegister

		local panelRegister = {}

		panelRegister.show = false
		panelRegister.go = this.mainComponent:GetGameObject("Setting_Account_Register")

		panelRegister.go:SetActive(panelRegister.show)

		local btnBack = this.mainComponent:GetButton("Setting_Account_Register_BtnBack")

		btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			return
		end)

		panelRegister.btnBack = btnBack

		UILayerCtrl.AddIndividual("AccountLogin", "Setting_Account_Register_BtnBack", btnBack)

		panelRegister.username = this.mainComponent:GetGameObject("Setting_Account_Register_Username_Input"):GetComponent("InputField")
		panelRegister.password = this.mainComponent:GetGameObject("Setting_Account_Register_Password_Input"):GetComponent("InputField")
		panelRegister.verified = this.mainComponent:GetGameObject("Setting_Account_Register_PwVerified_Input"):GetComponent("InputField")

		local btnRegister = this.mainComponent:GetButton("Setting_Account_Register_Panel_BtnRegister")

		btnRegister:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if panelRegister.username.text == nil or panelRegister.username.text == "" then
				return
			end

			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CHALLENGE_CHANGE_NAME .. panelRegister.username.text, function()
				SettingCtrl.OnButtonEditNickname(panelRegister.username.text)
			end, function()
				return
			end, false)
		end)

		panelRegister.btnRegister = btnRegister

		local textReg = this.mainComponent:GetText("Settings_Save_Account_Button_SignInWithAccount_Text")

		panelRegister.textReg = textReg

		local btnBack = this.mainComponent:GetButton("Setting_Account_Register_Panel_BtnBack")

		btnBack:SetAudioType(AudioCtrl.ButtonClickType.Back)
		btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SettingCtrl.ShowPanelRegister(false)
			SettingCtrl.ShowPanelAccount(false)
		end)

		panelRegister.btnBack = btnBack
		panelAccount.panels[SettingCtrl.PanelAccount.Login] = panelLogin
		panelAccount.panels[SettingCtrl.PanelAccount.Register] = panelRegister
	else
		local panelMainNavBar = this.mainComponent:GetGameObject("Setting_Main_NavBar_LB")

		if panelMainNavBar ~= nil then
			local rectTf = panelMainNavBar:GetComponent("RectTransform")

			rectTf.localScale = Vector3.New(1, 1, 1)
		end
	end

	panelInputCfg = {}

	for k, v in pairs(LS_Setting.InputMode) do
		panelInputCfg[v] = {}
	end

	local panel = {}
	local mode = LS_Setting.InputMode.KM
	local modeName = SettingCfg.Sub[mode][1]

	panel.show = false
	panel.goPnl = this.mainComponent:GetGameObject(SettingCtrl.PanelInputCfg[mode])

	local btn = this.mainComponent:GetButton("Setting_KMC_BtnBack_L")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.CloseKmConfig()
	end, 0)

	panel.btnQuit = btn

	UILayerCtrl.SetCloseCb("InputConfig1", SettingCtrl.CloseKmConfig)

	panel.goPnlMod = this.mainComponent:GetGameObject("Setting_KMC_PnlMod")
	panel.showPnlMod = false

	panel.goPnlMod:SetActive(panel.showPnlMod)

	panel.keyName = ""
	panel.prevBtn = ""
	panel.timeCD = 0
	panel.TextLine1 = this.mainComponent:GetText("Setting_KMC_PnlMod_TextLine1")
	panel.TextLine2 = this.mainComponent:GetText("Setting_KMC_PnlMod_TextLine2")
	panel.TextContent1 = panel.TextLine1:GetContent()
	panel.TextContent2 = panel.TextLine1:GetContent()
	panel.btnClosePnlMod = this.mainComponent:GetButton("Setting_KMC_PnlMod")

	panel.btnClosePnlMod:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.CloseKmModConfig()
	end, 0)
	UILayerCtrl.AddIndividual(SettingCtrl.KMConfig, "Setting_KMC_PnlMod", panel.btnClosePnlMod)

	panel.showHintKeyBinding = false
	panel.hintPanelKeyBinding = this.mainComponent:GetGameObject("Setting_KMC_Tip1")
	panel.cgHintPanelKeyBinding = panel.hintPanelKeyBinding:GetComponent("CanvasGroup")
	panel.hintTextKeyBinding = this.mainComponent:GetText("Setting_KMC_Tip1_Text")
	panel.hintTextKeyBindingContent = panel.hintTextKeyBinding:GetContent()
	panel.showHintKeyReplacing = false
	panel.hintPanelKeyReplacing = this.mainComponent:GetGameObject("Setting_KMC_Tip2")
	panel.cgHintPanelKeyReplacing = panel.hintPanelKeyReplacing:GetComponent("CanvasGroup")
	panel.hintTextKeyReplacing = this.mainComponent:GetText("Setting_KMC_Tip2_Text")
	panel.hintTextKeyReplacingContent = panel.hintTextKeyReplacing:GetContent()
	panel.btnPressed = false
	panel.btnHeld = false
	panel.keyPressed = false
	panel.keyHeld = false

	local scrollRect = this.mainComponent:GetGameObject("Setting_KMC_Config")

	panel.scrollRect = XScrollRect:new(scrollRect)
	panel.rowIndex = 1
	panel.selIndex = 1
	panel.rowPrevious = 1
	panel.showCount = 9
	panel.listCount = table.nums(InputCfg.KeyList)

	if not UIManager.IsUiAdapted(uiName) then
		local screenWidth = SystemHelper.GetScreenWidth()
		local screenHeight = SystemHelper.GetScreenHeight()
		local screenRatio = screenWidth / screenHeight

		panel.rectTf = scrollRect:GetComponent("RectTransform")

		local rect = panel.rectTf.rect

		if screenRatio > 1.59 and screenRatio < 1.77 then
			panel.showCount = 10
		elseif screenRatio > 1.34 and screenRatio <= 1.59 then
			panel.showCount = 11
		elseif screenRatio >= 1 and screenRatio <= 1.34 then
			panel.showCount = 13
		end

		panel.rectTf.sizeDelta = Vector2.New(rect.width, 51 * panel.showCount + 9 * (panel.showCount + 1))
	end

	local btnCnt = table.nums(InputCfg.KeyList)

	panel.btnCnt = btnCnt
	panel.sel = {}
	panel.icon = {}
	panel.btnName = {}
	panel.items = {}
	panelInputCfg[mode].panel = panel
	loaderKmCfg = this.mainComponent:GetLoader("Setting_KMC_Loader")
	loaderKmCfg.loadCount = btnCnt
	loaderKmCfg.stepCount = 1
	loaderKmCfg.loadStepping = 0
	loaderKmCfg.loadFinished = false

	function loaderKmCfg.loadCallback(index, com, data)
		local rowData = InputCfg.KeyList[index]
		local item = {}

		item.idx = index
		item.go = com
		item.name = "KMCB" .. index

		local mode = LS_Setting.InputMode.KM
		local rootPanel = panelInputCfg[mode].panel
		local layerName = SettingCfg.Sub[mode][1]
		local selCg = com:GetGameObject("Setting_RowSel"):GetComponent("CanvasGroup")

		selCg.alpha = 0
		panel.sel[index] = selCg

		local btnRow = com:GetButton("Setting_RowBtn")

		btnRow:SetParentScroll(rootPanel.scrollRect)

		item.btnRow = btnRow

		UILayerCtrl.AddButton(layerName, "KMCRow" .. index, btnRow)

		local keyCode = XKeyCode.Backspace
		local comTitle = com:GetText("Setting_RowText")

		if comTitle then
			comTitle:SetGameTextContent(function()
				return GameText[rowData[InputCfg.KeyIdx.Title]]
			end)
		end

		local prevRowIdx = -1
		local nextRowIdx = -1
		local rowType = rowData[InputCfg.KeyIdx.Type]

		if rowType == InputCfg.RowType.Blank then
			-- block empty
		elseif rowType == InputCfg.RowType.KeyMod then
			local btnKey = rowData[InputCfg.KeyIdx.Value]

			if LS_Setting.kmCfg[btnKey] == nil and btnKey == "PLAYERINFO" then
				LS_Setting.inputConfig.PLAYERINFO = {
					XKeyCode.Tab
				}
				LS_Setting.kmCfg.PLAYERINFO = {
					XKeyCode.Tab
				}
				KMKey.PLAYERINFO = XKeyCode.Tab
			end

			local keyCode = LS_Setting.kmCfg[btnKey][1]
			local keySymbol = ""

			if keyCode ~= nil and keyCode > 0 then
				keySymbol = XKeySymbol[keyCode]
			end

			local btnTxt = com:GetText("Setting_RowBtnText")

			if btnTxt ~= nil then
				local symbol = XKeySymbol[keyCode]

				if symbol ~= nil and string.len(symbol) > 0 then
					local items = StringHelper.Split(symbol, "_")

					if table.nums(items) == 1 then
						btnTxt:SetGameTextContent(function()
							return symbol
						end)
					else
						btnTxt:SetGameTextContent(function()
							return GameText["UI_CONTROLLER_" .. string.upper(symbol)]
						end)
					end
				else
					btnTxt:SetGameTextContent(function()
						return GameText.UI_COMMON_EMPTY
					end)
				end

				panel.btnName[index] = btnTxt
				panel.icon[btnKey] = btnTxt
			end

			local btnSet = com:GetButton("Setting_RowBtnSet")

			if btnSet then
				btnSet:SetParentScroll(rootPanel.scrollRect)

				item.btnSet = btnSet

				btnSet:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					local btnIdx = panel.rowIndex

					this.SelectRowInInputCfg(LS_Setting.InputMode.KM, index)

					local toprow = 1 + math.floor((1 - panel.scrollRect.scrollRectCom.normalizedPosition.y) / (1 / (loaderKmCfg.loadCount - panel.showCount)) + 0.5)
					local botrow = toprow + panel.showCount - 1

					panel.rowIndex = item.idx
					panel.selIndex = item.idx - toprow + 1

					SettingCtrl.OpenKmModConfig(LS_Setting.KMItems[btnIdx - loaderKmCfg.stepCount], panel.btnName[item.idx]:GetContent())
				end, 0)
				UILayerCtrl.AddButton(layerName, item.name, btnSet)
			end

			if btnRow then
				btnRow:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					local btnIdx = panel.rowIndex

					this.SelectRowInInputCfg(LS_Setting.InputMode.KM, index)

					local toprow = 1 + math.floor((1 - panel.scrollRect.scrollRectCom.normalizedPosition.y) / (1 / (loaderKmCfg.loadCount - panel.showCount)) + 0.5)
					local botrow = toprow + panel.showCount - 1

					panel.rowIndex = item.idx
					panel.selIndex = item.idx - toprow + 1

					SettingCtrl.OpenKmModConfig(LS_Setting.KMItems[btnIdx - loaderKmCfg.stepCount], panel.btnName[btnIdx]:GetContent())
				end, 0)
			end
		elseif rowType == InputCfg.RowType.Option then
			-- block empty
		elseif rowType == InputCfg.RowType.Slider then
			-- block empty
		elseif rowType == InputCfg.RowType.KeySys then
			local btnTxt = com:GetText("Setting_RowBtnText")

			if btnTxt then
				local btnKey = rowData[InputCfg.KeyIdx.Value]

				btnTxt:SetContent(btnKey)

				panel.btnName[index] = btnTxt
			end
		end

		panel.items[index] = item
		loaderKmCfg.loadStepping = loaderKmCfg.loadStepping + 1
		loaderKmCfg.loadFinished = loaderKmCfg.loadStepping == loaderKmCfg.loadCount
	end

	loaderKmCfg:PreloadTemplate(function()
		local rowData = InputCfg.KeyList
		local btnCfg = {}

		for i = 1, loaderKmCfg.loadCount do
			local data = rowData[i]

			btnCfg[i] = {
				prefabIndex = data[1]
			}
		end

		loaderKmCfg:LoadIndividuals(btnCfg)
	end)

	local panel = {}
	local mode = LS_Setting.InputMode.TP

	panel.show = false
	panel.goPnl = this.mainComponent:GetGameObject(SettingCtrl.PanelInputCfg[mode])

	local btns = {}

	for k, v in pairs(SettingCtrl.BtnTPC) do
		btns[k] = SettingCtrl.CreateButton(k, v)
	end

	panel.buttons = btns
	panel.current = nil
	panel.previous = nil
	panel.slot = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

	SettingCtrl.GenerateDefaultTouchPadConfig()

	local btn = this.mainComponent:GetButton("Setting_TPCfg_BtnDeselect")

	btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		local mode = LS_Setting.InputMode.TP
		local panel = panelInputCfg[mode].panel

		if panel.current then
			local button = panel.buttons[panel.current]

			button.sel:SetActive(false)

			panel.current = nil
			panel.previous = nil
		end
	end, 0)

	panel.btnDeselect = btn
	panel.btnLayout = {}
	panel.btnLayoutHighlighted = {}

	local btnCnt = #SettingCtrl.BtnTPCTopBar

	for slot = 1, btnCnt do
		panel.btnLayoutHighlighted[slot] = this.mainComponent:GetGameObject("Setting_TPCfgPT_BtnLgt" .. slot)

		local btnName = SettingCtrl.BtnTPCTopBar[slot]
		local btn = this.mainComponent:GetButton(btnName)

		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for i = 1, 3 do
				panel.btnLayout[i]:SetNormal()
				panel.btnLayoutHighlighted[i]:SetActive(false)
			end

			panel.btnLayoutHighlighted[slot]:SetActive(true)
			this.ResetButtons()

			local mode = LS_Setting.InputMode.TP
			local panel = panelInputCfg[mode].panel
			local index = LS_Setting.InputProfileIndex.Current

			this.ResetInputPanelTouchPad(slot)

			LS_Setting.inputSelect[mode][index] = slot

			this.LoadTouchPadLayout(mode, slot)
		end, 0)

		if slot > 1 then
			btn:SetAdjacent(XButton.Adjacent.LEFT, SettingCtrl.BtnTPCTopBar[(slot - 2 + btnCnt) % btnCnt + 1])
		end

		if slot < 3 then
			btn:SetAdjacent(XButton.Adjacent.RIGHT, SettingCtrl.BtnTPCTopBar[slot % btnCnt + 1])
		end

		UILayerCtrl.AddButton(SettingCfg.Sub[LS_Setting.InputMode.TP][1], btnName, btn)

		panel.btnLayout[slot] = btn
	end

	local btn = this.mainComponent:GetButton("Setting_TPCfgPT_BtnReset")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local mode = LS_Setting.InputMode.TP
		local defSlot = LS_Setting.InputProfileDefault[mode]
		local index = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

		LS_Setting.inputConfig[mode][index] = SystemHelper.DeepCopy(LS_Setting.inputConfig[mode][defSlot])

		this.ResetInputPanelTouchPad(index)
		this.LoadTouchPadLayout(mode, index)
	end, 0)

	local btn = this.mainComponent:GetButton("Setting_TPCfgPT_BtnSave")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local mode = LS_Setting.InputMode.TP
		local slot = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

		this.SaveTouchPadLayout(mode, slot)
		LS_Setting.Update()
	end, 0)
	btn.gameObject:SetActive(false)

	local btn = this.mainComponent:GetButton("Setting_TPCfgPT_BtnQuit")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.CloseTpConfig()
	end, 0)
	UILayerCtrl.SetCloseCb("InputConfig2", SettingCtrl.CloseTpConfig)

	panel.txtBtnIntro = this.mainComponent:GetText("Setting_TPCfgPB_TxtBtnIntro")

	panel.txtBtnIntro:SetContent(GameText.UI_COMMON_EMPTY)

	panel.txtBtnScale = this.mainComponent:GetText("Setting_TPCfgPB_TxtBtnScale")

	local slider = this.mainComponent:GetGameObject("Setting_TPCfgPB_SliderBtnScale"):GetComponent("Slider")

	slider.onValueChanged:RemoveAllListeners()
	slider.onValueChanged:AddListener(function(progress)
		local mode = LS_Setting.InputMode.TP
		local panel = panelInputCfg[mode].panel
		local key = panel.current

		if key then
			panel.txtBtnScale:SetContent(progress .. "%")

			local button = panel.buttons[key]
			local rectTf = button.btn.gameObject:GetComponent("RectTransform")
			local localScale = progress / 100

			rectTf.localScale = Vector3.New(localScale, localScale, 1)

			local pos = button.btn.gameObject.transform.localPosition
			local slot = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]
			local newSetting = {
				x = pos.x,
				y = pos.y,
				s = progress
			}

			touchBtnCfg[key] = newSetting

			LS_Setting.SetInputConfig(mode, slot, key, pos.x, pos.y, progress)
		end
	end)

	panel.sldrBtnScale = slider
	configTimeCount = 0
	delayInteractiveTimeCount = 0
	panelInputCfg[mode].panel = panel

	local panel = {}
	local mode = LS_Setting.InputMode.GP
	local modeName = SettingCfg.Sub[mode][1]

	panel.show = false
	panel.goPnl = this.mainComponent:GetGameObject(SettingCtrl.PanelInputCfg[mode])
	panel.goPnlMod = this.mainComponent:GetGameObject("Setting_GPC_PnlMod")
	panel.showPnlMod = false

	panel.goPnlMod:SetActive(panel.showPnlMod)

	panel.keyName = ""
	panel.prevBtn = ""
	panel.timeCD = 0
	panel.TextLine1 = this.mainComponent:GetText("Setting_GPC_PnlMod_TextLine1")
	panel.TextLine2 = this.mainComponent:GetText("Setting_GPC_PnlMod_TextLine2")
	panel.TextContent1 = panel.TextLine1:GetContent()
	panel.TextContent2 = panel.TextLine1:GetContent()
	panel.btnClosePnlMod = this.mainComponent:GetButton("Setting_GPC_PnlMod")

	panel.btnClosePnlMod:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.CloseGpModConfig()
	end, 0)
	UILayerCtrl.AddIndividual(SettingCtrl.GPConfig, "Setting_GPC_PnlMod", panel.btnClosePnlMod)
	UILayerCtrl.SetCloseCb(SettingCtrl.GPConfig, SettingCtrl.CloseGpModConfig)

	panel.showHintKeyBinding = false
	panel.hintPanelKeyBinding = this.mainComponent:GetGameObject("Setting_GPC_Tip1")
	panel.cgHintPanelKeyBinding = panel.hintPanelKeyBinding:GetComponent("CanvasGroup")
	panel.hintTextKeyBinding = this.mainComponent:GetText("Setting_GPC_Tip1_Text")
	panel.hintTextKeyBindingContent = panel.hintTextKeyBinding:GetContent()
	panel.showHintKeyReplacing = false
	panel.hintPanelKeyReplacing = this.mainComponent:GetGameObject("Setting_GPC_Tip2")
	panel.cgHintPanelKeyReplacing = panel.hintPanelKeyReplacing:GetComponent("CanvasGroup")
	panel.hintTextKeyReplacing = this.mainComponent:GetText("Setting_GPC_Tip2_Text")
	panel.hintTextKeyReplacingContent = panel.hintTextKeyReplacing:GetContent()

	local scrollRect = this.mainComponent:GetGameObject("Setting_GPC_Config")

	panel.scrollRect = XScrollRect:new(scrollRect)
	panel.rowIndex = 1
	panel.selIndex = 1
	panel.rowPrevious = 1
	panel.showCount = 9
	panel.listCount = 10

	if not UIManager.IsUiAdapted(uiName) then
		panel.rectTf = scrollRect:GetComponent("RectTransform")

		local rect = panel.rectTf.rect

		if SystemHelper.iPhoneX() then
			panel.showCount = 8
		elseif SystemHelper.isSubquadrateScrAS() then
			panel.showCount = 10
		end

		panel.rectTf.sizeDelta = Vector2.New(rect.width, 51 * panel.showCount + 9 * (panel.showCount + 1))
	end

	local btnCnt = table.nums(LS_Setting.GPItems)

	panel.btnCnt = btnCnt
	panel.sel = {}
	panel.icon = {}
	panel.btnName = {}

	for btnIdx = 1, btnCnt do
		local actIdx = btnIdx + 1
		local btnIcon = XImage:new(this.mainComponent:GetGameObject("GPCIcon" .. actIdx))

		panel.icon[btnIdx] = btnIcon

		local txtFuncName = this.mainComponent:GetText("GPC" .. actIdx .. "Text")
		local btnName = txtFuncName:GetContent()

		panel.btnName[btnIdx] = txtFuncName

		if txtFuncName then
			txtFuncName:SetGameTextContent(function()
				return GameText["UI_INPUT_GAME_" .. LS_Setting.GPItems[btnIdx]]
			end)
		end

		local btnKey = LS_Setting.GPItems[btnIdx]
		local btnVal = GPKey[btnKey]
		local iconName = LS_Setting.GetBtnIconName(btnVal)
		local sprite = XObjectPool.GetIcon(iconName)

		if sprite then
			btnIcon:SetSprite(sprite)
		end

		local selectedCg = this.mainComponent:GetGameObject("GPCs" .. actIdx):GetComponent("CanvasGroup")

		selectedCg.alpha = 0
		panel.sel[btnIdx] = selectedCg

		local btnName = "GPCBS" .. actIdx
		local btnModify = this.mainComponent:GetButton(btnName)

		btnModify.btnIdx = btnIdx

		btnModify:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local btnIdx = btnModify.btnIdx

			this.SelectRowInInputCfg(LS_Setting.InputMode.GP, btnIdx)
			SettingCtrl.OpenGpModConfig(LS_Setting.GPItems[btnIdx], panel.btnName[btnIdx]:GetContent())
		end, 0)
		btnModify:SetParentScroll(panel.scrollRect)

		if btnIdx > 1 then
			btnModify:SetAdjacent(XButton.Adjacent.UP, "GPCBS" .. (btnIdx - 2 + btnCnt) % btnCnt + 1)
		end

		if btnIdx < btnCnt then
			btnModify:SetAdjacent(XButton.Adjacent.DOWN, "GPCBS" .. btnIdx % btnCnt + 1)
		end

		UILayerCtrl.AddButton(modeName, btnName, btnModify)

		local btnRow = this.mainComponent:GetButton("GPCB" .. actIdx)

		btnRow.btnIdx = btnIdx

		btnRow:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local btnIdx = btnRow.btnIdx

			this.SelectRowInInputCfg(LS_Setting.InputMode.GP, btnIdx)
			SettingCtrl.OpenGpModConfig(LS_Setting.GPItems[btnIdx], panel.btnName[btnIdx]:GetContent())
		end, 0)
		btnRow:SetParentScroll(panel.scrollRect)
	end

	panel.slot = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]
	panel.showDiagram = false

	local gpDItems = LS_Setting.GPDItems
	local btnNodes = {}

	for k, _ in pairs(gpDItems) do
		local btnNode = this.mainComponent:GetGameObject("Settings_GPD_Node_" .. k)

		if btnNode then
			btnNodes[k] = btnNode
		end
	end

	panel.btnNodes = btnNodes

	local btnItems = {}

	for k, v in pairs(gpDItems) do
		btnItems[k] = ""
	end

	for k, v in pairs(GPKey) do
		btnItems[v] = k
	end

	btnItems.C2D = gpDItems.C2D
	panel.btnItems = btnItems

	for k, v in pairs(btnItems) do
		if btnNodes[k] and v == "" then
			btnNodes[k]:SetActive(false)
		end
	end

	local btnTexts = {}

	for k, v in pairs(gpDItems) do
		local text = this.mainComponent:GetText("Settings_GPD_Text_" .. k)

		if text then
			if string.len(v) > 0 then
				text:SetGameTextContent(function()
					return GameText["UI_INPUT_GAME_" .. v]
				end)
			else
				text:SetGameTextContent(function()
					return GameText.UI_COMMON_EMPTY
				end)
			end

			btnTexts[k] = text
		end
	end

	panel.btnTexts = btnTexts

	local customPanel = this.mainComponent:GetGameObject("Setting_GPC_Diagram_" .. "ios")

	if customPanel == nil then
		customPanel = this.mainComponent:GetGameObject("Setting_GPC_Diagram_pc")
	end

	if customPanel and (Platform == PlatformType.IOS or Platform ~= PlatformType.TVOS or true) then
		customPanel:SetActive(true)
	end

	local diagram = this.mainComponent:GetButton("Setting_GPC_PnlDiagram")

	diagram:SetAudioType(AudioCtrl.ButtonClickType.Back)
	diagram:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.CloseGamePadDiagram()
	end)
	UILayerCtrl.AddButton(SettingCtrl.InputDiagram, "Setting_GPC_PnlDiagram", diagram)

	panel.diagram = diagram

	local btn = this.mainComponent:GetButton("Setting_GPC_BtnDiag")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.OpenGamePadDiagram()
	end, 0)

	panel.btnGPDgm = btn

	local btn = this.mainComponent:GetButton("Setting_GPC_BtnBack_L")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SettingCtrl.CloseGpConfig()
	end, 0)

	panel.btnQuit = btn

	UILayerCtrl.SetCloseCb("InputConfig3", SettingCtrl.CloseGpConfig)

	panel.btnPressedL1 = false
	panel.btnPressedR1 = false
	panel.btnPressedBX = false
	panel.btnHoldL1 = false
	panel.btnHoldR1 = false
	panel.btnHoldBX = false
	panelInputCfg[mode].panel = panel

	local pnlCnt = #SettingCfg.Sub

	for pnlIdx = 1, pnlCnt do
		local pnl = panelInputCfg[pnlIdx].panel

		pnl.show = false

		pnl.goPnl:SetActive(false)
	end

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].Screen

	panels[tabIdx].last = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem][3 - LS_Setting.fullscreen][SettingCtrl.ElemData.Node]

	this.SelectTab(tabIdx, rowIdx)

	if DebugShowCtrlPanel == true then
		panelReserved = {}
		panelReserved.show = true
		panelReserved.go = this.mainComponent:GetGameObject("Setting_Main_Reserved")

		panelReserved.go:SetActive(panelReserved.show)

		panelReserved.code = this.mainComponent:GetText("Setting_Main_Reserved_Code")
		panelReserved.sta = {
			0,
			0,
			0,
			0
		}
		panelReserved.btns = {}

		for idx = 1, 4 do
			local btn = this.mainComponent:GetButton("Setting_Main_Reserved_Btn" .. idx)

			btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
				SystemHelper.Log(string.format("[ Btn %d is pressed. ]", idx))

				panelReserved.sta[idx] = 1

				local count = 0

				for i = 1, 4 do
					count = count + panelReserved.sta[i]
				end

				if count > 0 then
					panelReserved.code:SetContent(count)
				else
					panelReserved.code:SetContent("")
				end

				if count == 4 then
					for i = 1, 4 do
						panelReserved.sta[i] = 0
					end

					if isFromGame then
						MainmenuCtrl.ShowDebugPanel()
					end
				end
			end)
			btn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
				SystemHelper.Log(string.format("[ Btn %d is up. ]", idx))

				panelReserved.sta[idx] = 0

				local count = 0

				for i = 1, 4 do
					count = count + panelReserved.sta[i]
				end

				if count > 0 then
					panelReserved.code:SetContent(count)
				else
					panelReserved.code:SetContent("")
				end
			end)

			panelReserved.btns[idx] = btn
		end
	end

	this.RefreshNavBar()
	UnityEngine.Canvas.ForceUpdateCanvases()
	UILayerCtrl.ForceUpdate(0.7)
end

function SettingCtrl.IsUiLoaded()
	this.loadFinish = loaderGuide and loaderGuide.loadFinished and loaderKmCfg and loaderKmCfg.loadFinished
end

function SettingCtrl.ClosePanel()
	if not this.loadFinish or panelInputCfg == nil then
		return
	end

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].Screen

	panels[tabIdx].last = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem][3 - LS_Setting.fullscreen][SettingCtrl.ElemData.Node]

	if delaySaving then
		delaySaving = false

		LS_Setting.Update()
	end

	SettingCtrl.ResetTabs()
	UIManager.Close("Setting")

	if not isFromGame then
		UIManager.SendMessage("LobbyMain", "CloseDialog")
	else
		if sceneController then
			sceneController:ExitMenu()
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)

			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == false then
				MainmenuCtrl.ShowMainUI(true)
				MainmenuCtrl.ShowHostUI(true)
			end

			MainmenuCtrl.ShowBaseUI(true)
			MainmenuCtrl.SetInteractive(true)
		end

		UIManager.SendMessage("Mainmenu", "ReturnUiHandling")
		UIManager.SendMessage("Mainmenu", "ApplyInputLayoutForTouchScreen")
		UIManager.SendMessage("Captured", "Show", false)
	end

	UILayerCtrl.Pop()
	XObjectPool.ClearImage()
	UIManager.SendMessage("Mainmenu", "SetPointerLocked", isFromGame)
	inputMgr:SetPointerLocked(isFromGame)

	if isFromGame then
		inputMgr:SetInGameMode()

		LS_Setting.ignoreLMB = false

		UIManager.SendMessage("Mainmenu", "ShowTouchUI", not LS_Setting.isJoystickConnected and not LS_Setting.isKeyboardConnected and not LS_Setting.isMouseConnected)
	end

	if isFromGame then
		UILayerCtrl.ForceUpdate(1.3)
	else
		UILayerCtrl.ForceUpdate(0.7)
	end
end

function SettingCtrl.RequestExit()
	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_SETTING_BACK_TO_MAINMENU, function()
		UIManager.SendMessage("Captured", "Show", false)

		local tabIdx = SettingCfg.Pnl.Basic
		local rowIdx = SettingCfg.Idx[tabIdx].GraphicsQuality

		this.SelectTab(tabIdx, rowIdx)
		XObjectPool.ClearImage()

		local sceneController = ST_Main.GetSceneController()

		if sceneController ~= nil then
			sceneController:ExitMenu()
			inputMgr:SetPointerLocked(false)
			inputMgr:SetInMenuMode()
			sceneController:BackToTitle()
		end
	end)
end

function SettingCtrl.OpenFromGame(flag)
	isFromGame = flag

	this.ShowTabAccount(not flag)

	if btnQuitToLobby then
		btnQuitToLobby.gameObject:SetActive(flag)
	end

	this.ShowGameModeSelection(flag and not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade))

	if flag and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		this.ShowTimeAndScoreSelection(true)
	else
		this.ShowTimeAndScoreSelection(false)
	end

	local layers = SettingCfg.Layers
	local count = table.nums(layers)

	if isFromGame and Platform == PlatformType.ANDROID then
		for idx = 1, count do
			UILayerCtrl.SetPopCB(layers[idx], SettingCtrl.RequestExit)
		end
	end

	inputMgr:SetPointerLocked(false)
	inputMgr:SetInMenuMode()
end

function SettingCtrl.ExitBtn(flag)
	isExitBtn = flag
end

function SettingCtrl.UnselectOptionButtons(tabIdx, rowIdx, enabled)
	local option = panels[tabIdx].item[rowIdx]
	local idxItemElem = SettingCtrl.ItemData.Elem
	local elements = SettingCfg.Tab[tabIdx][rowIdx][idxItemElem]
	local btnCnt = table.nums(elements)

	for btnIdx = 1, btnCnt do
		option.sel[btnIdx]:SetActive(enabled)
	end
end

function SettingCtrl.CreateOptionButtons(tabIdx, rowIdx, cbFn, groupType, restriction, initIdx)
	local pnlName = SettingCfg.UiName[tabIdx]
	local option = {}
	local btnName, prevBtnName, nextBtnName = SettingCtrl.GetSibingBtnNameR(tabIdx, rowIdx)
	local btnRow = this.mainComponent:GetButton(btnName)

	btnRow:SetAudioType(AudioCtrl.ButtonClickType.None)
	btnRow:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	btnRow:SetAdjacent(XButton.Adjacent.UP, prevBtnName)
	btnRow:SetAdjacent(XButton.Adjacent.DOWN, nextBtnName)
	UILayerCtrl.AddButton(pnlName, btnName, btnRow)

	option.row = btnRow

	local group = XGroup:new()

	group:SetMode(groupType)

	local idxItemElem = SettingCtrl.ItemData.Elem
	local idxElemNode = SettingCtrl.ElemData.Node

	option.btn = {}
	option.sel = {}
	option.show = {}

	local elements = SettingCfg.Tab[tabIdx][rowIdx][idxItemElem]
	local btnCnt = table.nums(elements)

	for btnIdx = 1, btnCnt do
		option.show[btnIdx] = elements[btnIdx][LS_Setting.ItemData.Show]
	end

	for btnIdx = 1, btnCnt do
		local btnName = elements[btnIdx][idxElemNode]
		local show = option.show[btnIdx]
		local sel = this.mainComponent:GetGameObject(btnName .. "Sel")

		if initIdx then
			sel:SetActive(initIdx == btnIdx)
		end

		option.sel[btnIdx] = sel

		local btn = this.mainComponent:GetButton(btnName)

		group:Add(btn)
		btn:SetAudioType(AudioCtrl.ButtonClickType.Option)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			cached[tabIdx][rowIdx] = btnIdx
			panels[tabIdx].last = btnName

			this.SelectRow(tabIdx, rowIdx)

			if option.sel then
				for idxSel = 1, btnCnt do
					if option.sel[idxSel] then
						if LS_Setting.graphics.vsync > 0 and tabIdx == SettingCfg.Pnl.Basic and rowIdx == SettingCfg.Idx[SettingCfg.Pnl.Basic].GraphicsFrameRate then
							option.sel[idxSel]:SetActive(false)
						else
							option.sel[idxSel]:SetActive(idxSel == btnIdx)
						end
					end
				end
			end

			SystemHelper.Log("[ Tab " .. tabIdx .. " - " .. "Row " .. rowIdx .. " - Btn " .. btnIdx .. ": " .. btnName .. " ]")
			cbFn(tabIdx, rowIdx, btnIdx, btnName)
		end)

		if btnIdx > 1 then
			local nextIdx = -1

			for idx = btnIdx - 1, 1, -1 do
				if option.show[idx] then
					nextIdx = idx

					break
				end
			end

			if nextIdx > 0 then
				btn:SetAdjacent(XButton.Adjacent.LEFT, elements[nextIdx][idxElemNode])
			end
		end

		if btnIdx < btnCnt then
			local nextIdx = -1

			for idx = btnIdx + 1, btnCnt do
				if option.show[idx] then
					nextIdx = idx

					break
				end
			end

			if nextIdx > 0 then
				btn:SetAdjacent(XButton.Adjacent.RIGHT, elements[nextIdx][idxElemNode])
			end
		end

		option.btn[btnIdx] = btn

		btn.gameObject:SetActive(show)

		if restriction then
			restriction(btnIdx, btnCnt, btnName, btn)
		end

		UILayerCtrl.AddButton(pnlName, btnName, btn)
	end

	return option
end

function SettingCtrl.EnableOptionButtons(tabIdx, rowIdx, enabled)
	local option = panels[tabIdx].item[rowIdx]
	local buttons = option.btn
	local cursors = option.sel
	local btnIdx = cached[tabIdx][rowIdx]

	if enabled then
		for k, btn in pairs(buttons) do
			btn:SetNormal(true)
		end
	else
		for k, btn in pairs(buttons) do
			btn:SetDisabled(true)
		end
	end

	if btnIdx ~= nil then
		cursors[btnIdx]:SetActive(enabled)
	end
end

function SettingCtrl.CreateOptionButton(tabIdx, rowIdx, cbFnL, cbFnR, cbSel)
	local pnlName = SettingCfg.UiName[tabIdx]
	local option = {}
	local btnName, prevBtnName, nextBtnName = SettingCtrl.GetSibingBtnNameR(tabIdx, rowIdx)
	local btnRow = this.mainComponent:GetButton(btnName)

	btnRow:SetAudioType(AudioCtrl.ButtonClickType.None)
	btnRow:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	btnRow:SetAdjacent(XButton.Adjacent.UP, prevBtnName)
	btnRow:SetAdjacent(XButton.Adjacent.DOWN, nextBtnName)
	UILayerCtrl.AddButton(pnlName, btnName, btnRow)

	option.row = btnRow

	local idxItemElem = SettingCtrl.ItemData.Elem

	option.btn = {}

	local idxOneOp = SettingCtrl.ItemData.OneOp
	local comNames = SettingCfg.Tab[tabIdx][rowIdx][idxOneOp]
	local text = this.mainComponent:GetText(comNames[3])

	option.text = text

	local nameL = comNames[1]
	local nameR = comNames[2]
	local btnL = this.mainComponent:GetButton(nameL)
	local btnR = this.mainComponent:GetButton(nameR)

	UILayerCtrl.AddIndividual(pnlName, nameL, btnL)
	UILayerCtrl.AddIndividual(pnlName, nameR, btnR)
	btnL:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local tabIdx, rowIdx, currIdx, content, edgeReachedL, edgeReachedR = cbFnL(obj, data)

		this.SelectRow(tabIdx, rowIdx)

		if type(content) == "string" then
			text:SetContent(content)
		elseif type(content) == "function" then
			text:SetGameTextContent(content)
		end

		if edgeReachedL then
			btnL.gameObject:SetActive(false)
		else
			btnL.gameObject:SetActive(true)
		end

		if edgeReachedR then
			btnR.gameObject:SetActive(false)
		else
			btnR.gameObject:SetActive(true)
		end
	end)
	btnR:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local tabIdx, rowIdx, currIdx, content, edgeReachedL, edgeReachedR = cbFnR(obj, data)

		this.SelectRow(tabIdx, rowIdx)

		if type(content) == "string" then
			text:SetContent(content)
		elseif type(content) == "function" then
			text:SetGameTextContent(content)
		end

		if edgeReachedL then
			btnL.gameObject:SetActive(false)
		else
			btnL.gameObject:SetActive(true)
		end

		if edgeReachedR then
			btnR.gameObject:SetActive(false)
		else
			btnR.gameObject:SetActive(true)
		end
	end)

	option.btnL = btnL
	option.btnR = btnR

	function option.Select()
		local tabIdx, rowIdx, currIdx, content, edgeReachedL, edgeReachedR = cbSel(obj, data)

		this.SelectRow(tabIdx, rowIdx)

		if type(content) == "string" then
			text:SetContent(content)
		elseif type(content) == "function" then
			text:SetGameTextContent(content)
		end

		if edgeReachedL then
			btnL.gameObject:SetActive(false)
		else
			btnL.gameObject:SetActive(true)
		end

		if edgeReachedR then
			btnR.gameObject:SetActive(false)
		else
			btnR.gameObject:SetActive(true)
		end
	end

	return option
end

function SettingCtrl.CreateOptionSlider(tabIdx, rowIdx, onValChg)
	local pnlName = SettingCfg.UiName[tabIdx]
	local option = {}
	local btnName, prevBtnName, nextBtnName = SettingCtrl.GetSibingBtnNameR(tabIdx, rowIdx)
	local btnRow = this.mainComponent:GetButton(btnName)

	btnRow:SetAudioType(AudioCtrl.ButtonClickType.None)
	btnRow:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	btnRow:SetAdjacent(XButton.Adjacent.UP, prevBtnName)
	btnRow:SetAdjacent(XButton.Adjacent.DOWN, nextBtnName)
	UILayerCtrl.AddButton(pnlName, btnName, btnRow)

	option.row = btnRow

	local cachedValue = cached[tabIdx][rowIdx]
	local valName, sldrName = SettingCtrl.GetSliderValName(tabIdx, rowIdx)
	local txt = this.mainComponent:GetText(valName)

	if txt then
		txt:SetContent(cachedValue)

		option.txt = txt
	end

	local com = this.mainComponent:GetGameObject(sldrName)
	local slider = com:GetComponent("Slider")

	slider.onValueChanged:RemoveAllListeners()

	slider.value = cachedValue

	slider.onValueChanged:AddListener(function(progress)
		if option.txt then
			option.txt:SetContent(progress)
		end

		cached[tabIdx][rowIdx] = progress
		panels[tabIndex].last = btnName

		UILayerCtrl.OnSelect(btnName)
		this.SelectRow(tabIdx, rowIdx)

		if onValChg then
			onValChg(progress, tabIdx, rowIdx)
		end
	end)

	option.com = slider

	return option
end

function SettingCtrl.RevalidateGuideBookList()
	if panelGuide then
		local count = loaderGuide.loadCount

		for idx = 1, count do
			local bodyBtn = panelGuide.item[idx]
			local data = MS_StoryGuideSort.GetGuidePage(idx)

			if bodyBtn and data then
				bodyBtn.txt:SetContent(data.Title)
			end
		end
	end
end

function SettingCtrl.SetGuideBookPage(idx)
	if panelGuide and panelGuide.data then
		if panelGuide.inLoading then
			return
		end

		local data = MS_StoryGuideSort.GetGuidePage(idx)

		if data then
			local count = table.nums(panelGuide.item)

			for i = 1, count do
				local bodyBtn = panelGuide.item[i]

				bodyBtn.sel.alpha = 0
			end

			local bodyBtn = panelGuide.item[idx]

			if bodyBtn ~= nil then
				bodyBtn.txt:SetContent(data.Title)

				bodyBtn.sel.alpha = 1
			end

			local diagram = panelGuide.panelDiagram

			if diagram ~= nil then
				local text = GameText.UI_COMMON_EMPTY

				if tonumber(data.ImageId) > 0 then
					local imgName = "guide" .. data.ImageId

					panelGuide.inLoading = true

					XObjectPool.LoadImage(imgName, function()
						local sprite = XObjectPool.GetImage(imgName)

						if sprite then
							diagram.img:SetSprite(sprite)
							diagram.img.gameObject:SetActive(true)

							panelGuide.isLoading = false
							panelGuide.inLoading = false
						end
					end)
				else
					diagram.img.gameObject:SetActive(false)
				end

				if isJoystickAttached then
					text = data.DescriptionJoystick
				else
					text = data.DescriptionTouch
				end

				local rtext

				if data.HeroId then
					rtext = SystemHelper.ConvertCustomRichText(text, 20, 2, data.HeroId)
				else
					rtext = SystemHelper.ConvertCustomRichText(text, 20, 2, 10001)
				end

				diagram.txt:SetContent(rtext)
			end
		end
	end
end

function SettingCtrl.SetGraphicsQuality(level)
	level = level + 1

	SystemHelper.Log("Setting GQuality: " .. level)

	LS_Setting.graphics.quality = level

	local sceneController = ST_Lobby.GetSceneController()

	if sceneController == nil then
		sceneController = ST_Main.GetSceneController()
	end

	if sceneController ~= nil then
		local camera = sceneController:GetCameraCtrl()

		if camera ~= nil then
			camera:SetFog(level)
		end
	end

	if sceneController ~= nil then
		local scene = sceneController:GetScene()

		if scene ~= nil then
			if level >= LS_Setting.QualityLevel.Ultra then
				scene:SetPostProcessType(SceneBase.PostProcessType.MainSuper)
			elseif level >= LS_Setting.QualityLevel.Medium then
				scene:SetPostProcessType(SceneBase.PostProcessType.MainPro)
			else
				scene:SetPostProcessType(SceneBase.PostProcessType.Main)
			end

			UIManager.SendMessage("Mainmenu", "ResetSanityVfx")
		end

		sceneController:UpdateQuality(true)
	end

	delaySaving = true
end

function SettingCtrl.SetAntiAliasing(level)
	SystemHelper.Log("Setting AA: " .. level)

	LS_Setting.graphics.antialiasing = level
	delaySaving = true

	local sceneController = ST_Lobby.GetSceneController()

	if sceneController == nil then
		sceneController = ST_Main.GetSceneController()
	end

	if sceneController ~= nil then
		sceneController:UpdateQuality(true)
	end
end

function SettingCtrl.SetReflection(level)
	SystemHelper.Log("Setting Rf: " .. level)

	LS_Setting.graphics.reflection = level
	delaySaving = true

	local sceneController = ST_Lobby.GetSceneController()

	if sceneController == nil then
		sceneController = ST_Main.GetSceneController()
	end

	if sceneController ~= nil then
		sceneController:UpdateQuality(true)
	end
end

function SettingCtrl.SetAmbientOcclusion(level)
	SystemHelper.Log("Setting AO: " .. level)

	LS_Setting.graphics.ambientocclusion = level
	delaySaving = true

	local sceneController = ST_Lobby.GetSceneController()

	if sceneController == nil then
		sceneController = ST_Main.GetSceneController()
	end

	if sceneController ~= nil then
		sceneController:UpdateQuality(true)
	end
end

function SettingCtrl.SetVignette(btnIdx)
	local value = btnIdx - 1
	local show = value > 0

	LS_Setting.graphics.vignette = value
	delaySaving = true

	UIManager.SendMessage("Mainmenu", "ResetSanityVfx")
end

function SettingCtrl.SetVSyncCount(vSyncIdx)
	local vSyncCount = vSyncIdx - 1
	local previous = LS_Setting.graphics.vsync

	LS_Setting.graphics.vsync = vSyncCount

	Device.SetVSyncCount(vSyncCount)

	delaySaving = true

	SystemHelper.Log("Setting VSyncCount: " .. vSyncCount)

	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsFrameRate

	if vSyncCount == 0 then
		SettingCtrl.EnableOptionButtons(tabIdx, rowIdx, true)
	else
		SettingCtrl.EnableOptionButtons(tabIdx, rowIdx, false)
	end
end

function SettingCtrl.SetGraphicsFrameRate(level)
	local previous = LS_Setting.graphics.framerate

	LS_Setting.graphics.framerate = level

	local fps = tonumber(LS_Setting.FrameRate[level])

	ControllerMain.SetFrameRate(fps, false)

	delaySaving = true
end

function SettingCtrl.SetCameraType(type)
	LS_Setting.camera.type = type
	delaySaving = true
end

function SettingCtrl.ShowKmKeyBindingSucceeded(keyVal, keyName)
	local panel = panelInputCfg[LS_Setting.InputMode.KM].panel
	local iconName = "XX"
	local iconCode = "<quad name=" .. iconName .. " size=18 width=2.1 />"

	SystemHelper.Log(".................... " .. iconCode .. ", " .. iconName)
	print_r(panel.hintTextKeyBinding)

	local content = panel.hintTextKeyBindingContent
	local result = keyName .. string.gsub(content, "{1}", iconCode)

	panel.hintTextKeyBinding:SetContent(result)

	panel.cgHintPanelKeyBinding.alpha = 1
	panel.showHintKeyBinding = true

	panel.hintPanelKeyBinding:SetActive(panel.showHintKeyBinding)

	local tween = Tween:new(panel.cgHintPanelKeyBinding)

	tween:SetAutoKill(true)
	tween:Delay(0.7)
	tween:MoveTo({
		alpha = 0
	}, 0.3)
	tween:OnComplete(function()
		panel.showHintKeyBinding = false

		panel.hintPanelKeyBinding:SetActive(panel.showHintKeyBinding)
	end)
	tween:Start()
end

function SettingCtrl.ShowKmKeyReplacingSucceeded(keyPrev, keyVal, keyName)
	local panel = panelInputCfg[LS_Setting.InputMode.KM].panel
	local iconName1 = LS_Setting.GetBtnIconName(keyPrev)
	local iconName2 = LS_Setting.GetBtnIconName(keyVal)
	local iconCode1 = "<quad name=" .. iconName1 .. " size=18 width=2.1 />"
	local iconCode2 = "<quad name=" .. iconName2 .. " size=18 width=2.1 />"
	local result = keyName .. string.gsub(panel.hintTextKeyReplacingContent, "{1}", iconCode1) .. iconCode2

	panel.hintTextKeyReplacing.text = result
	panel.cgHintPanelKeyReplacing.alpha = 1
	panel.showHintKeyReplacing = true

	panel.hintPanelKeyReplacing:SetActive(panel.showHintKeyReplacing)

	local tween = Tween:new(panel.cgHintPanelKeyReplacing)

	tween:SetAutoKill(true)
	tween:Delay(0.7)
	tween:MoveTo({
		alpha = 0
	}, 0.3)
	tween:OnComplete(function()
		panel.showHintKeyReplacing = false

		panel.hintPanelKeyReplacing:SetActive(panel.showHintKeyReplacing)
	end)
	tween:Start()
end

function SettingCtrl.OpenKmModConfig(keyBtn, keyName, keyCode)
	local panel = panelInputCfg[LS_Setting.InputMode.KM].panel

	if not panel.showPnlMod then
		inputMgr:ClearButtonInfo()

		ignoreFirstInput = true

		UILayerCtrl.Push(SettingCtrl.KMConfig, "Setting_KMC_PnlMod")
		inputMgr:StartKeyBinding()

		panel.keyName = keyBtn
		panel.prevBtn = KMKey[keyBtn]
		configTimeCount = TimeHelper.getNowTimeNoScale() + SettingCtrl.GlobalTimeOut
		delayInteractiveTimeCount = configTimeCount + 1
		panel.timeCD = SettingCtrl.GlobalTimeOut

		panel.TextLine1:SetContent(panel.TextContent1)
		panel.TextLine2:SetContent(panel.timeCD)

		panel.hintTextKeyBindingContent = panel.hintTextKeyBinding:GetContent()
		panel.hintTextKeyReplacingContent = panel.hintTextKeyReplacing:GetContent()
		panel.showPnlMod = true

		panel.goPnlMod:SetActive(panel.showPnlMod)
	end
end

function SettingCtrl.CloseKmModConfig()
	local panel = panelInputCfg[LS_Setting.InputMode.KM].panel

	if panel.showPnlMod then
		configTimeCount = 0
		panel.showPnlMod = false

		panel.goPnlMod:SetActive(panel.showPnlMod)
		UILayerCtrl.Pop()
		inputMgr:StopKeyBinding()

		panel.keyName = ""
		panel.prevBtn = ""

		LS_Setting.SaveKMC()

		delaySaving = true
	end
end

function SettingCtrl.UpdateKmModConfig()
	if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
		SettingCtrl.CloseKmModConfig()

		delayInteractiveTimeCount = TimeHelper.getNowTimeNoScale() + 1

		return
	end

	local remainingTime = configTimeCount - TimeHelper.getNowTimeNoScale()

	if remainingTime > 0 then
		local panel = panelInputCfg[LS_Setting.InputMode.KM].panel
		local timeInSec = Mathf.Ceil(remainingTime)

		if panel.timeCD ~= timeInSec then
			panel.timeCD = timeInSec

			panel.TextLine2:SetContent(timeInSec)
		end

		local btnR, isValid = this.GetKeyCode()

		if not isValid then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_REQ_THIS_BINDING_IS_PROHIBITED)

			return
		end

		if btnR > 0 then
			local btnIdx = panel.rowIndex - loaderKmCfg.stepCount
			local btnKey = LS_Setting.KMItems[btnIdx]
			local btnKeyR = LS_Setting.GetBtnKey(btnR)
			local oriKey = ""

			for key, btn in pairs(KMKey) do
				if btn == btnR then
					oriKey = key

					break
				end
			end

			if string.len(oriKey) > 0 then
				KMKey[oriKey] = 0
				LS_Setting.kmCfg[btnKeyR] = {
					0
				}

				local btnValRTxt = panel.icon[btnKeyR]

				if btnValRTxt ~= nil then
					btnValRTxt:SetContent(UI_COMMON_EMPTY)
				end
			end

			local keySymbol = XKeySymbol[btnR]

			if LS_Setting.kmCfg[btnKey] == nil then
				LS_Setting.kmCfg[btnKey] = {}
				LS_Setting.kmCfg[btnKey][1] = LS_Setting.KMMapDef[btnKey][1]
			end

			LS_Setting.kmCfg[btnKey][1] = btnR
			KMKey[btnKey] = btnR

			inputMgr:SetKMMapByIdx(btnIdx, btnR)

			local btnValTxt = panel.icon[btnKey]

			if btnValTxt ~= nil then
				btnValTxt:SetContent(keySymbol)
			end

			SettingCtrl.RefreshKMConfig()
			SettingCtrl.CloseKmModConfig()

			delayInteractiveTimeCount = TimeHelper.getNowTimeNoScale() + 1
		end
	elseif remainingTime <= 0 then
		SettingCtrl.CloseKmModConfig()
	end
end

function SettingCtrl.RefreshKMConfig()
	local panel = panelInputCfg[LS_Setting.InputMode.KM].panel
	local btnCnt = table.nums(InputCfg.KeyList)

	for btnIdx = 1, btnCnt do
		local btnKey = LS_Setting.KMItems[btnIdx]

		if btnKey ~= nil then
			local btnTxt = panel.icon[btnKey]

			if btnTxt ~= nil then
				local btnVal = KMKey[btnKey]
				local symbol = XKeySymbol[btnVal]

				if symbol ~= nil and string.len(symbol) > 0 then
					local items = StringHelper.Split(symbol, "_")

					if table.nums(items) == 1 then
						btnTxt:SetGameTextContent(function()
							return symbol
						end)
					else
						btnTxt:SetGameTextContent(function()
							return GameText["UI_CONTROLLER_" .. string.upper(symbol)]
						end)
					end
				else
					btnTxt:SetGameTextContent(function()
						return GameText.UI_COMMON_EMPTY
					end)
				end
			end
		end
	end
end

function SettingCtrl.ResetKMConfig()
	LS_Setting.InitKMC(true)

	delaySaving = true

	SettingCtrl.RefreshKMConfig()
	UILayerCtrl.ForceUpdate(0.7)
end

function SettingCtrl.RequestResetKMConfig()
	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_REQ_RESET_KEYBOARD_MOUSE_CONFIG, function()
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_REQ_DOUBLE_CONFIRMATION, function()
			this.ResetKMConfig()
		end, function()
			UILayerCtrl.ForceUpdate(0.7)
		end, false)
	end, function()
		return
	end, false)
end

function SettingCtrl.UpdateKMConfig()
	local gpDItems = LS_Setting.KMItems
	local btnItems = {}

	for k, v in pairs(gpDItems) do
		btnItems[k] = ""
	end

	for k, v in pairs(GPKey) do
		btnItems[v] = k
	end

	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if panel then
		panel.btnItems = btnItems
	end
end

function SettingCtrl.CreateButton(key, btnName)
	local button = {}
	local btn = this.mainComponent:GetButton(btnName)

	button.key = key
	button.name = btnName
	button.btn = btn
	button.rectTf = btn.gameObject:GetComponent("RectTransform")
	button.rect = btn.gameObject:GetComponent("RectTransform").rect
	button.parent = btn.gameObject.transform.parent
	button.parentRectTf = btn.gameObject.transform.parent.gameObject:GetComponent("RectTransform")
	button.parentRect = button.parentRectTf.rect
	button.sel = TfFindChild(btn.transform, "SelectedCircle").gameObject

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local mode = LS_Setting.InputMode.TP
		local panel = panelInputCfg[mode].panel

		if panel.current then
			local btnCfg = touchBtnCfg[key]

			panel.sldrBtnScale.value = 100 * btnCfg.s
		end
	end, 0)
	btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		SystemHelper.Log("Key Down: " .. key)

		local mode = LS_Setting.InputMode.TP
		local panel = panelInputCfg[mode].panel
		local current = panel.current

		if current then
			local prevBtn = panel.buttons[current]

			prevBtn.sel:SetActive(false)
		end

		if key then
			panel.previous = panel.current
			panel.current = key

			local currBtn = panel.buttons[key]

			currBtn.sel:SetActive(true)

			local rectTf = button.rectTf
			local localPos = SystemHelper.GetTouchLocalPosition(rectTf, data)

			localPosition.x = localPos.x
			localPosition.y = localPos.y

			panel.txtBtnIntro:SetGameTextContent(function()
				return GameText["UI_INPUT_GAME_" .. key]
			end)
		end
	end, 0)
	btn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		SystemHelper.Log("Up......" .. key)

		local mode = LS_Setting.InputMode.TP
		local panel = panelInputCfg[mode].panel
		local pos = btn.gameObject.transform.localPosition
		local scale = btn.gameObject.transform.localScale.x
		local slot = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]
		local newSetting = {
			x = pos.x,
			y = pos.y,
			s = scale
		}

		touchBtnCfg[key] = newSetting

		LS_Setting.SetInputConfig(mode, slot, key, pos.x, pos.y, scale)
	end, 0)
	btn:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		if button.key == "MOVEFIXED" then
			dragPosition = SystemHelper.GetTouchWorldPosition(button.parent.parent, data)

			local scale = btn.gameObject.transform.localScale.x

			if dragPosition then
				btn.gameObject.transform.position = dragPosition - localPosition
			end

			local rect = button.parentRect
			local localPos = SystemHelper.GetTouchLocalPosition(button.parent.parent, data)
			local cpos = btn.gameObject.transform.position
			local rect = button.rect
			local minX = cpos.x + rect.xMin * scale
			local maxX = cpos.x + rect.xMax * scale
			local minY = cpos.y + rect.yMin * scale
			local maxY = cpos.y + rect.yMax * scale
			local buttons = panelInputCfg[LS_Setting.InputMode.TP].panel.buttons
			local moveBtn = buttons.MOVE
			local moveRect = moveBtn.rect
			local moveScale = moveBtn.btn.gameObject.transform.localScale.x

			SystemHelper.Log("MOV Scale: " .. moveScale)

			local moveW = moveRect.width
			local moveH = moveRect.height
			local moveCpos = moveBtn.btn.gameObject.transform.position
			local mminX = moveCpos.x + moveRect.xMin * moveScale - rect.xMin * scale
			local mmaxX = moveCpos.x + moveRect.xMax * moveScale - rect.xMax * scale
			local mminY = moveCpos.y + moveRect.yMin * moveScale - rect.yMin * scale
			local mmaxY = moveCpos.y + moveRect.yMax * moveScale - rect.yMax * scale
			local x = cpos.x
			local y = cpos.y

			if x < mminX then
				x = mminX
			elseif mmaxX < x then
				x = mmaxX
			end

			if y < mminY then
				y = mminY
			elseif mmaxY < y then
				y = mmaxY
			end

			if x ~= cpos.x or y ~= cpos.y then
				btn.gameObject.transform.position = Vector3.New(x, y, btn.gameObject.transform.position.z)
			end
		else
			dragPosition = SystemHelper.GetTouchLocalPosition(button.parent, data)

			if dragPosition then
				btn.gameObject.transform.localPosition = dragPosition - localPosition
			end
		end
	end, 0)

	return button
end

function SettingCtrl.ResetButtons()
	local mode = LS_Setting.InputMode.TP
	local panel = panelInputCfg[mode].panel

	panel.current = nil
	panel.previous = nil

	local buttons = panel.buttons

	for _, btn in pairs(buttons) do
		btn.sel:SetActive(false)
	end

	panel.txtBtnIntro:SetContent(GameText.UI_COMMON_EMPTY)
	panel.txtBtnScale:SetContent(100 .. GameText.UI_COMMON_PERCENT)

	panel.sldrBtnScale.value = 100
end

function SettingCtrl.GenerateDefaultTouchPadConfig()
	local btns = SettingCtrl.BtnTPC

	for k, v in pairs(btns) do
		local btn = this.mainComponent:GetButton(btns[k])
		local pos = btn.gameObject.transform.localPosition
		local scale = btn.gameObject.transform.localScale
		local btnCfg = {}

		btnCfg.x = pos.x
		btnCfg.y = pos.y
		btnCfg.s = scale.x
		touchBtnCfg[k] = btnCfg
	end
end

function SettingCtrl.ShowKeyBindingSucceeded(keyVal, keyName)
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel
	local iconName = LS_Setting.GetBtnIconName(keyVal)
	local iconCode = "<quad name=" .. iconName .. " size=18 width=2.1 />"

	SystemHelper.Log(".................... " .. iconCode .. ", " .. iconName)
	print_r(panel.hintTextKeyBinding)

	local content = panel.hintTextKeyBindingContent
	local result = keyName .. string.gsub(content, "{1}", iconCode)

	panel.hintTextKeyBinding:SetContent(result)

	panel.cgHintPanelKeyBinding.alpha = 1
	panel.showHintKeyBinding = true

	panel.hintPanelKeyBinding:SetActive(panel.showHintKeyBinding)

	local tween = Tween:new(panel.cgHintPanelKeyBinding)

	tween:SetAutoKill(true)
	tween:Delay(0.7)
	tween:MoveTo({
		alpha = 0
	}, 0.3)
	tween:OnComplete(function()
		panel.showHintKeyBinding = false

		panel.hintPanelKeyBinding:SetActive(panel.showHintKeyBinding)
	end)
	tween:Start()
end

function SettingCtrl.ShowKeyReplacingSucceeded(keyPrev, keyVal, keyName)
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel
	local iconName1 = LS_Setting.GetBtnIconName(keyPrev)
	local iconName2 = LS_Setting.GetBtnIconName(keyVal)
	local iconCode1 = "<quad name=" .. iconName1 .. " size=18 width=2.1 />"
	local iconCode2 = "<quad name=" .. iconName2 .. " size=18 width=2.1 />"
	local result = keyName .. string.gsub(panel.hintTextKeyReplacingContent, "{1}", iconCode1) .. iconCode2

	panel.hintTextKeyReplacing.text = result
	panel.cgHintPanelKeyReplacing.alpha = 1
	panel.showHintKeyReplacing = true

	panel.hintPanelKeyReplacing:SetActive(panel.showHintKeyReplacing)

	local tween = Tween:new(panel.cgHintPanelKeyReplacing)

	tween:SetAutoKill(true)
	tween:Delay(0.7)
	tween:MoveTo({
		alpha = 0
	}, 0.3)
	tween:OnComplete(function()
		panel.showHintKeyReplacing = false

		panel.hintPanelKeyReplacing:SetActive(panel.showHintKeyReplacing)
	end)
	tween:Start()
end

function SettingCtrl.OpenGpModConfig(keyBtn, keyName)
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if not panel.showPnlMod then
		inputMgr:ClearButtonInfo()
		UILayerCtrl.Push(SettingCtrl.GPConfig, "Setting_GPC_PnlMod")

		panel.keyName = keyBtn
		panel.prevBtn = GPKey[keyBtn]
		configTimeCount = TimeHelper.getNowTimeNoScale() + SettingCtrl.GlobalTimeOut
		delayInteractiveTimeCount = configTimeCount + 1
		panel.timeCD = SettingCtrl.GlobalTimeOut

		panel.TextLine1:SetContent(panel.TextContent1 .. keyName)
		panel.TextLine2:SetContent(panel.timeCD)

		panel.hintTextKeyBindingContent = panel.hintTextKeyBinding:GetContent()
		panel.hintTextKeyReplacingContent = panel.hintTextKeyReplacing:GetContent()
		panel.showPnlMod = true

		panel.goPnlMod:SetActive(panel.showPnlMod)
	end
end

function SettingCtrl.CloseGpModConfig()
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if panel.showPnlMod then
		configTimeCount = 0
		panel.showPnlMod = false

		panel.goPnlMod:SetActive(panel.showPnlMod)
		UILayerCtrl.Pop()

		panel.keyName = ""
		panel.prevBtn = ""

		LS_Setting.SaveGPC()

		delaySaving = true
	end
end

function SettingCtrl.UpdateGpModConfig()
	local remainingTime = configTimeCount - TimeHelper.getNowTimeNoScale()

	if remainingTime > 0 then
		local panel = panelInputCfg[LS_Setting.InputMode.GP].panel
		local timeInSec = Mathf.Ceil(remainingTime)

		if panel.timeCD ~= timeInSec then
			panel.timeCD = timeInSec

			panel.TextLine2:SetContent(timeInSec)
		end

		local btnR, isValid = this.GetButtonName()

		if not isValid then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_REQ_THIS_BINDING_IS_PROHIBITED)

			return
		end

		if btnR ~= nil then
			local btnIdx = panel.rowIndex
			local btnKey = LS_Setting.GPItems[btnIdx]
			local oriIdx = -1
			local oriKey = ""
			local oriBtn = GPKey[btnKey]

			for key, btn in pairs(GPKey) do
				if btn == btnR then
					oriKey = key
				end
			end

			local gpItems = LS_Setting.GPItems

			for idx, key in pairs(gpItems) do
				if key == oriKey then
					oriIdx = idx
				end
			end

			local iconName = LS_Setting.GetBtnIconName(btnR)
			local btnIcon = panel.icon[btnIdx]
			local sprite = XObjectPool.GetIcon(iconName)

			if sprite and btnIcon then
				btnIcon:SetSprite(sprite)
			end

			GPKey[btnKey] = btnR
			LS_Setting.gpCfg[btnKey][1] = btnR

			panel.btnNodes[btnR]:SetActive(true)

			if string.len(oriKey) > 0 then
				local iconName = LS_Setting.GetBtnIconName(oriBtn)
				local btnIcon = panel.icon[oriIdx]
				local sprite = XObjectPool.GetIcon(iconName)

				if sprite and btnIcon then
					btnIcon:SetSprite(sprite)
				end

				GPKey[oriKey] = oriBtn

				if LS_Setting.gpCfg[oriKey] ~= nil then
					LS_Setting.gpCfg[oriKey][1] = oriBtn
				end

				panel.btnNodes[oriBtn]:SetActive(true)
			else
				panel.btnNodes[oriBtn]:SetActive(false)
			end

			SettingCtrl.CloseGpModConfig()

			delayInteractiveTimeCount = TimeHelper.getNowTimeNoScale() + 1
		end
	elseif remainingTime < 0 then
		SettingCtrl.CloseGpModConfig()
	end
end

function SettingCtrl.RefreshGamePadConfig()
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel
	local btnCnt = table.nums(LS_Setting.GPItems)

	for btnIdx = 1, btnCnt do
		local btnIcon = panel.icon[btnIdx]
		local btnKey = LS_Setting.GPItems[btnIdx]
		local btnVal = GPKey[btnKey]
		local iconName = LS_Setting.GetBtnIconName(btnVal)
		local sprite = XObjectPool.GetIcon(iconName)

		if btnIcon ~= nil and sprite ~= nil then
			btnIcon:SetSprite(sprite)
		end
	end
end

function SettingCtrl.ResetGamePadConfig()
	LS_Setting.InitGPC(true)
	SettingCtrl.RefreshGamePadConfig()
	UILayerCtrl.ForceUpdate(0.7)
end

function SettingCtrl.UpdateGamePadConfig()
	local gpDItems = LS_Setting.GPDItems
	local btnItems = {}

	for k, v in pairs(gpDItems) do
		btnItems[k] = ""
	end

	for k, v in pairs(GPKey) do
		btnItems[v] = k
	end

	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if panel then
		panel.btnItems = btnItems
	end
end

function SettingCtrl.OpenGamePadDiagram()
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if panel and not panel.showDiagram then
		panel.showDiagram = true

		SettingCtrl.UpdateGamePadConfig()

		local btnItems = panel.btnItems
		local btnTexts = panel.btnTexts
		local btnNodes = panel.btnNodes

		for k, v in pairs(btnItems) do
			local text = btnTexts[k]

			if text and v ~= "" then
				text:SetGameTextContent(function()
					return GameText["UI_INPUT_GAME_" .. v]
				end)
			end
		end

		UILayerCtrl.Push(SettingCtrl.InputDiagram, "Setting_GPC_PnlDiagram")
		panel.diagram.gameObject:SetActive(true)
	end
end

function SettingCtrl.CloseGamePadDiagram()
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if panel.showDiagram then
		panel.showDiagram = false

		panel.diagram.gameObject:SetActive(false)
		UILayerCtrl.Pop()
	end
end

function SettingCtrl.SaveTouchScreenLayoutToDefault()
	local layout = {}

	for k, v in pairs(SettingCtrl.BtnTPC) do
		local btn = this.mainComponent:GetGameObject(v)

		if btn then
			local btnCfg = {
				s = 100,
				x = 0,
				y = 0
			}
			local rectTf = btn:GetComponent("RectTransform")
			local pos = rectTf.localPosition

			btnCfg.x = Mathf.Round(pos.x)
			btnCfg.y = Mathf.Round(pos.y)
			layout[k] = btnCfg
		end
	end

	local ResolutionAndAspectRatio = {
		x = Mathf.Round(LS_Setting.screenWidth),
		y = Mathf.Round(LS_Setting.screenHeight),
		s = Mathf.Round(LS_Setting.screenRatio)
	}

	layout.RAR = ResolutionAndAspectRatio

	LS_Setting.SaveAsDefaultTouchScreenLayout(layout)
end

function SettingCtrl.DirectOpenTPConfig()
	local tabIdx = SettingCfg.Pnl.Control
	local rowIdx = SettingCfg.Idx[tabIdx].InputConfiguration

	UILayerCtrl.Pop()

	cached[tabIdx][rowIdx] = 2
	LS_Setting.lastSetInput = 2

	this.SelectTab(tabIdx, rowIdx)
	this.SelectRow(tabIdx, rowIdx)
	UILayerCtrl.OnCursorClickMute()
end

function SettingCtrl.BeginTPConfig()
	LS_Setting.UpdateTouchUi()

	local mode = LS_Setting.InputMode.TP
	local idxSel = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

	UILayerCtrl.Push(SettingCfg.Sub[mode][1], SettingCtrl.BtnTPCTopBar[idxSel])
	this.LoadTouchPadLayout(mode, idxSel)

	local panel = panelInputCfg[mode].panel

	if panel ~= nil then
		panel.btnLayoutHighlighted[idxSel]:SetActive(true)
	end
end

function SettingCtrl.EndTPConfig()
	return
end

function SettingCtrl.ScheduleUiAutoAdaption()
	delayAutoAdaption = 2
end

function SettingCtrl.RevalidateInputLayoutsForTouchScreen()
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == SettingCfg.Sub[LS_Setting.InputMode.TP][1] then
		local mode = LS_Setting.InputMode.TP
		local idxSel = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

		this.LoadTouchPadLayout(mode, idxSel)
	end
end

function SettingCtrl.BeginKMConfig()
	local mode = LS_Setting.InputMode.KM
	local panel = panelInputCfg[mode].panel

	if panel then
		panel.rowIndex = 1
		panel.sel[1].alpha = 1

		UILayerCtrl.Push(SettingCfg.Sub[mode][1], "KMCB1")
	end
end

function SettingCtrl.EndKMConfig()
	local panel = panelInputCfg[LS_Setting.InputMode.KM].panel

	if panel then
		panel.sel[panel.rowIndex].alpha = 0
		panel.rowPrevious = panel.rowIndex
		panel.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panel.scrollRect.scrollRectCom.normalizedPosition.x, 1)
		panel.rowIndex = 1
		panel.selIndex = 1
		panel.sel[panel.rowIndex].alpha = 1
		panel.sel[panel.rowPrevious].alpha = 0
		panel.rowPrevious = 1
	end

	SettingCtrl.RefreshGuideLanguage()
	UIManager.SendMessage("Mainmenu", "RefreshActionBtnKeyboardIcon")
end

function SettingCtrl.BeginGPConfig()
	local mode = LS_Setting.InputMode.GP
	local panel = panelInputCfg[mode].panel

	if panel then
		panel.rowIndex = 1
		panel.sel[1].alpha = 1

		UILayerCtrl.Push(SettingCfg.Sub[mode][1], "GPCBS2")
	end
end

function SettingCtrl.EndGPConfig()
	local panel = panelInputCfg[LS_Setting.InputMode.GP].panel

	if panel then
		local btnCnt = table.nums(LS_Setting.GPItems)

		for btnIdx = 1, btnCnt do
			panel.sel[btnIdx].alpha = 0
		end

		panel.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panel.scrollRect.scrollRectCom.normalizedPosition.x, 1)
		panel.rowIndex = 1
		panel.selIndex = 1
		panel.sel[panel.rowIndex].alpha = 1
		panel.sel[panel.rowPrevious].alpha = 0
		panel.rowPrevious = 1
	end

	SettingCtrl.RefreshGuideLanguage()
	UIManager.SendMessage("Mainmenu", "RefreshActionBtnJoystickIcon")
end

function SettingCtrl.SaveTouchPadLayout(mode, slot)
	LS_Setting.SetInputConfigGroup(mode, slot, touchBtnCfg)
	LS_Setting.UpdateTouchScreenLayoutData(slot, LS_Setting.screenWidth, LS_Setting.screenHeight)
	SystemHelper.Log(string.format("[ ...SaveTouchPadLayout: %d, %d ]", mode, slot))
end

function SettingCtrl.LoadTouchPadLayout(mode, slot)
	SystemHelper.Log(string.format("[ ...LoadTouchPadLayout: %d, %d ]", mode, slot))

	local cfgSel = LS_Setting.inputConfig[mode][slot]

	touchBtnCfg = {}
	touchBtnCfg = SystemHelper.DeepCopy(cfgSel)

	local btns = panelInputCfg[mode].panel.buttons

	for k, button in pairs(btns) do
		local btn = button.btn

		if btn then
			local btnCfg = touchBtnCfg[k]

			if btnCfg then
				local rectTf = btn.gameObject:GetComponent("RectTransform")

				rectTf.localPosition = Vector3.New(btnCfg.x, btnCfg.y, 0)

				local scale = btnCfg.s

				if scale < 2 then
					scale = scale * 100
				end

				local localScale = scale / 100

				rectTf.localScale = Vector3.New(localScale, localScale, 1)
			end
		end
	end
end

function SettingCtrl.OpenInputConfiguration(mode)
	panelMain:SetActive(false)

	panelInputCfg[mode].panel.show = true

	panelInputCfg[mode].panel.goPnl:SetActive(true)
	SystemHelper.Log(string.format("[ OpenInputConfiguration: %d ]", mode))

	if mode == LS_Setting.InputMode.TP then
		SettingCtrl.BeginTPConfig()
	elseif mode == LS_Setting.InputMode.GP then
		SettingCtrl.BeginGPConfig()
	elseif mode == LS_Setting.InputMode.KM then
		SettingCtrl.BeginKMConfig()
	end
end

function SettingCtrl.CloseInputConfiguration(mode)
	delaySaving = true
	panelInputCfg[mode].panel.show = false

	panelInputCfg[mode].panel.goPnl:SetActive(false)

	if mode == LS_Setting.InputMode.TP then
		SettingCtrl.EndTPConfig()
	elseif mode == LS_Setting.InputMode.GP then
		SettingCtrl.EndGPConfig()
	elseif mode == LS_Setting.InputMode.KM then
		SettingCtrl.EndKMConfig()
	end

	SystemHelper.Log(string.format("[ CloseInputConfiguration: %d ]", mode))
	UILayerCtrl.Pop()
	panelMain:SetActive(true)
	this.SelectTab(tabIndex, rowIndex)
	UILayerCtrl.ForceUpdate(0.7)
end

function SettingCtrl.CloseKmConfig()
	SystemHelper.Log(">>>>>>  [ KM: Quit ]")
	this.CloseInputConfiguration(LS_Setting.InputMode.KM)
end

function SettingCtrl.CloseGpConfig()
	SystemHelper.Log(">>>>>>  [ GP: Quit ]")
	this.CloseInputConfiguration(LS_Setting.InputMode.GP)
end

function SettingCtrl.CloseTpConfig()
	SystemHelper.Log(">>>>>>  [ TP: Quit ]")

	local mode = LS_Setting.InputMode.TP
	local index = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

	SystemHelper.Log("++++++++++++++++++++++++++++++++++++>>>>>>>> " .. index)
	this.SaveTouchPadLayout(mode, index)
	this.CloseInputConfiguration(mode)
	this.ResetButtons()
end

function SettingCtrl.OnLogin(success, code, accountId, loginType, nickname)
	UIManager.SendMessage("Loading", "SimpleLoading", false)

	if success == true then
		if code == 0 then
			NI_Login.OnLogin(success, code, accountId, loginType, nickname)

			if loginType >= 0 then
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_SUCCEEDED, function()
					SettingCtrl.ShowPanelLogin(false)
					SettingCtrl.ShowPanelAccount(false)
					SettingCtrl.UpdateRowAccount()
					UIManager.SendMessage("LobbyMain", "RevalidateTitle")
					UIManager.SendMessage("LobbyMain", "RevalidateNewGame")
					UIManager.SendMessage("LobbyMain", "RevalidateLoadGame")
					SettingCtrl.SetUserId(LS_Account.userId, loginType, LS_Account.GetNickname())
					SettingCtrl.ShowUserId(true)
				end, function()
					return
				end, true)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_FAILED, function()
					SettingCtrl.UpdateRowAccount()
				end, function()
					return
				end, true)
			end
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", SystemHelper.ParseErrorCode(code), function()
				return
			end, function()
				return
			end, true)
		end
	else
		SettingCtrl.UpdateRowAccount()

		if code > 0 then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", SystemHelper.ParseErrorCode(code), function()
				return
			end, function()
				return
			end, true)
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_FAILED, function()
				return
			end, function()
				return
			end, true)
		end
	end
end

function SettingCtrl.SetUserId(userId, loginType, nickname)
	if panelNoCould then
		if userId ~= nil and type(userId) == "string" and string.len(userId) > 1 then
			if SdkHelper.CheckAccountState() then
				if nickname ~= nil and string.len(nickname) > 0 then
					panelNoCould.text:SetContent(string.format("%s%s (%s)", GameText.UI_LOGIN_ACCOUNT, nickname, userId))
				else
					panelNoCould.text:SetContent(string.format("%s%s", GameText.UI_LOGIN_ACCOUNT, userId))
				end
			elseif nickname ~= nil and string.len(nickname) > 0 then
				panelNoCould.text:SetContent(string.format("%s%s (%s) [%s]", GameText.UI_LOGIN_ACCOUNT, nickname, userId, GameText.UI_LOGIN_NOT_LOGGED_IN))
			else
				panelNoCould.text:SetContent(string.format("%s%s (%s)", GameText.UI_LOGIN_ACCOUNT, userId, GameText.UI_LOGIN_NOT_LOGGED_IN))
			end
		else
			panelNoCould.text:SetContent(GameText.UI_LOGIN_NOT_LOGGED_IN)

			loginType = LS_Account.LoginType.Guest
		end

		if panelNoCould.accountIcons ~= nil and loginType ~= nil then
			local accIcons = panelNoCould.accountIcons

			for k, icon in pairs(accIcons) do
				if icon ~= nil and icon.go ~= nil then
					icon.go:SetActive(false)
				end
			end

			if loginType >= 0 then
				local icon = accIcons[loginType]

				if icon ~= nil and icon.go ~= nil then
					icon.go:SetActive(true)
				end
			end
		end

		if panelNoCould.rectTf ~= nil then
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(panelNoCould.rectTf)
		end
	end
end

function SettingCtrl.ShowUserId(show)
	if panelNoCould then
		if panelNoCould.show ~= show then
			panelNoCould.go:SetActive(show)

			panelNoCould.show = show
		end

		if show == true and panelNoCould.rectTf ~= nil then
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(panelNoCould.rectTf)
		end
	end
end

function SettingCtrl.SignInWithApple()
	UIManager.SendMessage("Loading", "SimpleLoading", true)

	if SdkHelper.IsInited() == true then
		SdkHelper.Login3rd(LS_Account.LoginType.Apple, SettingCtrl.OnLogin)
	else
		UIManager.SendMessage("Loading", "SimpleLoading", false)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_SDK_NETERR_OR_NOTINITED, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.Login(username, password)
	return
end

function SettingCtrl.Logout()
	if SdkHelper.CheckAccountState() then
		SdkHelper.Logout(function(result)
			if result == true then
				SettingCtrl.ShowUserId(false)
				NI_Login.OnLogout(LS_Account.userId)
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGOUT_SUCCEEDED, function()
					SettingCtrl.ShowPanelLogin(false)
					SettingCtrl.ShowPanelAccount(false)
					SettingCtrl.UpdateRowAccount()
					UIManager.SendMessage("LobbyMain", "RevalidateTitle")
					UIManager.SendMessage("LobbyMain", "RevalidateNewGame")
					UIManager.SendMessage("LobbyMain", "RevalidateLoadGame")

					if SdkHelper.IsInited() == true then
						SdkHelper.LoginGuest(NI_Login.OnLogin)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
							return
						end, function()
							return
						end, true)
					end
				end, function()
					return
				end, true)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGOUT_FAILED, function()
					return
				end, function()
					return
				end, true)
			end
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.StartAccountLogin()
	if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
		SettingCtrl.BeforeLoginProcess(function()
			SettingCtrl.PostLoginProcess()
		end)
	else
		SystemHelper.LogTest("检查是否需要实名制")
		SdkHelper.CheckIfNeedRealName(function(b)
			SystemHelper.LogTest(string.format("是否需要实名制: %s", tostring(b)))
			SettingCtrl.BeforeLoginProcess(function()
				SettingCtrl.PostLoginProcess()
			end)
		end)
	end
end

function SettingCtrl.ShowAccountLogin()
	UIManager.CreateCtrl("Account")
	UIManager.SendMessage("Account", "SetCallback", SettingCtrl.StartAccountLogin)
	UIManager.SendMessage("Account", "ShowLogin", true)
end

function SettingCtrl.RetryLoginProcess()
	if Platform == PlatformType.ANDROID then
		SettingCtrl.ShowAccountLogin()
	else
		SettingCtrl.StartAccountLogin()
	end
end

function SettingCtrl.ShowEventLog(logTbl, callback)
	UIManager.SendMessage("Loading", "SimpleLoading", false, false)
	MsgBoxSimpleCtrl.CloseMessage()

	isStarting = false

	local step = table.nums(logTbl) - 1
	local str = table.concat(logTbl, "\n")
	local evtMap = {
		"UI_EVENTLOG_INITSDK_RETRY",
		"UI_EVENTLOG_LOGIN_RETRY",
		"UI_EVENTLOG_GETIAP_RETRY",
		"UI_EVENTLOG_OWNIAP_RETRY"
	}

	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", str, SettingCtrl.RetryLoginProcess, function()
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText[evtMap[step]], function()
			if callback ~= nil then
				callback()
			end
		end, SettingCtrl.RetryLoginProcess, false, GameText.UI_EVENTLOG_DIALOG_CONFIRM, GameText.UI_EVENTLOG_DIALOG_RETRY)
	end, false, GameText.UI_EVENTLOG_DIALOG_RETRY, GameText.UI_EVENTLOG_DIALOG_IGNORE)
end

function SettingCtrl.BeforeLoginProcess(callback)
	if isStarting == false then
		isStarting = true

		UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
		SystemHelper.LogTest("开始初始化SDK")

		evtLog = {}

		SdkHelper.InitSdk(function(initSuccess)
			SystemHelper.LogTest("初始化SDK: " .. tostring(initSuccess))

			if initSuccess == true then
				MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_INITSDK_SUCC)
				SystemHelper.LogTest("开始登录游戏服务器")

				local function onLoginCallback(success, code, accountId, loginType, nickname)
					SystemHelper.LogTest("登录游戏服务器: " .. tostring(success))

					if loginType == 3 or loginType == 5 then
						UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)

						isStarting = true

						MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_GETIAP_SUCC)
					end

					NI_Login.OnLogin(success, code, accountId, loginType, nickname)

					if success == true then
						MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_LOGIN_SUCC)
						SystemHelper.LogTest("开始获取物品详细信息")
						SdkHelper.GetIapInfos(function(b)
							if b == true then
								MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_GETIAP_SUCC)
								SystemHelper.LogTest("物品详细信息:" .. tostring(SdkHelper.IsIapInfosInited))
								SystemHelper.LogTest("开始获取已购买追加内容")
								SdkHelper.GetPaidList(function(b2)
									if b2 == true then
										SystemHelper.LogTest(GameText.UI_EVENTLOG_OWNIAP_SUCC .. tostring(SdkHelper.IsPaidListInited))
										MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_OWNIAP_SUCC)
										MsgBoxSimpleCtrl.CloseMessage()
										UIManager.SendMessage("Loading", "SimpleLoading", false)

										isStarting = false

										if callback ~= nil then
											callback()
										end
									else
										SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_OWNIAP_FAIL)
										SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_OWNIAP_WARN)
										SettingCtrl.ShowEventLog(evtLog, callback)
									end
								end)
							else
								SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_GETIAP_FAIL)
								SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_GETIAP_WARN)
								SettingCtrl.ShowEventLog(evtLog, callback)
							end
						end)
					else
						SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_LOGIN_FAIL)
						SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_LOGIN_WARN)
						SettingCtrl.ShowEventLog(evtLog, callback)
					end
				end

				if LS_Account.login <= LS_Account.LoginType.Guest then
					SystemHelper.Log("[[[ SDK Login: Guest ]]]")
					SdkHelper.LoginGuest(onLoginCallback)
				else
					SystemHelper.Log(string.format("[[[ SDK Login: %d ]]]", LS_Account.login))
					SdkHelper.Login3rd(LS_Account.login, onLoginCallback)

					if LS_Account.login == 3 or LS_Account.login == 5 then
						isStarting = false

						MsgBoxSimpleCtrl.CloseMessage()
						UIManager.SendMessage("Loading", "SimpleLoading", false, false, false)
					end
				end
			else
				evtLog = {}

				SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_INITSDK_FAIL)
				SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_INITSDK_WARN)
				SettingCtrl.ShowEventLog(evtLog, callback)
			end
		end)
	end
end

function SettingCtrl.PostLoginProcess()
	local userId = LS_Account.userId

	if userId ~= nil and type(userId) == "string" and string.len(userId) <= 1 then
		SystemHelper.Log("NO VALID ACCOUNT !!!")
		SettingCtrl.UpdateRowAccount()
		SettingCtrl.SetUserId(LS_Account.userId, LS_Account.login, LS_Account.GetNickname())
		SettingCtrl.ShowUserId(true)
		UIManager.SendMessage("LobbyMain", "RevalidateTitle")
		UIManager.SendMessage("LobbyMain", "RevalidateNewGame")
		UIManager.SendMessage("LobbyMain", "RevalidateLoadGame")
	end
end

function SettingCtrl.ChangeAccount()
	if SdkHelper.CheckAccountState() then
		SdkHelper.Logout(function(result)
			UIManager.SendMessage("Loading", "SimpleLoading", false)

			if result == true then
				SettingCtrl.ShowUserId(false)
				NI_Login.OnLogout(LS_Account.userId)
				LS_Account.SetPreviousUserId("")
				SettingCtrl.UpdateRowAccount()
				SettingCtrl.SetUserId(LS_Account.userId, LS_Account.login, LS_Account.GetNickname())
				SettingCtrl.ShowUserId(true)
				SettingCtrl.ShowAccountLogin()
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGOUT_FAILED, function()
					return
				end, function()
					return
				end, true)
			end
		end)
	else
		UIManager.SendMessage("Loading", "SimpleLoading", false)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.UpdateUiSaveData()
	local tabIdx = SettingCfg.Pnl.SaveData
	local rowCnt = SettingCfg.Idx[tabIdx].Count
	local rowIdx = SettingCfg.Idx[tabIdx].Account
	local option = panels[tabIdx].item[rowIdx]

	if FS_UserData.playerList:GetUserId() == 1 then
		local btnLogout = option.btn[3]

		btnLogout.gameObject:SetActive(false)
	end
end

function SettingCtrl.ShowPanelAccount(show)
	if panelAccount and panelAccount.show ~= show then
		panelAccount.show = show

		panelAccount.go:SetActive(show)
	end
end

function SettingCtrl.ShowPanelLogin(show)
	local panelLogin = panelAccount.panels[SettingCtrl.PanelAccount.Login]

	if panelLogin and panelLogin.show ~= show then
		panelLogin.show = show

		panelLogin.go:SetActive(show)

		if show then
			UILayerCtrl.Push("AccountLogin")
		else
			UILayerCtrl.Pop()
		end
	end
end

function SettingCtrl.ShowPanelRegister(show)
	local panelRegister = panelAccount.panels[SettingCtrl.PanelAccount.Register]

	if panelRegister and panelRegister.show ~= show then
		if show == true then
			UILayerCtrl.Push(SettingCtrl.NNConfig)
		else
			UILayerCtrl.Pop()
		end

		panelRegister.show = show

		panelRegister.go:SetActive(show)
	end
end

function SettingCtrl.OnButtonSignInWithApple()
	if SettingCtrl.EnabledSignInWithApple then
		SettingCtrl.SignInWithApple()
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NOSUPPORT_MAC, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.OnButtonLogin(username, password)
	if AppVer == AppComReview and string.len(LS_Setting.GetNickname()) == 0 then
		SettingCtrl.ShowPanelAccount(false)
		SettingCtrl.ShowPanelRegister(true)
	end
end

function SettingCtrl.OnButtonLogout()
	if AppVer == AppComReview then
		-- block empty
	elseif SdkHelper.CheckAccountState() then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_CONFIRMLOGOUT, function()
			SettingCtrl.Logout()
		end, function()
			return
		end, false)
	elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_HUAWEI then
		-- block empty
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.OnButtonLoginWithAccount()
	if SdkHelper.IsInited() then
		SettingCtrl.ShowAccountLogin()
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.OnButtonChangeAccount()
	if SdkHelper.CheckAccountState() then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACCOUNT_CHANGE_CONFIRMATION, function()
			SettingCtrl.ChangeAccount()
		end, function()
			return
		end, false)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.OnButtonEditNickname(nickname)
	if type(nickname) == "string" and string.len(nickname) > 0 then
		SdkHelper.SetNickname(nickname, function(isSuccess, errCode, resJson)
			SystemHelper.LogError("测试创建昵称callback: " .. tostring(isSuccess) .. "  errCode:" .. tostring(errCode) .. "  json:" .. tostring(resJson))

			if isSuccess == true then
				if errCode == 0 then
					LS_Account.SetNickname(tostring(nickname))
					LS_Account.Update()
					SettingCtrl.UpdateRowAccount()
					SettingCtrl.SetUserId(LS_Account.userId, LS_Account.login, LS_Account.GetNickname())
					SettingCtrl.ShowUserId(true)
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_FEEDBACK_SUBMIT_SUCCEEDED, function()
						btnEditNickname.gameObject:SetActive(false)
						SettingCtrl.ShowPanelRegister(false)
						SettingCtrl.ShowPanelAccount(false)
					end, function()
						return
					end, true)
				else
					local errMsg = SystemHelper.ParseErrorCode(errCode)

					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
						return
					end, function()
						return
					end, true)
				end
			else
				local errMsg = SystemHelper.ParseErrorCode(errCode)

				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
					return
				end, function()
					return
				end, true)
			end
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CONTENT_IS_NULL, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.OnButtonRegister(username, password, verified)
	if type(username) == "string" and string.len(username) > 0 then
		if SdkHelper.IsInited() then
			SdkHelper.SetNickname(username, function(result, code, nickname)
				if result == true then
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_SUCCEEDED, function()
						LS_Setting.SetNickname(nickname)
						LS_Setting.Update()
						SettingCtrl.UpdateNickname()
						SettingCtrl.ShowPanelRegister(false)
						SettingCtrl.ShowPanelLogin(false)
						SettingCtrl.ShowPanelAccount(false)
					end, function()
						return
					end, true)
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_NETWORK_ERROR, function()
						return
					end, function()
						return
					end, true)
				end
			end)
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_UESRNAME_TIPS, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.ClosePanelBinding()
	SettingCtrl.ShowBinding(false)
end

function SettingCtrl.ShowBinding(show)
	if panelBinding ~= nil and panelBinding.show ~= show then
		panelBinding.show = show

		panelBinding.go:SetActive(show)

		if show then
			isShowingBinding = true

			UILayerCtrl.Push("Binding", nil)
		else
			isShowingBinding = false

			UILayerCtrl.Pop()
		end
	end
end

function SettingCtrl.OnButtonBinding(loginType)
	SystemHelper.Log(string.format("[ SettingCtrl.OnButtonBinding( %d ) ]", loginType))

	if SdkHelper.IsInited() == true then
		UIManager.SendMessage("Loading", "SimpleLoading", true)

		function onBindingCallback(success, code, accountId, loginType, nickname)
			if loginType == 3 then
				UIManager.SendMessage("Loading", "SimpleLoading", true)
			end

			UIManager.SendMessage("Loading", "SimpleLoading", false)
			SystemHelper.Log(string.format("[ OnBinding: %s ]", tostring(success)))
			SettingCtrl.ClosePanelBinding()

			if success == true then
				NI_Login.OnLogin(success, code, accountId, loginType, nickname)
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACCOUNT_BINDINGRESULT_SUCCESS, function()
					return
				end, function()
					return
				end, true)
			elseif code > 0 then
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", SystemHelper.ParseErrorCode(code), function()
					return
				end, function()
					return
				end, true)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACCOUNT_BINDINGRESULT_FAILURE, function()
					return
				end, function()
					return
				end, true)
			end
		end

		SdkHelper.Bind3rd(loginType, onBindingCallback)

		if loginType == 3 then
			UIManager.SendMessage("Loading", "SimpleLoading", false)
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_SDK_NETERR_OR_NOTINITED, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.GetLatestLocalSaveTime()
	local lastArcadeSaveTime = 0
	local lastSaveTime = 0
	local lastSaveSlot = LS_Setting.FindLastSaveSlot()

	if lastSaveSlot > 0 then
		local slotInfo = LS_Setting.GetSaveSlotInfo(lastSaveSlot)

		if slotInfo ~= nil then
			lastSaveTime = slotInfo[LS_Setting.SlotStatus.SaveTime]

			if lastSaveTime == nil then
				lastSaveTime = 0
			end
		else
			lastSaveTime = 0
		end
	end

	if DLC_Elena == true then
		local lastArcadeSaveSlot = LS_Setting.FindLastArcadeSaveSlot()

		if lastArcadeSaveSlot > 0 then
			local slotInfo = LS_Setting.GetArcadeSaveSlotInfo(lastArcadeSaveSlot)

			if slotInfo ~= nil then
				lastArcadeSaveTime = slotInfo[LS_Setting.SlotStatus.SaveTime]

				if lastArcadeSaveTime == nil then
					lastArcadeSaveTime = 0
				end
			else
				lastArcadeSaveTime = 0
			end
		end
	end

	if lastSaveTime < lastArcadeSaveTime then
		lastSaveTime = lastArcadeSaveTime
	end

	return lastSaveTime
end

function SettingCtrl.OnUpload(localSaveTimestamp)
	if SdkHelper.CheckAccountState() then
		UIManager.SendMessage("Loading", "SimpleLoading", true)

		local slotIdx = 1
		local version = ClientVersion.Version
		local settings = LS_Setting.Encode()
		local userId = LS_Account.userId
		local timestamp = TimeHelper.getUTC()
		local savedata = {}
		local count = 0
		local archives = "{"

		for slotIdx = 1, 3 do
			local separation = count > 0 and "," or ""

			archives = string.format("%s%s\"%d\":%s", archives, separation, slotIdx, LS_Game.GetSaveData(userId, slotIdx))
			count = count + 1
		end

		if DLC_Elena == true then
			local idxOffset = 3

			for slotIdx = 1, 10 do
				local separation = count > 0 and "," or ""

				archives = string.format("%s%s\"%d\":%s", archives, separation, idxOffset + slotIdx, LS_Game.GetSaveData(userId, slotIdx, true))
				count = count + 1
			end
		end

		archives = archives .. "}"

		local achievements, achievementsUpdate = LS_Achievement.Encode()

		SdkHelper.SaveAllDataToServer(achievementsUpdate, archives, settings, version, localSaveTimestamp, function(result, jsonStr)
			if result == true then
				local retData = json.decode(jsonStr)

				if retData ~= nil then
					if retData.success == true then
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_UPLOAD_SUCCEEDED, function()
							return
						end, function()
							return
						end, true)
					else
						local errMsg = SystemHelper.ParseErrorCode(retData.code)

						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
							return
						end, function()
							return
						end, true)
					end
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ERROR_DATA_DECODE, function()
						return
					end, function()
						return
					end, true)
				end
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_UPLOAD_FAILED, function()
					return
				end, function()
					return
				end, true)
			end

			UIManager.SendMessage("Loading", "SimpleLoading", false)
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
		UIManager.SendMessage("Loading", "SimpleLoading", false)
	end
end

function SettingCtrl.OnButtonUpload()
	if SdkHelper.CheckAccountState() then
		local localSaveCount = 0
		local userId = LS_Account.userId

		for idx = 1, 3 do
			local hasSaveData = LS_Game.IsReadable(userId, idx)

			if hasSaveData == true then
				localSaveCount = localSaveCount + 1
			end
		end

		if DLC_Elena == true then
			for idx = 1, 10 do
				local hasSaveData = LS_Game.IsReadable(userId, idx, true)

				if hasSaveData == true then
					localSaveCount = localSaveCount + 1
				end
			end
		end

		if localSaveCount > 0 then
			UIManager.SendMessage("Loading", "SimpleLoading", true)
			SdkHelper.GetAchievementTime(function(result, jsonStr)
				if result == true then
					local retData = json.decode(jsonStr)

					if retData ~= nil then
						if retData.success == true then
							local remoteSaveTime = retData.result
							local localSaveTime = this.GetLatestLocalSaveTime()

							if remoteSaveTime > 0 then
								local remoteFormattedTime = TimeHelper.ToShortDateString(remoteSaveTime)
								local localFormattedTime = TimeHelper.ToShortDateString(localSaveTime)
								local str = string.gsub(GameText.UI_UPLOAD_SAVEDATA_REQ2, "{1}", remoteFormattedTime)

								str = string.gsub(str, "{2}", localFormattedTime)

								UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", str, function()
									SettingCtrl.OnUpload(localSaveTime)
								end, function()
									return
								end, false)
							else
								SettingCtrl.OnUpload(localSaveTime)
							end
						else
							local errMsg = SystemHelper.ParseErrorCode(retData.code)

							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
								return
							end, function()
								return
							end, true)
						end
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ERROR_DATA_DECODE, function()
							return
						end, function()
							return
						end, true)
					end
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
						return
					end, function()
						return
					end, true)
				end

				UIManager.SendMessage("Loading", "SimpleLoading", false)
			end)
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOCAL_NO_SAVEDATA, function()
				return
			end, function()
				return
			end, true)
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.OnDownload()
	if SdkHelper.CheckAccountState() then
		UIManager.SendMessage("Loading", "SimpleLoading", true)

		local version = ClientVersion.Version

		SdkHelper.GetAllDataFromServer(version, function(result, jsonStr)
			if result == true then
				local retData = json.decode(jsonStr)

				if retData ~= nil then
					if retData.success == true then
						local userId = LS_Account.userId
						local data = retData.result
						local archives = json.decode(data.archives)
						local availableSaveCount = 0

						for slotIdx, slotData in pairs(archives) do
							if slotData.archive ~= nil and string.len(slotData.archive) > 0 then
								availableSaveCount = availableSaveCount + 1
							end
						end

						if availableSaveCount > 0 then
							LS_Setting.ClearSaveInfo()
							LS_Setting.SetUserId(userId)
							LS_Setting.Write(data.setting)
							LS_Setting.Load(userId)
							LS_Achievement.SetUserId(userId)
							LS_Achievement.SmartWrite(data.achievement)

							local saveSlotCount = 0
							local arcadeSlotCount = 0
							local achievementData = {}

							achievementData.achievement_finish = {}

							LS_Game.SetUserId(userId)

							for slotIdx, slotData in pairs(archives) do
								local slotIndex = tonumber(slotIdx)

								FS_UserData.Reset()

								if slotIndex < 4 then
									if slotData.archive ~= nil and string.len(slotData.archive) > 0 then
										LS_Game.Write(userId, slotIndex, slotData.archive)
										LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetKey(slotIndex))
										LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetDeltaKey(slotIndex))

										local value = json.decode(slotData.archive)
										local saveInfo, achievementFinishList = LS_Game.Decode(value)

										if achievementFinishList ~= nil then
											for _k, aid in pairs(achievementFinishList) do
												if not table.contains(achievementData.achievement_finish, aid) then
													table.insert(achievementData.achievement_finish, aid)
												end
											end
										end

										LS_Setting.SyncSaveSlotInfo(slotIndex, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.savetime, saveInfo.gamemode, saveInfo.roundcount)

										saveSlotCount = saveSlotCount + 1
									elseif LS_Game.IsReadable(userId, slotIndex) then
										local retStr = Recorder.read(LS_Game.GetKeyByUserAndSlot(userId, slotIndex))

										if retStr ~= nil and type(retStr) == "string" then
											local value = json.decode(retStr)
											local saveInfo, achievementFinishList = LS_Game.Decode(value)

											LS_Setting.SetLastSaveSlot(slotIndex)
											LS_Game.Update(true, nil, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.utctime, saveInfo.gamemode, saveInfo.roundcount)
											LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetKey(slotIndex))
											LS_PlayerBehavior.Delete(LS_PlayerBehavior.GetDeltaKey(slotIndex))
											LS_Setting.SyncSaveSlotInfo(slotIndex, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.savetime, saveInfo.gamemode, saveInfo.roundcount)

											saveSlotCount = saveSlotCount + 1
										else
											LS_Setting.EraseSaveSlot(slotIndex)
										end
									else
										LS_Setting.EraseSaveSlot(slotIndex)
									end
								elseif DLC_Elena == true then
									local aSlotIdx = slotIndex - 3

									if slotData.archive ~= nil and string.len(slotData.archive) > 0 then
										LS_Game.Write(userId, aSlotIdx, slotData.archive, true)

										local value = json.decode(slotData.archive)
										local saveInfo, achievementFinishList = LS_Game.Decode(value)

										if achievementFinishList ~= nil then
											for _k, aid in pairs(achievementFinishList) do
												if not table.contains(achievementData.achievement_finish, aid) then
													table.insert(achievementData.achievement_finish, aid)
												end
											end
										end

										LS_Setting.SyncSaveSlotInfo(aSlotIdx, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.savetime, saveInfo.gamemode, saveInfo.roundcount, false, true)

										arcadeSlotCount = arcadeSlotCount + 1
									elseif LS_Game.IsReadable(userId, aSlotIdx, true) then
										local retStr = Recorder.read(LS_Game.GetKeyByUserAndSlot(userId, aSlotIdx, true))

										if retStr ~= nil and type(retStr) == "string" then
											local value = json.decode(retStr)
											local saveInfo, achievementFinishList = LS_Game.Decode(value)

											LS_Setting.SetLastArcadeSaveSlot(aSlotIdx)
											LS_Game.UpdateArcade(true, nil, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.utctime, saveInfo.gamemode, saveInfo.roundcount, true)
											LS_Setting.SyncSaveSlotInfo(aSlotIdx, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.savetime, saveInfo.gamemode, saveInfo.roundcount, false, true)

											arcadeSlotCount = arcadeSlotCount + 1
										else
											LS_Setting.EraseArcadeSaveSlot(aSlotIdx)
										end
									else
										LS_Setting.EraseArcadeSaveSlot(aSlotIdx)
									end
								end
							end

							LS_Achievement.SmartWrite(achievementData)
							LS_Autosave.SetUserId(userId)

							if saveSlotCount > 0 then
								local lastSaveSlot = LS_Setting.FindLastSaveSlot()

								if lastSaveSlot > 0 then
									local slotInfo = LS_Setting.GetSaveSlotInfo(lastSaveSlot)
									local retStr = Recorder.read(LS_Game.GetKey(lastSaveSlot))

									if retStr and type(retStr) == "string" then
										FS_UserData.Reset()
										LS_Setting.SetLastSaveSlot(lastSaveSlot)

										local val = json.decode(retStr)

										LS_Autosave.Decode(val)
										LS_Autosave.Update(true, nil, slotInfo[LS_Setting.SlotStatus.Location], slotInfo[LS_Setting.SlotStatus.Level], slotInfo[LS_Setting.SlotStatus.PlayTime], slotInfo[LS_Setting.SlotStatus.SaveTime], slotInfo[LS_Setting.SlotStatus.SaveTime], slotInfo[LS_Setting.SlotStatus.GameMode], slotInfo[LS_Setting.SlotStatus.RoundCount])
										BattleData.SetHeroId(0)
									else
										LS_Setting.EraseSaveSlot(LS_Setting.IndexAutosave)
									end
								else
									LS_Setting.EraseSaveSlot(LS_Setting.IndexAutosave)
								end
							else
								LS_Setting.EraseSaveSlot(LS_Setting.IndexAutosave)
							end

							FS_UserData.Reset()
							LS_Setting.Update()
							UIManager.SendMessage("LobbyMain", "RevalidateTitle")
							UIManager.SendMessage("LobbyMain", "RevalidateNewGame")
							UIManager.SendMessage("LobbyMain", "RevalidateLoadGame")
							UIManager.RefreshLanguage()
							this.RefreshNavBar()

							local btnText = this.mainComponent:GetText("Settings_Save_Account_Button_SignInWithApple_Text")

							btnText:SetGameTextContent(function()
								return GameText.UI_DO_LOGIN
							end)

							btnText = this.mainComponent:GetText("Settings_Save_Account_Button_SignOut_Text")

							btnText:SetGameTextContent(function()
								return GameText.UI_DO_LOGIN
							end)
							UnityEngine.Canvas.ForceUpdateCanvases()
							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_DOWNLOAD_SUCCEEDED, function()
								return
							end, function()
								return
							end, true)
						else
							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NO_SAVEDATA, function()
								return
							end, function()
								return
							end, true)
						end
					else
						local errMsg = SystemHelper.ParseErrorCode(retData.code)

						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
							return
						end, function()
							return
						end, true)
					end
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ERROR_DATA_DECODE, function()
						return
					end, function()
						return
					end, true)
				end
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_DOWNLOAD_FAILED, function()
					return
				end, function()
					return
				end, true)
			end

			UIManager.SendMessage("Loading", "SimpleLoading", false)
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
		UIManager.SendMessage("Loading", "SimpleLoading", false)
	end
end

function SettingCtrl.OnButtonDownload()
	if SdkHelper.CheckAccountState() then
		UIManager.SendMessage("Loading", "SimpleLoading", true)
		SdkHelper.GetAchievementTime(function(result, jsonStr)
			if result == true then
				local retData = json.decode(jsonStr)

				if retData ~= nil then
					if retData.success == true then
						local remoteSaveTime = retData.result

						if remoteSaveTime > 0 then
							local localSaveTime = this.GetLatestLocalSaveTime()

							if localSaveTime > 0 then
								local remoteFormattedTime = TimeHelper.ToShortDateString(remoteSaveTime)
								local localFormattedTime = TimeHelper.ToShortDateString(localSaveTime)
								local str = string.gsub(GameText.UI_DOWNLOAD_SAVEDATA_REQ2, "{1}", remoteFormattedTime)

								str = string.gsub(str, "{2}", localFormattedTime)

								UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", str, function()
									SettingCtrl.OnDownload()
								end, function()
									return
								end, false)
							else
								SettingCtrl.OnDownload()
							end
						else
							UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NO_SAVEDATA, function()
								return
							end, function()
								return
							end, true)
						end
					else
						local errMsg = SystemHelper.ParseErrorCode(retData.code)

						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", errMsg, function()
							return
						end, function()
							return
						end, true)
					end
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ERROR_DATA_DECODE, function()
						return
					end, function()
						return
					end, true)
				end
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
					return
				end, function()
					return
				end, true)
			end

			UIManager.SendMessage("Loading", "SimpleLoading", false)
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function SettingCtrl.ShowTempGuide(tutorialId, itemId)
	local tData = MS_StoryGuideSort.GetGuidePage(tutorialId)

	if tData == nil then
		return
	end

	local text

	if itemId then
		guide.isGetDucument = true

		if guide.getDucumentTimer then
			guide.getDucumentTimer:Reset(function()
				guide.isGetDucument = false
			end, 6, 1, true)
		else
			guide.getDucumentTimer = Timer.New(function()
				guide.isGetDucument = false
			end, 6, 1, true)
		end

		guide.getDucumentTimer:Start()

		local itemName = MS_ItemData.GetItemName(itemId)

		text = "{79}" .. tData.DescriptionJoystick .. itemName

		MainmenuCtrl.ShowGuideLeft(tData.HeroId, text, true)
	elseif Common.IsJoystickAttached() then
		text = tData.DescriptionJoystick

		MainmenuCtrl.ShowGuideLeft(tData.HeroId, text, true)
	else
		text = tData.DescriptionTouch

		MainmenuCtrl.ShowGuideLeft(tData.HeroId, text, false)
	end
end

function SettingCtrl.CalcIncrVal()
	if lastSetValTime > 0 and TimeHelper.getNowTimeNoScale() - lastSetValTime > 0.35 then
		lastSetValTime = -1
		lastStepTime = -1
		dIncrValue = 1
	end

	if lastStepTime < 0 then
		lastStepTime = TimeHelper.getNowTimeNoScale()
		dIncrValue = 1
		lastSetValTime = lastStepTime
	else
		local deltaTime = TimeHelper.getNowTimeNoScale() - lastStepTime

		if deltaTime >= 0.25 then
			lastStepTime = TimeHelper.getNowTimeNoScale()

			if dIncrValue < dStepValueMax then
				dIncrValue = dIncrValue + 1
			end

			lastSetValTime = lastStepTime
		else
			lastSetValTime = TimeHelper.getNowTimeNoScale()
		end
	end
end

function SettingCtrl.CalcValidVal(val, step, valMax)
	local ret = val + step

	if step > 0 and valMax < ret then
		ret = valMax
	end

	return ret
end

function SettingCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == SettingCfg.Sub[LS_Setting.InputMode.KM][1] then
		local remainingTime = delayInteractiveTimeCount - TimeHelper.getNowTimeNoScale()

		if remainingTime <= 0 then
			local mode = LS_Setting.InputMode.KM
			local panel = panelInputCfg[mode].panel
			local duration = 0

			if startTimeHoldingButton ~= 0 then
				duration = TimeHelper.getNowTimeNoScale() - startTimeHoldingButton
			end

			if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
				SettingCtrl.CloseKmConfig()
			elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnCursorClick()
			elseif inputMgr:GetButtonDown(GBKey.X) or inputMgr:GetKeyDown(XKeyCode.Y) then
				SettingCtrl.RequestResetKMConfig()
			end
		end
	elseif lName == SettingCfg.Sub[LS_Setting.InputMode.TP][1] then
		if inputMgr:GetButtonUp(GBKey.B) then
			this.CloseInputConfiguration(LS_Setting.InputMode.TP)
		end
	elseif lName == SettingCfg.Sub[LS_Setting.InputMode.GP][1] then
		local remainingTime = delayInteractiveTimeCount - TimeHelper.getNowTimeNoScale()

		if remainingTime <= 0 then
			if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
				this.CloseInputConfiguration(LS_Setting.InputMode.GP)
			elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnCursorClick()
			elseif inputMgr:GetKeyDown(XKeyCode.Y) then
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_REQ_RESET_GAMEPAD_CONFIG, function()
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_REQ_DOUBLE_CONFIRMATION, function()
						this.ResetGamePadConfig()
					end, function()
						UILayerCtrl.ForceUpdate(0.7)
					end, false)
				end, function()
					return
				end, false)
			end
		end

		local mode = LS_Setting.InputMode.GP
		local panel = panelInputCfg[mode].panel

		if inputMgr:GetButtonDown(LS_Setting.Btn.L1) then
			panel.btnPressedL1 = true
		end

		if inputMgr:GetButtonDown(LS_Setting.Btn.R1) then
			panel.btnPressedR1 = true
		end

		if inputMgr:GetButtonDown(LS_Setting.Btn.BX) then
			panel.btnPressedBX = true
		end

		if panel.btnPressedL1 and inputMgr:GetButton(LS_Setting.Btn.L1) then
			panel.btnPressedL1 = false
			panel.btnHoldL1 = true
		end

		if panel.btnPressedR1 and inputMgr:GetButton(LS_Setting.Btn.R1) then
			panel.btnPressedR1 = false
			panel.btnHoldR1 = true
		end

		if panel.btnPressedBX and inputMgr:GetButton(LS_Setting.Btn.BX) then
			panel.btnPressedBX = false
			panel.btnHoldBX = true
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.C1) then
			-- block empty
		elseif panel.btnHoldL1 and panel.btnHoldR1 and inputMgr:GetButtonUp(LS_Setting.Btn.BX) or panel.btnHoldL1 and panel.btnHoldBX and inputMgr:GetButtonUp(LS_Setting.Btn.R1) or panel.btnHoldR1 and panel.btnHoldBX and inputMgr:GetButtonUp(LS_Setting.Btn.L1) then
			panel.btnHoldL1 = false
			panel.btnHoldR1 = false
			panel.btnHoldBX = false

			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_REQ_RESET_GAMEPAD_CONFIG, function()
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_REQ_DOUBLE_CONFIRMATION, function()
					this.ResetGamePadConfig()
				end, function()
					UILayerCtrl.ForceUpdate(0.7)
				end, false)
			end, function()
				return
			end, false)
		end
	elseif lName == SettingCtrl.InputDiagram then
		if inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetButtonUp(LS_Setting.Btn.C1) then
			UILayerCtrl.OnCursorClick()
		end
	elseif lName == SettingCtrl.KMConfig then
		this.UpdateKmModConfig()
	elseif lName == SettingCtrl.GPConfig then
		this.UpdateGpModConfig()
	elseif lName == "GamePadSel" then
		this.UpdateGamePadSel()
	elseif lName == "AccountLogin" then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			UILayerCtrl.OnButtonClick("Setting_Account_BtnBack")
		elseif not inputMgr:GetButtonDown(GBKey.A) and inputMgr:GetKeyConfirmDown() then
			-- block empty
		end
	elseif lName == "Account" then
		-- block empty
	elseif lName == SettingCtrl.NNConfig then
		-- block empty
	elseif lName ~= "MsgBoxSimple" then
		if inputMgr:GetButtonDown(LS_Setting.Btn.L2) or inputMgr:GetKeyL2Down() then
			local nextTabIndex = this.GetNextTabIndex(SettingCtrl.DirSel.L)

			UILayerCtrl.Pop()
			this.SelectTab(nextTabIndex, panels[nextTabIndex].rowIdx)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		elseif inputMgr:GetButtonDown(LS_Setting.Btn.R2) or inputMgr:GetKeyR2Down() then
			local nextTabIndex = this.GetNextTabIndex(SettingCtrl.DirSel.R)

			UILayerCtrl.Pop()
			this.SelectTab(nextTabIndex, panels[nextTabIndex].rowIdx)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			if tabIndex == SettingCfg.Pnl.Control and rowIndex == SettingCfg.Idx[SettingCfg.Pnl.Control].InputConfiguration then
				UILayerCtrl.OnCursorClick()
			elseif tabIndex == SettingCfg.Pnl.SaveData then
				if AppVer == AppComReview then
					UILayerCtrl.OnCursorClick()
				else
					UILayerCtrl.OnCursorClick()
				end
			end
		elseif inputMgr:GetButtonDown(GBKey.B) then
			if this.loadFinish and panelInputCfg then
				UILayerCtrl.OnButtonClick("Setting_Buttom_Back")
			end
		elseif isFromGame and inputMgr:GetButtonDown(LS_Setting.Btn.C1) then
			if this.loadFinish and panelInputCfg then
				UILayerCtrl.OnButtonClick("Setting_Buttom_Back")
			end
		elseif isFromGame and inputMgr:GetButtonDown(LS_Setting.Btn.C2) and (Platform == PlatformType.IOS or Platform == PlatformType.TVOS) then
			if inputMgr:GetJoystickType() == InputManager.AppleMFiCertified and this.loadFinish and panelInputCfg then
				UILayerCtrl.OnButtonClick("Setting_Buttom_Back")
			end
		elseif inputMgr:GetButtonDown(LS_Setting.Btn.BX) or inputMgr:GetKeyDown(XKeyCode.Y) then
			UILayerCtrl.OnButtonClick("Setting_Main_BtnQuit_B")
		end
	end
end

function SettingCtrl.DPadLongPress(pos)
	SettingCtrl.DPadPress(pos)
end

function SettingCtrl.JPadLongPress(pos)
	SettingCtrl.JPadPress(pos)
end

function SettingCtrl.JPadPress(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == SettingCfg.UiName[SettingCfg.Pnl.Basic] then
		local tabIdx = SettingCfg.Pnl.Basic

		if dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN then
			local panel = panels[tabIdx]

			if panel then
				UILayerCtrl.Select(dir)

				local gap = 0
				local showCount = 9
				local btnCnt = 11
				local screenWidth = SystemHelper.GetScreenWidth()
				local screenHeight = SystemHelper.GetScreenHeight()
				local screenRatio = screenWidth / screenHeight

				if screenRatio > 1.59 and screenRatio < 1.77 then
					panel.showCount = 10
				elseif screenRatio >= 1 and screenRatio <= 1.59 then
					panel.showCount = 11
				end

				local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, panel.rowIndex, btnCnt, panel.selIndex, showCount, gap, true)

				if normalizedY >= 0 then
					panel.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(panel.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
				end

				panel.rowIndex = nextIndex
				panel.selIndex = selIndex
				panel.rowPrevious = prevIndex
				panel.sel[panel.rowPrevious].alpha = 0
				panel.sel[panel.rowIndex].alpha = 1

				this.SelectRow(tabIdx, nextIndex)
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
				SettingCtrl.EnableOptionButtons(tabIdx, SettingCfg.Idx[tabIdx].GraphicsFrameRate, LS_Setting.graphics.vsync == 0)
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].Resolution then
			local idxOneOp = SettingCtrl.ItemData.OneOp
			local comNames = SettingCfg.Tab[tabIdx][rowIndex][idxOneOp]

			if dir == XButton.Adjacent.LEFT then
				UILayerCtrl.OnButtonClick(comNames[1])
			elseif dir == XButton.Adjacent.RIGHT then
				UILayerCtrl.OnButtonClick(comNames[2])
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].GraphicsFrameRate then
			if LS_Setting.graphics.vsync == 0 then
				UILayerCtrl.Select(dir)
				UILayerCtrl.OnCursorClick()
			else
				SystemHelper.LogError("Ignore................")
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].GraphicsBrightness then
			local option = panels[tabIndex].item[rowIndex]
			local value = option.txt
			local slider = option.com
			local newVal = cached[tabIndex][rowIndex]

			if dir == XButton.Adjacent.LEFT then
				if newVal > slider.minValue then
					this.CalcIncrVal()

					newVal = this.CalcValidVal(newVal, -dIncrValue, slider.minValue)
				end
			elseif dir == XButton.Adjacent.RIGHT and newVal < slider.maxValue then
				this.CalcIncrVal()

				newVal = this.CalcValidVal(newVal, dIncrValue, slider.maxValue)
			end

			slider.value = newVal

			if value then
				value:SetContent(newVal)
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].GraphicsFieldOfView then
			local option = panels[tabIndex].item[rowIndex]
			local value = option.txt
			local slider = option.com
			local newVal = cached[tabIndex][rowIndex]

			if dir == XButton.Adjacent.LEFT then
				if newVal > slider.minValue then
					this.CalcIncrVal()

					newVal = this.CalcValidVal(newVal, -dIncrValue, slider.minValue)
				end
			elseif dir == XButton.Adjacent.RIGHT and newVal < slider.maxValue then
				this.CalcIncrVal()

				newVal = this.CalcValidVal(newVal, dIncrValue, slider.maxValue)
			end

			slider.value = newVal

			if value then
				value:SetContent(newVal)
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].GraphicsAntiAliasing then
			local idxOneOp = SettingCtrl.ItemData.OneOp
			local comNames = SettingCfg.Tab[tabIdx][rowIndex][idxOneOp]

			if dir == XButton.Adjacent.LEFT then
				UILayerCtrl.OnButtonClick(comNames[1])
			elseif dir == XButton.Adjacent.RIGHT then
				UILayerCtrl.OnButtonClick(comNames[2])
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].GraphicsReflection then
			local idxOneOp = SettingCtrl.ItemData.OneOp
			local comNames = SettingCfg.Tab[tabIdx][rowIndex][idxOneOp]

			if dir == XButton.Adjacent.LEFT then
				UILayerCtrl.OnButtonClick(comNames[1])
			elseif dir == XButton.Adjacent.RIGHT then
				UILayerCtrl.OnButtonClick(comNames[2])
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].GraphicsAmbientOcclusion then
			local idxOneOp = SettingCtrl.ItemData.OneOp
			local comNames = SettingCfg.Tab[tabIdx][rowIndex][idxOneOp]

			if dir == XButton.Adjacent.LEFT then
				UILayerCtrl.OnButtonClick(comNames[1])
			elseif dir == XButton.Adjacent.RIGHT then
				UILayerCtrl.OnButtonClick(comNames[2])
			end
		else
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorClick()
		end
	elseif lName == SettingCfg.UiName[SettingCfg.Pnl.Sounds] then
		if dir == XButton.Adjacent.UP then
			UILayerCtrl.Select(dir)

			local nextRowIndex = (rowIndex - 2 + rowMaxCount) % rowMaxCount + 1

			this.SelectRow(SettingCfg.Pnl.Sounds, nextRowIndex)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
		elseif dir == XButton.Adjacent.DOWN then
			UILayerCtrl.Select(dir)

			local nextRowIndex = rowIndex % rowMaxCount + 1

			this.SelectRow(SettingCfg.Pnl.Sounds, nextRowIndex)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
		else
			local option = panels[tabIndex].item[rowIndex]
			local value = option.txt
			local slider = option.com
			local newVal = cached[tabIndex][rowIndex]

			if dir == XButton.Adjacent.LEFT then
				if newVal > 0 then
					this.CalcIncrVal()

					newVal = this.CalcValidVal(newVal, -dIncrValue, 0)
				end
			elseif dir == XButton.Adjacent.RIGHT and newVal < 100 then
				this.CalcIncrVal()

				newVal = this.CalcValidVal(newVal, dIncrValue, 100)
			end

			slider.value = newVal

			if value then
				value:SetContent(newVal)
			end
		end
	elseif lName == SettingCfg.UiName[SettingCfg.Pnl.Control] then
		if dir == XButton.Adjacent.UP then
			UILayerCtrl.Select(dir)

			local nextRowIndex = (rowIndex - 2 + rowMaxCount) % rowMaxCount + 1

			this.SelectRow(SettingCfg.Pnl.Control, nextRowIndex)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
		elseif dir == XButton.Adjacent.DOWN then
			UILayerCtrl.Select(dir)

			local nextRowIndex = rowIndex % rowMaxCount + 1

			this.SelectRow(SettingCfg.Pnl.Control, nextRowIndex)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
		else
			local panel = panels[SettingCfg.Pnl.Control]

			if rowIndex == SettingCfg.Idx[tabIndex].CamSensitivity then
				local value = panel.item[rowIndex].txt
				local slider = panel.item[rowIndex].com
				local newVal = LS_Setting.sensitivity

				if dir == XButton.Adjacent.LEFT then
					if newVal > slider.minValue then
						this.CalcIncrVal()

						newVal = this.CalcValidVal(newVal, -dIncrValue, slider.minValue)
					end
				elseif dir == XButton.Adjacent.RIGHT and newVal < slider.maxValue then
					this.CalcIncrVal()

					newVal = this.CalcValidVal(newVal, dIncrValue, slider.maxValue)
				end

				slider.value = newVal

				if value then
					value:SetContent(newVal)
				end
			elseif rowIndex == SettingCfg.Idx[tabIndex].InputConfiguration then
				local currentBtnIdx = LS_Setting.lastSetInput
				local numOfInputMethods = LS_Setting.numOfInputMethods

				if dir == XButton.Adjacent.LEFT then
					if currentBtnIdx > 1 then
						currentBtnIdx = currentBtnIdx - 2

						if currentBtnIdx < 1 then
							currentBtnIdx = 1
						end

						UILayerCtrl.Select(dir)
					end
				elseif dir == XButton.Adjacent.RIGHT and currentBtnIdx < numOfInputMethods then
					currentBtnIdx = currentBtnIdx + 2

					if currentBtnIdx < 3 then
						currentBtnIdx = 3
					end

					UILayerCtrl.Select(dir)
				end

				local tabIdx = SettingCfg.Pnl.Control
				local rowIdx = SettingCfg.Idx[tabIdx].InputConfiguration
				local option = panel.item[rowIdx]

				option.sel[LS_Setting.lastSetInput]:SetActive(false)
				option.sel[currentBtnIdx]:SetActive(true)

				LS_Setting.lastSetInput = currentBtnIdx
				cached[tabIdx][rowIdx] = currentBtnIdx

				UILayerCtrl.OnCursorMove()
			else
				UILayerCtrl.Select(dir)
				UILayerCtrl.OnCursorClick()
			end
		end
	elseif lName == SettingCfg.UiName[SettingCfg.Pnl.Gameplay] then
		local tabIdx = SettingCfg.Pnl.Gameplay

		if dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN then
			local dirVal = dir - 1.5 > 0 and 1 or -1
			local nextRowIndex = (rowIndex - 1 + dirVal + rowMaxCount) % rowMaxCount + 1

			if (not isFromGame or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge)) and (nextRowIndex == rowMaxCount or nextRowIndex == rowMaxCount - 1) then
				local rowIdx = SettingCfg.Idx[tabIdx].GameMode
				local option = panels[tabIdx].item[rowIdx]

				if dirVal > 0 then
					nextRowIndex = 1
				elseif dirVal < 0 then
					nextRowIndex = rowMaxCount - 2
				end

				UILayerCtrl.Select(dir)
			end

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
				if dirVal > 0 then
					if nextRowIndex == rowMaxCount - 1 then
						nextRowIndex = rowMaxCount
					end
				elseif dirVal < 0 and nextRowIndex == rowMaxCount - 1 then
					nextRowIndex = rowMaxCount - 2
				end
			elseif not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
				if dirVal > 0 then
					if nextRowIndex == rowMaxCount then
						nextRowIndex = 1
					end
				elseif dirVal < 0 and nextRowIndex == rowMaxCount then
					nextRowIndex = rowMaxCount - 1
				end
			end

			this.SelectRow(tabIdx, nextRowIndex)
			UILayerCtrl.Select(dir)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
		elseif rowIndex == SettingCfg.Idx[tabIdx].Language then
			local idxOneOp = SettingCtrl.ItemData.OneOp
			local comNames = SettingCfg.Tab[tabIdx][rowIndex][idxOneOp]

			if dir == XButton.Adjacent.LEFT then
				UILayerCtrl.OnButtonClick(comNames[1])
			elseif dir == XButton.Adjacent.RIGHT then
				UILayerCtrl.OnButtonClick(comNames[2])
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].Subtitle then
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorClick()
		elseif rowIndex == SettingCfg.Idx[tabIdx].GameMode then
			local currentGameMode = FS_UserData.story:GetDifficulty()

			if currentGameMode == BattleData.GlobalDifficultyLevel.Casual then
				-- block empty
			else
				UILayerCtrl.Select(dir)
				UILayerCtrl.OnCursorClick()

				if sceneController == nil then
					sceneController = ST_Main.GetSceneController()
				end

				if sceneController then
					sceneController:JoystickForDPadTouchEnd()
				end
			end
		elseif rowIndex == SettingCfg.Idx[tabIdx].TimeAndScore then
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorClick()
		end
	elseif lName == SettingCfg.UiName[SettingCfg.Pnl.SaveData] then
		local pnlIdx = SettingCfg.Pnl.SaveData

		if dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN then
			local dirVal = dir - 1.5 > 0 and 1 or -1
			local nextRowIndex = (rowIndex - 1 + dirVal + rowMaxCount) % rowMaxCount + 1

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
			this.SelectRow(pnlIdx, nextRowIndex)
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorMove()
		else
			local dirVal = dir - 3.5 > 0 and 1 or -1

			if rowIndex == SettingCfg.Idx[pnlIdx].Account then
				SystemHelper.Log("inhibited")
			elseif rowIndex == SettingCfg.Idx[pnlIdx].CloudData then
				local colMaxCount = 2
				local nextColIndex = (rowIndex - 1 + dirVal + colMaxCount) % colMaxCount + 1

				UILayerCtrl.Select(dir)
				UILayerCtrl.OnCursorMove()

				cached[pnlIdx][rowIndex] = nextColIndex
				panels[pnlIdx].last = UILayerCtrl.GetCurrentButtonName()
			end
		end
	elseif lName == SettingCfg.UiName[SettingCfg.Pnl.Guide] then
		this.UpdateSelectRowInGuideBook(dir)
	elseif lName == SettingCfg.Sub[LS_Setting.InputMode.TP][1] then
		UILayerCtrl.OnCursorClick()
	elseif lName == SettingCfg.Sub[LS_Setting.InputMode.KM][1] then
		this.UpdateSelectRowInInputCfgKM(LS_Setting.InputMode.KM, dir)
	elseif lName == SettingCfg.Sub[LS_Setting.InputMode.GP][1] then
		this.UpdateSelectRowInInputCfgGP(LS_Setting.InputMode.GP, dir)
	elseif lName == SettingCtrl.NNConfig then
		-- block empty
	else
		UILayerCtrl.OnCursorMove()
	end
end

function SettingCtrl.DPadPress(dir)
	if UILayerCtrl.IsProcessed() then
		return
	end

	SettingCtrl.JPadPress(dir)
end

function SettingCtrl.Update()
	SettingCtrl.IsUiLoaded()

	if not this.loadFinish or panelInputCfg == nil or loaderKmCfg ~= nil and not loaderKmCfg.loadFinished then
		return
	end

	if delayAutoAdaption > 0 then
		delayAutoAdaption = delayAutoAdaption - 1

		if delayAutoAdaption == 0 then
			this.RevalidateInputLayoutsForTouchScreen()
		end
	end

	isJoystickAttached = LS_Setting.isJoystickConnected
	isKeyboardConnected = LS_Setting.isKeyboardConnected
	isMouseConnected = LS_Setting.isMouseConnected

	UILayerCtrl.PostUpdate()
	this.GamePadControl()
end

function SettingCtrl.ShowCtrlVibOption(show)
	return
end

function SettingCtrl.ResizeGuideList()
	local screenWidth = SystemHelper.GetScreenWidth()
	local screenHeight = SystemHelper.GetScreenHeight()
	local screenRatio = screenWidth / screenHeight
	local tabIdx = SettingCfg.Pnl.Guide
	local panelGuide = panels[tabIdx]

	if panelGuide ~= nil then
		panelGuide.showCount = 8

		if screenRatio > 1.59 and screenRatio < 1.77 then
			panelGuide.showCount = 9
		elseif screenRatio > 1.34 and screenRatio <= 1.59 then
			panelGuide.showCount = 10
		elseif screenRatio >= 1 and screenRatio <= 1.34 then
			panelGuide.showCount = 12
		end

		local rectTf = panelGuide.rectTf
		local rect = rectTf.rect

		rectTf.sizeDelta = Vector2.New(rect.width, 51 * panelGuide.showCount + 9 * (panelGuide.showCount + 1))
		panelGuide.rectTf = rectTf
	end

	local tabIdx = SettingCfg.Pnl.Basic
	local panel = panels[tabIdx]

	if panel ~= nil then
		panel.showCount = 9

		if screenRatio > 1.59 and screenRatio < 1.77 then
			panel.showCount = 10
		elseif screenRatio >= 1 and screenRatio <= 1.59 then
			panel.showCount = 11
		end

		local rectTf = panel.rectTf
		local rect = rectTf.rect

		rectTf.sizeDelta = Vector2.New(rect.width, 20 + 52 * panel.showCount + 2 * (panel.showCount + 1))
		panel.rectTf = rectTf
	end

	local mode = LS_Setting.InputMode.KM
	local panel = panelInputCfg[mode].panel

	if panel ~= nil then
		panel.showCount = 9

		if screenRatio > 1.59 and screenRatio < 1.77 then
			panel.showCount = 10
		elseif screenRatio > 1.34 and screenRatio <= 1.59 then
			panel.showCount = 11
		elseif screenRatio >= 1 and screenRatio <= 1.34 then
			panel.showCount = 13
		end

		local rectTf = panel.rectTf
		local rect = rectTf.rect

		rectTf.sizeDelta = Vector2.New(rect.width, 51 * panel.showCount + 9 * (panel.showCount + 1))
		panel.rectTf = rectTf
	end
end

function SettingCtrl.ExternalEvent(hasJoystick)
	isJoystickAttached = LS_Setting.IsJoystickConnected()
	isKeyboardConnected = LS_Setting.IsKeyboardConnected()
	isMouseConnected = LS_Setting.IsMouseConnected()

	this.RefreshNavBar()
	this.SetGuideBookPage(panelGuide.rowIndex)
end

function SettingCtrl.Close()
	if loaderGuide then
		loaderGuide:ClearTemplate()
	end

	if loaderKmCfg then
		loaderKmCfg:ClearTemplate()
	end

	UICtrlBase.Close("Setting")
end

function SettingCtrl.ShowPanelGamePadSel(show)
	if panelGamePadSel and panelGamePadSel.show ~= show then
		panelGamePadSel.show = show

		panelGamePadSel.go:SetActive(show)

		if show then
			UILayerCtrl.Push("GamePadSel")
		else
			UILayerCtrl.Pop()
		end
	end
end

function SettingCtrl.UpdateGamePadSel()
	return
end

function SettingCtrl.UpdateRowAccount()
	local tabIdx = SettingCfg.Pnl.SaveData
	local panel = panels[tabIdx]

	if panel ~= nil then
		local userId = LS_Account.userId
		local rowUser = panel.item[1]
		local rowSave = panel.item[2]

		if SdkHelper.IsInited() then
			if SdkHelper.IsSdkLogined() then
				if string.len(userId) > 1 then
					rowUser.btn[1].gameObject:SetActive(false)
					rowUser.btn[2].gameObject:SetActive(false)
					rowUser.btn[3].gameObject:SetActive(true)
				else
					rowUser.btn[1].gameObject:SetActive(true)
					rowUser.btn[2].gameObject:SetActive(false)
					rowUser.btn[3].gameObject:SetActive(false)
				end
			elseif string.len(userId) > 1 then
				rowUser.btn[1].gameObject:SetActive(false)
				rowUser.btn[2].gameObject:SetActive(false)
				rowUser.btn[3].gameObject:SetActive(true)
			else
				rowUser.btn[1].gameObject:SetActive(true)
				rowUser.btn[2].gameObject:SetActive(false)
				rowUser.btn[3].gameObject:SetActive(false)
			end
		else
			rowUser.btn[1].gameObject:SetActive(true)
			rowUser.btn[2].gameObject:SetActive(false)
			rowUser.btn[3].gameObject:SetActive(false)
		end

		rowUser.btn[3]:SetDisabled(true)
		SettingCtrl.UpdateNickname()
	end
end

function SettingCtrl.UpdateNickname()
	if btnEditNickname ~= nil then
		local nickname = LS_Account.GetNickname()

		if nickname ~= nil and type(nickname) == "string" then
			btnEditNickname.gameObject:SetActive(string.len(nickname) == 0)
		end
	end
end

function SettingCtrl.RefreshGuideLanguage()
	if panelGuide then
		SettingCtrl.RevalidateGuideBookList()
		SettingCtrl.SetGuideBookPage(panelGuide.rowIndex)
	end
end

function SettingCtrl.GetNavIndices(btnIndex, maxCount)
	local idxPrev = (btnIndex - 2 + maxCount) % maxCount + 1
	local idxNext = btnIndex % maxCount + 1

	return idxPrev, idxNext
end

function SettingCtrl.ShowTabAccount(show)
	local tabIdx = SettingCfg.Pnl.SaveData

	if SettingCfg.EnTabs[tabIdx] == false then
		return
	end

	if AppVer == AppAppleLight or AppVer == AppCJ2020 or AppVer == AppTapTapEA then
		return
	end

	if panels ~= nil then
		local panel = panels[tabIdx]

		if panel ~= nil then
			panel.show = show

			panel.btnSel.gameObject:SetActive(show)
		end

		local enabledTabs = SettingCfg.EnTabs
		local totalTabCount = table.nums(enabledTabs)
		local actualTabCount = 0

		for tabIdx = 1, totalTabCount do
			actualTabCount = actualTabCount + (enabledTabs[tabIdx] and 1 or 0)
		end

		local flagL = false
		local flagR = false
		local count = 0

		for tabIdx = 1, totalTabCount do
			local panel = panels[tabIdx]

			count = count + 1

			if not flagL and enabledTabs[tabIdx] then
				flagL = true
				panel.cgIconL.alpha = 1
				panel.cgIconR.alpha = 0
			elseif not flagR and enabledTabs[tabIdx] and count == actualTabCount then
				flagR = true
				panel.cgIconL.alpha = 0
				panel.cgIconR.alpha = 1
			else
				panel.cgIconL.alpha = 0
				panel.cgIconR.alpha = 0
			end
		end
	end
end

function SettingCtrl.ShowButtonBindingTapTap(show)
	if btnBindingTapTap ~= nil then
		btnBindingTapTap.gameObject:SetActive(show)
	end
end

function SettingCtrl.ShowButtonUnbindingTapTap(show)
	if btnUnbindingTapTap ~= nil then
		btnUnbindingTapTap.gameObject:SetActive(show)
	end
end

function SettingCtrl.ShowTapTapUserName(show)
	if textTapTapUserName ~= nil then
		textTapTapUserName.gameObject:SetActive(show)
	end
end

function SettingCtrl.SetTapTapUserName(username)
	if textTapTapUserName ~= nil then
		textTapTapUserName:SetContent(username)
	end
end

function SettingCtrl.ShowButtonDeleteAccount(show)
	if btnUnbindingTapTap ~= nil then
		btnUnbindingTapTap.gameObject:SetActive(show)
	end
end

function SettingCtrl.RefreshNavBar()
	if kmNavBarRectTf == nil then
		kmNavBarRectTf = this.mainComponent:GetGameObject("Setting_KMC_PnlBtm_RB"):GetComponent("RectTransform")
	end

	if gpNavBarRectTf == nil then
		gpNavBarRectTf = this.mainComponent:GetGameObject("Setting_GPC_PnlBtm_RB"):GetComponent("RectTransform")
	end

	if kmNavBarRectTf then
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(kmNavBarRectTf)
	end

	if gpNavBarRectTf then
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gpNavBarRectTf)
	end
end

return SettingCtrl
