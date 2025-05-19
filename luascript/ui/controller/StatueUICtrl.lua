-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/StatueUICtrl.lua

StatueUICtrl = class("StatueUICtrl", UICtrlBase)

local this = StatueUICtrl
local backBtn
local lastAxis = 0
local sceneController, gameController, selectionLoader, JoystickRT, KeyboardRT

function StatueUICtrl.OnCreate()
	UILayerCtrl.Add("Statue")

	JoystickRT = this.mainComponent:GetGameObject("StatuePanel_GamePadIconGroup_R"):GetComponent("RectTransform")
	KeyboardRT = this.mainComponent:GetGameObject("StatuePanel_KeyboardIconGroup"):GetComponent("RectTransform")
	backBtn = this.mainComponent:GetButton("StatuePanel_Back_L")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.CloseSelf()
	end)
	UILayerCtrl.AddIndividual("Statue", "StatuePanel_Back", backBtn)

	selectionLoader = this.mainComponent:GetLoader("StatuePanel_Panel_BoardList")

	this.gameObject:SetActive(false)
end

function StatueUICtrl.Open(backCB)
	this.loadFinish = false
	sceneController = ST_Main.GetSceneController()
	gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	backBtn.callback = backCB

	this.gameObject:SetActive(true)
	UILayerCtrl.Push("Statue")
	UIManager.SendMessage("Mainmenu", "ShowGameUI", true)
	UIManager.SendMessage("Mainmenu", "SetForceHideTouchUI", true)
	UIManager.SendMessage("Mainmenu", "ShowHostUI", true)
	UIManager.SendMessage("Mainmenu", "SetInteractive", false)
	StatueUICtrl.LoadSelection(gameController:GetStatueDataList())
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(JoystickRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardRT)
	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
end

function StatueUICtrl.CloseSelf()
	this.gameObject:SetActive(false)
	UILayerCtrl.Pop()
	UIManager.SendMessage("Mainmenu", "SetForceHideTouchUI", false)
	UIManager.SendMessage("Mainmenu", "ShowGameUI", false)

	if backBtn.callback ~= nil then
		backBtn.callback()
	end

	inputMgr:SetInGameMode()
	inputMgr:SetPointerLocked(true)
end

function StatueUICtrl.LoadSelection(statueList)
	local bountyList = statueList

	selectionLoader.loadCount = 2

	function selectionLoader.loadCallback(index, com, data)
		local btn = com:GetButton("Button_Gain")
		local title = com:GetText("Text_Title")
		local content = com:GetText("Text_Content")
		local info = com:GetText("Text_Possess")
		local mask = com:GetGameObject("Mask")
		local isEnough = StatueUICtrl.IsItemEnough(bountyList[index].UseItemId, bountyList[index].UseItemNum) and StatueUICtrl.IsPropertyEnough(bountyList[index].UseProperty, bountyList[index].UseValue)
		local isBuffPermit = StatueUICtrl.IsBuffPermit(bountyList[index].GetStatusId)

		mask:SetActive(not isEnough or not isBuffPermit)

		if bountyList[index].UseItemId ~= MS_ItemData.DarkShard then
			info.gameObject:SetActive(false)
		else
			info.gameObject:SetActive(true)

			local value = FS_UserData.itemList:GetItemNum(MS_ItemData.DarkShard)

			if isEnough then
				info:SetContent(GameText.UI_BOUNTY_CHIP .. ":<color=#FFFFFFFF>" .. value .. "</color>")
			else
				info:SetContent(GameText.UI_BOUNTY_CHIP .. ":<color=#FF0000FF>" .. value .. "</color>")
			end
		end

		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if not isEnough then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_BOUNTY_LACK_OF_CONDITION)

				return
			end

			if not isBuffPermit then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_BOUNTY_BUFF_FULL)

				return
			end

			StatueUICtrl.UseItem(bountyList[index].UseItemId, bountyList[index].UseItemNum)
			StatueUICtrl.UseProperty(bountyList[index].UseProperty, bountyList[index].UseValue)
			StatueUICtrl.GetItem(bountyList[index].GetItemId, bountyList[index].GetNum)
			StatueUICtrl.GetProperty(bountyList[index].GetProperty, bountyList[index].GetRate)
			StatueUICtrl.GetStatus(bountyList[index].GetStatusId)

			if gameController ~= nil then
				gameController:StatueEffect()
			end

			this.CloseSelf()
		end)
		title:SetContent(bountyList[index].Title)
		content:SetContent(bountyList[index].Description)
		UILayerCtrl.AddButton("Statue", "selectionBtn" .. index, btn)

		if index == 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "selectionBtn" .. selectionLoader.loadCount)
		end

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "selectionBtn" .. index - 1)
		end

		if index < selectionLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "selectionBtn" .. index + 1)
		end

		if index == selectionLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "selectionBtn1")
			UILayerCtrl.OnSelect("selectionBtn1")

			this.loadFinish = true
		end
	end

	selectionLoader:Load()
