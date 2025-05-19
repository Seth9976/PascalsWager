-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/MsgBoxSimpleCtrl.lua

MsgBoxSimpleCtrl = class("MsgBoxSimpleCtrl", UICtrlBase)

local this = MsgBoxSimpleCtrl

this.uilayer = UICtrlBase.UILayer.Tips

local LoaderSimple, LoaderMessage, LoaderPanelWait, LoaderOkAndCancel, LoaderMenu, LoaderIntroduction, LoaderMenuBgImg, LoaderMenuBgBtn, LoaderGetItem, LoaderGetAchievement, LoaderSave, LoaderSlider, GetAchievementQueue, CurrentIntroductionContentText, goPanelReqGC, okAndCancelBgImg, goBtnConfirm, goBtnCancel, goIndicator
local timeHoldBtn = 0
local goIntroIndicator, goIntro2Indicator
local isImageIntroductionOpen = false
local imageIntroductionTimer, uiCanvas, toBlurUICtrl
local loadCnt = 0
local currentTutorialId = 0
local currentSliderId = 0
local CanOpenSimple = true
local messageBox

function MsgBoxSimpleCtrl.OnCreate()
	this.loadFinish = false
	uiCanvas = this.gameObject:GetComponent("Canvas")
	loadCnt = 0
	LoaderSimple = this.mainComponent:GetLoader("LoaderSimple")

	LoaderSimple:PreloadTemplate(this.Check)

	LoaderSimple.loadCallback = this.OnLoaderCreate_Simple
	messageBox = {}
	messageBox.show = false
	messageBox.com = nil
	messageBox.childIndex = -1
	LoaderMessage = this.mainComponent:GetLoader("LoaderMessage")

	LoaderMessage:PreloadTemplate(this.Check)

	LoaderMessage.loadCallback = this.OnLoaderCreate_Message
	LoaderPanelWait = this.mainComponent:GetLoader("LoaderPanelWait")

	LoaderPanelWait:PreloadTemplate(this.Check)

	LoaderPanelWait.loadCallback = this.OnLoaderCreate_PanelWait
	LoaderOkAndCancel = this.mainComponent:GetLoader("LoaderOkAndCancel")

	LoaderOkAndCancel:PreloadTemplate(this.Check)

	LoaderOkAndCancel.loadCallback = this.OnLoaderCreate_OkAndCancel
	okAndCancelBgImg = XImage:new(LoaderOkAndCancel.gameObject)
	okAndCancelBgImg.image.enabled = false
	LoaderGetItem = this.mainComponent:GetLoader("LoaderGetItem")

	LoaderGetItem:PreloadTemplate(this.Check)

	LoaderGetItem.loadCallback = this.OnLoaderCreateGetItem
	GetAchievementQueue = {}
	LoaderGetAchievement = this.mainComponent:GetLoader("LoaderGetAchievement")

	LoaderGetAchievement:PreloadTemplate(this.Check)

	LoaderGetAchievement.loadCallback = this.OnLoaderCreateGetAchievement
	LoaderIntroduction = this.mainComponent:GetLoader("LoaderIntroduction")

	LoaderIntroduction:PreloadTemplate(this.Check)

	LoaderIntroduction.loadCallback = this.OnLoaderCreateIntroduction
	LoaderSlider = this.mainComponent:GetLoader("LoaderSlider")

	LoaderSlider:PreloadTemplate(this.Check)

	LoaderSlider.loadCallback = this.OnLoaderSlider
	LoaderSave = this.mainComponent:GetLoader("LoaderSave_R")

	LoaderSave:PreloadTemplate(this.Check)

	LoaderSave.loadCallback = this.OnLoaderCreateSave
	LoaderMenu = this.mainComponent:GetLoader("LoaderMenu_Loader")

	LoaderMenu:PreloadTemplate(this.Check)

	LoaderMenu.loadCallback = this.OnLoaderCreate_Menu
	LoaderMenuBgBtn = this.mainComponent:GetButton("LoaderMenu")
	LoaderMenuBgImg = XImage:new(LoaderMenuBgBtn.gameObject)
	LoaderMenuBgImg.image.enabled = false

	LoaderMenuBgBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LoaderMenuBgImg.image.enabled = false

		LoaderMenu:ClearChild()
	end, 0)

	goPanelReqGC = {}
	goPanelReqGC.show = false
	goPanelReqGC.go = this.mainComponent:GetGameObject("MsgBox_GameCtrlReq")
end

function MsgBoxSimpleCtrl.Check()
	loadCnt = loadCnt + 1

	if loadCnt == 9 then
		this.loadFinish = true
	end
end

function MsgBoxSimpleCtrl.OpenSimple(message)
	if CanOpenSimple == false then
		return
	end

	CanOpenSimple = false

	AudioCtrl.SetUIAudio("unable")

	local childIndex = LoaderSimple:Load({
		message = message
	})

	return LoaderSimple:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenMassageBox(message, button)
	if messageBox ~= nil then
		if messageBox.show == true then
			SystemHelper.Log("[ There exists an active message box. ]")
			messageBox.text:SetContent(message)

			return LoaderMessage:GetChild(messageBox.childIndex)
		else
			messageBox.show = true

			local childIndex = LoaderMessage:Load({
				message = message
			})

			messageBox.childIndex = childIndex

			return LoaderMessage:GetChild(childIndex)
		end
	else
		return nil
	end
