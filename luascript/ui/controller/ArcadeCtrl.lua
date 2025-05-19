-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ArcadeCtrl.lua

ArcadeCtrl = class("ArcadeCtrl", UICtrlBase)

local this = ArcadeCtrl

ArcadeCtrl.static.UI = {
	Level = "Arcade_Level",
	Mode = "Arcade_Mode",
	Record = "Arcade_Record",
	Main = "Arcade_Main",
	Ranking = "Arcade_Ranking",
	New = "Arcade_New",
	Load = "Arcade_Load"
}
ArcadeCtrl.static.Arcade_Edit = "Arcade_Edit"
ArcadeCtrl.static.CbBack = {
	Level = "OnButtonLevelBack",
	Mode = "OnButtonModeBack",
	Record = "OnButtonRecordBack",
	Main = "OnButtonBack",
	Ranking = "OnButtonRankingBack",
	New = "OnButtonNewBack",
	Load = "OnButtonLoadBack"
}
ArcadeCtrl.static.BtnNameIdx = 1
ArcadeCtrl.static.BtnKeyIdx = 2
ArcadeCtrl.static.BtnCbIdx = 3
ArcadeCtrl.static.RowPostfixIdx = 4
ArcadeCtrl.static.MainMenu = {
	{
		"New",
		"Arcade_Menu_Button_New",
		"OnButtonNew"
	},
	{
		"Load",
		"Arcade_Menu_Button_Load",
		"OnButtonLoad"
	},
	{
		"Level",
		"Arcade_Menu_Button_Level",
		"OnButtonLevel"
	},
	{
		"Ranking",
		"Arcade_Menu_Button_Record",
		"OnButtonRecord"
	},
	{
		"Back",
		"Arcade_Menu_Button_Back",
		"OnButtonBack"
	}
}
ArcadeCtrl.static.ModeMenu = {
	{
		"Casual",
		"Arcade_Mode_Button_Casual",
		"OnButtonModeCasual"
	},
	{
		"Normal",
		"Arcade_Mode_Button_Normal",
		"OnButtonModeNormal"
	},
	{
		"Expert",
		"Arcade_Mode_Button_Expert",
		"OnButtonModeExpert"
	}
}
ArcadeCtrl.static.ModeLevel = {
	{
		"Casual",
		"Arcade_Level_Button_Casual",
		"OnButtonLevelCasual",
		"Casual"
	},
	{
		"Normal",
		"Arcade_Level_Button_Normal",
		"OnButtonLevelNormal",
		"Normal"
	},
	{
		"Expert",
		"Arcade_Level_Button_Expert",
		"OnButtonLevelExpert",
		"Expert"
	}
}
ArcadeCtrl.static.RowPrefix = "Arcade_Level_Row"
ArcadeCtrl.static.SubNew = {
	ShowCount = 4,
	ButtonStart = "Arcade_New_Button_Start",
	ButtonBack = "Arcade_New_Button_Back",
	ListCount = 10
}
ArcadeCtrl.static.SubLoad = {
	ShowCount = 4,
	ButtonStart = "Arcade_Load_Button_Start",
	ButtonBack = "Arcade_Load_Button_Back",
	ListCount = 10
}
ArcadeCtrl.static.Status = {
	InUse = 2,
	Blank = 1,
	InCopy = 3
}
ArcadeCtrl.static.HeroIdList = {
	10007,
	10001,
	10002,
	10003,
	10004,
	10005
}
ArcadeCtrl.static.StoryIdList = {
	9999,
	10080,
	1001,
	1002,
	1003,
	1005,
	1004,
	1006,
	1007,
	1008,
	2001,
	2002,
	2003,
	2004
}
ArcadeCtrl.static.MenuLevelIdList = {
	1001,
	1002,
	1003,
	1005,
	1004,
	1006,
	1007,
	1008,
	2001,
	2002,
	2003,
	2004
}
ArcadeCtrl.static.StoryIdBase = 1000
ArcadeCtrl.static.SceneCount = 12

local panels, pnlMain, pnlMode, pnlNew, pnlLoad, pnlLevel, pnlRecord, pnlRanking, loaderNew, loaderLoad, gameConfig
local bRefresh = false
local bSaveEdit = false

function ArcadeCtrl.GetNavBtnIndices(btnIdx, maxCnt)
	local keyPrev = (btnIdx - 2 + maxCnt) % maxCnt + 1
	local keyNext = btnIdx % maxCnt + 1

	return keyPrev, keyNext
end

function ArcadeCtrl.GetNavBtnIndicesNoLoop(btnIdx, maxCnt)
	local keyPrev = 0
	local keyNext = 0

	if maxCnt == 1 then
		keyPrev = btnIdx
		keyNext = btnIdx
	elseif btnIdx == 1 then
		keyPrev = btnIdx
		keyNext = btnIdx % maxCnt + 1
	elseif btnIdx == maxCnt then
		keyPrev = (btnIdx - 2 + maxCnt) % maxCnt + 1
		keyNext = btnIdx
	else
		keyPrev = (btnIdx - 2 + maxCnt) % maxCnt + 1
		keyNext = btnIdx % maxCnt + 1
	end

	return keyPrev, keyNext
end

function ArcadeCtrl.EnterChoosingHero(difficulty, arcadeMode, storyId)
	UIManager.SendMessage("LobbyMain", "SetChoosingHeroMode", 1)
	UIManager.SendMessage("LobbyMain", "SetGameConfigStoryMode", FS_SaveStory.StoryMode.Arcade)
	UIManager.SendMessage("LobbyMain", "SetGameConfigArcadeMode", arcadeMode)
	UIManager.SendMessage("LobbyMain", "SetGameConfigDifficulty", difficulty)

	if storyId ~= nil then
		UIManager.SendMessage("LobbyMain", "SetGameConfigStoryId", storyId)
	end

	UIManager.SendMessage("LobbyMain", "EnterChoosingHero")
end

function ArcadeCtrl.LeaveChoosingHero()
	if pnlLevel ~= nil and pnlNew ~= nil then
		if pnlLevel.isSuspend == true then
			pnlLevel.isSuspend = false

			ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Level, true)
		elseif pnlNew.isSuspend == true then
			pnlNew.isSuspend = false

			ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.New, true)
		end
	end
end

function ArcadeCtrl.LeaveChoosingHeroResumeLevel()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Level, true)
end

function ArcadeCtrl.ShowPanel(name, show)
	if name ~= nil then
		local panel = panels[name]

		if panel ~= nil and panel.go ~= nil then
			panel.go:SetActive(show)
		end
	end
end

function ArcadeCtrl.OnButtonNew()
	ArcadeCtrl.ShowPanelMode()
end

function ArcadeCtrl.OnButtonLoad()
	ArcadeCtrl.ShowPanelLoadGame()
end

function ArcadeCtrl.OnButtonLevel()
	ArcadeCtrl.ShowPanelLevel(true)
end

function ArcadeCtrl.OnButtonRecord()
	ArcadeCtrl.ShowPanelRecord()
end

function ArcadeCtrl.OnButtonBack()
	ArcadeCtrl.ClosePanelMain()
end

function ArcadeCtrl.ShowPanelMode()
	ArcadeCtrl.UpdateMenuMode()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Mode, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.Mode, ArcadeCtrl.ModeMenu[2][ArcadeCtrl.BtnKeyIdx])
	UILayerCtrl.OnCursorClickMute()
end

function ArcadeCtrl.ShowPanelModeFromLoad()
	pnlMode.isFromLoad = true

	ArcadeCtrl.UpdateMenuMode()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Load, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Mode, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.Mode, ArcadeCtrl.ModeMenu[2][ArcadeCtrl.BtnKeyIdx])
	UILayerCtrl.OnCursorClickMute()
end

function ArcadeCtrl.UpdateMenuMode()
	local btnIdxNormal = LS_Setting.ArcadeMode.Normal
	local btnIdxExpert = LS_Setting.ArcadeMode.Expert
	local btnCfg = ArcadeCtrl.ModeMenu
	local btnCnt = table.nums(btnCfg)

	if FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Normal) or DebugArcadeUnlockExpert then
		pnlMode.menu.lock[btnIdxExpert]:SetActive(false)
		pnlMode.menu.btn[btnIdxExpert]:SetNormal(true)
		pnlMode.menu.btn[btnIdxNormal]:SetAdjacent(XButton.Adjacent.RIGHT, btnCfg[3][ArcadeCtrl.BtnKeyIdx])
	else
		pnlMode.menu.lock[btnIdxExpert]:SetActive(true)
		pnlMode.menu.btn[btnIdxExpert]:SetDisabled(true)
		pnlMode.menu.btn[btnIdxNormal]:SetAdjacent(XButton.Adjacent.RIGHT, btnCfg[2][ArcadeCtrl.BtnKeyIdx])
	end
end

function ArcadeCtrl.SetGameModeIntro(difficulty)
	if pnlMode ~= nil and pnlMode.menu ~= nil and pnlMode.menu.intro ~= nil and difficulty >= LS_Setting.ArcadeMode.Casual and difficulty <= LS_Setting.ArcadeMode.Expert then
		local DifficultyStr = string.upper(ArcadeCtrl.ModeMenu[difficulty][ArcadeCtrl.BtnNameIdx])
		local introTextKey = string.format("UI_ARCADE_GAMEMODE_INTRO_%s", DifficultyStr)

		pnlMode.menu.intro:SetContent(GameText[introTextKey])
	end
end

function ArcadeCtrl.OnButtonModeCasual()
	gameConfig.difficulty = LS_Setting.ArcadeMode.Casual

	ArcadeCtrl.SetGameModeIntro(gameConfig.difficulty)
end

function ArcadeCtrl.OnButtonModeNormal()
	gameConfig.difficulty = LS_Setting.ArcadeMode.Normal

	ArcadeCtrl.SetGameModeIntro(gameConfig.difficulty)
end

function ArcadeCtrl.OnButtonModeExpert()
	gameConfig.difficulty = LS_Setting.ArcadeMode.Expert

	ArcadeCtrl.SetGameModeIntro(gameConfig.difficulty)
end

function ArcadeCtrl.OnButtonModeConfirm()
	if pnlMode.isFromLoad then
		pnlMode.isFromLoad = false

		UIManager.SendMessage("LobbyMain", "RestartInArcadeMode", gameConfig.difficulty)
	else
		ArcadeCtrl.ShowPanelNewGame()
	end
end

function ArcadeCtrl.OnButtonModeBack()
	gameConfig.difficulty = 0

	if pnlMode.isFromLoad then
		pnlMode.isFromLoad = false

		ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Mode, false)
		ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Load, true)
	else
		ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Mode, false)
		ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, true)
	end

	UILayerCtrl.Pop()
end

function ArcadeCtrl.UpdateMenuLevel(sceneIdx)
	if pnlLevel ~= nil and pnlLevel.menu ~= nil and pnlLevel.menu.row ~= nil then
		pnlLevel.sceneIdx = sceneIdx

		local btnCfg = ArcadeCtrl.ModeLevel
		local btnCnt = table.nums(btnCfg)
		local rows = pnlLevel.menu.row

		for modeIdx = 1, btnCnt do
			local row = rows[modeIdx]
			local storyId = ArcadeCtrl.MenuLevelIdList[sceneIdx]
			local totalScore, killScore, timeRec, heroId, LevelPoint = FS_UserData.arcade:GetHighestScoreGamePassedTimeAndHero(modeIdx, storyId)

			if row ~= nil then
				if timeRec ~= nil and heroId ~= nil and totalScore ~= nil then
					row.record[0]:SetActive(false)
					row.record[1]:SetActive(true)

					if timeRec ~= nil then
						local playTime = TimeHelper.getTimeSpan(timeRec)

						row.time:SetContent(string.format("%s:%s:%s", playTime.Hours, playTime.Minutes, playTime.Seconds))
					end

					if totalScore ~= nil then
						row.score:SetContent(totalScore)
					end

					if LevelPoint ~= nil then
						local retABCS = FS_UserData.arcade:ConvertLevelPointToText(LevelPoint)
						local spriteABCS = XObjectPool.GetIcon("arcade_score_" .. retABCS)

						row.scoreIcon.gameObject:SetActive(true)
						row.scoreIcon:SetSprite(spriteABCS)
					else
						row.scoreIcon.gameObject:SetActive(false)
					end

					if heroId ~= nil then
						local sprite = XObjectPool.GetIcon("photo" .. heroId)

						row.icon:SetSprite(sprite)
						row.icon.gameObject:SetActive(true)
					else
						row.icon.gameObject:SetActive(false)
					end
				else
					row.record[0]:SetActive(true)
					row.record[1]:SetActive(false)
					row.icon.gameObject:SetActive(false)
				end
			end
		end

		ArcadeCtrl.SetSceneInfo(sceneIdx)
	end
