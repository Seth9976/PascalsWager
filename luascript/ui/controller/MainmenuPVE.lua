-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/MainmenuPVE.lua

MainmenuCtrl.static.CharProp = {
	Energy = 5,
	Attack = 2,
	Life = 1,
	Defense = 3,
	Tenacity = 4
}

local panelPVE, pveMsgStep, pveMsgKill, pveMsgKillCount, pveMsgTime, pveMsgTimeCount
local tabPvpOccupy = {}

function MainmenuCtrl.IsTopBarReady()
	return tabPvpOccupy.loadFinish
end

function MainmenuCtrl.OnLoadPanelPvpOccupy(com, data)
	return
end

function MainmenuCtrl.OnLoadPanelGuardMode(com, data)
	return
end

function MainmenuCtrl.OnDestroyPaneGuardMode()
	return
end

function MainmenuCtrl.OnLoadPanelStoryMode(com, data)
	local maxPlayerTeam = 3
	local maxPlayerTotal = maxPlayerTeam

	com.gameObject:SetActive(true)

	tabPvpOccupy = {}
	tabPvpOccupy.mapNpc = {}
	tabPvpOccupy.slotNpc = {}

	for i = 1, maxPlayerTotal do
		tabPvpOccupy.slotNpc[i] = 0
	end

	tabPvpOccupy.panelPveAnimalId = 0
	tabPvpOccupy.panelPveNpc = {}
	tabPvpOccupy.panelPveNpcBtn = {}
	tabPvpOccupy.panelPveNpcIcon = {}
	tabPvpOccupy.panelPveNpcHpBar = {}
	tabPvpOccupy.score = {}
end

