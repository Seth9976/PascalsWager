-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/UILayerCtrl.lua

UILayerCtrl = {}

local this = UILayerCtrl

UILayerCtrl.DefaultInputDelay = 0.3
UILayerCtrl.minDZ = 0.19
UILayerCtrl.maxDZ = 0.81
UILayerCtrl.KeyIdle = 0
UILayerCtrl.KeyDown = 1
UILayerCtrl.KeyHold = 2
UILayerCtrl.KeyUp = 3

local max = math.max
local uiLayer = {}
local uiStack = {}
local spStack = {}
local current = 0
local spCurrent = 0
local currentLayer, currentButton
local isHolding = false
local startTime = 0
local elapsedTime = 0
local thresholdTime = 1
local keyState = {}
local sceneController
local isProcessed = false
local delayDuration = 0.5
local delayStartTime = 0
local allowKeyInput = true

function UILayerCtrl.Init()
	isProcessed = false
	uiLayer = {}
	uiStack = {}
	spStack = {}
	current = 0
	spCurrent = 0
	currentLayer = nil
	currentButton = nil
	allowKeyInput = true

	if DebugLog then
		SystemHelper.Log("____[ UILayerCtrl.Init()...... ]")
	end
end

function UILayerCtrl.Exit()
	if DebugLog then
		SystemHelper.Log("____[ UILayerCtrl.Exit()...... ]")
	end
end

function UILayerCtrl.SetAllowKeyInput(flag)
	allowKeyInput = flag
end

function UILayerCtrl.IsProcessed()
	return isProcessed
end

function UILayerCtrl.SetSceneController(sceneCtrl)
	sceneController = sceneCtrl
end

function UILayerCtrl.AddAnalog(keyCode)
	return
end

function UILayerCtrl.Digitize(keyCode)
	return
end

function UILayerCtrl.Update()
	if isProcessed == false and allowKeyInput == true and inputMgr and inputMgr:IsEscapeKeyDown() and current > 0 and currentLayer then
		local cb = currentLayer.cbFunc

		if cb and type(cb) == "function" then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
			cb()
		end
	end
end

function UILayerCtrl.ForceUpdate(customDelay)
	isProcessed = true

	if customDelay then
		delayDuration = customDelay
	else
		delayDuration = UILayerCtrl.DefaultInputDelay
	end

	delayStartTime = TimeHelper.getNowTimeNoScale()
end

function UILayerCtrl.PostUpdate()
	if isProcessed then
		local deltaT = TimeHelper.getNowTimeNoScale() - delayStartTime

		if deltaT > delayDuration then
			isProcessed = false
		end
	end
end

function UILayerCtrl.ResetDelta(keyCode)
	return
end

function UILayerCtrl.ResetDeltaAll()
	return
end

function UILayerCtrl.GetLastDelta(keyCode)
	return deltaKey[keyCode]
end

function UILayerCtrl.GetKeyState(keyCode)
	return keyState[keyCode]
end

function UILayerCtrl.UpdateDelta(keyCode, value)
	deltaKey[keyCode] = value
end

function UILayerCtrl.GetKeyUp(keyCode)
	return keyState[keyCode] == UILayerCtrl.KeyUp
end

function UILayerCtrl.GetKeyDown(keyCode)
	return keyState[keyCode] == UILayerCtrl.KeyDown
end

function UILayerCtrl.GetKey(keyCode)
	return keyState[keyCode] == UILayerCtrl.KeyHold
end

function UILayerCtrl.ResetDeltaZ()
	return
end

function UILayerCtrl.Add(name, cbFunc)
	if name then
		local layer = {}

		layer.initBtn = nil
		layer.lastBtn = nil
		layer.buttons = {}
		layer.individuals = {}
		layer.cbFunc = cbFunc
		uiLayer[name] = layer
	elseif DebugLog then
		SystemHelper.Log("____[ Add layer with INVALID name...... ]")
	end
end

function UILayerCtrl.SetCloseCb(name, cbFunc)
	if name then
		local layer = uiLayer[name]

		if layer ~= nil then
			layer.cbFunc = cbFunc
		elseif DebugLog then
			SystemHelper.Log(string.format("____[ Layer %s does NOT exists. ]", name))
		end
	elseif DebugLog then
		SystemHelper.Log("____[ Set layer CB with INVALID name...... ]")
	end