end

function StatueUICtrl.IsItemEnough(itemId, value)
	if itemId == 0 then
		return true
	end

	local player = sceneController:GetHostPlayer()
	local heroData = FS_UserData.heroList:GetHero(player:GetHeroId())

	if MS_ItemData.ItemID_HpAdd == itemId then
		return value <= heroData:GetHpNum()
	elseif MS_ItemData.ItemID_MpAdd == itemId then
		return value <= heroData:GetMpNum()
	else
		return value <= FS_UserData.itemList:GetItemNum(itemId)
	end
end

function StatueUICtrl.IsPropertyEnough(propertyId, value)
	if propertyId == 0 then
		return true
	end

	local player = sceneController:GetHostPlayer()

	if propertyId == MS_HeroData.Property.San then
		local sanNum = player:GetValue():GetProperty(propertyId)
		local sanMax = player:GetValue():GetPropertyMax(propertyId)
		local sanRet

		sanRet = sanNum <= sanMax / 2 and 0 or (sanNum - sanMax / 2) * 2

		return value < sanRet
	else
		return value <= player:GetValue():GetProperty(propertyId)
	end
end

function StatueUICtrl.IsBuffPermit(buffId)
	if buffId == MS_StatusData.NoDeathAddId then
		local player = sceneController:GetHostPlayer()
		local status = player:GetStatusById(buffId)

		if status ~= nil and status:IsOverlayMax() == true then
			return false
		end
	end

	return true
end

function StatueUICtrl.UseItem(itemId, value)
	if itemId == 0 then
		return
	end

	if gameController ~= nil then
		gameController:UseBagItem(itemId, value)
	end
end

function StatueUICtrl.UseProperty(propertyId, value)
	if propertyId == 0 then
		return
	end

	local player = sceneController:GetHostPlayer()

	if propertyId == MS_HeroData.Property.San then
		player:GetValue():SubProperty(propertyId, value / 2)
	else
		player:GetValue():SubProperty(propertyId, value)
	end
end

function StatueUICtrl.GetItem(itemId, value)
	if itemId == 0 then
		return
	end

	if gameController ~= nil then
		gameController:AddBagItem(itemId, value, false)
	end
end

function StatueUICtrl.GetProperty(propertyId, percent)
	if propertyId == 0 then
		return
	end

	local player = sceneController:GetHostPlayer()
	local valueMax = player:GetValue():GetPropertyMax(propertyId)

	if propertyId == MS_HeroData.Property.San then
		local retValue = valueMax * (percent / 2)

		player:GetValue():AddProperty(propertyId, retValue)
	else
		player:GetValue():AddProperty(propertyId, valueMax * percent)
	end
end

function StatueUICtrl.GetStatus(StatusId)
	if StatusId == 0 then
		return
	end

	local player = sceneController:GetHostPlayer()

	player:AddStatus(player:GetVirtualPlayer(), StatusId, 0, MS_StatusData.SourceType.Maze, 0, false)
end

function StatueUICtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function StatueUICtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if UILayerCtrl.IsCurrentLayerCurtain() or UIManager.IsMovieMode() then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "Statue" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		end

		if inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetKeyCancelDown() then
			UILayerCtrl.OnButtonClick("StatuePanel_Back")

			return
		end

		local nowSkillAxis = inputMgr:GetAxis(LS_Setting.Btn.MY)

		if inputMgr:GetButtonUp(LS_Setting.Btn.DD) or inputMgr:GetKeyDown(KMKey.MOVES) or inputMgr:GetKeyDown(KMKey.CAMPD) or inputMgr:GetKeyDown(XKeyCode.DownArrow) then
			UILayerCtrl.Select(2)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.DU) or inputMgr:GetKeyDown(KMKey.MOVEW) or inputMgr:GetKeyDown(KMKey.CAMPU) or inputMgr:GetKeyDown(XKeyCode.UpArrow) then
			UILayerCtrl.Select(1)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		end

		if nowSkillAxis < 0.38 and lastAxis > 0.38 then
			UILayerCtrl.Select(1)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		end

		if nowSkillAxis > -0.38 and lastAxis < -0.38 then
			UILayerCtrl.Select(2)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		end

		lastAxis = nowSkillAxis
	end
end

return StatueUICtrl
