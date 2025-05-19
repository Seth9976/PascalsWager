-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/HeadInfoCtrl.lua

HeadInfoCtrl = class("HeadInfoCtrl", UICtrlBase)

local this = HeadInfoCtrl

this.uilayer = UICtrlBase.UILayer.Base
HeadInfoCtrl.static.Team = {
	Enemy = 2,
	Friend = 1
}
HeadInfoCtrl.static.BarType = {
	Building = 3,
	Friend = 1,
	Enemy = 4,
	NPC = 2
}

local headLoader
local isWorldSpace = false
local scaler = 1
local factor = 1
local headList = {}
local sceneController, camera, tfCamera
local screenWidth = 0
local screenHeight = 0
local canvas, uiCamera, parentRect
local maxVisiableRadius = 30
local refBarValue = 100
local maxBarValue = 2000
local updatePosByMode, displayArea, screenRect
local cameraPos = Vector3.zero
local cameraFwd = Vector3.zero

HeadInfoCtrl.static.Sign = {
	MaxCount = 2,
	Blank = 0,
	ExclamationBlue = 2,
	ExclamationRed = 1
}

function HeadInfoCtrl.OnCreate()
	sceneController = ST_Main.GetSceneController()
	canvas = this.transform:GetComponent("Canvas")
	camera = sceneController:GetCamera()
	tfCamera = camera.transform
	screenWidth = SystemHelper.GetScreenWidth()
	screenHeight = SystemHelper.GetScreenHeight()

	if isWorldSpace then
		canvas.worldCamera = CameraMain.camera
		scaler = 0.0025
	else
		uiCamera = canvas.worldCamera
		scaler = 0.618
	end

	displayArea = this.mainComponent:GetGameObject("DisplayArea")
	screenRect = displayArea.transform.parent.rect
	headList = {}
	headLoader = this.mainComponent:GetLoader("Loader_Info")
	headLoader.clearContentOnLoad = false

	headLoader:PreloadTemplate(function()
		this.loadFinish = true
	end)

	function headLoader.loadCallback(index, com, data)
		this.OnLoadHeadFinish(com, data)
	end

	if isWorldSpace then
		this.ChangeLayer()
	end
end

function HeadInfoCtrl.RemoveInfo(index)
	if headLoader == nil then
		return
	end

	local com = headList[index]

	if com then
		headLoader:RemoveChild(com)
		GoDestroy(com.transform.gameObject)

		headList[index] = nil
	end
end

function HeadInfoCtrl.CreateInfo(index, heroId, teamId)
	local prefabIndex = 1

	if teamId == HeadInfoCtrl.Team.Enemy then
		prefabIndex = HeadInfoCtrl.BarType.Enemy
	end

	headLoader:Load({
		prefabIndex = 1,
		index = index,
		heroId = heroId,
		type = teamId
	})
end

