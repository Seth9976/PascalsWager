-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/MazeCtrl.lua

MazeCtrl = class("MazeCtrl", UICtrlBase)
MazeCtrl.static.Name = "Maze"
MazeCtrl.static.Layer = {
	Sub = "MazeSub",
	Main = "MazeMain"
}
MazeCtrl.static.Panel = {
	Sub = 2,
	Main = 1
}

local this = MazeCtrl
local panels, heroData, loaderHero
local selectedIdx = 1
local selectedHeroCount = 0
local selectedHeroCountTemp = 0
local selectedHeroTemp = {
	0,
	0
}
local selectedHeroBackup = {
	0,
	0
}
local selectedHero = {
	0,
	0
}
local selectedHeroIdx = {
	0,
	0
}
local standPosition = {
	Vector3.zero,
	Vector3.zero
}
local standOrientation = {
	Vector4.zero,
	Vector4.zero
}
local sceneController, gameController

function MazeCtrl.ClosePanel()
	MazeCtrl.SaveHeroList()
	UIManager.Close(MazeCtrl.Name)
	UILayerCtrl.Pop()
	UIManager.SendMessage("Mainmenu", "FadeIn", 0.3, true)
	UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0)
	inputMgr:SetInGameMode()
	inputMgr:SetPointerLocked(true)
end

function MazeCtrl.CloseSubPanel()
	MazeCtrl.SelectHerosTemp(selectedHeroBackup[1], selectedHeroBackup[2])
	MazeCtrl.UnfocusOnHero()
end