function MainmenuCtrl.OnLoadPanelFreeMode(com, data)
	local maxPlayerTeam = 1
	local maxPlayerTotal = 2 * maxPlayerTeam

	com.gameObject:SetActive(true)

	tabPvpOccupy = {}
	tabPvpOccupy.mapNpc = {}
	tabPvpOccupy.slotNpc = {}

	for i = 1, maxPlayerTotal do
		tabPvpOccupy.slotNpc[i] = 0
	end

	tabPvpOccupy.panelPveAnimalId = 0
	tabPvpOccupy.panelPveNpc = {}
	tabPvpOccupy.panelPveNpcBtn = {}
	tabPvpOccupy.panelPveNpcIcon = {}
	tabPvpOccupy.panelPveNpcHpBar = {}
	tabPvpOccupy.panelPveNpcTag = {}
	tabPvpOccupy.score = {}
	tabPvpOccupy.scoreLight = {}
	tabPvpOccupy.scoreRecord = {}
	tabPvpOccupy.loadCount = 0
	tabPvpOccupy.loadMax = 0
	tabPvpOccupy.loadFinish = false
	tabPvpOccupy.loadMax = 2 * maxPlayerTeam

	for i = 1, 2 do
		local key = "team" .. i
		local loader = com:GetLoader("Panel_1V1_P" .. i)

		loader.loadCount = maxPlayerTeam

		function loader.loadCallback(index, com, data)
			local slotIndex = (i - 1) * maxPlayerTeam + index

			tabPvpOccupy.panelPveNpc[slotIndex] = com

			local button = com:GetButton("Hero_Button")

			button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				return
			end, 0)

			local goBtn = com:GetGameObject("Hero_Button")

			tabPvpOccupy.panelPveNpcBtn[slotIndex] = goBtn

			goBtn:SetActive(false)

			local icon = XImage:new(button.gameObject:GetComponent("Image"))
			local hpBar = XImage:new(com:GetGameObject("Hero_Bar_Hp"))

			tabPvpOccupy.panelPveNpcIcon[slotIndex] = icon
			tabPvpOccupy.panelPveNpcHpBar[slotIndex] = hpBar
			tabPvpOccupy.panelPveNpcTag[slotIndex] = com:GetGameObject("Hero_Tag_Npc")

			tabPvpOccupy.panelPveNpc[slotIndex].gameObject:SetActive(false)

			tabPvpOccupy.loadCount = tabPvpOccupy.loadCount + 1

			if tabPvpOccupy.loadCount == tabPvpOccupy.loadMax then
				tabPvpOccupy.loadFinish = true

				MainmenuCtrl.IsUiLoaded()
			end
		end

		loader:Load()

		tabPvpOccupy[i] = loader
		tabPvpOccupy.score[i] = com:GetText("1V1_Score" .. i)
		tabPvpOccupy.scoreLight[i] = com:GetGameObject("1V1_Score_Light" .. i)
		tabPvpOccupy.scoreRecord[i] = 0
	end

	tabPvpOccupy.timerText = com:GetText("1V1_TimeCount")

	tabPvpOccupy.timerText:SetContent("00:00")

	tabPvpOccupy.scoreVersus = com:GetText("1V1_RoundCount")
	tabPvpOccupy.round = {}
	tabPvpOccupy.round.panel = com:GetGameObject("Panel_1V1_Round")
	tabPvpOccupy.round.text = com:GetText("Panel_1V1_RoundText")
	tabPvpOccupy.round.result = com:GetText("Panel_1V1_RoundResult")
	tabPvpOccupy.round.light = com:GetGameObject("Panel_1V1_RoundLight")

	local tween = Tween:new(tabPvpOccupy.round.panel.transform)

	tween:SetAutoKill(false)
	tween:OnComplete(function(progress)
		tabPvpOccupy.round.panel:SetActive(false)
		tabPvpOccupy.round.light:SetActive(false)
	end)

	tabPvpOccupy.round.tween = tween

	local tweenSub = Tween:new(tabPvpOccupy.round.light.transform)

	tweenSub:SetAutoKill(false)
	tweenSub:OnComplete(function(progress)
		tabPvpOccupy.round.light:SetActive(true)
	end)

	tabPvpOccupy.round.tweenSub = tweenSub

	tabPvpOccupy.round.panel:SetActive(false)
	tabPvpOccupy.round.light:SetActive(false)

	tabPveHp = {}
	tabPveHp.Type = {}
	tabPveHp.Type.Boss = 1
	tabPveHp.Type.Building = 2
	tabPvpOccupy.task = {}
	tabPvpOccupy.task.panel = com:GetGameObject("Panel_Occupy_Right_R")
	tabPvpOccupy.task.timeRemaining = com:GetText("PVP_Occupy_TimeRemaining")

	MainmenuCtrl.SetScore(1, 0)
	MainmenuCtrl.SetScore(2, 0)
	MainmenuCtrl.SetScoreVersus(0, 0)
end

function MainmenuCtrl.OnDestroyPaneFreeMode()
	if tabPvpOccupy ~= nil and tabPvpOccupy.round ~= nil and tabPvpOccupy.round.tween ~= nil then
		TweenManager.Remove(tabPvpOccupy.round.tween)
		TweenManager.Remove(tabPvpOccupy.round.tweenSub)
	end
end

function MainmenuCtrl.SetPveMsgStep(waveNum, isInRound)
	if waveNum > 0 and pveMsgStep ~= nil then
		pveMsgStep:SetGameTextContent(function()
			return string.gsub(GameText.UI_PVE_PNL_R_ENEMY_WAVE, "{0}", waveNum)
		end)
	end
end

function MainmenuCtrl.SetPveMsgEnemyRemaining(count)
	if pveMsgKill ~= nil then
		pveMsgKill:SetActive(true)
	end

	if pveMsgTime ~= nil then
		pveMsgTime:SetActive(false)
	end

	if count >= 0 and pveMsgKillCount ~= nil then
		pveMsgKillCount:SetContent(count)
	end
end