function HeadInfoCtrl.OnLoadHeadFinish(com, data)
	local isFriend = sceneController:IsFriend(data.index)

	if not isFriend then
		factor = 0.8
	end

	com.extension.index = data.index
	com.extension.heroId = data.heroId
	com.extension.type = data.teamId
	com.gameObject.transform.localScale = Vector3.one * scaler

	if not isWorldSpace then
		parentRect = com.transform.parent:GetComponent("RectTransform")
	end

	com.extension.headBar = com:GetGameObject("HeadBar")
	com.extension.showHeadBar = true
	com.extension.visiable = true
	com.extension.isFriend = isFriend
	com.extension.panelBar = com:GetGameObject("Panel_Bar")

	local barToughness = XImage:new(com:GetGameObject("Image_Armor"))

	com.extension.showToughness = false
	com.extension.toughnessInt = 0
	com.extension.toughnessBar = barToughness

	com.extension.toughnessBar:SetFillAmount(0)

	com.extension.bar1 = com:GetGameObject("Image_Bar1")
	com.extension.bar2 = com:GetGameObject("Image_Bar2")
	com.extension.bar3 = com:GetGameObject("Image_Bar3")

	com.extension.bar1:SetActive(false)

	if isFriend then
		local barObj = com.extension.bar1

		com.extension.hpBarImg = XImage:new(barObj)

		com.extension.hpBarImg.gameObject:SetActive(true)
	else
		local barObj = com.extension.bar2

		com.extension.hpBarImg = XImage:new(barObj)

		com.extension.hpBarImg.gameObject:SetActive(true)
	end

	local barEasingImg = XImage:new(com:GetGameObject("Image_Easing"))
	local tween = Tween:new(barEasingImg.image)

	tween:SetAutoKill(false)
	tween:OnComplete(function()
		com.extension.inTween = false
		com.extension.twDelta = 0

		com.extension.yellowBar:SetFillAmount(com.extension.latest)
	end)

	com.extension.tween = tween
	com.extension.inTween = false
	com.extension.twDelta = 0
	com.extension.latest = 0
	com.extension.yellowBar = barEasingImg
	com.extension.allowHpTween = true
	com.extension.hpWarn = com:GetGameObject("Image_HpWarning")
	com.extension.showHpWarn = false
	com.extension.xtnHpWarn = com.extension.hpWarn:GetComponent("XTween")

	local tStatusIcon = com:GetGameObject("StatusIcon")

	com.extension.tStatusIcon = tStatusIcon
	com.extension.statusSp = {}
	com.extension.statusQueue = {}
	com.extension.statusIcon = {}
	com.extension.showStatusBar = false
	com.extension.statusBar = com:GetGameObject("StatusBar")

	if com.extension.statusBar then
		com.extension.showStatusBar = true

		com.extension.statusBar:SetActive(com.extension.showStatusBar)
	end

	com.extension.energyBarImg = XImage:new(com:GetGameObject("Image_Energy"))
	com.extension.energyWarn = com:GetGameObject("Image_EnergyWarning")
	com.extension.energyWarnTween = com.extension.energyWarn:GetComponent("XTween")
	com.extension.showEnergyWarn = false

	com.extension.energyBarImg.gameObject:SetActive(false)
	com.extension.energyWarn:SetActive(false)

	com.extension.focus = com:GetGameObject("Panel_Focus")

	com.extension.focus:SetActive(false)

	com.extension.bracketL = XImage:new(TfFindChild(com.extension.focus.transform, "Image_Focus1"))
	com.extension.bracketR = XImage:new(TfFindChild(com.extension.focus.transform, "Image_Focus2"))
	com.extension.canvasGroup = com.extension.headBar.transform:GetComponent("CanvasGroup")

	local fadingTween = Tween:new(com.extension.canvasGroup)

	fadingTween:Delay(2)
	fadingTween:MoveTo({
		alpha = 0
	}, 0.3)
	fadingTween:SetAutoKill(false)
	fadingTween:OnStart(function()
		HeadInfoCtrl.OnFadingStart(com)
	end)
	fadingTween:OnComplete(function()
		HeadInfoCtrl.OnFadingComplete(com)
	end)

	com.extension.fadingTween = fadingTween
	com.extension.isInFading = false
	com.extension.isInVisualRange = true
	com.extension.isInitialized = false
	com.extension.isActive = false
	com.extension.setLocked = false
	com.extension.isLocked = false
	com.extension.isHide = false
	com.extension.isBoss = false
	com.extension.showBar = false
	com.extension.showLoc = false
	com.extension.showName = false
	com.extension.textCom = com:GetText("Name")
	com.extension.hpValInt = 0
	com.extension.enValInt = 0
	com.extension.hpShld = 0
	com.extension.hpShldBase = 0

	local barHpShield = XImage:new(com:GetGameObject("Image_Shield"))

	com.extension.barHpShield = barHpShield
	com.extension.hpShieldTween = Tween:new(barHpShield.image)

	com.extension.hpShieldTween:SetAutoKill(false)
	com.extension.hpShieldTween:OnStart(function()
		com.extension.allowHpTween = false
		com.extension.isInHpShieldTween = true
	end)
	com.extension.hpShieldTween:OnComplete(function()
		com.extension.isInHpShieldTween = false
		com.extension.allowHpTween = true
	end)

	com.extension.isInHpShieldTween = false
	com.extension.numScale = 1
	com.extension.maxHpValue = refBarValue
	com.extension.readyToShow = false
	com.extension.isWasted = false
	com.extension.distance = 10000
	com.extension.realPosition = Vector3.zero

	table.insert(headList, data.index, com)
	this.SetName(data.index, function()
		return GameText.UI_COMMON_USERNAME_DEFAULT .. data.index
	end, isFriend, true)
	this.SetBlackFence(data.index, isFriend)
	this.ShowHPWarning(data.index, false)
	this.ShowEnergyWarning(data.index, false)

	if DebugShowHostHeader then
		HeadInfoCtrl.ShowHeader(data.index, false)
	end
end

function HeadInfoCtrl.SetMaxVisiableRadius(value)
	if value >= 0 then
		maxVisiableRadius = value
	end
end

