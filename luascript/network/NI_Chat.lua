-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Chat.lua

local BattleChat_pb = require("LuaScript/Protocol/Protobuf/BattleChat_pb")

NI_Chat = class("NI_Chat")

function NI_Chat.SendChatMessage(message)
	SystemHelper.LogTest("================NI_Chat.send================")

	local request = BattleChat_pb.ChatInfo()

	request.content = message.content
	request.chatType = message.chatType

	local msg = request:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToChat.REQ_CHAT)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_Chat.ParseChatMessage(buffer)
	SystemHelper.LogTest("================NI_Chat.receieve================")

	local data = buffer:ReadBuffer()
	local msg = BattleChat_pb.ChatInfo()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_UserData.chat:Parse(msg)
	end
end
