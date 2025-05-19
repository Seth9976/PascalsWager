-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/HeroViewerCtrl.lua

HeroViewerCtrl = class("HeroViewerCtrl", UICtrlBase)

local this = HeroViewerCtrl
local sceneController
local heroIndex = -1
local heroListColumn = 2
local heroListRow = 6
local heroLoadNumMax = 0
local CommonGroupGo, ARGroupGo, ARMessageText, heroView, scrollHero, poseListGO
local poseListGOisOpen = false
local poseBtnGroup, currentPoseText, currentPoseIndex
local isWaitingForARCallback = false

function HeroViewerCtrl.OnCreate()
	sceneController = ST_Lobby.GetSceneController()

	local heroList = MS_HeroData.GetUIEnableHeroIdList()
	local heroName = this.mainComponent:GetText("Image_Hero_name")
	local heroIcon = this.mainComponent:GetGameObject("Image_Hero_name_Hero_Frame_Hero_Icon")
	local heroBoard = this.mainComponent:GetGameObject("Panel_Start_Panel_Heroes_Hero_board_L")
	local heroDescription = this.mainComponent:GetText("Panel_Start_Panel_Heroes_Hero_Story_HeroDescription")
	local ARMessageText = this.mainComponent:GetText("ARMessageText")
	local arButton = this.mainComponent:GetButton("ARButton")
	local arBackButton = this.mainComponent:GetButton("ARGroup_LeftBar_ARBack")

	CommonGroupGo = this.mainComponent:GetGameObject("CommonGroup")
	ARGroupGo = this.mainComponent:GetGameObject("ARGroup")

	heroName.gameObject:SetActive(false)
	heroBoard:SetActive(false)
	heroDescription:SetContent("")

	local btn = this.mainComponent:GetButton("LobbyMain_Root_Heroes_BtnBack_L")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.Close("HeroViewer")

		if not LS_Setting.activated and (AppVer == AppDemoCJMedia or AppVer == AppDemoAlphaUs or AppVer == AppDemoAlphaZhs) then
			UIManager.SendMessage("LobbyMain", "ShowActivationButton", true)
		end

		LobbyMainCtrl.CloseDialog()
		UILayerCtrl.Pop()
	end, 0)
	UILayerCtrl.AddIndividual("Heroes", "LobbyMain_Root_Heroes_BtnBack_L", btn)

	btn = this.mainComponent:GetButton("Panel_Touch")

	btn:SetAudioEnable(false)
	btn:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		sceneController:RotatePlayer(data)
	end)

	local playButton = this.mainComponent:GetButton("ARGroup_RightBar_Play")
	local stopButton = this.mainComponent:GetButton("ARGroup_RightBar_Stop")

	arButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		HeroViewerCtrl.OnClickARButton()
		stopButton.gameObject:SetActive(true)
		playButton.gameObject:SetActive(false)
	end)
	UILayerCtrl.AddIndividual("Heroes", "ARButton", arButton)
	arBackButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		HeroViewerCtrl.QuitAR()
	end)

	local photoButton = this.mainComponent:GetButton("ARGroup_RightBar_takePhoto")

	photoButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		if isWaitingForARCallback then
			return
		end

		HeroViewerCtrl.TakePhoto()
	end)
	playButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		local hero = sceneController:GetHero()

		if hero ~= nil then
			hero:SetAnimatorSpeed(1)
		end

		stopButton.gameObject:SetActive(true)
		playButton.gameObject:SetActive(false)
	end)
	stopButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		local hero = sceneController:GetHero()

		if hero ~= nil then
			hero:SetAnimatorSpeed(0)
		end

		stopButton.gameObject:SetActive(false)
		playButton.gameObject:SetActive(true)
	end)

	local sliderGo = this.mainComponent:GetGameObject("ARGroup_LeftBar_Slider")
	local slider = sliderGo:GetComponent("Slider")

	slider.onValueChanged:RemoveAllListeners()

	slider.value = 1

	slider.onValueChanged:AddListener(function(progress)
		HeroViewerCtrl.ChangeModelScale(progress)
	end)

	poseListGO = this.mainComponent:GetGameObject("ARGroup_PoseList")

	local poseListXtween = poseListGO:GetComponent("XTween")

	poseBtnGroup = {}
	currentPoseText = this.mainComponent:GetText("ARGroup_PoseBtn_Text")

	currentPoseText:SetContent(1)

	for i = 1, 8 do
		local poseChildBtn = this.mainComponent:GetButton("PoseSelection" .. i)

		poseBtnGroup[i] = poseChildBtn

		poseChildBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			currentPoseIndex = i

			currentPoseText:SetContent(i)
		end)
	end

	local poseBtn = this.mainComponent:GetButton("ARGroup_PoseBtn")

	poseBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		if poseListGOisOpen then
			poseListXtween.reversed = true

			poseListXtween:Play()

			poseListGOisOpen = false
		else
			poseListXtween.reversed = false

			poseListXtween:Play()

			poseListGOisOpen = true
		end
	end)

	btn = this.mainComponent:GetButton("Skill_Skill_Button")

	btn.gameObject:SetActive(false)

	local goScroll = this.mainComponent:GetGameObject("Scroll_Hero_R")

	heroView = {}
	heroView.canvas = this.transform:GetComponent("Canvas")
	heroView.scroll = XScrollRect:new(goScroll)

	local screenPos = heroView.canvas.worldCamera:WorldToScreenPoint(heroView.scroll.transform.position)

	heroView.ScrollY = heroView.scroll.transform:GetComponent("RectTransform").sizeDelta.y
	heroView.TopScreenY = screenPos.y + heroView.ScrollY / 2
	heroView.BottomScreenY = screenPos.y - heroView.ScrollY / 2
	heroView.TopScreenY = heroView.TopScreenY - 50
	heroView.BottomScreenY = heroView.BottomScreenY + 50

	SystemHelper.Log(heroView.ScrollY .. ", " .. heroView.TopScreenY .. ", " .. heroView.BottomScreenY .. ", " .. heroView.TopScreenY .. ", " .. heroView.BottomScreenY)

	heroView.loadedCount = 0
	heroView.loader = this.mainComponent:GetLoader("Scroll_Hero_Viewport_Content")
	heroView.loader.loadCount = #heroList

	local remain = heroView.loader.loadCount % heroListColumn

	heroLoadNumMax = heroView.loader.loadCount - remain + heroListColumn

	heroView.loader:SetCacheNumMax(1, 64)

	heroView.loader.gameObject:GetComponent("GridLayoutGroup").constraintCount = 1
	heroView.group = XGroup:new()

	heroView.group:SetMode(XGroup.GroupMode.Button)

	function heroView.loader.loadCallback(index, com, data)
		local heroId = heroList[index]
		local selectBtn = com:GetButton("Button_Select")

		selectBtn:SetParentScroll(heroView.scroll)
		UILayerCtrl.AddButton("Heroes", "HeroSel" .. index, selectBtn)

		if index > heroListColumn then
			selectBtn:SetAdjacent(XButton.Adjacent.UP, "HeroSel" .. index - heroListColumn)
		elseif index <= remain then
			selectBtn:SetAdjacent(XButton.Adjacent.UP, "HeroSel" .. heroView.loader.loadCount - remain + index)
		else
			selectBtn:SetAdjacent(XButton.Adjacent.UP, "HeroSel" .. heroView.loader.loadCount - remain - heroListColumn + index)
		end

		if index % heroListColumn == 0 then
			selectBtn:SetAdjacent(XButton.Adjacent.RIGHT, "HeroSel" .. index - (heroListColumn - 1))
		else
			selectBtn:SetAdjacent(XButton.Adjacent.RIGHT, "HeroSel" .. index + 1)
		end

		if (index - 1) % heroListColumn == 0 then
			selectBtn:SetAdjacent(XButton.Adjacent.LEFT, "HeroSel" .. index + (heroListColumn - 1))
		else
			selectBtn:SetAdjacent(XButton.Adjacent.LEFT, "HeroSel" .. index - 1)
		end

		if index + heroListColumn < heroView.loader.loadCount + 1 then
			selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "HeroSel" .. index + heroListColumn)
		elseif index <= heroView.loader.loadCount - remain then
			selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "HeroSel" .. index - heroView.loader.loadCount + remain + heroListColumn)
		else
			selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "HeroSel" .. index % heroListColumn)
		end

		heroView.group:Add(selectBtn)

		heroIndex = 1

		selectBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			if sceneController:GetHeroLoadFinish() == false then
				return
			end

			heroIndex = index

			SystemHelper.Log("=================index=" .. index .. ": " .. heroId)
			selectBtn:SetSelected(true)
			sceneController:LoadHero(heroId)

			local imgtween = heroBoard:GetComponent(typeof(XTween))

			heroName.gameObject:SetActive(false)
			heroBoard:SetActive(false)
			imgtween:Play()
			UILayerCtrl.OnSelect("HeroSel" .. index)

			local texttween = heroDescription.gameObject:GetComponent(typeof(XTween))
			local heroData = MS_HeroData.GetHero(heroList[heroIndex])

			heroName:SetContent(heroData.Name)

			local hero = sceneController:GetHero()

			if hero ~= nil then
				hero:SetAnimatorSpeed(1)
			end
		end)

		local Image_Hero = com:GetGameObject("Image_Hero")
		local img = XImage:new(Image_Hero)
		local sprite = XObjectPool.GetIcon("photo" .. heroId)

		if sprite ~= nil then
			img:SetSprite(sprite)
		end

		heroView.loadedCount = heroView.loadedCount + 1
	end

	heroView.loader:Load()
