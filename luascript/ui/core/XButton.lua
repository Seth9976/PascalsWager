-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XButton.lua

require("LuaScript/UI/Core/XObject")

XButton = class("XButton", XObject)
XButton.static.State = {
	Disabled = 4,
	Pressed = 3,
	Highlighted = 2,
	Normal = 1
}
XButton.static.ButtonMode = {
	Common = 1,
	Radio = 2,
	Check = 3
}
XButton.static.Adjacent = {
	RIGHT = 4,
	UP = 1,
	LEFT = 3,
	DOWN = 2
}
XButton.static.AdvancedType = {
	LongPress = 1
}

function XButton:initialize(object)
	self.gameObject = object
	self.transform = object.transform
	self.mode = XButton.ButtonMode.Common
	self.btnState = XButton.State.Normal
	self.selected = false
	self.callBackTbl = {}
	self.params = {}
	self.btnCom = self.transform:GetComponent("Button")

	if self.btnCom == nil then
		SystemHelper.LogTest("节点" .. self.gameObject.name .. "没有button组件")
	end

	self.isPointerDown = false
	self.isPointerInside = false
	self.pointerDownSuccess = false
	self.allowDrag = false
	self.isDrag = false
	self.isRepeat = false
	self.parentScroll = nil

	self:Init()

	self.group = nil
	self.audioEnabled = true
	self.buttonAudioType = AudioCtrl.ButtonClickType.Common
	self.adjacentButtons = {}
	self.selectedLight = self.transform:Find("SelectedLight")
	self.lastOnDownTime = 0
	self.independentHighlight = false
end

function XButton:Init()
	if self.btnCom ~= nil then
		self.btnCom.interactable = false
	end

	self.btnCom.enabled = false

	self:EvaluateState()
	self:Register(EventTriggerType.PointerClick)
	self:Register(EventTriggerType.PointerDown)
	self:Register(EventTriggerType.PointerUp)
	self:Register(EventTriggerType.PointerEnter)
	self:Register(EventTriggerType.PointerExit)
end

