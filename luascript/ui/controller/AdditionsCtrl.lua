-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/AdditionsCtrl.lua

AdditionsCtrl = class("AdditionsCtrl", UICtrlBase)
AdditionsCtrl.static.Name = "Additions"

local this = AdditionsCtrl

AdditionsCtrl.static.ShowCount = 4
AdditionsCtrl.static.TextPrefixName = "UI_DLC_ITEM_NAME_"
AdditionsCtrl.static.TextPrefixTitle = "UI_DLC_ITEM_DETAIL_TITLE_"
AdditionsCtrl.static.TextPrefixIntro = "UI_DLC_ITEM_DETAIL_INTRO_"
AdditionsCtrl.static.Focused = {
	Content = 1,
	Details = 2
}
AdditionsCtrl.static.SellState = {
	Hidden = 1,
	Max = 3,
	Notice = 2,
	Normal = 0
}
AdditionsCtrl.static.ValidState = {
	Valid = 1,
	Invalid = 0
}

local hasDlcs = false
local dlcCount = 0
local state = AdditionsCtrl.Focused.Content
local btnClose, dlcListDat, loaderDlcs, dlcContent, dlcDetails, btnRecovery
local keyPressed = false

function AdditionsCtrl.GetIndices(btnIndex, maxCount)
	local keyPrev = (btnIndex - 2 + maxCount) % maxCount + 1
	local keyNext = btnIndex % maxCount + 1

	return keyPrev, keyNext
end

function AdditionsCtrl.ClosePanel()
	keyPressed = false

	this.FocusDetails(false)
	this.FocusDlcItem(dlcContent.selIdx)
	UIManager.Close(AdditionsCtrl.Name)
	UILayerCtrl.Pop()
	XObjectPool.ClearImage()
	XObjectPool.ClearAllManagedImages()
	UILayerCtrl.ForceUpdate(0.7)
end

