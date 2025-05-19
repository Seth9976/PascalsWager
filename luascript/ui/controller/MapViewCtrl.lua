-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/MapViewCtrl.lua

MapViewCtrl = class("MapViewCtrl", UICtrlBase)

local this = MapViewCtrl

MapViewCtrl.static.TimeoutCursor = 3
MapViewCtrl.static.SpotSqrRadius = 400
MapViewCtrl.static.EscapeSqrRadius = 32400
MapViewCtrl.static.MapSize = {
	Height = 1166,
	Width = 2048
}
MapViewCtrl.static.PathSite = 1
MapViewCtrl.static.PathPort = 2
MapViewCtrl.static.Step = {
	InitMap = 1,
	OpenMap = 2,
	Departure = 5,
	ViewMap = 3,
	ChooseHero = 4
}
MapViewCtrl.static.OpenMap = {
	FocusRun = 3,
	End = 11,
	FocusInit = 2,
	SiteRun = 6,
	PortalInit = 8,
	SiteInit = 5,
	PortalEnd = 10,
	PortalRun = 9,
	SiteEnd = 7,
	FocusEnd = 4,
	Init = 1
}

local sceneController, panelMap, panelPath, panelInfo, panelHero, panelFrog, controllerGameMode, loaderHeroList
local currentLocation = 1
local selectedSiteId = 0
local selectedPortalId = 0
local destinationSiteId = 0
local destinationPortId = 0
local selectedHeroId = 0
local selectedHeroIndex = 2
local siteCount = 0
local uiCamera, scCamera, maskCamera, viewRect, scrRectTf
local stepMapView = MapViewCtrl.Step.InitMap
local stepOpenMap = MapViewCtrl.OpenMap.Init
local pathAnim
local animCtrl = {}
local focusPos, heroData
local loadingLock = false
local deltaTime = 0

MapViewCtrl.delayRelease = false

local delayStartOffCount = 0
local srm = {
	dsgnH = 750,
	mapW = 2048,
	mapEV = 32,
	mapH = 1166,
	gapV = 100,
	mapEH = 32,
	gapH = 100,
	dsgnW = 1334
}

function MapViewCtrl.SetContentSize(width, height)
	local eH = srm.mapEH
	local eV = srm.mapEV

	srm.mapW = width
	srm.mapH = height
	srm.xMin = eH
	srm.xMax = width - eH
	srm.yMin = eV
	srm.yMax = height - eV
end

function MapViewCtrl.OnResolution()
	srm.scrW = SystemHelper.GetScreenWidth()
	srm.scrH = SystemHelper.GetScreenHeight()

	if not SystemHelper.isSubquadrateScrAS() then
		srm.scale = srm.scrH / 750
	else
		srm.scale = srm.scrW / 1334
	end

	local aspectRatio = srm.scrW / srm.scrH

	if not SystemHelper.isSubquadrateScrAS() then
		srm.scaleDA = srm.dsgnH / srm.scrH
		srm.scrRectW = Mathf.Round(srm.dsgnH * aspectRatio)
		srm.scrRectH = srm.dsgnH
		srm.dsgnW = Mathf.Round(750 * aspectRatio)
	else
		srm.scaleDA = srm.dsgnW / srm.scrW
		srm.scrRectW = srm.dsgnW
		srm.scrRectH = Mathf.Round(srm.dsgnW / aspectRatio)
		srm.dsgnH = Mathf.Round(1334 / aspectRatio)
	end

	srm.srGapH = Mathf.Floor(srm.gapH * srm.scaleDA)
	srm.srGapV = Mathf.Floor(srm.gapV * srm.scaleDA)

	local eH = srm.mapEH
	local eV = srm.mapEV

	srm.xMin = eH
	srm.xMax = srm.mapW - eH
	srm.yMin = eV
	srm.yMax = srm.mapH - eV
end

function MapViewCtrl.UpdateSRM(x, y, dx, dy)
	local posW = panelMap.cursor.transform.position
	local scrPos = uiCamera:WorldToScreenPoint(posW)

	panelMap.cursorScrPos = scrPos

	if AppVer == AppDevVer then
		-- block empty
	end

	local dsgnW = srm.dsgnW
	local dsgnH = srm.dsgnH
	local gapH = srm.gapH
	local gapV = srm.gapV
	local mapW = srm.mapW
	local mapH = srm.mapH
	local scrW = srm.scrW
	local scrH = srm.scrH
	local scale = scrH / dsgnH
	local scrRectW = srm.scrRectW
	local scrRectH = srm.scrRectH
	local scaleDA = srm.scaleDA
	local srGapH = srm.srGapH
	local srGapV = srm.srGapV
	local xMin = srm.xMin
	local xMax = srm.xMax
	local yMin = srm.yMin
	local yMax = srm.yMax

	if x < xMin then
		x = xMin
	elseif xMax < x then
		x = xMax
	end

	if y < yMin then
		y = yMin
	elseif yMax < y then
		y = yMax
	end

	if not SystemHelper.isSubquadrateScrAS() then
		if dx > 0 then
			if x >= mapW - srGapH and scrPos.x >= scrW - gapH or panelMap.comScrollRect.horizontalNormalizedPosition >= 1 then
				panelMap.comScrollRect.horizontalNormalizedPosition = 1
			elseif x > scrRectW - srGapH and x < mapW - srGapH and scrPos.x > scrW - gapH and panelMap.comScrollRect.horizontalNormalizedPosition < 1 then
				panelMap.prevDx = 1
				panelMap.comScrollRect.horizontalNormalizedPosition = (x - (scrRectW - srGapH)) / (mapW - scrRectW)
			elseif panelMap.prevDx < 0 then
				panelMap.prevDx = 0
			end
		elseif dx < 0 then
			if x <= srGapH and gapH >= scrPos.x or panelMap.comScrollRect.horizontalNormalizedPosition <= 0 then
				panelMap.comScrollRect.horizontalNormalizedPosition = 0
			elseif srGapH < x and x < mapW - (scrRectW - srGapH) and gapH > scrPos.x and panelMap.comScrollRect.horizontalNormalizedPosition > 0 then
				panelMap.prevDx = -1
				panelMap.comScrollRect.horizontalNormalizedPosition = (x - srGapH) / (mapW - scrRectW)
			elseif panelMap.prevDx > 0 then
				panelMap.prevDx = 0
			end
		end

		if dy > 0 then
			if y >= mapH - srGapV and scrPos.y >= scrH - gapV or panelMap.comScrollRect.verticalNormalizedPosition >= 1 then
				panelMap.comScrollRect.verticalNormalizedPosition = 1
			elseif y > scrRectH - srGapV and y < mapH - srGapV and scrPos.y > scrH - gapV and panelMap.comScrollRect.verticalNormalizedPosition < 1 then
				panelMap.prevDy = 1
				panelMap.comScrollRect.verticalNormalizedPosition = (y - (scrRectH - srGapV)) / (mapH - scrRectH)
			elseif panelMap.prevDy < 0 then
				panelMap.prevDy = 0
			end
		elseif dy < 0 then
			if y <= srGapV and gapV >= scrPos.y or panelMap.comScrollRect.verticalNormalizedPosition <= 0 then
				panelMap.comScrollRect.verticalNormalizedPosition = 0
			elseif srGapV < y and y < mapH - (scrRectH - srGapV) and gapV > scrPos.y and panelMap.comScrollRect.verticalNormalizedPosition > 0 then
				panelMap.prevDy = -1
				panelMap.comScrollRect.verticalNormalizedPosition = (y - srGapV) / (mapH - scrRectH)
			elseif panelMap.prevDy > 0 then
				panelMap.prevDy = 0
			end
		end
	else
		if dx > 0 then
			if x >= mapW - srGapH and scrPos.x >= scrW - gapH or panelMap.comScrollRect.horizontalNormalizedPosition >= 1 then
				panelMap.comScrollRect.horizontalNormalizedPosition = 1
			elseif x > scrRectW - srGapH and x < mapW - srGapH and scrPos.x > scrW - gapH and panelMap.comScrollRect.horizontalNormalizedPosition < 1 then
				panelMap.prevDx = 1
				panelMap.comScrollRect.horizontalNormalizedPosition = (x - (scrRectW - srGapH)) / (mapW - scrRectW)
			elseif panelMap.prevDx < 0 then
				panelMap.prevDx = 0
			end
		elseif dx < 0 then
			if x <= srGapH and gapH >= scrPos.x or panelMap.comScrollRect.horizontalNormalizedPosition <= 0 then
				panelMap.comScrollRect.horizontalNormalizedPosition = 0
			elseif srGapH < x and x < mapW - (scrRectW - srGapH) and gapH > scrPos.x and panelMap.comScrollRect.horizontalNormalizedPosition > 0 then
				panelMap.prevDx = -1
				panelMap.comScrollRect.horizontalNormalizedPosition = (x - srGapH) / (mapW - scrRectW)
			elseif panelMap.prevDx > 0 then
				panelMap.prevDx = 0
			end
		end

		if dy > 0 then
			if y >= mapH - srGapV and scrPos.y >= scrH - gapV or panelMap.comScrollRect.verticalNormalizedPosition >= 1 then
				panelMap.comScrollRect.verticalNormalizedPosition = 1
			elseif y > scrRectH - srGapV and y < mapH - srGapV and scrPos.y > scrH - gapV and panelMap.comScrollRect.verticalNormalizedPosition < 1 then
				panelMap.prevDy = 1
				panelMap.comScrollRect.verticalNormalizedPosition = (y - (scrRectH - srGapV)) / (mapH - scrRectH)
			elseif panelMap.prevDy < 0 then
				panelMap.prevDy = 0
			end
		elseif dy < 0 then
			if y <= srGapV and gapV >= scrPos.y or panelMap.comScrollRect.verticalNormalizedPosition <= 0 then
				panelMap.comScrollRect.verticalNormalizedPosition = 0
			elseif srGapV < y and y < mapH - (scrRectH - srGapV) and gapV > scrPos.y and panelMap.comScrollRect.verticalNormalizedPosition > 0 then
				panelMap.prevDy = -1
				panelMap.comScrollRect.verticalNormalizedPosition = (y - srGapV) / (mapH - scrRectH)
			elseif panelMap.prevDy > 0 then
				panelMap.prevDy = 0
			end
		end
	end

	return x, y
