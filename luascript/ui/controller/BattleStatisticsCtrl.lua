-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/BattleStatisticsCtrl.lua

BattleStatisticsCtrl = class("BattleStatisticsCtrl", UICtrlBase)

local this = BattleStatisticsCtrl
local tblStatistics, wavesTable, scoreTable

function BattleStatisticsCtrl.OnCreate()
	wavesTable = {}
	scoreTable = {}

	local btnContinue = this.mainComponent:GetButton("Result_Table_Button_Continue")

	btnContinue:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		BattleStatisticsCtrl.Submit(wavesTable[1], scoreTable[1], BattleStatisticsCtrl.OnSubmit)
	end)

	local processed = this.CollectData(FS_BattleData_GuardMode.battleDataList)

	this.ShowBattleResultPVE(this.mainComponent, processed)
end

function BattleStatisticsCtrl.CollectData(dataTable)
	local count = table.nums(info)
	local data = {}

	for _k, _v in pairs(dataTable) do
		_v.idx = _k

		table.insert(data, _v)
	end

	return data
end

function BattleStatisticsCtrl.ShowBattleResultPVE(com, info)
	SystemHelper.Log("ShowBattleResultPVE.ShowBattleResultPVE.......")

	local content = com:GetLoader("Result_Table_Content")
	local count = table.nums(info)

	if count > 0 then
		local oneLine = info[1]
		local text = com:GetText("Result_Table_Title_2")
		local value = oneLine[FS_BattleData_GuardMode.DataType.ClearWaveNum]

		text:SetContent(value)

		wavesTable[1] = tonumber(value)
		text = com:GetText("Result_Table_Score")
		value = oneLine[FS_BattleData_GuardMode.DataType.FinalScore]

		text:SetContent(value)

		scoreTable[1] = tonumber(value)
		content.loadCount = count

		function content.loadCallback(index, com, data)
			local dateInLine = info[index]
			local item = com
			local heroId = dateInLine[FS_BattleData_GuardMode.DataType.HeroId]

			SystemHelper.Log("########################" .. index .. " - " .. heroId)

			local imgHero = com:GetGameObject("HeroIcon")
			local heroIcon = XImage:new(imgHero)
			local sprite = XObjectPool.GetIcon("photo" .. heroId)

			if sprite ~= nil then
				heroIcon:SetSprite(sprite)
			end

			local text = com:GetText("Nickname")
			local value = "玩家" .. index

			text:SetContent(value)

			local heroData = MS_HeroData.GetHero(heroId)

			text = com:GetText("HeroName")

			if heroData ~= nil then
				value = FS_UserData.playerList:GetPlayer():GetName()
			else
				value = "我是谁"
			end

			text:SetContent(value)

			text = com:GetText("Stat_KillCount")
			value = dateInLine[FS_BattleData_GuardMode.DataType.KillNum]

			text:SetContent(value)

			text = com:GetText("Stat_DeathCount")
			value = dateInLine[FS_BattleData_GuardMode.DataType.DeathNum]

			text:SetContent(value)

			text = com:GetText("Stat_ItemLife")
			value = dateInLine[FS_BattleData_GuardMode.DataType.BuffHpMax]

			text:SetContent(value)

			text = com:GetText("Stat_ItemAttack")
			value = dateInLine[FS_BattleData_GuardMode.DataType.BuffPower]

			text:SetContent(value)

			text = com:GetText("Stat_ItemDefense")
			value = dateInLine[FS_BattleData_GuardMode.DataType.BuffDefence]

			text:SetContent(value)

			text = com:GetText("Stat_ItemTenacity")
			value = dateInLine[FS_BattleData_GuardMode.DataType.BuffToughness]

			text:SetContent(value)

			text = com:GetText("Stat_ItemEnergy")
			value = dateInLine[FS_BattleData_GuardMode.DataType.BuffEnergy]

			text:SetContent(value)

			local compAlpha = item.transform:GetComponent("CanvasGroup")

			compAlpha.alpha = 0

			local fadeinTest = Tween:new(compAlpha)

			fadeinTest:SetAutoKill(true)
			fadeinTest:MoveTo({
				alpha = 1
			}, 0.5)
			fadeinTest:Delay(0.1 + index * 0.1)
			fadeinTest:Start()

			this.loadFinish = true
		end

		content:Load()
	end
end

function BattleStatisticsCtrl.Submit(wave, score, callbackFunc)
	ST_Scene.ChangeScene(ST_Scene.SceneType.LobbyReload)
end

function BattleStatisticsCtrl.OnSubmit(jsonData)
	if NI_BattleResult.ParseSubmitResponse(jsonData) then
		ST_Scene.ChangeScene(ST_Scene.SceneType.LobbyReload)
	else
		LoginCtrl.SetRaycasterEnabled(true)
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "分数提交失败！")
	end
end

return BattleStatisticsCtrl
