-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/DebugCtrl.lua

require("GameData/DebugCfg")

local print_r = require("3rd/sproto/print_r")

DebugCtrl = class("DebugCtrl", UICtrlBase)

local this = DebugCtrl

this.uilayer = UICtrlBase.UILayer.Base
DebugCtrl.static.ItemType = {
	FillVal1Btn2 = 6,
	FillVal2Set1 = 5,
	FillVal1 = 2,
	Button = 1,
	FillVal2 = 3,
	FillVal3Set1 = 8,
	FillVal3 = 4,
	FillVal1Btn3 = 7
}
DebugCtrl.static.Panel = {
	Ctrl = 3,
	Count = 2,
	Target = 2,
	Host = 1
}
DebugCtrl.static.CompName = {
	"Debug_Panel1",
	"Debug_Panel2",
	"Debug_Panel3"
}
DebugCtrl.static.gpjsName = {
	T = 3,
	L = 1,
	R = 2
}

local show = false
local uiGo, panel
local dragStart = false
local localPosition = Vector3.zero
local dragPosition = Vector3.zero
local scaleFactor = 1
local Quest, ctrlPanel, menuLoader, menus, gpjsInfo, locationText, showMazeLocationBtn, sceneController, ProfilerGO

function DebugCtrl.OnCreate()
	show = false
	uiGo = GoFind("UIRoot/Element_Debug/Debug")

	local rectTf = uiGo:GetComponent("Canvas")

	scaleFactor = rectTf.scaleFactor
	panel = {}

	DebugCtrl.CreatePanel(DebugCtrl.Panel.Host)
	DebugCtrl.SetPanelType(DebugCtrl.Panel.Host, "Properties")
	DebugCtrl.CreatePanel(DebugCtrl.Panel.Target)
	DebugCtrl.SetPanelType(DebugCtrl.Panel.Target, "Properties")
	DebugCtrl.Show(false, true)
	DebugCtrl.CreatePanel(DebugCtrl.Panel.Ctrl)
	DebugCtrl.ShowPanel(DebugCtrl.Panel.Ctrl, true)

	ctrlPnl = {}
	ctrlPnl.go = this.mainComponent:GetGameObject("Debug_Panel3")
	Quest = {}
	Quest.questListBtn = this.mainComponent:GetButton("Panel3_ForTest_QuestBtn")
	Quest.refreshBtn = this.mainComponent:GetButton("Panel3_ForTest_RefreshBtn")
	Quest.questBg = this.mainComponent:GetGameObject("Panel3_ForTest_QuestListBg")
	Quest.questText = this.mainComponent:GetText("Panel3_ForTest_QuestListBg_viewport_Content")

	Quest.questListBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		Quest.questBg:SetActive(not Quest.questBg.activeSelf)

		if Quest.questBg.activeSelf then
			DebugCtrl.RefreshQuestList()
		end
	end)
	Quest.refreshBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		DebugCtrl.RefreshQuestList()
	end)
	Quest.questListBtn.gameObject:SetActive(false)
	Quest.refreshBtn.gameObject:SetActive(false)

	menuLoader = this.mainComponent:GetLoader("Debug_Panel4_Content")

	menuLoader:PreloadTemplate(function()
		this.loadFinish = true
	end)

	local menuCfg = DebugCfg.Menu
	local itemCnt = table.nums(menuCfg)

	menus = {}
	menus.cfg = {}
	menus.go = this.mainComponent:GetGameObject("Debug_Panel4")
	menus.show = false
	menus.panel = this.mainComponent:GetGameObject("Debug_Panel4_ItemList")
	menus.scrollView = XScrollRect:new(this.mainComponent:GetGameObject("Debug_Panel4_ScrollView"))
	menus.svContent = this.mainComponent:GetGameObject("Debug_Panel4_Content")
	menus.btnMenu = this.mainComponent:GetButton("Debug_Panel4_BtnMenu")

	menus.btnMenu:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		menus.show = not menus.show

		if menus.show == true then
			inputMgr:SetPointerLocked(false)
			inputMgr:SetInMenuMode()

			LS_Setting.ignoreLMB = true
		end

		menus.panel:SetActive(menus.show)
	end, 0)

	local rectTf = menus.svContent:GetComponent("RectTransform")
	local rect = rectTf.rect

	rectTf.sizeDelta = Vector2.New(rect.width, 40 * itemCnt)
	menuLoader.loadCount = itemCnt

	function menuLoader.loadCallback(index, com, data)
		local cfg = menuCfg[index]
		local itemType = data.prefabIndex

		if itemType == DebugCtrl.ItemType.Button then
			local btn = com:GetButton(cfg[3])
			local txt = com:GetText(cfg[4])

			if string.len(cfg[5]) > 0 then
				txt:SetContent(cfg[1] .. " " .. (_G[cfg[5]] and "ON" or "OFF"))
			else
				txt:SetContent(cfg[1])
			end

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				if string.len(cfg[5]) > 0 then
					local value = not _G[cfg[5]]

					_G[cfg[5]] = value

					txt:SetContent(cfg[1] .. " " .. (value and "ON" or "OFF"))
				elseif string.len(cfg[6]) > 0 then
					DebugCtrl[cfg[6]]()
				else
					Uti.log("[ No function!!! ]")
				end
			end)
			btn:SetParentScroll(menus.scrollView)
		elseif itemType >= DebugCtrl.ItemType.FillVal1 and itemType <= DebugCtrl.ItemType.FillVal3 then
			local fllCnt = itemType - 1
			local names = string.split(cfg[1], ";")
			local vars = string.split(cfg[5], ";")

			for idx = 1, fllCnt do
				local btn = com:GetButton(cfg[3] .. idx)
				local btnTxt = com:GetText(cfg[3] .. idx .. "Text")

				btnTxt:SetContent(names[idx])

				local inputField = com:GetGameObject(cfg[4] .. idx):GetComponent("InputField")
				local defaultVal = _G[vars[idx]]

				if defaultVal ~= nil then
					inputField.text = tostring(defaultVal)
				end

				btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					local value = tonumber(inputField.text)

					if type(value) == "number" then
						if string.len(cfg[5]) > 0 then
							_G[vars[idx]] = value

							SystemHelper.Log("Set value " .. vars[idx] .. ": " .. value)
						elseif string.len(cfg[6]) > 0 then
							DebugCtrl[cfg[6]](value)
						else
							Uti.log("[ No function!!! ]")
						end
					else
						SystemHelper.Log("Set value NaN: " .. inputField.text)
					end
				end)
				btn:SetParentScroll(menus.scrollView)
			end
		elseif itemType == DebugCtrl.ItemType.FillVal2Set1 then
			local btnTxt = com:GetText(cfg[3] .. "1Text")

			btnTxt:SetContent(cfg[1])

			local inputFields = {}

			for idx = 1, 2 do
				inputFields[idx] = com:GetGameObject(cfg[4] .. idx):GetComponent("InputField")
			end

			local btn = com:GetButton(cfg[3] .. "1")

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				local itemId = 0
				local itemCnt = 0

				if string.len(inputFields[1].text) > 0 then
					itemId = tonumber(inputFields[1].text)
				end

				if string.len(inputFields[2].text) > 0 then
					itemCnt = tonumber(inputFields[2].text)
				end

				if type(itemId) == "number" and itemId > 0 and type(itemCnt) == "number" and itemCnt > 0 then
					DebugCtrl[cfg[6]](itemId, itemCnt)
				end
			end)
			btn:SetParentScroll(menus.scrollView)
		elseif itemType == DebugCtrl.ItemType.FillVal3Set1 then
			local btnTxt = com:GetText(cfg[3] .. "1Text")

			btnTxt:SetContent(cfg[1])

			local inputFields = {}

			for idx = 1, 3 do
				inputFields[idx] = com:GetGameObject(cfg[4] .. idx):GetComponent("InputField")
			end

			local btn = com:GetButton(cfg[3] .. "1")

			btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				local x = 0
				local y = 0
				local z = 0

				if string.len(inputFields[1].text) > 0 then
					x = tonumber(inputFields[1].text)
				end

				if string.len(inputFields[2].text) > 0 then
					y = tonumber(inputFields[2].text)
				end

				if string.len(inputFields[3].text) > 0 then
					z = tonumber(inputFields[3].text)
				end

				if type(x) == "number" and type(y) == "number" and type(z) == "number" then
					DebugCtrl[cfg[6]](x, y, z)
				end
			end)
			btn:SetParentScroll(menus.scrollView)
		elseif itemType == DebugCtrl.ItemType.FillVal1Btn2 then
			local names = string.split(cfg[1], ";")
			local callbacks = string.split(cfg[6], ";")
			local inputField = com:GetGameObject(cfg[4] .. "1"):GetComponent("InputField")

			for idx = 1, 2 do
				local btn = com:GetButton(cfg[3] .. idx)
				local btnTxt = com:GetText(cfg[3] .. idx .. "Text")

				btnTxt:SetContent(names[idx])
				btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					if string.len(inputField.text) > 0 then
						DebugCtrl[callbacks[idx]](inputField.text)
					end
				end)
				btn:SetParentScroll(menus.scrollView)
			end
		end
	end

	local btnCfg = {}

	for i = 1, itemCnt do
		btnCfg[i] = {
			prefabIndex = menuCfg[i][2]
		}
	end

	menuLoader:LoadIndividuals(btnCfg)

	gpjsInfo = {}

	local gpjsL = {}
	local gpjsR = {}
	local gptLR = {}

	gpjsL.x = 0
	gpjsL.y = 0
	gpjsL.label = this.mainComponent:GetText("Debug_Panel4_LJS")
	gpjsR.x = 0
	gpjsR.y = 0
	gpjsR.label = this.mainComponent:GetText("Debug_Panel4_RJS")
	gptLR.l = 0
	gptLR.r = 0
	gptLR.label = this.mainComponent:GetText("Debug_Panel4_ZCB")
	gpjsInfo[DebugCtrl.gpjsName.L] = gpjsL
	gpjsInfo[DebugCtrl.gpjsName.R] = gpjsR
	gpjsInfo[DebugCtrl.gpjsName.T] = gptLR
	locationText = this.mainComponent:GetText("Panel5_Location")
	showMazeLocationBtn = this.mainComponent:GetButton("Panel5_ShowMazeLocationBtn")
	showMazeLocationBtn.isMazeLocationShow = true

	showMazeLocationBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		showMazeLocationBtn.isMazeLocationShow = not showMazeLocationBtn.isMazeLocationShow
	end)
