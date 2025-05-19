-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/LoginCtrl.lua

LoginCtrl = class("LoginCtrl", UICtrlBase)

local this = LoginCtrl
local inputUserName = ""
local inputPassword = ""
local InputUsernameCom, InputPasswordCom, btnConfirmLogin, tween, sceneController, cameraMain, panelLogin, panelServerlist, panelTapToStart, tapToStart, changeButton, changeConfirmButton, logout, loginCancel, recentServerBtn, changeNameComfirmBtn, changeNameRandomBtn, changeNameInputfield, changeNamePanel
local validVersion = true
local currentServer, tempCurrentServer, recentText, recentServerName, serverBtnGroup, serverList, finishTime, AnnouncementGO, AnnouncementLoader, AnnouncementConfirmBtn, AnnouncementOpenBtn, AntiText, labelVersion, panelEdition, evtLog
local isStarting = false

function LoginCtrl.OnCreate()
	isStarting = false
	sceneController = ST_Lobby.GetSceneController()

	SystemHelper.LogTest("========================================================================子类 Start lua--->>")
	UILayerCtrl.Add("Start", LobbyMainCtrl.ClosePanel)
	UILayerCtrl.Add("Announcement", LoginCtrl.CloseAnnouncement)

	inputUserName = LS_Account.userName
	inputPassword = LS_Account.password
	validVersion = true

	local obj = this.mainComponent:GetGameObject("Panel_LoginGroup_Panel_LoginDialog_InputField_Username")

	InputUsernameCom = obj:GetComponent("InputField")
	obj = this.mainComponent:GetGameObject("Panel_LoginGroup_Panel_LoginDialog_InputField_Password")
	InputPasswordCom = obj:GetComponent("InputField")
	obj = this.mainComponent:GetGameObject("Panel_ChangeName_BG_InputField")
	changeNameInputfield = obj:GetComponent("InputField")
	changeNamePanel = this.mainComponent:GetGameObject("Panel_ChangeName")
	InputUsernameCom:GetComponent("InputField").text = inputUserName
	InputPasswordCom:GetComponent("InputField").text = inputPassword
	btnConfirmLogin = this.mainComponent:GetButton("Panel_LoginGroup_Panel_LoginDialog_Button_Login_Confirm")

	btnConfirmLogin:SetEventCallBack(EventTriggerType.PointerClick, this.PointerClick_Login_Confirm)
	SystemHelper.LogTest("========================inputUserName" .. inputUserName .. ",inputPassword=" .. inputPassword)

	panelLogin = this.mainComponent:GetGameObject("Panel_LoginGroup")
	panelServerlist = this.mainComponent:GetGameObject("Panel_ServerList")
	panelTapToStart = this.mainComponent:GetGameObject("Panel_TapToStart")
	recentText = this.mainComponent:GetText("Panel_TapToStart_CurrentServer_Text")
	recentServerBtn = this.mainComponent:GetButton("Panel_ServerList_Button_Current")
	serverList = this.mainComponent:GetLoader("Panel_ServerList_ServerList_Viewport_Content")
	tapToStart = this.mainComponent:GetButton("Panel_TapToStart_TapToStart")

	tapToStart.gameObject:SetActive(true)

	AntiText = this.mainComponent:GetText("Anti_Indulgence_Text")
	AnnouncementGO = this.mainComponent:GetGameObject("Panel_Announcement")
	AnnouncementLoader = this.mainComponent:GetLoader("Panel_Announcement_Announcement_ScrollView_Announcement_Viewport_Announcement_Content")
	AnnouncementLoader.RT = AnnouncementLoader.gameObject:GetComponent("RectTransform")
	AnnouncementConfirmBtn = this.mainComponent:GetButton("Panel_Announcement_Button")

	AnnouncementConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AnnouncementGO:SetActive(false)
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddButton("Announcement", "Panel_Announcement_Button", AnnouncementConfirmBtn)

	AnnouncementOpenBtn = this.mainComponent:GetButton("AnnouncementBtn_L")

	AnnouncementOpenBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.SendMessage("Loading", "SimpleLoading", true)
		SdkHelper.openBoard(LS_Setting.GetLanguage(), LoginCtrl.LoadAnnouncementAlwaysCallback)
	end)
	AnnouncementOpenBtn.gameObject:SetActive(false)
	tapToStart:SetAdjacent(XButton.Adjacent.UP, "Panel_TapToStart_CurrentServer_Text_ChangeButton")
	UILayerCtrl.AddButton("Start", "Panel_TapToStart_TapToStart", tapToStart)

	changeConfirmButton = this.mainComponent:GetButton("Panel_ServerList_ButtonConfirm")

	changeConfirmButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if tempCurrentServer == nil then
			return
		end

		currentServer = tempCurrentServer

		LoginCtrl.ChangeIP(currentServer)
		LoginCtrl.ChangeCurrentServer(currentServer)

		if serverBtnGroup then
			serverBtnGroup:Remove(recentServerBtn)

			serverBtnGroup = nil

			recentServerBtn:SetNormal()
			recentServerBtn:TriggerAnimation(recentServerBtn.btnCom.animationTriggers.normalTrigger)
		end

		panelTapToStart:SetActive(true)

		panelServerlist:GetComponent("CanvasGroup").alpha = 0
		panelServerlist:GetComponent("CanvasGroup").blocksRaycasts = false

		LobbyMainCtrl:SetBlurEnabled(false)
	end)

	logout = this.mainComponent:GetButton("Panel_TapToStart_Logout")

	logout:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if LS_Account.userName == nil or LS_Account.password == nil or LS_Account.userName == "" or LS_Account.password == "" then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_PLEASELOGIN)

			return
		end

		LobbyMainCtrl:SetBlurEnabled(true)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_NOWACCOUNT .. LS_Account.userName .. GameText.UI_LOGIN_CONFIRMLOGOUT, function()
			LoginCtrl.ResetUsername()
			FS_UserData.LoginOut()
		end, function()
			LobbyMainCtrl:SetBlurEnabled(false)
		end)
	end)

	loginCancel = this.mainComponent:GetButton("Panel_LoginGroup_Panel_LoginDialog_Close")

	loginCancel:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		panelLogin:SetActive(false)
		panelTapToStart:SetActive(true)
		LobbyMainCtrl:SetBlurEnabled(false)
		changeButton.transform.parent.parent.gameObject:SetActive(false)
		logout.gameObject:SetActive(false)
		tapToStart:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LoginCtrl.ResetUsername()
		end)
	end)

	changeButton = this.mainComponent:GetButton("Panel_TapToStart_CurrentServer_Text_ChangeButton")

	changeButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		NI_Login.GetServerList(FS_UserData.playerList:GetUserId(), LoginCtrl.Callback_ServerList)
	end)
	changeButton:SetAdjacent(XButton.Adjacent.DOWN, "Panel_TapToStart_TapToStart")
	UILayerCtrl.AddButton("Start", "Panel_TapToStart_CurrentServer_Text_ChangeButton", changeButton)
	changeButton.transform.parent.parent.gameObject:SetActive(false)
	logout.gameObject:SetActive(false)
	UILayerCtrl.Push("Start", "Panel_TapToStart_TapToStart")

	if ReqLogin and (LS_Account.userName == nil or LS_Account.password == nil or LS_Account.userName == "" or LS_Account.password == "") then
		LoginCtrl.ResetUsername()
		tapToStart.gameObject:SetActive(true)
		tapToStart:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			LoginCtrl.ResetUsername()
		end)
	else
		this.StartLogin()
	end

	changeNameComfirmBtn = this.mainComponent:GetButton("Panel_ChangeName_BG_Comfirm")

	changeNameComfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if string.gsub(changeNameInputfield.text, " ", "") == "" then
			changeNameInputfield.text = ""

			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_UESRNAME_TIPS)

			return
		elseif string.find(SensitiveMsgParser:getString(changeNameInputfield.text), "*") ~= nil then
			changeNameInputfield.text = ""

			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_SENSITIVE_WORD)

			return
		end

		NI_Player.CreatePlayer(changeNameInputfield.text)
	end)

	changeNameRandomBtn = this.mainComponent:GetButton("Panel_ChangeName_BG_Random")

	changeNameRandomBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		changeNameInputfield.text = ""
	end)

	labelVersion = this.mainComponent:GetText("Panel_Reserved_TextVersion_LB")

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

	panelEdition = this.mainComponent:GetGameObject("Panel_TapToStart_PanelEdition")

	if AppVer ~= AppAppleLight then
		panelEdition:SetActive(false)
	else
		panelEdition:SetActive(true)

		if LS_Setting.lang == "zhs" then
			local oriPos = panelEdition.transform.localPosition

			if oriPos.y > -256 then
				oriPos.y = -256
				oriPos.x = 256
			end

			panelEdition.transform.localPosition = Vector2.New(oriPos.x, oriPos.y)
		else
			local oriPos = panelEdition.transform.localPosition

			if oriPos.y < -220 then
				oriPos.y = -220
			end

			panelEdition.transform.localPosition = Vector2.New(oriPos.x, oriPos.y)
		end
	end

	this.loadFinish = true
	finishTime = TimeHelper.getNowTime()

	if AppVer ~= AppAppleLight and AppVer ~= AppTapTapCloudDemo and AppVer ~= AppCJ2020 and Platform ~= PlatformType.MAC and Platform ~= PlatformType.PC then
		SdkHelper.openBoard(LS_Setting.GetLanguage(), LoginCtrl.LoadAnnouncementCallback)
	end

	local sysLang = Device.getSysLang()

	if LS_Setting.GetLanguage() == "zhs" then
		AntiText.gameObject:SetActive(false)
	else
		AntiText.gameObject:SetActive(false)
	end