function AdditionsCtrl.OnCreate()
	UILayerCtrl.Add(AdditionsCtrl.Name, AdditionsCtrl.ClosePanel)

	keyPressed = false

	local navBar = {}

	navBar.go = this.mainComponent:GetGameObject("Additions_NavBar_RB")
	navBar.goGroup = this.mainComponent:GetGameObject("Additions_NavBar_Group")
	navBar.rectTfGroup = navBar.goGroup:GetComponent("RectTransform")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(navBar.rectTfGroup)

	navBar.KeyboardGroup = this.mainComponent:GetGameObject("Additions_NavBar_KeyBoardGroup")
	navBar.rectKeyboardTfGroup = navBar.KeyboardGroup:GetComponent("RectTransform")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(navBar.rectKeyboardTfGroup)

	local btn = this.mainComponent:GetButton("Additions_BtnBack")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AdditionsCtrl.ClosePanel()
	end)
	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	UILayerCtrl.AddIndividual(AdditionsCtrl.Name, "Additions_BtnBack", btn)
	UILayerCtrl.Push(AdditionsCtrl.Name, nil)

	dlcDetails = {}
	dlcDetails.go = this.mainComponent:GetGameObject("Additions_Contents_Details")
	dlcDetails.show = true

	dlcDetails.go:SetActive(dlcDetails.show)

	dlcDetails.data = nil
	dlcDetails.focused = false
	dlcDetails.goPortraitPnl = this.mainComponent:GetGameObject("Additions_Detial_Portrait")
	dlcDetails.goPortraitImg = this.mainComponent:GetGameObject("Additions_Detial_PortraitImage")
	dlcDetails.portrait = XImage:new(dlcDetails.goPortraitImg)

	dlcDetails.goPortraitPnl:SetActive(true)
	dlcDetails.goPortraitImg:SetActive(false)

	dlcDetails.txtTitle = this.mainComponent:GetText("Additions_Detail_TitleText")
	dlcDetails.txtPrice = this.mainComponent:GetText("Additions_Detial_PriceText")
	dlcDetails.txtIntro = this.mainComponent:GetText("Additions_Detail_IntroText")
	dlcDetails.goTitle = this.mainComponent:GetGameObject("Additions_Detail_TitleText")
	dlcDetails.goPrice = this.mainComponent:GetGameObject("Additions_Detial_Price")
	dlcDetails.goScroll = this.mainComponent:GetGameObject("Additions_Detail_Scroll")
	dlcDetails.content = this.mainComponent:GetGameObject("Additions_Detail_Content")
	dlcDetails.introRectTf = dlcDetails.txtIntro.gameObject:GetComponent("RectTransform")
	dlcDetails.scrollRect = XScrollRect:new(dlcDetails.goScroll)
	dlcDetails.normalizedY = 1
	dlcDetails.status = {}
	dlcDetails.status[AdditionsCtrl.SellState.Normal] = {}
	dlcDetails.status[AdditionsCtrl.SellState.Hidden] = {}
	dlcDetails.status[AdditionsCtrl.SellState.Notice] = {}

	local statusSell = {}

	statusSell.go = this.mainComponent:GetGameObject("Additions_Detail_BtnPurchase")
	statusSell.show = false

	statusSell.go:SetActive(statusSell.show)

	statusSell.selPurchase = this.mainComponent:GetGameObject("Additions_Detail_BtnPurchaseSel")
	statusSell.btnPurchase = this.mainComponent:GetButton("Additions_Detail_BtnPurchase")

	statusSell.btnPurchase:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local data = dlcDetails.data

		if data ~= nil then
			local name = GameText[AdditionsCtrl.TextPrefixName .. data.id]

			AdditionsCtrl.Purchase(data.productId, name, data.actualPrice)
		end
	end, 0)
	UILayerCtrl.AddButton(AdditionsCtrl.Name, "Additions_Detail_BtnPurchase", statusSell.btnPurchase)

	dlcDetails.status[AdditionsCtrl.SellState.Normal] = statusSell

	local statusValid = {}

	statusValid.go = this.mainComponent:GetGameObject("Additions_Detail_TextValid")
	statusValid.content = this.mainComponent:GetText("Additions_Detail_TextValid")
	statusValid.show = false

	statusValid.go:SetActive(statusValid.show)

	dlcDetails.status[AdditionsCtrl.SellState.Normal][0] = statusSell
	dlcDetails.status[AdditionsCtrl.SellState.Normal][1] = statusValid

	local statusHidden = {}

	statusHidden.go = this.mainComponent:GetGameObject("Additions_Detail_TextInvalid")
	statusHidden.content = this.mainComponent:GetText("Additions_Detail_TextInvalid")
	statusHidden.show = false

	statusHidden.go:SetActive(statusHidden.show)
	statusHidden.content:SetContent(GameText.EMPTY)

	dlcDetails.status[AdditionsCtrl.SellState.Hidden] = statusHidden

	local statusNotice = {}

	statusNotice.go = this.mainComponent:GetGameObject("Additions_Detail_TextNotice")
	statusNotice.content = this.mainComponent:GetText("Additions_Detail_TextNotice")
	statusNotice.show = false

	statusNotice.go:SetActive(statusNotice.show)

	dlcDetails.status[AdditionsCtrl.SellState.Notice] = statusNotice
	dlcContent = {}
	dlcContent.show = true
	dlcContent.go = this.mainComponent:GetGameObject("Additions_Contents_List")

	dlcContent.go:SetActive(dlcContent.show)

	dlcContent.items = {}
	dlcContent.selIdx = 0
	dlcContent.showIdx = 0
	dlcContent.selBtnKey = ""
	dlcListDat = {}
	dlcContent.scrollRect = XScrollRect:new(this.mainComponent:GetGameObject("Additions_Contents_Scroll"))
	loaderDlcs = this.mainComponent:GetLoader("Additions_Contents_ListContent")

	if loaderDlcs then
		loaderDlcs.loadFinished = false
		loaderDlcs.loadCount = 0
		loaderDlcs.loadStepping = 0

		function loaderDlcs.loadCallback(index, com, data)
			local dlcItem = {}

			dlcContent.items[index] = dlcItem
			dlcItem.idx = index
			dlcItem.go = com:GetGameObject("DLC_Item")

			local btn = com:GetButton("DLC_Item")

			btn:SetHighlightIndependent(true)

			dlcItem.btn = btn
			dlcItem.img = XImage:new(com:GetGameObject("DLC_Item_Image"))

			dlcItem.img.gameObject:SetActive(false)

			dlcItem.sel = com:GetGameObject("DLC_Item_Selected")
			dlcItem.name = com:GetText("DLC_Item_Name")
			dlcItem.goOriginalPrice = com:GetGameObject("DLC_Item_Price_Original")
			dlcItem.originalPrice = com:GetText("DLC_Item_Price_Original")
			dlcItem.goCurrentPrice = com:GetGameObject("DLC_Item_Price_Current")
			dlcItem.currentPrice = com:GetText("DLC_Item_Price_Current")
			dlcItem.showOnSaleTag = false
			dlcItem.goOnSaleTag = com:GetGameObject("DLC_Item_OnSale")
			dlcItem.discount = com:GetText("DLC_Item_Discount")

			dlcItem.goOnSaleTag:SetActive(dlcItem.showOnSaleTag)

			local itemData = data[index]

			if itemData ~= nil then
				dlcItem.dat = itemData

				local pid = itemData.id
				local name = GameText[AdditionsCtrl.TextPrefixName .. pid]
				local title = GameText[AdditionsCtrl.TextPrefixTitle .. pid]
				local intro = GameText[AdditionsCtrl.TextPrefixIntro .. pid]
				local curPrice = ""
				local oldPrice = ""

				if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
					curPrice = tostring(itemData.price)
					oldPrice = tostring(itemData.oldPrice)
				elseif SdkHelper.CHANNEL == "ANDROID_HUAWEI" then
					curPrice = itemData.currency .. " " .. itemData.price
					oldPrice = itemData.currency .. " " .. itemData.oldPrice
				elseif SdkHelper.CHANNEL == "ANDROID_UNION" then
					curPrice = itemData.price
					oldPrice = itemData.oldPrice
				elseif LS_Setting.lang == "zhs" and itemData.currency == "CNY" then
					local currency = "元"

					curPrice = string.format("%6.2f %s", itemData.price, currency)
					oldPrice = string.format("%6.2f %s", itemData.oldPrice, currency)
				else
					curPrice = string.format("%s %6.2f", itemData.currency, itemData.price)
					oldPrice = string.format("%s %6.2f", itemData.currency, itemData.oldPrice)
				end

				local discount = GameText.UI_COMMON_MINUS .. itemData.discount .. GameText.UI_COMMON_PERCENT

				dlcItem.name:SetContent(name)
				dlcItem.currentPrice:SetContent(curPrice)

				dlcItem.showOnSaleTag = itemData.discount > 0 and itemData.valid == false

				if itemData.sell == AdditionsCtrl.SellState.Notice then
					dlcItem.goCurrentPrice:SetActive(false)
					dlcItem.goOriginalPrice:SetActive(false)
					dlcItem.goOnSaleTag:SetActive(false)
				else
					dlcItem.goCurrentPrice:SetActive(not itemData.valid)
					dlcItem.goOriginalPrice:SetActive(dlcItem.showOnSaleTag)
					dlcItem.goOnSaleTag:SetActive(dlcItem.showOnSaleTag)

					if itemData.price == 0 and itemData.oldPrice == 0 then
						dlcItem.goOriginalPrice:SetActive(false)
						dlcItem.goOnSaleTag:SetActive(false)
					end

					if dlcItem.showOnSaleTag == true then
						dlcItem.originalPrice:SetContent(oldPrice)
						dlcItem.discount:SetContent(discount)
					else
						dlcItem.originalPrice:SetContent(GameText.EMPTY)
						dlcItem.discount:SetContent(GameText.EMPTY)
					end
				end

				local imgName = "additions_" .. pid

				XObjectPool.LoadManagedImage(index, imgName, function()
					local sprite = XObjectPool.GetManagedImage(index)

					if sprite then
						dlcItem.img:SetSprite(sprite)
						dlcItem.img.gameObject:SetActive(true)
					else
						dlcItem.img.gameObject:SetActive(false)
					end
				end)
				dlcItem.btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					dlcContent.selIdx = dlcItem.idx

					local step = 1 / (loaderDlcs.loadCount - AdditionsCtrl.ShowCount)
					local toprow = 1 + math.floor((1 - dlcContent.scrollRect.scrollRectCom.normalizedPosition.y) / step + 0.5)
					local botrow = toprow + AdditionsCtrl.ShowCount - 1

					dlcContent.showIdx = dlcItem.idx - toprow + 1

					SystemHelper.Log(string.format("[ OnBtnIapItem: %d [%d ~ %d] @ (%d in %d) ]", dlcItem.idx, toprow, botrow, dlcContent.showIdx, AdditionsCtrl.ShowCount))
					this.FocusDetails(false)
					this.FocusDlcItem(dlcItem.idx)
					this.SelectIapItem(dlcItem.idx)
					dlcItem.btn:SetHighlighted()
				end, 0)

				local idxPrev, idxNext = AdditionsCtrl.GetIndices(index, dlcCount)
				local lName = AdditionsCtrl.Name
				local keyC = lName .. "_BtnIap" .. index
				local keyP = lName .. "_BtnIap" .. idxPrev
				local keyN = lName .. "_BtnIap" .. idxNext

				UILayerCtrl.AddButton(AdditionsCtrl.Name, keyC, btn)
				btn:SetAdjacent(XButton.Adjacent.UP, keyP)
				btn:SetAdjacent(XButton.Adjacent.DOWN, keyN)
			else
				dlcItem.name.gameObject:SetActive(false)
				dlcItem.currentPrice.gameObject:SetActive(false)
				dlcItem.goOriginalPrice:SetActive(false)
				dlcItem.goOnSaleTag:SetActive(false)
				dlcItem.img.gameObject:SetActive(false)
				btn:SetAdjacent(XButton.Adjacent.UP, "")
				btn:SetAdjacent(XButton.Adjacent.DOWN, "")
			end

			btn:SetParentScroll(dlcContent.scrollRect)

			loaderDlcs.loadStepping = loaderDlcs.loadStepping + 1

			if loaderDlcs.loadStepping == loaderDlcs.loadCount then
				loaderDlcs.loadFinished = true
				this.loadFinish = true

				if hasDlcs then
					local lName = AdditionsCtrl.Name
					local keyC = lName .. "_BtnIap" .. 1

					UILayerCtrl.OnSelect(keyC)

					dlcContent.selIdx = 1
					dlcContent.showIdx = 1
					dlcContent.scrollRect.scrollRectCom.normalizedPosition = Vector2.one

					UILayerCtrl.OnCursorClickMute()
				end
			end
		end

		this.RevalidateIapList()
	end

	btnRecovery = this.mainComponent:GetButton("Additions_Contents_BtnPurchaseRecovery")

	btnRecovery:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AdditionsCtrl.OnButtonPurchaseRecovery()
	end)

	local showRecovery = Platform == PlatformType.IOS or Platform == PlatformType.TVOS or SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY

	showRecovery = showRecovery and SettingCfg.Additions.Recovery
	btnRecovery.show = showRecovery

	btnRecovery.gameObject:SetActive(showRecovery)
	UILayerCtrl.ForceUpdate(0.7)