end

function HeroViewerCtrl.IsUiLoaded()
	if heroView then
		this.loadFinish = heroView.loadedCount == heroView.loader.loadCount
	end
end

function HeroViewerCtrl.Update()
	if not this.loadFinish then
		return
	end

	if sceneController and sceneController:ReadControllerInput() then
		this.GamePadControl()
	end
end

function HeroViewerCtrl.JPadPress(dir)
	if sceneController:GetHeroLoadFinish() == false then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()
	local btnName = UILayerCtrl.GetCurrentButtonName()

	if layerName == nil or btnName == nil then
		return
	end

	if layerName == "Heroes" and (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) then
		local heroIndex = tonumber(string.sub(btnName, 8))
		local row = math.ceil(heroIndex / heroListColumn)
		local toprow = 1 + math.floor((1 - heroView.scroll.scrollRectCom.normalizedPosition.y) / (1 / (math.ceil(heroLoadNumMax / heroListColumn) - heroListRow)) + 0.5)
		local botrow = toprow + heroListRow - 1

		if dir == XButton.Adjacent.DOWN then
			if heroIndex + heroListColumn < heroView.loader.loadCount + 1 then
				if botrow <= row then
					heroView.scroll.scrollRectCom.normalizedPosition = Vector2.New(heroView.scroll.scrollRectCom.normalizedPosition.x, heroView.scroll.scrollRectCom.normalizedPosition.y - 1 / (math.ceil(heroLoadNumMax / heroListColumn) - heroListRow))
				end
			else
				heroView.scroll.scrollRectCom.normalizedPosition = Vector2.New(heroView.scroll.scrollRectCom.normalizedPosition.x, 1)
			end
		elseif dir == XButton.Adjacent.UP and row <= toprow then
			if heroIndex > heroListColumn then
				heroView.scroll.scrollRectCom.normalizedPosition = Vector2.New(heroView.scroll.scrollRectCom.normalizedPosition.x, heroView.scroll.scrollRectCom.normalizedPosition.y + 1 / (math.ceil(heroLoadNumMax / heroListColumn) - heroListRow))
			else
				heroView.scroll.scrollRectCom.normalizedPosition = Vector2.New(heroView.scroll.scrollRectCom.normalizedPosition.x, 0)
			end
		end
	end

	local btn = UILayerCtrl.Select(dir)

	if btn then
		UILayerCtrl.OnCursorClick()
	end