function HeadInfoCtrl.SetAlwaysHide(index)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if not ext.isHide then
		ext.isHide = true
		ext.isActive = false
		ext.isInFading = false

		com.gameObject:SetActive(false)
	end

	ext.isBoss = true

	if ext.isBoss then
		ext.showName = false

		ext.textCom.gameObject:SetActive(false)
	end

	local bar = com:GetGameObject("Image_Bar2")

	bar:SetActive(false)

	local bg = com:GetGameObject("Panel_Bg")

	bg:SetActive(false)

	local tfFocus = com:GetGameObject("Panel_Focus").transform
	local pos = tfFocus.localPosition

	pos.y = pos.y + 22
	tfFocus.localPosition = pos
end

function HeadInfoCtrl.ShowHeader(index, show)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	ext.isActive = show
	ext.isBoss = show

	com.gameObject:SetActive(show)
	com.gameObject.transform:SetAsLastSibling()
end

function HeadInfoCtrl.SetInViewFinder(index, flag)
	return
end

function HeadInfoCtrl.OnFadingStart(com)
	return
end

function HeadInfoCtrl.OnFadingComplete(com)
	local ext = com.extension

	ext.isInFading = false

	if ext.showHeadBar then
		ext.showHeadBar = false

		ext.headBar:SetActive(false)
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Guard) and ext.showName then
		ext.showName = false

		ext.textCom.gameObject:SetActive(false)
	end

	if ext.isBoss then
		ext.showName = false

		ext.textCom.gameObject:SetActive(false)
	end
end

function HeadInfoCtrl.SetFocusActive(focus, show, index)
	if focus then
		focus:SetActive(show)
	end
end

function HeadInfoCtrl.SetFocusColor(index, r, g, b, a)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isHide or ext.isBoss then
		UIManager.SendMessage("Mainmenu", "SetFocusColor", r, g, b, a)
	else
		if ext.bracketL then
			ext.bracketL:SetColor(r, g, b, a)
		end

		if ext.bracketR then
			ext.bracketR:SetColor(r, g, b, a)
		end
	end
end

function HeadInfoCtrl.Show(index, flag)
	local com = headList[index]

	if com == nil then
		return
	end

	if flag then
		com.extension.readyToShow = flag
	else
		local ext = com.extension

		ext.isActive = flag

		this.SetFocusActive(ext.focus, flag, index)

		ext.showHeadBar = flag

		ext.headBar:SetActive(flag)
		com.gameObject:SetActive(flag)
	end
end

function HeadInfoCtrl.SetDead(index)
	this.Show(index, false)
	this.ShowHPWarning(index, false)
end

function HeadInfoCtrl.Reborn(index)
	this.Show(index, true)
end

function HeadInfoCtrl.SetBlackFence(index, isFriend)
	return
end

function HeadInfoCtrl.ShowBarScale(index, isEnabled)
	return
end

function HeadInfoCtrl.SetRefBarValue(value)
	if value > 0 then
		refBarValue = value
	end
end

function HeadInfoCtrl.SetMaxBarValue(value)
	if value > 0 then
		maxBarValue = value
	end
end

function HeadInfoCtrl.SetHpBarScale(index, maxValue)
	local com = headList[index]

	if com == nil then
		return
	end

	if com.extension.isHide and not ext.isBoss then
		return
	end

	if maxValue ~= com.extension.maxHpValue then
		com.extension.maxHpValue = maxValue
		maxValue = maxValue > maxBarValue and maxBarValue or maxValue

		local currentScale = maxValue / refBarValue

		com.extension.numScale = currentScale
	end
end

function HeadInfoCtrl.SetName(index, name, isFriend, isElite)
	local com = headList[index]

	if com == nil then
		return
	end

	com.extension.isElite = isElite

	local textCom = com.extension.textCom

	if textCom ~= nil then
		textCom:SetGameTextContent(name)

		if not isFriend then
			if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) then
				textCom:SetColor(0.8745098039215686, 0.43137254901960786, 0.4235294117647059, 1)
			elseif BattleData.IsBattleMode(BattleData.Type.PVE_Guard) or BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
				if not isElite then
					textCom:SetColor(1, 1, 1, 1)
				end
			elseif BattleData.IsBattleMode(BattleData.Type.PVE_Custom) then
				textCom:SetColor(0.8745098039215686, 0.43137254901960786, 0.4235294117647059, 1)
			end
		end
	end
end