end

function MsgBoxSimpleCtrl.OnLoaderCreate_Message(index, com, dataTbl)
	messageBox.com = com

	local text = com:GetText("MessageText")

	text:SetContent(dataTbl.message)

	messageBox.text = text
end

function MsgBoxSimpleCtrl.SetMessage(message)
	if messageBox ~= nil and messageBox.show == true then
		messageBox.text:SetContent(message)
	end
end

function MsgBoxSimpleCtrl.CloseMessage()
	if messageBox ~= nil and messageBox.show == true then
		messageBox.childIndex = -1
		messageBox.show = false

		messageBox.com:ReturnToPool()

		messageBox.com = nil
	end
end

function MsgBoxSimpleCtrl.OpenConfirmAndCancel(message, funcConfirm, funcCancel, onlyOneButton, okText, cancelText, textAnchor)
	local childIndex = LoaderOkAndCancel:Load({
		message = message,
		funcConfirm = funcConfirm,
		funcCancel = funcCancel,
		okText = okText,
		cancelText = cancelText,
		textAnchor = textAnchor
	})

	goBtnConfirm:SetActive(true)

	if onlyOneButton then
		goBtnCancel:SetActive(false)
	else
		goBtnCancel:SetActive(true)
	end

	timeHoldBtn = 0

	goIndicator.go:SetActive(false)

	return LoaderOkAndCancel:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenHoldConfirmAndCancel(message, funcConfirm, funcCancel, onlyOneButton, timeToGo)
	if timeToGo == nil then
		timeToGo = 1
	end

	local childIndex = LoaderOkAndCancel:Load({
		message = message,
		funcConfirm = funcConfirm,
		funcCancel = funcCancel,
		timeConfirm = timeToGo
	})

	goBtnConfirm:SetActive(true)

	if onlyOneButton then
		goBtnCancel:SetActive(false)
	else
		goBtnCancel:SetActive(true)
	end

	timeHoldBtn = 0.5

	goIndicator.go:SetActive(true)

	return LoaderOkAndCancel:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenIntroduction(titleMessage, contentMessage, funcConfirm, imageId, heroId, tutorialId, isInUI)
	local childIndex

	if imageId and imageId ~= 0 then
		if not isInUI then
			UIManager.SendMessage("Mainmenu", "FadeOut", 0, true)
		end

		childIndex = LoaderIntroduction:Load({
			titleMessage = titleMessage,
			contentMessage = contentMessage,
			funcConfirm = funcConfirm,
			heroId = heroId,
			imageId = imageId,
			tutorialId = tutorialId,
			isInUI = isInUI
		})

		return LoaderIntroduction:GetChild(childIndex)
	else
		UIManager.SendMessage("Mainmenu", "FadeOut", 0, true)

		childIndex = LoaderIntroduction:Load({
			titleMessage = titleMessage,
			contentMessage = contentMessage,
			funcConfirm = funcConfirm,
			heroId = heroId,
			isInUI = isInUI
		})

		return LoaderIntroduction:GetChild(childIndex)
	end
end

function MsgBoxSimpleCtrl.OpenSlider(TutorialId, funcConfirm)
	local childIndex = LoaderSlider:Load({
		tutorialId = TutorialId,
		funcConfirm = funcConfirm
	})

	return LoaderSlider:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenGetItem(title, centerText, itemName, itemIcon, funcConfirm, prevUICtrl)
	local childIndex = LoaderGetItem:Load({
		title = title,
		centerText = centerText,
		itemName = itemName,
		itemIcon = itemIcon,
		funcConfirm = funcConfirm
	})

	toBlurUICtrl = prevUICtrl

	if toBlurUICtrl ~= nil then
		toBlurUICtrl:SetBlurEnabledImmediately(true)
	end

	return LoaderGetItem:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenGetAchievement(title, description, icon)
	if AppVer == AppAppleLight or AppVer == AppTapTapEA then
		return
	end

	if SdkHelper.CHANNEL == "STEAM" then
		return
	end

	table.insert(GetAchievementQueue, {
		title = title,
		description = description,
		icon = icon
	})
end

function MsgBoxSimpleCtrl.OpenGetSave()
	local childIndex = LoaderSave:Load()

	return LoaderSave:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenPlayerMenu(pos, ...)
	local viewpos = Vector2.New(pos.x / SystemHelper.GetScreenWidth() - 0.5, (pos.y - 20) / SystemHelper.GetScreenHeight() - 0.5)
	local h = LoaderMenu.transform.parent.parent:GetComponent("RectTransform").rect.height
	local w = LoaderMenu.transform.parent.parent:GetComponent("RectTransform").rect.width
	local uiPos = Vector2.New(viewpos.x * w, viewpos.y * h)

	LoaderMenu.transform.localPosition = uiPos

	local arg = {
		...
	}

	LoaderMenu.loadCount = #arg / 2

	local childIndex = LoaderMenu:Load(arg)

	return LoaderMenu:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OpenMatchWait(funcCancel)
	local childIndex = LoaderPanelWait:Load({
		funcCancel = funcCancel
	})

	return LoaderPanelWait:GetChild(childIndex)