end

function MapViewCtrl.SetUIPostProcessNormal()
	local scene = sceneController:GetScene()

	if scene then
		if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Ultra then
			scene:SetPostProcessType(SceneBase.PostProcessType.MainSuper)
		elseif LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
			scene:SetPostProcessType(SceneBase.PostProcessType.MainPro)
		else
			scene:SetPostProcessType(SceneBase.PostProcessType.Main)
		end

		UIManager.SendMessage("Mainmenu", "ResetSanityVfx")
	end
end

function MapViewCtrl.SetUIPostProcessMap()
	local scene = sceneController:GetScene()

	if scene then
		scene:SetPostProcessType(SceneBase.PostProcessType.Map)
		UIManager.SendMessage("Mainmenu", "ResetSanityVfx")
	end
end

function MapViewCtrl.OnCreate()
	loadingLock = false
	delayStartOffCount = 0
	sceneController = ST_Main.GetSceneController()
	controllerGameMode = sceneController:GetGameController()

	UILayerCtrl.SetSceneController(sceneController)
	sceneController:EnterMenu(true)
	UILayerCtrl.Add("MapView", MapViewCtrl.ClosePanel)
	UILayerCtrl.Add("MapHero", MapViewCtrl.ClosePanelHero)

	stepMapView = MapViewCtrl.Step.InitMap

	TimeHelper.resetDeltaTime()

	selectedSiteId = 0
	selectedPortalId = 0
	destinationSiteId = 0
	destinationPortId = 0
	selectedHeroId = BattleData.GetHeroId()
	currentLocation = FS_UserData.story:GetCarriageCallStoryId()
	animCtrl = {}
	animCtrl.sites = {}
	animCtrl.siteCount = 0
	animCtrl.masks = {}
	animCtrl.maskCount = 0
	animCtrl.portals = {}
	focusPos = {}
	focusPos.focused = {}
	focusPos.sitePos = {}

	local refSizes = {}
	local aspect = LS_Setting.screenWidth / LS_Setting.screenHeight
	local scale = 750 / LS_Setting.screenHeight
	local scrH = LS_Setting.screenHeight * scale
	local scrW = scrH * aspect
	local isSubquadrate = SystemHelper.isSubquadrateScrAS()

	if isSubquadrate then
		aspect = LS_Setting.screenHeight / LS_Setting.screenWidth
		scale = 1334 / LS_Setting.screenWidth
		scrH = LS_Setting.screenWidth * scale
		scrW = scrH * aspect
	end

	refSizes.scrW = scrW
	refSizes.scrH = scrH

	local halfScrW = 0.5 * scrW
	local halfScrH = 0.5 * scrH

	refSizes.scrHW = halfScrW
	refSizes.scrHH = halfScrH

	local mapW = MapViewCtrl.MapSize.Width
	local mapH = MapViewCtrl.MapSize.Height

	refSizes.validRect = {
		bl = {
			x = halfScrW,
			y = halfScrH
		},
		tr = {
			x = mapW - halfScrW,
			y = mapH - halfScrH
		}
	}
	refSizes.refW = mapW - scrW
	refSizes.refH = mapH - scrH
	focusPos.refSizes = refSizes

	this.SetUIPostProcessMap()

	tfUiCamera = this.transform.parent:Find("UICamera").transform
	uiCamera = this.gameObject:GetComponent("Canvas").worldCamera
	scCamera = sceneController:GetCamera()
	panelMap = {}
	panelMap.show = true
	panelMap.go = this.mainComponent:GetGameObject("Map_PanelMap")

	panelMap.go:SetActive(panelMap.show)

	panelMap.mapView = this.mainComponent:GetGameObject("Map_PanelMap_ScrollView")
	panelMap.scrollRect = XScrollRect:new(panelMap.mapView)
	panelMap.mapViewport = this.mainComponent:GetGameObject("Map_PanelMap_Viewport")
	panelMap.comScrollRect = panelMap.mapView:GetComponent("ScrollRect")
	panelMap.prevDx = 0
	panelMap.prevDy = 0
	panelMap.nPosX = 0
	panelMap.nPosY = 0
	panelMap.btnClose = {}
	panelMap.btnClose.show = true
	panelMap.btnClose.com = this.mainComponent:GetButton("Map_PanelMap_BtnClose")

	panelMap.btnClose.com.gameObject:SetActive(true)
	panelMap.btnClose.com:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if stepMapView == MapViewCtrl.Step.ViewMap then
			UIManager.SendMessage("Mainmenu", "CloseMap")
			MapViewCtrl.ShowPortalDiagram(false)
			UILayerCtrl.OnButtonClickMute("Map_PanelMap_BtnCloseSiteInfo")

			if sceneController ~= nil then
				UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
				sceneController:SetActionAssist(ControllerMain.AssistButton.ViewMapEnd)
			end
		end
	end)
	UILayerCtrl.AddIndividual("MapView", "Map_PanelMap_BtnClose", panelMap.btnClose.com)

	panelMap.mapContent = this.mainComponent:GetGameObject("Panel_Map_Content")

	local tfScrollEdge = panelMap.mapContent.transform

	scrRectTf = tfScrollEdge.parent.parent.gameObject:GetComponent("RectTransform")
	viewRect = tfScrollEdge.rect

	local rect = panelMap.mapContent:GetComponent("RectTransform").rect

	this.SetContentSize(rect.width, rect.height)
	this.OnResolution()

	panelMap.showCursor = true
	panelMap.isMovingCursor = false
	panelMap.firstTimeStopCursor = false
	panelMap.cursorSpeed = 0.02
	panelMap.cursorPercent = 0
	panelMap.cursorScrPos = Vector3.zero
	panelMap.oriVec2 = Vector2.zero
	panelMap.currVec2 = Vector2.zero
	panelMap.moveVec2 = Vector2.zero
	panelMap.tStuckInVec2 = Vector2.zero
	panelMap.nearestBtnName = nil
	panelMap.nearestBtnVec2 = Vector2.zero
	panelMap.selectedBtnName = nil
	panelMap.siteId = 0
	panelMap.portalId = 0
	panelMap.portalVecDict = {}
	panelMap.portalStaDict = {}
	panelMap.isSeSelectedPlayed = false
	panelMap.cursor = this.mainComponent:GetButton("Map_Cursor")

	panelMap.cursor.gameObject:SetActive(panelMap.showCursor)

	panelMap.cursorCg = panelMap.cursor.gameObject:GetComponent("CanvasGroup")
	panelMap.cursorCg.alpha = 1
	panelMap.cursorTween = nil

	panelMap.cursor:SetAudioType(AudioCtrl.ButtonClickType.None)
	panelMap.cursor:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local vec2 = panelMap.cursor.transform.localPosition
		local siteId, portalId, x, y = this.CheckSpot(vec2.x, vec2.y)

		if siteId > 0 then
			local btnName = "Site" .. siteId .. "Btn"

			if portalId and portalId > 0 then
				btnName = btnName .. portalId
			end

			if panelMap.isSeSelectedPlayed then
				UILayerCtrl.OnButtonClickMute(btnName)
			else
				UILayerCtrl.OnButtonClick(btnName)
			end

			panelMap.isSeSelectedPlayed = false
		else
			this.SetSpotSelected(false, x, y)
		end
	end)
	UILayerCtrl.AddIndividual("MapView", "Map_Cursor", panelMap.cursor)

	panelMap.cursorDbg = this.mainComponent:GetText("Map_Cursor_Dbg")

	panelMap.cursorDbg.gameObject:SetActive(false)

	panelMap.portalDiagram = {}
	panelMap.portalDiagram.sitelId = 99
	panelMap.portalDiagram.portalId = 0
	panelMap.portalDiagram.go = this.mainComponent:GetGameObject("Map_PanelMap_ProtalDiagram")
	panelMap.portalDiagram.image = XImage:new(this.mainComponent:GetGameObject("Map_PanelMap_ProtalDiagram_Image"))

	panelMap.portalDiagram.image.gameObject:SetActive(false)

	panelMap.portalDiagram.name = this.mainComponent:GetText("Map_PanelMap_ProtalDiagram_Name")
	panelMap.portalDiagram.show = false

	panelMap.portalDiagram.go:SetActive(false)

	panelMap.showSelected = false
	panelMap.selected = this.mainComponent:GetGameObject("Map_Selected")

	panelMap.selected:SetActive(panelMap.showSelected)

	panelMap.showCarriage = true
	panelMap.carriage = this.mainComponent:GetGameObject("Map_Carriage")

	panelMap.carriage:SetActive(panelMap.showCarriage)

	panelMap.showBtnFog = false

	local btnFog = this.mainComponent:GetButton("Map_PanelMap_BtnCloseSiteInfo")

	btnFog:SetParentScroll(panelMap.scrollRect)
	btnFog.gameObject:SetActive(panelMap.showBtnFog)
	btnFog:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.SelectFogArea()
	end)
	UILayerCtrl.AddIndividual("MapView", "Map_PanelMap_BtnCloseSiteInfo", panelMap.btnFog)

	panelMap.btnFog = btnFog
	panelMap.sites = {}
	animCtrl.sites = {}
	animCtrl.masks = {}
	animCtrl.portals = {}

	FS_UserData.story:UpdateStageMap()

	siteCount = FS_UserData.story:GetStageCount()

	local stageMap = FS_UserData.story:GetStageMap()

	for i = 1, siteCount do
		local siteId = tostring(100 * i)
		local siteData = stageMap[siteId]
		local status = siteData.status
		local site = {}

		site.id = i
		site.status = status
		site.show = Mathf.Abs(status) > 0 and MapViewCtrl.IsValidDestination(i)
		site.go = this.mainComponent:GetGameObject("Site" .. i)

		if site.go ~= nil then
			site.go:SetActive(site.show)

			site.pos = site.go.transform.localPosition
			focusPos.sitePos[i] = site.pos
			site.icon = this.mainComponent:GetGameObject("NewSite" .. i)
			site.anim = site.icon:GetComponent("Animator")

			if status < 0 then
				animCtrl.sites[i] = site.anim

				table.insert(focusPos.focused, i)
			elseif status > 0 and site.anim then
				site.anim:SetTrigger("Back")
			end

			site.state = this.mainComponent:GetGameObject("SiteState" .. i)

			site.state:SetActive(site.show)

			site.animState = site.state:GetComponent("Animator")

			if i == currentLocation then
				site.animState:SetTrigger("click")
				this.SetCarriagePosition(site.pos.x, site.pos.y)
			elseif status > 0 then
				site.animState:SetTrigger("normal")
			end

			local portals = {}

			for pIdx = 1, 3 do
				local portal = {}

				portal.show = false
				portal.go = this.mainComponent:GetGameObject("Site" .. i .. "Btn" .. pIdx)

				portal.go:SetActive(false)

				portals[pIdx] = portal
			end

			for pId, pStatus in pairs(siteData.portals) do
				local pIdx = pId % 100
				local portal = portals[pIdx]

				portal.id = pId
				portal.state = pStatus
				portal.show = Mathf.Abs(pStatus) > 0 and site.show

				portal.go:SetActive(portal.show)

				portal.pos = portal.go.transform.localPosition
				portal.anim = portal.go:GetComponent("Animator")

				if pStatus < 0 then
					animCtrl.portals[pId] = portal.anim

					table.insert(focusPos.focused, i)
				elseif pStatus > 0 and portal.anim then
					portal.anim:SetBool("normal", true)
				end

				portal.entered = false
				portal.btn = this.mainComponent:GetButton("Site" .. i .. "Btn" .. pIdx)

				portal.btn:SetAudioType(AudioCtrl.ButtonClickType.MapSelect)
				portal.btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
					if loadingLock == false then
						local pos = portal.pos

						MapViewCtrl.SelectPortal(site.id, portal.id, pos.x, pos.y, pIdx)
						MapViewCtrl.ShowSiteInfo(site.id, portal.id)

						panelMap.isSeSelectedPlayed = true
					end
				end)

				local portalBtnName = "Site" .. site.id .. "Btn" .. pIdx

				UILayerCtrl.AddIndividual("MapView", portalBtnName, portal.btn)

				panelMap.portalVecDict[portalBtnName] = Vector2.New(portal.pos.x, portal.pos.y)
				panelMap.portalStaDict[portalBtnName] = portal.show
				portals[pIdx] = portal
			end

			site.portals = portals

			local siteMask = this.mainComponent:GetGameObject("Site" .. i .. "Mask")

			if siteMask then
				siteMask:SetActive(site.show)
			end

			site.mask = siteMask

			local maskAnim = siteMask:GetComponent("Animator")

			site.maskAnim = maskAnim

			if maskAnim then
				if status < 0 then
					animCtrl.masks[i] = site.maskAnim
				elseif status > 0 then
					maskAnim:SetBool("normal", true)
				end
			end
		end

		panelMap.sites[i] = site
	end

	UILayerCtrl.Push("MapView", nil)

	maskCamera = this.mainComponent:GetGameObject("MapView_CameraMapMask"):GetComponent("Camera")

	local wFactor, hFactor = SystemHelper.GetCanvasScalerWidthFactor(1)

	if SystemHelper.isSubquadrateScrAS() then
		wFactor, hFactor = SystemHelper.GetCanvasScalerWidthFactor(0)
	end

	maskCamera.orthographicSize = 682 * hFactor
	panelInfo = {}
	panelInfo.show = false
	panelInfo.go = this.mainComponent:GetGameObject("Map_PanelMap_SiteInfo_B")

	panelInfo.go:SetActive(false)

	panelInfo.title = this.mainComponent:GetText("SiteInfoTitle")
	panelInfo.intro = this.mainComponent:GetText("SiteInfoIntro")
	panelInfo.showBtnOK = false
	btnOK = this.mainComponent:GetButton("Map_PanelMap_SiteInfo_BtnDestination")

	btnOK.gameObject:SetActive(true)
	btnOK:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		MapViewCtrl.ConfirmSelection()
	end)
	UILayerCtrl.AddIndividual("MapView", "Map_PanelMap_SiteInfo_BtnDestination", panelInfo.btnOK)

	panelInfo.btnOK = btnOK
	panelFrog = {}
	panelFrog.show = true
	panelFrog.go = this.mainComponent:GetGameObject("Map_Info_Frog")

	panelFrog.go:SetActive(false)

	panelFrog.title = this.mainComponent:GetText("Map_Info_FrogTextTitle")
	panelFrog.txtNum = this.mainComponent:GetText("Map_Info_FrogTextFound")
	panelFrog.txtTotal = this.mainComponent:GetText("Map_Info_FrogTextTotal")
	panelInfo.panelFrog = panelFrog
	panelHero = {}
	panelHero.savePos = Vector3.zero
	panelHero.saveRot = Quaternion.identity
	panelHero.show = false
	panelHero.go = this.mainComponent:GetGameObject("Map_PanelHero")

	panelHero.go:SetActive(panelHero.show)

	local btnBack = this.mainComponent:GetButton("Map_PanelHero_BtnBack")

	btnBack:SetAudioEnable(false)
	btnBack:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.ClosePanelHero()
	end)
	UILayerCtrl.AddIndividual("MapHero", "Map_PanelHero_BtnBack", btnBack)

	panelHero.btnBack = btnBack

	local btnStart = this.mainComponent:GetButton("Map_PanelHero_BtnStart")

	btnStart:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		delayStartOffCount = 10
	end)
	UILayerCtrl.AddIndividual("MapHero", "Map_PanelHero_BtnStart", btnStart)

	panelHero.btnStart = btnStart

	local panelHeroSelect = {}

	panelHeroSelect.show = true
	panelHeroSelect.go = this.mainComponent:GetGameObject("Map_PanelHero_HeroList_B")

	panelHeroSelect.go:SetActive(panelHeroSelect.show)

	local scrollHeroObj = this.mainComponent:GetGameObject("Map_PanelHero_HeroList_ScrollView")

	if scrollHeroObj then
		local heroSrc = MS_HeroData.GetEnableHeroIdList()

		heroData = {}

		local heroCount = #heroSrc

		for i = 1, heroCount do
			heroData[i] = heroSrc[i]
		end

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true and FS_UserData.story then
			local story = FS_UserData.story

			for i = heroCount, 1, -1 do
				local heroId = heroData[i]

				if not story:CheckHeroEnable(heroId) then
					table.remove(heroData, i)
				end
			end

			print_r(heroData)
		end

		local scrollHeroList = XScrollRect:new(scrollHeroObj)

		loaderHeroList = this.mainComponent:GetLoader("Map_PanelHero_Content")

		local heroCount = #heroData

		panelHero.heroCount = heroCount
		panelHero.loadCount = 0
		panelHero.loadFinish = false

		loaderHeroList:SetCount(heroCount)

		local scrollViewContent = this.mainComponent:GetGameObject("Map_PanelHero_Content")
		local rectTf = scrollViewContent:GetComponent("RectTransform")
		local rect = rectTf.rect

		rectTf.sizeDelta = Vector2.New(rect.width, 112 * (heroCount - 1) + 8 * (heroCount - 2))

		local group = XGroup:new()

		group:SetMode(XGroup.GroupMode.Button)

		function loaderHeroList.loadCallback(index, com, data)
			local heroId = heroData[index]
			local selectBtn = com:GetButton("Button_Select")

			UILayerCtrl.AddButton("MapHero", "HeroSel" .. index, selectBtn)

			local icon = com:GetGameObject("Image_Hero")
			local img = XImage:new(icon)
			local sprite = XObjectPool.GetIcon("photo" .. BattleData.ConvertHeroIdWithSkin(heroId))

			if sprite ~= nil then
				img:SetSprite(sprite)
			end

			local story = FS_UserData.story

			if story then
				local lockIcon = com:GetGameObject("Image_Lock")

				lockIcon:SetActive(story:CheckHeroEnable(heroId))
			end

			group:Add(selectBtn)
			selectBtn:SetAudioType(AudioCtrl.ButtonClickType.HeroSelect)
			selectBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
				UILayerCtrl.OnSelect("HeroSel" .. index)

				selectedHeroIndex = index

				if heroId ~= 10001 then
					SystemHelper.Log(string.format("=================index=%d: %d", index, heroId))
					this.SelectHero(2, heroId)
				else
					SystemHelper.Log(string.format("-----------------index=%d: %d", index, heroId))
				end
			end)
			selectBtn:SetParentScroll(scrollHeroList)

			if index == 2 then
				selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "HeroSel" .. index + 1)
			elseif index == loaderHeroList.loadCount then
				selectBtn:SetAdjacent(XButton.Adjacent.UP, "HeroSel" .. index - 1)
			else
				selectBtn:SetAdjacent(XButton.Adjacent.DOWN, "HeroSel" .. index + 1)
				selectBtn:SetAdjacent(XButton.Adjacent.UP, "HeroSel" .. index - 1)
			end

			if index == 1 then
				com.gameObject:SetActive(false)
			end

			if selectedHeroId > 0 and heroId == selectedHeroId then
				selectedHeroIndex = index

				SystemHelper.Log(string.format("Chosen Hero: %d - %d", selectedHeroIndex, heroId))
			end

			panelHero.loadCount = panelHero.loadCount + 1

			if panelHero.loadCount == panelHero.heroCount then
				panelHero.loadFinish = true

				UIManager.MovieMode(false)
			end
		end

		loaderHeroList:PreloadTemplate(function()
			loaderHeroList:Load()
		end)
	end

	pathAnim = {}
	pathAnim.srcId = {
		0,
		0
	}
	pathAnim.desId = {
		0,
		0
	}
	pathAnim.trails = {}
	this.loadFinish = true

	MapViewCtrl.OpenMapView()