end

function DebugCtrl.AddMenuItem()
	ctrlPnl.btnAi = this.mainComponent:GetButton("Debug_Panel3_BtnAi")
	ctrlPnl.btnAiText = this.mainComponent:GetText("Debug_Panel3_BtnAi_Text")

	ctrlPnl.btnAi:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		DebugAIOff = not DebugAIOff

		ctrlPnl.btnAiText:SetContent("AI " .. (DebugAIOff and "OFF" or "ON"))
	end)
end

function DebugCtrl.Close()
	if panel then
		for k, v in pairs(panel) do
			v.parent = nil
			v.srcData = nil
			v.dict = nil
			v.data = nil
		end

		panel = nil
		uiGo = nil
	end

	menuLoader:ClearTemplate()
	panelMgr:ClosePanel("Debug")
end

function DebugCtrl.Show(val, forced)
	if uiGo and (show ~= val or forced) then
		sceneController = ST_Main.GetSceneController()
		show = val

		uiGo:SetActive(show)
		DebugCtrl.Reactivate()
	end
end

function DebugCtrl.ShowPanel(panelId, show)
	local thePanel = panel[panelId]

	thePanel.panel.gameObject:SetActive(show)
	thePanel.panel:SetDisabled()
	thePanel.panel:SetNormal()