end

function MsgBoxSimpleCtrl.OnLoaderCreate_Simple(index, com, dataTbl)
	timeHoldBtn = 0

	local text = com:GetText("Text_Message")

	text:SetContent(dataTbl.message)

	local obj = com.gameObject
	local tween = Tween:new(obj.transform)

	tween:MoveTo({}, 1)
	tween:OnComplete(function(progress)
		com:ReturnToPool()

		CanOpenSimple = true
	end)
	tween:Start()
end

function MsgBoxSimpleCtrl.OnLoaderSlider(index, com, dataTbl)
	local image1 = com:GetGameObject("Image1")
	local image2 = com:GetGameObject("Image2")
	local image3 = com:GetGameObject("Image3")
	local text = com:GetText("Image_Text")
	local rectTf = com.gameObject:GetComponent("RectTransform")
	local screenWidth = SystemHelper.GetScreenWidth()
	local screenHeight = SystemHelper.GetScreenHeight()

	rectTf.sizeDelta = Vector2.New(1334, 750)

	inputMgr:SetPointerLocked(false)

	image1 = XImage:new(image1)

	image1:SetAlpha(0)

	image2 = XImage:new(image2)

	image2:SetAlpha(0)

	image3 = XImage:new(image3)

	image3:SetAlpha(0)

	timeHoldBtn = 0
	currentSliderId = dataTbl.tutorialId

	local SliderData = MS_StoryTutorial.GetTutorialData(currentSliderId)

	text:SetContent(SliderData.DescriptionTouch)

	local imgName1 = "arcade_" .. SliderData.ImageId .. "_1"
	local imgName2 = "arcade_" .. SliderData.ImageId .. "_2"
	local imgName3 = "arcade_" .. SliderData.ImageId .. "_3"

	AudioCtrl.StopDialogueAudioAll()
	AudioCtrl.SetDialogueAudio(MS_StoryDialog.Type.NpcWhisper, SliderData.StoryId, SliderData.Delay)
	XObjectPool.LoadManagedImage(1, imgName1, function()
		local sprite1 = XObjectPool.GetManagedImage(1)

		if sprite1 then
			image1:SetSprite(sprite1)
			image1:SetAlpha(1)
		end

		XObjectPool.LoadManagedImage(2, imgName2, function()
			local sprite2 = XObjectPool.GetManagedImage(2)

			if sprite2 then
				image2:SetSprite(sprite2)
				image2:SetAlpha(1)
			end

			XObjectPool.LoadManagedImage(3, imgName3, function()
				local sprite3 = XObjectPool.GetManagedImage(3)

				if sprite3 then
					image3:SetSprite(sprite3)
					image3:SetAlpha(1)
				end
			end)
		end)
	end)

	local confirmBtn = com:GetButton("Image2")

	confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if SliderData.Forward > 0 then
			currentSliderId = SliderData.Forward
			SliderData = MS_StoryTutorial.GetTutorialData(currentSliderId)

			text:SetContent(SliderData.DescriptionTouch)

			local imgName1 = "arcade_" .. SliderData.ImageId .. "_1"
			local imgName2 = "arcade_" .. SliderData.ImageId .. "_2"
			local imgName3 = "arcade_" .. SliderData.ImageId .. "_3"

			AudioCtrl.StopDialogueAudioAll()
			AudioCtrl.SetDialogueAudio(MS_StoryDialog.Type.NpcWhisper, SliderData.StoryId, SliderData.Delay)
			XObjectPool.LoadManagedImage(1, imgName1, function()
				local sprite1 = XObjectPool.GetManagedImage(1)

				if sprite1 then
					image1:SetSprite(sprite1)
					image1:SetAlpha(1)
				end

				XObjectPool.LoadManagedImage(2, imgName2, function()
					local sprite2 = XObjectPool.GetManagedImage(2)

					if sprite2 then
						image2:SetSprite(sprite2)
						image2:SetAlpha(1)
					end

					XObjectPool.LoadManagedImage(3, imgName3, function()
						local sprite3 = XObjectPool.GetManagedImage(3)

						if sprite3 then
							image3:SetSprite(sprite3)
							image3:SetAlpha(1)
						end
					end)
				end)
			end)
		else
			com:ReturnToPool()
			XObjectPool.ClearManagedImage(1)
			XObjectPool.ClearManagedImage(2)
			XObjectPool.ClearManagedImage(3)
			UILayerCtrl.Pop()
			AudioCtrl.StopDialogueAudioAll()
			inputMgr:SetPointerLocked(true)
			UILayerCtrl.ForceUpdate()

			if dataTbl.funcConfirm ~= nil then
				dataTbl.funcConfirm()
			end
		end
	end)
	UILayerCtrl.AddIndividual("MsgBoxSlider", "Button_Confirm", confirmBtn)
	UILayerCtrl.Push("MsgBoxSlider", nil)