end

function MapViewCtrl.OpenMapView()
	stepMapView = MapViewCtrl.Step.OpenMap
	stepOpenMap = MapViewCtrl.OpenMap.Init
end

function MapViewCtrl.OpenHeroView()
	return
end

function MapViewCtrl.UpdateOpeningMap()
	if stepOpenMap == MapViewCtrl.OpenMap.Init then
		if table.nums(focusPos.focused) > 0 then
			stepOpenMap = MapViewCtrl.OpenMap.FocusInit
		else
			stepOpenMap = MapViewCtrl.OpenMap.SiteInit
		end

		FS_UserData.story:RevalidateStageMap()
		controllerGameMode:Save(ControllerStoryMode.SaveType.SaveMenu)
	elseif stepOpenMap == MapViewCtrl.OpenMap.FocusInit then
		local pos = Vector3.zero
		local sitePos = focusPos.sitePos
		local focused = focusPos.focused
		local count = table.nums(focused)

		for idx = 1, count do
			local siteIdx = focused[idx]

			pos = pos + sitePos[siteIdx]

			local site = panelMap.sites[siteIdx]

			if site then
				site.show = true
				site.status = Mathf.Abs(site.status)
			end
		end

		pos = pos:Div(count)
		pos = this.FocusPosCurrection(pos.x, pos.y)

		local oriPos = panelMap.mapContent.transform.localPosition

		focusPos.originalPos = oriPos
		focusPos.targetPos = pos
		focusPos.svNormalizedPos = this.NormalizeFocusPos(-pos.x, -pos.y)
		focusPos.timestamp = TimeHelper.getNowTimeNoScale()
		focusPos.elapsedTime = 0
		focusPos.animationTime = 0.5
		panelMap.comScrollRect.normalizedPosition = focusPos.svNormalizedPos
		focusPos.focused = {}
		stepOpenMap = MapViewCtrl.OpenMap.FocusRun
	elseif stepOpenMap == MapViewCtrl.OpenMap.FocusRun then
		stepOpenMap = MapViewCtrl.OpenMap.FocusEnd
	elseif stepOpenMap == MapViewCtrl.OpenMap.FocusEnd then
		stepOpenMap = MapViewCtrl.OpenMap.SiteInit
	elseif stepOpenMap == MapViewCtrl.OpenMap.SiteInit then
		local queue = animCtrl.sites

		for _, anim in pairs(queue) do
			if anim then
				AudioCtrl.SetUIAudio("map_new")
				anim:SetTrigger("Appear")
			end
		end

		animCtrl.siteCount = table.nums(queue)
		queue = animCtrl.masks

		for _, anim in pairs(queue) do
			if anim then
				anim:SetBool("start", true)
			end
		end

		animCtrl.maskCount = table.nums(queue)
		stepOpenMap = MapViewCtrl.OpenMap.SiteRun
	elseif stepOpenMap == MapViewCtrl.OpenMap.SiteRun then
		local siteQ = animCtrl.sites

		for idx, anim in pairs(siteQ) do
			local animState = anim:GetCurrentAnimatorStateInfo(0)

			if animState:IsName("New_state_empty_1") and animState.normalizedTime > 1 then
				anim:ResetTrigger("Appear")
				anim:SetTrigger("Back")

				local site = panelMap.sites[idx]

				site.state:SetActive(true)
				site.animState:SetTrigger("normal")

				animCtrl.siteCount = animCtrl.siteCount - 1
			end
		end

		if animCtrl.siteCount <= 0 then
			animCtrl.sites = {}
		end

		local maskQ = animCtrl.masks

		for idx, anim in pairs(maskQ) do
			local animState = anim:GetCurrentAnimatorStateInfo(0)

			if animState:IsName("Mask_scale") and animState.normalizedTime > 1 then
				anim:SetBool("normal", true)
				anim:SetBool("start", false)

				animCtrl.maskCount = animCtrl.maskCount - 1
			end
		end

		if animCtrl.maskCount <= 0 then
			animCtrl.masks = {}
		end

		if animCtrl.siteCount <= 0 and animCtrl.maskCount <= 0 then
			stepOpenMap = MapViewCtrl.OpenMap.SiteEnd
		end
	elseif stepOpenMap == MapViewCtrl.OpenMap.SiteEnd then
		stepOpenMap = MapViewCtrl.OpenMap.PortalInit
	elseif stepOpenMap == MapViewCtrl.OpenMap.PortalInit then
		local queue = animCtrl.portals

		for pId, anim in pairs(queue) do
			if anim then
				anim:SetBool("start", true)
			end
		end

		stepOpenMap = MapViewCtrl.OpenMap.PortalRun
	elseif stepOpenMap == MapViewCtrl.OpenMap.PortalRun then
		local portalQ = animCtrl.sites
		local portalQCount = 0
		local portalQCountMax = table.nums(portalQ)

		for idx, anim in pairs(portalQ) do
			local animState = anim:GetCurrentAnimatorStateInfo(0)

			if animState:IsName("Site_portal_normal") and animState.normalizedTime > 1 then
				anim:SetBool("normal", false)
				anim:SetBool("start", false)

				portalQCount = portalQCount + 1
			end
		end

		if portalQCount == portalQCountMax then
			stepOpenMap = MapViewCtrl.OpenMap.PortalEnd
		end
	elseif stepOpenMap == MapViewCtrl.OpenMap.PortalEnd then
		animCtrl.portals = {}
		stepOpenMap = MapViewCtrl.OpenMap.End
	elseif stepOpenMap == MapViewCtrl.OpenMap.End then
		stepMapView = MapViewCtrl.Step.ViewMap

		this.SetSpotSelected(false)
		this.ShowSiteInfo(99, 0)
		FS_UserData.story:RevalidateStageMap()
	end
