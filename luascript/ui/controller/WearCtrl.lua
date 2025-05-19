-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/WearCtrl.lua

WearCtrl = class("WearCtrl", UICtrlBase)

local this = WearCtrl
local backBtn, wearLoader, wearBtn, cantWearBtn, wearScroll, contentText
local lastAxis = 0
local canClick
local wearRow = 5
local currentWearBtnName, wearItemBtnList, rotateTouch
local rotateSpeed = 5
local sceneController, gameController, heroPosition, heroLook, wearHeroId, wearIndex
local DholdTime = 0
local DholdInput = 0
local DholdDeltaTime = 0
local GholdTime = 0
local GholdInput = 0
local GholdDeltaTime = 0
local deltaTime = 0

function WearCtrl.ClosePanel()
	this.gameObject:SetActive(false)

	if wearHeroId then
		AudioCtrl.StopHeroAudio("hero" .. wearHeroId .. "/idle", "")
	end

	if gameController then
		gameController:ExitHeroWear()
	end

	UILayerCtrl.Pop()

	if backBtn.callback ~= nil then
		backBtn.callback()
	end

	inputMgr:SetInGameMode()
	inputMgr:SetPointerLocked(true)
end

function WearCtrl.OnCreate()
	this.loadFinish = false

	UILayerCtrl.Add("Wear", WearCtrl.ClosePanel)

	backBtn = this.mainComponent:GetButton("WearPanel_Bg_BackBtn")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		WearCtrl.ClosePanel()
	end)
	UILayerCtrl.AddIndividual("Wear", "WearPanel_Bg_BackBtn", backBtn)

	wearBtn = this.mainComponent:GetButton("WearPanel_Bg_RightPanel_ConfirnGroup_WearableBtn")

	wearBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		for k, v in pairs(wearItemBtnList) do
			if BattleData.ConvertHeroIdWithoutSkin(v.heroId) == BattleData.ConvertHeroIdWithoutSkin(wearHeroId) then
				v.wearGO:SetActive(v.wearIndex == wearIndex)

				if v.wearIndex == wearIndex then
					v.confirmLight:SetActive(false)
					v.confirmLight:SetActive(true)
				end
			end
		end

		AudioCtrl.SetUIAudio("player_info/level_up")
		wearBtn.gameObject:SetActive(false)
		FS_UserData.story:InitSelectSkin(wearHeroId, wearIndex)
	end)
	UILayerCtrl.AddIndividual("Wear", "WearPanel_Bg_RightPanel_ConfirnGroup_WearableBtn", wearBtn)

	cantWearBtn = this.mainComponent:GetButton("WearPanel_Bg_RightPanel_ConfirnGroup_WearLessBtn")

	cantWearBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOTH_LOCK, function()
			return
		end, function()
			return
		end, true)
	end)
	UILayerCtrl.AddIndividual("Wear", "WearPanel_Bg_RightPanel_ConfirnGroup_WearLessBtn", cantWearBtn)

	currentWearBtnName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearLessBtn"
	rotateTouch = this.mainComponent:GetButton("WearPanel_Bg_RotateTouch")

	rotateTouch:SetAudioEnable(false)
	rotateTouch:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		if gameController then
			gameController:RotatePlayer(data)
		end
	end)

	wearScroll = this.mainComponent:GetGameObject("WearPanel_Bg_RightPanel_WearList")
	wearScroll = XScrollRect:new(wearScroll)
	wearLoader = this.mainComponent:GetLoader("WearPanel_Bg_RightPanel_WearList_Viewport_Content")
	contentText = this.mainComponent:GetText("WearPanel_Bg_DesPanel_DesText")

	wearLoader:SetCacheNumMax(1, 60)

	wearLoader.loadCount = 20

	wearLoader:Load()
	this.gameObject:SetActive(false)

	this.loadFinish = true
end

function WearCtrl.Open(pos, look, backCB)
	sceneController = ST_Main.GetSceneController()
	gameController = sceneController:GetGameController()
	backBtn.callback = backCB
	heroLook = look
	heroPosition = pos

	this.gameObject:SetActive(true)
	UILayerCtrl.Push("Wear")
	WearCtrl.LoadWear()
	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
	TimeHelper.resetDeltaTime()
end