end

function MsgBoxSimpleCtrl.OnLoaderCreateIntroduction(index, com, dataTbl)
	local GO1 = com:GetGameObject("Introduction_scale")
	local GO2 = com:GetGameObject("Introduction2_scale")

	timeHoldBtn = 0.5

	UILayerCtrl.SetSkipThreshold(timeHoldBtn)
	AudioCtrl.SetUIAudio("guide_show")

	currentTutorialId = dataTbl.tutorialId

	inputMgr:SetPointerLocked(false)

	if dataTbl.imageId ~= nil then
		GO2:SetActive(true)
		GO1:SetActive(false)

		if imageIntroductionTimer == nil then
			imageIntroductionTimer = Timer.New(function()
				isImageIntroductionOpen = true
			end, 0.5, 1, true)
		else
			imageIntroductionTimer:Reset(function()
				isImageIntroductionOpen = true
			end, 0.5, 1, true)
		end

		imageIntroductionTimer:Start()

		local image = com:GetGameObject("Introduction2_scale_Introduction_picture")

		image = XImage:new(image)

		image:SetAlpha(0)

		local imgName = "guide" .. dataTbl.imageId

		XObjectPool.LoadImage(imgName, function()
			local sprite = XObjectPool.GetImage(imgName)

			if sprite then
				image:SetSprite(sprite)
				image:SetAlpha(1)
			end
		end)

		local text = com:GetText("Introduction2_scale_TitleText")

		text:SetContent(dataTbl.titleMessage)

		local contentText = com:GetText("Loader_Introduction2_ContentText")

		CurrentIntroductionContentText = contentText

		local _text = SystemHelper.ConvertCustomRichText(dataTbl.contentMessage, 20, 2, dataTbl.heroId)

		contentText:SetContent(_text)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(GO2:GetComponent("RectTransform"))

		local nextBtn = com:GetButton("Introduction2_scale_Next")
		local prevBtn = com:GetButton("Introduction2_scale_Prev")

		UILayerCtrl.AddIndividual("MsgBoxGuide", "Button_Next", nextBtn)
		UILayerCtrl.AddIndividual("MsgBoxGuide", "Button_Prev", prevBtn)

		local currentData

		if Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Tutorial then
			currentData = MS_StoryTutorial.GetTutorialData(currentTutorialId)
		elseif Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Guide then
			currentData = MS_StoryGuide.GetGuideDataById(currentTutorialId)
		end

		local confirmBtn = com:GetButton("Introduction2_scale_ConfirmBtn")

		goIndicator = {}
		goIndicator.go = com:GetGameObject("Introduction2_ConfirmBtn_ProgressIndicator")
		goIndicator.RT = goIndicator.go:GetComponent("RectTransform")

		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(goIndicator.RT)

		local nextGO = com:GetGameObject("Introduction2_scale_NextArea")

		if currentData then
			nextBtn.gameObject:SetActive(currentData.Forward > 0)
			prevBtn.gameObject:SetActive(currentData.Backward > 0)
			confirmBtn.gameObject:SetActive(true)
			goIndicator.go:SetActive(currentData.Forward == 0)
			nextGO:SetActive(currentData.Forward ~= 0)

			if currentData.Forward == 0 then
				timeHoldBtn = 0.5

				confirmBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
					UILayerCtrl.OnPressSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
				end, 0)
				confirmBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
					UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
				end, 0)
			else
				timeHoldBtn = 0

				confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					UILayerCtrl.OnButtonClickMute("Button_Next")
				end, 0)
				confirmBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
					return
				end, 0)
				confirmBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
					return
				end, 0)
			end
		else
			nextBtn.gameObject:SetActive(false)
			prevBtn.gameObject:SetActive(false)
			confirmBtn.gameObject:SetActive(true)
			goIndicator.go:SetActive(true)
			nextGO:SetActive(false)

			timeHoldBtn = 0.5

			confirmBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
				UILayerCtrl.OnPressSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
			end, 0)
			confirmBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
				UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
			end, 0)
		end

		UILayerCtrl.SetSkipThreshold(timeHoldBtn)

		if currentData and (currentData.Forward > 0 or currentData.Backward > 0) then
			nextBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				local LastData

				if Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Tutorial then
					LastData = MS_StoryTutorial.GetTutorialData(currentTutorialId)
				elseif Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Guide then
					LastData = MS_StoryGuide.GetGuideDataById(currentTutorialId)
				end

				currentTutorialId = LastData.Forward

				local currentData

				if Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Tutorial then
					currentData = MS_StoryTutorial.GetTutorialData(currentTutorialId)
				elseif Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Guide then
					currentData = MS_StoryGuide.GetGuideDataById(currentTutorialId)
				end

				nextBtn.gameObject:SetActive(currentData.Forward > 0)
				prevBtn.gameObject:SetActive(currentData.Backward > 0)

				if currentData.Forward == 0 then
					confirmBtn.gameObject:SetActive(true)
					goIndicator.go:SetActive(true)
					nextGO:SetActive(false)

					timeHoldBtn = 0.5

					confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
						return
					end, 0)
					confirmBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
						UILayerCtrl.OnPressSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
					end, 0)
					confirmBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
						UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
					end, 0)
					UILayerCtrl.SetSkipThreshold(timeHoldBtn)
				end

				text:SetContent(currentData.Title)

				local imgName = "guide" .. currentData.ImageId

				XObjectPool.LoadImage(imgName, function()
					local sprite = XObjectPool.GetImage(imgName)

					if sprite then
						image:SetSprite(sprite)
						image:SetAlpha(1)
					end
				end)

				if LS_Setting.isJoystickConnected then
					_text = SystemHelper.ConvertCustomRichText(currentData.DescriptionJoystick, 20, 2, currentData.HeroId)
				else
					_text = SystemHelper.ConvertCustomRichText(currentData.DescriptionTouch, 20, 2, currentData.HeroId)
				end

				contentText:SetContent(_text)
			end, 0)
			prevBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				local LastData

				if Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Tutorial then
					LastData = MS_StoryTutorial.GetTutorialData(currentTutorialId)
				elseif Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Guide then
					LastData = MS_StoryGuide.GetGuideDataById(currentTutorialId)
				end

				currentTutorialId = LastData.Backward

				local currentData

				if Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Tutorial then
					currentData = MS_StoryTutorial.GetTutorialData(currentTutorialId)
				elseif Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Guide then
					currentData = MS_StoryGuide.GetGuideDataById(currentTutorialId)
				end

				nextBtn.gameObject:SetActive(currentData.Forward > 0)
				prevBtn.gameObject:SetActive(currentData.Backward > 0)
				text:SetContent(currentData.Title)

				local imgName = "guide" .. currentData.ImageId

				XObjectPool.LoadImage(imgName, function()
					local sprite = XObjectPool.GetImage(imgName)

					if sprite then
						image:SetSprite(sprite)
						image:SetAlpha(1)
					end
				end)

				if LS_Setting.isJoystickConnected then
					_text = SystemHelper.ConvertCustomRichText(currentData.DescriptionJoystick, 20, 2, currentData.HeroId)
				else
					_text = SystemHelper.ConvertCustomRichText(currentData.DescriptionTouch, 20, 2, currentData.HeroId)
				end

				contentText:SetContent(_text)
			end, 0)
		end

		UILayerCtrl.AddIndividual("MsgBoxGuide", "Button_Confirm", confirmBtn)
		UILayerCtrl.Push("MsgBoxGuide", nil)
		UILayerCtrl.ForceUpdate()

		goIndicator.bar = com:GetGameObject("Introduction2_ConfirmBtn_ProgressIndicatorBar")
		goIndicator.circle = XImage:new(goIndicator.bar)

		goIndicator.circle:SetFillAmount(0)

		function goIndicator.cbFunc(obj, data)
			com:ReturnToPool()

			isImageIntroductionOpen = false

			XObjectPool.ClearImage()
			UILayerCtrl.Pop()

			if dataTbl ~= nil and dataTbl.funcConfirm ~= nil then
				dataTbl.funcConfirm()
			end

			UILayerCtrl.ForceUpdate()

			if not dataTbl.isInUI then
				UIManager.SendMessage("Mainmenu", "FadeIn", 0, true)
			end

			if UILayerCtrl.GetCurrentLayerName() == "GameMain" then
				inputMgr:SetPointerLocked(true)
			end
		end
	else
		GO2:SetActive(false)
		GO1:SetActive(true)

		local text = com:GetText("Introduction_scale_TitleText")

		text:SetContent(dataTbl.titleMessage)

		text = com:GetText("Loader_Introduction_ContentText")

		local _text = SystemHelper.ConvertCustomRichText(dataTbl.contentMessage, 20, 2, dataTbl.heroId)

		text:SetContent(_text)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(GO1:GetComponent("RectTransform"))

		local confirmBtn = com:GetButton("Introduction_scale_ConfirmBtn")

		confirmBtn.gameObject:SetActive(true)
		confirmBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			UILayerCtrl.OnPressSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
		end, 0)
		confirmBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
			UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
		end, 0)
		UILayerCtrl.AddIndividual("MsgBoxGuide", "Button_Confirm", confirmBtn)
		UILayerCtrl.Push("MsgBoxGuide", nil)
		UILayerCtrl.ForceUpdate()

		goIndicator = {}
		goIndicator.go = com:GetGameObject("Introduction_ConfirmBtn_ProgressIndicator")
		goIndicator.RT = goIndicator.go:GetComponent("RectTransform")

		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(goIndicator.RT)
		goIndicator.go:SetActive(true)

		goIndicator.bar = com:GetGameObject("Introduction_ConfirmBtn_ProgressIndicatorBar")
		goIndicator.circle = XImage:new(goIndicator.bar)

		goIndicator.circle:SetFillAmount(0)

		function goIndicator.cbFunc(obj, data)
			com:ReturnToPool()
			XObjectPool.ClearImage()
			UILayerCtrl.Pop()

			if dataTbl ~= nil and dataTbl.funcConfirm ~= nil then
				dataTbl.funcConfirm()
			end

			UILayerCtrl.ForceUpdate()

			if not dataTbl.isInUI then
				UIManager.SendMessage("Mainmenu", "FadeIn", 0, true)
			end

			if UILayerCtrl.GetCurrentLayerName() == "GameMain" then
				inputMgr:SetPointerLocked(true)
			end
		end
	end