end

function MapViewCtrl.StartHidingCursor()
	local tween = Tween:new(panelMap.cursorCg)

	tween:SetAutoKill(true)
	tween:MoveTo({
		alpha = 0
	}, 0.2)
	tween:Start()
end

function MapViewCtrl.CheckSpot(x, y)
	local siteId = 0
	local portalId = 0
	local cx = 0
	local cy = 0

	if panelMap then
		local sites = panelMap.sites

		if sites then
			local vec2 = Vector2.New(x, y)

			for i = 1, siteCount do
				local site = sites[i]
				local portals = site.portals

				if portals ~= nil then
					for j = 0, 3 do
						local portal = portals[j]

						if portal and portal.show then
							local osTest = vec2 - portal.pos

							if osTest.sqrMagnitude < MapViewCtrl.SpotSqrRadius then
								siteId = i
								portalId = j

								local pos = portal.pos

								cx = pos.x
								cy = pos.y

								break
							end
						end
					end
				end
			end
		end
	end

	return siteId, portalId, cx, cy
end

function MapViewCtrl.HideCursorAt(cx, cy)
	if panelMap and panelMap.cursor then
		if panelMap.showCursor then
			panelMap.showCursor = false
			panelMap.cursorCg.alpha = 0
		end

		local vec2 = panelMap.cursor.transform.localPosition

		vec2.x = cx
		vec2.y = cy
		panelMap.cursor.transform.localPosition = vec2
	end