end

function AdditionsCtrl.OnButtonPurchaseRecovery()
	if SdkHelper.CheckAccountState() then
		UIManager.SendMessage("Loading", "SimpleLoading", true)

		if SdkHelper.IsIapInfosInited == true then
			SystemHelper.LogTest("开始获取已购买追加内容")
			SdkHelper.GetPaidList(function(b2)
				UIManager.SendMessage("Loading", "SimpleLoading", false)

				if b2 == true then
					SystemHelper.LogTest(GameText.UI_EVENTLOG_OWNIAP_SUCC .. tostring(SdkHelper.IsPaidListInited))
					this.FocusDetails(false)
					this.FocusDlcItem(dlcContent.selIdx)
					this.RevalidateIapList()
					UILayerCtrl.ForceUpdate(0.2)
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_EVENTLOG_OWNIAP_FAIL, function()
						return
					end, function()
						return
					end, true)
				end
			end)
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_EVENTLOG_GETIAP_FAIL, function()
				return
			end, function()
				return
			end, true)
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOUD_NETERR_OR_SDKNOTINIT_OR_LOGOUT, function()
			return
		end, function()
			return
		end, true)
	end
end

function AdditionsCtrl.ResetDetailsPanel()
	for idx, status in pairs(dlcDetails.status) do
		if idx == AdditionsCtrl.SellState.Normal then
			status[0].show = false

			status[0].go:SetActive(false)

			status[1].show = false

			status[1].go:SetActive(false)
		else
			status.show = false

			status.go:SetActive(false)
		end
	end

	dlcDetails.goPrice:SetActive(false)
