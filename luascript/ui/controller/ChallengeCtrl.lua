-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ChallengeCtrl.lua

ChallengeCtrl = class("ChallengeCtrl", UICtrlBase)

local this = ChallengeCtrl
local ModeBtnGroup
local ModeIndex = 1
local HeroBtnGroup, HeroPhotoGroup
local HeroIndex = 1
local HeroIndexMax = 4
local ScoreGroup, MonsterLoader, RankPanel, confirmBtn, sceneController
local ChallengeMode = MS_StoryChallenge.ChallengeMode.Normal
local ChallengeLevel = 1
local ChallengeStoryId, ChallengeArea, ChallengeBornHostId
local ChallengeChooseHeroId = 10001
local ChallengeMonsterId = 0
local ChallengeRankMonsterId = 999999
local ChallengeRowCount = 6
local ChallengeRankMonsterRowCount = 8
local ChallengeScroll, JoystickRT, KeyboardRT
local isRequesting = false

function ChallengeCtrl.OnCreate()
	ModeBtnGroup = {}
	HeroBtnGroup = {}
	HeroPhotoGroup = {}
	RankPanel = {}
	ScoreGroup = {}
	ChallengeStoryId = 601
	ChallengeArea = 1
	ChallengeBornHostId = 1

	UILayerCtrl.Add("Challenge", ChallengeCtrl.ClosePanel)
	UILayerCtrl.Add("ChallengeRank", ChallengeCtrl.CloseRankPanel)
	UILayerCtrl.Push("Challenge", nil)

	sceneController = ST_Lobby.GetSceneController()

	this.InitMode(sceneController:GetChallengeMode())

	JoystickRT = this.mainComponent:GetGameObject("ChallengePanel_GamePadIconGroup_R"):GetComponent("RectTransform")
	KeyboardRT = this.mainComponent:GetGameObject("ChallengePanel_KeyBoardIconGroup"):GetComponent("RectTransform")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(JoystickRT)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(KeyboardRT)

	local backBtn = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_BackBtn_L")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.ClosePanel()
	end)

	confirmBtn = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_ConfirmBtn")

	confirmBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CHALLENGE_CHALLENGE_OR_NOT, function()
			this.ConfirmChallenge()
		end, function()
			return
		end, false)
	end)
	UILayerCtrl.AddIndividual("Challenge", "BackBtn", backBtn)
	UILayerCtrl.AddIndividual("Challenge", "ConfirmBtn", confirmBtn)

	local modeGroup = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_ModeGroup")

	if ChallengeMode == MS_StoryChallenge.ChallengeMode.Normal then
		modeGroup:SetActive(true)
	elseif ChallengeMode == MS_StoryChallenge.ChallengeMode.Custom then
		modeGroup:SetActive(false)
	end

	MonsterLoader = this.mainComponent:GetLoader("ChallengePanel_SelectHeroPanel_MonsterGroup_MonsterScroll_Viewport_Content")
	ChallengeScroll = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_MonsterGroup_MonsterScroll")
	ChallengeScroll = XScrollRect:new(ChallengeScroll)
	ScoreGroup.score = this.mainComponent:GetText("ChallengePanel_SelectHeroPanel_TotalScoreGroup_TotalScore")
	ScoreGroup.RankBtn = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_TotalScoreGroup_RankButton")

	if Platform == PlatformType.MAC then
		ScoreGroup.RankBtn.gameObject:SetActive(false)
	end

	ScoreGroup.RankBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		RankPanel.GO:SetActive(true)
		UILayerCtrl.Push("ChallengeRank", nil)
		RankPanel.RankModeBtnGroup[RankPanel.ModeIndex]:OnDown(nil, nil)
		RankPanel.RankModeBtnGroup[RankPanel.ModeIndex]:OnClick(nil, nil)
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_EVENTLOG_RANKINGS_WARN, function()
			return
		end, function()
			return
		end, true)
	end)
	UILayerCtrl.AddIndividual("Challenge", "RankBtn", ScoreGroup.RankBtn)

	RankPanel.GO = this.mainComponent:GetGameObject("ChallengePanel_RankPanel")
	RankPanel.BackBtn = this.mainComponent:GetButton("ChallengePanel_RankPanel_Back")

	RankPanel.BackBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	RankPanel.BackBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.CloseRankPanel()
	end)
	UILayerCtrl.AddIndividual("ChallengeRank", "BackBtn", RankPanel.BackBtn)

	RankPanel.monsterScroll = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MonsterList")
	RankPanel.monsterScroll = XScrollRect:new(RankPanel.monsterScroll)
	RankPanel.palyerScroll = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_PlayerList")
	RankPanel.palyerScroll = XScrollRect:new(RankPanel.palyerScroll)
	RankPanel.RankModeBtnGroup = {}
	RankPanel.RankModeBtnGroup[5] = this.mainComponent:GetButton("ChallengePanel_RankPanel_ModeGroup_mode1")
	RankPanel.RankModeBtnGroup[1] = this.mainComponent:GetButton("ChallengePanel_RankPanel_ModeGroup_mode2")
	RankPanel.RankModeBtnGroup[2] = this.mainComponent:GetButton("ChallengePanel_RankPanel_ModeGroup_mode3")
	RankPanel.RankModeBtnGroup[3] = this.mainComponent:GetButton("ChallengePanel_RankPanel_ModeGroup_mode4")
	RankPanel.RankModeBtnGroup[4] = this.mainComponent:GetButton("ChallengePanel_RankPanel_ModeGroup_mode5")

	for i = 1, 5 do
		RankPanel.RankModeBtnGroup[i]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for j = 1, 5 do
				RankPanel.RankModeBtnGroup[j]:SetSelectedLight(false)
			end

			RankPanel.RankModeBtnGroup[i]:SetSelectedLight(true)

			RankPanel.ModeIndex = i

			RankPanel.RankPlayerLoader:ClearChild()
			RankPanel.heroMy:SetActive(false)
			RankPanel.timeMy:SetActive(false)
			RankPanel.scoreMy:SetActive(false)
			RankPanel.myRank:SetContent("--")

			isRequesting = true

			FS_UserData.challenge:LoadRankList(RankPanel.ModeIndex, ChallengeCtrl.LoadRankMonster)
		end)
		RankPanel.RankModeBtnGroup[i]:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
		RankPanel.RankModeBtnGroup[i]:SetSelectedLight(true)
		RankPanel.RankModeBtnGroup[i]:SetSelectedLight(false)
	end

	RankPanel.ModeIndex = 5

	RankPanel.RankModeBtnGroup[5]:SetSelectedLight(true)

	RankPanel.RankMonsterLoader = this.mainComponent:GetLoader("ChallengePanel_RankPanel_MonsterList_Viewport_Content")
	RankPanel.RankPlayerLoader = this.mainComponent:GetLoader("ChallengePanel_RankPanel_PlayerList_Viewport_Content")
	RankPanel.RankPlayerContentRT = RankPanel.RankPlayerLoader.gameObject:GetComponent("RectTransform")
	RankPanel.heroTitle = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_TitleBG_ChangeGroup_hero")
	RankPanel.timeTitle = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_TitleBG_ChangeGroup_time")
	RankPanel.scoreTitle = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_TitleBG_ChangeGroup_score")
	RankPanel.lineTime = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_linetime")
	RankPanel.heroMy = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_heroGroup")
	RankPanel.timeMy = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_timeGroup")
	RankPanel.scoreMy = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_ScoreGroup")

	RankPanel.heroMy:SetActive(false)
	RankPanel.timeMy:SetActive(false)
	RankPanel.scoreMy:SetActive(false)

	RankPanel.myRank = this.mainComponent:GetText("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_rank_myRank")

	RankPanel.myRank:SetContent("--")

	RankPanel.myHeroIcon = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_heroGroup_heroIcon")
	RankPanel.myHeroIcon = XImage:new(RankPanel.myHeroIcon)
	RankPanel.myPerfect = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_heroGroup_perfect")
	RankPanel.myHeroNameGO = this.mainComponent:GetGameObject("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_heroGroup_heroName")
	RankPanel.myTime = this.mainComponent:GetText("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_timeGroup_time")
	RankPanel.myCSTime = this.mainComponent:GetText("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_timeGroup_time_time2")
	RankPanel.myScore = this.mainComponent:GetText("ChallengePanel_RankPanel_MyRankGroup_ChangeGroup_ScoreGroup_Score")
	ModeBtnGroup[1] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_ModeGroup_Easy")
	ModeBtnGroup[2] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_ModeGroup_Normal")
	ModeBtnGroup[3] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_ModeGroup_Hard")
	ModeBtnGroup[4] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_ModeGroup_VeryHard")

	for i = 1, 4 do
		ModeBtnGroup[i]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			for j = 1, 4 do
				ModeBtnGroup[j]:SetSelectedLight(false)
			end

			ModeBtnGroup[i]:SetSelectedLight(true)

			ModeIndex = i
			ChallengeLevel = i

			FS_UserData.challenge:SetChallengeLevel(ChallengeLevel)
			ScoreGroup.score:SetContent(FS_UserData.challenge:GetTotalScore(ChallengeLevel))
			this.LoadMonster()
		end)
		ModeBtnGroup[i]:SetSelectedLight(true)
		ModeBtnGroup[i]:SetSelectedLight(false)
		ModeBtnGroup[i]:SetAudioType(AudioCtrl.ButtonClickType.MainPageSwitch)
	end

	ModeIndex = FS_UserData.challenge:GetChallengeLevel()

	ModeBtnGroup[ModeIndex]:SetSelectedLight(true)

	HeroBtnGroup[1] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10001")
	HeroBtnGroup[2] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10002")
	HeroBtnGroup[3] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10003")
	HeroBtnGroup[4] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10004")
	HeroBtnGroup[5] = this.mainComponent:GetButton("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10005")
	HeroPhotoGroup[1] = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10001_photo")
	HeroPhotoGroup[1] = XImage:new(HeroPhotoGroup[1])
	HeroPhotoGroup[2] = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10002_photo")
	HeroPhotoGroup[2] = XImage:new(HeroPhotoGroup[2])
	HeroPhotoGroup[3] = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10003_photo")
	HeroPhotoGroup[3] = XImage:new(HeroPhotoGroup[3])
	HeroPhotoGroup[4] = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10004_photo")
	HeroPhotoGroup[4] = XImage:new(HeroPhotoGroup[4])
	HeroPhotoGroup[5] = this.mainComponent:GetGameObject("ChallengePanel_SelectHeroPanel_HeroGroup_Hero10005_photo")
	HeroPhotoGroup[5] = XImage:new(HeroPhotoGroup[5])
	HeroBtnGroup[1].light = HeroBtnGroup[1].gameObject.transform:Find("SelectedLight0").gameObject
	HeroBtnGroup[2].light = HeroBtnGroup[2].gameObject.transform:Find("SelectedLight0").gameObject
	HeroBtnGroup[3].light = HeroBtnGroup[3].gameObject.transform:Find("SelectedLight0").gameObject
	HeroBtnGroup[4].light = HeroBtnGroup[4].gameObject.transform:Find("SelectedLight0").gameObject
	HeroBtnGroup[5].light = HeroBtnGroup[5].gameObject.transform:Find("SelectedLight0").gameObject

	for i = 1, 5 do
		HeroBtnGroup[i]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if i == 5 and not IapData.GetEnterTide() then
				return
			end

			for j = 1, 5 do
				HeroBtnGroup[j].light:SetActive(false)
			end

			HeroBtnGroup[i].light:SetActive(true)

			HeroIndex = i

			FS_UserData.challenge:SetHeroSelect(i)

			ChallengeChooseHeroId = tonumber("1000" .. i)

			this.LoadMonster()
		end)
		HeroBtnGroup[i]:SetAudioType(AudioCtrl.ButtonClickType.PageSwitch)
		HeroBtnGroup[i].light:SetActive(false)
	end

	if IapData.GetEnterTide() then
		HeroPhotoGroup[5]:SetGray(true)
		HeroPhotoGroup[5]:SetGray(false)

		HeroIndexMax = 5
	else
		HeroPhotoGroup[5]:SetGray(true)

		HeroIndexMax = 4
	end

	HeroIndex = FS_UserData.challenge:GetHeroSelect()
	ChallengeChooseHeroId = tonumber("1000" .. HeroIndex)

	HeroBtnGroup[HeroIndex].light:SetActive(true)
	ScoreGroup.score:SetContent(FS_UserData.challenge:GetTotalScore(ChallengeLevel))
	this.LoadMonster()
	FS_UserData.challenge:SetIsInChallengeMode(true)
	inputMgr:SetPointerLocked(false)
	inputMgr:SetInMenuMode()