function MazeCtrl.OnCreate()
	panels = {}

	UILayerCtrl.Add("UIOff")
	UILayerCtrl.Add(MazeCtrl.Layer.Main, MazeCtrl.ClosePanel)
	UILayerCtrl.Add(MazeCtrl.Layer.Sub, MazeCtrl.CloseSubPanel)

	sceneController = ST_Main.GetSceneController()
	gameController = sceneController:GetGameController()

	UIManager.SendMessage("Mainmenu", "FadeOut", 0.3, true)
	UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0)

	local panelMain = {}

	panels[MazeCtrl.Panel.Main] = panelMain
	panelMain.show = true
	panelMain.go = this.mainComponent:GetGameObject("Maze_Main")
	panelMain.button = {}

	local navBar = {}

	panelMain.navBar = navBar
	navBar.go = this.mainComponent:GetGameObject("Maze_Main_NavBar_RB")
	navBar.rectTf = navBar.go:GetComponent("RectTransform")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(navBar.rectTf)

	navBar.KeyboardGo = this.mainComponent:GetGameObject("Maze_Main_KeyboardNavBar_RB")
	navBar.KeyboardRectTf = navBar.KeyboardGo:GetComponent("RectTransform")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(navBar.KeyboardRectTf)

	local btnClose = this.mainComponent:GetButton("Maze_Main_BtnClose")

	btnClose:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btnClose:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		MazeCtrl.ClosePanel()
	end)
	btnClose:SetAudioType(AudioCtrl.ButtonClickType.Back)
	UILayerCtrl.AddIndividual(MazeCtrl.Layer.Main, "Maze_Main_BtnClose", btnClose)

	panelMain.btnClose = btnClose

	local btnCount = 2
	local btnPrefix = "Maze_Main_BtnHero"
	local icoPrefix = "Maze_Main_IcoHero"

	for idx = 1, btnCount do
		local btnName = string.format("%s%d", btnPrefix, idx)
		local btnHero = this.mainComponent:GetButton(btnName)

		UILayerCtrl.AddButton(MazeCtrl.Layer.Main, btnName, btnHero)

		btnHero.icon = this.mainComponent:GetGameObject(string.format("%s%d", icoPrefix, idx))
		btnHero.imgIcon = XImage:new(btnHero.icon)

		btnHero.icon:SetActive(true)

		if idx > 1 then
			btnHero:SetAdjacent(XButton.Adjacent.LEFT, string.format("%s%d", btnPrefix, (idx - 2 + btnCount) % btnCount + 1))
		end

		if idx < btnCount then
			btnHero:SetAdjacent(XButton.Adjacent.RIGHT, string.format("%s%d", btnPrefix, (idx + btnCount) % btnCount + 1))
		end

		btnHero.showSel = false
		btnHero.selLight = this.mainComponent:GetGameObject(string.format("%s%dSel", btnPrefix, idx))

		btnHero.selLight:SetActive(btnHero.showSel)
		btnHero:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			selectedIdx = idx
			panelMain.selBtn = string.format("%s%d", btnPrefix, idx)

			UILayerCtrl.OnSelect(panelMain.selBtn)
			this.FocusOnHero()
		end)

		panelMain.button[idx] = btnHero
	end

	selectedIdx = 1
	panelMain.selBtn = string.format("%s%d", btnPrefix, selectedIdx)

	UILayerCtrl.Push(MazeCtrl.Layer.Main, panelMain.selBtn)

	local panelSub = {}

	panels[MazeCtrl.Panel.Sub] = panelSub
	panelSub.go = this.mainComponent:GetGameObject("Maze_Sub")
	panelSub.show = false

	panelSub.go:SetActive(panelSub.show)

	local navBar = {}

	panelSub.navBar = navBar
	navBar.go = this.mainComponent:GetGameObject("Maze_Sub_KeyboardNavBar_RB")
	navBar.rectTf = navBar.go:GetComponent("RectTransform")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(navBar.rectTf)

	local mskPrefix = "Maze_Sub_StatusMark"
	local status = {}

	for idx = 1, btnCount do
		status[idx] = this.mainComponent:GetGameObject(string.format("%s%d", mskPrefix, idx))

		status[idx]:SetActive(false)
	end

	panelSub.status = status

	local btnOk = this.mainComponent:GetButton("Maze_Sub_BtnOk")

	btnOk:SetAudioType(AudioCtrl.ButtonClickType.None)
	btnOk:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AudioCtrl.SetUIAudio("player_info/point_add")
		MazeCtrl.UpdateSelectedHeroIdx()
		this.UnfocusOnHero()
	end)
	UILayerCtrl.AddIndividual(MazeCtrl.Layer.Sub, "Maze_Sub_BtnOk", btnOk)

	panelSub.btnOk = btnOk

	local btnUnload = this.mainComponent:GetButton("Maze_Sub_BtnUnload")

	btnUnload:SetAudioType(AudioCtrl.ButtonClickType.None)
	btnUnload:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AudioCtrl.SetUIAudio("unable")
		this.ShowHero(selectedIdx, 0)
		MazeCtrl.UpdateSelectedHeroIdx()
		this.UnfocusOnHero()
	end)
	UILayerCtrl.AddIndividual(MazeCtrl.Layer.Sub, "Maze_Sub_BtnUnload", btnUnload)

	panelSub.btnUnload = btnUnload

	local btnBack = this.mainComponent:GetButton("Maze_Sub_BtnBack")

	btnBack:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		MazeCtrl.CloseSubPanel()
	end)
	UILayerCtrl.AddIndividual(MazeCtrl.Layer.Sub, "Maze_Sub_BtnBack", btnBack)

	panelSub.btnBack = btnBack
	panelSub.scrollRect = XScrollRect:new(this.mainComponent:GetGameObject("Maze_Sub_Scroll"))
	panelSub.btnGroup = XGroup:new()

	panelSub.btnGroup:SetMode(XGroup.GroupMode.Button)

	loaderHero = this.mainComponent:GetLoader("Maze_Sub_ScrollContent")

	if loaderHero then
		loaderHero.loadFinished = false
		loaderHero.loadCount = 0
		loaderHero.loadStepping = 0

		function loaderHero.loadCallback(index, com, data)
			local heroId = data[index]

			if heroId ~= nil then
				local btn = com:GetButton("ButtonSelect")

				UILayerCtrl.AddButton(MazeCtrl.Layer.Sub, "Maze_Sub_Btn" .. index, btn)
				panelSub.btnGroup:Add(btn)
				btn:SetAudioType(AudioCtrl.ButtonClickType.MapSelect)
				btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					UILayerCtrl.OnSelect(string.format("Maze_Sub_Btn%d", index))

					local othIdx = selectedIdx % 2 + 1
					local tempSel = SystemHelper.DeepCopy(selectedHeroTemp)

					tempSel[selectedIdx] = heroId

					if tempSel[othIdx] == heroId then
						tempSel[othIdx] = 0
					elseif heroId ~= selectedHeroBackup[othIdx] then
						tempSel[othIdx] = selectedHeroBackup[othIdx]
					end

					local count = 0

					for idx = 1, 2 do
						count = count + (tempSel[idx] > 0 and 1 or 0)
					end

					panelSub.btnUnload.gameObject:SetActive(count > 1)
					MazeCtrl.SelectHerosTemp(tempSel[1], tempSel[2])
				end)
				btn:SetParentScroll(panelSub.scrollRect)

				if index > 1 then
					btn:SetAdjacent(XButton.Adjacent.UP, string.format("Maze_Sub_Btn%d", index - 1))
				end

				if index < loaderHero.loadCount then
					btn:SetAdjacent(XButton.Adjacent.DOWN, string.format("Maze_Sub_Btn%d", index + 1))
				end

				local icon = com:GetGameObject("ImageHero")
				local img = XImage:new(icon)
				local sprite = XObjectPool.GetIcon("photo" .. BattleData.ConvertHeroIdWithSkin(heroId))

				if sprite ~= nil then
					img:SetSprite(sprite)
				end

				loaderHero.loadStepping = loaderHero.loadStepping + 1

				if loaderHero.loadStepping == loaderHero.loadCount then
					loaderHero.loadFinished = true
					this.loadFinish = true
				end
			else
				SystemHelper.LogError("Sth. Wrong. Index is out of range.")
			end
		end
	end

	local heroCount = this.InitHeroList()

	if heroCount == 1 then
		local btn2 = panelMain.button[2]

		btn2:SetDisabled(true)
	else
		local btn2 = panelMain.button[2]

		btn2:SetNormal()
	end

	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
	TimeHelper.resetDeltaTime()
