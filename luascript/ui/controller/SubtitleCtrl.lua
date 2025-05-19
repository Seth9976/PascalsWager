-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/SubtitleCtrl.lua

SubtitleCtrl = class("SubtitleCtrl", UICtrlBase)
SubtitleCtrl.static.Name = "Subtitle"
SubtitleCtrl.static.PanelIndex = {
	Top = 1,
	CenterAlignLeft = 4,
	Bottom = 3,
	Center = 2
}

local this = SubtitleCtrl

this.uilayer = UICtrlBase.UILayer.Tips

local btnActive, btnSkip
local contents = {}
local indicator
local timeHoldBtn = 0.5
local cbFuncSkip, maskBarU, maskBarURect, maskBarD, maskBarDRect, idleTimer
local useMask = false
local playerControl = false

function SubtitleCtrl.OnCreate()
	timeHoldBtn = 0.5
	cbFuncSkip = nil
	playerControl = false

	UILayerCtrl.Add(SubtitleCtrl.Name)
	UILayerCtrl.SetSkipThreshold(0.5)

	idleTimer = {}
	idleTimer.active = false
	idleTimer.startTime = 0
	idleTimer.elapsedTime = 0
	idleTimer.idleThreshold = 3
	btnActive = {}

	local button = this.mainComponent:GetButton("Subtitle_Button_Active")

	button:SetAudioEnable(false)
	button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SubtitleCtrl.ShowBtnActive(false)
		SubtitleCtrl.ShowBtnSkip(true)
		UILayerCtrl.ForceUpdate(0.2)
		this.StartIdleTimer()
	end, 0)

	btnActive.btn = button
	btnActive.show = false
	btnActive.go = this.mainComponent:GetGameObject("Subtitle_Button_Active")

	btnActive.go:SetActive(btnActive.show)
	UILayerCtrl.AddIndividual(SubtitleCtrl.Name, "Subtitle_Button_Active", btnActive.btn)

	btnSkip = {}
	button = this.mainComponent:GetButton("Subtitle_Button_Skip")

	button:SetAudioEnable(false)
	button:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		this.StopIdleTimer()
		UILayerCtrl.OnPressSkip(SubtitleCtrl.SetIndicatorProgress)
	end, 0)
	button:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		this.StartIdleTimer()
		UILayerCtrl.OnReleaseSkip(SubtitleCtrl.SetIndicatorProgress)
	end, 0)

	btnSkip.btn = button
	btnSkip.show = false
	btnSkip.com = this.mainComponent:GetGameObject("Subtitle_Button_Skip")

	btnSkip.com:SetActive(btnSkip.show)
	UILayerCtrl.AddIndividual(SubtitleCtrl.Name, "Subtitle_Button_Skip", btnSkip.btn)
	UILayerCtrl.SetSkipThreshold(0.5)

	indicator = {}
	indicator.show = true
	indicator.go = this.mainComponent:GetGameObject("Subtitle_SkipIndicator_R")

	indicator.go:SetActive(true)

	indicator.bar = this.mainComponent:GetGameObject("Subtitle_SkipIndicator_Progress")
	indicator.circle = XImage:new(indicator.bar)

	indicator.circle:SetFillAmount(0)

	function indicator.cbFunc(obj, data)
		SubtitleCtrl.OnBtnSkip()
		UILayerCtrl.ForceUpdate()
	end

	local objList = {
		{
			"Subtitle_Contents_T",
			"Subtitle_Contents_T_Text"
		},
		{
			"Subtitle_Contents_C_B",
			"Subtitle_Contents_C_Text"
		},
		{
			"Subtitle_Contents_B",
			"Subtitle_Contents_B_Text"
		}
	}

	for i = 1, 3 do
		local content = {}

		content.show = false
		content.com = this.mainComponent:GetGameObject(objList[i][1])
		content.text = this.mainComponent:GetText(objList[i][2])
		content.cg = content.com:GetComponent("CanvasGroup")

		content.com:SetActive(content.show)

		contents[i] = content
	end

	if SystemHelper.isSubquadrateScrAS() then
		local scale = 1334 / SystemHelper.GetScreenWidth()
		local scrWidth = SystemHelper.GetScreenWidth() * scale
		local scrHeight = SystemHelper.GetScreenHeight() * scale
		local movHeight = scrWidth / 16 * 9
		local offset = 0.5 * (scrHeight - movHeight) - 60 * scale
	end

	maskBarU = this.mainComponent:GetGameObject("Subtitle_BarU")
	maskBarD = this.mainComponent:GetGameObject("Subtitle_BarD")
	maskBarURect = maskBarU:GetComponent("RectTransform")
	maskBarDRect = maskBarD:GetComponent("RectTransform")

	if SystemHelper.isSubquadrateScrAS() then
		local designWidth = LS_Setting.designWidth
		local aHeight = designWidth * SystemHelper.GetScreenHeight() / SystemHelper.GetScreenWidth()
		local mHeight = designWidth * ControllerMain.CameraAspectHeight / ControllerMain.CameraAspectWidth
		local maskHeight = 0.5 * (aHeight - mHeight)

		maskBarURect.sizeDelta = Vector2.New(0, maskHeight)
		maskBarDRect.sizeDelta = Vector2.New(0, maskHeight)
	end

	this.loadFinish = true
