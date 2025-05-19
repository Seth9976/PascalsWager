-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/DialogCtrl.lua

DialogCtrl = class("DialogCtrl", UICtrlBase)
DialogCtrl.static.OneLineHeight = 40
DialogCtrl.static.TwoLineHeight = 80
DialogCtrl.static.BubbleWidthW = 1900
DialogCtrl.static.BubbleWidthS = 1440
DialogCtrl.static.FrogStandId = 11
DialogCtrl.static.ActionType = {
	MazeId = 5,
	RebornMate = 8,
	RestartGame = 4,
	ExitStoryRule = 3,
	CallCarriage = 1,
	MazeLevel = 6,
	AddHpItemFull = 7,
	AddDarkShard = 9,
	EnterStoryRule = 2,
	None = 0
}
DialogCtrl.static.ArcadeShowDialogId = {
	100100,
	100101,
	100102,
	100103,
	100104
}

local this = DialogCtrl

this.uilayer = UICtrlBase.UILayer.Dialog

local dialogueBtn, selectLoader, mainText, dialogueRaycast, joystickPanel, soloBG, soloText, clickBG, clickBGImg, clickAnim, nextImg, lastAxis
local lastAxis2 = 0
local canClick = true
local sceneController, meetingMemberList
local dialogIdForMeeting = 0
local whisperList
local whisperShowId = 0
local nextCondition = 1
local mapPlace, storyText, portalText, LastVoiceIdTbl, maskBarU, maskBarD
local isFlyingIn = false

function DialogCtrl.OnCreate()
	UILayerCtrl.Add("Dialog")

	dialogueBtn = this.mainComponent:GetButton("DialogPanel")
	mainText = this.mainComponent:GetText("DialogPanel_Content")
	selectLoader = this.mainComponent:GetLoader("DialogPanel_SelectPanel")

	selectLoader:SetCacheNumMax(1, 0)

	dialogueRaycast = dialogueBtn.gameObject:GetComponent("CanvasGroup")
	joystickPanel = this.mainComponent:GetGameObject("DialogPanel_DialogPanel_B_JoystickPanel")
	soloBG = this.mainComponent:GetGameObject("DialogPanel_DialogPanel_B_SoloBG")
	mapPlace = this.mainComponent:GetGameObject("DialogPanel_Map_Places_L")
	storyText = this.mainComponent:GetText("DialogPanel_Map_Places_Places_Name_Country_Text")
	portalText = this.mainComponent:GetText("DialogPanel_Map_Places_Places_Name_City_Text")

	if SystemHelper.isSubquadrateScrAS() then
		soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthS, 88)
	else
		soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 88)
	end

	clickBG = this.mainComponent:GetGameObject("DialogPanel_DialogPanel_B_ClickBG")

	if SystemHelper.isSubquadrateScrAS() then
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 60)
	else
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 60)
	end

	clickBGImg = clickBG:GetComponent("Image")
	clickAnim = clickBG:GetComponent("Animator")
	soloText = this.mainComponent:GetText("DialogPanel_DialogPanel_B_SoloBG_SoloContent")
	nextImg = this.mainComponent:GetGameObject("NextImg")
	dialogueRaycast.blocksRaycasts = false
	LastVoiceIdTbl = {}

	DialogCtrl.Hide()

	this.loadFinish = true
	sceneController = ST_Main.GetSceneController()
	maskBarU = this.mainComponent:GetGameObject("DialogPanel_BarU")
	maskBarD = this.mainComponent:GetGameObject("DialogPanel_BarD")

	if SystemHelper.isSubquadrateScrAS() then
		local rectUTf = maskBarU:GetComponent("RectTransform")
		local rectU = rectUTf.rect
		local rectDTf = maskBarD:GetComponent("RectTransform")
		local rectD = rectDTf.rect
		local designWidth = LS_Setting.designWidth
		local aHeight = designWidth * SystemHelper.GetScreenHeight() / SystemHelper.GetScreenWidth()
		local mHeight = designWidth * ControllerMain.CameraAspectHeight / ControllerMain.CameraAspectWidth
		local maskHeight = 0.5 * (aHeight - mHeight)

		rectUTf.sizeDelta = Vector2.New(0, maskHeight)
		rectDTf.sizeDelta = Vector2.New(0, maskHeight)
	end
end

function DialogCtrl.Hide()
	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "Dialog" then
		UILayerCtrl.Pop()
	end

	dialogueBtn.gameObject:SetActive(false)
	mapPlace:SetActive(false)

	layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName ~= nil and layerName == "GameMain" then
		inputMgr:SetInGameMode()
		inputMgr:SetPointerLocked(true)
	end
end

function DialogCtrl.ApplyMask(show)
	if SystemHelper.isSubquadrateScrAS() then
		maskBarU:SetActive(show)
		maskBarD:SetActive(show)
	end
end