function WearCtrl.LoadWear()
	wearItemBtnList = {}

	local skinList = MS_StorySkin.GetSkinList()

	wearLoader.loadCount = #skinList

	function wearLoader.loadCallback(index, com, data)
		local btn = com:GetButton("Btn")

		btn:SetParentScroll(wearScroll)

		local name = com:GetText("Btn_WearName")

		name:SetContent(skinList[index].Title)

		btn.lockGO = com:GetGameObject("Btn_LockImg")
		btn.wearGO = com:GetGameObject("Btn_WearImg")
		btn.confirmLight = com:GetGameObject("Btn_Light")

		btn.confirmLight:SetActive(false)

		btn.wearIndex = skinList[index].SkinId % 1000
		btn.heroId = skinList[index].HeroId

		btn.wearGO:SetActive(FS_UserData.story:GetSelectSkin(BattleData.ConvertHeroIdWithoutSkin(btn.heroId)) == btn.wearIndex)

		if WearCtrl.CheckValid(btn.heroId) == false then
			btn.isLock = true

			btn.lockGO:SetActive(true)
		else
			btn.isLock = false

			btn.lockGO:SetActive(false)
		end

		table.insert(wearItemBtnList, btn)

		btn.image = XImage:new(btn.gameObject)

		function btn.setHighLightFunc(ishighLight)
			if ishighLight then
				local sprite = XObjectPool.GetIcon("wearLight" .. skinList[index].SkinId)

				btn.image:SetSprite(sprite)
			else
				local sprite = XObjectPool.GetIcon("wear" .. skinList[index].SkinId)

				btn.image:SetSprite(sprite)
			end
		end

		btn.setHighLightFunc(false)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for k, v in pairs(wearItemBtnList) do
				v.setHighLightFunc(false)
			end

			btn.setHighLightFunc(true)

			if btn.isLock then
				cantWearBtn.gameObject:SetActive(true)
				wearBtn.gameObject:SetActive(false)

				currentWearBtnName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearLessBtn"
			else
				cantWearBtn.gameObject:SetActive(false)
				wearBtn.gameObject:SetActive(FS_UserData.story:GetSelectSkin(BattleData.ConvertHeroIdWithoutSkin(btn.heroId)) ~= btn.wearIndex)

				currentWearBtnName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearableBtn"
			end

			UILayerCtrl.OnSelect("item" .. index)
			contentText:SetContent(skinList[index].Text)

			if wearHeroId then
				AudioCtrl.StopHeroAudio("hero" .. wearHeroId .. "/idle", "")
			end

			wearHeroId = btn.heroId
			wearIndex = btn.wearIndex

			if gameController then
				gameController:LoadHeroWear(wearHeroId, heroPosition, heroLook)
			end
		end)
		UILayerCtrl.AddButton("Wear", "item" .. index, btn)

		if index == 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "item" .. wearLoader.loadCount)
		end

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "item" .. index - 1)
		end

		if index < wearLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "item" .. index + 1)
		end

		if index == wearLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "item1")

			wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 1)

			UILayerCtrl.OnSelect("item1")
			UILayerCtrl.OnCursorClickMute()

			canClick = true
			this.loadFinish = true
		end
	end

	wearLoader:Load()
end

function WearCtrl.CheckValid(id)
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

function WearCtrl.DPadPress(pos)
	if DholdInput == 0 then
		local tname = UILayerCtrl.GetCurrentButtonName()

		UILayerCtrl.Select(pos)
		UILayerCtrl.OnCursorClick()

		DholdInput = pos

		if wearLoader.loadCount < wearRow + 1 then
			return
		end

		local row = tonumber(string.sub(tname, 5))
		local toprow = 1 + Mathf.Floor((1 - wearScroll.scrollRectCom.normalizedPosition.y) / (1 / (wearLoader.loadCount - wearRow)) + 0.5)
		local botrow = toprow + wearRow - 1

		if pos == XButton.Adjacent.DOWN and botrow <= row then
			if tname == "item" .. wearLoader.loadCount then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 1)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y - 1 / (wearLoader.loadCount - wearRow))
			end
		elseif pos == XButton.Adjacent.UP and row <= toprow then
			if tname == "item1" then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 0)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y + 1 / (wearLoader.loadCount - wearRow))
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

		if wearLoader.loadCount < wearRow + 1 then
			return
		end

		local row = tonumber(string.sub(tname, 5))
		local toprow = 1 + Mathf.Floor((1 - wearScroll.scrollRectCom.normalizedPosition.y) / (1 / (wearLoader.loadCount - wearRow)) + 0.5)
		local botrow = toprow + wearRow - 1

		if pos == XButton.Adjacent.DOWN and botrow <= row then
			if tname == "item" .. wearLoader.loadCount then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 1)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y - 1 / (wearLoader.loadCount - wearRow))
			end
		elseif pos == XButton.Adjacent.UP and row <= toprow then
			if tname == "item1" then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 0)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y + 1 / (wearLoader.loadCount - wearRow))
			end
		end
	end
end

