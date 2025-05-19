-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/SaveCtrl.lua

SaveCtrl = class("SaveCtrl", UICtrlBase)

local this = SaveCtrl
local selectPanel, titleText, descriptionText, selectBtnList, selectFuncList, currentBtn, twn
local angleList = {
	20,
	40,
	60
}
local expCircleTween, expLightTween, expCircleImage, expLightGo, levelText, finalLevel, finalPercent, levelupItemList, levelupSelectedItem, hpText, spText, mpText, propertyList, attributeList, addBtnList, Exchange, sceneController

function SaveCtrl.OnCreate()
	UILayerCtrl.Add("SaveMain")
	UILayerCtrl.Add("SaveLevelUp")
	UILayerCtrl.Add("Exchange")

	sceneController = ST_Main.GetSceneController()
	selectPanel = this.mainComponent:GetGameObject("SavePanel_SelectPanel")

	local backBtn = this.mainComponent:GetButton("SavePanel_SavePanel_LT_Backbtn")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SaveCtrl.CloseSave()
	end)
	UILayerCtrl.AddIndividual("SaveMain", "SavePanel_SavePanel_LT_Backbtn", backBtn)

	local heroId = sceneController:GetHostPlayerHeroId()
	local heroIcon = this.mainComponent:GetGameObject("SavePanel_LevelupPanel_HeroInfo_HeroFrame_HeroIcon")
	local heroIconImage = XImage:new(heroIcon)
	local sprite = XObjectPool.GetIcon("heroIcon" .. heroId)

	heroIconImage:SetSprite(sprite)

	local nameImg = this.mainComponent:GetGameObject("SavePanel_LevelupPanel_HeroInfo_HeroNameImage")
	local heroNameImage = XImage:new(nameImg)
	local sprite = XObjectPool.GetIcon("heroName" .. heroId)

	heroNameImage:SetSprite(sprite)

	local playerName = this.mainComponent:GetText("SavePanel_LevelupPanel_HeroInfo_PlayerName")

	playerName:SetContent(FS_UserData.playerList:GetPlayer():GetName())

	titleText = this.mainComponent:GetText("SavePanel_SelectPanel_Title")
	descriptionText = this.mainComponent:GetText("SavePanel_SelectPanel_SelectPanel_B_description")
	titleText.xtween = titleText.gameObject:GetComponent("XTween")
	descriptionText.xtween = descriptionText.gameObject:GetComponent("XTween")

	local circle = this.mainComponent:GetGameObject("SavePanel_SelectPanel_SelectPanel_B_circle")

	twn = Tween:new(circle.transform)

	twn:Easing(Easing.Quartic.easeOut)

	selectBtnList = {}

	local restartBtn = this.mainComponent:GetButton("SavePanel_SelectPanel_SelectPanel_B_circle_RestartBtn")
	local changeBtn = this.mainComponent:GetButton("SavePanel_SelectPanel_SelectPanel_B_circle_ChangeBtn")
	local levelupBtn = this.mainComponent:GetButton("SavePanel_SelectPanel_SelectPanel_B_circle_LevelupBtn")

	restartBtn.twn = Tween:new(restartBtn.transform)
	changeBtn.twn = Tween:new(changeBtn.transform)
	levelupBtn.twn = Tween:new(levelupBtn.transform)

	table.insert(selectBtnList, levelupBtn)
	table.insert(selectBtnList, restartBtn)
	table.insert(selectBtnList, changeBtn)

	currentBtn = selectBtnList[2]
	currentBtn.index = 2

	SaveCtrl.SetTitleAndDescription(2)
	SaveCtrl.RefreshBtnFunc()

	selectFuncList = {
		function()
			levelupPanel:SetActive(true)
			UILayerCtrl.Push("SaveLevelUp", nil)
		end,
		function()
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_SAVE_SELECT_RECOVER_ALERT, SaveCtrl.SaveConfirm, function()
				return
			end)
		end,
		function()
			return
		end
	}

	levelupBtn:SetAdjacent(XButton.Adjacent.RIGHT, "SavePanel_SelectPanel_SelectPanel_B_circle_RestartBtn")
	restartBtn:SetAdjacent(XButton.Adjacent.LEFT, "SavePanel_SelectPanel_SelectPanel_B_circle_LevelupBtn")
	restartBtn:SetAdjacent(XButton.Adjacent.RIGHT, "SavePanel_SelectPanel_SelectPanel_B_circle_ChangeBtn")
	changeBtn:SetAdjacent(XButton.Adjacent.LEFT, "SavePanel_SelectPanel_SelectPanel_B_circle_RestartBtn")
	UILayerCtrl.AddButton("SaveMain", "SavePanel_SelectPanel_SelectPanel_B_circle_LevelupBtn", levelupBtn)
	UILayerCtrl.AddButton("SaveMain", "SavePanel_SelectPanel_SelectPanel_B_circle_RestartBtn", restartBtn)
	UILayerCtrl.AddButton("SaveMain", "SavePanel_SelectPanel_SelectPanel_B_circle_ChangeBtn", changeBtn)

	local btn = this.mainComponent:GetButton("SavePanel_SelectPanelMain_SelectPanelMain_B_Exchange")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		Exchange.heroLoader:Load()
		Exchange.exchangePanel:SetActive(true)
	end)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "SavePanel_SelectPanelMain_SelectPanelMain_B_Save")
	btn:SetAdjacent(XButton.Adjacent.LEFT, "SavePanel_SelectPanelMain_SelectPanelMain_B_Save")
	UILayerCtrl.AddButton("SaveMain", "SavePanel_SelectPanelMain_SelectPanelMain_B_Exchange", btn)

	btn = this.mainComponent:GetButton("SavePanel_SelectPanelMain_SelectPanelMain_B_Save")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_SAVE_SELECT_RECOVER_ALERT, SaveCtrl.SaveConfirm, function()
			return
		end)
	end)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "SavePanel_SelectPanelMain_SelectPanelMain_B_Exchange")
	btn:SetAdjacent(XButton.Adjacent.LEFT, "SavePanel_SelectPanelMain_SelectPanelMain_B_Exchange")
	UILayerCtrl.AddButton("SaveMain", "SavePanel_SelectPanelMain_SelectPanelMain_B_Save", btn)

	Exchange = {}
	Exchange.scroll = this.mainComponent:GetGameObject("SavePanel_ExchangePanel_HeroScroll")
	Exchange.scroll = XScrollRect:new(Exchange.scroll)
	Exchange.exchangePanel = this.mainComponent:GetGameObject("SavePanel_ExchangePanel")
	Exchange.backBtn = this.mainComponent:GetButton("SavePanel_ExchangePanel_BackButton")

	Exchange.backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	Exchange.backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		Exchange.exchangePanel:SetActive(false)
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddIndividual("Exchange", "SavePanel_ExchangePanel_BackButton", Exchange.backBtn)

	Exchange.heroLoader = this.mainComponent:GetLoader("SavePanel_ExchangePanel_HeroList")
	Exchange.heroLoader.loadCount = BattleData.GetHostNum()

	function Exchange.heroLoader.loadCallback(index, com, data)
		local _heroId = BattleData.GetHostHeroId(index)
		local _heroData = FS_UserData.heroList:GetHero(_heroId)

		if _heroData ~= nil then
			com:GetText("SavePanel_ExchangePanel_text_LevelText"):SetContent(_heroData.level)
			com:GetText("SavePanel_ExchangePanel_text1_ExpText"):SetContent(_heroData.exp)

			local expTotal = MS_HeroExp.GetHeroRequireExp(_heroData.level + 1)

			com:GetGameObject("ExpFrame_ExpBar"):GetComponent("RectTransform").sizeDelta = Vector2.New(_heroData.exp / expTotal * 237.4, 6)
		end

		local heroIconImage = XImage:new(com:GetGameObject("Top_HeroIcon"))
		local sprite = XObjectPool.GetIcon("heroIcon" .. _heroId)

		heroIconImage:SetSprite(sprite)

		local heroNameImage = XImage:new(com:GetGameObject("HeroNameImage"))

		sprite = XObjectPool.GetIcon("heroName" .. _heroId)

		heroNameImage:SetSprite(sprite)

		local heroPortraitImage = XImage:new(com:GetGameObject("HeroPortrait"))

		sprite = XObjectPool.GetIcon("portrait" .. _heroId)

		heroPortraitImage:SetSprite(sprite)

		local curList, maxList = sceneController:GetHostPlayerState(_heroId)

		com:GetText("HPText"):SetContent(curList[MS_HeroData.Property.Hp] .. "/" .. maxList[MS_HeroData.Property.Hp])
		com:GetText("SPText"):SetContent(curList[MS_HeroData.Property.Energy] .. "/" .. maxList[MS_HeroData.Property.Energy])
		com:GetText("MPText"):SetContent(curList[MS_HeroData.Property.Mp] .. "/" .. maxList[MS_HeroData.Property.Mp])

		com:GetGameObject("HPBar"):GetComponent("RectTransform").sizeDelta = Vector2.New(curList[MS_HeroData.Property.Hp] / maxList[MS_HeroData.Property.Hp] * 365.6, 6)
		com:GetGameObject("SPBar"):GetComponent("RectTransform").sizeDelta = Vector2.New(curList[MS_HeroData.Property.Energy] / maxList[MS_HeroData.Property.Energy] * 365.6, 6)
		com:GetGameObject("MPBar"):GetComponent("RectTransform").sizeDelta = Vector2.New(curList[MS_HeroData.Property.Mp] / maxList[MS_HeroData.Property.Mp] * 365.6, 6)

		local confirmBtn = com:GetButton("Loader_HeroSelection_ConfirmButton")

		confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SaveCtrl.SelectHero(_heroId)
			Exchange.backBtn:OnDownMute(nil, nil)
			Exchange.backBtn:OnClick(nil, nil)
		end)
		UILayerCtrl.AddButton("Exchange", "confirm" .. index, confirmBtn)

		if index > 1 then
			confirmBtn:SetAdjacent(XButton.Adjacent.LEFT, "confirm" .. index - 1)
		end

		if index < Exchange.heroLoader.loadCount then
			confirmBtn:SetAdjacent(XButton.Adjacent.RIGHT, "confirm" .. index + 1)
		else
			UILayerCtrl.Push("Exchange", "confirm1")
		end
	end

	this.gameObject:SetActive(false)

	this.loadFinish = true
