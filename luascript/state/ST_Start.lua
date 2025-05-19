-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_Start.lua

require("LuaScript/State/ST_Base")

ST_Start = class("ST_Start", ST_Base)

local this = ST_Start
local state = 0

ST_Start.static.StateType = {
	Connect = 3,
	Login = 4,
	Loading = 5,
	LoadLogin = 2,
	Main = 6,
	LoadCommon = 1,
	Empty = 0
}

function ST_Start.Enter()
	SystemHelper.Log("[ ******** Start.Enter() ******** ]")
	ST_Base.Enter()
	ST_Base.InitUiBase()
	SdkHelper.InitSdk(nil)

	state = ST_Start.StateType.Empty

	if DebugShow == true then
		local goDebug = GoFind("Debug")

		if goDebug then
			local tfCanvas = TfFindChild(goDebug.transform, "DebugCanvas")

			if tfCanvas then
				tfCanvas.gameObject:SetActive(true)
			end
		end
	end

	this.ChangeState(ST_Start.StateType.LoadCommon)
end

function ST_Start.Update()
	ST_Base.Update()

	if state == ST_Start.StateType.Connect then
		if XNetwork.IsConnecting() then
			this.ChangeState(ST_Start.StateType.LoadCommon)
		end
	elseif state == ST_Start.StateType.LoadCommon then
		if UIManager.IsLoadFinish("Captured") and UIManager.IsLoadFinish("MsgBoxSimple") then
			this.ChangeState(ST_Start.StateType.Loading)
		end
	elseif state == ST_Start.StateType.Loading and UIManager.IsLoadFinish("Loading") then
		ST_Lobby.needLogin = true

		this.ChangeState(ST_Start.StateType.Main)
	end
end

function ST_Start.Exit()
	SystemHelper.Log("[ ******** Start.Exit() ******** ]")
	ST_Base.Exit()
end

function ST_Start.ChangeState(st_type)
	state = st_type

	if state == ST_Start.StateType.Connect then
		networkMgr:SendConnect()
	elseif state == ST_Start.StateType.LoadLogin then
		this.LoadUI("Login")
	elseif state == ST_Start.StateType.Login then
		UIManager.SendMessage("Login", "StartLogin")
	elseif state == ST_Start.StateType.Loading then
		this.LoadUI("Loading")
	elseif state == ST_Start.StateType.LoadCommon then
		this.LoadUI("Captured")
		this.LoadUI("MsgBoxSimple")
	elseif state == ST_Start.StateType.Main then
		ST_Scene.ChangeScene(ST_Scene.SceneType.LobbyReload)
	end
end

function ST_Start.Callback_UserLogin(jsonData)
	local ret = NI_Login.ParseLoginResponse(jsonData)

	if ret == true then
		if FS_UserData.playerList:GetUserId() > 0 then
			LS_Setting.Load(FS_UserData.playerList:GetUserId())
			LS_Setting.Update()
			UIManager.RefreshLanguage()
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOGIN_LOGIN_FAILED)
		LoginCtrl.ResetUsername()
	end
end

function ST_Start.LoadUI(name)
	local ctrl = UIManager.CreateCtrl(name)
end