end

function MazeCtrl.NextAvailableHeroIdx()
	local availableIdx = 1
	local checkList = {}
	local count = loaderHero.loadCount

	for idx = 1, count do
		checkList[idx] = 0
	end

	for posIdx = 1, 2 do
		if selectedHeroIdx[posIdx] > 0 then
			checkList[selectedHeroIdx[posIdx]] = posIdx
		end
	end

	for idx = 1, count do
		if checkList[idx] == 0 then
			return idx
		end
	end

	return 0
end

function MazeCtrl.GetSelectedHeroCountTemp()
	local count = 0

	for idx = 1, 2 do
		count = count + (selectedHeroTemp[idx] > 0 and 1 or 0)
	end

	return count
end

function MazeCtrl.UpdateSelectedHeroIdx()
	local heroCount = loaderHero.loadCount
	local panelMain = panels[MazeCtrl.Panel.Main]

	selectedHeroCountTemp = 0

	for posIdx = 1, 2 do
		local heroId = selectedHeroTemp[posIdx]
		local btn = panelMain.button[posIdx]

		if heroId > 0 then
			for idx = 1, heroCount do
				if heroId == heroData[idx] then
					selectedHeroIdx[posIdx] = idx

					break
				end
			end

			selectedHeroCountTemp = selectedHeroCountTemp + 1

			btn.icon:SetActive(false)
		else
			selectedHeroIdx[posIdx] = 0

			btn.icon:SetActive(true)
		end
	end
end

function MazeCtrl.ShowSub(show)
	local panelMain = panels[MazeCtrl.Panel.Main]
	local panelSub = panels[MazeCtrl.Panel.Sub]

	if panelMain ~= nil and panelSub ~= nil and panelMain.show == show and panelSub.show ~= show then
		panelMain.show = not show

		panelMain.go:SetActive(panelMain.show)

		panelSub.show = show

		panelSub.go:SetActive(panelSub.show)
		panelSub.status[selectedIdx]:SetActive(panelSub.show)

		selectedHeroCountTemp = MazeCtrl.GetSelectedHeroCountTemp()

		if show then
			selectedHeroBackup = SystemHelper.DeepCopy(selectedHeroTemp)

			local btnIdx = selectedHeroIdx[selectedIdx]

			if btnIdx == 0 then
				btnIdx = this.NextAvailableHeroIdx()
			end

			UILayerCtrl.Push(MazeCtrl.Layer.Sub, "Maze_Sub_Btn" .. btnIdx)
			UILayerCtrl.OnCursorClick()
			panelSub.btnUnload.gameObject:SetActive(selectedHeroCountTemp > 1)
		else
			UILayerCtrl.Pop()
		end
	end
