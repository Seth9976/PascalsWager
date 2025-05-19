-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/SelfInfoCtrl.lua

require("LuaScript/Network/NI_Player")

SelfInfoCtrl = class("SelfInfoCtrl", UICtrlBase)

local this = SelfInfoCtrl
local SelfInfoButton, ChangePortraitButton, CloseButton, ChangeNameBtn, LogoutBtn, changeNameConfirmBtn, changeNameCancelBtn, changeNamePanel, changeNameInputfield, FrameTabButton, PortraitTabButton, SelfInfoPanel, ChangePortraitPanel, FrameScroll, PortraitScroll, SelfPortrait1, SelfFrame1, SelfPortrait2, SelfFrame2, idText, LvText, FrameLoader, PortraitLoader, FrameIndex, PortraitIndex
local lastDaltaLRZ = {
	0,
	0
}

function SelfInfoCtrl.OnCreate()
	UILayerCtrl.Add("PlayerInfo_Profile")
	UILayerCtrl.Add("PlayerInfo_Portrait")

	lastDaltaLRZ = {
		0,
		0
	}
	SelfInfoPanel = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_SelfInfo")
	ChangePortraitPanel = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_ChangePortrait")
	changeNamePanel = this.mainComponent:GetGameObject("SelfInfoPanel_Panel_ChangeName")
	FrameScroll = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll")
	PortraitScroll = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_ChangePortrait_PortraitScroll")
	SelfPortrait1 = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_SelfInfo_SelfPortrait")
	SelfFrame1 = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_SelfInfo_SelfPortrait_SelfFrame")
	SelfPortrait2 = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll_SelfPortrait")
	SelfFrame2 = this.mainComponent:GetGameObject("SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll_SelfPortrait_SelfFrame")
	SelfInfoButton = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_SelfInfoButton")

	SelfInfoButton:SelectOnStart(true)
	SelfInfoButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SelfInfoPanel:GetComponent("CanvasGroup").alpha = 1
		SelfInfoPanel:GetComponent("CanvasGroup").blocksRaycasts = true
		ChangePortraitPanel:GetComponent("CanvasGroup").alpha = 0
		ChangePortraitPanel:GetComponent("CanvasGroup").blocksRaycasts = false

		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfo_Profile")
	end)
	UILayerCtrl.AddIndividual("SelfInfoPanel_InfoBoard_SelfInfoButton", SelfInfoButton)

	ChangePortraitButton = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_ChangePortraitButton")

	ChangePortraitButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SelfInfoPanel:GetComponent("CanvasGroup").alpha = 0
		SelfInfoPanel:GetComponent("CanvasGroup").blocksRaycasts = false
		ChangePortraitPanel:GetComponent("CanvasGroup").alpha = 1
		ChangePortraitPanel:GetComponent("CanvasGroup").blocksRaycasts = true

		UILayerCtrl.Pop()
		UILayerCtrl.Push("PlayerInfo_Portrait")
	end)
	UILayerCtrl.AddIndividual("SelfInfoPanel_InfoBoard_ChangePortraitButton", ChangePortraitButton)

	FrameTabButton = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_ChangePortrait_FrameTabButton")

	FrameTabButton:SelectOnStart(true)
	FrameTabButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		FrameScroll:GetComponent("CanvasGroup").alpha = 1
		FrameScroll:GetComponent("CanvasGroup").blocksRaycasts = true
		PortraitScroll:GetComponent("CanvasGroup").alpha = 0
		PortraitScroll:GetComponent("CanvasGroup").blocksRaycasts = false
	end)

	PortraitTabButton = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_ChangePortrait_PortraitTabButton")

	PortraitTabButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		FrameScroll:GetComponent("CanvasGroup").alpha = 0
		FrameScroll:GetComponent("CanvasGroup").blocksRaycasts = false
		PortraitScroll:GetComponent("CanvasGroup").alpha = 1
		PortraitScroll:GetComponent("CanvasGroup").blocksRaycasts = true
	end)
	XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.RESP_EDIT_PLAYER_INFO, SelfInfoCtrl.OnParseEditPlayerInfo)
	XNetwork.AddListener(XProtocol.BattleProtocolToPlayer.REQ_EDIT_PLAYER_INFO, SelfInfoCtrl.OnParseEditPlayerInfoFailed)

	CloseButton = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_Close")

	CloseButton:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToPlayer.RESP_EDIT_PLAYER_INFO)
		XNetwork.RemoveListener(XProtocol.BattleProtocolToPlayer.REQ_EDIT_PLAYER_INFO)
		UIManager.Close("SelfInfo")
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddIndividual("PlayerInfo_Profile", "SelfInfoPanel_InfoBoard_Close", CloseButton)
	UILayerCtrl.AddIndividual("PlayerInfo_Portrait", "SelfInfoPanel_InfoBoard_Close", CloseButton)

	idText = this.mainComponent:GetText("SelfInfoPanel_InfoBoard_SelfInfo_IdText")
	LvText = this.mainComponent:GetText("SelfInfoPanel_InfoBoard_SelfInfo_LevelText")

	if LS_Account ~= nil and LS_Account.userName ~= nil then
		idText:SetContent("ID:" .. FS_UserData.playerList:GetPlayer():GetName())
		LvText:SetContent("Lv " .. FS_UserData.playerList:GetPlayer():GetLevel())
	end

	ChangeNameBtn = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_SelfInfo_ChangeNameButton")

	ChangeNameBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		changeNamePanel:SetActive(true)
	end)

	LogoutBtn = this.mainComponent:GetButton("SelfInfoPanel_InfoBoard_SelfInfo_LogoutButton")

	LogoutBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_LOGIN_NOWACCOUNT .. LS_Account.userName .. GameText.UI_LOGIN_CONFIRMLOGOUT, function()
			XNetwork.RemoveListener(XProtocol.BattleProtocolToChat.RESP_CHAT)
			XNetwork.RemoveListener(XProtocol.BattleProtocolToChat.REQ_CHAT)

			if LobbyMainCtrl.IsMatchingGame() then
				LobbyMainCtrl.CancelMatch()
			end

			networkMgr:Disconnect()
			XNetwork.OnDisconnect()
			FS_UserData.LoginOut()
			UIManager.CreateCtrl("Login")

			local sceneController = ST_Lobby.GetSceneController()

			sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.PressStart)
			sceneController.StartLogin()
			UIManager.Close("Chat")
			UIManager.Close("SelfInfo")
		end, function()
			return
		end)
	end)

	local groupFrame = XGroup:new()

	groupFrame:SetMode(XGroup.GroupMode.Button)

	local groupPortrait = XGroup:new()

	groupPortrait:SetMode(XGroup.GroupMode.Button)

	FrameLoader = this.mainComponent:GetLoader("SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll_ViewPort_Content")
	FrameLoader.loadCount = 12

	function FrameLoader.loadCallback(index, com, data)
		local FrameButton = com:GetButton("FrameButton")

		groupFrame:Add(FrameButton)
		FrameButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			FrameIndex = index

			FrameButton:SetSelected(true)
			SelfInfoCtrl.SetFrame(index)
		end)

		local img = XImage:new(FrameButton.gameObject)
		local sprite = XObjectPool.GetIcon("headFrame" .. string.format("%02d", index))

		img:SetSprite(sprite)
	end

	PortraitLoader = this.mainComponent:GetLoader("SelfInfoPanel_InfoBoard_ChangePortrait_PortraitScroll_ViewPort_Content")
	PortraitLoader.loadCount = 5

	function PortraitLoader.loadCallback(index, com, data)
		local PortraitButton = com:GetButton("PortraitButton")

		groupPortrait:Add(PortraitButton)
		PortraitButton:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			PortraitIndex = index

			PortraitButton:SetSelected(true)
			NI_Player.ChangeIcon(index)
		end)

		local img = XImage:new(PortraitButton.gameObject)
		local sprite = XObjectPool.GetIcon("headIcon" .. string.format("%02d", index))

		img:SetSprite(sprite)
	end

	FrameLoader:Load()
	PortraitLoader:Load()

	changeNameInputfield = this.mainComponent:GetGameObject("SelfInfoPanel_Panel_ChangeName_BG_InputField"):GetComponent("InputField")
	changeNameConfirmBtn = this.mainComponent:GetButton("SelfInfoPanel_Panel_ChangeName_BG_Confirm")
	changeNameCancelBtn = this.mainComponent:GetButton("SelfInfoPanel_Panel_ChangeName_BG_Cancel")

	changeNameConfirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if string.gsub(changeNameInputfield.text, " ", "") == "" then
			changeNameInputfield.text = ""

			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_UESRNAME_TIPS)

			return
		elseif string.find(SensitiveMsgParser:getString(changeNameInputfield.text), "*") ~= nil then
			changeNameInputfield.text = ""

			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_SENSITIVE_WORD)

			return
		end

		NI_Player.ChangePlayerName(changeNameInputfield.text)
	end)
	changeNameCancelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SelfInfoCtrl.EndChangeName()
	end)

	if FS_UserData.playerList:GetPlayer():GetIcon() ~= nil then
		SelfInfoCtrl.SetPortrait(FS_UserData.playerList:GetPlayer():GetIcon(), FS_UserData.playerList:GetPlayer():GetIconUrl())
	end

	UILayerCtrl.Push("PlayerInfo_Profile")