end

function ArcadeCtrl.ShowPanelLevel(showAutoSave)
	if not FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Casual) and not FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Normal) and not FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Expert) and not DebugArcadeUnlockLevels then
		return
	end

	local sceneIdx, difficultyIdx = LS_Setting.GetTempChallengingInfo()

	if sceneIdx < 0 then
		sceneIdx = 1
		difficultyIdx = LS_Setting.ArcadeMode.Normal
	end

	local bContinue = false
	local userId = LS_Account.userId
	local saveIdx = LS_Setting.IndexArcadeAutosave

	if LS_Game.IsReadable(userId, saveIdx, true) then
		FS_UserData.Reset()
		BattleData.SetHeroId(0)

		if LS_Game.Load(userId, saveIdx, true) then
			if FS_UserData.story:IsSelectStageGameOver() then
				LS_Game.Delete(LS_Game.GetKey(saveIdx, true))
			elseif showAutoSave ~= nil and showAutoSave == true then
				local retStoryId = FS_UserData.story:GetStoryId()

				if retStoryId == 8 then
					retStoryId = FS_SaveStory.ArcadeStoryIdMax
				end

				sceneIdx = pnlLevel.LevelIndexs[retStoryId]
				difficultyIdx = FS_UserData.story:GetDifficulty()

				if sceneIdx < 1 then
					sceneIdx = 1
				end

				if difficultyIdx < LS_Setting.ArcadeMode.Casual or difficultyIdx > LS_Setting.ArcadeMode.Expert then
					difficultyIdx = LS_Setting.ArcadeMode.Normal
				end

				bContinue = true
			end
		end
	end

	pnlLevel.sceneIdx = sceneIdx

	ArcadeCtrl.UpdateMenuLevel(sceneIdx)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Level, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.Level, ArcadeCtrl.ModeLevel[difficultyIdx][ArcadeCtrl.BtnKeyIdx])
	UILayerCtrl.OnCursorClickMute()

	if bContinue == true then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ARCADE_AUTOSAVE_CONTINUE, function()
			BattleData.SetDifficulty(difficultyIdx)

			local ret = FS_UserData.story:ContinueGame()

			if ret == true then
				sceneController:ChooseHeroIdConfirm()
			end
		end, function()
			return
		end, false)
	end
end

function ArcadeCtrl.OnButtonLevelCasual()
	gameConfig.difficulty = LS_Setting.ArcadeMode.Casual
end

function ArcadeCtrl.OnButtonLevelNormal()
	gameConfig.difficulty = LS_Setting.ArcadeMode.Normal
end

function ArcadeCtrl.OnButtonLevelExpert()
	gameConfig.difficulty = LS_Setting.ArcadeMode.Expert
end

function ArcadeCtrl.OnButtonLevelConfirm()
	if gameConfig.storyId == 2001 then
		if IapData.GetEnterMaze() == false then
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ARCADE_NEED_MAZE, function()
				return
			end, function()
				return
			end, true)

			return
		end
	elseif (gameConfig.storyId == 2002 or gameConfig.storyId == 2003 or gameConfig.storyId == 2004) and IapData.GetEnterTide() == false then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ARCADE_NEED_TIDE, function()
			return
		end, function()
			return
		end, true)

		return
	end

	if pnlLevel ~= nil then
		pnlLevel.isSuspend = true
	end

	LS_Setting.SetTempChallengingInfo(pnlLevel.LevelIndexs[gameConfig.storyId], gameConfig.difficulty)
	UIManager.SendMessage("LobbyMain", "SetGameConfigLastArcadeSlot", LS_Setting.ArcadeAutoSaveSlotIndex)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Level, false)
	ArcadeCtrl.EnterChoosingHero(gameConfig.difficulty, FS_SaveStory.ArcadeMode.StageSelect, gameConfig.storyId)
end

function ArcadeCtrl.OnButtonLevelBack()
	LS_Setting.ResetTempChallengingInfo()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Level, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, true)
	UILayerCtrl.Pop()

	bRefresh = true
end

function ArcadeCtrl.SetSceneInfo(sceneIdx)
	if pnlLevel ~= nil and pnlLevel.sceneImage ~= nil then
		local image = pnlLevel.sceneImage
		local title = pnlLevel.sceneName

		gameConfig.storyId = ArcadeCtrl.MenuLevelIdList[sceneIdx]

		if image ~= nil and title ~= nil then
			if tonumber(sceneIdx) > 0 then
				local imgName = string.format("scene%d", sceneIdx)

				XObjectPool.LoadImage(imgName, function()
					local sprite = XObjectPool.GetImage(imgName)

					if sprite ~= nil then
						image:SetSprite(sprite)
						image.gameObject:SetActive(true)

						pnlLevel.isLoading = false
					end
				end)
				title:SetContent(GameText["UI_ARCADE_STORY_NAME_" .. gameConfig.storyId])
			else
				image.gameObject:SetActive(false)
				title.gameObject:SetActive(false)

				pnlLevel.isLoading = false
			end
		end
	end
end

function ArcadeCtrl.ShowPanelNewGame()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Mode, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.New, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.New, "NewGame_SlotBtn1")
end

function ArcadeCtrl.OnButtonNewBack()
	if pnlNew ~= nil then
		pnlNew.rowIndex = 1
		pnlNew.rowPrevious = 1
		pnlNew.selIndex = 1
		pnlNew.preIndex = 1
	end

	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.New, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Mode, true)
	UILayerCtrl.Pop()
end

function ArcadeCtrl.OnButtonNewStart(slotIndex)
	SystemHelper.LogError(string.format("[ Arcade.OnButtonNewStart( slotIndex = %d ) ]", slotIndex))

	if pnlNew ~= nil then
		local bodyBtn = pnlNew.btns[slotIndex]
		local toprow = 1 + math.floor((1 - pnlNew.scrollRect.scrollRectCom.normalizedPosition.y) / (1 / (loaderNew.loadCount - pnlNew.showCount)) + 0.5)
		local botrow = toprow + pnlNew.showCount - 1

		pnlNew.rowIndex = bodyBtn.idx
		pnlNew.selIndex = bodyBtn.idx - toprow + 1

		UILayerCtrl.OnSelect(string.format("NewGame_SlotBtn%d", slotIndex))

		local userId = LS_Account.userId

		if LS_Game.IsReadable(userId, slotIndex, true) then
			UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_LOBBY_CAUSION_REPLACE_SAVEDATA, function()
				UIManager.SendMessage("LobbyMain", "SetGameConfigLastArcadeSlot", bodyBtn.idx)

				if pnlNew ~= nil then
					pnlNew.isSuspend = true
				end

				ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.New, false)
				ArcadeCtrl.EnterChoosingHero(gameConfig.difficulty, FS_SaveStory.ArcadeMode.Normal)
			end, function()
				return
			end, false)
		else
			UIManager.SendMessage("LobbyMain", "SetGameConfigLastArcadeSlot", bodyBtn.idx)

			if pnlNew ~= nil then
				pnlNew.isSuspend = true
			end

			ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.New, false)
			ArcadeCtrl.EnterChoosingHero(gameConfig.difficulty, FS_SaveStory.ArcadeMode.Normal)
		end
	end
end

function ArcadeCtrl.UpdateSelectRowInSubNew(dir)
	if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and pnlNew ~= nil then
		local gap = 0
		local showCount = pnlNew.showCount
		local listCount = pnlNew.listCount
		local step = 1 / (listCount - showCount)
		local toprow = 1 + math.floor((1 - pnlNew.scrollRect.scrollRectCom.normalizedPosition.y) / step + 0.5)
		local botrow = toprow + showCount - 1
		local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, pnlNew.rowIndex, listCount, pnlNew.selIndex, showCount, gap, true)

		if normalizedY >= 0 then
			pnlNew.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(pnlNew.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
		end

		pnlNew.rowIndex = nextIndex
		pnlNew.selIndex = selIndex
		pnlNew.rowPrevious = prevIndex

		UILayerCtrl.Select(dir)
		UILayerCtrl.OnSelect("NewGame_SlotBtn" .. nextIndex, false)
	end
end

function ArcadeCtrl.ShowPanelLoadGame()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Load, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.Load, "LoadGame_SlotBtn1")
	ArcadeCtrl.RelocateLastSelectedArcadeSlot()
end

function ArcadeCtrl.OnButtonLoadBack()
	if pnlLoad ~= nil then
		pnlLoad.rowIndex = 1
		pnlLoad.rowPrevious = 1
		pnlLoad.selIndex = 1
		pnlLoad.preIndex = 1
		pnlLoad.idxCpySrc = 0
	end

	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Load, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, true)
	UILayerCtrl.Pop()
end

function ArcadeCtrl.RefreshLoadGame(slotIdxEditable)
	if slotIdxEditable then
		SystemHelper.Log("RefreshLoadGame......" .. slotIdxEditable)
	else
		SystemHelper.Log("RefreshLoadGame......")
	end

	if pnlLoad then
		local userId = LS_Account.userId
		local btns = pnlLoad.btns
		local count = table.nums(btns)
		local slotIdx = pnlLoad.idxSel

		for idx = 1, count do
			local bodyBtn = btns[idx]

			if bodyBtn then
				bodyBtn.selected:SetActive(false)
			end
		end

		local hasSetNavBar = false
		local lName = UILayerCtrl.GetCurrentLayerName()

		for idx = 1, count do
			local readable = LS_Game.IsReadable(userId, idx, true)
			local bodyBtn = btns[idx]

			if bodyBtn then
				bodyBtn.blank:SetActive(not readable)
				bodyBtn.inUse.go:SetActive(readable)

				if readable then
					if slotIdxEditable and idx == slotIdxEditable and not pnlLoad.isInEditMode then
						SystemHelper.Log(idx .. ": TRUE")
						bodyBtn.inEdit:SetActive(true)
					else
						SystemHelper.Log(idx .. ": FALSE")
						bodyBtn.inEdit:SetActive(false)
					end

					if not hasSetNavBar and slotIdxEditable and idx == slotIdxEditable then
						hasSetNavBar = true

						if lName == ArcadeCtrl.UI.Load then
							this.SetPnlLoadCmdBar(true, false, false)
						else
							this.SetPnlLoadCmdBar(false, true, true)
						end
					end
				else
					bodyBtn.inEdit:SetActive(false)

					if not hasSetNavBar and slotIdxEditable and idx == slotIdxEditable then
						hasSetNavBar = true

						if lName == ArcadeCtrl.UI.Load then
							this.SetPnlLoadCmdBar(false, false, false)
						end
					end
				end
			end
		end

		if not hasSetNavBar then
			hasSetNavBar = true

			this.SetPnlLoadCmdBar(true, false, false)
		end
	end
end

function ArcadeCtrl.UpdateSelectRowInSubLoad(dir)
	if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and pnlLoad ~= nil then
		local gap = 0
		local showCount = pnlLoad.showCount
		local listCount = pnlLoad.listCount
		local step = 1 / (listCount - showCount)
		local toprow = 1 + math.floor((1 - pnlLoad.scrollRect.scrollRectCom.normalizedPosition.y) / step + 0.5)
		local botrow = toprow + showCount - 1
		local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(dir, pnlLoad.rowIndex, listCount, pnlLoad.selIndex, showCount, gap, true)

		if normalizedY >= 0 then
			pnlLoad.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(pnlLoad.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
		end

		pnlLoad.rowIndex = nextIndex
		pnlLoad.selIndex = selIndex
		pnlLoad.rowPrevious = prevIndex

		AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)

		if bSaveEdit then
			local nextBtn = UILayerCtrl.Select(dir)

			if nextBtn and pnlLoad then
				pnlLoad.idxSel = nextBtn.idx

				this.RefreshLoadGame(pnlLoad.idxSel)
				SystemHelper.Log(string.format("[ Button index: %d]", nextBtn.idx))
				nextBtn:OnDown(nil, nil)
				nextBtn:OnClick(nil, nil)
			end
		else
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. nextIndex, false)
		end
	end
