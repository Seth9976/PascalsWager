-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/HotUpdateCtrl.lua

HotUpdateCtrl = class("HotUpdateCtrl", UICtrlBase)

local this = HotUpdateCtrl

function HotUpdateCtrl.OnCreate()
	ST_Start.ChangeState(ST_Start.StateType.LoadCommon)

	this.loadFinish = true
end

return HotUpdateCtrl