function DialogCtrl.Click(dialogData, nextFunc)
	if dialogData == nil then
		return
	end

	dialogueBtn.gameObject:SetActive(true)

	dialogueRaycast.blocksRaycasts = true

	selectLoader.gameObject:SetActive(false)
	mainText.gameObject:SetActive(true)
	nextImg:SetActive(true)
	clickBG:SetActive(true)
	joystickPanel:SetActive(true)
	soloBG:SetActive(false)

	if DebugLogVoiceId then
		mainText:SetContent(dialogData.DialogId .. ":Voice:" .. dialogData.AudioId .. ":" .. dialogData.Text)
	else
		mainText:SetContent(dialogData.Text)
	end

	if DebugNoSubtitle then
		mainText:SetContent("")
	end

	if LS_Setting.subtitle < 1 and dialogData.NotSubtitle ~= 1 then
		clickBG:SetActive(false)
		mainText:SetContent(GameText.UI_COMMON_EMPTY)
	end

	mainText:SetColor(1, 1, 1, 0)

	clickAnim.enabled = true

	clickAnim:SetTrigger("Show")

	canClick = true

	local textH = mainText.textCom.preferredHeight

	if textH > DialogCtrl.OneLineHeight then
		mainText:SetAlignment(UnityEngine.TextAnchor.MiddleLeft)
	else
		mainText:SetAlignment(UnityEngine.TextAnchor.MiddleCenter)
	end

	if SystemHelper.isSubquadrateScrAS() then
		if textH < DialogCtrl.OneLineHeight then
			clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 60)
		elseif textH < DialogCtrl.TwoLineHeight then
			clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 100)
		else
			clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 170)
		end
	elseif textH < DialogCtrl.OneLineHeight then
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 60)
	elseif textH < DialogCtrl.TwoLineHeight then
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 100)
	else
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 170)
	end

	DialogCtrl.StartMeeting(dialogData)
	dialogueBtn:SetInteractable(true)
	dialogueBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if canClick then
			nextFunc()
		end
	end)

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "Dialog" then
		UILayerCtrl.Pop()
	end

	UILayerCtrl.AddButton("Dialog", "DialogNext", dialogueBtn)
	UILayerCtrl.Push("Dialog", "DialogNext")
	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
end

function DialogCtrl.Whisper(dialogData, nextFunc)
	if dialogData == nil or dialogData.Text == "" then
		return false, 0
	end

	if sceneController == nil then
		return false, 0
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return false, 0
	end

	local showFlg = false

	if whisperShowId > 0 then
		local showDialogData = DialogCtrl.GetDialogData(whisperShowId)

		if dialogData.Type == MS_StoryDialog.Type.CrowWhisper then
			showFlg = true
		elseif dialogData.Type == MS_StoryDialog.Type.HostWhisper then
			if showDialogData.Type ~= MS_StoryDialog.Type.CrowWhisper then
				showFlg = true
			end
		elseif showDialogData.Type == MS_StoryDialog.Type.NpcWhisper then
			showFlg = true
		end
	else
		showFlg = true
	end

	local timedelay = -1

	if showFlg == true then
		DialogCtrl.DoAction(dialogData.ActionType, dialogData.Action)

		whisperShowId = dialogData.DialogId

		dialogueBtn.gameObject:SetActive(true)

		dialogueRaycast.blocksRaycasts = false

		selectLoader.gameObject:SetActive(false)
		mainText.gameObject:SetActive(false)
		clickBG:SetActive(false)
		joystickPanel:SetActive(false)

		local convertedText

		if string.find(dialogData.Text, "/t") == 1 then
			local num = string.sub(dialogData.Text, 3)

			timedelay = tonumber(num)
			convertedText = ""

			soloBG:SetActive(false)
		else
			convertedText = SystemHelper.ConvertCustomRichText(dialogData.Text, 20, 2)

			soloBG:SetActive(true)

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
				soloBG:SetActive(false)
			elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:GetStoryId() == 8 and not table.contains(DialogCtrl.ArcadeShowDialogId, dialogData.DialogId) then
				soloBG:SetActive(false)
			end
		end

		if DebugLogVoiceId then
			soloText:SetContent(dialogData.DialogId .. ":Voice:" .. dialogData.AudioId .. ":" .. convertedText)
		else
			soloText:SetContent(convertedText)
		end

		if DebugNoSubtitle then
			soloText:SetContent("")
		end

		if LS_Setting.subtitle < 1 and dialogData.NotSubtitle ~= 1 then
			soloBG:SetActive(false)
			soloText:SetContent(GameText.UI_COMMON_EMPTY)
		end

		local textH = soloText.textCom.preferredHeight

		if textH > DialogCtrl.OneLineHeight then
			soloText:SetAlignment(UnityEngine.TextAnchor.MiddleLeft)
		else
			soloText:SetAlignment(UnityEngine.TextAnchor.MiddleCenter)
		end

		if SystemHelper.isSubquadrateScrAS() then
			if textH < DialogCtrl.OneLineHeight then
				soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthS, 88)
			elseif textH < DialogCtrl.TwoLineHeight then
				soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthS, 150)
			else
				soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthS, 230)
			end
		elseif textH < DialogCtrl.OneLineHeight then
			soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 88)
		elseif textH < DialogCtrl.TwoLineHeight then
			soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 150)
		else
			soloBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 230)
		end
	end

	gameController:CompleteQuest(dialogData.CompleteQuestId)

	local whisperSpeaker = DialogCtrl.GetWhisperSpeaker(dialogData)
	local audioId = dialogData.AudioId
	local lipId = dialogData.LipId
	local interval = 1
	local fmodInstance

	if DebugLog then
		SystemHelper.LogTest("========Whisper=audioId=" .. audioId .. ",lipId=" .. lipId)
	end

	if audioId > 0 then
		if whisperSpeaker ~= nil then
			if DebugLog then
				SystemHelper.LogTest("========SetDialogueAudio=audioId=" .. audioId)
			end

			local instanceID = whisperSpeaker:GetTransform():GetInstanceID()

			if LastVoiceIdTbl[instanceID] ~= nil then
				AudioCtrl.StopDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), LastVoiceIdTbl[instanceID], whisperSpeaker:GetModelName())
			end

			interval, fmodInstance = AudioCtrl.SetDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), audioId, whisperSpeaker:GetTransform(), whisperSpeaker:GetModelName())
			LastVoiceIdTbl[instanceID] = audioId
		elseif DebugLog then
			SystemHelper.LogTest("======whisperSpeaker = nil !!!error!==SetMonologueAudio=audioId=" .. audioId)
		end
	end

	if lipId > 0 and fmodInstance ~= nil and whisperSpeaker ~= nil then
		whisperSpeaker:PlayLipSyn(lipId, fmodInstance)
	else
		fmodInstance = nil
	end

	interval = tonumber(interval) / 1000 + 0.5

	if interval == 0 then
		interval = string.len(dialogData.Text) / 10
	end

	if interval < 1.5 then
		interval = 1.5
	end

	if timedelay > -1 then
		interval = timedelay
	end

	return true, interval
