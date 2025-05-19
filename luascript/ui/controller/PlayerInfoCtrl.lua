-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/PlayerInfoCtrl.lua

PlayerInfoCtrl = class("PlayerInfoCtrl", UICtrlBase)

if AppVer == AppDemoCJReview then
	PlayerInfoCtrl.static.Tab = {
		Bag = 2,
		Property = 1
	}
else
	PlayerInfoCtrl.static.Tab = {
		Talent = 3,
		Task = 4,
		Bag = 5,
		Alchemy = 6,
		Property = 1,
		Trophy = 2
	}
end

PlayerInfoCtrl.static.MenuGuideType = {
	Bag = 500,
	Task = 600,
	AlchemyEnchant = 104,
	AlchemyTrophy = 103,
	Trophy = 300,
	Property = 200,
	AlchemyAgentia = 102,
	Talent = 400,
	Alchemy = 100
}
PlayerInfoCtrl.static.ItemTab = {
	Trophy = 5,
	Consume = 1,
	Exp = 2,
	Quest = 3,
	Material = 4
}
PlayerInfoCtrl.static.SanityThreshold = {
	Caution = 2,
	Warning = 3,
	Zero = 4,
	Normal = 1
}
PlayerInfoCtrl.static.SanityColor = {
	{
		1,
		1,
		1,
		1
	},
	{
		0.9137254901960784,
		0.6823529411764706,
		0.4392156862745098,
		1
	},
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		1,
		1,
		1
	}
}
PlayerInfoCtrl.static.AlchemyTabType = {
	Enchant = 4,
	Rest = 5,
	Agentia = 2,
	Dedication = 1,
	Trophy = 3
}
PlayerInfoCtrl.static.talentType = {
	Sanity = 2,
	Attack = 1,
	Alchemy = 4,
	Special = 3
}
PlayerInfoCtrl.static.talentStoneType = {
	High = 3,
	Low = 1,
	VeryHigh = 4,
	Mid = 2,
	Jerold = 5
}

local this = PlayerInfoCtrl
local heroInfoPanel
local tabGOGroup = {}
local isActive = false
local isEditor = false
local sceneController, screenRect, screenRectWidth, selectHeroList
local currentHeroIndex = 1
local activeHeroIndex, blackBG
local currentBtnName = "item1"
local currentLayer = "PlayerInfoBag"
local currentBtnIndex = PlayerInfoCtrl.Tab.Bag
local currentAlchemyTabBtnIndex = PlayerInfoCtrl.Tab.Dedication
local currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Consume
local menuBtnGroup
local mainTabBtnCountMax = 6

if AppVer == AppDemoCJReview then
	mainTabBtnCountMax = 2
end

local navButtonGroup, itemTypeNavButtonGroup
local talentMain = {}
local currentTalentType = false
local talentCircleAngleList = {
	0,
	270,
	180,
	90
}
local talentList = {}
local talentPosList = {}
local talentDataList = {}
local talentLineList = {}
local talentNumTextList = {}
local talentDetail = {}
local talentDetailPointList = {}
local inventory = {}
local itemList = {}
local trophyList = {}
local quickList = {}
local quickItem
local itemTypeCountMax = 4
local inventoryItemRow = 6
local currentItemType = MS_ItemData.MainType.Consume
local itemDetail = {}
local quickSlot = {}
local task = {}
local property = {}
local attributeList = {}
local propertyList = {}
local propertyDeltaList = {}
local booty = {}
local trophyItemColumn = 5
local trophyItemRow = 3
local asynLS = {}
local tabArrow = {}
local alchemyNavButtonGroup
local alchemyTabBtnCountMax = 5
local alchemy = {}
local gamePadIcon = {}
local keyboardIcon = {}
local gamePadIconRT, KeyboardIconRT
local deltaTime = 0

function PlayerInfoCtrl.AsynLoad()
	local count = 0

	for k, v in pairs(asynLS) do
		if v[1] == v[2] then
			count = count + 1
		end
	end

	if count == 2 then
		this.loadFinish = true
	end
end

function PlayerInfoCtrl.ClosePanel()
	UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
end

function PlayerInfoCtrl.ClosePanelPlayerInfoAlchemyGetItem()
	UILayerCtrl.OnButtonClick("AlchemyGetItemBack")
end

function PlayerInfoCtrl.ClosePanelPlayerInfoAlchemyConfirm()
	UILayerCtrl.OnButtonClick("PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Cancel")
end

function PlayerInfoCtrl.OnCreate()
	this.loadFinish = false
	asynLS = {
		Heroes = {
			0,
			0
		},
		ExpItem = {
			0,
			0
		}
	}

	TimeHelper.resetDeltaTime()

	currentBtnName = "item1"
	currentLayer = "PlayerInfoBag"
	currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Consume
	currentBtnIndex = PlayerInfoCtrl.Tab.Bag
	currentItemType = MS_ItemData.MainType.Consume
	property = {}
	property.EditorGroup = {}
	property.AttributeBtnGroup = {}
	booty = {}
	sceneController = ST_Main.GetSceneController()

	UILayerCtrl.Add("PlayerInfoBag")
	UILayerCtrl.Add("PlayerInfoTalent", PlayerInfoCtrl.ClosePanel)
	UILayerCtrl.Add("PlayerInfoTalent1")
	UILayerCtrl.Add("PlayerInfoTalent2")
	UILayerCtrl.Add("PlayerInfoTalent3")
	UILayerCtrl.Add("PlayerInfoTalent4")
	UILayerCtrl.Add("PlayerInfoProperty", PlayerInfoCtrl.ClosePanel)
	UILayerCtrl.Add("PlayerInfoTask")
	UILayerCtrl.Add("PlayerInfoItemEquip", PlayerInfoCtrl.ClosePanel)
	UILayerCtrl.Add("PlayerInfoLevelup", PlayerInfoCtrl.ClosePanel)
	UILayerCtrl.Add("PlayerInfoBooty")
	UILayerCtrl.Add("PlayerInfoAlchemy")
	UILayerCtrl.Add("PlayerInfoAlchemyBag", PlayerInfoCtrl.ClosePanel)
	UILayerCtrl.Add("PlayerInfoAlchemyGetItem", PlayerInfoCtrl.ClosePanelPlayerInfoAlchemyGetItem)
	UILayerCtrl.Add("PlayerInfoAlchemyConfirm", PlayerInfoCtrl.ClosePanelPlayerInfoAlchemyConfirm)

	screenRectWidth = SystemHelper.GetScreenWidth() / SystemHelper.GetScreenHeight() * 750

	if screenRectWidth < 1334 then
		screenRectWidth = 1334
	end

	keyboardIcon = {}
	keyboardIcon.drop_down_x = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard_x")
	keyboardIcon.prev_lb = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard_lt")
	keyboardIcon.next_rb = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard_rt")
	keyboardIcon.delete_y = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard_Y2")
	keyboardIcon.lock_r3 = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard_r3")
	keyboardIcon.edit_y = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard_Y")
	gamePadIcon = {}
	gamePadIcon.drop_down_x = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_x")
	gamePadIcon.prev_lb = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_lt")
	gamePadIcon.next_rb = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_rt")
	gamePadIcon.add_r = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_Group_r")
	gamePadIcon.min_l = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_Group_l")
	gamePadIcon.edit_y = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_Y_area_Y")
	gamePadIcon.delete_y = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_Group_Y2")
	gamePadIcon.lock_r3 = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_Group_r3")
	gamePadIconRT = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_Group_RB"):GetComponent("RectTransform")
	KeyboardIconRT = this.mainComponent:GetGameObject("PlayerInfoPanel_GamePadIcon_KeyBoard"):GetComponent("RectTransform")
	booty.BottomLockBtnText = this.mainComponent:GetText("PlayerInfoPanel_GamePadIcon_Group_r3_Text")
	booty.KeyboardBottomLockBtnText = this.mainComponent:GetText("PlayerInfoPanel_GamePadIcon_KeyBoard_r3_Text")
	blackBG = this.gameObject.transform:Find("PlayerInfoPanel"):GetComponent("Image")

	local TitleText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_L_TabTitle_Text")
	local backBtn = this.mainComponent:GetButton("PlayerInfoPanel_Back")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			talentMain.talentReturnFlag = false

			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
		elseif layerName == "PlayerInfoBooty" and booty.itemSelectPanel.activeSelf then
			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_Close")
		end

		if this.gameObject == nil then
			return
		end

		if isEditor then
			if sceneController ~= nil then
				sceneController:SetActionAssist(ControllerMain.AssistButton.WorshipingEnd)
			end

			if sceneController ~= nil then
				local heroId = sceneController:GetHostPlayerHeroId()

				PlayerInfoCtrl.ReLoad(heroId)
			end

			AudioCtrl.SetPause(false)

			isEditor = false
		end

		if sceneController ~= nil then
			sceneController:ExitMenu()
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
		end

		itemDetail.isInEquipmentState = false

		this.gameObject:SetActive(false)
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == false then
			UIManager.SendMessage("Mainmenu", "ShowMainUI", true)
			UIManager.SendMessage("Mainmenu", "ShowHostUI", true)
		end

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			UIManager.SendMessage("Mainmenu", "SetTimeRecordVisible", true)
		end

		UIManager.SendMessage("Mainmenu", "ShowBaseUI", true)

		isActive = false

		UIManager.SendMessage("Mainmenu", "RefreshTempGuide")
		UIManager.SendMessage("Mainmenu", "ReturnUiHandling")
		XNetwork.RemoveListener(XProtocol.BattleProtocolToHero.RESP_HERO_ATTRIB_UPDATED)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToHero.ADD_HERO_ATTRIB_POINT)

		currentBtnName = UILayerCtrl.GetCurrentButtonName()
		currentLayer = UILayerCtrl.GetCurrentLayerName()

		UILayerCtrl.Pop()
		UILayerCtrl.ForceUpdate(1.3)
		inputMgr:SetPointerLocked(true)
		inputMgr:SetInGameMode()

		LS_Setting.ignoreLMB = false

		UIManager.SendMessage("Mainmenu", "ShowTouchUI", not LS_Setting.isJoystickConnected and not LS_Setting.isKeyboardConnected and not LS_Setting.isMouseConnected)
	end)
	UILayerCtrl.AddIndividual("PlayerInfoBag", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoTalent", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoTalent1", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoTalent2", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoTalent3", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoTalent4", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoProperty", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "PlayerInfoPanel_Back_LT", backBtn)
	UILayerCtrl.AddIndividual("PlayerInfoTask", "PlayerInfoPanel_Back_LT", backBtn)

	heroInfoPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_HeroInfo")
	tabGOGroup.bagTab = this.mainComponent:GetGameObject("PlayerInfoPanel_TabPanel_B_BagTab")
	tabGOGroup.propertyTab = this.mainComponent:GetGameObject("PlayerInfoPanel_TabPanel_B_PropertyTab")
	tabGOGroup.talentTab = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab")
	tabGOGroup.bootyTab = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab")
	tabGOGroup.alchemyTab = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab")
	tabGOGroup.taskTab = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab")

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		currentLayer = "PlayerInfoTalent"
		currentBtnName = "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn"
		currentBtnIndex = PlayerInfoCtrl.Tab.Talent

		tabGOGroup.bagTab:SetActive(false)
		tabGOGroup.talentTab:SetActive(true)
	end

	menuBtnGroup = {}

	local btn = this.mainComponent:GetButton("PlayerInfoPanel_TabButton_RT_PropertyBtn_RT")

	btn.newLight = btn.gameObject.transform:Find("outlineLight").gameObject

	btn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			talentMain.talentReturnFlag = false

			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
		end

		TitleText:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_PROPERTY
		end)
		PlayerInfoCtrl.OpenTab("propertyTab")
		heroInfoPanel:SetActive(true)

		currentBtnIndex = PlayerInfoCtrl.Tab.Property

		PlayerInfoCtrl.SetBGAlpha(1)
		PlayerInfoCtrl.ExitEditQuickSlot()

		itemDetail.isInEquipmentState = false

		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfoProperty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_emptyBtn")
		PlayerInfoCtrl.RefreshProperty(FS_UserData.story:GetUIHeroId(currentHeroIndex))

		if isEditor then
			PlayerInfoCtrl.ReLoad(FS_UserData.story:GetUIHeroId(currentHeroIndex))
		end

		PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Property)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Property].newLight:SetActive(PlayerInfoCtrl.AnyHeroHaveAttributePoints())

		if selectHeroList.loadCount < 2 then
			selectHeroList.parentGO:SetActive(false)
		else
			selectHeroList.parentGO:SetActive(true)
		end

		PlayerInfoCtrl.RefreshHeroNewLight(true)
	end)

	navButtonGroup = {}
	navButtonGroup[PlayerInfoCtrl.Tab.Property] = btn
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Property] = btn
	btn = this.mainComponent:GetButton("PlayerInfoPanel_TabButton_RT_BagBtn_RT")
	btn.newLight = btn.gameObject.transform:Find("outlineLight").gameObject

	btn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	btn:SelectOnStart(true)
	TitleText:SetGameTextContent(function()
		return GameText.UI_PLAYERINFO_INVENTORY
	end)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			talentMain.talentReturnFlag = false

			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
		end

		TitleText:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_INVENTORY
		end)
		heroInfoPanel:SetActive(false)
		PlayerInfoCtrl.OpenTab("bagTab")

		currentBtnIndex = PlayerInfoCtrl.Tab.Bag
		inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, 1)

		PlayerInfoCtrl.LoadQuickItem()
		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfoBag", "item1")
		PlayerInfoCtrl.LoadItem(currentItemType)
		itemTypeNavButtonGroup[currentItemTypeIndex]:SetNormal()
		itemTypeNavButtonGroup[currentItemTypeIndex]:SetHighlighted()
		PlayerInfoCtrl.SetBGAlpha(1)
		PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Bag)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Bag].newLight:SetActive(false)
		selectHeroList.parentGO:SetActive(false)
	end)

	navButtonGroup[PlayerInfoCtrl.Tab.Bag] = btn
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Bag] = btn
	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_RT_TabButton_Panel_TaskBtn")
	btn.newLight = btn.gameObject.transform:Find("outlineLight").gameObject

	btn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			talentMain.talentReturnFlag = false

			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
		end

		TitleText:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_TASK
		end)
		heroInfoPanel:SetActive(false)
		PlayerInfoCtrl.OpenTab("taskTab")

		currentBtnIndex = PlayerInfoCtrl.Tab.Task

		PlayerInfoCtrl.ExitEditQuickSlot()

		itemDetail.isInEquipmentState = false

		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfoTask", "MainTabBtn")

		task.CurrentType = MS_UIQuest.QuestType.BranchTitle
		task.currentQuestId = 0

		UILayerCtrl.OnCursorClickMute()
		PlayerInfoCtrl.SetBGAlpha(1)
		PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Task)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Task].newLight:SetActive(false)
		selectHeroList.parentGO:SetActive(false)
	end)

	navButtonGroup[PlayerInfoCtrl.Tab.Task] = btn
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Task] = btn
	btn = this.mainComponent:GetButton("PlayerInfoPanel_TabButton_RT_TalentBtn_RT")
	btn.newLight = btn.gameObject.transform:Find("outlineLight").gameObject

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		TitleText:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_TALENT
		end)
	end

	if AppVer == AppDemoCJReview then
		btn.gameObject:SetActive(false)
	else
		btn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local layerName = UILayerCtrl.GetCurrentLayerName()

			if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
				talentMain.talentReturnFlag = false

				UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
			end

			TitleText:SetGameTextContent(function()
				return GameText.UI_PLAYERINFO_TALENT
			end)
			heroInfoPanel:SetActive(false)
			PlayerInfoCtrl.OpenTab("talentTab")

			currentBtnIndex = PlayerInfoCtrl.Tab.Talent

			PlayerInfoCtrl.ExitEditQuickSlot()

			itemDetail.isInEquipmentState = false

			PlayerInfoCtrl.SetBGAlpha(1)

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossChallenge) then
				PlayerInfoCtrl.ReloadTalent(sceneController:GetHostPlayerHeroId())
			else
				PlayerInfoCtrl.ReloadTalent(FS_UserData.story:GetUIHeroId(currentHeroIndex))
			end

			UILayerCtrl.Pop()
			UILayerCtrl.Push("PlayerInfoTalent", "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn")
			PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Talent)
			menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Talent].newLight:SetActive(false)

			if selectHeroList.loadCount < 2 then
				selectHeroList.parentGO:SetActive(false)
			else
				selectHeroList.parentGO:SetActive(true)
				PlayerInfoCtrl.RefreshHeroNewLight()
			end
		end)

		navButtonGroup[PlayerInfoCtrl.Tab.Talent] = btn
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Talent] = btn
	end

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_RT_TabButton_BootyfBtn")
	btn.newLight = btn.gameObject.transform:Find("outlineLight").gameObject

	if AppVer == AppDemoCJReview then
		btn.gameObject:SetActive(false)
	else
		btn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local layerName = UILayerCtrl.GetCurrentLayerName()

			if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
				talentMain.talentReturnFlag = false

				UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
			end

			TitleText:SetGameTextContent(function()
				return GameText.UI_PLAYERINFO_TROPHY
			end)
			heroInfoPanel:SetActive(false)
			PlayerInfoCtrl.OpenTab("bootyTab")

			currentBtnIndex = PlayerInfoCtrl.Tab.Trophy

			PlayerInfoCtrl.ExitEditQuickSlot()

			itemDetail.isInEquipmentState = false

			UILayerCtrl.Pop()
			UILayerCtrl.Push("PlayerInfoBooty", "Trophy_1")

			booty.SelectedSlot = 1
			booty.defaultBtnName = "Trophy_1"
			itemDetail.isInEquipmentState = false

			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_Close")
			PlayerInfoCtrl.SetBGAlpha(1)
			menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Trophy].newLight:SetActive(false)
			PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Trophy)
			selectHeroList.parentGO:SetActive(false)
			PlayerInfoCtrl.RefreshTrophyNewLight()
			booty.AttackSlot1:SetCommonHighlighted(true)
			PlayerInfoCtrl.SetTrophyDescription(booty.SlotList[booty.SelectedSlot].item)
			PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyScars)
		end)

		navButtonGroup[PlayerInfoCtrl.Tab.Trophy] = btn
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Trophy] = btn
	end

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_RT_TabButton_Panel_AlchemyBtn")
	btn.newLight = btn.gameObject.transform:Find("outlineLight").gameObject

	btn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			talentMain.talentReturnFlag = false

			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
		end

		TitleText:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_ALCHEMY
		end)
		heroInfoPanel:SetActive(false)
		PlayerInfoCtrl.OpenTab("alchemyTab")

		currentBtnIndex = PlayerInfoCtrl.Tab.Alchemy

		PlayerInfoCtrl.ExitEditQuickSlot()

		itemDetail.isInEquipmentState = false

		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfoAlchemy", "RestTabBtn")
		UILayerCtrl.OnCursorClickMute()
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)
		PlayerInfoCtrl.SetBGAlpha(0)

		if alchemy.isAllow then
			PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Alchemy)
			PlayerInfoCtrl.RefreshAlchemyNewLight()
		end

		selectHeroList.parentGO:SetActive(false)
	end)

	navButtonGroup[PlayerInfoCtrl.Tab.Alchemy] = btn
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Alchemy] = btn
	property.skillBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_SKILL")

	property.skillBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.CreateCtrl("SkillView")

		if sceneController ~= nil then
			UIManager.SendMessage("SkillView", "OpenInGame", FS_UserData.story:GetUIHeroId(currentHeroIndex))
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoProperty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_SKILL", property.skillBtn)

	property.heroPortraitJoycon = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_Panel2_heroPortraitJoycon")
	property.heroExchangeBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_Panel2_Button")

	property.heroExchangeBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and isEditor then
			PlayerInfoCtrl.ChangeSkin()
		else
			currentHeroIndex = currentHeroIndex % selectHeroList.loadCount + 1

			local button = selectHeroList.HeroBtnGroup[FS_UserData.story:GetUIHeroId(currentHeroIndex)]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	end)
	property.heroExchangeBtn:SetAudioType(AudioCtrl.ButtonClickType.None)

	property.HeroIndexMap = {}
	selectHeroList = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_LT_HeroList")
	selectHeroList.parentGO = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_LT_HeroBar")

	selectHeroList:SetCacheNumMax(1, 4)

	selectHeroList.HeroBtnGroup = {}
	selectHeroList.loadCount = FS_UserData.story:GetUIHeroNum()

	function selectHeroList.loadCallback(index, com, data)
		local heroBtn = com:GetButton("heroBtn")
		local heroFrame = com:GetGameObject("heroBtn_Herobg")

		heroBtn.newLight = com:GetGameObject("heroBtn_outlineLight")
		heroBtn.icon = XImage:new(heroBtn.gameObject)
		heroBtn.frame = XImage:new(heroFrame)

		local hostHeroId = FS_UserData.story:GetUIHeroId(index)
		local sprite = XObjectPool.GetIcon("photo" .. BattleData.ConvertHeroIdWithSkin(hostHeroId))

		heroBtn.icon:SetSprite(sprite)
		heroBtn.icon:SetGray(true)
		heroBtn.frame:SetGray(true)
		heroBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for k, v in pairs(selectHeroList.HeroBtnGroup) do
				v.icon:SetGray(true)
				v.frame:SetGray(true)
			end

			heroBtn.icon:SetGray(false)
			heroBtn.frame:SetGray(false)

			currentHeroIndex = index

			PlayerInfoCtrl.ReLoad(FS_UserData.story:GetUIHeroId(index))
		end)

		property.HeroIndexMap[hostHeroId] = index
		selectHeroList.HeroBtnGroup[hostHeroId] = heroBtn

		if sceneController:GetHostPlayerHeroId() == hostHeroId then
			heroBtn.icon:SetGray(false)
			heroBtn.frame:SetGray(false)

			currentHeroIndex = index
			activeHeroIndex = index

			PlayerInfoCtrl.ReLoad(FS_UserData.story:GetUIHeroId(index))
		end

		if index == selectHeroList.loadCount then
			selectHeroList.parentGO:GetComponent("RectTransform").sizeDelta = Vector2.New(83.5 * index + -4 * (index - 1), 86)
			selectHeroList.LoadFinish = true

			PlayerInfoCtrl.RefreshHeroNewLight(currentLayer == "PlayerInfoProperty")

			if data then
				data.CB()
			end
		end

		if AppVer == AppDemoCJReview and tonumber(hostHeroId) == 10002 then
			heroBtn.gameObject.transform.parent.gameObject:SetActive(false)
		end
	end

	if AppVer == AppDemoCJReview then
		local jsIconL = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_LT_HeroBar_lt")

		if jsIconL then
			jsIconL:SetActive(false)
		end

		local jsIconR = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_LT_HeroBar_rt")

		if jsIconR then
			jsIconR:SetActive(false)
		end
	end

	talentMain = {}
	talentDetailPointList = {}
	talentDetail = {}
	talentMain.talentReturnFlag = true
	talentMain.circle = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_Circle")
	talentMain.twn = Tween:new(talentMain.circle.transform)

	talentMain.twn:Easing(Easing.CustomQuartic.easeInOut)
	talentMain.twn:SetMoveToEnd(true)

	talentMain.canOpenTalentDetail = false
	talentMain.canEditTalent = false
	talentMain.cursor = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_Circle_part1_Cursor")
	talentMain.talentSelectedLight = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_Circle_part1_Cursor_talentSelectedLight")
	talentMain.talentCursorNormal = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_Circle_part1_Cursor_normal")
	talentMain.EscapeSqrRadius = 6400
	talentMain.SpotSqrRadius = 400
	talentMain.part1 = this.mainComponent:GetGameObject("talent_part1")
	talentMain.part2 = this.mainComponent:GetGameObject("talent_part2")
	talentMain.part3 = this.mainComponent:GetGameObject("talent_part3")
	talentMain.part4 = this.mainComponent:GetGameObject("talent_part4")
	talentMain.oriVec2 = Vector2.New(0, 0)
	talentMain.nowVec2 = Vector2.New(0, 0)
	talentMain.nearestTalentVec = Vector2.New(0, 0)
	talentMain.moveVec2 = Vector2.New(0, 0)
	talentMain.tStuckInVec2 = Vector2.New(0, 0)
	talentDetail.needItemText = ""
	talentMain.selectPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG")
	talentMain.detailPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG")
	talentMain.detailPanelTF = talentMain.detailPanel.transform
	talentMain.talentDescription = this.mainComponent:GetText("TalentDescription")
	talentMain.talentDescription.childText = this.mainComponent:GetText("TalentDescriptionText")
	screenRect = {}
	screenRect.go = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B")
	screenRect.rect = screenRect.go:GetComponent("RectTransform")
	screenRect.h = screenRect.go:GetComponent("RectTransform").rect.height
	screenRect.w = screenRect.go:GetComponent("RectTransform").rect.width
	talentDetail.talentDetailPanel = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_TalentdetailPanel")
	talentMain.lowTalentStoneNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Lowpoint_num")
	talentMain.midTalentStoneNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Midpoint_num")
	talentMain.highTalentStoneNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Highpoint_num")
	talentMain.veryHighTalentStoneNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_StoneGroup_VeryHighpoint_num")
	talentMain.highTalentStoneIconGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_StoneGroup_Highpoint")
	talentMain.jeroldStoneIconGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_StoneGroup_Jeroldpoint")
	talentMain.jeroldStoneNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_StoneGroup_Jeroldpoint_num")

	talentDetail.talentDetailPanel:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)

	talentDetail.ArcadeTalentType4Text = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn_Text")
	talentDetail.needAltarTips = this.mainComponent:GetGameObject("PlayerInfoPanel_TalentdetailPanel_B_Frame_tips")
	talentDetail.Title = this.mainComponent:GetText("PlayerInfoPanel_TalentdetailPanel_B_Frame_Title")
	talentDetail.Des = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_TalentdetailPanel_B_Frame_Content_Des")
	talentDetail.NextDes = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_TalentdetailPanel_B_Frame_Content_NextDes")
	talentDetail.ContentGroupRTF = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_TalentdetailPanel_B_Frame_Content"):GetComponent("RectTransform")
	talentDetail.contentLine = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_TalentdetailPanel_B_Frame_Content_LineOffset")
	talentDetail.NumText = this.mainComponent:GetText("PlayerInfoPanel_TalentdetailPanel_B_Frame_Level_num")
	talentDetail.ConfirmBtn = this.mainComponent:GetButton("PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")

	UILayerCtrl.AddButton("PlayerInfoTalent1", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn", talentDetail.ConfirmBtn)
	UILayerCtrl.AddButton("PlayerInfoTalent2", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn", talentDetail.ConfirmBtn)
	UILayerCtrl.AddButton("PlayerInfoTalent3", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn", talentDetail.ConfirmBtn)
	UILayerCtrl.AddButton("PlayerInfoTalent4", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn", talentDetail.ConfirmBtn)
	table.insert(property.EditorGroup, talentDetail.ConfirmBtn)

	talentDetail.Icon = this.mainComponent:GetGameObject("PlayerInfoPanel_TalentdetailPanel_B_Frame_row_talentPoint")
	talentDetail.fullLight = talentDetail.Icon.transform:Find("fullLight").gameObject
	talentDetail.IconMask = talentDetail.Icon.transform:Find("mask").gameObject
	talentDetail.AddLight = talentDetail.Icon.transform:Find("addLight").gameObject
	talentDetail.fullLightImg = XImage:new(talentDetail.fullLight)
	talentDetail.Icon = XImage:new(talentDetail.Icon)

	for i = 1, 5 do
		local detailPoint = {}

		detailPoint.gameObject = this.mainComponent:GetGameObject("detailPoint" .. i)
		detailPoint.bgLow = detailPoint.gameObject.transform:Find("BG"):Find("lowBG").gameObject
		detailPoint.bgMid = detailPoint.gameObject.transform:Find("BG"):Find("midBG").gameObject
		detailPoint.bgHigh = detailPoint.gameObject.transform:Find("BG"):Find("highBG").gameObject
		detailPoint.bgVeryHigh = detailPoint.gameObject.transform:Find("BG"):Find("veryhighBG").gameObject
		detailPoint.bgJerold = detailPoint.gameObject.transform:Find("BG"):Find("jeroldBG").gameObject
		detailPoint.stoneLight = this.mainComponent:GetGameObject("stoneLight" .. i)
		detailPoint.stoneButtonLow = this.mainComponent:GetButton("lowStone" .. i)
		detailPoint.stoneButtonMid = this.mainComponent:GetButton("midStone" .. i)
		detailPoint.stoneButtonHigh = this.mainComponent:GetButton("highStone" .. i)
		detailPoint.stoneButtonVeryHigh = this.mainComponent:GetButton("veryhighStone" .. i)
		detailPoint.stoneButtonJerold = this.mainComponent:GetButton("jeroldStone" .. i)
		detailPoint.type = PlayerInfoCtrl.talentStoneType.Low

		function detailPoint.SetType(type)
			detailPoint.type = type

			if type == PlayerInfoCtrl.talentStoneType.Low then
				detailPoint.bgLow:SetActive(true)
				detailPoint.bgMid:SetActive(false)
				detailPoint.bgHigh:SetActive(false)
				detailPoint.bgVeryHigh:SetActive(false)
				detailPoint.bgJerold:SetActive(false)
				detailPoint.stoneButtonMid.gameObject:SetActive(false)
				detailPoint.stoneButtonHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonVeryHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonJerold.gameObject:SetActive(false)

				detailPoint.stoneBtn = detailPoint.stoneButtonLow
				detailPoint.stoneImg = XImage:new(detailPoint.stoneBtn.gameObject)
			elseif type == PlayerInfoCtrl.talentStoneType.Mid then
				detailPoint.bgLow:SetActive(false)
				detailPoint.bgMid:SetActive(true)
				detailPoint.bgHigh:SetActive(false)
				detailPoint.bgVeryHigh:SetActive(false)
				detailPoint.bgJerold:SetActive(false)
				detailPoint.stoneButtonLow.gameObject:SetActive(false)
				detailPoint.stoneButtonHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonVeryHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonJerold.gameObject:SetActive(false)

				detailPoint.stoneBtn = detailPoint.stoneButtonMid
				detailPoint.stoneImg = XImage:new(detailPoint.stoneBtn.gameObject)
			elseif type == PlayerInfoCtrl.talentStoneType.High then
				detailPoint.bgLow:SetActive(false)
				detailPoint.bgMid:SetActive(false)
				detailPoint.bgHigh:SetActive(true)
				detailPoint.bgVeryHigh:SetActive(false)
				detailPoint.bgJerold:SetActive(false)
				detailPoint.stoneButtonLow.gameObject:SetActive(false)
				detailPoint.stoneButtonMid.gameObject:SetActive(false)
				detailPoint.stoneButtonVeryHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonJerold.gameObject:SetActive(false)

				detailPoint.stoneBtn = detailPoint.stoneButtonHigh
				detailPoint.stoneImg = XImage:new(detailPoint.stoneBtn.gameObject)
			elseif type == PlayerInfoCtrl.talentStoneType.VeryHigh then
				detailPoint.bgLow:SetActive(false)
				detailPoint.bgMid:SetActive(false)
				detailPoint.bgHigh:SetActive(false)
				detailPoint.bgVeryHigh:SetActive(true)
				detailPoint.bgJerold:SetActive(false)
				detailPoint.stoneButtonLow.gameObject:SetActive(false)
				detailPoint.stoneButtonMid.gameObject:SetActive(false)
				detailPoint.stoneButtonHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonJerold.gameObject:SetActive(false)

				detailPoint.stoneBtn = detailPoint.stoneButtonVeryHigh
				detailPoint.stoneImg = XImage:new(detailPoint.stoneBtn.gameObject)
			elseif type == PlayerInfoCtrl.talentStoneType.Jerold then
				detailPoint.bgLow:SetActive(false)
				detailPoint.bgMid:SetActive(false)
				detailPoint.bgHigh:SetActive(false)
				detailPoint.bgVeryHigh:SetActive(false)
				detailPoint.bgJerold:SetActive(true)
				detailPoint.stoneButtonLow.gameObject:SetActive(false)
				detailPoint.stoneButtonMid.gameObject:SetActive(false)
				detailPoint.stoneButtonHigh.gameObject:SetActive(false)
				detailPoint.stoneButtonVeryHigh.gameObject:SetActive(false)

				detailPoint.stoneBtn = detailPoint.stoneButtonJerold
				detailPoint.stoneImg = XImage:new(detailPoint.stoneBtn.gameObject)
			end
		end

		detailPoint.addBtn = this.mainComponent:GetButton("detailTalentAddBtn" .. i)
		detailPoint.canAddLight = detailPoint.addBtn.gameObject.transform:Find("Light").gameObject
		detailPoint.canNotAddLight = detailPoint.addBtn.gameObject.transform:Find("Red").gameObject
		detailPoint.goldlineGO = detailPoint.gameObject.transform:Find("line"):Find("gold").gameObject
		detailPoint.whitelineGO = detailPoint.gameObject.transform:Find("line"):Find("white").gameObject
		detailPoint.addLightGO = detailPoint.gameObject.transform:Find("addLight").gameObject
		detailPoint.greenLightGO = detailPoint.gameObject.transform:Find("greenLight").gameObject
		detailPoint.desBtn = this.mainComponent:GetButton("detailTalentDesBtn" .. i)
		detailPoint.desBtnLight = detailPoint.desBtn.gameObject.transform:Find("Light").gameObject

		detailPoint.desBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			PlayerInfoCtrl.SetTalentInfo(i, true)
		end)
		table.insert(talentDetailPointList, detailPoint)
	end

	local subBtn

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_propBtn")
	subBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_selectBG_propBtn_Text_Area")

	subBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	subBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_specialBtn")
		UILayerCtrl.OnCursorClick()
	end)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ChangeCircleState(PlayerInfoCtrl.talentType.Alchemy, function()
			PlayerInfoCtrl.SetAllTalentNumTextActive(true)
		end)
		PlayerInfoCtrl.SelectTalentTab(false)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_propBtn")
		PlayerInfoCtrl.SetTalentStone(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[1]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[2]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[3]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[4]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[5]))
		selectHeroList.parentGO:SetActive(false)
		PlayerInfoCtrl.InitCursorPos(4)
		UILayerCtrl.Push("PlayerInfoTalent4", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")
	end)
	UILayerCtrl.AddButton("PlayerInfoTalent", "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_propBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn")
	btn:SetAdjacent(XButton.Adjacent.UP, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_specialBtn")

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn")
	subBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_selectBG_smartBtn_Text_Area")

	subBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	subBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn")
		UILayerCtrl.OnCursorClick()
	end)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ChangeCircleState(PlayerInfoCtrl.talentType.Attack, function()
			PlayerInfoCtrl.SetAllTalentNumTextActive(true)
		end)
		PlayerInfoCtrl.SelectTalentTab(false)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn")
		PlayerInfoCtrl.SetTalentStone(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[1]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[2]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[3]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[4]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[5]))
		selectHeroList.parentGO:SetActive(false)
		PlayerInfoCtrl.InitCursorPos(1)
		UILayerCtrl.Push("PlayerInfoTalent1", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")
	end)
	UILayerCtrl.AddButton("PlayerInfoTalent", "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.LEFT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_propBtn")
	btn:SetAdjacent(XButton.Adjacent.UP, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn")

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn")
	subBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_selectBG_stormBtn_Text_Area")

	subBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	subBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_propBtn")
		UILayerCtrl.OnCursorClick()
	end)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ChangeCircleState(PlayerInfoCtrl.talentType.Sanity, function()
			PlayerInfoCtrl.SetAllTalentNumTextActive(true)
		end)
		PlayerInfoCtrl.SelectTalentTab(false)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn")
		PlayerInfoCtrl.SetTalentStone(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[1]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[2]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[3]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[4]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[5]))
		selectHeroList.parentGO:SetActive(false)
		PlayerInfoCtrl.InitCursorPos(2)
		UILayerCtrl.Push("PlayerInfoTalent2", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")
	end)
	UILayerCtrl.AddButton("PlayerInfoTalent", "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.LEFT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_specialBtn")
	btn:SetAdjacent(XButton.Adjacent.DOWN, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_smartBtn")

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_specialBtn")
	subBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_selectBG_specialBtn_Text_Area")

	subBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	subBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn")
		UILayerCtrl.OnCursorClick()
	end)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ChangeCircleState(PlayerInfoCtrl.talentType.Special, function()
			PlayerInfoCtrl.SetAllTalentNumTextActive(true)
		end)
		PlayerInfoCtrl.SelectTalentTab(false)
		UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_specialBtn")
		PlayerInfoCtrl.SetTalentStone(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[1]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[2]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[3]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[4]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[5]))
		selectHeroList.parentGO:SetActive(false)
		PlayerInfoCtrl.InitCursorPos(3)
		UILayerCtrl.Push("PlayerInfoTalent3", "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")
	end)
	UILayerCtrl.AddButton("PlayerInfoTalent", "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_specialBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_stormBtn")
	btn:SetAdjacent(XButton.Adjacent.DOWN, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_BG_propBtn")

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_next")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local type = currentTalentType + 1

		if type > 4 then
			type = 1
		end

		PlayerInfoCtrl.SetAllTalentNumTextActive(false)
		PlayerInfoCtrl.ChangeCircleState(type, function()
			PlayerInfoCtrl.SetAllTalentNumTextActive(true)
		end)
		talentMain.talentDescription.gameObject:SetActive(false)
		PlayerInfoCtrl.InitCursorPos(type)
		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfoTalent" .. type, "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")
	end)

	for i = 1, 4 do
		UILayerCtrl.AddIndividual("PlayerInfoTalent" .. i, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_next", btn)
	end

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_prev")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local type = currentTalentType - 1

		if type < 1 then
			type = 4
		end

		PlayerInfoCtrl.SetAllTalentNumTextActive(false)
		PlayerInfoCtrl.ChangeCircleState(type, function()
			PlayerInfoCtrl.SetAllTalentNumTextActive(true)
		end)
		talentMain.talentDescription.gameObject:SetActive(false)
		PlayerInfoCtrl.InitCursorPos(type)
		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfoTalent" .. type, "PlayerInfoPanel_TalentdetailPanel_B_Frame_confirmBtn")
	end)

	for i = 1, 4 do
		UILayerCtrl.AddIndividual("PlayerInfoTalent" .. i, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_prev", btn)
	end

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ChangeCircleState(false, function()
			PlayerInfoCtrl.SelectTalentTab(true)
		end)
		talentMain.talentSelectedLight:SetActive(false)
		talentMain.talentCursorNormal:SetActive(false)
		talentMain.detailPanel:SetActive(false)
		gamePadIcon.prev_lb:SetActive(false)
		gamePadIcon.next_rb:SetActive(false)
		keyboardIcon.prev_lb:SetActive(false)
		keyboardIcon.next_rb:SetActive(false)
		gamePadIcon.add_r:SetActive(false)
		gamePadIcon.min_l:SetActive(false)
		PlayerInfoCtrl.SetAllTalentNumTextActive(false)
		UILayerCtrl.Pop()

		if selectHeroList.loadCount < 2 then
			selectHeroList.parentGO:SetActive(false)
		else
			selectHeroList.parentGO:SetActive(true)
		end

		talentMain.talentDescription.gameObject:SetActive(false)
	end)

	for i = 1, 4 do
		UILayerCtrl.AddIndividual("PlayerInfoTalent" .. i, "PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back", btn)
	end

	talentMain.logolist = {}

	for i = 1, 4 do
		local logo = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_logo_logo" .. i)

		table.insert(talentMain.logolist, logo)
	end

	for i = 1, 4 do
		local talentTypeImage = this.mainComponent:GetGameObject("talentType" .. i)

		talentTypeImage = XImage:new(talentTypeImage)

		local sprite = XObjectPool.GetIcon("talent11" .. i .. "00")

		talentTypeImage:SetSprite(sprite)
	end

	talentList = {}
	talentPosList = {}
	talentDataList = {}
	talentPosList.PlayerInfoTalent1 = {}
	talentPosList.PlayerInfoTalent2 = {}
	talentPosList.PlayerInfoTalent3 = {}
	talentPosList.PlayerInfoTalent4 = {}
	talentLineList = {}
	talentNumTextList = {}

	local pointText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_Circle_smart_talentBtn1_num_Text")

	pointText:SetContent("")

	pointText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_Circle_smart_TalentPoint1100_talentBtn_num")

	pointText:SetContent("")

	for i = 1, 4 do
		local partGO = talentMain["part" .. i]

		talentLineList[i] = PlayerInfoCtrl.InitTalentLine(partGO)

		for j = 1, 18 do
			local n = i * 100 + j
			local talentpoint = PlayerInfoCtrl.InitTalentPoint(i, partGO, j)

			talentList[n] = talentpoint

			talentpoint.go:SetActive(false)
		end
	end

	PlayerInfoCtrl.SetAllTalentNumTextActive(false)
	PlayerInfoCtrl.SetTalentStone(0, 0, 0, 0, 0)

	inventory = {}
	itemList = {}
	trophyList = {}
	quickList = nil
	inventory.quickSlotMarkList = {}
	inventory.bagScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_InventoryScroll")
	inventory.bagScroll = XScrollRect:new(inventory.bagScroll)

	local equipBackBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_QuickBag_BackBtn")

	equipBackBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)

	local equipBg = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_QuickBag_BG")

	itemDetail = {}
	itemDetail.Name = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemName")
	itemDetail.Img = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemFrame_itemImage")
	itemDetail.Img = XImage:new(itemDetail.Img)
	itemDetail.Des = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemDes")
	itemDetail.BounsText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemBouns")
	itemDetail.ItemInfoGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup")
	itemDetail.NoItemImage = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_NoitemImage")
	itemDetail.itemId = 0
	itemDetail.NumTextGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemNumGroup")
	itemDetail.NumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemNumGroup_itemNum")
	itemDetail.NumTextMax = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_itemNumGroup_itemNum_itemNumMax")
	itemDetail.contentHeight = 220
	itemDetail.oneLineHeight = 23
	itemDetail.lineOffset = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_ContentGroup_ViewPort_Content_LineOffset")
	itemDetail.contentGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_ContentGroup")
	itemDetail.triangleGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemInfoGroup_ContentGroup_triangleGroup")
	itemDetail.triangle = itemDetail.triangleGroup.transform:Find("triangle").gameObject
	itemDetail.contentGroupRT = itemDetail.contentGroup.transform:Find("Viewport"):Find("Content"):GetComponent("RectTransform")
	itemDetail.contentGroupScroll = XScrollRect:new(itemDetail.contentGroup)

	function itemDetail.GetPreferredHeightFunc()
		local totalLength = 0

		if itemDetail.lineOffset.activeSelf then
			totalLength = totalLength + itemDetail.oneLineHeight
		end

		if itemDetail.BounsText.gameObject.activeSelf then
			totalLength = totalLength + itemDetail.BounsText.textCom.preferredHeight
		end

		if itemDetail.Des.gameObject.activeSelf then
			totalLength = totalLength + itemDetail.Des.textCom.preferredHeight
		end

		return totalLength
	end

	itemDetail.UseBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_BtnArea_UseBtn")

	itemDetail.UseBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CANT_USE_IN_CARRIAGE)
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_PLAYERINFO_COMFIRM_USE .. itemDetail.Name:GetContent(), function()
				PlayerInfoCtrl.HandleUseItem(itemDetail.itemId)
			end, function()
				return
			end, false)
		end
	end)
	itemDetail.UseBtn:SetAdjacent(XButton.Adjacent.LEFT, "ItemEquipBtn")
	itemDetail.UseBtn:SetAdjacent(XButton.Adjacent.RIGHT, "ItemEquipBtn")
	UILayerCtrl.AddIndividual("PlayerInfoBag", "UseBtn", itemDetail.UseBtn)

	itemDetail.EquipBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_BtnArea_EquipBtn")

	itemDetail.EquipBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.EnterEquipItemState()
	end)
	itemDetail.EquipBtn:SetAdjacent(XButton.Adjacent.LEFT, "UseBtn")
	itemDetail.EquipBtn:SetAdjacent(XButton.Adjacent.RIGHT, "UseBtn")
	UILayerCtrl.AddButton("PlayerInfoBag", "ItemEquipBtn", itemDetail.EquipBtn)

	itemDetail.BackBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_BtnArea_BackBtn")

	itemDetail.BackBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if quickSlot.isEdit then
			PlayerInfoCtrl.ExitEditQuickSlot()
		end

		if itemDetail.isInEquipmentState then
			PlayerInfoCtrl.ExitEquipItemState()
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoBag", "ItemEquipBackBtn", itemDetail.BackBtn)

	quickSlot = {}
	quickSlot.gamePadBar = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_GamePadBar")
	quickSlot.EditBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_QuickBag_EditBtn")
	quickSlot.EditBtn.ani = quickSlot.EditBtn.gameObject:GetComponent("Animator")

	quickSlot.EditBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if quickSlot.isEdit then
			PlayerInfoCtrl.ExitEditQuickSlot()
		else
			quickSlot.isEdit = true

			quickSlot.EditBtn.ani:Play("Pressed", 0, 0)
			PlayerInfoCtrl.OnSelectQuickSLot(1)
			UILayerCtrl.OnCursorClickMute()
			quickSlot.gamePadBar:SetActive(false)
			itemDetail.EquipBtn.gameObject:SetActive(false)
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoBag", "EditBtn", quickSlot.EditBtn)

	quickSlot.PutInBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_BtnArea_PutInBtn")

	quickSlot.PutInBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	quickSlot.PutInBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if itemDetail.itemId ~= 0 then
			PlayerInfoCtrl.SetQuickList(quickSlot.quickIndex, itemDetail.itemId)
		end

		AudioCtrl.SetUIAudio("player_info/equip")

		if quickSlot.isEdit then
			PlayerInfoCtrl.ExitEditQuickSlot()
		end
	end)

	quickSlot.RemoveBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_PutInBtn_RemoveBtn")

	quickSlot.RemoveBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	quickSlot.RemoveBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.SetQuickList(quickSlot.quickIndex, 0)

		if inventory.quickSlotMarkList[quickSlot.quickIndex] ~= nil then
			inventory.quickSlotMarkList[quickSlot.quickIndex]:SetActive(false)
		end

		quickSlot.RemoveBtn.gameObject:SetActive(false)
		AudioCtrl.SetUIAudio("player_info/unwield")
	end)
	UILayerCtrl.AddIndividual("PlayerInfoBag", "RemoveBtn", quickSlot.RemoveBtn)
	UILayerCtrl.AddIndividual("PlayerInfoBag", "PutInBtn", quickSlot.PutInBtn)

	quickSlot.isEdit = false
	quickSlot.isSelectItem = false
	quickSlot.currentItemIndex = 1
	quickSlot.quickSlotList = {}
	quickSlot.quickIndex = 1

	for i = 1, 6 do
		local quickslotBG = this.mainComponent:GetGameObject("QuickSlotBG" .. i)

		quickslotBG = XImage:new(quickslotBG)

		local quickslot = this.mainComponent:GetButton("QuickSlot" .. i)
		local light = quickslot.gameObject.transform:Find("QuickSlot"):Find("sLight").gameObject
		local bgLight = quickslot.gameObject.transform:Find("bgLight").gameObject

		quickslot.light = light
		quickslot.bgLight = bgLight
		quickslot.equipLight = quickslot.gameObject.transform:Find("Light").gameObject
		quickslot.quickslotBG = quickslotBG

		quickslot.quickslotBG:SetGray(not quickSlot.isEdit)

		function quickslot:SetLightFunc(bool)
			self.light:SetActive(bool)
			self.bgLight:SetActive(bool)
		end

		UILayerCtrl.AddButton("PlayerInfoBag", "QuickSlot" .. i, quickslot)

		if i == 1 then
			quickslot:SetAdjacent(XButton.Adjacent.LEFT, "QuickSlot2")
			quickslot:SetAdjacent(XButton.Adjacent.DOWN, "QuickSlot2")
			quickslot:SetAdjacent(XButton.Adjacent.RIGHT, "QuickSlot6")
		elseif i == 2 then
			quickslot:SetAdjacent(XButton.Adjacent.UP, "QuickSlot1")
			quickslot:SetAdjacent(XButton.Adjacent.DOWN, "QuickSlot3")
			quickslot:SetAdjacent(XButton.Adjacent.RIGHT, "QuickSlot5")
		elseif i == 3 then
			quickslot:SetAdjacent(XButton.Adjacent.LEFT, "QuickSlot2")
			quickslot:SetAdjacent(XButton.Adjacent.UP, "QuickSlot2")
			quickslot:SetAdjacent(XButton.Adjacent.RIGHT, "QuickSlot4")
		elseif i == 4 then
			quickslot:SetAdjacent(XButton.Adjacent.LEFT, "QuickSlot3")
			quickslot:SetAdjacent(XButton.Adjacent.UP, "QuickSlot5")
			quickslot:SetAdjacent(XButton.Adjacent.RIGHT, "QuickSlot5")
		elseif i == 5 then
			quickslot:SetAdjacent(XButton.Adjacent.LEFT, "QuickSlot2")
			quickslot:SetAdjacent(XButton.Adjacent.DOWN, "QuickSlot4")
			quickslot:SetAdjacent(XButton.Adjacent.UP, "QuickSlot6")
		elseif i == 6 then
			quickslot:SetAdjacent(XButton.Adjacent.LEFT, "QuickSlot1")
			quickslot:SetAdjacent(XButton.Adjacent.DOWN, "QuickSlot5")
			quickslot:SetAdjacent(XButton.Adjacent.RIGHT, "QuickSlot5")
		end

		quickslot.imgGO = quickslot.transform:Find("QuickSlot"):Find("itemImg").gameObject
		quickslot.numText = quickslot.imgGO.transform:Find("Text"):GetComponent("Text")
		quickslot.img = XImage:new(quickslot.imgGO)
		quickslot.lockImgGO = quickslot.transform:Find("QuickSlot"):Find("lockimg").gameObject

		quickslot:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)
		quickslot:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			quickSlot.quickIndex = i
			quickSlot.isSelectItem = true

			if quickSlot.isEdit == false then
				quickSlot.EditBtn.ani:Play("Pressed", 0, 0)
			end

			quickSlot.isEdit = true

			quickSlot.gamePadBar:SetActive(false)

			currentItemType = MS_ItemData.MainType.Consume
			currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Consume

			inventory.itemTypeTitle:SetGameTextContent(function()
				return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Consume]
			end)
			PlayerInfoCtrl.LoadItem(currentItemType)
			quickSlot.RemoveBtn.gameObject:SetActive(quickList[quickSlot.quickIndex].itemId > 0)

			local button = itemTypeNavButtonGroup[1]

			button:SetNormal()
			button:SetHighlighted()

			for i = 1, 6 do
				quickSlot.quickSlotList[i]:SetLightFunc(false)
				quickSlot.quickSlotList[i].quickslotBG:SetGray(not quickSlot.isEdit)
			end

			quickslot:SetLightFunc(true)
		end)
		table.insert(quickSlot.quickSlotList, quickslot)
	end

	inventory.itemLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_InventoryScroll_ViewPort_Content")

	inventory.itemLoader:SetCacheNumMax(1, 60)
	PlayerInfoCtrl.LoadItem(MS_ItemData.MainType.Consume)

	inventory.itemTypeTitle = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_InventoryTitle")

	inventory.itemTypeTitle:SetGameTextContent(function()
		return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Consume]
	end)

	itemTypeNavButtonGroup = {}
	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ComsumeBtn")

	btn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		currentItemType = MS_ItemData.MainType.Consume
		currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Consume

		inventory.itemTypeTitle:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Consume]
		end)
		PlayerInfoCtrl.LoadItem(currentItemType)
	end)
	UILayerCtrl.AddButton("PlayerInfoBag", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ComsumeBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ExpBtn")

	itemTypeNavButtonGroup[PlayerInfoCtrl.ItemTab.Consume] = btn

	btn:SelectOnStart(true)

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ExpBtn")

	btn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		currentItemType = MS_ItemData.MainType.Exp
		currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Exp

		inventory.itemTypeTitle:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Exp]
		end)

		itemDetail.isInEquipmentState = false

		PlayerInfoCtrl.LoadItem(currentItemType)
		PlayerInfoCtrl.ExitEditQuickSlot()
	end)
	UILayerCtrl.AddButton("PlayerInfoBag", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ExpBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_LevelupBtn")
	btn:SetAdjacent(XButton.Adjacent.LEFT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ComsumeBtn")

	itemTypeNavButtonGroup[PlayerInfoCtrl.ItemTab.Exp] = btn
	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_LevelupBtn")

	btn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ExitEditQuickSlot()

		itemDetail.isInEquipmentState = false
		currentItemType = MS_ItemData.MainType.Trophy
		currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Trophy

		inventory.itemTypeTitle:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Trophy]
		end)
		PlayerInfoCtrl.LoadItem(currentItemType)
	end)
	UILayerCtrl.AddButton("PlayerInfoBag", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_LevelupBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_QuestBtn")
	btn:SetAdjacent(XButton.Adjacent.LEFT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_ExpBtn")

	itemTypeNavButtonGroup[PlayerInfoCtrl.ItemTab.Trophy] = btn

	if btn and AppVer == AppDemoCJReview then
		btn.gameObject:SetActive(false)
	end

	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_QuestBtn")

	btn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ExitEditQuickSlot()

		itemDetail.isInEquipmentState = false
		currentItemType = MS_ItemData.MainType.Quest
		currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Quest

		inventory.itemTypeTitle:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Quest]
		end)
		PlayerInfoCtrl.LoadItem(currentItemType)
	end)
	UILayerCtrl.AddButton("PlayerInfoBag", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_QuestBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.RIGHT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_AttackBtn")
	btn:SetAdjacent(XButton.Adjacent.LEFT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_LevelupBtn")

	itemTypeNavButtonGroup[PlayerInfoCtrl.ItemTab.Quest] = btn
	btn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_AttackBtn")

	btn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.ExitEditQuickSlot()

		itemDetail.isInEquipmentState = false
		currentItemType = MS_ItemData.MainType.Material
		currentItemTypeIndex = PlayerInfoCtrl.ItemTab.Material

		inventory.itemTypeTitle:SetGameTextContent(function()
			return GameText.UI_PLAYERINFO_ITEMTYPELIST[MS_ItemData.MainType.Material]
		end)
		PlayerInfoCtrl.LoadItem(currentItemType)
	end)
	UILayerCtrl.AddButton("PlayerInfoBag", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_AttackBtn", btn)
	btn:SetAdjacent(XButton.Adjacent.LEFT, "PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_QuestBtn")

	itemTypeNavButtonGroup[PlayerInfoCtrl.ItemTab.Material] = btn
	property.hpText = this.mainComponent:GetText("HPText")
	property.spText = this.mainComponent:GetText("SPText")
	property.mpText = this.mainComponent:GetText("MPText")
	property.hpBar = this.mainComponent:GetGameObject("HPBar"):GetComponent("RectTransform")
	property.hpWidth = this.mainComponent:GetGameObject("HPBar").transform.parent:GetComponent("RectTransform").rect.width - 10
	property.mpBar = this.mainComponent:GetGameObject("MPBar"):GetComponent("RectTransform")
	property.mpWidth = this.mainComponent:GetGameObject("MPBar").transform.parent:GetComponent("RectTransform").rect.width - 10
	property.spBar = this.mainComponent:GetGameObject("SPBar"):GetComponent("RectTransform")
	property.spWidth = this.mainComponent:GetGameObject("SPBar").transform.parent:GetComponent("RectTransform").rect.width - 10
	property.attributePointText = this.mainComponent:GetText("attributePoint")
	property.attributePointAnimationGO = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_Panel2_pointText_Power_A")
	property.mainLevelText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_HeroInfo_LevelText_LevelNumText")
	property.expBarSlider = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_HeroInfo_Panel_Panel1_altarGroup_ExpFrame_Slider"):GetComponent("Slider")
	property.expBarText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_HeroInfo_Panel_Panel1_altarGroup_ExpFrame_Text")
	property.attributeComfirmedValue = {}
	property.attributeValueList = {}
	property.YText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_Y_Text")
	property.YArea = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_Y_area")

	property.YArea:SetActive(false)

	property.dedicateBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_DedicateBtn")
	propertyList = {}
	attributeList = {}
	propertyDeltaList = {}

	for i = 1, MS_HeroData.PropertyMax do
		local valuetxt = this.mainComponent:GetText("property" .. i)

		if valuetxt then
			propertyList[i] = valuetxt
		end
	end

	for i = 1, MS_HeroData.PropertyMax do
		local valueDeltatxt = this.mainComponent:GetText("propertyDelta" .. i)

		if valueDeltatxt then
			propertyDeltaList[i] = valueDeltatxt
		end
	end

	for i = 1, 6 do
		local valuetxt = this.mainComponent:GetText("attribute" .. i)

		valuetxt.value = 0

		table.insert(property.attributeValueList, 0)
		table.insert(attributeList, valuetxt)
	end

	property.selectBtnList = {}

	for i = 1, 6 do
		local selectBtn = this.mainComponent:GetButton("SelectBtn" .. i)

		property.selectBtnList[i] = selectBtn

		UILayerCtrl.AddButton("PlayerInfoProperty", "selectBtn" .. i, selectBtn)

		if i > 1 then
			selectBtn:SetAdjacent(XButton.Adjacent.UP, "selectBtn" .. i - 1)
		else
			selectBtn:SetAdjacent(XButton.Adjacent.UP, "selectBtn6")
		end

		if i < 6 then
			selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "selectBtn" .. i + 1)
		else
			selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "selectBtn1")
		end
	end

	property.addBtnList = {}
	property.addBtnFuncList = {}

	for i = 1, 6 do
		local addbtn = this.mainComponent:GetButton("add" .. i)

		addbtn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)

		property.addBtnList[i] = addbtn
		property.addBtnFuncList[i] = function(obj, data)
			if property.attributePoint < 1 or attributeList[i].value == MS_HeroData.AttributeValueMax then
				addbtn:SetDisabled()

				return
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.ItemChoose)
			UILayerCtrl.OnSelect("selectBtn" .. i)

			attributeList[i].value = attributeList[i].value + 1
			property.attributeValueList[i] = attributeList[i].value

			attributeList[i]:SetContent(attributeList[i].value)
			attributeList[i]:SetColor(0.6823529411764706, 1, 0.5607843137254902, 1)

			property.attributePoint = property.attributePoint - 1

			property.attributePointText:SetContent(property.attributePoint)
			property.attributePointAnimationGO:SetActive(property.attributePoint > 0)
			property.minusBtnList[i]:SetNormal()
			property.PropertyConfirmBtn:SetNormal()

			if attributeList[i].value == MS_HeroData.AttributeValueMax then
				addbtn:SetDisabled()
			end

			if property.attributePoint == 0 then
				for k, v in pairs(property.addBtnList) do
					v:SetDisabled()
				end
			end

			local _propertyList = PlayerInfoCtrl.GetPropertyTemp(FS_UserData.story:GetUIHeroId(currentHeroIndex), property.attributeValueList)
			local oriList = PlayerInfoCtrl.GetPropertyList(FS_UserData.story:GetUIHeroId(currentHeroIndex))

			for i = 1, MS_HeroData.PropertyMax do
				if oriList[i] ~= nil then
					if _propertyList[i] ~= oriList[i] then
						PlayerInfoCtrl.SetPropertyDelta(i, _propertyList[i] - oriList[i])
					else
						PlayerInfoCtrl.SetPropertyDelta(i, 0)
					end
				end
			end
		end

		addbtn:SetLongPressCallBack(property.addBtnFuncList[i])
		UILayerCtrl.AddIndividual("PlayerInfoProperty", "add" .. i, addbtn)
		table.insert(property.AttributeBtnGroup, addbtn)
	end

	property.minusBtnList = {}
	property.minBtnFuncList = {}

	for i = 1, 6 do
		local minBtn = this.mainComponent:GetButton("minus" .. i)

		minBtn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)

		property.minBtnFuncList[i] = function(obj, data)
			if attributeList[i].value <= property.attributeComfirmedValue[i] then
				minBtn:SetDisabled()

				return
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.ItemChoose)
			UILayerCtrl.OnSelect("selectBtn" .. i)

			attributeList[i].value = attributeList[i].value - 1

			if attributeList[i].value <= property.attributeComfirmedValue[i] then
				attributeList[i]:SetColor(0.7568627450980392, 0.7098039215686275, 0.6705882352941176, 1)
				minBtn:SetDisabled()
			end

			property.attributeValueList[i] = attributeList[i].value

			attributeList[i]:SetContent(attributeList[i].value)

			property.attributePoint = property.attributePoint + 1

			property.attributePointText:SetContent(property.attributePoint)
			property.attributePointAnimationGO:SetActive(property.attributePoint > 0)

			for k, v in pairs(property.addBtnList) do
				if attributeList[k].value ~= MS_HeroData.AttributeValueMax then
					v:SetNormal()
				end
			end

			local _propertyList = PlayerInfoCtrl.GetPropertyTemp(FS_UserData.story:GetUIHeroId(currentHeroIndex), property.attributeValueList)
			local oriList = PlayerInfoCtrl.GetPropertyList(FS_UserData.story:GetUIHeroId(currentHeroIndex))
			local diff = false

			for i = 1, MS_HeroData.PropertyMax do
				if oriList[i] ~= nil then
					if _propertyList[i] ~= oriList[i] then
						diff = true

						PlayerInfoCtrl.SetPropertyDelta(i, _propertyList[i] - oriList[i])
					else
						PlayerInfoCtrl.SetPropertyDelta(i, 0)
					end
				end
			end

			if diff == false then
				property.PropertyConfirmBtn:SetDisabled()
			end
		end
		property.minusBtnList[i] = minBtn

		minBtn:SetLongPressCallBack(property.minBtnFuncList[i])
		UILayerCtrl.AddIndividual("PlayerInfoProperty", "minus" .. i, minBtn)
		table.insert(property.AttributeBtnGroup, minBtn)
	end

	local lvlupDetailPanelBtn = this.mainComponent:GetButton("PlayerInfoPanel_LevelupDedicationPanel")

	lvlupDetailPanelBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	lvlupDetailPanelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		property.levelupAnimator:Update(1.5)

		property.levelupAnimator.enabled = false

		lvlupDetailPanelBtn.gameObject:SetActive(false)
		UILayerCtrl.Pop()
		PlayerInfoCtrl.ReLoad(FS_UserData.story:GetUIHeroId(currentHeroIndex))
		XNetwork.RemoveListener(XProtocol.BattleProtocolToHero.RESP_HERO_LEV_EXP_UPDATED)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToHero.USE_HERO_EXP_ITEM)
	end)
	UILayerCtrl.AddIndividual("PlayerInfoLevelup", "PlayerInfoPanel_LevelupDedicationPanel", lvlupDetailPanelBtn)
	property.dedicateBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		lvlupDetailPanelBtn.gameObject:SetActive(true)
		XNetwork.AddListener(XProtocol.BattleProtocolToHero.USE_HERO_EXP_ITEM, PlayerInfoCtrl.OnHeroLevelExpUpdatedFailed)
		XNetwork.AddListener(XProtocol.BattleProtocolToHero.RESP_HERO_LEV_EXP_UPDATED, PlayerInfoCtrl.OnHeroLevelExpUpdated)

		if ReqLogin then
			property.ExpItemList = FS_UserData.itemList:GetItemListByType(MS_ItemData.MainType.Exp)
		else
			property.ExpItemList = PlayerInfoCtrl.GetItemListByType(MS_ItemData.MainType.Exp)
		end

		property.levelupSelectedItem.item = 0

		property.levelupSelectedItem.gameObject:SetActive(false)

		local heroData = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex))

		PlayerInfoCtrl.SetCurrentExpValue(heroData)
		PlayerInfoCtrl.RefreshProperty(FS_UserData.story:GetUIHeroId(currentHeroIndex))

		property.ExpItemExist = false
		property.ExpItemLoader.loadCount = #property.ExpItemList

		property.ExpItemLoader:Load()

		if property.ExpItemLoader.loadCount == 0 then
			UILayerCtrl.Push("PlayerInfoLevelup", nil)
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoProperty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_DedicateBtn", property.dedicateBtn)
	table.insert(property.EditorGroup, property.dedicateBtn)

	property.PropertyConfirmBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_ConfirmBtn")

	property.PropertyConfirmBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	property.PropertyConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local detalList = {}
		local changed = false

		for i = 1, 6 do
			detalList[i] = property.attributeValueList[i] - property.attributeComfirmedValue[i]

			if detalList[i] > 0 then
				changed = true
			end
		end

		if changed then
			PlayerInfoCtrl.AddHeroAttribute(FS_UserData.story:GetUIHeroId(currentHeroIndex), detalList)
			AudioCtrl.SetUIAudio("player_info/point_add")
		end
	end)
	UILayerCtrl.AddButton("PlayerInfoProperty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_ConfirmBtn", property.PropertyConfirmBtn)
	UILayerCtrl.AddIndividual("PlayerInfoProperty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_ConfirmBtn", property.PropertyConfirmBtn)
	property.PropertyConfirmBtn:SetAdjacent(XButton.Adjacent.UP, "selectBtn6")
	property.PropertyConfirmBtn:SetAdjacent(XButton.Adjacent.DOWN, "selectBtn1")
	table.insert(property.AttributeBtnGroup, property.PropertyConfirmBtn)

	property.levelText = this.mainComponent:GetText("PlayerInfoPanel_LevelupDedicationPanel_Panel_LevelText_level")
	property.emptyBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_emptyBtn")

	UILayerCtrl.AddButton("PlayerInfoProperty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_emptyBtn", property.emptyBtn)

	local dedicateDetailBtn = this.mainComponent:GetButton("PlayerInfoPanel_LevelupDedicationPanel_Panel_dedicate")

	dedicateDetailBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if property.levelupSelectedItem.item == 0 then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_EXPITEM)

			return
		else
			property.finalLevelLast = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex)).level
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoLevelup", "PlayerInfoPanel_LevelupDedicationPanel_Panel_dedicate", dedicateDetailBtn)

	property.expCircleImage = this.mainComponent:GetGameObject("PlayerInfoPanel_LevelupDedicationPanel_Panel_itemGridBG_Circle"):GetComponent("Image")
	property.expCircleTween = Tween:new(property.expCircleImage)
	property.expLightGo = this.mainComponent:GetGameObject("PlayerInfoPanel_LevelupDedicationPanel_Panel_itemGridBG_Circle_lightCircle")
	property.expLightTween = Tween:new(property.expLightGo.transform)
	property.expTotalText = this.mainComponent:GetText("PlayerInfoPanel_LevelupDedicationPanel_Panel_LevelText_totalExp")
	property.expCurrentText = this.mainComponent:GetText("PlayerInfoPanel_LevelupDedicationPanel_Panel_LevelText_currentExp")
	property.levelupSelectedItem = this.mainComponent:GetButton("PlayerInfoPanel_LevelupDedicationPanel_Panel_itemGridBG_item")
	property.levelupSelectedItem.item = 0
	property.levelupSelectedItem.img = XImage:new(property.levelupSelectedItem.gameObject)
	property.levelupAnimator = this.mainComponent:GetGameObject("PlayerInfoPanel_LevelupDedicationPanel_Panel_itemGridBG"):GetComponent("Animator")

	property.levelupSelectedItem:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		property.levelupSelectedItem.item = 0

		property.levelupSelectedItem.gameObject:SetActive(false)

		local heroData = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex))

		PlayerInfoCtrl.SetCurrentExpValue(heroData)
	end)

	property.ExpItemGroup = XGroup:new()

	property.ExpItemGroup:SetMode(XGroup.GroupMode.Button)

	property.ExpItemLoader = this.mainComponent:GetLoader("PlayerInfoPanel_LevelupDedicationPanel_Panel_Bottom")
	property.ExpItemExist = false
	property.ExpItemList = {}

	property.ExpItemLoader:SetCacheNumMax(1, 1)

	function property.ExpItemLoader.loadCallback(index, com, data)
		local itemImg = XImage:new(com:GetGameObject("Gird_itemImg"))
		local sprite = XObjectPool.GetIcon("item" .. property.ExpItemList[index].itemIcon)

		if sprite ~= nil then
			itemImg:SetSprite(sprite)
		end

		com.img = itemImg
		com.numText = com:GetText("Gird_itemImg_num")

		com.numText:SetContent(property.ExpItemList[index].itemNum)

		if property.ExpItemList[index].itemId == property.levelupSelectedItem.item then
			property.ExpItemExist = true
		end

		if index == property.ExpItemLoader.loadCount and property.ExpItemExist == false then
			property.levelupSelectedItem.item = 0

			property.levelupSelectedItem.gameObject:SetActive(false)

			local heroData = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex))

			PlayerInfoCtrl.SetCurrentExpValue(heroData)
		end

		local expBtn = com:GetButton("Gird")

		expBtn:SetSelectedLight(false)
		expBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if property.levelupSelectedItem.item ~= property.ExpItemList[index].itemId then
				property.levelupSelectedItem.item = property.ExpItemList[index].itemId

				property.levelupSelectedItem.gameObject:SetActive(true)

				if sprite ~= nil then
					property.levelupSelectedItem.img:SetSprite(sprite)
				end

				local heroData = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex))

				PlayerInfoCtrl.SetCurrentExpValue(heroData)
				expBtn:SetSelected(true)
				UILayerCtrl.OnSelect("exp" .. index)
			end
		end)
		property.ExpItemGroup:Add(expBtn)
		UILayerCtrl.AddButton("PlayerInfoLevelup", "exp" .. index, expBtn)

		if index == 1 then
			expBtn:SetAdjacent(XButton.Adjacent.LEFT, "exp" .. property.ExpItemLoader.loadCount)
		else
			expBtn:SetAdjacent(XButton.Adjacent.LEFT, "exp" .. index - 1)
		end

		if index == property.ExpItemLoader.loadCount then
			expBtn:SetAdjacent(XButton.Adjacent.RIGHT, "exp1")

			local layerName = UILayerCtrl.GetCurrentLayerName()

			if layerName == "PlayerInfoLevelup" then
				UILayerCtrl.OnSelect("exp1")
				UILayerCtrl.OnCursorClick()
			else
				UILayerCtrl.Push("PlayerInfoLevelup", "exp1")
				UILayerCtrl.OnCursorClick()
			end
		else
			expBtn:SetAdjacent(XButton.Adjacent.RIGHT, "exp" .. index + 1)
		end
	end

	property.heroInfo = {}
	property.heroInfo.heroIcon = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_HeroInfo_HeroFrame_HeroIcon")
	property.heroInfo.heroIcon = XImage:new(property.heroInfo.heroIcon)
	property.heroInfo.heroPortrait = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_Panel2_HeroPortrait")
	property.heroInfo.heroPortrait = XImage:new(property.heroInfo.heroPortrait)
	property.heroInfo.nameText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_HeroInfo_HeroNameImage")
	property.heroInfo.playerName = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_HeroInfo_PlayerName")
	property.heroInfo.sanityText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_HeroInfo_Panel_Panel_Text")
	property.sanityBar = {}
	property.sanityBar.go = this.mainComponent:GetGameObject("Main_Host_Sanity")

	local sanityGuage = this.mainComponent:GetGameObject("Main_Host_SanityGuage")
	local sanityGuageInner = this.mainComponent:GetGameObject("Main_Host_SanityIconWarning")

	property.sanityBar.gauge = XImage:new(sanityGuage)

	property.sanityBar.gauge:SetFillAmount(1)

	property.sanityBar.gaugeInner = XImage:new(sanityGuageInner)

	property.sanityBar.gaugeInner:SetFillAmount(1)

	property.sanityBar.showSt = {
		true,
		false,
		false,
		false,
		false,
		false
	}
	property.sanityBar.states = {
		this.mainComponent:GetGameObject("Main_Host_SanityIconNormal"),
		this.mainComponent:GetGameObject("Main_Host_SanityIconCaution"),
		this.mainComponent:GetGameObject("Main_Host_SanityIconWarning"),
		this.mainComponent:GetGameObject("Main_Host_SanityZero"),
		this.mainComponent:GetGameObject("Main_Host_SanityVfxWarning"),
		this.mainComponent:GetGameObject("Main_Host_SanityIconWarningBg")
	}
	property.sanityBar.StatusText = this.mainComponent:GetText("Sanity_Status_Text")
	property.sanityBar.NumText = this.mainComponent:GetText("Sanity_Num_Text")
	property.sanityBar.thresholds = {
		1,
		0.4,
		0.1,
		0
	}
	property.sanityBar.onState = {}
	property.sanityBar.variate = this.mainComponent:GetText("Main_Host_SanityVariateText")
	property.sanityBar.valueInt = 100

	local sanityDeltaTween = Tween:new(property.sanityBar.go)

	sanityDeltaTween:SetAutoKill(false)
	sanityDeltaTween:MoveTo({}, 1)
	sanityDeltaTween:OnStart(function()
		if property and property.sanityBar and property.sanityBar.variate then
			property.sanityBar.variate.gameObject:SetActive(false)
			property.sanityBar.variate.gameObject:SetActive(true)
		end
	end)
	sanityDeltaTween:OnComplete(function()
		if property and property.sanityBar and property.sanityBar.variate then
			property.sanityBar.variate.gameObject:SetActive(false)
		end
	end)

	property.sanityBar.deltaTween = sanityDeltaTween
	booty.totalPropertyPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_TotalProperty")
	booty.totalPropertyText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_TotalProperty_MainText")
	booty.totalPropertyText2 = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TotalProperty_MainText2")
	booty.totalPropertyNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TotalProperty_MainText_Num")
	booty.totalPropertyNumText2 = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TotalProperty_MainText2_Num")
	booty.itemSelectPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel")
	booty.itemLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_ItemList_ViewPort_Content")
	booty.itemLoaderRT = booty.itemLoader.gameObject:GetComponent("RectTransform")

	booty.itemLoader:SetCacheNumMax(1, 120)

	booty.itemLoader.loadCount = 14

	booty.itemLoader:Load()

	booty.isProcessingDelete = false
	booty.itemScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_ItemList")
	booty.itemScroll = XScrollRect:new(booty.itemScroll)
	booty.defaultBtnName = "Trophy_1"
	booty.loadFinish = true
	booty.classTitle = {}
	booty.classTitle[MS_ItemData.Type.TrophyScars] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_Three_Class_Danage")
	booty.classTitle[MS_ItemData.Type.TrophyResistance] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_Three_Class_Resist")
	booty.classTitle[MS_ItemData.Type.TrophyNightmare] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_Three_Class_Dream")
	booty.comList = {}
	booty.centerDescription = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_CenterGroup_des")
	booty.centerName = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_CenterGroup_name")
	booty.centerImage = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_CenterGroup_itemFrame_itemImage")
	booty.centerImage = XImage:new(booty.centerImage)
	booty.contentHeight = 140
	booty.oneLineHeight = 23
	booty.lineOffset = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_ContentGroup_viewport_Content_lineOffset")
	booty.contentGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_ContentGroup")
	booty.triangleGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_ContentGroup_triangleParent")
	booty.contentGroupRT = booty.contentGroup.transform:Find("viewport"):Find("Content"):GetComponent("RectTransform")
	booty.contentGroupScrollRT = booty.contentGroup:GetComponent("RectTransform")
	booty.contentGroupScroll = XScrollRect:new(booty.contentGroup)
	booty.trophyTypeIndex = 1
	booty.trophyTypeCountMax = 3
	booty.trophyTypeNavButton = {}
	booty.trophyNewLigntlist = {}
	booty.trophyNewLigntlist[MS_ItemData.Type.TrophyScars] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonAttack_outlineLight")
	booty.trophyNewLigntlist[MS_ItemData.Type.TrophyResistance] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonDefense_outlineLight")
	booty.trophyNewLigntlist[MS_ItemData.Type.TrophyNightmare] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonNormal_outlineLight")
	booty.currentTrophyListType = MS_ItemData.Type.TrophyScars
	booty.DanageTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_trophyTabGroup_DanageTabBtn")

	booty.DanageTabBtn:SelectOnStart(true)
	booty.DanageTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	booty.DanageTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local selectIndex

		selectIndex = FS_UserData.trophy:GetTrophy(1) == nil and 1 or FS_UserData.trophy:GetTrophy(2) == nil and 2 or 1
		booty.trophyTypeIndex = 1

		UILayerCtrl.OnSelect("Trophy_" .. selectIndex)

		booty.defaultBtnName = "Trophy_" .. selectIndex

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyScars)

		booty.SelectedSlot = selectIndex

		PlayerInfoCtrl.SetTrophyMask(selectIndex)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyScars)
	end)

	booty.trophyTypeNavButton[1] = booty.DanageTabBtn
	booty.ResistTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_trophyTabGroup_ResistTabBtn")

	booty.ResistTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	booty.ResistTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local selectIndex

		selectIndex = FS_UserData.trophy:GetTrophy(3) == nil and 3 or FS_UserData.trophy:GetTrophy(4) == nil and 4 or 3
		booty.trophyTypeIndex = 2

		UILayerCtrl.OnSelect("Trophy_" .. selectIndex)

		booty.defaultBtnName = "Trophy_" .. selectIndex

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyResistance)

		booty.SelectedSlot = selectIndex

		PlayerInfoCtrl.SetTrophyMask(selectIndex)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyResistance)
	end)

	booty.trophyTypeNavButton[2] = booty.ResistTabBtn
	booty.DreamTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_trophyTabGroup_DreamTabBtn")

	booty.DreamTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	booty.DreamTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local selectIndex

		selectIndex = FS_UserData.trophy:GetTrophy(5) == nil and 5 or FS_UserData.trophy:GetTrophy(6) == nil and 6 or 5
		booty.trophyTypeIndex = 3

		UILayerCtrl.OnSelect("Trophy_" .. selectIndex)

		booty.defaultBtnName = "Trophy_" .. selectIndex

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyNightmare)

		booty.SelectedSlot = selectIndex

		PlayerInfoCtrl.SetTrophyMask(selectIndex)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyNightmare)
	end)

	booty.trophyTypeNavButton[3] = booty.DreamTabBtn
	booty.itemSelectPanelImage = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_itemFrame_itemImage")
	booty.itemSelectPanelImage = XImage:new(booty.itemSelectPanelImage)
	booty.itemSelectPanelItemName = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_itemName")
	booty.itemSelectPanelItemDes = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_itemDes")
	booty.itemSelectPanelItemIntroduce = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_Introduce")

	function booty.GetPreferredHeightFunc()
		return booty.itemSelectPanelItemDes.textCom.preferredHeight + booty.itemSelectPanelItemIntroduce.textCom.preferredHeight + booty.oneLineHeight
	end

	booty.itemSelectPanelCloseBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_Close")

	booty.itemSelectPanelCloseBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	booty.itemSelectPanelCloseBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.RefreshTrophyBonus()
		PlayerInfoCtrl.OpenTrophyItemPanel(false)
		PlayerInfoCtrl.SetTrophyMask(0)
		UILayerCtrl.OnSelect(booty.defaultBtnName)

		booty.SelectedItem = nil

		PlayerInfoCtrl.SetTrophyDescription(booty.SlotList[booty.SelectedSlot].item)

		if booty.SelectedSlot == 1 or booty.SelectedSlot == 2 then
			PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyScars)
		elseif booty.SelectedSlot == 3 or booty.SelectedSlot == 4 then
			PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyResistance)
		elseif booty.SelectedSlot == 5 or booty.SelectedSlot == 6 then
			PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyNightmare)
		end
	end)

	booty.totalPropertyPanelLineGroup = {}

	for i = 1, 8 do
		local bootyline = this.mainComponent:GetGameObject("booty_line" .. i)

		booty.totalPropertyPanelLineGroup[i] = bootyline
	end

	booty.SlotList = {}

	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_Close", booty.itemSelectPanelCloseBtn)

	booty.AttackSlot1 = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonAttack_AttackFrame_AttackSlot1")
	booty.AttackSlot1.image = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonAttack_AttackFrame_AttackSlot1_ItemGroup_Image")
	booty.AttackSlot1.image = XImage:new(booty.AttackSlot1.image)

	booty.AttackSlot1:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

	booty.AttackSlot1.pos = 1

	booty.AttackSlot1:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not booty.loadFinish then
			return
		end

		booty.DanageTabBtn:SetHighlighted()

		booty.trophyTypeIndex = 1

		UILayerCtrl.OnSelect("Trophy_1")

		booty.defaultBtnName = "Trophy_1"

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyScars)
		PlayerInfoCtrl.OpenTrophyItemPanel(true)

		booty.SelectedSlot = 1

		PlayerInfoCtrl.OnSelectTrophyItem()
		PlayerInfoCtrl.SetTrophyMask(1)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyScars)
		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)
	table.insert(booty.SlotList, booty.AttackSlot1)

	booty.AttackSlot2 = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonAttack_AttackFrame_AttackSlot2")
	booty.AttackSlot2.image = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonAttack_AttackFrame_AttackSlot2_ItemGroup_Image")
	booty.AttackSlot2.image = XImage:new(booty.AttackSlot2.image)

	booty.AttackSlot2:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

	booty.AttackSlot2.pos = 2

	booty.AttackSlot2:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not booty.loadFinish then
			return
		end

		booty.DanageTabBtn:SetHighlighted()

		booty.trophyTypeIndex = 1

		UILayerCtrl.OnSelect("Trophy_2")

		booty.defaultBtnName = "Trophy_2"

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyScars)
		PlayerInfoCtrl.OpenTrophyItemPanel(true)

		booty.SelectedSlot = 2

		PlayerInfoCtrl.OnSelectTrophyItem()
		PlayerInfoCtrl.SetTrophyMask(2)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyScars)
		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)
	table.insert(booty.SlotList, booty.AttackSlot2)

	booty.DefenseSlot1 = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonDefense_DefenseFrame_DefenseSlot1")
	booty.DefenseSlot1.image = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonDefense_DefenseFrame_DefenseSlot1_ItemGroup_Image")
	booty.DefenseSlot1.image = XImage:new(booty.DefenseSlot1.image)

	booty.DefenseSlot1:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

	booty.DefenseSlot1.pos = 3

	booty.DefenseSlot1:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not booty.loadFinish then
			return
		end

		booty.ResistTabBtn:SetHighlighted()

		booty.trophyTypeIndex = 2

		UILayerCtrl.OnSelect("Trophy_3")

		booty.defaultBtnName = "Trophy_3"

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyResistance)
		PlayerInfoCtrl.OpenTrophyItemPanel(true)

		booty.SelectedSlot = 3

		PlayerInfoCtrl.OnSelectTrophyItem()
		PlayerInfoCtrl.SetTrophyMask(3)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyResistance)
		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)
	table.insert(booty.SlotList, booty.DefenseSlot1)

	booty.DefenseSlot2 = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonDefense_DefenseFrame_DefenseSlot2")
	booty.DefenseSlot2.image = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonDefense_DefenseFrame_DefenseSlot2_ItemGroup_Image")
	booty.DefenseSlot2.image = XImage:new(booty.DefenseSlot2.image)

	booty.DefenseSlot2:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

	booty.DefenseSlot2.pos = 4

	booty.DefenseSlot2:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not booty.loadFinish then
			return
		end

		booty.ResistTabBtn:SetHighlighted()

		booty.trophyTypeIndex = 2

		UILayerCtrl.OnSelect("Trophy_4")

		booty.defaultBtnName = "Trophy_4"

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyResistance)
		PlayerInfoCtrl.OpenTrophyItemPanel(true)

		booty.SelectedSlot = 4

		PlayerInfoCtrl.OnSelectTrophyItem()
		PlayerInfoCtrl.SetTrophyMask(4)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyResistance)
		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)
	table.insert(booty.SlotList, booty.DefenseSlot2)

	booty.NormalSlot1 = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonNormal_NormalFrame_NormalSlot1")
	booty.NormalSlot1.image = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonNormal_NormalFrame_NormalSlot1_ItemGroup_Image")
	booty.NormalSlot1.image = XImage:new(booty.NormalSlot1.image)

	booty.NormalSlot1:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

	booty.NormalSlot1.pos = 5

	booty.NormalSlot1:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not booty.loadFinish then
			return
		end

		booty.DreamTabBtn:SetHighlighted()

		booty.trophyTypeIndex = 3

		UILayerCtrl.OnSelect("Trophy_5")

		booty.defaultBtnName = "Trophy_5"

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyNightmare)
		PlayerInfoCtrl.OpenTrophyItemPanel(true)

		booty.SelectedSlot = 5

		PlayerInfoCtrl.OnSelectTrophyItem()
		PlayerInfoCtrl.SetTrophyMask(5)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyNightmare)
		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)
	table.insert(booty.SlotList, booty.NormalSlot1)

	booty.NormalSlot2 = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonNormal_NormalFrame_NormalSlot2")
	booty.NormalSlot2.image = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PanelC_ButtonNormal_NormalFrame_NormalSlot2_ItemGroup_Image")
	booty.NormalSlot2.image = XImage:new(booty.NormalSlot2.image)

	booty.NormalSlot2:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

	booty.NormalSlot2.pos = 6

	booty.NormalSlot2:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not booty.loadFinish then
			return
		end

		booty.DreamTabBtn:SetHighlighted()

		booty.trophyTypeIndex = 3

		UILayerCtrl.OnSelect("Trophy_6")

		booty.defaultBtnName = "Trophy_6"

		PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyNightmare)
		PlayerInfoCtrl.OpenTrophyItemPanel(true)

		booty.SelectedSlot = 6

		PlayerInfoCtrl.OnSelectTrophyItem()
		PlayerInfoCtrl.SetTrophyMask(6)
		PlayerInfoCtrl.RefreshTrophyItemList(MS_ItemData.Type.TrophyNightmare)
		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)
	table.insert(booty.SlotList, booty.NormalSlot2)

	booty.equipBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_EquipBtn")

	booty.equipBtn:SetAudioType(AudioCtrl.ButtonClickType.None)
	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_EquipBtn", booty.equipBtn)
	booty.equipBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local anotherTrophy = FS_UserData.trophy:GetAnotherSameTypeTrophy(booty.SelectedSlot)

		if anotherTrophy ~= nil and anotherTrophy ~= booty.SelectedItem then
			local uid = anotherTrophy:GetEquipUniqueId()

			if uid ~= 0 then
				local uid2 = booty.SelectedItem:GetEquipUniqueId()

				if uid == uid2 then
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_PLAYERINFO_EQUIP_UNIQUE, function()
						return
					end, function()
						return
					end, true)

					return
				end
			end
		end

		if booty.SelectedItem ~= nil and booty.SlotList[booty.SelectedSlot].item ~= booty.SelectedItem then
			FS_UserData.trophy:Equip(booty.SelectedSlot, booty.SelectedItem)
		end

		PlayerInfoCtrl.OpenTrophyItemPanel(false)
		PlayerInfoCtrl.SetTrophyMask(0)
		sceneController:HeroAttribUpdate(false)
		PlayerInfoCtrl.RefreshProperty(FS_UserData.story:GetUIHeroId(currentHeroIndex))
		PlayerInfoCtrl.LoadTrophy()
		UILayerCtrl.OnSelect(booty.defaultBtnName)
		PlayerInfoCtrl.OnSelectTrophyItem()
		AudioCtrl.SetUIAudio("player_info/equip")

		booty.SelectedItem = nil

		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end)

	booty.removeBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelL_PutDownButton")

	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_Exit", booty.removeBtn)
	booty.removeBtn:SetAudioType(AudioCtrl.ButtonClickType.None)

	function booty.removeBtnCB(obj, data)
		if booty.SlotList[booty.SelectedSlot].item == nil then
			-- block empty
		else
			FS_UserData.trophy:Remove(booty.SelectedSlot, false)

			booty.SlotList[booty.SelectedSlot].item = nil

			booty.SlotList[booty.SelectedSlot].image.gameObject:SetActive(false)
		end

		PlayerInfoCtrl.OpenTrophyItemPanel(false)
		PlayerInfoCtrl.RefreshTrophyBonus()
		PlayerInfoCtrl.SetTrophyDescription()
		PlayerInfoCtrl.SetTrophyMask(0)
		sceneController:HeroAttribUpdate(false)
		PlayerInfoCtrl.RefreshProperty(FS_UserData.story:GetUIHeroId(currentHeroIndex))
		UILayerCtrl.OnSelect(booty.defaultBtnName)
		AudioCtrl.SetUIAudio("player_info/unwield")
		PlayerInfoCtrl.OnSelectTrophyItem()

		booty.SelectedItem = nil

		gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
	end

	booty.removeBtn:SetEventCallBack(EventTriggerType.PointerClick, booty.removeBtnCB)

	for k, v in pairs(booty.SlotList) do
		v.mask = v.transform:Find("SelectBG").gameObject
	end

	booty.AttackSlot1:SetAdjacent(XButton.Adjacent.RIGHT, "Trophy_2")
	booty.AttackSlot1:SetAdjacent(XButton.Adjacent.DOWN, "Trophy_3")
	booty.AttackSlot1:SetAdjacent(XButton.Adjacent.LEFT, "Trophy_3")
	booty.AttackSlot2:SetAdjacent(XButton.Adjacent.LEFT, "Trophy_1")
	booty.AttackSlot2:SetAdjacent(XButton.Adjacent.DOWN, "Trophy_5")
	booty.AttackSlot2:SetAdjacent(XButton.Adjacent.RIGHT, "Trophy_5")
	booty.AttackSlot2:SetAdjacent(XButton.Adjacent.UP, "Trophy_1")
	booty.DefenseSlot1:SetAdjacent(XButton.Adjacent.RIGHT, "Trophy_5")
	booty.DefenseSlot1:SetAdjacent(XButton.Adjacent.UP, "Trophy_1")
	booty.DefenseSlot1:SetAdjacent(XButton.Adjacent.DOWN, "Trophy_4")
	booty.DefenseSlot2:SetAdjacent(XButton.Adjacent.RIGHT, "Trophy_6")
	booty.DefenseSlot2:SetAdjacent(XButton.Adjacent.LEFT, "Trophy_3")
	booty.DefenseSlot2:SetAdjacent(XButton.Adjacent.UP, "Trophy_3")
	booty.NormalSlot1:SetAdjacent(XButton.Adjacent.LEFT, "Trophy_3")
	booty.NormalSlot1:SetAdjacent(XButton.Adjacent.UP, "Trophy_2")
	booty.NormalSlot1:SetAdjacent(XButton.Adjacent.DOWN, "Trophy_6")
	booty.NormalSlot2:SetAdjacent(XButton.Adjacent.LEFT, "Trophy_4")
	booty.NormalSlot2:SetAdjacent(XButton.Adjacent.UP, "Trophy_5")
	booty.NormalSlot2:SetAdjacent(XButton.Adjacent.RIGHT, "Trophy_5")
	UILayerCtrl.AddButton("PlayerInfoBooty", "Trophy_1", booty.AttackSlot1)
	UILayerCtrl.AddButton("PlayerInfoBooty", "Trophy_2", booty.AttackSlot2)
	UILayerCtrl.AddButton("PlayerInfoBooty", "Trophy_3", booty.DefenseSlot1)
	UILayerCtrl.AddButton("PlayerInfoBooty", "Trophy_4", booty.DefenseSlot2)
	UILayerCtrl.AddButton("PlayerInfoBooty", "Trophy_5", booty.NormalSlot1)
	UILayerCtrl.AddButton("PlayerInfoBooty", "Trophy_6", booty.NormalSlot2)

	booty.LockGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn")
	booty.DeleteBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_DeleteBtn")

	booty.DeleteBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if booty.itemSelectPanel.activeSelf == false then
			if booty.SlotList[booty.SelectedSlot].item == nil then
				return
			end

			if booty.SlotList[booty.SelectedSlot].item:GetItemData().Price == -1 then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_CANT_DELETE)

				return
			elseif booty.SlotList[booty.SelectedSlot].item:GetIsLock() then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_LOCKED)

				return
			end
		else
			if booty.SelectedItem == nil then
				return
			end

			if booty.SelectedItem:GetItemData().Price == -1 then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_CANT_DELETE)

				return
			elseif booty.SelectedItem:GetIsLock() then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_LOCKED)

				return
			end
		end

		UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_PLAYERINFO_TROPHY_CONFIRM_DELETE, function()
			if booty.itemSelectPanel.activeSelf == false then
				FS_UserData.trophy:Remove(booty.SelectedSlot, true)
				PlayerInfoCtrl.LoadTrophy()
				PlayerInfoCtrl.SetTrophyDescription()
			else
				if booty.SelectedItem:GetEquiped() then
					local pos = FS_UserData.trophy:GetTrophyPos(booty.SelectedItem)

					FS_UserData.trophy:Remove(pos, true)
					PlayerInfoCtrl.LoadTrophy()
					PlayerInfoCtrl.SetTrophyDescription()
				else
					FS_UserData.itemList:SubTrophyItem(booty.SelectedItem)
				end

				PlayerInfoCtrl.RefreshTrophyItemList(booty.currentTrophyListType, booty.LastIndex)
			end

			gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
			keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
			AudioCtrl.SetUIAudio("player_info/trophy_delete")
		end, function()
			booty.isProcessingDelete = true
		end, false)
	end)
	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_DeleteBtn", booty.DeleteBtn)

	booty.LockOnBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn_LockOn")

	booty.LockOnBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.SetTrophyLockBtn(false)

		if booty.itemSelectPanel.activeSelf == false then
			if booty.SlotList[booty.SelectedSlot].item then
				booty.SlotList[booty.SelectedSlot].item:SetLock(false)
				AudioCtrl.SetUIAudio("player_info/trophy_unlock")
			end
		elseif booty.SelectedItem then
			booty.SelectedItem:SetLock(false)
			AudioCtrl.SetUIAudio("player_info/trophy_unlock")
		end
	end)

	booty.LockOffBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn_LockOff")

	booty.LockOffBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.SetTrophyLockBtn(true)

		if booty.itemSelectPanel.activeSelf == false then
			if booty.SlotList[booty.SelectedSlot].item then
				booty.SlotList[booty.SelectedSlot].item:SetLock(true)
				AudioCtrl.SetUIAudio("player_info/trophy_lock")
			end
		elseif booty.SelectedItem then
			booty.SelectedItem:SetLock(true)
			AudioCtrl.SetUIAudio("player_info/trophy_lock")
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn_LockOn", booty.LockOnBtn)
	UILayerCtrl.AddIndividual("PlayerInfoBooty", "PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn_LockOff", booty.LockOffBtn)

	booty.TrophyCount = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_ItemPanel_BagCountBg_BagCountNum")

	PlayerInfoCtrl.OnAlchemyCreate()
	PlayerInfoCtrl.OnTaskTabCreate()

	alchemy.isFinal = false
	alchemy.RestBtnDes = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_RestBg_TextBg_Text")
	alchemy.RestBtnText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_RestBg_RestBtn_Text")

	if AppVer == AppDemoCJReview then
		tabArrow[1] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_lt")
		tabArrow[2] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_ItemTypeTab_rt")
	end

	this.gameObject:SetActive(false)

	this.loadFinish = true
end

function PlayerInfoCtrl.OpenPlayerInfo()
	if sceneController ~= nil and sceneController:IsGameStart() then
		sceneController:EnterMenu(true)
	else
		return
	end

	this.loadFinish = false

	local heroId = sceneController:GetHostPlayerHeroId()

	if this.gameObject == nil or heroId == 0 then
		return
	end

	UIManager.SendMessage("Mainmenu", "ShowMainUI", false)
	UIManager.SendMessage("Mainmenu", "ShowHostUI", false)
	UIManager.SendMessage("Mainmenu", "ShowBaseUI", false)
	PlayerInfoCtrl.CheckSystemMenuOpen()
	talentDetail.ArcadeTalentType4Text:SetContent(GameText.UI_ARCADE_TALENT_TYPE_SAN)
	this.gameObject:SetActive(true)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)

	isActive = true
	isEditor = false
	selectHeroList.HeroBtnGroup = {}
	selectHeroList.loadCount = FS_UserData.story:GetUIHeroNum()

	selectHeroList.parentGO:SetActive(false)

	selectHeroList.LoadFinish = false

	selectHeroList:Load()

	if AppVer == AppDemoCJReview then
		mainTabBtnCountMax = 2
	else
		mainTabBtnCountMax = 6
	end

	if not FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		navButtonGroup[PlayerInfoCtrl.Tab.Bag].gameObject:SetActive(true)
	end

	if AppVer == AppDemoCJReview then
		navButtonGroup[PlayerInfoCtrl.Tab.Trophy].gameObject:SetActive(false)
	end

	navButtonGroup[currentBtnIndex]:SetNormal()
	navButtonGroup[currentBtnIndex]:SetHighlighted()
	UILayerCtrl.Push(currentLayer, currentBtnName)

	if currentLayer == "PlayerInfoBag" then
		gamePadIcon.edit_y:SetActive(true)
		keyboardIcon.edit_y:SetActive(true)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
		PlayerInfoCtrl.ExitEditQuickSlot()
		PlayerInfoCtrl.LoadItem(currentItemType)
		PlayerInfoCtrl.LoadQuickItem()
		PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.Bag)
		itemTypeNavButtonGroup[currentItemTypeIndex]:SetNormal()
		itemTypeNavButtonGroup[currentItemTypeIndex]:SetHighlighted()
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Bag].newLight:SetActive(false)
	elseif currentLayer == "PlayerInfoTalent" then
		if selectHeroList.loadCount < 2 then
			selectHeroList.parentGO:SetActive(false)
		else
			selectHeroList.parentGO:SetActive(true)
		end
	elseif currentLayer == "PlayerInfoTask" then
		UILayerCtrl.OnSelect("MainTabBtn")

		task.CurrentType = MS_UIQuest.QuestType.BranchTitle
		task.currentQuestId = 0

		UILayerCtrl.OnCursorClick()
	elseif currentLayer == "PlayerInfoAlchemy" then
		local button = navButtonGroup[PlayerInfoCtrl.Tab.Property]

		button:SetSelected(false)
		button:OnDown(nil, nil)
		button:OnClick(nil, nil)
	elseif currentLayer == "PlayerInfoBooty" then
		PlayerInfoCtrl.RefreshTrophyNewLight()
		booty.SlotList[booty.SelectedSlot]:SetCommonHighlighted(true)
	elseif currentLayer == "PlayerInfoProperty" then
		if selectHeroList.loadCount < 2 then
			selectHeroList.parentGO:SetActive(false)
		else
			selectHeroList.parentGO:SetActive(true)
		end
	end

	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Alchemy].gameObject:SetActive(false)
	PlayerInfoCtrl.ReLoad(heroId)

	if currentLayer == "PlayerInfoBooty" then
		PlayerInfoCtrl.SetTrophyDescription(booty.SlotList[booty.SelectedSlot].item)
	end

	for k, v in pairs(property.EditorGroup) do
		v.gameObject:SetActive(false)
	end

	if AppVer == AppDemoCJReview then
		tabArrow[1]:SetActive(false)
		tabArrow[2]:SetActive(false)
	end

	if AppVer == AppDemoCJReview or AppVer == AppDemoCJ then
		property.YArea:SetActive(false)
	end

	property.YText:SetGameTextContent(function()
		return GameText.UI_PLAYERINFO_LOOK_SKILL
	end)
	property.skillBtn.gameObject:SetActive(false)

	if sceneController ~= nil then
		sceneController:EnterMenu(true)
	end

	alchemy.BlackHoleBG:SetActive(false)
	alchemy.notAllowBG:SetActive(true)

	alchemy.isAllow = false
	alchemy.isFinal = false

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		if heroId == MS_HeroData.ArcadeHeroId then
			talentDetail.ArcadeTalentType4Text:SetContent(GameText.UI_ARCADE_TALENT_TYPE_NEW)
		end

		alchemy.RestBtnDes:SetContent(GameText.UI_PLAYERINFO_REST_DES_ARCADE)
		property.heroPortraitJoycon:SetActive(false)
		property.heroExchangeBtn.gameObject:SetActive(false)
	else
		alchemy.RestBtnDes:SetContent(GameText.UI_PLAYERINFO_REST_DES)
		property.heroPortraitJoycon:SetActive(true)
		property.heroExchangeBtn.gameObject:SetActive(true)
	end

	alchemy.RestBtnText:SetContent(GameText.UI_PLAYERINFO_REST)
	UIManager.SendMessage("Mainmenu", "SetTimeRecordVisible", false)

	this.loadFinish = true

	inputMgr:SetPointerLocked(false)
end

function PlayerInfoCtrl.OpenPlayerInfoEditor(isFinal)
	this.OpenFinish = false

	local heroId = sceneController:GetHostPlayerHeroId()

	if this.gameObject == nil or heroId == 0 then
		return
	end

	AudioCtrl.SetPause(true)
	UIManager.SendMessage("Mainmenu", "ShowMainUI", false)
	UIManager.SendMessage("Mainmenu", "ShowHostUI", false)
	UIManager.SendMessage("Mainmenu", "ShowBaseUI", false)
	UIManager.SendMessage("Mainmenu", "SetTimeRecordVisible", false)
	PlayerInfoCtrl.CheckSystemMenuOpen()
	talentDetail.ArcadeTalentType4Text:SetContent(GameText.UI_ARCADE_TALENT_TYPE_SAN)
	heroInfoPanel:SetActive(false)
	PlayerInfoCtrl.OpenTab("alchemyTab")
	alchemy.BlackHoleBG:SetActive(true)
	PlayerInfoCtrl.SetBGAlpha(0)
	alchemy.notAllowBG:SetActive(false)

	alchemy.isAllow = true

	this.gameObject:SetActive(true)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)

	isActive = true
	isEditor = true

	UILayerCtrl.Push("PlayerInfoAlchemy", nil)

	local selectHeroLoadCB = {}

	function selectHeroLoadCB.CB()
		local button = navButtonGroup[PlayerInfoCtrl.Tab.Alchemy]

		button:SetSelected(false)
		button:OnDown(nil, nil)
		button:OnClick(nil, nil)
		PlayerInfoCtrl.ReLoad(heroId)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.RestBgRT)

		this.loadFinish = true
	end

	selectHeroList.HeroBtnGroup = {}
	selectHeroList.loadCount = FS_UserData.story:GetUIHeroNum()

	if selectHeroList.loadCount < 2 then
		selectHeroList.parentGO:SetActive(false)
	else
		selectHeroList.parentGO:SetActive(true)
	end

	selectHeroList.LoadFinish = false

	selectHeroList:Load(selectHeroLoadCB)
	navButtonGroup[currentBtnIndex]:SetNormal()
	navButtonGroup[currentBtnIndex]:SetHighlighted()

	if AppVer == AppDemoCJReview then
		mainTabBtnCountMax = 1
	else
		mainTabBtnCountMax = 6
	end

	for k, v in pairs(property.EditorGroup) do
		v.gameObject:SetActive(true)
	end

	PlayerInfoCtrl.RefreshAlchemyNewLight()

	if AppVer == AppDemoCJ then
		property.YArea:SetActive(false)
		property.dedicateBtn.gameObject:SetActive(false)
	end

	if AppVer == AppDemoCJReview then
		tabArrow[1]:SetActive(false)
		tabArrow[2]:SetActive(false)
	end

	gamePadIcon.edit_y:SetActive(true)
	gamePadIcon.edit_y:SetActive(false)
	keyboardIcon.edit_y:SetActive(true)
	keyboardIcon.edit_y:SetActive(false)
	property.YText:SetGameTextContent(function()
		return GameText.UI_PLAYERINFO_LOOK_SKILL
	end)
	property.skillBtn.gameObject:SetActive(false)
	property.dedicateBtn.gameObject:SetActive(false)
	XNetwork.AddListener(XProtocol.BattleProtocolToHero.RESP_HERO_ATTRIB_UPDATED, PlayerInfoCtrl.OnHeroAttribUpdate)
	XNetwork.AddListener(XProtocol.BattleProtocolToHero.ADD_HERO_ATTRIB_POINT, PlayerInfoCtrl.OnHeroAttribUpdateFailed)

	if sceneController ~= nil then
		sceneController:EnterMenu(false)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		alchemy.RestBtnDes:SetContent(GameText.UI_PLAYERINFO_REST_DES_ARCADE)

		if heroId == MS_HeroData.ArcadeHeroId then
			talentDetail.ArcadeTalentType4Text:SetContent(GameText.UI_ARCADE_TALENT_TYPE_NEW)
		end

		property.heroPortraitJoycon:SetActive(false)
		property.heroExchangeBtn.gameObject:SetActive(false)

		if PlayerInfoCtrl.HaveSkinToExchange(heroId) then
			property.heroPortraitJoycon:SetActive(true)
			property.heroExchangeBtn.gameObject:SetActive(true)
		end
	else
		alchemy.RestBtnDes:SetContent(GameText.UI_PLAYERINFO_REST_DES)
		property.heroPortraitJoycon:SetActive(true)
		property.heroExchangeBtn.gameObject:SetActive(true)
	end

	alchemy.RestBtnText:SetContent(GameText.UI_PLAYERINFO_REST)
	inputMgr:SetPointerLocked(false)

	alchemy.isFinal = false

	if isFinal then
		alchemy.isFinal = isFinal

		alchemy.RestBtnDes:SetContent(GameText.UI_PLAYERINFO_END_DES)
		alchemy.RestBtnText:SetContent(GameText.UI_PLAYERINFO_END)
		alchemy.mainTypeText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_ARCADE_SUCCESS)
	end
end

function PlayerInfoCtrl.OpenTab(tabName)
	for k, v in pairs(tabGOGroup) do
		v:SetActive(false)
	end

	gamePadIcon.edit_y:SetActive(tabName == "bagTab")
	keyboardIcon.edit_y:SetActive(tabName == "bagTab")
	gamePadIcon.delete_y:SetActive(tabName == "bootyTab" and booty.SlotList[1].item ~= nil)
	keyboardIcon.delete_y:SetActive(tabName == "bootyTab" and booty.SlotList[1].item ~= nil)
	gamePadIcon.lock_r3:SetActive(tabName == "bootyTab" and booty.SlotList[1].item ~= nil)
	keyboardIcon.lock_r3:SetActive(tabName == "bootyTab" and booty.SlotList[1].item ~= nil)
	gamePadIcon.prev_lb:SetActive(false)
	gamePadIcon.next_rb:SetActive(false)
	keyboardIcon.prev_lb:SetActive(false)
	keyboardIcon.next_rb:SetActive(false)
	tabGOGroup[tabName]:SetActive(true)
	gamePadIcon.drop_down_x:SetActive(tabName == "bootyTab")
	keyboardIcon.drop_down_x:SetActive(tabName == "bootyTab")
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	gamePadIcon.drop_down_x:SetActive(tabName == "bootyTab" and booty.SlotList[1].item ~= nil)
	keyboardIcon.drop_down_x:SetActive(tabName == "bootyTab" and booty.SlotList[1].item ~= nil)
end

function PlayerInfoCtrl.CheckSystemMenuOpen()
	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if AppVer == AppAppleLight or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.JumpGame) or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossChallenge) or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		for k, v in pairs(menuBtnGroup) do
			v.gameObject:SetActive(true)

			if v.newLight ~= nil then
				v.newLight:SetActive(false)
			end
		end
	else
		for k, v in pairs(menuBtnGroup) do
			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or gameController:CheckShowQuestComplete(MS_UIMenu.GetUIMenuQuest(k)) == true then
				v.gameObject:SetActive(true)
			else
				v.gameObject:SetActive(false)
			end

			if k ~= PlayerInfoCtrl.MenuGuideType.Alchemy and k ~= PlayerInfoCtrl.MenuGuideType.Bag then
				if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or gameController:CheckShowQuestComplete(MS_StoryGuide.GetGuideCompleteQuest(k)) == true then
					if v.newLight ~= nil then
						v.newLight:SetActive(false)
					end
				elseif v.newLight ~= nil then
					v.newLight:SetActive(true)
				end
			end
		end
	end

	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Property].newLight:SetActive(PlayerInfoCtrl.AnyHeroHaveAttributePoints())
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Trophy].newLight:SetActive(FS_UserData.itemList:IsAnyTrophyNew())

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Task].gameObject:SetActive(false)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Trophy].gameObject:SetActive(false)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Bag].gameObject:SetActive(false)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.AlchemyAgentia].gameObject:SetActive(false)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.AlchemyTrophy].gameObject:SetActive(false)
		menuBtnGroup[PlayerInfoCtrl.MenuGuideType.AlchemyEnchant].gameObject:SetActive(false)
		alchemyNavButtonGroup[PlayerInfoCtrl.AlchemyTabType.Dedication].gameObject:SetActive(false)
	end
end

function PlayerInfoCtrl.OpenPlayerShowIntroduction(menuId)
	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return false
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		return false
	end

	local dlist = MS_StoryGuide.GetGuideDataList(menuId)

	if dlist ~= nil then
		for k, v in pairs(dlist) do
			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and gameController:CheckShowQuestComplete(v.ShowQuestId) == true and gameController:CheckHideQuestComplete(v.HideQuestId) == false then
				if v.GuideId == MS_StoryGuide.AttributeGuideId then
					local heroData = FS_UserData.heroList:GetHero(10001)

					if heroData.attribPoints > 0 then
						gameController:CompleteQuest(v.CompleteQuestId)

						if AppVer == AppAppleLight then
							return true
						end

						if LS_Setting.isJoystickConnected then
							UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", v.Title, v.DescriptionJoystick, function()
								PlayerInfoCtrl.OpenPlayerShowIntroduction(menuId)
							end, v.ImageId, v.HeroId, v.GuideId)
						else
							UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", v.Title, v.DescriptionTouch, function()
								PlayerInfoCtrl.OpenPlayerShowIntroduction(menuId)
							end, v.ImageId, v.HeroId, v.GuideId)
						end

						return true
					end
				else
					gameController:CompleteQuest(v.CompleteQuestId)

					if AppVer == AppAppleLight then
						return true
					end

					if LS_Setting.isJoystickConnected then
						UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", v.Title, v.DescriptionJoystick, function()
							PlayerInfoCtrl.OpenPlayerShowIntroduction(menuId)
						end, v.ImageId, v.HeroId, v.GuideId)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenIntroduction", v.Title, v.DescriptionTouch, function()
							PlayerInfoCtrl.OpenPlayerShowIntroduction(menuId)
						end, v.ImageId, v.HeroId, v.GuideId)
					end

					return true
				end
			end
		end
	end

	return false
end

function PlayerInfoCtrl.HaveSkinToExchange(heroId)
	if MS_StorySkin.GetSkinMax(heroId) < 1 then
		return false
	end

	local wearHeroId = BattleData.ConvertHeroIdWithSkin(heroId)
	local wearIndex

	if wearHeroId - 10000 > 1000 then
		wearIndex = 0
		wearHeroId = wearHeroId - 1000
	else
		wearIndex = 1
		wearHeroId = wearHeroId + 1000
	end

	if PlayerInfoCtrl.CheckSkinValid(wearHeroId) then
		return true
	end

	return false
end

function PlayerInfoCtrl.ChangeSkin()
	AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

	local heroId = sceneController:GetHostPlayerHeroId()

	if MS_StorySkin.GetSkinMax(heroId) < 1 then
		return
	end

	local wearHeroId = BattleData.ConvertHeroIdWithSkin(heroId)
	local wearIndex

	if wearHeroId - 10000 > 1000 then
		wearIndex = 0
		wearHeroId = wearHeroId - 1000
	else
		wearIndex = 1
		wearHeroId = wearHeroId + 1000
	end

	if PlayerInfoCtrl.CheckSkinValid(wearHeroId) then
		FS_UserData.story:InitSelectSkin(wearHeroId, wearIndex)
		sceneController:UpdateSkin()

		local sprite = XObjectPool.GetIcon("heroPortrait" .. wearHeroId)

		property.heroInfo.heroPortrait:SetSprite(sprite)
	end
end

function PlayerInfoCtrl.CheckSkinValid(id)
	if DebugShowSkin == true then
		return true
	end

	if MS_StorySkin.GetDefaultOpen(id) then
		return true
	end

	for k, v in pairs(SdkHelper.IapInfos) do
		if v.id == "hero" .. id and v.valid == true then
			return true
		end
	end

	return false
end

function PlayerInfoCtrl.ReLoadCurrentHero()
	local heroId = sceneController:GetHostPlayerHeroId()

	PlayerInfoCtrl.ReLoad(heroId)
end

function PlayerInfoCtrl.UpdateItemList(list)
	itemList = list

	if list == nil then
		return
	end

	local hpnum = FS_UserData.heroList:GetHero(FS_UserData.story:GetSelectHeroIdNow()):GetHpNum()
	local mpnum = FS_UserData.heroList:GetHero(FS_UserData.story:GetSelectHeroIdNow()):GetMpNum()

	UIManager.SendMessage("Mainmenu", "UpdateComsumeItem", hpnum, mpnum)
	PlayerInfoCtrl.GetQuickItemList()

	if isActive then
		if MS_ItemData.MainType.Trophy ~= currentItemType and currentBtnIndex == PlayerInfoCtrl.Tab.Bag then
			PlayerInfoCtrl.LoadItem(currentItemType)
		end

		PlayerInfoCtrl.LoadQuickItem()
	end

	UIManager.SendMessage("Mainmenu", "LoadQuickItem", quickList)
	UIManager.SendMessage("Mainmenu", "UpdateQuickItem", quickItem)
end

function PlayerInfoCtrl.UpdateTrophyList(list)
	trophyList = list

	if list == nil then
		return
	end

	if isActive and MS_ItemData.MainType.Trophy == currentItemType then
		PlayerInfoCtrl.LoadItem(currentItemType)
	end
end

function PlayerInfoCtrl.UpdateQuickList()
	PlayerInfoCtrl.GetQuickItemList()

	if isActive then
		PlayerInfoCtrl.LoadQuickItem()
	end

	UIManager.SendMessage("Mainmenu", "LoadQuickItem", quickList)
	UIManager.SendMessage("Mainmenu", "UpdateQuickItem", quickItem)
end

function PlayerInfoCtrl.SetQuickList(index, itemId)
	if sceneController ~= nil then
		sceneController:SetQuickList(index, itemId)
	end
end

function PlayerInfoCtrl.OnSelectQuickSLot(index)
	UILayerCtrl.OnSelect("QuickSlot" .. index)

	for i = 1, 6 do
		quickSlot.quickSlotList[i]:SetLightFunc(false)
		quickSlot.quickSlotList[i].quickslotBG:SetGray(not quickSlot.isEdit)
	end

	quickSlot.PutInBtn.gameObject:SetActive(false)
	itemDetail.BackBtn.gameObject:SetActive(false)
	itemDetail.ItemInfoGroup:SetActive(false)

	inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, 1)
end

function PlayerInfoCtrl.HandleUseItem(itemId)
	UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")

	if sceneController ~= nil then
		sceneController:SetActionItem(itemId)
	end
end

function PlayerInfoCtrl.EnterEquipItemState()
	itemDetail.isInEquipmentState = true

	UILayerCtrl.OnSelect("QuickSlot" .. 1)

	quickSlot.quickIndex = 1

	if itemDetail.LastItemBtn ~= nil then
		itemDetail.LastItemBtn:SetCommonHighlighted(true)
	end

	for i = 1, 6 do
		quickSlot.quickSlotList[i]:SetLightFunc(false)
		quickSlot.quickSlotList[i].quickslotBG:SetGray(not itemDetail.isInEquipmentState)
		quickSlot.quickSlotList[i].equipLight:SetActive(true)
	end

	itemDetail.BackBtn.gameObject:SetActive(false)
	itemDetail.EquipBtn.gameObject:SetActive(false)
	itemDetail.UseBtn.gameObject:SetActive(false)
end

function PlayerInfoCtrl.ExitEquipItemState()
	if not itemDetail.isInEquipmentState then
		return
	end

	itemDetail.isInEquipmentState = false

	for i = 1, 6 do
		quickSlot.quickSlotList[i]:SetLightFunc(false)
		quickSlot.quickSlotList[i].quickslotBG:SetGray(not quickSlot.isEdit)
		quickSlot.quickSlotList[i].equipLight:SetActive(false)
	end

	itemDetail.BackBtn.gameObject:SetActive(false)
	itemDetail.EquipBtn.gameObject:SetActive(false)
	itemDetail.UseBtn.gameObject:SetActive(not isEditor)
	UILayerCtrl.OnSelect("ItemEquipBtn")
end

function PlayerInfoCtrl.ExitEditQuickSlot()
	for i = 1, 6 do
		quickSlot.quickSlotList[i]:SetLightFunc(false)
		quickSlot.quickSlotList[i].quickslotBG:SetGray(true)
		quickSlot.quickSlotList[i].equipLight:SetActive(false)
	end

	if quickSlot.isEdit == false then
		return
	end

	quickSlot.isEdit = false

	quickSlot.gamePadBar:SetActive(true)
	quickSlot.EditBtn.ani:Play("Disabled", 0, 0)

	quickSlot.isSelectItem = false

	PlayerInfoCtrl.LoadItem(currentItemType)
	quickSlot.RemoveBtn.gameObject:SetActive(false)
	quickSlot.PutInBtn.gameObject:SetActive(false)
	itemDetail.BackBtn.gameObject:SetActive(false)
end

function PlayerInfoCtrl.CheckIsInQuickList(itemid)
	if quickList == nil then
		return false
	end

	for k, v in pairs(quickList) do
		if v.itemId == itemid then
			return true, k
		end
	end

	return false, nil
end

function PlayerInfoCtrl.LoadQuickItem()
	if quickList == nil then
		return
	end

	for k, v in pairs(quickSlot.quickSlotList) do
		local imgitem = v.imgGO

		if quickList[k].lock then
			v.lockImgGO:SetActive(true)
		else
			v.lockImgGO:SetActive(false)

			if quickList[k].itemId == 0 then
				imgitem:SetActive(false)

				v.ItemId = 0
			else
				local item = quickList[k].item
				local img = v.img

				if v.ItemId ~= item.itemId then
					v.ItemId = item.itemId

					imgitem:SetActive(true)

					local sprite = XObjectPool.GetIcon("item" .. item.itemIcon)

					img:SetSprite(sprite)
				end

				v.numText.text = item.itemNum

				if item.itemNum == 0 then
					img:SetGray(true)
				else
					img:SetGray(false)
				end
			end
		end
	end
end

function PlayerInfoCtrl.SetQuickIndex(index)
	if sceneController ~= nil then
		sceneController:SetQuickMenu(index)
	end
end

function PlayerInfoCtrl.SetBGAlpha(alpha)
	blackBG.color = Color.New(1, 1, 1, alpha)
end

function PlayerInfoCtrl.GetItemById(id)
	for k, v in pairs(itemList) do
		if v.itemId == id then
			return v
		end
	end

	local itemData = MS_ItemData.GetItemData(id)

	if itemData then
		local virItem = {}

		virItem.itemId = itemData.ItemId
		virItem.itemNum = 0
		virItem.itemName = itemData.Name
		virItem.itemIcon = itemData.Icon

		return virItem
	end

	return nil
end

function PlayerInfoCtrl.GetItemListByType(type, isForUI)
	local UIItemlist = {}

	if itemList then
		if isForUI then
			if type == MS_ItemData.MainType.Exp then
				for k, v in pairs(itemList) do
					if v:GetMainType() == type or v:GetMainType() == MS_ItemData.MainType.Talent and v:GetNum() > 0 then
						table.insert(UIItemlist, v)
					end
				end
			elseif type == MS_ItemData.MainType.Consume then
				for k, v in pairs(itemList) do
					if v:GetMainType() == type or v:GetMainType() == MS_ItemData.MainType.Attack and v:GetNum() > 0 then
						table.insert(UIItemlist, v)
					end
				end
			elseif type == MS_ItemData.MainType.Material then
				for k, v in pairs(itemList) do
					if (v:GetMainType() == type or v:GetMainType() == MS_ItemData.MainType.Stone) and v:GetType() ~= MS_ItemData.Type.Formula and v:GetType() ~= MS_ItemData.Type.TrophyBox and v:GetType() ~= MS_ItemData.Type.Document and v:GetNum() > 0 then
						table.insert(UIItemlist, v)
					end
				end
			else
				for k, v in pairs(itemList) do
					if v:GetMainType() == type and v:GetNum() > 0 then
						table.insert(UIItemlist, v)
					end
				end
			end
		else
			for k, v in pairs(itemList) do
				if v:GetMainType() == type and v:GetNum() > 0 then
					table.insert(UIItemlist, v)
				end
			end
		end
	end

	table.sort(UIItemlist, function(a, b)
		return tonumber(a.itemId) < tonumber(b.itemId)
	end)

	return UIItemlist
end

function PlayerInfoCtrl.GetQuickItemList()
	if quickList == nil then
		quickList = {}
	end

	local heroId = sceneController:GetHostPlayerHeroId()
	local hostHeroData = FS_UserData.heroList:GetHero(heroId)

	if hostHeroData then
		local defaultIndex = hostHeroData:GetMainShortcutIndex()

		for i = 1, FS_HeroData.QuickMenuMax do
			if quickList[i] == nil then
				quickList[i] = {}
			end

			quickList[i].itemId = hostHeroData:GetShortcut(i)

			if quickList[i].itemId > 0 then
				quickList[i].item = PlayerInfoCtrl.GetItemById(quickList[i].itemId)
			else
				quickList[i].item = nil
			end

			if i == defaultIndex then
				quickList[i].default = true
				quickItem = quickList[i].item
			else
				quickList[i].default = false
			end
		end
	end
end

function PlayerInfoCtrl.GetUITrophyListByType(TrophyType, containEquiped)
	local templist = {}

	if containEquiped then
		local t1, t2

		if TrophyType == MS_ItemData.Type.TrophyScars then
			t1 = FS_UserData.trophy:GetTrophy(1)
			t2 = FS_UserData.trophy:GetTrophy(2)
		elseif TrophyType == MS_ItemData.Type.TrophyResistance then
			t1 = FS_UserData.trophy:GetTrophy(3)
			t2 = FS_UserData.trophy:GetTrophy(4)
		elseif TrophyType == MS_ItemData.Type.TrophyNightmare then
			t1 = FS_UserData.trophy:GetTrophy(5)
			t2 = FS_UserData.trophy:GetTrophy(6)
		end

		if t1 ~= nil then
			table.insert(templist, t1)
		end

		if t2 ~= nil then
			table.insert(templist, t2)
		end
	end

	if trophyList then
		for k, v in pairs(trophyList) do
			if v:GetType() == TrophyType then
				table.insert(templist, v)
			end
		end
	end

	return templist
end

function PlayerInfoCtrl.GetTrophyItemListForUI()
	local tempList = {}

	for k, v in pairs(trophyList) do
		table.insert(tempList, v)
	end

	return tempList
end

function PlayerInfoCtrl.LoadItem(type)
	local itemList = PlayerInfoCtrl.GetItemListByType(type, true)

	inventory.quickSlotMarkList = {}
	inventory.itemLoader.loadCount = #itemList

	UILayerCtrl.RemoveButton("PlayerInfoBag", "item1")

	function inventory.itemLoader.loadCallback(index, com, data)
		local img = com:GetGameObject("itemImage")
		local currentMark = com:GetGameObject("toggle")
		local itemText = com:GetText("itemName")
		local numText = com:GetText("itemNum")

		com.currentMark = currentMark

		com.currentMark:SetActive(false)

		com.newLight = com:GetGameObject("newLight")
		img = XImage:new(img)

		local _btn = com:GetButton("BG")

		_btn:SetParentScroll(inventory.bagScroll)
		_btn:SetSelectedLight(false)

		local sprite = XObjectPool.GetIcon("item" .. itemList[index].itemIcon)

		img:SetSprite(sprite)
		itemText:SetContent(itemList[index]:GetItemName())
		numText:SetContent(itemList[index]:GetNum())
		com.newLight:SetActive(itemList[index]:IsNew())

		if quickSlot.isEdit then
			local isInQucikSlot, slotId = PlayerInfoCtrl.CheckIsInQuickList(itemList[index]:GetItemId())

			currentMark:SetActive(isInQucikSlot)

			if isInQucikSlot then
				inventory.quickSlotMarkList[slotId] = currentMark
			end
		end

		_btn.parentCom = com

		_btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		_btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local sprite = XObjectPool.GetIcon("item" .. itemList[index].itemIcon)

			itemDetail.itemId = itemList[index]:GetItemId()

			itemDetail.Img:SetSprite(sprite)
			itemDetail.Des:SetContent(itemList[index]:GetItemData().Description)
			itemDetail.Name:SetContent(itemList[index]:GetItemName())
			itemDetail.BounsText:SetContent("")
			itemDetail.BounsText.gameObject:SetActive(false)
			itemDetail.lineOffset:SetActive(itemDetail.BounsText.gameObject.activeSelf and itemDetail.Des.gameObject.activeSelf)
			itemDetail.ItemInfoGroup:SetActive(true)
			itemDetail.NumText:SetContent(itemList[index]:GetNum())

			if itemList[index]:GetMainType() == MS_ItemData.MainType.Quest then
				itemDetail.NumTextMax:SetContent("")
			else
				itemDetail.NumTextMax:SetContent("/" .. itemList[index]:GetNumMax())
			end

			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.contentGroupRT)

			local showTri = itemDetail.GetPreferredHeightFunc() > itemDetail.contentHeight + 0.3

			itemDetail.triangleGroup:SetActive(showTri)
			itemDetail.triangle:SetActive(showTri)

			itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

			itemList[index]:SetOld()
			com.newLight:SetActive(false)

			if itemDetail.LastItemBtn ~= nil then
				itemDetail.LastItemBtn:SetSelectedLight(false)
				itemDetail.LastItemBtn:SetCommonHighlighted(false)
			end

			UILayerCtrl.OnSelect("item" .. index)

			itemDetail.LastItemBtn = _btn

			if itemList[index]:GetMainType() == MS_ItemData.MainType.Consume or itemList[index]:GetMainType() == MS_ItemData.MainType.Attack then
				quickSlot.currentItemIndex = index
			else
				quickSlot.currentItemIndex = 1
			end

			itemDetail.UseBtn.gameObject:SetActive(false)

			itemDetail.canUse = false

			itemDetail.BackBtn.gameObject:SetActive(false)

			if quickSlot.isEdit then
				quickSlot.PutInBtn.gameObject:SetActive(true)
				itemDetail.BackBtn.gameObject:SetActive(false)
				itemDetail.UseBtn.gameObject:SetActive(false)
				itemDetail.EquipBtn.gameObject:SetActive(false)
			else
				quickSlot.PutInBtn.gameObject:SetActive(false)
				itemDetail.BackBtn.gameObject:SetActive(false)

				if itemList[index]:GetMainType() == MS_ItemData.MainType.Consume or itemList[index]:GetMainType() == MS_ItemData.MainType.Attack then
					itemDetail.UseBtn.gameObject:SetActive(not isEditor)
					itemDetail.EquipBtn.gameObject:SetActive(false)

					itemDetail.canUse = true
				else
					itemDetail.UseBtn.gameObject:SetActive(false)
					itemDetail.EquipBtn.gameObject:SetActive(false)
				end
			end

			itemDetail.isChoosingBtn = false

			PlayerInfoCtrl.ExitEquipItemState()
			_btn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.ItemInfoGroup:GetComponent("RectTransform"))
		end)
		UILayerCtrl.AddButton("PlayerInfoBag", "item" .. index, _btn)

		if index == 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. inventory.itemLoader.loadCount)
		end

		if index > 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. index - 1)
		end

		if index < inventory.itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item" .. index + 1)
		end

		if index == inventory.itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item1")

			inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, 1)

			if inventory.itemLoader.loadCount > 0 then
				if quickSlot.isSelectItem then
					UILayerCtrl.OnSelect("item" .. quickSlot.currentItemIndex)

					if quickSlot.currentItemIndex > 6 then
						local offset = quickSlot.currentItemIndex - 6

						inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, inventory.bagScroll.scrollRectCom.normalizedPosition.y - offset / (inventory.itemLoader.loadCount - inventoryItemRow))
					end
				else
					UILayerCtrl.OnSelect("item1")
				end
			end

			UILayerCtrl.OnCursorClickMute()
		end
	end

	if inventory.itemLoader.loadCount < 1 then
		itemDetail.ItemInfoGroup:SetActive(false)
		quickSlot.PutInBtn.gameObject:SetActive(false)
		itemDetail.BackBtn.gameObject:SetActive(false)
		itemDetail.UseBtn.gameObject:SetActive(false)
		itemDetail.EquipBtn.gameObject:SetActive(false)
		UILayerCtrl.OnSelect("empty")

		itemDetail.LastItemBtn = nil
		itemDetail.itemId = 0
		itemDetail.canUse = false
	end

	inventory.itemLoader:Load()
end

function PlayerInfoCtrl.SetHp(hpCur, hpMax)
	if isEditor then
		return
	end

	if currentHeroIndex ~= activeHeroIndex then
		return
	end

	local percent = Mathf.Clamp(hpCur / hpMax, 0, 1)

	property.hpText:SetContent(Mathf.Ceil(hpCur) .. "/" .. hpMax)

	property.hpText.cur = hpCur
	property.hpBar.sizeDelta = Vector2.New(percent * property.hpWidth, 10)
end

function PlayerInfoCtrl.SetSp(spCur, spMax)
	if isEditor then
		return
	end

	if currentHeroIndex ~= activeHeroIndex then
		return
	end

	local percent = Mathf.Clamp(spCur / spMax, 0, 1)

	property.spText:SetContent(Mathf.Ceil(spCur) .. "/" .. spMax)

	property.spText.cur = spCur
	property.spBar.sizeDelta = Vector2.New(percent * property.spWidth, 10)
end

function PlayerInfoCtrl.SetMp(mpCur, mpMax)
	if isEditor then
		return
	end

	if currentHeroIndex ~= activeHeroIndex then
		return
	end

	local percent = Mathf.Clamp(mpCur / mpMax, 0, 1)

	property.mpText:SetContent(mpCur .. "/" .. mpMax)

	property.mpText.cur = mpCur
	property.mpBar.sizeDelta = Vector2.New(percent * property.mpWidth, 10)
end

function PlayerInfoCtrl.SetHpEditor(hpCur, hpMax)
	local percent = Mathf.Clamp(hpCur / hpMax, 0, 1)

	property.hpText:SetContent(Mathf.Ceil(hpCur) .. "/" .. hpMax)

	property.hpText.cur = hpCur
	property.hpBar.sizeDelta = Vector2.New(percent * property.hpWidth, 10)
end

function PlayerInfoCtrl.SetSpEditor(spCur, spMax)
	local percent = Mathf.Clamp(spCur / spMax, 0, 1)

	property.spText:SetContent(Mathf.Ceil(spCur) .. "/" .. spMax)

	property.spText.cur = spCur
	property.spBar.sizeDelta = Vector2.New(percent * property.spWidth, 10)
end

function PlayerInfoCtrl.SetMpEditor(mpCur, mpMax)
	local percent = Mathf.Clamp(mpCur / mpMax, 0, 1)

	property.mpText:SetContent(mpCur .. "/" .. mpMax)

	property.mpText.cur = mpCur
	property.mpBar.sizeDelta = Vector2.New(percent * property.mpWidth, 10)
end

function PlayerInfoCtrl.SetSanityValueCommon(isSend, sanCur, sanMax, percent, sanityType)
	if isSend then
		if isEditor then
			return
		end

		if currentHeroIndex ~= activeHeroIndex then
			return
		end
	end

	if sanityType == AnimalBase_Define.SanType.Normal then
		property.sanityBar.StatusText:SetContent(GameText.UI_PLAYERINFO_SANTYPE_NORMAL)
		property.sanityBar.StatusText:SetColor(1, 1, 1, 1)
	elseif sanityType == AnimalBase_Define.SanType.Unusual then
		property.sanityBar.StatusText:SetContent(GameText.UI_PLAYERINFO_SANTYPE_UNUSUAL)
		property.sanityBar.StatusText:SetColor(0.7647058823529411, 0.5686274509803921, 0.3803921568627451, 1)
	elseif sanityType == AnimalBase_Define.SanType.Crazy then
		property.sanityBar.StatusText:SetContent(GameText.UI_PLAYERINFO_SANTYPE_CRAZY)
		property.sanityBar.StatusText:SetColor(0.5333333333333333, 0.2, 0.2235294117647059, 1)
	end

	local currentValue = sanCur

	if property and property.sanityBar then
		local sanityBar = property.sanityBar
		local threshold = AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Crazy]
		local enableInnerBar = false

		if sanityType == AnimalBase_Define.SanType.Crazy then
			enableInnerBar = true
		end

		if enableInnerBar then
			percent = percent / threshold
		else
			percent = (percent - threshold) / (1 - threshold)
		end

		if sanityBar.valueInt ~= currentValue or property.sanityBar.sanType ~= sanityType then
			property.sanityBar.valueInt = currentValue
			property.sanityBar.sanType = sanityType

			if enableInnerBar then
				sanityBar.gauge:SetFillAmount(0)

				if not property.sanityBar.showSt[6] then
					property.sanityBar.showSt[6] = true

					property.sanityBar.states[6]:SetActive(true)
				end

				sanityBar.gaugeInner:SetFillAmount(percent)
			else
				sanityBar.gauge:SetFillAmount(percent)

				if property.sanityBar.showSt[6] then
					property.sanityBar.showSt[6] = false

					property.sanityBar.states[6]:SetActive(false)
				end

				sanityBar.gaugeInner:SetFillAmount(0)
			end

			if sanityType then
				for i = 1, 3 do
					if i == sanityType + 1 then
						if not property.sanityBar.showSt[i] then
							property.sanityBar.showSt[i] = true

							property.sanityBar.states[i]:SetActive(true)
						end
					elseif property.sanityBar.showSt[i] then
						property.sanityBar.showSt[i] = false

						property.sanityBar.states[i]:SetActive(false)
					end
				end
			end

			if sanityBar.gauge then
				local color = PlayerInfoCtrl.SanityColor[sanityType + PlayerInfoCtrl.SanityThreshold.Normal]

				sanityBar.gauge:SetColor(color[1], color[2], color[3], color[4])
			end

			local stateId = MainmenuCtrl.SanityThreshold.Zero
			local showZero = percent <= 0

			if property.sanityBar.showSt[stateId] ~= showZero then
				property.sanityBar.showSt[stateId] = showZero

				property.sanityBar.states[stateId]:SetActive(showZero)
				property.sanityBar.states[stateId + 1]:SetActive(showZero)
			end
		end
	end
end

function PlayerInfoCtrl.SetSanityValue(sanCur, sanMax, percent, sanityType)
	if sanCur <= sanMax / 2 then
		property.sanityBar.NumText:SetContent("")
	else
		local nsanCur = (sanCur - sanMax / 2) * 2
		local nsanMax = sanMax

		property.sanityBar.NumText:SetContent(Mathf.Ceil(nsanCur) .. "/" .. Mathf.Floor(nsanMax))
	end

	PlayerInfoCtrl.SetSanityValueCommon(true, sanCur, sanMax, percent, sanityType)
end

function PlayerInfoCtrl.SetSanityEditor(sanCur, sanMax, sanType)
	if sanCur <= sanMax / 2 then
		property.sanityBar.NumText:SetContent("")
	else
		local nsanCur = (sanCur - sanMax / 2) * 2
		local nsanMax = sanMax

		property.sanityBar.NumText:SetContent(Mathf.Ceil(nsanCur) .. "/" .. Mathf.Floor(nsanMax))
	end

	local showSan = Mathf.Clamp(sanCur / sanMax, 0, 1)

	PlayerInfoCtrl.SetSanityValueCommon(false, sanCur, sanMax, showSan, sanType)
end

function PlayerInfoCtrl.RefreshHeroState(heroId)
	if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
		local plist = FS_UserData.heroList:GetHero(heroId):GetPropertyList()
		local tlist = FS_UserData.trophy:GetResult()
		local hpValue = plist[MS_HeroData.Property.Hp]
		local energyValue = plist[MS_HeroData.Property.Energy] + tlist[MS_HeroData.Property.Energy]
		local sanValue = plist[MS_HeroData.Property.San]
		local hpadd = FS_UserData.heroList:GetHero(heroId):GetHeroTalentValue(MS_HeroTalent.Type.PropertyAdd, MS_HeroData.Property.Hp, 0)
		local sanadd = FS_UserData.heroList:GetHero(heroId):GetHeroTalentValue(MS_HeroTalent.Type.PropertyAdd, MS_HeroData.Property.San, 0)
		local tmpHpAdd = hpValue * hpadd / 1000

		hpValue = hpValue + tmpHpAdd
		hpValue = hpValue + tlist[MS_HeroData.Property.Hp]

		local tmpSanAdd = sanValue * sanadd / 1000

		sanValue = sanValue + tmpSanAdd
		sanValue = sanValue + tlist[MS_HeroData.Property.San]

		PlayerInfoCtrl.SetHpEditor(hpValue, hpValue)
		PlayerInfoCtrl.SetSpEditor(energyValue, energyValue)

		local hero, heroIndex = sceneController:GetHostPlayerById(10001)
		local heroValue = hero:GetValue()

		PlayerInfoCtrl.SetSanityEditor(sanValue, sanValue, heroValue:GetSanType())
	else
		local hero, heroIndex = sceneController:GetHostPlayerById(heroId)

		if hero ~= nil then
			local heroValue = hero:GetValue()

			heroValue:RefreshPropertyAll(false, false, nil)

			local hpValue = heroValue:GetProperty(MS_HeroData.Property.Hp)
			local hpValueMax = heroValue:GetPropertyMax(MS_HeroData.Property.Hp)

			if hpValue < 1 then
				property.heroInfo.heroPortrait:SetGray(true)
			else
				property.heroInfo.heroPortrait:SetGray(false)
			end

			PlayerInfoCtrl.SetHpEditor(hpValue, hpValueMax)

			local energyValue = heroValue:GetProperty(MS_HeroData.Property.Energy)
			local energyValueMax = heroValue:GetPropertyMax(MS_HeroData.Property.Energy)

			PlayerInfoCtrl.SetSpEditor(energyValue, energyValueMax)
			PlayerInfoCtrl.SetSanityEditor(heroValue:GetProperty(MS_HeroData.Property.San), heroValue:GetPropertyMax(MS_HeroData.Property.San), heroValue:GetSanType())
		end
	end
end

function PlayerInfoCtrl.SetProperty(type, value)
	if propertyList[type] == nil then
		return
	end

	propertyList[type].value = value

	if type == MS_HeroData.Property.CritRate then
		propertyList[type]:SetContent(value / 10 .. "%")
	elseif type == MS_HeroData.Property.CritDamage then
		propertyList[type]:SetContent(value / 10 + 100 .. "%")
	else
		propertyList[type]:SetContent(value)
	end
end

function PlayerInfoCtrl.SetAttribute(type, value)
	if type > 6 then
		return
	end

	attributeList[type]:SetContent(value)
	attributeList[type]:SetColor(0.7568627450980392, 0.7098039215686275, 0.6705882352941176, 1)

	attributeList[type].value = value
end

function PlayerInfoCtrl.SetPropertyDelta(type, value)
	if propertyDeltaList[type] == nil then
		return
	end

	if value ~= 0 then
		propertyDeltaList[type].gameObject:SetActive(true)

		if type == MS_HeroData.Property.CritRate then
			propertyDeltaList[type]:SetContent("+" .. value / 10 .. "%")
		elseif type == MS_HeroData.Property.CritDamage then
			propertyDeltaList[type]:SetContent("+" .. value / 10 .. "%")
		else
			propertyDeltaList[type]:SetContent("+" .. value)
		end
	else
		propertyDeltaList[type].gameObject:SetActive(false)
	end
end

function PlayerInfoCtrl.GetPropertyTemp(heroId, attributeList)
	local newList = {}
	local plist = FS_HeroData.GetPropertyAllByList(heroId, attributeList, true)

	for i = 1, MS_HeroData.PropertyMax do
		newList[i] = plist[i]
	end

	return newList
end

function PlayerInfoCtrl.GetPropertyList(heroId)
	local retList = FS_UserData.heroList:GetHero(heroId):GetPropertyList()

	return retList
end

function PlayerInfoCtrl.GetProperty(heroId)
	local newList = {}

	if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
		local plist = FS_UserData.heroList:GetHero(heroId):GetPropertyList()
		local tlist = FS_UserData.trophy:GetResult()

		for i = 1, MS_HeroData.PropertyMax do
			newList[i] = plist[i] + tlist[i]
		end
	else
		local hero, heroIndex = sceneController:GetHostPlayerById(heroId)
		local heroValue = hero:GetValue()

		for i = 1, MS_HeroData.PropertyMax do
			newList[i] = heroValue:GetPropertyMax(i)
		end
	end

	return newList
end

function PlayerInfoCtrl.GetAttribute(heroId)
	return FS_UserData.heroList:GetHero(heroId):GetAttributeList()
end

function PlayerInfoCtrl.LevelUpTween()
	if property.finalLevel > property.levelText.level then
		local speed = property.finalLevel - property.levelText.level

		PlayerInfoCtrl.ExpBarTween(1, (1 - (property.expCircleImage.fillAmount - 0.05) / 0.9) / speed, function()
			if property.finalLevel > property.levelText.level then
				property.levelText.level = property.levelText.level + 1

				property.levelText:SetContent(property.levelText.level)
			end

			property.levelText.percent = 0

			PlayerInfoCtrl.SetExpBar(0)
			PlayerInfoCtrl.LevelUpTween()
		end)
	elseif property.finalPercent > property.levelText.percent then
		local tempPercent = property.finalPercent

		PlayerInfoCtrl.ExpBarTween(tempPercent, tempPercent - property.levelText.percent, function()
			property.levelText.percent = tempPercent

			PlayerInfoCtrl.LevelUpTween()
		end)
	end
end

function PlayerInfoCtrl.SetExpBar(percent)
	local newpercent = 0.9 * percent + 0.05

	property.expCircleImage.fillAmount = newpercent
	property.expLightGo.transform.localEulerAngles = Vector3.New(0, 0, newpercent * 360)
end

function PlayerInfoCtrl.SetCurrentExpValue(_herodata)
	local expTotal = MS_HeroExp.GetHeroRequireExp(_herodata.level + 1)

	property.expTotalText:SetContent(expTotal)

	if property.levelupSelectedItem.item == 0 then
		property.expCurrentText:SetContent("<color=#7B7977FF>" .. _herodata.exp .. "</color>")
	else
		local expitem = MS_ItemData.GetItemData(property.levelupSelectedItem.item)

		if expitem then
			property.expCurrentText:SetContent("<color=#83FF84FF>" .. _herodata.exp + expitem.Param1 .. "</color>")
		end
	end
end

function PlayerInfoCtrl.ExpBarTween(percent, time, finishfunc)
	local newpercent = 0.9 * percent + 0.05
	local tbl1 = {
		fillAmount = newpercent
	}

	property.expCircleTween:MoveTo(tbl1, time)
	property.expCircleTween:OnComplete(finishfunc)
	property.expCircleTween:Start()

	local tbl2 = {
		localEulerAngles = Vector3.New(0, 0, newpercent * 360)
	}

	property.expLightTween:MoveTo(tbl2, time)
	property.expLightTween:Start()
end

function PlayerInfoCtrl.ChangeCircleState(type, finishfunc)
	if currentTalentType then
		if type == false then
			if currentTalentType == PlayerInfoCtrl.talentType.Sanity then
				PlayerInfoCtrl.CircleTween(false, 2, 360, finishfunc)
			else
				PlayerInfoCtrl.CircleTween(false, 2, 0, finishfunc)
			end

			if talentMain.talentReturnFlag then
				AudioCtrl.SetUIAudio("player_info/talent_plane_open_close", "uiIndex", 2)
			end

			talentMain.talentReturnFlag = true
		else
			if currentTalentType == PlayerInfoCtrl.talentType.Attack and type == PlayerInfoCtrl.talentType.Sanity then
				if talentMain.twn.isPlaying and talentMain.circle.transform.localScale.x > 2.499 and talentMain.circle.transform.localEulerAngles.z > 270 then
					talentMain.circle.transform.localEulerAngles = Vector3.New(0, 0, talentMain.circle.transform.localEulerAngles.z + 360)

					PlayerInfoCtrl.CircleTween(true, 2, 270, finishfunc)
				else
					PlayerInfoCtrl.CircleTween(true, 2, -90, finishfunc)
				end
			elseif currentTalentType == PlayerInfoCtrl.talentType.Sanity and type == PlayerInfoCtrl.talentType.Attack then
				PlayerInfoCtrl.CircleTween(true, 2, 360, finishfunc)
			elseif currentTalentType == PlayerInfoCtrl.talentType.Attack and type == PlayerInfoCtrl.talentType.Alchemy then
				if talentMain.twn.isPlaying and talentMain.circle.transform.localScale.x > 2.499 and talentMain.circle.transform.localEulerAngles.z > 270 then
					talentMain.circle.transform.localEulerAngles = Vector3.New(0, 0, talentMain.circle.transform.localEulerAngles.z + 360)

					PlayerInfoCtrl.CircleTween(true, 2, 450, finishfunc)
				else
					PlayerInfoCtrl.CircleTween(true, 2, 90, finishfunc)
				end
			else
				PlayerInfoCtrl.CircleTween(true, 2, talentCircleAngleList[type], finishfunc)
			end

			PlayerInfoCtrl.SetLogo(type)
			AudioCtrl.SetUIAudio("player_info/talent_plane_spin")
		end
	elseif type ~= false then
		if type == PlayerInfoCtrl.talentType.Sanity then
			PlayerInfoCtrl.CircleTween(true, 2, -90, finishfunc)
		else
			PlayerInfoCtrl.CircleTween(true, 2, talentCircleAngleList[type], finishfunc)
		end

		PlayerInfoCtrl.SetLogo(type)
		AudioCtrl.SetUIAudio("player_info/talent_plane_open_close", "uiIndex", 1)
	end

	currentTalentType = type
end

function PlayerInfoCtrl.CircleTween(isPart, dur, ang, finishfunc)
	if talentMain.twn.isPlaying then
		talentMain.twn:Stop()
	end

	if isPart then
		local tbl = {
			localPosition = Vector3.New(-667, 313, 0),
			localScale = Vector3.New(2.5, 2.5, 2.5),
			localEulerAngles = Vector3.New(0, 0, ang)
		}

		talentMain.twn:MoveTo(tbl, dur)
		talentMain.twn:OnComplete(finishfunc)
		talentMain.twn:Start()
	else
		local tbl = {
			localPosition = Vector3.New(0, 0, 0),
			localScale = Vector3.New(1, 1, 1),
			localEulerAngles = Vector3.New(0, 0, ang)
		}

		talentMain.twn:MoveTo(tbl, dur)
		talentMain.twn:OnComplete(finishfunc)
		talentMain.twn:Start()
	end
end

function PlayerInfoCtrl.CircleTypeDistence(curType, desType)
	local ret = desType - curType

	if ret > 2 then
		ret = -1
	elseif ret < -2 then
		ret = 1
	end

	return ret
end

function PlayerInfoCtrl.SelectTalentTab(isSelect)
	if isSelect then
		talentMain.selectPanel:GetComponent("CanvasGroup").alpha = 1
		talentMain.selectPanel:GetComponent("CanvasGroup").blocksRaycasts = true

		talentMain.detailPanel:SetActive(false)
		gamePadIcon.prev_lb:SetActive(false)
		gamePadIcon.next_rb:SetActive(false)
		keyboardIcon.prev_lb:SetActive(false)
		keyboardIcon.next_rb:SetActive(false)
		gamePadIcon.add_r:SetActive(false)
		gamePadIcon.min_l:SetActive(false)
	else
		talentMain.selectPanel:GetComponent("CanvasGroup").alpha = 0
		talentMain.selectPanel:GetComponent("CanvasGroup").blocksRaycasts = false

		talentMain.detailPanel:SetActive(true)
		gamePadIcon.prev_lb:SetActive(true)
		gamePadIcon.next_rb:SetActive(true)
		keyboardIcon.prev_lb:SetActive(true)
		keyboardIcon.next_rb:SetActive(true)
		gamePadIcon.add_r:SetActive(false)
		gamePadIcon.min_l:SetActive(false)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
end

function PlayerInfoCtrl.SetLogo(type)
	for k, v in pairs(talentMain.logolist) do
		v:SetActive(false)

		if k == type then
			v:SetActive(true)
		end
	end

	talentDetail.talentDetailPanel.gameObject:SetActive(false)
	talentDetail.talentDetailPanel.gameObject:SetActive(true)
end

function PlayerInfoCtrl.InitTalentLine(partGo)
	local group = partGo.transform:Find("TalentLineGroup")
	local linelist = {}

	linelist.line001 = group:Find("line001")
	linelist.line007 = group:Find("line007")
	linelist.line013 = group:Find("line013")
	linelist.line0102 = group:Find("line0102")
	linelist.line0203 = group:Find("line0203")
	linelist.line0204 = group:Find("line0204")
	linelist.line0205 = group:Find("line0205")
	linelist.line0506 = group:Find("line0506")
	linelist.line0104 = group:Find("line0104")
	linelist.line0405 = group:Find("line0405")
	linelist.line0406 = group:Find("line0406")
	linelist.line0708 = group:Find("line0708")
	linelist.line0710 = group:Find("line0710")
	linelist.line0809 = group:Find("line0809")
	linelist.line1011 = group:Find("line1011")
	linelist.line1012 = group:Find("line1012")
	linelist.line1316 = group:Find("line1316")
	linelist.line1314 = group:Find("line1314")
	linelist.line1618 = group:Find("line1618")
	linelist.line1417 = group:Find("line1417")
	linelist.line1415 = group:Find("line1415")
	linelist.line0407 = group:Find("line0407")
	linelist.line0408 = group:Find("line0408")
	linelist.line0609 = group:Find("line0609")
	linelist.line0608 = group:Find("line0608")
	linelist.line0911 = group:Find("line0911")
	linelist.line0810 = group:Find("line0810")
	linelist.line0811 = group:Find("line0811")
	linelist.line0714 = group:Find("line0714")
	linelist.line1416 = group:Find("line1416")
	linelist.line1014 = group:Find("line1014")
	linelist.line1015 = group:Find("line1015")
	linelist.line1112 = group:Find("line1112")
	linelist.line1215 = group:Find("line1215")
	linelist.line1517 = group:Find("line1517")
	linelist.line1718 = group:Find("line1718")
	linelist.line1617 = group:Find("line1617")
	linelist.line0305 = group:Find("line0305")

	return linelist
end

function PlayerInfoCtrl.InitTalentPoint(partIndex, partGo, index)
	local talentpoint = {}
	local btnGO = partGo.transform:Find("TalentPoint1" .. string.format("%02d", index)):Find("talentBtn").gameObject

	talentpoint.btn = XButton:new(btnGO)
	talentpoint.img = XImage:new(talentpoint.btn.transform:Find("talent").gameObject)
	talentpoint.num = talentpoint.btn.transform:Find("num"):GetComponent("Text")

	table.insert(talentNumTextList, talentpoint.num.gameObject)

	talentpoint.frameGray = talentpoint.btn.transform.parent:Find("frame/gray").gameObject
	talentpoint.mask = talentpoint.btn.transform:Find("mask").gameObject
	talentpoint.fullLight = talentpoint.btn.transform:Find("fullLight").gameObject
	talentpoint.addLight = talentpoint.btn.transform:Find("Add_Light").gameObject

	if partIndex == 1 then
		talentpoint.fullLight:GetComponent("Image").color = Color.New(0.6313725490196078, 0.27450980392156865, 0.23529411764705882, 1)
	elseif partIndex == 2 then
		talentpoint.fullLight:GetComponent("Image").color = Color.New(0.3686274509803922, 0.5764705882352941, 0.25098039215686274, 1)
	elseif partIndex == 3 then
		talentpoint.fullLight:GetComponent("Image").color = Color.New(0.6705882352941176, 0.4666666666666667, 0.23137254901960785, 1)
	elseif partIndex == 4 then
		talentpoint.fullLight:GetComponent("Image").color = Color.New(0.3686274509803922, 0.5294117647058824, 0.7058823529411765, 1)
	end

	talentpoint.stoneEnoughGO = talentpoint.btn.transform:Find("canAdd").gameObject
	talentpoint.go = talentpoint.btn.transform.parent.gameObject
	talentpoint.canAdd = false

	return talentpoint
end

function PlayerInfoCtrl.UpdateTalentStone(type, numDelta)
	if type == PlayerInfoCtrl.talentStoneType.Low then
		talentMain.lowTalentStoneNumText.num = talentMain.lowTalentStoneNumText.num + numDelta
	elseif type == PlayerInfoCtrl.talentStoneType.Mid then
		talentMain.midTalentStoneNumText.num = talentMain.midTalentStoneNumText.num + numDelta
	elseif type == PlayerInfoCtrl.talentStoneType.High then
		talentMain.highTalentStoneNumText.num = talentMain.highTalentStoneNumText.num + numDelta
	elseif type == PlayerInfoCtrl.talentStoneType.VeryHigh then
		talentMain.veryHighTalentStoneNumText.num = talentMain.veryHighTalentStoneNumText.num + numDelta
	elseif type == PlayerInfoCtrl.talentStoneType.Jerold then
		talentMain.jeroldStoneNumText.num = talentMain.jeroldStoneNumText.num + numDelta
	end
end

function PlayerInfoCtrl.SetTalentStone(lownum, midnum, highnum, veryhighnum, jeroldnum)
	talentMain.lowTalentStoneNumText:SetContent(lownum)
	talentMain.midTalentStoneNumText:SetContent(midnum)
	talentMain.highTalentStoneNumText:SetContent(highnum)
	talentMain.veryHighTalentStoneNumText:SetContent(veryhighnum)
	talentMain.jeroldStoneNumText:SetContent(jeroldnum)

	talentMain.lowTalentStoneNumText.num = lownum
	talentMain.midTalentStoneNumText.num = midnum
	talentMain.highTalentStoneNumText.num = highnum
	talentMain.veryHighTalentStoneNumText.num = veryhighnum
	talentMain.jeroldStoneNumText.num = jeroldnum
	talentMain.lowTalentStoneNumText.m_num = lownum
	talentMain.midTalentStoneNumText.m_num = midnum
	talentMain.highTalentStoneNumText.m_num = highnum
	talentMain.veryHighTalentStoneNumText.m_num = veryhighnum
	talentMain.jeroldStoneNumText.m_num = jeroldnum
end

function PlayerInfoCtrl.SetAllTalentNumTextActive(bool)
	for k, v in pairs(talentNumTextList) do
		v:SetActive(bool)
	end

	talentMain.canOpenTalentDetail = bool

	if talentMain.canOpenTalentDetail then
		UILayerCtrl.OnButtonClick("talentAdd")
	end
end

function PlayerInfoCtrl.CheckEnoughTalentStone(talent)
	if talent:IsTalentMax() then
		return false
	end

	local LevelList = talent:GetStoneLevelList()

	if #LevelList == 0 then
		return false
	end

	local level = talent:GetTalentLevel() + 1
	local stoneLevel = tonumber(LevelList[level])

	if stoneLevel == PlayerInfoCtrl.talentStoneType.Low then
		if talentMain.lowTalentStoneNumText.m_num > 0 then
			return true
		end
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.Mid then
		if talentMain.midTalentStoneNumText.m_num > 0 then
			return true
		end
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.High then
		if talentMain.highTalentStoneNumText.m_num > 0 then
			return true
		end
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.VeryHigh then
		if talentMain.veryHighTalentStoneNumText.m_num > 0 then
			return true
		end
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.Jerold and talentMain.jeroldStoneNumText.m_num > 0 then
		return true
	end

	return false
end

function PlayerInfoCtrl.CheckEnoughTalentStoneByLevel(stoneLevel)
	if stoneLevel == PlayerInfoCtrl.talentStoneType.Low then
		return talentMain.lowTalentStoneNumText.num > 0
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.Mid then
		return talentMain.midTalentStoneNumText.num > 0
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.High then
		return talentMain.highTalentStoneNumText.num > 0
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.VeryHigh then
		return talentMain.veryHighTalentStoneNumText.num > 0
	elseif stoneLevel == PlayerInfoCtrl.talentStoneType.Jerold then
		return talentMain.jeroldStoneNumText.num > 0
	end
end

function PlayerInfoCtrl.LoadTalentPoint(talent)
	local talentdata = talent:GetTalentData()

	if talentdata.TalentPos > 1000 then
		return
	end

	local tp = talentList[talentdata.TalentPos]

	tp.go:SetActive(true)

	local partIndex = math.floor(talentdata.TalentPos / 100)
	local vec2

	if partIndex == 1 then
		vec2 = Vector2.New(tp.go.transform.localPosition.x, tp.go.transform.localPosition.y + 7.2)
	elseif partIndex == 2 then
		vec2 = Vector2.New(tp.go.transform.localPosition.x, tp.go.transform.localPosition.y + 7.2)
	elseif partIndex == 3 then
		vec2 = Vector2.New(tp.go.transform.localPosition.x, tp.go.transform.localPosition.y + 7.2)
	elseif partIndex == 4 then
		vec2 = Vector2.New(tp.go.transform.localPosition.x, tp.go.transform.localPosition.y + 7.2)
	end

	talentPosList["PlayerInfoTalent" .. partIndex]["talent" .. talentdata.TalentPos] = vec2

	if tp.line then
		tp.line.gameObject:SetActive(false)
	end

	local numMax = talent:GetTalentLevelMax()

	tp.num.text = talent:GetTalentLevel() .. "/" .. numMax

	tp.fullLight:SetActive(false)

	if talent:GetPreTalentPos() == 0 then
		if talent:GetTalentLevel() > 0 then
			tp.mask:SetActive(false)
		else
			tp.mask:SetActive(true)
		end

		tp.frameGray:SetActive(true)

		if talent:IsTalentMax() then
			tp.fullLight:SetActive(true)
			tp.frameGray:SetActive(false)

			tp.canAdd = false
		else
			tp.fullLight:SetActive(false)

			tp.canAdd = true
		end

		local Idx1 = talentdata.TalentPos % 100

		tp.line = talentLineList[partIndex]["line0" .. string.format("%02d", Idx1)]

		if tp.line then
			tp.line.gameObject:SetActive(true)

			tp.lineGold = tp.line:Find("gold").gameObject

			tp.lineGold:SetActive(true)
		end
	else
		local Idx1 = talentdata.TalentPos % 100
		local Idx2 = talent:GetPreTalentPos() % 100

		if Idx2 < Idx1 then
			tp.line = talentLineList[partIndex]["line" .. string.format("%02d", Idx2) .. string.format("%02d", Idx1)]
		else
			tp.line = talentLineList[partIndex]["line" .. string.format("%02d", Idx1) .. string.format("%02d", Idx2)]
		end

		if tp.line == nil then
			SystemHelper.LogError("位置" .. Idx1 .. "::" .. Idx2 .. "无连线")
		end

		tp.line.gameObject:SetActive(true)

		tp.lineGold = tp.line:Find("gold").gameObject

		tp.lineGold:SetActive(false)

		local preTalent = talent:GetPreTalent()

		if preTalent:GetTalentLevel() > 0 then
			tp.frameGray:SetActive(true)

			if talent:GetTalentLevel() > 0 then
				tp.lineGold:SetActive(true)
				tp.mask:SetActive(false)
			else
				tp.mask:SetActive(true)
			end

			if talent:IsTalentMax() then
				tp.fullLight:SetActive(true)
				tp.frameGray:SetActive(false)

				tp.canAdd = false
			else
				tp.fullLight:SetActive(false)

				tp.canAdd = true
			end
		else
			tp.mask:SetActive(true)
			tp.frameGray:SetActive(false)

			tp.canAdd = false
		end
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and talentdata.HeroId == MS_HeroData.ArcadeHeroId then
		if talentdata.Achievement ~= nil and talentdata.Achievement ~= 0 then
			tp.frameGray:SetActive(false)
		end

		if partIndex == 4 and tp.line then
			tp.line.gameObject:SetActive(false)
		end
	end

	if tp.canAdd then
		if isEditor then
			tp.stoneEnoughGO:SetActive(PlayerInfoCtrl.CheckEnoughTalentStone(talent))
		else
			tp.stoneEnoughGO:SetActive(false)
		end
	else
		tp.stoneEnoughGO:SetActive(false)
	end

	local sprite = XObjectPool.GetIcon("talent" .. talentdata.Icon)

	talentDataList["talent" .. talentdata.TalentPos] = talent

	tp.img:SetSprite(sprite)
	tp.btn:SetAudioType(AudioCtrl.ButtonClickType.TalentChoose)
	tp.btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if talentMain.canOpenTalentDetail == false then
			return
		end

		if talentPosList["PlayerInfoTalent" .. math.floor(talentdata.TalentPos / 100)]["talent" .. talentdata.TalentPos] ~= nil then
			talentMain.cursor.transform.localPosition = talentPosList["PlayerInfoTalent" .. math.floor(talentdata.TalentPos / 100)]["talent" .. talentdata.TalentPos]

			talentMain.talentSelectedLight:SetActive(true)
			talentMain.talentCursorNormal:SetActive(false)
			talentMain.cursor:SetActive(true)

			talentMain.currentSelectedTalentpoint = "talent" .. talentdata.TalentPos
		end

		for i = 1, 5 do
			talentDetailPointList[i].stoneLight:SetActive(false)
		end

		PlayerInfoCtrl.OpenTalentDetail(talent)
	end)
	UILayerCtrl.AddIndividual("PlayerInfoTalent" .. math.floor(talentdata.TalentPos / 100), "talent" .. talentdata.TalentPos, tp.btn)
end

function PlayerInfoCtrl.SetTalentPoint(pos, current, max, canAdd)
	local tp = talentList[pos]

	tp.num.text = current .. "/" .. max

	if canAdd then
		tp.frameGray:SetActive(true)
		tp.mask:SetActive(false)
	else
		tp.frameGray:SetActive(false)
		tp.mask:SetActive(true)
	end

	if current == max then
		tp.frameGray:SetActive(false)
		tp.mask:SetActive(false)
	end

	if current > 0 then
		tp.lineGold:SetActive(true)
	else
		tp.lineGold:SetActive(false)
	end
end

function PlayerInfoCtrl.ShowTalentDescription(btn, talentdata)
	if talentdata == nil then
		return
	end

	if talentMain.talentDescription.talentName == talentdata.TalentName then
		talentMain.talentDescription.gameObject:SetActive(false)

		talentMain.talentDescription.talentName = nil
	else
		local canvas = this.transform:GetComponent("Canvas")
		local screenPos = canvas.worldCamera:WorldToScreenPoint(btn.transform.position)
		local uiPos, ret

		ret, uiPos = RectTransformUtility.ScreenPointToWorldPointInRectangle(screenRect.rect, screenPos, canvas.worldCamera, uiPos)
		talentMain.talentDescription.transform.localPosition = Vector2.New(uiPos.x * 1.2, uiPos.y * 1.2)

		talentMain.talentDescription.gameObject:SetActive(true)
		talentMain.talentDescription:SetContent(talentdata.TalentName)
		talentMain.talentDescription.childText:SetContent(talentdata.TalentName)

		talentMain.talentDescription.talentName = talentdata.TalentName
	end
end

function PlayerInfoCtrl.ConvertTalentText(talentText, valueDelta, heroId)
	local ttext = SystemHelper.ConvertCustomRichText(talentText, 20, 2, heroId)

	ttext = string.gsub(ttext, "{(%l)}", function(str)
		if str == "a" then
			return tostring(valueDelta)
		elseif str == "b" then
			return tostring(valueDelta / 10) .. "%"
		end
	end)

	return ttext
end

function PlayerInfoCtrl.OpenTalentDetail(talent)
	PlayerInfoCtrl.SetTalentStone(talentMain.lowTalentStoneNumText.m_num, talentMain.midTalentStoneNumText.m_num, talentMain.highTalentStoneNumText.m_num, talentMain.veryHighTalentStoneNumText.m_num, talentMain.jeroldStoneNumText.m_num)

	talentDetail.currentTalent = talent

	local talentdata = talent:GetTalentData()
	local tp = talentList[talentdata.TalentPos]

	talentMain.canEditTalent = false

	if tp.canAdd and isEditor then
		talentMain.canEditTalent = true
	end

	talentDetail.talentDetailPanel.gameObject:SetActive(true)
	talentMain.talentDescription.gameObject:SetActive(false)
	UILayerCtrl.RemoveIndividual("PlayerInfoTalent" .. currentTalentType, "talentAdd")
	UILayerCtrl.RemoveIndividual("PlayerInfoTalent" .. currentTalentType, "talentSub")

	if talentMain.canEditTalent then
		talentDetail.needAltarTips:SetActive(false)
	else
		talentDetail.needAltarTips:SetActive(not isEditor)
	end

	local LevelList = talent:GetStoneLevelList()

	if #LevelList == 0 then
		talentMain.canEditTalent = false

		talentDetail.needAltarTips:SetActive(false)
		talentDetail.ConfirmBtn.gameObject:SetActive(false)
	end

	local numMax = talent:GetTalentLevelMax()
	local num = talent:GetTalentLevel()
	local newNum = num

	talentDetail.Title:SetContent(talentdata.TalentName)

	local tlevel = talent:GetTalentLevel()

	talentDetail.NumText:SetContent(num .. "/" .. numMax)

	talentDetail.NumText.num = num
	talentDetail.NumText.numMax = numMax

	talentDetail.AddLight:SetActive(false)

	talentDetail.currentTalentMax = numMax

	local levelInfo = 1

	if isEditor then
		if tlevel > 0 then
			if tlevel + 1 < numMax + 1 then
				levelInfo = tlevel + 1
			else
				levelInfo = tlevel
			end
		end
	elseif tlevel > 0 then
		levelInfo = tlevel
	end

	PlayerInfoCtrl.SetTalentInfo(levelInfo)

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and talentdata.HeroId == MS_HeroData.ArcadeHeroId then
		local partIndex = math.floor(talentdata.TalentPos / 100)

		if partIndex == 4 then
			talentDetail.NumText:SetContent(tlevel .. "/" .. numMax)
		end
	end

	for i = 1, 5 do
		talentDetailPointList[i].desBtnLight:SetActive(false)
	end

	talentDetailPointList[levelInfo].desBtnLight:SetActive(true)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(talentDetail.ContentGroupRTF)

	local partIndex = math.floor(talentdata.TalentPos / 100)

	if partIndex == 1 then
		talentDetail.fullLightImg:SetColor(0.6313725490196078, 0.27450980392156865, 0.23529411764705882, 1)
	elseif partIndex == 2 then
		talentDetail.fullLightImg:SetColor(0.3686274509803922, 0.5764705882352941, 0.25098039215686274, 1)
	elseif partIndex == 3 then
		talentDetail.fullLightImg:SetColor(0.6705882352941176, 0.4666666666666667, 0.23137254901960785, 1)
	elseif partIndex == 4 then
		talentDetail.fullLightImg:SetColor(0.3686274509803922, 0.5294117647058824, 0.7058823529411765, 1)
	end

	talentDetail.fullLight:SetActive(true)

	local sprite = XObjectPool.GetIcon("talent" .. talentdata.Icon)

	talentDetail.Icon:SetSprite(sprite)

	for i = 1, 5 do
		talentDetailPointList[i].gameObject:SetActive(false)
	end

	if #LevelList > 0 then
		for i = 1, numMax do
			talentDetailPointList[i].gameObject:SetActive(true)
		end

		for i = 1, numMax do
			local stoneLevel = tonumber(LevelList[i])

			talentDetailPointList[i].SetType(stoneLevel)
			talentDetailPointList[i].addBtn.gameObject:SetActive(false)
			talentDetailPointList[i].stoneBtn:SetInteractable(false)
			talentDetailPointList[i].whitelineGO:SetActive(false)
			talentDetailPointList[i].addLightGO:SetActive(false)
			talentDetailPointList[i].greenLightGO:SetActive(false)

			if i <= num then
				talentDetailPointList[i].stoneBtn.gameObject:SetActive(true)
				talentDetailPointList[i].stoneImg:SetColor(1, 1, 1, 1)
				talentDetailPointList[i].goldlineGO:SetActive(true)
				talentDetailPointList[i].addLightGO:SetActive(false)
				talentDetailPointList[i].greenLightGO:SetActive(true)
			else
				talentDetailPointList[i].stoneBtn.gameObject:SetActive(false)
				talentDetailPointList[i].goldlineGO:SetActive(false)
				talentDetailPointList[i].stoneBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					if not talentMain.canOpenTalentDetail then
						return
					end

					newNum = i - 1

					if newNum == num then
						talentDetail.AddLight:SetActive(false)
						talentDetail.ConfirmBtn.gameObject:SetActive(false)
					end

					talentDetailPointList[i].whitelineGO:SetActive(false)
					talentDetailPointList[i].addLightGO:SetActive(false)
					talentDetailPointList[i].greenLightGO:SetActive(false)

					talentDetail.NumText.num = newNum

					talentDetail.NumText:SetContent(talentDetail.NumText.num .. "/" .. talentDetail.NumText.numMax)

					tlevel = newNum

					PlayerInfoCtrl.SetTalentInfo(tlevel)
					AudioCtrl.SetUIAudio("player_info/talent_unload")
					talentDetailPointList[i].stoneBtn.gameObject:SetActive(false)
					talentDetailPointList[i].addBtn.gameObject:SetActive(talentMain.canEditTalent)

					local isStoneEnoughCanAdd = PlayerInfoCtrl.CheckEnoughTalentStoneByLevel(stoneLevel)

					talentDetailPointList[i].canNotAddLight:SetActive(false)
					UILayerCtrl.AddIndividual("PlayerInfoTalent" .. currentTalentType, "talentAdd", talentDetailPointList[i].addBtn)

					if i - 1 > num then
						talentDetailPointList[i - 1].stoneBtn:SetInteractable(true)
						UILayerCtrl.AddIndividual("PlayerInfoTalent" .. currentTalentType, "talentSub", talentDetailPointList[i - 1].stoneBtn)
					else
						UILayerCtrl.RemoveIndividual("PlayerInfoTalent" .. currentTalentType, "talentSub")
					end

					if talentDetailPointList[i + 1] then
						talentDetailPointList[i + 1].addBtn.gameObject:SetActive(false)
					end

					PlayerInfoCtrl.UpdateTalentStone(stoneLevel, 1)
				end)
				talentDetailPointList[i].addBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					if not talentMain.canOpenTalentDetail then
						return
					end

					if not talentMain.canEditTalent then
						return
					end

					if stoneLevel == PlayerInfoCtrl.talentStoneType.Low then
						if talentMain.lowTalentStoneNumText.num < 1 then
							return
						end

						PlayerInfoCtrl.UpdateTalentStone(stoneLevel, -1)
					elseif stoneLevel == PlayerInfoCtrl.talentStoneType.Mid then
						if talentMain.midTalentStoneNumText.num < 1 then
							return
						end

						PlayerInfoCtrl.UpdateTalentStone(stoneLevel, -1)
					elseif stoneLevel == PlayerInfoCtrl.talentStoneType.High then
						if talentMain.highTalentStoneNumText.num < 1 then
							return
						end

						PlayerInfoCtrl.UpdateTalentStone(stoneLevel, -1)
					elseif stoneLevel == PlayerInfoCtrl.talentStoneType.VeryHigh then
						if talentMain.veryHighTalentStoneNumText.num < 1 then
							return
						end

						PlayerInfoCtrl.UpdateTalentStone(stoneLevel, -1)
					elseif stoneLevel == PlayerInfoCtrl.talentStoneType.Jerold then
						if talentMain.jeroldStoneNumText.num < 1 then
							return
						end

						PlayerInfoCtrl.UpdateTalentStone(stoneLevel, -1)
					end

					newNum = i

					if newNum > num then
						talentDetailPointList[i].whitelineGO:SetActive(true)
						talentDetailPointList[i].addLightGO:SetActive(true)
					end

					talentDetail.NumText.num = newNum

					talentDetail.NumText:SetContent(talentDetail.NumText.num .. "/" .. talentDetail.NumText.numMax)

					tlevel = newNum

					PlayerInfoCtrl.SetTalentInfo(tlevel)
					talentDetailPointList[i].addBtn.gameObject:SetActive(false)
					talentDetailPointList[i].stoneBtn.gameObject:SetActive(true)
					talentDetailPointList[i].stoneImg:SetColor(1, 1, 1, 0.2)
					talentDetailPointList[i].stoneBtn:SetInteractable(true)
					UILayerCtrl.AddIndividual("PlayerInfoTalent" .. currentTalentType, "talentSub", talentDetailPointList[i].stoneBtn)

					if i - 1 > num then
						talentDetailPointList[i - 1].stoneBtn:SetInteractable(false)
					end

					if talentDetailPointList[i + 1].gameObject.activeSelf then
						talentDetailPointList[i + 1].addBtn.gameObject:SetActive(talentMain.canEditTalent)

						local isStoneEnoughCanAdd = PlayerInfoCtrl.CheckEnoughTalentStoneByLevel(tonumber(LevelList[i + 1]))

						talentDetailPointList[i + 1].canNotAddLight:SetActive(false)
						UILayerCtrl.AddIndividual("PlayerInfoTalent" .. currentTalentType, "talentAdd", talentDetailPointList[i + 1].addBtn)
					else
						UILayerCtrl.RemoveIndividual("PlayerInfoTalent" .. currentTalentType, "talentAdd")
					end

					talentDetail.ConfirmBtn.gameObject:SetActive(talentMain.canEditTalent)
				end)

				if i == num + 1 then
					talentDetailPointList[i].addBtn.gameObject:SetActive(talentMain.canEditTalent)

					local isStoneEnoughCanAdd = PlayerInfoCtrl.CheckEnoughTalentStoneByLevel(tonumber(LevelList[i]))

					talentDetailPointList[i].canNotAddLight:SetActive(not isStoneEnoughCanAdd)
					UILayerCtrl.AddIndividual("PlayerInfoTalent" .. currentTalentType, "talentAdd", talentDetailPointList[i].addBtn)
				end
			end
		end

		talentDetail.ConfirmBtn.gameObject:SetActive(false)
		talentDetail.ConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if not talentMain.canOpenTalentDetail then
				return
			end

			if not talentMain.canEditTalent then
				return
			end

			local needText = ""

			if LevelList[newNum] ~= nil and tonumber(LevelList[newNum]) > 0 and tonumber(LevelList[newNum]) < 6 then
				needText = "<quad name=" .. "item" .. MS_ItemData.TalentTextIconList[tonumber(LevelList[newNum])] .. " size=20 width=2 />" .. string.gsub(MS_ItemData.GetItemName(MS_ItemData.ItemID_TalentAddList[tonumber(LevelList[newNum])]), " ", " ")
			end

			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", string.gsub(GameText.UI_PLAYERINFO_TALENT_NEED_CONSUME, " ", " ") .. needText .. "\n" .. string.gsub(GameText.UI_PLAYERINFO_COMFIRM_ADD_TALENT, " ", " "), function()
				if newNum > num then
					local p_data = {}

					p_data.talentId = talent.talentId
					p_data.level = newNum - num

					local gameController = sceneController:GetGameController()

					if p_data.level > 0 and gameController ~= nil then
						gameController:RecordAchievement(MS_Achievement.AchievementIdType.FirstTimeAddTalent, 1)
					end

					local deltaSan, deltaHp

					if talentdata.Type == MS_HeroTalent.Type.PropertyAdd then
						if tonumber(talentdata.ConditionString) == MS_HeroData.Property.Hp then
							local retPercent

							if num == 0 then
								retPercent = talentdata.Value + (newNum - 1) * talentdata.ValueAdd
							else
								retPercent = p_data.level * talentdata.ValueAdd
							end

							local hp = FS_UserData.heroList:GetHero(talentdata.HeroId):GetProperty(MS_HeroData.Property.Hp)

							deltaHp = hp * (retPercent / 1000)
						elseif tonumber(talentdata.ConditionString) == MS_HeroData.Property.San then
							local retPercent

							if num == 0 then
								retPercent = talentdata.Value + (newNum - 1) * talentdata.ValueAdd
							else
								retPercent = p_data.level * talentdata.ValueAdd
							end

							local player, heroIndex = sceneController:GetHostPlayerById(talentdata.HeroId)

							if player then
								local sanNum = player:GetValue():GetProperty(MS_HeroData.Property.San)
								local sanMax = player:GetValue():GetPropertyMax(MS_HeroData.Property.San)
								local sanBase = FS_UserData.heroList:GetHero(talentdata.HeroId):GetProperty(MS_HeroData.Property.San)

								deltaSan = sanBase * (retPercent / 1000)
								deltaSan = sanNum / sanMax * (sanMax + deltaSan) - sanNum
							end
						end
					end

					FS_UserData.heroList:GetHero(talentdata.HeroId):ParseTalent(p_data)

					if FS_UserData.heroList:IsAllTalentMax() and gameController ~= nil then
						gameController:RecordAchievement(MS_Achievement.AchievementIdType.AddAllTalent, 1)
					end

					if FS_UserData.heroList:IsAllTalentMax(MS_HeroData.DLCHeroId) and gameController ~= nil then
						gameController:RecordAchievement(MS_Achievement.AchievementIdType.AddDLCHeroAllTalent, 1)
					end

					if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.heroList:GetHero(MS_HeroData.ArcadeHeroId):IsAllTalentMaxWithOutSan() then
						FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.AddArcadeHeroAllTalent)
					end

					FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.AddTalentTime, p_data.talentId, p_data.level, FS_UserData.story:GetGameTime())
					AudioCtrl.SetUIAudio("player_info/add_attributes_points")

					for i = 1, 5 do
						talentDetailPointList[i].stoneLight:SetActive(false)
					end

					for i = num + 1, newNum do
						talentDetailPointList[i].stoneLight:SetActive(true)
					end

					AudioCtrl.SetUIAudio("player_info/talent_add")
					FS_UserData.itemList:UseBagItem(MS_ItemData.ItemID_TalentAddList[1], talentMain.lowTalentStoneNumText.m_num - talentMain.lowTalentStoneNumText.num)
					FS_UserData.itemList:UseBagItem(MS_ItemData.ItemID_TalentAddList[2], talentMain.midTalentStoneNumText.m_num - talentMain.midTalentStoneNumText.num)
					FS_UserData.itemList:UseBagItem(MS_ItemData.ItemID_TalentAddList[3], talentMain.highTalentStoneNumText.m_num - talentMain.highTalentStoneNumText.num)
					FS_UserData.itemList:UseBagItem(MS_ItemData.ItemID_TalentAddList[4], talentMain.veryHighTalentStoneNumText.m_num - talentMain.veryHighTalentStoneNumText.num)
					FS_UserData.itemList:UseBagItem(MS_ItemData.ItemID_TalentAddList[5], talentMain.jeroldStoneNumText.m_num - talentMain.jeroldStoneNumText.num)

					if talentMain.veryHighTalentStoneNumText.m_num - talentMain.veryHighTalentStoneNumText.num > 0 then
						local gameController = sceneController:GetGameController()

						gameController:RecordAchievement(MS_Achievement.AchievementIdType.AddFiveTalent, talentMain.veryHighTalentStoneNumText.m_num - talentMain.veryHighTalentStoneNumText.num)
					end

					PlayerInfoCtrl.ReloadTalent(talentdata.HeroId)
					PlayerInfoCtrl.OpenTalentDetail(talent)
					PlayerInfoCtrl.RefreshProperty(talentdata.HeroId)
					sceneController:HeroAttribUpdate(false)

					for k, v in pairs(talentList) do
						v.addLight:SetActive(false)
					end

					talentList[talentdata.TalentPos].addLight:SetActive(true)

					local player, heroIndex = sceneController:GetHostPlayerById(talentdata.HeroId)

					if player then
						if deltaHp then
							player:GetValue():AddProperty(MS_HeroData.Property.Hp, deltaHp)
						end

						if deltaSan then
							player:GetValue():AddProperty(MS_HeroData.Property.San, deltaSan)
						end

						local heroData = MS_HeroData.GetHero(talentdata.HeroId)

						UIManager.SendMessage("Mainmenu", "SetRageAvailableThreshold", heroData.UIRageMin, player:GetUIRageLineDiff())
					end
				else
					for i = 1, 5 do
						talentDetailPointList[i].stoneLight:SetActive(false)
					end

					PlayerInfoCtrl.SetTalentStone(talentMain.lowTalentStoneNumText.m_num, talentMain.midTalentStoneNumText.m_num, talentMain.highTalentStoneNumText.m_num, talentMain.veryHighTalentStoneNumText.m_num, talentMain.jeroldStoneNumText.m_num)
				end
			end, function()
				return
			end, false)
		end)
		UILayerCtrl.OnButtonClick("talentAdd")
	end
end

function PlayerInfoCtrl.SetTalentInfo(newLevel, playAudio)
	if talentDetail.currentTalent then
		if playAudio then
			AudioCtrl.SetUIAudio("player_info/talent_load")
		end

		talentDetail.currentTalentLevel = newLevel

		for _i = 1, 5 do
			talentDetailPointList[_i].desBtnLight:SetActive(false)
		end

		talentDetailPointList[newLevel].desBtnLight:SetActive(true)

		talentDetail.NumText.num = newLevel

		talentDetail.NumText:SetContent(talentDetail.NumText.num .. "/" .. talentDetail.NumText.numMax)

		local talentdata = talentDetail.currentTalent:GetTalentData()
		local LevelList = talentDetail.currentTalent:GetStoneLevelList()
		local level = talentDetail.currentTalent:GetTalentLevel()

		if newLevel < 1 then
			talentDetail.NextDes:SetContent("")
			talentDetail.NextDes.gameObject:SetActive(false)
		else
			local ttvalue = talentdata.TextValue + talentdata.TextValueAdd * (newLevel - 1)
			local tttext = ""

			if LS_Setting.isJoystickConnected then
				tttext = talentdata.TalentText
			elseif Platform == PlatformType.MAC or Platform == PlatformType.PC then
				tttext = talentdata.TalentTextKeyboard
			else
				tttext = talentdata.TalentText
			end

			local retContent = PlayerInfoCtrl.ConvertTalentText(tttext, ttvalue, talentdata.HeroId)

			talentDetail.NextDes.gameObject:SetActive(true)

			if talentdata.TalentId == 17103 then
				talentDetail.NextDes:SetFontSize(18)
			else
				talentDetail.NextDes:SetFontSize(20)
			end

			talentDetail.NextDes:SetContent(retContent)
		end

		talentDetail.Des.gameObject:SetActive(true)

		if level < newLevel then
			if #LevelList == 0 then
				talentDetail.Des:SetContent("")
			else
				talentDetail.needItemText = "<quad name=" .. "item" .. MS_ItemData.TalentTextIconList[tonumber(LevelList[newLevel])] .. " size=20 width=2 />" .. string.gsub(MS_ItemData.GetItemName(MS_ItemData.ItemID_TalentAddList[tonumber(LevelList[newLevel])]), " ", " ")

				local reText = string.gsub(GameText.UI_PLAYERINFO_TALENT_REQUIRE, " ", " ") .. talentDetail.needItemText

				talentDetail.Des:SetContent(reText)
			end

			if talentdata.HeroId == MS_HeroData.ArcadeHeroId then
				local partIndex = math.floor(talentdata.TalentPos / 100)

				if partIndex == 4 then
					talentDetail.NextDes:SetContent("")
					talentDetail.NextDes.gameObject:SetActive(false)
				end
			end
		else
			talentDetail.Des:SetContent(GameText.UI_PLAYERINFO_TALENT_ADDED)
		end

		talentDetail.contentLine:SetActive(talentDetail.Des.gameObject.activeSelf and talentDetail.NextDes.gameObject.activeSelf)
	end
end

function PlayerInfoCtrl.LoadTrophy()
	for i = 1, MS_ItemData.TrophyMax do
		local trophy = FS_UserData.trophy:GetTrophy(i)

		if trophy ~= nil then
			if booty.SlotList[i].item == nil then
				local sprite = XObjectPool.GetIcon("item" .. trophy.itemIcon)

				booty.SlotList[i].image:SetSprite(sprite)
				booty.SlotList[i].image.gameObject:SetActive(true)

				booty.SlotList[i].item = trophy
			else
				local sprite = XObjectPool.GetIcon("item" .. trophy.itemIcon)

				booty.SlotList[i].image:SetSprite(sprite)
				booty.SlotList[i].image.gameObject:SetActive(true)

				booty.SlotList[i].item = trophy
			end
		else
			booty.SlotList[i].item = nil

			booty.SlotList[i].image.gameObject:SetActive(false)
		end
	end

	PlayerInfoCtrl.RefreshTrophyBonus()
end

function PlayerInfoCtrl.RefreshTrophyBonus()
	local PropertyList = FS_UserData.trophy:GetResult()
	local st = ""
	local st2 = ""
	local stNum = ""
	local stNum2 = ""
	local propertyCount = 0
	local tempList = {}

	for i = 1, #PropertyList do
		if PropertyList[i] > 0 then
			tempList[i] = PropertyList[i]
		end
	end

	local tempCount = 0

	for k, v in pairs(tempList) do
		tempCount = tempCount + 1

		if MathHelper.Mod(tempCount, 2) == 0 then
			st2 = st2 .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[k] .. "\n"

			if k == MS_HeroData.Property.CritRate or k == MS_HeroData.Property.HumanAdd or k == MS_HeroData.Property.BeastAdd or k == MS_HeroData.Property.SendrilAdd then
				stNum2 = stNum2 .. "+" .. PropertyList[k] / 10 .. "%" .. "\n"
			elseif k == MS_HeroData.Property.CritDamage then
				stNum2 = stNum2 .. "+" .. PropertyList[k] / 10 .. "%" .. "\n"
			else
				stNum2 = stNum2 .. "+" .. PropertyList[k] .. "\n"
			end
		else
			st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[k] .. "\n"

			if k == MS_HeroData.Property.CritRate or k == MS_HeroData.Property.HumanAdd or k == MS_HeroData.Property.BeastAdd or k == MS_HeroData.Property.SendrilAdd then
				stNum = stNum .. "+" .. PropertyList[k] / 10 .. "%" .. "\n"
			elseif k == MS_HeroData.Property.CritDamage then
				stNum = stNum .. "+" .. PropertyList[k] / 10 .. "%" .. "\n"
			else
				stNum = stNum .. "+" .. PropertyList[k] .. "\n"
			end

			propertyCount = propertyCount + 1
		end
	end

	for i = 1, 8 do
		if i < propertyCount + 1 then
			booty.totalPropertyPanelLineGroup[i]:SetActive(true)
		else
			booty.totalPropertyPanelLineGroup[i]:SetActive(false)
		end
	end

	booty.totalPropertyNumText:SetContent(stNum)
	booty.totalPropertyNumText2:SetContent(stNum2)
	booty.totalPropertyText:SetContent(st)
	booty.totalPropertyText2:SetContent(st2)
end

function PlayerInfoCtrl.SetTrophyDescription(item)
	if item then
		local sprite = XObjectPool.GetIcon("item" .. item.itemIcon)

		booty.itemSelectPanelImage:SetSprite(sprite)
		booty.DeleteBtn.gameObject:SetActive(true)
		booty.LockGroup:SetActive(true)
		gamePadIcon.lock_r3:SetActive(true)
		keyboardIcon.lock_r3:SetActive(true)
		gamePadIcon.delete_y:SetActive(true)
		keyboardIcon.delete_y:SetActive(true)
		PlayerInfoCtrl.SetTrophyLockBtn(item:GetIsLock())
		booty.itemSelectPanelImage.gameObject:SetActive(true)
		booty.itemSelectPanelItemName.gameObject:SetActive(true)
		booty.itemSelectPanelItemDes.gameObject:SetActive(true)
		booty.itemSelectPanelItemIntroduce.gameObject:SetActive(true)
		booty.lineOffset:SetActive(true)
		booty.itemSelectPanelItemIntroduce:SetContent(item:GetItemData().Description)
		booty.itemSelectPanelItemName:SetContent(item:GetTrophyName())
		booty.itemSelectPanelItemDes:SetContent(PlayerInfoCtrl.GetTrophyDescription(item))
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupRT)
		booty.triangleGroup:SetActive(booty.GetPreferredHeightFunc() > booty.contentHeight + 0.3)

		booty.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.contentGroupScroll.scrollRectCom.normalizedPosition.x, 0)
		booty.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupScrollRT)
	else
		booty.LockGroup:SetActive(false)
		booty.DeleteBtn.gameObject:SetActive(false)
		gamePadIcon.lock_r3:SetActive(false)
		keyboardIcon.lock_r3:SetActive(false)
		gamePadIcon.delete_y:SetActive(false)
		keyboardIcon.delete_y:SetActive(false)
		booty.itemSelectPanelImage.gameObject:SetActive(false)
		booty.itemSelectPanelItemName.gameObject:SetActive(false)
		booty.itemSelectPanelItemDes.gameObject:SetActive(false)
		booty.itemSelectPanelItemIntroduce.gameObject:SetActive(false)
		booty.equipBtn.gameObject:SetActive(false)
		booty.removeBtn.gameObject:SetActive(false)
		booty.lineOffset:SetActive(false)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupRT)
		booty.triangleGroup:SetActive(false)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupScrollRT)
	end
end

function PlayerInfoCtrl.RefreshTrophyItemList(TrophyType, LastIndex)
	booty.loadFinish = false
	booty.currentTrophyListType = TrophyType

	booty.TrophyCount:SetContent(FS_UserData.GetTrophyCount() .. "/" .. MS_ItemData.TrophyCapacity)

	booty.SelectedItem = nil

	booty.itemSelectPanelImage.gameObject:SetActive(false)
	booty.itemSelectPanelItemName:SetContent("")
	booty.itemSelectPanelItemDes:SetContent("")
	booty.removeBtn.gameObject:SetActive(false)

	for i = 1, 6 do
		booty.SlotList[i]:SetSelectedLight(false)
	end

	booty.SlotList[booty.SelectedSlot]:SetSelectedLight(true)

	local TrophyList = PlayerInfoCtrl.GetUITrophyListByType(TrophyType)
	local _trophy = FS_UserData.trophy:GetTrophy(booty.SelectedSlot)
	local _anotherTrophy = FS_UserData.trophy:GetAnotherSameTypeTrophy(booty.SelectedSlot)

	if _trophy ~= nil then
		table.insert(TrophyList, 1, _trophy)

		if _anotherTrophy ~= nil then
			table.insert(TrophyList, 2, _anotherTrophy)
		end
	elseif _anotherTrophy ~= nil then
		table.insert(TrophyList, 1, _anotherTrophy)
	end

	booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, 1)

	if #TrophyList < 1 then
		booty.loadFinish = true
	end

	function booty.itemLoader.loadCallback(index, com, data)
		local img = com:GetGameObject("Grid_Image")
		local currentMark = com:GetGameObject("Current_Image")

		currentMark:SetActive(false)

		if TrophyList[index] ~= nil and (TrophyList[index] == _trophy or TrophyList[index] == _anotherTrophy) then
			currentMark:SetActive(true)
		end

		com.img = XImage:new(img)
		com.currentMark = currentMark
		com.itemGO = img.gameObject
		com.newLight = com:GetGameObject("Grid_newLight")

		local _btn = com:GetButton("Grid")

		_btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		_btn:SetParentScroll(booty.itemScroll)

		com.btn = _btn

		if TrophyList[index] == nil then
			com.itemGO:SetActive(false)

			com.id = 0
			com.num = 0

			com.newLight:SetActive(false)
			com.btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				booty.SelectedItem = nil

				booty.itemSelectPanelImage.gameObject:SetActive(false)
				booty.itemSelectPanelItemName.gameObject:SetActive(false)
				booty.itemSelectPanelItemDes.gameObject:SetActive(false)
				booty.itemSelectPanelItemIntroduce.gameObject:SetActive(false)
				booty.equipBtn.gameObject:SetActive(false)
				booty.removeBtn.gameObject:SetActive(false)
				gamePadIcon.lock_r3:SetActive(false)
				keyboardIcon.lock_r3:SetActive(false)
				gamePadIcon.delete_y:SetActive(false)
				keyboardIcon.delete_y:SetActive(false)
				booty.LockGroup:SetActive(false)
				booty.DeleteBtn.gameObject:SetActive(false)
				booty.lineOffset:SetActive(false)
				UILayerCtrl.OnSelect("BootyItemBtn" .. index)
				com.btn:SetSelectedLight(true)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupRT)
				booty.triangleGroup:SetActive(false)
			end)
		else
			com.itemGO:SetActive(true)

			local sprite = XObjectPool.GetIcon("item" .. TrophyList[index].itemIcon)

			com.img:SetSprite(sprite)

			com.id = TrophyList[index].itemId
			com.num = TrophyList[index].itemNum

			com.newLight:SetActive(TrophyList[index]:IsNew())
			com.btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				booty.LastIndex = index
				booty.SelectedItem = TrophyList[index]

				if TrophyList[index] ~= nil and TrophyList[index] == _trophy then
					booty.removeBtn.gameObject:SetActive(true)
				else
					booty.removeBtn.gameObject:SetActive(false)
				end

				local sprite = XObjectPool.GetIcon("item" .. booty.SelectedItem.itemIcon)

				booty.SelectedItem:SetOld()
				gamePadIcon.lock_r3:SetActive(true)
				keyboardIcon.lock_r3:SetActive(true)
				gamePadIcon.delete_y:SetActive(true)
				keyboardIcon.delete_y:SetActive(true)
				booty.LockGroup:SetActive(true)
				booty.DeleteBtn.gameObject:SetActive(true)
				PlayerInfoCtrl.SetTrophyLockBtn(booty.SelectedItem:GetIsLock())
				PlayerInfoCtrl.RefreshTrophyNewLight()
				com.newLight:SetActive(false)
				booty.itemSelectPanelImage:SetSprite(sprite)
				booty.itemSelectPanelImage.gameObject:SetActive(true)
				booty.itemSelectPanelItemName.gameObject:SetActive(true)
				booty.itemSelectPanelItemDes.gameObject:SetActive(true)
				booty.itemSelectPanelItemIntroduce.gameObject:SetActive(true)
				booty.lineOffset:SetActive(true)
				booty.equipBtn.gameObject:SetActive(true)
				booty.itemSelectPanelItemIntroduce:SetContent(booty.SelectedItem:GetItemData().Description)
				booty.itemSelectPanelItemName:SetContent(booty.SelectedItem:GetTrophyName())
				booty.itemSelectPanelItemDes:SetContent(PlayerInfoCtrl.GetTrophyDescription(booty.SelectedItem))
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupRT)
				booty.triangleGroup:SetActive(booty.GetPreferredHeightFunc() > booty.contentHeight + 0.3)

				booty.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

				UILayerCtrl.OnSelect("BootyItemBtn" .. index)
				com.btn:SetSelectedLight(true)
			end)
		end

		UILayerCtrl.AddButton("PlayerInfoBooty", "BootyItemBtn" .. index, com.btn)

		if index > trophyItemColumn then
			com.btn:SetAdjacent(XButton.Adjacent.UP, "BootyItemBtn" .. index - trophyItemColumn)
		end

		if index % trophyItemColumn == 0 then
			com.btn:SetAdjacent(XButton.Adjacent.RIGHT, "BootyItemBtn" .. index - (trophyItemColumn - 1))
		else
			com.btn:SetAdjacent(XButton.Adjacent.RIGHT, "BootyItemBtn" .. index + 1)
		end

		if (index - 1) % trophyItemColumn == 0 then
			com.btn:SetAdjacent(XButton.Adjacent.LEFT, "BootyItemBtn" .. index + (trophyItemColumn - 1))
		else
			com.btn:SetAdjacent(XButton.Adjacent.LEFT, "BootyItemBtn" .. index - 1)
		end

		if index + trophyItemColumn < booty.itemLoader.loadCount + 1 then
			com.btn:SetAdjacent(XButton.Adjacent.DOWN, "BootyItemBtn" .. index + trophyItemColumn)
		end

		if index == booty.itemLoader.loadCount then
			if booty.itemLoader.loadCount > 0 then
				UILayerCtrl.OnSelect("BootyItemBtn1")
			end

			UILayerCtrl.OnCursorClickMute()
			booty.SlotList[booty.SelectedSlot]:SetNormal()
			booty.SlotList[booty.SelectedSlot]:SetSelectedLight(true)

			booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, 1)

			if LastIndex and LastIndex > 1 then
				if LastIndex > #TrophyList then
					LastIndex = #TrophyList
				end

				UILayerCtrl.OnSelect("BootyItemBtn" .. LastIndex)

				local lastRow = Mathf.Ceil(LastIndex / trophyItemColumn)
				local maxRow = Mathf.Ceil(booty.itemLoader.loadNum / trophyItemColumn)

				if lastRow > trophyItemRow then
					local offset = lastRow - trophyItemRow

					UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.itemLoaderRT)

					booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, booty.itemScroll.scrollRectCom.normalizedPosition.y - offset / (maxRow - trophyItemRow))
				end

				UILayerCtrl.OnCursorClickMute()
			end

			local layerName = UILayerCtrl.GetCurrentLayerName()

			if layerName == "PlayerInfoBooty" and LastIndex == nil then
				UILayerCtrl.Pop()
				UILayerCtrl.Push("PlayerInfoBooty", "BootyItemBtn1")
			end

			booty.loadFinish = true
		end

		table.insert(booty.comList, com)
	end

	local loadNum

	if #TrophyList < trophyItemRow * trophyItemColumn + 1 then
		loadNum = trophyItemRow * trophyItemColumn
	else
		loadNum = math.ceil(#TrophyList / trophyItemColumn) * trophyItemColumn
	end

	booty.itemLoader.loadNum = loadNum

	if loadNum > booty.itemLoader.loadCount then
		booty.itemLoader.loadCount = loadNum
		booty.comList = {}

		booty.itemLoader:Load()
	else
		for k, v in pairs(booty.comList) do
			local itemBtn = v.btn

			v.gameObject:SetActive(true)
			v.currentMark:SetActive(false)

			if TrophyList[k] ~= nil and (TrophyList[k] == _trophy or TrophyList[k] == _anotherTrophy) then
				v.currentMark:SetActive(true)
			end

			if TrophyList[k] == nil then
				v.itemGO:SetActive(false)

				v.id = 0
				v.num = 0

				v.newLight:SetActive(false)
				itemBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					booty.SelectedItem = nil

					booty.itemSelectPanelImage.gameObject:SetActive(false)
					booty.itemSelectPanelItemName.gameObject:SetActive(false)
					booty.itemSelectPanelItemDes.gameObject:SetActive(false)
					booty.itemSelectPanelItemIntroduce.gameObject:SetActive(false)
					booty.equipBtn.gameObject:SetActive(false)
					booty.removeBtn.gameObject:SetActive(false)
					booty.LockGroup:SetActive(false)
					gamePadIcon.lock_r3:SetActive(false)
					keyboardIcon.lock_r3:SetActive(false)
					gamePadIcon.delete_y:SetActive(false)
					keyboardIcon.delete_y:SetActive(false)
					booty.DeleteBtn.gameObject:SetActive(false)
					booty.lineOffset:SetActive(false)
					UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupRT)
					booty.triangleGroup:SetActive(false)
					UILayerCtrl.OnSelect("BootyItemBtn" .. k)
					itemBtn:SetSelectedLight(true)
				end)
			else
				v.itemGO:SetActive(true)

				local sprite = XObjectPool.GetIcon("item" .. TrophyList[k].itemIcon)

				v.img:SetSprite(sprite)

				v.id = TrophyList[k].itemId
				v.num = TrophyList[k].itemNum

				v.newLight:SetActive(TrophyList[k]:IsNew())
				itemBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					booty.LastIndex = k
					booty.SelectedItem = TrophyList[k]

					if TrophyList[k] ~= nil and TrophyList[k] == _trophy then
						booty.removeBtn.gameObject:SetActive(true)
					else
						booty.removeBtn.gameObject:SetActive(false)
					end

					local sprite = XObjectPool.GetIcon("item" .. booty.SelectedItem.itemIcon)

					booty.SelectedItem:SetOld()
					PlayerInfoCtrl.RefreshTrophyNewLight()
					booty.LockGroup:SetActive(true)
					booty.DeleteBtn.gameObject:SetActive(true)
					gamePadIcon.lock_r3:SetActive(true)
					keyboardIcon.lock_r3:SetActive(true)
					gamePadIcon.delete_y:SetActive(true)
					keyboardIcon.delete_y:SetActive(true)
					PlayerInfoCtrl.SetTrophyLockBtn(booty.SelectedItem:GetIsLock())
					v.newLight:SetActive(false)
					booty.itemSelectPanelImage:SetSprite(sprite)
					booty.itemSelectPanelImage.gameObject:SetActive(true)
					booty.itemSelectPanelItemName.gameObject:SetActive(true)
					booty.itemSelectPanelItemDes.gameObject:SetActive(true)
					booty.itemSelectPanelItemIntroduce.gameObject:SetActive(true)
					booty.lineOffset:SetActive(true)
					booty.equipBtn.gameObject:SetActive(true)
					booty.itemSelectPanelItemIntroduce:SetContent(booty.SelectedItem:GetItemData().Description)
					booty.itemSelectPanelItemName:SetContent(booty.SelectedItem:GetTrophyName())
					booty.itemSelectPanelItemDes:SetContent(PlayerInfoCtrl.GetTrophyDescription(booty.SelectedItem))
					UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.contentGroupRT)
					booty.triangleGroup:SetActive(booty.GetPreferredHeightFunc() > booty.contentHeight + 0.3)

					booty.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

					UILayerCtrl.OnSelect("BootyItemBtn" .. k)
					itemBtn:SetSelectedLight(true)
				end)
			end

			if k < loadNum - (trophyItemColumn - 1) then
				v.btn:SetAdjacent(XButton.Adjacent.DOWN, "BootyItemBtn" .. k + trophyItemColumn)
			else
				v.btn:SetAdjacent(XButton.Adjacent.DOWN, nil)
			end

			if loadNum < k then
				v.gameObject:SetActive(false)
			end
		end

		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoBooty" then
			booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, 1)

			UILayerCtrl.Pop()
			UILayerCtrl.Push("PlayerInfoBooty", "BootyItemBtn1")
		end

		UILayerCtrl.OnSelect("BootyItemBtn1")

		if LastIndex and LastIndex > 1 then
			if LastIndex > #TrophyList then
				LastIndex = #TrophyList
			end

			UILayerCtrl.OnSelect("BootyItemBtn" .. LastIndex)

			local lastRow = Mathf.Ceil(LastIndex / trophyItemColumn)
			local maxRow = Mathf.Ceil(booty.itemLoader.loadNum / trophyItemColumn)

			if lastRow > trophyItemRow then
				local offset = lastRow - trophyItemRow

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(booty.itemLoaderRT)

				booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, booty.itemScroll.scrollRectCom.normalizedPosition.y - offset / (maxRow - trophyItemRow))
			end
		end

		UILayerCtrl.OnCursorClickMute()
		booty.SlotList[booty.SelectedSlot]:SetNormal()
		booty.SlotList[booty.SelectedSlot]:SetSelectedLight(true)

		booty.loadFinish = true
	end
end

function PlayerInfoCtrl.SetTrophyLockBtn(isLock)
	if isLock then
		booty.LockOnBtn.gameObject:SetActive(true)
		booty.LockOffBtn.gameObject:SetActive(false)
		booty.BottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKOFF)
		booty.KeyboardBottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKOFF)
	else
		booty.LockOnBtn.gameObject:SetActive(false)
		booty.LockOffBtn.gameObject:SetActive(true)
		booty.BottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKON)
		booty.KeyboardBottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKON)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
end

function PlayerInfoCtrl.SetAlchemyLockBtn(isLock)
	if isLock then
		alchemy.ItemSelect.LockOnBtn.gameObject:SetActive(true)
		alchemy.ItemSelect.LockOffBtn.gameObject:SetActive(false)
		booty.BottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKOFF)
		booty.KeyboardBottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKOFF)
	else
		alchemy.ItemSelect.LockOnBtn.gameObject:SetActive(false)
		alchemy.ItemSelect.LockOffBtn.gameObject:SetActive(true)
		booty.BottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKON)
		booty.KeyboardBottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKON)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
end

function PlayerInfoCtrl.OpenTrophyItemPanel(bool)
	if bool then
		booty.totalPropertyPanel:SetActive(false)
		booty.itemSelectPanel:SetActive(true)
		booty.removeBtn.gameObject:SetActive(true)
		booty.equipBtn.gameObject:SetActive(true)
	else
		booty.totalPropertyPanel:SetActive(true)
		booty.itemSelectPanel:SetActive(false)
		booty.removeBtn.gameObject:SetActive(false)
		booty.equipBtn.gameObject:SetActive(false)
	end
end

function PlayerInfoCtrl.SetTrophyTitle(type)
	for k, v in pairs(booty.classTitle) do
		v:SetActive(false)
	end

	booty.classTitle[type]:SetActive(true)
end

function PlayerInfoCtrl.OnSelectTrophyItem()
	return
end

function PlayerInfoCtrl.SetTrophyMask(index)
	for k, v in pairs(booty.SlotList) do
		v.mask:SetActive(false)
	end

	if index ~= 0 then
		booty.SlotList[index].mask:SetActive(true)
	end
end

function PlayerInfoCtrl.GetTrophyDescription(item)
	local _subProperty = item:GetSubProperty()
	local _mainPropertyList = item:GetMainPropertyList()
	local quality = item:GetQuality()
	local st = ""

	if item:IsRandomProperty() then
		local typeList = item:GetRandomPropertyTypeList()
		local valueList = item:GetRandomPropertyValueList()

		for i = 1, 4 do
			if typeList[i] ~= 0 then
				st = st .. MS_TrophyProperty.GetTrophyPropertyText(typeList[i], valueList[i])
			end
		end
	else
		for k, v in pairs(_mainPropertyList) do
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(v, quality)

			st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
		end
	end

	if _subProperty ~= 0 then
		local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_subProperty, quality)

		st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
	end

	if string.len(st) > 1 then
		st = string.sub(st, 1, string.len(st) - 1)
	end

	return st
end

function PlayerInfoCtrl.AlchemyLevelUpTween()
	if property.finalLevel > alchemy.ExpLevelText.Level then
		local speed = property.finalLevel - alchemy.ExpLevelText.Level

		alchemy.ExpPreviewSlider.gameObject:SetActive(false)
		alchemy.ExpPreviewSlider.gameObject:SetActive(true)
		alchemy.ExpPreviewSliderXtween:Stop()

		alchemy.ExpPreviewSliderCanvasGroup.alpha = 1

		PlayerInfoCtrl.AlchemyExpBarTween(1, (1 - alchemy.ExpMainBar.fillAmount) / speed, function()
			if property.finalLevel > alchemy.ExpLevelText.Level then
				alchemy.ExpLevelText.Level = alchemy.ExpLevelText.Level + 1

				alchemy.ExpLevelText:SetContent(alchemy.ExpLevelText.Level)
			end

			alchemy.ExpLevelUp:SetActive(false)
			alchemy.ExpLevelUp:SetActive(true)
			AudioCtrl.SetUIAudio("player_info/level_up")

			alchemy.ExpLevelText.Percent = 0

			PlayerInfoCtrl.AlchemySetExpBar(0)
			PlayerInfoCtrl.AlchemyLevelUpTween()
		end)
	elseif property.finalPercent > alchemy.ExpLevelText.Percent then
		if TimeHelper.getNowTimeNoScale() - alchemy.ExpPreviewSliderLastTime > 1 then
			alchemy.ExpPreviewSlider.gameObject:SetActive(false)
			alchemy.ExpPreviewSlider.gameObject:SetActive(true)
			alchemy.ExpPreviewSliderXtween:Stop()

			alchemy.ExpPreviewSliderCanvasGroup.alpha = 1
			alchemy.ExpPreviewSliderLastTime = TimeHelper.getNowTimeNoScale()
		end

		local tempPercent = property.finalPercent
		local tempSpeed = tempPercent - alchemy.ExpLevelText.Percent

		tempSpeed = 0.1

		PlayerInfoCtrl.AlchemyExpBarTween(tempPercent, tempSpeed, function()
			alchemy.ExpLevelText.Percent = tempPercent

			PlayerInfoCtrl.AlchemyLevelUpTween()
		end)
	end
end

function PlayerInfoCtrl.AlchemySetExpBar(percent)
	alchemy.ExpPreviewSlider.value = percent
	alchemy.ExpMainBar.fillAmount = percent
	alchemy.ExpMainBarLight.transform.localPosition = Vector3.New(percent * 400 - 200, 0, 0)
end

function PlayerInfoCtrl.AlchemySetCurrentExpValue(_herodata)
	local expTotal = MS_HeroExp.GetHeroRequireExp(_herodata.level + 1)

	alchemy.ExpNumText:SetContent("<color=#DBDBDBFF>" .. _herodata.exp .. "</color>" .. "/" .. expTotal)
end

function PlayerInfoCtrl.AlchemyExpBarTween(percent, time, finishfunc)
	local tbl1 = {
		fillAmount = percent
	}

	alchemy.ExpMainBarTween:MoveTo(tbl1, time)
	alchemy.ExpMainBarTween:Start()

	local tbl2 = {
		localPosition = Vector3.New(percent * 400 - 200, 0, 0)
	}

	alchemy.ExpMainBarLightTween:MoveTo(tbl2, time)
	alchemy.ExpMainBarLightTween:Start()

	local tbl3 = {
		value = percent
	}

	alchemy.ExpPreviewSliderTween:MoveTo(tbl3, time)
	alchemy.ExpPreviewSliderTween:OnComplete(function()
		finishfunc()
		alchemy.ExpPreviewSliderXtween:Play()
	end)
	alchemy.ExpPreviewSliderTween:Start()
end

function PlayerInfoCtrl.AlchemyLevelUpResult(heroId)
	local heroData = FS_UserData.heroList:GetHero(heroId)

	property.attributePointText:SetContent(heroData.attribPoints)
	property.attributePointAnimationGO:SetActive(heroData.attribPoints > 0)

	property.attributePoint = heroData.attribPoints

	local expTotal = MS_HeroExp.GetHeroRequireExp(heroData.level + 1)

	property.mainLevelText:SetContent(heroData.level)

	property.expBarSlider.value = heroData.exp / expTotal

	property.expBarText:SetContent(heroData.exp .. "/" .. expTotal)
	PlayerInfoCtrl.AlchemySetCurrentExpValue(heroData)

	property.finalLevel = heroData.level
	property.finalPercent = heroData.exp / expTotal

	AudioCtrl.SetUIAudio("secrifice")
	PlayerInfoCtrl.AlchemyLevelUpTween()
end

function PlayerInfoCtrl.OnTaskTabCreate()
	task = {}
	task.MainComList = {}
	task.BranchComList = {}
	task.GoalComList = {}
	task.GoalRow = 5
	task.MainRow = 6
	task.BranchRow = 8
	task.LastMainTitleBtnName = "MainTitle1"
	task.LastBranchTitleBtnName = "BranchTitle1"
	task.LastDocumentTitleBtnName = "DocumentTitle1"
	task.MaxMainTitleBtnName = "MainTitle1"
	task.MaxBranchTitleBtnName = "BranchTitle1"
	task.MaxDocumentTitleBtnName = "DocumentTitle1"
	task.currentGoalName = "Goal1"
	task.CurrentType = 0
	task.DetailPanel = {}
	task.DetailPanel.gameObject = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg")
	task.MainScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_MainTitleScroll")
	task.MainScroll = XScrollRect:new(task.MainScroll)
	task.BranchScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_BranchTitleScroll")
	task.BranchScroll = XScrollRect:new(task.BranchScroll)
	task.GoalScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_GoalScroll")
	task.GoalScroll = XScrollRect:new(task.GoalScroll)
	task.MainTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_MainTabBtn")

	task.MainTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	task.MainTabBtn:SetHighlightIndependent(true)
	task.MainTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		task.MainScroll.gameObject:SetActive(true)
		task.BranchScroll.gameObject:SetActive(false)
		UILayerCtrl.OnSelect("MainTabBtn")

		if task.CurrentType ~= MS_UIQuest.QuestType.MainTitle then
			task.CurrentType = MS_UIQuest.QuestType.MainTitle
			task.LastMainTitleBtnName = "MainTitle1"

			task.DetailPanel.gameObject:SetActive(false)
			PlayerInfoCtrl.LoadMainTask()
		end
	end)
	task.MainTabBtn:SetAdjacent(XButton.Adjacent.UP, "DocumentTabBtn")
	task.MainTabBtn:SetAdjacent(XButton.Adjacent.DOWN, "BranchTabBtn")
	UILayerCtrl.AddButton("PlayerInfoTask", "MainTabBtn", task.MainTabBtn)

	task.BranchTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_BranchTabBtn")

	task.BranchTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	task.BranchTabBtn:SetHighlightIndependent(true)
	task.BranchTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		task.MainScroll.gameObject:SetActive(false)
		task.BranchScroll.gameObject:SetActive(true)
		UILayerCtrl.OnSelect("BranchTabBtn")

		if task.CurrentType ~= MS_UIQuest.QuestType.BranchTitle then
			task.CurrentType = MS_UIQuest.QuestType.BranchTitle
			task.LastBranchTitleBtnName = "BranchTitle1"

			task.DetailPanel.gameObject:SetActive(false)
			PlayerInfoCtrl.LoadBranchTask()
		end
	end)
	task.BranchTabBtn:SetAdjacent(XButton.Adjacent.UP, "MainTabBtn")
	task.BranchTabBtn:SetAdjacent(XButton.Adjacent.DOWN, "DocumentTabBtn")
	UILayerCtrl.AddButton("PlayerInfoTask", "BranchTabBtn", task.BranchTabBtn)

	task.DocumentTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_DocumentTabBtn")

	task.DocumentTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	task.DocumentTabBtn:SetHighlightIndependent(true)
	task.DocumentTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		task.MainScroll.gameObject:SetActive(false)
		task.BranchScroll.gameObject:SetActive(true)
		UILayerCtrl.OnSelect("DocumentTabBtn")

		if task.CurrentType ~= MS_UIQuest.QuestType.DocumentTitle then
			task.CurrentType = MS_UIQuest.QuestType.DocumentTitle
			task.LastDocumentTitleBtnName = "DocumentTitle1"

			task.DetailPanel.gameObject:SetActive(false)
			PlayerInfoCtrl.LoadDocument()
		end
	end)
	task.DocumentTabBtn:SetAdjacent(XButton.Adjacent.UP, "BranchTabBtn")
	task.DocumentTabBtn:SetAdjacent(XButton.Adjacent.DOWN, "MainTabBtn")
	UILayerCtrl.AddButton("PlayerInfoTask", "DocumentTabBtn", task.DocumentTabBtn)

	task.MainLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_MainTitleScroll_ViewPort_Content")
	task.MainLoader.RTF = task.MainLoader.gameObject:GetComponent("RectTransform")
	task.BranchLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_LeftBg_BranchTitleScroll_ViewPort_Content")
	task.BranchLoader.RTF = task.BranchLoader.gameObject:GetComponent("RectTransform")
	task.GoalLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_GoalScroll_ViewPort_Content")
	task.GoalLoader.RTF = task.GoalLoader.gameObject:GetComponent("RectTransform")

	task.MainLoader:SetCacheNumMax(1, 8)
	task.BranchLoader:SetCacheNumMax(1, 0)
	task.GoalLoader:SetCacheNumMax(1, 20)

	task.DetailPanel.taskDescriptionText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_ContentGroup_Viewport_Content")
	task.contentHeight = 195
	task.oneLineHeight = 23
	task.contentGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_ContentGroup")
	task.triangleGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_ContentGroup_triangleGroup")
	task.taskListTitle = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_Text")
	task.taskContentTitle = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_TaskTab_ContentBg_Text1")

	task.triangleGroup:SetActive(false)

	task.contentGroupRT = task.contentGroup.transform:Find("Viewport"):Find("Content"):GetComponent("RectTransform")
	task.contentGroupScroll = XScrollRect:new(task.contentGroup)

	function task.GetPreferredHeightFunc()
		return task.DetailPanel.taskDescriptionText.textCom.preferredHeight
	end
end

function PlayerInfoCtrl.LoadMainTask()
	task.taskListTitle:SetContent(GameText.UI_PLAYERINFO_TASK_TASK_LIST)
	task.taskContentTitle:SetContent(GameText.UI_PLAYERINFO_TASK_TASK_DES)

	task.MainComList = {}

	local mainTitleList = MS_UIQuest.GetMainQuestTitleAll()

	mainTitleList = PlayerInfoCtrl.CheckTaskQuest(mainTitleList)
	task.MainLoader.loadCount = #mainTitleList

	function task.MainLoader.loadCallback(index, com, data)
		table.insert(task.MainComList, com)

		com.RTF = com.gameObject:GetComponent("RectTransform")
		com.RTF.sizeDelta = Vector2.New(420, 90)

		local titleBtn = com:GetButton("TaskMainTitleBtn")

		titleBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
		titleBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for k, v in pairs(task.MainComList) do
				v.titleBtn:SetCommonHighlighted(false)
			end

			task.lastTitleBtn = titleBtn
			task.LastMainTitleBtnName = "MainTitle" .. index

			UILayerCtrl.OnSelect("MainTitle" .. index)
			PlayerInfoCtrl.LoadTaskDetail(mainTitleList[index], titleBtn)
			titleBtn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.MainLoader.RTF)
		end)
		UILayerCtrl.AddButton("PlayerInfoTask", "MainTitle" .. index, titleBtn)

		if index == 1 then
			titleBtn:SetAdjacent(XButton.Adjacent.UP, "MainTitle" .. task.MainLoader.loadCount)
		else
			titleBtn:SetAdjacent(XButton.Adjacent.UP, "MainTitle" .. index - 1)
		end

		titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "MainTitle" .. index + 1)
		titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "MainTabBtn")
		titleBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.currentGoalName)
		titleBtn:SetParentScroll(task.MainScroll)

		com.titleBtn = titleBtn
		com.buttonImage = XImage:new(titleBtn.gameObject)

		local _sprite = XObjectPool.GetIcon("taskTitle" .. mainTitleList[index].QuestId)

		if _sprite then
			com.buttonImage:SetSprite(_sprite)
		end

		local lightSprite = XObjectPool.GetIcon("taskTitleLight" .. mainTitleList[index].QuestId)

		titleBtn:SetHighlightedAndPressedSprite(lightSprite)

		local titleText = com:GetText("TaskMainTitleBtn_Text")

		if mainTitleList[index].isComplete then
			com.buttonImage:SetGray(false)
			com.buttonImage:SetGray(true)
			titleText:SetColor(0.5098039215686274, 0.5098039215686274, 0.5098039215686274, 1)
			titleText:SetContent(mainTitleList[index].Name .. GameText.UI_PLAYERINFO_TASK_COMPLETE)
		else
			com.buttonImage:SetGray(true)
			com.buttonImage:SetGray(false)
			titleText:SetColor(1, 1, 1, 1)
			titleText:SetContent(mainTitleList[index].Name)
		end

		if index == task.MainLoader.loadCount then
			titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "MainTitle1")
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.MainLoader.RTF)

			task.MainScroll.scrollRectCom.normalizedPosition = Vector2.New(task.MainScroll.scrollRectCom.normalizedPosition.x, 0)
			task.MaxMainTitleBtnName = "MainTitle" .. index

			task.MainTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.MaxMainTitleBtnName)
			titleBtn:OnDownMute(nil, nil)
			titleBtn:OnClick(nil, nil)
			UILayerCtrl.OnSelect("MainTabBtn")

			task.LastMainTitleBtnName = "MainTitle" .. index

			titleBtn:SetCommonHighlighted(true)
		end
	end

	task.MainLoader:Load()
end

function PlayerInfoCtrl.LoadBranchTask()
	task.taskListTitle:SetContent(GameText.UI_PLAYERINFO_TASK_TASK_LIST)
	task.taskContentTitle:SetContent(GameText.UI_PLAYERINFO_TASK_TASK_DES)

	task.BranchComList = {}

	local branchTitleList = MS_UIQuest.GetBranchQuestTitleAll()

	branchTitleList = PlayerInfoCtrl.CheckBranchTaskQuest(branchTitleList)
	task.BranchLoader.loadCount = #branchTitleList

	function task.BranchLoader.loadCallback(index, com, data)
		table.insert(task.BranchComList, com)

		com.RTF = com.gameObject:GetComponent("RectTransform")
		com.RTF.sizeDelta = Vector2.New(420, 64)

		local titleBtn = com:GetButton("TaskBranchTitleBtn")

		titleBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
		titleBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for k, v in pairs(task.BranchComList) do
				v.titleBtn:SetCommonHighlighted(false)
			end

			task.lastTitleBtn = titleBtn
			task.LastBranchTitleBtnName = "BranchTitle" .. index

			UILayerCtrl.OnSelect("BranchTitle" .. index)
			PlayerInfoCtrl.LoadTaskDetail(branchTitleList[index], titleBtn)
			titleBtn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.BranchLoader.RTF)
		end)
		UILayerCtrl.AddButton("PlayerInfoTask", "BranchTitle" .. index, titleBtn)

		if index == 1 then
			titleBtn:SetAdjacent(XButton.Adjacent.UP, "BranchTitle" .. task.BranchLoader.loadCount)
		else
			titleBtn:SetAdjacent(XButton.Adjacent.UP, "BranchTitle" .. index - 1)
		end

		titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "BranchTitle" .. index + 1)
		titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "BranchTabBtn")
		titleBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.currentGoalName)
		titleBtn:SetParentScroll(task.BranchScroll)

		com.titleBtn = titleBtn

		local titleText = com:GetText("TaskBranchTitleBtn_Text")

		if branchTitleList[index].isComplete then
			titleText:SetColor(0.5098039215686274, 0.5098039215686274, 0.5098039215686274, 1)
			titleText:SetContent(branchTitleList[index].Name)
		else
			titleText:SetColor(1, 1, 1, 1)
			titleText:SetContent(branchTitleList[index].Name)
		end

		if index == task.BranchLoader.loadCount then
			titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "BranchTitle1")
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.BranchLoader.RTF)

			task.BranchScroll.scrollRectCom.normalizedPosition = Vector2.New(task.BranchScroll.scrollRectCom.normalizedPosition.x, 0)
			task.MaxBranchTitleBtnName = "BranchTitle" .. index

			task.BranchTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.MaxBranchTitleBtnName)
			titleBtn:OnDownMute(nil, nil)
			titleBtn:OnClick(nil, nil)

			task.LastBranchTitleBtnName = "BranchTitle" .. index

			UILayerCtrl.OnSelect("BranchTabBtn")
			titleBtn:SetCommonHighlighted(true)
		end
	end

	task.BranchLoader:Load()
end

function PlayerInfoCtrl.LoadDocument()
	task.taskListTitle:SetContent(GameText.UI_PLAYERINFO_TASK_DOCUMENT_LIST)
	task.taskContentTitle:SetContent(GameText.UI_PLAYERINFO_TASK_DOCUMENT_CONTENT)

	task.BranchComList = {}

	local documentTitleList = MS_UIQuest.GetDocumentTitleAll()

	documentTitleList = PlayerInfoCtrl.CheckTaskQuest(documentTitleList)

	local selectIndex = #documentTitleList

	for k, v in pairs(documentTitleList) do
		if v.QuestSort == FS_UserData.story:GetStoryId() then
			selectIndex = k
		end
	end

	task.BranchLoader.loadCount = #documentTitleList

	function task.BranchLoader.loadCallback(index, com, data)
		task.BranchComList[index] = com
		com.RTF = com.gameObject:GetComponent("RectTransform")
		com.RTF.sizeDelta = Vector2.New(420, 64)

		local titleBtn = com:GetButton("TaskBranchTitleBtn")

		com.titleBtn = titleBtn

		titleBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
		titleBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for k, v in pairs(task.BranchComList) do
				v.titleBtn:SetCommonHighlighted(false)
			end

			task.lastTitleBtn = titleBtn
			task.LastDocumentTitleBtnName = "DocumentTitle" .. index

			UILayerCtrl.OnSelect("DocumentTitle" .. index)
			PlayerInfoCtrl.LoadTaskDetail(documentTitleList[index], titleBtn)
			titleBtn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.BranchLoader.RTF)
		end)
		UILayerCtrl.AddButton("PlayerInfoTask", "DocumentTitle" .. index, titleBtn)

		if index == 1 then
			titleBtn:SetAdjacent(XButton.Adjacent.UP, "DocumentTitle" .. task.BranchLoader.loadCount)
		else
			titleBtn:SetAdjacent(XButton.Adjacent.UP, "DocumentTitle" .. index - 1)
		end

		titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "DocumentTitle" .. index + 1)
		titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "DocumentTabBtn")
		titleBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.currentGoalName)
		titleBtn:SetParentScroll(task.BranchScroll)

		com.titleBtn = titleBtn

		local titleText = com:GetText("TaskBranchTitleBtn_Text")

		titleText:SetColor(1, 1, 1, 1)
		titleText:SetContent(documentTitleList[index].Name)

		if index == task.BranchLoader.loadCount then
			titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "DocumentTitle1")
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.BranchLoader.RTF)

			task.BranchScroll.scrollRectCom.normalizedPosition = Vector2.New(task.BranchScroll.scrollRectCom.normalizedPosition.x, 0)
			task.MaxDocumentTitleBtnName = "DocumentTitle" .. selectIndex

			task.DocumentTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.MaxDocumentTitleBtnName)
			task.BranchComList[selectIndex].titleBtn:OnDownMute(nil, nil)
			task.BranchComList[selectIndex].titleBtn:OnClick(nil, nil)

			task.LastDocumentTitleBtnName = "DocumentTitle" .. selectIndex

			UILayerCtrl.OnSelect("DocumentTabBtn")
			task.BranchComList[selectIndex].titleBtn:SetCommonHighlighted(true)
		end
	end

	task.BranchLoader:Load()
end

function PlayerInfoCtrl.LoadGoal(titleId, targetBtn)
	if task.CurrentType == MS_UIQuest.QuestType.DocumentTitle then
		local orderList = FS_UserData.story:GetDocumentOrderList()
		local goalList = MS_UIQuest.GetGoalListByOrder(titleId, orderList)

		if #goalList == 0 then
			return
		end

		task.GoalComList = {}

		local ulist = {}
		local clist = {}

		for k, v in pairs(goalList) do
			local isknown = FS_UserData.story:GetDocumentKnown(v.QuestId)

			if isknown then
				table.insert(clist, v)
			else
				table.insert(ulist, v)
			end
		end

		goalList = {}

		for k, v in pairs(clist) do
			table.insert(goalList, v)
		end

		for k, v in pairs(ulist) do
			table.insert(goalList, v)
		end

		task.GoalLoader.loadCount = #goalList
		task.LastGoalDescriptionText = ""

		function task.GoalLoader.loadCallback(index, com, data)
			local goalBtn = com:GetButton("GoalBtn")
			local documentBG = com:GetGameObject("GoalBtn_Literature_BG")

			documentBG:SetActive(true)

			com.SelectBG = com:GetGameObject("GoalBtn_Literature_BG_Select_BG")

			local PanelNew = com:GetGameObject("GoalBtn_Literature_BG_Panel_New")
			local PanelRead = com:GetGameObject("GoalBtn_Literature_BG_Panel_Read")
			local isknown = FS_UserData.story:GetDocumentKnown(goalList[index].QuestId)

			PanelNew:SetActive(not isknown)
			PanelRead:SetActive(isknown)
			goalBtn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
			goalBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				task.DetailPanel.taskDescriptionText:SetContent(goalList[index].Description)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.contentGroupRT)
				task.triangleGroup:SetActive(task.GetPreferredHeightFunc() > task.contentHeight + 0.3)

				task.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(task.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

				UILayerCtrl.OnSelect("Goal" .. index)
				task.lastTitleBtn:SetCommonHighlighted(true)
				goalBtn:SetSelectedLight(true)
				PanelNew:SetActive(false)
				PanelRead:SetActive(true)

				for k, v in pairs(task.GoalComList) do
					v.SelectBG:SetActive(false)
				end

				com.SelectBG:SetActive(true)
				FS_UserData.story:SetDocumentKnown(goalList[index].QuestId)
			end)

			task.GoalComList[index] = com

			UILayerCtrl.AddButton("PlayerInfoTask", "Goal" .. index, goalBtn)

			if index == 1 then
				goalBtn:SetAdjacent(XButton.Adjacent.UP, "Goal" .. task.GoalLoader.loadCount)
			else
				goalBtn:SetAdjacent(XButton.Adjacent.UP, "Goal" .. index - 1)
			end

			goalBtn:SetAdjacent(XButton.Adjacent.DOWN, "Goal" .. index + 1)
			goalBtn:SetAdjacent(XButton.Adjacent.LEFT, task.LastDocumentTitleBtnName)
			goalBtn:SetParentScroll(task.GoalScroll)

			local goalText = com:GetText("GoalBtn_Text")

			goalText:SetContent(goalList[index].Name)
			goalText:SetColor(1, 1, 1, 1)

			local currentTask = com:GetGameObject("GoalBtn_currentTask")

			currentTask:SetActive(false)

			if index == task.GoalLoader.loadCount then
				goalBtn:SetAdjacent(XButton.Adjacent.DOWN, "Goal1")

				for k, v in pairs(task.GoalComList) do
					v.SelectBG:SetActive(false)
				end

				task.GoalComList[task.GoalLoader.loadCount].SelectBG:SetActive(true)
				FS_UserData.story:SetDocumentKnown(goalList[index].QuestId)
				PanelNew:SetActive(false)
				PanelRead:SetActive(true)

				task.currentGoalName = "Goal" .. index

				targetBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.currentGoalName)

				task.LastGoalDescriptionText = goalList[index].Description

				task.DetailPanel.taskDescriptionText:SetContent(task.LastGoalDescriptionText)
				task.triangleGroup:SetActive(task.GetPreferredHeightFunc() > task.contentHeight + 0.3)

				task.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(task.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.contentGroupRT)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.GoalLoader.RTF)
				task.DetailPanel.gameObject:SetActive(false)
				task.DetailPanel.gameObject:SetActive(true)

				task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, 0)

				task.GoalScroll.gameObject:SetActive(false)
				task.GoalScroll.gameObject:SetActive(true)
			end
		end
	else
		local goalList = MS_UIQuest.GetGoalList(titleId)

		goalList = PlayerInfoCtrl.CheckTaskQuest(goalList)

		table.sort(goalList, function(a, b)
			return tonumber(a.QuestId) < tonumber(b.QuestId)
		end)

		task.GoalLoader.loadCount = #goalList
		task.LastGoalDescriptionText = ""

		function task.GoalLoader.loadCallback(index, com, data)
			local goalBtn = com:GetButton("GoalBtn")

			goalBtn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
			goalBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				task.DetailPanel.taskDescriptionText:SetContent(goalList[index].Description)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.contentGroupRT)
				task.triangleGroup:SetActive(task.GetPreferredHeightFunc() > task.contentHeight + 0.3)

				task.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(task.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

				UILayerCtrl.OnSelect("Goal" .. index)
				task.lastTitleBtn:SetCommonHighlighted(true)
				goalBtn:SetSelectedLight(true)
			end)

			local documentBG = com:GetGameObject("GoalBtn_Literature_BG")

			documentBG:SetActive(false)
			UILayerCtrl.AddButton("PlayerInfoTask", "Goal" .. index, goalBtn)

			if index == 1 then
				goalBtn:SetAdjacent(XButton.Adjacent.UP, "Goal" .. task.GoalLoader.loadCount)
			else
				goalBtn:SetAdjacent(XButton.Adjacent.UP, "Goal" .. index - 1)
			end

			goalBtn:SetAdjacent(XButton.Adjacent.DOWN, "Goal" .. index + 1)

			if task.CurrentType == MS_UIQuest.QuestType.BranchTitle then
				goalBtn:SetAdjacent(XButton.Adjacent.LEFT, task.LastBranchTitleBtnName)
			elseif task.CurrentType == MS_UIQuest.QuestType.MainTitle then
				goalBtn:SetAdjacent(XButton.Adjacent.LEFT, task.LastMainTitleBtnName)
			end

			goalBtn:SetParentScroll(task.GoalScroll)

			local goalText = com:GetText("GoalBtn_Text")

			goalText:SetContent(goalList[index].Name)

			local currentTask = com:GetGameObject("GoalBtn_currentTask")
			local gameController = sceneController:GetGameController()

			if gameController ~= nil then
				local ret

				if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
					ret = gameController:IsQuestAllComplete(goalList[index].CompleteQuestId)
				else
					ret = false
				end

				if ret then
					goalText:SetColor(0.5098039215686274, 0.5098039215686274, 0.5098039215686274, 1)
				else
					goalText:SetColor(1, 1, 1, 1)
				end

				currentTask:SetActive(not ret)
			else
				goalText:SetColor(1, 1, 1, 1)
				currentTask:SetActive(true)
			end

			if index == task.GoalLoader.loadCount then
				goalBtn:SetAdjacent(XButton.Adjacent.DOWN, "Goal1")

				task.currentGoalName = "Goal" .. index

				targetBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.currentGoalName)

				task.LastGoalDescriptionText = goalList[index].Description

				task.DetailPanel.taskDescriptionText:SetContent(task.LastGoalDescriptionText)
				task.triangleGroup:SetActive(task.GetPreferredHeightFunc() > task.contentHeight + 0.3)

				task.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(task.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.contentGroupRT)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(task.GoalLoader.RTF)
				task.DetailPanel.gameObject:SetActive(false)
				task.DetailPanel.gameObject:SetActive(true)

				task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, 0)

				task.GoalScroll.gameObject:SetActive(false)
				task.GoalScroll.gameObject:SetActive(true)
			end
		end
	end

	task.GoalLoader:Load()
end

function PlayerInfoCtrl.CheckTaskQuest(olist)
	local nList = {}

	for k, data in pairs(olist) do
		local gameController = sceneController:GetGameController()

		if gameController ~= nil and BattleData.IsBattleMode(BattleData.Type.PVE_Story) and gameController:CheckShowQuestComplete(data.ShowQuestId) then
			local ret2 = BattleData.IsBattleMode(BattleData.Type.PVE_Story) and gameController:IsQuestAllComplete(data.CompleteQuestId)

			data.isComplete = ret2

			table.insert(nList, data)
		end
	end

	table.sort(nList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)

	return nList
end

function PlayerInfoCtrl.CheckBranchTaskQuest(olist)
	local uList = {}
	local cList = {}

	for k, data in pairs(olist) do
		local gameController = sceneController:GetGameController()

		if gameController ~= nil then
			local ret = gameController:CheckShowQuestComplete(data.ShowQuestId)

			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and ret then
				local ret2 = gameController:IsQuestAllComplete(data.CompleteQuestId)

				if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and ret2 then
					data.isComplete = true

					table.insert(cList, data)
				else
					data.isComplete = false

					table.insert(uList, data)
				end
			end
		end
	end

	table.sort(cList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)
	table.sort(uList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)

	local rList = {}

	for k, data in pairs(cList) do
		table.insert(rList, data)
	end

	for k, data in pairs(uList) do
		table.insert(rList, data)
	end

	return rList
end

function PlayerInfoCtrl.LoadTaskDetail(titleTask, targetBtn)
	task.DetailPanel.gameObject:SetActive(true)

	if task.currentQuestId ~= titleTask.QuestId then
		task.DetailPanel.taskDescriptionText:SetContent("")
		PlayerInfoCtrl.LoadGoal(titleTask.QuestId, targetBtn)

		task.currentQuestId = titleTask.QuestId
	end
end

function PlayerInfoCtrl.OnAlchemyCreate()
	alchemy = {}
	alchemy.BlackHoleBG = this.mainComponent:GetGameObject("PlayerInfoPanel_Black_Borad")
	alchemy.DedicationTitle = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainTypeTitle_DedicationTitle")
	alchemy.AgentiaTitle = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainTypeTitle_AgentiaTitle")
	alchemy.TrophyTitle = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainTypeTitle_TrophyTitle")
	alchemy.EnchantTitle = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainTypeTitle_EnchantTitle")
	alchemy.RestTitle = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainTypeTitle_RestTitle")
	alchemy.RightBoard = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard")
	alchemy.AgentiaBG = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_alchemyBg")
	alchemy.alchemyBG = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_alchemyBg_alchemybg")
	alchemy.dedicationBG = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_alchemyBg_dedicationbg")
	alchemy.AlchemyOffset = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_alchemyOffset")
	alchemy.HeadFrame = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_headFrame")
	alchemy.VerticalGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup")
	alchemy.HeadFrameTypeIconList = {}
	alchemy.HeadFrameTypeIconList[MS_ItemData.Type.TrophyScars] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_headFrame_headTypeIcon_TrophyScars")
	alchemy.HeadFrameTypeIconList[MS_ItemData.Type.TrophyResistance] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_headFrame_headTypeIcon_TrophyResistance")
	alchemy.HeadFrameTypeIconList[MS_ItemData.Type.TrophyNightmare] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_headFrame_headTypeIcon_TrophyNightmare")
	alchemy.StrengthenItemMainSlot = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_StrengthenOffset_StrengthenBoard_MainSlot")

	alchemy.StrengthenItemMainSlot:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.ItemSelect.loadFinish == false or alchemy.Status == nil then
			return
		end

		alchemy.ItemSelect.currentTrophySlot = alchemy.StrengthenItemMainSlot

		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(true)
		alchemy.ItemSelect.RightPanel:SetActive(false)

		local trophyType, defaultIndex = PlayerInfoCtrl.CheckMainSlotItemDefaultType()

		PlayerInfoCtrl.HighLightStrengthOrRecastBtn()

		alchemy.trophyTypeIndex = defaultIndex
		alchemy.ItemSelect.currentTrophySlotName = "StrengthenItemMainSlot"

		alchemy.ItemSelect.currentTrophySlot:SetSelectedLight(true)
		alchemy.StrengthenItemSubSlot:SetSelectedLight(false)
		PlayerInfoCtrl.RefreshAlechemyItemSelect(trophyType)
	end)

	alchemy.StrengthenItemSubSlot = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_StrengthenOffset_StrengthenBoard_SubSlot")

	alchemy.StrengthenItemSubSlot:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.ItemSelect.loadFinish == false or alchemy.StrengthenItemMainSlot.item == nil or alchemy.Status == MS_ItemData.Type.StrengthenStone then
			return
		end

		alchemy.ItemSelect.currentTrophySlot = alchemy.StrengthenItemSubSlot

		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(true)
		alchemy.ItemSelect.RightPanel:SetActive(false)

		local defaultType, defaultIndex = PlayerInfoCtrl.CheckSubSlotItemDefaultType()

		PlayerInfoCtrl.HighLightStrengthOrRecastBtn()

		alchemy.trophyTypeIndex = defaultIndex
		alchemy.ItemSelect.currentTrophySlotName = "StrengthenItemSubSlot"

		alchemy.ItemSelect.currentTrophySlot:SetSelectedLight(true)
		alchemy.StrengthenItemMainSlot:SetSelectedLight(false)
		PlayerInfoCtrl.RefreshAlechemyItemSelect(defaultType)
	end)

	alchemy.StrengthenItemSubSlotBG = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_StrengthenOffset_StrengthenBoard_SubSlot_Sub_Bg")
	alchemy.StrengthenItemSubSlotBGTextGO = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_StrengthenOffset_StrengthenBoard_SubSlot_Text")
	alchemy.StrengthenItemMainSlot.img = XImage:new(alchemy.StrengthenItemMainSlot.gameObject.transform:Find("itemIcon").gameObject)
	alchemy.StrengthenItemSubSlot.img = XImage:new(alchemy.StrengthenItemSubSlot.gameObject.transform:Find("itemIcon").gameObject)

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "StrengthenItemMainSlot", alchemy.StrengthenItemMainSlot)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "StrengthenItemSubSlot", alchemy.StrengthenItemSubSlot)
	alchemy.StrengthenItemMainSlot:SetAdjacent(XButton.Adjacent.RIGHT, "StrengthenItemSubSlot")
	alchemy.StrengthenItemSubSlot:SetAdjacent(XButton.Adjacent.LEFT, "StrengthenItemMainSlot")

	alchemy.NewLightList = {}
	alchemy.NewLightList[MS_ItemData.MainType.Consume] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainBar_AgentiaBtn_outlineLight")
	alchemy.NewLightList[MS_ItemData.MainType.Trophy] = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainBar_TrophyBtn_outlineLight")
	alchemy.ConfirmPanelButton = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyConfirmPanel")

	alchemy.ConfirmPanelButton:SetAudioType(AudioCtrl.ButtonClickType.None)

	alchemy.ConfirmPanel = alchemy.ConfirmPanelButton.gameObject
	alchemy.ConfirmGroup = {}
	alchemy.ConfirmGroup.BGRT = this.mainComponent:GetGameObject("PlayerInfoPanel_AlchemyConfirmPanel_BG"):GetComponent("RectTransform")
	alchemy.ConfirmGroup.MainText = this.mainComponent:GetText("PlayerInfoPanel_AlchemyConfirmPanel_BG_MainText")
	alchemy.ConfirmGroup.CountGroupGO = this.mainComponent:GetGameObject("PlayerInfoPanel_AlchemyConfirmPanel_BG_CountGroup")
	alchemy.ConfirmGroup.NumText = this.mainComponent:GetText("PlayerInfoPanel_AlchemyConfirmPanel_BG_CountGroup_Num")
	alchemy.ConfirmGroup.NumText.num = 0
	alchemy.ConfirmGroup.NumText.maxNum = 99
	alchemy.ConfirmGroup.AddBtn = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyConfirmPanel_BG_CountGroup_addBtn")
	alchemy.ConfirmGroup.MinBtn = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyConfirmPanel_BG_CountGroup_minBtn")

	function alchemy.ConfirmGroup.AddBtnFunc()
		if alchemy.ConfirmGroup.NumText.num < alchemy.ConfirmGroup.NumText.maxNum then
			alchemy.ConfirmGroup.NumText.num = alchemy.ConfirmGroup.NumText.num + 1

			alchemy.ConfirmGroup.NumText:SetContent(alchemy.ConfirmGroup.NumText.num)
			alchemy.ConfirmGroup.MinBtn:SetNormal()
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.ItemChoose)

			if alchemy.ConfirmGroup.NumText.num < alchemy.ConfirmGroup.NumText.maxNum then
				alchemy.ConfirmGroup.AddBtn:SetNormal()
			else
				alchemy.ConfirmGroup.AddBtn:SetDisabled(true)
			end
		end
	end

	function alchemy.ConfirmGroup.MinBtnFunc()
		if alchemy.ConfirmGroup.NumText.num > 1 then
			alchemy.ConfirmGroup.NumText.num = alchemy.ConfirmGroup.NumText.num - 1

			alchemy.ConfirmGroup.NumText:SetContent(alchemy.ConfirmGroup.NumText.num)
			alchemy.ConfirmGroup.AddBtn:SetNormal()
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.ItemChoose)

			if alchemy.ConfirmGroup.NumText.num > 1 then
				alchemy.ConfirmGroup.MinBtn:SetNormal()
			else
				alchemy.ConfirmGroup.MinBtn:SetDisabled(true)
			end
		end
	end

	alchemy.ConfirmGroup.AddBtn:SetLongPressCallBack(alchemy.ConfirmGroup.AddBtnFunc)
	alchemy.ConfirmGroup.MinBtn:SetLongPressCallBack(alchemy.ConfirmGroup.MinBtnFunc)

	alchemy.ConfirmGroup.ConfirmBtn = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Confirm")
	alchemy.ConfirmGroup.CancelBtn = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Cancel")

	alchemy.ConfirmGroup.CancelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.ConfirmPanel:SetActive(false)
		UILayerCtrl.Pop()

		if (alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyAgentia or alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyTrophy) and alchemy.toBlendItemBtn then
			alchemy.toBlendItemBtn:SetCommonHighlighted(true)
		end
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemyConfirm", "PlayerInfoPanel_AlchemyConfirmPanel_BG_CountGroup_addBtn", alchemy.ConfirmGroup.AddBtn)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemyConfirm", "PlayerInfoPanel_AlchemyConfirmPanel_BG_CountGroup_minBtn", alchemy.ConfirmGroup.MinBtn)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemyConfirm", "PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Confirm", alchemy.ConfirmGroup.ConfirmBtn)
	UILayerCtrl.AddButton("PlayerInfoAlchemyConfirm", "PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Confirm", alchemy.ConfirmGroup.ConfirmBtn)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemyConfirm", "PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Cancel", alchemy.ConfirmGroup.CancelBtn)

	alchemy.ItemSelectPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel")
	alchemy.ItemSelect = {}
	alchemy.trophyTypeNavButton = {}
	alchemy.ItemSelect.ScarTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Left_LeftTop_scar")

	alchemy.ItemSelect.ScarTabBtn:SetHighlightIndependent(true)
	alchemy.ItemSelect.ScarTabBtn:SelectOnStart(true)
	alchemy.ItemSelect.ScarTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.ItemSelect.currentTrophyTypeBtn = "ScarTabBtn"

		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		alchemy.trophyTypeIndex = 1

		PlayerInfoCtrl.RefreshAlechemyItemSelect(MS_ItemData.Type.TrophyScars)
	end)

	alchemy.trophyTypeNavButton[1] = alchemy.ItemSelect.ScarTabBtn
	alchemy.ItemSelect.ResistanceTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Left_LeftTop_resistance")

	alchemy.ItemSelect.ResistanceTabBtn:SetHighlightIndependent(true)
	alchemy.ItemSelect.ResistanceTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.ItemSelect.currentTrophyTypeBtn = "ResistanceTabBtn"

		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		alchemy.trophyTypeIndex = 2

		PlayerInfoCtrl.RefreshAlechemyItemSelect(MS_ItemData.Type.TrophyResistance)
	end)

	alchemy.trophyTypeNavButton[2] = alchemy.ItemSelect.ResistanceTabBtn
	alchemy.ItemSelect.NightmareTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Left_LeftTop_nightmare")

	alchemy.ItemSelect.NightmareTabBtn:SetHighlightIndependent(true)
	alchemy.ItemSelect.NightmareTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.ItemSelect.currentTrophyTypeBtn = "NightmareTabBtn"

		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		alchemy.trophyTypeIndex = 3

		PlayerInfoCtrl.RefreshAlechemyItemSelect(MS_ItemData.Type.TrophyNightmare)
	end)

	alchemy.trophyTypeNavButton[3] = alchemy.ItemSelect.NightmareTabBtn
	alchemy.trophyTypeIndex = 1
	alchemy.trophyTypeCountMax = 3
	alchemy.ItemSelect.itemScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Left_ItemScorll")
	alchemy.ItemSelect.itemScroll = XScrollRect:new(alchemy.ItemSelect.itemScroll)
	alchemy.ItemSelect.ItemLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Left_ItemScorll_viewport_ItemList")

	alchemy.ItemSelect.ItemLoader:SetCacheNumMax(1, 40)

	alchemy.ItemSelect.RightPanel = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right")
	alchemy.ItemSelect.BackBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_back")

	alchemy.ItemSelect.BackBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		UILayerCtrl.OnSelect(alchemy.ItemSelect.currentTrophySlotName)
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)
	end)

	alchemy.ItemSelect.PutInBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_putInBtn")

	alchemy.ItemSelect.PutInBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		if alchemy.ItemSelect.SelectedItem ~= nil then
			if alchemy.ItemSelect.currentTrophySlot == alchemy.StrengthenItemSubSlot and alchemy.ItemSelect.SelectedItem:GetIsLock() then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_LOCKED)

				return
			end

			alchemy.ItemSelect.currentTrophySlot.item = alchemy.ItemSelect.SelectedItem
		end

		if alchemy.ItemSelect.currentTrophySlot == alchemy.StrengthenItemMainSlot then
			PlayerInfoCtrl.ResetAlchemySubSlotItem()
		end

		PlayerInfoCtrl.RefreshResultAlchemeyItemInfo()
		UILayerCtrl.OnSelect(alchemy.ItemSelect.currentTrophySlotName)
		PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "ItemSelectBackBtn", alchemy.ItemSelect.BackBtn)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "ItemSelectPutInBtn", alchemy.ItemSelect.PutInBtn)

	alchemy.ItemSelect.itemImage = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_itemImage")
	alchemy.ItemSelect.itemImage = XImage:new(alchemy.ItemSelect.itemImage)
	alchemy.ItemSelect.LockGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup")
	alchemy.ItemSelect.LockOnBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup_LockOn")

	alchemy.ItemSelect.LockOnBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.SetAlchemyLockBtn(false)

		if alchemy.ItemSelect.SelectedItem then
			alchemy.ItemSelect.SelectedItem:SetLock(false)
		end

		AudioCtrl.SetUIAudio("player_info/trophy_unlock")
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup_LockOn", alchemy.ItemSelect.LockOnBtn)

	alchemy.ItemSelect.LockOffBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup_LockOff")

	alchemy.ItemSelect.LockOffBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.SetAlchemyLockBtn(true)

		if alchemy.ItemSelect.SelectedItem then
			alchemy.ItemSelect.SelectedItem:SetLock(true)
		end

		AudioCtrl.SetUIAudio("player_info/trophy_lock")
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup_LockOff", alchemy.ItemSelect.LockOffBtn)

	alchemy.ItemSelect.itemDes = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemDes")
	alchemy.ItemSelect.itemName = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemName")
	alchemy.ItemSelect.itemBouns = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemBouns")
	alchemy.ItemSelect.contentHeight = 250
	alchemy.ItemSelect.oneLineHeight = 23
	alchemy.ItemSelect.lineOffset = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_contentGroup_Viewport_Content_lineOffset")
	alchemy.ItemSelect.contentGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_contentGroup")
	alchemy.ItemSelect.triangleGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_contentGroup_triangleGroup")
	alchemy.ItemSelect.triangle = alchemy.ItemSelect.triangleGroup.transform:Find("triangle").gameObject
	alchemy.ItemSelect.contentGroupRT = alchemy.ItemSelect.contentGroup.transform:Find("Viewport"):Find("Content"):GetComponent("RectTransform")
	alchemy.ItemSelect.RightPanelRT = alchemy.ItemSelect.RightPanel:GetComponent("RectTransform")
	alchemy.ItemSelect.contentGroupScroll = XScrollRect:new(alchemy.ItemSelect.contentGroup)

	function alchemy.ItemSelect.GetPreferredHeightFunc()
		local totalLength = 0

		if alchemy.ItemSelect.lineOffset.activeSelf then
			totalLength = totalLength + alchemy.ItemSelect.oneLineHeight
		end

		if alchemy.ItemSelect.itemBouns.gameObject.activeSelf then
			totalLength = totalLength + alchemy.ItemSelect.itemBouns.textCom.preferredHeight
		end

		if alchemy.ItemSelect.itemDes.gameObject.activeSelf then
			totalLength = totalLength + alchemy.ItemSelect.itemDes.textCom.preferredHeight
		end

		return totalLength
	end

	alchemy.DedicationTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainBar_DedicationBtn")
	alchemy.AgentiaTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_MetalTab_LeftBoard_MainBar_AgentiaBtn")
	alchemy.TrophyTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainBar_TrophyBtn")
	alchemy.EnchantTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_MetalTab_LeftBoard_MainBar_EnchantBtn")
	alchemy.RecastBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_StrengthenTab_recastBtn")
	alchemy.StrengthenBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_StrengthenTab_strengthenBtn")
	alchemy.ExpBarBG = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_ExpBarBG")
	alchemy.RestTabBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainBar_RestBtn")
	alchemyNavButtonGroup = {}
	alchemyNavButtonGroup[PlayerInfoCtrl.AlchemyTabType.Dedication] = alchemy.DedicationTabBtn
	alchemyNavButtonGroup[PlayerInfoCtrl.AlchemyTabType.Agentia] = alchemy.AgentiaTabBtn
	alchemyNavButtonGroup[PlayerInfoCtrl.AlchemyTabType.Trophy] = alchemy.TrophyTabBtn
	alchemyNavButtonGroup[PlayerInfoCtrl.AlchemyTabType.Enchant] = alchemy.EnchantTabBtn
	alchemyNavButtonGroup[PlayerInfoCtrl.AlchemyTabType.Rest] = alchemy.RestTabBtn
	alchemy.RestBg = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_RestBg")
	alchemy.RestBgRT = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_RestBg_TextBg"):GetComponent("RectTransform")
	alchemy.RestBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_RestBg_RestBtn")
	alchemy.AttributePointTip = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_AttributeTip")

	alchemy.AttributePointTip:SetAudioType(AudioCtrl.ButtonClickType.None)
	alchemy.AttributePointTip:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		navButtonGroup[PlayerInfoCtrl.Tab.Property]:OnDown(nil, nil)
		navButtonGroup[PlayerInfoCtrl.Tab.Property]:OnClick(nil, nil)
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "AttributePointTip", alchemy.AttributePointTip)

	alchemy.ExpPreviewSlider = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_ExpBarBG_Slider"):GetComponent("Slider")
	alchemy.ExpPreviewSliderLastTime = TimeHelper.getNowTimeNoScale()
	alchemy.ExpPreviewBar = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ExpBarBG_GreenBar"):GetComponent("Image")
	alchemy.ExpPreviewBar.fillAmount = 0
	alchemy.ExpPreviewSliderXtween = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_ExpBarBG_Slider"):GetComponent("XTween")
	alchemy.ExpPreviewSliderCanvasGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_ExpBarBG_Slider"):GetComponent("CanvasGroup")
	alchemy.ExpPreviewSliderCanvasGroup.alpha = 0
	alchemy.ExpLevelUp = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_ExpBarBG_Levelup")
	alchemy.ExpMainBar = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_ExpBarBG_mainBar"):GetComponent("Image")
	alchemy.ExpMainBarTween = Tween:new(alchemy.ExpMainBar)
	alchemy.ExpMainBarLight = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_ExpBarBG_mainBar_light")
	alchemy.ExpMainBarLightTween = Tween:new(alchemy.ExpMainBarLight.transform)
	alchemy.ExpPreviewSliderTween = Tween:new(alchemy.ExpPreviewSlider)
	alchemy.ExpLevelText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_ExpBarBG_LevelNumText")
	alchemy.ExpLevelText.Level = 1
	alchemy.ExpLevelText.Percent = 0
	alchemy.ExpNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_ExpBarBG_ExpNumText")
	alchemy.CurrentLoadAlchemyFunc = PlayerInfoCtrl.LoadAlchemyDedication

	alchemy.DedicationTabBtn:SelectOnStart(true)
	alchemy.DedicationTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	alchemy.DedicationTabBtn:SetHighlightIndependent(true)
	alchemy.DedicationTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.Status = nil

		PlayerInfoCtrl.LoadAlchemyDedication()
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)
		alchemy.ExpLevelUp:SetActive(false)

		alchemy.CurrentLoadAlchemyFunc = PlayerInfoCtrl.LoadAlchemyDedication
		currentAlchemyTabBtnIndex = PlayerInfoCtrl.AlchemyTabType.Dedication

		UILayerCtrl.OnSelect("DedicationTabBtn")
		alchemy.ConfirmBtn:SetLongPressCallBack(PlayerInfoCtrl.AlchemyConfirm, function()
			return alchemy.ConfirmBtn.gameObject.activeSelf == false or UILayerCtrl.GetCurrentLayerName() ~= "PlayerInfoAlchemy"
		end, 6)
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "DedicationTabBtn", alchemy.DedicationTabBtn)
	alchemy.DedicationTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemyExpItem1")
	alchemy.RestTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	alchemy.RestTabBtn:SetHighlightIndependent(true)
	alchemy.RestTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.Status = nil

		alchemy.ConfirmBtn:SetLongPressOFF()
		alchemy.ConfirmBtn:SetAudioType(AudioCtrl.ButtonClickType.Common)
		alchemy.ConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			PlayerInfoCtrl.AlchemyConfirm()
		end)
		PlayerInfoCtrl.LoadAlchemyRest()
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)

		alchemy.CurrentLoadAlchemyFunc = PlayerInfoCtrl.LoadAlchemyRest
		currentAlchemyTabBtnIndex = PlayerInfoCtrl.AlchemyTabType.Rest

		UILayerCtrl.OnSelect("RestTabBtn")
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "RestTabBtn", alchemy.RestTabBtn)
	alchemy.RestTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "RestBtn")
	alchemy.RestBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.Rest()
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "RestBtn", alchemy.RestBtn)
	alchemy.RestBtn:SetAdjacent(XButton.Adjacent.LEFT, "RestTabBtn")
	alchemy.AgentiaTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	alchemy.AgentiaTabBtn:SetHighlightIndependent(true)
	alchemy.AgentiaTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.Status = nil

		alchemy.ConfirmBtn:SetLongPressOFF()
		alchemy.ConfirmBtn:SetAudioType(AudioCtrl.ButtonClickType.Common)
		alchemy.ConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			PlayerInfoCtrl.AlchemyConfirm()
		end)
		PlayerInfoCtrl.LoadAlchemyAgentia()
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)

		alchemy.CurrentLoadAlchemyFunc = PlayerInfoCtrl.LoadAlchemyAgentia
		currentAlchemyTabBtnIndex = PlayerInfoCtrl.AlchemyTabType.Agentia

		UILayerCtrl.OnSelect("AgentiaTabBtn")
		PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.AlchemyAgentia)
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AgentiaTabBtn", alchemy.AgentiaTabBtn)
	alchemy.AgentiaTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemyFoldListTitle1")

	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.AlchemyAgentia] = alchemy.AgentiaTabBtn

	alchemy.TrophyTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.Status = nil

		alchemy.ConfirmBtn:SetLongPressOFF()
		alchemy.ConfirmBtn:SetAudioType(AudioCtrl.ButtonClickType.Common)
		alchemy.ConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			PlayerInfoCtrl.AlchemyConfirm()
		end)
		PlayerInfoCtrl.LoadAlchemyTrophy()
		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(false)

		alchemy.CurrentLoadAlchemyFunc = PlayerInfoCtrl.LoadAlchemyTrophy
		currentAlchemyTabBtnIndex = PlayerInfoCtrl.AlchemyTabType.Trophy

		UILayerCtrl.OnSelect("TrophyTabBtn")
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "TrophyTabBtn", alchemy.TrophyTabBtn)
	alchemy.TrophyTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	alchemy.TrophyTabBtn:SetHighlightIndependent(true)
	alchemy.TrophyTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemyFoldListTitle1")

	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.AlchemyTrophy] = alchemy.TrophyTabBtn

	alchemy.EnchantTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.LoadAlchemyEnchant()

		alchemy.CurrentLoadAlchemyFunc = PlayerInfoCtrl.LoadAlchemyEnchant
		currentAlchemyTabBtnIndex = PlayerInfoCtrl.AlchemyTabType.Enchant

		UILayerCtrl.OnSelect("EnchantTabBtn")

		alchemy.Status = nil

		alchemy.ConfirmBtn:SetLongPressOFF()
		alchemy.ConfirmBtn:SetAudioType(AudioCtrl.ButtonClickType.Common)
		alchemy.ConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			PlayerInfoCtrl.AlchemyConfirm()
		end)
		PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
		alchemy.strengthenOffset:SetActive(false)
		alchemy.RecastBtn:SetNormal()
		alchemy.StrengthenBtn:SetNormal()
		alchemy.StrengthenItemMainSlot:SetSelectedLight(false)
		alchemy.StrengthenItemSubSlot:SetSelectedLight(false)
		PlayerInfoCtrl.OpenPlayerShowIntroduction(PlayerInfoCtrl.MenuGuideType.AlchemyEnchant)
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "EnchantTabBtn", alchemy.EnchantTabBtn)
	alchemy.EnchantTabBtn:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
	alchemy.EnchantTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "StrengthenBtn")
	alchemy.EnchantTabBtn:SetHighlightIndependent(true)

	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.AlchemyEnchant] = alchemy.EnchantTabBtn

	alchemy.RecastBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.Status == MS_ItemData.Type.RecastStone and alchemy.StrengthenItemMainSlot.item ~= nil then
			return
		end

		alchemy.Status = MS_ItemData.Type.RecastStone

		alchemy.StrengthenItemMainSlot:SetAdjacent(XButton.Adjacent.RIGHT, "StrengthenItemSubSlot")
		alchemy.StrengthenItemSubSlotBG:SetActive(true)
		alchemy.StrengthenItemSubSlotBGTextGO:SetActive(true)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", alchemy.RecastBtn)

		alchemy.ItemSelect.currentTrophySlot = alchemy.StrengthenItemMainSlot

		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(true)
		alchemy.ItemSelect.RightPanel:SetActive(false)

		local trophyType, defaultIndex = PlayerInfoCtrl.CheckMainSlotItemDefaultType()

		alchemy.trophyTypeIndex = defaultIndex

		PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
		alchemy.ItemSelect.currentTrophySlot:SetSelectedLight(true)
		alchemy.StrengthenItemSubSlot:SetSelectedLight(false)
		PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
		alchemy.strengthenOffset:SetActive(false)
		alchemy.strengthenOffset:SetActive(true)

		alchemy.ItemSelect.currentTrophySlotName = "StrengthenItemMainSlot"

		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		PlayerInfoCtrl.RefreshAlechemyItemSelect(trophyType)
		alchemy.RecastBtn:SetCommonHighlighted(true)
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "RecastBtn", alchemy.RecastBtn)
	alchemy.RecastBtn:SetAdjacent(XButton.Adjacent.LEFT, "EnchantTabBtn")
	alchemy.RecastBtn:SetAdjacent(XButton.Adjacent.DOWN, "StrengthenBtn")
	alchemy.RecastBtn:SetAdjacent(XButton.Adjacent.UP, "StrengthenBtn")
	alchemy.StrengthenBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.Status == MS_ItemData.Type.StrengthenStone and alchemy.StrengthenItemMainSlot.item ~= nil then
			return
		end

		alchemy.Status = MS_ItemData.Type.StrengthenStone

		alchemy.StrengthenItemSubSlotBG:SetActive(false)
		alchemy.StrengthenItemSubSlotBGTextGO:SetActive(false)
		alchemy.StrengthenItemMainSlot:SetAdjacent(XButton.Adjacent.RIGHT, nil)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", alchemy.StrengthenBtn)

		alchemy.ItemSelect.currentTrophySlot = alchemy.StrengthenItemMainSlot

		PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(true)
		alchemy.ItemSelect.RightPanel:SetActive(false)

		local trophyType, defaultIndex = PlayerInfoCtrl.CheckMainSlotItemDefaultType()

		alchemy.trophyTypeIndex = defaultIndex

		PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
		alchemy.ItemSelect.currentTrophySlot:SetSelectedLight(true)
		alchemy.StrengthenItemSubSlot:SetSelectedLight(false)
		PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
		alchemy.strengthenOffset:SetActive(false)
		alchemy.strengthenOffset:SetActive(true)

		alchemy.ItemSelect.currentTrophySlotName = "StrengthenItemMainSlot"

		if alchemy.ItemSelect.loadFinish == false then
			return
		end

		PlayerInfoCtrl.RefreshAlechemyItemSelect(trophyType)
		alchemy.StrengthenBtn:SetCommonHighlighted(true)
	end)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "StrengthenBtn", alchemy.StrengthenBtn)
	alchemy.StrengthenBtn:SetAdjacent(XButton.Adjacent.LEFT, "EnchantTabBtn")
	alchemy.StrengthenBtn:SetAdjacent(XButton.Adjacent.DOWN, "RecastBtn")
	alchemy.StrengthenBtn:SetAdjacent(XButton.Adjacent.UP, "RecastBtn")

	alchemy.itemInfoImg = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_itemImage")
	alchemy.itemInfoImg = XImage:new(alchemy.itemInfoImg)
	alchemy.itemInfoName = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_Name")
	alchemy.itemInfoContent = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_Des_BounsText")
	alchemy.itemInfoLine = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_line3")
	alchemy.itemDescriptionContent = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_Des")
	alchemy.itemInfoNumGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_itemNumGroup")
	alchemy.itemInfoNumText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_itemNumGroup_itemNum")
	alchemy.itemInfoNumMaxText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_itemNumGroup_itemNum_itemNumMax")
	alchemy.strengthenOffset = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_StrengthenOffset")
	alchemy.recastReduceText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_ReduceText")
	alchemy.recastGainText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_GainText")
	alchemy.mainTypeText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_MainTypeTitle_MainTypeTitleText")
	alchemy.contentHeight = 161
	alchemy.oneLineHeight = 23
	alchemy.lineOffset = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_contentGroup_Viewport_Content_lineOffset")
	alchemy.contentGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_contentGroup")
	alchemy.triangleGroup = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_contentGroup_triangleGroup")
	alchemy.triangleGroupTriangle = alchemy.triangleGroup.transform:Find("triangle").gameObject
	alchemy.contentGroupRT = alchemy.contentGroup.transform:Find("Viewport"):Find("Content"):GetComponent("RectTransform")
	alchemy.contentGroupScroll = XScrollRect:new(alchemy.contentGroup)

	function alchemy.GetPreferredHeightFunc()
		local totalLength = 0

		if alchemy.lineOffset.activeSelf then
			totalLength = totalLength + alchemy.oneLineHeight
		end

		if alchemy.itemInfoContent.gameObject.activeSelf then
			totalLength = totalLength + alchemy.itemInfoContent.textCom.preferredHeight
		end

		if alchemy.itemDescriptionContent.gameObject.activeSelf then
			totalLength = totalLength + alchemy.itemDescriptionContent.textCom.preferredHeight
		end

		if alchemy.recastReduceText.gameObject.activeSelf then
			totalLength = totalLength + alchemy.recastReduceText.textCom.preferredHeight
		end

		if alchemy.recastGainText.gameObject.activeSelf then
			totalLength = totalLength + alchemy.recastGainText.textCom.preferredHeight
		end

		return totalLength
	end

	alchemy.RightInfoBoardTF = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard").transform
	alchemy.slotItemImg = this.mainComponent:GetGameObject("PlayerInfoPanel_AlchemyInventoryPanel_ItemDescriptionBoard_ItemFrame_ItemImage")
	alchemy.slotItemImg = XImage:new(alchemy.slotItemImg)
	alchemy.slotItemName = this.mainComponent:GetText("PlayerInfoPanel_AlchemyInventoryPanel_ItemDescriptionBoard_ItemName")
	alchemy.slotItemType = this.mainComponent:GetText("PlayerInfoPanel_AlchemyInventoryPanel_ItemDescriptionBoard_ItemType")
	alchemy.slotItemDescription = this.mainComponent:GetText("PlayerInfoPanel_AlchemyInventoryPanel_ItemDescriptionBoard_ItemDes")
	alchemy.slotItemConfirmBtn = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyInventoryPanel_ItemDescriptionBoard_ConfirmBtn")
	alchemy.slotItemConfirmFunc = nil

	alchemy.slotItemConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if alchemy.slotItemConfirmFunc then
			alchemy.slotItemConfirmFunc()
		end

		PlayerInfoCtrl.OnOpenAlchemyInventory(false)
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemyBag", "slotItemConfirmBtn", alchemy.slotItemConfirmBtn)

	alchemy.TypeBar = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_TypeBarScroll_Viewport_TypeBar")
	alchemy.ExpItemLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_TypeBarScroll_Viewport_ExpItemList")

	alchemy.ExpItemLoader:SetCacheNumMax(1, 100)

	alchemy.TypeBarScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_TypeBarScroll")
	alchemy.TypeBarContentRT = alchemy.TypeBar:GetComponent("RectTransform")
	alchemy.TypeBarScroll = XScrollRect:new(alchemy.TypeBarScroll)
	alchemy.canvas = this.transform:GetComponent("Canvas")

	local screenPos = alchemy.canvas.worldCamera:WorldToScreenPoint(alchemy.TypeBarScroll.transform.position)

	alchemy.ScrollY = alchemy.TypeBarScroll.transform:GetComponent("RectTransform").sizeDelta.y
	alchemy.TopScreenY = screenPos.y + alchemy.ScrollY / 2
	alchemy.BottomScreenY = screenPos.y - alchemy.ScrollY / 2
	alchemy.TopScreenY = alchemy.TopScreenY - 50
	alchemy.BottomScreenY = alchemy.BottomScreenY + 50
	alchemy.ActiveFoldListCount = 0

	for i = 1, 10 do
		alchemy["foldList" .. i] = {}
		alchemy["foldList" .. i].titleText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_TypeBarScroll_Viewport_TypeBar_Title" .. i .. "_Text")
		alchemy["foldList" .. i].titleBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_TypeBarScroll_Viewport_TypeBar_Title" .. i)

		alchemy["foldList" .. i].titleBtn:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

		alchemy["foldList" .. i].triangle = alchemy["foldList" .. i].titleBtn.gameObject.transform:Find("triangle")
		alchemy["foldList" .. i].triangleTween = alchemy["foldList" .. i].triangle:GetComponent("XTween")

		alchemy["foldList" .. i].titleBtn:SetParentScroll(alchemy.TypeBarScroll)

		alchemy["foldList" .. i].titleGO = alchemy["foldList" .. i].titleBtn.gameObject
		alchemy["foldList" .. i].SubListLoader = this.mainComponent:GetLoader("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_LeftBoard_TypeBarScroll_Viewport_TypeBar_SubList" .. i)

		alchemy["foldList" .. i].SubListLoader:SetCacheNumMax(1, 100)

		alchemy["foldList" .. i].SubListGO = alchemy["foldList" .. i].SubListLoader.gameObject
		alchemy["foldList" .. i].isFoldListOpen = false
		alchemy["foldList" .. i].LoaderRT = alchemy["foldList" .. i].SubListGO.transform:GetComponent("RectTransform")
		alchemy["foldList" .. i].xTween = alchemy["foldList" .. i].SubListGO.transform:GetComponent("XTween")
		alchemy["foldList" .. i].canvasGroup = alchemy["foldList" .. i].SubListGO.transform:GetComponent("CanvasGroup")
		alchemy["foldList" .. i].twn = Tween:new(alchemy["foldList" .. i].LoaderRT)

		alchemy["foldList" .. i].twn:Easing(Easing.CustomQuartic.easeInOut)
		alchemy["foldList" .. i].twn:SetMoveToEnd(true)

		alchemy["foldList" .. i].titleBtnSubFunc = nil
		alchemy["foldList" .. i].titleBtnMainFunc = function(isLoadAll)
			if alchemy["foldList" .. i].titleBtnSubFunc == nil then
				UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", alchemy["foldList" .. i].titleBtn)
				UILayerCtrl.OnSelect("AlchemyFoldListTitle" .. i)
				alchemy.RightBoard:SetActive(false)
				alchemy.ConfirmBtn.gameObject:SetActive(false)

				alchemy.requireBarList[1].isEnough = false

				if alchemy["foldList" .. i].SubListLoader.loadCount < 1 then
					return
				end

				local DeltaY = alchemy.TypeBarContentRT.sizeDelta.y
				local screenPos = alchemy.canvas.worldCamera:WorldToScreenPoint(alchemy["foldList" .. i].titleBtn.transform.position)

				if alchemy["foldList" .. i].isFoldListOpen then
					alchemy["foldList" .. i].triangleTween.reversed = true
					alchemy["foldList" .. i].canvasGroup.alpha = 0.2

					alchemy["foldList" .. i].triangleTween:Play()
					PlayerInfoCtrl.AlchemyFoldListTween(alchemy["foldList" .. i].twn, 0.5, 0, function()
						UnityEngine.UI.LayoutRebuilder.MarkLayoutForRebuild(alchemy["foldList" .. i].LoaderRT)
					end)

					alchemy["foldList" .. i].isFoldListOpen = false

					alchemy["foldList" .. i].titleBtn:SetAdjacent(XButton.Adjacent.DOWN, alchemy["foldList" .. i].SubListLoader:GetChild(alchemy["foldList" .. i].SubListLoader.loadCount).btn:GetAdjacent(XButton.Adjacent.DOWN))

					if i < alchemy.ActiveFoldListCount then
						alchemy["foldList" .. i + 1].titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. i)
					end

					if i == alchemy.LastBtnIndex then
						alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. alchemy.LastBtnIndex)
					end
				else
					alchemy["foldList" .. i].triangleTween.reversed = false

					alchemy["foldList" .. i].triangleTween:Play()

					alchemy["foldList" .. i].xTween.reversed = false

					alchemy["foldList" .. i].xTween:Play()
					PlayerInfoCtrl.AlchemyFoldListTween(alchemy["foldList" .. i].twn, 0.5, -3 + 69 * alchemy["foldList" .. i].SubListLoader.loadCount, function()
						UnityEngine.UI.LayoutRebuilder.MarkLayoutForRebuild(alchemy["foldList" .. i].LoaderRT)

						if not isLoadAll and alchemy.BottomScreenY + 50 > screenPos.y then
							local deltaScrollY = (alchemy.TypeBarContentRT.sizeDelta.y - DeltaY) / (alchemy.TypeBarContentRT.sizeDelta.y - alchemy.ScrollY)

							DeltaY = alchemy.TypeBarContentRT.sizeDelta.y
							alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.y - deltaScrollY)
						end
					end)

					alchemy["foldList" .. i].isFoldListOpen = true

					alchemy["foldList" .. i].titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle" .. i .. "_Child1")

					if i < alchemy.ActiveFoldListCount then
						alchemy["foldList" .. i + 1].titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. i .. "_Child" .. alchemy["foldList" .. i].SubListLoader.loadCount)
					end

					if i == alchemy.LastBtnIndex then
						alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. alchemy.LastBtnIndex .. "_Child" .. alchemy["foldList" .. alchemy.LastBtnIndex].SubListLoader.loadCount)
					end
				end
			else
				alchemy["foldList" .. i].titleBtnSubFunc()
			end
		end

		alchemy["foldList" .. i].titleBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			alchemy["foldList" .. i].titleBtnMainFunc()
		end)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemyFoldListTitle" .. i, alchemy["foldList" .. i].titleBtn)
		alchemy["foldList" .. i].titleText:SetContent("攻击类战利品")

		alchemy["foldList" .. i].SubListLoader.loadCallback = function(index, com, data)
			return
		end
	end

	alchemy.BagPanel = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyInventoryPanel")
	alchemy.BagScroll = this.mainComponent:GetGameObject("PlayerInfoPanel_AlchemyInventoryPanel_Frame_BagScroll")
	alchemy.BagScroll = XScrollRect:new(alchemy.BagScroll)
	alchemy.BagLoader = this.mainComponent:GetLoader("PlayerInfoPanel_AlchemyInventoryPanel_Frame_BagScroll_Viewport_BagGrid")
	alchemy.BagLoader.gameObject:GetComponent("GridLayoutGroup").constraintCount = 6

	alchemy.BagLoader:SetCacheNumMax(1, 360)

	alchemy.BagPanelCloseBtn = this.mainComponent:GetButton("PlayerInfoPanel_AlchemyInventoryPanel_Close")

	alchemy.BagPanelCloseBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.OnOpenAlchemyInventory(false)
		UILayerCtrl.Pop()
	end)
	alchemy.BagPanel:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.OnOpenAlchemyInventory(false)
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddIndividual("PlayerInfoAlchemyBag", "BagPanel_Back", alchemy.BagPanel)

	alchemy.comList = {}
	alchemy.notAllowBGBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_NotAllowBG")
	alchemy.notAllowBG = alchemy.notAllowBGBtn.gameObject

	alchemy.notAllowBGBtn:SetAudioType(AudioCtrl.ButtonClickType.None)

	alchemy.requireBarList = {}
	alchemy.RequireTextGO = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_require")

	for i = 1, 3 do
		local bar = {}

		bar.go = this.mainComponent:GetGameObject("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_requireBar" .. i)
		bar.tf = bar.go.transform
		bar.greenBar = bar.tf:Find("greenBar").gameObject
		bar.redBar = bar.tf:Find("redBar").gameObject
		bar.NumTextCom = bar.tf:Find("haveText"):GetComponent("Text")
		bar.NumMaxTextCom = bar.tf:Find("requireText"):GetComponent("Text")
		bar.itemNameTextCom = bar.tf:Find("itemName"):GetComponent("Text")
		bar.NumTextComText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_requireBar" .. i .. "_haveText")
		bar.NumMaxTextComText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_requireBar" .. i .. "_requireText")
		bar.itemNameTextComText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_RightBoard_verticalGroup_requireBar" .. i .. "_itemName")

		bar.NumTextComText:SetContent("")
		bar.NumMaxTextComText:SetContent("")
		bar.itemNameTextComText:SetContent("")

		bar.itemImage = bar.tf:Find("itemIcon"):GetComponent("Image")
		alchemy.requireBarList[i] = bar
	end

	alchemy.SlotBtnList = {}
	alchemy.SlotMedcineOrigin = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_MidArea_SlotArea_SlotMedcineOrigin")
	alchemy.SlotMedcineOrigin.LackImage = alchemy.SlotMedcineOrigin.gameObject.transform:Find("Lack").gameObject
	alchemy.SlotMedcineOrigin.OtherImage = alchemy.SlotMedcineOrigin.gameObject.transform:Find("Other").gameObject
	alchemy.SlotMedcineOrigin.NumTextCom = alchemy.SlotMedcineOrigin.gameObject.transform:Find("num"):GetComponent("Text")
	alchemy.SlotMedcineOrigin.itemImageBG = alchemy.SlotMedcineOrigin.gameObject.transform:Find("ItemBG").gameObject
	alchemy.SlotMedcineOrigin.itemImage = alchemy.SlotMedcineOrigin.gameObject.transform:Find("ItemBG"):Find("Item"):GetComponent("Image")

	alchemy.SlotMedcineOrigin:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	table.insert(alchemy.SlotBtnList, alchemy.SlotMedcineOrigin)

	alchemy.SlotMedcineAssist = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_MidArea_SlotArea_SlotMedcineAssist")
	alchemy.SlotMedcineAssist.LackImage = alchemy.SlotMedcineAssist.gameObject.transform:Find("Lack").gameObject
	alchemy.SlotMedcineAssist.OtherImage = alchemy.SlotMedcineAssist.gameObject.transform:Find("Other").gameObject
	alchemy.SlotMedcineAssist.NumTextCom = alchemy.SlotMedcineAssist.gameObject.transform:Find("num"):GetComponent("Text")
	alchemy.SlotMedcineAssist.itemImageBG = alchemy.SlotMedcineAssist.gameObject.transform:Find("ItemBG").gameObject
	alchemy.SlotMedcineAssist.itemImage = alchemy.SlotMedcineAssist.gameObject.transform:Find("ItemBG"):Find("Item"):GetComponent("Image")

	alchemy.SlotMedcineAssist:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	table.insert(alchemy.SlotBtnList, alchemy.SlotMedcineAssist)

	alchemy.SlotTrophyOrigin = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_MidArea_SlotArea_SlotTrophyOrigin")
	alchemy.SlotTrophyOrigin.LackImage = alchemy.SlotTrophyOrigin.gameObject.transform:Find("Lack").gameObject
	alchemy.SlotTrophyOrigin.OtherImage = alchemy.SlotTrophyOrigin.gameObject.transform:Find("Other").gameObject
	alchemy.SlotTrophyOrigin.NumTextCom = alchemy.SlotTrophyOrigin.gameObject.transform:Find("num"):GetComponent("Text")
	alchemy.SlotTrophyOrigin.itemImageBG = alchemy.SlotTrophyOrigin.gameObject.transform:Find("ItemBG").gameObject
	alchemy.SlotTrophyOrigin.itemImage = alchemy.SlotTrophyOrigin.gameObject.transform:Find("ItemBG"):Find("Item"):GetComponent("Image")

	alchemy.SlotTrophyOrigin:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	table.insert(alchemy.SlotBtnList, alchemy.SlotTrophyOrigin)

	alchemy.SlotTrophy = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_MidArea_SlotArea_SlotTrophy")
	alchemy.SlotTrophy.LackImage = alchemy.SlotTrophy.gameObject.transform:Find("Lack").gameObject
	alchemy.SlotTrophy.OtherImage = alchemy.SlotTrophy.gameObject.transform:Find("Other").gameObject
	alchemy.SlotTrophy.NumTextCom = alchemy.SlotTrophy.gameObject.transform:Find("num"):GetComponent("Text")
	alchemy.SlotTrophy.itemImageBG = alchemy.SlotTrophy.gameObject.transform:Find("ItemBG").gameObject
	alchemy.SlotTrophy.itemImage = alchemy.SlotTrophy.gameObject.transform:Find("ItemBG"):Find("Item"):GetComponent("Image")

	alchemy.SlotTrophy:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	table.insert(alchemy.SlotBtnList, alchemy.SlotTrophy)

	alchemy.SlotTrophyAssist = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_MidArea_SlotArea_SlotTrophyAssist")
	alchemy.SlotTrophyAssist.LackImage = alchemy.SlotTrophyAssist.gameObject.transform:Find("Lack").gameObject
	alchemy.SlotTrophyAssist.OtherImage = alchemy.SlotTrophyAssist.gameObject.transform:Find("Other").gameObject
	alchemy.SlotTrophyAssist.NumTextCom = alchemy.SlotTrophyAssist.gameObject.transform:Find("num"):GetComponent("Text")
	alchemy.SlotTrophyAssist.itemImageBG = alchemy.SlotTrophyAssist.gameObject.transform:Find("ItemBG").gameObject
	alchemy.SlotTrophyAssist.itemImage = alchemy.SlotTrophyAssist.gameObject.transform:Find("ItemBG"):Find("Item"):GetComponent("Image")

	alchemy.SlotTrophyAssist:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	table.insert(alchemy.SlotBtnList, alchemy.SlotTrophyAssist)

	alchemy.SlotOriginStone = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_MidArea_SlotArea_SlotOriginStone")
	alchemy.SlotOriginStone.LackImage = alchemy.SlotOriginStone.gameObject.transform:Find("Lack").gameObject
	alchemy.SlotOriginStone.OtherImage = alchemy.SlotOriginStone.gameObject.transform:Find("Other").gameObject
	alchemy.SlotOriginStone.NumTextCom = alchemy.SlotOriginStone.gameObject.transform:Find("num"):GetComponent("Text")
	alchemy.SlotOriginStone.itemImageBG = alchemy.SlotOriginStone.gameObject.transform:Find("ItemBG").gameObject
	alchemy.SlotOriginStone.itemImage = alchemy.SlotOriginStone.gameObject.transform:Find("ItemBG"):Find("Item"):GetComponent("Image")

	alchemy.SlotOriginStone:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	table.insert(alchemy.SlotBtnList, alchemy.SlotOriginStone)

	alchemy.toBlendItemBtn = nil
	alchemy.ConfirmBtn = this.mainComponent:GetButton("PlayerInfoPanel_PlayerPanel_B_TabPanel_MetalTab_MidArea_Confirm")
	alchemy.ConfirmBtnText = this.mainComponent:GetText("PlayerInfoPanel_PlayerPanel_B_TabPanel_MetalTab_MidArea_Confirm_Text")

	alchemy.ConfirmBtn:SetLongPressCallBack(PlayerInfoCtrl.AlchemyConfirm, function()
		return alchemy.ConfirmBtn.gameObject.activeSelf == false or UILayerCtrl.GetCurrentLayerName() ~= "PlayerInfoAlchemy"
	end, 6)

	alchemy.currentSlotBtnItem = nil

	UILayerCtrl.AddIndividual("PlayerInfoAlchemy", "AlchemyConfirmBtn", alchemy.ConfirmBtn)
end

function PlayerInfoCtrl.SetAlchemyItemSelectPanelActive(bool)
	alchemy.ItemSelectPanel:SetActive(bool)
	gamePadIcon.prev_lb:SetActive(bool)
	gamePadIcon.next_rb:SetActive(bool)
	gamePadIcon.lock_r3:SetActive(bool)
	keyboardIcon.prev_lb:SetActive(bool)
	keyboardIcon.next_rb:SetActive(bool)
	keyboardIcon.lock_r3:SetActive(bool)
	gamePadIcon.add_r:SetActive(false)
	gamePadIcon.min_l:SetActive(false)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardIconRT)
end

function PlayerInfoCtrl.OnAlchemyGetItem(item, num, isRecast, cb)
	if item then
		local iconList = {}

		table.insert(iconList, item.itemIcon)

		if item:GetMainType() == MS_ItemData.MainType.Trophy then
			if isRecast then
				local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(item:GetSubProperty(), item:GetQuality())
				local st = GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value

				UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_GET, "", item:GetTrophyName() .. "\n" .. st, iconList, cb, this)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_GET, "", item:GetTrophyName(), iconList, cb, this)
			end
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_GET, "", item:GetItemName() .. " x " .. num, iconList, cb, this)
		end
	end
end

function PlayerInfoCtrl.RePutMainSlot(item)
	alchemy.StrengthenItemMainSlot.item = item
	alchemy.ItemSelect.currentTrophySlot = alchemy.StrengthenItemMainSlot

	if alchemy.ItemSelect.currentTrophySlot == alchemy.StrengthenItemMainSlot then
		PlayerInfoCtrl.ResetAlchemySubSlotItem()
	end

	PlayerInfoCtrl.RefreshResultAlchemeyItemInfo()

	alchemy.ItemSelect.currentTrophySlotName = "StrengthenItemMainSlot"

	UILayerCtrl.OnSelect(alchemy.ItemSelect.currentTrophySlotName)
	PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
end

function PlayerInfoCtrl.AlchemyConfirm(repeatDedicationTimes)
	if alchemy.ConfirmBtn.gameObject.activeSelf == false or alchemy.ItemSelectPanel.activeSelf then
		return
	end

	local gameController = sceneController:GetGameController()

	if alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyAgentia or alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyTrophy then
		if alchemy.requireBarList[1].isEnough and alchemy.requireBarList[2].isEnough and alchemy.requireBarList[3].isEnough then
			if alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyTrophy then
				if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)

					return
				end
			elseif alchemy.itemInfoNumText.num + 1 > alchemy.itemInfoNumMaxText.numMax then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.Story_BagIsFull)

				return
			end

			local function cfunc()
				local newItem = gameController:AddBagItem(alchemy.toBlendItemBtn.itemData.ItemId, alchemy.ConfirmGroup.NumText.num, false)

				FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemMakeTimes, alchemy.toBlendItemBtn.itemData.ItemId, alchemy.ConfirmGroup.NumText.num)

				for k, v in pairs(alchemy.requireBarList) do
					if v.itemId ~= 0 then
						gameController:UseBagItem(v.itemId, v.enoughNum * alchemy.ConfirmGroup.NumText.num)
						PlayerInfoCtrl.RefreshRequireBarAfterBlend(v)
					end
				end

				alchemy.itemInfoNumText.num = alchemy.itemInfoNumText.num + alchemy.ConfirmGroup.NumText.num

				alchemy.itemInfoNumText:SetContent(alchemy.itemInfoNumText.num)

				if alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyAgentia then
					AudioCtrl.SetUIAudio("player_info/alchemy_potion")
				elseif alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyTrophy then
					PlayerInfoCtrl.RefreshTrophyNewLight()
					AudioCtrl.SetUIAudio("player_info/alchemy_trophy")
				end

				if newItem:GetMainType() == MS_ItemData.MainType.Attack then
					gameController:RecordAchievement(MS_Achievement.AchievementIdType.AttactItemAlchemy, alchemy.ConfirmGroup.NumText.num)
				elseif newItem:GetMainType() == MS_ItemData.MainType.Trophy then
					gameController:RecordAchievement(MS_Achievement.AchievementIdType.TrophyAlchemy, alchemy.ConfirmGroup.NumText.num)
				elseif newItem:GetMainType() == MS_ItemData.MainType.Consume then
					gameController:RecordAchievement(MS_Achievement.AchievementIdType.AssistConsumeItemAlchemy, alchemy.ConfirmGroup.NumText.num)
				end

				gameController:RecordAchievement(MS_Achievement.AchievementIdType.FirstTimeDoAlchemy, 1)
				PlayerInfoCtrl.OnAlchemyGetItem(newItem, alchemy.ConfirmGroup.NumText.num, false, function()
					if alchemy.toBlendItemBtn then
						alchemy.toBlendItemBtn:SetCommonHighlighted(true)
					end
				end)
				gameController:DoAlchemy()
			end

			if alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyAgentia then
				local maxNum = alchemy.itemInfoNumMaxText.numMax - alchemy.itemInfoNumText.num

				if alchemy.requireBarList[1].enoughMaxNum > -1 and maxNum > alchemy.requireBarList[1].enoughMaxNum then
					maxNum = alchemy.requireBarList[1].enoughMaxNum
				end

				if alchemy.requireBarList[2].enoughMaxNum > -1 and maxNum > alchemy.requireBarList[2].enoughMaxNum then
					maxNum = alchemy.requireBarList[2].enoughMaxNum
				end

				if alchemy.requireBarList[3].enoughMaxNum > -1 and maxNum > alchemy.requireBarList[3].enoughMaxNum then
					maxNum = alchemy.requireBarList[3].enoughMaxNum
				end

				PlayerInfoCtrl.OpenAlchemyConfirnPanel(GameText.UI_ALCHEMY_IS_CONFIRM_MAKE .. " " .. alchemy.toBlendItemBtn.itemData.Name .. "?", cfunc, true, maxNum)
				alchemy.toBlendItemBtn:SetCommonHighlighted(true)
			elseif alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyTrophy then
				PlayerInfoCtrl.OpenAlchemyConfirnPanel(GameText.UI_ALCHEMY_IS_CONFIRM_MAKE .. " " .. alchemy.toBlendItemBtn.itemData.Name .. "?", cfunc, false)
				alchemy.toBlendItemBtn:SetCommonHighlighted(true)
			end
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_MATERIAL)
		end
	elseif alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyEnchant then
		if alchemy.Status == nil then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_MATERIAL)

			return
		end

		if alchemy.StrengthenItemMainSlot.item == nil then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_MATERIAL)

			return
		end

		local function cfunc()
			local ret = PlayerInfoCtrl.GetAlchemyStrengthOrRecastResult()

			if ret then
				local newItem = alchemy.StrengthenItemMainSlot.item

				if alchemy.Status == MS_ItemData.Type.StrengthenStone then
					AudioCtrl.SetUIAudio("player_info/alchemy_strengthen")
					PlayerInfoCtrl.OnAlchemyGetItem(alchemy.StrengthenItemMainSlot.item, 1)

					if alchemy.StrengthenItemMainSlot.item:GetLevel() == MS_ItemData.TrophyStrengthLevelMax then
						if FS_UserData.story:GetAchievementComplete(MS_Achievement.AchievementIdType.AlchemyAllItem) then
							gameController:RecordAchievement(MS_Achievement.AchievementIdType.StrengthTrophySix, 1)
						end

						gameController:RecordAchievement(MS_Achievement.AchievementIdType.AlchemyAllItem, 1)
					end
				elseif alchemy.Status == MS_ItemData.Type.RecastStone then
					AudioCtrl.SetUIAudio("player_info/alchemy_recast")
					PlayerInfoCtrl.OnAlchemyGetItem(alchemy.StrengthenItemMainSlot.item, 1, true)
				end

				FS_UserData.trophy:UpdateAll()
				gameController:DoAlchemy()
				PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
				PlayerInfoCtrl.RefreshResultAlchemeyItemInfo()

				if alchemy.Status == MS_ItemData.Type.StrengthenStone then
					if newItem:GetLevel() < MS_ItemData.TrophyStrengthLevelMax then
						PlayerInfoCtrl.RePutMainSlot(newItem)
					end
				elseif alchemy.Status == MS_ItemData.Type.RecastStone then
					PlayerInfoCtrl.RePutMainSlot(newItem)
				end
			end
		end

		if alchemy.Status == MS_ItemData.Type.StrengthenStone then
			if alchemy.requireBarList[1].isEnough == false then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_MATERIAL)

				return
			end

			PlayerInfoCtrl.OpenAlchemyConfirnPanel(GameText.UI_ALCHEMY_IS_CONFIRM_STRENGTH .. " " .. alchemy.StrengthenItemMainSlot.item:GetTrophyName() .. "?", cfunc, false)
		elseif alchemy.Status == MS_ItemData.Type.RecastStone then
			if alchemy.StrengthenItemSubSlot.item == nil then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_MATERIAL)

				return
			end

			if alchemy.StrengthenItemSubSlot.item:GetIsLock() then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_LOCKED)

				return
			end

			PlayerInfoCtrl.OpenAlchemyConfirnPanel(GameText.UI_ALCHEMY_IS_CONFIRM_RECAST .. " " .. alchemy.StrengthenItemMainSlot.item:GetTrophyName() .. "?" .. "\n" .. GameText.UI_ALCHEMY_NEED_CONSUME .. " " .. alchemy.StrengthenItemSubSlot.item:GetTrophyName(), cfunc, false)
		end
	elseif alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyDedication then
		local tempData = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex))

		if tempData.level >= MS_HeroData.HeroLevelMax then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LEVEL_MAX)

			return
		end

		if repeatDedicationTimes == nil then
			repeatDedicationTimes = 1
		end

		if alchemy.itemData == nil or alchemy.itemInfoNumText.num == 0 then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_LACK_OF_EXPITEM)

			return
		else
			if repeatDedicationTimes > alchemy.itemInfoNumText.num then
				repeatDedicationTimes = alchemy.itemInfoNumText.num
			end

			if repeatDedicationTimes > 1 and alchemy.itemData.ItemId == MS_ItemData.ItemID_ExpAddList[4] then
				repeatDedicationTimes = 2
			end

			if tempData.level == MS_HeroData.HeroLevelMax - 1 then
				local expItem = MS_ItemData.GetItemData(alchemy.itemData.ItemId)
				local expPerItem = expItem.Param1
				local expTotal = MS_HeroExp.GetHeroRequireExp(tempData.level + 1)
				local expRemain = expTotal - tempData.exp
				local dedicationMax = Mathf.Ceil(expRemain / expPerItem)

				if dedicationMax < repeatDedicationTimes then
					repeatDedicationTimes = dedicationMax
				end
			end

			property.finalLevelLast = tempData.level

			PlayerInfoCtrl.UseHeroExpItem(FS_UserData.story:GetUIHeroId(currentHeroIndex), alchemy.itemData.ItemId, repeatDedicationTimes)

			if repeatDedicationTimes == 1 then
				gameController:Dedicate()
			end

			alchemy.itemInfoNumText.num = alchemy.itemInfoNumText.num - repeatDedicationTimes

			alchemy.itemInfoNumText:SetContent(alchemy.itemInfoNumText.num)

			if alchemy.ExpItemCom then
				alchemy.ExpItemCom.numText.num = alchemy.ExpItemCom.numText.num - repeatDedicationTimes

				alchemy.ExpItemCom.numText:SetContent(alchemy.ExpItemCom.numText.num)

				if alchemy.ExpItemCom.numText.num > 0 then
					alchemy.ExpItemCom.itemIcon:SetGray(false)
				else
					alchemy.ExpItemCom.itemIcon:SetGray(true)
				end
			end
		end
	end
end

function PlayerInfoCtrl.OpenAlchemyConfirnPanel(mainText, ConfirmFunc, isContainCount, maxNum)
	UILayerCtrl.Push("PlayerInfoAlchemyConfirm", "PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Confirm")
	alchemy.ConfirmGroup.MainText:SetContent(mainText)
	alchemy.ConfirmGroup.CountGroupGO:SetActive(isContainCount)

	alchemy.ConfirmGroup.NumText.num = 1

	if isContainCount then
		alchemy.ConfirmGroup.NumText.maxNum = maxNum
	end

	alchemy.ConfirmGroup.MinBtn:SetDisabled(true)

	if alchemy.ConfirmGroup.NumText.maxNum > alchemy.ConfirmGroup.NumText.num then
		alchemy.ConfirmGroup.AddBtn:SetNormal()
	else
		alchemy.ConfirmGroup.AddBtn:SetDisabled(true)
	end

	alchemy.ConfirmGroup.NumText:SetContent(alchemy.ConfirmGroup.NumText.num)
	alchemy.ConfirmPanel:SetActive(true)
	alchemy.ConfirmGroup.ConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		alchemy.ConfirmPanel:SetActive(false)
		UILayerCtrl.Pop()
		ConfirmFunc()
	end)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.ConfirmGroup.BGRT)
end

function PlayerInfoCtrl.ShowAlchemyItemDescription(itemId)
	if itemId then
		local itemData = MS_ItemData.GetItemData(itemId)
		local sprite = XObjectPool.GetIcon("item" .. itemData.Icon)

		alchemy.itemInfoImg:SetSprite(sprite)
		alchemy.itemInfoImg.gameObject:SetActive(true)
		alchemy.itemInfoName:SetContent(itemData.Name)

		for k, v in pairs(alchemy.HeadFrameTypeIconList) do
			v:SetActive(false)
		end

		alchemy.itemData = itemData

		alchemy.RightBoard:SetActive(true)
		alchemy.ConfirmBtn.gameObject:SetActive(true)
		alchemy.AgentiaBG:SetActive(false)
		alchemy.RequireTextGO:SetActive(true)

		if itemData.MainType == MS_ItemData.MainType.Trophy then
			alchemy.HeadFrameTypeIconList[itemData.Type]:SetActive(true)
			alchemy.itemInfoContent.gameObject:SetActive(true)
			alchemy.itemInfoLine:SetActive(true)
			alchemy.itemInfoContent:SetContent(MS_ItemData.GetTrophyRawBounsText(itemId))
			alchemy.itemInfoNumGroup:SetActive(false)

			alchemy.itemInfoNumText.num = 0
			alchemy.itemInfoNumMaxText.numMax = 99999
		else
			alchemy.AgentiaBG:SetActive(true)

			if itemData.MainType == MS_ItemData.MainType.Exp then
				alchemy.alchemyBG:SetActive(false)
				alchemy.dedicationBG:SetActive(true)
			else
				alchemy.alchemyBG:SetActive(true)
				alchemy.dedicationBG:SetActive(false)
			end

			alchemy.itemInfoContent.gameObject:SetActive(false)
			alchemy.itemInfoLine:SetActive(false)
			alchemy.itemInfoNumGroup:SetActive(true)

			alchemy.itemInfoNumText.num = FS_UserData.itemList:GetItemNum(itemId)

			alchemy.itemInfoNumText:SetContent(alchemy.itemInfoNumText.num)

			alchemy.itemInfoNumMaxText.numMax = itemData.NumMax

			alchemy.itemInfoNumMaxText:SetContent("/" .. alchemy.itemInfoNumMaxText.numMax)

			if alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyDedication then
				local heroData = FS_UserData.heroList:GetHero(FS_UserData.story:GetUIHeroId(currentHeroIndex))

				PlayerInfoCtrl.AlchemySetCurrentExpValue(heroData)
				alchemy.RequireTextGO:SetActive(false)
				alchemy.requireBarList[1].go:SetActive(false)

				alchemy.requireBarList[1].isEnough = false

				alchemy.requireBarList[2].go:SetActive(false)

				alchemy.requireBarList[2].isEnough = false

				alchemy.requireBarList[3].go:SetActive(false)

				alchemy.requireBarList[3].isEnough = false
			end
		end

		alchemy.itemDescriptionContent:SetContent(itemData.Description)
		alchemy.lineOffset:SetActive(alchemy.itemDescriptionContent.gameObject.activeSelf and alchemy.itemInfoContent.gameObject.activeSelf)
	else
		alchemy.RightBoard:SetActive(false)
		alchemy.ConfirmBtn.gameObject:SetActive(false)
		alchemy.itemInfoImg.gameObject:SetActive(false)
		alchemy.itemInfoName:SetContent("")
		alchemy.itemInfoContent:SetContent("")
		alchemy.itemInfoContent.gameObject:SetActive(false)
		alchemy.itemInfoLine:SetActive(false)
		alchemy.itemDescriptionContent:SetContent("")
		alchemy.lineOffset:SetActive(false)

		for k, v in pairs(alchemy.requireBarList) do
			v.isEnough = false
		end
	end

	alchemy.VerticalGroup:SetActive(true)
	alchemy.recastReduceText.gameObject:SetActive(false)
	alchemy.recastGainText.gameObject:SetActive(false)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.contentGroupRT)
	alchemy.triangleGroup:SetActive(alchemy.GetPreferredHeightFunc() > alchemy.contentHeight + 0.3)
	alchemy.triangleGroupTriangle:SetActive(alchemy.GetPreferredHeightFunc() > alchemy.contentHeight + 0.3)

	alchemy.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

	alchemy.strengthenOffset:SetActive(false)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.VerticalGroup:GetComponent("RectTransform"))
end

function PlayerInfoCtrl.ShowAlchemyStrengthenDescription()
	alchemy.itemInfoImg.gameObject:SetActive(false)
	alchemy.RightBoard:SetActive(true)
	alchemy.ConfirmBtn.gameObject:SetActive(false)
	alchemy.AgentiaBG:SetActive(false)
	alchemy.AlchemyOffset:SetActive(true)
	alchemy.HeadFrame:SetActive(false)
	alchemy.itemInfoImg.gameObject:SetActive(false)
	alchemy.VerticalGroup:SetActive(false)
end

function PlayerInfoCtrl.GetAlchemyValidItemList(itemIdList)
	local tempList = {}

	for k, v in pairs(itemIdList) do
		if itemList[tonumber(v)] ~= nil then
			table.insert(tempList, itemList[tonumber(v)])
		end

		for _k, _v in pairs(trophyList) do
			if _v.itemId == tonumber(v) then
				table.insert(tempList, _v)
			end
		end
	end

	return tempList
end

function PlayerInfoCtrl.ShowAlchemyInventoryItemDescription(item)
	if item then
		local itemData = item:GetItemData()
		local sprite = XObjectPool.GetIcon("item" .. itemData.Icon)

		alchemy.slotItemImg:SetSprite(sprite)
		alchemy.slotItemImg.gameObject:SetActive(true)
		alchemy.slotItemName:SetContent(itemData.Name)
		alchemy.slotItemType:SetContent(GameText["UI_ITEMTYPE_" .. itemData.Type])
	else
		alchemy.slotItemImg.gameObject:SetActive(false)
		alchemy.slotItemName:SetContent("")
		alchemy.slotItemType:SetContent("")
		alchemy.slotItemDescription:SetContent("")
	end
end

function PlayerInfoCtrl.AlchemyFoldListTween(twn, dur, To, updateCall, callback)
	if twn.isPlaying then
		twn:Stop()
	end

	local tbl = {
		sizeDelta = Vector2.New(274, To)
	}

	twn:MoveTo(tbl, dur)
	twn:OnUpdate(updateCall)
	twn:OnComplete(callback)
	twn:Start()
end

function PlayerInfoCtrl.ResetAllAlchemySlot()
	for k, v in pairs(alchemy.SlotBtnList) do
		v.gameObject:SetActive(false)
		v.LackImage:SetActive(false)
		v.OtherImage:SetActive(false)
		v.itemImageBG:SetActive(false)

		v.NumTextCom.text = "0/0"
		v.NumTextCom.color = Color.New(1, 1, 1, 1)
		v.isEnough = false
		v.currentItem = nil

		v:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			return
		end)
	end

	alchemy.toBlendItemBtn = nil

	PlayerInfoCtrl.ShowAlchemyItemDescription()
end

function PlayerInfoCtrl.PutDownAllAlchemySlotItem()
	for k, v in pairs(alchemy.SlotBtnList) do
		v.LackImage:SetActive(false)
		v.OtherImage:SetActive(false)
		v.itemImageBG:SetActive(false)

		v.NumTextCom.text = "0/0"
		v.NumTextCom.color = Color.New(1, 1, 1, 1)
		v.isEnough = false
		v.currentItem = nil

		v:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			return
		end)
	end

	if alchemy.toBlendItemBtn then
		alchemy.toBlendItemBtn:SetNormal()
	end

	alchemy.toBlendItemBtn = nil

	PlayerInfoCtrl.ShowAlchemyItemDescription()
end

function PlayerInfoCtrl.LoadAlchemyDedication()
	PlayerInfoCtrl.FoldAllAlchemyTitle()

	alchemy.itemData = nil

	local heroData = FS_UserData.heroList:GetHero(sceneController:GetHostPlayerHeroId())

	PlayerInfoCtrl.AlchemySetCurrentExpValue(heroData)
	alchemy.RestBg:SetActive(false)
	alchemy.RestTitle:SetActive(false)
	alchemy.ConfirmBtnText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_DEDICATION)
	alchemy.mainTypeText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_DEDICATION)
	alchemy.TypeBar:SetActive(false)
	alchemy.ExpItemLoader.gameObject:SetActive(true)
	alchemy.DedicationTitle:SetActive(true)
	alchemy.AgentiaTitle:SetActive(false)
	alchemy.TrophyTitle:SetActive(false)
	alchemy.EnchantTitle:SetActive(false)
	alchemy.RecastBtn.gameObject:SetActive(false)
	alchemy.StrengthenBtn.gameObject:SetActive(false)
	alchemy.AlchemyOffset:SetActive(true)
	alchemy.HeadFrame:SetActive(false)
	alchemy.ExpBarBG:SetActive(false)
	alchemy.ExpBarBG:SetActive(true)
	alchemy.AttributePointTip.gameObject:SetActive(false)

	alchemy.PermitExpItemList = {}

	local gameController = sceneController:GetGameController()

	for i = 1, MS_ItemData.ExpItemMax do
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or gameController:CheckShowQuestComplete(MS_ItemData.ExpItemQuestIdList[i]) == true then
			table.insert(alchemy.PermitExpItemList, MS_ItemData.ItemID_ExpAddList[i])
		end
	end

	alchemy.ExpItemLoader.loadCount = #alchemy.PermitExpItemList

	function alchemy.ExpItemLoader.loadCallback(index, com, data)
		local itemData = MS_ItemData.GetItemData(alchemy.PermitExpItemList[index])
		local nameText = com:GetText("Loader_AlchemyItem_Text")
		local btn = com:GetButton("Loader_AlchemyItem_Btn")
		local numText = com:GetText("NumText")

		numText.gameObject:SetActive(true)

		local itemIcon = com:GetGameObject("Btn_item")

		itemIcon = XImage:new(itemIcon)
		com.newLight = com:GetGameObject("newLight")

		local tmpItem = FS_UserData.itemList:GetItem(itemData.ItemId)

		if tmpItem ~= nil then
			com.newLight:SetActive(tmpItem:IsNew())
		else
			com.newLight:SetActive(false)
		end

		local sprite = XObjectPool.GetIcon("item" .. itemData.Icon)

		itemIcon:SetSprite(sprite)
		nameText:SetContent(itemData.Name)

		com.itemIcon = itemIcon
		com.numText = numText
		com.numText.num = FS_UserData.itemList:GetItemNum(itemData.ItemId)

		com.numText:SetContent(com.numText.num)

		if com.numText.num > 0 then
			com.itemIcon:SetGray(true)
			com.itemIcon:SetGray(false)
		else
			com.itemIcon:SetGray(true)
		end

		btn:SetCommonHighlighted(true)
		btn:SetCommonHighlighted(false)
		btn:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local tmpItem = FS_UserData.itemList:GetItem(itemData.ItemId)

			if tmpItem ~= nil then
				tmpItem:SetOld()
			end

			com.newLight:SetActive(false)

			alchemy.ExpItemCom = com

			PlayerInfoCtrl.ShowAlchemyItemDescription(itemData.ItemId)
			UILayerCtrl.OnSelect("AlchemyExpItem1")
			UILayerCtrl.OnSelect("AlchemyExpItem" .. index)
			btn:SetSelectedLight(true)
		end)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemyExpItem" .. index, btn)

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyExpItem" .. index - 1)
		else
			btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyExpItem" .. alchemy.ExpItemLoader.loadCount)
		end

		if index < alchemy.ExpItemLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyExpItem" .. index + 1)
		else
			btn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyExpItem1")
		end

		if index == 1 then
			btn:OnDownMute(nil, nil)
			btn:OnClick(nil, nil)
			UILayerCtrl.OnSelect("DedicationTabBtn")
			btn:SetCommonHighlighted(true)
			alchemy.RequireTextGO:SetActive(false)
			alchemy.requireBarList[1].go:SetActive(false)
			alchemy.requireBarList[2].go:SetActive(false)
			alchemy.requireBarList[3].go:SetActive(false)
		end

		btn:SetAdjacent(XButton.Adjacent.LEFT, "DedicationTabBtn")
	end

	alchemy.ExpItemLoader:Load()
end

function PlayerInfoCtrl.LoadAlchemyRest()
	alchemy.RestBg:SetActive(true)
	alchemy.RightBoard:SetActive(false)
	alchemy.RestTitle:SetActive(true)
	alchemy.AgentiaTitle:SetActive(false)
	alchemy.TrophyTitle:SetActive(false)
	alchemy.EnchantTitle:SetActive(false)
	alchemy.DedicationTitle:SetActive(false)
	alchemy.ExpBarBG:SetActive(false)
	alchemy.AttributePointTip.gameObject:SetActive(false)
	alchemy.ConfirmBtn.gameObject:SetActive(false)
	alchemy.mainTypeText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_REST)
end

function PlayerInfoCtrl.LoadAlchemyAgentia()
	PlayerInfoCtrl.FoldAllAlchemyTitle()
	alchemy.ConfirmBtnText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_ALCHEMY)
	alchemy.mainTypeText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_CONSUME)
	alchemy.RestBg:SetActive(false)
	alchemy.RestTitle:SetActive(false)
	alchemy.AgentiaTitle:SetActive(true)
	alchemy.TrophyTitle:SetActive(false)
	alchemy.EnchantTitle:SetActive(false)
	alchemy.DedicationTitle:SetActive(false)
	alchemy.AlchemyOffset:SetActive(true)
	alchemy.HeadFrame:SetActive(false)
	alchemy.TypeBar:SetActive(true)
	alchemy.ExpBarBG:SetActive(false)
	alchemy.AttributePointTip.gameObject:SetActive(false)
	alchemy.ExpItemLoader.gameObject:SetActive(false)
	alchemy.RecastBtn.gameObject:SetActive(false)
	alchemy.StrengthenBtn.gameObject:SetActive(false)

	for i = 3, 10 do
		alchemy["foldList" .. i].titleGO:SetActive(false)
		alchemy["foldList" .. i].SubListGO:SetActive(false)
	end

	local recorveyList = PlayerInfoCtrl.CheckAlchemyQuest(MS_FormulaData.GetFormulaDataListByFormulaType(MS_ItemData.Type.MedcineRecovery))

	alchemy.ActiveFoldListCount = 3

	alchemy.foldList1.titleText:SetContent(GameText.UI_PLAYERINFO_MEDCINE_RECORVER)

	alchemy.foldList1.titleBtnSubFunc = nil

	alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "AgentiaTabBtn")
	alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle2")

	alchemy.foldList1.SubListLoader.loadCount = #recorveyList
	alchemy.foldList1.SubListLoader.loadCallback = PlayerInfoCtrl.AlchemyAgentiaSubTitleLoadCallback

	alchemy.foldList1.titleGO:SetActive(alchemy.foldList1.SubListLoader.loadCount > 0)
	alchemy.foldList1.SubListGO:SetActive(alchemy.foldList1.SubListLoader.loadCount > 0)

	local defenseList = PlayerInfoCtrl.CheckAlchemyQuest(MS_FormulaData.GetFormulaDataListByFormulaType(MS_ItemData.Type.MedcineDefense))

	alchemy.foldList2.titleText:SetContent(GameText.UI_PLAYERINFO_MEDCINE_DEFFENSE)

	alchemy.foldList2.titleBtnSubFunc = nil

	alchemy.foldList2.titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "AgentiaTabBtn")
	alchemy.foldList2.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle1")
	alchemy.foldList2.titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle3")

	alchemy.foldList2.SubListLoader.loadCount = #defenseList
	alchemy.foldList2.SubListLoader.loadCallback = PlayerInfoCtrl.AlchemyAgentiaSubTitleLoadCallback

	alchemy.foldList2.titleGO:SetActive(alchemy.foldList2.SubListLoader.loadCount > 0)
	alchemy.foldList2.SubListGO:SetActive(alchemy.foldList2.SubListLoader.loadCount > 0)

	local strengthList = PlayerInfoCtrl.CheckAlchemyQuest(MS_FormulaData.GetFormulaDataListByFormulaType(MS_ItemData.Type.MedcineStrengthen))

	alchemy.foldList3.titleText:SetContent(GameText.UI_PLAYERINFO_MEDCINE_STRENGTHEN)

	alchemy.foldList3.titleBtnSubFunc = nil

	alchemy.foldList3.titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "AgentiaTabBtn")
	alchemy.foldList3.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle2")

	alchemy.foldList3.SubListLoader.loadCount = #strengthList
	alchemy.foldList3.SubListLoader.loadCallback = PlayerInfoCtrl.AlchemyAgentiaSubTitleLoadCallback

	alchemy.foldList3.titleGO:SetActive(alchemy.foldList3.SubListLoader.loadCount > 0)
	alchemy.foldList3.SubListGO:SetActive(alchemy.foldList3.SubListLoader.loadCount > 0)

	local notFound = true

	alchemy.FirstBtnIndex = 1

	for i = 1, alchemy.ActiveFoldListCount do
		if alchemy["foldList" .. i].SubListLoader.loadCount > 0 and notFound then
			alchemy.AgentiaTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemyFoldListTitle" .. i)

			alchemy.FirstBtnIndex = i
			notFound = false
		end
	end

	notFound = true
	alchemy.LastBtnIndex = alchemy.ActiveFoldListCount

	for i = alchemy.ActiveFoldListCount, 1 do
		if alchemy["foldList" .. i].SubListLoader.loadCount > 0 and notFound then
			alchemy.LastBtnIndex = i
			notFound = false
		end
	end

	alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. alchemy.LastBtnIndex)
	alchemy.foldList3.titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle" .. alchemy.FirstBtnIndex)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", alchemy.foldList1.titleBtn)

	local dataTbl = {}

	table.insert(dataTbl, 1, 1)
	table.insert(dataTbl, 2, recorveyList)
	alchemy.foldList1.SubListLoader:Load(dataTbl)

	local dataTbl = {}

	table.insert(dataTbl, 1, 2)
	table.insert(dataTbl, 2, defenseList)
	alchemy.foldList2.SubListLoader:Load(dataTbl)

	local dataTbl = {}

	table.insert(dataTbl, 1, 3)
	table.insert(dataTbl, 2, strengthList)
	alchemy.foldList3.SubListLoader:Load(dataTbl)

	if alchemy.foldList1.SubListLoader.loadCount > 0 then
		alchemy.foldList1.titleBtnMainFunc(true)
	end

	if alchemy.foldList2.SubListLoader.loadCount > 0 then
		alchemy.foldList2.titleBtnMainFunc(true)
	end

	if alchemy.foldList3.SubListLoader.loadCount > 0 then
		alchemy.foldList3.titleBtnMainFunc(true)
	end

	alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, 1)
end

function PlayerInfoCtrl.OnOpenAlchemyInventory(open)
	alchemy.BagPanel.gameObject:SetActive(open)
end

function PlayerInfoCtrl.LoadAlchemyTrophy()
	PlayerInfoCtrl.FoldAllAlchemyTitle()
	alchemy.ConfirmBtnText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_ALCHEMY)
	alchemy.mainTypeText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_TROPHY)
	alchemy.RestBg:SetActive(false)
	alchemy.RestTitle:SetActive(false)
	alchemy.AgentiaTitle:SetActive(false)
	alchemy.TrophyTitle:SetActive(true)
	alchemy.EnchantTitle:SetActive(false)
	alchemy.AlchemyOffset:SetActive(false)
	alchemy.HeadFrame:SetActive(true)
	alchemy.TypeBar:SetActive(true)
	alchemy.ExpItemLoader.gameObject:SetActive(false)
	alchemy.DedicationTitle:SetActive(false)
	alchemy.ExpBarBG:SetActive(false)
	alchemy.AttributePointTip.gameObject:SetActive(false)
	alchemy.RecastBtn.gameObject:SetActive(false)
	alchemy.StrengthenBtn.gameObject:SetActive(false)

	for i = 3, 10 do
		alchemy["foldList" .. i].titleGO:SetActive(false)
		alchemy["foldList" .. i].SubListGO:SetActive(false)
	end

	local ScarsList = PlayerInfoCtrl.CheckAlchemyQuest(MS_FormulaData.GetFormulaDataListByFormulaType(MS_ItemData.Type.TrophyScars))

	alchemy.ActiveFoldListCount = 3

	alchemy.foldList1.titleText:SetContent(GameText.UI_PLAYERINFO_SCARS)

	alchemy.foldList1.titleBtnSubFunc = nil

	alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "TrophyTabBtn")
	alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle2")

	alchemy.foldList1.SubListLoader.loadCount = #ScarsList
	alchemy.foldList1.SubListLoader.loadCallback = PlayerInfoCtrl.AlchemyTrophySubTitleLoadCallback

	alchemy.foldList1.titleGO:SetActive(alchemy.foldList1.SubListLoader.loadCount > 0)
	alchemy.foldList1.SubListGO:SetActive(alchemy.foldList1.SubListLoader.loadCount > 0)

	local ResistanceList = PlayerInfoCtrl.CheckAlchemyQuest(MS_FormulaData.GetFormulaDataListByFormulaType(MS_ItemData.Type.TrophyResistance))

	alchemy.foldList2.titleText:SetContent(GameText.UI_PLAYERINFO_RESISTANCE)

	alchemy.foldList2.titleBtnSubFunc = nil

	alchemy.foldList2.titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "TrophyTabBtn")
	alchemy.foldList2.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle1")
	alchemy.foldList2.titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle3")

	alchemy.foldList2.SubListLoader.loadCount = #ResistanceList
	alchemy.foldList2.SubListLoader.loadCallback = PlayerInfoCtrl.AlchemyTrophySubTitleLoadCallback

	alchemy.foldList2.titleGO:SetActive(alchemy.foldList2.SubListLoader.loadCount > 0)
	alchemy.foldList2.SubListGO:SetActive(alchemy.foldList2.SubListLoader.loadCount > 0)

	local NightmareList = PlayerInfoCtrl.CheckAlchemyQuest(MS_FormulaData.GetFormulaDataListByFormulaType(MS_ItemData.Type.TrophyNightmare))

	alchemy.foldList3.titleText:SetContent(GameText.UI_PLAYERINFO_NIGHTMARE)

	alchemy.foldList3.titleBtnSubFunc = nil

	alchemy.foldList3.titleBtn:SetAdjacent(XButton.Adjacent.LEFT, "TrophyTabBtn")
	alchemy.foldList3.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle2")

	alchemy.foldList3.SubListLoader.loadCount = #NightmareList
	alchemy.foldList3.SubListLoader.loadCallback = PlayerInfoCtrl.AlchemyTrophySubTitleLoadCallback

	alchemy.foldList3.titleGO:SetActive(alchemy.foldList3.SubListLoader.loadCount > 0)
	alchemy.foldList3.SubListGO:SetActive(alchemy.foldList3.SubListLoader.loadCount > 0)

	local notFound = true

	alchemy.FirstBtnIndex = 1

	for i = 1, alchemy.ActiveFoldListCount do
		if alchemy["foldList" .. i].SubListLoader.loadCount > 0 and notFound then
			alchemy.TrophyTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemyFoldListTitle" .. i)

			alchemy.FirstBtnIndex = i
			notFound = false
		end
	end

	notFound = true
	alchemy.LastBtnIndex = alchemy.ActiveFoldListCount

	for i = alchemy.ActiveFoldListCount, 1 do
		if alchemy["foldList" .. i].SubListLoader.loadCount > 0 and notFound then
			alchemy.LastBtnIndex = i
			notFound = false
		end
	end

	alchemy.foldList1.titleBtn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. alchemy.LastBtnIndex)
	alchemy.foldList3.titleBtn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle" .. alchemy.FirstBtnIndex)
	UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", alchemy.foldList1.titleBtn)

	local dataTbl = {}

	table.insert(dataTbl, 1, 1)
	table.insert(dataTbl, 2, ScarsList)
	alchemy.foldList1.SubListLoader:Load(dataTbl)

	local dataTbl = {}

	table.insert(dataTbl, 1, 2)
	table.insert(dataTbl, 2, ResistanceList)
	alchemy.foldList2.SubListLoader:Load(dataTbl)

	local dataTbl = {}

	table.insert(dataTbl, 1, 3)
	table.insert(dataTbl, 2, NightmareList)
	alchemy.foldList3.SubListLoader:Load(dataTbl)

	if alchemy.foldList1.SubListLoader.loadCount > 0 then
		alchemy.foldList1.titleBtnMainFunc(true)
	end

	if alchemy.foldList2.SubListLoader.loadCount > 0 then
		alchemy.foldList2.titleBtnMainFunc(true)
	end

	if alchemy.foldList3.SubListLoader.loadCount > 0 then
		alchemy.foldList3.titleBtnMainFunc(true)
	end

	alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, 1)
end

function PlayerInfoCtrl.LoadAlchemyEnchant()
	PlayerInfoCtrl.FoldAllAlchemyTitle()
	alchemy.ConfirmBtnText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_ALCHEMY)
	alchemy.mainTypeText:SetContent(GameText.UI_ALCHEMY_MAIN_TYPE_STRENGTHEN)
	alchemy.AgentiaTitle:SetActive(false)
	alchemy.TrophyTitle:SetActive(false)
	alchemy.EnchantTitle:SetActive(true)
	alchemy.ExpBarBG:SetActive(false)
	alchemy.AttributePointTip.gameObject:SetActive(false)
	alchemy.RestBg:SetActive(false)
	alchemy.RestTitle:SetActive(false)
	alchemy.ExpItemLoader.gameObject:SetActive(false)
	alchemy.DedicationTitle:SetActive(false)
	PlayerInfoCtrl.ShowAlchemyStrengthenDescription()

	for i = 1, 10 do
		alchemy["foldList" .. i].titleGO:SetActive(false)
		alchemy["foldList" .. i].SubListGO:SetActive(false)
	end

	alchemy.RecastBtn.gameObject:SetActive(true)
	alchemy.StrengthenBtn.gameObject:SetActive(true)
	PlayerInfoCtrl.EnchantingSlotSetting()
end

function PlayerInfoCtrl.FoldAllAlchemyTitle()
	PlayerInfoCtrl.ResetAllAlchemySlot()

	for i = 1, 10 do
		alchemy["foldList" .. i].LoaderRT.sizeDelta = Vector2.New(274, 0)
		alchemy["foldList" .. i].triangle.rotation = Vector3.New(0, 0, 179.9)
		alchemy["foldList" .. i].isFoldListOpen = false

		if alchemy["foldList" .. i].twn.isPlaying then
			alchemy["foldList" .. i].twn:Stop()
		end

		alchemy["foldList" .. i].titleBtn:SetHighlighted()
		alchemy["foldList" .. i].titleBtn:SetNormal()
	end
end

function PlayerInfoCtrl.AlchemyAgentiaSubTitleLoadCallback(index, com, data)
	local nameText = com:GetText("Loader_AlchemyItem_Text")
	local btn = com:GetButton("Loader_AlchemyItem_Btn")
	local numText = com:GetText("NumText")

	numText.gameObject:SetActive(false)

	local itemIcon = com:GetGameObject("Btn_item")

	itemIcon = XImage:new(itemIcon)

	itemIcon:SetGray(false)

	com.btn = btn

	local itemData = MS_ItemData.GetItemData(data[2][index].FormulaId)

	com.newLight = com:GetGameObject("newLight")

	com.newLight:SetActive(not FS_UserData.story:GetFormulaKnown(data[2][index].FormulaId))

	local alchemyList = data[2]
	local parentNum = data[1]

	nameText:SetContent(itemData.Name)

	local sprite = XObjectPool.GetIcon("item" .. itemData.Icon)

	itemIcon:SetSprite(sprite)
	btn:SetHighlighted()
	btn:SetNormal()
	btn:SetParentScroll(alchemy.TypeBarScroll)
	btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		FS_UserData.story:SetFormulaKnown(alchemyList[index].FormulaId)
		PlayerInfoCtrl.RefreshAlchemyNewLight()
		com.newLight:SetActive(false)
		PlayerInfoCtrl.ShowAlchemyItemDescription(alchemyList[index].FormulaId)
		PlayerInfoCtrl.RefreshRequireBar(alchemyList[index].Item1, alchemyList[index].Num1, alchemy.requireBarList[1])
		PlayerInfoCtrl.RefreshRequireBar(alchemyList[index].Item2, alchemyList[index].Num2, alchemy.requireBarList[2])
		PlayerInfoCtrl.RefreshRequireBar(alchemyList[index].Item3, alchemyList[index].Num3, alchemy.requireBarList[3])

		if alchemy.toBlendItemBtn then
			alchemy.toBlendItemBtn:SetNormal()
		end

		alchemy.toBlendItemBtn = btn

		alchemy.toBlendItemBtn:SetHighlighted()

		alchemy.toBlendItemBtn.itemData = itemData

		UILayerCtrl.OnSelect("AlchemyFoldListTitle" .. parentNum .. "_Child" .. index)
		btn:SetSelectedLight(true)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", btn)
	end)
	btn:SetAdjacent(XButton.Adjacent.LEFT, alchemy["foldList" .. data[1]].titleBtn:GetAdjacent(XButton.Adjacent.LEFT))
	btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. data[1] .. "_Child" .. index - 1)
	btn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle" .. data[1] .. "_Child" .. index + 1)

	if index == 1 then
		btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. data[1])
	end

	if index == alchemy["foldList" .. data[1]].SubListLoader.loadCount then
		btn:SetAdjacent(XButton.Adjacent.DOWN, alchemy["foldList" .. data[1]].titleBtn:GetAdjacent(XButton.Adjacent.DOWN))
	end

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemyFoldListTitle" .. data[1] .. "_Child" .. index, btn)
end

function PlayerInfoCtrl.AlchemyTrophySubTitleLoadCallback(index, com, data)
	local nameText = com:GetText("Loader_AlchemyItem_Text")
	local btn = com:GetButton("Loader_AlchemyItem_Btn")
	local numText = com:GetText("NumText")

	numText.gameObject:SetActive(false)

	local itemIcon = com:GetGameObject("Btn_item")

	itemIcon = XImage:new(itemIcon)

	itemIcon:SetGray(false)

	com.btn = btn

	local itemData = MS_ItemData.GetItemData(data[2][index].FormulaId)

	com.newLight = com:GetGameObject("newLight")

	com.newLight:SetActive(not FS_UserData.story:GetFormulaKnown(data[2][index].FormulaId))

	local trophyList = data[2]
	local parentNum = data[1]

	nameText:SetContent(itemData.Name)

	local sprite = XObjectPool.GetIcon("item" .. itemData.Icon)

	itemIcon:SetSprite(sprite)
	btn:SetHighlighted()
	btn:SetNormal()
	btn:SetParentScroll(alchemy.TypeBarScroll)
	btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		FS_UserData.story:SetFormulaKnown(trophyList[index].FormulaId)
		PlayerInfoCtrl.RefreshAlchemyNewLight()
		com.newLight:SetActive(false)
		PlayerInfoCtrl.ShowAlchemyItemDescription(trophyList[index].FormulaId)
		PlayerInfoCtrl.RefreshRequireBar(trophyList[index].Item1, trophyList[index].Num1, alchemy.requireBarList[1])
		PlayerInfoCtrl.RefreshRequireBar(trophyList[index].Item2, trophyList[index].Num2, alchemy.requireBarList[2], true)
		PlayerInfoCtrl.RefreshRequireBar(trophyList[index].Item3, trophyList[index].Num3, alchemy.requireBarList[3])

		if alchemy.toBlendItemBtn then
			alchemy.toBlendItemBtn:SetNormal()
		end

		alchemy.toBlendItemBtn = btn

		alchemy.toBlendItemBtn:SetHighlighted()

		alchemy.toBlendItemBtn.itemData = itemData

		UILayerCtrl.OnSelect("AlchemyFoldListTitle" .. parentNum .. "_Child" .. index)
		btn:SetSelectedLight(true)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", btn)
	end)
	btn:SetAdjacent(XButton.Adjacent.LEFT, alchemy["foldList" .. data[1]].titleBtn:GetAdjacent(XButton.Adjacent.LEFT))
	btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. data[1] .. "_Child" .. index - 1)
	btn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyFoldListTitle" .. data[1] .. "_Child" .. index + 1)

	if index == 1 then
		btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyFoldListTitle" .. data[1])
	end

	if index == alchemy["foldList" .. data[1]].SubListLoader.loadCount then
		btn:SetAdjacent(XButton.Adjacent.DOWN, alchemy["foldList" .. data[1]].titleBtn:GetAdjacent(XButton.Adjacent.DOWN))
	end

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemyFoldListTitle" .. data[1] .. "_Child" .. index, btn)
end

function PlayerInfoCtrl.RefreshRequireBarAfterBlend(targetBar)
	if targetBar.itemId and targetBar.enoughNum then
		PlayerInfoCtrl.RefreshRequireBar(targetBar.itemId, targetBar.enoughNum, targetBar)
	end
end

function PlayerInfoCtrl.RefreshRequireBar(itemId, num, targetBar, checkQuest)
	targetBar.enoughNum = num
	targetBar.itemId = itemId

	if itemId == 0 then
		targetBar.go:SetActive(false)

		targetBar.isEnough = true
		targetBar.enoughMaxNum = -1

		return
	end

	local tempItem = PlayerInfoCtrl.GetItemById(itemId)

	if tempItem == nil then
		tempItem = {}
		tempItem.itemNum = 0
	end

	targetBar.NumTextCom.text = tempItem.itemNum
	targetBar.NumMaxTextCom.text = "/" .. targetBar.enoughNum

	if tempItem.itemNum < targetBar.enoughNum then
		targetBar.NumTextCom.color = Color.New(1, 0, 0, 1)

		targetBar.greenBar:SetActive(false)
		targetBar.redBar:SetActive(true)

		targetBar.isEnough = false
		targetBar.enoughMaxNum = 0
	else
		targetBar.NumTextCom.color = Color.New(0, 1, 0, 1)

		targetBar.greenBar:SetActive(true)
		targetBar.redBar:SetActive(false)

		targetBar.isEnough = true
		targetBar.enoughMaxNum = Mathf.Floor(tempItem.itemNum / targetBar.enoughNum)
	end

	local itemData = MS_ItemData.GetItemData(itemId)
	local sprite = XObjectPool.GetIcon("item" .. itemData.Icon)

	targetBar.itemNameTextCom.text = itemData.Name

	if checkQuest then
		local gameController = sceneController:GetGameController()

		if gameController ~= nil and BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
			local ret = gameController:CheckShowQuestComplete(itemData.CompleteQuestId)

			if not ret then
				sprite = XObjectPool.GetIcon("item" .. MS_ItemData.ItemUnknownIcon)
				targetBar.itemNameTextCom.text = GameText.UI_ALCHEMY_UNKNOWN_ITEM
				targetBar.NumTextCom.text = ""
				targetBar.NumMaxTextCom.text = ""
			end
		end
	end

	targetBar.itemImage.sprite = sprite

	targetBar.go:SetActive(true)
	alchemy.RequireTextGO:SetActive(true)
end

function PlayerInfoCtrl.AlechemyInventoryItemCallbackForEnchant(targetBtn)
	targetBtn.currentNum = 1

	local function itemBtnEnoughCB(item)
		PlayerInfoCtrl.OnOpenAlchemyInventory(true)

		local sprite = XObjectPool.GetIcon("item" .. item.itemIcon)

		targetBtn.itemImage.sprite = sprite

		targetBtn.itemImageBG:SetActive(true)

		targetBtn.currentItem = item
		targetBtn.NumTextCom.text = item.itemNum .. "/" .. targetBtn.currentNum

		if item.itemNum < targetBtn.currentNum then
			targetBtn.NumTextCom.color = Color.New(1, 0, 0, 1)

			targetBtn.LackImage:SetActive(true)

			targetBtn.isEnough = false
		else
			targetBtn.NumTextCom.color = Color.New(1, 1, 1, 1)

			targetBtn.LackImage:SetActive(false)

			targetBtn.isEnough = true
		end
	end

	return itemBtnEnoughCB
end

function PlayerInfoCtrl.EnchantingSlotSetting()
	alchemy.SlotTrophy.gameObject:SetActive(true)

	alchemy.SlotTrophy.btnName = "AlchemySlot1"

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemySlot1", alchemy.SlotTrophy)
	alchemy.SlotTrophy:SetAdjacent(XButton.Adjacent.LEFT, "LastFoldListBtn")
	alchemy.SlotTrophy:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemySlot2")
	alchemy.SlotMedcineAssist.gameObject:SetActive(true)

	alchemy.SlotMedcineAssist.btnName = "AlchemySlot2"

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemySlot2", alchemy.SlotMedcineAssist)
	alchemy.SlotMedcineAssist:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemySlot3")
	alchemy.SlotMedcineAssist:SetAdjacent(XButton.Adjacent.LEFT, "AlchemySlot1")
	alchemy.SlotOriginStone.gameObject:SetActive(true)

	alchemy.SlotOriginStone.btnName = "AlchemySlot3"

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemySlot3", alchemy.SlotOriginStone)
	alchemy.SlotOriginStone:SetAdjacent(XButton.Adjacent.LEFT, "AlchemySlot2")
	alchemy.SlotTrophy:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.OnOpenAlchemyInventory(true)

		local validItemList = PlayerInfoCtrl.GetTrophyItemListForUI()

		UILayerCtrl.OnSelect("AlchemySlot1")

		alchemy.currentSlotBtnItem = alchemy.SlotTrophy.currentItem

		PlayerInfoCtrl.LoadInventoryItem(validItemList, PlayerInfoCtrl.AlechemyInventoryItemCallbackForEnchant(alchemy.SlotTrophy))
	end)
	alchemy.SlotMedcineAssist:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AlchemySlot2")
	end)
	alchemy.SlotOriginStone:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AlchemySlot3")
	end)
end

function PlayerInfoCtrl.StrengthenSlotSetting()
	alchemy.SlotTrophy.gameObject:SetActive(true)

	alchemy.SlotTrophy.btnName = "AlchemySlot1"

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemySlot1", alchemy.SlotTrophy)
	alchemy.SlotTrophy:SetAdjacent(XButton.Adjacent.LEFT, "LastFoldListBtn")
	alchemy.SlotTrophy:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemySlot2")
	alchemy.SlotTrophyAssist.gameObject:SetActive(true)

	alchemy.SlotTrophyAssist.btnName = "AlchemySlot2"

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemySlot2", alchemy.SlotTrophyAssist)
	alchemy.SlotTrophyAssist:SetAdjacent(XButton.Adjacent.RIGHT, "AlchemySlot3")
	alchemy.SlotTrophyAssist:SetAdjacent(XButton.Adjacent.LEFT, "AlchemySlot1")
	alchemy.SlotOriginStone.gameObject:SetActive(true)

	alchemy.SlotOriginStone.btnName = "AlchemySlot3"

	UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemySlot3", alchemy.SlotOriginStone)
	alchemy.SlotOriginStone:SetAdjacent(XButton.Adjacent.LEFT, "AlchemySlot2")
	alchemy.SlotTrophy:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PlayerInfoCtrl.OnOpenAlchemyInventory(true)

		local validItemList = PlayerInfoCtrl.GetTrophyItemListForUI()

		UILayerCtrl.OnSelect("AlchemySlot1")

		alchemy.currentSlotBtnItem = alchemy.SlotTrophy.currentItem

		PlayerInfoCtrl.LoadInventoryItem(validItemList, PlayerInfoCtrl.AlechemyInventoryItemCallbackForEnchant(alchemy.SlotTrophy))
	end)
	alchemy.SlotTrophyAssist:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AlchemySlot2")
	end)
	alchemy.SlotOriginStone:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AlchemySlot3")
	end)
end

function PlayerInfoCtrl.RefreshAlechemyItemSelect(trophyType)
	alchemy.ItemSelect.loadFinish = false

	local TrophyList = {}

	if alchemy.ItemSelect.currentTrophySlot == alchemy.StrengthenItemMainSlot then
		local _TrophyList = PlayerInfoCtrl.GetUITrophyListByType(trophyType, true)

		if alchemy.Status == MS_ItemData.Type.StrengthenStone then
			for k, v in pairs(_TrophyList) do
				if v:GetLevel() < MS_ItemData.TrophyStrengthLevelMax and v ~= alchemy.StrengthenItemSubSlot.item and v:CanEnchant() then
					table.insert(TrophyList, v)
				end
			end
		elseif alchemy.Status == MS_ItemData.Type.RecastStone then
			for k, v in pairs(_TrophyList) do
				if v ~= alchemy.StrengthenItemSubSlot.item and v:CanEnchant() then
					table.insert(TrophyList, v)
				end
			end
		end
	elseif alchemy.ItemSelect.currentTrophySlot == alchemy.StrengthenItemSubSlot then
		local _TrophyList = PlayerInfoCtrl.GetUITrophyListByType(trophyType)

		if alchemy.Status == MS_ItemData.Type.StrengthenStone then
			for k, v in pairs(_TrophyList) do
				if v ~= alchemy.StrengthenItemMainSlot.item and v:GetLevel() == alchemy.StrengthenItemMainSlot.item:GetLevel() and v:GetType() == alchemy.StrengthenItemMainSlot.item:GetType() and v:CanEnchant() then
					table.insert(TrophyList, v)
				end
			end
		elseif alchemy.Status == MS_ItemData.Type.RecastStone then
			for k, v in pairs(_TrophyList) do
				if v ~= alchemy.StrengthenItemMainSlot.item and v:GetType() ~= alchemy.StrengthenItemMainSlot.item:GetType() and v:CanEnchant() then
					table.insert(TrophyList, v)
				end
			end
		end
	end

	alchemy.ItemSelect.RightPanel:SetActive(false)

	alchemy.ItemSelect.SelectedItem = nil

	alchemy.trophyTypeNavButton[alchemy.trophyTypeIndex]:SetNormal()
	alchemy.trophyTypeNavButton[alchemy.trophyTypeIndex]:SetHighlighted()

	function alchemy.ItemSelect.ItemLoader.loadCallback(index, com, data)
		local img = com:GetGameObject("Btn_item")
		local currentMark = com:GetGameObject("Btn_Current_Image")
		local itemText = com:GetText("Loader_AlchemyItem_Text")

		currentMark:SetActive(false)

		if TrophyList[index] ~= nil and TrophyList[index] == alchemy.ItemSelect.currentTrophySlot.item then
			currentMark:SetActive(true)
		end

		local equipedMark = com:GetGameObject("Btn_EquipImage")

		equipedMark:SetActive(TrophyList[index]:GetEquiped())

		img = XImage:new(img)

		local _btn = com:GetButton("Loader_AlchemyItem_Btn")

		_btn:SetParentScroll(alchemy.ItemSelect.itemScroll)
		_btn:SetSelectedLight(false)

		local sprite = XObjectPool.GetIcon("item" .. TrophyList[index].itemIcon)

		img:SetSprite(sprite)
		itemText:SetContent(TrophyList[index]:GetTrophyName())

		local newLight = com:GetGameObject("newLight")

		newLight:SetActive(TrophyList[index]:IsNew())
		_btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		_btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			alchemy.ItemSelect.SelectedItem = TrophyList[index]

			alchemy.ItemSelect.SelectedItem:SetOld()
			alchemy.ItemSelect.LockGroup:SetActive(true)
			PlayerInfoCtrl.SetAlchemyLockBtn(alchemy.ItemSelect.SelectedItem:GetIsLock())
			newLight:SetActive(false)

			local sprite = XObjectPool.GetIcon("item" .. alchemy.ItemSelect.SelectedItem.itemIcon)

			alchemy.ItemSelect.itemImage:SetSprite(sprite)
			alchemy.ItemSelect.RightPanel:SetActive(true)
			alchemy.ItemSelect.itemDes:SetContent(alchemy.ItemSelect.SelectedItem:GetItemData().Description)
			alchemy.ItemSelect.itemName:SetContent(alchemy.ItemSelect.SelectedItem:GetTrophyName())
			alchemy.ItemSelect.itemBouns:SetContent(PlayerInfoCtrl.GetTrophyDescription(alchemy.ItemSelect.SelectedItem))
			alchemy.ItemSelect.lineOffset:SetActive(alchemy.ItemSelect.itemBouns.gameObject.activeSelf and alchemy.ItemSelect.itemDes.gameObject.activeSelf)
			UILayerCtrl.OnSelect("AlchemyItemSelectItemBtn" .. index)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.ItemSelect.contentGroupRT)

			local showTri = alchemy.ItemSelect.GetPreferredHeightFunc() > alchemy.ItemSelect.contentHeight + 0.3

			alchemy.ItemSelect.triangleGroup:SetActive(showTri)
			alchemy.ItemSelect.triangle:SetActive(showTri)

			alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

			_btn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.ItemSelect.RightPanelRT)
		end)
		UILayerCtrl.AddButton("PlayerInfoAlchemy", "AlchemyItemSelectItemBtn" .. index, _btn)

		if index == 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyItemSelectItemBtn" .. alchemy.ItemSelect.ItemLoader.loadCount)
		end

		if index > 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "AlchemyItemSelectItemBtn" .. index - 1)
		end

		if index < alchemy.ItemSelect.ItemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyItemSelectItemBtn" .. index + 1)
		end

		if index == alchemy.ItemSelect.ItemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "AlchemyItemSelectItemBtn1")
			UILayerCtrl.OnSelect("AlchemyItemSelectItemBtn1")
			UILayerCtrl.OnCursorClickMute()

			alchemy.ItemSelect.loadFinish = true
			alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.x, 1)
		end
	end

	alchemy.ItemSelect.ItemLoader.loadCount = #TrophyList

	alchemy.ItemSelect.ItemLoader:Load()

	if alchemy.ItemSelect.ItemLoader.loadCount == 0 then
		alchemy.ItemSelect.SelectedItem = nil

		UILayerCtrl.OnSelect("empty")

		alchemy.ItemSelect.loadFinish = true
	end
end

function PlayerInfoCtrl.RefreshResultAlchemeyItemInfo()
	if alchemy.StrengthenItemMainSlot.item == nil then
		alchemy.VerticalGroup:SetActive(false)

		for k, v in pairs(alchemy.requireBarList) do
			v.isEnough = false
		end

		alchemy.ItemSelect.currentTrophySlot.img.gameObject:SetActive(false)
		alchemy.ConfirmBtn.gameObject:SetActive(false)

		return
	else
		alchemy.RightBoard:SetActive(true)

		if alchemy.Status == MS_ItemData.Type.RecastStone then
			if alchemy.StrengthenItemSubSlot.item == nil then
				alchemy.ConfirmBtn.gameObject:SetActive(false)
			else
				alchemy.ConfirmBtn.gameObject:SetActive(true)
			end
		else
			alchemy.ConfirmBtn.gameObject:SetActive(true)
		end

		alchemy.AgentiaBG:SetActive(false)
	end

	if alchemy.ItemSelect.currentTrophySlot.item == nil then
		return
	end

	local sprite = XObjectPool.GetIcon("item" .. alchemy.ItemSelect.currentTrophySlot.item.itemIcon)

	alchemy.ItemSelect.currentTrophySlot.img:SetSprite(sprite)
	alchemy.ItemSelect.currentTrophySlot.img.gameObject:SetActive(true)
	alchemy.itemInfoImg.gameObject:SetActive(false)
	alchemy.itemInfoNumGroup:SetActive(false)

	if alchemy.Status == MS_ItemData.Type.StrengthenStone then
		alchemy.recastReduceText.gameObject:SetActive(false)
		alchemy.recastGainText.gameObject:SetActive(false)
		alchemy.itemInfoName:SetContent(alchemy.StrengthenItemMainSlot.item.itemName .. "<color=#39FF42FF>+" .. alchemy.StrengthenItemMainSlot.item:GetLevel() .. "</color>")
		alchemy.itemInfoContent:SetContent(PlayerInfoCtrl.GetTrophyTempBounText(alchemy.StrengthenItemMainSlot.item, 1))
		alchemy.itemInfoContent.gameObject:SetActive(true)
		alchemy.itemInfoLine:SetActive(true)

		local lv = alchemy.StrengthenItemMainSlot.item:GetLevel()
		local StoneId, num = MS_ItemData.GetAlchemyStoneId(alchemy.Status, lv)

		if StoneId then
			PlayerInfoCtrl.RefreshRequireBar(StoneId, num, alchemy.requireBarList[1])
		else
			alchemy.RequireTextGO:SetActive(false)
			alchemy.requireBarList[1].go:SetActive(false)

			alchemy.requireBarList[1].isEnough = false
		end
	elseif alchemy.Status == MS_ItemData.Type.RecastStone then
		if alchemy.StrengthenItemMainSlot.item:GetLevel() > 1 then
			alchemy.itemInfoName:SetContent(alchemy.StrengthenItemMainSlot.item.itemName .. "+" .. alchemy.StrengthenItemMainSlot.item:GetLevel() - 1)
		else
			alchemy.itemInfoName:SetContent(alchemy.StrengthenItemMainSlot.item.itemName)
		end

		if alchemy.StrengthenItemSubSlot.item == nil then
			alchemy.recastReduceText.gameObject:SetActive(false)
			alchemy.recastGainText.gameObject:SetActive(false)
			alchemy.itemInfoContent:SetContent(PlayerInfoCtrl.GetTrophyTempBounText(alchemy.StrengthenItemMainSlot.item))
			alchemy.itemInfoContent.gameObject:SetActive(true)
			alchemy.itemInfoLine:SetActive(true)
			alchemy.RequireTextGO:SetActive(false)
			alchemy.requireBarList[1].go:SetActive(false)

			alchemy.requireBarList[1].isEnough = false
		else
			alchemy.itemInfoContent:SetContent(PlayerInfoCtrl.GetTrophyTempBounText(alchemy.StrengthenItemMainSlot.item, false, true))
			alchemy.itemInfoContent.gameObject:SetActive(true)
			alchemy.itemInfoLine:SetActive(true)

			if alchemy.StrengthenItemMainSlot.item:GetSubProperty() == 0 then
				alchemy.recastReduceText.gameObject:SetActive(false)
			else
				alchemy.recastReduceText.gameObject:SetActive(true)

				local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(alchemy.StrengthenItemMainSlot.item:GetSubProperty(), alchemy.StrengthenItemMainSlot.item:GetQuality())
				local st = GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value

				alchemy.recastReduceText:SetContent(st)
			end

			local level = alchemy.StrengthenItemSubSlot.item:GetLevel()
			local dir = PlayerInfoCtrl.GetAlchemyRecastDir()

			alchemy.recastGainText.gameObject:SetActive(false)

			if dir ~= nil then
				local _propertyId = alchemy.StrengthenItemMainSlot.item:RecastSimulate(dir, level)

				if _propertyId ~= 0 then
					alchemy.recastGainText.gameObject:SetActive(true)

					local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_propertyId, alchemy.StrengthenItemMainSlot.item:GetQuality())
					local st = GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value

					alchemy.recastGainText:SetContent("???")
				end
			end

			local lv = alchemy.StrengthenItemSubSlot.item:GetLevel()
			local StoneId, num = MS_ItemData.GetAlchemyStoneId(alchemy.Status, lv)

			if StoneId then
				PlayerInfoCtrl.RefreshRequireBar(StoneId, num, alchemy.requireBarList[1])
			else
				alchemy.RequireTextGO:SetActive(false)
				alchemy.requireBarList[1].go:SetActive(false)

				alchemy.requireBarList[1].isEnough = false
			end
		end
	end

	alchemy.itemDescriptionContent:SetContent(alchemy.StrengthenItemMainSlot.item:GetItemData().Description)
	alchemy.lineOffset:SetActive(alchemy.itemDescriptionContent.gameObject.activeSelf and alchemy.itemInfoContent.gameObject.activeSelf)
	alchemy.VerticalGroup:SetActive(true)
	alchemy.requireBarList[2].go:SetActive(false)

	alchemy.requireBarList[2].isEnough = false

	alchemy.requireBarList[3].go:SetActive(false)

	alchemy.requireBarList[3].isEnough = false

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.contentGroupRT)
	alchemy.triangleGroup:SetActive(alchemy.GetPreferredHeightFunc() > alchemy.contentHeight + 0.3)
	alchemy.triangleGroupTriangle:SetActive(alchemy.GetPreferredHeightFunc() > alchemy.contentHeight + 0.3)

	alchemy.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(alchemy.VerticalGroup:GetComponent("RectTransform"))
end

function PlayerInfoCtrl.GetTrophyTempBounText(item, levelDelta, isRecast)
	local _subProperty = item:GetSubProperty()
	local _mainPropertyList = item:GetMainPropertyList()
	local quality = item:GetQuality()
	local st = ""

	if levelDelta then
		for k, v in pairs(_mainPropertyList) do
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(v, quality, true)
			local _typeD, _valueD = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(v + levelDelta, quality, true)
			local pValue = _valueD - _value

			if _type == MS_HeroData.Property.CritRate or _type == MS_HeroData.Property.HumanAdd or _type == MS_HeroData.Property.BeastAdd or _type == MS_HeroData.Property.SendrilAdd then
				pValue = pValue / 10 .. "%"
			elseif _type == MS_HeroData.Property.CritDamage then
				pValue = pValue / 10 .. "%"
			end

			local _typek, _valuek = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(v, quality)

			st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _valuek .. "<color=#39FF42FF>+" .. pValue .. "</color>\n"
		end

		if _subProperty ~= 0 then
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_subProperty, quality)

			st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
		end
	else
		for k, v in pairs(_mainPropertyList) do
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(v, quality)

			st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
		end

		if not isRecast and _subProperty ~= 0 then
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_subProperty, quality)

			st = st .. GameText.UI_PLAYERINFO_PROPERTY_TYPE[_type] .. "+" .. _value .. "\n"
		end
	end

	if string.len(st) > 1 then
		st = string.sub(st, 1, string.len(st) - 1)
	end

	return st
end

function PlayerInfoCtrl.ResetAlchemySubSlotItem()
	alchemy.StrengthenItemSubSlot.item = nil

	alchemy.StrengthenItemSubSlot.img.gameObject:SetActive(false)
end

function PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
	alchemy.StrengthenItemSubSlot.item = nil

	alchemy.StrengthenItemSubSlot.img.gameObject:SetActive(false)

	alchemy.StrengthenItemMainSlot.item = nil

	alchemy.StrengthenItemMainSlot.img.gameObject:SetActive(false)
	alchemy.VerticalGroup:SetActive(false)
	alchemy.ConfirmBtn.gameObject:SetActive(false)
end

function PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
	if alchemy.Status == MS_ItemData.Type.StrengthenStone then
		alchemy.StrengthenBtn:SetNormal()
		alchemy.StrengthenBtn:SetHighlighted()
		alchemy.RecastBtn:SetNormal()
	elseif alchemy.Status == MS_ItemData.Type.RecastStone then
		alchemy.RecastBtn:SetNormal()
		alchemy.RecastBtn:SetHighlighted()
		alchemy.StrengthenBtn:SetNormal()
	end
end

function PlayerInfoCtrl.CheckSubSlotItemDefaultType()
	if alchemy.Status == MS_ItemData.Type.StrengthenStone then
		if alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyScars then
			return MS_ItemData.Type.TrophyScars, 1
		elseif alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyResistance then
			return MS_ItemData.Type.TrophyResistance, 2
		elseif alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyNightmare then
			return MS_ItemData.Type.TrophyNightmare, 3
		end
	elseif alchemy.Status == MS_ItemData.Type.RecastStone then
		if alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyScars then
			local _TrophyList = PlayerInfoCtrl.GetUITrophyListByType(MS_ItemData.Type.TrophyNightmare)

			if #_TrophyList < 1 then
				return MS_ItemData.Type.TrophyResistance, 2
			else
				return MS_ItemData.Type.TrophyNightmare, 3
			end
		elseif alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyResistance then
			local _TrophyList = PlayerInfoCtrl.GetUITrophyListByType(MS_ItemData.Type.TrophyScars)

			if #_TrophyList < 1 then
				return MS_ItemData.Type.TrophyNightmare, 3
			else
				return MS_ItemData.Type.TrophyScars, 1
			end
		elseif alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyNightmare then
			local _TrophyList = PlayerInfoCtrl.GetUITrophyListByType(MS_ItemData.Type.TrophyResistance)

			if #_TrophyList < 1 then
				return MS_ItemData.Type.TrophyScars, 1
			else
				return MS_ItemData.Type.TrophyResistance, 2
			end
		end
	end

	return MS_ItemData.Type.TrophyScars, 1
end

function PlayerInfoCtrl.CheckMainSlotItemDefaultType()
	local _TrophyList = PlayerInfoCtrl.GetUITrophyListByType(MS_ItemData.Type.TrophyScars, true)

	if #_TrophyList > 0 then
		return MS_ItemData.Type.TrophyScars, 1
	end

	_TrophyList = PlayerInfoCtrl.GetUITrophyListByType(MS_ItemData.Type.TrophyResistance, true)

	if #_TrophyList > 0 then
		return MS_ItemData.Type.TrophyResistance, 2
	end

	_TrophyList = PlayerInfoCtrl.GetUITrophyListByType(MS_ItemData.Type.TrophyNightmare, true)

	if #_TrophyList > 0 then
		return MS_ItemData.Type.TrophyNightmare, 3
	end

	return MS_ItemData.Type.TrophyScars, 1
end

function PlayerInfoCtrl.GetAlchemyStrengthOrRecastResult()
	if alchemy.StrengthenItemMainSlot.item == nil then
		return false
	end

	if alchemy.Status == MS_ItemData.Type.StrengthenStone then
		alchemy.StrengthenItemMainSlot.item:Strength(1)
		sceneController:GetGameController():UseBagItem(alchemy.requireBarList[1].itemId, alchemy.requireBarList[1].enoughNum)

		return true
	elseif alchemy.Status == MS_ItemData.Type.RecastStone then
		if alchemy.StrengthenItemSubSlot.item == nil then
			return false
		end

		local level = alchemy.StrengthenItemSubSlot.item:GetLevel()
		local dir = PlayerInfoCtrl.GetAlchemyRecastDir()

		if dir ~= nil then
			alchemy.StrengthenItemMainSlot.item:Recast(dir, level)
			sceneController:GetGameController():SubTrophyItem(alchemy.StrengthenItemSubSlot.item)

			return true
		end
	end
end

function PlayerInfoCtrl.GetAlchemyRecastDir()
	local dir

	if alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyScars then
		if alchemy.StrengthenItemSubSlot.item:GetType() == MS_ItemData.Type.TrophyResistance then
			dir = "Backward"
		elseif alchemy.StrengthenItemSubSlot.item:GetType() == MS_ItemData.Type.TrophyNightmare then
			dir = "Forward"
		end
	elseif alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyResistance then
		if alchemy.StrengthenItemSubSlot.item:GetType() == MS_ItemData.Type.TrophyNightmare then
			dir = "Backward"
		elseif alchemy.StrengthenItemSubSlot.item:GetType() == MS_ItemData.Type.TrophyScars then
			dir = "Forward"
		end
	elseif alchemy.StrengthenItemMainSlot.item:GetType() == MS_ItemData.Type.TrophyNightmare then
		if alchemy.StrengthenItemSubSlot.item:GetType() == MS_ItemData.Type.TrophyScars then
			dir = "Backward"
		elseif alchemy.StrengthenItemSubSlot.item:GetType() == MS_ItemData.Type.TrophyResistance then
			dir = "Forward"
		end
	end

	return dir
end

function PlayerInfoCtrl.CheckAlchemyQuest(FormulaList)
	local retList = {}
	local gameController = sceneController:GetGameController()

	for k, v in pairs(FormulaList) do
		local ret = gameController:CheckShowQuestComplete(v.ShowQuestId)

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or ret then
			table.insert(retList, v)
		end
	end

	return retList
end

function PlayerInfoCtrl.IsItemEnough(itemId, num)
	if itemList[itemId] == nil then
		return false
	end

	if num then
		if itemList[itemId].itemNum > num - 1 then
			return true
		end
	elseif itemList[itemId].itemNum > 0 then
		return true
	end

	return false
end

function PlayerInfoCtrl.IsTrophyEnough(itemId, num)
	for k, v in pairs(trophyList) do
		if v.itemId == itemId then
			if num then
				if num < v.itemNum then
					return true
				end
			elseif v.itemNum > 0 then
				return true
			end
		end
	end

	return false
end

function PlayerInfoCtrl.Rest()
	if alchemy.isFinal then
		UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_Back_LT")
		UIManager.SendMessage("Mainmenu", "ShowArcadeResult")
		UIManager.SendMessage("Mainmenu", "ShowArcadeResultAnim")
	else
		UIManager.SendMessage("Curtain", "BlackFadeIn", 1, 0, function()
			UILayerCtrl.OnButtonClickMute("PlayerInfoPanel_Back_LT")
			sceneController:SetActionAssist(ControllerMain.AssistButton.WorshipingRest)
		end)
	end
end

function PlayerInfoCtrl.ReLoad(heroId)
	local sprite = XObjectPool.GetIcon("heroIcon" .. heroId)

	property.heroInfo.heroIcon:SetSprite(sprite)

	local sprite = XObjectPool.GetIcon("heroPortrait" .. BattleData.ConvertHeroIdWithSkin(heroId))

	property.heroInfo.heroPortrait:SetSprite(sprite)

	local heroData = MS_HeroData.GetHero(heroId)

	property.heroInfo.nameText:SetContent(heroData.Name)
	property.heroInfo.sanityText:SetContent(heroData.UISanityDescription)
	property.heroInfo.playerName:SetContent(FS_UserData.playerList:GetPlayer():GetName())
	PlayerInfoCtrl.ReloadTalent(heroId)
	PlayerInfoCtrl.RefreshProperty(heroId)
	PlayerInfoCtrl.LoadTrophy()
end

function PlayerInfoCtrl.ReloadTalent(heroId)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false then
		return
	end

	for k, v in pairs(talentLineList) do
		for _k, _v in pairs(v) do
			_v.gameObject:SetActive(false)
		end
	end

	for k, v in pairs(talentList) do
		v.go:SetActive(false)
		v.addLight:SetActive(false)
	end

	if heroId == 10005 then
		talentMain.jeroldStoneIconGroup:SetActive(true)
		talentMain.highTalentStoneIconGroup:SetActive(false)
	else
		talentMain.jeroldStoneIconGroup:SetActive(false)
		talentMain.highTalentStoneIconGroup:SetActive(true)
	end

	local talentTree = FS_UserData.heroList:GetHero(heroId):GetHeroTalentTree()

	talentPosList.PlayerInfoTalent1 = {}
	talentPosList.PlayerInfoTalent2 = {}
	talentPosList.PlayerInfoTalent3 = {}
	talentPosList.PlayerInfoTalent4 = {}

	PlayerInfoCtrl.SetTalentStone(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[1]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[2]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[3]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[4]), FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_TalentAddList[5]))

	if talentTree ~= nil then
		for k, v in pairs(talentTree) do
			PlayerInfoCtrl.LoadTalentPoint(v)
		end
	end
end

function PlayerInfoCtrl.RefreshProperty(heroId)
	local _attributeList = PlayerInfoCtrl.GetAttribute(heroId)

	for i = 1, MS_HeroData.AttributeMax do
		PlayerInfoCtrl.SetAttribute(i, _attributeList[i])

		property.attributeComfirmedValue[i] = _attributeList[i]
		property.attributeValueList[i] = property.attributeComfirmedValue[i]
	end

	local _propertyList = PlayerInfoCtrl.GetProperty(heroId)

	for i = 1, MS_HeroData.PropertyMax do
		PlayerInfoCtrl.SetProperty(i, _propertyList[i])
		PlayerInfoCtrl.SetPropertyDelta(i, 0)
	end

	PlayerInfoCtrl.RefreshHeroState(heroId)

	local heroData = FS_UserData.heroList:GetHero(heroId)

	property.attributePointText:SetContent(heroData.attribPoints)
	property.attributePointAnimationGO:SetActive(heroData.attribPoints > 0)

	property.attributePoint = heroData.attribPoints

	if property.attributePoint > 0 and isEditor then
		for k, v in pairs(property.AttributeBtnGroup) do
			v:SetNormal()
		end

		if UILayerCtrl.GetCurrentLayerName() == "PlayerInfoProperty" then
			UILayerCtrl.OnSelect("selectBtn1")
		end

		property.PropertyConfirmBtn:SetDisabled()

		for k, v in pairs(property.minusBtnList) do
			v:SetDisabled()
		end

		for k, v in pairs(property.addBtnList) do
			if attributeList[k].value == MS_HeroData.AttributeValueMax then
				v:SetDisabled()
			end
		end
	else
		if UILayerCtrl.GetCurrentLayerName() == "PlayerInfoProperty" then
			UILayerCtrl.OnSelect("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_emptyBtn")
		end

		for k, v in pairs(property.AttributeBtnGroup) do
			v:SetDisabled()
		end
	end

	property.mainLevelText:SetContent(heroData.level)
	alchemy.ExpLevelText:SetContent(heroData.level)

	local expTotal = MS_HeroExp.GetHeroRequireExp(heroData.level + 1)

	property.expBarSlider.value = heroData.exp / expTotal

	property.expBarText:SetContent(heroData.exp .. "/" .. expTotal)
	alchemy.ExpNumText:SetContent(heroData.exp .. "/" .. expTotal)
	PlayerInfoCtrl.SetCurrentExpValue(heroData)
	property.levelText:SetContent(heroData.level)

	property.levelText.level = heroData.level

	if expTotal == 0 then
		property.levelText.percent = 0
	else
		property.levelText.percent = heroData.exp / expTotal
	end

	PlayerInfoCtrl.SetExpBar(property.levelText.percent)
	PlayerInfoCtrl.AlchemySetExpBar(property.levelText.percent)

	property.finalLevel = property.levelText.level
	property.finalPercent = property.levelText.percent
	alchemy.ExpLevelText.Level = property.levelText.level
	alchemy.ExpLevelText.Percent = property.levelText.percent
end

function PlayerInfoCtrl.Update()
	if not this.loadFinish then
		return
	end

	UILayerCtrl.PostUpdate()

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" then
		deltaTime = TimeHelper.getDeltaTime()

		PlayerInfoCtrl.UpdateCursor()
	end

	local ctrlGameMode = sceneController:GetGameController()

	if ctrlGameMode and ctrlGameMode:IsInMovie() then
		return
	end

	this.GamePadControl()
end

function PlayerInfoCtrl.SetCursorMove(dx, dy, touch)
	if talentMain and talentMain.cursor then
		talentMain.isMovingCursor = true

		talentMain.moveVec2:Set(talentMain.cursor.transform.localPosition.x, talentMain.cursor.transform.localPosition.y)
		talentMain.tStuckInVec2:Set(dx, dy)

		local gameFps = 1 / deltaTime

		talentMain.moveVec2:Set(talentMain.moveVec2.x + dx * 0.04 * (60 / gameFps), talentMain.moveVec2.y + dy * 0.04 * (60 / gameFps))

		if talentMain.moveVec2.x < 20 then
			talentMain.moveVec2.x = 20
		elseif talentMain.moveVec2.x > 350 then
			talentMain.moveVec2.x = 350
		end

		if talentMain.moveVec2.y < -220 then
			talentMain.moveVec2.y = -220
		elseif talentMain.moveVec2.y > 10 then
			talentMain.moveVec2.y = 10
		end

		talentMain.talentSelectedLight:SetActive(false)
		talentMain.talentCursorNormal:SetActive(true)

		if talentMain.tStuckInVec2.sqrMagnitude < talentMain.EscapeSqrRadius then
			local btnName, retVec = PlayerInfoCtrl.CheckTalentSpot(talentMain.moveVec2)

			if btnName ~= nil and retVec ~= nil then
				talentMain.cursor.transform.localPosition = retVec

				for i = 1, 5 do
					talentDetailPointList[i].stoneLight:SetActive(false)
				end

				if talentMain.currentSelectedTalentpoint ~= btnName then
					talentMain.currentSelectedTalentpoint = btnName

					PlayerInfoCtrl.OpenTalentDetail(talentDataList[talentMain.currentSelectedTalentpoint])
					AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.TalentChoose)
				end

				talentMain.talentSelectedLight:SetActive(true)
				talentMain.talentCursorNormal:SetActive(false)
			else
				talentMain.cursor.transform.localPosition = talentMain.moveVec2
				talentMain.currentSelectedTalentpoint = nil
			end
		else
			talentMain.cursor.transform.localPosition = talentMain.moveVec2
			talentMain.currentSelectedTalentpoint = nil
		end
	end
end

function PlayerInfoCtrl.CheckTalentSpot(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" then
		local tempTalentList = talentPosList[lName]

		for k, v in pairs(tempTalentList) do
			local osTest = vec2 - v

			if osTest.sqrMagnitude < talentMain.SpotSqrRadius then
				return k, v
			end
		end
	end

	return nil, nil
end

function PlayerInfoCtrl.GetNearestTalentPoint(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "PlayerInfoTalent1" or lName == "PlayerInfoTalent2" or lName == "PlayerInfoTalent3" or lName == "PlayerInfoTalent4" then
		local tempTalentList = talentPosList[lName]
		local nearestLength = 99999
		local nearestBtnName, nearestVec

		for k, v in pairs(tempTalentList) do
			local orilength = Vector2.Distance(vec2, v)

			if orilength < nearestLength then
				nearestLength = orilength
				nearestBtnName = k
				nearestVec = v
			end
		end

		talentMain.nearestTalentVec:Set(nearestVec.x, nearestVec.y)

		return nearestBtnName
	end

	talentMain.nearestTalentVec:Set(0, 0)

	return nil
end

function PlayerInfoCtrl.InitCursorPos(type)
	talentMain.cursor.transform:SetParent(talentMain["part" .. type].transform)
	TimeHelper.resetDeltaTime()

	if talentPosList["PlayerInfoTalent" .. type]["talent" .. type .. "01"] == nil then
		return
	end

	talentMain.cursor.transform.localPosition = talentPosList["PlayerInfoTalent" .. type]["talent" .. type .. "01"]

	talentMain.talentSelectedLight:SetActive(true)
	talentMain.talentCursorNormal:SetActive(false)
	talentMain.cursor:SetActive(true)

	talentMain.currentSelectedTalentpoint = "talent" .. type .. "01"

	for i = 1, 5 do
		talentDetailPointList[i].stoneLight:SetActive(false)
	end

	PlayerInfoCtrl.OpenTalentDetail(talentDataList[talentMain.currentSelectedTalentpoint])
	PlayerInfoCtrl.SetTalentStone(talentMain.lowTalentStoneNumText.m_num, talentMain.midTalentStoneNumText.m_num, talentMain.highTalentStoneNumText.m_num, talentMain.veryHighTalentStoneNumText.m_num, talentMain.jeroldStoneNumText.m_num)
end

function PlayerInfoCtrl.UpdateCursor()
	if talentMain.isMovingCursor then
		talentMain.isMovingCursor = false
		talentMain.firstTimeStopCursor = true

		return
	end

	if talentMain.firstTimeStopCursor then
		talentMain.firstTimeStopCursor = false
		talentMain.cursorSpeed = 0.02
		talentMain.cursorPercent = 0

		talentMain.oriVec2:Set(talentMain.cursor.transform.localPosition.x, talentMain.cursor.transform.localPosition.y)

		talentMain.nearestTalentBtnName = PlayerInfoCtrl.GetNearestTalentPoint(talentMain.oriVec2)
	end

	if talentMain.currentSelectedTalentpoint == nil and talentMain.nearestTalentBtnName ~= nil and talentMain.nearestTalentVec ~= nil then
		talentMain.nowVec2:Set(talentMain.cursor.transform.localPosition.x, talentMain.cursor.transform.localPosition.y)

		if Vector2.Distance(talentMain.nowVec2, talentMain.nearestTalentVec) > 12 then
			talentMain.cursorPercent = talentMain.cursorPercent + talentMain.cursorSpeed

			local tmpPos = Vector2.Lerp(talentMain.oriVec2, talentMain.nearestTalentVec, talentMain.cursorPercent)

			talentMain.cursor.transform.localPosition = tmpPos
			talentMain.cursorSpeed = talentMain.cursorSpeed + 0.015
		else
			talentMain.cursor.transform.localPosition = talentMain.nearestTalentVec
			talentMain.currentSelectedTalentpoint = talentMain.nearestTalentBtnName

			for i = 1, 5 do
				talentDetailPointList[i].stoneLight:SetActive(false)
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.TalentChoose)
			PlayerInfoCtrl.OpenTalentDetail(talentDataList[talentMain.currentSelectedTalentpoint])
			talentMain.talentSelectedLight:SetActive(true)
			talentMain.talentCursorNormal:SetActive(false)
		end
	end
end

function PlayerInfoCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if UILayerCtrl.IsCurrentLayerCurtain() or UIManager.IsMovieMode() then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "PlayerInfoBag" then
		if AppVer == AppDemoCJReview then
			if inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
				currentItemTypeIndex = (currentItemTypeIndex - 2 + 3) % 3 + 1

				local button = itemTypeNavButtonGroup[currentItemTypeIndex]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
				currentItemTypeIndex = currentItemTypeIndex % 3 + 1

				local button = itemTypeNavButtonGroup[currentItemTypeIndex]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			end
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			if quickSlot.isEdit then
				return
			end

			currentItemTypeIndex = (currentItemTypeIndex - 2 + itemTypeCountMax) % itemTypeCountMax + 1

			local button = itemTypeNavButtonGroup[currentItemTypeIndex]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			if quickSlot.isEdit then
				return
			end

			currentItemTypeIndex = currentItemTypeIndex % itemTypeCountMax + 1

			local button = itemTypeNavButtonGroup[currentItemTypeIndex]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	elseif layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
		if inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_prev")
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_next")
		end
	elseif layerName == "PlayerInfoTalent" then
		if AppVer == AppDemoCJReview then
			-- block empty
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			currentHeroIndex = (currentHeroIndex - 2 + selectHeroList.loadCount) % selectHeroList.loadCount + 1

			local button = selectHeroList.HeroBtnGroup[FS_UserData.story:GetUIHeroId(currentHeroIndex)]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			currentHeroIndex = currentHeroIndex % selectHeroList.loadCount + 1

			local button = selectHeroList.HeroBtnGroup[FS_UserData.story:GetUIHeroId(currentHeroIndex)]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	elseif layerName == "PlayerInfoProperty" then
		if AppVer == AppDemoCJReview then
			-- block empty
		elseif selectHeroList.LoadFinish then
			if inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
				if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and isEditor then
					PlayerInfoCtrl.ChangeSkin()
				else
					currentHeroIndex = (currentHeroIndex - 2 + selectHeroList.loadCount) % selectHeroList.loadCount + 1

					local button = selectHeroList.HeroBtnGroup[FS_UserData.story:GetUIHeroId(currentHeroIndex)]

					button:OnDown(nil, nil)
					button:OnClick(nil, nil)
				end
			elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
				if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and isEditor then
					PlayerInfoCtrl.ChangeSkin()
				else
					currentHeroIndex = currentHeroIndex % selectHeroList.loadCount + 1

					local button = selectHeroList.HeroBtnGroup[FS_UserData.story:GetUIHeroId(currentHeroIndex)]

					button:OnDown(nil, nil)
					button:OnClick(nil, nil)
				end
			end
		end
	elseif layerName == "PlayerInfoBooty" then
		if booty.itemSelectPanel.activeSelf then
			if inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
				booty.trophyTypeIndex = (booty.trophyTypeIndex - 2 + booty.trophyTypeCountMax) % booty.trophyTypeCountMax + 1

				local button = booty.trophyTypeNavButton[booty.trophyTypeIndex]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
				booty.trophyTypeIndex = booty.trophyTypeIndex % booty.trophyTypeCountMax + 1

				local button = booty.trophyTypeNavButton[booty.trophyTypeIndex]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			end
		end
	elseif layerName == "PlayerInfoAlchemy" and alchemy.ItemSelectPanel.activeSelf then
		if inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			alchemy.trophyTypeIndex = (alchemy.trophyTypeIndex - 2 + alchemy.trophyTypeCountMax) % alchemy.trophyTypeCountMax + 1

			local button = alchemy.trophyTypeNavButton[alchemy.trophyTypeIndex]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			alchemy.trophyTypeIndex = alchemy.trophyTypeIndex % alchemy.trophyTypeCountMax + 1

			local button = alchemy.trophyTypeNavButton[alchemy.trophyTypeIndex]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	end

	if layerName == "PlayerInfoBag" or layerName == "PlayerInfoBooty" or layerName == "PlayerInfoAlchemy" or layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" or layerName == "PlayerInfoTask" or layerName == "PlayerInfoTalentDetail" or layerName == "PlayerInfoTalent" or layerName == "PlayerInfoProperty" then
		if inputMgr:GetButtonUp(LS_Setting.Btn.L2) or inputMgr:GetKeyL2Down() then
			PlayerInfoCtrl.SkillAxisPress(3)
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.R2) or inputMgr:GetKeyR2Down() then
			PlayerInfoCtrl.SkillAxisPress(4)
		end
	end

	if AppVer == AppAppleDemo then
		-- block empty
	elseif (inputMgr:GetButtonUp(GPKey.PLAYERINFO) or inputMgr:GetKeyDown(KMKey.PLAYERINFO)) and (layerName == "GameMain" or layerName == "PlayerInfoBag" or layerName == "PlayerInfoTalent" or layerName == "PlayerInfoBooty" or layerName == "PlayerInfoAlchemy" or layerName == "PlayerInfoTask" or layerName == "PlayerInfoProperty" or layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4") and isActive then
		UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
	end

	if inputMgr:GetButtonUp(LS_Setting.Btn.BX) or inputMgr:GetKeyDown(XKeyCode.R) then
		if layerName == "PlayerInfoBooty" then
			if booty.itemSelectPanel.activeSelf and booty.SlotList[booty.SelectedSlot].item ~= nil then
				booty.removeBtnCB()
			elseif booty.SlotList[booty.SelectedSlot].item == nil then
				return
			else
				FS_UserData.trophy:Remove(booty.SelectedSlot, false)

				booty.SlotList[booty.SelectedSlot].item = nil

				booty.SlotList[booty.SelectedSlot].image.gameObject:SetActive(false)
				PlayerInfoCtrl.RefreshTrophyBonus()
				PlayerInfoCtrl.SetTrophyDescription()
				sceneController:HeroAttribUpdate(false)
				AudioCtrl.SetUIAudio("player_info/unwield")
				PlayerInfoCtrl.RefreshProperty(FS_UserData.story:GetUIHeroId(currentHeroIndex))
				gamePadIcon.drop_down_x:SetActive(false)
				keyboardIcon.drop_down_x:SetActive(false)
			end
		elseif layerName == "PlayerInfoBag" then
			if quickSlot.isEdit then
				UILayerCtrl.OnButtonClick("RemoveBtn")
			end
		elseif layerName == "PlayerInfoAlchemy" then
			UILayerCtrl.OnButtonClick("AttributePointTip")
		end
	end

	if inputMgr:GetButtonDown(LS_Setting.Btn.BY) or inputMgr:GetKeyDown(XKeyCode.F) then
		if layerName == "PlayerInfoAlchemy" then
			if alchemy.isAllow == false or alchemy.ItemSelectPanel.activeSelf or alchemy.CurrentLoadAlchemyFunc ~= PlayerInfoCtrl.LoadAlchemyDedication then
				return
			end

			alchemy.alchemyConfirmClickTimes = 1
			alchemy.alchemyConfirmClickInterval = 10

			PlayerInfoCtrl.AlchemyConfirm(1)
		elseif layerName == "PlayerInfoBooty" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_DeleteBtn")
		end
	end

	if (inputMgr:GetButton(LS_Setting.Btn.BY) or inputMgr:GetKey(XKeyCode.F)) and layerName == "PlayerInfoAlchemy" then
		if alchemy.isAllow == false or alchemy.ItemSelectPanel.activeSelf or alchemy.CurrentLoadAlchemyFunc ~= PlayerInfoCtrl.LoadAlchemyDedication then
			return
		end

		alchemy.alchemyConfirmClickTimes = alchemy.alchemyConfirmClickTimes + 1

		local gameFps = LS_Setting.FrameRate[LS_Setting.graphics.framerate]

		if gameFps == -1 then
			gameFps = 144
		end

		if alchemy.alchemyConfirmClickTimes < gameFps / 2 then
			return
		end

		if math.fmod(alchemy.alchemyConfirmClickTimes, alchemy.alchemyConfirmClickInterval) == 0 then
			if alchemy.alchemyConfirmClickTimes > gameFps * 3 then
				PlayerInfoCtrl.AlchemyConfirm(6)
			else
				PlayerInfoCtrl.AlchemyConfirm(1)
			end
		end

		if alchemy.alchemyConfirmClickTimes > gameFps * 2 then
			alchemy.alchemyConfirmClickInterval = 2
		elseif gameFps < alchemy.alchemyConfirmClickTimes then
			alchemy.alchemyConfirmClickInterval = 3
		end
	end

	if inputMgr:GetButtonUp(LS_Setting.Btn.BY) or inputMgr:GetKeyUp(XKeyCode.F) then
		if layerName == "PlayerInfoAlchemy" then
			if alchemy.isAllow == false or alchemy.ItemSelectPanel.activeSelf or alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyDedication then
				return
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
			PlayerInfoCtrl.AlchemyConfirm()
		elseif layerName == "PlayerInfoBag" then
			if quickSlot.isEdit == false then
				itemTypeNavButtonGroup[1]:OnDown(nil, nil)
				itemTypeNavButtonGroup[1]:OnClick(nil, nil)
				UILayerCtrl.OnButtonClick("EditBtn")
				PlayerInfoCtrl.OnSelectQuickSLot(quickSlot.quickIndex)

				quickSlot.isSelectItem = false
			else
				UILayerCtrl.OnButtonClick("EditBtn")
			end
		elseif layerName == "PlayerInfoProperty" then
			if isEditor then
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_SKILL")
			else
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_SKILL")
			end
		end
	end

	if inputMgr:GetButtonUp(LS_Setting.Btn.R3) or inputMgr:GetKeyDown(XKeyCode.LeftShift) then
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoBooty" then
			if booty.LockOnBtn.gameObject.activeSelf then
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn_LockOn")
			elseif booty.LockOffBtn.gameObject.activeSelf then
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_PanelR_TrophyDesGroup_LockBtn_LockOff")
			end
		elseif layerName == "PlayerInfoAlchemy" and alchemy.ItemSelectPanel.activeSelf then
			if alchemy.ItemSelect.LockOnBtn.gameObject.activeSelf then
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup_LockOn")
			elseif alchemy.ItemSelect.LockOffBtn.gameObject.activeSelf then
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_AlchemyTab_ItemSelectPanel_Right_itemFrame_LockGroup_LockOff")
			end
		end
	end

	if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName ~= nil and (layerName == "PlayerInfoTalent" or layerName == "PlayerInfoItemEquip") then
			UILayerCtrl.OnCursorClick()
		elseif layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			UILayerCtrl.OnCursorClick()
		elseif layerName == "PlayerInfoProperty" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_PropertyTab_ConfirmBtn")
		elseif layerName == "PlayerInfoAlchemyConfirm" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Confirm")
		elseif layerName == "PlayerInfoBag" then
			if quickSlot.isEdit then
				if quickSlot.isSelectItem == true then
					UILayerCtrl.OnButtonClick("PutInBtn")

					quickSlot.isSelectItem = false
				else
					UILayerCtrl.OnCursorClick()
				end
			else
				if not itemDetail.canUse then
					return
				end

				itemDetail.LastItemBtnName = UILayerCtrl.GetCurrentButtonName()

				UILayerCtrl.OnButtonClick("UseBtn")
			end
		elseif layerName == "PlayerInfoAlchemy" then
			local btnName = UILayerCtrl.GetCurrentButtonName()

			if alchemy.ItemSelectPanel.activeSelf then
				UILayerCtrl.OnButtonClick("ItemSelectPutInBtn")
			elseif btnName == "AgentiaTabBtn" or btnName == "TrophyTabBtn" or btnName == "EnchantTabBtn" or btnName == "DedicationTabBtn" or btnName == "RestTabBtn" then
				PlayerInfoCtrl.DPadPress(XButton.Adjacent.RIGHT)
			else
				UILayerCtrl.OnCursorClick()
			end
		elseif layerName == "PlayerInfoTask" then
			PlayerInfoCtrl.DPadPress(XButton.Adjacent.RIGHT)
			UILayerCtrl.OnCursorClick()
		elseif layerName == "PlayerInfoLevelup" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_LevelupDedicationPanel_Panel_dedicate")
		elseif layerName == "PlayerInfoAlchemyBag" then
			UILayerCtrl.OnButtonClick("slotItemConfirmBtn")
		elseif layerName == "PlayerInfoBooty" then
			UIManager.SendMessage("PlayerInfo", "BootyConfirm")
		elseif layerName == "PlayerInfoAlchemyGetItem" then
			UILayerCtrl.OnButtonClick("AlchemyGetItemBack")
		end
	end

	if inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetKeyCancelDown() then
		local layerName = UILayerCtrl.GetCurrentLayerName()

		if layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_TalentTab_detailBG_Back")
		elseif layerName == "PlayerInfoItemEquip" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_BagTab_QuickBag_BackBtn")
		elseif layerName == "PlayerInfoTalent" or layerName == "PlayerInfoProperty" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
		elseif layerName == "PlayerInfoAlchemyConfirm" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_AlchemyConfirmPanel_BG_BtnGroup_Cancel")
		elseif layerName == "PlayerInfoBag" then
			if quickSlot.isEdit then
				if quickSlot.isSelectItem == true then
					quickSlot.isSelectItem = false

					PlayerInfoCtrl.OnSelectQuickSLot(quickSlot.quickIndex)
				else
					UILayerCtrl.OnButtonClick("EditBtn")
				end
			elseif itemDetail.isInEquipmentState then
				PlayerInfoCtrl.ExitEquipItemState()
			elseif itemDetail.isChoosingBtn then
				itemDetail.isChoosingBtn = false

				UILayerCtrl.OnSelect(itemDetail.LastItemBtnName)
			else
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
			end
		elseif layerName == "PlayerInfoAlchemy" then
			local btnName = UILayerCtrl.GetCurrentButtonName()

			if alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyAgentia or alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyTrophy or alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyDedication or alchemy.CurrentLoadAlchemyFunc == PlayerInfoCtrl.LoadAlchemyRest then
				if btnName and (string.find(btnName, "AlchemyFoldListTitle") == 1 or string.find(btnName, "AlchemyExpItem") == 1 or btnName == "RestBtn") then
					PlayerInfoCtrl.DPadPress(XButton.Adjacent.LEFT)
				else
					UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
				end
			elseif alchemy.ItemSelectPanel.activeSelf then
				UILayerCtrl.OnButtonClick("ItemSelectBackBtn")
			elseif alchemy.strengthenOffset.activeSelf then
				PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
				alchemy.strengthenOffset:SetActive(false)

				if alchemy.Status == MS_ItemData.Type.RecastStone then
					UILayerCtrl.OnSelect("RecastBtn")
				elseif alchemy.Status == MS_ItemData.Type.StrengthenStone then
					UILayerCtrl.OnSelect("StrengthenBtn")
				end
			elseif btnName == "RecastBtn" or btnName == "StrengthenBtn" then
				PlayerInfoCtrl.DPadPress(XButton.Adjacent.LEFT)
			else
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
			end
		elseif layerName == "PlayerInfoTask" then
			local btnName = UILayerCtrl.GetCurrentButtonName()

			if string.find(btnName, "MainTitle") == 1 then
				PlayerInfoCtrl.DPadPress(XButton.Adjacent.LEFT)
				task.MainTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.LastMainTitleBtnName)
			elseif string.find(btnName, "BranchTitle") == 1 then
				PlayerInfoCtrl.DPadPress(XButton.Adjacent.LEFT)

				if task.CurrentType == MS_UIQuest.QuestType.BranchTitle then
					task.BranchTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.LastBranchTitleBtnName)
				end
			elseif string.find(btnName, "DocumentTitle") == 1 then
				PlayerInfoCtrl.DPadPress(XButton.Adjacent.LEFT)

				if task.CurrentType == MS_UIQuest.QuestType.DocumentTitle then
					task.DocumentTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.LastDocumentTitleBtnName)
				end
			elseif string.find(btnName, "Goal") == 1 then
				PlayerInfoCtrl.DPadPress(XButton.Adjacent.LEFT)
			else
				UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
			end
		elseif layerName == "PlayerInfoAlchemyGetItem" then
			UILayerCtrl.OnButtonClick("AlchemyGetItemBack")
		elseif layerName == "PlayerInfoBooty" then
			UIManager.SendMessage("PlayerInfo", "BootyCancel")
		elseif layerName == "PlayerInfoLevelup" then
			UILayerCtrl.OnButtonClick("PlayerInfoPanel_LevelupDedicationPanel")
		elseif layerName == "SelectItem" then
			UILayerCtrl.OnButtonClick("Panel_SelectItems")
		elseif layerName == "PlayerInfoAlchemyBag" then
			UILayerCtrl.OnButtonClick("BagPanel_Back")
		end
	end
end

function PlayerInfoCtrl.JPadRot(pos)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "PlayerInfoBag" then
		if itemDetail.triangleGroup.activeSelf then
			local flowRow = Mathf.Round((itemDetail.contentGroupRT.rect.height - itemDetail.contentHeight) / itemDetail.oneLineHeight)

			if flowRow < 1 then
				flowRow = 1
			end

			if pos == XButton.Adjacent.DOWN then
				itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
			elseif pos == XButton.Adjacent.UP then
				itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
			end
		end
	elseif lName == "PlayerInfoTask" then
		if task.triangleGroup.activeSelf then
			local flowRow = Mathf.Round((task.contentGroupRT.rect.height - task.contentHeight) / task.oneLineHeight)

			if flowRow < 1 then
				flowRow = 1
			end

			if pos == XButton.Adjacent.DOWN then
				task.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(task.contentGroupScroll.scrollRectCom.normalizedPosition.x, task.contentGroupScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
			elseif pos == XButton.Adjacent.UP then
				task.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(task.contentGroupScroll.scrollRectCom.normalizedPosition.x, task.contentGroupScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
			end
		end
	elseif lName == "PlayerInfoAlchemy" then
		if alchemy.ItemSelectPanel.activeSelf then
			if alchemy.ItemSelect.triangleGroup.activeSelf then
				local flowRow = Mathf.Round((alchemy.ItemSelect.contentGroupRT.rect.height - alchemy.ItemSelect.contentHeight) / alchemy.ItemSelect.oneLineHeight)

				if flowRow < 1 then
					flowRow = 1
				end

				if pos == XButton.Adjacent.DOWN then
					alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition.x, alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
				elseif pos == XButton.Adjacent.UP then
					alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition.x, alchemy.ItemSelect.contentGroupScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
				end
			end
		elseif alchemy.triangleGroup.activeSelf then
			local flowRow = Mathf.Round((alchemy.contentGroupRT.rect.height - alchemy.contentHeight) / alchemy.oneLineHeight)

			if flowRow < 1 then
				flowRow = 1
			end

			if pos == XButton.Adjacent.DOWN then
				alchemy.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.contentGroupScroll.scrollRectCom.normalizedPosition.x, alchemy.contentGroupScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
			elseif pos == XButton.Adjacent.UP then
				alchemy.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.contentGroupScroll.scrollRectCom.normalizedPosition.x, alchemy.contentGroupScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
			end
		end
	elseif lName == "PlayerInfoBooty" and booty.triangleGroup.activeSelf then
		local flowRow = Mathf.Round((booty.contentGroupRT.rect.height - booty.contentHeight) / booty.oneLineHeight)

		if flowRow < 1 then
			flowRow = 1
		end

		if pos == XButton.Adjacent.DOWN then
			booty.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.contentGroupScroll.scrollRectCom.normalizedPosition.x, booty.contentGroupScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
		elseif pos == XButton.Adjacent.UP then
			booty.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.contentGroupScroll.scrollRectCom.normalizedPosition.x, booty.contentGroupScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
		end
	end
end

function PlayerInfoCtrl.JPadRotPrecise(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "PlayerInfoItemEquip" then
		local mag = math.sqrt(vec2.x * vec2.x + vec2.y * vec2.y)

		if mag > 7.5 then
			local d = math.atan2(vec2.y, vec2.x)

			d = math.deg(d)

			if d > -10 and d < 10 then
				UILayerCtrl.OnSelect("QuickSelected5")
			elseif d >= 10 and d <= 90 then
				UILayerCtrl.OnSelect("QuickSelected6")
			elseif d >= 90 and d < 170 then
				UILayerCtrl.OnSelect("QuickSelected1")
			elseif d >= 170 and d <= 180 or d >= -180 and d <= -170 then
				UILayerCtrl.OnSelect("QuickSelected2")
			elseif d > -170 and d <= -90 then
				UILayerCtrl.OnSelect("QuickSelected3")
			elseif d >= -90 and d <= -10 then
				UILayerCtrl.OnSelect("QuickSelected4")
			end
		end
	end
end

function PlayerInfoCtrl.SkillAxisPress(pos)
	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName ~= nil and (layerName == "PlayerInfoBag" or layerName == "PlayerInfoTalent" or layerName == "PlayerInfoBooty" or layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoAlchemy" or layerName == "PlayerInfoTask" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" or layerName == "PlayerInfoProperty") then
		if layerName == "PlayerInfoAlchemy" then
			if pos == XButton.Adjacent.UP then
				currentAlchemyTabBtnIndex = (currentAlchemyTabBtnIndex - 2 + alchemyTabBtnCountMax) % alchemyTabBtnCountMax + 1

				local button = alchemyNavButtonGroup[currentAlchemyTabBtnIndex]

				if button.gameObject.activeSelf then
					button:OnDown(nil, nil)
					button:OnClick(nil, nil)
				else
					PlayerInfoCtrl.SkillAxisPress(XButton.Adjacent.UP)
				end
			end

			if pos == XButton.Adjacent.DOWN then
				currentAlchemyTabBtnIndex = currentAlchemyTabBtnIndex % alchemyTabBtnCountMax + 1

				local button = alchemyNavButtonGroup[currentAlchemyTabBtnIndex]

				if button.gameObject.activeSelf then
					button:OnDown(nil, nil)
					button:OnClick(nil, nil)
				else
					PlayerInfoCtrl.SkillAxisPress(XButton.Adjacent.DOWN)
				end
			end
		end

		if pos == XButton.Adjacent.LEFT then
			currentBtnIndex = (currentBtnIndex - 2 + mainTabBtnCountMax) % mainTabBtnCountMax + 1

			local button = navButtonGroup[currentBtnIndex]

			if button.gameObject.activeSelf then
				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			else
				PlayerInfoCtrl.SkillAxisPress(XButton.Adjacent.LEFT)
			end
		end

		if pos == XButton.Adjacent.RIGHT then
			currentBtnIndex = currentBtnIndex % mainTabBtnCountMax + 1

			local button = navButtonGroup[currentBtnIndex]

			if button.gameObject.activeSelf then
				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			else
				PlayerInfoCtrl.SkillAxisPress(XButton.Adjacent.RIGHT)
			end
		end
	end
end

function PlayerInfoCtrl.BootyConfirm()
	local btnName = UILayerCtrl.GetCurrentButtonName()

	if string.find(btnName, "BootyItemBtn") == 1 then
		UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_EquipBtn")
	else
		UILayerCtrl.OnCursorClick()
	end
end

function PlayerInfoCtrl.BootyCancel()
	if booty.isProcessingDelete then
		booty.isProcessingDelete = false

		return
	end

	if booty.itemSelectPanel.activeSelf then
		UILayerCtrl.OnButtonClick("PlayerInfoPanel_PlayerPanel_B_TabPanel_BootyTab_ItemPanel_Close")
	else
		UILayerCtrl.OnButtonClick("PlayerInfoPanel_Back_LT")
	end
end

function PlayerInfoCtrl.DPadPress(pos)
	local layerName = UILayerCtrl.GetCurrentLayerName()
	local btnName = UILayerCtrl.GetCurrentButtonName()

	if layerName == nil or btnName == nil then
		return
	end

	if layerName == "PlayerInfoBag" then
		local tname = UILayerCtrl.GetCurrentButtonName()

		if string.find(tname, "item") == 1 then
			local nextBtn = UILayerCtrl.Select(pos)

			if nextBtn == nil then
				return
			end

			UILayerCtrl.OnCursorClick()

			if pos == XButton.Adjacent.UP or pos == XButton.Adjacent.DOWN then
				if inventory.itemLoader.loadCount < inventoryItemRow + 1 then
					return
				end

				local row = tonumber(string.sub(tname, 5))
				local toprow = 1 + math.floor((1 - inventory.bagScroll.scrollRectCom.normalizedPosition.y) / (1 / (inventory.itemLoader.loadCount - inventoryItemRow)) + 0.5)
				local botrow = toprow + inventoryItemRow - 1

				if pos == XButton.Adjacent.DOWN and botrow <= row then
					if tname == "item" .. inventory.itemLoader.loadCount then
						inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, 1)
					else
						inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, inventory.bagScroll.scrollRectCom.normalizedPosition.y - 1 / (inventory.itemLoader.loadCount - inventoryItemRow))
					end
				elseif pos == XButton.Adjacent.UP and row <= toprow then
					if tname == "item1" then
						inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, 0)
					else
						inventory.bagScroll.scrollRectCom.normalizedPosition = Vector2.New(inventory.bagScroll.scrollRectCom.normalizedPosition.x, inventory.bagScroll.scrollRectCom.normalizedPosition.y + 1 / (inventory.itemLoader.loadCount - inventoryItemRow))
					end
				end
			end
		elseif string.find(tname, "QuickSlot") == 1 then
			local nextBtn = UILayerCtrl.Select(pos)

			if nextBtn == nil then
				return
			end

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)

			local tname = UILayerCtrl.GetCurrentButtonName()
			local slotIndex = tonumber(string.sub(tname, 10))

			if not itemDetail.isInEquipmentState then
				PlayerInfoCtrl.OnSelectQuickSLot(slotIndex)
			end

			quickSlot.quickIndex = slotIndex

			quickSlot.RemoveBtn.gameObject:SetActive(quickList[quickSlot.quickIndex].itemId > 0)
		elseif itemDetail.isChoosingBtn then
			UILayerCtrl.Select(pos)
		end
	elseif layerName == "PlayerInfoTask" then
		local lastBtn = UILayerCtrl.GetCurrentButton()
		local nextBtn = UILayerCtrl.Select(pos)

		if nextBtn == nil then
			return
		end

		if string.find(btnName, "Goal") == 1 then
			if pos == XButton.Adjacent.LEFT then
				task.DetailPanel.taskDescriptionText:SetContent(task.LastGoalDescriptionText)

				if task.CurrentType == MS_UIQuest.QuestType.DocumentTitle then
					for k, v in pairs(task.GoalComList) do
						v.SelectBG:SetActive(false)
					end

					task.GoalComList[task.GoalLoader.loadCount].SelectBG:SetActive(true)
				end

				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)

				task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, 0)
			elseif pos == XButton.Adjacent.UP or pos == XButton.Adjacent.DOWN then
				UILayerCtrl.OnCursorClick()

				local row = tonumber(string.sub(btnName, 5))
				local toprow = 1 + math.floor((1 - task.GoalScroll.scrollRectCom.normalizedPosition.y) / (1 / (task.GoalLoader.loadCount - task.GoalRow)) + 0.5)
				local botrow = toprow + task.GoalRow - 1

				if pos == XButton.Adjacent.DOWN and botrow <= row then
					if btnName == "Goal" .. task.GoalLoader.loadCount then
						task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, 1)
					else
						task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, task.GoalScroll.scrollRectCom.normalizedPosition.y - 1 / (task.GoalLoader.loadCount - task.GoalRow))
					end
				elseif pos == XButton.Adjacent.UP and row <= toprow then
					if btnName == "Goal1" then
						task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, 0)
					else
						task.GoalScroll.scrollRectCom.normalizedPosition = Vector2.New(task.GoalScroll.scrollRectCom.normalizedPosition.x, task.GoalScroll.scrollRectCom.normalizedPosition.y + 1 / (task.GoalLoader.loadCount - task.GoalRow))
					end
				end
			end
		else
			if pos == XButton.Adjacent.UP or pos == XButton.Adjacent.DOWN then
				if string.find(btnName, "MainTitle") == 1 then
					local row = tonumber(string.sub(btnName, 10))
					local toprow = 1 + math.floor((1 - task.MainScroll.scrollRectCom.normalizedPosition.y) / (1 / (task.MainLoader.loadCount - task.MainRow)) + 0.5)
					local botrow = toprow + task.MainRow - 1

					if pos == XButton.Adjacent.DOWN and botrow <= row then
						if btnName == "MainTitle" .. task.MainLoader.loadCount then
							task.MainScroll.scrollRectCom.normalizedPosition = Vector2.New(task.MainScroll.scrollRectCom.normalizedPosition.x, 1)
						else
							task.MainScroll.scrollRectCom.normalizedPosition = Vector2.New(task.MainScroll.scrollRectCom.normalizedPosition.x, task.MainScroll.scrollRectCom.normalizedPosition.y - 1 / (task.MainLoader.loadCount - task.MainRow))
						end
					elseif pos == XButton.Adjacent.UP and row <= toprow then
						if btnName == "MainTitle1" then
							task.MainScroll.scrollRectCom.normalizedPosition = Vector2.New(task.MainScroll.scrollRectCom.normalizedPosition.x, 0)
						else
							task.MainScroll.scrollRectCom.normalizedPosition = Vector2.New(task.MainScroll.scrollRectCom.normalizedPosition.x, task.MainScroll.scrollRectCom.normalizedPosition.y + 1 / (task.MainLoader.loadCount - task.MainRow))
						end
					end
				elseif string.find(btnName, "BranchTitle") == 1 then
					local row = tonumber(string.sub(btnName, 12))
					local toprow = 1 + math.floor((1 - task.BranchScroll.scrollRectCom.normalizedPosition.y) / (1 / (task.BranchLoader.loadCount - task.BranchRow)) + 0.5)
					local botrow = toprow + task.BranchRow - 1

					if pos == XButton.Adjacent.DOWN and botrow <= row then
						if btnName == "BranchTitle" .. task.BranchLoader.loadCount then
							task.BranchScroll.scrollRectCom.normalizedPosition = Vector2.New(task.BranchScroll.scrollRectCom.normalizedPosition.x, 1)
						else
							task.BranchScroll.scrollRectCom.normalizedPosition = Vector2.New(task.BranchScroll.scrollRectCom.normalizedPosition.x, task.BranchScroll.scrollRectCom.normalizedPosition.y - 1 / (task.BranchLoader.loadCount - task.BranchRow))
						end
					elseif pos == XButton.Adjacent.UP and row <= toprow then
						if btnName == "BranchTitle1" then
							task.BranchScroll.scrollRectCom.normalizedPosition = Vector2.New(task.BranchScroll.scrollRectCom.normalizedPosition.x, 0)
						else
							task.BranchScroll.scrollRectCom.normalizedPosition = Vector2.New(task.BranchScroll.scrollRectCom.normalizedPosition.x, task.BranchScroll.scrollRectCom.normalizedPosition.y + 1 / (task.BranchLoader.loadCount - task.BranchRow))
						end
					end
				end
			elseif pos == XButton.Adjacent.LEFT then
				if string.find(btnName, "MainTitle") == 1 then
					task.MainTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.LastMainTitleBtnName)
				elseif string.find(btnName, "BranchTitle") == 1 then
					if task.CurrentType == MS_UIQuest.QuestType.BranchTitle then
						task.BranchTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.LastBranchTitleBtnName)
					end
				elseif string.find(btnName, "DocumentTitle") == 1 then
					task.DocumentTabBtn:SetAdjacent(XButton.Adjacent.RIGHT, task.LastDocumentTitleBtnName)
				end

				if lastBtn then
					lastBtn:SetCommonHighlighted(true)
				end
			end

			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "PlayerInfoBooty" then
		if string.find(btnName, "BootyItemBtn") == 1 then
			local nextBtn = UILayerCtrl.Select(pos)

			if nextBtn == nil then
				return
			end

			UILayerCtrl.OnCursorClick()

			if pos == XButton.Adjacent.UP or pos == XButton.Adjacent.DOWN then
				local itemIndex = string.sub(btnName, 13)
				local row = math.ceil(tonumber(itemIndex) / trophyItemColumn)

				if booty.itemLoader.loadCount < trophyItemColumn * trophyItemRow + 1 then
					return
				end

				local toprow = 1 + math.floor((1 - booty.itemScroll.scrollRectCom.normalizedPosition.y) / (1 / (math.ceil(booty.itemLoader.loadNum / trophyItemColumn) - trophyItemRow)) + 0.5)
				local botrow = toprow + trophyItemRow - 1

				if pos == XButton.Adjacent.DOWN and botrow <= row then
					booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, booty.itemScroll.scrollRectCom.normalizedPosition.y - 1 / (math.ceil(booty.itemLoader.loadNum / trophyItemColumn) - trophyItemRow))
				elseif pos == XButton.Adjacent.UP and row <= toprow then
					booty.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(booty.itemScroll.scrollRectCom.normalizedPosition.x, booty.itemScroll.scrollRectCom.normalizedPosition.y + 1 / (math.ceil(booty.itemLoader.loadNum / trophyItemColumn) - trophyItemRow))
				end
			end
		else
			if booty.itemSelectPanel.activeSelf == false then
				local nextBtn = UILayerCtrl.Select(pos)

				if nextBtn == nil then
					return
				end

				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)

				local tname = UILayerCtrl.GetCurrentButtonName()

				booty.SelectedSlot = tonumber(string.sub(tname, 8, 8))

				PlayerInfoCtrl.OnSelectTrophyItem()
				PlayerInfoCtrl.SetTrophyDescription(booty.SlotList[booty.SelectedSlot].item)

				if booty.SelectedSlot == 1 or booty.SelectedSlot == 2 then
					PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyScars)
				elseif booty.SelectedSlot == 3 or booty.SelectedSlot == 4 then
					PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyResistance)
				elseif booty.SelectedSlot == 5 or booty.SelectedSlot == 6 then
					PlayerInfoCtrl.SetTrophyTitle(MS_ItemData.Type.TrophyNightmare)
				end
			end

			booty.SelectedSlot = UILayerCtrl.GetCurrentButton().pos

			gamePadIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
			keyboardIcon.drop_down_x:SetActive(booty.SlotList[booty.SelectedSlot].item ~= nil)
		end
	elseif layerName == "PlayerInfoAlchemyConfirm" then
		if pos == XButton.Adjacent.LEFT then
			alchemy.ConfirmGroup.MinBtnFunc()
		elseif pos == XButton.Adjacent.RIGHT then
			alchemy.ConfirmGroup.AddBtnFunc()
		end
	elseif layerName == "PlayerInfoAlchemy" then
		if alchemy.ItemSelectPanel.activeSelf then
			local tname = UILayerCtrl.GetCurrentButtonName()
			local nextBtn = UILayerCtrl.Select(pos)

			if nextBtn == nil then
				return
			end

			UILayerCtrl.OnCursorClick()

			if string.find(tname, "AlchemyItemSelectItemBtn") == 1 and (pos == XButton.Adjacent.UP or pos == XButton.Adjacent.DOWN) then
				local itemRow = 7

				if alchemy.ItemSelect.ItemLoader.loadCount < itemRow + 1 then
					return
				end

				local row = tonumber(string.sub(tname, 25))
				local toprow = 1 + math.floor((1 - alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.y) / (1 / (alchemy.ItemSelect.ItemLoader.loadCount - itemRow)) + 0.5)
				local botrow = toprow + itemRow - 1

				if pos == XButton.Adjacent.DOWN and botrow <= row then
					if tname == "AlchemyItemSelectItemBtn" .. alchemy.ItemSelect.ItemLoader.loadCount then
						alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.x, 1)
					else
						alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.x, alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.y - 1 / (alchemy.ItemSelect.ItemLoader.loadCount - itemRow))
					end
				elseif pos == XButton.Adjacent.UP and row <= toprow then
					if tname == "AlchemyItemSelectItemBtn1" then
						alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.x, 0)
					else
						alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.x, alchemy.ItemSelect.itemScroll.scrollRectCom.normalizedPosition.y + 1 / (alchemy.ItemSelect.ItemLoader.loadCount - itemRow))
					end
				end
			end
		else
			local currentBtnName = UILayerCtrl.GetCurrentButtonName()

			if alchemy.isAllow == false then
				return
			end

			if (currentBtnName == "RestTabBtn" or currentBtnName == "AgentiaTabBtn" or currentBtnName == "TrophyTabBtn" or currentBtnName == "EnchantTabBtn" or currentBtnName == "DedicationTabBtn") and (pos == XButton.Adjacent.DOWN or pos == XButton.Adjacent.UP) then
				PlayerInfoCtrl.SkillAxisPress(pos)

				return
			end

			if pos == XButton.Adjacent.RIGHT and (currentBtnName == "RecastBtn" or currentBtnName == "StrengthenBtn") then
				UILayerCtrl.AddButton("PlayerInfoAlchemy", "LastFoldListBtn", UILayerCtrl.GetCurrentButton())
			end

			local nextBtn = UILayerCtrl.Select(pos)

			if nextBtn == nil then
				return
			end

			if string.find(currentBtnName, "AlchemyExpItem") == 1 and pos == XButton.Adjacent.LEFT then
				UILayerCtrl.OnCursorClickMute()
			end

			if pos == XButton.Adjacent.RIGHT then
				if currentBtnName == "RecastBtn" or currentBtnName == "StrengthenBtn" or currentBtnName == "LastFoldListBtn" then
					PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
				elseif currentBtnName == "AgentiaTabBtn" or currentBtnName == "TrophyTabBtn" then
					alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, 1)
				end
			end

			local newBtnName = UILayerCtrl.GetCurrentButtonName()

			if newBtnName == "RecastBtn" then
				alchemy.Status = MS_ItemData.Type.RecastStone

				PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
				PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
				alchemy.strengthenOffset:SetActive(false)
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)
			elseif newBtnName == "StrengthenBtn" then
				alchemy.Status = MS_ItemData.Type.StrengthenStone

				PlayerInfoCtrl.HighLightStrengthOrRecastBtn()
				PlayerInfoCtrl.ResetAlchemySubAndMainSlotItem()
				alchemy.strengthenOffset:SetActive(false)
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)
			elseif newBtnName == "StrengthenItemMainSlot" then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)
			elseif newBtnName == "StrengthenItemSubSlot" then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.PageSwitch)
			end

			if string.find(newBtnName, "AlchemyExpItem") == 1 then
				UILayerCtrl.OnCursorClick()
			elseif string.find(newBtnName, "AlchemyFoldListTitle") == 1 then
				if string.len(newBtnName) > 25 then
					UILayerCtrl.OnCursorClick()
				else
					alchemy.RightBoard:SetActive(false)
					alchemy.ConfirmBtn.gameObject:SetActive(false)

					alchemy.requireBarList[1].isEnough = false
				end

				if pos == XButton.Adjacent.DOWN then
					local tempName

					if alchemy["foldList" .. alchemy.LastBtnIndex].isFoldListOpen then
						tempName = "AlchemyFoldListTitle" .. alchemy.LastBtnIndex .. "_Child" .. alchemy["foldList" .. alchemy.LastBtnIndex].SubListLoader.loadCount
					else
						tempName = "AlchemyFoldListTitle" .. alchemy.LastBtnIndex
					end

					if currentBtnName == tempName then
						alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, 1)
					else
						local targetBtn = UILayerCtrl.GetCurrentButton()
						local screenPos = alchemy.canvas.worldCamera:WorldToScreenPoint(targetBtn.transform.position)

						if alchemy.BottomScreenY + 50 > screenPos.y then
							local deltaScrollY = 69 / (alchemy.TypeBarContentRT.sizeDelta.y - alchemy.ScrollY)

							if alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.y > 0 then
								alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.y - deltaScrollY)
							end
						end
					end
				elseif pos == XButton.Adjacent.UP then
					if currentBtnName == "AlchemyFoldListTitle" .. alchemy.FirstBtnIndex then
						alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, 0)
					else
						local targetBtn = UILayerCtrl.GetCurrentButton()
						local screenPos = alchemy.canvas.worldCamera:WorldToScreenPoint(targetBtn.transform.position)

						if alchemy.TopScreenY - 50 < screenPos.y then
							local deltaScrollY = 69 / (alchemy.TypeBarContentRT.sizeDelta.y - alchemy.ScrollY)

							if alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.y < 1 then
								alchemy.TypeBarScroll.scrollRectCom.normalizedPosition = Vector2.New(alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.x, alchemy.TypeBarScroll.scrollRectCom.normalizedPosition.y + deltaScrollY)
							end
						end
					end
				end
			end
		end
	elseif layerName == "PlayerInfoLevelup" then
		local nextBtn = UILayerCtrl.Select(pos)

		if nextBtn == nil then
			return
		end

		UILayerCtrl.OnCursorClick()
	elseif layerName == "PlayerInfoTalent" or layerName == "PlayerInfoItemEquip" then
		local btn = UILayerCtrl.Select(pos)

		if btn ~= nil then
			AudioCtrl.SetUIAudio("player_info/talent_type_select")
		end
	elseif layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4" then
		if pos == XButton.Adjacent.LEFT then
			if talentDetail.NumText.num > 1 then
				PlayerInfoCtrl.SetTalentInfo(talentDetail.NumText.num - 1, true)
			end
		elseif pos == XButton.Adjacent.RIGHT and talentDetail.NumText.num < talentDetail.currentTalentMax then
			PlayerInfoCtrl.SetTalentInfo(talentDetail.NumText.num + 1, true)
		end
	elseif layerName == "PlayerInfoProperty" then
		if pos == XButton.Adjacent.DOWN or pos == XButton.Adjacent.UP then
			UILayerCtrl.Select(pos)
		elseif pos == XButton.Adjacent.RIGHT then
			if string.find(btnName, "selectBtn") == 1 then
				local row = string.sub(btnName, 10)

				property.addBtnFuncList[tonumber(row)]()
			end
		elseif pos == XButton.Adjacent.LEFT and string.find(btnName, "selectBtn") == 1 then
			local row = string.sub(btnName, 10)

			property.minBtnFuncList[tonumber(row)]()
		end
	end
end

function PlayerInfoCtrl.UseHeroExpItem(heroId, itemId, count)
	FS_UserData.itemList:UseBagItem(itemId, count)

	local _heroList = FS_UserData.heroList:GetHeroList()
	local gameController = sceneController:GetGameController()
	local recorded = {}
	local showTutorial = false
	local isHeroLevelUp = false
	local heroNewLevel = 1

	for _heroId, _heroData in pairs(_heroList) do
		local msg = {}

		msg.heroNo = _heroId
		msg.lev = _heroData.level

		if _heroData.level == MS_HeroData.HeroLevelMax then
			return
		end

		msg.exp = _heroData.exp
		msg.attribPoints = _heroData.attribPoints

		local expItem = MS_ItemData.GetItemData(itemId)
		local expTotal = expItem.Param1 * count

		while expTotal > 0 and msg.lev < MS_HeroData.HeroLevelMax do
			if expTotal < MS_HeroExp.GetHeroRequireExp(msg.lev + 1) - msg.exp then
				msg.exp = msg.exp + expTotal
				expTotal = 0
			else
				expTotal = expTotal - (MS_HeroExp.GetHeroRequireExp(msg.lev + 1) - msg.exp)
				msg.exp = 0
				msg.lev = msg.lev + 1
				isHeroLevelUp = true
				heroNewLevel = msg.lev

				if msg.lev == 2 then
					showTutorial = true
				end

				if not table.contains(recorded, msg.lev) then
					FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.LevelUpTime, msg.lev, FS_UserData.story:GetGameTime())
					alchemy.AttributePointTip.gameObject:SetActive(false)
					alchemy.AttributePointTip.gameObject:SetActive(true)
					table.insert(recorded, msg.lev)
				end

				msg.attribPoints = msg.attribPoints + 1
			end
		end

		FS_UserData.heroList:ParseHeroLevelExp(msg)
	end

	if isHeroLevelUp and SdkHelper.CHANNEL == "ANDROID_UNION" then
		SdkHelper.LogData_LevelUp(SdkHelper.AccountId, SdkHelper.AccountName, tostring(heroNewLevel), "1", SdkHelper.CHANNEL)
	end

	if showTutorial then
		gameController:OpenSpecialTutorial(MS_StoryTutorial.FirstTimeLevelUp)
	end

	PlayerInfoCtrl.AlchemyLevelUpResult(FS_UserData.story:GetUIHeroId(currentHeroIndex))
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Property].newLight:SetActive(PlayerInfoCtrl.AnyHeroHaveAttributePoints())
	PlayerInfoCtrl.RefreshHeroNewLight(true)
end

function PlayerInfoCtrl.AddHeroAttribute(heroId, deltaList)
	local msg = {}

	msg.heroNo = heroId

	local heroData = FS_UserData.heroList:GetHero(heroId)
	local minusPoint = 0

	for i = 1, #deltaList do
		msg["attrib" .. i] = deltaList[i] + heroData.attributeAdd[i]

		if deltaList[i] > 0 then
			FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.AddPointTime, heroId, i, deltaList[i], FS_UserData.story:GetGameTime())
		end

		minusPoint = minusPoint + deltaList[i]
	end

	msg.attrib7 = 0
	msg.attribPoints = heroData.attribPoints - minusPoint

	local oldhp = heroData:GetProperty(MS_HeroData.Property.Hp)

	FS_UserData.heroList:ParseHeroAttribute(msg)
	sceneController:HeroAttribUpdate(false)

	local newhp = heroData:GetProperty(MS_HeroData.Property.Hp)
	local player, heroIndex = sceneController:GetHostPlayerById(heroId)

	if player then
		player:GetValue():AddProperty(MS_HeroData.Property.Hp, newhp - oldhp)
	end

	PlayerInfoCtrl.RefreshProperty(heroId)
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Property].newLight:SetActive(PlayerInfoCtrl.AnyHeroHaveAttributePoints())
	PlayerInfoCtrl.RefreshHeroNewLight(true)
end

function PlayerInfoCtrl.AnyHeroHaveAttributePoints()
	local total = FS_UserData.story:GetUIHeroNum()

	for i = 1, total do
		if FS_UserData.heroList:HaveAttributePoints(FS_UserData.story:GetUIHeroId(i)) then
			return true
		end
	end

	return false
end

function PlayerInfoCtrl.RefreshHeroNewLight(isProperty)
	for k, v in pairs(selectHeroList.HeroBtnGroup) do
		v.newLight:SetActive(FS_UserData.heroList:HaveAttributePoints(k) and isProperty)
	end
end

function PlayerInfoCtrl.RefreshTrophyNewLight()
	for k, v in pairs(booty.trophyNewLigntlist) do
		v:SetActive(FS_UserData.itemList:IsAnyTrophyNewByType(k))
	end

	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Trophy].newLight:SetActive(FS_UserData.itemList:IsAnyTrophyNew())
end

function PlayerInfoCtrl.RefreshAlchemyNewLight()
	local tlist = MS_FormulaData.GetFormulaDataListByMainType(MS_ItemData.MainType.Trophy)

	tlist = PlayerInfoCtrl.CheckAlchemyQuest(tlist)

	local rett = false

	for k, v in pairs(tlist) do
		if not FS_UserData.story:GetFormulaKnown(v.FormulaId) then
			rett = true

			break
		end
	end

	local retc = false
	local clist = MS_FormulaData.GetFormulaDataListByMainType(MS_ItemData.MainType.Consume)
	local alist = MS_FormulaData.GetFormulaDataListByMainType(MS_ItemData.MainType.Attack)

	alist = PlayerInfoCtrl.CheckAlchemyQuest(alist)
	clist = PlayerInfoCtrl.CheckAlchemyQuest(clist)

	for k, v in pairs(clist) do
		if not FS_UserData.story:GetFormulaKnown(v.FormulaId) then
			retc = true

			break
		end
	end

	for k, v in pairs(alist) do
		if not FS_UserData.story:GetFormulaKnown(v.FormulaId) then
			retc = true

			break
		end
	end

	alchemy.NewLightList[MS_ItemData.MainType.Consume]:SetActive(retc)
	alchemy.NewLightList[MS_ItemData.MainType.Trophy]:SetActive(rett)
	menuBtnGroup[PlayerInfoCtrl.MenuGuideType.Alchemy].newLight:SetActive(retc or rett)
end

function PlayerInfoCtrl.ExternalEvent(hasJoystick)
	PlayerInfoCtrl.RefreshJoystickTalentInfo(hasJoystick)
end

function PlayerInfoCtrl.RefreshJoystickTalentInfo(hasJoystick)
	local layerName = UILayerCtrl.GetCurrentLayerName()

	if (layerName == "PlayerInfoTalent1" or layerName == "PlayerInfoTalent2" or layerName == "PlayerInfoTalent3" or layerName == "PlayerInfoTalent4") and talentDetail.currentTalentLevel ~= nil then
		PlayerInfoCtrl.SetTalentInfo(talentDetail.currentTalentLevel, false)
	end
end

return PlayerInfoCtrl