function MainmenuCtrl.SetPveMsgTimeCountDownToNextWave(cdTimeInSecs)
	if pveMsgKill ~= nil then
		pveMsgKill:SetActive(false)
	end

	if pveMsgTime ~= nil then
		pveMsgTime:SetActive(true)
	end

	if pveMsgTimeCount ~= nil then
		if cdTimeInSecs >= 0 then
			local min = math.floor(cdTimeInSecs / 60)
			local sec = math.fmod(cdTimeInSecs, 60)
			local str = string.format("%02d:%02d", min, sec)

			pveMsgTimeCount:SetContent(str)
		else
			pveMsgTimeCount:SetContent("00:00")
		end
	end
end

function MainmenuCtrl.SetBuildingLv(level)
	local hpBuilding = tabPveHp.Building

	hpBuilding.lvVal = level

	if hpBuilding.lvLbl ~= nil then
		hpBuilding.lvLbl:SetGameTextContent(function()
			return GameText.UI_COMMON_LEVEL .. level
		end)
	end
end

function MainmenuCtrl.SetPveBuildingHpWarningThreshold(percent)
	if percent >= 0 and percent <= 1 then
		tabPveHp.Building.thresholdWarning = percent
	end
end

function MainmenuCtrl.SetPveBuildingHp(hpPercent)
	local hpBuilding = tabPveHp.Building
	local hpValue = Mathf.Round(100 * hpPercent)
	local hpBuilding = tabPveHp.Building

	if hpValue ~= hpBuilding.hpVal then
		local threshold = hpBuilding.thresholdWarning

		hpBuilding.hpVal = hpValue

		if hpBuilding.WarnFlag then
			if threshold < hpPercent then
				hpBuilding.WarnFlag = false

				hpBuilding.Warning:SetActive(false)
			end
		elseif hpPercent <= threshold then
			hpBuilding.WarnFlag = true

			hpBuilding.Warning:SetActive(true)
			hpBuilding.twWarning:Play()
		end

		hpBuilding.barB:SetFillAmount(hpPercent)
		hpBuilding.twBarY:Delay(0.2)
		hpBuilding.twBarY:MoveTo({
			fillAmount = hpPercent
		}, 0.5)
		hpBuilding.twBarY:Start()
		hpBuilding.animHit:SetTrigger("play")
	end
end

function MainmenuCtrl.SetPlayer(index, heroId, teamId)
	tabPvpOccupy.panelPveAnimalId = index

	local sprite = XObjectPool.GetIcon("photo" .. heroId)

	if sprite == nil then
		-- block empty
	end

	if teamId == nil or teamId < 1 or teamId > 2 then
		teamId = 1
	end

	MainmenuCtrl.AddNpc(index, heroId, teamId, true)
end

function MainmenuCtrl.SetPlayerHP(percent)
	local index = tabPvpOccupy.panelPveAnimalId

	if index > 0 then
		index = tostring(index)

		local slotIndex = tabPvpOccupy.mapNpc[index]

		tabPvpOccupy.panelPveNpcHpBar[slotIndex]:SetFillAmount(percent)
	end
end

function MainmenuCtrl.GetPveAnimalId()
	return tabPvpOccupy.panelPveAnimalId
end

function MainmenuCtrl.AddNpc(index, heroId, teamId, isHost)
	if isHost then
		-- block empty
	end

	local maxSlotCount = 5

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) == true then
		maxSlotCount = 3
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		maxSlotCount = 1
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Custom) == true then
		maxSlotCount = 1
	end

	local isFriend = ST_Main.GetSceneController():IsFriend(index)

	teamId = isFriend and 1 or 2
	index = tostring(index)

	local tempMapNpc = tabPvpOccupy.mapNpc
	local tempSlotNpc = tabPvpOccupy.slotNpc

	if tempMapNpc[index] == nil then
		local slotIndex = 0
		local slotOffStart = (teamId - 1) * maxSlotCount + 1
		local slotOffEnd = slotOffStart + maxSlotCount - 1

		for i = slotOffStart, slotOffEnd do
			if tempSlotNpc[i] == 0 then
				slotIndex = i

				break
			end
		end

		if slotIndex > 0 then
			tempSlotNpc[slotIndex] = heroId

			tabPvpOccupy.panelPveNpc[slotIndex].gameObject:SetActive(true)
		else
			return
		end

		tempMapNpc[index] = slotIndex

		MainmenuCtrl.SetHeroIcon(index, heroId, isHost)
	end