end

function DialogCtrl.Select(dialogData, showIdList)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if dialogData == nil or showIdList == nil or #showIdList <= 0 then
		return
	end

	selectLoader.gameObject:SetActive(true)
	dialogueBtn.gameObject:SetActive(true)

	dialogueRaycast.blocksRaycasts = true

	mainText.gameObject:SetActive(true)
	nextImg:SetActive(false)
	clickBG:SetActive(true)
	joystickPanel:SetActive(true)
	soloBG:SetActive(false)
	mainText:SetContent(dialogData.Text)
	mainText:SetColor(1, 1, 1, 0)
	gameController:CompleteQuest(dialogData.CompleteQuestId)
	gameController:RevertCompleteQuest(dialogData.RevertQuestId)

	if dialogData.Text and dialogData.Text ~= "" then
		clickAnim.enabled = true

		clickAnim:SetTrigger("Show")
	else
		clickAnim.enabled = false
		clickBGImg.color = Color.New(1, 1, 1, 0)
	end

	canClick = false

	local textH = mainText.textCom.preferredHeight

	if textH > DialogCtrl.OneLineHeight then
		mainText:SetAlignment(UnityEngine.TextAnchor.MiddleLeft)
	else
		mainText:SetAlignment(UnityEngine.TextAnchor.MiddleCenter)
	end

	if SystemHelper.isSubquadrateScrAS() then
		if textH < DialogCtrl.OneLineHeight then
			clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 60)
		elseif textH < DialogCtrl.TwoLineHeight then
			clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 100)
		else
			clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 150)
		end
	elseif textH < DialogCtrl.OneLineHeight then
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 60)
	elseif textH < DialogCtrl.TwoLineHeight then
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 100)
	else
		clickBG.transform.sizeDelta = Vector2.New(DialogCtrl.BubbleWidthW, 150)
	end

	if LS_Setting.subtitle < 1 and dialogData.NotSubtitle ~= 1 then
		clickBG:SetActive(false)
		mainText:SetContent(GameText.UI_COMMON_EMPTY)
	end

	if dialogData.NextId > 0 and dialogData.NextId < 1000 then
		local portalData = MS_SiteInfo.GetPortal(dialogData.NextId)

		if portalData then
			local storyId = Mathf.Floor(dialogData.NextId / 100)
			local storyData = MS_SiteInfo.GetSite(storyId)

			storyText:SetContent(storyData.Name)
			portalText:SetContent(portalData.Name)
			mapPlace:SetActive(true)
		end
	end

	DialogCtrl.StartMeeting(dialogData)
	dialogueBtn:SetInteractable(false)

	local selectIndex = 1

	selectLoader.loadCount = #showIdList

	function selectLoader.loadCallback(index, com, data)
		local selectionBtn = com:GetButton("BG")
		local selectionText = com:GetText("Text")

		com.BtnGO = selectionBtn.gameObject
		com.TextGO = selectionText.gameObject

		local selectId = showIdList[index]
		local dialogData1 = DialogCtrl.GetDialogData(selectId)

		if dialogData1 ~= nil then
			if gameController:IsQuestAllComplete(dialogData1.ReadQuestId) then
				if index < selectLoader.loadCount then
					selectIndex = index + 1
				else
					selectIndex = index
				end

				selectionText:SetColor(0.43529411764705883, 0.43529411764705883, 0.43529411764705883, 1)
			else
				selectionText:SetColor(1, 1, 1, 1)
			end

			selectionText:SetContent(dialogData1.Text)

			local textHeight = selectionText.textCom.preferredHeight
			local LayE = com.gameObject:GetComponent("LayoutElement")

			LayE.preferredHeight = 80 + textHeight - 24

			selectionBtn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			selectionBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				if canClick then
					UILayerCtrl.OnSelect("DialogSelection" .. index)
					DialogCtrl.FinishMeeting(dialogData1)
					mapPlace:SetActive(false)
				end
			end)
			UILayerCtrl.AddButton("Dialog", "DialogSelection" .. index, selectionBtn)

			if index + 1 > selectLoader.loadCount then
				selectionBtn:SetAdjacent(XButton.Adjacent.UP, "DialogSelection1")
			else
				selectionBtn:SetAdjacent(XButton.Adjacent.UP, "DialogSelection" .. index + 1)
			end

			if index - 1 < 1 then
				selectionBtn:SetAdjacent(XButton.Adjacent.DOWN, "DialogSelection" .. selectLoader.loadCount)
			else
				selectionBtn:SetAdjacent(XButton.Adjacent.DOWN, "DialogSelection" .. index - 1)
			end

			selectionBtn:DoDefaultStateTransition(XButton.State.Normal)
			com.BtnGO:SetActive(false)
			com.TextGO:SetActive(false)

			if index == selectLoader.loadCount then
				coroutine.start(function()
					for i = 1, selectLoader.loadCount do
						coroutine.wait(0.1)
						selectLoader:GetChild(i).BtnGO:SetActive(true)
						selectLoader:GetChild(i).TextGO:SetActive(true)
					end

					coroutine.wait(0.8)

					local layerName = UILayerCtrl.GetCurrentLayerName()

					if layerName == "Dialog" then
						UILayerCtrl.Pop()
					end

					UILayerCtrl.Push("Dialog", "DialogSelection1")

					canClick = true
				end)
			end
		end
	end

	selectLoader:Load()
	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