end

function ChallengeCtrl.InitMode(mode)
	ChallengeMode = mode

	if ChallengeMode == MS_StoryChallenge.ChallengeMode.Normal then
		ChallengeLevel = FS_UserData.challenge:GetChallengeLevel()
	elseif ChallengeMode == MS_StoryChallenge.ChallengeMode.Custom then
		ChallengeLevel = 5
	end
end

function ChallengeCtrl.GetRankList()
	local tlist = {}

	table.insert(tlist, 999999)

	local monsterIdList = MS_StoryChallenge.GetHeroIdList()

	for k, v in pairs(monsterIdList) do
		table.insert(tlist, v)
	end

	return tlist
end

function ChallengeCtrl.LoadRankMonster()
	isRequesting = false

	local monsterIdList = ChallengeCtrl.GetRankList()

	RankPanel.RankMonsterLoader.loadCount = #monsterIdList

	function RankPanel.RankMonsterLoader.loadCallback(index, com, data)
		local monsterId = monsterIdList[index]
		local monsterName = com:GetText("Text")

		if monsterId == 999999 then
			monsterName:SetContent(GameText.UI_CHALLENGE_TOTAL_SCORE)
		else
			local heroData = MS_HeroData.GetHero(monsterId)

			monsterName:SetContent(heroData.Name)
		end

		local btn = com:GetButton("Loader_RankMonster_BG")

		btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if monsterId == 999999 then
				RankPanel.heroTitle:SetActive(false)
				RankPanel.timeTitle:SetActive(false)
				RankPanel.scoreTitle:SetActive(true)
				RankPanel.lineTime:SetActive(false)
				RankPanel.heroMy:SetActive(false)
				RankPanel.timeMy:SetActive(false)
				RankPanel.scoreMy:SetActive(true)
			else
				RankPanel.heroTitle:SetActive(true)
				RankPanel.timeTitle:SetActive(true)
				RankPanel.scoreTitle:SetActive(false)
				RankPanel.lineTime:SetActive(true)
				RankPanel.heroMy:SetActive(true)
				RankPanel.timeMy:SetActive(true)
				RankPanel.scoreMy:SetActive(false)
			end

			ChallengeRankMonsterId = monsterId

			UILayerCtrl.OnSelect("monsterBtn" .. index)
			btn:SetSelectedLight(true)
			ChallengeCtrl.LoadPlayer(monsterId)
			ChallengeCtrl.LoadMyRank(monsterId)
		end)
		UILayerCtrl.AddButton("ChallengeRank", "monsterBtn" .. index, btn)
		btn:SetParentScroll(RankPanel.monsterScroll)

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "monsterBtn" .. index - 1)
		else
			btn:SetAdjacent(XButton.Adjacent.UP, "monsterBtn" .. RankPanel.RankMonsterLoader.loadCount)
		end

		if index == #monsterIdList then
			UILayerCtrl.OnSelect("monsterBtn1")
			UILayerCtrl.OnCursorClickMute()
			btn:SetAdjacent(XButton.Adjacent.DOWN, "monsterBtn1")

			RankPanel.monsterScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.monsterScroll.scrollRectCom.normalizedPosition.x, 1)
		else
			btn:SetAdjacent(XButton.Adjacent.DOWN, "monsterBtn" .. index + 1)
		end
	end

	RankPanel.RankMonsterLoader:Load()
