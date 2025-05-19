-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/Logic/CtrlManager.lua

require("Common/define")

CtrlManager = {}

local this = CtrlManager
local ctrlList = {}

function CtrlManager.Init()
	logWarn("CtrlManager.Init----->>>")

	return this
end

function CtrlManager.AddCtrl(ctrlName, ctrlObj)
	ctrlList[ctrlName] = ctrlObj
end

function CtrlManager.GetCtrl(ctrlName)
	return ctrlList[ctrlName]
end

function CtrlManager.RemoveCtrl(ctrlName)
	ctrlList[ctrlName] = nil
end

function CtrlManager.Close()
	logWarn("CtrlManager.Close---->>>")
end
