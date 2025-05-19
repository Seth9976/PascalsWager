-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_LobbyReload.lua

require("LuaScript/State/ST_Base")

ST_LobbyReload = class("ST_LobbyReload", ST_Base)

local this = ST_LobbyReload
local state

ST_LobbyReload.StateType = {
	Ready = 1,
	Empty = 0
}

function ST_LobbyReload.Enter()
	ST_Base.Enter()

	state = ST_LobbyReload.StateType.Empty

	this.ChangeState(ST_LobbyReload.StateType.Ready)
end

function ST_LobbyReload.Update()
	ST_Base.Update()
end

function ST_LobbyReload.Exit()
	ST_Base.Exit()
end

function ST_LobbyReload.ChangeState(st_type)
	if st_type == ST_LobbyReload.StateType.Ready then
		this.Ready()
	end
end

function ST_LobbyReload.Ready()
	return
end