end

function LoginCtrl.ResetUsername()
	LS_Account.Reset()
	LobbyMainCtrl:SetBlurEnabled(true)
	panelLogin:SetActive(true)
	panelTapToStart:SetActive(false)

	InputUsernameCom:GetComponent("InputField").text = inputUserName
	InputPasswordCom:GetComponent("InputField").text = inputPassword
end

function LoginCtrl.ChangeIP(server)
	XGame.ChangeBattleIp(server.ip, server.port)
end

function LoginCtrl.PointerClick_Login_Confirm(obj, data)
	local id = InputUsernameCom.text
	local pass = InputPasswordCom.text

	if id == nil or id == "" or pass == nil or pass == "" then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_PASSWORD_NULL)
		SystemHelper.LogTest("================Button_StartGame========id/pass nil !!!")

		return false
	end

	SystemHelper.LogTest("================Button_StartGame========id=" .. id .. ",pass=" .. pass)

	inputUserName = id
	inputPassword = pass

	this.StartLogin()
end

function LoginCtrl.CheckDeviceAccount()
	local utcTs, tsOffset = TimeHelper.getUtcTime()

	SystemHelper.Log("......NOW: " .. os.time())
	SystemHelper.Log("......UTC: " .. utcTs)
	UIManager.SendMessage("Loading", "SimpleLoading", true)
	NI_Login.CheckDeviceAccount(utcTs, function(jsonData)
		UIManager.SendMessage("Loading", "SimpleLoading", false)

		local v_data = json.decode(jsonData)

		if v_data then
			local flag = v_data.success

			if flag then
				local result = v_data.result
				local sign = result.sign
				local active = result.active
				local userId = result.id
				local timestamp = utcTs + tsOffset + result.time
				local expired = result.expired
				local checksum = Util.md5(userId .. (active and "true" or "false") .. timestamp .. AppConst.SecKey)

				Common.Log("Active: " .. (active and "true" or "false"))
				Common.Log("UserId: " .. userId)
				Common.Log("Timestamp: " .. timestamp)
				Common.Log("Sign: " .. sign)
				Common.Log("Chksum: " .. checksum)

				LS_Account.userName = userId
				inputUserName = userId

				LS_Account.Update()
				FS_UserData.playerList:Login(userId, "", timestamp)
				LS_Setting.Load(FS_UserData.playerList:GetUserId())
				LS_Setting.Update()
				UIManager.RefreshLanguage()

				if not active and expired then
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_TRIAL_EXPIRED, function()
						return
					end, function()
						return
					end, true)
				else
					LS_Setting.activated = active

					UIManager.SendMessage("LobbyMain", "ShowActivationButton", not active)

					if sign == checksum then
						NI_Game.Login()
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_NETWORK_EXCEPTION, function()
							return
						end, function()
							return
						end, true)
					end
				end
			else
				local retCode = v_data.code

				if retCode == nil then
					retCode = ""
				end

				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_NETWORK_ERROR .. retCode, function()
					return
				end, function()
					return
				end, true)
			end
		end
	end)