end

function DialogCtrl.PlayDialogId(dialogId, memberList)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	local dialogData = DialogCtrl.GetDialogData(dialogId)

	if dialogData == nil then
		return
	end

	if dialogData.Type == MS_StoryDialog.Type.IncludeOption or dialogData.Type == MS_StoryDialog.Type.ClickNext or dialogData.Type == MS_StoryDialog.Type.Transaction or dialogData.Type == MS_StoryDialog.Type.Frog or dialogData.Type == MS_StoryDialog.Type.Statue or dialogData.Type == MS_StoryDialog.Type.Wear then
		if dialogIdForMeeting > 0 then
			return
		end

		DialogCtrl.StopWhisperAll()
	elseif dialogData.Type == MS_StoryDialog.Type.HostWhisper or dialogData.Type == MS_StoryDialog.Type.NpcWhisper or dialogData.Type == MS_StoryDialog.Type.CrowWhisper then
		if dialogIdForMeeting > 0 then
			return
		end
	else
		SystemHelper.LogError("=======PlayDialogId==dialogData.Type=" .. dialogData.Type)

		return
	end

	meetingMemberList = memberList

	DialogCtrl.StartDialog(dialogData)
end

function DialogCtrl.StartDialog(dialogData)
	if dialogData == nil then
		return
	end

	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	mapPlace:SetActive(false)

	if dialogData.Type == MS_StoryDialog.Type.IncludeOption then
		local selectIdlist = string.split(dialogData.SelectId, ";")
		local showIdList = {}

		for k, v in pairs(selectIdlist) do
			local tmpDialogId = tonumber(v)
			local tmpDialogData = DialogCtrl.GetDialogData(tmpDialogId)

			if gameController:CheckShowQuestComplete(tmpDialogData.ShowQuestId) == true and gameController:CheckHideQuestComplete(tmpDialogData.HideQuestId) == false then
				if tmpDialogData.DLCShow == MS_StoryDialog.DLCShowType.Always then
					table.insert(showIdList, tmpDialogId)
				elseif IapData.GetEnterTide() then
					if tmpDialogData.DLCShow == MS_StoryDialog.DLCShowType.HaveDLCShow then
						table.insert(showIdList, tmpDialogId)
					end
				elseif tmpDialogData.DLCShow == MS_StoryDialog.DLCShowType.NoDLCShow then
					table.insert(showIdList, tmpDialogId)
				end
			end
		end

		DialogCtrl.Select(dialogData, showIdList)
	elseif dialogData.Type == MS_StoryDialog.Type.ClickNext then
		if not DebugLogVoiceId and gameController:CheckHideQuestComplete(dialogData.HideQuestId) then
			if dialogData.NextId > 0 then
				local nextDialog = DialogCtrl.GetDialogData(dialogData.NextId)

				if nextDialog ~= nil then
					DialogCtrl.StartDialog(nextDialog)

					return
				end

				DialogCtrl.FinishMeeting(dialogData)

				return
			else
				if dialogData.MultiNextId ~= "" then
					local nextId = DialogCtrl.GetConditionalNextId(dialogData.MultiNextId)
					local nextDialog = DialogCtrl.GetDialogData(nextId)

					if nextDialog ~= nil then
						DialogCtrl.StartDialog(nextDialog)

						return
					end
				end

				DialogCtrl.FinishMeeting(dialogData)

				return
			end
		end

		DialogCtrl.Click(dialogData, function()
			DialogCtrl.FinishMeeting(dialogData)
		end)
	elseif dialogData.Type == MS_StoryDialog.Type.Transaction then
		DialogCtrl.OpenTransactionPanel(dialogData, function()
			DialogCtrl.FinishMeeting(dialogData)
		end)
	elseif dialogData.Type == MS_StoryDialog.Type.Frog then
		DialogCtrl.OpenFrogPanel(dialogData, function()
			DialogCtrl.FinishMeeting(dialogData)
		end)
	elseif dialogData.Type == MS_StoryDialog.Type.Wear then
		DialogCtrl.OpenWearPanel(dialogData, function()
			DialogCtrl.FinishMeeting(dialogData)
		end)
	elseif dialogData.Type == MS_StoryDialog.Type.Statue then
		DialogCtrl.OpenStatuePanel(dialogData, function()
			DialogCtrl.FinishMeeting(dialogData)
		end)
	elseif dialogData.Type == MS_StoryDialog.Type.HostWhisper or dialogData.Type == MS_StoryDialog.Type.NpcWhisper or dialogData.Type == MS_StoryDialog.Type.CrowWhisper then
		isFlyingIn = false

		if not DebugLogVoiceId and gameController:CheckHideQuestComplete(dialogData.HideQuestId) then
			DialogCtrl.FinishWhisper(dialogData)

			return
		end

		if dialogData.Type == MS_StoryDialog.Type.CrowWhisper and sceneController:GetCrow():IsAppear() == false then
			isFlyingIn = true

			sceneController:GetCrow():Appear(sceneController:GetHostPlayer(), function()
				DialogCtrl.StartDialog(dialogData)
			end)

			return
		end

		local ret, audioTime = DialogCtrl.Whisper(dialogData)

		if ret == true then
			if whisperList == nil then
				whisperList = {}
			end

			if whisperList[dialogData.DialogId] ~= nil then
				return
			end

			if audioTime == 0 then
				DialogCtrl.FinishWhisper(dialogData)

				whisperShowId = 0
			else
				whisperList[dialogData.DialogId] = TimeHelper.getNowTime() + audioTime
			end
		end
	end

	UIManager.SendMessage("Mainmenu", "SyncSanityEffectsCustom")
