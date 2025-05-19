-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ChatCtrl.lua

require("LuaScript/Network/NI_Chat")
require("LuaScript/Network/NI_Buddy")
require("LuaScript/Common/SensitiveMsgParser")

ChatCtrl = class("ChatCtrl", UICtrlBase)

local this = ChatCtrl
local mainPanel, miniPanel, friendListPanel, friendLoader, scrollFriend, inputField, chatLoader, mainScroll, miniScroll, miniText, inputPanel, showTween, currentPanel, btnWorld, btnNear, btnTeam, btnPrivate, privatePoint, minipanelPoint, friendgroup
local tablist = {}
local chatObjList = {}
local chatType = {
	World = 0,
	Room = 3,
	Near = 2,
	Team = 4,
	Private = 1
}
local currentChannel, currentFriendUserId

function ChatCtrl.OnCreate()
	this.loadFinish = false
	mainPanel = this.mainComponent:GetGameObject("ChatPanel_MainPanel")
	miniPanel = this.mainComponent:GetGameObject("ChatPanel_MiniPanel")
	friendListPanel = this.mainComponent:GetGameObject("ChatPanel_MainPanel_FriendList")
	currentPanel = miniPanel
	inputPanel = this.mainComponent:GetGameObject("ChatPanel_MainPanel_MainInput")
	privatePoint = this.mainComponent:GetGameObject("ChatPanel_MainPanel_MainChat_ButtonPanel_Private_Button_Point")
	minipanelPoint = this.mainComponent:GetGameObject("ChatPanel_MiniPanel_Sign")
	mainScroll = this.mainComponent:GetGameObject("ChatPanel_MainPanel_MainChat_WorldScrollRect"):GetComponent("ScrollRect")
	miniText = this.mainComponent:GetText("ChatPanel_MiniPanel_ScrollRect_Viewport_Content")
	miniScroll = this.mainComponent:GetGameObject("ChatPanel_MiniPanel_ScrollRect"):GetComponent("ScrollRect")
	tablist.WorldScrollRect = this.mainComponent:GetGameObject("ChatPanel_MainPanel_MainChat_WorldScrollRect")

	local scrollObj = this.mainComponent:GetGameObject("ChatPanel_MainPanel_FriendList")

	scrollFriend = XScrollRect:new(scrollObj)
	friendLoader = this.mainComponent:GetLoader("ChatPanel_MainPanel_FriendList_ViewPort_Content")

	function friendLoader.loadCallback(index, com, data)
		this.OnFriendItemLoadFinish(index, com)
	end

	friendgroup = XGroup:new()

	friendgroup:SetMode(XGroup.GroupMode.Button)

	friendLoader.loadCount = FS_Buddy.GetFriendNum()

	friendLoader:Load()

	chatLoader = this.mainComponent:GetLoader("ChatPanel_MainPanel_MainChat_WorldScrollRect_ViewPort_Content")
	chatLoader.clearContentOnLoad = false

	chatLoader:PreloadTemplate(function()
		this.loadFinish = true
	end)

	function chatLoader.loadCallback(index, com, data)
		this.OnChatItemLoadFinish(com, data)
	end

	local scrollObject = this.mainComponent:GetGameObject("ChatPanel_MiniPanel_ScrollRect")
	local scroll = XScrollRect:new(scrollObject)
	local btn = this.mainComponent:GetButton("ChatPanel_MiniPanel_ScrollRect_Viewport")

	btn:SetParentScroll(scroll)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		currentPanel = mainPanel

		ChatCtrl.SetVisiable(mainPanel, true)
		ChatCtrl.SetVisiable(miniPanel, false)
		ChatCtrl.ChangeChannel(currentChannel)
	end)

	btn = this.mainComponent:GetButton("ChatPanel_MainPanel_Back_Button")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		currentPanel = miniPanel

		btnWorld:SetSelected(false)
		btnNear:SetSelected(false)
		btnTeam:SetSelected(false)
		btnPrivate:SetSelected(false)
		ChatCtrl.SetVisiable(mainPanel, false)
		ChatCtrl.SetVisiable(miniPanel, true)

		miniScroll.verticalNormalizedPosition = 0
	end)

	btnWorld = this.mainComponent:GetButton("ChatPanel_MainPanel_MainChat_World_Button")

	btnWorld:SetHighlighted()

	currentChannel = chatType.World

	btnWorld:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		tablist.WorldScrollRect:GetComponent("RectTransform").sizeDelta = Vector2.New(530, 380)
		inputPanel:GetComponent("RectTransform").sizeDelta = Vector2.New(530, 61)

		ChatCtrl.SetVisiable(friendListPanel, false)
		this.ChangeChannel(chatType.World)
	end)

	btnNear = this.mainComponent:GetButton("ChatPanel_MainPanel_MainChat_Near_Button")

	btnNear:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		tablist.WorldScrollRect:GetComponent("RectTransform").sizeDelta = Vector2.New(530, 380)
		inputPanel:GetComponent("RectTransform").sizeDelta = Vector2.New(530, 61)

		ChatCtrl.SetVisiable(friendListPanel, false)
		this.ChangeChannel(chatType.Near)
	end)

	btnTeam = this.mainComponent:GetButton("ChatPanel_MainPanel_MainChat_Team_Button")

	btnTeam:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		tablist.WorldScrollRect:GetComponent("RectTransform").sizeDelta = Vector2.New(530, 380)
		inputPanel:GetComponent("RectTransform").sizeDelta = Vector2.New(530, 61)

		ChatCtrl.SetVisiable(friendListPanel, false)
		this.ChangeChannel(chatType.Team)
	end)

	btnPrivate = this.mainComponent:GetButton("ChatPanel_MainPanel_MainChat_Private_Button")

	btnPrivate:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		ChatCtrl.SetVisiable(friendListPanel, true)

		tablist.WorldScrollRect:GetComponent("RectTransform").sizeDelta = Vector2.New(440, 380)
		inputPanel:GetComponent("RectTransform").sizeDelta = Vector2.New(440, 61)

		this.ChangeChannel(chatType.Private)
	end)

	inputField = this.mainComponent:GetGameObject("ChatPanel_MainPanel_MainInput_InputField"):GetComponent("InputField")
	btn = this.mainComponent:GetButton("ChatPanel_MainPanel_MainInput_Send_Button")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if string.gsub(inputField.text, " ", "") == "" then
			inputField.text = ""

			return
		end

		if string.len(inputField.text) > 300 then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "超过最大字符限制")

			return
		end

		inputField.text = SensitiveMsgParser:getString(inputField.text)

		NI_Chat.SendChatMessage({
			isRead = false,
			chatType = currentChannel,
			fromId = FS_UserData.playerList:GetUserId(),
			fromName = LS_Account.userName,
			content = inputField.text
		})

		inputField.text = ""
	end)

	if table.nums(FS_UserData.chat.UnReadMessageAll) > 0 then
		for k, v in pairs(FS_UserData.chat.UnReadMessageAll) do
			ChatCtrl.NewMessage(v)
		end

		FS_UserData.chat.UnReadMessageAll = {}
	end

	XNetwork.AddListener(XProtocol.BattleProtocolToChat.RESP_CHAT, ChatCtrl.OnParseChatMessage)
	XNetwork.AddListener(XProtocol.BattleProtocolToChat.REQ_CHAT, ChatCtrl.OnParseChatMessageFailed)