end

function MainmenuCtrl.RemoveNpc(index)
	index = tostring(index)

	local tempMapNpc = tabPvpOccupy.mapNpc
	local tempSlotNpc = tabPvpOccupy.slotNpc

	if tempMapNpc[index] ~= nil then
		local slotIndex = tempMapNpc[index]

		MainmenuCtrl.ResetNpcBySlot(slotIndex)
		tabPvpOccupy.panelPveNpc[slotIndex].gameObject:SetActive(false)

		tempSlotNpc[slotIndex] = 0
		tempMapNpc[index] = nil
	end
end

function MainmenuCtrl.SetNpcHP(index, percent)
	if index > 0 then
		index = tostring(index)

		local slotIndex = tabPvpOccupy.mapNpc[index]

		if slotIndex ~= nil and slotIndex > 0 then
			tabPvpOccupy.panelPveNpcHpBar[slotIndex]:SetFillAmount(percent)
		end
	end
end

function MainmenuCtrl.SetHeroIcon(index, heroId, isHost)
	index = tostring(index)

	local slotIndex = tabPvpOccupy.mapNpc[index]

	if slotIndex ~= nil and slotIndex > 0 then
		local sprite = XObjectPool.GetIcon("photo" .. heroId)

		if sprite ~= nil then
			tabPvpOccupy.panelPveNpcIcon[slotIndex]:SetSprite(sprite)
		end

		tabPvpOccupy.panelPveNpcBtn[slotIndex]:SetActive(true)
		tabPvpOccupy.panelPveNpc[slotIndex].gameObject:SetActive(true)

		if isHost and tabPvpOccupy.panelPveNpcTag ~= nil then
			tabPvpOccupy.panelPveNpcTag[slotIndex]:SetActive(false)
		end
	end
end

function MainmenuCtrl.ResetNpc(index)
	index = tostring(index)

	if index > 0 then
		local slotIndex = tabPvpOccupy.mapNpc[index]

		tabPvpOccupy.mapNpc[index] = nil

		MainmenuCtrl.ResetNpcBySlot(slotIndex)
	end
end

function MainmenuCtrl.ResetNpcBySlot(slotIndex)
	if slotIndex ~= nil and slotIndex > 0 then
		tabPvpOccupy.panelPveNpc[slotIndex].gameObject:SetActive(false)
	end
end

function MainmenuCtrl.SetOccupyTimer(timeInSecs)
	local ret = TimeHelper.getTimeSpan(timeInSecs)

	tabPvpOccupy.timerText:SetContent(ret.Minutes .. ":" .. ret.Seconds)
end

function MainmenuCtrl.SetSpotOccupied(index, teamId)
	if tabPvpOccupy.spots ~= nil then
		local another = (teamId + 2) % 2 + 1
		local spots = tabPvpOccupy.spots
		local spotGot = spots[teamId][index]
		local spotLost = spots[another][index]
		local efxSpotGot = tabPvpOccupy.spotGet[teamId][index]

		if spotGot ~= nil then
			tabPvpOccupy.spotShow[teamId][index].alpha = 1

			efxSpotGot:SetActive(false)
			efxSpotGot:SetActive(true)
			MainmenuCtrl.SetSpotNeutual(index, false)
		end

		if spotLost ~= nil then
			local efxSpotLost = tabPvpOccupy.spotLost[another][index]

			efxSpotLost:SetActive(false)
			efxSpotLost:SetActive(true)

			local tween = Tween:new(tabPvpOccupy.spotShow[another][index])

			tween:Delay(0.9)
			tween:MoveTo({
				alpha = 0
			}, 0.9)
			tween:Start()
		end
	end