end

function DialogCtrl.GetWhisperSpeaker(dialogData)
	if sceneController == nil or dialogData == nil then
		return nil
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return nil
	end

	local retSpeaker

	if dialogData.Type == MS_StoryDialog.Type.HostWhisper then
		retSpeaker = sceneController:GetHostPlayer()
	elseif dialogData.Type == MS_StoryDialog.Type.NpcWhisper then
		retSpeaker = gameController:GetDialogMonster(dialogData.MonsterId)
	elseif dialogData.Type == MS_StoryDialog.Type.CrowWhisper then
		retSpeaker = sceneController:GetCrow()
	else
		SystemHelper.LogError("======StartSpeak error !!!type=" .. dialogData.Type)
	end

	return retSpeaker
end

function DialogCtrl.IsWhisperPlayingByType(type)
	if type == MS_StoryDialog.Type.CrowWhisper and isFlyingIn then
		return true
	end

	if whisperList ~= nil then
		for dialogId, time in pairs(whisperList) do
			local dialogData = DialogCtrl.GetDialogData(dialogId)

			if dialogData.Type == type then
				return true
			end
		end
	end

	return false
end

function DialogCtrl.StopWhisperAll()
	if sceneController == nil then
		return
	end

	if whisperList ~= nil then
		for dialogId, time in pairs(whisperList) do
			DialogCtrl.StopWhisper(dialogId)
		end
	end

	local crow = sceneController:GetCrow()

	if crow ~= nil then
		crow:Disappear()
	end

	isFlyingIn = false
	whisperList = nil
	whisperShowId = 0
end

function DialogCtrl.UpdateWhisper()
	local deleteIdList

	if whisperList ~= nil then
		local nowTime = TimeHelper.getNowTime()

		for dialogId, time in pairs(whisperList) do
			if time < nowTime then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, dialogId)
			end
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			local dialogId = deleteIdList[i]
			local dialogData = DialogCtrl.GetDialogData(dialogId)

			DialogCtrl.FinishWhisper(dialogData)

			whisperList[dialogId] = nil
		end
	end
end

function DialogCtrl.ResetWhisperTime()
	if whisperList ~= nil then
		for dialogId, time in pairs(whisperList) do
			local dialogData = DialogCtrl.GetDialogData(dialogId)
			local whisperSpeaker = DialogCtrl.GetWhisperSpeaker(dialogData)

			if whisperSpeaker ~= nil then
				local audioId = dialogData.AudioId
				local instanceID = whisperSpeaker:GetTransform():GetInstanceID()

				if LastVoiceIdTbl[instanceID] ~= nil then
					AudioCtrl.StopDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), LastVoiceIdTbl[instanceID], whisperSpeaker:GetModelName())
				end

				local interval, fmodInstance = AudioCtrl.SetDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), audioId, whisperSpeaker:GetTransform(), whisperSpeaker:GetModelName())

				interval = tonumber(interval) / 1000 + 0.5

				if interval == 0 then
					interval = string.len(dialogData.Text) / 10
				end

				if interval < 1.5 then
					interval = 1.5
				end

				whisperList[dialogId] = TimeHelper.getNowTime() + interval
			end
		end
	end
end

function DialogCtrl.GetNextShowDialog(nextDialogData)
	local gameController = sceneController:GetGameController()
	local ret = gameController:CheckShowQuestComplete(nextDialogData.ShowQuestId)

	if ret then
		return nextDialogData
	elseif nextDialogData.NextId > 0 then
		local nextDialog = DialogCtrl.GetDialogData(nextDialogData.NextId)

		return DialogCtrl.GetNextShowDialog(nextDialog)
	else
		return nil
	end
end