end

function MapViewCtrl.InitCursorPos(siteId, portalId)
	if panelMap and panelMap.cursor then
		-- block empty
	end
end

function MapViewCtrl.GetNearestBtnPoint(x, y)
	if panelMap then
		local minDistance = 9999
		local nearestBtnVec = Vector2.zero
		local nearestBtnName
		local vec2 = Vector2.New(x, y)
		local vecDict = panelMap.portalVecDict
		local staDict = panelMap.portalStaDict

		for k, v in pairs(vecDict) do
			if staDict[k] then
				local distance = Vector2.Distance(vec2, v)

				if distance < minDistance then
					minDistance = distance
					nearestBtnVec = v
					nearestBtnName = k
				end
			end
		end

		panelMap.nearestBtnVec2:Set(nearestBtnVec.x, nearestBtnVec.y)

		return nearestBtnName
	end

	return nil
end

function MapViewCtrl.UpdateCursor()
	if panelMap then
		local lName = UILayerCtrl.GetCurrentLayerName()

		if lName == "MapView" then
			local cursorPos = panelMap.cursor.transform.localPosition
			local x = cursorPos.x
			local y = cursorPos.y

			if panelMap.isMovingCursor then
				panelMap.isMovingCursor = false
				panelMap.firstTimeStopCursor = true
				panelMap.nearestBtnName = this.GetNearestBtnPoint(x, y)

				if panelMap.nearestBtnName and panelMap.nearestBtnVec2 then
					panelMap.currVec2:Set(x, y)

					local vec = panelMap.nearestBtnVec2 - panelMap.currVec2

					if vec.sqrMagnitude > MapViewCtrl.EscapeSqrRadius then
						this.SetSpotSelected(false)
						this.ShowSiteInfo(99, 0)
					end
				end

				return
			end

			if panelMap.firstTimeStopCursor then
				panelMap.firstTimeStopCursor = false
				panelMap.cursorSpeed = 0.02
				panelMap.cursorPercent = 0

				panelMap.oriVec2:Set(x, y)

				panelMap.nearestBtnName = this.GetNearestBtnPoint(x, y)
			end

			if panelMap.selectedBtnName == nil then
				if panelMap.nearestBtnName and panelMap.nearestBtnVec2 then
					panelMap.currVec2:Set(x, y)

					local vec = panelMap.nearestBtnVec2 - panelMap.currVec2

					if vec.sqrMagnitude < MapViewCtrl.EscapeSqrRadius then
						if vec.sqrMagnitude > MapViewCtrl.SpotSqrRadius then
							panelMap.cursorPercent = panelMap.cursorPercent + panelMap.cursorSpeed

							local tmpPos = Vector2.Lerp(panelMap.oriVec2, panelMap.nearestBtnVec2, panelMap.cursorPercent)

							panelMap.cursor.transform.localPosition = tmpPos
							panelMap.cursorSpeed = panelMap.cursorSpeed + 0.015
							panelMap.isSeSelectedPlayed = false
						else
							panelMap.cursor.transform.localPosition = panelMap.nearestBtnVec2
							panelMap.selectedBtnName = panelMap.nearestBtnName

							UILayerCtrl.OnButtonClick("Map_Cursor")
						end
					else
						this.SetSpotSelected(false)
						this.ShowSiteInfo(99, 0)
					end

					local gameFps = LS_Setting.FrameRate[LS_Setting.graphics.framerate]

					if gameFps == -1 then
						gameFps = 144
					end

					local rate = 0.12

					x, y = this.UpdateSRM(x + vec.x * rate * (60 / gameFps), y + vec.y * rate * (60 / gameFps), vec.x, vec.y)

					panelMap.currVec2:Set(x, y)
				end
			else
				panelMap.currVec2:Set(x, y)

				local vec = panelMap.nearestBtnVec2 - panelMap.currVec2

				if vec.sqrMagnitude < MapViewCtrl.EscapeSqrRadius then
					if vec.sqrMagnitude > MapViewCtrl.SpotSqrRadius then
						this.ShowPortalDiagram(false)

						panelMap.isSeSelectedPlayed = false
					elseif selectedSiteId ~= 99 and selectedPortalId > 0 then
						this.ShowPortalDiagram(true)
					end
				end
			end
		end
	end