function HeadInfoCtrl.GetStatusIcon(index, sid)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext then
		if ext.statusIcon[sid] then
			local statusIcon = ext.statusIcon[sid]

			return ext.statusIcon[sid]
		else
			local statusData = MS_StatusData.GetStatusData(sid)
			local statusGo = GoInstantiate(ext.tStatusIcon)

			if statusData and statusGo then
				local tfStatusIcon = statusGo.transform
				local statusIcon = {}
				local iconName = "main_status_" .. statusData.Icon
				local iconNameS = iconName .. "_x"

				statusIcon.statusId = sid
				statusIcon.iconName = statusData.Icon
				statusIcon.show = false
				statusIcon.com = statusGo

				statusIcon.com:SetActive(false)
				tfStatusIcon:SetParent(com.extension.statusBar.transform)

				tfStatusIcon.localPosition = Vector3.zero
				tfStatusIcon.localScale = Vector3.one

				local icon = TfFindChild(tfStatusIcon, "HostStatus").gameObject

				statusIcon.icon = icon

				statusIcon.icon:SetActive(false)

				statusIcon.stepping = XImage:new(icon)

				local spriteStepping = XObjectPool.GetIcon(iconNameS)

				statusIcon.stepping:SetSprite(spriteStepping)
				statusIcon.stepping:SetFillAmount(1)

				statusIcon.stepInt = 0
				statusIcon.threshold = 3

				local iconP = TfFindChild(tfStatusIcon, "HostStatus/HostStatusIcon").gameObject

				statusIcon.iconP = iconP
				statusIcon.progress = XImage:new(iconP)

				local spriteProgress = XObjectPool.GetIcon(iconName)

				statusIcon.progress:SetSprite(spriteProgress)
				statusIcon.progress:SetFillAmount(0)

				statusIcon.valueInt = 0
				statusIcon.param = 0
				ext.statusIcon[sid] = statusIcon

				return ext.statusIcon[sid]
			end
		end
	end
end

function HeadInfoCtrl.SetStatusEnabled(index, statusId, percent, isActive, param)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isBoss then
		UIManager.SendMessage("Mainmenu", "SetBossStatusEnabled", index, statusId, percent, param)

		return
	end

	local statusIcon = this.GetStatusIcon(index, statusId)

	if statusIcon then
		if not statusIcon.show then
			statusIcon.show = true

			if statusId > 90000 then
				table.insert(ext.statusSp, statusId)
			end

			if statusIcon.com then
				statusIcon.com.gameObject:SetActive(true)
			end

			if statusIcon.icon then
				statusIcon.icon:SetActive(true)
			end
		end

		local statusSpCount = #ext.statusSp

		if statusSpCount > 0 then
			local statusSp = ext.statusSp

			for i = 1, statusSpCount do
				local spIcon = this.GetStatusIcon(index, statusSp[i])
				local tfBtn = spIcon.com.transform

				tfBtn:SetSiblingIndex(100 + i)
			end
		end

		if statusIcon.show then
			local stepRef = not isActive and 1 or 0
			local currentValue = Mathf.Round(100 * percent)

			if param == nil or param ~= nil and param < 0 then
				param = 0
			end

			if statusIcon.param ~= param then
				statusIcon.param = param

				local iconName = string.format("main_status_%d", param + statusIcon.iconName)
				local iconNameS = string.format("%s_x", iconName)

				SystemHelper.Log(string.format("****image: %s - %s", iconName, iconNameS))

				local spriteStepping = XObjectPool.GetIcon(iconNameS)

				statusIcon.stepping:SetSprite(spriteStepping)
				statusIcon.stepping:SetFillAmount(1)

				local spriteProgress = XObjectPool.GetIcon(iconName)

				statusIcon.progress:SetSprite(spriteProgress)
				statusIcon.progress:SetFillAmount(1)
			end

			if statusIcon.valueInt ~= currentValue and statusIcon.progress then
				statusIcon.valueInt = currentValue

				local transValue = 0.2 + percent * 0.6

				if percent > 0.98 then
					transValue = transValue + 0.2
				end

				statusIcon.progress:SetFillAmount(percent)
			end
		end
	end
end

function HeadInfoCtrl.SetStatusDisabled(index, statusId)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isBoss then
		UIManager.SendMessage("Mainmenu", "SetBossStatusDisabled", index, statusId)

		return
	end

	local statusIcon = com.extension.statusIcon[statusId]

	if statusIcon and not ext.isBoss then
		if statusId > 90000 then
			local statusSpCount = #ext.statusSp

			if statusSpCount > 0 then
				local statusSp = ext.statusSp

				for i = statusSpCount, 1, -1 do
					local spId = statusSp[i]

					if spId == statusId then
						table.remove(statusSp, i)

						break
					end
				end
			end
		end

		statusIcon.show = false

		statusIcon.icon:SetActive(false)
		statusIcon.stepping:SetFillAmount(1)
		statusIcon.progress:SetFillAmount(0)

		statusIcon.valueInt = 0
	end
end