end

function UILayerCtrl.Remove(name)
	if uiLayer and name then
		local layer = uiLayer[name]

		if layer ~= nil then
			for k, v in pairs(layer.buttons) do
				layer.buttons[k] = nil
			end

			for k, v in pairs(layer.individuals) do
				layer.individuals[k] = nil
			end

			layer.buttons = nil
			layer.individuals = nil
			layer.initBtn = nil
			layer.lastBtn = nil
			layer.cbFunc = nil
			uiLayer[name] = nil
		end
	elseif DebugLog then
		SystemHelper.Log("____[ NULL layer or NO layer or INVALID layer name. ]")
	end
end

function UILayerCtrl.SetPopCB(name, cbFunc)
	if uiLayer and name then
		local layer = uiLayer[name]

		if layer ~= nil then
			layer.cbFunc = cbFunc
		else
			SystemHelper.Log(string.format("____[ SetPopCB: Layer %s does NOT exists. ]", name))
		end
	elseif current > 0 then
		currentLayer.cbFunc = cbFunc
	end
end

function UILayerCtrl.Clear()
	if DebugLog then
		SystemHelper.Log("____[ UILayerCtrl: Clear() ]")
	end

	UILayerCtrl.PopAll()

	for k, _ in pairs(uiLayer) do
		UILayerCtrl.Remove(k)
	end
end

function UILayerCtrl.Revalidate(isJoystickAttached)
	if currentLayer and currentButton then
		currentButton:SetSelectedLight(isJoystickAttached)
	end
end

function UILayerCtrl.Push(name, btn, special, subIndex)
	if name then
		if current > 0 then
			for i = 1, current do
				if uiStack[i] == name then
					if DebugLog then
						SystemHelper.Log(string.format("____[ Push duplicated layer: %s ]", name))
					end

					return false
				end
			end
		end

		if special then
			for i = 1, spCurrent do
				if spStack[i] == name then
					if DebugLog then
						SystemHelper.Log(string.format("____[ Push duplicated sp layer: %s ]", name))
					end

					return false
				end
			end
		end

		local swapFlag = false
		local uiCurrent = uiStack[current]

		if current > 1 and (name == "PanelDeath" or name == "SelectItem" or name == "MapView") and (uiCurrent == "Settings1" or uiCurrent == "Settings2" or uiCurrent == "Settings3" or uiCurrent == "PlayerInfoBag" or uiCurrent == "PlayerInfoBooty" or uiCurrent == "PlayerInfoAlchemy" or uiCurrent == "PlayerInfoTalent1" or uiCurrent == "PlayerInfoTalent2" or uiCurrent == "PlayerInfoTalent3" or uiCurrent == "PlayerInfoTalent4" or uiCurrent == "PlayerInfoTalentDetail" or uiCurrent == "PlayerInfoTalent" or uiCurrent == "PlayerInfoProperty" or uiCurrent == "SelectItem" or uiCurrent == "Skill") then
			swapFlag = true
		end

		if sceneController then
			local gamepadCtrl = sceneController:GetGamePadControllerForMovement()

			if gamepadCtrl then
				if name == "GameMain" then
					gamepadCtrl:SetLeftMode(GamePadController.ModeNormal)
				else
					gamepadCtrl:SetLeftMode(GamePadController.ModeUI)
				end
			end
		end

		if special then
			spCurrent = spCurrent + 1
			spStack[spCurrent] = name

			if sceneController then
				local gamepadCtrl = sceneController:GetGamePadControllerForMovement()

				if gamepadCtrl then
					gamepadCtrl:ClearInput()

					gamepadCtrl.enabled = false
				end
			end
		else
			current = current + 1
			uiStack[current] = name

			if DebugLog then
				SystemHelper.Log("____[ UILayerCtrl.Push: " .. name .. " @ " .. current .. " ]")
			end
		end

		if swapFlag then
			local layerIndex = current
			local tempLayer

			repeat
				tempLayer = uiStack[layerIndex - 1]
				uiStack[layerIndex - 1] = uiStack[layerIndex]
				uiStack[layerIndex] = tempLayer

				if DebugLog then
					SystemHelper.Log("Swap: " .. uiStack[layerIndex] .. " <=> " .. uiStack[layerIndex - 1])
				end

				layerIndex = layerIndex - 1
			until layerIndex > 1 and uiStack[layerIndex - 1] == "GameMain"

			if not special then
				local tempLayer = uiLayer[name]

				if btn then
					tempLayer.initBtn = btn
					tempLayer.lastBtn = btn
				else
					tempLayer.initBtn = nil
					tempLayer.lastBtn = nil

					if DebugLog then
						SystemHelper.Log("____[ NO button is activated ]")
					end
				end
			end

			return true
		elseif currentLayer and currentButton then
			if currentLayer.lastBtn then
				if DebugLog then
					SystemHelper.Log("____[ De-activate button: " .. currentLayer.lastBtn .. " ]")
				end

				currentButton:SetSelectedLight(false)
			else
				if DebugLog then
					SystemHelper.Log("____[ De-activate button: NULL ... CAUSION!!! ]")
				end

				currentButton = nil
			end
		end

		if not special then
			currentLayer = uiLayer[name]

			if btn then
				currentLayer.initBtn = btn
				currentLayer.lastBtn = btn
				currentButton = currentLayer.buttons[btn]

				if currentButton and (LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected) then
					if DebugLog then
						SystemHelper.Log("____[ Activate button: " .. btn .. " ]")
					end

					currentButton:SetSelectedLight(true)
				elseif DebugLog then
					SystemHelper.Log("____[ Caution: Could NOT find the button: " .. btn .. " ]")
				end
			else
				currentLayer.initBtn = nil
				currentLayer.lastBtn = nil
				currentButton = nil

				if DebugLog then
					SystemHelper.Log("____[ NO button is activated ]")
				end
			end
		end

		UILayerCtrl.ResetSkip()
		UnityEngine.Input.ResetInputAxes()
		inputMgr:ResetKeys()

		return true
	end

	return false