end

function DebugCtrl.CreatePanel(panelId)
	local thePanel = {}
	local compName = DebugCtrl.CompName[panelId]
	local pnl = this.mainComponent:GetButton(compName)

	thePanel.panel = pnl

	pnl.gameObject:SetActive(false)

	thePanel.parent = pnl.gameObject.transform.parent

	pnl:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if dragStart == false then
			-- block empty
		end
	end, 0)
	pnl:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		local rectTf = pnl.gameObject:GetComponent("RectTransform")
		local localPos = this.GetTouchLocalPosition(rectTf, data)

		localPosition.x = localPos.x
		localPosition.y = localPos.y
	end, 0)
	pnl:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		return
	end, 0)
	pnl:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		dragPosition = this.GetTouchWorldPosition(thePanel.parent, data)

		if dragPosition then
			pnl.gameObject.transform.position = dragPosition - localPosition
		end
	end, 0)

	thePanel.srcData = nil
	thePanel.dict = {}
	thePanel.data = {}
	thePanel.content = this.mainComponent:GetText(compName .. "_Text")

	if thePanel.content then
		thePanel.content:SetContent(GameText.UI_COMMON_EMPTY)
	end

	pnl:SetDisabled()
	pnl:SetNormal()

	local rectTf = pnl.gameObject:GetComponent("RectTransform")
	local rect = rectTf.rect

	thePanel.rectTf = rectTf
	thePanel.width = rect.width
	thePanel.height = rect.height
	thePanel.prevX = 0
	thePanel.prevY = 0
	thePanel.isExtended = true

	local btnExt = this.mainComponent:GetButton(compName .. "_BtnExt")

	if btnExt then
		btnExt.gameObject:SetActive(true)
		btnExt:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			thePanel.isExtended = not thePanel.isExtended

			if thePanel.isExtended then
				thePanel.rectTf.sizeDelta = Vector2.New(thePanel.width, thePanel.height)
				thePanel.panel.gameObject.transform.localPosition = Vector3.New(thePanel.prevX, thePanel.prevY, 0)
			else
				local prevPos = thePanel.panel.gameObject.transform.localPosition

				thePanel.prevX = prevPos.x
				thePanel.prevY = prevPos.y
				thePanel.rectTf.sizeDelta = Vector2.New(thePanel.width, 30)
				thePanel.panel.gameObject.transform.localPosition = Vector3.New(prevPos.x, prevPos.y + 0.5 * thePanel.height - 15, 0)
			end
		end, 0)

		thePanel.btnExt = btnExt

		btnExt:OnDownMute(nil, nil)
		btnExt:OnClick(nil, nil)
	end

	panel[panelId] = thePanel