end

function ChatCtrl.OnFriendItemLoadFinish(index, com)
	local tempfriend = FS_Buddy.GetFriendByIndex(index)
	local img = XImage:new(com:GetGameObject("FriendButton_Portrait"))
	local sprite = XObjectPool.GetIcon("headIcon" .. string.format("%02d", tempfriend.icon))

	img:SetSprite(sprite)

	if not tempfriend.isOnline then
		img:SetGray(true)
	else
		img:SetGray(false)
	end

	com:GetText("FriendButton_Text"):SetContent(tempfriend.name)

	local friendbtn = com:GetButton("FriendButton")

	friendgroup:Add(friendbtn)
	friendbtn:SetParentScroll(scrollFriend)
	friendbtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		friendbtn:SetSelected(true)

		currentFriendUserId = tempfriend.userid

		ChatCtrl.UpdateChatPanel(chatType.Private)
	end)

	if index == friendLoader.loadCount then
		FS_UserData.chat.PrivateNewMsgFlag[2211] = true
		FS_UserData.chat.PrivateNewMsgFlag[2233] = true

		ChatCtrl.SortFriendList()
	end
end

function ChatCtrl.SortFriendList()
	local firstfriend

	for k, v in pairs(FS_Buddy.GetFriendList()) do
		if v.isOnline == true then
			friendLoader:GetChild(k).transform:SetAsFirstSibling()

			firstfriend = friendLoader:GetChild(k)
			currentFriendUserId = v.userid
		end
	end

	for k, v in pairs(FS_UserData.chat:GetPrivateNewMsgFlag()) do
		local index = FS_Buddy.GetIndexByUserId(k)

		if v == true then
			friendLoader:GetChild(index):GetGameObject("FriendButton_Portrait_point"):SetActive(true)
			friendLoader:GetChild(index).transform:SetAsFirstSibling()

			firstfriend = friendLoader:GetChild(index)
			currentFriendUserId = k
		else
			friendLoader:GetChild(index):GetGameObject("FriendButton_Portrait_point"):SetActive(false)
		end
	end

	if firstfriend ~= nil then
		firstfriend:GetButton("FriendButton"):SetHighlighted()
	end