end

function SelfInfoCtrl.EndChangeName()
	changeNamePanel:SetActive(false)
end

function SelfInfoCtrl.SetNameAndLevel(name, level)
	idText:SetContent(name)

	if level ~= nil then
		LvText:SetContent(level)
	end
end

function SelfInfoCtrl.SetPortrait(id, url)
	local img1 = XImage:new(SelfPortrait1)

	XObjectPool.SetPortraitIcon(id, url, img1)

	local img2 = XImage:new(SelfPortrait2)

	XObjectPool.SetPortraitIcon(id, url, img2)
end

function SelfInfoCtrl.SetFrame(num)
	local img1 = XImage:new(SelfFrame1)
	local sprite1 = XObjectPool.GetIcon("headFrame" .. string.format("%02d", num))

	img1:SetSprite(sprite1)

	local img2 = XImage:new(SelfFrame2)
	local sprite2 = XObjectPool.GetIcon("headFrame" .. string.format("%02d", num))

	img2:SetSprite(sprite2)
end

function SelfInfoCtrl.OnParseEditPlayerInfo(buffer)
	NI_Player.ParseEditPlayerInfoResponse(buffer)
	UIManager.SendMessage("LobbyMain", "SetNameAndLevel", FS_UserData.playerList:GetPlayer():GetName())
	this.SetNameAndLevel(FS_UserData.playerList:GetPlayer():GetName())
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_SELFINFO_CHANGE_SUCCESS)
	this.EndChangeName()
	UIManager.SendMessage("LobbyMain", "SetPortrait", FS_UserData.playerList:GetPlayer():GetIcon(), FS_UserData.playerList:GetPlayer():GetIconUrl())
	this.SetPortrait(FS_UserData.playerList:GetPlayer():GetIcon(), FS_UserData.playerList:GetPlayer():GetIconUrl())