end

function HeroViewerCtrl.OnClickARButton()
	UILayerCtrl.Push("HeroesAR")
	CommonGroupGo:SetActive(false)
	sceneController:EnterAR(HeroViewerCtrl.InitARSuccessCallback)
	sceneController:SetFindPlaneCallback(HeroViewerCtrl.FindPlaneCallback)
	sceneController:SetSelectPlaneCallback(HeroViewerCtrl.SelectPlaneCallback)
	sceneController:SetShowHeroCallback(HeroViewerCtrl.ShowHeroCallback)

	isWaitingForARCallback = true
end

function HeroViewerCtrl.InitARSuccessCallback(success)
	if success then
		Common.LogError("Init AR Success")
		ARMessageText.gameObject:SetActive(true)
		ARMessageText:SetContent("請尋找一個平面")
	else
		Common.LogError("Init AR Failed")
		CommonGroupGo:SetActive(true)
	end

	isWaitingForARCallback = false
end

function HeroViewerCtrl.QuitAR()
	ARGroupGo:SetActive(false)
	sceneController:ExitAR(HeroViewerCtrl.QuitARCallback)

	isWaitingForARCallback = true
end

function HeroViewerCtrl.QuitARCallback()
	UILayerCtrl.Pop()
	CommonGroupGo:SetActive(true)
	Common.LogError("Quit AR")

	isWaitingForARCallback = false
