-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/XNetworkBattleUdp.lua

require("Common/define")
require("LuaScript/Network/NI_BattleCommon")
require("LuaScript/StructData/FS_Parser")
require("LuaScript/StructData/FS_ParserJson")
require("LuaScript/XFunctions")

Event = require("events")

local print_r = require("3rd/sproto/print_r")

XNetworkBattleUdp = {}

local this = XNetworkBattleUdp
local isConnecting = false
local GlobalBattleUdpProtocolId = {
	UDP_CONNECT = XProtocol.BattleProtocolToSystem.UDP_CONNECT,
	RESP_COMMON = XProtocol.BattleProtocolToSystem.RESP_COMMON,
	PONG = XProtocol.BattleProtocolToSystem.PONG
}
local BattleUdpProtocolIdOnce = {}
local BattleUdpProtocolIdMulti = {}

function XNetworkBattleUdp.Start()
	logWarn("============================XNetworkBattleUdp.Start!!")
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, GlobalBattleUdpProtocolId.UDP_CONNECT), this.OnConnectUdp)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, GlobalBattleUdpProtocolId.RESP_COMMON), this.OnCommonResponse)
	Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, GlobalBattleUdpProtocolId.PONG), this.OnPong)
end

function XNetworkBattleUdp.IsGlobalProtocolId(id)
	for k, v in pairs(GlobalBattleUdpProtocolId) do
		if id == v then
			return true
		end
	end

	return false
end

function XNetworkBattleUdp.OnSocket(key, data)
	Event.Brocast(XProtocol.getEventId(XProtocol.Type.BattleUdp, key), data)

	if XNetworkBattleUdp.IsGlobalProtocolId(key) == false and BattleUdpProtocolIdOnce[key] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, key))

		BattleUdpProtocolIdOnce[key] = nil
	end
end

function XNetworkBattleUdp.AddListener(protocolId, fun, once)
	if fun == nil then
		return
	end

	XNetworkBattleUdp.RemoveListener(protocolId)

	if once == true then
		if BattleUdpProtocolIdOnce[protocolId] == nil then
			Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId), fun)

			BattleUdpProtocolIdOnce[protocolId] = fun
		end
	elseif BattleUdpProtocolIdMulti[protocolId] == nil then
		Event.AddListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId), fun)

		BattleUdpProtocolIdMulti[protocolId] = fun
	end
end

function XNetworkBattleUdp.RemoveListener(protocolId)
	if BattleUdpProtocolIdOnce[protocolId] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId))

		BattleUdpProtocolIdOnce[protocolId] = nil
	end

	if BattleUdpProtocolIdMulti[protocolId] ~= nil then
		Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId))

		BattleUdpProtocolIdMulti[protocolId] = nil
	end
end

function XNetworkBattleUdp.Disconnect()
	isConnecting = false
end

function XNetworkBattleUdp.OnConnectUdp()
	isConnecting = true

	logWarn("=============================================Battle UDP Server connected!!")
end

function XNetworkBattleUdp.OnCommonResponse(buffer)
	NI_BattleCommon.ParseBattleCommonResponse(XProtocol.Type.BattleUdp, buffer)
end

function XNetworkBattleUdp.OnPong(buffer)
	NI_BattleCommon.ParsePingResponse(buffer)
end

function XNetworkBattleUdp.Unload()
	for key, protocolId in pairs(GlobalBattleUdpProtocolId) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId))
		end
	end

	for protocolId, fun in pairs(BattleUdpProtocolIdOnce) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId))
		end
	end

	BattleUdpProtocolIdOnce = {}

	for protocolId, fun in pairs(BattleUdpProtocolIdMulti) do
		if fun ~= nil then
			Event.RemoveListener(XProtocol.getEventId(XProtocol.Type.BattleUdp, protocolId))
		end
	end

	BattleUdpProtocolIdMulti = {}

	logWarn("Unload XNetworkBattleUdp...")
end

function XNetworkBattleUdp.IsConnecting()
	return isConnecting
end