end

function ArcadeCtrl.RelocateLastSelectedArcadeSlot()
	if pnlLoad ~= nil then
		local gap = 0
		local showCount = pnlLoad.showCount
		local listCount = pnlLoad.listCount
		local nOffset = Mathf.Ceil(showCount / 2)
		local rOffset = showCount - nOffset
		local lastSaveSlotIdx = LS_Setting.lastArcadeSlotPlayed
		local dCount = 0
		local uCount = 0
		local ddCount = 0

		if lastSaveSlotIdx >= listCount - rOffset then
			dCount = 0
			uCount = listCount - lastSaveSlotIdx + 1
			ddCount = 0
		elseif lastSaveSlotIdx <= nOffset then
			dCount = lastSaveSlotIdx - 1 + rOffset
			uCount = rOffset
			ddCount = 0
		else
			local count = lastSaveSlotIdx - 1 + rOffset

			dCount = count
			uCount = rOffset
			ddCount = 0
		end

		local step = 1 / (listCount - showCount)
		local toprow = 1 + math.floor((1 - pnlLoad.scrollRect.scrollRectCom.normalizedPosition.y) / step + 0.5)
		local botrow = toprow + showCount - 1

		if dCount > 0 then
			for i = 1, dCount do
				local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(XButton.Adjacent.DOWN, pnlLoad.rowIndex, listCount, pnlLoad.selIndex, showCount, gap, true)

				pnlLoad.rowIndex = nextIndex
				pnlLoad.selIndex = selIndex
				pnlLoad.rowPrevious = prevIndex

				if normalizedY >= 0 then
					pnlLoad.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(pnlLoad.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
				end
			end
		end

		if uCount > 0 then
			for i = 1, uCount do
				local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(XButton.Adjacent.UP, pnlLoad.rowIndex, listCount, pnlLoad.selIndex, showCount, gap, true)

				pnlLoad.rowIndex = nextIndex
				pnlLoad.selIndex = selIndex
				pnlLoad.rowPrevious = prevIndex

				if normalizedY >= 0 then
					pnlLoad.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(pnlLoad.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
				end
			end
		end

		if ddCount > 0 then
			for i = 1, ddCount do
				local normalizedY, nextIndex, selIndex, prevIndex = SystemHelper.SelectLineInScrollRect(XButton.Adjacent.DOWN, pnlLoad.rowIndex, listCount, pnlLoad.selIndex, showCount, gap, true)

				pnlLoad.rowIndex = nextIndex
				pnlLoad.selIndex = selIndex
				pnlLoad.rowPrevious = prevIndex

				if normalizedY >= 0 then
					pnlLoad.scrollRect.scrollRectCom.normalizedPosition = Vector2.New(pnlLoad.scrollRect.scrollRectCom.normalizedPosition.x, normalizedY)
				end
			end
		end

		UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. pnlLoad.rowIndex, false)
	end
end

function ArcadeCtrl.OnButtonLoadStart(slotIdx)
	if slotIdx == nil then
		SystemHelper.Log("[ ArcadeCtrl.OnButtonLoadStart( Invalid slot index: nil ) ]")

		return
	end

	slotIdx = tonumber(slotIdx)

	if slotIdx == nil or slotIdx < 1 or slotIdx > LS_Setting.maxArcadeSaveSlot then
		SystemHelper.Log(string.format("[ Invalid slot index: %d ]", slotIdx))

		return
	end

	local toprow = 1 + math.floor((1 - pnlLoad.scrollRect.scrollRectCom.normalizedPosition.y) / (1 / (loaderLoad.loadCount - pnlLoad.showCount)) + 0.5)
	local botrow = toprow + pnlLoad.showCount - 1

	pnlLoad.rowIndex = slotIdx
	pnlLoad.selIndex = slotIdx - toprow + 1

	AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Option)
	UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. slotIdx, false)

	local userId = LS_Account.userId

	if LS_Game.IsReadable(userId, slotIdx, true) then
		UIManager.SendMessage("LobbyMain", "SetGameConfigLastArcadeSlot", slotIdx)
		UIManager.SendMessage("LobbyMain", "StartInArcadeMode", slotIdx)
	else
		SystemHelper.Log("[ No arcade savedata - " .. userId .. "_" .. slotIdx .. " ]")
	end
end

function ArcadeCtrl.RequestRestartWithSaveData(slotIdx)
	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_ARCADE_RESTART_FROM_LOAD, function()
		ArcadeCtrl.ShowPanelModeFromLoad()
	end, function()
		return
	end, false)
end

function ArcadeCtrl.SetPnlLoadCmdBar(showLoad, showConfirm, showBack)
	if pnlLoad then
		if pnlLoad.goCmdLoad and pnlLoad.showLoad ~= showLoad then
			pnlLoad.showLoad = showLoad

			pnlLoad.goCmdLoad:SetActive(showLoad)
		end

		if pnlLoad.goCmdConfirm and pnlLoad.showCmdConfirm ~= showConfirm then
			pnlLoad.showCmdConfirm = showConfirm

			pnlLoad.goCmdConfirm:SetActive(showConfirm)
		end

		if pnlLoad.goCmdBack and pnlLoad.showBack ~= showBack then
			pnlLoad.showBack = showBack

			pnlLoad.goCmdBack:SetActive(showBack)
		end
	end
end

function ArcadeCtrl.SetPnlLoadNavBar(show)
	if pnlLoad and pnlLoad.navBar and pnlLoad.showNavBar ~= show then
		pnlLoad.showNavBar = show

		pnlLoad.navBar:SetActive(show)
	end
end

function ArcadeCtrl.EraseSaveSlot(slotIdx)
	if pnlLoad then
		local userId = LS_Account.userId
		local hasSaveData = LS_Game.IsReadable(userId, slotIdx, true)

		if hasSaveData then
			this.SetPnlLoadCmdBar(true, false, false)
			this.SetPnlLoadNavBar(false)
			SystemHelper.Log(string.format("[ => EraseSaveSlot %d? ]", slotIdx))
			UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_LOBBY_CAUSION_DELETE_SAVEDATA, function()
				if LS_Game.Delete(LS_Game.GetKey(slotIdx, true)) then
					LS_Setting.EraseArcadeSaveSlot(slotIdx)
					LS_Setting.Update()

					local btns = pnlLoad.btns
					local bodyBtn = btns[slotIdx]

					bodyBtn.blank:SetActive(true)
					bodyBtn.inUse.go:SetActive(false)
					bodyBtn.inEdit:SetActive(false)
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CAUSION_DELETE_SAVEDATA_FAILED)
				end

				this.RefreshLoadGame(slotIdx + 1)
				this.SetPnlLoadCmdBar(true, false, false)
				this.SetPnlLoadNavBar(true)
				this.RevalidateSlots()
				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. slotIdx)
			end, function()
				this.SetPnlLoadNavBar(true)
			end, false)
		else
			SystemHelper.Log(string.format("[ Ignore => No savedata to erase @ %d ]", slotIdx))
		end
	end
end

function ArcadeCtrl.RevalidateSlots()
	if pnlLoad then
		SystemHelper.Log("[ ArcadeCtrl.RevalidateSlots()... ]")

		local userId = LS_Account.userId
		local buttons = pnlLoad.btns
		local count = table.nums(buttons)
		local slotBtnNamePrefix = "LoadGame_SlotBtn"
		local bodyBtn = buttons[1]

		bodyBtn.inUse.go:SetActive(false)
		bodyBtn.blank:SetActive(true)

		local slotBtnNamePrefix = "LoadGame_SlotBtn"
		local idxOffset = 0

		for idx = 1, count do
			local slotIdx = idx - idxOffset

			bodyBtn = buttons[slotIdx]

			local hasSaveData = LS_Game.IsReadable(userId, slotIdx, true)

			bodyBtn.blank:SetActive(not hasSaveData)
			bodyBtn.inUse.go:SetActive(hasSaveData)

			if hasSaveData then
				local slotData = LS_Setting.saveSlotArcade[slotIdx]

				if slotData then
					local location = slotData[LS_Setting.SlotStatus.Location]

					if location > 0 then
						local heroId = slotData[LS_Setting.SlotStatus.HeroId]
						local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
						local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
						local gMode = slotData[LS_Setting.SlotStatus.GameMode]
						local rCount = slotData[LS_Setting.SlotStatus.RoundCount]

						SystemHelper.LogError(string.format("[Load Slot %d ==> L: %d, H: %d, M: %d, R: %d, P/S: %d/%d ]", bodyBtn.idx, location, heroId, gMode, rCount, pTime, sTime))

						local pnl = bodyBtn.inUse
						local playTime = TimeHelper.getTimeSpan(pTime)

						pnl.location:SetGameTextContent(function()
							local siteData = MS_SiteInfo.GetSite(location % 100)

							if siteData then
								return siteData.Name
							else
								return "Not defined: " .. location
							end
						end)

						local ts, tzo = TimeHelper.getUtcTime()
						local heroData = MS_HeroData.GetHero(heroId)

						if heroData ~= nil then
							pnl.heroName:SetContent(heroData.Name)
						end

						pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
						pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

						if gMode == BattleData.GlobalDifficultyLevel.Casual then
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
						elseif gMode == BattleData.GlobalDifficultyLevel.Normal then
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
						else
							pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_HARDCORE)
						end

						pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
						bodyBtn.inUse.go:SetActive(true)
					else
						bodyBtn.inUse.go:SetActive(false)
					end

					bodyBtn.blank:SetActive(false)
				else
					bodyBtn.inUse.go:SetActive(false)
					bodyBtn.blank:SetActive(true)
				end
			else
				bodyBtn.inUse.go:SetActive(false)
				bodyBtn.blank:SetActive(true)
				SystemHelper.LogError(string.format("[ Arcade Slot %d ==> <Empty> ]", bodyBtn.idx))
			end
		end
	end
end

function ArcadeCtrl.ShowPanelRecord()
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Record, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.Record, "HeroBtn" .. pnlRecord.HeroIndex)
	pnlRecord.RankModeBtnGroup[pnlRecord.ModeIndex]:OnDown(nil, nil)
	pnlRecord.RankModeBtnGroup[pnlRecord.ModeIndex]:OnClick(nil, nil)
end

function ArcadeCtrl.OnButtonRecordBack()
	SystemHelper.LogError("ArcadeCtrl.OnButtonRecordBack()")
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Record, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Main, true)
	UILayerCtrl.Pop()
end

function ArcadeCtrl.ShowPanelRanking()
	SystemHelper.LogError("[ ArcadeCtrl.ShowPanelRanking() ]")
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Record, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Ranking, true)
	UILayerCtrl.Push(ArcadeCtrl.UI.Ranking, "LoadGame_SlotBtn1")
	pnlRanking.RankModeBtnGroup[pnlRanking.ModeIndex]:OnDown(nil, nil)
	pnlRanking.RankModeBtnGroup[pnlRanking.ModeIndex]:OnClick(nil, nil)
end

function ArcadeCtrl.OnButtonRankingBack()
	SystemHelper.LogError("ArcadeCtrl.OnButtonRankingBack()")
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Ranking, false)
	ArcadeCtrl.ShowPanel(ArcadeCtrl.UI.Record, true)
	UILayerCtrl.Pop()
end