function XButton:Register(eventType)
	if eventType == EventTriggerType.PointerClick then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.PointerClick, function(obj, data, param)
			self:OnClick(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.PointerDown then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.PointerDown, function(obj, data, param)
			self:OnDown(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.PointerUp then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.PointerUp, function(obj, data, param)
			self:OnUp(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.PointerEnter then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.PointerEnter, function(obj, data, param)
			self:OnEnter(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.PointerExit then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.PointerExit, function(obj, data, param)
			self:OnExit(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.BeginDrag then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.BeginDrag, function(obj, data, param)
			self:OnBeginDrag(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.Drag then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.Drag, function(obj, data, param)
			self:OnDrag(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.EndDrag then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.EndDrag, function(obj, data, param)
			self:OnEndDrag(obj, data, param)
		end, 0)
	elseif eventType == EventTriggerType.Scroll then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.Scroll, function(obj, data, param)
			if self.parentScroll ~= nil then
				self.parentScroll:OnScroll(obj, data, param)
			end
		end, 0)
	end
end

function XButton:SelectOnStart(isOn)
	if self.mode ~= XButton.ButtonMode.Common then
		self:SetSelected(isOn)
	end

	self:EvaluateState()
end

function XButton:SetMode(mode)
	self.mode = mode
end

function XButton:SetState(state, forceSet)
	local instantSet = true

	if self.btnState == state then
		if forceSet then
			instantSet = true
		else
			return
		end
	end

	self.btnState = state

	self:DoDefaultStateTransition(self.btnState, instantSet)
end

function XButton:GetState()
	return self.btnState
end

function XButton:SetAudioEnable(isEnable)
	self.audioEnabled = isEnable
end

function XButton:SetAudioType(type)
	self.buttonAudioType = type
end

function XButton:SetEventCallBack(eventType, callback, params)
	if self.callBackTbl[eventType] == nil then
		self:Register(eventType)
	end

	self.callBackTbl[eventType] = callback
	self.params = params

	if eventType == EventTriggerType.BeginDrag or eventType == EventTriggerType.Drag or eventType == EventTriggerType.EndDrag then
		self.allowDrag = true
	end
end

function XButton:OnDown(obj, data, param)
	if self.btnState == XButton.State.Disabled then
		return
	end

	if self.mode == XButton.ButtonMode.Radio and self.selected then
		return
	end

	if self.audioEnabled then
		AudioCtrl.SetButtonClickAudio(self.buttonAudioType)
	else
		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.None)
	end

	local success = true

	if self.callBackTbl[EventTriggerType.PointerDown] then
		success = self.callBackTbl[EventTriggerType.PointerDown](obj, data, param)
	end

	self.isPointerDown = true
	self.isDrag = false
	self.pointerDownSuccess = true

	self:EvaluateState()
end

function XButton:OnDownMute(obj, data, param)
	if self.btnState == XButton.State.Disabled then
		return
	end

	if self.mode == XButton.ButtonMode.Radio and self.selected then
		return
	end

	AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.None)

	local success = true

	if self.callBackTbl[EventTriggerType.PointerDown] then
		success = self.callBackTbl[EventTriggerType.PointerDown](obj, data, param)
	end

	self.isPointerDown = true
	self.isDrag = false
	self.pointerDownSuccess = true

	self:EvaluateState()
end

function XButton:OnUp(obj, data, param)
	if self.btnState == XButton.State.Disabled then
		return
	end

	if not self.pointerDownSuccess then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.PointerUp] then
		success = self.callBackTbl[EventTriggerType.PointerUp](obj, data, param)
	end

	self.isPointerDown = false

	self:EvaluateState()
end

function XButton:OnClick(obj, data, param)
	if self.btnState == XButton.State.Disabled then
		return
	end

	if not self.pointerDownSuccess then
		return
	end

	self.pointerDownSuccess = false

	if self.allowDrag and self.isDrag then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.PointerClick] then
		success = self.callBackTbl[EventTriggerType.PointerClick](obj, data, param)
	end

	if success == false then
		return
	end

	if self.mode == XButton.ButtonMode.Common then
		-- block empty
	elseif self.mode == XButton.ButtonMode.Radio then
		self:SetSelected(true)
	elseif self.mode == XButton.ButtonMode.Check then
		self:SetSelected(not self.selected)
	end

	self.isPointerDown = false

	self:EvaluateState()
end

function XButton:OnBeginDrag(obj, data, param)
	if not self.allowDrag then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.BeginDrag] then
		success = self.callBackTbl[EventTriggerType.BeginDrag](obj, data, param)
	end

	if self.parentScroll then
		self.parentScroll.scrollRectCom:OnBeginDrag(data)
	end

	self.isDrag = true
end

function XButton:OnDrag(obj, data, param)
	if not self.allowDrag then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.Drag] then
		success = self.callBackTbl[EventTriggerType.Drag](obj, data, param)
	end

	if self.parentScroll then
		self.parentScroll.scrollRectCom:OnDrag(data)
	end

	self.isDrag = true
end

function XButton:OnEndDrag(obj, data, param)
	if not self.allowDrag then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.EndDrag] then
		success = self.callBackTbl[EventTriggerType.EndDrag](obj, data, param)
	end

	if self.parentScroll then
		self.parentScroll.scrollRectCom:OnEndDrag(data)
	end

	self.isDrag = true
end

function XButton:OnEnter(obj, data, param)
	if self.btnState == XButton.State.Disabled then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.PointerEnter] then
		success = self.callBackTbl[EventTriggerType.PointerEnter](obj, data, param)
	end

	self.isPointerInside = true

	self:EvaluateState()
end

function XButton:OnExit(obj, data, param)
	if self.btnState == XButton.State.Disabled then
		return
	end

	local success = true

	if self.callBackTbl[EventTriggerType.PointerExit] then
		success = self.callBackTbl[EventTriggerType.PointerExit](obj, data, param)
	end

	self.isPointerInside = false

	self:EvaluateState()
end

function XButton:OnSelect()
	if self.callBackTbl[EventTriggerType.Select] then
		self.callBackTbl[EventTriggerType.Select]()
	end
