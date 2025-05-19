-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Chat.lua

require("LuaScript/StructData/FS_ChatData")

FS_Chat = class("FS_Chat")
FS_Chat.static.ChatType = {
	World = 0,
	Room = 3,
	Near = 2,
	Team = 4,
	Private = 1
}

function FS_Chat:initialize()
	self.ChatInfoList = {}
	self.PrivateNewMsgFlag = {}
	self.UnReadMessageAll = {}
	self.ChatTotalText = ""
end

function FS_Chat:Clear()
	self.ChatInfoList = nil
	self.PrivateNewMsgFlag = nil
	self.UnReadMessageAll = nil
end

function FS_Chat:Parse(chatInfo)
	if chatInfo ~= nil then
		local v_chatData = FS_ChatData:new()

		v_chatData:Parse(chatInfo)

		if self.ChatInfoList[chatInfo.chatType] == nil then
			self.ChatInfoList[chatInfo.chatType] = {}
		end

		if chatInfo.chatType == FS_Chat.ChatType.Private then
			if self.ChatInfoList[chatInfo.chatType][chatInfo.fromId] ~= FS_UserData.playerList:GetUserId() then
				if self.ChatInfoList[chatInfo.chatType][chatInfo.fromId] == nil then
					self.ChatInfoList[chatInfo.chatType][chatInfo.fromId] = {}
				end

				table.insert(self.ChatInfoList[chatInfo.chatType][chatInfo.fromId], v_chatData)

				self.PrivateNewMsgFlag[chatInfo.fromId] = true
			else
				if self.ChatInfoList[chatInfo.chatType][chatInfo.toId] == nil then
					self.ChatInfoList[chatInfo.chatType][chatInfo.toId] = {}
				end

				table.insert(self.ChatInfoList[chatInfo.chatType][chatInfo.toId], v_chatData)
			end
		else
			table.insert(self.ChatInfoList[chatInfo.chatType], v_chatData)
		end

		table.insert(self.UnReadMessageAll, v_chatData)
	end
end

function FS_Chat:GetChatInfoByChannel(channel)
	if next(self.ChatInfoList) ~= nil and channel ~= FS_Chat.ChatType.Private then
		return self.ChatInfoList[channel]
	end

	return nil
end

function FS_Chat:GetPrivateChatInfoByUserID(userid)
	if self.ChatInfoList[FS_Chat.ChatType.Private] ~= nil and self.ChatInfoList[FS_Chat.ChatType.Private][userid] ~= nil then
		return self.ChatInfoList[FS_Chat.ChatType.Private][userid]
	end

	return nil
end

function FS_Chat:GetPrivateNewMsgFlag()
	return self.PrivateNewMsgFlag
end

function FS_Chat:SetMsgRead(userid)
	if self.PrivateNewMsgFlag[userid] ~= nil then
		self.PrivateNewMsgFlag[userid] = false
	end
end

function FS_Chat:HaveUnReadMessage()
	for k, v in pairs(self.PrivateNewMsgFlag) do
		if v == true then
			return true
		end
	end

	return false
end

return FS_Chat
