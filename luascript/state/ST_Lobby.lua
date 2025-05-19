-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_Lobby.lua

require("LuaScript/State/ST_Base")
require("LuaScript/Controller/ControllerLobby")

ST_Lobby = class("ST_Lobby", ST_Base)

local this = ST_Lobby
local state, sceneController
local ringIntereval = 5
local tweetIntereval = 5

ST_Lobby.StateType = {
	Main = 2,
	Loading = 1,
	Empty = 0
}
ST_Lobby.needLogin = false

function ST_Lobby.Enter()
	ST_Base.Enter()

	state = ST_Lobby.StateType.Empty

	if LS_Setting.graphics.framerate == LS_Setting.FrameRateLevel.Unlimited then
		UnityEngine.Application.targetFrameRate = -1
	else
		UnityEngine.Application.targetFrameRate = LS_Setting.FrameRate[LS_Setting.graphics.framerate]
	end

	if DebugShow == true then
		local goDebug = GoFind("Debug")

		if goDebug ~= nil then
			local tfCanvas = TfFindChild(goDebug.transform, "DebugCanvas")

			if tfCanvas ~= nil then
				tfCanvas.gameObject:SetActive(true)
			end

			tfCanvas = nil
		end

		goDebug = nil
	end

	this.ChangeState(ST_Lobby.StateType.Loading)
end

function ST_Lobby.FixedUpdate()
	ST_Base.FixedUpdate()
end

function ST_Lobby.Update()
	ST_Base.Update()
	this.UpdateScene()
end

function ST_Lobby.LateUpdate()
	ST_Base.LateUpdate()
end

function ST_Lobby.Exit()
	ST_Base.ClearUiScene()
	ST_Base.Exit()

	if sceneController ~= nil then
		sceneController:Exit()

		sceneController = nil
	end
end

function ST_Lobby.ChangeState(st_type)
	state = st_type

	if state == ST_Lobby.StateType.Loading then
		this.EnterSceneLobby()
	elseif state == ST_Lobby.StateType.Main then
		this.EnterMain()
	end
end

function ST_Lobby.OnChangeScreen(width, height)
	if sceneController ~= nil then
		sceneController:OnChangeScreen(width, height)
	end
end

function ST_Lobby.EnterSceneLobby()
	sceneController = ControllerLobby:new()
end

function ST_Lobby.EnterMain()
	UIManager.SendMessage("Loading", "SetActive", false)
	AudioCtrl.SetSceneBGM(ST_Scene.SceneType.Lobby)
end

function ST_Lobby.UpdateScene()
	if sceneController == nil then
		return
	end

	sceneController:Update()

	if state == ST_Lobby.StateType.Loading and sceneController:isLoadEnd() == true then
		this.ChangeState(ST_Lobby.StateType.Main)
	end
end

function ST_Lobby.GetSceneController()
	return sceneController
end
