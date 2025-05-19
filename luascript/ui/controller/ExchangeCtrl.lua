-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ExchangeCtrl.lua

ExchangeCtrl = class("ExchangeCtrl", UICtrlBase)

local this = ExchangeCtrl

ExchangeCtrl.static.TabType = {
	Sell = 2,
	Buy = 1
}
ExchangeCtrl.static.TransactionType = {
	Viola = 2,
	Benita = 4,
	Maze = 6,
	Norwood = 3,
	Secret = 5,
	Normal = 1
}
ExchangeCtrl.static.DLCSwitchType = {
	DarkMaze = 1,
	Normal = 0
}
ExchangeCtrl.static.DialogType = {
	ExchangeNothing = 2,
	ExchangeSomething = 1
}

local exchangeOrNot = ExchangeCtrl.DialogType.ExchangeNothing
local currentTabType = ExchangeCtrl.TabType.Buy
local targetStoryMonsterId
local isInConfirmState = false
local lastItemBtnName = "item1"
local lastItemBtn
local lastAxis2 = 0
local lastRotAxis2 = 0
local DholdTime, DholdDeltaTime, DholdInput, GholdTime, GholdDeltaTime, GholdInput, GholdTime2, GholdDeltaTime2, GholdInput2, itemDetail, itemLoader, buyTabBtn, sellTabBtn, normalTitleBG, benitaTitleBG, sellBtnTextGO, blessBtnTextGO, currentExpItemNumGroup, currentFogExpItemNumGroupGO, currentSpecialExpItemNumGroupGO, currentMazeItemNumGroupGO, currentExpItemNumGroupGO
local InventoryItemRow = 7
local isEnoughExpItem = false
local buyRequireExpItemType = MS_ItemData.ItemID_ExpAddList[1]
local sceneController
local buySellNumMax = 1
local backBtn, canClick, noBlessItemGO, gamePadIconRT, keyboardIconRT, currentType

function ExchangeCtrl.ClosePanel()
	if not canClick then
		return
	end

	this.gameObject:SetActive(false)

	lastItemBtn = nil

	UILayerCtrl.Pop()

	if backBtn.callback ~= nil then
		UIManager.SendMessage("Dialog", "SetNextCondition", exchangeOrNot)
		backBtn.callback()
	end
end