function DialogCtrl.FinishWhisper(dialogData)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if dialogData == nil then
		return
	end

	DialogCtrl.StopWhisper(dialogData.DialogId)

	if dialogData.NextId > 0 then
		local nextDialog = DialogCtrl.GetDialogData(dialogData.NextId)
		local retNextDialog = DialogCtrl.GetNextShowDialog(nextDialog)

		if retNextDialog ~= nil then
			DialogCtrl.StartDialog(retNextDialog)

			return
		else
			sceneController:GetCrow():Disappear()

			isFlyingIn = false
		end
	elseif dialogData.MultiNextId ~= "" then
		local nextId = DialogCtrl.GetConditionalNextId(dialogData.MultiNextId)
		local nextDialog = DialogCtrl.GetDialogData(nextId)

		if nextDialog ~= nil then
			DialogCtrl.StartDialog(nextDialog)

			return
		else
			sceneController:GetCrow():Disappear()

			isFlyingIn = false
		end
	else
		sceneController:GetCrow():Disappear()

		isFlyingIn = false
	end

	DialogCtrl.Hide()
end

function DialogCtrl.StopWhisper(dialogId)
	if whisperList == nil or whisperList[dialogId] == nil then
		return
	end

	local dialogData = DialogCtrl.GetDialogData(dialogId)

	if dialogData == nil then
		return
	end

	local whisperSpeaker = DialogCtrl.GetWhisperSpeaker(dialogData)

	if dialogId == whisperShowId then
		soloBG:SetActive(false)

		whisperShowId = 0
	end

	if whisperSpeaker ~= nil then
		whisperSpeaker:StopLipSyn(false)
		AudioCtrl.StopDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), dialogData.AudioId, whisperSpeaker:GetModelName())
	end
end

function DialogCtrl.StopWhisperBySpeaker(speaker)
	local deleteIdList

	if whisperList ~= nil then
		for dialogId, time in pairs(whisperList) do
			local dialogData = DialogCtrl.GetDialogData(dialogId)
			local whisperSpeaker = DialogCtrl.GetWhisperSpeaker(dialogData)

			if whisperSpeaker ~= nil and whisperSpeaker == speaker then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, dialogId)
			end
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			local dialogId = deleteIdList[i]

			DialogCtrl.StopWhisper(dialogId)

			whisperList[dialogId] = nil
		end
	end
end

function DialogCtrl.StopDialog()
	if dialogIdForMeeting > 0 and meetingMemberList ~= nil then
		for standId, speaker in pairs(meetingMemberList) do
			if speaker ~= nil then
				speaker:StopLipSyn(false)
			end
		end
	end

	dialogIdForMeeting = 0

	DialogCtrl.StopWhisperAll()
	AudioCtrl.StopDialogueAudioAll()
end

function DialogCtrl.SetNextCondition(cond)
	nextCondition = cond
end

function DialogCtrl.GetConditionalNextId(multiNextId)
	if multiNextId == nil or multiNextId == "" then
		return 0
	end

	local condList = StringHelper.Split(multiNextId, "|")
	local idList

	if #condList > 1 then
		idList = StringHelper.Split(condList[nextCondition], ";")
	else
		idList = StringHelper.Split(multiNextId, ";")
	end

	local gameController = sceneController:GetGameController()
	local idListRet = {}

	for k, v in pairs(idList) do
		local tmpDialogData = DialogCtrl.GetDialogData(v)

		if tmpDialogData and gameController:CheckShowQuestComplete(tmpDialogData.ShowQuestId) == true and gameController:CheckHideQuestComplete(tmpDialogData.HideQuestId) == false then
			table.insert(idListRet, v)
		end
	end

	if #idListRet > 0 then
		local idx = MathHelper.getRandom(1, #idListRet)

		return idListRet[idx]
	else
		return 0
	end
end

function DialogCtrl.DoAction(actionType, action)
	if actionType == DialogCtrl.ActionType.None then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if actionType == DialogCtrl.ActionType.CallCarriage then
		local carriageId = tonumber(action)

		gameController:CarriageCall(carriageId)
		AudioCtrl.SetUIAudio("bell")
	elseif actionType == DialogCtrl.ActionType.EnterStoryRule then
		if action ~= nil then
			local rule = tonumber(action)

			gameController:AddStoryRule(rule)
		end
	elseif actionType == DialogCtrl.ActionType.ExitStoryRule then
		local rule = 0

		if action ~= nil then
			rule = tonumber(action)
		end

		gameController:ClearStoryRule(rule)
	elseif actionType == DialogCtrl.ActionType.RestartGame then
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CONFIRM_RESTART_GAME, function()
			sceneController:ChangeNextSubState(ControllerMain.MoveStep.Restart, 0, 0)
		end, function()
			return
		end, false, GameText.UI_RESTART_GAME)
	end
end

function DialogCtrl.DoActionBeforeExit(actionType, action)
	if actionType == DialogCtrl.ActionType.None then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if actionType == DialogCtrl.ActionType.MazeId then
		FS_UserData.story:SetMazeId(tonumber(action))
	elseif actionType == DialogCtrl.ActionType.MazeLevel then
		FS_UserData.story:SetMazeLevelAdd(tonumber(action))
	elseif actionType == DialogCtrl.ActionType.AddHpItemFull then
		FS_UserData.heroList:AddHpToMax()
		gameController:UpdateUIBag()
	elseif actionType == DialogCtrl.ActionType.RebornMate then
		gameController:SecondaryHostReborn(1000)
	elseif actionType == DialogCtrl.ActionType.AddDarkShard then
		local level = FS_UserData.story:GetMazeLevel()

		gameController:AddBagItem(MS_ItemData.DarkShard, 20 + level * tonumber(action))
	end
