-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/AchievementCtrl.lua

AchievementCtrl = class("AchievementCtrl", UICtrlBase)

local this = AchievementCtrl
local achieveLoader, achieveTabBtnList, mainScroll
local mainRow = 4
local titleText, JoystickRT

AchievementCtrl.static.Level = {
	Gold = 3,
	Silver = 2,
	Platinum = 4,
	Copper = 1
}
AchievementCtrl.static.Tab = {
	Tide = 4,
	Classic = 1,
	Loop = 2,
	Maze = 3,
	Challenge = 5,
	Arcade = 6
}

function AchievementCtrl.ClosePanel()
	UIManager.Close("Achievement")
	UILayerCtrl.Pop()
end

function AchievementCtrl.OnCreate()
	UILayerCtrl.Add("AchievementPanel", AchievementCtrl.ClosePanel)

	local backBtn = this.mainComponent:GetButton("AchievementPanel_AchievePanelLeft_Back")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		AchievementCtrl.ClosePanel()
	end)
	UILayerCtrl.AddIndividual("AchievementPanel", "AchievementPanel_AchievePanelLeft_Back", backBtn)

	mainScroll = this.mainComponent:GetGameObject("AchievementPanel_Achievement_B_MainScroll")
	mainScroll = XScrollRect:new(mainScroll)
	achieveTabBtnList = {}
	achieveTabBtnList[AchievementCtrl.Tab.Classic] = this.mainComponent:GetButton("AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn")

	achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn")
		achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Classic)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST1)
	end)
	achieveTabBtnList[AchievementCtrl.Tab.Classic]:SelectOnStart(true)
	achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetHighlightIndependent(true)

	achieveTabBtnList[AchievementCtrl.Tab.Loop] = this.mainComponent:GetButton("AchievementPanel_Achievement_B_TabBtnGroup_RankTabBtn")

	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AchievementPanel_Achievement_B_TabBtnGroup_RankTabBtn")
		achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Loop)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST2)
	end)
	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetCommonHighlighted(true)
	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetCommonHighlighted(false)
	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetHighlightIndependent(true)

	achieveTabBtnList[AchievementCtrl.Tab.Maze] = this.mainComponent:GetButton("AchievementPanel_Achievement_B_TabBtnGroup_MazeTabBtn")

	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AchievementPanel_Achievement_B_TabBtnGroup_MazeTabBtn")
		achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Maze)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST3)
	end)
	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetCommonHighlighted(true)
	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetCommonHighlighted(false)
	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetHighlightIndependent(true)

	achieveTabBtnList[AchievementCtrl.Tab.Tide] = this.mainComponent:GetButton("AchievementPanel_Achievement_B_TabBtnGroup_TideTabBtn")

	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AchievementPanel_Achievement_B_TabBtnGroup_TideTabBtn")
		achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Tide)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST4)
	end)
	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetCommonHighlighted(true)
	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetCommonHighlighted(false)
	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetHighlightIndependent(true)

	achieveTabBtnList[AchievementCtrl.Tab.Challenge] = this.mainComponent:GetButton("AchievementPanel_Achievement_B_TabBtnGroup_ChallengeTabBtn")

	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AchievementPanel_Achievement_B_TabBtnGroup_ChallengeTabBtn")
		achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Challenge)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST5)
	end)
	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetCommonHighlighted(true)
	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetCommonHighlighted(false)
	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetHighlightIndependent(true)

	achieveTabBtnList[AchievementCtrl.Tab.Arcade] = this.mainComponent:GetButton("AchievementPanel_Achievement_B_TabBtnGroup_ArcadeTabBtn")

	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.OnSelect("AchievementPanel_Achievement_B_TabBtnGroup_ArcadeTabBtn")
		achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Arcade)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST6)
	end)
	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetCommonHighlighted(true)
	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetCommonHighlighted(false)
	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetHighlightIndependent(true)
	UILayerCtrl.AddButton("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn", achieveTabBtnList[AchievementCtrl.Tab.Classic])
	UILayerCtrl.AddButton("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_RankTabBtn", achieveTabBtnList[AchievementCtrl.Tab.Loop])
	UILayerCtrl.AddButton("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_MazeTabBtn", achieveTabBtnList[AchievementCtrl.Tab.Maze])
	UILayerCtrl.AddButton("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_TideTabBtn", achieveTabBtnList[AchievementCtrl.Tab.Tide])
	UILayerCtrl.AddButton("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_ChallengeTabBtn", achieveTabBtnList[AchievementCtrl.Tab.Challenge])
	UILayerCtrl.AddButton("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_ArcadeTabBtn", achieveTabBtnList[AchievementCtrl.Tab.Arcade])

	titleText = this.mainComponent:GetText("AchievementPanel_Achievement_B_BG_Text")
	JoystickRT = this.mainComponent:GetGameObject("AchievementPanel_GamePadIconGroup"):GetComponent("RectTransform")

	achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetAdjacent(XButton.Adjacent.DOWN, "AchievementPanel_Achievement_B_TabBtnGroup_RankTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetAdjacent(XButton.Adjacent.UP, "AchievementPanel_Achievement_B_TabBtnGroup_ArcadeTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetAdjacent(XButton.Adjacent.UP, "AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetAdjacent(XButton.Adjacent.DOWN, "AchievementPanel_Achievement_B_TabBtnGroup_MazeTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetAdjacent(XButton.Adjacent.UP, "AchievementPanel_Achievement_B_TabBtnGroup_RankTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetAdjacent(XButton.Adjacent.DOWN, "AchievementPanel_Achievement_B_TabBtnGroup_TideTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetAdjacent(XButton.Adjacent.UP, "AchievementPanel_Achievement_B_TabBtnGroup_MazeTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetAdjacent(XButton.Adjacent.DOWN, "AchievementPanel_Achievement_B_TabBtnGroup_ChallengeTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetAdjacent(XButton.Adjacent.UP, "AchievementPanel_Achievement_B_TabBtnGroup_TideTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetAdjacent(XButton.Adjacent.DOWN, "AchievementPanel_Achievement_B_TabBtnGroup_ArcadeTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")
	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetAdjacent(XButton.Adjacent.UP, "AchievementPanel_Achievement_B_TabBtnGroup_ChallengeTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetAdjacent(XButton.Adjacent.DOWN, "AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn")
	achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetAdjacent(XButton.Adjacent.RIGHT, "AchieveBtn1")

	achieveLoader = this.mainComponent:GetLoader("AchievementPanel_Achievement_B_MainScroll_ViewPort_Content")

	UILayerCtrl.Push("AchievementPanel", "AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn")
	UILayerCtrl.OnCursorClickMute()
	UILayerCtrl.ForceUpdate(0.7)

	if SdkHelper.CheckAccountState() == false then
		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Classic)
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST1)

		return
	end

	UIManager.SendMessage("Loading", "SimpleLoading", true)
	SdkHelper.GetAchievement(function(result, jsonStr)
		if result == true then
			local retData = json.decode(jsonStr)

			if retData ~= nil then
				if retData.success then
					local resultString = retData.result.achievement .. tostring(retData.result.time) .. AppConst.SecKey
					local resultSign = Util.md5(resultString)

					if resultSign == retData.result.sign then
						SystemHelper.LogTest("=======成就回调签名验证通过=======")

						local utcTs, tsOffset = TimeHelper.getUtcTime()
						local time = utcTs

						if time - retData.result.time >= 600 then
							-- block empty
						else
							SystemHelper.LogTest("=======成就回调签名验证通过22=======")

							local userId = LS_Account.userId

							LS_Achievement.SetUserId(userId)

							local data = json.decode(retData.result.achievement)

							if data then
								LS_Achievement.SmartWrite(data.achievement)
							end
						end
					end
				elseif retData.code ~= 306 then
					-- block empty
				end
			end
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_NETWORK_ERROR)
		end

		AchievementCtrl.LoadAchievement(AchievementCtrl.Tab.Classic)
		LS_Achievement.Update()
		titleText:SetContent(GameText.UI_ACHIEVEMENT_LIST1)
		UIManager.SendMessage("Loading", "SimpleLoading", false)
	end)
end

function AchievementCtrl.LoadAchievement(tab)
	local achievementList = MS_Achievement.GetAchievementListWithoutId(tab)

	achieveLoader.loadCount = #achievementList

	function achieveLoader.loadCallback(index, com, data)
		local btn = com:GetButton("BtnBG")
		local title = com:GetText("titleGroup_title")
		local des = com:GetText("description")
		local icon = com:GetGameObject("frameGroup_achieveIcon")
		local progressText = com:GetText("frame_progressText")
		local isFinish = FS_UserData.achievement:GetAchievementFinished(achievementList[index].AchievementId)
		local mask = com:GetGameObject("Mask")
		local completeNum = com:GetText("percent")

		completeNum:SetContent("1")

		local goldframe = com:GetGameObject("frameGroup_goldFrame")
		local silverFrame = com:GetGameObject("frameGroup_silverFrame")
		local copperFrame = com:GetGameObject("frameGroup_copperFrame")
		local platinumFrame = com:GetGameObject("frameGroup_platinumFrame")
		local goldCup = com:GetGameObject("titleGroup_cupGroup_goldCup")
		local silverCup = com:GetGameObject("titleGroup_cupGroup_silverCup")
		local copperCup = com:GetGameObject("titleGroup_cupGroup_copperCup")
		local platinumCup = com:GetGameObject("titleGroup_cupGroup_platinumCup")
		local normalFlag = com:GetGameObject("Nomal")
		local easyFlag = com:GetGameObject("Easy")

		goldframe:SetActive(false)
		silverFrame:SetActive(false)
		copperFrame:SetActive(false)
		goldCup:SetActive(false)
		silverCup:SetActive(false)
		copperCup:SetActive(false)
		platinumFrame:SetActive(false)
		platinumCup:SetActive(false)

		if achievementList[index].Level == AchievementCtrl.Level.Copper then
			title:SetColor(0.8196078431372549, 0.6313725490196078, 0.5333333333333333, 1)
			copperFrame:SetActive(true)
			copperCup:SetActive(true)
		elseif achievementList[index].Level == AchievementCtrl.Level.Silver then
			title:SetColor(0.7019607843137254, 0.7019607843137254, 0.7019607843137254, 1)
			silverFrame:SetActive(true)
			silverCup:SetActive(true)
		elseif achievementList[index].Level == AchievementCtrl.Level.Gold then
			title:SetColor(0.8784313725490196, 0.7411764705882353, 0.5098039215686274, 1)
			goldframe:SetActive(true)
			goldCup:SetActive(true)
		elseif achievementList[index].Level == AchievementCtrl.Level.Platinum then
			title:SetColor(0.7098039215686275, 0.6862745098039216, 0.8588235294117647, 1)
			platinumFrame:SetActive(true)
			platinumCup:SetActive(true)
		end

		local greyBar = com:GetGameObject("frame_greyProgressBar")
		local greyBarImage = greyBar:GetComponent("Image")
		local greenBar = com:GetGameObject("frame_greenProgressBar")
		local icon = XImage:new(icon)
		local sprite = XObjectPool.GetIcon("achievement" .. achievementList[index].Icon)

		if sprite ~= nil then
			icon:SetSprite(sprite)
		end

		mask:SetActive(not isFinish)

		if isFinish then
			title:SetContent(achievementList[index].Title)
			des:SetContent(achievementList[index].Text)
		elseif achievementList[index].isAlwaysOpen == 1 then
			title:SetContent(achievementList[index].Title)
			des:SetContent(achievementList[index].Text)
		else
			title:SetContent("???")
			des:SetContent("???")
		end

		if achievementList[index].leastUnlockDiff == 2 then
			normalFlag:SetActive(true)
			easyFlag:SetActive(false)
		elseif achievementList[index].leastUnlockDiff == 1 then
			normalFlag:SetActive(false)
			easyFlag:SetActive(true)
		end

		btn:SetParentScroll(mainScroll)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			UILayerCtrl.OnSelect("AchieveBtn" .. index)
		end)
		UILayerCtrl.AddButton("AchievementPanel", "AchieveBtn" .. index, btn)

		if tab == AchievementCtrl.Tab.Classic then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "AchievementPanel_Achievement_B_TabBtnGroup_AchieveTabBtn")
		elseif tab == AchievementCtrl.Tab.Loop then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "AchievementPanel_Achievement_B_TabBtnGroup_RankTabBtn")
		elseif tab == AchievementCtrl.Tab.Maze then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "AchievementPanel_Achievement_B_TabBtnGroup_MazeTabBtn")
		elseif tab == AchievementCtrl.Tab.Tide then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "AchievementPanel_Achievement_B_TabBtnGroup_TideTabBtn")
		elseif tab == AchievementCtrl.Tab.Challenge then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "AchievementPanel_Achievement_B_TabBtnGroup_ChallengeTabBtn")
		elseif tab == AchievementCtrl.Tab.Arcade then
			btn:SetAdjacent(XButton.Adjacent.LEFT, "AchievementPanel_Achievement_B_TabBtnGroup_ArcadeTabBtn")
		end

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "AchieveBtn" .. index - 1)
		else
			btn:SetAdjacent(XButton.Adjacent.UP, "AchieveBtn" .. achieveLoader.loadCount)
		end

		if index == achieveLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "AchieveBtn1")

			mainScroll.scrollRectCom.normalizedPosition = Vector2.New(mainScroll.scrollRectCom.normalizedPosition.x, 1)

			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(JoystickRT)
		else
			btn:SetAdjacent(XButton.Adjacent.DOWN, "AchieveBtn" .. index + 1)
		end
	end

	achieveLoader:PreloadTemplate(function()
		achieveLoader:Load()
	end)