end

function XButton:OnDeselect()
	if self.callBackTbl[EventTriggerType.Deselect] then
		self.callBackTbl[EventTriggerType.Deselect]()
	end
end

function XButton:SetInteractable(flag)
	local eventListener = self.gameObject:GetComponent("EventTriggerListener")

	eventListener.enabled = flag
end

function XButton:SetDisabled(forceSet)
	if self.btnState == XButton.State.Disabled and not forceSet then
		return
	end

	if self.longPressTimer ~= nil then
		self.longPressTimer:Stop()
	end

	self:SetSelected(false)
	self:SetState(XButton.State.Disabled, forceSet)
end

function XButton:SetNormal(forceSet)
	if self.btnState == XButton.State.Normal and not forceSet then
		return
	end

	self:SetState(XButton.State.Normal, forceSet)
	self:SetSelected(false)
end

function XButton:SetHighlighted()
	if self.btnState == XButton.State.Highlighted then
		return
	end

	self:SetState(XButton.State.Highlighted)
	self:SetSelected(true)
end

function XButton:SetSelected(flag)
	if flag == self.selected then
		return
	end

	self.selected = flag

	if flag then
		self:OnSelect()
	else
		self:OnDeselect()
	end

	if self.group ~= nil and self.mode == XButton.ButtonMode.Radio and self.selected then
		self.group:NotifyOn(self)
	end
end

function XButton:EvaluateState()
	if self.btnState == XButton.State.Disabled then
		-- block empty
	elseif self.isPointerDown and self.isPointerInside then
		self:SetState(XButton.State.Pressed)
	elseif self.selected then
		self:SetState(XButton.State.Highlighted)
	else
		self:SetState(XButton.State.Normal)
	end
end

function XButton:IsHighlighted()
	return self.selected
end

function XButton:IsDisabled()
	if self.btnState == XButton.State.Disabled then
		return true
	end

	return false
end

function XButton:SetParentScroll(scroll)
	self.parentScroll = scroll

	self:Register(EventTriggerType.BeginDrag)
	self:Register(EventTriggerType.Drag)
	self:Register(EventTriggerType.EndDrag)
	self:Register(EventTriggerType.Scroll)

	self.allowDrag = true
end

function XButton:DoDefaultStateTransition(state, instant)
	if self.btnCom == nil or IsNil(self.btnCom) then
		return
	end

	local tintColor, transitionSprite, triggerName

	if state == XButton.State.Normal then
		tintColor = self.btnCom.colors.normalColor
		transitionSprite = nil
		triggerName = self.btnCom.animationTriggers.normalTrigger
	elseif state == XButton.State.Highlighted then
		tintColor = self.btnCom.colors.highlightedColor
		transitionSprite = self.btnCom.spriteState.highlightedSprite
		triggerName = self.btnCom.animationTriggers.highlightedTrigger
	elseif state == XButton.State.Pressed then
		tintColor = self.btnCom.colors.pressedColor
		transitionSprite = self.btnCom.spriteState.pressedSprite
		triggerName = self.btnCom.animationTriggers.pressedTrigger
	elseif state == XButton.State.Disabled then
		tintColor = self.btnCom.colors.disabledColor
		transitionSprite = self.btnCom.spriteState.disabledSprite
		triggerName = self.btnCom.animationTriggers.disabledTrigger
	else
		tintColor = Color.black
		transitionSprite = nil
		triggerName = ""
	end

	if self.gameObject.activeSelf then
		if self.btnCom.transition == UnityEngine.UI.Selectable.Transition.ColorTint then
			self:StartColorTween(tintColor, instant)
		elseif self.btnCom.transition == UnityEngine.UI.Selectable.Transition.SpriteSwap then
			self:DoSpriteSwap(transitionSprite)
		elseif self.btnCom.transition == UnityEngine.UI.Selectable.Transition.Animation then
			self:TriggerAnimation(triggerName)
		end
	end
end