end

function MapViewCtrl.SetCursorMove(dx, dy, touch)
	if panelMap and panelMap.cursor then
		panelMap.isMovingCursor = true

		if not panelMap.showCursor then
			panelMap.showCursor = true
			panelMap.cursorCg.alpha = 1
		end

		local vec2 = panelMap.cursor.transform.localPosition
		local gameFps = 1 / deltaTime
		local rate = 0.12

		vec2.x, vec2.y = this.UpdateSRM(vec2.x + dx * rate * (60 / gameFps), vec2.y + dy * rate * (60 / gameFps), dx, dy)

		panelMap.tStuckInVec2:Set(dx, dy)

		local siteId, portalId, cx, cy = this.CheckSpot(vec2.x, vec2.y)

		if siteId and panelMap.tStuckInVec2.sqrMagnitude < MapViewCtrl.SpotSqrRadius and cx > 0 and cy > 0 then
			vec2.x = cx
			vec2.y = cy
			panelMap.cursor.transform.localPosition = vec2
		else
			panelMap.cursor.transform.localPosition = vec2
			panelMap.selectedBtnName = nil

			this.ShowPortalDiagram(false)
		end
	end
end

function MapViewCtrl.SetCursorAt(x, y)
	if panelMap and panelMap.cursor then
		local vec2 = Vector2.New(x, y)

		panelMap.cursor.transform.localPosition = vec2
	end
end

function MapViewCtrl.SetCarriagePosition(x, y)
	if panelMap and panelMap.carriage then
		local vec2 = Vector2.New(x, y)

		panelMap.carriage.transform.localPosition = vec2
	end
