-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_BattleLogin.lua

local BattleSystem_pb = require("LuaScript/Protocol/Protobuf/BattleSystem_pb")
local Common_pb = require("LuaScript/Protocol/Protobuf/BattleCommon_pb")

NI_BattleLogin = class("NI_BattleLogin")

function NI_BattleLogin.LoginUdp()
	SystemHelper.LogTest("================NI_BattleLogin.LoginUdp========")

	local login = BattleSystem_pb.ReqUdpLogin()
	local msg = login:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToSystem.REQ_UDP_LOGIN)
	buffer:WriteInt(FS_UserData.playerList:GetUserId())
	buffer:WriteInt(FS_Battle_MatchRoom.GetSign())
	buffer:WriteBuffer(msg)
	networkMgrBattleUdp:SendMessage(buffer)
end