end

function MazeCtrl.SetupScene(standPosition1, standOrientation1, standPosition2, standOrientation2)
	standPosition[1] = standPosition1
	standOrientation[1] = standOrientation1
	standPosition[2] = standPosition2
	standOrientation[2] = standOrientation2
	selectedHeroIdx = {
		0,
		0
	}

	if gameController then
		local hostHeroId = FS_UserData.story:GetSelectHeroIdNow()

		selectedHero = FS_UserData.story:GetHeroSelectList()
		selectedHeroCount = 0

		local heroCount = loaderHero.loadCount
		local panelMain = panels[MazeCtrl.Panel.Main]

		if panelMain ~= nil then
			for posIdx = 1, 2 do
				local heroId = selectedHero[posIdx]

				if heroId == nil then
					selectedHero[posIdx] = 0
				elseif heroId > 0 then
					selectedHeroCount = selectedHeroCount + 1

					for idx = 1, heroCount do
						if heroId == heroData[idx] then
							selectedHeroIdx[posIdx] = idx

							break
						end
					end
				end
			end

			selectedHeroCountTemp = selectedHeroCount

			local btn = panelMain.button[2]

			if heroCount <= 1 then
				btn.gameObject:SetActive(false)
			else
				btn.gameObject:SetActive(true)

				if hostHeroId ~= selectedHero[1] then
					local tempHeroId = selectedHero[1]

					selectedHero[1] = selectedHero[2]
					selectedHero[2] = tempHeroId

					local tempHeroIdx = selectedHeroIdx[1]

					selectedHeroIdx[1] = selectedHeroIdx[2]
					selectedHeroIdx[2] = tempHeroIdx
				end
			end

			selectedHeroTemp = SystemHelper.DeepCopy(selectedHero)

			for posIdx = 1, 2 do
				local heroId = selectedHero[posIdx]
				local btn = panelMain.button[posIdx]

				if heroId == 0 then
					btn.icon:SetActive(true)
				elseif heroId > 0 then
					btn.icon:SetActive(false)
					this.ShowHero(posIdx, heroId, true)
				end
			end
		end
	end
end

function MazeCtrl.CheckValid(id)
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

function MazeCtrl.InitHeroList()
	local heroSrc = MS_HeroData.GetEnableHeroIdList()

	heroData = {}

	local heroCount = #heroSrc

	for i = 1, heroCount do
		heroData[i] = heroSrc[i]
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true and FS_UserData.story then
		local story = FS_UserData.story

		for i = heroCount, 1, -1 do
			local heroId = heroData[i]

			if not story:CheckHeroEnable(heroId) then
				table.remove(heroData, i)

				heroCount = heroCount - 1
			end
		end
	end

	loaderHero.loadCount = heroCount
	loaderHero.loadStepping = 0
	loaderHero.loadFinished = false

	loaderHero:Load(heroData)

	return heroCount
end

function MazeCtrl.SaveHeroList()
	if gameController then
		local actIdx = 1

		selectedHero[1] = 0
		selectedHero[2] = 0

		for idx = 1, 2 do
			local selHeroId = selectedHeroTemp[idx]

			if selHeroId > 0 then
				selectedHero[actIdx] = selHeroId
				actIdx = actIdx + 1
			end
		end

		this.ShowHero(1, 0)
		this.ShowHero(2, 0)
		gameController:CloseBonefire(selectedHero[1], selectedHero[2])
	end
end

function MazeCtrl.ShowHero(posIdx, heroId, refresh)
	if selectedHeroTemp[posIdx] ~= heroId or refresh then
		local prevHeroId = selectedHeroTemp[posIdx]

		selectedHeroTemp[posIdx] = heroId

		if prevHeroId > 0 then
			AudioCtrl.StopHeroAudio(string.format("hero%d/idle", prevHeroId), "")
		end

		gameController:LoadHeroInMaze(posIdx, 0)

		if heroId > 0 then
			if heroId > 0 then
				AudioCtrl.SetHeroAudio(string.format("hero%d/idle", heroId), nil, "")
			end

			gameController:LoadHeroInMaze(posIdx, heroId, standPosition[posIdx], standOrientation[posIdx])
		end
	end
