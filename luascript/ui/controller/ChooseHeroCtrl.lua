-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ChooseHeroCtrl.lua

ChooseHeroCtrl = class("ChooseHeroCtrl", UICtrlBase)

local this = ChooseHeroCtrl

ChooseHeroCtrl.static.Debug = 0
ChooseHeroCtrl.static.Arcade = 1
ChooseHeroCtrl.static.StepLength = 100
ChooseHeroCtrl.static.UI_ChooseHero = "ChooseHero"
ChooseHeroCtrl.static.UI_HeroCostume = "HeroCostume"

local mode = ChooseHeroCtrl.Debug
local loadCompleted = false
local heroIndex = -1
local heroSkinId = -1
local heroIdCostume = -1
local prevHeroIndex = -1
local prevHeroIdCostume = -1
local selectIndex = 1
local heroListCount = 0
local heroListRowCount = 10
local loaderHeroList, loaderMateList, loaderMateList5, enemyLoader, scrollHeroObj, scrollHeroRect, heroContentObj, loaderCostumeList, scrollCostumeObj, scrollCostumeRect, costumeContentObj, costumeButtonList, textHeroName, textHeroIntro
local teamMateTbl = {}
local wait_text
local confirmed = false
local heroRawImg, viewSkillDlg, heroName, heroIcon, storyText, btnConfirm, sceneController
local teamStatusOld = {}

function ChooseHeroCtrl.GetNavBtnIndices(btnIdx, maxCnt)
	local keyPrev = (btnIdx - 2 + maxCnt) % maxCnt + 1
	local keyNext = btnIdx % maxCnt + 1

	return keyPrev, keyNext
end