function ArcadeCtrl.LoadRecord(heroId)
	local recordList = FS_UserData.arcade:GetArcadeRecordForStoryList(heroId, pnlRecord.ModeIndex)

	pnlRecord.RecordLoader.loadCount = #recordList

	function pnlRecord.RecordLoader.loadCallback(index, com, data)
		local StoryName = com:GetText("Place")
		local timeEasy = com:GetText("Time_Easy")
		local timeCSEasy = com:GetText("Time_Easy_time2")
		local scoreIcon = com:GetGameObject("Time_Easy_score")

		scoreIcon = XImage:new(scoreIcon)

		local timeNormal = com:GetText("Time_Nomal")
		local timeCSNormal = com:GetText("Time_Nomal_time2")
		local timeHard = com:GetText("Time_Hard")
		local timeCSHard = com:GetText("Time_Hard_time2")
		local KillCount = com:GetText("Time_All")

		StoryName:SetContent(GameText["UI_ARCADE_STORY_NAME_" .. recordList[index].storyId])
		timeEasy:SetContent("")
		timeCSEasy:SetContent("")
		timeNormal:SetContent("")
		timeCSNormal:SetContent("")
		timeHard:SetContent("")
		timeCSHard:SetContent("")
		KillCount:SetContent("")

		if recordList[index].totalScore ~= nil then
			timeEasy:SetContent(recordList[index].totalScore)
		end

		if recordList[index].levelPoint ~= nil then
			local retABCS = FS_UserData.arcade:ConvertLevelPointToText(recordList[index].levelPoint)
			local spriteABCS = XObjectPool.GetIcon("arcade_score_" .. retABCS)

			scoreIcon.gameObject:SetActive(true)
			scoreIcon:SetSprite(spriteABCS)
		else
			scoreIcon.gameObject:SetActive(false)
		end

		if recordList[index].time ~= nil then
			local hisTime = TimeHelper.getTimeSpan(tonumber(recordList[index].time))

			if tonumber(recordList[index].time) > 356400 then
				timeNormal:SetContent(">99")
			else
				timeNormal:SetContent(hisTime.Hours .. ":" .. hisTime.Minutes .. ":" .. hisTime.Seconds)
			end
		end

		if recordList[index].killScore ~= nil then
			timeHard:SetContent(recordList[index].killScore)
		end

		if recordList[index].killCount ~= nil then
			KillCount:SetContent(recordList[index].killCount)
		end
	end

	pnlRecord.RecordLoader:Load()
end

function ArcadeCtrl.LoadRankStory()
	pnlRanking.isRequesting = false
	pnlRanking.RankStoryLoader.loadCount = #ArcadeCtrl.StoryIdList

	function pnlRanking.RankStoryLoader.loadCallback(index, com, data)
		local storyId = ArcadeCtrl.StoryIdList[index]
		local StoryName = com:GetText("Text")

		StoryName:SetContent(GameText["UI_ARCADE_STORY_NAME_" .. storyId])

		local btn = com:GetButton("BG")

		btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			pnlRanking.heroMy:SetActive(true)
			pnlRanking.timeMy:SetActive(true)
			UILayerCtrl.OnSelect("storyBtn" .. index)
			btn:SetSelectedLight(true)
			ArcadeCtrl.LoadPlayer(storyId)
			ArcadeCtrl.LoadMyRank(storyId)
		end)
		UILayerCtrl.AddButton("Arcade_Ranking", "storyBtn" .. index, btn)
		btn:SetParentScroll(pnlRanking.storyScroll)

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "storyBtn" .. index - 1)
		else
			btn:SetAdjacent(XButton.Adjacent.UP, "storyBtn" .. pnlRanking.RankStoryLoader.loadCount)
		end

		if index == #ArcadeCtrl.StoryIdList then
			UILayerCtrl.OnSelect("storyBtn1")
			UILayerCtrl.OnCursorClickMute()
			btn:SetAdjacent(XButton.Adjacent.DOWN, "storyBtn1")

			pnlRanking.storyScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.storyScroll.scrollRectCom.normalizedPosition.x, 1)
		else
			btn:SetAdjacent(XButton.Adjacent.DOWN, "storyBtn" .. index + 1)
		end
	end

	pnlRanking.RankStoryLoader:Load()
end

function ArcadeCtrl.LoadPlayer(storyId)
	local rankList = FS_UserData.arcade:GetRankList(pnlRanking.ModeIndex, storyId)

	pnlRanking.RankPlayerLoader.loadCount = #rankList

	function pnlRanking.RankPlayerLoader.loadCallback(index, com, data)
		local playerNameText = com:GetText("playerName_text")
		local selfFlag = com:GetGameObject("playerName_text_selfIcon")
		local rankText = com:GetText("rank")
		local heroIcon = com:GetGameObject("ChangeGroup_hero_heroIcon")

		heroIcon = XImage:new(heroIcon)

		local perfectFlag = com:GetGameObject("ChangeGroup_hero_perfect")
		local timeText = com:GetText("ChangeGroup_time")
		local timeCSText = com:GetText("ChangeGroup_time_time2")
		local scoreText = com:GetText("ChangeGroup_score")
		local scoreIcon = com:GetGameObject("ChangeGroup_score_Icon")

		scoreIcon = XImage:new(scoreIcon)

		local extraList = StringHelper.Split(rankList[index].extraData, "|")

		if extraList[5] ~= nil then
			local retABCS = FS_UserData.arcade:ConvertLevelPointToText(extraList[5])
			local spriteABCS = XObjectPool.GetIcon("arcade_score_" .. retABCS)

			scoreIcon.gameObject:SetActive(true)
			scoreIcon:SetSprite(spriteABCS)
		else
			scoreIcon.gameObject:SetActive(false)
		end

		rankText:SetContent(index)
		selfFlag:SetActive(tonumber(rankList[index].accountId) == tonumber(LS_Setting.keyUserId))
		playerNameText:SetContent(rankList[index].nickName)
		scoreText:SetContent(rankList[index].score)

		local sprite = XObjectPool.GetIcon("photo" .. extraList[1])

		if extraList[1] == tostring(FS_Arcade.StageTotalHeroId) then
			sprite = XObjectPool.GetIcon("photo" .. 10007)
		end

		heroIcon:SetSprite(sprite)
		perfectFlag:SetActive(false)

		local hisTime = TimeHelper.getTimeSpan(tonumber(extraList[2]))

		if tonumber(extraList[2]) > 356400 then
			timeText:SetContent(">99")
			timeCSText:SetContent("")
		else
			timeText:SetContent(hisTime.Hours .. ":" .. hisTime.Minutes .. ":" .. hisTime.Seconds)
			timeCSText:SetContent("")
		end

		if index == pnlRanking.RankPlayerLoader.loadCount then
			pnlRanking.playerScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.playerScroll.scrollRectCom.normalizedPosition.x, 1)
		end
	end

	pnlRanking.RankPlayerLoader:Load()
end

function ArcadeCtrl.LoadMyRank(storyId)
	local selfRank = FS_UserData.arcade:GetSelfRank(pnlRanking.ModeIndex, storyId)

	if selfRank.rank == nil or selfRank.rank == -1 then
		pnlRanking.myRank:SetContent("--")
	else
		pnlRanking.myRank:SetContent(tostring(selfRank.rank + 1))
	end

	if selfRank.score == nil then
		pnlRanking.myScore:SetContent("")
	else
		pnlRanking.myScore:SetContent(selfRank.score)
	end

	if selfRank.extraData ~= nil and selfRank.extraData ~= "" then
		local extraList = StringHelper.Split(selfRank.extraData, "|")
		local sprite = XObjectPool.GetIcon("photo" .. extraList[1])

		if extraList[1] == tostring(FS_Arcade.StageTotalHeroId) then
			sprite = XObjectPool.GetIcon("photo" .. 10007)
		end

		pnlRanking.myHeroIcon:SetSprite(sprite)
		pnlRanking.myHeroIcon.gameObject:SetActive(true)

		local hisTime = TimeHelper.getTimeSpan(tonumber(extraList[2]))

		if tonumber(extraList[2]) > 356400 then
			pnlRanking.myTime:SetContent(">99")
			pnlRanking.myCSTime:SetContent("")
		else
			pnlRanking.myTime:SetContent(hisTime.Hours .. ":" .. hisTime.Minutes .. ":" .. hisTime.Seconds)
			pnlRanking.myCSTime:SetContent("")
		end
	else
		pnlRanking.myHeroIcon.gameObject:SetActive(false)
		pnlRanking.myTime:SetContent("--:--:--")
		pnlRanking.myCSTime:SetContent("")
	end
end

function ArcadeCtrl.GetSubIndices(currIdx, maxCount, excluded)
	local keyPrev = (currIdx - 2 + maxCount) % maxCount + 1
	local keyNext = currIdx % maxCount + 1

	while keyPrev == excluded do
		keyPrev = (keyPrev - 2 + maxCount) % maxCount + 1
	end

	while keyNext == excluded do
		keyNext = keyNext % maxCount + 1
	end

	SystemHelper.LogError(keyPrev .. " <= " .. currIdx .. " => " .. keyNext)

	return keyPrev, keyNext
end

function ArcadeCtrl.FindNextSlotIdx(currIdx, maxCount)
	local nextIndex = 1

	for idx = 1, maxCount do
		if idx ~= currIdx then
			nextIndex = idx

			break
		end
	end

	return nextIndex
end

function ArcadeCtrl.EnterSubLoadEdit(idxCpy)
	SystemHelper.LogError("[ ArcadeCtrl.EnterSubLoadEdit( " .. idxCpy .. " ) ]")

	if pnlLoad then
		pnlLoad.isInEditMode = true

		local userId = LS_Account.userId
		local btns = pnlLoad.btns
		local hasSaveData = LS_Game.IsReadable(userId, idxCpy, true)
		local idxOffset = 0

		if hasSaveData then
			this.SetPnlLoadCmdBar(false, true, true)
			this.SetPnlLoadNavBar(false)

			local count = table.nums(btns) - idxOffset
			local nextIdx = this.FindNextSlotIdx(idxCpy, count)
			local namePrefix = "LoadGame_SlotBtn"
			local slotSrc = btns[idxCpy + idxOffset]

			if slotSrc then
				slotSrc.inEdit:SetActive(false)
				slotSrc.inCopy:SetActive(true)
				slotSrc.btn:SetInteractable(false)
			end

			for i = 1, count do
				local bodyBtn = btns[i + idxOffset]
				local btn = bodyBtn.btn
				local keyPrev, keyNext = this.GetSubIndices(i, count, idxCpy)

				btn:SetAdjacent(XButton.Adjacent.UP, namePrefix .. keyPrev + idxOffset)
				btn:SetAdjacent(XButton.Adjacent.DOWN, namePrefix .. keyNext + idxOffset)
				SystemHelper.Log(keyPrev + idxOffset .. " <= " .. i + idxOffset .. " => " .. keyNext + idxOffset)
			end

			pnlLoad.idxSel = nextIdx + idxOffset

			UILayerCtrl.Push(ArcadeCtrl.Arcade_Edit, "LoadGame_SlotBtn" .. nextIdx + idxOffset)
			SystemHelper.Log("[ => Copy Slot " .. idxCpy .. " to " .. nextIdx .. " (in " .. count .. ") ]")
		else
			SystemHelper.Log("[ => No savedata to copy from " .. idxCpy .. " ]")

			idxCpy = 0
		end
	end

	return idxCpy
end

function ArcadeCtrl.ExitSubLoadEdit()
	UILayerCtrl.Pop()

	if pnlLoad then
		pnlLoad.isInEditMode = false

		local idxCpy = pnlLoad.idxCpySrc
		local namePrefix = "LoadGame_SlotBtn"
		local btns = pnlLoad.btns
		local userId = LS_Account.userId
		local hasAutosaved = LS_Autosave.IsReadable(userId)
		local idxOffset = 0

		if hasAutosaved then
			local bodyBtn = btns[1]
			local btn = bodyBtn.btn

			btn:SetNormal(true)
		end

		local count = table.nums(btns)

		for i = 2, count do
			local bodyBtn = btns[i]
			local btn = bodyBtn.btn
			local keyPrev, keyNext = this.GetNavIndices(i, count)

			btn:SetAdjacent(XButton.Adjacent.UP, namePrefix .. keyPrev)
			btn:SetAdjacent(XButton.Adjacent.DOWN, namePrefix .. keyNext)
		end

		this.SetPnlLoadCmdBar(true, false, false)
		this.RefreshLoadGame()

		local slotSrc = btns[idxCpy + idxOffset]

		if slotSrc then
			slotSrc.inEdit:SetActive(true)
			slotSrc.inCopy:SetActive(false)
			slotSrc.btn:SetInteractable(true)
		end

		pnlLoad.idxCpySrc = 0

		return idxCpy + idxOffset
	end

	return 0
end

function ArcadeCtrl.CopySaveData(slotSrc, slotDst)
	SystemHelper.Log(string.format("[ Copy savedata %d => %d ]", slotSrc, slotDst))

	local keySrc = LS_Game.GetKey(slotSrc, true)
	local keyDst = LS_Game.GetKey(slotDst, true)

	LS_Setting.CopyArcadeSaveSlotInfo(slotSrc, slotDst)
	LS_Setting.Update()

	return LS_Game.Copy(keySrc, keyDst)