function ExchangeCtrl.OnCreate()
	this.loadFinish = false
	sceneController = ST_Main.GetSceneController()

	UILayerCtrl.Add("Transaction")

	backBtn = this.mainComponent:GetButton("ExchangePanel_BackBtn_L")

	UILayerCtrl.AddIndividual("Transaction", "ExchangePanel_BackBtn", backBtn)
	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ExchangeCtrl.ClosePanel()
	end)

	normalTitleBG = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ListTitleBG_normalBG")
	benitaTitleBG = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ListTitleBG_benitaBG")
	sellBtnTextGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_SellBtn_Text")
	blessBtnTextGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_SellBtn_Text2")
	buyTabBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_ListTitleBG_BuyTabBtn")

	buyTabBtn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	buyTabBtn:SelectOnStart(true)

	currentTabType = ExchangeCtrl.TabType.Buy

	buyTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if currentTabType ~= ExchangeCtrl.TabType.Buy then
			currentTabType = ExchangeCtrl.TabType.Buy
			canClick = false

			ExchangeCtrl.LoadBuyItem()

			isInConfirmState = false

			currentSpecialExpItemNumGroupGO:SetActive(false)
			currentExpItemNumGroupGO:SetActive(false)
			currentFogExpItemNumGroupGO:SetActive(false)
			currentMazeItemNumGroupGO:SetActive(false)

			if currentType == ExchangeCtrl.TransactionType.Viola then
				currentSpecialExpItemNumGroupGO:SetActive(true)
			elseif currentType == ExchangeCtrl.TransactionType.Norwood then
				currentFogExpItemNumGroupGO:SetActive(true)
			elseif currentType == ExchangeCtrl.TransactionType.Maze then
				currentMazeItemNumGroupGO:SetActive(true)
			else
				currentExpItemNumGroupGO:SetActive(true)
			end
		end
	end)
	UILayerCtrl.AddIndividual("Transaction", "buyTabBtn", buyTabBtn)

	sellTabBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_ListTitleBG_SellTabBtn")

	sellTabBtn:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	sellTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if currentTabType ~= ExchangeCtrl.TabType.Sell then
			currentTabType = ExchangeCtrl.TabType.Sell
			canClick = false

			ExchangeCtrl.LoadSellItem()

			isInConfirmState = false

			currentSpecialExpItemNumGroupGO:SetActive(false)
			currentExpItemNumGroupGO:SetActive(false)
			currentFogExpItemNumGroupGO:SetActive(false)
			currentMazeItemNumGroupGO:SetActive(false)

			if currentType == ExchangeCtrl.TransactionType.Viola then
				currentExpItemNumGroupGO:SetActive(true)
			elseif currentType == ExchangeCtrl.TransactionType.Norwood then
				currentExpItemNumGroupGO:SetActive(true)
			elseif currentType == ExchangeCtrl.TransactionType.Maze then
				currentMazeItemNumGroupGO:SetActive(true)
			else
				currentExpItemNumGroupGO:SetActive(true)
			end
		end
	end)
	UILayerCtrl.AddIndividual("Transaction", "sellTabBtn", sellTabBtn)

	itemDetail = {}
	itemDetail.Name = this.mainComponent:GetText("ExchangePanel_ExchangeBG_ItemInfoGroup_itemName")
	itemDetail.blessLevelText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_blessLevelText")
	itemDetail.Img = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ItemInfoGroup_itemFrame_itemImage")
	itemDetail.Img = XImage:new(itemDetail.Img)
	itemDetail.PriceNumText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_ItemInfoGroup_itemPrice_itemPriceNum")
	itemDetail.PriceImg = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ItemInfoGroup_itemPrice_itemPriceNum_expItemImg")
	itemDetail.PriceImg = XImage:new(itemDetail.PriceImg)
	itemDetail.Des = this.mainComponent:GetText("ExchangePanel_ExchangeBG_ItemInfoGroup_itemDes")
	itemDetail.BounsText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_ItemInfoGroup_itemBouns")
	itemDetail.ItemInfoGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ItemInfoGroup")
	itemDetail.ItemPriceGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ItemInfoGroup_itemPrice")
	itemDetail.leftPanel = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel")
	itemDetail.itemId = 0
	itemDetail.contentHeight = 495
	itemDetail.oneLineHeight = 23
	itemDetail.KeyboardBottomLockBtnText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_KeyboardIconGroup_R3_Text")
	itemDetail.KeyboardLockYGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_KeyboardIconGroup_R3")
	itemDetail.BottomLockBtnText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_GamePadIconGroup_R3_Text")
	itemDetail.LockYGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_GamePadIconGroup_R3")
	gamePadIconRT = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_GamePadIconGroup"):GetComponent("RectTransform")
	keyboardIconRT = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_KeyboardIconGroup"):GetComponent("RectTransform")
	itemDetail.LockGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup")
	itemDetail.LockOnBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup_LockOn")

	itemDetail.LockOnBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ExchangeCtrl.SetTrophyLockBtn(false)

		if itemDetail.trophy ~= nil then
			itemDetail.trophy:SetLock(false)
		end

		AudioCtrl.SetUIAudio("player_info/trophy_unlock")
	end)
	UILayerCtrl.AddIndividual("Transaction", "ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup_LockOn", itemDetail.LockOnBtn)

	itemDetail.LockOffBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup_LockOff")

	itemDetail.LockOffBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ExchangeCtrl.SetTrophyLockBtn(true)

		if itemDetail.trophy ~= nil then
			itemDetail.trophy:SetLock(true)
		end

		AudioCtrl.SetUIAudio("player_info/trophy_lock")
	end)
	UILayerCtrl.AddIndividual("Transaction", "ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup_LockOff", itemDetail.LockOffBtn)

	itemDetail.lineOffset = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_contentGroup_Viewport_Content_lineOffset")
	itemDetail.contentGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_contentGroup")
	itemDetail.triangleGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_contentGroup_triangleGroup")
	itemDetail.contentGroupRT = itemDetail.contentGroup.transform:Find("Viewport"):Find("Content"):GetComponent("RectTransform")
	itemDetail.contentGroupRectTransform = itemDetail.contentGroup:GetComponent("RectTransform")

	if UIManager.IsSteamDeck() then
		itemDetail.contentGroupRectTransform.sizeDelta = Vector2.New(272.56, 220)
		itemDetail.contentHeight = 210
	end

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

	itemDetail.BuyBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_BuyBtn")

	itemDetail.BuyBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if itemDetail.BuySellNum == 0 then
			return
		end

		if not isEnoughExpItem then
			local itemData = MS_ItemData.GetItemData(buyRequireExpItemType)
			local st = SystemHelper.ConvertReplaceRichText(GameText.UI_EXCHANGE_LACK_OF_EXP_ITEM, "{(%a)}", "i", itemData.Name)

			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", st)

			return
		end

		if itemDetail.num + itemDetail.BuySellNum > itemDetail.numMax then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_EXCHANGE_NUM_REACH_MAX)

			return
		end

		local retItem
		local itemData = MS_ItemData.GetItemData(itemDetail.itemId)

		if itemData.Type == MS_ItemData.Type.TrophyBox then
			if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)

				return
			end

			local trophyId = ExchangeCtrl.GetRandomTrophyId(itemData.Param1)

			retItem = sceneController:GetGameController():AddBagItem(trophyId, itemDetail.BuySellNum, true)
		elseif itemData.MainType == MS_ItemData.MainType.Trophy then
			if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_FULL)

				return
			else
				retItem = sceneController:GetGameController():AddBagItem(itemDetail.itemId, itemDetail.BuySellNum, true)
			end
		else
			retItem = sceneController:GetGameController():AddBagItem(itemDetail.itemId, itemDetail.BuySellNum, true)
		end

		local function refreshFunc()
			if buySellNumMax == -1 then
				ExchangeCtrl.BuySellFinishRefresh(buySellNumMax)
			else
				ExchangeCtrl.BuySellFinishRefresh(buySellNumMax - itemDetail.BuySellNum)
			end
		end

		if retItem then
			sceneController:GetGameController():UseBagItem(buyRequireExpItemType, itemDetail.PriceNumText.num * itemDetail.BuySellNum)
			FS_UserData.playerBehavior:RecordTimes(FS_PlayerBehavior.RecordType.ItemBuyTimes, itemDetail.itemId, targetStoryMonsterId, itemDetail.BuySellNum)
			FS_UserData.story:SetTransactionNum(itemDetail.transactionId, buySellNumMax - itemDetail.BuySellNum)
			AudioCtrl.SetUIAudio("player_info/deal_buy")

			local iconList = {}

			table.insert(iconList, retItem.itemIcon)

			if retItem:GetMainType() == MS_ItemData.MainType.Trophy then
				UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_GET, "", retItem:GetTrophyName() .. " x " .. itemDetail.BuySellNum, iconList, refreshFunc, this)
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_GET, "", retItem:GetItemName() .. " x " .. itemDetail.BuySellNum, iconList, refreshFunc, this)
			end

			exchangeOrNot = ExchangeCtrl.DialogType.ExchangeSomething
		end
	end)
	UILayerCtrl.AddButton("Transaction", "BuyBtn", itemDetail.BuyBtn)

	itemDetail.SellBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_SellBtn")

	itemDetail.SellBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if itemDetail.BuySellNum == 0 then
			return
		end

		local retItem, failItem

		local function refreshFunc()
			ExchangeCtrl.BuySellFinishRefresh(buySellNumMax - itemDetail.BuySellNum)
		end

		if currentType == ExchangeCtrl.TransactionType.Benita then
			if not isEnoughExpItem then
				local itemData = MS_ItemData.GetItemData(MS_ItemData.ItemID_ExpAddList[1])
				local st = SystemHelper.ConvertReplaceRichText(GameText.UI_EXCHANGE_LACK_OF_EXP_ITEM, "{(%a)}", "i", itemData.Name)

				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", st)

				return
			end

			if itemDetail.num + itemDetail.BuySellNum > itemDetail.numMax then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_EXCHANGE_NUM_REACH_MAX)

				return
			end

			local successNum = 0
			local talentChance = 0
			local herodata = FS_UserData.heroList:GetHero(10003)

			if herodata then
				talentChance = herodata:GetHeroTalentValue(MS_HeroTalent.Type.ItemBlessChance)
			end

			for i = 1, itemDetail.BuySellNum do
				local randomNum = MathHelper.getRandom(1, 1000, i)

				if randomNum < MS_ItemData.BlessProbability + talentChance + 1 then
					successNum = successNum + 1
				end
			end

			local blessTimes = FS_UserData.story:GetBlessTimes(itemDetail.itemId)
			local formulaGetId

			if blessTimes < MS_ItemData.BlessGetFormulaTimes then
				local success = false

				for i = 1, itemDetail.BuySellNum do
					local randomNum = MathHelper.getRandom(1, 100, i)

					if randomNum < 6 then
						success = true
					end
				end

				if success then
					if successNum > 0 then
						FS_UserData.story:SetBlessTimes(itemDetail.itemId, MS_ItemData.BlessGetFormulaTimes)
					end
				else
					FS_UserData.story:SetBlessTimes(itemDetail.itemId, blessTimes + successNum)
				end

				blessTimes = FS_UserData.story:GetBlessTimes(itemDetail.itemId)

				if blessTimes >= MS_ItemData.BlessGetFormulaTimes then
					local itemData = MS_ItemData.GetItemData(itemDetail.itemId)

					formulaGetId = itemData.Param1

					local formulaData = MS_ItemData.GetItemData(formulaGetId)

					if sceneController:GetGameController():IsQuestAllComplete(formulaData.CompleteQuestId) then
						formulaGetId = 0
					end
				end
			end

			sceneController:GetGameController():UseBagItem(itemDetail.itemId, itemDetail.BuySellNum)
			sceneController:GetGameController():UseBagItem(MS_ItemData.ItemID_ExpAddList[1], itemDetail.PriceNumText.num * itemDetail.BuySellNum)

			local failNum = itemDetail.BuySellNum - successNum

			if failNum > 0 and successNum <= 0 then
				failItem = sceneController:GetGameController():AddBagItem(itemDetail.itemId, failNum, true)

				if failItem then
					AudioCtrl.SetUIAudio("player_info/deal_sale")

					local iconList = {}

					if formulaGetId and formulaGetId > 0 then
						sceneController:GetGameController():AddBagItem(formulaGetId, 1, true)

						local itemData = MS_ItemData.GetItemData(formulaGetId)

						table.insert(iconList, itemData.Icon)
						UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_FAILED, GameText.UI_GAIN_ITEM_BLESS_FAILED, GameText.UI_GAIN_ITEM_GET .. itemData.Name .. " x 1", iconList, refreshFunc, this)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_FAILED, GameText.UI_GAIN_ITEM_BLESS_FAILED, GameText.UI_GAIN_ITEM_GET_FAILED, iconList, refreshFunc, this)
					end

					exchangeOrNot = ExchangeCtrl.DialogType.ExchangeSomething
				end
			end

			if successNum > 0 and failNum <= 0 then
				retItem = sceneController:GetGameController():AddBagItem(itemDetail.itemId + 1000, successNum, true)

				if retItem then
					AudioCtrl.SetUIAudio("player_info/deal_sale")

					local iconList = {}

					table.insert(iconList, retItem.itemIcon)

					if formulaGetId and formulaGetId > 0 then
						sceneController:GetGameController():AddBagItem(formulaGetId, 1, true)

						local itemData = MS_ItemData.GetItemData(formulaGetId)

						table.insert(iconList, itemData.Icon)
						UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_SUCCESS, "", retItem:GetItemName() .. " x " .. successNum .. " , " .. itemData.Name .. " x 1", iconList, refreshFunc, this)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_SUCCESS, "", retItem:GetItemName() .. " x " .. successNum, iconList, refreshFunc, this)
					end

					exchangeOrNot = ExchangeCtrl.DialogType.ExchangeSomething
				end
			end

			if failNum > 0 and successNum > 0 then
				failItem = sceneController:GetGameController():AddBagItem(itemDetail.itemId, failNum, true)
				retItem = sceneController:GetGameController():AddBagItem(itemDetail.itemId + 1000, successNum, true)

				if retItem and failItem then
					AudioCtrl.SetUIAudio("player_info/deal_sale")

					local iconList = {}

					table.insert(iconList, retItem.itemIcon)

					if formulaGetId and formulaGetId > 0 then
						sceneController:GetGameController():AddBagItem(formulaGetId, 1, true)

						local itemData = MS_ItemData.GetItemData(formulaGetId)

						table.insert(iconList, itemData.Icon)
						UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_SUCCESS, "", retItem:GetItemName() .. " x " .. successNum .. " , " .. itemData.Name .. " x 1", iconList, refreshFunc, this)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenGetItem", GameText.UI_GAIN_ITEM_SUCCESS, "", retItem:GetItemName() .. " x " .. successNum, iconList, refreshFunc, this)
					end

					exchangeOrNot = ExchangeCtrl.DialogType.ExchangeSomething
				end
			end

			sceneController:GetGameController():RecordAchievement(MS_Achievement.AchievementIdType.FirstTimeBless, 1)
		else
			if FS_UserData.itemList:GetItemNum(buyRequireExpItemType) + itemDetail.PriceNumText.num * itemDetail.BuySellNum > MS_ItemData.GetItemData(buyRequireExpItemType).NumMax then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_EXCHANGE_NUM_REACH_MAX)

				return
			end

			local itemData = MS_ItemData.GetItemData(itemDetail.itemId)

			if itemData.MainType == MS_ItemData.MainType.Trophy and itemDetail.trophy:GetIsLock() then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_PLAYERINFO_TROPHY_LOCKED)

				return
			end

			if itemData.MainType == MS_ItemData.MainType.Trophy then
				sceneController:GetGameController():SubTrophyItem(itemDetail.trophy)
			else
				sceneController:GetGameController():UseBagItem(itemDetail.itemId, itemDetail.BuySellNum)
			end

			retItem = sceneController:GetGameController():AddBagItem(buyRequireExpItemType, itemDetail.PriceNumText.num * itemDetail.BuySellNum, true)

			if retItem then
				AudioCtrl.SetUIAudio("player_info/deal_sale")
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_EXCHANGE_GAIN .. " " .. retItem:GetItemName() .. " x " .. itemDetail.PriceNumText.num * itemDetail.BuySellNum)

				exchangeOrNot = ExchangeCtrl.DialogType.ExchangeSomething

				refreshFunc()
			end
		end
	end)
	UILayerCtrl.AddButton("Transaction", "SellBtn", itemDetail.SellBtn)

	itemDetail.AddBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_BuyNumGroup_addBtn")

	function itemDetail.AddBtnFunc(obj, data)
		if currentTabType == ExchangeCtrl.TabType.Buy then
			if buySellNumMax ~= -1 and itemDetail.BuySellNum >= buySellNumMax or itemDetail.num + itemDetail.BuySellNum >= itemDetail.numMax then
				return
			end
		elseif currentTabType == ExchangeCtrl.TabType.Sell then
			if currentType ~= ExchangeCtrl.TransactionType.Benita and FS_UserData.itemList:GetItemNum(buyRequireExpItemType) + itemDetail.PriceNumText.num * (itemDetail.BuySellNum + 1) > MS_ItemData.GetItemData(buyRequireExpItemType).NumMax then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_EXCHANGE_NUM_REACH_MAX)

				return
			end

			if itemDetail.BuySellNum >= buySellNumMax then
				return
			end
		end

		itemDetail.BuySellNum = itemDetail.BuySellNum + 1

		itemDetail.BuySellNumText:SetContent(itemDetail.BuySellNum)
		itemDetail.RequireOrGainNumText:SetContent(itemDetail.PriceNumText.num * itemDetail.BuySellNum)
		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.ItemChoose)
		ExchangeCtrl.RefreshTotalNum()
		ExchangeCtrl.RefreshAddMinState()
	end

	itemDetail.AddBtn:SetLongPressCallBack(itemDetail.AddBtnFunc)
	UILayerCtrl.AddIndividual("Transaction", "AddBtn", itemDetail.AddBtn)

	itemDetail.MinBtn = this.mainComponent:GetButton("ExchangePanel_ExchangeBG_BuyNumGroup_minBtn")

	function itemDetail.MinBtnFunc(obj, data)
		if itemDetail.BuySellNum <= 1 then
			return
		end

		itemDetail.BuySellNum = itemDetail.BuySellNum - 1

		itemDetail.BuySellNumText:SetContent(itemDetail.BuySellNum)
		itemDetail.RequireOrGainNumText:SetContent(itemDetail.PriceNumText.num * itemDetail.BuySellNum)
		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.ItemChoose)
		ExchangeCtrl.RefreshTotalNum()
		ExchangeCtrl.RefreshAddMinState()
	end

	itemDetail.MinBtn:SetLongPressCallBack(itemDetail.MinBtnFunc)
	UILayerCtrl.AddIndividual("Transaction", "MinBtn", itemDetail.MinBtn)

	itemDetail.BuySellNumText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_BuyNumGroup_BuyNum")
	noBlessItemGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_InventoryScroll_noBlessItemText")
	itemDetail.BuySellNum = 0
	itemDetail.RequireOrGainText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_TotalPrice_perPrice")
	itemDetail.RequireOrGainNumText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_TotalPrice_itemPriceNum")
	itemDetail.RequireOrGainItemImg = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_TotalPrice_itemPriceNum_expItemImg")
	itemDetail.RequireOrGainItemImg = XImage:new(itemDetail.RequireOrGainItemImg)
	itemDetail.BagScroll = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_InventoryScroll")
	itemDetail.BagScroll = XScrollRect:new(itemDetail.BagScroll)
	itemDetail.NumText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemNumGroup_itemNum")
	itemDetail.NumMaxText = this.mainComponent:GetText("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemNumGroup_itemNum_itemNumMax")
	itemDetail.NumTextGroup = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemNumGroup")
	currentExpItemNumGroup = {}

	for i = 1, MS_ItemData.ExpItemMax do
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]] = this.mainComponent:GetText("ExchangePanel_ExchangeBG_ExpItemCurrentNumGroup_num" .. MS_ItemData.ItemID_ExpAddList[i])
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].iconGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ExpItemCurrentNumGroup_exp" .. i)
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].num = 0
	end

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]] = this.mainComponent:GetText("ExchangePanel_ExchangeBG_FogExpItemNumGroup_num" .. MS_ItemData.ItemID_ExpAddList[5])
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].iconGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_FogExpItemNumGroup_exp5")
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].num = 0
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]] = this.mainComponent:GetText("ExchangePanel_ExchangeBG_SpecialExpItemNumGroup_num" .. MS_ItemData.ItemID_ExpAddList[6])
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].iconGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_SpecialExpItemNumGroup_exp6")
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].num = 0
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]] = this.mainComponent:GetText("ExchangePanel_ExchangeBG_MazeItemNumGroup_num" .. MS_ItemData.ItemID_ExpAddList[7])
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].iconGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_MazeItemNumGroup_exp7")
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].num = 0
	currentFogExpItemNumGroupGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_FogExpItemNumGroup")
	currentSpecialExpItemNumGroupGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_SpecialExpItemNumGroup")
	currentExpItemNumGroupGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_ExpItemCurrentNumGroup")
	currentMazeItemNumGroupGO = this.mainComponent:GetGameObject("ExchangePanel_ExchangeBG_MazeItemNumGroup")
	itemLoader = this.mainComponent:GetLoader("ExchangePanel_ExchangeBG_InventoryScroll_ViewPort_Content")

	itemLoader:SetCacheNumMax(1, 60)
	itemLoader:SetReuseCom(true)

	itemLoader.loadCount = 20

	itemLoader:Load()
	this.gameObject:SetActive(false)

	this.loadFinish = true
