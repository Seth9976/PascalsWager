-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/SkipCtrl.lua

SkipCtrl = class("SkipCtrl", UICtrlBase)
SkipCtrl.static.Name = "Skip"

local this = SkipCtrl

this.uilayer = UICtrlBase.UILayer.Tips

local goSkip, btnActive, btnSkip, cbSkip, indicator, maskBarU, maskBarD, idleTimer

function SkipCtrl.OnCreate()
	UILayerCtrl.Add(SkipCtrl.Name)
	UILayerCtrl.SetSkipThreshold(0.5)

	idleTimer = {}
	idleTimer.active = false
	idleTimer.startTime = 0
	idleTimer.elapsedTime = 0
	idleTimer.idleThreshold = 3
	goSkip = this.mainComponent:GetGameObject("Skip")
	btnActive = {}
	btnActive.go = this.mainComponent:GetGameObject("Skip_SkipBG")
	btnSkip = {}
	btnSkip.go = this.mainComponent:GetGameObject("Skip_SkipBG_SkipBtn")

	local button = this.mainComponent:GetButton("Skip_SkipBG")

	button:SetAudioEnable(false)
	button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		btnSkip.go:SetActive(true)
		this.StartIdleTimer()
	end, 0)

	btnActive.btn = button

	UILayerCtrl.AddIndividual(SkipCtrl.Name, "Skip_SkipBG", btnActive.btn)

	local button = this.mainComponent:GetButton("Skip_SkipBG_SkipBtn")

	button:SetAudioEnable(false)
	button:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		this.StopIdleTimer()
		UILayerCtrl.OnPressSkip(SkipCtrl.SetIndicatorProgress)
	end, 0)
	button:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		this.StartIdleTimer()
		UILayerCtrl.OnReleaseSkip(SkipCtrl.SetIndicatorProgress)
	end, 0)

	btnSkip.btn = button

	UILayerCtrl.AddIndividual(SkipCtrl.Name, "Skip_SkipBG_SkipBtn", btnSkip.btn)

	indicator = {}
	indicator.circle = XImage:new(this.mainComponent:GetGameObject("Skip_SkipBG_Indicator_Circle"))

	indicator.circle:SetFillAmount(0)

	local btnIcon = XImage:new(this.mainComponent:GetGameObject("Skip_SkipBG_Indicator_JsBtn"))

	if btnIcon then
		local iconName = LS_Setting.platform .. "_" .. string.lower(GBKey.A)
		local sprite = XObjectPool.GetIcon(iconName)

		if sprite then
			btnIcon:SetSprite(sprite)
			btnIcon.gameObject:SetActive(LS_Setting.isJoystickConnected)
		else
			btnIcon.gameObject:SetActive(false)
		end
	end

	indicator.btnIcon = btnIcon
	maskBarU = this.mainComponent:GetGameObject("Skip_BarU")
	maskBarD = this.mainComponent:GetGameObject("Skip_BarD")

	if SystemHelper.isSubquadrateScrAS() then
		local rectUTf = maskBarU:GetComponent("RectTransform")
		local rectU = rectUTf.rect
		local rectDTf = maskBarD:GetComponent("RectTransform")
		local rectD = rectDTf.rect
		local designWidth = LS_Setting.designWidth
		local aHeight = designWidth * SystemHelper.GetScreenHeight() / SystemHelper.GetScreenWidth()
		local mHeight = designWidth * ControllerMain.CameraAspectHeight / ControllerMain.CameraAspectWidth
		local maskHeight = 0.5 * (aHeight - mHeight)

		rectUTf.sizeDelta = Vector2.New(0, maskHeight)
		rectDTf.sizeDelta = Vector2.New(0, maskHeight)
	end
end

function SkipCtrl.ApplyMask(show)
	if SystemHelper.isSubquadrateScrAS() then
		maskBarU:SetActive(show)
		maskBarD:SetActive(show)
	end
end

function SkipCtrl.Show()
	UILayerCtrl.Push(SkipCtrl.Name, nil)
	goSkip:SetActive(true)
end

function SkipCtrl.Hide()
	cbSkip = nil

	goSkip:SetActive(false)
	UILayerCtrl.Pop()
end

function SkipCtrl.SetSkipFunc(cb)
	cbSkip = cb
end

function SkipCtrl.StartIdleTimer()
	if idleTimer ~= nil then
		idleTimer.active = true
		idleTimer.elapsedTime = 0
		idleTimer.startTime = TimeHelper.getNowTimeNoScale()
	end
end

function SkipCtrl.StopIdleTimer()
	if idleTimer ~= nil then
		idleTimer.elapsedTime = 0
		idleTimer.startTime = 0
		idleTimer.active = false
	end
end

function SkipCtrl.ResetIdleTimer()
	if idleTimer ~= nil then
		idleTimer.elapsedTime = 0
		idleTimer.startTime = TimeHelper.getNowTimeNoScale()
	end
end

function SkipCtrl.Update()
	if not this.loadFinish then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName and lName == SkipCtrl.Name then
		UILayerCtrl.UpdateSkipping(SkipCtrl.SetIndicatorProgress, SkipCtrl.OnSkip)
		this.GamePadControl()

		if idleTimer ~= nil and idleTimer.active and idleTimer.startTime > 0 then
			if idleTimer.elapsedTime < idleTimer.idleThreshold then
				idleTimer.elapsedTime = TimeHelper.getNowTimeNoScale() - idleTimer.startTime
			else
				this.StopIdleTimer()

				if btnSkip and btnSkip.go then
					btnSkip.go:SetActive(false)
				end
			end
		end
	end
end

function SkipCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
		if btnSkip.go.activeSelf then
			UILayerCtrl.OnReleaseSkip(SkipCtrl.SetIndicatorProgress)
			this.StartIdleTimer()
		end
	elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
		if btnSkip.go.activeSelf then
			UILayerCtrl.OnPressSkip(SkipCtrl.SetIndicatorProgress)
			this.StopIdleTimer()
		else
			UILayerCtrl.OnButtonClick("Skip_SkipBG")
		end
	end
end

function SkipCtrl.SetIndicatorProgress(percent)
	if indicator and indicator.circle then
		if percent >= 0.95 then
			percent = 1
		end

		indicator.circle:SetFillAmount(percent)
	end
end

function SkipCtrl.OnSkip()
	UILayerCtrl.OnReleaseSkip(SkipCtrl.SetIndicatorProgress)

	if cbSkip then
		cbSkip()
	end

	this.StopIdleTimer()

	if btnSkip and btnSkip.go then
		btnSkip.go:SetActive(false)
	end
end

return SkipCtrl