function HeadInfoCtrl.ShowToughness(index, show)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isHide or ext.isBoss then
		UIManager.SendMessage("Mainmenu", "ShowToughness", show)
	elseif ext.showToughness ~= show then
		ext.showToughness = show

		if not show then
			ext.toughnessInt = 0

			ext.toughnessBar:SetFillAmount(0)
		end
	end
end

function HeadInfoCtrl.SetToughness(index, percent)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isHide or ext.isBoss then
		UIManager.SendMessage("Mainmenu", "SetToughness", percent)
	else
		local currentValue = Mathf.Round(100 * percent)

		if ext.toughnessInt ~= currentValue then
			ext.toughnessInt = currentValue

			ext.toughnessBar:SetFillAmount(percent)
		end
	end
end

function HeadInfoCtrl.SetShield(shldValue, baseValue)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension
	local doRefresh = false

	if shldValue then
		shldValue = Mathf.Floor(shldValue)

		if shldValue ~= ext.hpShld then
			doRefresh = true
			ext.hpShld = shldValue
		end
	else
		shldValue = ext.hpShld
	end

	if baseValue then
		baseValue = Mathf.Floor(baseValue)

		if baseValue ~= ext.hpShldBase then
			doRefresh = true
			ext.hpShldBase = baseValue
		end
	else
		baseValue = ext.hpShldBase
	end

	if doRefresh then
		local percent = Mathf.Clamp(shldValue / baseValue, 0, 1)
		local tween = ext.hpShieldTween

		tween:MoveTo({
			fillAmount = percent
		}, 0.2)
		tween:Start()
	end
end

function HeadInfoCtrl.SetHp(index, percent, hpValue, hpMax)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if not ext.allowHpTween then
		return
	end

	local currentValue = hpValue

	if currentValue == ext.hpValInt then
		return
	else
		local deltaVaule = ext.hpValInt - currentValue

		if deltaVaule > 10 then
			com.extension.twDelta = deltaVaule
		end

		com.extension.latest = percent
		ext.hpValInt = currentValue
	end

	if ext.isHide or ext.isBoss then
		UIManager.SendMessage("Mainmenu", "SetBossHp", percent, Mathf.Floor(hpValue) .. "/" .. Mathf.Floor(hpMax))

		return
	end

	UIManager.SendMessage("Mainmenu", "SetNpcHP", index, percent)

	if currentValue == 0 then
		if ext.isActive then
			ext.isActive = false
			ext.readyToShow = false

			com.gameObject:SetActive(false)

			if ext.showHeadBar then
				ext.showHeadBar = false

				ext.headBar:SetActive(false)
			end

			if ext.showName then
				ext.showName = false

				ext.textCom.gameObject:SetActive(false)
			end

			if ext.isInFading then
				ext.isInFading = false

				ext.fadingTween:Stop()
			end

			if ext.isHide and (BattleData.IsBattleMode(BattleData.Type.PVE_Story) or BattleData.IsBattleMode(BattleData.Type.PVE_Guard)) then
				UIManager.SendMessage("Mainmenu", "ShowBossHpBar", false)
			end
		end

		return
	end

	if ext.isInitialized and not ext.isWasted then
		if not ext.showHeadBar then
			com.extension.canvasGroup.alpha = 1
			ext.showHeadBar = true

			ext.headBar:SetActive(true)

			if not ext.isBoss and not ext.showName then
				ext.showName = true

				ext.textCom.gameObject:SetActive(true)
			end

			if not ext.isLocked and not ext.setLocked then
				ext.isInFading = true

				ext.fadingTween:Start()
			end
		elseif ext.isInFading then
			ext.isInFading = false

			ext.fadingTween:Stop()

			com.extension.canvasGroup.alpha = 1

			if not ext.showHeadBar then
				ext.showHeadBar = true

				ext.headBar:SetActive(true)
			end

			if not ext.isBoss and not ext.showName then
				ext.showName = true

				ext.textCom.gameObject:SetActive(true)
			end

			if not ext.isLocked and not ext.setLocked then
				ext.isInFading = true

				ext.fadingTween:Start()
			end
		end

		if not ext.inTween then
			if ext.twDelta > 0 then
				ext.inTween = true

				ext.tween:MoveTo({
					fillAmount = percent
				}, 1)
				ext.tween:Start()
			else
				ext.yellowBar:SetFillAmount(percent)
			end
		end
	end

	ext.hpBarImg:SetFillAmount(percent)

	if currentValue > 0 then
		ext.isWasted = false
	end

	if not ext.isInitialized then
		ext.isInitialized = true
		ext.hpValInt = Mathf.Round(hpMax)
		ext.EnValInt = 100
		ext.showHeadBar = false

		ext.headBar:SetActive(false)

		ext.showName = false

		ext.textCom.gameObject:SetActive(false)
		com.gameObject:SetActive(false)

		if ext.isHide and (BattleData.IsBattleMode(BattleData.Type.PVE_Story) or BattleData.IsBattleMode(BattleData.Type.PVE_Guard)) then
			UIManager.SendMessage("Mainmenu", "CreateBossHpBar", 1, hpMax)
		end

		if ext.isFriend then
			ext.readyToShow = true
		end
	end