end

function ExchangeCtrl.Open(backCB, storyMonsterId, type)
	if type == 0 then
		if backCB ~= nil then
			backCB()
		end

		return
	end

	canClick = false
	this.loadFinish = false
	targetStoryMonsterId = storyMonsterId
	backBtn.callback = backCB

	this.gameObject:SetActive(true)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(keyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(keyboardIconRT)

	currentType = type

	currentSpecialExpItemNumGroupGO:SetActive(false)
	currentExpItemNumGroupGO:SetActive(false)
	currentFogExpItemNumGroupGO:SetActive(false)
	currentMazeItemNumGroupGO:SetActive(false)

	if type == ExchangeCtrl.TransactionType.Viola then
		currentSpecialExpItemNumGroupGO:SetActive(true)
	elseif type == ExchangeCtrl.TransactionType.Norwood then
		currentFogExpItemNumGroupGO:SetActive(true)
	elseif type == ExchangeCtrl.TransactionType.Maze then
		currentMazeItemNumGroupGO:SetActive(true)
	else
		currentExpItemNumGroupGO:SetActive(true)
	end

	UILayerCtrl.Push("Transaction")
	ExchangeCtrl.RefreshExpItemNum()
	normalTitleBG:SetActive(true)
	benitaTitleBG:SetActive(false)
	sellBtnTextGO:SetActive(true)
	blessBtnTextGO:SetActive(false)

	isInConfirmState = false

	buyTabBtn.gameObject:SetActive(false)
	sellTabBtn.gameObject:SetActive(false)

	exchangeOrNot = ExchangeCtrl.DialogType.ExchangeNothing

	itemLoader:RecycleAll()

	if type == ExchangeCtrl.TransactionType.Normal then
		currentTabType = ExchangeCtrl.TabType.Buy

		buyTabBtn.gameObject:SetActive(true)
		sellTabBtn.gameObject:SetActive(true)
		ExchangeCtrl.LoadBuyItem()
		buyTabBtn:OnDown(nil, nil)
		buyTabBtn:OnClick(nil, nil)
	elseif type == ExchangeCtrl.TransactionType.Viola then
		currentTabType = ExchangeCtrl.TabType.Buy

		buyTabBtn.gameObject:SetActive(true)
		sellTabBtn.gameObject:SetActive(true)
		ExchangeCtrl.LoadBuyItem()
		buyTabBtn:OnDown(nil, nil)
		buyTabBtn:OnClick(nil, nil)
	elseif type == ExchangeCtrl.TransactionType.Secret then
		currentTabType = ExchangeCtrl.TabType.Buy

		ExchangeCtrl.LoadBuyItem()
		buyTabBtn:OnDown(nil, nil)
		buyTabBtn:OnClick(nil, nil)
	elseif type == ExchangeCtrl.TransactionType.Norwood then
		currentTabType = ExchangeCtrl.TabType.Buy

		buyTabBtn.gameObject:SetActive(true)
		sellTabBtn.gameObject:SetActive(true)
		ExchangeCtrl.LoadBuyItem()
		buyTabBtn:OnDown(nil, nil)
		buyTabBtn:OnClick(nil, nil)
	elseif type == ExchangeCtrl.TransactionType.Maze then
		currentTabType = ExchangeCtrl.TabType.Buy

		buyTabBtn.gameObject:SetActive(true)
		sellTabBtn.gameObject:SetActive(true)
		ExchangeCtrl.LoadBuyItem()
		buyTabBtn:OnDown(nil, nil)
		buyTabBtn:OnClick(nil, nil)
	elseif type == ExchangeCtrl.TransactionType.Benita then
		currentTabType = ExchangeCtrl.TabType.Sell

		normalTitleBG:SetActive(false)
		benitaTitleBG:SetActive(true)
		sellBtnTextGO:SetActive(false)
		blessBtnTextGO:SetActive(true)
		ExchangeCtrl.LoadBlessItem()
		sellTabBtn:OnDown(nil, nil)
		sellTabBtn:OnClick(nil, nil)
	end

	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
end

function ExchangeCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function ExchangeCtrl.SetTrophyLockBtn(isLock)
	if isLock then
		itemDetail.LockOnBtn.gameObject:SetActive(true)
		itemDetail.LockOffBtn.gameObject:SetActive(false)
		itemDetail.BottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKOFF)
		itemDetail.KeyboardBottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKOFF)
	else
		itemDetail.LockOnBtn.gameObject:SetActive(false)
		itemDetail.LockOffBtn.gameObject:SetActive(true)
		itemDetail.BottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKON)
		itemDetail.KeyboardBottomLockBtnText:SetContent(GameText.UI_PLAYERINFO_TROPHY_LOCKON)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(gamePadIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(keyboardIconRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(keyboardIconRT)
end

function ExchangeCtrl.LoadSellItem(LastIndex)
	itemDetail.LockYGroup:SetActive(false)
	itemDetail.KeyboardLockYGroup:SetActive(false)
	noBlessItemGO:SetActive(false)

	local OriItemList = FS_UserData.itemList:GetItemList()
	local itemList = {}

	if currentType == ExchangeCtrl.TransactionType.Viola or currentType == ExchangeCtrl.TransactionType.Norwood then
		local OriTrophyList = FS_UserData.itemList:GetTrophyList()

		for k, v in pairs(OriTrophyList) do
			if v:GetItemData().Price > -1 and v:GetItemData().RandomProperty == 0 then
				table.insert(itemList, v)
			end
		end
	elseif currentType == ExchangeCtrl.TransactionType.Maze then
		local OriTrophyList = FS_UserData.itemList:GetTrophyList()

		for k, v in pairs(OriTrophyList) do
			if v:GetItemData().Price > -1 and v:GetItemData().RandomProperty == 1 then
				table.insert(itemList, v)
			end
		end
	else
		for k, v in pairs(OriItemList) do
			if (v:GetMainType() == MS_ItemData.MainType.Material or v:GetMainType() == MS_ItemData.MainType.Exp) and v:GetType() ~= MS_ItemData.Type.Formula and v:GetType() ~= MS_ItemData.Type.TrophyBox and v:GetType() ~= MS_ItemData.Type.Document and v:GetNum() > 0 and v:GetItemData().Price > -1 then
				table.insert(itemList, v)
			end
		end

		table.sort(itemList, function(a, b)
			return tonumber(a.itemId) < tonumber(b.itemId)
		end)
	end

	if LastIndex and LastIndex > 1 then
		itemDetail.currentLoaderIndex = LastIndex - 1
	else
		itemDetail.currentLoaderIndex = 1
	end

	itemDetail.currentLoaderIndex = 1
	itemLoader.loadCount = #itemList

	function itemLoader.loadCallback(index, com, data)
		local img = com:GetGameObject("itemImage")
		local itemText = com:GetText("itemName")
		local numText = com:GetText("itemNum")

		img = XImage:new(img)

		local _btn = com:GetButton("BG")

		_btn:SetParentScroll(itemDetail.BagScroll)
		_btn:SetSelectedLight(false)

		local sprite = XObjectPool.GetIcon("item" .. itemList[index].itemIcon)

		img:SetSprite(sprite)

		local _itemData = itemList[index]:GetItemData()

		if _itemData.MainType == MS_ItemData.MainType.Trophy then
			itemText:SetContent(itemList[index]:GetTrophyName())
		else
			itemText:SetContent(itemList[index]:GetItemName())
		end

		numText:SetContent(itemList[index]:GetNum())

		if LastIndex and LastIndex == index then
			itemDetail.currentLoaderIndex = index
		end

		local newLight = com:GetGameObject("newLight")

		newLight:SetActive(false)
		_btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		_btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local sprite = XObjectPool.GetIcon("item" .. itemList[index].itemIcon)

			itemList[index]:SetOld()
			newLight:SetActive(false)

			itemDetail.itemId = itemList[index]:GetItemId()
			itemDetail.lastIndex = index

			itemDetail.Img:SetSprite(sprite)
			itemDetail.Des:SetContent(itemList[index]:GetItemData().Description)

			buySellNumMax = itemList[index]:GetNum()

			if _itemData.MainType == MS_ItemData.MainType.Trophy then
				itemDetail.Name:SetContent(itemList[index]:GetTrophyName())
				itemDetail.BounsText:SetContent(ExchangeCtrl.GetTrophyDescription(itemList[index]))
				itemDetail.BounsText.gameObject:SetActive(true)
			else
				itemDetail.Name:SetContent(itemList[index]:GetItemName())
				itemDetail.BounsText:SetContent("")
				itemDetail.BounsText.gameObject:SetActive(false)
			end

			itemDetail.lineOffset:SetActive(itemDetail.BounsText.gameObject.activeSelf and itemDetail.Des.gameObject.activeSelf)

			itemDetail.targetItemNumText = numText

			itemDetail.leftPanel:SetActive(true)
			itemDetail.blessLevelText.gameObject:SetActive(false)
			itemDetail.ItemPriceGroup:SetActive(true)

			if _itemData.MainType == MS_ItemData.MainType.Trophy then
				itemDetail.LockGroup:SetActive(true)
				itemDetail.LockYGroup:SetActive(true)
				itemDetail.KeyboardLockYGroup:SetActive(true)

				itemDetail.trophy = itemList[index]

				ExchangeCtrl.SetTrophyLockBtn(itemDetail.trophy:GetIsLock())

				itemDetail.num = 1
				itemDetail.numMax = 1

				itemDetail.NumTextGroup:SetActive(false)
				itemDetail.blessLevelText.gameObject:SetActive(true)
				itemDetail.blessLevelText:SetContent(GameText["UI_ITEMTYPE_" .. _itemData.Type])
			else
				itemDetail.LockGroup:SetActive(false)
				itemDetail.LockYGroup:SetActive(false)
				itemDetail.KeyboardLockYGroup:SetActive(false)
				itemDetail.blessLevelText.gameObject:SetActive(false)
				itemDetail.NumTextGroup:SetActive(true)

				itemDetail.num = itemList[index]:GetNum()

				itemDetail.NumText:SetContent(itemDetail.num)

				itemDetail.numMax = itemList[index]:GetNumMax()

				itemDetail.NumMaxText:SetContent("/" .. _itemData.NumMax)
			end

			UILayerCtrl.OnSelect("item" .. index)

			isInConfirmState = false
			lastItemBtnName = "item" .. index

			local sprite2

			if currentType == ExchangeCtrl.TransactionType.Maze then
				sprite2 = XObjectPool.GetIcon("item" .. MS_ItemData.ItemID_ExpAddList[7])
			else
				sprite2 = XObjectPool.GetIcon("item" .. MS_ItemData.ItemID_ExpAddList[1])
			end

			itemDetail.PriceImg:SetSprite(sprite2)
			itemDetail.RequireOrGainItemImg:SetSprite(sprite2)

			if currentType == ExchangeCtrl.TransactionType.Maze then
				buyRequireExpItemType = MS_ItemData.ItemID_ExpAddList[7]
			else
				buyRequireExpItemType = MS_ItemData.ItemID_ExpAddList[1]
			end

			itemDetail.BuySellNum = 1

			itemDetail.BuySellNumText:SetContent(itemDetail.BuySellNum)
			ExchangeCtrl.RefreshAddMinState()

			if _itemData.MainType == MS_ItemData.MainType.Trophy then
				itemDetail.PriceNumText.num = Mathf.Ceil(itemList[index]:GetItemData().Price * (1 + (itemList[index]:GetLevel() - 1) * 0.1))
			else
				itemDetail.PriceNumText.num = itemList[index]:GetItemData().Price
			end

			itemDetail.PriceNumText:SetContent(itemDetail.PriceNumText.num)
			itemDetail.RequireOrGainNumText:SetContent(itemDetail.PriceNumText.num * itemDetail.BuySellNum)
			ExchangeCtrl.RefreshTotalNum()
			itemDetail.BuyBtn.gameObject:SetActive(false)
			itemDetail.SellBtn.gameObject:SetActive(true)
			itemDetail.RequireOrGainText:SetContent(GameText.UI_EXCHANGE_GAIN)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.contentGroupRT)
			itemDetail.triangleGroup:SetActive(itemDetail.GetPreferredHeightFunc() > itemDetail.contentHeight + 0.3)

			itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

			_btn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.ItemInfoGroup:GetComponent("RectTransform"))
		end)
		UILayerCtrl.AddButton("Transaction", "item" .. index, _btn)

		if index == 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. itemLoader.loadCount)
		end

		if index > 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. index - 1)
		end

		if index < itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item" .. index + 1)
		end

		if index == itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item1")

			itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)

			UILayerCtrl.OnSelect("item" .. itemDetail.currentLoaderIndex)

			if itemDetail.currentLoaderIndex > 6 then
				local offset = itemDetail.currentLoaderIndex - 6

				itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - offset / (itemLoader.loadCount - InventoryItemRow))
			end

			UILayerCtrl.OnCursorClickMute()

			canClick = true
			this.loadFinish = true
		end
	end

	if itemLoader.loadCount < 1 then
		itemDetail.leftPanel:SetActive(false)
		itemDetail.BuyBtn.gameObject:SetActive(false)
		itemDetail.SellBtn.gameObject:SetActive(false)
		UILayerCtrl.OnSelect("empty")

		canClick = true
		this.loadFinish = true
		itemDetail.itemId = 0
	end

	itemLoader:Load()