end

function MsgBoxSimpleCtrl.RefreshIntroductionText(hasJoystick)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "MsgBoxGuide" and CurrentIntroductionContentText ~= nil and not IsNil(CurrentIntroductionContentText.gameObject) and currentTutorialId ~= 0 then
		local currentData

		if Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Tutorial then
			currentData = MS_StoryTutorial.GetTutorialData(currentTutorialId)
		elseif Mathf.Floor(currentTutorialId / 1000) == MS_StoryTutorial.GuideType.Guide then
			currentData = MS_StoryGuide.GetGuideDataById(currentTutorialId)
		end

		local text

		if hasJoystick then
			text = SystemHelper.ConvertCustomRichText(currentData.DescriptionJoystick, 20, 2, currentData.HeroId)
		else
			text = SystemHelper.ConvertCustomRichText(currentData.DescriptionTouch, 20, 2, currentData.HeroId)
		end

		CurrentIntroductionContentText:SetContent(text)
	end
end

function MsgBoxSimpleCtrl.OnLoaderCreateGetItem(index, com, dataTbl)
	local gainText = com:GetText("gain")
	local text = com:GetText("itemName")
	local centerText = com:GetText("GetItemPanel_Lose_Text")

	timeHoldBtn = 0

	text:SetContent(dataTbl.itemName)
	gainText:SetContent(dataTbl.title)
	centerText:SetContent(dataTbl.centerText)

	for i = 1, 5 do
		local frame = com:GetGameObject("GetItemPanel_ItemIconGroup_itemFrame" .. i)

		frame:SetActive(false)

		if dataTbl.itemIcon[i] ~= nil then
			frame:SetActive(true)

			local image = com:GetGameObject("GetItemPanel_ItemIconGroup_itemFrame" .. i .. "_itemImage")

			image = XImage:new(image)

			local sprite = XObjectPool.GetIcon("item" .. dataTbl.itemIcon[i])

			if sprite then
				image:SetSprite(sprite)
			end
		end
	end

	local confirmBtn = com:GetButton("boardmid_ConfirmBtn")
	local ani = com:GetGameObject("GetItemPanel"):GetComponent("Animator")

	ani:Play("AlchemyAn1", 0)
	confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if ani:GetCurrentAnimatorStateInfo(0):IsName("AlchemyAn1") and ani:GetCurrentAnimatorStateInfo(0).normalizedTime < 1 then
			return
		end

		if toBlurUICtrl ~= nil then
			toBlurUICtrl:SetBlurEnabledImmediately(false)

			toBlurUICtrl = nil
		end

		com:ReturnToPool()
		UILayerCtrl.Pop()

		if dataTbl ~= nil and dataTbl.funcConfirm ~= nil then
			dataTbl.funcConfirm()
		end

		UILayerCtrl.ForceUpdate()
	end, 0)
	UILayerCtrl.AddIndividual("MsgBoxGetItem", "Button_Confirm", confirmBtn)
	UILayerCtrl.AddIndividual("MsgBoxGetItem", "Button_Cancel", confirmBtn)
	UILayerCtrl.Push("MsgBoxGetItem", nil)
	UILayerCtrl.ForceUpdate()