end

function MainmenuCtrl.SetOccupyProgress(teamId, percent)
	local percentInt = Mathf.Round(percent * 100)
	local teamScore = tabPvpOccupy.score[teamId]

	if teamScore ~= nil and percentInt ~= teamScore.value then
		teamScore.value = percentInt

		teamScore.progress:SetFillAmount(percent)

		teamScore.slider.value = percent

		teamScore.percent:SetGameTextContent(function()
			return percentInt .. GameText.UI_COMMON_PERCENT
		end)
		teamScore.light:SetActive(false)
		teamScore.light:SetActive(true)

		if percent > 0 and percent < 1 then
			if not teamScore.showSlider then
				teamScore.showSlider = true

				teamScore.goSlider:SetActive(true)
			end
		elseif teamScore.showSlider then
			teamScore.showSlider = false

			teamScore.goSlider:SetActive(false)
		end
	end
end

function MainmenuCtrl.ShowPvpTask(enabled)
	tabPvpOccupy.task.panel:SetActive(enabled)
end

function MainmenuCtrl.SetPvpTaskTimeRemaining(time)
	local ret = TimeHelper.getTimeSpan(time)

	tabPvpOccupy.task.timeRemaining:SetContent(ret.Minutes .. ":" .. ret.Seconds)
end

function MainmenuCtrl.SetScore(teamId, score)
	if teamId > 0 and teamId < 3 and score >= 0 and tabPvpOccupy.scoreRecord[teamId] ~= score then
		tabPvpOccupy.scoreRecord[teamId] = score

		tabPvpOccupy.score[teamId]:SetContent(score)
		tabPvpOccupy.scoreLight[teamId]:SetActive(false)
		tabPvpOccupy.scoreLight[teamId]:SetActive(true)
	end
end

function MainmenuCtrl.SetScoreVersus(score1, score2)
	tabPvpOccupy.scoreVersus:SetGameTextContent(function()
		return score1 .. GameText.UI_COMMON_SLASH .. score2
	end)
end

function MainmenuCtrl.ShowRoundMsg(duration, roundCount, roundResult)
	local panelRound = tabPvpOccupy.round

	if panelRound ~= nil and duration > 0 then
		panelRound.panel:SetActive(true)

		local tween = panelRound.tween

		tween:Delay(duration)
		tween:MoveTo({}, 0.1)
		tween:Start()

		local tweenSub = panelRound.tweenSub

		tweenSub:Delay(0.4)
		tweenSub:MoveTo({}, 1)
		tweenSub:Start()

		if roundCount ~= nil then
			panelRound.text:SetGameTextContent(function()
				return GameText["UI_BATTLE_ROUND_" .. roundCount]
			end)
		end

		local text = panelRound.result

		if roundResult ~= nil then
			if roundResult == BattleData.ResultType.Win then
				text:SetColor(0.9725490196078431, 0.7450980392156863, 0.396078431372549, 1)
				text:SetGameTextContent(function()
					return GameText.UI_BATTLE_WIN
				end)
			elseif roundResult == BattleData.ResultType.Lose then
				text:SetColor(1, 1, 1, 1)
				text:SetGameTextContent(function()
					return GameText.UI_BATTLE_LOSE
				end)
			elseif roundResult == BattleData.ResultType.Draw then
				text:SetColor(1, 1, 1, 1)
				text:SetGameTextContent(function()
					return GameText.UI_BATTLE_DRAW
				end)
			else
				text:SetGameTextContent(function()
					return GameText.UI_COMMON_EMPTY
				end)
			end
		else
			text:SetGameTextContent(function()
				return GameText.UI_COMMON_EMPTY
			end)
		end
	end
end