end

function UILayerCtrl.Pop(special)
	if special then
		if spCurrent == 0 then
			if DebugLog then
				SystemHelper.Log("____[ No more SP layer to pop ]")
			end
		elseif spCurrent > 0 then
			if sceneController then
				local gamepadCtrl = sceneController:GetGamePadControllerForMovement()

				if gamepadCtrl then
					gamepadCtrl:ClearInput()

					gamepadCtrl.enabled = true
				end
			end

			if currentLayer.lastBtn and currentButton then
				currentButton:SetSelectedLight(false)
			end

			if DebugLog then
				SystemHelper.Log("[ UILayerCtrl.PopSP: " .. spStack[spCurrent] .. " from " .. spCurrent .. " ]")
			end

			spStack[spCurrent] = nil
			spCurrent = spCurrent - 1

			if spCurrent > 0 then
				if sceneController then
					local gamepadCtrl = sceneController:GetGamePadControllerForMovement()

					if gamepadCtrl then
						gamepadCtrl:SetLeftMode(GamePadController.ModeUI)
					end
				end

				currentLayer = uiLayer[spStack[spCurrent]]

				if currentLayer.lastBtn then
					currentButton = currentLayer.buttons[currentLayer.lastBtn]

					if currentButton then
						if DebugLog then
							SystemHelper.Log("____[ Re-Activate button: " .. currentLayer.lastBtn .. " ]")
						end

						currentButton:SetSelectedLight(false)

						if LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected then
							currentButton:SetSelectedLight(true)
						end
					end
				end
			elseif current > 0 then
				if sceneController then
					local gamepadCtrl = sceneController:GetGamePadControllerForMovement()

					if gamepadCtrl then
						if uiStack[current] == "GameMain" then
							gamepadCtrl:SetLeftMode(GamePadController.ModeNormal)
						else
							gamepadCtrl:SetLeftMode(GamePadController.ModeUI)
						end
					end
				end

				currentLayer = uiLayer[uiStack[current]]

				if currentLayer.lastBtn then
					currentButton = currentLayer.buttons[currentLayer.lastBtn]

					if currentButton then
						if DebugLog then
							SystemHelper.Log("____[ Re-Activate button: " .. currentLayer.lastBtn .. " ]")
						end

						currentButton:SetSelectedLight(false)

						if LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected then
							currentButton:SetSelectedLight(true)
						end
					end
				end
			else
				currentLayer = nil
				currentButton = nil

				if DebugLog then
					SystemHelper.Log("[ Touching bottom of the UI stack...... ]")
				end
			end
		end
	elseif current == 0 then
		if DebugLog then
			SystemHelper.Log("[ No more layer to pop ]")
		end
	elseif current > 0 then
		if currentLayer.lastBtn and currentButton then
			currentButton:SetSelectedLight(false)
		end

		if DebugLog then
			SystemHelper.Log("[ UILayerCtrl.Pop: " .. uiStack[current] .. " from " .. current .. " ]")
		end

		uiStack[current] = nil
		current = current - 1

		if spCurrent == 0 then
			if current > 0 then
				if sceneController then
					local gamepadCtrl = sceneController:GetGamePadControllerForMovement()

					if gamepadCtrl then
						if uiStack[current] == "GameMain" then
							gamepadCtrl:SetLeftMode(GamePadController.ModeNormal)
						else
							gamepadCtrl:SetLeftMode(GamePadController.ModeUI)
						end
					end
				end

				currentLayer = uiLayer[uiStack[current]]

				if currentLayer.lastBtn then
					currentButton = currentLayer.buttons[currentLayer.lastBtn]

					if currentButton then
						if DebugLog then
							SystemHelper.Log("____[ Re-Activate button: " .. currentLayer.lastBtn .. " ]")
						end

						currentButton:SetSelectedLight(false)

						if LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected then
							currentButton:SetSelectedLight(true)
						end
					end
				end
			else
				currentLayer = nil
				currentButton = nil

				if DebugLog then
					SystemHelper.Log("[ ________ Touching bottom of the UI stack ________ ]")
				end
			end
		end
	end

	UnityEngine.Input.ResetInputAxes()
	inputMgr:ResetKeys()