end

function ArcadeCtrl.HideSubLoadEdit()
	local idxCpySrc = ArcadeCtrl.ExitSubLoadEdit()

	SystemHelper.LogError(string.format("HideSubLoadEdit %d", idxCpySrc))
	UILayerCtrl.OnSelect(string.format("LoadGame_SlotBtn%d", idxCpySrc))
end

function ArcadeCtrl.OnCreate()
	this.loadFinish = false
	sceneController = ST_Lobby.GetSceneController()

	UILayerCtrl.SetSceneController(sceneController)

	bRefresh = true
	gameConfig = {}
	gameConfig.difficulty = 1
	gameConfig.storyId = ArcadeCtrl.StoryIdBase + 1
	pnlMain = {}
	pnlMode = {}
	pnlNew = {}
	pnlLoad = {}
	pnlLevel = {}
	pnlRecord = {}
	pnlRanking = {}
	panels = {}
	panels.Arcade_Main = pnlMain
	panels.Arcade_Mode = pnlMode
	panels.Arcade_New = pnlNew
	panels.Arcade_Load = pnlLoad
	panels.Arcade_Level = pnlLevel
	panels.Arcade_Record = pnlRecord
	panels.Arcade_Ranking = pnlRanking
	pnlLevel.LevelIndexs = {}

	for k, v in pairs(ArcadeCtrl.MenuLevelIdList) do
		pnlLevel.LevelIndexs[v] = k
	end

	local btnKeyIdx = ArcadeCtrl.BtnKeyIdx
	local btnCbIdx = ArcadeCtrl.BtnCbIdx
	local panelCount = table.nums(ArcadeCtrl.UI)

	for k, v in pairs(ArcadeCtrl.UI) do
		panels[v].go = this.mainComponent:GetGameObject(v)

		UILayerCtrl.Add(v, ArcadeCtrl[ArcadeCtrl.CbBack[k]])
	end

	UILayerCtrl.Add(ArcadeCtrl.Arcade_Edit, ArcadeCtrl.ExitSubLoadEdit)

	local userId = LS_Account.userId
	local langId = LS_Setting.GetLanguage()
	local btnCfg = ArcadeCtrl.MainMenu
	local btnCnt = table.nums(btnCfg)

	pnlMain.menu = {}
	pnlMain.menu.go = this.mainComponent:GetGameObject("Arcade_Main_Menu_R")
	pnlMain.menu.bg = this.mainComponent:GetGameObject("Arcade_Main_MenuBg")
	pnlMain.menu.logo = XImage:new(this.mainComponent:GetGameObject("Arcade_Main_LOGO_R"))

	if pnlMain.menu.logo ~= nil then
		local imgLogoName = "yln_dlc_logo_en"

		if langId == "zhs" then
			imgLogoName = "yln_dlc_logo_cn"
		elseif langId == "jp" then
			imgLogoName = "yln_dlc_logo_jp"
		end

		local sprite = XObjectPool.GetIcon(imgLogoName)

		if sprite then
			pnlMain.menu.logo:SetSprite(sprite)
		end
	end

	if not UIManager.IsUiAdapted("Arcade") and pnlMain.menu.bg ~= nil and SystemHelper.isExtraWideScreen() then
		local rectTf = pnlMain.menu.bg:GetComponent("RectTransform")
		local rect = rectTf.rect

		rectTf.sizeDelta = Vector2.New(rect.width + 120, rect.height)
	end

	pnlMain.menu.cb = {}
	pnlMain.menu.btn = {}
	pnlMain.menu.btnCnt = btnCnt

	for i = 1, btnCnt do
		local btnKey = btnCfg[i][btnKeyIdx]
		local btn = this.mainComponent:GetButton(btnKey)

		pnlMain.menu.cb[i] = ArcadeCtrl[btnCfg[i][btnCbIdx]]

		if btn then
			local keyPrev, keyNext = ArcadeCtrl.GetNavBtnIndices(i, btnCnt)

			btn:SetAdjacent(XButton.Adjacent.UP, btnCfg[keyPrev][btnKeyIdx])
			btn:SetAdjacent(XButton.Adjacent.DOWN, btnCfg[keyNext][btnKeyIdx])
			btn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
				bRefresh = true
			end, 0)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				UILayerCtrl.OnSelect(btnKey)
				btn:SetSelectedLight(true)
				pnlMain.menu.cb[i]()
			end, 0)

			pnlMain.menu.btn[i] = btn

			UILayerCtrl.AddButton(ArcadeCtrl.UI.Main, btnKey, btn)
		end
	end

	pnlMain.navBar = this.mainComponent:GetGameObject("Arcade_Main_NavBar_B")

	if LS_Game.HasSaveData(userId, true) then
		UILayerCtrl.Push(ArcadeCtrl.UI.Main, btnCfg[2][btnKeyIdx])
	else
		UILayerCtrl.Push(ArcadeCtrl.UI.Main, btnCfg[1][btnKeyIdx])
	end

	local btnCfg = ArcadeCtrl.ModeMenu
	local btnCnt = table.nums(btnCfg)

	pnlMode.show = false
	pnlMode.isFromLoad = false
	pnlMode.menu = {}
	pnlMode.menu.intro = this.mainComponent:GetText("Arcade_Mode_Text_Intro")
	pnlMode.menu.cb = {}
	pnlMode.menu.btn = {}
	pnlMode.menu.lock = {}
	pnlMode.menu.lock[3] = this.mainComponent:GetGameObject("Arcade_Mode_BtnExpert_Locked")
	pnlMode.menu.btnCnt = btnCnt

	for i = 1, btnCnt do
		local btnKey = btnCfg[i][btnKeyIdx]
		local btn = this.mainComponent:GetButton(btnKey)

		pnlMode.menu.cb[i] = ArcadeCtrl[btnCfg[i][btnCbIdx]]

		if btn then
			local keyPrev, keyNext = ArcadeCtrl.GetNavBtnIndicesNoLoop(i, btnCnt)

			btn:SetAdjacent(XButton.Adjacent.LEFT, btnCfg[keyPrev][btnKeyIdx])
			btn:SetAdjacent(XButton.Adjacent.RIGHT, btnCfg[keyNext][btnKeyIdx])
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				UILayerCtrl.OnSelect(btnKey)
				btn:SetSelectedLight(true)
				pnlMode.menu.cb[i]()
			end, 0)

			pnlMode.menu.btn[i] = btn

			UILayerCtrl.AddButton(ArcadeCtrl.UI.Mode, btnKey, btn)
		end
	end

	pnlMode.navBar = this.mainComponent:GetGameObject("Arcade_Mode_NavBar_B")
	pnlMode.btnBack = this.mainComponent:GetButton("Arcade_Mode_Button_Back")

	pnlMode.btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ArcadeCtrl.OnButtonModeBack()
	end, 0)

	pnlMode.btnConfirm = this.mainComponent:GetButton("Arcade_Mode_Button_Confirm")

	pnlMode.btnConfirm:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ArcadeCtrl.OnButtonModeConfirm()
	end, 0)

	local slotBtnNamePrefix = "NewGame_SlotBtn"

	pnlNew.show = false
	pnlNew.navBar = this.mainComponent:GetGameObject("Arcade_New_NavBar_B")
	pnlNew.rowIndex = 1
	pnlNew.rowPrevious = 1
	pnlNew.selIndex = 1
	pnlNew.preIndex = 1

	local btn = this.mainComponent:GetButton(ArcadeCtrl.SubNew.ButtonBack)

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			ArcadeCtrl.OnButtonNewBack()
		end, 0)
		UILayerCtrl.AddIndividual(ArcadeCtrl.UI.New, ArcadeCtrl.SubNew.ButtonBack, btn)
	end

	pnlNew.btnBack = btn
	pnlNew.showCmdBar = false
	pnlNew.pnlCmdBar = this.mainComponent:GetGameObject("Arcade_New_Buttons_B")

	pnlNew.pnlCmdBar:SetActive(false)

	pnlNew.btns = {}
	pnlNew.scrollView = this.mainComponent:GetGameObject("Arcade_New_ScrollView")
	pnlNew.scrollRect = XScrollRect:new(pnlNew.scrollView)
	pnlNew.scrollViewContent = this.mainComponent:GetGameObject("Arcade_New_Loader")

	local elemCount = ArcadeCtrl.SubNew.ListCount
	local showCount = ArcadeCtrl.SubNew.ShowCount

	if SystemHelper.isSubquadrateScrAS() then
		showCount = showCount + 1
	end

	pnlNew.listCount = elemCount
	pnlNew.showCount = showCount

	local rectTf = pnlNew.scrollViewContent:GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 110 * elemCount + 16 * (elemCount - 1))

	local rectTf = pnlNew.scrollView:GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 110 * showCount + 16 * (showCount - 1))
	loaderNew = this.mainComponent:GetLoader("Arcade_New_Loader")
	loaderNew.loadCount = elemCount
	loaderNew.loadStepping = 0
	loaderNew.loadFinished = false

	function loaderNew.loadCallback(index, com, data)
		local bodyBtn = {}

		bodyBtn.idx = index
		bodyBtn.status = ArcadeCtrl.Status.Blank
		bodyBtn.selected = com:GetGameObject("Arcade_SaveSlot_Sel")
		bodyBtn.blank = com:GetGameObject("Arcade_SaveSlot_Blank")
		bodyBtn.inEdit = com:GetGameObject("Arcade_SaveSlot_InEdit")
		bodyBtn.inCopy = com:GetGameObject("Arcade_SaveSlot_InCopy")

		local inUse = {}

		inUse.go = com:GetGameObject("Arcade_SaveSlot_InUse")
		inUse.heroName = com:GetText("Arcade_SaveSlot_InUse_PlaceValue")
		inUse.location = com:GetText("Arcade_SaveSlot_InUse_LevelValue")
		inUse.playtime = com:GetText("Arcade_SaveSlot_InUse_PlaytimeValue")
		inUse.savetime = com:GetText("Arcade_SaveSlot_InUse_SavetimeValue")
		inUse.gamemode = com:GetText("Arcade_SaveSlot_InUse_ModeValue")
		inUse.roundcount = com:GetText("Arcade_SaveSlot_InUse_RoundValue")
		bodyBtn.inUse = inUse

		local hasSaveData = LS_Game.IsReadable(userId, index, true)

		if hasSaveData == true then
			local slotData = LS_Setting.saveSlotArcade[index]

			if slotData then
				local location = slotData[LS_Setting.SlotStatus.Location]

				if location > 0 then
					local heroId = slotData[LS_Setting.SlotStatus.HeroId]
					local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
					local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
					local gMode = slotData[LS_Setting.SlotStatus.GameMode]
					local rCount = slotData[LS_Setting.SlotStatus.RoundCount]
					local pnl = bodyBtn.inUse
					local playTime = TimeHelper.getTimeSpan(pTime)

					pnl.location:SetGameTextContent(function()
						local siteData = MS_SiteInfo.GetSite(location % 100)

						if siteData then
							return siteData.Name
						else
							return "Not defined: " .. location
						end
					end)

					local ts, tzo = TimeHelper.getUtcTime()
					local heroData = MS_HeroData.GetHero(heroId)

					if heroData ~= nil then
						pnl.heroName:SetContent(heroData.Name)
					end

					pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
					pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

					if gMode == BattleData.GlobalDifficultyLevel.Casual then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
					elseif gMode == BattleData.GlobalDifficultyLevel.Normal then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
					else
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_HARDCORE)
					end

					pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
					bodyBtn.inUse.go:SetActive(true)
				else
					bodyBtn.inUse.go:SetActive(false)
				end

				bodyBtn.blank:SetActive(false)
			else
				bodyBtn.inUse.go:SetActive(false)
				bodyBtn.blank:SetActive(true)
			end
		else
			bodyBtn.inUse.go:SetActive(false)
			bodyBtn.blank:SetActive(true)
		end

		local btn = com:GetButton("Arcade_SaveSlot_Btn")

		if btn then
			btn.idx = index

			btn.gameObject:SetActive(true)
			btn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				ArcadeCtrl.OnButtonNewStart(index)
			end, 0)

			local keyPrev, keyNext = ArcadeCtrl.GetNavBtnIndices(index, loaderNew.loadCount)
			local keyC = string.format("%s%d", slotBtnNamePrefix, index)

			btn:SetAdjacent(XButton.Adjacent.UP, string.format("%s%d", slotBtnNamePrefix, keyPrev))
			btn:SetAdjacent(XButton.Adjacent.DOWN, string.format("%s%d", slotBtnNamePrefix, keyNext))
			btn:SetParentScroll(pnlNew.scrollRect)
			UILayerCtrl.AddButton(ArcadeCtrl.UI.New, keyC, btn)

			bodyBtn.btn = btn
			pnlNew.btns[index] = bodyBtn
			loaderNew.loadStepping = loaderNew.loadStepping + 1
			loaderNew.loadFinished = loaderNew.loadStepping == loaderNew.loadCount
		end
	end

	loaderNew:PreloadTemplate(function()
		loaderNew:Load()
	end)

	local slotBtnNamePrefix = "LoadGame_SlotBtn"

	pnlLoad.show = false
	pnlLoad.isSuspend = false
	pnlLoad.navBar = this.mainComponent:GetGameObject("Arcade_Load_NavBar_B")
	pnlLoad.isInEditMode = false
	pnlLoad.rowIndex = 1
	pnlLoad.rowPrevious = 1
	pnlLoad.selIndex = 1
	pnlLoad.preIndex = 1
	pnlLoad.idxCpySrc = 0

	local btn = this.mainComponent:GetButton(ArcadeCtrl.SubLoad.ButtonBack)

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			ArcadeCtrl.OnButtonLoadBack()
		end, 0)
		UILayerCtrl.AddIndividual(ArcadeCtrl.UI.Load, ArcadeCtrl.SubLoad.ButtonBack, btn)
	end

	pnlLoad.btnBack = btn
	pnlLoad.showCmdBar = true
	pnlLoad.pnlCmd = this.mainComponent:GetGameObject("Arcade_Load_Buttons_B")

	if bSaveEdit then
		pnlLoad.pnlCmd:SetActive(true)
	else
		pnlLoad.pnlCmd:SetActive(false)
	end

	pnlLoad.showLoad = true
	pnlLoad.showConfirm = false
	pnlLoad.showBack = false

	local btn = this.mainComponent:GetButton("Arcade_Load_Edit_BtnLoad")

	pnlLoad.btnCmdLoad = btn

	UILayerCtrl.AddIndividual(ArcadeCtrl.UI.Load, "Arcade_Load_Edit_BtnLoad", btn)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			ArcadeCtrl.OnButtonLoadStart(pnlLoad.idxSel)
		end, 0)
	end

	pnlLoad.goCmdLoad = this.mainComponent:GetGameObject("Arcade_Load_Edit_BtnLoad")

	pnlLoad.goCmdLoad:SetActive(pnlLoad.showLoad)

	local btn = this.mainComponent:GetButton("Arcade_Load_Edit_BtnConfirm")

	pnlLoad.btnCmdConfirm = btn

	UILayerCtrl.AddIndividual(ArcadeCtrl.Arcade_Edit, "Arcade_Load_Edit_BtnConfirm", btn)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local userId = LS_Account.userId
			local slotIdx = pnlLoad.idxSel

			if LS_Game.IsReadable(userId, slotIdx, true) then
				SystemHelper.Log(string.format("[ ! Savedata exists in slot %d. ]", slotIdx))
				UIManager.SendMessage("MsgBoxSimple", "OpenHoldConfirmAndCancel", GameText.UI_LOBBY_CAUSION_REPLACE_SAVEDATA, function()
					SystemHelper.Log(string.format("[ Copy to occupied slot: %d => %d ]", pnlLoad.idxCpySrc, slotIdx))

					local ret = this.CopySaveData(pnlLoad.idxCpySrc, pnlLoad.idxSel)

					if ret == true then
						SystemHelper.Log("R复制 成功")
					else
						UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CAUSION_COPY_SAVEDATA_FAILED)
						SystemHelper.Log("R复制 失败!!!!!!!!!!!!")
					end

					local idxCpySrc = this.ExitSubLoadEdit()

					pnlLoad.idxSel = idxCpySrc

					UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. idxCpySrc)
					this.RevalidateSlots()
				end, function()
					return
				end, false)
			else
				SystemHelper.Log(string.format("[ Copy to empty slot: %d => %d ]", pnlLoad.idxCpySrc, slotIdx))

				local ret = this.CopySaveData(pnlLoad.idxCpySrc, slotIdx)

				if ret == true then
					SystemHelper.Log("E复制 成功")
				else
					UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CAUSION_COPY_SAVEDATA_FAILED)
					SystemHelper.Log("E复制 失败!!!!!!!!!!!!")
				end

				local idxCpySrc = this.ExitSubLoadEdit()

				pnlLoad.idxSel = idxCpySrc

				UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. idxCpySrc)
				this.RevalidateSlots()
			end
		end, 0)
	end

	pnlLoad.goCmdConfirm = this.mainComponent:GetGameObject("Arcade_Load_Edit_BtnConfirm")

	pnlLoad.goCmdConfirm:SetActive(pnlLoad.showConfirm)

	local btn = this.mainComponent:GetButton("Arcade_Load_Edit_BtnBack")

	pnlLoad.btnCmdBack = btn

	UILayerCtrl.AddIndividual(ArcadeCtrl.Arcade_Edit, "Arcade_Load_Edit_BtnBack", btn)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			ArcadeCtrl.HideSubLoadEdit()
		end, 0)
	end

	pnlLoad.goCmdBack = this.mainComponent:GetGameObject("Arcade_Load_Edit_BtnBack")

	pnlLoad.goCmdBack:SetActive(pnlLoad.showBack)

	pnlLoad.btns = {}
	pnlLoad.scrollView = this.mainComponent:GetGameObject("Arcade_Load_ScrollView")
	pnlLoad.scrollRect = XScrollRect:new(pnlLoad.scrollView)
	pnlLoad.scrollViewContent = this.mainComponent:GetGameObject("Arcade_Load_Loader")

	local elemCount = ArcadeCtrl.SubLoad.ListCount
	local showCount = ArcadeCtrl.SubLoad.ShowCount

	if SystemHelper.isSubquadrateScrAS() then
		showCount = showCount + 1
	end

	pnlLoad.showCount = showCount
	pnlLoad.listCount = elemCount

	local rectTf = pnlLoad.scrollViewContent:GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 110 * elemCount + 16 * (elemCount - 1))

	local rectTf = pnlLoad.scrollView:GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 110 * showCount + 16 * (showCount - 1))
	loaderLoad = this.mainComponent:GetLoader("Arcade_Load_Loader")
	loaderLoad.loadCount = elemCount
	loaderLoad.loadStepping = 0
	loaderLoad.loadFinished = false

	function loaderLoad.loadCallback(index, com, data)
		local bodyBtn = {}

		bodyBtn.idx = index
		bodyBtn.status = ArcadeCtrl.Status.Blank
		bodyBtn.selected = com:GetGameObject("Arcade_SaveSlot_Sel")
		bodyBtn.blank = com:GetGameObject("Arcade_SaveSlot_Blank")
		bodyBtn.inEdit = com:GetGameObject("Arcade_SaveSlot_InEdit")
		bodyBtn.inCopy = com:GetGameObject("Arcade_SaveSlot_InCopy")

		local inUse = {}

		inUse.go = com:GetGameObject("Arcade_SaveSlot_InUse")
		inUse.heroName = com:GetText("Arcade_SaveSlot_InUse_PlaceValue")
		inUse.location = com:GetText("Arcade_SaveSlot_InUse_LevelValue")
		inUse.playtime = com:GetText("Arcade_SaveSlot_InUse_PlaytimeValue")
		inUse.savetime = com:GetText("Arcade_SaveSlot_InUse_SavetimeValue")
		inUse.gamemode = com:GetText("Arcade_SaveSlot_InUse_ModeValue")
		inUse.roundcount = com:GetText("Arcade_SaveSlot_InUse_RoundValue")
		bodyBtn.inUse = inUse

		local btn = com:GetButton("Arcade_SaveSlot_InEdit_Delete")

		if btn then
			btn.idx = bodyBtn.idx

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				ArcadeCtrl.EraseSaveSlot(btn.idx)
			end, 0)
		end

		bodyBtn.btnDel = btn

		local btn = com:GetButton("Arcade_SaveSlot_InEdit_Copy")

		if btn then
			btn.idx = bodyBtn.idx

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				if pnlLoad then
					pnlLoad.idxCpySrc = ArcadeCtrl.EnterSubLoadEdit(btn.idx)
				end
			end, 0)
		end

		bodyBtn.btnCpy = btn

		local hasSaveData = LS_Game.IsReadable(userId, index, true)

		if hasSaveData then
			local slotData = LS_Setting.saveSlotArcade[index]

			if slotData then
				local location = slotData[LS_Setting.SlotStatus.Location]

				if location > 0 then
					local heroId = slotData[LS_Setting.SlotStatus.HeroId]
					local pTime = slotData[LS_Setting.SlotStatus.PlayTime]
					local sTime = slotData[LS_Setting.SlotStatus.SaveTime]
					local gMode = slotData[LS_Setting.SlotStatus.GameMode]
					local rCount = slotData[LS_Setting.SlotStatus.RoundCount]
					local pnl = bodyBtn.inUse
					local playTime = TimeHelper.getTimeSpan(pTime)

					pnl.location:SetGameTextContent(function()
						local siteData = MS_SiteInfo.GetSite(location % 100)

						if siteData then
							return siteData.Name
						else
							return "Not defined: " .. location
						end
					end)

					local ts, tzo = TimeHelper.getUtcTime()
					local heroData = MS_HeroData.GetHero(heroId)

					if heroData ~= nil then
						pnl.heroName:SetContent(heroData.Name)
					end

					pnl.playtime:SetContent(playTime.Hours .. ":" .. playTime.Minutes .. ":" .. playTime.Seconds)
					pnl.savetime:SetContent(os.date("%Y/%m/%d %H:%M:%S", sTime))

					if gMode == BattleData.GlobalDifficultyLevel.Casual then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
					elseif gMode == BattleData.GlobalDifficultyLevel.Normal then
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
					else
						pnl.gamemode:SetContent(GameText.UI_COMMON_GAMEMODE_HARDCORE)
					end

					pnl.roundcount:SetContent(rCount > 99 and GameText.UI_COMMON_OVER99 or rCount)
					bodyBtn.inUse.go:SetActive(true)
				else
					bodyBtn.inUse.go:SetActive(false)
				end

				bodyBtn.blank:SetActive(false)
			else
				bodyBtn.inUse.go:SetActive(false)
				bodyBtn.blank:SetActive(true)
			end
		else
			bodyBtn.inUse.go:SetActive(false)
			bodyBtn.blank:SetActive(true)
		end

		local btn = com:GetButton("Arcade_SaveSlot_Btn")

		if btn then
			btn.idx = index

			btn.gameObject:SetActive(true)
			btn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				if bSaveEdit then
					pnlLoad.idxSel = btn.idx

					local userId = LS_Account.userId
					local lName = UILayerCtrl.GetCurrentLayerName()

					SystemHelper.Log(string.format("Touch slot %d in %s", pnlLoad.idxSel, lName))

					if lName == ArcadeCtrl.UI.Load then
						if LS_Game.IsReadable(userId, btn.idx, true) then
							bodyBtn.inEdit:SetActive(true)
							SystemHelper.Log(string.format("[ * arcade_%s_%d ]", userId, btn.idx))
						else
							bodyBtn.inEdit:SetActive(false)
							SystemHelper.Log(string.format("[ _ arcade_%s_%d ]", userId, btn.idx))
						end
					end

					this.RefreshLoadGame(pnlLoad.idxSel)
					SystemHelper.Log("[ SubLoadGame: => " .. btn.idx .. " ]")
					UILayerCtrl.OnSelect("LoadGame_SlotBtn" .. pnlLoad.idxSel)
					bodyBtn.selected:SetActive(true)
				else
					ArcadeCtrl.OnButtonLoadStart(index)
				end
			end, 0)

			local keyPrev, keyNext = ArcadeCtrl.GetNavBtnIndices(index, loaderLoad.loadCount)
			local keyC = string.format("%s%d", slotBtnNamePrefix, index)

			btn:SetAdjacent(XButton.Adjacent.UP, string.format("%s%d", slotBtnNamePrefix, keyPrev))
			btn:SetAdjacent(XButton.Adjacent.DOWN, string.format("%s%d", slotBtnNamePrefix, keyNext))
			btn:SetParentScroll(pnlLoad.scrollRect)
			UILayerCtrl.AddButton(ArcadeCtrl.UI.Load, keyC, btn)

			bodyBtn.btn = btn
			pnlLoad.btns[index] = bodyBtn
			loaderLoad.loadStepping = loaderLoad.loadStepping + 1
			loaderLoad.loadFinished = loaderLoad.loadStepping == loaderLoad.loadCount
		end
	end

	loaderLoad:PreloadTemplate(function()
		loaderLoad:Load()
	end)

	local rowPrefix = ArcadeCtrl.RowPrefix
	local btnCfg = ArcadeCtrl.ModeLevel
	local btnCnt = table.nums(btnCfg)

	pnlLevel.show = false
	pnlLevel.isSuspend = false
	pnlLevel.sceneIdx = 1
	pnlLevel.menu = {}
	pnlLevel.menu.row = {}
	pnlLevel.menu.btn = {}
	pnlLevel.menu.btnCnt = btnCnt
	pnlLevel.menu.cb = {}

	for i = 1, btnCnt do
		local btnKey = btnCfg[i][btnKeyIdx]

		pnlLevel.menu.cb[i] = ArcadeCtrl[btnCfg[i][btnCbIdx]]

		local btn = this.mainComponent:GetButton(btnKey)

		if btn then
			local keyPrev, keyNext = ArcadeCtrl.GetNavBtnIndicesNoLoop(i, btnCnt)

			btn:SetAdjacent(XButton.Adjacent.UP, btnCfg[keyPrev][btnKeyIdx])
			btn:SetAdjacent(XButton.Adjacent.DOWN, btnCfg[keyNext][btnKeyIdx])
			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				UILayerCtrl.OnSelect(btnKey)
				btn:SetSelectedLight(true)
				pnlLevel.menu.cb[i]()
			end, 0)

			pnlLevel.menu.btn[i] = btn

			UILayerCtrl.AddButton(ArcadeCtrl.UI.Level, btnKey, btn)

			local rowPostfix = btnCfg[i][ArcadeCtrl.RowPostfixIdx]
			local keyRowBody = string.format("%s_%s", rowPrefix, rowPostfix)
			local keyRowTextRecord = string.format("%s_Text_Record_%s", rowPrefix, rowPostfix)
			local keyRowTextNoRecord = string.format("%s_Text_NoRecord_%s", rowPrefix, rowPostfix)
			local keyRowIcon = string.format("%s_Icon_%s", rowPrefix, rowPostfix)
			local keyRowTime = string.format("%s_Text_Time_%s", rowPrefix, rowPostfix)
			local keyRowScoreIcon = string.format("%s_Score_Icon_%s", rowPrefix, rowPostfix)
			local keyRowScore = string.format("%s_Text_Score_%s", rowPrefix, rowPostfix)
			local row = {}
			local difficulty = btnKeyIdx

			row.go = this.mainComponent:GetGameObject(keyRowBody)
			row.icon = XImage:new(this.mainComponent:GetGameObject(keyRowIcon))
			row.time = this.mainComponent:GetText(keyRowScore)
			row.score = this.mainComponent:GetText(keyRowTime)
			row.scoreIcon = this.mainComponent:GetGameObject(keyRowScoreIcon)
			row.scoreIcon = XImage:new(row.scoreIcon)
			row.record = {}
			row.record[0] = this.mainComponent:GetGameObject(keyRowTextNoRecord)
			row.record[1] = this.mainComponent:GetGameObject(keyRowTextRecord)

			row.record[0]:SetActive(true)
			row.record[1]:SetActive(false)
			row.icon.gameObject:SetActive(false)

			pnlLevel.menu.row[i] = row
		end
	end

	pnlLevel.btnLR = {}

	local btnL = this.mainComponent:GetButton("Arcade_Level_Button_Left")
	local btnR = this.mainComponent:GetButton("Arcade_Level_Button_Right")

	btnL:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if pnlLevel.isLoading == false then
			pnlLevel.isLoading = true

			local prevIdx, nextIdx = ArcadeCtrl.GetNavBtnIndices(pnlLevel.LevelIndexs[gameConfig.storyId], ArcadeCtrl.SceneCount)

			ArcadeCtrl.UpdateMenuLevel(prevIdx)
		end
	end, 0)
	btnR:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if pnlLevel.isLoading == false then
			pnlLevel.isLoading = true

			local prevIdx, nextIdx = ArcadeCtrl.GetNavBtnIndices(pnlLevel.LevelIndexs[gameConfig.storyId], ArcadeCtrl.SceneCount)

			ArcadeCtrl.UpdateMenuLevel(nextIdx)
		end
	end, 0)

	pnlLevel.btnLR.L = btnL
	pnlLevel.btnLR.R = btnR

	UILayerCtrl.AddIndividual(ArcadeCtrl.UI.Level, "Arcade_Level_Button_Left", btnL)
	UILayerCtrl.AddIndividual(ArcadeCtrl.UI.Level, "Arcade_Level_Button_Right", btnR)

	pnlLevel.btnBack = this.mainComponent:GetButton("Arcade_Level_Button_Back")

	pnlLevel.btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ArcadeCtrl.OnButtonLevelBack()
	end, 0)

	pnlLevel.btnConfirm = this.mainComponent:GetButton("Arcade_Level_Button_Start")

	pnlLevel.btnConfirm:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ArcadeCtrl.OnButtonLevelConfirm()
	end, 0)
	UILayerCtrl.AddIndividual(ArcadeCtrl.UI.Level, "Arcade_Level_Button_Start", pnlLevel.btnConfirm)

	pnlLevel.navBar = this.mainComponent:GetGameObject("Arcade_Load_NavBar_B")
	pnlLevel.sceneImage = XImage:new(this.mainComponent:GetGameObject("Arcade_Level_Image"))
	pnlLevel.sceneName = this.mainComponent:GetText("Arcade_Level_Name_Text")
	pnlLevel.isLoading = false
	pnlRecord.RankBtn = this.mainComponent:GetButton("Arcade_Record_Arcade_Buttom_Ranking")

	pnlRecord.RankBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ArcadeCtrl.ShowPanelRanking()
	end, 0)
	UILayerCtrl.AddIndividual(ArcadeCtrl.UI.Record, "RankBtn", pnlRecord.RankBtn)

	pnlRecord.btnBack = this.mainComponent:GetButton("Arcade_Record_Panel_TopBar_SubMode_Buttom_Back")

	pnlRecord.btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SystemHelper.LogError("[ > Arcade_Record_Back ]")
		ArcadeCtrl.OnButtonRecordBack()
	end, 0)

	pnlRecord.RankModeBtnGroup = {}
	pnlRecord.RankModeBtnGroup[1] = this.mainComponent:GetButton("Arcade_Record_ModeGroup_Mode_easy")
	pnlRecord.RankModeBtnGroup[2] = this.mainComponent:GetButton("Arcade_Record_ModeGroup_Mode_nomal")
	pnlRecord.RankModeBtnGroup[3] = this.mainComponent:GetButton("Arcade_Record_ModeGroup_Mode_hard")
	pnlRecord.recordScroll = this.mainComponent:GetGameObject("Arcade_Record_ScrollView")
	pnlRecord.recordScroll = XScrollRect:new(pnlRecord.recordScroll)
	pnlRecord.HeroLoader = this.mainComponent:GetLoader("Arcade_Record_Buttom_Hero")
	pnlRecord.HeroIndexMax = 6

	if not DebugAllHeroesInArcade then
		pnlRecord.HeroIndexMax = 1
	end

	pnlRecord.HeroLoader.loadCount = pnlRecord.HeroIndexMax
	pnlRecord.HeroIconList = {}
	pnlRecord.HeroIndex = 1

	function pnlRecord.HeroLoader.loadCallback(index, com, data)
		local heroId = ArcadeCtrl.HeroIdList[index]
		local btnHero = com:GetButton("Hero_Icon")
		local heroIcon = XImage:new(btnHero.gameObject)

		heroIcon:SetGray(true)

		pnlRecord.HeroIconList[index] = heroIcon

		local sprite = XObjectPool.GetIcon("photo" .. heroId)

		heroIcon:SetSprite(sprite)
		btnHero:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for j = 1, pnlRecord.HeroIndexMax do
				pnlRecord.HeroIconList[j]:SetGray(true)
			end

			pnlRecord.HeroIndex = index

			UILayerCtrl.OnSelect("HeroBtn" .. index)
			pnlRecord.HeroIconList[index]:SetGray(false)
			this.LoadRecord(heroId)
		end)
		UILayerCtrl.AddButton(ArcadeCtrl.UI.Record, "HeroBtn" .. index, btnHero)

		if index == 1 then
			btnHero:SetAdjacent(XButton.Adjacent.UP, "HeroBtn" .. pnlRecord.HeroIndexMax)
		else
			btnHero:SetAdjacent(XButton.Adjacent.UP, "HeroBtn" .. index - 1)
		end

		btnHero:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)

		if index == pnlRecord.HeroIndexMax then
			pnlRecord.HeroIconList[1]:SetGray(false)

			pnlRecord.HeroIndex = 1

			btnHero:SetAdjacent(XButton.Adjacent.DOWN, "HeroBtn1")
			this.LoadRecord(ArcadeCtrl.HeroIdList[1])
		else
			btnHero:SetAdjacent(XButton.Adjacent.DOWN, "HeroBtn" .. index + 1)
		end
	end

	pnlRecord.RecordLoader = this.mainComponent:GetLoader("Arcade_Record_ScrollView_Viewport_Content")
	pnlRecord.RecordContentRT = pnlRecord.RecordLoader.gameObject:GetComponent("RectTransform")
	pnlRecord.ModeIndexMax = 3

	for i = 1, pnlRecord.ModeIndexMax do
		pnlRecord.RankModeBtnGroup[i]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for j = 1, pnlRecord.ModeIndexMax do
				pnlRecord.RankModeBtnGroup[j]:SetSelectedLight(false)
			end

			pnlRecord.RankModeBtnGroup[i]:SetSelectedLight(true)

			pnlRecord.ModeIndex = i

			pnlRecord.RecordLoader:ClearChild()
			UILayerCtrl.OnSelect("HeroBtn" .. pnlRecord.HeroIndex)
			this.LoadRecord(ArcadeCtrl.HeroIdList[pnlRecord.HeroIndex])
		end)
		pnlRecord.RankModeBtnGroup[i]:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
		pnlRecord.RankModeBtnGroup[i]:SetSelectedLight(true)
		pnlRecord.RankModeBtnGroup[i]:SetSelectedLight(false)
	end

	pnlRecord.ModeIndex = 1

	pnlRecord.RankModeBtnGroup[1]:SetSelectedLight(true)
	pnlRecord.HeroLoader:Load()

	pnlRanking.btnBack = this.mainComponent:GetButton("Arcade_Rank_LeftTop_Back")

	pnlRanking.btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		SystemHelper.LogError("[ > Arcade_Rank_Back ]")
		ArcadeCtrl.OnButtonRankingBack()
	end, 0)

	pnlRanking.storyScroll = this.mainComponent:GetGameObject("Arcade_Ranking_ChapterList")
	pnlRanking.storyScroll = XScrollRect:new(pnlRanking.storyScroll)
	pnlRanking.playerScroll = this.mainComponent:GetGameObject("Arcade_Ranking_PlayerList")
	pnlRanking.playerScroll = XScrollRect:new(pnlRanking.playerScroll)
	pnlRanking.RankModeBtnGroup = {}
	pnlRanking.RankModeBtnGroup[1] = this.mainComponent:GetButton("Arcade_Rank_ModeGroup_mode_easy")
	pnlRanking.RankModeBtnGroup[2] = this.mainComponent:GetButton("Arcade_Rank_ModeGroup_mode_nomal")
	pnlRanking.RankModeBtnGroup[3] = this.mainComponent:GetButton("Arcade_Rank_ModeGroup_mode_hard")
	pnlRanking.heroMy = this.mainComponent:GetGameObject("Arcade_Ranking_MyRankGroup_ChangeGroup_heroGroup")
	pnlRanking.timeMy = this.mainComponent:GetGameObject("Arcade_Ranking_MyRankGroup_ChangeGroup_timeGroup")

	pnlRanking.heroMy:SetActive(false)
	pnlRanking.timeMy:SetActive(false)

	pnlRanking.RankStoryLoader = this.mainComponent:GetLoader("Arcade_Rank_ChapterList_Viewport_Content")
	pnlRanking.RankPlayerLoader = this.mainComponent:GetLoader("Arcade_Ranking_PlayerList_Viewport_Content")
	pnlRanking.RankPlayerContentRT = pnlRanking.RankPlayerLoader.gameObject:GetComponent("RectTransform")
	pnlRanking.myRank = this.mainComponent:GetText("Arcade_Rank_MyRankGroup_ChangeGroup_Rank_rank_myRank")

	pnlRanking.myRank:SetContent("--")

	pnlRanking.myHeroIcon = this.mainComponent:GetGameObject("Arcade_Ranking_MyRankGroup_ChangeGroup_heroGroup_heroIcon")
	pnlRanking.myHeroIcon = XImage:new(pnlRanking.myHeroIcon)
	pnlRanking.myTime = this.mainComponent:GetText("Arcade_Rank_MyRankGroup_ChangeGroup_timeGroup_time")
	pnlRanking.myCSTime = this.mainComponent:GetText("Arcade_Rank_MyRankGroup_ChangeGroup_timeGroup_time_time2")
	pnlRanking.myScore = this.mainComponent:GetText("Arcade_Ranking_MyRankGroup_ChangeGroup_ScoreGroup_Score")
	pnlRanking.ModeIndexMax = 3
	pnlRanking.arcadeRankStoryRowCount = 8
	pnlRanking.isRequesting = false

	for i = 1, pnlRanking.ModeIndexMax do
		pnlRanking.RankModeBtnGroup[i]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for j = 1, pnlRanking.ModeIndexMax do
				pnlRanking.RankModeBtnGroup[j]:SetSelectedLight(false)
			end

			pnlRanking.RankModeBtnGroup[i]:SetSelectedLight(true)

			pnlRanking.ModeIndex = i

			pnlRanking.RankPlayerLoader:ClearChild()
			pnlRanking.heroMy:SetActive(false)
			pnlRanking.timeMy:SetActive(false)
			pnlRanking.myRank:SetContent("--")
			pnlRanking.myScore:SetContent(0)

			pnlRanking.isRequesting = true

			FS_UserData.arcade:LoadRankList(pnlRanking.ModeIndex, ArcadeCtrl.LoadRankStory)
		end)
		pnlRanking.RankModeBtnGroup[i]:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
		pnlRanking.RankModeBtnGroup[i]:SetSelectedLight(true)
		pnlRanking.RankModeBtnGroup[i]:SetSelectedLight(false)
	end

	pnlRanking.ModeIndex = 1

	pnlRanking.RankModeBtnGroup[1]:SetSelectedLight(true)

	this.loadFinish = true
