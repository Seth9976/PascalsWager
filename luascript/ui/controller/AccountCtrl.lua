-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/AccountCtrl.lua

AccountCtrl = class("AccountCtrl", UICtrlBase)
AccountCtrl.static.Name = "Account"

local this = AccountCtrl

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
else
	require("GameData/SettingCfg")
end

local panelBinding

function AccountCtrl.CheckExcluded(name)
	if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP and Device.getSysLang() == "zhs" and name == "Facebook" then
		return true
	end

	return false
end

function AccountCtrl.OnCreate()
	UILayerCtrl.Add(AccountCtrl.Name)

	panelBinding = {}
	panelBinding.show = false
	panelBinding.go = this.mainComponent:GetGameObject("Account_Binding")

	panelBinding.go:SetActive(false)

	local btnClose = this.mainComponent:GetButton("Account_Binding_BtnClose")

	btnClose:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end, 0)

	panelBinding.btnClose = btnClose
	panelBinding.buttons = {}

	local btnData = SettingCfg.Binding
	local btnCount = table.nums(btnData)

	for idx = 1, btnCount do
		local btnCfg = btnData[idx]
		local name = btnCfg[1]

		if name ~= nil then
			local btn = this.mainComponent:GetButton(string.format("Account_Binding_Btn%s", name))

			if btn ~= nil then
				btn.loginType = LS_Account.LoginType[name]

				btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					SystemHelper.Log(string.format("[ LoginType: %s - %d ]", name, btn.loginType))
					AccountCtrl.OnButtonLogin(btn.loginType)
				end)

				panelBinding.buttons[idx] = btn

				local btnEnabled = btnCfg[2] == true

				if AccountCtrl.CheckExcluded(name) then
					btnEnabled = false
				end

				btn.gameObject:SetActive(btnEnabled)
			end
		end
	end

	local btnGuest = this.mainComponent:GetButton("Account_Binding_BtnGuest")

	if btnGuest ~= nil then
		btnGuest.loginType = LS_Account.LoginType.Guest

		btnGuest:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SystemHelper.Log(string.format("LoginType: %d", btnGuest.loginType))
			AccountCtrl.OnButtonLogin(btnGuest.loginType)
		end)

		panelBinding.buttons[btnCount + 1] = btnGuest
	end

	panelBinding.cbFunc = nil
end

function AccountCtrl.SetCallback(cb)
	if cb ~= nil and type(cb) == "function" then
		panelBinding.cbFunc = cb
	else
		panelBinding.cbFunc = nil
	end
end

function AccountCtrl.ShowLogin(show)
	if panelBinding ~= nil and panelBinding.show ~= show then
		panelBinding.show = show

		panelBinding.go:SetActive(show)

		if show then
			UILayerCtrl.Push(AccountCtrl.Name, nil)
		else
			UIManager.Close(AccountCtrl.Name)
			UILayerCtrl.Pop()
			UILayerCtrl.ForceUpdate(0.7)
		end
	end
end

function AccountCtrl.OnButtonLogin(loginType)
	this.ShowLogin(false)
	SystemHelper.Log(string.format("[ AccountCtrl.OnButtonLogin( %d ) ]", loginType))
	LS_Account.SetLoginType(loginType)
	LS_Account.Update()

	if panelBinding.cbFunc ~= nil then
		panelBinding.cbFunc()
	end
end

function AccountCtrl.Update()
	if not this.loadFinish then
		return
	end
end

return AccountCtrl