end

function LoginCtrl.StartLogin()
	NI_Login.Login(inputUserName, inputPassword, LoginCtrl.Callback_UserLogin)
end

function LoginCtrl.Callback_DefaultServer(jsonData)
	local ret = NI_Login.ParseDefaultServerResponse(jsonData)

	if ret == true then
		local default = FS_UserData.serverList:GetDefaultServer()

		currentServer = default

		LoginCtrl.ChangeIP(currentServer)
		logout.gameObject:SetActive(true)
		LoginCtrl.ChangeCurrentServer(default)
		tapToStart.gameObject:SetActive(true)
		tapToStart:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			UILayerCtrl.SetAllowKeyInput(false)
			tapToStart.gameObject:SetActive(false)

			if AppVer == AppAppleLight then
				if panelLogin ~= nil then
					UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
					UIManager.SendMessage("MsgBoxSimple", "OpenMassageBox", GameText.UI_DEMO_FEATURE_CONTENT)

					local tween = Tween:new(panelLogin)

					tween:SetAutoKill(true)
					tween:MoveTo({}, 1.5)
					tween:OnComplete(function()
						MsgBoxSimpleCtrl.CloseMessage()
						UIManager.SendMessage("Loading", "SimpleLoading", false, false, false)
						LoginCtrl.GotoMainmenu()
					end)
					tween:Start()
				end
			elseif AppVer == AppTapTapCloudDemo then
				LoginCtrl.GotoMainmenu()
			elseif AppVer == AppCJ2020 then
				LoginCtrl.GotoMainmenu()
			elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
				if AppVer == AppTapTapEA then
					LoginCtrl.StartAccountLogin()
				elseif LS_Account.login >= 0 and string.len(LS_Account.userId) > 1 then
					LoginCtrl.StartAccountLogin()
				else
					LoginCtrl.ShowAccountLogin()
				end
			elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
				if AppVer == AppTapTapEA then
					LoginCtrl.StartAccountLogin()
				elseif LS_Account.login >= 0 and string.len(LS_Account.userId) > 1 then
					LoginCtrl.BeforeGotoMainmenu(function()
						LoginCtrl.GotoMainmenu()
					end)
				else
					LoginCtrl.ShowAccountLogin()
				end
			else
				LoginCtrl.StartAccountLogin()
			end
		end)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_GET_DEFAULT_SERVER_FAILED)
	end