end

function MsgBoxSimpleCtrl.OnLoaderCreateGetAchievement(index, com, dataTbl)
	local title = com:GetText("GetAchievementChild_GetAchievement_Title")
	local des = com:GetText("GetAchievementChild_GetAchievement_Name")

	des:SetContent(dataTbl.title)
	title:SetContent(GameText.UI_GET_ACHIEVEMENT)
	AudioCtrl.SetUIAudio("achievement_show")

	local icon = com:GetGameObject("GetAchievementChild_GetAchievement_Icon")

	icon = XImage:new(icon)

	local sprite = XObjectPool.GetIcon("achievement" .. dataTbl.icon)

	if sprite then
		icon:SetSprite(sprite)
	end

	LoaderGetAchievement.ani = com:GetGameObject("GetAchievementChild"):GetComponent("Animator")

	LoaderGetAchievement.ani:Play("GetAchievement", 0)
end

function MsgBoxSimpleCtrl.OnLoaderCreateSave(index, com, dataTbl)
	return
end

function MsgBoxSimpleCtrl.SetIndicatorProgress(percent)
	if goIndicator and goIndicator.circle then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "MsgBoxSimple" then
			if percent > 0 and not goIndicator.show then
				goIndicator.show = true

				goIndicator.go:SetActive(true)
			elseif percent <= 0 and goIndicator.show then
				goIndicator.show = false

				goIndicator.go:SetActive(false)
			end
		end

		if not IsNil(goIndicator.bar) then
			if percent >= 0.95 then
				percent = 1
			end

			goIndicator.circle:SetFillAmount(percent)
		end
	end