end

function MazeCtrl.SelectHerosTemp(heroId1, heroId2)
	if selectedIdx == 1 then
		if heroId2 == 0 then
			this.ShowHero(2, heroId2)
			this.ShowHero(1, heroId1)
		else
			this.ShowHero(1, heroId1)
			this.ShowHero(2, heroId2)
		end
	elseif heroId1 == 0 then
		this.ShowHero(1, heroId1)
		this.ShowHero(2, heroId2)
	else
		this.ShowHero(2, heroId2)
		this.ShowHero(1, heroId1)
	end
end

function MazeCtrl.ShowPnlMain(show)
	local panelMain = panels[MazeCtrl.Panel.Main]

	if panelMain ~= nil and panelMain.show ~= show then
		panelMain.show = show

		panelMain.go:SetActive(show)

		return true
	end

	return false
end

function MazeCtrl.ShowPnlSub(show)
	local panelSub = panels[MazeCtrl.Panel.Sub]

	if panelSub ~= nil and panelSub.show ~= show then
		panelSub.show = show

		panelSub.go:SetActive(show)
		panelSub.status[selectedIdx]:SetActive(show)

		if show then
			selectedHeroBackup = SystemHelper.DeepCopy(selectedHeroTemp)

			local btnIdx = selectedHeroIdx[selectedIdx]

			if btnIdx == 0 then
				btnIdx = this.NextAvailableHeroIdx()
			end

			UILayerCtrl.Push(MazeCtrl.Layer.Sub, string.format("Maze_Sub_Btn%d", btnIdx))
			UILayerCtrl.OnCursorClick()
			panelSub.btnUnload.gameObject:SetActive(this.GetSelectedHeroCountTemp() > 1)
		else
			UILayerCtrl.Pop()
		end

		return true
	end

	return false
end

function MazeCtrl.FocusOnHero()
	if gameController ~= nil and MazeCtrl.ShowPnlMain(false) then
		UILayerCtrl.Push("UIOff")
		gameController:MoveBonefireCamera(selectedIdx, false, function()
			UILayerCtrl.Pop()
			MazeCtrl.ShowPnlSub(true)
		end)
	end
end

function MazeCtrl.UnfocusOnHero()
	if gameController ~= nil and MazeCtrl.ShowPnlSub(false) then
		UILayerCtrl.Push("UIOff")
		gameController:MoveBonefireCamera(selectedIdx, true, function()
			UILayerCtrl.Pop()
			MazeCtrl.ShowPnlMain(true)
		end)
	end
end

function MazeCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function MazeCtrl.JPadPress(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName ~= nil then
		if lName == MazeCtrl.Layer.Main then
			if dir == XButton.Adjacent.LEFT or dir == XButton.Adjacent.RIGHT then
				UILayerCtrl.Select(dir)
				UILayerCtrl.OnCursorMove()
			end
		elseif lName == MazeCtrl.Layer.Sub and (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) then
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorClick()
		end
	end
end

function MazeCtrl.DPadPress(dir)
	if UILayerCtrl.IsProcessed() then
		return
	end

	this.JPadPress(dir)
end

function MazeCtrl.GamePadControl()
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName ~= nil then
		if lName == MazeCtrl.Layer.Main then
			if inputMgr:GetButtonUp(GBKey.B) then
				UILayerCtrl.OnButtonClick("Maze_Main_BtnClose")
			elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnCursorClick()
			end
		elseif lName == MazeCtrl.Layer.Sub then
			if inputMgr:GetButtonUp(GBKey.X) or inputMgr:GetKeyDown(XKeyCode.R) then
				UILayerCtrl.OnButtonClick("Maze_Sub_BtnUnload")
			elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
				UILayerCtrl.OnButtonClick("Maze_Sub_BtnOk")
			end
		end
	end
end

return MazeCtrl