end

function DebugCtrl.Reactivate()
	if panel then
		for k, v in pairs(panel) do
			v.panel:SetDisabled()
			v.panel:SetNormal()
		end
	end
end

function DebugCtrl.RefreshQuestList()
	local completeList = FS_UserData.story:GetCompleteQuestList()
	local tempTable = {}

	for i, v in pairs(completeList) do
		table.insert(tempTable, i)
	end

	table.sort(tempTable, function(a, b)
		return tonumber(a) < tonumber(b)
	end)

	local st = ""

	for k, v in pairs(tempTable) do
		st = st .. v .. "\n"
	end

	Quest.questText:SetContent(st)
end

function DebugCtrl.SetPanelType(panelId, contentType)
	local thePanel = panel[panelId]

	if thePanel then
		local dict = {}
		local data = {}
		local tDict = DebugCfg.PanelCfg[contentType]
		local tData = DebugCfg.DataCfg[contentType]

		for i, line in pairs(tDict) do
			for k, v in pairs(line) do
				table.insert(dict, v)
			end
		end

		thePanel.dict = dict

		for k, v in pairs(tData) do
			data[k] = v
		end

		thePanel.data = data
	else
		Common.Log("SetContentType: The panel is NULL...")
	end
end

function DebugCtrl.GenerateText(dict, data)
	local text = ""
	local tDict = {}

	for k, v in pairs(dict) do
		tDict[k] = v
	end

	for k, v in pairs(data) do
		for i, it in pairs(tDict) do
			if k == it then
				tDict[i] = v

				break
			end
		end
	end

	text = table.concat(tDict)

	return text