end

function ChatCtrl.AddFriend()
	friendLoader.clearContentOnLoad = false
	friendLoader.loadCount = 1

	function friendLoader.loadCallback(index, com, data)
		local tempfriend = FS_Buddy.UpdateInfo
		local img = XImage:new(com:GetGameObject("FriendButton_Portrait"))
		local sprite = XObjectPool.GetIcon("headIcon" .. string.format("%02d", tempfriend.icon))

		img:SetSprite(sprite)

		if not tempfriend.isOnline then
			img:SetGray(true)
			com.transform:SetAsLastSibling()
		else
			img:SetGray(false)
			com.transform:SetAsFirstSibling()
		end

		com:GetText("FriendButton_Text"):SetContent(tempfriend.name)

		local friendbtn = com:GetButton("FriendButton")

		friendgroup:Add(friendbtn)
		friendbtn:SetParentScroll(scrollFriend)
		friendbtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			friendbtn:SetSelected(true)

			currentFriendUserId = tempfriend.userid

			ChatCtrl.UpdateChatPanel(chatType.Private)
		end)
	end

	friendLoader:Load()
end

function ChatCtrl.RemoveFriend()
	friendLoader:RemoveChild(friendLoader:GetChild(FS_Buddy.RemoveInfo.index))
end

function ChatCtrl.NewMessage(message)
	if message.chatType == chatType.Private then
		if message.fromId ~= FS_UserData.playerList:GetPlayerId() then
			local index = FS_Buddy.GetIndexByUserId(message.fromId)

			if currentPanel ~= mainPanel then
				minipanelPoint:SetActive(true)
			end

			if currentChannel ~= chatType.Private then
				privatePoint:SetActive(true)
				minipanelPoint:SetActive(true)
			end

			if currentFriendUserId == message.fromId then
				this.CreateChatItem(message.chatType, message.fromName, message.fromIcon, message.fromIconUrl, message.content, message.fromId, message.fromServerId, 2)
				FS_UserData.chat:SetMsgRead(message.fromId)
			else
				privatePoint:SetActive(true)
				minipanelPoint:SetActive(true)
				friendLoader:GetChild(index):GetGameObject("FriendButton_Portrait_point"):SetActive(true)
				friendLoader:GetChild(index).transform:SetAsFirstSibling()
			end
		elseif currentFriendUserId == message.toId then
			this.CreateChatItem(message.chatType, message.fromName, message.fromIcon, message.fromIconUrl, message.content, message.fromId, message.fromServerId)
		end
	elseif currentChannel == message.chatType then
		if message.fromId == FS_UserData.playerList:GetPlayerId() then
			this.CreateChatItem(message.chatType, message.fromName, message.fromIcon, message.fromIconUrl, message.content, message.fromId, message.fromServerId)
		else
			this.CreateChatItem(message.chatType, message.fromName, message.fromIcon, message.fromIconUrl, message.content, message.fromId, message.fromServerId, 2)
		end
	end

	ChatCtrl.UpdateMiniText(message)
end