function ChooseHeroCtrl.OnCreate()
	loadCompleted = false

	UILayerCtrl.Add(ChooseHeroCtrl.UI_ChooseHero, ChooseHeroCtrl.OnButtonBack)
	UILayerCtrl.Add(ChooseHeroCtrl.UI_HeroCostume, ChooseHeroCtrl.OnButtonBack)

	heroIndex = -1
	heroSkinId = -1
	heroIdCostume = -1
	prevHeroIndex = -1
	prevHeroIdCostume = -1
	selectIndex = 1
	sceneController = ST_Lobby.GetSceneController()

	this.mainComponent:GetGameObject("Panel_Modle_Story"):SetActive(true)

	heroName = this.mainComponent:GetGameObject("Panel_Hero_Name_HeroName")
	heroIcon = this.mainComponent:GetGameObject("Panel_Hero_Name_HeroName_HeroIcon")

	local pvpGroup = this.mainComponent:GetGroupByName("pvp")
	local pveGroup = this.mainComponent:GetGroupByName("pve")

	pvpGroup:SetActive(false)
	pveGroup:SetActive(true)

	local touchBtn = this.mainComponent:GetButton("Panel_Touch")

	touchBtn:SetAudioEnable(false)
	touchBtn:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		sceneController:RotatePlayer(data)
	end)

	local panelPvpWait = this.mainComponent:GetGameObject("Panel_PvpWait")

	loaderMateList = this.mainComponent:GetLoader("Panel_Team_L")
	loaderMateList5 = this.mainComponent:GetLoader("Panel_Team5_L")
	teamMateTbl = {}

	loaderMateList5.gameObject:SetActive(false)
	loaderMateList:SetCount(1)

	function loaderMateList.loadCallback(index, com, data)
		local heroConfirm = com:GetGroupByName("confirm")

		heroConfirm:SetActive(false)

		local normalGroup = com:GetGroupByName("normal")

		normalGroup:SetActive(true)
		table.insert(teamMateTbl, com)

		local username = com:GetText("Text_Name")

		username:SetContent(FS_UserData.playerList:GetPlayer():GetName())
	end

	loaderMateList:Load()

	teamStatusOld = {}
	scrollHeroObj = this.mainComponent:GetGameObject("Scroll_Hero")
	scrollHeroRect = XScrollRect:new(scrollHeroObj)
	loaderHeroList = this.mainComponent:GetLoader("Scroll_Hero_Content")
	heroContentObj = loaderHeroList.gameObject
	textHeroName = this.mainComponent:GetText("Panel_L_Text_HeroName")
	textHeroIntro = this.mainComponent:GetText("Panel_L_Text_HeroIntro")
	loaderCostumeList = this.mainComponent:GetLoader("Scroll_Costume_Content")
	confirmed = false
	btnConfirm = this.mainComponent:GetButton("Button_Confirm_B")

	btnConfirm:SetInteractable(true)
	btnConfirm:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		if heroIndex == -1 then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CHOOSEHERO_EMPTY)

			return false
		end

		local heroList = {}
		local skinList = {}

		if mode == ChooseHeroCtrl.Debug and DebugMonsterAI then
			heroList = MS_HeroData.GetEnableAnimalIdList()
		elseif not DebugAllHeroesInArcade then
			heroList = {
				10007
			}
		else
			heroList = MS_HeroData.GetAllIconHeroListArcade()
		end

		local heroId = heroList[heroIndex]
		local heroData = MS_HeroData.GetHero(heroId)

		if heroData == nil then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CHOOSEHERO_EMPTY)

			return false
		end

		if heroData.Enable <= 0 then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CHOOSEHERO_NOTOPEN)

			return false
		end

		confirmed = true

		if mode == ChooseHeroCtrl.Debug then
			sceneController:ChooseHeroIdConfirm()
		else
			SystemHelper.LogError("[Debug] No restriction on selecting costumes.")

			if DebugAllHeroesInArcade or ChooseHeroCtrl.CheckValid(heroIdCostume) == true then
				UIManager.Close("ChooseHero")
				UIManager.SendMessage("LobbyMain", "SetGameConfigHeroId", heroId)
				UIManager.SendMessage("LobbyMain", "SetGameConfigSkinId", heroSkinId)
				UIManager.SendMessage("LobbyMain", "StartWithGameConfig")
			else
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_CLOTH_LOCK, function()
					return
				end, function()
					return
				end, true)
			end
		end
	end, 0)
	btnConfirm:SetAdjacent(XButton.Adjacent.UP, "HeroSel1")
	UILayerCtrl.AddIndividual(ChooseHeroCtrl.UI_ChooseHero, "Button_Confirm_B", btnConfirm)
	UILayerCtrl.AddIndividual(ChooseHeroCtrl.UI_HeroCostume, "Button_Confirm_B", btnConfirm)

	local btn = this.mainComponent:GetButton("Button_Back_L")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		ChooseHeroCtrl.OnButtonBack()
	end, 0)

	scrollCostumeObj = this.mainComponent:GetGameObject("Scroll_Costume")
	scrollCostumeRect = XScrollRect:new(scrollCostumeObj)
	loaderCostumeList = this.mainComponent:GetLoader("Scroll_Costume_Content")
	costumeContentObj = loaderCostumeList.gameObject

	local selectHeroList = MS_HeroData.GetSelectHeroIdList()

	enemyLoader = this.mainComponent:GetLoader("Panel_Enemy")

	enemyLoader:SetCount(#selectHeroList)
	enemyLoader:Load()

	local enemyGroup = XGroup:new()

	enemyGroup:SetMode(XGroup.GroupMode.Button)

	function enemyLoader.loadCallback(index, com, data)
		local selectBtn = com:GetButton("Button_Select")

		enemyGroup:Add(selectBtn)
		selectBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			selectBtn:SetSelected(true)
			BattleData.SetFriendHeroId(selectHeroList[index])
		end)

		local Image_Hero = com:GetGameObject("Image_Hero")
		local img = XImage:new(Image_Hero)
		local sprite

		if selectHeroList[index] > 10006 then
			sprite = XObjectPool.GetIcon("photo20001")
		else
			sprite = XObjectPool.GetIcon("photo" .. selectHeroList[index])
		end

		if sprite ~= nil then
			img:SetSprite(sprite)
		end
	end

	wait_text = this.mainComponent:GetText("Wait_Text_WaitChoose")

	wait_text:SetContent(0)

	local map1Btn = this.mainComponent:GetButton("Panel_Map_Button_Map1")

	map1Btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		sceneController:ChooseMap(1)
		map1Btn:SetSelected(true)
	end)
	map1Btn:SelectOnStart(true)

	local map2Btn = this.mainComponent:GetButton("Panel_Map_Button_Map2")

	map2Btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		sceneController:ChooseMap(2)
		map2Btn:SetSelected(true)
	end)

	local panelMap = this.mainComponent:GetGameObject("Panel_Map")

	if BattleData.GetType() == BattleData.Type.PVE_Occupy then
		sceneController:ChooseMap(2)
	end

	local skillBtn = this.mainComponent:GetButton("Button_Skill_R")

	skillBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if heroIndex == -1 then
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_LOBBY_CHOOSEHERO_EMPTY)

			return
		end

		local heroId = heroList[heroIndex]

		UIManager.CreateCtrl("SkillView")
		UIManager.SendMessage("SkillView", "UpdateSkillView", heroId)
	end)

	storyText = this.mainComponent:GetText("Panel_Modle_Story_Text")

	storyText:SetGameTextContent(function()
		return GameText.UI_PVE_STORY1
	end)

	local storyTitle = this.mainComponent:GetGameObject("Panel_Modle_Story_Story_Title")