end

function MapViewCtrl.SelectPortal(siteId, portalId, x, y, portalIdx)
	this.SetSpotSelected(true, x, y)
	this.SetCursorAt(x, y)
	this.SetDestination(siteId, portalIdx)
	this.ShowSiteInfo(siteId, portalId)

	panelMap.isMovingCursor = true
end

function MapViewCtrl.SelectFogArea()
	this.ClearDestination()
	this.SetSpotSelected(false)

	if not panelMap.showCursor and LS_Setting.isJoystickConnected then
		panelMap.showCursor = true

		panelMap.cursor.gameObject:SetActive(true)
	end

	this.ShowSiteInfo(99, 0)
end

function MapViewCtrl.SetDefaultHero()
	return
end

function MapViewCtrl.ShowMapView(show)
	if panelMap.go and panelMap.show ~= show then
		panelMap.show = show

		panelMap.go:SetActive(show)

		if show then
			this.SetUIPostProcessMap()
			this.RevalidateCurrentLocation()
		else
			this.SetUIPostProcessNormal()
		end
	end
end

function MapViewCtrl.ClosePanelMap()
	MapViewCtrl.ShowMapView(false)
end

function MapViewCtrl.RevalidateCurrentLocation()
	for idx, site in pairs(panelMap.sites) do
		if site then
			if site.show then
				site.go:SetActive(site.show)

				if site.status > 0 then
					if site.anim then
						site.anim:ResetTrigger("Back")
						site.anim:SetTrigger("Back")
					end

					if site.maskAnim then
						site.maskAnim:SetBool("normal", true)
					end
				end
			end

			if site.animState then
				if idx == currentLocation then
					site.animState:SetTrigger("click")
				else
					site.animState:SetTrigger("normal")
				end
			end

			local portals = site.portals

			if portals ~= nil then
				for pid, portal in pairs(portals) do
					if portal and portal.show and portal.anim then
						portal.go:SetActive(portal.show)
						portal.anim:SetBool("normal", true)
					end
				end
			end
		end
	end
end

function MapViewCtrl.UpdateSitesAndPortals()
	return
end

function MapViewCtrl.SetSpotSelected(show, x, y)
	if panelMap and panelMap.selected then
		if not panelMap.showSelected and not show then
			return
		end

		local selected = panelMap.selected

		if show then
			selected:SetActive(false)
		end

		panelMap.showSelected = show

		selected:SetActive(show)

		if x and y then
			panelMap.selected.transform.localPosition = Vector2.New(x, y)
		end
	end
end

function MapViewCtrl.ShowPortalDiagram(show, siteId, portalId, clearFlag)
	siteId = tonumber(siteId)
	portalId = tonumber(portalId)

	if panelMap and panelMap.portalDiagram then
		local panel = panelMap.portalDiagram

		if clearFlag ~= nil and clearFlag == true then
			panel.image.gameObject:SetActive(false)
		end

		if panel.show ~= show then
			panel.show = show

			if siteId == nil and portalId == nil then
				panel.go:SetActive(show)

				return
			end
		end

		if siteId ~= nil and portalId ~= nil then
			panel.sitelId = siteId
			panel.portalId = portalId

			SystemHelper.Log("Site ID: " .. siteId .. ", Portal ID: " .. portalId)

			if panel.show and siteId ~= 99 and portalId ~= 0 then
				loadingLock = true

				local siteData = MS_SiteInfo.GetSite(siteId)
				local portalData = MS_SiteInfo.GetPortal(portalId)

				panel.name:SetContent(siteData.Name .. " -- " .. portalData.Name)

				local imgName = "portal" .. portalId

				XObjectPool.LoadImage(imgName, function()
					local sprite = XObjectPool.GetImage(imgName)

					if sprite then
						panel.image:SetSprite(sprite)
						panel.image.gameObject:SetActive(true)

						loadingLock = false
					end

					panel.go:SetActive(panel.show)
				end)

				panelMap.cursor.transform.localPosition = panelMap.selected.transform.localPosition

				local posW = panelMap.selected.transform.position
				local scrPos = uiCamera:WorldToScreenPoint(posW)
				local cursorScrPos = scrPos
				local cursorX = cursorScrPos.x
				local cursorY = cursorScrPos.y
				local scrCtrX = 0.5 * LS_Setting.screenWidth
				local scrCtrY = 0.5 * LS_Setting.screenHeight

				SystemHelper.Log("( " .. cursorX .. ", " .. cursorY .. " )")

				local offsetX = scrCtrX < cursorX and -166 or 166
				local offsetY = scrCtrY < cursorY and -133 or 133

				panel.go.transform.localPosition = Vector3.New(offsetX, offsetY, 0)
			else
				panel.show = false

				panel.go:SetActive(false)
				panel.image.gameObject:SetActive(false)
			end
		end
	end
end

function MapViewCtrl.IsValidDestination(siteId)
	SystemHelper.Log("...IsValidDestination: " .. siteId)

	if siteId < 9 then
		return true
	elseif siteId == 9 and IapData.GetEnterTide() then
		return true
	else
		return false
	end
end

function MapViewCtrl.ShowSiteInfo(siteId, portalId, x, y)
	siteId = tonumber(siteId)
	portalId = tonumber(portalId)

	if panelInfo and panelInfo.go then
		if not panelInfo.show then
			panelInfo.show = true

			panelInfo.go:SetActive(true)
		end

		if selectedSiteId ~= siteId or selectedPortalId ~= portalId then
			selectedSiteId = siteId
			selectedPortalId = portalId
			panelMap.siteId = siteId
			panelMap.portalId = portalId

			local siteData = MS_SiteInfo.GetSite(siteId)
			local isAccessable = portalId > 99

			if isAccessable then
				local portalData = MS_SiteInfo.GetPortal(portalId)

				panelInfo.title:SetContent(siteData.Name .. " -- " .. portalData.Name)
			else
				panelInfo.title:SetContent(siteData.Name)
			end

			panelInfo.intro:SetContent(siteData.Description)

			panelInfo.showBtnOK = isAccessable

			panelInfo.btnOK.gameObject:SetActive(isAccessable)

			panelMap.showBtnFog = isAccessable

			panelMap.btnFog.gameObject:SetActive(isAccessable)

			local num, total = FS_UserData.story:GetFrogStoryFinishCount(siteId)

			panelFrog.go:SetActive(total > 0)
			panelFrog.txtNum:SetContent(num)
			panelFrog.txtTotal:SetContent(total)
			this.ShowPortalDiagram(false, nil, nil, true)
			this.ShowPortalDiagram(true, siteId, portalId)
		end
	end
end

function MapViewCtrl.CloseSiteInfo()
	if panelInfo.go and panelInfo.show then
		panelInfo.show = false

		panelInfo.go:SetActive(false)

		panelMap.showBtnFog = false

		panelMap.btnFog.gameObject:SetActive(false)
	end

	if selectedSiteId > 0 then
		selectedSiteId = 0
	end

	if selectedPortalId > 0 then
		selectedPortalId = 0
	end
end