end

function ExchangeCtrl.LoadBlessItem(LastItemId)
	noBlessItemGO:SetActive(false)

	local gameController = sceneController:GetGameController()
	local OriItemList = FS_UserData.itemList:GetItemList()
	local itemList = {}

	for k, v in pairs(OriItemList) do
		if v:GetMainType() == MS_ItemData.MainType.Consume and v:GetCanBless() and v:GetNum() > 0 then
			table.insert(itemList, v)
		end
	end

	table.sort(itemList, function(a, b)
		return tonumber(a.itemId) < tonumber(b.itemId)
	end)

	itemDetail.currentLoaderIndex = 1
	itemLoader.loadCount = #itemList

	function itemLoader.loadCallback(index, com, data)
		local img = com:GetGameObject("itemImage")
		local itemText = com:GetText("itemName")
		local numText = com:GetText("itemNum")

		img = XImage:new(img)

		local _btn = com:GetButton("BG")

		_btn:SetParentScroll(itemDetail.BagScroll)
		_btn:SetSelectedLight(false)

		local sprite = XObjectPool.GetIcon("item" .. itemList[index].itemIcon)

		img:SetSprite(sprite)
		itemText:SetContent(itemList[index]:GetItemName())
		numText:SetContent(itemList[index]:GetNum())

		if LastItemId and itemList[index]:GetItemId() == LastItemId then
			itemDetail.currentLoaderIndex = index
		end

		local newLight = com:GetGameObject("newLight")

		newLight:SetActive(itemList[index]:IsNew())
		_btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		_btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			itemList[index]:SetOld()
			newLight:SetActive(false)

			itemDetail.itemId = itemList[index]:GetItemId()

			itemDetail.LockGroup:SetActive(false)
			itemDetail.LockYGroup:SetActive(false)
			itemDetail.KeyboardLockYGroup:SetActive(false)
			itemDetail.BounsText:SetContent("")
			itemDetail.BounsText.gameObject:SetActive(false)
			itemDetail.lineOffset:SetActive(itemDetail.BounsText.gameObject.activeSelf and itemDetail.Des.gameObject.activeSelf)

			itemDetail.targetItemNumText = numText

			itemDetail.leftPanel:SetActive(true)
			itemDetail.blessLevelText.gameObject:SetActive(false)
			itemDetail.ItemPriceGroup:SetActive(true)
			itemDetail.NumTextGroup:SetActive(true)

			itemDetail.num = FS_UserData.itemList:GetItemNum(itemDetail.itemId + 1000)

			itemDetail.NumText:SetContent(itemDetail.num)

			local idata = MS_ItemData.GetItemData(itemDetail.itemId + 1000)

			itemDetail.Des:SetContent(idata.Description)
			itemDetail.Name:SetContent(idata.Name)

			local sprite = XObjectPool.GetIcon("item" .. idata.Icon)

			itemDetail.Img:SetSprite(sprite)

			itemDetail.numMax = idata.NumMax

			itemDetail.NumMaxText:SetContent("/" .. itemDetail.numMax)

			if itemList[index]:GetNum() < itemDetail.numMax - itemDetail.num then
				buySellNumMax = itemList[index]:GetNum()
			else
				buySellNumMax = itemDetail.numMax - itemDetail.num
			end

			if lastItemBtn ~= nil and not IsNil(lastItemBtn.gameObject) then
				lastItemBtn:SetSelectedLight(false)
			end

			UILayerCtrl.OnSelect("item" .. index)

			isInConfirmState = false
			lastItemBtnName = "item" .. index

			local sprite2 = XObjectPool.GetIcon("item" .. MS_ItemData.ItemID_ExpAddList[1])

			itemDetail.PriceImg:SetSprite(sprite2)
			itemDetail.RequireOrGainItemImg:SetSprite(sprite2)

			buyRequireExpItemType = MS_ItemData.ItemID_ExpAddList[1]
			itemDetail.BuySellNum = 1

			itemDetail.BuySellNumText:SetContent(itemDetail.BuySellNum)
			ExchangeCtrl.RefreshAddMinState()

			itemDetail.PriceNumText.num = itemList[index]:GetItemData().BlessPrice

			itemDetail.PriceNumText:SetContent(itemList[index]:GetItemData().BlessPrice)
			itemDetail.RequireOrGainNumText:SetContent(itemDetail.PriceNumText.num * itemDetail.BuySellNum)
			ExchangeCtrl.RefreshTotalNum()
			itemDetail.BuyBtn.gameObject:SetActive(false)
			itemDetail.SellBtn.gameObject:SetActive(true)
			itemDetail.RequireOrGainText:SetContent(GameText.UI_EXCHANGE_REQUIRE)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.contentGroupRT)
			itemDetail.triangleGroup:SetActive(itemDetail.GetPreferredHeightFunc() > itemDetail.contentHeight + 0.3)

			itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

			_btn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.ItemInfoGroup:GetComponent("RectTransform"))
		end)
		UILayerCtrl.AddButton("Transaction", "item" .. index, _btn)

		if index == 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. itemLoader.loadCount)
		end

		if index > 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. index - 1)
		end

		if index < itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item" .. index + 1)
		end

		if index == itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item1")

			itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)

			UILayerCtrl.OnSelect("item" .. itemDetail.currentLoaderIndex)

			if itemDetail.currentLoaderIndex > 6 then
				local offset = itemDetail.currentLoaderIndex - 6

				itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - offset / (itemLoader.loadCount - InventoryItemRow))
			end

			UILayerCtrl.OnCursorClickMute()
			gameController:OpenSpecialTutorial(MS_StoryTutorial.FirstTimeBless)

			canClick = true
			this.loadFinish = true
		end
	end

	if itemLoader.loadCount < 1 then
		noBlessItemGO:SetActive(true)
		itemDetail.leftPanel:SetActive(false)
		itemDetail.BuyBtn.gameObject:SetActive(false)
		itemDetail.SellBtn.gameObject:SetActive(false)
		gameController:OpenSpecialTutorial(MS_StoryTutorial.FirstTimeBless)
		UILayerCtrl.OnSelect("empty")

		canClick = true
		this.loadFinish = true
		itemDetail.itemId = 0
	end

	itemLoader:Load()