end

function ChooseHeroCtrl.UpdateHeroList(selMode)
	mode = selMode

	local stepLength = ChooseHeroCtrl.StepLength
	local heroList = {}
	local skinList = {}
	local panelR = this.mainComponent:GetGameObject("Panel_Costume_R")

	if panelR ~= nil then
		panelR:SetActive(selMode ~= ChooseHeroCtrl.Debug)
	end

	if selMode == ChooseHeroCtrl.Debug and DebugMonsterAI then
		heroList = MS_HeroData.GetEnableAnimalIdList()
	elseif not DebugAllHeroesInArcade then
		heroList = {
			10007
		}
	else
		heroList = MS_HeroData.GetAllIconHeroListArcade()
	end

	heroListCount = #heroList

	local rectTf = scrollHeroObj:GetComponent("RectTransform")
	local rect = rectTf.rect
	local scrWidth = SystemHelper.GetScreenWidth()

	if SystemHelper.isSubquadrateScrAS() then
		scrWidth = 1334
	else
		local scale = 750 / SystemHelper.GetScreenHeight()

		scrWidth = scrWidth * scale
	end

	heroListRowCount = Mathf.Min(Mathf.Floor(scrWidth / stepLength), heroListCount)
	rectTf.sizeDelta = Vector2.New(stepLength * heroListRowCount, rect.height)
	rectTf = heroContentObj:GetComponent("RectTransform")
	rect = rectTf.rect
	rectTf.sizeDelta = Vector2.New(stepLength * heroListCount, rect.height)

	local group = XGroup:new()

	group:SetMode(XGroup.GroupMode.Button)
	loaderHeroList:SetCount(heroListCount)

	function loaderHeroList.loadCallback(index, com, data)
		local heroId = heroList[index]
		local selectBtn = com:GetButton("Button_Select")

		group:Add(selectBtn)

		local btnTf = com.transform

		selectBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if confirmed then
				return false
			end

			prevHeroIndex = heroIndex
			heroIndex = index

			if UILayerCtrl.GetCurrentLayerName() == ChooseHeroCtrl.UI_HeroCostume then
				UILayerCtrl.Pop()
				UILayerCtrl.OnSelect(string.format("HeroSel%d", index))
			end

			selectBtn:SetSelected(true)

			if prevHeroIndex ~= heroIndex then
				local heroData = MS_HeroData.GetHero(heroId)

				if heroData ~= nil then
					if textHeroName ~= nil then
						textHeroName:SetContent(heroData.Name)
					end

					local textKey = string.format("UI_ARCADE_HERO_INTRO_%d", heroId)
					local introText = GameText[textKey]

					if textHeroIntro ~= nil then
						if introText ~= nil then
							textHeroIntro:SetContent(introText)
						else
							textHeroIntro:SetContent(GameText.UI_COMMON_EMPTY)
						end
					end
				end

				if mode == ChooseHeroCtrl.Debug then
					sceneController:ChooseHeroId(heroId)
				else
					ChooseHeroCtrl.UpdateCostumes(heroId)
				end
			elseif mode == ChooseHeroCtrl.Debug then
				sceneController:ChooseHeroId(heroId)
			else
				UILayerCtrl.Push(ChooseHeroCtrl.UI_HeroCostume, "item" .. heroSkinId + 1)
			end
		end)
		selectBtn:SetParentScroll(scrollHeroRect)

		local Image_Hero = com:GetGameObject("Image_Hero")
		local selectText = com:GetText("Loader_HeroIcon_Button_Select_Text")

		selectText:SetContent(heroId)

		if mode == ChooseHeroCtrl.Debug then
			selectText.gameObject:SetActive(true)
		else
			selectText.gameObject:SetActive(false)
		end

		local img = XImage:new(Image_Hero)
		local sprite = XObjectPool.GetIcon("photo" .. heroId)

		if sprite ~= nil then
			img:SetSprite(sprite)
		end

		if not DebugMonsterAI then
			local isSelect = MS_HeroData.IsSelectHeroIdList(heroId)

			if isSelect then
				-- block empty
			else
				selectBtn:SetDisabled()
			end
		end

		if index == 1 then
			selectBtn:SetAdjacent(XButton.Adjacent.RIGHT, "HeroSel" .. index + 1)
		elseif index == loaderHeroList.loadCount then
			selectBtn:SetAdjacent(XButton.Adjacent.LEFT, "HeroSel" .. index - 1)
		else
			selectBtn:SetAdjacent(XButton.Adjacent.LEFT, "HeroSel" .. index - 1)
			selectBtn:SetAdjacent(XButton.Adjacent.RIGHT, "HeroSel" .. index + 1)
		end

		UILayerCtrl.AddButton("ChooseHero", "HeroSel" .. index, selectBtn)

		scrollHeroRect.scrollRectCom.normalizedPosition = Vector2.New(0, scrollHeroRect.scrollRectCom.normalizedPosition.y)
	end

	loaderHeroList:Load()
