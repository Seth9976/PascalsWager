-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/RoomCtrl.lua

RoomCtrl = class("RoomCtrl", UICtrlBase)

local this = RoomCtrl
local sceneController, selectPanel, roomMainPanel, teamPanel, roomPanel, selectAIPanel, modeName, modeNameEn
local friendLoaderCount = 0
local team1LoaderCount = 0
local team2LoaderCount = 0
local teamLoaderCount = 0
local selectAiLoaderCount = 0
local TeamLoader, friendLoader, Team1Loader, Team2Loader, selectAILoader, friendList, confirmBtn, confirmText, elist, flist

function RoomCtrl.OnCreate()
	this.loadFinish = false
	friendLoaderCount = 0
	teamLoaderCount = 0
	team1LoaderCount = 0
	team2LoaderCount = 0
	selectAiLoaderCount = 0

	UILayerCtrl.Add("RoomPanel_SelectPanel")
	UILayerCtrl.Add("RoomPanel_RoomMainPanel")
	UILayerCtrl.Add("RoomPanel_SelectAIPanel")

	sceneController = ST_Lobby.GetSceneController()
	friendLoader = this.mainComponent:GetLoader("RoomPanel_RoomMainPanel_BG_ListBG_FriendList_ViewPort_Content")
	TeamLoader = this.mainComponent:GetLoader("RoomPanel_RoomMainPanel_BG_Team_Layout")
	Team1Loader = this.mainComponent:GetLoader("RoomPanel_RoomMainPanel_BG_Room_Team1Layout")
	Team2Loader = this.mainComponent:GetLoader("RoomPanel_RoomMainPanel_BG_Room_Team2Layout")
	selectAILoader = this.mainComponent:GetLoader("RoomPanel_SelectAIPanel_SelectBoard_SelectScroll_Viewport_Content")
	selectPanel = this.mainComponent:GetGameObject("RoomPanel_SelectPanel")

	local duelBtn = this.mainComponent:GetButton("RoomPanel_SelectPanel_DuelBtn")
	local dominationBtn = this.mainComponent:GetButton("RoomPanel_SelectPanel_Domination")
	local collaborationBtn = this.mainComponent:GetButton("RoomPanel_SelectPanel_Collaboration")
	local closeBtn = this.mainComponent:GetButton("RoomPanel_Close")

	duelBtn:SetAdjacent(XButton.Adjacent.RIGHT, "RoomPanel_SelectPanel_Domination")
	dominationBtn:SetAdjacent(XButton.Adjacent.LEFT, "RoomPanel_SelectPanel_DuelBtn")
	dominationBtn:SetAdjacent(XButton.Adjacent.RIGHT, "RoomPanel_SelectPanel_Collaboration")
	collaborationBtn:SetAdjacent(XButton.Adjacent.LEFT, "RoomPanel_SelectPanel_Domination")

	local friendBtn = this.mainComponent:GetButton("RoomPanel_RoomMainPanel_BG_ListBG_FriendBtn")
	local nearBtn = this.mainComponent:GetButton("RoomPanel_RoomMainPanel_BG_ListBG_NearBtn")

	UILayerCtrl.AddIndividual("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ListBG_FriendBtn", friendBtn)
	UILayerCtrl.AddIndividual("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ListBG_NearBtn", nearBtn)
	duelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		BattleData.SetBattleType(BattleData.Type.PVE_Custom)
		modeName:SetGameTextContent(function()
			return GameText.UI_ROOM_DUEl
		end)
		modeNameEn:SetContent("DUEL")
		selectPanel:SetActive(false)
		roomMainPanel:SetActive(true)
		roomPanel:SetActive(true)
		friendBtn:SetHighlighted()

		Team1Loader.loadCount = 1
		Team2Loader.loadCount = 1

		RoomCtrl.InitRoomAIList(Team1Loader.loadCount, Team2Loader.loadCount)
		Team1Loader:Load()
		Team2Loader:Load()
		UILayerCtrl.Pop()
		UILayerCtrl.Push("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ConfirmBtn")
	end)
	dominationBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		BattleData.SetBattleType(BattleData.Type.PVE_Custom)
		modeName:SetGameTextContent(function()
			return GameText.UI_ROOM_DOMINATION
		end)
		modeNameEn:SetContent("DOMINATION")
		selectPanel:SetActive(false)
		roomMainPanel:SetActive(true)
		roomPanel:SetActive(true)
		friendBtn:SetHighlighted()

		Team1Loader.loadCount = 3
		Team2Loader.loadCount = 3

		RoomCtrl.InitRoomAIList(Team1Loader.loadCount, Team2Loader.loadCount)
		Team1Loader:Load()
		Team2Loader:Load()
		UILayerCtrl.Pop()
		UILayerCtrl.Push("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ConfirmBtn")
	end)
	collaborationBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)
	closeBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	closeBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		RoomCtrl.OnClose()
		LobbyMainCtrl.CloseDialog()
	end)
	UILayerCtrl.AddButton("RoomPanel_SelectPanel", "RoomPanel_SelectPanel_DuelBtn", duelBtn)
	UILayerCtrl.AddButton("RoomPanel_SelectPanel", "RoomPanel_SelectPanel_Domination", dominationBtn)
	UILayerCtrl.AddButton("RoomPanel_SelectPanel", "RoomPanel_SelectPanel_Collaboration", collaborationBtn)
	UILayerCtrl.AddIndividual("RoomPanel_SelectPanel", "RoomPanel_Close", closeBtn)

	roomMainPanel = this.mainComponent:GetGameObject("RoomPanel_RoomMainPanel")
	teamPanel = this.mainComponent:GetGameObject("RoomPanel_RoomMainPanel_BG_Team")
	roomPanel = this.mainComponent:GetGameObject("RoomPanel_RoomMainPanel_BG_Room")

	UILayerCtrl.AddIndividual("RoomPanel_RoomMainPanel", "RoomPanel_Close", closeBtn)

	friendList = FS_Buddy.GetOnlineFriendList()
	friendLoader.loadCount = #friendList

	function friendLoader.loadCallback(index, com, data)
		this.OnLoadFriendFinish(index, com)

		friendLoaderCount = friendLoaderCount + 1

		RoomCtrl.IsUiLoaded()
	end

	friendLoader:Load()

	function Team1Loader.loadCallback(index, com)
		if index == 1 then
			com:GetText("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_Text"):SetContent(FS_UserData.playerList:GetPlayer():GetName())

			local por = com:GetButton("BG_Portrait")
			local img = XImage:new(por.gameObject)

			XObjectPool.SetPortraitIcon(FS_UserData.playerList:GetPlayer():GetIcon(), FS_UserData.playerList:GetPlayer():GetIconUrl(), img)

			local addAIBtn = com:GetButton("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_BG_AddBtn")

			por.gameObject:SetActive(true)
			addAIBtn.gameObject:SetActive(false)
		else
			local nameText = com:GetText("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_Text")
			local por = com:GetButton("BG_Portrait")

			por.gameObject:SetActive(false)

			local isAI = com:GetGameObject("BG_Portrait_IsAI")
			local deleteBtn = com:GetButton("BG_Portrait_Delete")
			local addAIBtn = com:GetButton("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_BG_AddBtn")

			addAIBtn.gameObject:SetActive(true)
			addAIBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				RoomCtrl.AddAICallback(por, deleteBtn, addAIBtn, isAI, nameText, 1, index - 1)
			end)
		end

		team1LoaderCount = team1LoaderCount + 1

		RoomCtrl.IsUiLoaded()
	end

	function Team2Loader.loadCallback(index, com)
		local nameText = com:GetText("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_Text")
		local por = com:GetButton("BG_Portrait")

		por.gameObject:SetActive(false)

		local isAI = com:GetGameObject("BG_Portrait_IsAI")
		local deleteBtn = com:GetButton("BG_Portrait_Delete")
		local addAIBtn = com:GetButton("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_BG_AddBtn")

		addAIBtn.gameObject:SetActive(true)
		addAIBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			RoomCtrl.AddAICallback(por, deleteBtn, addAIBtn, isAI, nameText, 2, index)
		end)
		UILayerCtrl.AddIndividual("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_BG_AddBtn", addAIBtn)

		team2LoaderCount = team2LoaderCount + 1

		RoomCtrl.IsUiLoaded()
	end

	modeName = this.mainComponent:GetText("RoomPanel_RoomMainPanel_BG_Room_VS_modeName")
	modeNameEn = this.mainComponent:GetText("RoomPanel_RoomMainPanel_BG_Room_VS_en")
	confirmBtn = this.mainComponent:GetButton("RoomPanel_RoomMainPanel_BG_ConfirmBtn")
	confirmText = this.mainComponent:GetText("RoomPanel_RoomMainPanel_BG_ConfirmBtn_Text")

	confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if this.haveEmptyPlayer() then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ROOM_HAVEEMPTY, function()
				BattleData.InitCustomAIList(flist, elist)
				UILayerCtrl.Pop()
				UIManager.Close("Room")
				UIManager.SendMessage("LobbyMain", "CloseDialog")
				UIManager.SendMessage("LobbyMain", "ChooseMode", false)
			end, function()
				return
			end)
		else
			BattleData.InitCustomAIList(flist, elist)
			UILayerCtrl.Pop()
			UIManager.Close("Room")
			UIManager.SendMessage("LobbyMain", "CloseDialog")
			UIManager.SendMessage("LobbyMain", "ChooseMode", false)
		end
	end)
	UILayerCtrl.AddButton("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ConfirmBtn", confirmBtn)

	selectAIPanel = this.mainComponent:GetGameObject("RoomPanel_SelectAIPanel")

	local selectAIPanelBtn = this.mainComponent:GetButton("RoomPanel_SelectAIPanel_BackBtn")

	selectAIPanelBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	selectAIPanelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		selectAIPanel:SetActive(false)
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddIndividual("RoomPanel_SelectAIPanel", "RoomPanel_SelectAIPanel_BackBtn", selectAIPanelBtn)

	local animallist = MS_HeroData.GetSelectHeroIdList()

	if DebugMonsterAI then
		animallist = MS_HeroData.GetEnableAnimalIdList()
	end

	selectAILoader.loadCount = #animallist

	function selectAILoader.loadCallback(index, com)
		local heroId = animallist[index]
		local heroData = MS_HeroData.GetHero(heroId)

		if heroData ~= nil then
			local heroBtn = com:GetButton("Loader_SelectAIItem_Image")
			local img = XImage:new(heroBtn.gameObject)
			local sprite = XObjectPool.GetIcon("photo" .. heroId)

			if sprite ~= nil then
				img:SetSprite(sprite)
			end

			if heroData.Name ~= "" then
				com:GetText("Loader_SelectAIItem_Name"):SetContent(heroData.Name)
			else
				com:GetText("Loader_SelectAIItem_Name"):SetContent(heroData.HeroId)
			end
		end

		selectAiLoaderCount = selectAiLoaderCount + 1

		RoomCtrl.IsUiLoaded()
	end

	selectAILoader:Load()
	selectPanel:SetActive(true)
	roomMainPanel:SetActive(false)
	selectAIPanel:SetActive(false)
	UILayerCtrl.Push("RoomPanel_SelectPanel", "RoomPanel_SelectPanel_DuelBtn")