end

function AchievementCtrl.JPadPress(dir)
	local btnName = UILayerCtrl.GetCurrentButtonName()
	local oldIsAchieveBtn = false

	if string.find(btnName, "AchieveBtn") == 1 then
		oldIsAchieveBtn = true
	end

	if dir == XButton.Adjacent.LEFT and oldIsAchieveBtn then
		achieveTabBtnList[AchievementCtrl.Tab.Classic]:SetAdjacent(XButton.Adjacent.RIGHT, btnName)
		achieveTabBtnList[AchievementCtrl.Tab.Loop]:SetAdjacent(XButton.Adjacent.RIGHT, btnName)
		achieveTabBtnList[AchievementCtrl.Tab.Maze]:SetAdjacent(XButton.Adjacent.RIGHT, btnName)
		achieveTabBtnList[AchievementCtrl.Tab.Tide]:SetAdjacent(XButton.Adjacent.RIGHT, btnName)
		achieveTabBtnList[AchievementCtrl.Tab.Challenge]:SetAdjacent(XButton.Adjacent.RIGHT, btnName)
		achieveTabBtnList[AchievementCtrl.Tab.Arcade]:SetAdjacent(XButton.Adjacent.RIGHT, btnName)
	end

	UILayerCtrl.Select(dir)
	UILayerCtrl.OnCursorClick()

	if (dir == XButton.Adjacent.UP or dir == XButton.Adjacent.DOWN) and string.find(btnName, "AchieveBtn") == 1 then
		local row = tonumber(string.sub(btnName, 11))
		local toprow = 1 + Mathf.Floor((1 - mainScroll.scrollRectCom.normalizedPosition.y) / (1 / (achieveLoader.loadCount - mainRow)) + 0.5)
		local botrow = toprow + mainRow - 1

		if dir == XButton.Adjacent.DOWN and botrow <= row then
			if btnName == "AchieveBtn" .. achieveLoader.loadCount then
				mainScroll.scrollRectCom.normalizedPosition = Vector2.New(mainScroll.scrollRectCom.normalizedPosition.x, 1)
			else
				mainScroll.scrollRectCom.normalizedPosition = Vector2.New(mainScroll.scrollRectCom.normalizedPosition.x, mainScroll.scrollRectCom.normalizedPosition.y - 1 / (achieveLoader.loadCount - mainRow))
			end
		elseif dir == XButton.Adjacent.UP and row <= toprow then
			if btnName == "AchieveBtn1" then
				mainScroll.scrollRectCom.normalizedPosition = Vector2.New(mainScroll.scrollRectCom.normalizedPosition.x, 0)
			else
				mainScroll.scrollRectCom.normalizedPosition = Vector2.New(mainScroll.scrollRectCom.normalizedPosition.x, mainScroll.scrollRectCom.normalizedPosition.y + 1 / (achieveLoader.loadCount - mainRow))
			end
		end
	end
end

function AchievementCtrl.DPadPress(dir)
	UILayerCtrl.Select(dir)
end

function AchievementCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function AchievementCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "AchievementPanel" then
		if inputMgr:GetButtonUp(GBKey.A) then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonUp(GBKey.B) then
			UILayerCtrl.OnButtonClick("AchievementPanel_AchievePanelLeft_Back")
		end
	end
end

function AchievementCtrl.Close()
	if achieveLoader then
		achieveLoader:ClearChild()
		achieveLoader:ClearTemplate()
	end

	UICtrlBase.Close("Achievement")
end

return AchievementCtrl