end

function HeroViewerCtrl.ChangeModelScale(value)
	local hero = sceneController:GetHero()

	if hero ~= nil then
		local heroId = hero:GetHeroId()
		local data = MS_HeroData.GetHero(heroId)

		hero:SetScalePNoDelay(data.UIScale * value, data.UIScale * value, data.UIScale * value)
	end
end

function HeroViewerCtrl.TakePhoto()
	sceneController:TakeARPhoto(HeroViewerCtrl.TakePhotoCallback)

	isWaitingForARCallback = true
end

function HeroViewerCtrl.TakePhotoCallback(success)
	if success then
		Common.LogError("Take photo success")
	else
		Common.LogError("Take photo failed")
	end

	isWaitingForARCallback = false
end

function HeroViewerCtrl.FindPlaneCallback()
	Common.LogError("Find Plane")
	ARMessageText.gameObject:SetActive(true)
	ARMessageText:SetContent("請選擇一個平面")
end

function HeroViewerCtrl.SelectPlaneCallback()
	Common.LogError("Select Plane")
end

function HeroViewerCtrl.ShowHeroCallback()
	Common.LogError("Show Hero")
	ARGroupGo:SetActive(true)
end

function HeroViewerCtrl.DPadPress(dir)
	if isWaitingForARCallback then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName ~= "Heroes" then
		return
	end

	if sceneController:GetHeroLoadFinish() == false then
		return
	end

	local btn = UILayerCtrl.Select(dir)

	if btn then
		UILayerCtrl.OnCursorClick()
	end
end

function HeroViewerCtrl.GamePadControl()
	if isWaitingForARCallback then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName ~= "Heroes" then
		return
	end

	if UILayerCtrl.IsProcessed() then
		return
	end

	if inputMgr:GetButtonUp(GBKey.B) then
		UILayerCtrl.OnButtonClick("LobbyMain_Root_Heroes_BtnBack_L")
		UILayerCtrl.ForceUpdate()
	end
end

return HeroViewerCtrl