function ChatCtrl.OnChatItemLoadFinish(com, data)
	if data.prefabIndex == 2 then
		com:GetText("Name_Text"):SetContent(data.Name)

		local PortraitBtn = com:GetButton("Portrait")
		local canvas = this.transform:GetComponent("Canvas")

		PortraitBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, _data)
			local screenPos = canvas.worldCamera:WorldToScreenPoint(PortraitBtn.transform.position)

			UIManager.SendMessage("MsgBoxSimple", "OpenPlayerMenu", screenPos, "加好友", function()
				NI_Buddy.AddBuddyRequest(data)
			end)
		end)
	end

	local img = XImage:new(com:GetGameObject("Portrait_Portrait_Image"))

	XObjectPool.SetPortraitIcon(data.fromIcon, data.fromIconUrl, img)

	local tempText

	data.content = ChatCtrl.ReplaceEmoji(data.content)
	data.content, tempText = ChatCtrl.ReplaceHerf(data.content)

	if tempText then
		com:GetText("Text"):SetContent(tempText)
		com:GetGameObject("Text"):GetComponent("LinkImageText"):AddHrefFunc(ChatCtrl.HerfFunc)
	else
		com:GetText("Text"):SetContent(data.content)
	end

	local textHeight = com:GetText("Text").textCom.preferredHeight
	local textWidth = com:GetText("Text").textCom.preferredWidth

	if textWidth > 300 then
		textWidth = 300
	end

	if tempText then
		com:GetText("Text"):SetContent(data.content)
	end

	if data.prefabIndex ~= 2 and textHeight > 20 then
		com:GetText("Text").textCom.alignment = UnityEngine.TextAnchor.UpperLeft
	end

	com.gameObject:GetComponent("LayoutElement").preferredHeight = com.gameObject:GetComponent("LayoutElement").preferredHeight + textHeight - 16
	com:GetGameObject("Text_Frame"):GetComponent("RectTransform").sizeDelta = Vector2.New(com:GetGameObject("Text_Frame"):GetComponent("RectTransform").sizeDelta.x + textWidth, com:GetGameObject("Text_Frame"):GetComponent("RectTransform").sizeDelta.y + textHeight - 16)

	local contentGO = this.mainComponent:GetGameObject("ChatPanel_MainPanel_MainChat_WorldScrollRect_ViewPort_Content")

	mainScroll.verticalNormalizedPosition = 0

	coroutine.start(ChatCtrl.RefreshLayout)
end

function ChatCtrl.RefreshLayout()
	coroutine.wait(0.01)

	mainScroll.verticalNormalizedPosition = 0
end

function ChatCtrl.ChangeChannel(channel)
	chatLoader:ClearChild()

	if channel == chatType.World then
		btnWorld:SetSelected(true)

		currentChannel = chatType.World
	elseif channel == chatType.Near then
		btnNear:SetSelected(true)

		currentChannel = chatType.Near
	elseif channel == chatType.Team then
		btnTeam:SetSelected(true)

		currentChannel = chatType.Team
	elseif channel == chatType.Private then
		btnPrivate:SetSelected(true)

		currentChannel = chatType.Private
	end

	this.UpdateChatPanel(channel)
end

function ChatCtrl.UpdateChatPanel(channel)
	local tbl

	if channel ~= chatType.Private then
		tbl = FS_UserData.chat:GetChatInfoByChannel(channel)
	else
		tbl = FS_UserData.chat:GetPrivateChatInfoByUserID(currentFriendUserId)

		local index = FS_Buddy.GetIndexByUserId(currentFriendUserId)

		friendLoader:GetChild(index):GetGameObject("FriendButton_Portrait_point"):SetActive(false)
		FS_UserData.chat:SetMsgRead(currentFriendUserId)

		if not FS_UserData.chat:HaveUnReadMessage() then
			minipanelPoint:SetActive(false)
			privatePoint:SetActive(false)
		end
	end

	if tbl ~= nil then
		for k, v in pairs(tbl) do
			if v.fromId == FS_UserData.playerList:GetPlayerId() then
				this.CreateChatItem(v.Channel, v.fromName, v.fromIcon, v.fromIconUrl, v.content, v.fromId, v.fromServerId)
			else
				this.CreateChatItem(v.Channel, v.fromName, v.fromIcon, v.fromIconUrl, v.content, v.fromId, v.fromServerId, 2)
			end
		end
	end
end

function ChatCtrl.CreateChatItem(channel, name, fromIcon, fromIconUrl, Content, fromId, fromServerId, prefabIndex)
	chatLoader:Load({
		Channel = channel,
		Name = name,
		fromIcon = fromIcon,
		fromIconUrl = fromIconUrl,
		content = Content,
		prefabIndex = prefabIndex,
		fromId = fromId,
		fromServerId = fromServerId
	})
end

function ChatCtrl.SetVisiable(go, flag)
	if flag then
		go:GetComponent("CanvasGroup").alpha = 1
		go:GetComponent("CanvasGroup").blocksRaycasts = true
	else
		go:GetComponent("CanvasGroup").alpha = 0
		go:GetComponent("CanvasGroup").blocksRaycasts = false
	end
end

function ChatCtrl.HideChat()
	if showTween ~= nil then
		showTween:Stop()
	end

	if currentPanel == nil then
		return
	end

	currentPanel:GetComponent("CanvasGroup").alpha = 0
	currentPanel:GetComponent("CanvasGroup").blocksRaycasts = false
end