end

function ChooseHeroCtrl.CheckValid(id)
	if DebugShowSkin == true then
		return true
	end

	if id % 10000 == 5 then
		for k, v in pairs(SdkHelper.IapInfos) do
			if v.id == "dlcstory1" and v.valid == true then
				return true
			end
		end
	elseif MS_StorySkin.GetDefaultOpen(id) then
		return true
	end

	for k, v in pairs(SdkHelper.IapInfos) do
		if v.id == "hero" .. id and v.valid == true then
			return true
		end
	end

	return false
end

function ChooseHeroCtrl.UpdateCostumes(heroId)
	local skinList = MS_StorySkin.GetSkinListByHero(heroId)

	costumeButtonList = {}
	loaderCostumeList.loadCount = #skinList

	function loaderCostumeList.loadCallback(index, com, data)
		local btn = com:GetButton("Btn")

		btn:SetParentScroll(scrollCostumeRect)

		local name = com:GetText("Btn_WearName")

		name:SetContent(skinList[index].Title)

		btn.lockGO = com:GetGameObject("Btn_LockImg")
		btn.wearGO = com:GetGameObject("Btn_WearImg")
		btn.confirmLight = com:GetGameObject("Btn_Light")

		btn.confirmLight:SetActive(false)

		btn.wearIndex = skinList[index].SkinId % 1000
		btn.heroId = skinList[index].HeroId

		btn.wearGO:SetActive(FS_UserData.story:GetSelectSkin(BattleData.ConvertHeroIdWithoutSkin(btn.heroId)) == btn.wearIndex)

		local keyPrev, keyNext = ChooseHeroCtrl.GetNavBtnIndices(index, loaderCostumeList.loadCount)

		btn:SetAdjacent(XButton.Adjacent.UP, "HeroSel" .. keyPrev)
		btn:SetAdjacent(XButton.Adjacent.DOWN, "HeroSel" .. keyNext)
		UILayerCtrl.AddButton(ChooseHeroCtrl.UI_HeroCostume, "item" .. index, btn)

		if ChooseHeroCtrl.CheckValid(btn.heroId) == false then
			btn.isLock = true

			btn.lockGO:SetActive(true)
			btn.wearGO:SetActive(false)
		else
			btn.isLock = false

			btn.lockGO:SetActive(false)
			btn.wearGO:SetActive(true)
		end

		table.insert(costumeButtonList, btn)

		btn.image = XImage:new(btn.gameObject)

		function btn.setHighLightFunc(ishighLight)
			if ishighLight then
				local sprite = XObjectPool.GetIcon(string.format("wearLight%d", skinList[index].SkinId))

				btn.image:SetSprite(sprite)
			else
				local sprite = XObjectPool.GetIcon(string.format("wear%d", skinList[index].SkinId))

				btn.image:SetSprite(sprite)
			end
		end

		btn.setHighLightFunc(false)
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			heroSkinId = btn.wearIndex
			prevHeroIdCostume = heroIdCostume
			heroIdCostume = btn.heroId

			for k, v in pairs(costumeButtonList) do
				v.setHighLightFunc(false)
			end

			btn.setHighLightFunc(true)

			if prevHeroIdCostume ~= heroIdCostume then
				if btn.heroId then
					AudioCtrl.StopHeroAudio("hero" .. btn.heroId .. "/idle", "")
				end

				if sceneController ~= nil then
					sceneController:ChooseHeroId(btn.heroId)
				end
			end
		end)
		UILayerCtrl.AddButton(ChooseHeroCtrl.UI_HeroCostume, "item" .. index, btn)

		if index == 1 then
			-- block empty
		end

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "item" .. index - 1)
		end

		if index < loaderCostumeList.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "item" .. index + 1)
		end

		if index == loaderCostumeList.loadCount then
			scrollCostumeRect.scrollRectCom.normalizedPosition = Vector2.New(scrollCostumeRect.scrollRectCom.normalizedPosition.x, 1)

			UILayerCtrl.OnSelect("item1")

			this.loadFinish = true

			UILayerCtrl.Push(ChooseHeroCtrl.UI_HeroCostume, "item1")
			UILayerCtrl.OnCursorClickMute()
		end
	end

	loaderCostumeList:Load()