end

function ChallengeCtrl.LoadMonster()
	local monsterIdList = MS_StoryChallenge.GetHeroIdList()

	MonsterLoader.loadCount = #monsterIdList

	function MonsterLoader.loadCallback(index, com, data)
		local monsterId = monsterIdList[index]
		local monsterIcon = com:GetGameObject("monsterIcon")
		local canChallenge = ChallengeCtrl.GetMonsterCanChallenge(monsterId)

		monsterIcon = XImage:new(monsterIcon)

		local monsterName = com:GetText("monsterName")

		if canChallenge then
			local heroData = MS_HeroData.GetHero(monsterId)

			monsterName:SetContent(heroData.Name)

			local sprite = XObjectPool.GetIcon("photo" .. monsterId)

			if sprite then
				monsterIcon:SetSprite(sprite)
			end
		else
			monsterName:SetContent("???")

			local sprite = XObjectPool.GetIcon("photoMask" .. monsterId)

			if sprite then
				monsterIcon:SetSprite(sprite)
			end
		end

		local time = com:GetText("time")
		local timeCS = com:GetText("time_time2")
		local bestFlag = com:GetGameObject("best")
		local perfectFlag = com:GetGameObject("perfect")
		local historyRecord = FS_UserData.challenge:GetChallengeRecord(ChallengeLevel, ChallengeChooseHeroId, monsterId)
		local isBest = FS_UserData.challenge:IsFastRecord(ChallengeLevel, ChallengeChooseHeroId, monsterId)

		if historyRecord then
			local hisTime = TimeHelper.getTimeSpan(historyRecord.time)

			if historyRecord.time > 3599.9 then
				time:SetContent(">60")
				timeCS:SetContent("")
			else
				time:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
				timeCS:SetContent("." .. hisTime.Centiseconds)
			end

			bestFlag:SetActive(isBest)
			perfectFlag:SetActive(historyRecord.historyHeroPerfect == 1)
		else
			time:SetContent("--:--")
			timeCS:SetContent("")
			bestFlag:SetActive(false)
			perfectFlag:SetActive(false)
		end

		local Btn = com:GetButton("Loader_Monster_BG")

		Btn:SetAudioType(AudioCtrl.ButtonClickType.ItemChoose)
		Btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local challengeData = MS_StoryChallenge.GetDataByHeroId(monsterId)

			if canChallenge then
				confirmBtn.gameObject:SetActive(true)
			else
				confirmBtn.gameObject:SetActive(false)
			end

			UILayerCtrl.OnSelect("monsterBtn" .. index)
			Btn:SetSelectedLight(true)
			FS_UserData.challenge:SetMonsterIndex(index)

			ChallengeStoryId = challengeData.StoryId
			ChallengeArea = challengeData.Area

			if challengeData.BornHostId == 0 then
				challengeData.BornHostId = 1
			end

			ChallengeMonsterId = monsterId
			ChallengeBornHostId = challengeData.BornHostId
		end)
		UILayerCtrl.AddButton("Challenge", "monsterBtn" .. index, Btn)
		Btn:SetParentScroll(ChallengeScroll)

		if index > 1 then
			Btn:SetAdjacent(XButton.Adjacent.UP, "monsterBtn" .. index - 1)
		else
			Btn:SetAdjacent(XButton.Adjacent.UP, "monsterBtn" .. MonsterLoader.loadCount)
		end

		if index == #monsterIdList then
			local monsterIndex = FS_UserData.challenge:GetMonsterIndex()

			UILayerCtrl.OnSelect("monsterBtn" .. monsterIndex)
			UILayerCtrl.OnCursorClickMute()
			Btn:SetAdjacent(XButton.Adjacent.DOWN, "monsterBtn1")

			ChallengeScroll.scrollRectCom.normalizedPosition = Vector2.New(ChallengeScroll.scrollRectCom.normalizedPosition.x, 1)

			if monsterIndex > ChallengeRowCount then
				local offset = monsterIndex - ChallengeRowCount

				ChallengeScroll.scrollRectCom.normalizedPosition = Vector2.New(ChallengeScroll.scrollRectCom.normalizedPosition.x, ChallengeScroll.scrollRectCom.normalizedPosition.y - offset / (MonsterLoader.loadCount - ChallengeRowCount))
			end
		else
			Btn:SetAdjacent(XButton.Adjacent.DOWN, "monsterBtn" .. index + 1)
		end
	end

	MonsterLoader:Load()
