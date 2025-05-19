-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_MainReload.lua

require("LuaScript/State/ST_Base")

ST_MainReload = class("ST_MainReload", ST_Base)

local this = ST_MainReload
local state

ST_MainReload.StateType = {
	Ready = 1,
	Empty = 0
}

function ST_MainReload.Enter()
	ST_Base.Enter()

	state = ST_MainReload.StateType.Empty

	this.ChangeState(ST_MainReload.StateType.Ready)
end

function ST_MainReload.Update()
	ST_Base.Update()
end

function ST_MainReload.Exit()
	ST_Base.Exit()
end

function ST_MainReload.ChangeState(st_type)
	if st_type == ST_MainReload.StateType.Ready then
		this.Ready()
	end
end

function ST_MainReload.Ready()
	return
end