end

function HeadInfoCtrl.SetEnergy(index, percent)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension
	local currentValue = Mathf.Round(100 * percent)

	if currentValue ~= ext.enValInt then
		ext.enValInt = currentValue

		ext.energyBarImg:SetFillAmount(percent)
	end
end

function HeadInfoCtrl.ShowHPWarning(index, flag)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isHide then
		return
	end

	if flag ~= ext.showHpWarn then
		ext.showHpWarn = flag

		ext.hpWarn:SetActive(flag)

		if flag then
			ext.xtnHpWarn:Play()
		else
			ext.xtnHpWarn:Stop()
		end
	end
end

function HeadInfoCtrl.ShowEnergyWarning(index, flag)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isHide then
		return
	end

	if flag ~= ext.showEnergyWarn then
		ext.showEnergyWarn = flag

		local energyWarn = ext.energyWarn

		if energyWarn then
			energyWarn:SetActive(flag)

			if flag then
				ext.energyWarnTween:Play()
			end
		end
	end
end

function HeadInfoCtrl.ShowLock(index, flag)
	local com = headList[index]

	if com == nil then
		return
	end

	local ext = com.extension

	if ext.isHide and not ext.isBoss then
		return
	end

	if ext.setLocked ~= flag then
		ext.setLocked = flag
		ext.readyToShow = true
	end

	if flag then
		if ext.isInFading then
			ext.isInFading = false

			ext.fadingTween:Stop()
		end

		ext.canvasGroup.alpha = 1

		if not ext.showHeadBar then
			ext.showHeadBar = flag

			ext.headBar:SetActive(flag)
		end

		if not ext.isBoss and not ext.showName then
			ext.showName = flag

			ext.textCom.gameObject:SetActive(flag)
		end

		if flag ~= ext.isLocked then
			ext.isLocked = flag

			if ext.isBoss then
				UIManager.SendMessage("Mainmenu", "SetFocusActive", flag)
			else
				this.SetFocusActive(ext.focus, flag, index)
			end
		end
	elseif not ext.isInFading then
		if flag ~= ext.isLocked then
			ext.isLocked = flag

			if ext.isBoss then
				UIManager.SendMessage("Mainmenu", "SetFocusActive", flag)
			else
				this.SetFocusActive(ext.focus, flag, index)
			end
		end

		if ext.showHeadBar then
			ext.showHeadBar = flag

			ext.headBar:SetActive(flag)
		end

		if ext.showName then
			ext.showName = flag

			ext.textCom.gameObject:SetActive(flag)
		end
	end
end

function HeadInfoCtrl.UpdateInfo(index, pos)
	if headLoader == nil then
		return
	end

	local com = headList[index]

	if com then
		local ext = com.extension

		if ext.realPosition then
			ext.realPosition:SetVector3(pos)
		end
	end
end

function HeadInfoCtrl.SortVisiable()
	if headLoader == nil or #headLoader.children == 0 then
		return
	end

	local headListTemp = headLoader.children

	table.sort(headListTemp, function(a, b)
		if a ~= nil and b ~= nil then
			return a.extension.distance > b.extension.distance
		else
			return false
		end
	end)

	local idx = 1

	for _k, _v in pairs(headListTemp) do
		if _v ~= nil then
			_v.transform:SetSiblingIndex(_k)
		end
	end
end

function HeadInfoCtrl.SortByDistance(camera)
	if headLoader == nil or #headLoader.children == 0 then
		return
	end

	local pos = camera.transform.position
	local headListTemp = headLoader.children

	table.sort(headListTemp, function(a, b)
		if not IsNil(a) and not IsNil(b) then
			local aDis = Vector3.DistanceSquare(pos, a.gameObject.transform.position)
			local bDis = Vector3.DistanceSquare(pos, b.gameObject.transform.position)

			return bDis < aDis
		else
			return false
		end
	end)

	for _k, _v in pairs(headListTemp) do
		if _v.gameObject.activeSelf then
			_v.gameObject.transform:SetSiblingIndex(_k + 1)
		end
	end
end