end

function ChallengeCtrl.LoadPlayer(monsterId)
	local rankList = FS_UserData.challenge:GetRankList(RankPanel.ModeIndex, monsterId)

	RankPanel.RankPlayerLoader.loadCount = #rankList

	function RankPanel.RankPlayerLoader.loadCallback(index, com, data)
		local heroGroup = com:GetGameObject("ChangeGroup_hero")
		local timeGroup = com:GetGameObject("ChangeGroup_time")
		local scoreGroup = com:GetGameObject("ChangeGroup_score")
		local playerNameText = com:GetText("playerName_text")
		local selfFlag = com:GetGameObject("playerName_text_selfIcon")
		local rankText = com:GetText("rank")
		local heroIcon = com:GetGameObject("ChangeGroup_hero_heroIcon")

		heroIcon = XImage:new(heroIcon)

		local perfectFlag = com:GetGameObject("ChangeGroup_hero_perfect")
		local scoreText = com:GetText("ChangeGroup_score")
		local timeText = com:GetText("ChangeGroup_time")
		local timeCSText = com:GetText("ChangeGroup_time_time2")

		rankText:SetContent(index)
		selfFlag:SetActive(tonumber(rankList[index].accountId) == tonumber(LS_Setting.keyUserId))

		local showName = rankList[index].nickName

		if Platform == PlatformType.MAC or Platform == PlatformType.PC then
			local nameList = StringHelper.Split(showName, "#")

			if #nameList > 1 then
				showName = ""

				for i = 1, #nameList - 1 do
					showName = showName .. nameList[i]
				end
			else
				showName = rankList[index].nickName
			end
		end

		playerNameText:SetContent(showName)

		local extraList = StringHelper.Split(rankList[index].extraData, "|")

		if ChallengeRankMonsterId == 999999 then
			heroGroup:SetActive(false)
			timeGroup:SetActive(false)
			scoreGroup:SetActive(true)
			scoreText:SetContent(rankList[index].score)
		else
			local sprite = XObjectPool.GetIcon("photo" .. extraList[1])

			heroIcon:SetSprite(sprite)
			perfectFlag:SetActive(extraList[3] == "1")

			local hisTime = TimeHelper.getTimeSpan(tonumber(extraList[2]))

			if tonumber(extraList[2]) > 3599.9 then
				timeText:SetContent(">60")
				timeCSText:SetContent("")
			else
				timeText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
				timeCSText:SetContent("." .. hisTime.Centiseconds)
			end

			heroGroup:SetActive(true)
			timeGroup:SetActive(true)
			scoreGroup:SetActive(false)
		end

		if index == RankPanel.RankPlayerLoader.loadCount then
			RankPanel.palyerScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.palyerScroll.scrollRectCom.normalizedPosition.x, 1)
		end
	end

	RankPanel.RankPlayerLoader:Load()
