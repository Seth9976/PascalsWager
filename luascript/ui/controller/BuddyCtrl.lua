-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/BuddyCtrl.lua

BuddyCtrl = class("BuddyCtrl", UICtrlBase)

local this = BuddyCtrl
local friendLoader, backBtn, addIDPanel, applyPoint, requestList, friendList

function BuddyCtrl.OnCreate()
	UILayerCtrl.Add("Buddy")

	friendLoader = this.mainComponent:GetLoader("BuddyPanel_MainPanel_FriendList_ViewPort_Content")
	backBtn = this.mainComponent:GetButton("BuddyPanel_Back")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.Close("Buddy")
		UIManager.SendMessage("LobbyMain", "CloseDialog")
		UILayerCtrl.Pop()
	end)
	UILayerCtrl.AddIndividual("Buddy", "BuddyPanel_Back", backBtn)

	addIDPanel = this.mainComponent:GetGameObject("BuddyPanel_AddIdPanel")
	requestList = FS_Buddy.GetRequestList()
	friendList = FS_Buddy.GetFriendList()
	applyPoint = this.mainComponent:GetGameObject("BuddyPanel_Buddy_B_MainPanel_TopBar_ApplyListBtn_point")

	local friendlistBtn = this.mainComponent:GetButton("BuddyPanel_MainPanel_TopBar_FriendListBtn")

	friendlistBtn:SelectOnStart(true)
	friendlistBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		BuddyCtrl.RefreshFriendList()
	end)

	local applyListBtn = this.mainComponent:GetButton("BuddyPanel_MainPanel_TopBar_ApplyListBtn")

	applyListBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		BuddyCtrl.RefreshRequestList()
	end)

	friendLoader.loadCount = FS_Buddy.GetFriendNum()
	friendLoader.loadCallback = BuddyCtrl.FriendListLoadCallBack

	friendLoader:Load()
	friendLoader:SetCacheNumMax(1, 10)

	if FS_Buddy.GetRequestNum() > 0 then
		applyPoint:SetActive(true)
	end

	local addBtn = this.mainComponent:GetButton("BuddyPanel_MainPanel_AddBtn")

	addBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		addIDPanel:SetActive(true)
	end)

	local idInput = this.mainComponent:GetGameObject("BuddyPanel_AddIdPanel_AddBoard_InputField"):GetComponent("InputField")
	local confirmBtn = this.mainComponent:GetButton("BuddyPanel_AddIdPanel_AddBoard_ConfirmBtn")
	local cancelBtn = this.mainComponent:GetButton("BuddyPanel_AddIdPanel_AddBoard_CancelBtn")

	confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SystemHelper.Log(idInput.text)
		addIDPanel:SetActive(false)
	end)
	cancelBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		addIDPanel:SetActive(false)
	end)
	UILayerCtrl.Push("Buddy")
end

function BuddyCtrl.RequestListLoadCallBack(index, com, data)
	com:GetGameObject("BG_BG_online"):SetActive(false)
	com:GetGameObject("BG_BG_offline"):SetActive(false)
	com:GetGameObject("BG_BG_apply"):SetActive(true)

	local img = XImage:new(com:GetGameObject("Info_Portrait"))

	XObjectPool.SetPortraitIcon(requestList[index].icon, requestList[index].iconUrl, img)
	com:GetText("Info_NameText"):SetContent(requestList[index].name)
	com:GetGameObject("Info_State"):SetActive(false)
	com:GetGameObject("Info_Apply"):SetActive(true)
	com:GetButton("Info_Apply_AgreeBtn"):SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		NI_Buddy.AcceptBuddyRequest(requestList[index])
	end)
	com:GetButton("Info_Apply_RefuseBtn"):SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		NI_Buddy.RejectBuddyRequest(requestList[index])
	end)
end

function BuddyCtrl.FriendListLoadCallBack(index, com, data)
	local img = XImage:new(com:GetGameObject("Info_Portrait"))

	XObjectPool.SetPortraitIcon(friendList[index].icon, friendList[index].iconUrl, img)

	if friendList[index].isOnline then
		com:GetGameObject("BG_BG_online"):SetActive(true)
		com:GetGameObject("BG_BG_offline"):SetActive(false)
		com:GetText("Info_State_isOnlineText"):SetContent("在线")
		img:SetGray(false)
	else
		com:GetGameObject("BG_BG_offline"):SetActive(true)
		com:GetGameObject("BG_BG_online"):SetActive(false)
		com:GetText("Info_State_isOnlineText"):SetContent("离线")
		com:GetButton("Info_State_MessageBtn"):SetDisabled(true)
		img:SetGray(true)
	end

	com:GetGameObject("BG_BG_apply"):SetActive(false)
	com:GetText("Info_NameText"):SetContent(friendList[index].name)
	com:GetGameObject("Info_State"):SetActive(true)
	com:GetGameObject("Info_Apply"):SetActive(false)
	com:GetButton("Info_State_MessageBtn"):SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.Close("Buddy")
		UIManager.SendMessage("LobbyMain", "CloseDialog")

		local sceneController = ST_Lobby.GetSceneController()

		sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Main)
		UIManager.SendMessage("Chat", "OpenPrivateChat", friendList[index].userid)
	end)

	if index == friendLoader.loadCount then
		BuddyCtrl.SortFriendList()
	end
end

function BuddyCtrl.RefreshRequestList()
	requestList = FS_Buddy.GetRequestList()
	friendLoader.loadCount = FS_Buddy.GetRequestNum()
	friendLoader.loadCallback = BuddyCtrl.RequestListLoadCallBack

	friendLoader:Load()

	if FS_Buddy.GetRequestNum() == 0 then
		applyPoint:SetActive(false)
	end
end

function BuddyCtrl.RefreshFriendList()
	friendList = FS_Buddy.GetFriendList()
	friendLoader.loadCount = FS_Buddy.GetFriendNum()
	friendLoader.loadCallback = BuddyCtrl.FriendListLoadCallBack

	friendLoader:Load()
end

function BuddyCtrl.SortFriendList()
	for k, v in pairs(friendList) do
		if v.isOnline == true then
			friendLoader:GetChild(k).transform:SetAsFirstSibling()
		end
	end
end

function BuddyCtrl.Update()
	return
end

return BuddyCtrl