function HeadInfoCtrl.ChangeLayer()
	local tfs = this.transform:GetComponentsInChildren(typeof("UnityEngine.Transform"))
	local len = tfs.Length

	for i = 0, len - 1 do
		local _tf = tfs[i]

		if _tf ~= nil then
			_tf.gameObject.layer = LayerDefault
		end
	end
end

function HeadInfoCtrl.UpdatePosPve(com, index)
	local ret = false
	local uiPos
	local scale = 0
	local ext = com.extension
	local pos = ext.realPosition
	local isFront = HeadInfoCtrl.IsInFront(pos)
	local distance = Vector3.Distance(pos, cameraPos)
	local isInRange = distance <= maxVisiableRadius
	local available = isFront or ext.isLocked or ext.setLocked

	if available then
		scale = HeadInfoCtrl.GetScale(distance)
	end

	if available and isInRange then
		if available then
			ret, uiPos = HeadInfoCtrl.GetUiPosition(pos, true)
		end

		if ret then
			if ext.isActive ~= available then
				ext.isActive = available

				com.gameObject:SetActive(available)

				if available then
					ext.canvasGroup.alpha = 1
				end
			end

			if ext.setLocked ~= ext.isLocked then
				local value = ext.setLocked

				ext.isLocked = value

				this.SetFocusActive(ext.focus, value, index)

				if not value then
					ext.isInFading = true

					ext.fadingTween:Start()
				else
					if ext.showHeadBar ~= value then
						ext.showHeadBar = value

						ext.headBar:SetActive(value)
					end

					if not ext.isBoss and ext.showName ~= value then
						ext.showName = value

						ext.textCom.gameObject:SetActive(value)
					end

					if ext.isInFading then
						ext.isInFading = false

						ext.fadingTween:Stop()
					end
				end
			end

			local tf = com.transform

			tf.position = uiPos
			tf.localScale = Vector3.one * scale * factor
		else
			if ext.isInFading then
				ext.isInFading = false

				ext.fadingTween:Stop()
			end

			if ext.showHeadBar then
				ext.showHeadBar = false

				ext.headBar:SetActive(false)
			end

			if ext.isActive then
				ext.isActive = false

				com.gameObject:SetActive(false)
			end
		end
	else
		if ext.isInFading then
			ext.isInFading = false

			ext.fadingTween:Stop()
		end

		if ext.showHeadBar then
			ext.showHeadBar = false

			ext.headBar:SetActive(false)
		end

		if ext.isActive then
			ext.isActive = false

			com.gameObject:SetActive(false)
		end
	end

	HeadInfoCtrl.UpdateSign(index, scale, uiPos)
end

function HeadInfoCtrl.UpdatePosPvp(pos, ext, com, index)
	local ret = false
	local uiPos
	local scale = 0
	local isFront = HeadInfoCtrl.IsInFront(pos)
	local distance = Vector3.Distance(pos, cameraPos)
	local isInRange = distance <= maxVisiableRadius
	local available = isFront or ext.isLocked or ext.setLocked

	if available then
		scale = HeadInfoCtrl.GetScale(distance)
	end

	if scale > 0 then
		if ext.isFriend then
			if available then
				ret, uiPos = HeadInfoCtrl.GetUiPosition(pos, false)
			end

			if ret then
				if ext.isActive ~= available then
					ext.isActive = available

					com.gameObject:SetActive(available)

					if available then
						ext.canvasGroup.alpha = 1
					end
				end

				local showBar = available and isInRange

				if ext.showHeadBar ~= showBar then
					ext.showHeadBar = showBar

					ext.headBar:SetActive(showBar)
				end

				if not ext.isBoss and ext.showName ~= showBar then
					ext.showName = showBar

					ext.textCom.gameObject:SetActive(showBar)
				end

				if ext.setLocked ~= ext.isLocked then
					local value = ext.setLocked

					ext.isLocked = value

					this.SetFocusActive(ext.focus, value, index)
				end

				local tf = com.transform

				tf.position = uiPos
				tf.localScale = Vector3.one * scale
			else
				if ext.isInFading then
					ext.isInFading = false

					ext.fadingTween:Stop()
				end

				if ext.isActive then
					ext.isActive = false

					com.gameObject:SetActive(false)
				end
			end
		elseif isInRange then
			if available then
				ret, uiPos = HeadInfoCtrl.GetUiPosition(pos, false)
			end

			if ret then
				if ext.isActive ~= available then
					ext.isActive = available

					com.gameObject:SetActive(available)

					if available then
						ext.canvasGroup.alpha = 1
					end
				end

				if not ext.isBoss and ext.showName ~= available then
					ext.showName = available

					ext.textCom.gameObject:SetActive(available)
				end

				if ext.setLocked ~= ext.isLocked then
					local value = ext.setLocked

					ext.isLocked = value

					this.SetFocusActive(ext.focus, value, index)
				end

				local tf = com.transform

				tf.position = uiPos
				tf.localScale = Vector3.one * scale
			else
				if ext.isInFading then
					ext.isInFading = false

					ext.fadingTween:Stop()
				end

				if ext.showHeadBar then
					ext.showHeadBar = false

					ext.headBar:SetActive(false)
				end

				if ext.isActive then
					ext.isActive = false

					com.gameObject:SetActive(false)
				end
			end
		else
			if ext.isInFading then
				ext.isInFading = false

				ext.fadingTween:Stop()
			end

			if ext.showHeadBar then
				ext.showHeadBar = false

				ext.headBar:SetActive(false)
			end

			if ext.isActive then
				ext.isActive = false

				com.gameObject:SetActive(false)
			end
		end
	else
		if ext.isInFading then
			ext.isInFading = false

			ext.fadingTween:Stop()
		end

		if ext.showHeadBar then
			ext.showHeadBar = false

			ext.headBar:SetActive(false)
		end

		if ext.isActive then
			ext.isActive = false

			com.gameObject:SetActive(false)
		end
	end

	if ext.isFriend then
		HeadInfoCtrl.UpdateLocator(index, isInRange, scale, uiPos)
	else
		HeadInfoCtrl.UpdateSign(index, scale, uiPos)
	end
