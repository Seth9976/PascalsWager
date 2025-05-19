-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerInputManager.lua

ControllerInputManager = {}
ControllerInputManager.KeyMap = {
	MoveX = 0,
	ViewX = 2,
	L1 = 8,
	Y = 19,
	MoveY = 1,
	DD = 16,
	X = 6,
	ViewY = 3,
	C2 = 14,
	A = 4,
	DL = 17,
	DR = 18,
	C1 = 13,
	DU = 15,
	R3 = 12,
	L3 = 11,
	R2 = 10,
	L2 = 9,
	R1 = 7,
	B = 5
}
ControllerInputManager.InputDevice = {
	Keyboard = 2,
	Joystick = 1
}
ControllerInputManager.InternalInputMgr = LuaFramework.LuaHelper.GetInputManager()

local isControllerGameMode = false
local isPointerLocked = false
local lastInputDevice = ControllerInputManager.InputDevice.Keyboard

function ControllerInputManager:GetButtonDown(key)
	local keyId = ControllerInputManager.KeyMap[key]
	local state = LS_Setting.OnButtonDownList[keyId]

	if state then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Joystick)
	end

	return state
end

function ControllerInputManager:GetButton(key)
	local keyId = ControllerInputManager.KeyMap[key]

	return LS_Setting.OnButtonList[keyId]
end

function ControllerInputManager:GetButtonUp(key)
	local keyId = ControllerInputManager.KeyMap[key]

	return LS_Setting.OnButtonUpList[keyId]
end

function ControllerInputManager:GetKeyDown(keyCode)
	local state = LS_Setting.GetKeyDown(keyCode)

	return state
end

function ControllerInputManager:GetKey(keyCode)
	return LS_Setting.GetKeyHold(keyCode)
end

function ControllerInputManager:GetKeyUp(keyCode)
	return LS_Setting.GetKeyUp(keyCode)
end

function ControllerInputManager:GetLegacyButtonDown(keyCode)
	local ret = ControllerInputManager.InternalInputMgr:GetLegacyButtonDown(keyCode)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetLegacyButton(keyCode)
	local ret = ControllerInputManager.InternalInputMgr:GetLegacyButton(keyCode)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetLegacyButtonUp(keyCode)
	local ret = ControllerInputManager.InternalInputMgr:GetLegacyButtonUp(keyCode)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetKeyConfirmDown()
	local ret = LS_Setting.GetKeyDown(XKeyCode.Return) or LS_Setting.GetKeyDown(XKeyCode.Space) or LS_Setting.GetKeyDown(XKeyCode.KeypadEnter)

	return ret
end

function ControllerInputManager:GetKeyConfirmUp()
	local ret = LS_Setting.GetKeyUp(XKeyCode.Return) or LS_Setting.GetKeyUp(XKeyCode.Space) or LS_Setting.GetKeyUp(XKeyCode.KeypadEnter)

	return ret
end

function ControllerInputManager:GetKeyCancelDown()
	local ret = LS_Setting.GetKeyDown(XKeyCode.Escape) or LS_Setting.GetKeyDown(XKeyCode.BackQuote)

	return ret
end

function ControllerInputManager:GetKeyCancelUp()
	local ret = LS_Setting.GetKeyUp(XKeyCode.Escape) or LS_Setting.GetKeyUp(XKeyCode.BackQuote)

	return ret
end

function ControllerInputManager:GetKeyL1Down()
	local ret = inputMgr:GetKeyDown(XKeyCode.Z)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetKeyR1Down()
	local ret = inputMgr:GetKeyDown(XKeyCode.C)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetKeyL2Down()
	local ret = inputMgr:GetKeyDown(XKeyCode.Q)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetKeyR2Down()
	local ret = inputMgr:GetKeyDown(XKeyCode.E)

	if ret then
		self:SetLastInputDevice(ControllerInputManager.InputDevice.Keyboard)
	end

	return ret
end

function ControllerInputManager:GetAxis(key)
	local keyId = ControllerInputManager.KeyMap[key]

	return LS_Setting.OnAxisList[keyId] or 0
end

function ControllerInputManager:IsEscapeKeyDown()
	local ret = false

	if Platform == PlatformType.IOS or Platform == PlatformType.TVOS then
		return LS_Setting.GetKeyDown(XKeyCode.Escape) or LS_Setting.GetKeyDown(XKeyCode.BackQuote)
	elseif Platform ~= PlatformType.ANDROID then
		ret = self:GetLegacyButtonDown(XKeyCode.Escape)
	else
		ret = self:GetLegacyButtonDown(XKeyCode.Escape) or self:GetLegacyButtonDown(XKeyCode.BackQuote)
	end

	if ret then
		SystemHelper.Log("Key Escape/BackQuote is pressed down...")
	end

	return ret