end

function MsgBoxSimpleCtrl.OnHoldConfirm()
	UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)

	if goIndicator and goIndicator.cbFunc then
		goIndicator.cbFunc()
	end
end

function MsgBoxSimpleCtrl.OnLoaderCreate_OkAndCancel(index, com, dataTbl)
	okAndCancelBgImg.image.enabled = true

	local text = com:GetText("Text_Message")

	text:SetContent(dataTbl.message)

	local confirmBtn = com:GetButton("Button_Confirm")
	local cancelBtn = com:GetButton("Button_Cancel")

	cancelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		okAndCancelBgImg.image.enabled = false

		com:ReturnToPool()
		UILayerCtrl.Pop()

		if dataTbl ~= nil and dataTbl.funcCancel ~= nil then
			dataTbl.funcCancel()

			local layerName = UILayerCtrl.GetCurrentLayerName()

			if layerName ~= nil and layerName == "GameMain" then
				inputMgr:SetInGameMode()
				inputMgr:SetPointerLocked(true)
			end
		end
	end, 0)

	goBtnConfirm = com:GetGameObject("Button_Confirm")
	goBtnCancel = com:GetGameObject("Button_Cancel")

	local okText = com:GetText("Button_Confirm_Text")
	local cancelText = com:GetText("Button_Cancel_Text")

	if dataTbl.okText then
		okText:SetContent(dataTbl.okText)
	else
		okText:SetContent(GameText.UI_OK_TEXT)
	end

	if dataTbl.cancelText then
		cancelText:SetContent(dataTbl.cancelText)
	else
		cancelText:SetContent(GameText.UI_CANCEL_TEXT)
	end

	if text then
		if dataTbl.textAnchor then
			text:SetAlignment(dataTbl.textAnchor)
		else
			text:SetAlignment(UnityEngine.TextAnchor.MiddleCenter)
		end
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(com:GetGameObject("MainPanel"):GetComponent("RectTransform"))

	goIndicator = {}
	goIndicator.go = com:GetGameObject("ProgressIndicator")
	goIndicator.show = false

	goIndicator.go:SetActive(false)

	if dataTbl.timeConfirm and type(dataTbl.timeConfirm) == "number" then
		if dataTbl.timeConfirm < 0 then
			dataTbl.timeConfirm = 0.5
		end

		timeHoldBtn = dataTbl.timeConfirm

		UILayerCtrl.SetSkipThreshold(timeHoldBtn)
		confirmBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			UILayerCtrl.OnPressSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
		end, 0)
		confirmBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
			UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
		end, 0)

		goIndicator.bar = com:GetGameObject("ProgressIndicatorBar")
		goIndicator.circle = XImage:new(goIndicator.bar)

		goIndicator.circle:SetFillAmount(0)

		function goIndicator.cbFunc(obj, data)
			okAndCancelBgImg.image.enabled = false

			com:ReturnToPool()
			UILayerCtrl.Pop()

			if dataTbl ~= nil and dataTbl.funcConfirm ~= nil then
				dataTbl.funcConfirm()

				local layerName = UILayerCtrl.GetCurrentLayerName()

				if layerName ~= nil and layerName == "GameMain" then
					inputMgr:SetInGameMode()
					inputMgr:SetPointerLocked(true)
				end
			end
		end
	else
		timeHoldBtn = 0

		confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			okAndCancelBgImg.image.enabled = false

			com:ReturnToPool()
			UILayerCtrl.Pop()

			if dataTbl ~= nil and dataTbl.funcConfirm ~= nil then
				dataTbl.funcConfirm()

				local layerName = UILayerCtrl.GetCurrentLayerName()

				if layerName ~= nil and layerName == "GameMain" then
					inputMgr:SetInGameMode()
					inputMgr:SetPointerLocked(true)
				end
			end
		end, 0)
	end

	UILayerCtrl.AddIndividual("MsgBoxSimple", "Button_Confirm", confirmBtn)
	UILayerCtrl.AddIndividual("MsgBoxSimple", "Button_Cancel", cancelBtn)
	UILayerCtrl.Push("MsgBoxSimple", nil)
	UILayerCtrl.ForceUpdate()
	inputMgr:SetPointerLocked(false)
	inputMgr:SetInMenuMode()
end

function MsgBoxSimpleCtrl.OnLoaderCreate_Menu(index, com, dataTbl)
	timeHoldBtn = 0
	LoaderMenuBgImg.image.enabled = true

	com:GetText("Loader_MenuItem_Text"):SetContent(dataTbl[index * 2 - 1])

	local btn = com:GetButton("Loader_MenuItem_bg")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		LoaderMenuBgImg.image.enabled = false

		LoaderMenu:ClearChild()

		if dataTbl ~= nil and dataTbl[index * 2] ~= nil then
			dataTbl[index * 2]()
		end
	end, 0)
