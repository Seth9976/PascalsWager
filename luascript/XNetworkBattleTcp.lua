-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/XNetworkBattleTcp.lua

require("Common/define")
require("LuaScript/Network/NI_BattleCommon")
require("LuaScript/StructData/FS_Parser")
require("LuaScript/StructData/FS_ParserJson")
require("LuaScript/XFunctions")

Event = require("events")

local print_r = require("3rd/sproto/print_r")

XNetworkBattleTcp = {}

local this = XNetworkBattleTcp
local transform, gameObject
local isConnecting = false
local GlobalBattleTcpProtocolId = {
	TCP_CONNECT = XProtocol.BattleProtocolToSystem.TCP_CONNECT,
	RESP_COMMON = XProtocol.BattleProtocolToSystem.RESP_COMMON,
	RESP_LOGOFF_BATTLE = XProtocol.BattleProtocolToSystem.RESP_LOGOFF_BATTLE,
	RESP_USER_OFFLINE = XProtocol.BattleProtocolToSystem.RESP_USER_OFFLINE,
	RESP_USER_ONLINE = XProtocol.BattleProtocolToSystem.RESP_USER_ONLINE
}
local BattleTcpProtocolIdOnce = {}
local BattleTcpProtocolIdMulti = {}

function XNetworkBattleTcp.Start()
	logWarn("============================XNetworkBattleTcp.Start!!===============")
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, GlobalBattleTcpProtocolId.TCP_CONNECT), this.OnConnect)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, GlobalBattleTcpProtocolId.RESP_COMMON), this.OnCommonResponse)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, GlobalBattleTcpProtocolId.RESP_LOGOFF_BATTLE), this.OnDisconnect)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, GlobalBattleTcpProtocolId.RESP_USER_OFFLINE), this.OnUserDisconnect)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, GlobalBattleTcpProtocolId.RESP_USER_ONLINE), this.OnUserConnect)
end

function XNetworkBattleTcp.IsGlobalProtocolId(id)
	for k, v in pairs(GlobalBattleTcpProtocolId) do
		if id == v then
			return true
		end
	end

	return false
end

function XNetworkBattleTcp.OnSocket(key, data)
	Event.Brocast(XProtocol.getEventId(XProtocol.Type.BattleTcp, key), data)

	if XNetworkBattleTcp.IsGlobalProtocolId(key) == false and BattleTcpProtocolIdOnce[key] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, key))

		BattleTcpProtocolIdOnce[key] = nil
	end
end

function XNetworkBattleTcp.AddListener(protocolId, fun, once)
	if fun == nil then
		return
	end

	XNetworkBattleTcp.RemoveListener(protocolId)

	if once == true then
		if BattleTcpProtocolIdOnce[protocolId] == nil then
			Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId), fun)

			BattleTcpProtocolIdOnce[protocolId] = fun
		end
	elseif BattleTcpProtocolIdMulti[protocolId] == nil then
		Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId), fun)

		BattleTcpProtocolIdMulti[protocolId] = fun
	end
end

function XNetworkBattleTcp.RemoveListener(protocolId)
	if BattleTcpProtocolIdOnce[protocolId] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId))

		BattleTcpProtocolIdOnce[protocolId] = nil
	end

	if BattleTcpProtocolIdMulti[protocolId] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId))

		BattleTcpProtocolIdMulti[protocolId] = nil
	end
end

function XNetworkBattleTcp.Disconnect()
	isConnecting = false
end

function XNetworkBattleTcp.OnConnect()
	isConnecting = true

	logWarn("=============================================Battle TCP Server connected!!")
end

function XNetworkBattleTcp.OnUserConnect()
	logWarn("============================================OnUserConnect!!")
end

function XNetworkBattleTcp.OnException()
	isConnecting = false

	NetManagerBattleTcp:SendConnect()
	logError("OnException------->>>>")
end

function XNetworkBattleTcp.OnDisconnect()
	isConnecting = false

	logWarn("=============================================Battle Server disconnect !!")
end

function XNetworkBattleTcp.OnUserDisconnect()
	logWarn("============================================OnUserDisconnect !!")
end

function XNetworkBattleTcp.OnMessage(buffer)
	return
end

function XNetworkBattleTcp.OnCommonResponse(buffer)
	NI_BattleCommon.ParseBattleCommonResponse(XProtocol.Type.BattleTcp, buffer)
end

function XNetworkBattleTcp.Unload()
	for key, protocolId in pairs(GlobalBattleTcpProtocolId) do
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId))
	end

	for protocolId, fun in pairs(BattleTcpProtocolIdOnce) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId))
		end
	end

	BattleTcpProtocolIdOnce = {}

	for protocolId, fun in pairs(BattleTcpProtocolIdMulti) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleTcp, protocolId))
		end
	end

	BattleTcpProtocolIdMulti = {}

	logWarn("Unload XNetworkBattleTcp...")
end

function XNetworkBattleTcp.IsConnecting()
	return isConnecting
end
