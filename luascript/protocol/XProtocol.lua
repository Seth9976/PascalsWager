-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Protocol/XProtocol.lua

XProtocol = class("XProtocol")
XProtocol.ProtocolToSystem = require("LuaScript/Server/Command/ProtocolToSystem")
XProtocol.BattleProtocolCatalog = require("LuaScript/Server/Command/BattleProtocolCatalog")
XProtocol.BattleProtocolToBattle = require("LuaScript/Server/Command/BattleProtocolToBattle")
XProtocol.BattleProtocolToRoom = require("LuaScript/Server/Command/BattleProtocolToRoom")
XProtocol.BattleProtocolToSystem = require("LuaScript/Server/Command/BattleProtocolToSystem")
XProtocol.BattleProtocolToPlayer = require("LuaScript/Server/Command/BattleProtocolToPlayer")
XProtocol.BattleProtocolToChat = require("LuaScript/Server/Command/BattleProtocolToChat")
XProtocol.BattleProtocolToBuddy = require("LuaScript/Server/Command/BattleProtocolToBuddy")
XProtocol.BattleProtocolToBag = require("LuaScript/Server/Command/BattleProtocolToBag")
XProtocol.BattleProtocolToHero = require("LuaScript/Server/Command/BattleProtocolToHero")
XProtocol.BattleProtocolToStage = require("LuaScript/Server/Command/BattleProtocolToStage")
XProtocol.Type = {
	BattleTcp = 2,
	Game = 1,
	BattleUdp = 3
}

function XProtocol.getEventId(type, id)
	if type == XProtocol.Type.Game then
		return "Game_" .. id
	elseif type == XProtocol.Type.BattleTcp then
		return "BattleTcp_" .. id
	elseif type == XProtocol.Type.BattleUdp then
		return "BattleUdp_" .. id
	else
		SystemHelper.LogError("=========XProtocol type not known, type=" .. type)
	end

	return id
end