end

function AdditionsCtrl.RevalidateIapItem(data)
	if data ~= nil then
		local pid = data.id
		local title = GameText[AdditionsCtrl.TextPrefixTitle .. pid]
		local intro = GameText[AdditionsCtrl.TextPrefixIntro .. pid]
		local price = ""

		if SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
			price = tostring(data.price)
		elseif SdkHelper.CHANNEL == "ANDROID_HUAWEI" then
			price = data.currency .. " " .. data.price
		elseif SdkHelper.CHANNEL == "ANDROID_UNION" then
			price = data.price
		elseif LS_Setting.lang == "zhs" and data.currency == "CNY" then
			price = string.format("%6.2f %s", data.price, "元")
		else
			price = string.format("%s %6.2f", data.currency, data.price)
		end

		dlcDetails.data = data

		dlcDetails.txtTitle:SetContent(title)
		dlcDetails.txtIntro:SetContent(intro)
		dlcDetails.txtPrice:SetContent(price)

		dlcDetails.normalizedY = 1
		dlcDetails.scrollRect.scrollRectCom.normalizedPosition = Vector2.one

		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(dlcDetails.introRectTf)
		this.ResetDetailsPanel()

		local imgName = "additions_" .. pid .. "d"

		XObjectPool.LoadImage(imgName, function()
			local sprite = XObjectPool.GetImage(imgName)

			if sprite then
				dlcDetails.portrait:SetSprite(sprite)
				dlcDetails.portrait.gameObject:SetActive(true)
			else
				dlcDetails.portrait.gameObject:SetActive(false)
			end
		end)

		local sell = data.sell
		local isValid = data.valid

		if isValid == true then
			if sell == AdditionsCtrl.SellState.Normal or sell == AdditionsCtrl.SellState.Hidden then
				local statusValid = dlcDetails.status[AdditionsCtrl.SellState.Normal][1]

				if statusValid.show == false then
					statusValid.show = true

					statusValid.go:SetActive(true)
				end
			end
		elseif sell == AdditionsCtrl.SellState.Normal then
			local statusSell = dlcDetails.status[sell][0]

			if statusSell.show == false then
				statusSell.show = true

				statusSell.go:SetActive(true)
			end

			dlcDetails.goPrice:SetActive(true)
		elseif sell == AdditionsCtrl.SellState.Hidden then
			local statusHidden = dlcDetails.status[sell]

			if statusHidden.show == false then
				statusHidden.show = true

				statusHidden.go:SetActive(true)
			end
		elseif sell == AdditionsCtrl.SellState.Notice then
			local statusNotice = dlcDetails.status[sell]

			if statusNotice.show == false then
				statusNotice.show = true

				statusNotice.go:SetActive(true)
			end
		end
	else
		local blankText = GameText.UI_COMMON_EMPTY

		dlcDetails.data = nil

		dlcDetails.txtTitle:SetContent(blankText)
		dlcDetails.txtIntro:SetContent(blankText)
		dlcDetails.txtPrice:SetContent(blankText)
		this.ResetDetailsPanel()
	end