function XButton:SetHighlightedAndPressedSprite(sprite)
	local ss = self.btnCom.spriteState

	ss.highlightedSprite = sprite
	ss.pressedSprite = sprite
	self.btnCom.spriteState = ss
end

function XButton:StartColorTween(targetColor, instant)
	if IsNil(self.btnCom.targetGraphic) then
		return
	end

	local duration

	duration = instant and 0 or self.btnCom.colors.fadeDuration

	self.btnCom.targetGraphic:CrossFadeColor(targetColor, duration, true, true)
end

function XButton:DoSpriteSwap(newSprite)
	if IsNil(self.btnCom.image) then
		return
	end

	self.btnCom.image.overrideSprite = newSprite
end

function XButton:TriggerAnimation(triggername)
	if IsNil(self.btnCom.animator) or triggername == "" then
		return
	end

	if self.btnCom.animator.isActiveAndEnabled == false then
		return
	end

	if IsNil(self.btnCom.animator.runtimeAnimatorController) then
		return
	end

	self.btnCom.animator:ResetTrigger(self.btnCom.animationTriggers.normalTrigger)
	self.btnCom.animator:ResetTrigger(self.btnCom.animationTriggers.pressedTrigger)
	self.btnCom.animator:ResetTrigger(self.btnCom.animationTriggers.highlightedTrigger)
	self.btnCom.animator:ResetTrigger(self.btnCom.animationTriggers.disabledTrigger)
	self.btnCom.animator:SetTrigger(triggername)
end

function XButton:SetText(_text)
	self.transform:Find("Text"):GetComponent("Text").text = _text
end

function XButton:SetAdjacent(pos, name)
	if pos > 0 and pos < 5 then
		self.adjacentButtons[pos] = name
	end
end

function XButton:ClearAdjacent()
	self.adjacentButtons = {}
end

function XButton:GetAdjacent(pos)
	if pos > 0 and pos < 5 then
		return self.adjacentButtons[pos]
	end

	return nil
end

function XButton:SetHighlightIndependent(boo)
	self.independentHighlight = boo
end

function XButton:SetSelectedLight(flag)
	if not IsNil(self.selectedLight) then
		if LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected then
			self.selectedLight.gameObject:SetActive(flag)
		else
			self.selectedLight.gameObject:SetActive(false)
		end

		if not self.independentHighlight then
			if flag then
				self:SetHighlighted()
			else
				self:SetNormal()
			end
		end
	elseif not self.independentHighlight then
		if flag then
			self:SetHighlighted()
		else
			self:SetNormal()
		end
	end
end

function XButton:SetCommonHighlighted(flag)
	if flag then
		self:SetHighlighted()
	else
		self:SetNormal()
	end
end

function XButton:SetLongPressOFF()
	self:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		return
	end, 0)
	self:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		return
	end, 0)
end

function XButton:SetLongPressCallBack(CB, CancelFunc, Longtimes)
	self:SetAudioType(AudioCtrl.ButtonClickType.None)
	self:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	self:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		self.lastOnDownTime = os.clock()

		if self.longPressTimer == nil then
			self.longPressTimer = Timer.New(function()
				if CancelFunc ~= nil and CancelFunc() then
					self.longPressTimer:Stop()
				end

				local passtime = os.clock() - self.lastOnDownTime

				if Longtimes then
					if passtime > 3 then
						CB(Longtimes)
					elseif passtime > 0.5 then
						CB()
					end
				elseif passtime > 0.5 then
					CB()
				end
			end, 0.1, -1, true)
		else
			self.longPressTimer:Reset(function()
				if CancelFunc ~= nil and CancelFunc() then
					self.longPressTimer:Stop()
				end

				local passtime = os.clock() - self.lastOnDownTime

				if Longtimes then
					if passtime > 3 then
						CB(Longtimes)
					elseif passtime > 0.5 then
						CB()
					end
				elseif passtime > 0.5 then
					CB()
				end
			end, 0.1, -1, true)
		end

		self.longPressTimer:Start()
		CB()
	end, 0)
	self:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		if self.longPressTimer ~= nil then
			self.longPressTimer:Stop()
		end
	end, 0)
end

return XButton