end

function HeadInfoCtrl.GetScale(distance)
	return Mathf.Max(-0.025 * distance + 1.025, scaler)
end

function HeadInfoCtrl.IsInFront(pos)
	local ret = cameraFwd.x * (pos.x - cameraPos.x) + cameraFwd.y * (pos.y - cameraPos.y) + cameraFwd.z * (pos.z - cameraPos.z)

	return ret > 0
end

function HeadInfoCtrl.GetUiPosition(pos, forced)
	local sp = camera:WorldToScreenPoint(pos)

	if forced or sp.x >= -120 and sp.x <= screenWidth + 120 and sp.y >= -120 and sp.y <= screenHeight + 120 then
		local ret, uiPos = RectTransformUtility.ScreenPointToWorldPointInRectangle(parentRect, sp, uiCamera, uiPos)
		local uiPosYLimit = (screenRect.height - 240) * 0.5

		if uiPosYLimit < uiPos.y then
			uiPos:Set(uiPos.x, uiPosYLimit, uiPos.z)
		end

		return ret, uiPos
	end

	return false, nil
end

function HeadInfoCtrl.UpdatePos(pos, forced)
	local scale = 0
	local uiPos
	local dir = pos - cameraPos
	local distance = dir.magnitude
	local inRange = false

	if distance <= maxVisiableRadius then
		inRange = true
	end

	if (forced or inRange) and Vector3.Dot(cameraFwd, dir) > 0 then
		local sp = camera:WorldToScreenPoint(pos)

		if sp.x >= 0 and sp.x <= screenWidth and sp.y >= 0 and sp.y <= screenHeight then
			local ret = false

			scale = Mathf.Max(-0.025 * distance + 1.025, scaler)
			ret, uiPos = RectTransformUtility.ScreenPointToWorldPointInRectangle(parentRect, sp, uiCamera, uiPos)
		end
	end

	return inRange, scale, distance, uiPos
end

function HeadInfoCtrl.ShowSign(index, showEnabled, signIndex)
	return
end

function HeadInfoCtrl.UpdateSign(index, scale, uiPos)
	return
end

function HeadInfoCtrl.ShowLocator(index, flag)
	return
end

function HeadInfoCtrl.UpdateLocator(index, inRange, scale, uiPos)
	return
end

function HeadInfoCtrl.Update()
	cameraPos = UIManager.GetMainCameraPos()
	cameraFwd = UIManager.GetMainCameraFwd()

	for idx, com in pairs(headList) do
		if com then
			local ext = com.extension

			if ext and not ext.isHide and not ext.isBoss and not ext.isWasted and (ext.isInFading or ext.showHeadBar) then
				HeadInfoCtrl.UpdatePosPve(com, idx)
			end
		end
	end
end

function HeadInfoCtrl.Close(uiName)
	headLoader:ClearTemplate()

	for _k, _v in pairs(headList) do
		local ext = _v.extension

		if ext.tween ~= nil then
			TweenManager.Remove(ext.tween)
		end

		if ext.hpShieldTween ~= nil then
			TweenManager.Remove(ext.hpShieldTween)
		end
	end

	UICtrlBase.Close("HeadInfo")
end

return HeadInfoCtrl