end

function ArcadeCtrl.UpdateSelectRowInSubRank(dir)
	local btnName = UILayerCtrl.GetCurrentButtonName()

	UILayerCtrl.Select(dir)
	UILayerCtrl.OnCursorClick()

	if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and btnName ~= nil and string.find(btnName, "storyBtn") == 1 then
		local row = tonumber(string.sub(btnName, 9))
		local toprow = 1 + Mathf.Floor((1 - pnlRanking.storyScroll.scrollRectCom.normalizedPosition.y) / (1 / (pnlRanking.RankStoryLoader.loadCount - pnlRanking.arcadeRankStoryRowCount)) + 0.5)
		local botrow = toprow + pnlRanking.arcadeRankStoryRowCount - 1

		if dir == XButton.Adjacent.DOWN and botrow <= row then
			if btnName == "storyBtn" .. pnlRanking.RankStoryLoader.loadCount then
				pnlRanking.storyScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.storyScroll.scrollRectCom.normalizedPosition.x, 1)
			else
				pnlRanking.storyScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.storyScroll.scrollRectCom.normalizedPosition.x, pnlRanking.storyScroll.scrollRectCom.normalizedPosition.y - 1 / (pnlRanking.RankStoryLoader.loadCount - pnlRanking.arcadeRankStoryRowCount))
			end
		elseif dir == XButton.Adjacent.UP and row <= toprow then
			if btnName == "storyBtn1" then
				pnlRanking.storyScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.storyScroll.scrollRectCom.normalizedPosition.x, 0)
			else
				pnlRanking.storyScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.storyScroll.scrollRectCom.normalizedPosition.x, pnlRanking.storyScroll.scrollRectCom.normalizedPosition.y + 1 / (pnlRanking.RankStoryLoader.loadCount - pnlRanking.arcadeRankStoryRowCount))
			end
		end
	end