function WearCtrl.GPadPress(pos)
	if GholdInput == 0 then
		local tname = UILayerCtrl.GetCurrentButtonName()

		UILayerCtrl.Select(pos)
		UILayerCtrl.OnCursorClick()

		GholdInput = pos

		if wearLoader.loadCount < wearRow + 1 then
			return
		end

		local row = tonumber(string.sub(tname, 5))
		local toprow = 1 + Mathf.Floor((1 - wearScroll.scrollRectCom.normalizedPosition.y) / (1 / (wearLoader.loadCount - wearRow)) + 0.5)
		local botrow = toprow + wearRow - 1

		if pos == XButton.Adjacent.DOWN and botrow <= row then
			if tname == "item" .. wearLoader.loadCount then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 1)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y - 1 / (wearLoader.loadCount - wearRow))
			end
		elseif pos == XButton.Adjacent.UP and row <= toprow then
			if tname == "item1" then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 0)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y + 1 / (wearLoader.loadCount - wearRow))
			end
		end
	end

	if GholdInput ~= pos or GholdTime == 0 then
		GholdTime = TimeHelper.getNowTimeNoScale()
	end

	GholdInput = pos
	GholdDeltaTime = TimeHelper.getNowTimeNoScale() - GholdTime

	if GholdDeltaTime > 0.5 then
		local tname = UILayerCtrl.GetCurrentButtonName()

		UILayerCtrl.Select(pos)
		UILayerCtrl.OnCursorClick()

		GholdTime = GholdTime + 0.15

		if wearLoader.loadCount < wearRow + 1 then
			return
		end

		local row = tonumber(string.sub(tname, 5))
		local toprow = 1 + Mathf.Floor((1 - wearScroll.scrollRectCom.normalizedPosition.y) / (1 / (wearLoader.loadCount - wearRow)) + 0.5)
		local botrow = toprow + wearRow - 1

		if pos == XButton.Adjacent.DOWN and botrow <= row then
			if tname == "item" .. wearLoader.loadCount then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 1)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y - 1 / (wearLoader.loadCount - wearRow))
			end
		elseif pos == XButton.Adjacent.UP and row <= toprow then
			if tname == "item1" then
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, 0)
			else
				wearScroll.scrollRectCom.normalizedPosition = Vector2.New(wearScroll.scrollRectCom.normalizedPosition.x, wearScroll.scrollRectCom.normalizedPosition.y + 1 / (wearLoader.loadCount - wearRow))
			end
		end
	end
end

function WearCtrl.Update()
	if not this.loadFinish then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "Wear" then
		deltaTime = TimeHelper.getDeltaTime()
	end

	WearCtrl.GamePadControl()
end

function WearCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if inputMgr and UILayerCtrl.GetCurrentLayerName() == "Wear" then
		local gameFps = 1 / deltaTime

		if not canClick then
			return
		end

		if inputMgr:GetButtonUp(GBKey.B) then
			UILayerCtrl.OnButtonClick("WearPanel_Bg_BackBtn")

			return
		elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnButtonClick(currentWearBtnName)
		end

		local nowSkillAxis = inputMgr:GetAxis("MoveY")

		if inputMgr:GetButton(LS_Setting.Btn.DD) or inputMgr:GetKey(KMKey.MOVES) or inputMgr:GetKey(KMKey.CAMPD) or inputMgr:GetKey(XKeyCode.DownArrow) then
			WearCtrl.DPadPress(2)
		elseif inputMgr:GetButton(LS_Setting.Btn.DU) or inputMgr:GetKey(KMKey.MOVEW) or inputMgr:GetKey(KMKey.CAMPU) or inputMgr:GetKey(XKeyCode.UpArrow) then
			WearCtrl.DPadPress(1)
		elseif inputMgr:GetButton(LS_Setting.Btn.DR) or inputMgr:GetKey(KMKey.MOVED) or inputMgr:GetKey(KMKey.CAMYR) or inputMgr:GetKey(XKeyCode.RightArrow) then
			if gameController then
				gameController:RotatePlayer(-rotateSpeed, true, gameFps)
			end
		elseif (inputMgr:GetButton(LS_Setting.Btn.DL) or inputMgr:GetKey(KMKey.MOVEA) or inputMgr:GetKey(KMKey.CAMYL) or inputMgr:GetKey(XKeyCode.LeftArrow)) and gameController then
			gameController:RotatePlayer(rotateSpeed, true, gameFps)
		end

		if nowSkillAxis > 0.38 then
			WearCtrl.GPadPress(1)
		end

		if nowSkillAxis < -0.38 then
			WearCtrl.GPadPress(2)
		end

		lastAxis = nowSkillAxis

		if inputMgr:GetButtonUp(LS_Setting.Btn.DD) or inputMgr:GetButtonUp(LS_Setting.Btn.DU) or inputMgr:GetKeyUp(KMKey.MOVEW) or inputMgr:GetKeyUp(KMKey.MOVES) or inputMgr:GetKeyUp(KMKey.CAMPU) or inputMgr:GetKeyUp(KMKey.CAMPD) or inputMgr:GetKeyUp(XKeyCode.UpArrow) or inputMgr:GetKeyUp(XKeyCode.DownArrow) then
			DholdTime = 0
			DholdInput = 0
			DholdDeltaTime = 0
		end

		if nowSkillAxis > -0.38 and nowSkillAxis < 0.38 then
			GholdTime = 0
			GholdInput = 0
			GholdDeltaTime = 0
		end

		local nowXAxis = inputMgr:GetAxis(LS_Setting.Btn.MX)

		if nowXAxis > 0.38 and gameController then
			gameController:RotatePlayer(-rotateSpeed, true, gameFps)
		end

		if nowXAxis < -0.38 and gameController then
			gameController:RotatePlayer(rotateSpeed, true, gameFps)
		end
	end
end

return WearCtrl