end

function ChooseHeroCtrl.LoadTeammate(team)
	local teamStatus = {}

	for _k, _v in pairs(team) do
		local status = {}

		status.confirmed = _v:isHeroConfirmed()
		status.heroId = _v:choosedHeroId()

		table.insert(teamStatus, status)

		if FS_UserData.playerList:GetUserId() == _v.userId then
			confirmed = status.confirmed

			local btn = this.mainComponent:GetButton("Button_Confirm_B")

			if confirmed and btn:GetState() ~= XButton.State.Highlighted then
				btn:SetHighlighted()
				btn:SetInteractable(false)
				btn:SetText(GameText.UI_CHOOSE_SELECTED)
			end
		end
	end

	for _k, _v in pairs(teamMateTbl) do
		this.UpdateTeammateStatus(_v, teamStatus[_k], teamStatusOld[k])
	end

	teamStatusOld = table.clone(teamStatus)
end

function ChooseHeroCtrl.UpdatePveTeammate()
	local teamStatus = {}
	local status = {}

	status.confirmed = confirmed
	status.heroId = tonumber(BattleData.GetHeroId())

	table.insert(teamStatus, status)

	for _k, _v in pairs(teamMateTbl) do
		this.UpdateTeammateStatus(_v, teamStatus[_k], teamStatusOld[k])
	end

	teamStatusOld = table.clone(teamStatus)
end

function ChooseHeroCtrl.SetWaitTime(timeVal)
	if wait_text == nil or IsNil(wait_text.gameObject) then
		return
	end

	wait_text:SetContent(math.floor(timeVal))
