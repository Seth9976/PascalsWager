-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/XNetwork.lua

require("Common/define")
require("LuaScript/StructData/FS_Parser")
require("LuaScript/StructData/FS_ParserJson")
require("LuaScript/XFunctions")

Event = require("events")

require("LuaScript/Network/NI_Login")
require("LuaScript/Network/NI_Game")
require("LuaScript/Network/NI_Buddy")
require("LuaScript/Network/NI_Player")
require("LuaScript/Network/NI_Hero")
require("LuaScript/Network/NI_Bag")
require("LuaScript/Network/NI_Stage")

XNetwork = {}

local this = XNetwork
local transform, gameObject
local isConnecting = false
local GlobalGameTcpProtocolId = {
	DISCONNET = 103,
	EXCEPTION = 102,
	CONNECT = 101,
	RESP_COMMON = XProtocol.BattleProtocolToSystem.RESP_COMMON,
	RESP_CHECK_IS_IN_ZONE = XProtocol.BattleProtocolToRoom.RESP_CHECK_IS_IN_ZONE,
	RESP_MATCH_GAME_IN_PROGRESS = XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_PROGRESS,
	RESP_JOIN_GAME_IN_ZONE = XProtocol.BattleProtocolToRoom.RESP_MATCH_GAME_IN_PROGRESS,
	RESP_HEART_BEAT = XProtocol.BattleProtocolToSystem.RESP_HEART_BEAT,
	RESP_LOGOFF_GAME = XProtocol.BattleProtocolToSystem.RESP_LOGOFF_GAME
}
local GameTcpProtocolIdOnce = {}
local GameTcpProtocolIdMulti = {}

function XNetwork.Start()
	logWarn("============================XNetwork.Start!!===========")
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, GlobalGameTcpProtocolId.CONNECT), this.OnConnect)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, GlobalGameTcpProtocolId.RESP_COMMON), this.OnMessage)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, GlobalGameTcpProtocolId.RESP_HEART_BEAT), this.OnHeartBeat)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, GlobalGameTcpProtocolId.DISCONNET), this.OnDisconnect)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, GlobalGameTcpProtocolId.EXCEPTION), this.OnException)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, GlobalGameTcpProtocolId.RESP_LOGOFF_GAME), this.OnForcedLogOut)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.RESP_ADD_BUDDY_REQUEST, this.OnAddBuddyRequest)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.REQ_ADD_BUDDY_REQUEST, this.OnAddBuddyResp)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.REQ_REJECT_BUDDY_REQUEST, this.OnRejectBuddyFailed)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.RESP_REMOVE_BUDDY_REQUEST, this.OnRemoveBuddyRequest)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.RESP_BUDDY_REQUEST_IS_REJECTED, this.OnRejectBuddyRequest)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.REQ_ACCEPT_BUDDY_REQUEST, this.OnAcceptBuddyFailed)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.RESP_ADD_BUDDY, this.OnAddBuddy)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.RESP_PLAYER_ONLINE_STATUS, this.OnUpdateBuddyState)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.REQ_REMOVE_BUDDY, this.OnRemoveBuddyFailed)
	XNetwork.AddListener(XProtocol.BattleProtocolToBuddy.RESP_REMOVE_BUDDY, this.OnRemoveBuddy)
end

function XNetwork.IsGlobalProtocolId(id)
	for k, v in pairs(GlobalGameTcpProtocolId) do
		if id == v then
			return true
		end
	end

	return false
end

function XNetwork.OnSocket(key, data)
	Event.Brocast(XProtocol.getEventId(XProtocol.Type.Game, key), data)

	if XNetwork.IsGlobalProtocolId(key) == false and GameTcpProtocolIdOnce[key] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.Game, key))

		GameTcpProtocolIdOnce[key] = nil
	end
end