end

function SelfInfoCtrl.OnParseEditPlayerInfoFailed(value)
	UIManager.SendMessage("Loading", "SimpleLoading", false)

	if value == 1 then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_SELFINFO_CHANGE_NAME_EXIST)
	elseif value == 9 then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_SENSITIVE_WORD)
	end
end

function SelfInfoCtrl.Update()
	local deltaZ = UnityEngine.Input.GetAxis("Skill")

	if deltaZ == 1 and lastDaltaLRZ[1] < 1 then
		-- block empty
	elseif deltaZ == 1 and lastDaltaLRZ[1] == 1 then
		-- block empty
	elseif deltaZ < 1 and lastDaltaLRZ[1] == 1 then
		SelfInfoButton:OnDown(nil, nil)
		SelfInfoButton:OnClick(nil, nil)
	end

	if deltaZ == -1 and lastDaltaLRZ[2] > -1 then
		-- block empty
	elseif deltaZ == -1 and lastDaltaLRZ[2] == -1 then
		-- block empty
	elseif deltaZ > -1 and lastDaltaLRZ[2] == -1 then
		ChangePortraitButton:OnDown(nil, nil)
		ChangePortraitButton:OnClick(nil, nil)
	end

	lastDaltaLRZ[1] = deltaZ
	lastDaltaLRZ[2] = deltaZ

	local currentLayer = UILayerCtrl.GetCurrentLayerName()

	if currentLayer == "PlayerInfo_Profile" then
		if inputMgr:GetButtonUp(GBKey.X) then
			LogoutBtn:OnDown(nil, nil)
			LogoutBtn:OnClick(nil, nil)
		end

		if inputMgr:GetButtonUp(GBKey.Y) then
			ChangeNameBtn:OnDown(nil, nil)
			ChangeNameBtn:OnClick(nil, nil)
		end
	elseif currentLayer == "PlayerInfo_Portrait" then
		-- block empty
	end
end

return SelfInfoCtrl