end

function ChallengeCtrl.LoadMyRank(monsterId)
	local selfRank = FS_UserData.challenge:GetSelfRank(RankPanel.ModeIndex, monsterId)

	if selfRank.rank == nil or selfRank.rank == -1 then
		RankPanel.myRank:SetContent("--")
	else
		RankPanel.myRank:SetContent(tostring(selfRank.rank + 1))
	end

	if selfRank.extraData ~= nil and selfRank.extraData ~= "" then
		local extraList = StringHelper.Split(selfRank.extraData, "|")
		local sprite = XObjectPool.GetIcon("photo" .. extraList[1])

		RankPanel.myHeroIcon:SetSprite(sprite)
		RankPanel.myHeroIcon.gameObject:SetActive(true)
		RankPanel.myPerfect:SetActive(extraList[3] == "1")

		local hisTime = TimeHelper.getTimeSpan(tonumber(extraList[2]))

		if tonumber(extraList[2]) > 3599.9 then
			RankPanel.myTime:SetContent(">60")
			RankPanel.myCSTime:SetContent("")
		else
			RankPanel.myTime:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
			RankPanel.myCSTime:SetContent("." .. hisTime.Centiseconds)
		end
	else
		RankPanel.myHeroIcon.gameObject:SetActive(false)
		RankPanel.myTime:SetContent("--:--")
		RankPanel.myCSTime:SetContent("")
		RankPanel.myPerfect:SetActive(false)
	end

	if selfRank.score ~= nil then
		RankPanel.myScore:SetContent(selfRank.score)
	else
		RankPanel.myScore:SetContent("--")
	end