end

function LoginCtrl.StartAccountLogin()
	if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
		LoginCtrl.BeforeGotoMainmenu(function()
			LoginCtrl.GotoMainmenu()
		end)
	else
		SystemHelper.LogTest("检查是否需要实名制")
		SdkHelper.CheckIfNeedRealName(function(b)
			SystemHelper.LogTest(string.format("是否需要实名制: %s", tostring(b)))
			LoginCtrl.BeforeGotoMainmenu(function()
				LoginCtrl.GotoMainmenu()
			end)
		end)
	end
end

function LoginCtrl.ShowAccountLogin()
	UIManager.CreateCtrl("Account")
	UIManager.SendMessage("Account", "SetCallback", LoginCtrl.StartAccountLogin)
	UIManager.SendMessage("Account", "ShowLogin", true)
end

function LoginCtrl.RetryLoginProcess()
	if Platform == PlatformType.ANDROID then
		LoginCtrl.ShowAccountLogin()
	else
		LoginCtrl.StartAccountLogin()
	end
end

function LoginCtrl.ShowEventLog(logTbl, callback)
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

	if AppVer == AppTapTapEA and (SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP or SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY) then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", str, LoginCtrl.StartAccountLogin, function()
			return
		end, true, GameText.UI_EVENTLOG_DIALOG_RETRY)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", str, LoginCtrl.RetryLoginProcess, function()
			if callback ~= nil then
				callback()
			end
		end, false, GameText.UI_EVENTLOG_DIALOG_RETRY, GameText.UI_EVENTLOG_DIALOG_IGNORE)
	end

	UILayerCtrl.SetAllowKeyInput(true)
end