end

function SubtitleCtrl.ApplyMask(show)
	useMask = show

	if show == true then
		if SystemHelper.isSubquadrateScrAS() then
			if maskBarU ~= nil then
				maskBarU:SetActive(true)
			end

			if maskBarD ~= nil then
				maskBarD:SetActive(true)
			end
		end
	else
		if maskBarU ~= nil then
			maskBarU:SetActive(false)
		end

		if maskBarD ~= nil then
			maskBarD:SetActive(false)
		end
	end
end

function SubtitleCtrl.UpdateMask()
	if useMask == true then
		if SystemHelper.isSubquadrateScrAS() then
			if maskBarURect ~= nil and maskBarDRect ~= nil then
				local designWidth = LS_Setting.designWidth
				local aHeight = designWidth * SystemHelper.GetScreenHeight() / SystemHelper.GetScreenWidth()
				local mHeight = designWidth * ControllerMain.CameraAspectHeight / ControllerMain.CameraAspectWidth
				local maskHeight = 0.5 * (aHeight - mHeight)

				maskBarURect.sizeDelta = Vector2.New(0, maskHeight)
				maskBarDRect.sizeDelta = Vector2.New(0, maskHeight)
			end

			if maskBarU ~= nil then
				maskBarU:SetActive(true)
			end

			if maskBarD ~= nil then
				maskBarD:SetActive(true)
			end
		else
			if maskBarU ~= nil then
				maskBarU:SetActive(false)
			end

			if maskBarD ~= nil then
				maskBarD:SetActive(false)
			end
		end
	end
end

function SubtitleCtrl.ShowBtnActive(show)
	if btnActive ~= nil and btnActive.show ~= show then
		btnActive.show = show

		btnActive.go:SetActive(show)
	end
end

function SubtitleCtrl.ShowBtnSkip(show)
	if btnSkip ~= nil and btnSkip.show ~= show then
		btnSkip.show = show

		btnSkip.com:SetActive(show)
	end
end

function SubtitleCtrl.StartIdleTimer()
	if idleTimer ~= nil then
		idleTimer.active = true
		idleTimer.elapsedTime = 0
		idleTimer.startTime = TimeHelper.getNowTimeNoScale()
	end
end

function SubtitleCtrl.StopIdleTimer()
	if idleTimer ~= nil then
		idleTimer.elapsedTime = 0
		idleTimer.startTime = 0
		idleTimer.active = false
	end
end

function SubtitleCtrl.ResetIdleTimer()
	if idleTimer ~= nil then
		idleTimer.elapsedTime = 0
		idleTimer.startTime = TimeHelper.getNowTimeNoScale()
	end
end

function SubtitleCtrl.Show(show, forceShowPointer)
	for idx = 1, 3 do
		local content = contents[idx]

		if content and content.com and content.show ~= show then
			content.show = show

			content.com:SetActive(show)
		end
	end

	if show == true then
		if playerControl == false then
			inputMgr:SetPointerLocked(false)
			inputMgr:SetInMenuMode()
		else
			inputMgr:SetPointerLocked(false)
			inputMgr:SetInGameMode()
		end
	elseif forceShowPointer then
		inputMgr:SetPointerLocked(false)
		inputMgr:SetInMenuMode()
	else
		inputMgr:SetPointerLocked(true)
		inputMgr:SetInGameMode()
	end
end

function SubtitleCtrl.ShowPanel(show, pnlIdx)
	local content = contents[pnlIdx]

	if content and content.com and content.show ~= show then
		content.show = show

		content.com:SetActive(show)
	end
end

