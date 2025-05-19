-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/Main.lua

require("LuaScript/State/ST_Scene")
require("LuaScript/SDK/SdkHelper")

function Main()
	SystemHelper.LogTest("########################Main########################")
	ST_Scene.Init()
	UpdateBeat:Add(Update, self)
	LateUpdateBeat:Add(LateUpdate, self)
end

function OnLevelWasLoaded(level)
	collectgarbage("collect")

	Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
	SystemHelper.LogTest("=====33333333=====OnApplicationQuit=======")
	SdkHelper.Destory()
	ST_Scene.Exit()
end

function OnSuspend()
	SystemHelper.LogTest("=====33333333=====OnSuspend=======")
	ST_Scene.OnSuspend()
end

function OnResume()
	SystemHelper.LogTest("=====33333333=====OnResume=======")
	ST_Scene.OnResume()
end

function Update()
	ST_Scene.Update()
	SdkHelper.refreshSession()
end

function LateUpdate()
	ST_Scene.LateUpdate()
end

function GetIcon(name)
	return XObjectPool.GetIcon(name)
end