function LoginCtrl.BeforeGotoMainmenu(callback)
	SystemHelper.LogTest("进入游戏按钮按下1:" .. tostring(isStarting))

	if isStarting == false then
		isStarting = true

		tapToStart.gameObject:SetActive(false)
		UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
		SystemHelper.LogTest("开始初始化SDK")

		evtLog = {}

		MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_INITSDK_SUCC)
		SdkHelper.InitSdk(function(initSuccess)
			SystemHelper.LogTest("初始化SDK: " .. tostring(initSuccess))

			if SdkHelper.SdkFacade ~= nil then
				SdkHelper.SdkFacade:CheckAntiState()
			end

			if initSuccess == true then
				MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_LOGIN_SUCC)
				SystemHelper.LogTest("开始登录游戏服务器")

				local function onLoginCallback(success, code, accountId, loginType, nickname)
					SystemHelper.Log("登录游戏服务器: " .. tostring(success) .. "  昵称:" .. nickname .. " age:" .. SdkHelper.GetUserAge())

					if loginType == 3 or loginType == 5 then
						UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
						tapToStart.gameObject:SetActive(false)

						isStarting = true

						MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_GETIAP_SUCC)
					end

					NI_Login.OnLogin(success, code, accountId, loginType, nickname)
					MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_GETIAP_SUCC)
					SystemHelper.Log("开始获取物品详细信息")
					SdkHelper.GetIapInfos(function(b)
						if b == true then
							MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_OWNIAP_SUCC)
							SystemHelper.Log("物品详细信息:" .. tostring(SdkHelper.IsIapInfosInited))
							SystemHelper.Log("开始获取已购买追加内容")
							SdkHelper.GetPaidList(function(b2)
								if b2 == true then
									SystemHelper.LogError(GameText.UI_EVENTLOG_OWNIAP_SUCC .. tostring(SdkHelper.IsPaidListInited))
								else
									SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_OWNIAP_FAIL)
									SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_OWNIAP_WARN)
									LoginCtrl.ShowEventLog(evtLog, callback)
								end

								if success == true then
									MsgBoxSimpleCtrl.CloseMessage()
									UIManager.SendMessage("Loading", "SimpleLoading", false)

									isStarting = false

									if callback ~= nil then
										callback()
									end

									UILayerCtrl.SetAllowKeyInput(true)
								else
									SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_LOGIN_FAIL)
									SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_LOGIN_WARN)
									LoginCtrl.ShowEventLog(evtLog, callback)
								end
							end)
						else
							if success == true then
								MsgBoxSimpleCtrl.CloseMessage()
								UIManager.SendMessage("Loading", "SimpleLoading", false)

								isStarting = false

								if callback ~= nil then
									callback()
								end

								UILayerCtrl.SetAllowKeyInput(true)
							else
								SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_LOGIN_FAIL)
								SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_LOGIN_WARN)
								LoginCtrl.ShowEventLog(evtLog, callback)
							end

							SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_GETIAP_FAIL)
							SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_GETIAP_WARN)
							LoginCtrl.ShowEventLog(evtLog, callback)
						end
					end)
				end

				SystemHelper.LogError("显示隐私条款 account.userId:" .. LS_Account.userId)

				local needShowPrivacy = false

				if SdkHelper.CHANNEL == "IOS_TIPS" or SdkHelper.CHANNEL == "ANDROID_TAP_TAP" then
					local sysLang = Device.getSysLang()

					if sysLang == "zhs" and LS_Account.GetAgreePrivacy() == "0" then
						needShowPrivacy = true
					end
				end

				if needShowPrivacy == true then
					SdkHelper.GoGetPrivacy(function(bSuccess)
						if bSuccess == true then
							LS_Account.SetAgreePrivacy()
							LS_Account.Update()

							if LS_Account.login <= LS_Account.LoginType.Guest then
								SystemHelper.LogTest("[[[ SDK Login: Guest ]]]")
								SdkHelper.LoginGuest(onLoginCallback)
							else
								SystemHelper.Log(string.format("[[[ SDK Login: %d ]]]", LS_Account.login))
								SdkHelper.Login3rd(LS_Account.login, onLoginCallback)

								if LS_Account.login == 3 or LS_Account.login == 5 then
									isStarting = false

									tapToStart.gameObject:SetActive(true)
									MsgBoxSimpleCtrl.CloseMessage()
									UIManager.SendMessage("Loading", "SimpleLoading", false, false, false)
								end
							end
						else
							UnityEngine.Application.Quit()
						end
					end)
				elseif LS_Account.login <= LS_Account.LoginType.Guest then
					SystemHelper.LogTest("[[[ SDK Login: Guest ]]]")
					SdkHelper.LoginGuest(onLoginCallback)
				else
					SystemHelper.Log(string.format("[[[ SDK Login: %d ]]]", LS_Account.login))
					SdkHelper.Login3rd(LS_Account.login, onLoginCallback)

					if LS_Account.login == 3 or LS_Account.login == 5 then
						isStarting = false

						tapToStart.gameObject:SetActive(true)
						MsgBoxSimpleCtrl.CloseMessage()
						UIManager.SendMessage("Loading", "SimpleLoading", false, false, false)
					end
				end
			else
				evtLog = {}

				SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_INITSDK_FAIL)
				SystemHelper.LogEvent(evtLog, GameText.UI_EVENTLOG_INITSDK_WARN)
				LoginCtrl.ShowEventLog(evtLog, callback)
			end
		end)
	end