end

function ChallengeCtrl.ConfirmChallenge()
	if ChallengeMode == MS_StoryChallenge.ChallengeMode.Normal then
		local lastSkin = FS_UserData.story:GetSelectSkin(ChallengeChooseHeroId)

		FS_UserData.story:Reset()
		FS_UserData.itemList:UseBagItem(MS_ItemData.NoobItem, 1)
		FS_UserData.story:BossTimeChallenge(ChallengeStoryId, ChallengeArea, ChallengeBornHostId, ChallengeLevel, ChallengeMonsterId)
		FS_UserData.story:InitSelectSkin(ChallengeChooseHeroId, lastSkin)
		FS_UserData.heroList:AddHpToMax()
		sceneController:ChooseHeroId(ChallengeChooseHeroId)
		sceneController:ChooseHeroIdConfirm()
	elseif ChallengeMode == MS_StoryChallenge.ChallengeMode.Custom then
		local lastSkin = FS_UserData.story:GetSelectSkin(ChallengeChooseHeroId)

		FS_UserData.ResetToChallenge(ChallengeChooseHeroId)
		FS_UserData.itemList:UseBagItem(MS_ItemData.NoobItem, 1)
		FS_UserData.story:BossTimeChallenge(ChallengeStoryId, ChallengeArea, ChallengeBornHostId, ChallengeLevel, ChallengeMonsterId)
		FS_UserData.story:InitSelectSkin(ChallengeChooseHeroId, lastSkin)
		FS_UserData.heroList:AddHpToMax()

		if ChallengeMonsterId == 10006 then
			FS_UserData.itemList:AddBagItem(30001, 10)

			local tmpHeroData = FS_UserData.heroList:GetHero(ChallengeChooseHeroId)

			tmpHeroData:SetShortcut(1, 30001)
			tmpHeroData:SetMainShortcutIndex(1)
		end

		sceneController:ChooseHeroId(ChallengeChooseHeroId)
		sceneController:ChooseHeroIdConfirm()
	end