end

function ArcadeCtrl.JPadPress(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == ArcadeCtrl.UI.Main then
		if dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN then
			bRefresh = true

			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end

		UILayerCtrl.Select(dir)
	elseif lName == ArcadeCtrl.UI.Mode then
		if dir == XButton.Adjacent.LEFT or dir == XButton.Adjacent.RIGHT then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end

		UILayerCtrl.Select(dir)
		UILayerCtrl.OnCursorClickMute()
	elseif lName == ArcadeCtrl.UI.New then
		ArcadeCtrl.UpdateSelectRowInSubNew(dir)
	elseif lName == ArcadeCtrl.UI.Load then
		ArcadeCtrl.UpdateSelectRowInSubLoad(dir)
	elseif lName == ArcadeCtrl.UI.Level then
		UILayerCtrl.Select(dir)
		UILayerCtrl.OnCursorClick()
	elseif lName == ArcadeCtrl.UI.Record then
		UILayerCtrl.Select(dir)
		UILayerCtrl.OnCursorClick()
	elseif lName == ArcadeCtrl.UI.Ranking then
		ArcadeCtrl.UpdateSelectRowInSubRank(dir)
	end
end

function ArcadeCtrl.DPadPress(dir)
	ArcadeCtrl.JPadPress(dir)
end

function ArcadeCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == ArcadeCtrl.UI.Main then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonBack()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			bRefresh = true

			UILayerCtrl.OnCursorClick()
		end
	elseif lName == ArcadeCtrl.UI.Mode then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonModeBack()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			ArcadeCtrl.OnButtonModeConfirm()
		end
	elseif lName == ArcadeCtrl.UI.New then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonNewBack()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		end
	elseif lName == ArcadeCtrl.UI.Load then
		if bSaveEdit then
			if pnlLoad then
				local slotIdx = pnlLoad.idxSel
				local slot = pnlLoad.btns[slotIdx]

				if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
					SystemHelper.Log(string.format("[ GamePad_B: %d ]", slotIdx))
					ArcadeCtrl.OnButtonLoadBack()
				elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
					SystemHelper.Log(string.format("[ GamePad_A: %d ]", slotIdx))
					UILayerCtrl.OnButtonClick("Arcade_Load_Edit_BtnLoad")
				elseif inputMgr:GetButtonDown(GBKey.X) then
					SystemHelper.Log(string.format("[ GamePad_X: %d ]", slotIdx))
					slot.btnDel:OnDown(nil, nil)
					slot.btnDel:OnClick(nil, nil)
				elseif inputMgr:GetButtonDown(GBKey.Y) then
					SystemHelper.Log(string.format("[ GamePad_Y: %d ]", slotIdx))
					slot.btnCpy:OnDown(nil, nil)
					slot.btnCpy:OnClick(nil, nil)
				end
			end
		elseif inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonLoadBack()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		end
	elseif lName == ArcadeCtrl.UI.Level then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonLevelBack()
		elseif inputMgr:GetButtonDown(LS_Setting.Btn.L2) or inputMgr:GetKeyL2Down() then
			UILayerCtrl.OnButtonClick("Arcade_Level_Button_Left")
		elseif inputMgr:GetButtonDown(LS_Setting.Btn.R2) or inputMgr:GetKeyR2Down() then
			UILayerCtrl.OnButtonClick("Arcade_Level_Button_Right")
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnButtonClick("Arcade_Level_Button_Start")
		end
	elseif lName == ArcadeCtrl.UI.Record then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonRecordBack()
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			local button = pnlRecord.RankModeBtnGroup[(pnlRecord.ModeIndex + 1) % 3 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			local button = pnlRecord.RankModeBtnGroup[pnlRecord.ModeIndex % 3 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(GBKey.Y) or inputMgr:GetKeyUp(XKeyCode.F) then
			UILayerCtrl.OnButtonClick("RankBtn")
		end
	elseif lName == ArcadeCtrl.UI.Ranking then
		if inputMgr:GetButtonDown(GBKey.B) or inputMgr:GetKeyCancelDown() then
			ArcadeCtrl.OnButtonRankingBack()
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			local button = pnlRanking.RankModeBtnGroup[(pnlRanking.ModeIndex + 1) % 3 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			local button = pnlRanking.RankModeBtnGroup[pnlRanking.ModeIndex % 3 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	end
end

function ArcadeCtrl.JPadRot(pos)
	if pnlRanking.isRequesting then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == ArcadeCtrl.UI.Record then
		local flowRow = pnlRecord.RecordContentRT.rect.height / 60

		if pos == XButton.Adjacent.DOWN then
			pnlRecord.recordScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRecord.recordScroll.scrollRectCom.normalizedPosition.x, pnlRecord.recordScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
		elseif pos == XButton.Adjacent.UP then
			pnlRecord.recordScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRecord.recordScroll.scrollRectCom.normalizedPosition.x, pnlRecord.recordScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
		end
	elseif lName == ArcadeCtrl.UI.Ranking then
		local flowRow = pnlRanking.RankPlayerContentRT.rect.height / 60

		if pos == XButton.Adjacent.DOWN then
			pnlRanking.playerScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.playerScroll.scrollRectCom.normalizedPosition.x, pnlRanking.playerScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
		elseif pos == XButton.Adjacent.UP then
			pnlRanking.playerScroll.scrollRectCom.normalizedPosition = Vector2.New(pnlRanking.playerScroll.scrollRectCom.normalizedPosition.x, pnlRanking.playerScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
		end
	end
end

function ArcadeCtrl.CheckPasses()
	if not FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Casual) and not FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Normal) and not FS_UserData.arcade:IsGamePassed(LS_Setting.ArcadeMode.Expert) and UILayerCtrl.GetCurrentLayerName() == "Arcade_Main" then
		local btnKeyIdx = ArcadeCtrl.BtnKeyIdx
		local btnCfgArr = ArcadeCtrl.MainMenu
		local btnCount = table.nums(btnCfgArr)
		local currentBtnName = UILayerCtrl.GetCurrentButtonName()

		for i = 1, btnCount do
			local btnName = btnCfgArr[i][btnKeyIdx]

			if btnName == "Arcade_Menu_Button_Level" then
				local btn = pnlMain.menu.btn[i]

				if btn ~= nil then
					bRefresh = false

					btn:TriggerAnimation(btn.btnCom.animationTriggers.disabledTrigger)

					if btnName == currentBtnName then
						local btnAnimator = btn.gameObject:GetComponent("Animator")

						if btnAnimator ~= nil then
							btnAnimator:SetTrigger("DisabledSelected")
						end
					end

					break
				end
			end
		end
	end
end

function ArcadeCtrl.Update()
	if sceneController and sceneController:isLoadEnd() and loaderNew and loaderNew.loadFinished and loaderLoad and loaderLoad.loadFinished then
		UILayerCtrl.Update()
		this.GamePadControl()

		if bRefresh == true then
			ArcadeCtrl.CheckPasses()
		end

		UILayerCtrl.PostUpdate()
	end
end

function ArcadeCtrl.UpdateRootMenu()
	return
end

function ArcadeCtrl.ClosePanelMain()
	if not this.loadFinish then
		return
	end

	UIManager.Close("Arcade")
	UIManager.SendMessage("LobbyMain", "CloseDialog")
	UIManager.SendMessage("LobbyMain", "ResetGameConfig")
	UIManager.SendMessage("LobbyMain", "SetNeedSyncArcade")
	UILayerCtrl.Pop()
end

function ArcadeCtrl.Close()
	if loaderLoad ~= nil then
		loaderLoad:ClearTemplate()
	end

	if loaderNew ~= nil then
		loaderNew:ClearTemplate()
	end

	UICtrlBase.Close("Arcade")
end

return ArcadeCtrl
