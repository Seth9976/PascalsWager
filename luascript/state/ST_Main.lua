-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_Main.lua

require("LuaScript/State/ST_Base")
require("LuaScript/Controller/ControllerMain")

ST_Main = class("ST_Main", ST_Base)

local this = ST_Main
local state, stateSub, sceneController

ST_Main.StateType = {
	LoadingMain = 1,
	Main = 2,
	Empty = 0
}

function ST_Main.Enter()
	ST_Base.Enter()

	state = ST_Main.StateType.Empty

	if DebugShow == true then
		local goDebug = GoFind("Debug")

		if goDebug ~= nil then
			local tfCanvas = TfFindChild(goDebug.transform, "DebugCanvas")

			if tfCanvas ~= nil then
				tfCanvas.gameObject:SetActive(true)
			end
		end
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local storyId = FS_UserData.story:GetStoryId()

		if MS_StoryList.IsStoryCarriage(storyId) == true then
			ST_Base.RemoveNodeTf("Maze")
			ST_Base.RemoveNodeTf("StatueUI")
		elseif MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
			ST_Base.RemoveNodeTf("MapView")
			ST_Base.RemoveNodeTf("Wear")
		else
			ST_Base.RemoveNodeTf("MapView")
			ST_Base.RemoveNodeTf("Maze")
			ST_Base.RemoveNodeTf("StatueUI")
			ST_Base.RemoveNodeTf("Wear")
		end
	end

	this.ChangeState(ST_Main.StateType.LoadingMain)
end

function ST_Main.Update()
	ST_Base.Update()

	if state == ST_Main.StateType.LoadingMain then
		this.UpdateLoadingMain()
	elseif state == ST_Main.StateType.Main then
		this.UpdateMain()
	end
end

function ST_Main.LateUpdate()
	ST_Base.LateUpdate()

	if state == ST_Main.StateType.Main then
		this.LateUpdateMain()
	end
end

function ST_Main.LateLateUpdate()
	ST_Base.LateLateUpdate()

	if state == ST_Main.StateType.Main then
		this.LateLateUpdateMain()
	end
end

function ST_Main.Exit()
	ST_Base.ClearUiScene()
	ST_Base.Exit()

	if sceneController ~= nil then
		sceneController:Exit()

		sceneController = nil
	end
end

function ST_Main.OnSuspend()
	ST_Base.OnSuspend()
end

function ST_Main.OnChangeScreen(width, height)
	if sceneController ~= nil then
		sceneController:OnChangeScreen(width, height)
	end
end

function ST_Main.ChangeState(st_type)
	state = st_type
	stateSub = 0

	if state == ST_Main.StateType.LoadingMain then
		this.EnterLoadingMain()
	elseif state == ST_Main.StateType.Main then
		this.EnterMain()
	end
end

function ST_Main.EnterLoadingMain()
	sceneController = ControllerMain:new()
end

function ST_Main.UpdateLoadingMain()
	this.UpdateScene()

	if sceneController:isLoadEnd() == true then
		this.ChangeState(ST_Main.StateType.Main)
	end
end

function ST_Main.EnterMain()
	UIManager.SendMessage("Loading", "SetActive", false)
end

function ST_Main.UpdateMain()
	this.UpdateScene()
end

function ST_Main.LateUpdateMain()
	this.LateUpdateScene()
end

function ST_Main.LateLateUpdateMain()
	this.LateLateUpdateScene()
end

function ST_Main.UpdateScene()
	if sceneController ~= nil then
		sceneController:Update()
	end
end

function ST_Main.LateUpdateScene()
	if sceneController ~= nil then
		sceneController:LateUpdate()
	end
end

function ST_Main.LateLateUpdateScene()
	if sceneController ~= nil then
		sceneController:LateLateUpdate()
	end
end

function ST_Main.GetSceneController()
	return sceneController
end