end

function ExchangeCtrl.LoadBuyItem(LastItemId)
	itemDetail.LockYGroup:SetActive(false)
	itemDetail.KeyboardLockYGroup:SetActive(false)
	noBlessItemGO:SetActive(false)

	local itemList = ExchangeCtrl.GetOnSellItemVirtualList()
	local gameController = sceneController:GetGameController()

	itemDetail.currentLoaderIndex = 1
	itemLoader.loadCount = #itemList

	function itemLoader.loadCallback(index, com, data)
		local img = com:GetGameObject("itemImage")
		local itemText = com:GetText("itemName")
		local numText = com:GetText("itemNum")
		local newLight = com:GetGameObject("newLight")

		newLight:SetActive(false)

		img = XImage:new(img)

		local _btn = com:GetButton("BG")

		_btn:SetParentScroll(itemDetail.BagScroll)
		_btn:SetSelectedLight(false)

		local _itemData = MS_ItemData.GetItemData(itemList[index].ItemId)
		local sprite

		if currentType == ExchangeCtrl.TransactionType.Viola or currentType == ExchangeCtrl.TransactionType.Norwood then
			sprite = XObjectPool.GetIcon("item" .. _itemData.Icon)
		elseif _itemData.MainType == MS_ItemData.MainType.Trophy then
			if _itemData.Type == MS_ItemData.Type.TrophyScars then
				sprite = XObjectPool.GetIcon("item" .. MS_ItemData.TrophyItemTypeIconList[1])
			elseif _itemData.Type == MS_ItemData.Type.TrophyResistance then
				sprite = XObjectPool.GetIcon("item" .. MS_ItemData.TrophyItemTypeIconList[2])
			elseif _itemData.Type == MS_ItemData.Type.TrophyNightmare then
				sprite = XObjectPool.GetIcon("item" .. MS_ItemData.TrophyItemTypeIconList[3])
			end
		else
			sprite = XObjectPool.GetIcon("item" .. _itemData.Icon)
		end

		img:SetSprite(sprite)

		if _itemData.MainType == MS_ItemData.MainType.Trophy then
			if _itemData.Level > 1 then
				itemText:SetContent(_itemData.Name .. "+" .. _itemData.Level - 1)
			else
				itemText:SetContent(_itemData.Name)
			end
		else
			itemText:SetContent(_itemData.Name)
		end

		if itemList[index].Num == -1 then
			numText:SetContent("")
		else
			numText:SetContent(itemList[index].Num)
		end

		if LastItemId and itemList[index].ItemId == LastItemId then
			itemDetail.currentLoaderIndex = index
		end

		_btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		_btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local sprite

			if _itemData.MainType == MS_ItemData.MainType.Trophy then
				if currentType == ExchangeCtrl.TransactionType.Viola or currentType == ExchangeCtrl.TransactionType.Norwood then
					sprite = XObjectPool.GetIcon("item" .. _itemData.Icon)
				elseif _itemData.Type == MS_ItemData.Type.TrophyScars then
					sprite = XObjectPool.GetIcon("item" .. MS_ItemData.TrophyItemTypeIconList[1])
				elseif _itemData.Type == MS_ItemData.Type.TrophyResistance then
					sprite = XObjectPool.GetIcon("item" .. MS_ItemData.TrophyItemTypeIconList[2])
				elseif _itemData.Type == MS_ItemData.Type.TrophyNightmare then
					sprite = XObjectPool.GetIcon("item" .. MS_ItemData.TrophyItemTypeIconList[3])
				end

				itemDetail.BounsText:SetContent(MS_ItemData.GetTrophyRawBounsText(itemList[index].ItemId))
				itemDetail.BounsText.gameObject:SetActive(true)
			else
				sprite = XObjectPool.GetIcon("item" .. _itemData.Icon)

				itemDetail.BounsText:SetContent("")
				itemDetail.BounsText.gameObject:SetActive(false)
			end

			itemDetail.transactionId = itemList[index].TransactionId
			itemDetail.itemId = itemList[index].ItemId

			itemDetail.Img:SetSprite(sprite)
			itemDetail.Des:SetContent(_itemData.Description)
			itemDetail.LockGroup:SetActive(false)
			itemDetail.LockYGroup:SetActive(false)
			itemDetail.KeyboardLockYGroup:SetActive(false)

			if _itemData.MainType == MS_ItemData.MainType.Trophy then
				if _itemData.Level > 1 then
					itemDetail.Name:SetContent(_itemData.Name .. "+" .. _itemData.Level - 1)
				else
					itemDetail.Name:SetContent(_itemData.Name)
				end
			else
				itemDetail.Name:SetContent(_itemData.Name)
			end

			buySellNumMax = ExchangeCtrl.GetBuyItemRemainNum(itemList[index].TransactionId)

			itemDetail.lineOffset:SetActive(itemDetail.BounsText.gameObject.activeSelf and itemDetail.Des.gameObject.activeSelf)

			itemDetail.targetItemNumText = numText

			itemDetail.leftPanel:SetActive(true)
			itemDetail.blessLevelText.gameObject:SetActive(false)
			itemDetail.ItemPriceGroup:SetActive(true)

			if _itemData.MainType == MS_ItemData.MainType.Trophy then
				itemDetail.num = 0
				itemDetail.numMax = 1

				itemDetail.NumTextGroup:SetActive(false)
				itemDetail.blessLevelText.gameObject:SetActive(true)
				itemDetail.blessLevelText:SetContent(GameText["UI_ITEMTYPE_" .. _itemData.Type])
			else
				itemDetail.blessLevelText.gameObject:SetActive(false)
				itemDetail.NumTextGroup:SetActive(true)

				itemDetail.num = FS_UserData.itemList:GetItemNum(itemList[index].ItemId)

				itemDetail.NumText:SetContent(itemDetail.num)

				itemDetail.numMax = _itemData.NumMax

				itemDetail.NumMaxText:SetContent("/" .. _itemData.NumMax)
			end

			if lastItemBtn ~= nil and not IsNil(lastItemBtn.gameObject) then
				lastItemBtn:SetSelectedLight(false)
			end

			UILayerCtrl.OnSelect("item" .. index)

			isInConfirmState = false
			lastItemBtnName = "item" .. index

			local sprite2 = XObjectPool.GetIcon("item" .. itemList[index].PriceType)

			itemDetail.PriceImg:SetSprite(sprite2)
			itemDetail.RequireOrGainItemImg:SetSprite(sprite2)

			buyRequireExpItemType = itemList[index].PriceType
			itemDetail.BuySellNum = 1

			itemDetail.BuySellNumText:SetContent(itemDetail.BuySellNum)
			ExchangeCtrl.RefreshAddMinState()

			itemDetail.PriceNumText.num = itemList[index].Price

			itemDetail.PriceNumText:SetContent(itemList[index].Price)
			itemDetail.RequireOrGainNumText:SetContent(itemDetail.PriceNumText.num * itemDetail.BuySellNum)
			ExchangeCtrl.RefreshTotalNum()
			itemDetail.BuyBtn.gameObject:SetActive(true)
			itemDetail.SellBtn.gameObject:SetActive(false)
			itemDetail.RequireOrGainText:SetContent(GameText.UI_EXCHANGE_REQUIRE)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.contentGroupRT)
			itemDetail.triangleGroup:SetActive(itemDetail.GetPreferredHeightFunc() > itemDetail.contentHeight + 0.3)

			itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, 1)

			_btn:SetSelectedLight(true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(itemDetail.ItemInfoGroup:GetComponent("RectTransform"))
		end)
		UILayerCtrl.AddButton("Transaction", "item" .. index, _btn)

		if index == 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. itemLoader.loadCount)
		end

		if index > 1 then
			_btn:SetAdjacent(XButton.Adjacent.UP, "item" .. index - 1)
		end

		if index < itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item" .. index + 1)
		end

		if index == itemLoader.loadCount then
			_btn:SetAdjacent(XButton.Adjacent.DOWN, "item1")

			itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)

			UILayerCtrl.OnSelect("item" .. itemDetail.currentLoaderIndex)

			if itemDetail.currentLoaderIndex > 6 then
				local offset = itemDetail.currentLoaderIndex - 6

				itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - offset / (itemLoader.loadCount - InventoryItemRow))
			end

			UILayerCtrl.OnCursorClickMute()

			if currentType == ExchangeCtrl.TransactionType.Viola then
				gameController:OpenSpecialTutorial(MS_StoryTutorial.FirstTimeViola)
			elseif currentType == ExchangeCtrl.TransactionType.Norwood then
				gameController:OpenSpecialTutorial(MS_StoryTutorial.FirstTimeNorwood)
			end

			canClick = true
			this.loadFinish = true
		end
	end

	if itemLoader.loadCount < 1 then
		itemDetail.leftPanel:SetActive(false)
		itemDetail.BuyBtn.gameObject:SetActive(false)
		itemDetail.SellBtn.gameObject:SetActive(false)
		UILayerCtrl.OnSelect("empty")

		itemDetail.itemId = 0
		canClick = true
		this.loadFinish = true
	end

	itemLoader:Load()
