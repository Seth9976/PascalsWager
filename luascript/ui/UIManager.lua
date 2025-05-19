-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/UIManager.lua

UIManager = {}

local this = UIManager
local ctrlList = {}

UIManager.AssetBundle = {
	Common = "common",
	Lobby = "lobby",
	Start = "start",
	Main = "main"
}
UIManager.GlobalUI = {
	"Loading",
	"MsgBoxSimple",
	"Captured"
}
UIManager.InputDevice = {
	Keyboard = 2,
	Joystick = 1
}

local print_r = require("3rd/sproto/print_r")
local lastCheckingTime = 0
local doRevalidate = false
local showJoystickIcon = false
local showKeyboardIcon = false
local showMouseIcon = false
local LastLanguage = ""
local isMovieMode = false
local layoutAdapted = {}
local cameraFwd = Vector3.zero
local cameraPos = Vector3.zero
local lastInputDevice = UIManager.InputDevice.Keyboard
local fontList = {}

function UIManager.Init()
	logWarn("UIManager.Init----->>>")

	lastCheckingTime = os.clock()
	isMovieMode = false
	layoutAdapted = {}
	LastLanguage = ""
	showJoystickIcon = not LS_Setting.isJoystickConnected

	if not showJoystickIcon then
		showKeyboardIcon = true
	end

	return this
end

function UIManager.CreateCtrl(name)
	local ctrlName = name .. "Ctrl"

	if ctrlList[name] ~= nil then
		-- block empty
	else
		local ctrlObj = require("LuaScript/UI/Controller/" .. tostring(ctrlName))

		if ctrlObj ~= nil then
			this.AddCtrl(name, ctrlObj)
		end
	end

	if IsNil(ctrlList[name].gameObject) then
		if layoutAdapted[name] == nil then
			layoutAdapted[name] = false
		end

		local adapted = layoutAdapted[name]

		ctrlList[name].LoadUi(name, adapted)

		if layoutAdapted[name] ~= nil and not adapted then
			layoutAdapted[name] = true
		end
	end

	return ctrlList[name]
end

function UIManager.CreateCtrlByObj(name, go)
	local ctrlName = name .. "Ctrl"

	if ctrlList[name] ~= nil then
		-- block empty
	else
		local ctrlObj = require("LuaScript/UI/Controller/" .. tostring(ctrlName))

		if ctrlObj ~= nil then
			this.AddCtrl(name, ctrlObj)
		end
	end

	if IsNil(ctrlList[name].gameObject) then
		ctrlList[name].LoadByObj(name, go)
	end

	return ctrlList[name]
end

function UIManager.LoadAndCreateCtrl(name)
	local ctrlName = name .. "Ctrl"

	if ctrlList[name] ~= nil then
		-- block empty
	else
		local ctrlObj = require("LuaScript/UI/Controller/" .. tostring(ctrlName))

		if ctrlObj ~= nil then
			this.AddCtrl(name, ctrlObj)
		end
	end

	if IsNil(ctrlList[name].gameObject) then
		ctrlList[name].LoadPrefab(name)
	end

	return ctrlList[name]
end

function UIManager.AddCtrl(name, ctrlObj)
	ctrlList[name] = ctrlObj
end

function UIManager.GetCtrl(name)
	return ctrlList[name]
end

function UIManager.GetAllCtrl()
	return ctrlList
end

function UIManager.RemoveCtrl(name)
	ctrlList[name] = nil
end

function UIManager.Close(name)
	if DebugLog then
		SystemHelper.Log("[ UIManager.Close( " .. name .. " ) ]")
	end

	if ctrlList[name] ~= nil then
		ctrlList[name].Close(name)

		ctrlList[name].gameObject = nil
	elseif DebugLog then
		SystemHelper.Log("[ NULL Ctrl: " .. name .. " ]")
	end

	ctrlList[name] = nil
end

function UIManager.ClearUi(name)
	this.Close(name)

	layoutAdapted[name] = nil
end

function UIManager.SimpleAdapt()
	for k, v in pairs(ctrlList) do
		UICtrlBase.SimpleAdapt(k)
	end
end

function UIManager.SetMainCameraFwd(vec)
	cameraFwd:SetVector3(vec)
end

function UIManager.GetMainCameraFwd()
	return cameraFwd
end

function UIManager.SetMainCameraPos(vec)
	cameraPos:SetVector3(vec)
end

function UIManager.GetMainCameraPos()
	return cameraPos
end

function UIManager.GetLastInputDevice()
	return lastInputDevice
end

function UIManager.Update()
	local isKmConnected = showKeyboardIcon or showMouseIcon
	local tempLastInputDevice = inputMgr:GetLastInputDevice()

	if lastInputDevice ~= tempLastInputDevice then
		lastInputDevice = tempLastInputDevice
		doRevalidate = true

		if lastInputDevice == UIManager.InputDevice.Joystick then
			showJoystickIcon = true
			showKeyboardIcon = false
			LS_Setting.isJoystickConnected = true
		else
			showJoystickIcon = false
			showKeyboardIcon = true
			LS_Setting.isJoystickConnected = false
		end
	end

	for k, v in pairs(ctrlList) do
		if v.Update then
			v.Update()
		end

		if doRevalidate and v.mainComponent then
			v.mainComponent:Revalidate(showJoystickIcon, showKeyboardIcon)
		end

		if doRevalidate and v.ExternalEvent then
			v.ExternalEvent(showJoystickIcon, isKmConnected)
		end

		if v.LateUpdate then
			v.LateUpdate()
		end
	end

	doRevalidate = false