end

function ChallengeCtrl.ClosePanel()
	FS_UserData.challenge:SetIsInChallengeMode(false)
	UIManager.Close("Challenge")
	UILayerCtrl.Pop()
end

function ChallengeCtrl.CloseRankPanel()
	RankPanel.GO:SetActive(false)
	UILayerCtrl.Pop()
	UILayerCtrl.OnCursorClick()
end

function ChallengeCtrl.GetMonsterCanChallenge(heroId)
	if DebugCanChallengeAllMonster then
		return true
	end

	local challengeData = MS_StoryChallenge.GetDataByHeroId(heroId)
	local loop = FS_UserData.story:GetLoop()

	if loop > 1 and challengeData.MutliEnable == 1 then
		return true
	end

	if challengeData.ShowQuestId ~= "" and FS_UserData.story:IsQuestComplete(challengeData.ShowQuestId) then
		return true
	end

	if challengeData.DLCSwitch == 1 and IapData.GetEnterMaze() then
		return true
	end

	return false
end

function ChallengeCtrl.JPadRot(pos)
	if isRequesting then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "ChallengeRank" then
		local flowRow = RankPanel.RankPlayerContentRT.rect.height / 30

		if pos == XButton.Adjacent.DOWN then
			RankPanel.palyerScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.palyerScroll.scrollRectCom.normalizedPosition.x, RankPanel.palyerScroll.scrollRectCom.normalizedPosition.y - 1 / (5 * flowRow))
		elseif pos == XButton.Adjacent.UP then
			RankPanel.palyerScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.palyerScroll.scrollRectCom.normalizedPosition.x, RankPanel.palyerScroll.scrollRectCom.normalizedPosition.y + 1 / (5 * flowRow))
		end
	end
end