end

function ExchangeCtrl.GetTrophyDescription(item)
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

function ExchangeCtrl.RefreshAddMinState()
	if itemDetail.BuySellNum < 2 then
		itemDetail.MinBtn:SetDisabled(true)
	else
		itemDetail.MinBtn:SetNormal()
	end

	if currentTabType == ExchangeCtrl.TabType.Buy then
		if (buySellNumMax == -1 or itemDetail.BuySellNum < buySellNumMax) and itemDetail.num + itemDetail.BuySellNum < itemDetail.numMax then
			itemDetail.AddBtn:SetNormal()
		else
			itemDetail.AddBtn:SetDisabled(true)
		end
	elseif buySellNumMax == -1 or itemDetail.BuySellNum < buySellNumMax then
		itemDetail.AddBtn:SetNormal()
	else
		itemDetail.AddBtn:SetDisabled(true)
	end
end

function ExchangeCtrl.BuySellFinishRefresh(remainNum)
	ExchangeCtrl.RefreshExpItemNum(true)

	canClick = false

	if currentTabType == ExchangeCtrl.TabType.Buy then
		ExchangeCtrl.LoadBuyItem(itemDetail.itemId)
	elseif currentType == ExchangeCtrl.TransactionType.Benita then
		ExchangeCtrl.LoadBlessItem(itemDetail.itemId)
	else
		ExchangeCtrl.LoadSellItem(itemDetail.lastIndex)
	end

	isInConfirmState = false
end