end

function UILayerCtrl.PopAll()
	sceneController = nil

	if DebugLog then
		SystemHelper.Log("____[ UILayerCtrl: Pop all layers...... ]")
	end

	while current > 0 do
		this.Pop()
	end

	while spCurrent > 0 do
		this.Pop(true)
	end

	UnityEngine.Input.ResetInputAxes()
end

function UILayerCtrl.TryModifyButtonInPreviousLayer(currLName, btnName)
	if current > 1 and uiStack[current] == currLName then
		uiLayer[uiStack[current - 1]].lastBtn = btnName
	end
end

function UILayerCtrl.Select(pos)
	if currentLayer then
		if currentButton then
			local button, adjacent = UILayerCtrl.SearchNextBtn(currentButton, pos)

			if button then
				return button, adjacent
			end
		elseif DebugLog then
			SystemHelper.Log("[ Null button...... ]")
		end
	elseif DebugLog then
		SystemHelper.Log("[ Null layer...... ]")
	end

	return nil, nil
end

function UILayerCtrl.SearchNextBtn(button, pos)
	local adjacent = button:GetAdjacent(pos)

	if adjacent then
		local btn = currentLayer.buttons[adjacent]

		if DebugLog then
			SystemHelper.Log("[ DPad: " .. pos .. " => Select button: " .. adjacent .. " ]")
		end

		if btn and btn ~= currentButton then
			if btn.gameObject.activeSelf then
				currentLayer.lastBtn = adjacent

				currentButton:SetSelectedLight(false)

				currentButton = btn

				currentButton:SetSelectedLight(true)

				return currentButton, adjacent
			else
				return UILayerCtrl.SearchNextBtn(btn, pos)
			end
		else
			return nil, nil
		end
	else
		return nil, nil
	end
end

function UILayerCtrl.OnSelect(btn, ignore)
	if currentLayer and btn then
		if currentButton and not ignore then
			currentButton:SetSelectedLight(false)
		end

		currentButton = currentLayer.buttons[btn]

		if currentButton then
			isProcessed = true
			currentLayer.lastBtn = btn

			if LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected then
				currentButton:SetSelectedLight(true)
			end
		elseif DebugLog then
			SystemHelper.Log("[ UILayerCtrl.OnSelect( Missing: " .. btn .. " ) ]")
		end
	end
