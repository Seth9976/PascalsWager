-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Buddy.lua

local BattleBuddy_pb = require("LuaScript/Protocol/Protobuf/BattleBuddy_pb")

NI_Buddy = class("NI_Chat")

function NI_Buddy.AddBuddyRequest(data)
	SystemHelper.LogTest("================NI_Buddy.AddBuddy================")

	local request = BattleBuddy_pb.BuddyRequestInfo()

	request.toServerId = data.fromServerId
	request.toId = data.fromId

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToBuddy.REQ_ADD_BUDDY_REQUEST)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Buddy.ParseAddBuddyRequest(buffer)
	SystemHelper.LogTest("================NI_Buddy.AddBuddyRESP================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyRequestInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Buddy.parseRequest(msg)
	end
end

function NI_Buddy.ParseInitBuddyListResponse(buffer)
	SystemHelper.LogTest("================NI_Buddy.InitBuddyList================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyList()

	msg:ParseFromString(data)

	if msg ~= nil then
		SystemHelper.Log(#msg.list)
	end
end

function NI_Buddy.ParseInitBuddyRequestListResponse(buffer)
	SystemHelper.LogTest("================NI_Buddy.InitBuddyRequestList================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyRequestList()

	msg:ParseFromString(data)

	if msg ~= nil then
		SystemHelper.Log(#msg.list)
	end
end

function NI_Buddy.AcceptBuddyRequest(data)
	SystemHelper.LogTest("================NI_Buddy.Accept================")

	local request = BattleBuddy_pb.BuddyInfo()

	request.serverId = data.userid
	request.playerId = data.serverid

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToBuddy.REQ_REJECT_BUDDY_REQUEST)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Buddy.RejectBuddyRequest(data)
	SystemHelper.LogTest("================NI_Buddy.Reject================")

	local request = BattleBuddy_pb.BuddyInfo()

	request.serverId = data.userid
	request.playerId = data.serverid

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToBuddy.REQ_ACCEPT_BUDDY_REQUEST)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Buddy.ParseRemoveBuddyRequestResponse(buffer)
	SystemHelper.LogTest("================NI_Buddy.RemoveBuddyRequestRESP================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Buddy.parseRemoveBuddyRequest(msg)
	end
end

function NI_Buddy.ParseRejectBuddyRequestResponse(buffer)
	SystemHelper.LogTest("================NI_Buddy.RejectBuddyRequestRESP================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Buddy.parseRejectBuddyRequest(msg)
	end
end

function NI_Buddy.ParseAddBuddySuccessResponse(buffer)
	SystemHelper.LogTest("================NI_Buddy.AddBuddySuccessRESP================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Buddy.parseAddBuddySuccess(msg)
	end
end

function NI_Buddy.ParseUpdateBuddyStateResponse(buffer)
	SystemHelper.LogTest("================NI_Buddy.UpdateBuddyStateRESP================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.UpdateOnlineStatus()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Buddy.parseUpdateBuddyState(msg)
	end
end

function NI_Buddy.RemoveBuddy(data)
	SystemHelper.LogTest("================NI_Buddy.Remove================")

	local request = BattleBuddy_pb.BuddyIdInfo()

	request.serverId = data.userid
	request.playerId = data.serverid

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToBuddy.REQ_REMOVE_BUDDY)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Buddy.ParseRemoveBuddy(buffer)
	SystemHelper.LogTest("================NI_Buddy.ParseRemoveBuddyRESP================")

	local data = buffer:ReadBuffer()
	local msg = BattleBuddy_pb.BuddyIdInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Buddy.parseRemoveBuddy(msg)
	end
end