end

function DialogCtrl.StartMeeting(dialogData)
	if dialogData == nil then
		return
	end

	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if dialogData.Type ~= MS_StoryDialog.Type.ClickNext and dialogData.Type ~= MS_StoryDialog.Type.IncludeOption then
		SystemHelper.LogError("======StartMeeting error !!!type=" .. dialogData.Type)

		return
	end

	if dialogData.MeetingId < 0 then
		SystemHelper.LogError("======StartMeeting error !!!MeetingId = " .. dialogData.MeetingId)

		return
	end

	local meetingData = gameController:GetMeetingData(dialogData.DialogId)

	if meetingData == nil then
		SystemHelper.LogError("======StartMeeting error !!!meetingData = nil")

		return
	end

	dialogIdForMeeting = dialogData.DialogId

	if dialogData.MeetingCameraId > 0 then
		gameController:SwitchDialogCameraId(dialogData.DialogId, dialogData.MeetingCameraId, dialogData.Aperture, dialogData.CameraAnimatorId)
	end

	if dialogData.MeetingStandId == 99 then
		local fmodInstance
		local interval = 1
		local data = MS_StorySituationDialog.GetSituationData(dialogData.DialogId, dialogData.MeetingStandId)

		if data ~= nil and data.AudioId > 0 then
			interval, fmodInstance = AudioCtrl.SetDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), data.AudioId)
		end

		if data ~= nil then
			if data.LipId > 0 and fmodInstance ~= nil then
				sceneController:GetCrow():PlayLipSyn(data.LipId, fmodInstance)
			else
				fmodInstance = nil
			end
		end
	end

	for standId, speaker in pairs(meetingMemberList) do
		local fmodInstance
		local interval = 1
		local data = MS_StorySituationDialog.GetSituationData(dialogData.DialogId, standId)

		if data ~= nil and data.AudioId > 0 then
			interval, fmodInstance = AudioCtrl.SetDialogueAudio(dialogData.Type, FS_UserData.story:GetStoryId(), data.AudioId)
		end

		if speaker ~= nil then
			local defaultLookAt = 1
			local targetLookAt = 1
			local delayTime = 0
			local speed = 0
			local lipId = 0

			if data ~= nil then
				if data.DefaultLookAt > 0 then
					defaultLookAt = data.DefaultLookAt
					targetLookAt = defaultLookAt
				end

				if data.TargetLookAt > 0 then
					targetLookAt = data.TargetLookAt
				end

				delayTime = data.TargetDelayTime
				speed = data.TargetSpeed

				if data.LipId > 0 then
					lipId = data.LipId
				end
			end

			if DebugLog then
				SystemHelper.LogTest("==========StartMeeting======standId=" .. standId .. ",defaultLookAt=" .. defaultLookAt .. ",LipId=" .. lipId)
			end

			local defaultPos = meetingData["StandLookAt" .. standId .. "_" .. defaultLookAt]
			local targetPos = meetingData["StandLookAt" .. standId .. "_" .. targetLookAt]

			speaker:SetCharacterLookAt(defaultPos, targetPos, delayTime, speed)

			if lipId > 0 and fmodInstance ~= nil then
				if DebugLog then
					SystemHelper.LogTest("==========StartMeeting======standId=" .. standId .. ",LipId=" .. lipId)
				end

				speaker:PlayLipSyn(lipId, fmodInstance)
			else
				fmodInstance = nil
			end
		else
			fmodInstance = nil
		end
	end
end

function DialogCtrl.FinishMeeting(dialogData)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if dialogData == nil then
		return
	end

	if DebugLog then
		SystemHelper.LogTest("==========FinishMeeting======dialogId=" .. dialogData.DialogId)
	end

	if dialogIdForMeeting > 0 and meetingMemberList ~= nil then
		for standId, speaker in pairs(meetingMemberList) do
			if speaker ~= nil then
				local ret = speaker:StopLipSyn(false)

				if ret == true then
					speaker:ResetDialogPosAndRot()
				end
			end
		end
	end

	dialogIdForMeeting = 0

	AudioCtrl.StopDialogueAudioAll()
	UIManager.SendMessage("Mainmenu", "ResetSanityVfx")
	DialogCtrl.DoActionBeforeExit(dialogData.ActionType, dialogData.Action)

	if dialogData.NextId > 0 then
		local nextDialog = DialogCtrl.GetDialogData(dialogData.NextId)

		if nextDialog ~= nil then
			gameController:CompleteQuest(dialogData.CompleteQuestId)
			gameController:RevertCompleteQuest(dialogData.RevertQuestId)
			DialogCtrl.StartDialog(nextDialog)

			return
		end
	elseif dialogData.MultiNextId ~= "" then
		local nextId = DialogCtrl.GetConditionalNextId(dialogData.MultiNextId)
		local nextDialog = DialogCtrl.GetDialogData(nextId)

		if nextDialog ~= nil then
			gameController:CompleteQuest(dialogData.CompleteQuestId)
			gameController:RevertCompleteQuest(dialogData.RevertQuestId)
			DialogCtrl.StartDialog(nextDialog)

			return
		end
	end

	if DebugLog then
		SystemHelper.LogTest("==========FinishMeeting==Exit====dialogId=" .. dialogData.DialogId)
	end

	DialogCtrl.Hide()
	gameController:ExitDialog()
	gameController:CompleteQuest(dialogData.CompleteQuestId)
	gameController:RevertCompleteQuest(dialogData.RevertQuestId)
	DialogCtrl.DoAction(dialogData.ActionType, dialogData.Action)
	gameController:ExitDialogFinish()