end

function ControllerInputManager:RecognizeButton()
	for k, v in pairs(LS_Setting.OnButtonDownList) do
		if v then
			for mapKey, mapValue in pairs(ControllerInputManager.KeyMap) do
				if mapValue == k then
					return mapKey
				end
			end
		end
	end

	return nil
end

function ControllerInputManager:StartKeyBinding()
	ControllerInputManager.InternalInputMgr:StartKeyBinding()
end

function ControllerInputManager:StopKeyBinding()
	ControllerInputManager.InternalInputMgr:StopKeyBinding()
end

function ControllerInputManager:GetKeyCode()
	return ControllerInputManager.InternalInputMgr:GetKeyCode()
end

function ControllerInputManager:GetJoystickCount(playerId)
	return ControllerInputManager.InternalInputMgr:GetJoystickCount(playerId)
end

function ControllerInputManager:IsKeyboardConnected()
	return ControllerInputManager.InternalInputMgr:IsKeyboardConnected()
end

function ControllerInputManager:IsMouseConnected()
	return ControllerInputManager.InternalInputMgr:IsMouseConnected()
end

function ControllerInputManager:SetLuaReturnToTitle(cbFunc)
	ControllerInputManager.InternalInputMgr:SetLuaReturnToTitle(cbFunc)
end

function ControllerInputManager:ForceReturnToTitle()
	ControllerInputManager.InternalInputMgr:ForceReturnToTitle()
end

function ControllerInputManager:SetLuaOnConnect(onconnect)
	ControllerInputManager.InternalInputMgr:SetLuaOnConnect(onconnect)
end

function ControllerInputManager:SetLuaOnDisconnect(ondisconnect)
	ControllerInputManager.InternalInputMgr:SetLuaOnDisconnect(ondisconnect)
end

function ControllerInputManager:GetJoystickType()
	return ControllerInputManager.InternalInputMgr:GetJoystickType()
end

function ControllerInputManager:SetLuaKeyboardOnConnect(onconnect)
	ControllerInputManager.InternalInputMgr:SetLuaKeyboardOnConnect(onconnect)
end

function ControllerInputManager:SetLuaKeyboardOnDisconnect(ondisconnect)
	ControllerInputManager.InternalInputMgr:SetLuaKeyboardOnDisconnect(ondisconnect)
end

function ControllerInputManager:SetLuaMouseOnConnect(onconnect)
	ControllerInputManager.InternalInputMgr:SetLuaMouseOnConnect(onconnect)
end

function ControllerInputManager:SetLuaMouseOnDisconnect(ondisconnect)
	ControllerInputManager.InternalInputMgr:SetLuaMouseOnDisconnect(ondisconnect)
end

function ControllerInputManager:SetLuaOnButtonDown(onbuttondown)
	ControllerInputManager.InternalInputMgr:SetLuaOnButtonDown(onbuttondown)
end

function ControllerInputManager:SetLuaOnButton(onbutton)
	ControllerInputManager.InternalInputMgr:SetLuaOnButton(onbutton)
end

function ControllerInputManager:SetLuaOnButtonUp(onbuttonup)
	ControllerInputManager.InternalInputMgr:SetLuaOnButtonUp(onbuttonup)
end

function ControllerInputManager:SetLuaOnAxis(onaxis)
	return ControllerInputManager.InternalInputMgr:SetLuaOnAxis(onaxis)
end

function ControllerInputManager:SetLuaOnKeyboardConnect(onconnect)
	ControllerInputManager.InternalInputMgr:SetLuaOnKeyboardConnect(onconnect)
end

function ControllerInputManager:SetLuaOnKeyboardDisconnect(ondisconnect)
	ControllerInputManager.InternalInputMgr:SetLuaOnKeyboardDisconnect(ondisconnect)
end

function ControllerInputManager:SetLuaOnMouseConnect(onconnect)
	ControllerInputManager.InternalInputMgr:SetLuaOnMouseConnect(onconnect)
end

function ControllerInputManager:SetLuaOnMouseDisconnect(ondisconnect)
	ControllerInputManager.InternalInputMgr:SetLuaOnMouseDisconnect(ondisconnect)
end

function ControllerInputManager:SetLuaOnKeyDown(onbuttondown)
	ControllerInputManager.InternalInputMgr:SetLuaOnKeyDown(onbuttondown)
