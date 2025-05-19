-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/BattleResultCtrl.lua

require("LuaScript/StructData/FS_BattleData_OccupyMode")

BattleResultCtrl = class("BattleResultCtrl", UICtrlBase)

local this = BattleResultCtrl
local ResultList = {}
local result, nextPanel

function BattleResultCtrl.OnCreate()
	ResultList[1] = this.mainComponent:GetGameObject("Animation_Result_Win")
	ResultList[2] = this.mainComponent:GetGameObject("Animation_Result_Lose")
	ResultList[3] = this.mainComponent:GetGameObject("Animation_Result_Draw")

	local nextBtn = this.mainComponent:GetButton("NextBtn")

	if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) or BattleData.IsBattleMode(BattleData.Type.PVE_Custom) then
		local result = FS_BattleData_OccupyMode.GetBattleResult()

		ResultList[result]:SetActive(true)
		ResultList[result]:GetComponent("Animator"):SetTrigger("normal")

		local co = coroutine.start(function()
			coroutine.wait(3.2)
			UIManager.SendMessage("PVPBattleResult", "ShowResult")
			UIManager.Close("BattleResult")
		end)

		nextBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			coroutine.stop(co)
			UIManager.SendMessage("PVPBattleResult", "ShowResult")
			UIManager.Close("BattleResult")
		end)
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Guard) then
		ResultList[1]:SetActive(true)
		ResultList[1]:GetComponent("Animator"):SetTrigger("end")

		local co = coroutine.start(function()
			coroutine.wait(3.2)
			UIManager.CreateCtrl("BattleStatistics")
			UIManager.Close("BattleResult")
		end)

		nextBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			coroutine.stop(co)
			UIManager.CreateCtrl("BattleStatistics")
			UIManager.Close("BattleResult")
		end)
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		ResultList[1]:SetActive(true)
		ResultList[1]:GetComponent("Animator"):SetTrigger("end")

		local co = coroutine.start(function()
			coroutine.wait(3.2)
			UIManager.CreateCtrl("BattleStatistics")
			UIManager.Close("BattleResult")
		end)

		nextBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			coroutine.stop(co)
			UIManager.CreateCtrl("BattleStatistics")
			UIManager.Close("BattleResult")
		end)
	else
		SystemHelper.LogError("============BattleResultCtrl error===")
	end

	this.loadFinish = true
end

function BattleResultCtrl.SetResultWin()
	return
end

function BattleResultCtrl.SetResultLose()
	return
end

function BattleResultCtrl.SetStatisticsReady()
	return
end

return BattleResultCtrl