function ChatCtrl.ShowChat(flag)
	if flag then
		if currentPanel == nil then
			return
		end

		ChatCtrl.SetVisiable(currentPanel, true)
	else
		if currentPanel == nil then
			return
		end

		local showTween = Tween:new(currentPanel:GetComponent("CanvasGroup"))
		local tbl = {
			alpha = 1
		}

		showTween:MoveTo(tbl, 0.5)
		showTween:OnComplete(function()
			currentPanel:GetComponent("CanvasGroup").blocksRaycasts = true
		end)
		showTween:Start()
	end
end

function ChatCtrl.OpenPrivateChat(userid)
	currentPanel = mainPanel

	ChatCtrl.SetVisiable(mainPanel, true)
	ChatCtrl.SetVisiable(miniPanel, false)
	ChatCtrl.ChangeChannel(chatType.Private)
	btnPrivate:SetHighlighted()

	currentFriendUserId = userid

	ChatCtrl.SetVisiable(friendListPanel, true)

	tablist.WorldScrollRect:GetComponent("RectTransform").sizeDelta = Vector2.New(440, 380)
	inputPanel:GetComponent("RectTransform").sizeDelta = Vector2.New(440, 61)

	ChatCtrl.UpdateChatPanel(chatType.Private)

	local index = FS_Buddy.GetIndexByUserId(currentFriendUserId)

	friendLoader:GetChild(index):GetButton("FriendButton"):SetHighlighted()
	friendLoader:GetChild(index).transform:SetAsFirstSibling()
end

function ChatCtrl.UpdateFriendState(userid, flag)
	local index = FS_Buddy.GetIndexByUserId(userid)

	if flag then
		friendLoader:GetChild(index).transform:SetAsLastSibling()

		local img = XImage:new(friendLoader:GetChild(index):GetGameObject("FriendButton_Portrait"))

		img:SetGray(flag)
	else
		friendLoader:GetChild(index).transform:SetAsFirstSibling()

		local img = XImage:new(friendLoader:GetChild(index):GetGameObject("FriendButton_Portrait"))

		img:SetGray(flag)
	end
end

function ChatCtrl.UpdateMiniText(data)
	if data == nil then
		miniText:SetContent(FS_UserData.chat.ChatTotalText)

		return
	end

	data.content = ChatCtrl.ReplaceEmoji(data.content)
	data.content = ChatCtrl.ReplaceHerf(data.content)

	local temp = FS_UserData.chat.ChatTotalText

	if data.chatType == chatType.World then
		temp = temp .. "\n<color=#C59C5FFF>" .. data.fromName .. "</color>[世界]:" .. "<color=#FFC763FF>" .. data.content .. "</color>"
	elseif data.chatType == chatType.Near then
		temp = temp .. "\n<color=#C59C5FFF>" .. data.fromName .. "</color>[附近]:" .. "<color=#FEC3FFFF>" .. data.content .. "</color>"
	elseif data.chatType == chatType.Team then
		temp = temp .. "\n<color=#C59C5FFF>" .. data.fromName .. "</color>[队伍]:" .. "<color=#6FA9ECFF>" .. data.content .. "</color>"
	elseif data.chatType == chatType.Private then
		temp = temp .. "\n<color=#C59C5FFF>" .. data.fromName .. "</color>[私聊]:" .. "<color=#DA45B0FF>" .. data.content .. "</color>"
	end

	FS_UserData.chat.ChatTotalText = temp

	miniText:SetContent(temp)
end

function ChatCtrl.ReplaceEmoji(text)
	text = string.gsub(text, "/em(%d%d)", function(s)
		if tonumber(s) <= 3 then
			return "<quad name=emoji" .. s .. " size=20 width=1 />"
		else
			return "/em" .. s
		end
	end)

	return text
end

function ChatCtrl.ReplaceHerf(text)
	if text == "/team" then
		text = string.gsub(text, "/team", "请点击请点击请点击<a href=team>[快来和我组队吧]</a>")

		return text, "请点击请点击请点击[快来和我组队吧]"
	end

	return text, false
end

function ChatCtrl.HerfFunc(name)
	SystemHelper.Log(name)
end

function ChatCtrl.OnParseChatMessage(buffer)
	NI_Chat.ParseChatMessage(buffer)

	if table.nums(FS_UserData.chat.UnReadMessageAll) > 0 and UIManager.GetCtrl("Chat") ~= nil then
		ChatCtrl.NewMessage(FS_UserData.chat.UnReadMessageAll[1])
		table.remove(FS_UserData.chat.UnReadMessageAll, 1)
	end
end

function ChatCtrl.OnParseChatMessageFailed(value)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_CHAT_FAILED[value])
end

function ChatCtrl.Close()
	chatLoader:ClearTemplate()
	UICtrlBase.Close("Chat")
end

return ChatCtrl