end

function AdditionsCtrl.RevalidateIapList()
	dlcListDat = {}

	if SdkHelper.IsIapInfosInited == true and SdkHelper.IsPaidListInited == true then
		this.loadFinish = false
		dlcContent.items = {}

		local iapInfos = SdkHelper.IapInfos
		local iapIndex = 0
		local sortedList = {}
		local count = table.nums(iapInfos)

		for _, _v in pairs(iapInfos) do
			sortedList[_v.order] = _v
		end

		for _k, _v in pairs(sortedList) do
			if _v.sell ~= AdditionsCtrl.SellState.Hidden or _v.valid == true and _v.sell == AdditionsCtrl.SellState.Hidden then
				iapIndex = iapIndex + 1
				dlcListDat[iapIndex] = _v
			end
		end
	end

	dlcCount = table.nums(dlcListDat)
	hasDlcs = dlcCount > 0

	dlcDetails.goTitle:SetActive(hasDlcs)
	dlcDetails.goPrice:SetActive(hasDlcs)
	dlcDetails.goScroll:SetActive(hasDlcs)

	loaderDlcs.loadFinished = false
	loaderDlcs.loadCount = dlcCount > AdditionsCtrl.ShowCount and dlcCount or AdditionsCtrl.ShowCount
	loaderDlcs.loadStepping = 0

	loaderDlcs:PreloadTemplate(function()
		loaderDlcs:Load(dlcListDat)
	end)

	if not hasDlcs then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_DLC_ITEM_UNAVAILABLE, function()
			return
		end, function()
			return
		end, true)
	end
