-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Player.lua

local BattleSystem_pb = require("LuaScript/Protocol/Protobuf/BattleSystem_pb")
local BattlePlayer_pb = require("LuaScript/Protocol/Protobuf/BattlePlayer_pb")

NI_Player = class("NI_Player")

function NI_Player.CreatePlayer(name)
	SystemHelper.LogTest("================NI_Player.CreatePlayer================")

	local request = BattlePlayer_pb.ReqCreatePlayer()

	request.name = name

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToPlayer.REQ_CREATE_PLAYER)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Player.ParseCreatePlayerResponse(buffer)
	SystemHelper.LogTest("================NI_Player.ParseCreatePlayerResponse================")

	local data = buffer:ReadBuffer()
	local msg = BattlePlayer_pb.PlayerList()

	msg:ParseFromString(data)

	if msg ~= nil then
		SystemHelper.LogTest("================ NI_Player login1111111111")
		FS_UserData.playerList:Parse(msg)
		NI_Game.RequestPlayerEnter()
	end
end

function NI_Player.ChangePlayerName(name)
	UIManager.SendMessage("Loading", "SimpleLoading", true)
	SystemHelper.LogTest("================NI_Player.ChangePlayerName================")

	local request = BattlePlayer_pb.EditPlayerInfo()

	request.name = name
	request.icon = FS_UserData.playerList:GetPlayer():GetIcon()

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToPlayer.REQ_EDIT_PLAYER_INFO)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Player.ChangeIcon(icon)
	UIManager.SendMessage("Loading", "SimpleLoading", true)
	SystemHelper.LogTest("================NI_Player.ChangeIcon================")

	local request = BattlePlayer_pb.EditPlayerInfo()

	request.name = FS_UserData.playerList:GetPlayer():GetName()
	request.icon = icon

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToPlayer.REQ_EDIT_PLAYER_INFO)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Player.ParseEditPlayerInfoResponse(buffer)
	UIManager.SendMessage("Loading", "SimpleLoading", false)
	SystemHelper.LogTest("================NI_Player.ParseEditPlayerInfoResponse================")

	local data = buffer:ReadBuffer()
	local msg = BattlePlayer_pb.EditPlayerInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_UserData.playerList:GetPlayer():ParseEditInfo(msg)
	end
end
