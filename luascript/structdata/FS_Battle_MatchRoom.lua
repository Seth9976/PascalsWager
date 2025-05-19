-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_MatchRoom.lua

FS_Battle_MatchRoom = class("FS_Battle_MatchRoom")
FS_Battle_MatchRoom.battleServerHost = ""
FS_Battle_MatchRoom.battleServerPort = 0
FS_Battle_MatchRoom.sign = 0
FS_Battle_MatchRoom.haveRoom = false
FS_Battle_MatchRoom.battleTypeInRoom = 0

function FS_Battle_MatchRoom.initialize()
	FS_Battle_MatchRoom.battleServerHost = ""
	FS_Battle_MatchRoom.battleServerPort = 0
	FS_Battle_MatchRoom.sign = 0
	FS_Battle_MatchRoom.haveRoom = false
	FS_Battle_MatchRoom.battleTypeInRoom = 0
end

function FS_Battle_MatchRoom.Parse(p_val)
	if p_val ~= nil then
		FS_Battle_MatchRoom.battleServerHost = FS_Parser.toString(p_val.battleServerHost, FS_Battle_MatchRoom.battleServerHost)
		FS_Battle_MatchRoom.battleServerPort = FS_Parser.toInt(p_val.battleServerPort, FS_Battle_MatchRoom.battleServerPort)
		FS_Battle_MatchRoom.sign = FS_Parser.toInt(p_val.sign, FS_Battle_MatchRoom.sign)
	end
end

function FS_Battle_MatchRoom.ParseCheckRoom(p_val)
	if p_val ~= nil then
		SystemHelper.LogTest("====FS_Battle_MatchGame.Parse==p_val.isInZone=" .. tostring(p_val.isInZone) .. ",type=" .. tostring(p_val.gameType))

		FS_Battle_MatchRoom.haveRoom = FS_Parser.toBool(p_val.isInZone, FS_Battle_MatchRoom.haveRoom)
		FS_Battle_MatchRoom.battleTypeInRoom = FS_Parser.toInt(p_val.gameType, FS_Battle_MatchRoom.battleTypeInRoom)
	end
end

function FS_Battle_MatchRoom.GetHost()
	return FS_Battle_MatchRoom.battleServerHost
end

function FS_Battle_MatchRoom.GetPort()
	return FS_Battle_MatchRoom.battleServerPort
end

function FS_Battle_MatchRoom.GetSign()
	return FS_Battle_MatchRoom.sign
end

function FS_Battle_MatchRoom.IsHaveRoom()
	return FS_Battle_MatchRoom.haveRoom
end

function FS_Battle_MatchRoom.GetRoomBattleType()
	return FS_Battle_MatchRoom.battleTypeInRoom
end
