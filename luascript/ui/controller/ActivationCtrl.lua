-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ActivationCtrl.lua

ActivationCtrl = class("ActivationCtrl", UICtrlBase)

local this = ActivationCtrl

ActivationCtrl.static.LayerName = "Activation"

local sceneController, codeInputSingle, codeInputMulti

function ActivationCtrl.OnCreate()
	sceneController = ST_Main.GetSceneController()

	if sceneController then
		sceneController:EnterMenu(false)
	end

	UILayerCtrl.Add(ActivationCtrl.LayerName)

	codeInputSingle = {}

	local go = this.mainComponent:GetGameObject("Activation_InputSingle")

	codeInputSingle.input = go:GetComponent("InputField")
	codeInputMulti = {}
	go = this.mainComponent:GetGameObject("Activation_InputMulti")
	codeInputMulti.inputs = {}

	for i = 1, 4 do
		local igo = this.mainComponent:GetGameObject("Activation_InputMulti" .. i)
		local com = igo:GetComponent("InputField")

		com.onValueChanged:RemoveAllListeners()

		codeInputMulti.inputs[i] = com
	end

	local btn = this.mainComponent:GetButton("Activation_ButtonClose")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	UILayerCtrl.AddIndividual(ActivationCtrl.LayerName, "Activation_ButtonClose", btn)

	local btn = this.mainComponent:GetButton("Activation_ButtonConfirm")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local code = tostring(codeInputSingle.input.text)

		SystemHelper.Log(string.format("[ Code: %s ]", code))
		UIManager.SendMessage("Loading", "SimpleLoading", true)
		SdkHelper.UseActiveCode3rd(code, function(success, activeTime)
			UIManager.SendMessage("Loading", "SimpleLoading", false)

			LS_Setting.activated = success

			if success == true then
				LS_Setting.activeTime = activeTime

				if activeTime - TimeHelper.getUTC() <= 0 then
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACTIVATION_OUTOFDATE, function()
						if Platform == PlatformType.ANDROID then
							UnityEngine.Application.Quit()
						end
					end, function()
						return
					end, true)
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACTIVATION_SUCCESS, function()
						this.OnButtonClose()
					end, function()
						return
					end, true)
				end
			else
				LS_Setting.activeTime = 0

				if activeTime <= 0 then
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACTIVATION_FAILURE, function()
						return
					end, function()
						return
					end, true)
				elseif activeTime >= 200 and activeTime < 300 then
					local keyMsg = string.format("UI_ACTIVATION_ERROR%d", activeTime)

					if GameText[keyMsg] ~= nil then
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText[keyMsg], function()
							return
						end, function()
							return
						end, true)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACTIVATION_ERRTIME, function()
							return
						end, function()
							return
						end, true)
					end
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ACTIVATION_ERRTIME, function()
						return
					end, function()
						return
					end, true)
				end
			end
		end)
	end)
	UILayerCtrl.AddIndividual(ActivationCtrl.LayerName, "Activation_ButtonConfirm", btn)

	this.loadFinish = true

	UILayerCtrl.Push(ActivationCtrl.LayerName, 1)
end

function ActivationCtrl.Update()
	if not this.loadFinish then
		return
	end
end

function ActivationCtrl.OnButtonClose()
	UIManager.Close(ActivationCtrl.LayerName)
	UIManager.SendMessage("LobbyMain", "CloseDialog")
	UILayerCtrl.Pop()
end

function ActivationCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName ~= ActivationCtrl.LayerName or inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
		-- block empty
	elseif inputMgr:GetButtonDown(GBKey.B) then
		-- block empty
	end
end

return ActivationCtrl