end

function RoomCtrl.OnClose()
	UIManager.Close("Room")
	UIManager.SendMessage("LobbyMain", "CloseDialog")
	UILayerCtrl.Pop()
end

function RoomCtrl.OnLoadFriendFinish(index, com)
	com:GetText("Loader_InviteItem_BG_Text"):SetContent(friendList[index].name)

	local img = XImage:new(com:GetGameObject("BG_Portrait"))

	XObjectPool.SetPortraitIcon(friendList[index].icon, friendList[index].iconUrl, img)

	local inviteBtn = com:GetButton("Loader_InviteItem_BG_InviteBtn")
end

function RoomCtrl.UpdateFriendList()
	return
end

function RoomCtrl.AddAICallback(portraitBtn, deleteBtn, addAIBtn, isAIGO, nameText, team, teamindex)
	selectAIPanel:SetActive(true)

	local count = selectAILoader.loadCount
	local rowMax = (count - 1) % 2 + math.floor((count - 1) / 2)

	for index = 1, count do
		local heroBtn = selectAILoader:GetChild(index):GetButton("Loader_SelectAIItem_Image")

		heroBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local heroId = 0
			local heroList = MS_HeroData.GetSelectHeroIdList()

			heroId = heroList[index]

			if DebugMonsterAI then
				local animallist = MS_HeroData.GetEnableAnimalIdList()

				heroId = animallist[index]
			end

			local heroData = MS_HeroData.GetHero(heroId)

			if heroData.Enable <= 0 then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CHOOSEHERO_NOTOPEN)

				return
			end

			local img1 = XImage:new(portraitBtn.gameObject)
			local sprite1 = XObjectPool.GetIcon("photo" .. heroId)

			if sprite1 ~= nil then
				img1:SetSprite(sprite1)
			end

			nameText:SetContent("电脑(睿智的)")
			selectAIPanel:SetActive(false)
			UILayerCtrl.Pop()
			portraitBtn.gameObject:SetActive(true)
			portraitBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				RoomCtrl.AddAICallback(portraitBtn, deleteBtn, addAIBtn, isAIGO, nameText, team, teamindex)
			end)
			RoomCtrl.SetBattleData(heroId, team, teamindex)
			addAIBtn.gameObject:SetActive(false)
			isAIGO:SetActive(true)
			deleteBtn.gameObject:SetActive(true)
			deleteBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				addAIBtn.gameObject:SetActive(true)
				isAIGO:SetActive(false)
				portraitBtn.gameObject:SetActive(false)
				RoomCtrl.SetBattleData(0, team, teamindex)
				deleteBtn.gameObject:SetActive(false)
			end)
		end)

		local row = (index - 1) % 2
		local col = math.floor((index - 1) / 2)

		UILayerCtrl.AddButton("RoomPanel_SelectAIPanel", "Hero" .. index, heroBtn)
	end

	UILayerCtrl.Push("RoomPanel_SelectAIPanel", "Hero1")