end

function SaveCtrl.SelectHero(heroId)
	return
end

function SaveCtrl.OpenSave()
	this.gameObject:SetActive(true)

	if currentBtn.index ~= 2 then
		selectBtnList[2]:OnDown(nil, nil)
		selectBtnList[2]:OnClick(nil, nil)
	end

	UILayerCtrl.Push("SaveMain", "SavePanel_SelectPanelMain_SelectPanelMain_B_Save")
end

function SaveCtrl.CloseSave()
	if sceneController ~= nil then
		sceneController:SetActionAssist(ControllerMain.AssistButton.WorshipingEnd)
	end

	this.gameObject:SetActive(false)
	UILayerCtrl.Pop()
end

function SaveCtrl.SaveConfirm()
	UIManager.SendMessage("PlayerInfo", "OpenPlayerInfoEditor")
end

function SaveCtrl.RefreshBtnFunc()
	for i = 1, 3 do
		selectBtnList[i]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			SaveCtrl.CircleTween(angleList[i])
			SaveCtrl.ButtonTween(selectBtnList[i].twn, true)
			SaveCtrl.ButtonTween(currentBtn.twn, false)

			currentBtn = selectBtnList[i]
			currentBtn.index = i

			SaveCtrl.SetTitleAndDescription(i)
			SaveCtrl.RefreshBtnFunc()
		end)
	end

	currentBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		selectFuncList[currentBtn.index]()
	end)
