-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Buddy.lua

FS_Buddy = class("FS_Friend")
FS_Buddy.FriendList = {
	{
		name = "abc",
		userid = 1234,
		isOnline = true,
		icon = 1,
		iconUrl = "",
		serverid = 10001
	},
	{
		name = "ramz",
		userid = 1256,
		isOnline = true,
		icon = 2,
		iconUrl = "",
		serverid = 10001
	},
	{
		name = "666",
		userid = 2234,
		isOnline = false,
		icon = 3,
		iconUrl = "",
		serverid = 10001
	},
	{
		name = "大头儿子粑粑",
		userid = 4567,
		isOnline = false,
		icon = 4,
		iconUrl = "",
		serverid = 10001
	},
	{
		name = "习惯近身平A",
		userid = 2211,
		isOnline = false,
		icon = 2,
		iconUrl = "",
		serverid = 10001
	},
	{
		name = "miracle",
		userid = 2233,
		isOnline = true,
		icon = 1,
		iconUrl = "",
		serverid = 10001
	}
}
FS_Buddy.RequestList = {}
FS_Buddy.UpdateInfo = {}
FS_Buddy.RemoveInfo = {}

function FS_Buddy.initialize()
	return
end

function FS_Buddy.parse(p_val)
	return
end

function FS_Buddy.parseRequest(p_val)
	if FS_Buddy.isRequestListContain(p_val.fromId) then
		return
	end

	local reqFriend = {}

	reqFriend.userid = p_val.fromId
	reqFriend.name = p_val.fromName
	reqFriend.icon = p_val.fromIcon
	reqFriend.iconUrl = p_val.fromIconUrl
	reqFriend.serverid = p_val.fromServerId
	reqFriend.level = p_val.fromLevel

	table.insert(FS_Buddy.RequestList, reqFriend)
end

function FS_Buddy.GetFriendList()
	return FS_Buddy.FriendList
end

function FS_Buddy.GetFriendNum()
	return #FS_Buddy.FriendList
end

function FS_Buddy.GetOnlineFriendList()
	local tempList = {}

	for k, v in pairs(FS_Buddy.FriendList) do
		if v.isOnline == true then
			table.insert(tempList, v)
		end
	end

	return tempList
end

function FS_Buddy.GetFriendByIndex(index)
	return FS_Buddy.FriendList[index]
end

function FS_Buddy.GetFriendByUserId(userid)
	for k, v in pairs(FS_Buddy.FriendList) do
		if v.userid == userid then
			return v
		end
	end

	return nil
end

function FS_Buddy.GetIndexByUserId(userid)
	for k, v in pairs(FS_Buddy.FriendList) do
		if v.userid == userid then
			return k
		end
	end

	return nil
end

function FS_Buddy.GetRequestList()
	return FS_Buddy.RequestList
end

function FS_Buddy.GetRequestNum()
	return #FS_Buddy.RequestList
end

function FS_Buddy.DelInRequestList(id)
	for k, v in FS_Buddy.RequestList do
		if v.userid == id then
			table.remove(FS_Buddy.RequestList, k)
		end
	end
end

function FS_Buddy.isRequestListContain(id)
	for k, v in pairs(FS_Buddy.RequestList) do
		if v.userid == id then
			return true
		end
	end

	return false
end

function FS_Buddy.ConvertID()
	return
end

function FS_Buddy.parseRemoveBuddyRequest(p_val)
	FS_Buddy.DelInRequestList(p_val.playerId)
end

function FS_Buddy.parseRejectBuddyRequest(msg)
	return
end

function FS_Buddy.parseAddBuddySuccess(p_val)
	local newFriend = {}

	newFriend.userid = p_val.playerId
	newFriend.name = p_val.name
	newFriend.icon = p_val.icon
	newFriend.iconUrl = p_val.iconUrl
	newFriend.serverid = p_val.serverId
	newFriend.isOnline = p_val.isOnline
	newFriend.level = p_val.level
	FS_Buddy.UpdateInfo = newFriend

	table.insert(FS_Buddy.FriendList, newFriend)
end

function FS_Buddy.parseUpdateBuddyState(p_val)
	for k, v in pairs(FS_Buddy.FriendList) do
		if v.userid == p_val.playerId then
			v.isOnline = p_val.isOnline
			FS_Buddy.UpdateInfo.userid = p_val.playerId
			FS_Buddy.UpdateInfo.isOnline = p_val.isOnline
		end
	end
end

function FS_Buddy.parseRemoveBuddy(p_val)
	local playerid = p_val.playerId
	local serverid = p_val.serverId
end

function FS_Buddy.ParseTeam()
	return
end

return FS_Buddy