end

function LoginCtrl.GotoMainmenu()
	if AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs then
		LoginCtrl.CheckDeviceAccount()
	elseif AppVer == AppDemoCJReview then
		if not validVersion then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_VERSION_OUT_OF_DATE, function()
				return
			end, function()
				return
			end, true)
		else
			NI_Login.CheckVer(function(jsonData)
				UIManager.SendMessage("Loading", "SimpleLoading", false)

				local v_data = json.decode(jsonData)

				if v_data then
					local ver = tonumber(v_data.ver)
					local timestamp = v_data.time
					local retCode = v_data.md5
					local veriCode = Util.md5(ver .. timestamp .. "Tips@Works")

					if ver ~= GameVersion or veriCode ~= retCode then
						validVersion = false

						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_VERSION_OUT_OF_DATE, function()
							return
						end, function()
							return
						end, true)
					else
						NI_Game.Login()
					end
				end
			end)
		end
	elseif AppVer == AppDemoInner then
		if not validVersion then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_VERSION_OUT_OF_DATE, function()
				return
			end, function()
				return
			end, true)
		else
			NI_Login.CheckVer(function(jsonData)
				UIManager.SendMessage("Loading", "SimpleLoading", false)

				local v_data = json.decode(jsonData)

				if v_data then
					local ver = tonumber(v_data.ver)
					local timestamp = v_data.time
					local retCode = v_data.md5
					local veriCode = Util.md5(ver .. timestamp .. "Tips@Works")

					if ver ~= GameVersion or veriCode ~= retCode then
						validVersion = false

						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_VERSION_OUT_OF_DATE, function()
							return
						end, function()
							return
						end, true)
					else
						NI_Game.Login()
					end
				end
			end)
		end
	elseif ReqLogin then
		NI_Login.SaveServer(currentServer.id, FS_UserData.playerList:GetUserId(), FS_UserData.playerList:GetSign(), LoginCtrl.SaveServerCallback)

		if not XNetwork.IsConnecting() then
			networkMgr:SendConnect()
			UIManager.SendMessage("Loading", "SimpleLoading", true)
		else
			NI_Game.Login()
			UIManager.SendMessage("Loading", "SimpleLoading", true)
		end
	else
		NI_Game.Login()
		FS_UserData.achievement:UpdateForSteam()
	end
end

function LoginCtrl.SaveServerCallback(obj, data)
	SystemHelper.Log("保存服务器成功!")
end