end

function UILayerCtrl.AddButton(name, btn, com)
	if name ~= nil and btn ~= nil and com ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			uiLayer[name].buttons[btn] = com

			return true
		end
	end

	if DebugLog then
		SystemHelper.Log("[ Error in UILayerCtrl.AddButton: Null name or button or component => " .. name .. " - " .. btn .. " ]")
	end

	return false
end

function UILayerCtrl.RemoveButton(name, btn)
	if name ~= nil and btn ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			uiLayer[name].buttons[btn] = nil

			return true
		end
	end

	if DebugLog then
		SystemHelper.Log("[ Error in UILayerCtrl.RemoveButton: Null name or button or component => " .. name .. " - " .. btn .. " ]")
	end

	return false
end

function UILayerCtrl.AddIndividual(name, btn, com)
	if name ~= nil and btn ~= nil and com ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			uiLayer[name].individuals[btn] = com

			return true
		end
	end

	if DebugLog then
		SystemHelper.Log("[ Error in UILayerCtrl.AddIndividual: Null name or button or component. ]")
	end

	return false
end

function UILayerCtrl.RemoveIndividual(name, btn)
	if name ~= nil and btn ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			uiLayer[name].individuals[btn] = nil

			return true
		end
	end

	if DebugLog then
		SystemHelper.Log("[ Error in UILayerCtrl.RemoveIndividual: Null name or button or component. ]")
	end

	return false
end

function UILayerCtrl.GetButton(name, btn)
	if name ~= nil and btn ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			local button = layer.buttons[btn]

			return button
		end
	end

	if DebugLog then
		SystemHelper.Log("[ Error in UILayerCtrl.GetButton: Invalid layer name or button name. ]")
	end

	return nil
end

function UILayerCtrl.GetIndividual(name, btn)
	if name ~= nil and btn ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			local button = layer.individuals[btn]

			return button
		end
	end

	if DebugLog then
		SystemHelper.Log("[ Error in UILayerCtrl.GetIndividual: Invalid layer name or button name. ]")
	end

	return nil
end

function UILayerCtrl.UpdateAdjacencies(name, btn)
	if name ~= nil and btn ~= nil then
		local layer = uiLayer[name]

		if layer ~= nil then
			local buttons = layer.buttons
			local button = buttons[btn]

			if button ~= nil then
				local adjacencies = {}

				for pos = 1, 4 do
					local key = button:GetAdjacent(pos)

					if key ~= nil then
						adjacencies[pos] = buttons[key]
					end
				end
			end
		end
	elseif DebugLog then
		SystemHelper.Log("[ UILayerCtrl.UpdateAdjacencies: Invalid layer name or button name. ]")
	end
end

function UILayerCtrl.GetAdjacentButtonName(name, btn, pos)
	local adjName

	if name ~= nil and btn ~= nil and pos > 0 and pos < 5 then
		local layer = uiLayer[name]

		if layer ~= nil then
			local buttons = layer.buttons
			local button = buttons[btn]

			if button ~= nil then
				adjName = btn:GetAdjacent(pos)
			end
		end
	end

	return adjName
end

function UILayerCtrl.GetCurrentButtonName()
	if current > 0 and currentLayer ~= nil and currentLayer.lastBtn ~= nil and currentButton ~= nil then
		return currentLayer.lastBtn
	else
		return nil
	end
end

function UILayerCtrl.GetCurrentButton()
	if current > 0 and currentLayer ~= nil and currentLayer.lastBtn ~= nil and currentButton ~= nil then
		if DebugLog then
			SystemHelper.Log("[ GetCurrentButton: OK ]")
		end

		return currentButton
	else
		if DebugLog then
			SystemHelper.Log("[ GetCurrentButton: NONE ]")
		end

		return nil
	end
end

function UILayerCtrl.GetCurrentLayerName()
	if current > 0 and current == #uiStack then
		return uiStack[current]
	end

	return nil
end