end

function UIManager.RefreshJoystickIcon(platform)
	for k, v in pairs(ctrlList) do
		v.mainComponent:RefreshJoystickIcon(platform)
	end
end

function UIManager.RefreshLanguage()
	local suffix = LS_Setting.GetLanguage()

	SystemHelper.require("GameData/Internationlization/GameText_" .. suffix)
	SystemHelper.require("GameData/Internationlization/GameTextAuto_" .. suffix)
	SystemHelper.require("GameData/Internationlization/GameTextData_" .. suffix)

	if AppVer == AppCJ2020 then
		if suffix == "zhs" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "遗忘之潮"
		elseif suffix == "zht" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "遺忘之潮"
		elseif suffix == "jp" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "忘却の潮"
		elseif suffix == "de" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "Die Flut des Vergessens"
		elseif suffix == "ru" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "Приливы Забвения"
		elseif suffix == "kr" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "망각의 파도"
		elseif suffix == "it" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "Le onde dell'oblio"
		elseif suffix == "fr" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "Les Marées de l'oubli"
		elseif suffix == "es" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "Las corrientes del olvido"
		elseif suffix == "pt" then
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "As marés do esquecimento"
		else
			GameTextAuto.UI_LOBBYMAIN.LOBBYMAIN_ROOT_NAVBTN_STORY_TEXT = "The Tides of Oblivion"
		end
	end

	for k, v in pairs(ctrlList) do
		v.mainComponent:RefreshText(font)
	end

	if suffix ~= "zhs" or LastLanguage ~= nil and LastLanguage ~= suffix then
		MS_ItemData.RefreshLanguage()
		MS_StoryDialog.RefreshLanguage()
		MS_HeroData.RefreshLanguage()
		MS_UIHeroInfo.RefreshLanguage()
		MS_UISkillInfo.RefreshLanguage()
		MS_HeroTalent.RefreshLanguage()
		MS_StoryTutorial.RefreshLanguage()
		MS_StoryMonster.RefreshLanguage()
		MS_SiteInfo.RefreshLanguage()
		MS_StoryGuide.RefreshLanguage()
		MS_Achievement.RefreshLanguage()
		MS_UIQuest.RefreshLanguage()
		MS_StoryTips.RefreshLanguage()
		MS_StorySkin.RefreshLanguage()
		MS_StoryMazeStatue.RefreshLanguage()
	end

	LastLanguage = suffix

	UIManager.SendMessage("Mainmenu", "RefreshGuideLanguage")
	UIManager.SendMessage("Setting", "RefreshGuideLanguage")
	UIManager.SendMessage("LobbyMain", "RefreshDLCLogo")

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		UIManager.SendMessage("PlayerInfo", "UpdateItemList", FS_UserData.itemList:GetItemList())
	end
end

function UIManager.IsMovieMode()
	return isMovieMode
end

function UIManager.MovieMode(enabled)
	if isMovieMode ~= enabled then
		isMovieMode = enabled

		for k, v in pairs(ctrlList) do
			if k ~= "Subtitle" and k ~= "Skip" and k ~= "Curtain" then
				local tf = v.transform

				if tf then
					local canvas = tf:GetComponent("Canvas")

					if canvas ~= nil then
						canvas.enabled = not isMovieMode
					end
				end
			end
		end
	end
end

function UIManager.IsLoadFinish(uiName)
	local ctrl = this.GetCtrl(uiName)

	if ctrl ~= nil and ctrl.loadFinish ~= nil then
		return ctrl.loadFinish
	end

	return false
end

function UIManager.IsUiAdapted(uiName)
	local isAdapted = false

	if layoutAdapted[uiName] then
		isAdapted = layoutAdapted[uiName]
	end

	return isAdapted
end

function UIManager.SendMessage(uiName, funcname, ...)
	local uiCtrl = this.GetCtrl(uiName)

	if uiCtrl == nil then
		return
	end

	if uiCtrl[funcname] == nil then
		return
	end

	return uiCtrl[funcname](...)
end

function UIManager.ReceiveMessage(uiName, funcname, ...)
	local uiCtrl = this.GetCtrl(uiName)

	if uiCtrl == nil then
		return false
	end

	if uiCtrl[funcname] == nil then
		return false
	end

	return true, uiCtrl[funcname](...)
end

function UIManager.Clear()
	for _uiName, _uiCtrl in pairs(ctrlList) do
		if table.contains(this.GlobalUI, _uiName) == false then
			this.Close(_uiName)
		end
	end
end

function UIManager.IsSteamDeck()
	return SdkHelper.IsRunningOnSteamDeck()
end

function UIManager.GetFont(fontName)
	local levelName = "Level" .. fontName

	if fontList[levelName] ~= nil then
		return fontList[levelName]
	else
		local font = loadMgr:LoadFont("Font/" .. levelName .. "/level_" .. fontName)

		if font then
			fontList[levelName] = font

			return fontList[levelName]
		end
	end

	return nil
end