end

function DebugCtrl.SetPanelTarget(panelId, animalBase)
	local thePanel = panel[panelId]

	if thePanel then
		if thePanel.srcData ~= nil and animalBase == nil then
			this.ShowPanel(panelId, false)
		elseif thePanel.srcData == nil and animalBase ~= nil then
			this.ShowPanel(panelId, true)
		end

		if thePanel.srcData ~= animalBase then
			thePanel.srcData = animalBase

			thePanel.content:SetContent(DebugCtrl.GenerateText(thePanel.dict, thePanel.data))

			panel[panelId] = thePanel

			thePanel.btnExt:OnClick(nil, nil)
		end
	else
		Common.Log("SetPanelTarget: The panel is NULL...")
	end
end

function DebugCtrl.UpdatePanel(panelId)
	if panel then
		local thePanel = panel[panelId]

		if thePanel then
			local data = thePanel.data
			local animalBase = thePanel.srcData

			if animalBase ~= nil then
				data.unitname = animalBase:GetName()
				data.unitid = animalBase:GetHeroId()
				data.hp = animalBase:GetValue():GetProperty(MS_HeroData.Property.Hp)
				data.hpmax = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)
				data.sp = animalBase:GetValue():GetProperty(MS_HeroData.Property.Energy)
				data.spmax = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.Energy)
				data.tghns = animalBase:GetValue():GetProperty(MS_HeroData.Property.Toughness)
				data.tghnsmax = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.Toughness)
				data.power = animalBase:GetValue():GetProperty(MS_HeroData.Property.Power)
				data.powermax = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.Power)
				data.san = animalBase:GetValue():GetProperty(MS_HeroData.Property.San)
				data.weak = Mathf.Floor(animalBase:GetValue():GetProperty(MS_HeroData.Property.Weakness))
				data.weakr = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.WeaknessRecovery)
				data.crirate = animalBase:GetValue():GetProperty(MS_HeroData.Property.CritRate)
				data.cridmg = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.CritDamage)
				data.atk = animalBase:GetValue():GetProperty(MS_HeroData.Property.PhysicDamage)
				data.def = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.PhysicResist)
				data.con = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.Resist)
				data.drprate = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.DropBonus)
				data.anim = animalBase.animatorStateName
				data.frame = animalBase.animatorTime
				data.curve = ""
				data.curve = data.curve .. "skillRot:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.SkillRot) .. "\n"
				data.curve = data.curve .. "trigger:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.Trigger) .. "\n"
				data.curve = data.curve .. "skillComboStart:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.SkillComboStart) .. "\n"
				data.curve = data.curve .. "skillExit:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) .. "\n"
				data.curve = data.curve .. "runExit:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit) .. "\n"
				data.curve = data.curve .. "skillToughness:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.SkillToughness) .. "\n"
				data.curve = data.curve .. "skillCounterAttack:" .. animalBase:GetAnimatorParam(AnimalBase_Define.ParamType.SkillCounterAttack) .. "\n"
				data.gameloop = FS_UserData.story:GetLoop()
				data.status = "\n"

				local statusList = animalBase.statusList

				if statusList then
					for statusId, status in pairs(statusList) do
						local percent = 0
						local nowTime = TimeHelper.getNowTime()
						local proceeded = Mathf.Round(nowTime - status.statusActiveTime)
						local timeRemaining = status.statusLifeTime - proceeded

						if status:IsActive() == true then
							if status.statusLifeTime > 0 then
								percent = 1 - Mathf.Clamp(proceeded / status.statusLifeTime, 0, 1)
							else
								percent = 1
							end
						else
							percent = Mathf.Clamp(status.statusStack / 100, 0, 1)
						end

						percent = Mathf.Round(percent * 100)
						data.status = data.status .. status.statusId .. " - " .. percent .. "% - " .. timeRemaining .. "/" .. status.statusLifeTime .. "\n"
					end
				end

				data.rage = animalBase:GetValue():GetProperty(MS_HeroData.Property.Rage)
				data.ragemax = animalBase:GetValue():GetPropertyMax(MS_HeroData.Property.Rage)
				thePanel.data = data

				thePanel.content:SetContent(DebugCtrl.GenerateText(thePanel.dict, thePanel.data))
			else
				this.ShowPanel(panelId, false)
			end
		else
			Common.Log("UpdatePanel: The panel is NULL...")
		end
	end