function SubtitleCtrl.SetSubtitle(text, panelIndex, showMask, controlFlag)
	if DebugNoSubtitle == true then
		return
	end

	local content

	if panelIndex then
		panelIndex = tonumber(panelIndex)
		content = contents[panelIndex]
	else
		panelIndex = tonumber(SubtitleCtrl.PanelIndex.Bottom)
		content = contents[panelIndex]
	end

	if controlFlag ~= nil then
		playerControl = controlFlag
	else
		playerControl = true
	end

	if playerControl == true then
		inputMgr:SetPointerLocked(false)
		inputMgr:SetInMenuMode()
	else
		inputMgr:SetPointerLocked(true)
		inputMgr:SetInGameMode()
	end

	if btnActive.show == true then
		inputMgr:SetPointerLocked(false)
	end

	if content and content.com and content.text and text ~= nil then
		content.text:SetContent(text)

		if panelIndex == SubtitleCtrl.PanelIndex.Center then
			content.cg.alpha = 0

			local tween = Tween:new(content.cg)

			tween:SetAutoKill(true)
			tween:MoveTo({
				alpha = 1
			}, 0.7)
			tween:OnComplete(function()
				return
			end)

			content.cg.alpha = 0

			tween:Start()
		elseif LS_Setting.subtitle < 1 then
			content.text:SetContent(GameText.UI_COMMON_EMPTY)
		end
	end
end

function SubtitleCtrl.GetSubtitleContent(panelIndex)
	local content

	if panelIndex then
		panelIndex = tonumber(panelIndex)
		content = contents[panelIndex]
	else
		panelIndex = tonumber(SubtitleCtrl.PanelIndex.Bottom)
		content = contents[panelIndex]
	end

	if content and content.com and content.text then
		return content.text:GetContent()
	end

	return ""
end

function SubtitleCtrl.ClearAllTexts()
	if contents then
		for i = 1, 3 do
			local content = contents[i]

			if content and content.text then
				content.text:SetContent("")
			end
		end
	end
end

function SubtitleCtrl.OnBtnActive()
	SubtitleCtrl.ShowBtnActive(false)
	SubtitleCtrl.ShowBtnSkip(true)
end

function SubtitleCtrl.SetButtonSkip(show, cb)
	if btnSkip ~= nil and btnSkip.com ~= nil then
		cbFuncSkip = cb

		if show then
			UILayerCtrl.Push(SubtitleCtrl.Name, nil)
			SubtitleCtrl.ShowBtnActive(true)
			SubtitleCtrl.ShowBtnSkip(false)
		else
			UILayerCtrl.Pop()
			SubtitleCtrl.ShowBtnActive(false)
			SubtitleCtrl.ShowBtnSkip(false)
		end
	end
end

function SubtitleCtrl.OnBtnSkip()
	if cbFuncSkip then
		cbFuncSkip()
	end

	SubtitleCtrl.ShowBtnActive(false)
	SubtitleCtrl.ShowBtnSkip(false)
end

function SubtitleCtrl.Update()
	if not this.loadFinish then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName and lName == SubtitleCtrl.Name then
		if timeHoldBtn > 0 then
			if btnSkip and btnSkip.btn and btnSkip.show then
				UILayerCtrl.UpdateSkipping(SubtitleCtrl.SetIndicatorProgress, SubtitleCtrl.OnSkip)
			end

			if idleTimer ~= nil and idleTimer.active and idleTimer.startTime > 0 then
				if idleTimer.elapsedTime < idleTimer.idleThreshold then
					idleTimer.elapsedTime = TimeHelper.getNowTimeNoScale() - idleTimer.startTime
				else
					this.StopIdleTimer()
					this.ShowBtnActive(true)
					this.ShowBtnSkip(false)
				end
			end
		end

		this.GamePadControl()
	end
end

function SubtitleCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if timeHoldBtn > 0 then
		if btnSkip and btnSkip.btn and btnSkip.show then
			if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
				UILayerCtrl.OnReleaseSkip(SubtitleCtrl.SetIndicatorProgress)
				this.StartIdleTimer()
			elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnPressSkip(SubtitleCtrl.SetIndicatorProgress)
				this.StopIdleTimer()
			end
		elseif (inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp()) and btnActive and btnActive.btn and btnActive.show then
			UILayerCtrl.OnButtonClick("Subtitle_Button_Active")
		end
	elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
		if btnActive and btnActive.btn and btnActive.show then
			UILayerCtrl.OnButtonClick("Subtitle_Button_Active")
		elseif btnSkip and btnSkip.btn and btnSkip.show then
			UILayerCtrl.OnButtonClick("Subtitle_Button_Skip")
		end
	end
end

function SubtitleCtrl.SetIndicatorProgress(percent)
	if indicator and indicator.circle then
		if percent >= 0.95 then
			percent = 1
		end

		indicator.circle:SetFillAmount(percent)
	end
end

function SubtitleCtrl.OnSkip()
	UILayerCtrl.OnReleaseSkip(SubtitleCtrl.SetIndicatorProgress)
	this.StopIdleTimer()

	if btnSkip and btnSkip.com then
		btnSkip.com:SetActive(false)

		if indicator and indicator.cbFunc then
			indicator.cbFunc()
		end
	end
end

return SubtitleCtrl