function ExchangeCtrl.RefreshExpItemNum(hasAnimator)
	local gameController = sceneController:GetGameController()

	for i = 1, MS_ItemData.ExpItemMax do
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or gameController:CheckShowQuestComplete(MS_ItemData.ExpItemQuestIdList[i]) == true then
			currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].iconGO:SetActive(true)
			currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].gameObject:SetActive(true)

			currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].num = FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[i])

			if hasAnimator then
				currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]]:SetContentAnim(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].num)
			else
				currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]]:SetContent(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].num)
			end
		else
			currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].iconGO:SetActive(false)
			currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]].gameObject:SetActive(false)
			currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[i]]:SetContent(0)
		end
	end

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].iconGO:SetActive(true)
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].gameObject:SetActive(true)

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].num = FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[5])

	if hasAnimator then
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]]:SetContentAnim(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].num)
	else
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]]:SetContent(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[5]].num)
	end

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].iconGO:SetActive(true)
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].gameObject:SetActive(true)

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].num = FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[6])

	if hasAnimator then
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]]:SetContentAnim(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].num)
	else
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]]:SetContent(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[6]].num)
	end

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].iconGO:SetActive(true)
	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].gameObject:SetActive(true)

	currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].num = FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[7])

	if hasAnimator then
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]]:SetContentAnim(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].num)
	else
		currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]]:SetContent(currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[7]].num)
	end
end

function ExchangeCtrl.RefreshTotalNum()
	if currentTabType == ExchangeCtrl.TabType.Buy then
		if itemDetail.PriceNumText.num * itemDetail.BuySellNum > currentExpItemNumGroup[buyRequireExpItemType].num then
			isEnoughExpItem = false

			itemDetail.RequireOrGainNumText:SetColor(1, 0, 0, 1)
		else
			isEnoughExpItem = true

			itemDetail.RequireOrGainNumText:SetColor(1, 1, 1, 1)
		end
	elseif currentType == ExchangeCtrl.TransactionType.Benita then
		if itemDetail.PriceNumText.num * itemDetail.BuySellNum > currentExpItemNumGroup[MS_ItemData.ItemID_ExpAddList[1]].num then
			isEnoughExpItem = false

			itemDetail.RequireOrGainNumText:SetColor(1, 0, 0, 1)
		else
			isEnoughExpItem = true

			itemDetail.RequireOrGainNumText:SetColor(1, 1, 1, 1)
		end
	else
		itemDetail.RequireOrGainNumText:SetColor(1, 1, 1, 1)
	end
end

function ExchangeCtrl.GetOnSellItemVirtualList()
	local virtualList = {}
	local tList = MS_TransactionData.GetTransactionList()
	local gameController = sceneController:GetGameController()

	for k, v in pairs(tList) do
		if (BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false or gameController:CheckShowQuestComplete(v.ShowQuestId) == true and gameController:CheckHideQuestComplete(v.HideQuestId) == false) and ExchangeCtrl.IsMonsterPermit(v.MonsterId) and ExchangeCtrl.CheckDLCSwitch(v.DLCSwitch) and v.ItemId > 0 then
			local virItem = {}

			virItem.ItemId = v.ItemId
			virItem.TransactionId = v.TransactionId
			virItem.PriceType = v.PriceType
			virItem.Price = v.Price
			virItem.Num = v.Num

			if v.Num ~= -1 and FS_UserData.story:GetTransactionNum(k) ~= nil then
				virItem.Num = FS_UserData.story:GetTransactionNum(k)
			end

			if virItem.Num > 0 or virItem.Num == -1 then
				table.insert(virtualList, virItem)
			end
		end
	end

	table.sort(virtualList, function(a, b)
		return tonumber(a.TransactionId) < tonumber(b.TransactionId)
	end)

	return virtualList
end

function ExchangeCtrl.CheckDLCSwitch(dlcSwitch)
	if dlcSwitch == ExchangeCtrl.DLCSwitchType.Normal then
		return true
	elseif dlcSwitch == ExchangeCtrl.DLCSwitchType.DarkMaze then
		if IapData.GetEnterMaze() then
			return true
		else
			return false
		end
	end

	return false
end

function ExchangeCtrl.IsMonsterPermit(monsterId)
	if monsterId ~= "" then
		local monsterIdList = StringHelper.Split(monsterId, ";")

		for i, mId in pairs(monsterIdList) do
			if tonumber(mId) == targetStoryMonsterId then
				return true
			end
		end
	else
		return false
	end

	return false
end

function ExchangeCtrl.GetBuyItemRemainNum(_transactionId)
	local num = 0
	local tList = MS_TransactionData.GetTransactionList()

	if tList[_transactionId] ~= nil then
		num = tList[_transactionId].Num
	end

	if num == -1 then
		-- block empty
	elseif FS_UserData.story:GetTransactionNum(_transactionId) ~= nil then
		num = FS_UserData.story:GetTransactionNum(_transactionId)
	end

	return num
end

function ExchangeCtrl.GetRandomTrophyId(dropId)
	local itemDropData = MS_StoryItemDrop.GetStoryItemDropData(FS_UserData.story:GetStoryId(), dropId)
	local probAll = 0

	for k, v in pairs(itemDropData) do
		probAll = probAll + v.Prob
	end

	local rnd = MathHelper.getRandomWithSeed(1, probAll, FS_UserData.story:GetRandomSeed())

	probAll = 0

	for k, v in pairs(itemDropData) do
		probAll = probAll + v.Prob

		if rnd <= probAll then
			return v.ItemId
		end
	end

	return 0
end

function ExchangeCtrl.GPadPress(pos)
	if pos == XButton.Adjacent.RIGHT or pos == XButton.Adjacent.LEFT then
		if GholdInput == 0 then
			if pos == XButton.Adjacent.RIGHT then
				itemDetail.AddBtnFunc()
			elseif pos == XButton.Adjacent.LEFT then
				itemDetail.MinBtnFunc()
			end
		end

		if GholdInput ~= pos or GholdTime == 0 then
			GholdTime = TimeHelper.getNowTimeNoScale()
		end

		GholdInput = pos
		GholdDeltaTime = TimeHelper.getNowTimeNoScale() - GholdTime

		if GholdDeltaTime > 0.5 then
			if pos == XButton.Adjacent.RIGHT then
				itemDetail.AddBtnFunc()
			elseif pos == XButton.Adjacent.LEFT then
				itemDetail.MinBtnFunc()
			end

			GholdTime = GholdTime + 0.15
		end
	elseif not isInConfirmState then
		if GholdInput2 == 0 then
			local tname = UILayerCtrl.GetCurrentButtonName()

			UILayerCtrl.Select(pos)
			UILayerCtrl.OnCursorClick()

			GholdInput2 = pos

			if itemLoader.loadCount < InventoryItemRow + 1 then
				return
			end

			local row = tonumber(string.sub(tname, 5))
			local toprow = 1 + Mathf.Floor((1 - itemDetail.BagScroll.scrollRectCom.normalizedPosition.y) / (1 / (itemLoader.loadCount - InventoryItemRow)) + 0.5)
			local botrow = toprow + InventoryItemRow - 1

			if pos == XButton.Adjacent.DOWN and botrow <= row then
				if tname == "item" .. itemLoader.loadCount then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			elseif pos == XButton.Adjacent.UP and row <= toprow then
				if tname == "item1" then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 0)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y + 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			end
		end

		if GholdInput2 ~= pos or GholdTime2 == 0 then
			GholdTime2 = TimeHelper.getNowTimeNoScale()
		end

		GholdInput2 = pos
		GholdDeltaTime2 = TimeHelper.getNowTimeNoScale() - GholdTime2

		if GholdDeltaTime2 > 0.5 then
			local tname = UILayerCtrl.GetCurrentButtonName()

			UILayerCtrl.Select(pos)
			UILayerCtrl.OnCursorClick()

			GholdTime2 = GholdTime2 + 0.15

			if itemLoader.loadCount < InventoryItemRow + 1 then
				return
			end

			local row = tonumber(string.sub(tname, 5))
			local toprow = 1 + Mathf.Floor((1 - itemDetail.BagScroll.scrollRectCom.normalizedPosition.y) / (1 / (itemLoader.loadCount - InventoryItemRow)) + 0.5)
			local botrow = toprow + InventoryItemRow - 1

			if pos == XButton.Adjacent.DOWN and botrow <= row then
				if tname == "item" .. itemLoader.loadCount then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			elseif pos == XButton.Adjacent.UP and row <= toprow then
				if tname == "item1" then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 0)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y + 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			end
		end
	end
end