function MapViewCtrl.SetDestination(siteId, portalId)
	if siteId > 0 then
		destinationSiteId = siteId
	end

	if portalId > 0 then
		destinationPortId = portalId
	end
end

function MapViewCtrl.ClearDestination()
	destinationSiteId = 0
	destinationPortId = 0
end

function MapViewCtrl.ExistsHero(heroID)
	local found = false
	local count = table.nums(heroData)

	for i = 1, count do
		if heroData[i] == heroID then
			found = true

			break
		end
	end

	return found
end

function MapViewCtrl.GetNextAvailableHero()
	local heroId = 0
	local count = table.nums(heroData)

	for i = 1, count do
		if heroData[i] > 10001 then
			heroId = heroData[i]

			break
		end
	end

	return heroId
end

function MapViewCtrl.ShowPanelHero(show)
	if panelHero.go and panelHero.show ~= show then
		panelHero.show = show

		panelHero.go:SetActive(show)

		if show then
			UIManager.SendMessage("Mainmenu", "ShowActionButtons", false)

			if controllerGameMode then
				local heroId = BattleData.GetHeroId()

				if not MapViewCtrl.ExistsHero(heroId) then
					heroId = MapViewCtrl.GetNextAvailableHero()
				end

				BattleData.SetHeroId(heroId)
				controllerGameMode:BeginChoosingHero(heroId)
				controllerGameMode:ChangeStatus(ControllerStoryMode.Status.SelectHero)
			end

			UILayerCtrl.Push("MapHero", string.format("HeroSel%d", selectedHeroIndex))
			UILayerCtrl.OnCursorClick()
		else
			UILayerCtrl.Pop()

			if controllerGameMode then
				controllerGameMode:ExitChoosingHero()
				controllerGameMode:ChangeStatus(ControllerStoryMode.Status.MapOpen)
			end

			UIManager.SendMessage("Mainmenu", "ShowActionButtons", true)
		end
	end
end

function MapViewCtrl.OpenPanelHero()
	MapViewCtrl.ShowMapView(false)
	UIManager.SendMessage("Mainmenu", "ShowMapBg", false)
	sceneController:ExitMenu()
	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
	UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
	this.ShowPanelHero(true)
end

function MapViewCtrl.ClosePanelHero()
	AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

	selectedHeroId = 0

	this.ShowPanelHero(false)
	sceneController:EnterMenu(true)
	UIManager.SendMessage("Mainmenu", "ShowMapBg", true)
	MapViewCtrl.ShowMapView(true)
end

function MapViewCtrl.SelectHero(posIdx, heroId)
	selectedHeroId = heroId

	if controllerGameMode then
		controllerGameMode:LoadHeroFromMap(posIdx, 0)
		controllerGameMode:LoadHeroFromMap(posIdx, heroId)
		AudioCtrl.SetUIAudio("pick_carriage")
	end
end

function MapViewCtrl.StartOff(heroId, sceneId, portalId)
	if controllerGameMode then
		this.SetDelayRelease(true)
		controllerGameMode:StartOff(heroId, sceneId, portalId)
	end
end

function MapViewCtrl.CheckStartOff()
	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_COMMON_START_OFF, function()
		this.StartOff(selectedHeroId, destinationSiteId, destinationPortId)
	end, function()
		return
	end, false)
end

function MapViewCtrl.ClosePanel()
	if stepMapView == MapViewCtrl.Step.ViewMap then
		UILayerCtrl.OnButtonClick("Map_PanelMap_BtnClose")
	end
end

function MapViewCtrl.ConfirmSelection()
	this.OpenPanelHero()
end

function MapViewCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "MapView" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			if panelInfo.showBtnOK then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
				MapViewCtrl.ConfirmSelection()
			end
		elseif inputMgr:GetButtonUp(GBKey.B) and stepMapView == MapViewCtrl.Step.ViewMap then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
			MapViewCtrl.ClosePanel()
		end
	elseif lName == "MapHero" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnButtonClick("Map_PanelHero_BtnStart")
		elseif inputMgr:GetButtonUp(GBKey.B) then
			UILayerCtrl.OnButtonClick("Map_PanelHero_BtnBack")
		end
	end
end

function MapViewCtrl.JPadPress(dir)
	local button, adjacent = UILayerCtrl.Select(dir)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "MapHero" and adjacent then
		UILayerCtrl.OnCursorClick()
	end
end

function MapViewCtrl.JPadLongPress(pos)
	this.JPadPress(pos)
end

function MapViewCtrl.DPadPress(dir)
	this.JPadPress(dir)
end

function MapViewCtrl.DPadLongPress(pos)
	this.DPadPress(pos)
end

function MapViewCtrl.Update()
	if not this.loadFinish or not panelHero.loadFinish then
		return
	end

	deltaTime = TimeHelper.getDeltaTime()

	if delayStartOffCount > 0 then
		delayStartOffCount = delayStartOffCount - 1

		if delayStartOffCount == 0 then
			this.StartOff(selectedHeroId, destinationSiteId, destinationPortId)
		end

		return
	end

	this.GamePadControl()

	if stepMapView == MapViewCtrl.Step.InitMap then
		-- block empty
	elseif stepMapView == MapViewCtrl.Step.OpenMap then
		this.UpdateOpeningMap()
	elseif stepMapView == MapViewCtrl.Step.ViewMap then
		this.UpdateCursor()
	elseif stepMapView == MapViewCtrl.Step.ChooseHero then
		-- block empty
	elseif stepMapView == MapViewCtrl.Step.Departure then
		-- block empty
	end
end

function MapViewCtrl.Close()
	MapViewCtrl.ShowMapView(false)

	if loaderHeroList ~= nil then
		loaderHeroList:ClearTemplate()
	end

	XObjectPool.ClearImage()

	loadingLock = false

	sceneController:ExitMenu()
	UICtrlBase.Close("MapView")
end

function MapViewCtrl.SetDelayRelease(flag)
	MapViewCtrl.delayRelease = false
end

function MapViewCtrl.StartRoute()
	local camera = tfUiCamera:GetComponent("Camera")

	camera.depth = 100

	if panelHero.go and panelHero.show then
		panelHero.show = false

		panelHero.go:SetActive(false)
	end

	if panelMap.go and not panelMap.show then
		panelMap.show = true

		panelMap.go:SetActive(true)
	end
end

function MapViewCtrl.EndRoute()
	MapViewCtrl.ShowMapView(false)
end

function MapViewCtrl.FocusPosCurrection(x, y)
	local refSizes = focusPos.refSizes
	local validRect = refSizes.validRect

	if x < validRect.bl.x then
		x = validRect.bl.x
	elseif x > validRect.tr.x then
		x = validRect.tr.x
	end

	if y < validRect.bl.y then
		y = validRect.bl.y
	elseif y > validRect.tr.y then
		y = validRect.tr.y
	end

	x = x - refSizes.scrHW
	y = y - refSizes.scrHH

	local pos = Vector3.New(x, y, 0)

	pos = pos:Mul(-1)

	return pos
end

function MapViewCtrl.NormalizeFocusPos(x, y)
	local refSizes = focusPos.refSizes

	x = x / refSizes.refW
	y = y / refSizes.refH

	local pos = Vector2.New(x, y)

	return pos
end

return MapViewCtrl