function UILayerCtrl.IsCurrentLayerCurtain()
	if spCurrent > 0 and spCurrent == #spStack then
		return spStack[spCurrent] == "Curtain"
	end

	return false
end

function UILayerCtrl.IsCurrentLayerMsgBox()
	if current > 0 and current == #uiStack then
		return uiStack[current] == "MsgBoxSimple"
	end

	return false
end

function UILayerCtrl.OnCursorMove()
	if currentLayer and currentButton and currentButton.gameObject.activeSelf then
		isProcessed = true

		currentButton:SetNormal()
		currentButton:OnDown(nil, nil)

		if currentButton then
			currentButton:SetHighlighted()
		end
	elseif DebugLog then
		SystemHelper.Log("[ UILayerCtrl.OnCursorMove: Could not find an active button ]")
	end
end

function UILayerCtrl.OnCursorClick()
	if currentLayer and currentButton and currentButton.gameObject.activeSelf then
		if currentButton:IsDisabled() then
			return
		end

		isProcessed = true

		currentButton:SetNormal()
		currentButton:OnDown(nil, nil)

		if currentButton then
			currentButton:OnClick(nil, nil)
		end

		if currentButton then
			if currentButton:IsDisabled() then
				return
			end

			currentButton:SetHighlighted()
		end
	elseif DebugLog then
		SystemHelper.Log("[ UILayerCtrl.OnCursorClick: Could not find an active button ]")
	end
end

function UILayerCtrl.OnCursorClickMute()
	if currentLayer and currentButton and currentButton.gameObject.activeSelf then
		if currentButton:IsDisabled() then
			return
		end

		isProcessed = true

		currentButton:SetNormal()
		currentButton:OnDownMute(nil, nil)

		if currentButton then
			currentButton:OnClick(nil, nil)
		end

		if currentButton then
			if currentButton:IsDisabled() then
				return
			end

			currentButton:SetHighlighted()
		end
	elseif DebugLog then
		SystemHelper.Log("[ UILayerCtrl.OnCursorClickMute: Could not find an active button ]")
	end
end

function UILayerCtrl.OnButtonClick(btn)
	if btn and currentLayer then
		local button = currentLayer.individuals[btn]

		if button and button.gameObject.activeSelf then
			isProcessed = true

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	elseif DebugLog then
		SystemHelper.Log("[ UILayerCtrl.OnButtonClick: Could not find individual button " .. btn .. " ]")
	end
end

function UILayerCtrl.OnButtonClickMute(btn)
	if btn and currentLayer then
		local button = currentLayer.individuals[btn]

		if button and button.gameObject.activeSelf then
			isProcessed = true

			button:OnDownMute(nil, nil)
			button:OnClick(nil, nil)
		end
	elseif DebugLog then
		SystemHelper.Log("[ UILayerCtrl.OnButtonClickMute: Could not find individual button(Mute): " .. btn .. " ]")
	end
end

function UILayerCtrl.GetCurrent()
	return current
end

function UILayerCtrl.ResetSkip()
	isHolding = false
	startTime = 0
	elapsedTime = 0
end

function UILayerCtrl.SetSkipThreshold(duration)
	thresholdTime = duration
end

function UILayerCtrl.OnPressSkip(updateIndicator)
	isHolding = true
	elapsedTime = 0
	startTime = TimeHelper.getNowTimeNoScale()

	if updateIndicator and type(updateIndicator) == "function" then
		updateIndicator(0)
	end
end

function UILayerCtrl.OnReleaseSkip(updateIndicator)
	isHolding = false
	elapsedTime = 0
	startTime = 0

	if updateIndicator and type(updateIndicator) == "function" then
		updateIndicator(0)
	end
end

function UILayerCtrl.UpdateSkipping(updateIndicator, onSkipCb)
	if isHolding and startTime > 0 then
		elapsedTime = TimeHelper.getNowTimeNoScale() - startTime

		if elapsedTime < thresholdTime then
			if updateIndicator and type(updateIndicator) == "function" then
				updateIndicator(elapsedTime / thresholdTime)
			end
		elseif onSkipCb and type(onSkipCb) == "function" then
			onSkipCb()
			UILayerCtrl.ForceUpdate(0.7)
		end
	end
end

return UILayerCtrl
