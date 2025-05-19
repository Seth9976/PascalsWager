-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_Launch.lua

require("LuaScript/State/ST_Base")
require("LuaScript/Controller/ControllerLaunch")

ST_Launch = class("ST_Launch", ST_Base)

local this = ST_Launch
local state = 0

ST_Launch.static.StateType = {
	Main = 2,
	Loading = 1,
	Empty = 0
}

function ST_Launch.Enter()
	SystemHelper.Log("[ ******** Launch.Enter() ******** ]")
	ST_Base.Enter()
	ST_Base.InitUiBase()

	state = ST_Lobby.StateType.Empty

	this.ChangeState(ST_Lobby.StateType.Loading)
end

function ST_Launch.FixedUpdate()
	ST_Base.FixedUpdate()
end

function ST_Launch.Update()
	ST_Base.Update()
	this.UpdateScene()
end

function ST_Launch.LateUpdate()
	ST_Base.LateUpdate()
end

function ST_Launch.Exit()
	ST_Base.ClearUiScene()
	ST_Base.Exit()

	if sceneController ~= nil then
		sceneController:Exit()

		sceneController = nil
	end
end

function ST_Launch.ChangeState(st_type)
	state = st_type

	if state == ST_Launch.StateType.Loading then
		this.EnterSceneLaunch()
	elseif state == ST_Launch.StateType.Main then
		this.EnterMain()
	end
end

function ST_Launch.EnterSceneLaunch()
	sceneController = ControllerLaunch:new()
end

function ST_Launch.EnterMain()
	ST_Scene.ChangeScene(ST_Scene.SceneType.Start)
end

function ST_Launch.UpdateScene()
	if sceneController == nil then
		return
	end

	sceneController:Update()

	if state == ST_Launch.StateType.Loading and sceneController:isLoadEnd() == true then
		this.ChangeState(ST_Launch.StateType.Main)
	end
end

function ST_Launch.GetSceneController()
	return sceneController
end