end

function RoomCtrl.SetBattleData(heroId, team, index)
	if team == 1 then
		if flist[index] ~= nil then
			flist[index] = tonumber(heroId)
		end
	elseif team == 2 and elist[index] ~= nil then
		elist[index] = tonumber(heroId)
	end
end

function RoomCtrl.haveEmptyPlayer()
	for k, v in pairs(elist) do
		if v == 0 then
			return true
		end
	end

	for k, v in pairs(flist) do
		if v == 0 then
			return true
		end
	end

	return false
end

function RoomCtrl.JPadPress(dir)
	UILayerCtrl.Select(dir)
end

function RoomCtrl.DPadPress(dir)
	UILayerCtrl.Select(dir)
end

function RoomCtrl.IsFriendListReady()
	local isFinished = friendLoaderCount == friendLoader.loadCount

	return isFinished
end

function RoomCtrl.IsTeam1Ready()
	local isFinished = team1LoaderCount == Team1Loader.loadCount

	return isFinished
end

function RoomCtrl.IsTeam2Ready()
	local isFinished = team2LoaderCount == Team2Loader.loadCount

	return isFinished
end

function RoomCtrl.IsTeamReady()
	return true
end

function RoomCtrl.IsSelectAiReady()
	local isFinished = selectAiLoaderCount == selectAILoader.loadCount

	return isFinished