end

function DebugCtrl.GetTouchWorldPosition(pTf, eventData)
	local worldPosition
	local ret, worldPosition = RectTransformUtility.ScreenPointToWorldPointInRectangle(pTf, eventData.position, eventData.pressEventCamera, worldPosition)

	if ret then
		return worldPosition
	end

	return nil
end

function DebugCtrl.GetTouchLocalPosition(pTf, eventData)
	local localPosition
	local ret, localPosition = RectTransformUtility.ScreenPointToLocalPointInRectangle(pTf, eventData.position, eventData.pressEventCamera, localPosition)

	if ret then
		return localPosition
	end

	return nil
end

function DebugCtrl.Update()
	if show then
		local count = DebugCtrl.Panel.Count

		for i = 1, count do
			DebugCtrl.UpdatePanel(i)
		end

		DebugCtrl.UpdateJoystickRaw()
		DebugCtrl.UpdateLocation()
	end
end

function DebugCtrl.AddGradeForTarget()
	local thePanel = panel[DebugCtrl.Panel.Target]

	if thePanel then
		local srcData = thePanel.srcData

		if srcData then
			srcData:AddGrade(false)
		else
			SystemHelper.Log("Target unabailable.")
		end
	end
end

function DebugCtrl.ResetGradeForTarget()
	local thePanel = panel[DebugCtrl.Panel.Target]

	if thePanel then
		local srcData = thePanel.srcData

		if srcData then
			srcData:ResetGrade()
		else
			SystemHelper.Log("Target unabailable.")
		end
	end
end

function DebugCtrl.OnAddAllItem(type)
	local sceneController = ST_Main.GetSceneController()
	local ttype = tonumber(type)
	local idList = MS_ItemData.GetAllItemId(ttype)

	for k, v in pairs(idList) do
		sceneController:GetGameController():AddBagItem(v, 1000, true)
	end
end

function DebugCtrl.OnAddItem(itemId, itemCount)
	local sceneController = ST_Main.GetSceneController()
	local itemTestData = MS_ItemData.GetItemData(itemId)

	if itemTestData then
		if itemTestData.MainType == MS_ItemData.MainType.Trophy then
			sceneController:GetGameController():AddBagItem(itemId, 1, false)
		elseif itemId and itemCount then
			sceneController:GetGameController():AddBagItem(itemId, itemCount, false)

			if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and (itemTestData.MainType == MS_ItemData.MainType.Consume or itemTestData.MainType == MS_ItemData.MainType.Attack) then
				local quickIndex = sceneController:GetGameController():GetQuickListEmptyIndex(itemId)

				if quickIndex ~= -1 then
					sceneController:GetGameController():SetArcadeQuickItemIndex(itemTestData, itemId, quickIndex)
				end
			end
		end
	end
end

function DebugCtrl.OnAddTalent(talentId)
	local sceneController = ST_Main.GetSceneController()
	local p_data = {}

	p_data.talentId = tonumber(talentId)
	p_data.level = 1

	FS_UserData.heroList:GetHero(sceneController:GetHostPlayerHeroId()):ParseTalent(p_data)
