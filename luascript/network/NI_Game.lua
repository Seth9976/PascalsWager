-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Game.lua

local BattleSystem_pb = require("LuaScript/Protocol/Protobuf/BattleSystem_pb")
local BattlePlayer_pb = require("LuaScript/Protocol/Protobuf/BattlePlayer_pb")
local BattleCommon_pb = require("LuaScript/Protocol/Protobuf/BattleCommon_pb")

NI_Game = class("NI_Game")

function NI_Game.Login()
	SystemHelper.LogTest("================NI_Game.Login========")

	if ReqLogin then
		local login = BattleSystem_pb.ReqLoginGame()

		login.glbAccId = FS_UserData.playerList:GetUserId()
		login.sign = FS_UserData.playerList:GetSign()
		login.time = FS_UserData.playerList:GetSignTime()
		login.channelId = "test"
		login.channelUserId = ""

		local msg = login:SerializeToString()
		local buffer = ByteBuffer.New()

		buffer:WriteShort(XProtocol.BattleProtocolToSystem.REQ_LOGIN_GAME)
		buffer:WriteBuffer(msg)
		networkMgr:SendMessage(buffer)
	else
		ControllerLobby.OnLogin()
	end
end

function NI_Game.ParseLoginResponse(buffer)
	SystemHelper.LogTest("================ NI_Game ParseLoginResponse============")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattlePlayer_pb.PlayerList()

		msg:ParseFromString(data)
	else
		msg = BattlePlayer_pb.PlayerList()

		local playerInfo = msg.players:add()

		playerInfo.id = 1
		playerInfo.name = ""
		playerInfo.profession = 1
		playerInfo.gender = 1
		playerInfo.icon = 1
		playerInfo.iconUrl = ""
	end

	if msg ~= nil then
		FS_UserData.playerList:Parse(msg)

		local num = FS_UserData.playerList:GetPlayerListNum()

		if ReqLogin then
			if num > 0 then
				ST_Base.StartGameTcpHeartBeat()
				NI_Game.RequestPlayerEnter()
			else
				NI_Player.CreatePlayer("1")
			end
		else
			NI_Game.RequestPlayerEnter()
		end
	end
end

function NI_Game.RequestPlayerEnter()
	SystemHelper.LogTest("================NI_Game.RequestPlayerEnter================")

	if ReqLogin then
		local request = BattlePlayer_pb.ReqPlayerEnter()

		request.playerId = FS_UserData.playerList:GetPlayerId()

		local msg = request:SerializeToString()
		local buffer = ByteBuffer.New()

		buffer:WriteShort(XProtocol.BattleProtocolToPlayer.REQ_PLAYER_ENTER)
		buffer:WriteBuffer(msg)
		networkMgr:SendMessage(buffer)
	else
		ControllerLobby.OnEnter()
		ControllerLobby.OnInitChargeLogs()
		ControllerLobby.OnInit(0)
	end
end

function NI_Game.ParsePlayerEnterResponse(buffer)
	SystemHelper.LogTest("================NI_Game.ParsePlayerEnterResponse================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattlePlayer_pb.PlayerInitInfo()

		msg:ParseFromString(data)
	else
		msg = BattlePlayer_pb.PlayerInitInfo()
		msg.gameServerId = 1
		msg.id = 1
		msg.name = ""
		msg.profession = 1
		msg.gender = 1
		msg.icon = 1
		msg.iconUrl = ""
		msg.coin = 0
		msg.gold = 0
		msg.ticket = 0
		msg.level = 1
		msg.exp = 0
		msg.vip = 0
		msg.vipExp = 0
	end

	if msg ~= nil then
		FS_UserData.playerList:ParseEnter(msg)
	end
end

function NI_Game.ParseInitChargeResponse(buffer)
	SystemHelper.LogTest("================NI_Game.ParseInitChargeResponse================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()
		local msg = BattlePlayer_pb.ChargeLogs()

		msg:ParseFromString(data)
	else
		msg = buffer
	end

	if msg ~= nil then
		SystemHelper.Log("[TODO]")
	end
end

function NI_Game.ParseInitMailsResponse(buffer)
	SystemHelper.LogTest("================NI_Game.ParseInitMailsResponse================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()
		local msg = BattlePlayer_pb.Mails()

		msg:ParseFromString(data)
	else
		msg = buffer
	end

	if msg ~= nil then
		SystemHelper.Log("[TODO]")
	end
end

function NI_Game.ParseCommonResponse(buffer)
	SystemHelper.LogTest("================NI_Game.ParseCommonResponse================")

	local data = buffer:ReadBuffer()
	local msg = BattleCommon_pb.RespCommonMessage()

	msg:ParseFromString(data)

	if msg ~= nil then
		SystemHelper.LogTest("Common" .. msg.pCode .. ":" .. msg.value)
		Event.Brocast(XProtocol.getEventId(XProtocol.Type.Game, msg.pCode), msg.value)
	end
end

function NI_Game.HeartBeat()
	SystemHelper.LogTest("================NI_Game.ParseHeartBeat================")

	local heartBeat = BattleSystem_pb.Heartbeat()
	local msg = heartBeat:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToSystem.HEART_BEAT)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Game.ParseHeartBeatResponse(buffer)
	SystemHelper.LogTest("================NI_Game.ParseHeartBeatResponse================")

	local data = buffer:ReadBuffer()
	local msg = BattleSystem_pb.RespHeartbeat()

	msg:ParseFromString(data)

	if msg ~= nil then
		-- block empty
	end
end