end

function ChooseHeroCtrl.UpdateTeammateStatus(com, status, statusOld)
	if status.confirmed == true and (statusOld == nil or statusOld.confirmed == false) then
		this.PlayConfirmEffect(com)
	end

	local heroId = status.heroId

	if heroId > 0 and (statusOld == nil or heroId ~= statusOld.heroId) then
		this.PlayChooseEffect(com, heroId)
	end
end

function ChooseHeroCtrl.PlayConfirmEffect(com)
	local confirmObj = com:GetGroupByName("confirm")

	confirmObj:SetActive(true)

	local normalGroup = com:GetGroupByName("normal")
	local comps = normalGroup:GetComponentsInChildren(typeof(XTween), true)

	for _k, _v in pairs(comps) do
		_v:Play()
	end
end

function ChooseHeroCtrl.PlayChooseEffect(com, heroId)
	local changeGroup = com:GetGroupByName("change")

	changeGroup:SetActive(true)

	local comps = changeGroup:GetComponentsInChildren(typeof(XTween), true)

	for _k, _v in pairs(comps) do
		_v:Play()
	end

	local Image_Photo = com:GetGameObject("Image_Photo")
	local img = XImage:new(Image_Photo)
	local sprite

	if heroId > 10006 then
		sprite = XObjectPool.GetIcon("photo20001")
	else
		sprite = XObjectPool.GetIcon("photo" .. heroId)
	end

	if sprite ~= nil then
		img:SetSprite(sprite)
	end
end

function ChooseHeroCtrl.OnButtonBack()
	if not loadCompleted then
		return
	end

	if mode == ChooseHeroCtrl.Arcade then
		UILayerCtrl.Pop()
	end

	UILayerCtrl.Pop()
	UIManager.Close("ChooseHero")

	if mode == ChooseHeroCtrl.Arcade then
		UIManager.SendMessage("LobbyMain", "ResumeArcade")
	else
		UIManager.SendMessage("LobbyMain", "ReturnHomepage")
	end
end

function ChooseHeroCtrl.JPadPress(dir)
	if sceneController:GetHeroLoadFinish() == false then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	SystemHelper.Log("ChooseHeroCtrl.JPadPress: " .. dir .. " @" .. lName)

	if lName == ChooseHeroCtrl.UI_ChooseHero then
		if dir == 1 or dir == 2 then
			-- block empty
		elseif dir == 3 or dir == 4 then
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorClick()
		end
	elseif lName == ChooseHeroCtrl.UI_HeroCostume then
		if dir == 1 or dir == 2 then
			UILayerCtrl.Select(dir)
			UILayerCtrl.OnCursorClick()
		else
			UILayerCtrl.Pop()
			ChooseHeroCtrl.JPadPress(dir)
		end
	end
end

function ChooseHeroCtrl.DPadPress(dir)
	SystemHelper.LogError("ChooseHeroCtrl.DPadPress: " .. dir)
	ChooseHeroCtrl.JPadPress(dir)
end

function ChooseHeroCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if (lName == ChooseHeroCtrl.UI_ChooseHero or lName == ChooseHeroCtrl.UI_HeroCostume) and sceneController:GetHero() ~= nil then
		if inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnButtonClick("Button_Confirm_B")
		elseif inputMgr:GetButtonDown(GBKey.B) then
			ChooseHeroCtrl.OnButtonBack()
		end
	end
end

function ChooseHeroCtrl.Update()
	if not loadCompleted and loaderMateList ~= nil and loaderHeroList ~= nil and enemyLoader ~= nil and loaderMateList:IsLoaded() and loaderHeroList:IsLoaded() and enemyLoader:IsLoaded() then
		loadCompleted = true

		UILayerCtrl.Push(ChooseHeroCtrl.UI_ChooseHero, "HeroSel1")
		UILayerCtrl.OnCursorClick()
	end

	if loadCompleted then
		UILayerCtrl.Update()
		this.GamePadControl()
		UILayerCtrl.PostUpdate()
	end
end

return ChooseHeroCtrl