end

function MsgBoxSimpleCtrl.OnLoaderCreate_PanelWait(index, com, dataTbl)
	timeHoldBtn = 0

	local closeBtn = com:GetButton("Button_Close")

	closeBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if dataTbl ~= nil and dataTbl.funcCancel ~= nil then
			dataTbl.funcCancel()
		end
	end, 0)
end

function MsgBoxSimpleCtrl.GetLocalPointInRectangle(rt, screenPos)
	local localPos = Vector2.zero
	local anchor = Vector2.zero
	local ret, anchor = RectTransformUtility.ScreenPointToLocalPointInRectangle(rt.parent, screenPos, nil, anchor)

	if ret then
		localPos = anchor
	end

	return localPos
end

function MsgBoxSimpleCtrl.GetShowPosition(sizeDelta, pivot, offset)
	local pos = Vector2.zero
	local pivotOrigin = Vector2.New(0.5, 0.5)
	local pivotOffset = pivot - pivotOrigin

	pos.x = sizeDelta.x * -pivotOffset.x + offset.x
	pos.y = sizeDelta.y * -pivotOffset.y + offset.y

	return pos
end

function MsgBoxSimpleCtrl.ExternalEvent(hasJoystick)
	MsgBoxSimpleCtrl.RefreshIntroductionText(hasJoystick)
end

function MsgBoxSimpleCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.UpdateShowAchievement()

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName and (lName == "MsgBoxSimple" or lName == "MsgBoxGetItem" or lName == "MsgBoxGuide" or lName == "MsgBoxSlider") then
		UILayerCtrl.UpdateSkipping(MsgBoxSimpleCtrl.SetIndicatorProgress, MsgBoxSimpleCtrl.OnHoldConfirm)
		this.GamePadControl()
	end
end

function MsgBoxSimpleCtrl.UpdateShowAchievement()
	if GetAchievementQueue == nil or table.nums(GetAchievementQueue) == 0 then
		return
	end

	if LoaderGetAchievement.ani ~= nil then
		local aniState = LoaderGetAchievement.ani:GetCurrentAnimatorStateInfo(0)

		if aniState:IsName("GetAchievement") and aniState.normalizedTime >= 1 then
			table.remove(GetAchievementQueue, 1)

			LoaderGetAchievement.ani = nil
		end

		return
	end

	LoaderGetAchievement:Load(GetAchievementQueue[1])
end

function MsgBoxSimpleCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName and (lName == "MsgBoxSimple" or lName == "MsgBoxGetItem" or lName == "MsgBoxGuide" or lName == "MsgBoxSlider") then
		if timeHoldBtn > 0 then
			if inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetKeyCancelUp() then
				UILayerCtrl.OnButtonClick("Button_Cancel")
			elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
				UILayerCtrl.OnReleaseSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
			elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
				UILayerCtrl.OnPressSkip(MsgBoxSimpleCtrl.SetIndicatorProgress)
			end
		elseif inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetKeyCancelUp() then
			UILayerCtrl.OnButtonClick("Button_Cancel")
			UILayerCtrl.ForceUpdate(0.01)
		elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
			UILayerCtrl.OnButtonClickMute("Button_Confirm")
			UILayerCtrl.ForceUpdate(0.01)
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end
	end
end

function MsgBoxSimpleCtrl.DPadPress(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "MsgBoxGuide" and isImageIntroductionOpen then
		if dir == XButton.Adjacent.LEFT then
			UILayerCtrl.OnButtonClick("Button_Prev")
		elseif dir == XButton.Adjacent.RIGHT then
			UILayerCtrl.OnButtonClick("Button_Next")
		end
	end
end

function MsgBoxSimpleCtrl.CloseAllRequestModal()
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "MsgBoxSimple" then
		okAndCancelBgImg.image.enabled = false

		LoaderOkAndCancel:ClearChild()
		UILayerCtrl.Pop()
	end
end

function MsgBoxSimpleCtrl.Close()
	if LoaderSimple then
		LoaderSimple:ClearTemplate()
	end

	if LoaderMessage then
		LoaderMessage:ClearTemplate()
	end

	if LoaderPanelWait then
		LoaderPanelWait:ClearTemplate()
	end

	if LoaderOkAndCancel then
		LoaderOkAndCancel:ClearTemplate()
	end

	if LoaderGetItem then
		LoaderGetItem:ClearTemplate()
	end

	if LoaderGetAchievement then
		LoaderGetAchievement:ClearTemplate()
	end

	if LoaderIntroduction then
		LoaderIntroduction:ClearTemplate()
	end

	if LoaderSave then
		LoaderSave:ClearTemplate()
	end

	if LoaderSlider then
		LoaderSlider:ClearTemplate()
	end

	if LoaderMenu then
		LoaderMenu:ClearTemplate()
	end

	UICtrlBase.Close("MsgBoxSimple")
end

return MsgBoxSimpleCtrl