function XNetwork.AddListener(protocolId, fun, once)
	if fun == nil then
		return
	end

	XNetwork.RemoveListener(protocolId)

	if once == true then
		if GameTcpProtocolIdOnce[protocolId] == nil then
			Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId), fun)

			GameTcpProtocolIdOnce[protocolId] = fun
		end
	elseif GameTcpProtocolIdMulti[protocolId] == nil then
		Event.AddListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId), fun)

		GameTcpProtocolIdMulti[protocolId] = fun
	end
end

function XNetwork.RemoveListener(protocolId)
	if GameTcpProtocolIdOnce[protocolId] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId))

		GameTcpProtocolIdOnce[protocolId] = nil
	end

	if GameTcpProtocolIdMulti[protocolId] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId))

		GameTcpProtocolIdMulti[protocolId] = nil
	end
end

function XNetwork.OnConnect()
	isConnecting = true

	SystemHelper.Log("========================================Game Server is connected!!!")
	NI_Game.Login()
end

function XNetwork.OnException()
	ST_Base.StopGameTcpHeartBeat()

	isConnecting = false

	networkMgr:SendConnect()
	SystemHelper.LogTest("GameServer_OnException------>>>>")
end

function XNetwork.OnDisconnect()
	ST_Base.StopGameTcpHeartBeat()
	UIManager.SendMessage("Loading", "SimpleLoading", false)

	isConnecting = false

	SystemHelper.LogTest("========================================Game Server is disconnected!!!")
end

function XNetwork.OnMessage(buffer)
	NI_Game.ParseCommonResponse(buffer)
end

function XNetwork.OnHeartBeat(buffer)
	NI_Game.ParseHeartBeatResponse(buffer)
end

function XNetwork.OnForcedLogOut(buffer)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "已被服务器强制下线")
end

function XNetwork.OnAddBuddyRequest(buffer)
	NI_Buddy.ParseAddBuddyRequest(buffer)
end

function XNetwork.OnAddBuddyRequestResp(value)
	if value == 0 then
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "发送成功")
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "添加失败错误代码" .. value)
	end
end

function XNetwork.OnRejectBuddyFailed(value)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "发生错误,拒绝失败")
end

function XNetwork.OnAcceptBuddyFailed(value)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "发生错误,接受失败")
end

function XNetwork.OnRemoveBuddyRequest(buffer)
	NI_Buddy.ParseRemoveBuddyRequestResponse(buffer)
	UIManager.SendMessage("Buddy", "RefreshRequestList")
end

function XNetwork.OnRejectBuddyRequest(buffer)
	NI_Buddy.ParseRejectBuddyRequestResponse(buffer)
end

function XNetwork.OnAddBuddy(buffer)
	NI_Buddy.ParseAddBuddySuccessResponse(buffer)
	UIManager.SendMessage("Buddy", "RefreshFriendList")
	UIManager.SendMessage("Chat", "AddFriend")
end

function XNetwork.OnUpdateBuddyState(buffer)
	NI_Buddy.ParseUpdateBuddyStateResponse(buffer)
	UIManager.SendMessage("Buddy", "RefreshFriendList")
	UIManager.SendMessage("Chat", "UpdateFriendState", FS_Buddy.UpdateInfo.userid, FS_Buddy.UpdateInfo.isOnline)
end

function XNetwork.OnRemoveBuddy(buffer)
	NI_Buddy.ParseRemoveBuddy(buffer)
end

function XNetwork.OnRemoveBuddyFailed(value)
	UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "发生错误,删除失败")
end

function XNetwork.Unload()
	for key, protocolId in pairs(GlobalGameTcpProtocolId) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId))
		end
	end

	for protocolId, fun in pairs(GameTcpProtocolIdOnce) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId))
		end
	end

	GameTcpProtocolIdOnce = {}

	for protocolId, fun in pairs(GameTcpProtocolIdMulti) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.Game, protocolId))
		end
	end

	GameTcpProtocolIdMulti = {}

	logWarn("Unload XNetwork...")
end

function XNetwork.IsConnecting()
	return isConnecting
end
