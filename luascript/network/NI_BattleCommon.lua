-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_BattleCommon.lua

require("LuaScript/StructData/FS_Battle_CommonResponse")
require("LuaScript/StructData/FS_Battle_PingPong")

local BattleCommon_pb = require("LuaScript/Protocol/Protobuf/BattleCommon_pb")
local BattleSystem_pb = require("LuaScript/Protocol/Protobuf/BattleSystem_pb")

NI_BattleCommon = class("NI_BattleCommon")

function NI_BattleCommon.Ping()
	local index = FS_Battle_PingPong.Ping()
	local ping = BattleSystem_pb.Ping()

	ping.index = index

	local msg = ping:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToSystem.PING)
	buffer:WriteInt(FS_UserData.playerList:GetUserId())
	buffer:WriteInt(FS_Battle_MatchRoom.GetSign())
	buffer:WriteBuffer(msg)
	networkMgrBattleUdp:SendMessage(buffer)
end

function NI_BattleCommon.ParsePingResponse(buffer)
	local data = buffer:ReadBuffer()
	local msg = BattleSystem_pb.Pong()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_PingPong.Parse(msg)
	end
end

function NI_BattleCommon.ParseBattleCommonResponse(protocol_type, buffer)
	local data = buffer:ReadBuffer()
	local msg = BattleCommon_pb.RespCommonMessage()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_CommonResponse.Parse(protocol_type, msg)
	end
end