end

function DebugCtrl.OnMinTalent(talentId)
	local sceneController = ST_Main.GetSceneController()
	local p_data = {}

	p_data.talentId = tonumber(talentId)
	p_data.level = -1

	FS_UserData.heroList:GetHero(sceneController:GetHostPlayerHeroId()):ParseTalent(p_data)
end

function DebugCtrl.OnCompleteQuest(questStr)
	if MS_StoryQuest.GetQuestData(questStr) ~= nil then
		local sceneController = ST_Main.GetSceneController()

		sceneController:GetGameController():CompleteQuest(questStr)
		DebugCtrl.RefreshQuestList()
	else
		SystemHelper.LogError("No Quest !!!")
	end
end

function DebugCtrl.OnCompleteQuestAndClear(questStr)
	if MS_StoryQuest.GetQuestData(questStr) ~= nil then
		local sceneController = ST_Main.GetSceneController()

		sceneController:GetGameController():CompleteQuest(questStr)
		DebugCtrl.RefreshQuestList()
		DebugCtrl.Show(false, true)
	else
		SystemHelper.LogError("No Quest !!!")
	end
end

function DebugCtrl.OnStartDialog(dialogId)
	local sceneController = ST_Main.GetSceneController()

	sceneController:GetGameController().dialogIdNow = dialogId
	DebugCtrl.curId = dialogId

	sceneController:GetGameController():SwitchToDialog()
end

function DebugCtrl.OnRevertQuest(questStr)
	if MS_StoryQuest.GetQuestData(questStr) ~= nil then
		local sceneController = ST_Main.GetSceneController()

		sceneController:GetGameController():RevertCompleteQuest(questStr)
		DebugCtrl.RefreshQuestList()
	else
		SystemHelper.LogError("No Quest !!!")
	end
end

function DebugCtrl.OnShowQuest()
	Quest.questBg:SetActive(not Quest.questBg.activeSelf)

	if Quest.questBg.activeSelf then
		DebugCtrl.RefreshQuestList()
	end
end

function DebugCtrl.OnRefreshQuest()
	DebugCtrl.RefreshQuestList()
end

function DebugCtrl.SetJoystickRaw(idx, x, y)
	if gpjsInfo and gpjsInfo[idx] then
		local gpjs = gpjsInfo[idx]

		if x ~= nil then
			gpjs.x = x
		end

		if y ~= nil then
			gpjs.y = y
		end
	end
end

function DebugCtrl.UpdateJoystickRaw()
	if gpjsInfo then
		local gpjsL = gpjsInfo[DebugCtrl.gpjsName.L]

		if gpjsL and gpjsL.label then
			gpjsL.label:SetContent(string.format("(%6.2f, %6.2f)", gpjsL.x, gpjsL.y))
		end

		local gpjsR = gpjsInfo[DebugCtrl.gpjsName.R]

		if gpjsR and gpjsR.label then
			gpjsR.label:SetContent(string.format("(%6.2f, %6.2f)", gpjsR.x, gpjsR.y))
		end
	end
end