end

function SaveCtrl.SetTitleAndDescription(index)
	titleText:SetGameTextContent(function()
		return GameText.UI_SAVE_SELECT_TITLELIST[index]
	end)
	descriptionText:SetGameTextContent(function()
		return GameText.UI_SAVE_SELECT_DESCRIPTIONLIST[index]
	end)
	titleText.xtween:Play()
	descriptionText.xtween:Play()
end

function SaveCtrl.CircleTween(ang, finishfunc)
	if twn.isPlaying then
		twn:Stop()
	end

	local tbl = {
		localScale = Vector3.New(1, 1, 1),
		localEulerAngles = Vector3.New(0, 0, ang)
	}

	twn:MoveTo(tbl, 1)
	twn:OnComplete(finishfunc)
	twn:Start()
end

function SaveCtrl.ButtonTween(tween, ismid, finishfunc)
	if tween.isPlaying then
		tween:Stop()
	end

	local tbl

	if ismid then
		tween:Easing(Easing.Quartic.easeOut)

		tbl = {
			localScale = Vector3.New(1, 1, 1)
		}
	else
		tween:Easing(Easing.Quartic.easeOut)

		tbl = {
			localScale = Vector3.New(0.4, 0.4, 1)
		}
	end

	tween:MoveTo(tbl, 1)
	tween:OnComplete(finishfunc)
	tween:Start()
end

function SaveCtrl.DPadPress(dir)
	UILayerCtrl.Select(dir)

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "Exchange" then
		if dir == 3 then
			Exchange.scroll.scrollRectCom.normalizedPosition = Vector2.New(Exchange.scroll.scrollRectCom.normalizedPosition.x - 1 / (Exchange.heroLoader.loadCount - 2), Exchange.scroll.scrollRectCom.normalizedPosition.y)
		elseif dir == 4 then
			Exchange.scroll.scrollRectCom.normalizedPosition = Vector2.New(Exchange.scroll.scrollRectCom.normalizedPosition.x + 1 / (Exchange.heroLoader.loadCount - 2), Exchange.scroll.scrollRectCom.normalizedPosition.y)
		end
	end
end

function SaveCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function SaveCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "SaveMain" then
		if inputMgr:GetButtonUp(LS_Setting.Btn.L1) then
			SaveCtrl.DPadPress(3)
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.R1) then
			SaveCtrl.DPadPress(4)
		end
	end
end

return SaveCtrl