end

function DialogCtrl.OpenTransactionPanel(dialogData, nextFunc)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	canClick = false

	UILayerCtrl.OnSelect("DialogNext")
	dialogueBtn.gameObject:SetActive(false)

	if dialogData.MeetingCameraId > 0 then
		gameController:SwitchDialogCameraId(dialogData.DialogId, dialogData.MeetingCameraId, dialogData.Aperture, dialogData.CameraAnimatorId)
	end

	UIManager.SendMessage("Exchange", "Open", nextFunc, dialogData.MonsterId, dialogData.TransactionType)
end

function DialogCtrl.OpenFrogPanel(dialogData, nextFunc)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	if meetingMemberList == nil or meetingMemberList[DialogCtrl.FrogStandId] == nil then
		return
	end

	canClick = false

	UILayerCtrl.OnSelect("DialogNext")
	dialogueBtn.gameObject:SetActive(false)

	if dialogData.MeetingCameraId > 0 then
		gameController:SwitchDialogCameraId(dialogData.DialogId, dialogData.MeetingCameraId, dialogData.Aperture, dialogData.CameraAnimatorId)
	end

	UIManager.SendMessage("Frog", "Open", nextFunc, dialogData.MonsterId, meetingMemberList[DialogCtrl.FrogStandId])
end

function DialogCtrl.OpenWearPanel(dialogData, nextFunc)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	canClick = false

	UILayerCtrl.OnSelect("DialogNext")
	dialogueBtn.gameObject:SetActive(false)

	if dialogData.MeetingCameraId > 0 then
		gameController:SwitchDialogCameraId(dialogData.DialogId, dialogData.MeetingCameraId, dialogData.Aperture, dialogData.CameraAnimatorId)
		gameController:EnterHeroWear()
	end

	local meetingData = gameController:GetMeetingData(dialogData.DialogId)

	UIManager.SendMessage("Wear", "Open", meetingData.StandPosition11, meetingData.StandOrientation11, nextFunc)
end

function DialogCtrl.OpenStatuePanel(dialogData, nextFunc)
	if sceneController == nil then
		return
	end

	local gameController = sceneController:GetGameController()

	if gameController == nil then
		return
	end

	canClick = false

	UILayerCtrl.OnSelect("DialogNext")
	dialogueBtn.gameObject:SetActive(false)

	if dialogData.MeetingCameraId > 0 then
		gameController:SwitchDialogCameraId(dialogData.DialogId, dialogData.MeetingCameraId, dialogData.Aperture, dialogData.CameraAnimatorId)
	end

	UIManager.SendMessage("StatueUI", "Open", nextFunc)
end

function DialogCtrl.Update()
	if not this.loadFinish then
		return
	end

	DialogCtrl.UpdateWhisper()
	DialogCtrl.GamePadControl()
end

function DialogCtrl.Close(name)
	DialogCtrl.StopDialog()
	UICtrlBase.Close("Dialog")
end

function DialogCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if inputMgr and UILayerCtrl.GetCurrentLayerName() == "Dialog" then
		if not canClick then
			return
		end

		local nowSkillAxis2 = inputMgr:GetAxis(LS_Setting.Btn.MY)

		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
			UILayerCtrl.ForceUpdate(0.01)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.DD) or inputMgr:GetKeyDown(KMKey.MOVES) or inputMgr:GetKeyDown(KMKey.CAMPD) or inputMgr:GetKeyDown(XKeyCode.DownArrow) then
			UILayerCtrl.Select(1)

			if selectLoader.gameObject.activeSelf then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
			end
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.DU) or inputMgr:GetKeyDown(KMKey.MOVEW) or inputMgr:GetKeyDown(KMKey.CAMPU) or inputMgr:GetKeyDown(XKeyCode.UpArrow) then
			UILayerCtrl.Select(2)

			if selectLoader.gameObject.activeSelf then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
			end
		else
			if nowSkillAxis2 < 0.38 and lastAxis2 > 0.38 then
				UILayerCtrl.Select(2)

				if selectLoader.gameObject.activeSelf then
					AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
				end
			end

			if nowSkillAxis2 > -0.38 and lastAxis2 < -0.38 then
				UILayerCtrl.Select(1)

				if selectLoader.gameObject.activeSelf then
					AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
				end
			end
		end

		lastAxis2 = nowSkillAxis2
	end
end

function DialogCtrl.GetDialogData(dialogId)
	local storyId = FS_UserData.story:GetStoryId()

	if MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
		storyId = MS_StoryData.StoryIdMazeStart
	end

	local dialogData = MS_StoryDialog.GetDialogData(storyId, dialogId)

	return dialogData
end

return DialogCtrl