function ExchangeCtrl.DPadPress(pos)
	if pos == XButton.Adjacent.RIGHT or pos == XButton.Adjacent.LEFT then
		if DholdInput == 0 then
			if pos == XButton.Adjacent.RIGHT then
				itemDetail.AddBtnFunc()
			elseif pos == XButton.Adjacent.LEFT then
				itemDetail.MinBtnFunc()
			end
		end

		if DholdInput ~= pos or DholdTime == 0 then
			DholdTime = TimeHelper.getNowTimeNoScale()
		end

		DholdInput = pos
		DholdDeltaTime = TimeHelper.getNowTimeNoScale() - DholdTime

		if DholdDeltaTime > 0.5 then
			if pos == XButton.Adjacent.RIGHT then
				itemDetail.AddBtnFunc()
			elseif pos == XButton.Adjacent.LEFT then
				itemDetail.MinBtnFunc()
			end

			DholdTime = DholdTime + 0.15
		end
	elseif not isInConfirmState then
		if DholdInput == 0 then
			local tname = UILayerCtrl.GetCurrentButtonName()

			UILayerCtrl.Select(pos)
			UILayerCtrl.OnCursorClick()

			DholdInput = pos

			if itemLoader.loadCount < InventoryItemRow + 1 then
				return
			end

			local row = tonumber(string.sub(tname, 5))
			local toprow = 1 + Mathf.Floor((1 - itemDetail.BagScroll.scrollRectCom.normalizedPosition.y) / (1 / (itemLoader.loadCount - InventoryItemRow)) + 0.5)
			local botrow = toprow + InventoryItemRow - 1

			if pos == XButton.Adjacent.DOWN and botrow <= row then
				if tname == "item" .. itemLoader.loadCount then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			elseif pos == XButton.Adjacent.UP and row <= toprow then
				if tname == "item1" then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 0)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y + 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			end
		end

		if DholdInput ~= pos or DholdTime == 0 then
			DholdTime = TimeHelper.getNowTimeNoScale()
		end

		DholdInput = pos
		DholdDeltaTime = TimeHelper.getNowTimeNoScale() - DholdTime

		if DholdDeltaTime > 0.5 then
			local tname = UILayerCtrl.GetCurrentButtonName()

			UILayerCtrl.Select(pos)
			UILayerCtrl.OnCursorClick()

			DholdTime = DholdTime + 0.15

			if itemLoader.loadCount < InventoryItemRow + 1 then
				return
			end

			local row = tonumber(string.sub(tname, 5))
			local toprow = 1 + Mathf.Floor((1 - itemDetail.BagScroll.scrollRectCom.normalizedPosition.y) / (1 / (itemLoader.loadCount - InventoryItemRow)) + 0.5)
			local botrow = toprow + InventoryItemRow - 1

			if pos == XButton.Adjacent.DOWN and botrow <= row then
				if tname == "item" .. itemLoader.loadCount then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 1)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y - 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			elseif pos == XButton.Adjacent.UP and row <= toprow then
				if tname == "item1" then
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, 0)
				else
					itemDetail.BagScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.BagScroll.scrollRectCom.normalizedPosition.x, itemDetail.BagScroll.scrollRectCom.normalizedPosition.y + 1 / (itemLoader.loadCount - InventoryItemRow))
				end
			end
		end
	end
end

function ExchangeCtrl.JPadPress(pos)
	if not canClick then
		return
	end

	if itemDetail.triangleGroup.activeSelf then
		local flowRow = Mathf.Round((itemDetail.contentGroupRT.rect.height - itemDetail.contentHeight) / itemDetail.oneLineHeight)

		if flowRow < 1 then
			flowRow = 1
		end

		if pos == XButton.Adjacent.DOWN and itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.y > 0.01 then
			itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
		elseif pos == XButton.Adjacent.UP and itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.y < 0.99 then
			itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition = Vector2.New(itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.x, itemDetail.contentGroupScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
		end
	end
end

function ExchangeCtrl.GamePadControl()
	if not canClick then
		return
	end

	if UILayerCtrl.IsProcessed() then
		return
	end

	if UILayerCtrl.IsCurrentLayerCurtain() or UIManager.IsMovieMode() then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "Transaction" then
		if inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetKeyCancelDown() then
			if isInConfirmState then
				isInConfirmState = false

				UILayerCtrl.OnSelect(lastItemBtnName)
			else
				UILayerCtrl.OnButtonClick("ExchangePanel_BackBtn")

				return
			end
		elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			if itemLoader.loadCount < 1 then
				return
			end

			if isInConfirmState then
				UILayerCtrl.OnCursorClick()
			else
				lastItemBtn = UILayerCtrl.GetCurrentButton()

				if currentTabType == ExchangeCtrl.TabType.Buy then
					UILayerCtrl.OnSelect("BuyBtn")

					isInConfirmState = true
				elseif currentTabType == ExchangeCtrl.TabType.Sell then
					UILayerCtrl.OnSelect("SellBtn")

					isInConfirmState = true
				end

				lastItemBtn:SetCommonHighlighted(true)
			end
		end

		if (inputMgr:GetButtonUp(GPKey.LOCKON) or inputMgr:GetKeyDown(XKeyCode.LeftShift)) and itemDetail.LockGroup.activeSelf then
			if itemDetail.LockOnBtn.gameObject.activeSelf then
				UILayerCtrl.OnButtonClick("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup_LockOn")
			elseif itemDetail.LockOffBtn.gameObject.activeSelf then
				UILayerCtrl.OnButtonClick("ExchangePanel_ExchangeBG_LeftPanel_ItemInfoGroup_itemFrame_LockGroup_LockOff")
			end
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			if currentType == ExchangeCtrl.TransactionType.Normal or currentType == ExchangeCtrl.TransactionType.Viola or currentType == ExchangeCtrl.TransactionType.Norwood or currentType == ExchangeCtrl.TransactionType.Maze then
				UILayerCtrl.OnButtonClick("buyTabBtn")
			end
		elseif (inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down()) and (currentType == ExchangeCtrl.TransactionType.Normal or currentType == ExchangeCtrl.TransactionType.Viola or currentType == ExchangeCtrl.TransactionType.Norwood or currentType == ExchangeCtrl.TransactionType.Maze) then
			UILayerCtrl.OnButtonClick("sellTabBtn")
		end

		local nowSkillAxis = inputMgr:GetAxis(LS_Setting.Btn.MX)

		if inputMgr:GetButton(LS_Setting.Btn.DL) or inputMgr:GetKey(KMKey.MOVEA) or inputMgr:GetKey(KMKey.CAMYL) or inputMgr:GetKey(XKeyCode.LeftArrow) then
			ExchangeCtrl.DPadPress(3)
		elseif inputMgr:GetButton(LS_Setting.Btn.DR) or inputMgr:GetKey(KMKey.MOVED) or inputMgr:GetKey(KMKey.CAMYR) or inputMgr:GetKey(XKeyCode.RightArrow) then
			ExchangeCtrl.DPadPress(4)
		end

		if nowSkillAxis > 0.38 then
			ExchangeCtrl.GPadPress(4)
		end

		if nowSkillAxis < -0.38 then
			ExchangeCtrl.GPadPress(3)
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.DL) or inputMgr:GetButtonUp(LS_Setting.Btn.DR) or inputMgr:GetKeyUp(KMKey.MOVEA) or inputMgr:GetKeyUp(KMKey.MOVED) or inputMgr:GetKeyUp(KMKey.CAMYL) or inputMgr:GetKeyUp(KMKey.CAMYR) or inputMgr:GetKeyUp(XKeyCode.LeftArrow) or inputMgr:GetKeyUp(XKeyCode.RightArrow) then
			DholdTime = 0
			DholdInput = 0
			DholdDeltaTime = 0
		end

		if nowSkillAxis > -0.38 and nowSkillAxis < 0.38 then
			GholdTime = 0
			GholdInput = 0
			GholdDeltaTime = 0
		end

		local nowSkillAxis2 = inputMgr:GetAxis(LS_Setting.Btn.MY)

		if inputMgr:GetButton(LS_Setting.Btn.DD) or inputMgr:GetKey(KMKey.MOVES) or inputMgr:GetKey(KMKey.CAMPD) or inputMgr:GetKey(XKeyCode.DownArrow) then
			ExchangeCtrl.DPadPress(2)
		elseif inputMgr:GetButton(LS_Setting.Btn.DU) or inputMgr:GetKey(KMKey.MOVEW) or inputMgr:GetKey(KMKey.CAMPU) or inputMgr:GetKey(XKeyCode.UpArrow) then
			ExchangeCtrl.DPadPress(1)
		end

		if nowSkillAxis2 > 0.38 then
			ExchangeCtrl.GPadPress(1)
		end

		if nowSkillAxis2 < -0.38 then
			ExchangeCtrl.GPadPress(2)
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.DD) or inputMgr:GetButtonUp(LS_Setting.Btn.DU) or inputMgr:GetKeyUp(KMKey.MOVEW) or inputMgr:GetKeyUp(KMKey.MOVES) or inputMgr:GetKeyUp(KMKey.CAMPU) or inputMgr:GetKeyUp(KMKey.CAMPD) or inputMgr:GetKeyUp(XKeyCode.UpArrow) or inputMgr:GetKeyUp(XKeyCode.DownArrow) then
			DholdTime = 0
			DholdInput = 0
			DholdDeltaTime = 0
		end

		if nowSkillAxis2 > -0.38 and nowSkillAxis2 < 0.38 then
			GholdTime2 = 0
			GholdInput2 = 0
			GholdDeltaTime2 = 0
		end

		local nowRotAxis2 = inputMgr:GetAxis(LS_Setting.Btn.VY)

		if nowRotAxis2 > 0.38 then
			ExchangeCtrl.JPadPress(1)
		end

		if nowRotAxis2 < -0.38 then
			ExchangeCtrl.JPadPress(2)
		end
	end
end

return ExchangeCtrl