end

function ControllerInputManager:SetLuaOnKey(onbutton)
	ControllerInputManager.InternalInputMgr:SetLuaOnKey(onbutton)
end

function ControllerInputManager:SetLuaOnKeyUp(onbuttonup)
	ControllerInputManager.InternalInputMgr:SetLuaOnKeyUp(onbuttonup)
end

function ControllerInputManager:GetMouseX()
	return ControllerInputManager.InternalInputMgr.MouseX
end

function ControllerInputManager:GetMouseY()
	return ControllerInputManager.InternalInputMgr.MouseY
end

function ControllerInputManager:GetMaximumFramesPerSecond()
	return ControllerInputManager.InternalInputMgr:GetDeviceMaximumFramesPerSecond()
end

function ControllerInputManager:GetPointerLocked()
	return isPointerLocked
end

function ControllerInputManager:SetPointerLocked(locked)
	isPointerLocked = locked

	if ControllerInputManager.InternalInputMgr:IsMouseConnected() then
		ControllerInputManager.InternalInputMgr:SetPointerLocked(locked)
	end
end

function ControllerInputManager:ForcePointerUnlocked()
	ControllerInputManager.InternalInputMgr:ForcePointerUnlocked()
end

function ControllerInputManager:ClearButtonInfo()
	for k, v in pairs(LS_Setting.OnButtonDownList) do
		LS_Setting.OnButtonDownList[k] = nil
	end

	for k, v in pairs(LS_Setting.OnButtonList) do
		LS_Setting.OnButtonList[k] = nil
	end

	for k, v in pairs(LS_Setting.OnButtonUpList) do
		LS_Setting.OnButtonUpList[k] = nil
	end

	for k, v in pairs(LS_Setting.OnAxisList) do
		LS_Setting.OnAxisList[k] = nil
	end

	for k, v in pairs(LS_Setting.OnKeyDownList) do
		LS_Setting.OnKeyDownList[k] = false
	end

	for k, v in pairs(LS_Setting.OnKeyList) do
		LS_Setting.OnKeyList[k] = false
	end

	for k, v in pairs(LS_Setting.OnKeyUpList) do
		LS_Setting.OnKeyUpList[k] = false
	end
end

function ControllerInputManager:GetInputKeyState(keyId)
	return ControllerInputManager.InternalInputMgr:GetInputKeyState(keyId)
end

function ControllerInputManager:SetKMMapByIdx(keyIdx, keyCode)
	ControllerInputManager.InternalInputMgr:SetKMMapByIdx(keyIdx, keyCode)
end

function ControllerInputManager:IsInGameMode()
	return ControllerInputManager.InternalInputMgr:IsInGameMode()
end

function ControllerInputManager:IsControllerGameMode()
	return isControllerGameMode
end

function ControllerInputManager:SetInGameMode()
	isControllerGameMode = true

	ControllerInputManager.InternalInputMgr:SetInGameMode()
end

function ControllerInputManager:SetInMenuMode()
	isControllerGameMode = false

	ControllerInputManager.InternalInputMgr:SetInMenuMode()
end

function ControllerInputManager:ResetKeys()
	ControllerInputManager.InternalInputMgr:ResetKeys()
	LS_Setting.ResetKeys()
end

function ControllerInputManager:SetVibration(motorIndex, motorLevel, duration)
	ControllerInputManager.InternalInputMgr:SetVibration(motorIndex, motorLevel, duration)
end

function ControllerInputManager:StopVibration()
	local vplayer = ControllerInputManager.InternalInputMgr:GetPlayer(0)

	if vplayer ~= nil then
		vplayer:StopVibration()
	end
end

function ControllerInputManager:GetLastInputDevice()
	local tempLastInputDevice = ControllerInputManager.InternalInputMgr:GetLastInputDevice()

	if lastInputDevice ~= tempLastInputDevice then
		lastInputDevice = tempLastInputDevice
	end

	return lastInputDevice
end

function ControllerInputManager:SetLastInputDevice(deviceType)
	local bModified = false

	if lastInputDevice ~= deviceType then
		ControllerInputManager.InternalInputMgr:SetLastInputDevice(deviceType)

		LS_Setting.isJoystickConnected = lastInputDevice == ControllerInputManager.InputDevice.Joystick
		lastInputDevice = deviceType
		bModified = true
	end

	return bModified
end

function ControllerInputManager:SetLuaIsGpLastInputDevice(func)
	ControllerInputManager.InternalInputMgr:SetLuaIsGpLastInputDevice(func)
end

return ControllerInputManager