function LoginCtrl.Callback_ServerList(jsonData)
	local ret = NI_Login.ParseServerListResponse(jsonData)

	if ret == true then
		panelTapToStart:SetActive(false)

		panelServerlist:GetComponent("CanvasGroup").alpha = 1
		panelServerlist:GetComponent("CanvasGroup").blocksRaycasts = true

		LobbyMainCtrl:SetBlurEnabled(true)

		local serverlistData = FS_UserData.serverList:GetServerList()
		local recentserverData = FS_UserData.serverList:GetRecentServer()

		serverBtnGroup = XGroup:new()

		serverBtnGroup:SetMode(XGroup.GroupMode.Button)

		local scrollObject = this.mainComponent:GetGameObject("Panel_ServerList_ServerList")
		local scroll = XScrollRect:new(scrollObject)

		if recentserverData == nil then
			recentServerBtn.gameObject:SetActive(false)
		else
			recentServerBtn.gameObject:SetActive(true)
			serverBtnGroup:Add(recentServerBtn)
			this.mainComponent:GetText("Panel_ServerList_Button_Current_ServerName"):SetContent(StringHelper.Split(recentserverData.name, "|")[1])
			this.mainComponent:GetText("Panel_ServerList_Button_Current_ServerSecondName"):SetContent(StringHelper.Split(recentserverData.name, "|")[2])
			recentServerBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				tempCurrentServer = recentserverData

				recentServerBtn:SetSelected(true)
			end)

			if currentServer.id == recentserverData.id then
				tempCurrentServer = recentserverData

				recentServerBtn:SetHighlighted()
			end

			if recentserverData.hasData then
				this.mainComponent:GetGameObject("Panel_ServerList_Button_Current_HaveAccount"):SetActive(true)
			else
				this.mainComponent:GetGameObject("Panel_ServerList_Button_Current_HaveAccount"):SetActive(false)
			end
		end

		if serverlistData == nil then
			-- block empty
		else
			serverList.loadCount = #serverlistData

			function serverList.loadCallback(index, com, data)
				local selectBtn = com:GetButton("Button_Select")

				selectBtn:SetParentScroll(scroll)
				serverBtnGroup:Add(selectBtn)
				com:GetText("Button_Select_ServerName"):SetContent(StringHelper.Split(serverlistData[index].name, "|")[1])
				com:GetText("Button_Select_ServerSecondName"):SetContent(StringHelper.Split(serverlistData[index].name, "|")[2])
				selectBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					tempCurrentServer = serverlistData[index]

					selectBtn:SetSelected(true)
				end)

				if recentserverData then
					if currentServer.id == serverlistData[index].id and recentserverData.id ~= currentServer.id then
						tempCurrentServer = serverlistData[index]

						selectBtn:SetHighlighted()
					end
				elseif currentServer.id == serverlistData[index].id then
					tempCurrentServer = serverlistData[index]

					selectBtn:SetHighlighted()
				end

				if serverlistData[index].hasData then
					com:GetGameObject("Button_Select_HaveAccount"):SetActive(true)
				else
					com:GetGameObject("Button_Select_HaveAccount"):SetActive(false)
				end
			end

			serverList:Load()
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_GET_SERVERLIST_FAILED)
	end
end

function LoginCtrl.ChangeCurrentServer(server)
	recentServerName = server.name .. "  <color=#66A775FF>" .. GameText.UI_LOGIN_EMPTY .. "</color>  " .. GameText.UI_LOGIN_CHANGE_SERVER .. ">"

	recentText:SetContent(recentServerName)
end

function LoginCtrl.Callback_UserLogin(jsonData)
	SystemHelper.LogTest("================Callback_UserLogin========")

	local ret = NI_Login.ParseLoginResponse(jsonData)

	if ret == true then
		SystemHelper.Log("[ Username: " .. inputUserName .. " ]")
		SystemHelper.Log("[ UserID: " .. LS_Account.userId .. " ]")

		if FS_UserData.playerList:GetUserId() > 0 then
			LS_Account.userName = inputUserName
			LS_Account.password = inputPassword

			LS_Account.Update()
			LS_Setting.Load(LS_Account.userId)
			LS_Setting.Update()
			UIManager.RefreshLanguage()
		end

		LobbyMainCtrl.SetFog(LS_Setting.graphics.quality)
		LobbyMainCtrl:SetBlurEnabled(false)
		panelLogin:SetActive(false)
		panelTapToStart:SetActive(true)
		NI_Login.GetDefaultServer(FS_UserData.playerList:GetUserId(), LoginCtrl.Callback_DefaultServer)
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_LOGIN_FAILED)
		LoginCtrl.ResetUsername()
		UILayerCtrl.SetAllowKeyInput(true)
	end
end

function LoginCtrl.Test()
	tween:Start()
end