function ChallengeCtrl.JPadPress(dir)
	if isRequesting then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "Challenge" then
		local btnName = UILayerCtrl.GetCurrentButtonName()

		UILayerCtrl.Select(dir)
		UILayerCtrl.OnCursorClick()

		if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and string.find(btnName, "monsterBtn") == 1 then
			local row = tonumber(string.sub(btnName, 11))
			local toprow = 1 + Mathf.Floor((1 - ChallengeScroll.scrollRectCom.normalizedPosition.y) / (1 / (MonsterLoader.loadCount - ChallengeRowCount)) + 0.5)
			local botrow = toprow + ChallengeRowCount - 1

			if dir == XButton.Adjacent.DOWN and botrow <= row then
				if btnName == "monsterBtn" .. MonsterLoader.loadCount then
					ChallengeScroll.scrollRectCom.normalizedPosition = Vector2.New(ChallengeScroll.scrollRectCom.normalizedPosition.x, 1)
				else
					ChallengeScroll.scrollRectCom.normalizedPosition = Vector2.New(ChallengeScroll.scrollRectCom.normalizedPosition.x, ChallengeScroll.scrollRectCom.normalizedPosition.y - 1 / (MonsterLoader.loadCount - ChallengeRowCount))
				end
			elseif dir == XButton.Adjacent.UP and row <= toprow then
				if btnName == "monsterBtn1" then
					ChallengeScroll.scrollRectCom.normalizedPosition = Vector2.New(ChallengeScroll.scrollRectCom.normalizedPosition.x, 0)
				else
					ChallengeScroll.scrollRectCom.normalizedPosition = Vector2.New(ChallengeScroll.scrollRectCom.normalizedPosition.x, ChallengeScroll.scrollRectCom.normalizedPosition.y + 1 / (MonsterLoader.loadCount - ChallengeRowCount))
				end
			end
		end
	elseif lName == "ChallengeRank" then
		local btnName = UILayerCtrl.GetCurrentButtonName()

		UILayerCtrl.Select(dir)
		UILayerCtrl.OnCursorClick()

		if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and btnName ~= nil and string.find(btnName, "monsterBtn") == 1 then
			local row = tonumber(string.sub(btnName, 11))
			local toprow = 1 + Mathf.Floor((1 - RankPanel.monsterScroll.scrollRectCom.normalizedPosition.y) / (1 / (RankPanel.RankMonsterLoader.loadCount - ChallengeRankMonsterRowCount)) + 0.5)
			local botrow = toprow + ChallengeRankMonsterRowCount - 1

			if dir == XButton.Adjacent.DOWN and botrow <= row then
				if btnName == "monsterBtn" .. RankPanel.RankMonsterLoader.loadCount then
					RankPanel.monsterScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.monsterScroll.scrollRectCom.normalizedPosition.x, 1)
				else
					RankPanel.monsterScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.monsterScroll.scrollRectCom.normalizedPosition.x, RankPanel.monsterScroll.scrollRectCom.normalizedPosition.y - 1 / (RankPanel.RankMonsterLoader.loadCount - ChallengeRankMonsterRowCount))
				end
			elseif dir == XButton.Adjacent.UP and row <= toprow then
				if btnName == "monsterBtn1" then
					RankPanel.monsterScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.monsterScroll.scrollRectCom.normalizedPosition.x, 0)
				else
					RankPanel.monsterScroll.scrollRectCom.normalizedPosition = Vector2.New(RankPanel.monsterScroll.scrollRectCom.normalizedPosition.x, RankPanel.monsterScroll.scrollRectCom.normalizedPosition.y + 1 / (RankPanel.RankMonsterLoader.loadCount - ChallengeRankMonsterRowCount))
				end
			end
		end
	end
end

function ChallengeCtrl.DPadPress(dir)
	UILayerCtrl.Select(dir)
end

function ChallengeCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function ChallengeCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() or isRequesting then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "Challenge" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
			UILayerCtrl.OnButtonClick("ConfirmBtn")
		elseif inputMgr:GetButtonUp(GBKey.B) then
			UILayerCtrl.OnButtonClick("BackBtn")
		elseif inputMgr:GetButtonUp(GBKey.Y) or inputMgr:GetKeyUp(XKeyCode.F) then
			if Platform == PlatformType.MAC then
				return
			end

			UILayerCtrl.OnButtonClick("RankBtn")
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) or inputMgr:GetKeyL1Down() then
			local button = HeroBtnGroup[(HeroIndex + HeroIndexMax - 2) % HeroIndexMax + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R1) or inputMgr:GetKeyR1Down() then
			local button = HeroBtnGroup[HeroIndex % HeroIndexMax + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L2) or inputMgr:GetKeyL2Down() then
			if ChallengeMode == MS_StoryChallenge.ChallengeMode.Normal then
				local button = ModeBtnGroup[(ModeIndex + 2) % 4 + 1]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			end
		elseif (inputMgr:GetButtonUp(LS_Setting.Btn.R2) or inputMgr:GetKeyR2Down()) and ChallengeMode == MS_StoryChallenge.ChallengeMode.Normal then
			local button = ModeBtnGroup[ModeIndex % 4 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	elseif lName == "ChallengeRank" then
		if inputMgr:GetButtonUp(GBKey.B) then
			UILayerCtrl.OnButtonClick("BackBtn")
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L2) or inputMgr:GetKeyL2Down() then
			local button = RankPanel.RankModeBtnGroup[(RankPanel.ModeIndex + 3) % 5 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.R2) or inputMgr:GetKeyR2Down() then
			local button = RankPanel.RankModeBtnGroup[RankPanel.ModeIndex % 5 + 1]

			button:OnDown(nil, nil)
			button:OnClick(nil, nil)
		end
	end
end

return ChallengeCtrl