end

function AdditionsCtrl.SelectIapItem(rowIdx)
	if dlcContent and dlcContent.items then
		local selIdx = dlcContent.selIdx

		if selIdx >= 1 and selIdx <= dlcCount then
			local dlcItem = dlcContent.items[selIdx]

			if dlcItem ~= nil then
				dlcItem.btn:SetNormal()
			end
		end

		if rowIdx >= 1 and rowIdx <= dlcCount then
			local dlcItem = dlcContent.items[rowIdx]

			if dlcItem ~= nil then
				dlcContent.selIdx = rowIdx
				dlcContent.selBtnKey = AdditionsCtrl.Name .. "_BtnIap" .. dlcItem.idx

				local lName = AdditionsCtrl.Name
				local keyC = lName .. "_BtnIap" .. rowIdx

				UILayerCtrl.OnSelect(keyC)
				this.RevalidateIapItem(dlcListDat[rowIdx])
			end
		end
	end
end

function AdditionsCtrl.FocusDlcItem(idx)
	if idx > 0 then
		local dlcItem = dlcContent.items[idx]

		dlcItem.btn:SetHighlighted()
	end
end

function AdditionsCtrl.UnFocusDlcItem(idx)
	if idx > 0 then
		local dlcItem = dlcContent.items[idx]

		dlcItem.btn:SetHighlighted()
	end
end

function AdditionsCtrl.FocusDetails(value)
	if dlcDetails and dlcDetails.focused ~= value then
		dlcDetails.focused = value

		if dlcDetails.data ~= nil then
			local iapInfo = dlcDetails.data

			if value == true then
				if iapInfo.valid == false and iapInfo.sell == AdditionsCtrl.SellState.Normal then
					state = AdditionsCtrl.Focused.Details

					local statusSell = dlcDetails.status[iapInfo.sell][0]

					statusSell.btnPurchase:SetHighlighted()
					UILayerCtrl.OnSelect("Additions_Detail_BtnPurchase")
					this.UnFocusDlcItem(dlcContent.selIdx)
				end
			else
				state = AdditionsCtrl.Focused.Content

				local statusSell = dlcDetails.status[AdditionsCtrl.SellState.Normal][0]

				statusSell.btnPurchase:SetNormal()
				UILayerCtrl.OnSelect(dlcContent.selBtnKey)
				this.FocusDlcItem(dlcContent.selIdx)
				this.SelectIapItem(dlcContent.selIdx)
			end
		end
	end
end

function AdditionsCtrl.Purchase(pid, name, price)
	if SdkHelper.IsIapInfosInited == true and SdkHelper.IsPaidListInited == true then
		if SdkHelper.IsRealnamedUser() == false then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", "需要先完成实名认证才能购买追加内容", function()
				return
			end, function()
				return
			end, true)
		elseif SdkHelper.GetUserAgeOlderThen8() then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", string.gsub(GameText.UI_ADDITIONS_CONFIRM_PURCHASE, "{0}", name), function()
				if AppConst.SdkType ~= "TIPS" then
					UIManager.SendMessage("Loading", "SimpleLoading", true)
				end

				SdkHelper.Pay(pid, LS_Account.userId, name, price, function()
					if AppConst.SdkType ~= "TIPS" then
						UIManager.SendMessage("Loading", "SimpleLoading", false)
					end

					if SdkHelper.IapInfos[pid].valid == true then
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", string.gsub(GameText.UI_ADDITIONS_PURCHASE_SUCCESS, "{0}", name), function()
							this.FocusDetails(false)
							this.FocusDlcItem(dlcContent.selIdx)
							this.RevalidateIapList()
							UILayerCtrl.ForceUpdate(0.2)
						end, function()
							return
						end, true)
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", string.gsub(GameText.UI_ADDITIONS_PURCHASE_FAILURE, "{0}", name), function()
							this.FocusDetails(false)
							this.FocusDlcItem(dlcContent.selIdx)
							this.RevalidateIapList()
							UILayerCtrl.ForceUpdate(0.2)
						end, function()
							return
						end, true)
					end

					keyPressed = false
				end)
			end, function()
				keyPressed = false
			end, false)
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", "没有年满8岁不能购买追加内容", function()
				return
			end, function()
				return
			end, true)
		end
	end