function LoginCtrl.TestAni()
	tween = Tween:new(Login.Panel_LoginGroup_Button_Start_Game.transform)

	local tbl = {}
	local pos = Vector3.New(1024, 0, Login.Panel_LoginGroup_Button_Start_Game.transform.position.z)

	Login.Panel_LoginGroup_Button_Start_Game.transform.localPosition = pos
	tbl.localPosition = {}

	table.insert(tbl.localPosition, Vector3.New(1024, 10, pos.z))
	table.insert(tbl.localPosition, Vector3.New(1024, 1000, pos.z))
	table.insert(tbl.localPosition, Vector3.New(-1024, 1000, pos.z))
	table.insert(tbl.localPosition, Vector3.New(-1024, 0, pos.z))
	table.insert(tbl.localPosition, Vector3.New(1024, 0, pos.z))

	tbl.localScale = {}

	table.insert(tbl.localScale, Vector3.New(1.2, 1.2, 1.2))
	table.insert(tbl.localScale, Vector3.New(5, 5, 5))
	table.insert(tbl.localScale, Vector3.New(2.5, 7.6, 1.5))
	table.insert(tbl.localScale, Vector3.New(2, 8, 1))

	tbl.localEulerAngles = Vector3.New(0, 0, 90)

	tween:Easing(Easing.Elastic.easeInOut)
	tween:TweenPath(TweenPath.CatmullRom)
	tween:MoveTo(tbl, 5)
	tween:Delay(1)
	tween:Repeat(-1)
	tween:Yoyo(true)
	tween:SetMixed(Tween.MixedType.Delay)
	tween:RepeatDelay(0)
	tween:OnStart(function()
		SystemHelper.Log("OnStart")
	end)
	tween:OnUpdate(function(time)
		return
	end)
	tween:OnComplete(function()
		SystemHelper.Log("OnComplete")
	end)
end

function LoginCtrl.SetRaycasterEnabled(flag)
	local raycast = this.gameObject:GetComponent("GraphicRaycaster")

	raycast.enabled = flag
end

function LoginCtrl.GetRandomName()
	local nameList = require(modname)

	return nameList[1][math.random(1, 99)] + nameList[2][math.random(1, 99)] + nameList[3][math.random(1, 99)]
end

function LoginCtrl.ChangeNamePanel(flag)
	changeNamePanel:SetActive(flag)

	if flag then
		XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.REQ_CREATE_PLAYER, NI_Player.ParseCreatePlayerResponse)
	else
		XNetwork.RemoveListener(XProtocol.BattleProtocolToPlayer.REQ_CREATE_PLAYER)
	end
end

function LoginCtrl.FinishLogin()
	LoginCtrl.ChangeNamePanel(false)
	UILayerCtrl.Pop()
	UIManager.Close("Login")

	local sceneController = ST_Lobby.GetSceneController()

	sceneController:ChangeState(ControllerLobby.StateType.Menu)
	UIManager.SendMessage("LobbyMain", "OnLoginFinish")

	if AppVer == AppDemoCJReview then
		return
	end

	if AppVer ~= AppAppleDemo and AppVer ~= AppAppleLight and AppVer ~= AppCJ2020 then
		sceneController:PlayMovie()
	end
end

function LoginCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function LoginCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if sceneController and sceneController:isLoadEnd() then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "Start" then
			if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetButtonDown(LS_Setting.Btn.C2) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnCursorClick()
			end
		elseif lName == "Announcement" and (inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown()) then
			UILayerCtrl.OnCursorClick()
		end
	end
end

function LoginCtrl.LoadAnnouncementCallback(txt)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName ~= "Start" then
		return
	end

	if txt ~= "" then
		txt = string.gsub(txt, "\r\n", "\n")

		local stList = StringHelper.Split(txt, "^")

		AnnouncementGO:SetActive(true)
		UILayerCtrl.Push("Announcement", "Panel_Announcement_Button")

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

		AnnouncementLoader:Load()
	else
		AnnouncementGO:SetActive(false)
	end
end

function LoginCtrl.LoadAnnouncementAlwaysCallback(txt)
	UIManager.SendMessage("Loading", "SimpleLoading", false)

	if txt ~= "" then
		txt = string.gsub(txt, "\r\n", "\n")

		local stList = StringHelper.Split(txt, "^")

		AnnouncementGO:SetActive(true)
		UILayerCtrl.Push("Announcement", "Panel_Announcement_Button")

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

		AnnouncementLoader:Load()
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_NETWORK_ERROR)
		AnnouncementGO:SetActive(false)
	end
end

function LoginCtrl.CloseAnnouncement()
	AnnouncementGO:SetActive(false)
	UILayerCtrl.Pop()
end

return LoginCtrl