end

function RoomCtrl.IsUiLoaded()
	this.loadFinish = this.IsFriendListReady() and this.IsSelectAiReady()
end

function RoomCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function RoomCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "RoomPanel_SelectPanel" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			UILayerCtrl.OnButtonClick("RoomPanel_Close")
		end
	elseif lName == "RoomPanel_RoomMainPanel" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			UILayerCtrl.OnButtonClick("RoomPanel_Close")
		elseif inputMgr:GetButtonUp(GBKey.Y) then
			UILayerCtrl.OnButtonClick("RoomPanel_RoomMainPanel_BG_Team_Layout_TeamateItem_BG_AddBtn")
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) then
			UILayerCtrl.GetIndividual("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ListBG_FriendBtn"):SetHighlighted()
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) then
			UILayerCtrl.GetIndividual("RoomPanel_RoomMainPanel", "RoomPanel_RoomMainPanel_BG_ListBG_NearBtn"):SetHighlighted()
		end
	elseif lName == "RoomPanel_SelectAIPanel" then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			UILayerCtrl.OnButtonClick("RoomPanel_SelectAIPanel_BackBtn")
		end
	end
end

function RoomCtrl.InitRoomAIList(team1Num, team2Num)
	elist = {}
	flist = {}

	if team1Num - 1 > 0 then
		for i = 1, team1Num - 1 do
			flist[i] = 0
		end
	end

	if team2Num > 0 then
		for i = 1, team2Num do
			elist[i] = 0
		end
	end
end

return RoomCtrl