end

function AdditionsCtrl.Update()
	if not this.loadFinish then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName and lName == AdditionsCtrl.Name then
		this.GamePadControl()
	end
end

function AdditionsCtrl.IsItemPurchasable(data)
	local purchasable = false

	if data ~= nil and dlcDetails.data.sell == AdditionsCtrl.SellState.Normal and dlcDetails.data.valid == false then
		purchasable = true
	end

	return purchasable
end

function AdditionsCtrl.JPadPress(dir)
	if dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN then
		if dlcDetails and dlcDetails.focused == false then
			local dirVal = dir - 1.5 > 0 and 1 or -1
			local gap = 0
			local listCount = dlcCount
			local showCount = AdditionsCtrl.ShowCount

			showCount = showCount < listCount and showCount or listCount

			local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, dlcContent.selIdx, listCount, dlcContent.showIdx, showCount, gap, true)

			if normalizedY >= 0 then
				dlcContent.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(dlcContent.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
			end

			local step = 1 / (listCount - showCount)
			local toprow = 1 + math.floor((1 - dlcContent.scrollRect.scrollRectCom.normalizedPosition.y) / step + 0.5)
			local botrow = toprow + showCount - 1

			dlcContent.selIdx = (dlcContent.selIdx - 1 + dirVal + dlcCount) % dlcCount + 1
			dlcContent.showIdx = dlcContent.selIdx - toprow + 1

			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorMove()
			this.RevalidateIapItem(dlcListDat[dlcContent.selIdx])
		end
	elseif dir == XButton.Adjacent.LEFT then
		if hasDlcs and state == AdditionsCtrl.Focused.Details then
			this.FocusDetails(false)
		end
	elseif dir == XButton.Adjacent.RIGHT and hasDlcs and dlcDetails and state == AdditionsCtrl.Focused.Content and this.IsItemPurchasable(dlcDetails.data) then
		this.FocusDetails(true)
	end
end

function AdditionsCtrl.DPadPress(dir)
	this.JPadPress(dir)
end

function AdditionsCtrl.JPadRot(dir)
	if dlcDetails ~= nil and dlcDetails.scrollRect ~= nil then
		if dir == XButton.Adjacent.DOWN then
			local scrollRectCom = dlcDetails.scrollRect.scrollRectCom

			if dlcDetails.normalizedY > 0 then
				dlcDetails.normalizedY = dlcDetails.normalizedY - 0.05
			else
				dlcDetails.normalizedY = 0
			end

			scrollRectCom.normalizedPosition = Vector2.New(1, dlcDetails.normalizedY)
		elseif dir == XButton.Adjacent.UP then
			local scrollRectCom = dlcDetails.scrollRect.scrollRectCom

			if dlcDetails.normalizedY < 1 then
				dlcDetails.normalizedY = dlcDetails.normalizedY + 0.05
			else
				dlcDetails.normalizedY = 1
			end

			scrollRectCom.normalizedPosition = Vector2.New(1, dlcDetails.normalizedY)
		end
	end
end

function AdditionsCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if state == AdditionsCtrl.Focused.Content then
		if inputMgr:GetButtonDown(GBKey.A) then
			keyPressed = true
		elseif keyPressed and inputMgr:GetButtonUp(GBKey.A) and hasDlcs and dlcDetails then
			keyPressed = false

			if this.IsItemPurchasable(dlcDetails.data) then
				this.FocusDetails(true)
			end
		elseif inputMgr:GetButtonDown(GBKey.B) then
			keyPressed = true
		elseif keyPressed and inputMgr:GetButtonUp(GBKey.B) then
			keyPressed = false

			UILayerCtrl.OnButtonClick("Additions_BtnBack")
		end
	elseif state == AdditionsCtrl.Focused.Details then
		if inputMgr:GetButtonDown(GBKey.A) then
			keyPressed = true
		elseif keyPressed and inputMgr:GetButtonUp(GBKey.A) then
			keyPressed = false

			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) then
			keyPressed = true
		elseif keyPressed and inputMgr:GetButtonUp(GBKey.B) then
			keyPressed = false

			this.FocusDetails(false)
		end
	end
end

function AdditionsCtrl.Close()
	if loaderDlcs then
		loaderDlcs:ClearTemplate()
	end

	UICtrlBase.Close("Additions")
end

return AdditionsCtrl