function DebugCtrl.UpdateLocation()
	if sceneController ~= nil then
		if showMazeLocationBtn.isMazeLocationShow == false then
			locationText:SetContent("")

			return
		end

		local txt = ""
		local gController = sceneController:GetGameController()

		if gController ~= nil and gController.scene ~= nil and gController.scene.sceneName ~= nil then
			txt = gController.scene.sceneName
		end

		local hero = sceneController:GetHostPlayer()

		txt = txt .. ":\n" .. "x:" .. MathHelper.ToFloatCut(hero:GetPosByWorldPos().x) .. " y:" .. MathHelper.ToFloatCut(hero:GetPosByWorldPos().y) .. " z:" .. MathHelper.ToFloatCut(hero:GetPosByWorldPos().z)

		if DLC_Maze then
			txt = txt .. "\n"

			local t = FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Statue]

			txt = txt .. t[1] .. "-" .. t[2] .. "-" .. t[3] .. "\nx:" .. MathHelper.ToFloatCut(t[4].x) .. " y:" .. MathHelper.ToFloatCut(t[4].y) .. " z:" .. MathHelper.ToFloatCut(t[4].z) .. "\n"
			t = FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Fountain]
			txt = txt .. t[1] .. "-" .. t[2] .. "-" .. t[3] .. "\nx:" .. MathHelper.ToFloatCut(t[4].x) .. " y:" .. MathHelper.ToFloatCut(t[4].y) .. " z:" .. MathHelper.ToFloatCut(t[4].z) .. "\n"
			t = FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Honeypot]
			txt = txt .. t[1] .. "-" .. t[2] .. "-" .. t[3] .. "\nx:" .. MathHelper.ToFloatCut(t[4].x) .. " y:" .. MathHelper.ToFloatCut(t[4].y) .. " z:" .. MathHelper.ToFloatCut(t[4].z) .. "\n"
			t = FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Crate]
			txt = txt .. t[1] .. "-" .. t[2] .. "-" .. t[3] .. "\nx:" .. MathHelper.ToFloatCut(t[4].x) .. " y:" .. MathHelper.ToFloatCut(t[4].y) .. " z:" .. MathHelper.ToFloatCut(t[4].z) .. "\n"
		end

		if hero and txt then
			locationText:SetContent(txt)
		end
	end
end

function DebugCtrl.OnTransport(x, y, z)
	if sceneController ~= nil then
		local hero = sceneController:GetHostPlayer()

		hero:SetPosByWorldPos(Vector3.New(x, y + 1, z), true)
	end
end

function DebugCtrl.OnMazeStatueNext()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		local scene = sceneController:GetScene()

		if scene ~= nil then
			scene:DebugMazeStatueNext()
		end
	end
end

function DebugCtrl.OnMazeFountainNext()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		local scene = sceneController:GetScene()

		if scene ~= nil then
			scene:DebugMazeFountainNext()
		end
	end
end

function DebugCtrl.OnMazeHoneypotNext()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		local scene = sceneController:GetScene()

		if scene ~= nil then
			scene:DebugMazeHoneypotNext()
		end
	end
end

function DebugCtrl.OnMazeCrateNext()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		local scene = sceneController:GetScene()

		if scene ~= nil then
			scene:DebugMazeCrateNext()
		end
	end
end

function DebugCtrl.OnDebugMazeFloorNext()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		FS_UserData.story:NextMazeFloor()

		local mazeFloor = FS_UserData.story:GetMazeFloor()

		if MS_StoryList.IsStoryMaze(FS_UserData.story:GetStoryId()) == true then
			mazeFloor = mazeFloor - 1
		end

		UIManager.SendMessage("Mainmenu", "SetMazeBossStep", mazeFloor)
	end
end

function DebugCtrl.OnDebugMazeFloorPrev()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		FS_UserData.story:PrevMazeFloor()

		local mazeFloor = FS_UserData.story:GetMazeFloor()

		if MS_StoryList.IsStoryMaze(FS_UserData.story:GetStoryId()) == true then
			mazeFloor = mazeFloor - 1
		end

		UIManager.SendMessage("Mainmenu", "SetMazeBossStep", mazeFloor)
	end
end

function DebugCtrl.OpenProfilerWindow()
	if ProfilerGO then
		GoDestroyImmediate(ProfilerGO)

		ProfilerGO = nil
	else
		ProfilerGO = GoCreate("ProfilerGO")

		ProfilerGO:AddComponent(typeof(RunTimeDebugWindow))
	end
end

function DebugCtrl.OnDebugRefreshArea()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and sceneController ~= nil then
		local gameController = sceneController:GetGameController()

		if gameController ~= nil then
			gameController:DebugRefreshArea()
		end
	end
end

return DebugCtrl
