-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/MainmenuCtrl.lua

MainmenuCtrl = class("MainmenuCtrl", UICtrlBase)

local this = MainmenuCtrl

this.uilayer = UICtrlBase.UILayer.Base
MainmenuCtrl.static.LockButtonState = {
	LockedOn = 2,
	Enabled = 1,
	Disabled = 0
}
MainmenuCtrl.static.ProgressBarType = {
	GatherReward = 1,
	OccupySpot = 2
}
MainmenuCtrl.static.SpotName = {
	SpotB = 2,
	SpotA = 1,
	SpotD = 4,
	SpotC = 3,
	Center = 5
}
MainmenuCtrl.static.Distance = {
	Far = 3,
	Medium = 2,
	VeryFar = 4,
	Near = 1
}
MainmenuCtrl.static.DefeatingType = {
	Defeating = 1,
	Defeated = 2
}
MainmenuCtrl.static.SanityThreshold = {
	Warning = 3,
	Zero = 5,
	Caution = 2,
	Crazy = 4,
	Normal = 1
}
MainmenuCtrl.static.SanityColor = {
	{
		1,
		1,
		1,
		1
	},
	{
		0.9137254901960784,
		0.6823529411764706,
		0.4392156862745098,
		1
	},
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		1,
		1,
		1
	}
}
MainmenuCtrl.static.RageAvailableThreshold = 30
MainmenuCtrl.static.Rage = {
	Type1 = 1,
	Type5 = 5,
	Default = 6,
	Type4 = 4,
	Type3 = 3,
	Type2 = 2
}
MainmenuCtrl.static.RageColor = {
	{
		0.8313725490196079,
		0.592156862745098,
		0.3411764705882353,
		1
	},
	{
		0.596078431372549,
		0.23921568627450981,
		0.25098039215686274,
		1
	},
	{
		0.3215686274509804,
		0.35294117647058826,
		0.5647058823529412,
		1
	},
	{
		0.4196078431372549,
		0.45098039215686275,
		0.3176470588235294,
		1
	},
	{
		0.6039215686274509,
		0.3568627450980392,
		0.41568627450980394,
		1
	},
	{
		0.4117647058823529,
		0.4117647058823529,
		0.4117647058823529,
		1
	},
	{
		0.21176470588235294,
		0.5568627450980392,
		0.28627450980392155,
		1
	},
	{
		1,
		1,
		1,
		1
	}
}
MainmenuCtrl.static.RageColorIndex = {
	{
		1
	},
	{
		1,
		2,
		3
	},
	{
		7,
		7,
		7
	},
	{
		1
	},
	{
		1
	},
	{
		1
	},
	{
		8,
		1
	}
}
MainmenuCtrl.static.KarmaColorIndex = {
	{
		0
	},
	{
		0
	},
	{
		1,
		3
	},
	{
		2
	},
	{
		5
	},
	{
		0
	},
	{
		2,
		3
	}
}
MainmenuCtrl.static.BulletColor = {
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		0.6627450980392157,
		0.5529411764705883,
		1
	},
	{
		0.596078431372549,
		0.8666666666666667,
		1,
		1
	}
}
MainmenuCtrl.static.BulletTxtColor = {
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		1,
		1,
		1
	},
	{
		1,
		1,
		1,
		1
	}
}
MainmenuCtrl.static.SkillBtnPos = {
	{
		-64,
		220,
		100,
		100
	},
	{
		-186,
		186,
		100,
		100
	},
	{
		-230,
		64,
		100,
		100
	},
	{
		-88,
		56,
		100,
		100
	},
	{
		-186,
		298,
		64,
		64
	},
	{
		-72,
		330,
		100,
		100
	},
	{
		-306,
		152,
		100,
		100
	}
}
MainmenuCtrl.static.BtnTPC = {
	LOCKON = "Button_LockPlayer_RB",
	SKILL1 = "Button_Skill1_RB",
	CHANGEHERO = "Button_ChangeHero_R",
	SKILL4 = "Button_Skill4_RB",
	ITEMS2 = "ComsumeItemPanel_B",
	MOVE = "Panel_Joystick_Move_LB",
	PLAYERINFO = "Button_PlayerInfo_L",
	SKILL2 = "Button_Skill2_RB",
	MOVEFIXED = "Panel_Joystick_Move_Bg",
	SKILL5 = "Button_Skill5_RB",
	ACTION = "Panel_Actions_RB",
	ITEMS1 = "QuickItemPanel_B",
	SKILL3 = "Button_Skill3_RB",
	SETTINGS = "Button_Settings_L",
	SKILL6 = "Button_Skill6_RB"
}
MainmenuCtrl.static.BtnToHide = {
	"Button_Skill1_RB",
	"Button_Skill2_RB",
	"Button_Skill3_RB",
	"Button_Skill4_RB",
	"Button_Skill5_RB",
	"Button_LockPlayer_RB",
	"Button_PlayerInfo_L",
	"Button_Settings_L"
}
MainmenuCtrl.static.DialogType = {
	ControllerMain.AssistButton.Picking,
	ControllerMain.AssistButton.Carriage,
	ControllerMain.AssistButton.Door
}
MainmenuCtrl.static.TimeLineType = {
	ControllerMain.AssistButton.Picking,
	ControllerMain.AssistButton.Carriage,
	ControllerMain.AssistButton.Door,
	ControllerMain.AssistButton.Elevator
}
MainmenuCtrl.static.DialogBtnText = {
	"UI_COMMON_ACTION_VIRTUALWALLHINT",
	"UI_COMMON_ACTION_RINGBELL",
	"UI_COMMON_ACTION_DOOR"
}
MainmenuCtrl.static.TimeLineBtnText = {
	"UI_COMMON_ACTION_VIRTUALWALLHINT",
	"UI_COMMON_ACTION_RINGBELL",
	"UI_COMMON_ACTION_DOOR",
	"UI_COMMON_ACTION_ELEVATOR"
}
MainmenuCtrl.static.SubPanel = {
	GeneralSettings = 1,
	GamePadSettings = 2
}
MainmenuCtrl.static.SkillBtnMode = {
	Mode2 = 2,
	SkillBtnMax = 6,
	Mode1 = 1,
	ModeMax = 2
}
MainmenuCtrl.static.TaskType = {
	Mainplot = 1,
	Subplot = 2
}
MainmenuCtrl.static.QuickItemSlowTime = 0.1
MainmenuCtrl.static.Poi = {
	Vec3 = 2,
	Life = 1
}

local panelRoot, panelPlayer, MiniMap_Image_Arrow, Text_Time
local skillBtn = {}
local skillIcon = {}
local skillDrag = {}
local skillJoystickArrow, imageSightCenter, imageSightCenterAnimator
local dragPosition = Vector3.zero
local dragButton, dragStart
local dragDegree = 0
local canDrag = false
local actionBtn = {}
local joystickControllerForMove
local deltaAxis = Vector2.zero
local lastRightXAxis = 0
local lastRightYAxis = 0
local isUseGamePadAxis = false
local isTriggerOn = false
local holdingTime, btnLockPlayer, btnChangeLock, lockDragStart, lockDragPosition
local previousLocked = -1
local playerStatus, oppositeStatus, uiReborn, panelDeath, panelChangeResult, panelArcadeResult, uiBottle, uiPaneL, uiPanelB, uiPanelMessage, uiProgress

require("LuaScript/UI/Controller/MainmenuPVE")

local uiCamera, scCamera, scrRect, hudRect, hudIcons, hudNpcMargin, timeRecord, scoreRecord, panelItems, quickItemBtn, longPressClock, SelectItemPanel, ItemSlotList, ItemBtn1, ItemBtn2, quickItem
local currentItemIndex = 1
local joystickIcons, keyboardIcons
local guide = {}
local sceneController
local triggerAxis = 0
local panelSys, panelMap
local debugPanel = {}
local fullscreenPanels, vfx_SanCameraTF
local delayLoad = 0
local lateUpdateTbl

MainmenuCtrl.static.NoneBtn = 0
MainmenuCtrl.static.FuncBtn = 1

local btnTypeInHandling = MainmenuCtrl.NoneBtn
local delayAutoAdaption = 0
local isPointerLicked = true

function MainmenuCtrl.OnCreate()
	this.loadFinish = false
	btnTypeInHandling = MainmenuCtrl.NoneBtn
	dragStart = false
	canDrag = false
	dragButton = 0
	holdingTime = {
		SL = 0,
		RB = 0,
		LB = 0
	}
	sceneController = ST_Main.GetSceneController()

	UILayerCtrl.SetSceneController(sceneController)

	panelRoot = {}
	panelRoot.isInteractive = true
	panelRoot.blocksRaycasts = true
	panelRoot.show = true
	panelRoot.depthLv = 0
	panelRoot.go = this.mainComponent:GetGameObject("Panel_MainGroup")
	panelRoot.cg = panelRoot.go.transform:GetComponent("CanvasGroup")
	panelRoot.isFadingInOut = 0

	local tw = Tween:new(panelRoot.cg)

	tw:SetAutoKill(false)
	tw:OnStart(function()
		return
	end)
	tw:OnComplete(function()
		panelRoot.cg.alpha = 1
		panelRoot.isFadingInOut = 0
	end)

	panelRoot.twFadeIn = tw

	local tw = Tween:new(panelRoot.cg)

	tw:SetAutoKill(false)
	tw:OnStart(function()
		return
	end)
	tw:OnComplete(function()
		panelRoot.cg.alpha = 0
		panelRoot.isFadingInOut = 0
	end)

	panelRoot.twFadeOut = tw
	fullscreenPanels = {}
	fullscreenPanels.fullMask = this.mainComponent:GetGameObject("Mainmenu_Full_Mask")
	fullscreenPanels.vfx_SanCameraTF = this.mainComponent:GetGameObject("Panel_MainGroup_SanCamera_1").transform

	fullscreenPanels.vfx_SanCameraTF.gameObject:SetActive(false)

	fullscreenPanels.vfx_SanCameraCG = this.mainComponent:GetGameObject("Panel_MainGroup_SanCamera_1"):GetComponent("CanvasGroup")

	UILayerCtrl.Add("GameMain", MainmenuCtrl.PointerClick_Return)
	UILayerCtrl.Add("Control")
	UILayerCtrl.Add("Special")
	UILayerCtrl.Add("Empty")
	UILayerCtrl.Add("UIOff")
	UILayerCtrl.Add("SelectItem", MainmenuCtrl.ClosePanelSelectItem)
	UILayerCtrl.Add("MsgBoxSimple")
	UILayerCtrl.Add("MsgBoxGetItem")
	UILayerCtrl.Add("MsgBoxGuide")
	UILayerCtrl.Add("MsgBoxSlider")
	UILayerCtrl.Push("GameMain", nil)

	local joystickMoveMark = this.mainComponent:GetGameObject("Panel_Joystick_Move_Bg")
	local joystickObj = this.mainComponent:GetGameObject("Panel_Joystick_Move_LB")

	joystickControllerForMove = joystickObj.transform:GetComponent("JoystickController")

	if joystickControllerForMove == nil then
		joystickControllerForMove = joystickObj:AddComponent(typeof(JoystickController))
	end

	if joystickControllerForMove ~= nil then
		sceneController:SetJoystickControllerForMove(joystickControllerForMove)
	end

	local joystickRotationObj = this.mainComponent:GetGameObject("Panel_Joystick_Rotation_RB")
	local joystickControllerForRotation = joystickRotationObj.transform:GetComponent("JoystickController")

	if joystickControllerForRotation == nil then
		joystickControllerForRotation = joystickRotationObj:AddComponent(typeof(JoystickController))
	end

	if joystickControllerForRotation ~= nil then
		sceneController:SetJoystickControllerForRotation(joystickControllerForRotation)
	end

	local GamePadControllerForMovement = joystickObj.transform:GetComponent("GamePadController")

	if GamePadControllerForMovement == nil then
		GamePadControllerForMovement = joystickObj:AddComponent(typeof(GamePadController))
	end

	if GamePadControllerForMovement ~= nil then
		sceneController:SetGamePadControllerForMovement(GamePadControllerForMovement)
	end

	local GamePadControllerForRotation = joystickRotationObj.transform:GetComponent("GamePadController")

	if GamePadControllerForRotation == nil then
		GamePadControllerForRotation = joystickRotationObj:AddComponent(typeof(GamePadController))
	end

	if GamePadControllerForRotation ~= nil then
		sceneController:SetGamePadControllerForRotation(GamePadControllerForRotation)
	end

	local GamePadControllerForDPad = joystickRotationObj:AddComponent(typeof(GamePadController))

	if GamePadControllerForDPad ~= nil then
		sceneController:SetGamePadControllerForDPad(GamePadControllerForDPad)
	end

	lockDragStart = false
	btnChangeLock = this.mainComponent:GetButton("Button_ChangeLock_RB")

	btnChangeLock:SetAudioEnable(false)
	btnChangeLock:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		lockDragStart = true

		this.RecordTouchEvent()
	end, 0)
	btnChangeLock:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		return
	end, 0)
	btnChangeLock:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		lockDragStart = false
		lockDragPosition = this.GetLockChangeOffset(data)

		this.PointUp_ChangeLockPlayer(lockDragPosition.x, lockDragPosition.y)
	end, 0)
	btnChangeLock.gameObject:SetActive(false)

	skillIcon = {}
	skillIcon.mode = MainmenuCtrl.SkillBtnMode.Mode1
	skillIcon.btnSkillModeText = this.mainComponent:GetText("Main_Input_Skill_BtnModeText")

	skillIcon.btnSkillModeText:SetContent(skillIcon.mode)

	skillIcon.btnSkillMode = this.mainComponent:GetButton("Main_Input_Skill_BtnMode_RB")

	skillIcon.btnSkillMode:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.PointerClick_SkillMode()
	end, 0)

	for i = 1, 6 do
		local button = this.mainComponent:GetButton("Button_Skill" .. i .. "_RB")

		button:SetAudioEnable(false)
		button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if dragStart == false then
				this.PointerClick_Skill(i + (skillIcon.mode - 1) * MainmenuCtrl.SkillBtnMode.SkillBtnMax)
			end
		end, 0)
		button:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			if dragStart == false then
				dragPosition = this.GetTouchWorldPosition(data)

				if i < 4 then
					skillDrag[i].transform.position = dragPosition
				end

				dragStart = true

				this.SetDragButton(i + (skillIcon.mode - 1) * MainmenuCtrl.SkillBtnMode.SkillBtnMax)
				this.PointerDown_Skill(dragButton)
				this.RecordTouchEvent()
			end
		end, 0)
		button:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
			if dragStart == true and dragButton == i + (skillIcon.mode - 1) * MainmenuCtrl.SkillBtnMode.SkillBtnMax then
				dragPosition = this.GetTouchWorldPosition(data)

				this.PointerUp_Skill(dragButton)

				dragStart = false

				this.SetDragButton(0)
			end
		end, 0)
		button:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
			if dragStart == true and dragButton == i + (skillIcon.mode - 1) * MainmenuCtrl.SkillBtnMode.SkillBtnMax then
				dragPosition = this.GetTouchWorldPosition(data)
			end
		end, 0)

		button.empty4Raycast = button.gameObject:GetComponent("Empty4Raycast")

		local tween = Tween:new(button.gameObject:GetComponent("CanvasGroup"))

		tween:SetAutoKill(false)
		tween:MoveTo({
			alpha = 0
		}, 0.7)
		tween:OnComplete(function()
			button.empty4Raycast.enabled = false

			button:SetInteractable(false)
		end)

		button.hiding = tween

		if i < 4 then
			skillDrag[i] = this.mainComponent:GetGameObject(string.format("Image_Drag%d", i))
		end

		skillBtn[i] = button
		skillIcon[i] = XImage:new(this.mainComponent:GetGameObject(string.format("Button_Skill_Icon%d", i)))
	end

	skillBtn[7] = this.mainComponent:GetGameObject("Icon_Skill1_Inactive")

	skillBtn[7]:SetActive(false)

	skillJoystickArrow = this.mainComponent:GetGameObject("Image_Skill_Joystick")
	imageSightCenter = this.mainComponent:GetGameObject("Image_SightCenter")
	imageSightCenterAnimator = nil

	if imageSightCenter ~= nil then
		imageSightCenterAnimator = imageSightCenter:GetComponent("Animator")
	end

	this.HideAllDragPanel()

	debugPanel = {}
	debugPanel.show = false
	panelSys = {}
	panelSys.dpadDnPressed = false
	panelSys.forceHideTouchUI = false
	btn = this.mainComponent:GetButton("Button_TouchEnabler")

	btn:SetAudioEnable(false)

	btn.empty4Raycast = btn.gameObject:GetComponent("Empty4Raycast")

	btn:SetInteractable(false)

	panelSys.iBtnTouchEnabler = false

	btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		MainmenuCtrl.RecordTouchEvent()
	end, 0)

	panelSys.btnTouchEnabler = btn
	btn = this.mainComponent:GetButton("Button_Settings_L")
	btn.empty4Raycast = btn.gameObject:GetComponent("Empty4Raycast")
	panelSys.btnSettings = btn

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not DebugShowCtrlPanel then
			MainmenuCtrl.PointerClick_Return()
		else
			MainmenuCtrl.PointerClick_Return()
		end
	end, 0)
	btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		if DebugShowCtrlPanel then
			-- block empty
		end
	end, 0)

	local tween = Tween:new(btn.gameObject:GetComponent("CanvasGroup"))

	tween:SetAutoKill(false)
	tween:MoveTo({
		alpha = 0
	}, 0.7)
	tween:OnComplete(function()
		btn:SetInteractable(false)
	end)

	btn.hiding = tween

	UILayerCtrl.AddIndividual("GameMain", "Button_Settings_L", btn)

	if AppVer == AppAppleDemo then
		btn.gameObject:SetActive(false)
	end

	btn = this.mainComponent:GetButton("Button_PlayerInfo_L")
	btn.empty4Raycast = btn.gameObject:GetComponent("Empty4Raycast")
	panelSys.btnPlayerInfo = btn

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.PointerClick_OpenPlayerInfo()
	end, 0)
	btn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		return
	end, 0)

	local tween = Tween:new(btn.gameObject:GetComponent("CanvasGroup"))

	tween:SetAutoKill(false)
	tween:MoveTo({
		alpha = 0
	}, 0.7)
	tween:OnComplete(function()
		btn:SetInteractable(false)
	end)

	btn.hiding = tween

	UILayerCtrl.AddIndividual("GameMain", "Button_PlayerInfo_L", btn)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		-- block empty
	else
		btn.gameObject:SetActive(false)
	end

	if AppVer == AppAppleDemo then
		btn.gameObject:SetActive(false)
	end

	Text_Time = this.mainComponent:GetText("Panel_Occupy_Timer")

	this.SetBattleTime(0)

	btnLockPlayer = this.mainComponent:GetButton("Button_LockPlayer_RB")

	btnLockPlayer:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		this.PointerClick_LockPlayer()
	end, 0)
	btnLockPlayer:SetDisabled()

	local tween = Tween:new(btnLockPlayer.gameObject:GetComponent("CanvasGroup"))

	tween:SetAutoKill(false)
	tween:MoveTo({
		alpha = 0
	}, 0.7)
	tween:OnComplete(function()
		btnLockPlayer:SetInteractable(false)
	end)

	btnLockPlayer.hiding = tween
	panelPlayer = {}
	panelPlayer.status = this.mainComponent:GetGameObject("Panel_Blood_B")
	panelPlayer.bottle = this.mainComponent:GetGameObject("Panel_MainGroup_Panel_Bottle_B")
	panelPlayer.guardModeTask = this.mainComponent:GetGameObject("Mainmenu_PanelTask_R")
	panelPlayer.showBullet = false

	local pnlBullet = {}

	pnlBullet.go = this.mainComponent:GetGameObject("Main_Rage_Bullet")
	pnlBullet.tf = pnlBullet.go.transform

	pnlBullet.go:SetActive(panelPlayer.showBullet)

	pnlBullet.color = {}
	pnlBullet.color[1] = {
		1,
		1,
		1,
		1
	}
	pnlBullet.color[2] = {
		0.34509803921568627,
		0.49019607843137253,
		0.8235294117647058,
		1
	}
	pnlBullet.color[3] = {
		0.7529411764705882,
		0.29411764705882354,
		0.3607843137254902,
		1
	}
	pnlBullet.currType = 1
	pnlBullet.nextType = 0
	pnlBullet.countLoaded = 0
	pnlBullet.countToLoad = 0
	pnlBullet.countCharged = 0
	pnlBullet.countRemaining = 0
	pnlBullet.isChanging = false
	pnlBullet.isCharging = false
	pnlBullet.isChargingCompleted = false
	pnlBullet.isReloading = false
	pnlBullet.isSpShooting = false
	pnlBullet.iconType = {}
	pnlBullet.iconShow = {}

	for idx = 1, 3 do
		pnlBullet.iconShow[idx] = false
		pnlBullet.iconType[idx] = this.mainComponent:GetGameObject("Main_Rage_Bullet_Indicator_Type" .. idx)
	end

	pnlBullet.txtBulletRemaining = this.mainComponent:GetText("Main_Rage_Bullet_Indicator_RemainingText")

	pnlBullet.txtBulletRemaining:SetContent(GameText.UI_COMMON_INFINITY)

	pnlBullet.txtBulletColor = 1

	local color = MainmenuCtrl.BulletTxtColor[1]

	pnlBullet.txtBulletRemaining:SetColor(color[1], color[2], color[3], color[4])

	pnlBullet.supply = {}
	pnlBullet.isSupplying = false
	pnlBullet.showEfx = false
	pnlBullet.goSupplyEfx = this.mainComponent:GetGameObject("Main_Rage_Bullet_Indicator_Add")
	pnlBullet.goSupplyLight = this.mainComponent:GetGameObject("Main_Rage_Bullet_Indicator_Add_Light")
	pnlBullet.goSupplyCount = this.mainComponent:GetGameObject("Main_Rage_Bullet_Indicator_Add_Text")
	pnlBullet.txtSupplyCount = this.mainComponent:GetText("Main_Rage_Bullet_Indicator_Add_Text")
	pnlBullet.xtwSupplyLight = pnlBullet.goSupplyLight:GetComponent("XTween")
	pnlBullet.xtwSupplyCount = pnlBullet.goSupplyCount:GetComponent("XTween")

	local bulletMax = 6

	pnlBullet.bulletIdx = 0
	pnlBullet.bulletMax = bulletMax

	local bulletSlots = {}

	for i = 1, bulletMax do
		local slot = {}

		slot.idx = i
		slot.showBody = false
		slot.showBulletLt = false
		slot.body = this.mainComponent:GetGameObject("Main_Rage_Slot" .. i)
		slot.goBullet = this.mainComponent:GetGameObject("Main_Rage_Bullet" .. i)
		slot.bullet = XImage:new(slot.goBullet)
		slot.bulletLt = this.mainComponent:GetGameObject("Main_Rage_BulletLt" .. i)
		slot.bulletCg = slot.goBullet:GetComponent("CanvasGroup")
		slot.bulletCg.alpha = 0
		slot.showBullet = false
		slot.xtwBody = slot.body:GetComponent("XTween")
		slot.xtwBulletLt = slot.bulletLt:GetComponent("XTween")
		slot.isLoading = false

		local twBullet = Tween:new(slot.bulletCg)

		twBullet:SetAutoKill(false)
		twBullet:OnComplete(function()
			return
		end)

		slot.twBullet = twBullet
		slot.isRestoring = false

		local twRestore = Tween:new(slot.bulletCg)

		twRestore:SetAutoKill(false)
		twRestore:OnStart(function()
			slot.isRestoring = true

			slot.bulletLt:SetActive(true)
		end)
		twRestore:OnComplete(function()
			slot.isRestoring = false

			slot.bulletLt:SetActive(false)
		end)

		slot.twRestore = twRestore
		slot.isCharging = false
		slot.isCharged = false
		bulletSlots[i] = slot
	end

	pnlBullet.bulletSlots = bulletSlots

	local magazine = this.mainComponent:GetGameObject("Main_Rage_Bullet_Magazine")
	local xtwChangeAmmo = magazine:GetComponent("XTween")

	pnlBullet.xtwChangeAmmo = xtwChangeAmmo
	pnlBullet.imgOutOfAmmoLt = this.mainComponent:GetGameObject("Main_Rage_OutOfAmmoLt")
	pnlBullet.goSlots = this.mainComponent:GetGameObject("Main_Rage_Bullet_Slots")
	pnlBullet.xtwOutOfAmmo = pnlBullet.goSlots:GetComponent("XTween")
	panelPlayer.bullet = pnlBullet
	panelPlayer.showEssentialButtons = true
	panelPlayer.idleTimeTouchUi = TimeHelper.getNowTimeNoScale()
	panelPlayer.thresholdTimeTouchUi = 10
	panelPlayer.forceStopingCounting = false
	panelPlayer.showHostUI = false
	playerStatus = {}
	playerStatus.animalId = 0
	playerStatus.heroId = 0
	playerStatus.nextHeroId = 0
	playerStatus.teamId = 0
	playerStatus.iconNextHero = XImage:new(this.mainComponent:GetGameObject("Main_NextHeroIcon"))
	playerStatus.nextHeroDead = this.mainComponent:GetGameObject("Panel_MainGroup_Button_ChangeHero_Buttom_frame_Dead")
	playerStatus.nextHeroReborn = this.mainComponent:GetGameObject("Panel_MainGroup_Button_ChangeHero_Buttom_frame_Life")
	playerStatus.status = this.mainComponent:GetGameObject("Main_Host_Status")
	playerStatus.showStatus = false
	playerStatus.statusIcons = this.mainComponent:GetLoader("Main_Host_Status_Icons")

	if playerStatus.status then
		playerStatus.showStatus = true
		playerStatus.statusSp = {}
		playerStatus.statusIcon = {}
		playerStatus.statusInReview = 0

		playerStatus.status:SetActive(playerStatus.showStatus)

		playerStatus.statusLoadFinish = false
		playerStatus.statusLoadCnt = 0
		playerStatus.statusLoadMax = MS_StatusData.Count()

		local statusIdx = 1
		local statusIdList = {}
		local statusList = MS_StatusData.GetStatusList()

		for statusId, statusData in pairs(statusList) do
			table.insert(statusIdList, statusId)
		end

		playerStatus.statusIdList = statusIdList

		local statusIconloader = playerStatus.statusIcons

		statusIconloader.loadCount = playerStatus.statusLoadMax

		function statusIconloader.loadCallback(index, com, data)
			local sid = playerStatus.statusIdList[index]
			local statusData = MS_StatusData.GetStatusData(sid)

			if statusData then
				local statusIcon = {}
				local iconName = string.format("main_status_%d", statusData.Icon)
				local iconNameS = string.format("%s_x", iconName)

				statusIcon.statusId = sid
				statusIcon.iconName = statusData.Icon
				statusIcon.show = false
				statusIcon.com = com

				statusIcon.com.gameObject:SetActive(false)

				statusIcon.btn = com:GetButton("BtnStatus")

				local icon = com:GetGameObject("HostStatus")

				statusIcon.icon = icon

				statusIcon.icon:SetActive(false)

				statusIcon.stepping = XImage:new(icon)

				local spriteStepping = XObjectPool.GetIcon(iconNameS)

				statusIcon.stepping:SetSprite(spriteStepping)
				statusIcon.stepping:SetFillAmount(1)

				statusIcon.stepInt = 0
				statusIcon.threshold = 3

				local iconP = com:GetGameObject("HostStatusIcon")

				statusIcon.iconP = iconP
				statusIcon.progress = XImage:new(iconP)

				local spriteProgress = XObjectPool.GetIcon(iconName)

				statusIcon.progress:SetSprite(spriteProgress)
				statusIcon.progress:SetFillAmount(0)

				statusIcon.valueInt = 0
				statusIcon.param = 0
				playerStatus.statusIcon[sid] = statusIcon
			else
				System.Log("[MISSING] Host's Status Data: " .. sid)
			end

			playerStatus.statusLoadCnt = playerStatus.statusLoadCnt + 1

			if playerStatus.statusLoadCnt == playerStatus.statusLoadMax then
				playerStatus.statusLoadFinish = true

				MainmenuCtrl.IsUiLoaded()
			end
		end

		playerStatus.statusInfoBar = this.mainComponent:GetGameObject("Main_Host_StatusInfoBar")
		playerStatus.statusInfoLine = this.mainComponent:GetGameObject("Main_Host_StatusInfo_Line")
		playerStatus.statusInfoTitle = this.mainComponent:GetText("Main_Host_StatusInfo_Title")
		playerStatus.statusInfoContent = this.mainComponent:GetText("Main_Host_StatusInfo_Content")
		playerStatus.showStatusInfoBar = false

		if playerStatus.statusInfoBar then
			playerStatus.statusInfoTitle:SetContent(GameText.UI_COMMON_EMPTY)
			playerStatus.statusInfoContent:SetContent(GameText.UI_COMMON_EMPTY)
		end

		playerStatus.showSpecialStatus = false
		playerStatus.iconSpecialStatus = this.mainComponent:GetGameObject("Main_Host_Status_Rookie")

		playerStatus.iconSpecialStatus:SetActive(false)
		playerStatus.statusIcons:PreloadTemplate(function()
			playerStatus.statusIcons:Load()
		end)
	end

	playerStatus.btnLockState = MainmenuCtrl.LockButtonState.Disabled
	playerStatus.skillSp1 = 1
	playerStatus.skillSp2 = 0
	playerStatus.spSwitch = 0
	playerStatus.lowEnergy = this.mainComponent:GetGameObject("Panel_MainGroup_Image_Weak")

	playerStatus.lowEnergy:SetActive(false)

	playerStatus.lowEnergyCg = playerStatus.lowEnergy:GetComponent("CanvasGroup")

	local tw = Tween:new(playerStatus.lowEnergyCg)

	tw:SetAutoKill(false)
	tw:OnComplete(function()
		playerStatus.lowEnergy:SetActive(playerStatus.lowEnergyCg.alpha >= 1)
	end)
	tw:Easing(Easing.Quadratic.easeOut)

	playerStatus.twLowEnergy = tw

	this.ShowEnergyWarning(false, true)

	playerStatus.pathBlock = this.mainComponent:GetGameObject("Panel_MainGroup_Image_Block")
	playerStatus.showPathBlock = false

	playerStatus.pathBlock:SetActive(false)

	playerStatus.pathBlockCg = playerStatus.pathBlock:GetComponent("CanvasGroup")
	playerStatus.imageHit = this.mainComponent:GetGameObject("Panel_MainGroup_Image_Hit")

	playerStatus.imageHit:SetActive(false)

	playerStatus.twHitMask = playerStatus.imageHit:GetComponent("XTween")
	playerStatus.hpBar = {}
	playerStatus.hpBar.maxValue = 0
	playerStatus.hpBar.valRef = 100
	playerStatus.hpBar.maxRef = 2000
	playerStatus.hpBar.barScale = XRawImage:new(this.mainComponent:GetGameObject("Blood_Bar_Scale"))
	playerStatus.hpBar.numScale = 4
	playerStatus.hpVal = 0
	playerStatus.hpMax = 0
	playerStatus.hpBase = 0
	playerStatus.hpShld = 0
	playerStatus.hpShldBase = 0
	playerStatus.gameModeCount = 3
	playerStatus.gameMode = FS_UserData.story:GetDifficulty()
	playerStatus.barHpFrm = {}
	playerStatus.barHpFrm[1] = XImage:new(this.mainComponent:GetGameObject("Host_Bar_HpFrameEasy"))
	playerStatus.barHpFrm[2] = XImage:new(this.mainComponent:GetGameObject("Host_Bar_HpFrameBase"))
	playerStatus.barHpFrm[3] = playerStatus.barHpFrm[2]
	playerStatus.barHpBar = {}
	playerStatus.barHpBar[1] = XImage:new(this.mainComponent:GetGameObject("Host_Bar_HpEasy"))
	playerStatus.barHpBar[2] = XImage:new(this.mainComponent:GetGameObject("Host_Bar_HpBase"))
	playerStatus.barHpBar[3] = playerStatus.barHpBar[2]
	playerStatus.barEnergy = XImage:new(this.mainComponent:GetGameObject("Host_Bar_Energy"))
	playerStatus.allowHpTween = true

	local barHpStep = XImage:new(this.mainComponent:GetGameObject("Host_Bar_HpStep"))

	playerStatus.barHpStep = barHpStep
	playerStatus.hpStepTween = Tween:new(barHpStep.image)

	playerStatus.hpStepTween:SetAutoKill(false)

	playerStatus.efxHpWarn = this.mainComponent:GetGameObject("Host_Efx_HpWarn")

	playerStatus.efxHpWarn:SetActive(false)

	playerStatus.xtwnEfxHpWarn = playerStatus.efxHpWarn:GetComponent("XTween")
	playerStatus.showEfxHpWarn = false
	playerStatus.efxHp = this.mainComponent:GetGameObject("Blood_Slider_Green")
	playerStatus.efxHpSlider = playerStatus.efxHp:GetComponent("Slider")
	playerStatus.efxHpCg = playerStatus.efxHp:GetComponent("CanvasGroup")
	playerStatus.efxHpCg.alpha = 0

	local barHpShield = XImage:new(this.mainComponent:GetGameObject("Host_Bar_HpShield"))

	playerStatus.barHpShield = barHpShield
	playerStatus.hpShieldTween = Tween:new(barHpShield.image)

	playerStatus.hpShieldTween:SetAutoKill(false)
	playerStatus.hpShieldTween:OnStart(function()
		playerStatus.allowHpTween = false
		playerStatus.isInHpShieldTween = true
	end)
	playerStatus.hpShieldTween:OnComplete(function()
		playerStatus.isInHpShieldTween = false
		playerStatus.allowHpTween = true
	end)

	playerStatus.isInHpShieldTween = false

	local hpLimiter = this.mainComponent:GetGameObject("Host_Slider_HpLimiter")

	hpLimiter:SetActive(false)

	playerStatus.showHpLimiter = false
	playerStatus.hpLimiterSlider = hpLimiter:GetComponent("Slider")
	playerStatus.hpLimiter = hpLimiter
	playerStatus.txtHp = this.mainComponent:GetText("Panel_Blood_Text_Text_My")
	playerStatus.txtHpMax = this.mainComponent:GetText("Panel_Blood_Text_Text_All")
	playerStatus.energyBar = {}
	playerStatus.energyWarn = this.mainComponent:GetGameObject("Image_YellowWarning")
	playerStatus.energyWarnTween = playerStatus.energyWarn:GetComponent("XTween")
	playerStatus.showEnergyWarn = false

	local energyGrey = this.mainComponent:GetGameObject("Image_GreyRight")

	playerStatus.energyGreyImg = XImage:new(energyGrey)
	playerStatus.energyTween = Tween:new(energyGrey)

	playerStatus.energyTween:SetAutoKill(false)

	playerStatus.energyEffect = this.mainComponent:GetGameObject("Blood_Slider_Yellow")

	playerStatus.energyEffect:SetActive(false)

	local energyLimiter = this.mainComponent:GetGameObject("Energy_Max")

	energyLimiter:SetActive(false)

	playerStatus.showEnergyLimiter = false
	playerStatus.energyLimiterSlider = energyLimiter:GetComponent("Slider")
	playerStatus.energyLimiter = energyLimiter
	playerStatus.sanityValue = 1
	playerStatus.sanityState = AnimalBase_Define.SanType.Normal
	playerStatus.sanityBar = {}
	playerStatus.sanityBar.go = this.mainComponent:GetGameObject("Main_Host_Sanity")

	local sanityGuage = this.mainComponent:GetGameObject("Main_Host_SanityGuage")
	local sanityGuageInner = this.mainComponent:GetGameObject("Main_Host_SanityIconWarning")

	playerStatus.sanityBar.gauge = XImage:new(sanityGuage)

	playerStatus.sanityBar.gauge:SetFillAmount(1)

	playerStatus.sanityBar.gaugeInner = XImage:new(sanityGuageInner)

	playerStatus.sanityBar.gaugeInner:SetFillAmount(1)

	playerStatus.sanityBar.showSt = {
		true,
		false,
		false,
		false,
		false,
		false
	}
	playerStatus.sanityBar.states = {
		this.mainComponent:GetGameObject("Main_Host_SanityIconNormal"),
		this.mainComponent:GetGameObject("Main_Host_SanityIconCaution"),
		this.mainComponent:GetGameObject("Main_Host_SanityIconWarning"),
		this.mainComponent:GetGameObject("Main_Host_SanityZero"),
		this.mainComponent:GetGameObject("Main_Host_SanityVfxWarning"),
		this.mainComponent:GetGameObject("Main_Host_SanityIconWarningBg")
	}
	playerStatus.sanityBar.thresholds = {
		1,
		0.4,
		0.1,
		0
	}
	playerStatus.sanityBar.onState = {}
	playerStatus.sanityBar.variate = this.mainComponent:GetText("Main_Host_SanityVariateText")
	playerStatus.sanityBar.valueInt = 100

	local sanityDeltaTween = Tween:new(playerStatus.sanityBar.go)

	sanityDeltaTween:SetAutoKill(false)
	sanityDeltaTween:MoveTo({}, 1)
	sanityDeltaTween:OnStart(function()
		if playerStatus and playerStatus.sanityBar and playerStatus.sanityBar.variate then
			playerStatus.sanityBar.variate.gameObject:SetActive(false)
			playerStatus.sanityBar.variate.gameObject:SetActive(true)
		end
	end)
	sanityDeltaTween:OnComplete(function()
		if playerStatus and playerStatus.sanityBar and playerStatus.sanityBar.variate then
			playerStatus.sanityBar.variate.gameObject:SetActive(false)
		end
	end)

	playerStatus.sanityBar.deltaTween = sanityDeltaTween
	playerStatus.sanityBar.showCrazyWarning = false
	playerStatus.sanityBar.guageWarning = this.mainComponent:GetGameObject("Main_Host_SanityGauge_Warn")
	playerStatus.showSanityWarning = false
	playerStatus.sanityWarning = this.mainComponent:GetGameObject("Main_ScrSanity_Warn")

	local rageBar = {}

	rageBar.go = this.mainComponent:GetGameObject("Main_PlayerStatus_RagePanel")
	rageBar.value = 0
	rageBar.isFull = false
	rageBar.getFull = false
	rageBar.isReset = false
	rageBar.icon = XImage:new(this.mainComponent:GetGameObject("Main_PlayerStatus_RagePanel_HeroIcon"))
	rageBar.barImg = XImage:new(this.mainComponent:GetGameObject("Main_PlayerStatus_RagePanel_RageBar"))
	rageBar.rageType = MainmenuCtrl.Rage.Type1

	rageBar.barImg:SetFillAmount(0)

	rageBar.animator = rageBar.go:GetComponent("Animator")
	rageBar.thresholdInt = 30
	rageBar.threshold = rageBar.thresholdInt / 100
	rageBar.showThreshold = false
	rageBar.thresholdEfx = this.mainComponent:GetGameObject("Main_RageBar_Threshold_Efx")

	rageBar.thresholdEfx:SetActive(false)

	rageBar.threshold2Int = 0
	rageBar.threshold2 = 0
	rageBar.usable = false
	rageBar.usable2 = false

	local insufficient = {}

	insufficient = {
		this.mainComponent:GetGameObject("Main_Anger_InsufficientAll"),
		this.mainComponent:GetGameObject("Main_Anger_InsufficientL"),
		(this.mainComponent:GetGameObject("Main_Anger_InsufficientR"))
	}

	local insufficientTween = {}

	insufficientTween[1] = insufficient[1]:GetComponent("XTween")
	insufficientTween[2] = insufficient[2]:GetComponent("XTween")
	insufficientTween[3] = insufficient[3]:GetComponent("XTween")
	rageBar.insufficient = insufficient
	rageBar.insufficientTween = insufficientTween
	rageBar.insufficientTweenTimestamp = 0
	rageBar.showInsufficient = false
	rageBar.isInAnimThresholdReached = false

	local tween = Tween:new(rageBar.thresholdEfx)

	tween:SetAutoKill(false)

	rageBar.tweenAnimThreshold = tween
	playerStatus.rageBar = rageBar

	rageBar.tweenAnimThreshold:MoveTo({}, 1.1)
	rageBar.tweenAnimThreshold:OnComplete(function()
		playerStatus.rageBar.isInAnimThresholdReached = false

		playerStatus.rageBar.animator:SetBool("RageUsable", false)
		playerStatus.rageBar.animator:SetBool("RageUsableWhite", false)
	end)

	rageBar.barThresholdReached = XImage:new(this.mainComponent:GetGameObject("Blood_Image_Red3"))
	rageBar.isInFlush = false
	rageBar.deltaValue = 0

	local rageSpBar = {}

	rageSpBar.show = false
	rageSpBar.karmaType = 0
	rageSpBar.pnl = this.mainComponent:GetGameObject("Main_Rage_Sp_Pnl")
	rageSpBar.tfPnl = rageSpBar.pnl.transform
	rageSpBar.scaleX = 1

	rageSpBar.pnl:SetActive(rageSpBar.show)

	rageSpBar.value = 0
	rageSpBar.isFull = false
	rageSpBar.getFull = false
	rageSpBar.isReset = false
	rageSpBar.tweenInterval = 0.3
	rageSpBar.goBar = this.mainComponent:GetGameObject("Main_Rage_Sp_Bar")
	rageSpBar.bar = XImage:new(rageSpBar.goBar)

	rageSpBar.bar:SetFillAmount(0)

	rageSpBar.animator = rageSpBar.pnl:GetComponent("Animator")
	rageSpBar.thresholdInt = 30
	rageSpBar.threshold = rageSpBar.thresholdInt / 100
	rageSpBar.showThreshold = false
	rageSpBar.thresholdEfx = this.mainComponent:GetGameObject("Main_Rage_Sp_BarR")

	rageSpBar.thresholdEfx:SetActive(false)

	rageSpBar.usable = false
	rageSpBar.tween = Tween:new(rageSpBar.bar.image)

	local insufficient = {}

	insufficient[1] = this.mainComponent:GetGameObject("Main_Anger_InsufficientR")
	insufficient[2] = this.mainComponent:GetGameObject("Main_Anger_InsufficientL")

	local insufficientTween = {}

	insufficientTween[1] = insufficient[1]:GetComponent("XTween")
	insufficientTween[2] = insufficient[2]:GetComponent("XTween")
	rageSpBar.insufficient = insufficient
	rageSpBar.insufficientTween = insufficientTween
	rageSpBar.insufficientTweenTimestamp = 0
	rageSpBar.showInsufficient = false
	rageSpBar.isInAnimThresholdReached = false

	local tween = Tween:new(rageSpBar.goBar)

	tween:SetAutoKill(false)

	rageSpBar.tweenAnimThreshold = tween
	playerStatus.rageSpBar = rageSpBar

	rageSpBar.tweenAnimThreshold:MoveTo({}, 0.6)
	rageSpBar.tweenAnimThreshold:OnComplete(function()
		playerStatus.rageSpBar.isInAnimThresholdReached = false

		playerStatus.rageSpBar.animator:SetBool("RageUsable", false)
	end)

	rageSpBar.isInFlush = false
	rageSpBar.deltaValue = 0

	local rageJBar = {}

	rageJBar.show = false
	rageJBar.pnl = this.mainComponent:GetGameObject("Main_Rage_Jerold")

	if rageJBar.pnl then
		rageJBar.pnl:SetActive(rageJBar.show)
	end

	rageJBar.value = 0
	rageJBar.maxValue = 6
	rageJBar.segments = {}

	for idx = 1, 6 do
		local seg = {}

		seg.show = false
		seg.go = this.mainComponent:GetGameObject(string.format("Main_Rage_Seg%d", idx))

		if seg.go then
			seg.go:SetActive(seg.show)
		end

		seg.xtween = seg.go:GetComponent("XTween")

		seg.xtween:ResetData()

		rageJBar.segments[idx] = seg
	end

	function rageJBar.Reset()
		local rageJBar = playerStatus.rageJBar

		if rageJBar and rageJBar.pnl then
			for idx = 1, 6 do
				local seg = rageJBar.segments[idx]

				if seg.show == true then
					seg.show = false

					seg.go:SetActive(false)
				end
			end
		end
	end

	playerStatus.rageJBar = rageJBar

	this.ShowHPWarning(false)
	this.ShowUseEnergyWarning(false)

	local keyName = MainmenuCtrl.BtnTPC.CHANGEHERO
	local btnChangeHero = {}

	btnChangeHero.heroId = 0
	btnChangeHero.go = this.mainComponent:GetGameObject(keyName)

	btnChangeHero.go:SetActive(btnChangeHero.heroId > 0)

	btnChangeHero.canChangeHostPlayer = false
	btnChangeHero.isDead = false

	local btn = this.mainComponent:GetButton(keyName)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			this.PointerClick_ChangeHostPlayer()
		end, 0)
		UILayerCtrl.AddIndividual("GameMain", keyName, btn)
	end

	btnChangeHero.btn = btn
	playerStatus.btnChangeHero = btnChangeHero
	playerStatus.readyBackstab = 0
	playerStatus.readyExecution = 0
	playerStatus.ButtonPressedFlag = false
	playerStatus.ButtonPressedTime = 0
	playerStatus.ButtonPressedCount = 0

	local keyName = "Mainmenu_ButtonReserved"
	local btnReserved = {}

	btnReserved.count = 0
	btnReserved.countMax = 5
	btnReserved.time = 1
	btnReserved.endTime = 0
	btnReserved.show = false
	btnReserved.cb = nil

	local btn = this.mainComponent:GetButton(keyName)

	btn:SetAudioType(AudioCtrl.ButtonClickType.None)
	btn.gameObject:SetActive(btnReserved.show)

	if btn then
		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			local currentTime = TimeHelper.getNowTimeNoScale()

			if btnReserved.count == 0 then
				btnReserved.endTime = currentTime + btnReserved.time
			end

			if btnReserved.endTime > 0 and currentTime <= btnReserved.endTime then
				btnReserved.count = btnReserved.count + 1

				if AppVer == AppDevVer and btnReserved.text then
					btnReserved.text:SetContent(btnReserved.count)
				end

				if btnReserved.count >= btnReserved.countMax then
					btnReserved.count = 0
					btnReserved.show = false

					btn.gameObject:SetActive(false)

					if AppVer == AppDevVer then
						btnReserved.showText = false

						btnReserved.text.gameObject:SetActive(false)
					end

					if btnReserved.cb then
						btnReserved.cb()
					end
				end
			else
				btnReserved.count = 0
				btnReserved.endTime = 0
			end
		end, 0)
		UILayerCtrl.AddIndividual("Special", keyName, btn)
	end

	btnReserved.btn = btn
	btnReserved.showText = false
	btnReserved.text = this.mainComponent:GetText("Mainmenu_ButtonReserved_Text")

	btnReserved.text.gameObject:SetActive(false)

	playerStatus.btnReserved = btnReserved
	oppositeStatus = {}
	oppositeStatus.hp = 0
	oppositeStatus.panel = this.mainComponent:GetGameObject("Panel_Boss_Bar")
	oppositeStatus.text = this.mainComponent:GetText("Panel_Boss_Text")
	oppositeStatus.hpText = this.mainComponent:GetText("Panel_Boss_HpValue")

	oppositeStatus.hpText.gameObject:SetActive(false)

	oppositeStatus.hpBarR = this.mainComponent:GetGameObject("Panel_Boss_HpBar"):GetComponent("Slider")

	local imgHpBarY = this.mainComponent:GetGameObject("Panel_Boss_HpDelay")
	local hpBarY = XImage:new(imgHpBarY)

	oppositeStatus.hpBarY = hpBarY
	oppositeStatus.hpBarYTween = Tween:new(hpBarY.image)
	oppositeStatus.show = false

	oppositeStatus.panel:SetActive(false)

	oppositeStatus.focus = this.mainComponent:GetGameObject("Panel_Boss_Focus")

	oppositeStatus.focus:SetActive(false)

	oppositeStatus.bracketL = XImage:new(this.mainComponent:GetGameObject("Main_Boss_Focus_1"))
	oppositeStatus.bracketR = XImage:new(this.mainComponent:GetGameObject("Main_Boss_Focus_2"))
	oppositeStatus.toughnessInt = 0
	oppositeStatus.toughnessBarI = XImage:new(this.mainComponent:GetGameObject("Main_Boss_Toughness_BarI"))

	oppositeStatus.toughnessBarI:SetFillAmount(0)

	oppositeStatus.toughnessBarS = XImage:new(this.mainComponent:GetGameObject("Main_Boss_Toughness_BarS"))

	oppositeStatus.toughnessBarS:SetFillAmount(0)

	oppositeStatus.showToughness = false
	oppositeStatus.toughnessBarSTween = Tween:new(oppositeStatus.toughnessBarS.image)
	oppositeStatus.toughnessInterval = 0.3
	oppositeStatus.status = this.mainComponent:GetGameObject("Main_Boss_Status")
	oppositeStatus.showStatus = false
	oppositeStatus.statusIcons = this.mainComponent:GetLoader("Main_Boss_Status_Icons")

	if oppositeStatus.status then
		oppositeStatus.showStatus = true
		oppositeStatus.statusSp = {}
		oppositeStatus.statusIcon = {}

		oppositeStatus.status:SetActive(oppositeStatus.showStatus)

		oppositeStatus.statusLoadFinish = false
		oppositeStatus.statusLoadCnt = 0
		oppositeStatus.statusLoadMax = MS_StatusData.Count()

		local statusIdx = 1
		local statusIdList = {}
		local statusList = MS_StatusData.GetStatusList()

		for statusId, statusData in pairs(statusList) do
			table.insert(statusIdList, statusId)
		end

		oppositeStatus.statusIdList = statusIdList

		local statusIconloader = oppositeStatus.statusIcons

		statusIconloader.loadCount = oppositeStatus.statusLoadMax

		function statusIconloader.loadCallback(index, com, data)
			local sid = oppositeStatus.statusIdList[index]
			local statusData = MS_StatusData.GetStatusData(sid)

			if statusData then
				local statusIcon = {}
				local iconName = "main_status_" .. statusData.Icon
				local iconNameS = iconName .. "_x"

				statusIcon.statusId = sid
				statusIcon.iconName = statusData.Icon
				statusIcon.show = false
				statusIcon.com = com

				statusIcon.com.gameObject:SetActive(false)

				statusIcon.btn = com:GetButton("BtnStatus")

				local icon = com:GetGameObject("HostStatus")

				statusIcon.icon = icon

				statusIcon.icon:SetActive(false)

				statusIcon.stepping = XImage:new(icon)

				local spriteStepping = XObjectPool.GetIcon(iconNameS)

				statusIcon.stepping:SetSprite(spriteStepping)
				statusIcon.stepping:SetFillAmount(1)

				statusIcon.stepInt = 0
				statusIcon.threshold = 3

				local iconP = com:GetGameObject("HostStatusIcon")

				statusIcon.iconP = iconP
				statusIcon.progress = XImage:new(iconP)

				local spriteProgress = XObjectPool.GetIcon(iconName)

				statusIcon.progress:SetSprite(spriteProgress)
				statusIcon.progress:SetFillAmount(0)

				statusIcon.valueInt = 0
				statusIcon.param = 0
				oppositeStatus.statusIcon[sid] = statusIcon
			else
				System.Log("[MISSING] Opposite's Status Data: " .. sid)
			end

			oppositeStatus.statusLoadCnt = oppositeStatus.statusLoadCnt + 1

			if oppositeStatus.statusLoadCnt == oppositeStatus.statusLoadMax then
				oppositeStatus.statusLoadFinish = true

				MainmenuCtrl.IsUiLoaded()
			end
		end

		oppositeStatus.statusIcons:PreloadTemplate(function()
			oppositeStatus.statusIcons:Load()
		end)
	end

	local panelMazeBar = {}

	panelMazeBar.go = this.mainComponent:GetGameObject("Panel_MazeBar")
	panelMazeBar.show = false

	panelMazeBar.go:SetActive(panelMazeBar.show)

	panelMazeBar.bar = XImage:new(this.mainComponent:GetGameObject("Panel_MazeBar_Progress"))

	panelMazeBar.bar:SetFillAmount(0)

	panelMazeBar.value = 0
	panelMazeBar.showScaler = true
	panelMazeBar.efxFull = this.mainComponent:GetGameObject("Panel_MazeBar_ProgressFull")

	panelMazeBar.efxFull:SetActive(not panelMazeBar.showScaler)

	panelMazeBar.scaler = this.mainComponent:GetGameObject("Panel_MazeBar_Scale")

	panelMazeBar.scaler:SetActive(panelMazeBar.showScaler)

	panelMazeBar.slider = panelMazeBar.scaler:GetComponent("Slider")
	panelMazeBar.slider.value = 0
	panelMazeBar.showBossBar = false
	panelMazeBar.bossIconCount = 0
	panelMazeBar.goBossBar = this.mainComponent:GetGameObject("Panel_MazeBar_BossBar")
	panelMazeBar.bossIcon = {}

	local loaderBossBar = this.mainComponent:GetLoader("Panel_MazeBar_BossBar")

	loaderBossBar.loadCount = 0
	loaderBossBar.loadStepping = 0
	loaderBossBar.loadFinished = false

	function loaderBossBar.loadCallback(index, com, data)
		local bossIcon = {}

		bossIcon.com = com
		bossIcon.imgOn = com:GetGameObject("MazeBossIcon_On")
		bossIcon.showOn = false
		panelMazeBar.bossIcon[index] = bossIcon
		loaderBossBar.loadStepping = loaderBossBar.loadStepping + 1
		loaderBossBar.loadFinished = loaderBossBar.loadStepping == loaderBossBar.loadCount
	end

	panelMazeBar.loaderBossBar = loaderBossBar
	panelPlayer.panelMazeBar = panelMazeBar

	UILayerCtrl.Add("PanelDeath")

	panelDeath = {}
	panelDeath.show = false
	panelDeath.showNext = false
	panelDeath.delayed = false
	panelDeath.com = this.mainComponent:GetGameObject("Panel_Death")

	panelDeath.com:SetActive(false)

	panelDeath.extra = this.mainComponent:GetGameObject("Panel_Death_Extra")
	panelDeath.extraRectTf = panelDeath.extra:GetComponent("RectTransform")
	panelDeath.extraNum1 = this.mainComponent:GetText("Panel_Death_Num40001")
	panelDeath.BtnRetry = this.mainComponent:GetButton("Panel_Death_Button_Retry")

	panelDeath.BtnRetry:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		local gameController = sceneController:GetGameController()

		if gameController ~= nil then
			panelDeath.extra:SetActive(false)
			panelDeath.extraNum1:SetContent(GameText.UI_COMMON_EMPTY)
			gameController:OnMenuReborn()
			UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.6)
			this.ShowPanelDeath(false)
		end
	end)
	UILayerCtrl.AddButton("PanelDeath", "Panel_Death_Button_Retry", panelDeath.BtnRetry)
	UILayerCtrl.Add("PanelChallengeResult")

	panelChangeResult = {}
	panelChangeResult.go = this.mainComponent:GetGameObject("Panel_ChallengeResult")
	panelChangeResult.successGroup = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup")
	panelChangeResult.failedGroup = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_FailedGroup")
	panelChangeResult.perfectFlag = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_noDamage")
	panelChangeResult.historyHeroIcon = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_HistoryFast_HeroFrame_HeroIcon")
	panelChangeResult.currentHeroIcon = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_CurrentHero_HeroFrame_HeroIcon")
	panelChangeResult.historyHeroIcon = XImage:new(panelChangeResult.historyHeroIcon)
	panelChangeResult.currentHeroIcon = XImage:new(panelChangeResult.currentHeroIcon)
	panelChangeResult.historyFastText = this.mainComponent:GetText("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_HistoryFast_TimeFast")
	panelChangeResult.historyFastCSText = this.mainComponent:GetText("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_HistoryFast_TimeFast2")
	panelChangeResult.currentFastText = this.mainComponent:GetText("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_CurrentHero_TimeFast")
	panelChangeResult.currentFastCSText = this.mainComponent:GetText("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_CurrentHero_TimeFast2")
	panelChangeResult.historyFastFlag = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_HistoryFast_FastFlag")
	panelChangeResult.currentFastFlag = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_CurrentHero_FastFlag")
	panelChangeResult.newRecordTextGO = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_newRecord")
	panelChangeResult.TimeText = this.mainComponent:GetText("Panel_SubGroup_Panel_ChallengeResult_BG_Time")
	panelChangeResult.CSTimeText = this.mainComponent:GetText("Panel_SubGroup_Panel_ChallengeResult_BG_CircleBG_SuccessGroup_Image_Time2")
	panelChangeResult.BackBtn = this.mainComponent:GetButton("Panel_SubGroup_Panel_ChallengeResult_BG_Back")

	panelChangeResult.BackBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
			local sceneController = ST_Main.GetSceneController()

			if sceneController ~= nil then
				sceneController:GetGameController():FinishArcade()
			end
		else
			local sceneController = ST_Main.GetSceneController()

			if sceneController ~= nil then
				sceneController:ExitMenu()
				sceneController:BackToTitle()
			end
		end
	end)
	UILayerCtrl.AddButton("PanelChallengeResult", "Panel_SubGroup_Panel_ChallengeResult_BG_Back", panelChangeResult.BackBtn)
	UILayerCtrl.Add("PanelArcadeResult")

	panelArcadeResult = {}
	panelArcadeResult.go = this.mainComponent:GetGameObject("Panel_ArcadeResult")
	panelArcadeResult.BG = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG")
	panelArcadeResult.rankCompareText = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_rankCompare")
	panelArcadeResult.heroName = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_heroName")
	panelArcadeResult.stageName = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_stageName")
	panelArcadeResult.totalScore = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_totalScore")
	panelArcadeResult.totalScoreABCStar = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Score_Level_Score_star")
	panelArcadeResult.totalScoreABCS = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Score")
	panelArcadeResult.totalScoreABCS = XImage:new(panelArcadeResult.totalScoreABCS)
	panelArcadeResult.totalScoreSmall = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Num")
	panelArcadeResult.time = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_time")
	panelArcadeResult.timePre = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_time_bg_Time")
	panelArcadeResult.killScore = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_killScore")
	panelArcadeResult.killCount = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_time_bg_KillCount")
	panelArcadeResult.KillCountTimes = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_kill_bg_KillCountTimes")
	panelArcadeResult.historyScore = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_HistoryTotalGroup_historyTotalScore")
	panelArcadeResult.historyTotalGroup = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_HistoryTotalGroup")
	panelArcadeResult.heroPortrait = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_ArcadePortrait")
	panelArcadeResult.PlayerId = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_ID_Num_ID")
	panelArcadeResult.heroPortrait = XImage:new(panelArcadeResult.heroPortrait)
	panelArcadeResult.ScoreLevelGroup = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Score_Level")
	panelArcadeResult.ScoreLevelGroupXTWeen = panelArcadeResult.ScoreLevelGroup:GetComponent("XTween")
	panelArcadeResult.ScoreAllGroup = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Score_All")
	panelArcadeResult.ScoreAllABCS = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Score_All_Score_All")
	panelArcadeResult.ScoreAllABCS = XImage:new(panelArcadeResult.ScoreAllABCS)
	panelArcadeResult.ScoreAllABCStar = this.mainComponent:GetGameObject("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Score_All_Score_All_star")
	panelArcadeResult.LevelModeText = this.mainComponent:GetText("Panel_SubGroup_Panel_ArcadeResult_BG_InfoGroup_Hard")
	panelArcadeResult.ScoreEachABCS = {}
	panelArcadeResult.ScoreEachABCStar = {}

	for i = 1, 8 do
		local retI = i

		if i == 4 then
			retI = 5
		elseif i == 5 then
			retI = 4
		end

		panelArcadeResult.ScoreEachABCS[i] = this.mainComponent:GetGameObject("ScoreEachABCS" .. retI)
		panelArcadeResult.ScoreEachABCS[i] = XImage:new(panelArcadeResult.ScoreEachABCS[i])
		panelArcadeResult.ScoreEachABCStar[i] = this.mainComponent:GetGameObject("ScoreEachABCStar" .. retI)
	end

	panelArcadeResult.BackBtn = this.mainComponent:GetButton("Panel_SubGroup_Panel_ArcadeResult_BG_Back")
	panelArcadeResult.BackBtnCanvasGroup = panelArcadeResult.BackBtn.gameObject:GetComponent("CanvasGroup")

	panelArcadeResult.BackBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and panelArcadeResult.BackBtnCanvasGroup.alpha == 1 then
			local currentStoryId = FS_UserData.story:GetStoryId()

			if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) and currentStoryId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
				panelArcadeResult.BackBtn2.gameObject:SetActive(true)
				panelArcadeResult.ScoreAllGroup:SetActive(true)
				panelArcadeResult.ScoreLevelGroupXTWeen:Play()
				AudioCtrl.SetUIAudio("score_settlement_summary")
				UILayerCtrl.OnSelect("Panel_SubGroup_Panel_ArcadeResult_BG_Back_2")
			else
				local sceneController = ST_Main.GetSceneController()

				if sceneController ~= nil then
					sceneController:GetGameController():FinishArcade()
				end
			end
		end
	end)

	panelArcadeResult.BackBtn2 = this.mainComponent:GetButton("Panel_SubGroup_Panel_ArcadeResult_BG_Back_2")
	panelArcadeResult.BackBtnCanvasGroup2 = panelArcadeResult.BackBtn2.gameObject:GetComponent("CanvasGroup")

	panelArcadeResult.BackBtn2:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and panelArcadeResult.BackBtnCanvasGroup2.alpha == 1 then
			local sceneController = ST_Main.GetSceneController()
			local gameController = sceneController:GetGameController()

			gameController:EnterMovie(1015, 1)
		end
	end)
	UILayerCtrl.AddButton("PanelArcadeResult", "Panel_SubGroup_Panel_ArcadeResult_BG_Back", panelArcadeResult.BackBtn)
	UILayerCtrl.AddButton("PanelArcadeResult", "Panel_SubGroup_Panel_ArcadeResult_BG_Back_2", panelArcadeResult.BackBtn2)

	local heroGroupTbl = this.mainComponent:GetGroupByPrefix("hero")

	for _k, _v in pairs(heroGroupTbl) do
		_v:SetActive(false)
	end

	uiPanelMessage = {}
	uiPanelMessage.destination = {}
	uiPanelMessage.destination.show = false
	uiPanelMessage.destination.panel = this.mainComponent:GetGameObject("Mainmenu_Message_Destination")
	uiPanelMessage.destination.text = this.mainComponent:GetText("Mainmenu_Message_DestinationText")
	uiPanelMessage.destination.xtween = uiPanelMessage.destination.panel:GetComponent("XTween")

	local tween = Tween:new(uiPanelMessage.destination.panel)

	tween:SetAutoKill(false)
	tween:Delay(2.2)
	tween:MoveTo({}, 0)
	tween:OnComplete(function()
		uiPanelMessage.destination.xtween.reversed = true

		uiPanelMessage.destination.xtween:Play()
	end)

	uiPanelMessage.destination.tween = tween
	uiPanelMessage.sanityAbnormal = {}
	uiPanelMessage.sanityAbnormal.show = true
	uiPanelMessage.sanityAbnormal.panel = this.mainComponent:GetGameObject("Message_Abnormal")

	uiPanelMessage.sanityAbnormal.panel:SetActive(true)

	uiPanelMessage.sanityAbnormal.xtween = uiPanelMessage.sanityAbnormal.panel:GetComponent("XTween")

	local tween = Tween:new(uiPanelMessage.sanityAbnormal.panel)

	tween:SetAutoKill(false)
	tween:MoveTo({}, 3.6)
	tween:OnStart(function()
		uiPanelMessage.sanityAbnormal.xtween.reversed = false

		uiPanelMessage.sanityAbnormal.xtween:Play()
	end)
	tween:OnComplete(function()
		uiPanelMessage.sanityAbnormal.xtween.reversed = true

		uiPanelMessage.sanityAbnormal.xtween:Play()
	end)

	uiPanelMessage.sanityAbnormal.tween = tween
	uiPanelMessage.sanityBreakdown = {}
	uiPanelMessage.sanityBreakdown.show = true
	uiPanelMessage.sanityBreakdown.panel = this.mainComponent:GetGameObject("Message_Breakdown")

	uiPanelMessage.sanityBreakdown.panel:SetActive(true)

	uiPanelMessage.sanityBreakdown.xtween = uiPanelMessage.sanityBreakdown.panel:GetComponent("XTween")

	local tween = Tween:new(uiPanelMessage.sanityBreakdown.panel)

	tween:SetAutoKill(false)
	tween:MoveTo({}, 3.6)
	tween:OnStart(function()
		uiPanelMessage.sanityBreakdown.xtween.reversed = false

		uiPanelMessage.sanityBreakdown.xtween:Play()
	end)
	tween:OnComplete(function()
		uiPanelMessage.sanityBreakdown.xtween.reversed = true

		uiPanelMessage.sanityBreakdown.xtween:Play()
	end)

	uiPanelMessage.sanityBreakdown.tween = tween
	uiPanelMessage.task = {}
	uiPanelMessage.task.show = true
	uiPanelMessage.task.panel = this.mainComponent:GetGameObject("Message_Task")

	uiPanelMessage.task.panel:SetActive(true)

	uiPanelMessage.task.msgs = {}
	uiPanelMessage.task.showCnt = 0
	uiPanelMessage.task.showMax = 1
	uiPanelMessage.task.showRunning = false
	uiPanelMessage.task.actShowTime = 0
	uiPanelMessage.task.maxShowTime = 12
	uiPanelMessage.task.text = this.mainComponent:GetText("Message_Task_Text")
	uiPanelMessage.task.anim = uiPanelMessage.task.panel:GetComponent("Animator")
	uiPanelMessage.task.animCompleted = false
	uiPaneL = {}
	uiPaneL.panel = this.mainComponent:GetGameObject("Main_Message_L")
	uiPaneL.text = this.mainComponent:GetText("Panel_MainGroup_PanelL_MessageText")
	uiPanelB = {}
	uiPanelB.msgs = {}
	uiPanelB.showCnt = 0
	uiPanelB.showMax = 3
	uiPanelB.showRunning = false
	uiPanelB.panel = this.mainComponent:GetGameObject("Message_Reward")
	uiPanelB.show = true

	uiPanelB.panel:SetActive(true)

	uiPanelB.slots = {}

	for i = 1, 3 do
		local slot = {}

		slot.idx = i
		slot.show = false
		slot.pos = 3 - i
		slot.actShowTime = 0
		slot.maxShowTime = 5
		slot.animCompleted = false
		slot.panel = this.mainComponent:GetGameObject("RewardItem" .. i)
		slot.icon = XImage:new(this.mainComponent:GetGameObject("Panel_Reward_Icon" .. i))
		slot.text = this.mainComponent:GetText("Panel_Reward_Text" .. i)
		slot.anim = slot.panel:GetComponent("Animator")
		uiPanelB.slots[i] = slot
	end

	uiProgress = {}
	uiProgress.valInt = -1
	uiProgress.show = false
	uiProgress.panel = this.mainComponent:GetGameObject("Panel_Occupy_Progress_Indicator")
	uiProgress.text = this.mainComponent:GetText("Panel_Occupy_Text")

	uiProgress.text:SetGameTextContent(function()
		return GameText.UI_COMMON_GATHER_REWARD
	end)

	uiProgress.bar = this.mainComponent:GetGameObject("Panel_Occupy_Bar"):GetComponent("Slider")
	uiProgress.bar.value = 0
	uiProgress.tween = Tween:new(uiProgress.bar)

	uiProgress.panel:SetActive(false)

	local panel1V1 = this.mainComponent:GetGameObject("Panel_FreeMode")

	if BattleData.IsBattleMode(BattleData.Type.PVE_Occupy) then
		panel1V1:SetActive(false)
		MainmenuCtrl.OnLoadPanelPvpOccupy(this.mainComponent)
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Guard) then
		panel1V1:SetActive(false)
		MainmenuCtrl.OnLoadPanelGuardMode(this.mainComponent)
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		panel1V1:SetActive(false)
		MainmenuCtrl.OnLoadPanelStoryMode(this.mainComponent)
	elseif BattleData.IsBattleMode(BattleData.Type.PVE_Custom) then
		panel1V1:SetActive(false)
		MainmenuCtrl.OnLoadPanelFreeMode(this.mainComponent)
	else
		SystemHelper.LogError("=================Load UI error!!!!")
	end

	uiCamera = this.gameObject:GetComponent("Canvas").worldCamera
	scCamera = sceneController:GetCamera()
	hudIcons = {}
	hudIcons.rFar = 80
	hudIcons.rMedium = 30
	hudIcons.rNear = 15
	hudIcons.Template = {}
	hudIcons.Template.CharIcon = this.mainComponent:GetGameObject("Panel_Tips_NPC")

	hudIcons.Template.CharIcon:SetActive(false)

	hudIcons.Template.SpotIcon = this.mainComponent:GetGameObject("Panel_Tips_Spot")

	hudIcons.Template.SpotIcon:SetActive(false)

	hudIcons.Template.PoiIcon = this.mainComponent:GetGameObject("Panel_Tips_Poi")

	hudIcons.Template.PoiIcon:SetActive(false)

	hudIcons.tfPoiRoot = hudIcons.Template.PoiIcon.transform.parent
	hudIcons.CharIcon = {}
	hudIcons.CharIconDir = {}
	hudIcons.charIconAnim = {}
	hudIcons.SpotIcon = {}
	hudIcons.poiData = {}
	hudIcons.poiLife = {}
	hudIcons.poiIcon = {}
	hudIcons.poiPool = {}
	hudIcons.tfPoiPool = this.mainComponent:GetGameObject("Panel_Pool_Poi").transform

	local imageArea = this.mainComponent:GetGameObject("Panel_Tips_Area")
	local tfImageArea = imageArea.transform

	scrRect = tfImageArea.parent.parent.rect
	hudRect = tfImageArea.rect
	hudNpcMargin = {}
	hudNpcMargin.scrW = SystemHelper.GetScreenWidth()
	hudNpcMargin.scrH = SystemHelper.GetScreenHeight()
	hudNpcMargin.rectTf = imageArea:GetComponent("RectTransform")

	local hGap = 0.5 * (scrRect.width - hudRect.width)

	hudNpcMargin.hGap = hGap

	local vGap = 0.5 * (scrRect.height - hudRect.height)
	local vGapT = vGap - tfImageArea.position.y
	local vGapB = vGap + tfImageArea.position.y
	local hsw = 0.5 * scrRect.width
	local hsh = 0.5 * scrRect.height

	hudNpcMargin.vGapT = vGapT
	hudNpcMargin.vGapB = vGapB
	hudNpcMargin.hsw = hsw
	hudNpcMargin.hsh = hsh
	hudNpcMargin.R = hsw - hGap
	hudNpcMargin.L = -hsw + hGap
	hudNpcMargin.T = hsh - vGapT
	hudNpcMargin.B = -hsh + vGapB

	local ltop = Vector3.New(hudNpcMargin.L, hudNpcMargin.T, 0)
	local rtop = Vector3.New(hudNpcMargin.R, hudNpcMargin.T, 0)
	local ctop = Vector3.New(0, hudNpcMargin.T, 0)
	local cbot = Vector3.New(0, hudNpcMargin.B, 0)

	hudNpcMargin.LT = ltop
	hudNpcMargin.RT = rtop
	hudNpcMargin.LB = Vector3.New(hudNpcMargin.L, hudNpcMargin.B, 0)
	hudNpcMargin.RB = Vector3.New(hudNpcMargin.R, hudNpcMargin.B, 0)
	hudNpcMargin.refCB = cbot
	hudNpcMargin.refCT = ctop
	hudNpcMargin.vecC = ctop - cbot
	hudNpcMargin.vecL = ltop - cbot
	hudNpcMargin.vecR = rtop - cbot
	hudNpcMargin.refA = Vector3.Angle(hudNpcMargin.vecC, hudNpcMargin.vecL)
	hudIcons.tfHudArea = tfImageArea
	actionBtn = {}
	actionBtn.maxCount = ControllerMain.AssistButton.ActionMax
	actionBtn.init = {}
	actionBtn.loadCount = 0
	actionBtn.loadMax = actionBtn.maxCount
	actionBtn.loadFinish = false
	actionBtn.init[ControllerMain.AssistButton.Climb] = MainmenuCtrl.SetButtonClimb
	actionBtn.init[ControllerMain.AssistButton.Dialog] = MainmenuCtrl.SetButtonDialog
	actionBtn.init[ControllerMain.AssistButton.Picking] = MainmenuCtrl.SetButtonPicking
	actionBtn.init[ControllerMain.AssistButton.Worshiping] = MainmenuCtrl.SetButtonWorshiping
	actionBtn.init[ControllerMain.AssistButton.ViewMap] = MainmenuCtrl.SetButtonViewMap
	actionBtn.init[ControllerMain.AssistButton.Carriage] = MainmenuCtrl.SetButtonCarriage
	actionBtn.init[ControllerMain.AssistButton.Backstab] = MainmenuCtrl.SetButtonBackstab
	actionBtn.init[ControllerMain.AssistButton.Execute] = MainmenuCtrl.SetButtonExecute
	actionBtn.init[ControllerMain.AssistButton.Door] = MainmenuCtrl.SetButtonDoor
	actionBtn.init[ControllerMain.AssistButton.DoorHint] = MainmenuCtrl.SetButtonDoorHint
	actionBtn.init[ControllerMain.AssistButton.Elevator] = MainmenuCtrl.SetButtonElevator
	actionBtn.init[ControllerMain.AssistButton.Cage] = MainmenuCtrl.SetButtonCage
	actionBtn.init[ControllerMain.AssistButton.StairKick] = MainmenuCtrl.SetButtonStairKick
	actionBtn.init[ControllerMain.AssistButton.CoverKick] = MainmenuCtrl.SetButtonCoverKick
	actionBtn.init[ControllerMain.AssistButton.CoverKickHint] = MainmenuCtrl.SetButtonCoverKickHint
	actionBtn.init[ControllerMain.AssistButton.Crate] = MainmenuCtrl.SetButtonCrate
	actionBtn.init[ControllerMain.AssistButton.Gate] = MainmenuCtrl.SetButtonGate
	actionBtn.init[ControllerMain.AssistButton.GateHint] = MainmenuCtrl.SetButtonGateHint
	actionBtn.init[ControllerMain.AssistButton.Bridge] = MainmenuCtrl.SetButtonBridge
	actionBtn.init[ControllerMain.AssistButton.VirtualWall] = MainmenuCtrl.SetButtonVirtualWall
	actionBtn.init[ControllerMain.AssistButton.VirtualWallHint] = MainmenuCtrl.SetButtonVirtualWallHint
	actionBtn.init[ControllerMain.AssistButton.TimeLine] = MainmenuCtrl.SetButtonTimeLine
	actionBtn.init[ControllerMain.AssistButton.Entrance] = MainmenuCtrl.SetButtonEntrance
	actionBtn.init[ControllerMain.AssistButton.Statue] = MainmenuCtrl.SetButtonStatue
	actionBtn.init[ControllerMain.AssistButton.Fountain] = MainmenuCtrl.SetButtonFountain
	actionBtn.init[ControllerMain.AssistButton.Honeypot] = MainmenuCtrl.SetButtonHoneypot
	actionBtn.init[ControllerMain.AssistButton.Bonefire] = MainmenuCtrl.SetButtonBonefire
	actionBtn.show = true
	actionBtn.buttons = {}
	actionBtn.dialogType = -1
	actionBtn.dialogTypeTimeLine = -1
	actionBtn.go = this.mainComponent:GetGameObject("Panel_Actions_RB")

	actionBtn.go:SetActive(true)

	local isJoystickConnected = LS_Setting.isJoystickConnected
	local loader = this.mainComponent:GetLoader("Panel_Actions_RB")

	loader.loadCount = actionBtn.maxCount

	function loader.loadCallback(index, com, data)
		local button = {}

		button.idx = index
		button.go = com.gameObject
		button.ready = false
		button.show = false

		button.go:SetActive(false)

		button.btn = com:GetButton("ActionButton")
		button.abIcon = com:GetGameObject("ActionButtonIcon")
		button.img = XImage:new(button.abIcon)
		button.jsIcon = XImage:new(com:GetGameObject("ActionButtonJsIcon"))
		button.kmIcon = XImage:new(com:GetGameObject("ActionButtonKmIcon"))

		if LS_Setting.isJoystickConnected then
			button.kmIcon.gameObject:SetActive(false)
		end

		button.text = com:GetText("ActionButtonText")

		button.abIcon:SetActive(false)

		actionBtn.buttons[index] = button

		local initBtn = actionBtn.init[index]

		if initBtn ~= nil then
			initBtn()
		end

		actionBtn.loadCount = actionBtn.loadCount + 1

		if actionBtn.loadCount == actionBtn.loadMax then
			actionBtn.loadFinish = true

			MainmenuCtrl.IsUiLoaded()
		end
	end

	actionBtn.loader = loader

	loader:PreloadTemplate(function()
		if actionBtn and actionBtn.loader then
			actionBtn.loader:Load()
		end
	end)

	joystickIcons = {}
	joystickIcons.ITEMS0 = XImage:new(this.mainComponent:GetGameObject("Panel_MainGroup_QuickItem_Btn_Use_L2"))
	joystickIcons.ITEMS1 = XImage:new(this.mainComponent:GetGameObject("Panel_MainGroup_ComsumeItemPanel_Item1_Btn_Potion_Dl"))
	joystickIcons.CHANGEHERO = XImage:new(this.mainComponent:GetGameObject("Panel_MainGroup_Button_ChangeHero_Buttom_frame_Btn_Changehero_Du"))
	keyboardIcons = {}
	keyboardIcons.ITEMS0 = XImage:new(this.mainComponent:GetGameObject("Panel_MainGroup_QuickItem_Btn_Use_KB"))
	keyboardIcons.ITEMS1 = XImage:new(this.mainComponent:GetGameObject("Panel_MainGroup_ComsumeItemPanel_Item1_Btn_Potion_KB"))
	keyboardIcons.CHANGEHERO = XImage:new(this.mainComponent:GetGameObject("Panel_MainGroup_Button_ChangeHero_Buttom_frame_Btn_Changehero_KB"))
	panelItems = {}
	ItemSlotList = {}
	panelItems.show = false
	panelItems.com = this.mainComponent:GetGameObject(MainmenuCtrl.BtnTPC.ITEMS1)

	panelItems.com:SetActive(panelItems.show)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		this.ShowPanelItems(true)
	end

	ItemBtn1 = this.mainComponent:GetButton("Mainmenu_ConsumeItem1_Btn")
	ItemBtn1.img = XImage:new(this.mainComponent:GetGameObject("Mainmenu_ConsumeItem1_Img"))
	ItemBtn1.num = 0
	ItemBtn1.text = this.mainComponent:GetText("Mainmenu_ConsumeItem1_Text")

	ItemBtn1.img:SetGray(true)
	ItemBtn1:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		sceneController:SetActionItem(MS_ItemData.ItemID_HpAdd)
	end)

	ItemBtn2 = this.mainComponent:GetButton("Panel_MainGroup_Panel_Items_ComsumeItemPanel_Item2_ImgBtn")
	ItemBtn2.img = XImage:new(ItemBtn2.gameObject)
	ItemBtn2.num = 0
	ItemBtn2.text = this.mainComponent:GetText("Panel_MainGroup_Panel_Items_ComsumeItemPanel_Item2_ImgBtn_Text")

	ItemBtn2.img:SetGray(true)
	ItemBtn2:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		return
	end)

	quickItemBtn = this.mainComponent:GetButton("Mainmenu_QuickItem1_Btn")
	quickItemBtn.numTextGO = this.mainComponent:GetGameObject("Mainmenu_QuickItem1_Text")
	quickItemBtn.numText = this.mainComponent:GetText("Mainmenu_QuickItem1_Text")
	quickItemBtn.img = XImage:new(this.mainComponent:GetGameObject("Mainmenu_QuickItem1_Img"))
	SelectItemPanel = this.mainComponent:GetButton("Panel_SelectItems")

	SelectItemPanel:SetAudioType(AudioCtrl.ButtonClickType.Back)

	SelectItemPanel.NextSucessTime = 0

	SelectItemPanel:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not inputMgr:GetButton(GPKey.ITEMS0) and not inputMgr:GetKey(KMKey.ITEMS0) and not inputMgr:GetLegacyButton(KMKey.ITEMS0) then
			SelectItemPanel.gameObject:SetActive(false)
			AudioCtrl.DepressOrRiseAudio(false)

			local lName = UILayerCtrl.GetCurrentLayerName()

			if lName == "SelectItem" then
				UILayerCtrl.Pop()
			end

			local controllerTimer = sceneController:GetControllerTimer()

			if controllerTimer ~= nil then
				controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.QuickItem)
			end

			inputMgr:SetPointerLocked(true)
		end
	end)

	SelectItemPanel.itemNameText = this.mainComponent:GetText("Panel_MainGroup_Panel_SelectItems_QuickBag_Text")
	SelectItemPanel.ArcadeItemDesGroup = this.mainComponent:GetGameObject("Panel_MainGroup_Panel_SelectItems_Item_Des")
	SelectItemPanel.ArcadeItemDes = this.mainComponent:GetText("Panel_MainGroup_Panel_SelectItems_Item_Des_Item_Des")

	UILayerCtrl.AddIndividual("SelectItem", "Panel_SelectItems", SelectItemPanel)

	currentItemIndex = 1

	for i = 1, 6 do
		local quickslotBG = this.mainComponent:GetGameObject("QuickSlotBG" .. i)

		quickslotBG = XImage:new(quickslotBG)

		local quickslot = this.mainComponent:GetButton("QuickSlot" .. i)

		if quickslot then
			quickslot:SetAudioType(AudioCtrl.ButtonClickType.EquipmentChoose)

			local light = quickslot.gameObject.transform:Find("QuickSlot"):Find("SelectedLight").gameObject

			quickslot.light = light

			function quickslot:SetLightFunc(bool)
				self.light:SetActive(bool)
			end

			quickslot.quickslotBG = quickslotBG
			quickslot.imgGo = quickslot.transform:Find("QuickSlot"):Find("itemImg").gameObject
			quickslot.numText = quickslot.transform:Find("QuickSlot"):Find("itemImg"):Find("Text"):GetComponent("Text")
			quickslot.img = XImage:new(quickslot.imgGo)
			quickslot.lockImgGO = quickslot.transform:Find("QuickSlot"):Find("lockimg").gameObject

			quickslot:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
				UIManager.SendMessage("PlayerInfo", "SetQuickIndex", i)
			end)
			table.insert(ItemSlotList, quickslot)
		end
	end

	local co

	quickItemBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
		longPressClock = os.clock()
		co = coroutine.start(function()
			while true do
				coroutine.wait(0.1)

				local passtime = os.clock() - longPressClock

				if passtime > 0.5 and sceneController:PermitUsingQuickItem() then
					SelectItemPanel.gameObject:SetActive(true)
					SelectItemPanel.ArcadeItemDesGroup:SetActive(FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade))
					AudioCtrl.DepressOrRiseAudio(true)

					if panelItems.SelectedItem then
						panelItems.SelectedItem:SetNormal()
						panelItems.SelectedItem:SetHighlighted()
					end

					UILayerCtrl.Push("SelectItem", nil)
					inputMgr:SetPointerLocked(false)

					local controllerTimer = sceneController:GetControllerTimer()

					if controllerTimer ~= nil then
						controllerTimer:SetTimeScale(ControllerTimer.Priority.QuickItem, MainmenuCtrl.QuickItemSlowTime, 0, -1, 0)
					end

					break
				end
			end
		end)
	end, 0)
	quickItemBtn:SetEventCallBack(EventTriggerType.PointerUp, function(obj, data)
		local usetime = os.clock() - longPressClock

		coroutine.stop(co)

		if usetime < 0.5 and sceneController:PermitUsingQuickItem() and quickItem ~= nil then
			sceneController:PressQuickMenu()
		end
	end, 0)

	panelMap = {}
	panelMap.show = false
	guide.leftFrame = this.mainComponent:GetGameObject("Panel_MainGroup_Panel_Message_Image_Message_Bg_1")
	guide.leftFrameRTF = guide.leftFrame:GetComponent("RectTransform")
	guide.leftText = this.mainComponent:GetText("Panel_MainGroup_Panel_Message_Image_Message_Bg_1_Text_Message")
	guide.middleFrame = this.mainComponent:GetGameObject("Panel_MainGroup_Panel_Message_R_Message_Join")
	guide.middleFrameRT = guide.middleFrame:GetComponent("RectTransform")
	guide.middleText = this.mainComponent:GetText("Panel_MainGroup_Panel_Message_R_Message_Join_Text_Join")
	guide.bottomFrame = this.mainComponent:GetGameObject("Panel_MainGroup_Panel_Message_Image_Message_Bg_5_B")
	guide.bottomText = this.mainComponent:GetText("Panel_MainGroup_Panel_Message_Image_Message_Bg_5_Text_Message")
	guide.storyId = 1
	guide.guideQueue = {}
	lateUpdateTbl = {}
	lateUpdateTbl.player = {
		sanityFR = false,
		hpAnim = false,
		sanityMax = 100,
		hpMax = 0,
		hpBase = 0,
		hpVal = 0,
		setEnergy = false,
		sanityCur = 0,
		setEnergyM = false,
		shieldBase = 0,
		sanityTyp = 0,
		energyMax = 0,
		energyVal = 0,
		rageFR = 0,
		setShield = false,
		sanityPer = 0,
		setHealth = false,
		shieldVal = 0,
		rageVal = 0,
		setSanity = false,
		setRage = false
	}
	timeRecord = {}
	timeRecord.go = this.mainComponent:GetGameObject("Panel_MainGroup_TimeRecord")
	timeRecord.bIsShow = false
	timeRecord.time = this.mainComponent:GetText("Panel_MainGroup_TimeRecord_Time")
	timeRecord.time2 = this.mainComponent:GetText("Panel_MainGroup_TimeRecord_Time_time2")
	timeRecord.timeUpdateGo = this.mainComponent:GetGameObject("Panel_MainGroup_TimeRecordUpdate")
	timeRecord.timeUpdateText = this.mainComponent:GetText("Panel_MainGroup_TimeRecordUpdate_Text")

	local font

	font = UIManager.GetFont("6")

	if font then
		timeRecord.time:SetFont(font)
		timeRecord.timeUpdateText:SetFont(font)
	end

	scoreRecord = {}
	scoreRecord.go = this.mainComponent:GetGameObject("Panel_MainGroup_ScoreRecord")
	scoreRecord.score = this.mainComponent:GetText("Panel_MainGroup_ScoreRecord_Score")
	scoreRecord.scoreRedBG = this.mainComponent:GetGameObject("Panel_MainGroup_ScoreRecord_RedLight")
	scoreRecord.scoreYellowBG = this.mainComponent:GetGameObject("Panel_MainGroup_ScoreRecord_YLight")
	scoreRecord.scoreUpdateGo = this.mainComponent:GetGameObject("Panel_MainGroup_ScoreRecordUpdate")
	scoreRecord.scoreUpdateText = this.mainComponent:GetText("Panel_MainGroup_ScoreRecordUpdate_Text")

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) then
		scoreRecord.score:SetContent(0)
		MainmenuCtrl.SetTimeRecordVisible(true)
	else
		MainmenuCtrl.SetTimeRecordVisible(false)
	end

	inputMgr:SetPointerLocked(true)
	FS_UserData.itemList:CheckNoobItem()
end

function MainmenuCtrl.IsActionBtnReady()
	return actionBtn.loadFinish
end

function MainmenuCtrl.RefreshActionBtnJoystickIcon()
	local name = string.lower(GPKey.ACTION)

	if string.len(name) > 0 then
		local buttons = actionBtn.buttons

		for k, btn in pairs(buttons) do
			if btn and btn.jsIcon then
				local sprite = XObjectPool.GetIcon(LS_Setting.GetBtnIconName(name))

				if sprite then
					btn.jsIcon:SetSprite(sprite)
				end
			end
		end
	end

	local btnCount = table.nums(joystickIcons)

	for key, icon in pairs(joystickIcons) do
		if icon then
			local sprite = XObjectPool.GetIcon(LS_Setting.GetBtnIconName(GPKey[key]))

			if sprite then
				icon:SetSprite(sprite)
			end
		end
	end
end

function MainmenuCtrl.RefreshActionBtnKeyboardIcon()
	local keyName = LS_Setting.KMItems[LS_Setting.KMIndex.ACTION]
	local keyCode = KMKey[keyName]
	local buttons = actionBtn.buttons

	for i = 1, actionBtn.maxCount do
		local btn = buttons[i]

		if btn and btn.kmIcon then
			if keyCode > 0 then
				local filename = LS_Setting.GetPCIconName(XKeyIconName[keyCode])

				if filename then
					local sprite = XObjectPool.GetIcon(filename)

					if sprite then
						btn.kmIcon:SetSprite(sprite)
					end

					if btn.kmIcon.gameObject ~= nil then
						btn.kmIcon.gameObject:SetActive(true)
					end

					btn.abIcon:SetActive(false)
				else
					if btn.kmIcon.gameObject ~= nil then
						btn.kmIcon.gameObject:SetActive(false)
					end

					btn.abIcon:SetActive(true)
				end
			else
				if btn.kmIcon.gameObject ~= nil then
					btn.kmIcon.gameObject:SetActive(false)
				end

				btn.abIcon:SetActive(true)
			end
		end
	end
end

function MainmenuCtrl.RefreshOtherKeyboardIcons()
	local btnCount = table.nums(keyboardIcons)

	for keyName, icon in pairs(keyboardIcons) do
		if icon then
			local keyCode = KMKey[keyName]
			local symbol = XKeySymbol[keyCode]

			if symbol ~= nil then
				local sprite = XObjectPool.GetIcon(LS_Setting.GetPCIconName(symbol))

				if sprite then
					icon:SetSprite(sprite)
				end
			end
		end
	end
end

function MainmenuCtrl.IsPlayerStatusReady()
	return playerStatus.statusLoadFinish
end

function MainmenuCtrl.IsOppositeStatusReady()
	return oppositeStatus.statusLoadFinish
end

function MainmenuCtrl.IsUiLoaded()
	this.loadFinish = MainmenuCtrl.IsActionBtnReady() and MainmenuCtrl.IsPlayerStatusReady() and MainmenuCtrl.IsOppositeStatusReady()

	if this.loadFinish then
		delayLoad = 2

		LS_Setting.UpdateTouchUi()
		this.ClearSanityVfx()
		sceneController:SetJoystickControllerForMoveFixed(LS_Setting.fixedvlj > 0)
		this.UpdateHpBarByMode()
		this.ResetSanityVfx()
	end
end

function MainmenuCtrl.ShowBaseUI(show)
	local group = this.mainComponent:GetGroupByName("BaseUI")

	if group then
		if LS_Setting.isMouseConnected then
			this.ShowTouchUI(show)
		end

		if LS_Setting.isMouseConnected and LS_Setting.isKeyboardConnected == false then
			group:SetAlpha(1)
		else
			group:SetAlpha(show and 1 or 0)
		end
	end
end

function MainmenuCtrl.ShowMainUI(show)
	panelPlayer.forceStopingCounting = not show

	local group = this.mainComponent:GetGroupByName("MainUI")

	if group then
		group:SetAlpha(show and 1 or 0)
	end
end

function MainmenuCtrl.ShowJoystick(show)
	panelPlayer.forceStopingCounting = not show

	local group = this.mainComponent:GetGroupByName("MainJS")

	if group then
		group:SetAlpha(show and 1 or 0)
	end
end

function MainmenuCtrl.ShowJoystickMFi(show)
	return
end

function MainmenuCtrl.ShowHostUI(show)
	local group = this.mainComponent:GetGroupByName("HostUI")

	if group then
		group:SetAlpha(show and 1 or 0)
	end
end

function MainmenuCtrl.ShowGameUI(show)
	if panelRoot.isFadingInOut > 0 then
		panelRoot.twFadeIn:Stop()
	elseif panelRoot.isFadingInOut < 0 then
		panelRoot.twFadeOut:Stop()
	end

	if show and not panelRoot.show then
		panelRoot.isFadingInOut = 0
		panelRoot.show = true
		panelRoot.cg.alpha = 1
		panelRoot.isInteractive = true

		MainmenuCtrl.SetInteractive(true)
		this.ShowTouchUI(not LS_Setting.isJoystickConnected and not LS_Setting.isKeyboardConnected and not LS_Setting.isMouseConnected)
	elseif not show and panelRoot.show then
		panelRoot.isFadingInOut = 0
		panelRoot.show = false
		panelRoot.cg.alpha = 0
		panelRoot.isInteractive = false

		MainmenuCtrl.SetInteractive(false)
		this.ShowTouchUI(false)
	end
end

function MainmenuCtrl.SetDragButton(button)
	dragButton = button

	if dragButton == ControllerMain.SkillButton.Special then
		skillBtn[2]:SetInteractable(false)
		skillBtn[3]:SetInteractable(false)
	elseif dragButton == ControllerMain.SkillButton.Light then
		skillBtn[1]:SetInteractable(false)
		skillBtn[2]:SetInteractable(false)
	elseif dragButton == ControllerMain.SkillButton.Heavy then
		skillBtn[1]:SetInteractable(false)
		skillBtn[3]:SetInteractable(false)
	elseif dragButton == 0 then
		skillBtn[1]:SetInteractable(true)
		skillBtn[2]:SetInteractable(true)
		skillBtn[3]:SetInteractable(true)
	end
end

function MainmenuCtrl.DragSkillButton()
	if dragStart == true and dragButton > 0 then
		this.Drag_Skill(dragButton)
	end
end

function MainmenuCtrl.ClearSkillTrigger()
	isTriggerOn = false
end

function MainmenuCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if UILayerCtrl.IsCurrentLayerCurtain() or UIManager.IsMovieMode() then
		return
	end

	if panelRoot and not panelRoot.blocksRaycasts and panelDeath and not panelDeath.show then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "GameMain" then
		if inputMgr:GetKeyUp(KMKey.MOUSE) then
			inputMgr:SetPointerLocked(true)

			LS_Setting.ignoreLMB = false

			this.ShowTouchUI(not LS_Setting.isJoystickConnected and not LS_Setting.isKeyboardConnected and not LS_Setting.isMouseConnected)
		elseif inputMgr:GetKey(KMKey.MOUSE) then
			-- block empty
		elseif inputMgr:GetKeyDown(KMKey.MOUSE) then
			inputMgr:SetPointerLocked(false)

			LS_Setting.ignoreLMB = true

			this.ShowTouchUI(true)
		end

		local skillIdxOfst = (skillIcon.mode - 1) * MainmenuCtrl.SkillBtnMode.SkillBtnMax

		if isTriggerOn == false then
			if inputMgr:GetButtonUp(GPKey.SKILL4) or inputMgr:GetKeyUp(KMKey.SKILL4) then
				this.PointerUp_Skill(ControllerMain.SkillButton.Dodge + skillIdxOfst)

				isUseGamePadAxis = false

				deltaAxis:Set(0, 0)
			elseif inputMgr:GetButtonDown(GPKey.SKILL4) or inputMgr:GetKeyDown(KMKey.SKILL4) then
				isUseGamePadAxis = true

				this.PointerDown_Skill(ControllerMain.SkillButton.Dodge + skillIdxOfst)
			end

			if inputMgr:GetButtonUp(GPKey.ACTION) or inputMgr:GetKeyUp(KMKey.ACTION) then
				for i = 1, actionBtn.maxCount do
					local com = actionBtn.buttons[i]

					if com.show then
						com.btn:OnDown(nil, nil)
						com.btn:OnClick(nil, nil)

						break
					end
				end
			end

			if inputMgr:GetButtonUp(GPKey.SKILL5) or inputMgr:GetKeyUp(KMKey.SKILL5) then
				this.PointerUp_Skill(ControllerMain.SkillButton.Option + skillIdxOfst)
			elseif inputMgr:GetButtonDown(GPKey.SKILL5) or inputMgr:GetKeyDown(KMKey.SKILL5) then
				this.PointerDown_Skill(ControllerMain.SkillButton.Option + skillIdxOfst)
			end

			if inputMgr:GetButtonUp(GPKey.SKILL3) or inputMgr:GetKeyUp(KMKey.SKILL3) then
				this.PointerUp_Skill(ControllerMain.SkillButton.Light + skillIdxOfst)

				isUseGamePadAxis = false

				deltaAxis:Set(0, 0)
			elseif inputMgr:GetButtonDown(GPKey.SKILL3) or inputMgr:GetKeyDown(KMKey.SKILL3) then
				isUseGamePadAxis = true

				this.PointerDown_Skill(ControllerMain.SkillButton.Light + skillIdxOfst)
			end
		end

		if inputMgr:GetButtonUp(GPKey.SKILL1) or inputMgr:GetKeyUp(KMKey.SKILL1) then
			this.PointerUp_Skill(ControllerMain.SkillButton.Special + skillIdxOfst)

			isUseGamePadAxis = false
			isTriggerOn = false

			deltaAxis:Set(0, 0)
		elseif inputMgr:GetButtonDown(GPKey.SKILL1) or inputMgr:GetKeyDown(KMKey.SKILL1) then
			isUseGamePadAxis = true
			isTriggerOn = true

			this.PointerDown_Skill(ControllerMain.SkillButton.Special + skillIdxOfst)
		elseif inputMgr:GetButton(GPKey.SKILL1) then
			-- block empty
		end

		local isLock = sceneController:IsLockPlayer()

		if isLock == true and isUseGamePadAxis == false then
			this.GamePadLockControl()
		end

		if inputMgr:GetButtonDown(GPKey.LOCKON) or inputMgr:GetKeyDown(KMKey.LOCKON) then
			SystemHelper.LogTest("Lock Click")
			this.PointerClick_LockPlayer()
		end

		if AppVer ~= AppAppleDemo then
			if Platform == PlatformType.IOS or Platform == PlatformType.TVOS or Platform == PlatformType.MAC then
				if inputMgr:GetJoystickType() < InputManager.AppleMFiCertified then
					if inputMgr:GetButtonDown(LS_Setting.Btn.C1) or inputMgr:GetKeyDown(XKeyCode.BackQuote) or inputMgr:GetKeyDown(XKeyCode.Escape) then
						AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
						this.PointerClick_Return()
					elseif inputMgr:GetButtonDown(LS_Setting.Btn.C2) or inputMgr:GetKeyDown(KMKey.PLAYERINFO) then
						this.PointerClick_OpenPlayerInfo()
					end
				elseif Platform == PlatformType.IOS then
					if playerStatus.ButtonPressedFlag then
						local deltaTime = Mathf.Abs(TimeHelper.getNowTimeNoScale() - playerStatus.ButtonPressedTime)

						if deltaTime > 0.26 and deltaTime < 0.7 then
							playerStatus.ButtonPressedTime = 0
							playerStatus.ButtonPressedCount = 0
							playerStatus.ButtonPressedFlag = false

							this.PointerClick_OpenPlayerInfo()
						end
					end

					if inputMgr:GetButtonDown(LS_Setting.Btn.C2) then
						holdingTime.SL = TimeHelper.getNowTimeNoScale()

						if playerStatus.ButtonPressedFlag and playerStatus.ButtonPressedCount == 1 then
							local deltaTime = Mathf.Abs(TimeHelper.getNowTimeNoScale() - playerStatus.ButtonPressedTime)

							if deltaTime <= 0.26 then
								playerStatus.ButtonPressedTime1 = 0
								playerStatus.ButtonPressedCount = 0
								playerStatus.ButtonPressedFlag = false

								AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
								this.PointerClick_Return()
							end
						elseif not playerStatus.ButtonPressedFlag and playerStatus.ButtonPressedCount == 0 then
							playerStatus.ButtonPressedTime = TimeHelper.getNowTimeNoScale()
							playerStatus.ButtonPressedCount = 1
							playerStatus.ButtonPressedFlag = true
						end
					elseif inputMgr:GetButtonUp(LS_Setting.Btn.C2) then
						local deltaT = TimeHelper.getNowTimeNoScale() - holdingTime.SL

						if deltaT < 0.5 then
							if DebugAIControl then
								sceneController:DebugChangeHostFakePlayer()
							end
						elseif deltaT > 1.2 then
							this.ShowDebugPanel()
						end

						holdingTime.SL = 0
					end
				elseif inputMgr:GetButtonDown(LS_Setting.Btn.C2) then
					this.PointerClick_OpenPlayerInfo()
				end
			elseif inputMgr:GetButtonDown(LS_Setting.Btn.C1) or inputMgr:GetLegacyButtonDown(XKeyCode.BackQuote) or inputMgr:GetLegacyButtonDown(XKeyCode.Escape) then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Back)
				this.PointerClick_Return()
			elseif inputMgr:GetButtonDown(LS_Setting.Btn.C2) or inputMgr:GetLegacyButtonDown(KMKey.PLAYERINFO) then
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
				AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
				this.PointerClick_OpenPlayerInfo()
			end
		end

		if inputMgr:GetButtonUp(LS_Setting.Btn.L3) then
			this.PointerClick_SkillMode()
		end

		if inputMgr:GetButtonUp(GPKey.CHANGEHERO) or inputMgr:GetKeyUp(KMKey.CHANGEHERO) then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
			this.PointerClick_ChangeHostPlayer()
		end

		if inputMgr:GetButtonUp(GPKey.ITEMS1) or inputMgr:GetKeyUp(KMKey.ITEMS1) then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
			sceneController:SetActionItem(MS_ItemData.ItemID_HpAdd)
		end

		if (Platform == PlatformType.TVOS or Platform == PlatformType.IOS) and inputMgr:GetJoystickType() == InputManager.AppleMFiCertified and inputMgr:GetButtonDown(LS_Setting.Btn.DD) then
			MainmenuCtrl.PointerClick_Return()
		elseif DebugShowCtrlPanel and (inputMgr:GetButtonUp(LS_Setting.Btn.DD) or inputMgr:GetKeyUp(KMKey.DBGPNL)) and debugPanel then
			MainmenuCtrl.ShowDebugPanel()
		end

		if inputMgr:GetButtonUp(GPKey.ITEMS0) or inputMgr:GetKeyUp(KMKey.ITEMS0) then
			sceneController:DebugPropertyMax()

			if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == false then
				local deltaT = TimeHelper.getNowTimeNoScale() - holdingTime.LB

				if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and deltaT < 0.5 and sceneController:PermitUsingQuickItem() and quickItem ~= nil then
					sceneController:PressQuickMenu()
				end
			end

			holdingTime.LB = 0
		elseif inputMgr:GetButtonDown(GPKey.ITEMS0) or inputMgr:GetKeyDown(KMKey.ITEMS0) then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)

			holdingTime.LB = TimeHelper.getNowTimeNoScale()
		elseif (inputMgr:GetButton(GPKey.ITEMS0) or inputMgr:GetKey(KMKey.ITEMS0)) and MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == false then
			local deltaT = TimeHelper.getNowTimeNoScale() - holdingTime.LB

			if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and deltaT > 0.5 and sceneController:PermitUsingQuickItem() and holdingTime.LB ~= 0 and SelectItemPanel.gameObject.activeSelf == false and sceneController:PermitUsingQuickItem() then
				SelectItemPanel.gameObject:SetActive(true)
				SelectItemPanel.ArcadeItemDesGroup:SetActive(FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade))
				AudioCtrl.DepressOrRiseAudio(true)

				if panelItems.SelectedItem then
					panelItems.SelectedItem:SetNormal()
					panelItems.SelectedItem:SetHighlighted()
				end

				UILayerCtrl.Push("SelectItem", nil)
				inputMgr:SetPointerLocked(false)

				local controllerTimer = sceneController:GetControllerTimer()

				if controllerTimer ~= nil then
					controllerTimer:SetTimeScale(ControllerTimer.Priority.QuickItem, MainmenuCtrl.QuickItemSlowTime, 0, -1, 0)
				end
			end
		end

		if inputMgr:GetButtonUp(GPKey.SKILL2) or inputMgr:GetKeyUp(KMKey.SKILL2) then
			this.PointerUp_Skill(ControllerMain.SkillButton.Heavy + skillIdxOfst)

			isUseGamePadAxis = false
			isTriggerOn = false

			deltaAxis:Set(0, 0)
		elseif inputMgr:GetButtonDown(GPKey.SKILL2) or inputMgr:GetKeyDown(KMKey.SKILL2) then
			isUseGamePadAxis = true
			isTriggerOn = true

			this.PointerDown_Skill(ControllerMain.SkillButton.Heavy + skillIdxOfst)
		elseif inputMgr:GetButton(GPKey.SKILL2) or inputMgr:GetKey(KMKey.SKILL2) then
			this.GamePadRotation(ControllerMain.SkillButton.Heavy)
		end
	elseif layerName == "SelectItem" then
		if inputMgr:GetButtonUp(GPKey.ITEMS0) or inputMgr:GetKeyUp(KMKey.ITEMS0) then
			holdingTime.LB = 0

			UILayerCtrl.OnButtonClick("Panel_SelectItems")

			local controllerTimer = sceneController:GetControllerTimer()

			if controllerTimer ~= nil then
				controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.QuickItem)
			end
		end
	elseif layerName == "Guide" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "BattleResult" then
		local resultFlag = PVPBattleResultCtrl.GetResultFlag()

		if resultFlag then
			if inputMgr:GetButtonUp(GBKey.A) then
				UILayerCtrl.OnButtonClick("PVPBattleResultPanel_Bottom")
			end
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.L1) then
			PVPBattleResultCtrl.Hide()
		end
	elseif layerName == "PanelDeath" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
			UILayerCtrl.OnCursorClick()
		end
	elseif layerName == "PanelChallengeResult" or layerName == "PanelArcadeResult" then
		if inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmUp() then
			UILayerCtrl.OnCursorClickMute()
		elseif inputMgr:GetButtonDown(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.Common)
		end
	elseif layerName == "SelectItem" and (inputMgr:GetButtonUp(GBKey.B) or inputMgr:GetKeyCancelUp()) then
		UILayerCtrl.OnButtonClick("Panel_SelectItems")

		local controllerTimer = sceneController:GetControllerTimer()

		if controllerTimer ~= nil then
			controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.QuickItem)
		end
	end
end

function MainmenuCtrl.ClosePanelSelectItem()
	UILayerCtrl.OnButtonClick("Panel_SelectItems")
end

function MainmenuCtrl.KeyboardControl()
	return
end

function MainmenuCtrl.GamePadRotation(button)
	if canDrag == false then
		return
	end

	local axisX = inputMgr:GetAxis(LS_Setting.Btn.VX)
	local axisY = inputMgr:GetAxis(LS_Setting.Btn.VY)

	if MathHelper.IsZero(axisX) then
		axisX = inputMgr:GetMouseX()
	end

	if MathHelper.IsZero(axisY) then
		axisY = inputMgr:GetMouseY()
	end

	local RightX = axisX * LS_Setting.camera.horizontal
	local RightY = axisY * LS_Setting.camera.vertical

	if MathHelper.IsZero(RightX) == false or MathHelper.IsZero(RightY) == false then
		deltaAxis.x = deltaAxis.x + RightX * 0.05
		deltaAxis.y = deltaAxis.y + RightY * 0.05

		if deltaAxis.x >= 1 then
			deltaAxis.x = 1
		elseif deltaAxis.x <= -1 then
			deltaAxis.x = -1
		end

		if deltaAxis.y >= 1 then
			deltaAxis.y = 1
		elseif deltaAxis.y <= -1 then
			deltaAxis.y = -1
		end
	end

	sceneController:DragSkillDirection(deltaAxis, button)
end

function MainmenuCtrl.GamePadLockControl()
	local RightX = inputMgr:GetAxis(LS_Setting.Btn.VX) * LS_Setting.camera.horizontal
	local RightY = inputMgr:GetAxis(LS_Setting.Btn.VY) * LS_Setting.camera.vertical

	if LS_Setting.isKeyboardConnected or LS_Setting.isMouseConnected then
		if inputMgr:GetKeyDown(KMKey.LCKPRV) then
			RightX = -1 * LS_Setting.camera.horizontal
		elseif inputMgr:GetKeyDown(KMKey.LCKNXT) then
			RightX = 1 * LS_Setting.camera.horizontal
		end
	end

	local axisDis = RightX * RightX + RightY * RightY

	if MathHelper.IsZero(axisDis) == false and MathHelper.IsZero(lastRightXAxis) and MathHelper.IsZero(lastRightYAxis) then
		sceneController:ChangeActionLockPlayer(RightX, -RightY)
	end

	lastRightXAxis = RightX
	lastRightYAxis = RightY
end

function MainmenuCtrl.PointerClick_SkillMode()
	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossChallenge) then
		return
	end

	if DebugMonsterAI and skillIcon and skillIcon.btnSkillMode then
		local modeMax = MainmenuCtrl.SkillBtnMode.ModeMax

		skillIcon.mode = skillIcon.mode % modeMax + 1

		skillIcon.btnSkillModeText:SetContent(skillIcon.mode)
	end
end

function MainmenuCtrl.PointerClick_Skill(button)
	sceneController:PressSkillButton(ControllerMain.PressType.Click, button, Vector3.zero)
end

function MainmenuCtrl.PointerDown_Skill(button)
	local pos = this.UpdateJoystickPosition(button)

	if isUseGamePadAxis then
		pos = Vector3.zero
	end

	sceneController:PressSkillButton(ControllerMain.PressType.PressDown, button, pos)
end

function MainmenuCtrl.PointerUp_Skill(button)
	local pos = this.UpdateJoystickPosition(button)

	if isUseGamePadAxis then
		pos = deltaAxis
	end

	sceneController:PressSkillButton(ControllerMain.PressType.PressUp, button, pos)
end

function MainmenuCtrl.Drag_Skill(button)
	if canDrag == false then
		return
	end

	local pos = this.UpdateJoystickPosition(button)

	sceneController:DragSkillDirection(pos, button)
end

function MainmenuCtrl.TakeUiHandling(btnType)
	btnTypeInHandling = btnType
end

function MainmenuCtrl.ReturnUiHandling()
	btnTypeInHandling = MainmenuCtrl.NoneBtn
end

function MainmenuCtrl.IsUiInHandling()
	return btnTypeInHandling
end

function MainmenuCtrl.PointerClick_Return()
	if sceneController:PermitOpeningMenus() then
		local currentUiHandling = MainmenuCtrl.IsUiInHandling()

		if currentUiHandling == MainmenuCtrl.FuncBtn then
			return
		end

		MainmenuCtrl.TakeUiHandling(MainmenuCtrl.FuncBtn)
		MainmenuCtrl.ShowMainUI(false)
		MainmenuCtrl.ShowHostUI(false)
		MainmenuCtrl.ShowBaseUI(false)
		MainmenuCtrl.SetInteractive(false)
		UIManager.CreateCtrl("Setting")
		UIManager.SendMessage("Setting", "OpenFromGame", true)
		UIManager.SendMessage("Setting", "ExitBtn", true)
		UILayerCtrl.ForceUpdate(0.6)
	end
end

function MainmenuCtrl.PointerClick_OpenPlayerInfo()
	if sceneController:PermitOpeningMenus() then
		local currentUiHandling = MainmenuCtrl.IsUiInHandling()

		if currentUiHandling == MainmenuCtrl.FuncBtn then
			return
		end

		MainmenuCtrl.TakeUiHandling(MainmenuCtrl.FuncBtn)
		UIManager.SendMessage("PlayerInfo", "OpenPlayerInfo")
		UILayerCtrl.ForceUpdate(0.6)
	end
end

function MainmenuCtrl.PointerClick_ChangeHostPlayer()
	if playerStatus.btnChangeHero.heroId > 0 then
		if playerStatus.btnChangeHero.canChangeHostPlayer then
			sceneController:StartSwitchHostPlayer()
		else
			AudioCtrl.SetUIAudio("unable")
		end
	end
end

function MainmenuCtrl.ShowButtonChangeHero(nextHeroId, isDisable, isDead)
	if playerStatus and playerStatus.btnChangeHero then
		local btnChangeHero = playerStatus.btnChangeHero

		if btnChangeHero.heroId ~= nextHeroId or playerStatus.btnChangeHero.canChangeHostPlayer == isDisable or playerStatus.btnChangeHero.isDead ~= isDead then
			btnChangeHero.heroId = nextHeroId

			if playerStatus.iconNextHero then
				local sprite = XObjectPool.GetIcon("photo" .. BattleData.ConvertHeroIdWithSkin(nextHeroId))

				if sprite then
					playerStatus.iconNextHero:SetSprite(sprite)
				end
			end

			playerStatus.btnChangeHero.canChangeHostPlayer = not isDisable and not isDead

			if not playerStatus.btnChangeHero.canChangeHostPlayer then
				playerStatus.iconNextHero:SetGray(true)
				playerStatus.btnChangeHero.btn:SetAudioType(AudioCtrl.ButtonClickType.None)
			else
				playerStatus.iconNextHero:SetGray(false)
				playerStatus.btnChangeHero.btn:SetAudioType(AudioCtrl.ButtonClickType.Common)
			end

			playerStatus.btnChangeHero.isDead = isDead

			playerStatus.nextHeroDead:SetActive(false)
			playerStatus.nextHeroDead:SetActive(isDead)
			btnChangeHero.go:SetActive(nextHeroId > 0)
		end
	end
end

function MainmenuCtrl.ShowButtonHeroReborn()
	playerStatus.nextHeroReborn:SetActive(false)
	playerStatus.nextHeroReborn:SetActive(true)
end

function MainmenuCtrl.UpdateBtnChangeHostPlayer(heroIdx1, heroIdx2, heroIdx3, testList)
	local newHeroList = {}
	local heroCount = #testList
	local heroList = testList
	local latestList = {
		heroIdx1,
		heroIdx2,
		heroIdx3
	}
	local latestCount = #latestList
	local headerIndex = 1
	local appendIndex = latestCount + 1

	for i = 1, heroCount do
		local hero = heroList[i]
		local latestCount = #latestList

		for j = headerIndex, latestCount do
			if hero.heroId == latestList[j] then
				hero.usable = true
				newHeroList[headerIndex] = hero

				local temp = heroList[i]

				heroList[j] = hero
				headerIndex = headerIndex + 1
				heroList[i] = temp

				table.remove(latestList, j)

				headerIndex = headerIndex + 1

				break
			end
		end
	end

	for i = appendIndex, heroCount do
		local hero = heroList[i]

		newHeroList[i] = hero
		hero.usable = false
		appendIndex = appendIndex + 1
	end
end

function MainmenuCtrl.PointerClick_LockPlayer()
	sceneController:SetActionLockPlayer()
end

function MainmenuCtrl.SetLockButtonState(buttonState, forceSet)
	if playerStatus.btnLockState ~= buttonState or forceSet then
		playerStatus.btnLockState = buttonState

		if playerStatus.btnLockState == MainmenuCtrl.LockButtonState.Disabled then
			btnChangeLock.gameObject:SetActive(false)
			btnLockPlayer:SetDisabled(forceSet)
		elseif playerStatus.btnLockState == MainmenuCtrl.LockButtonState.Enabled then
			btnChangeLock.gameObject:SetActive(false)
			btnLockPlayer:SetNormal()
		elseif playerStatus.btnLockState == MainmenuCtrl.LockButtonState.LockedOn then
			btnChangeLock.gameObject:SetActive(true)
			btnLockPlayer:SetHighlighted()
		end
	end
end

function MainmenuCtrl.RevalidateLock()
	local buttonState = playerStatus.btnLockState

	if buttonState == MainmenuCtrl.LockButtonState.Disabled then
		btnLockPlayer:SetDisabled(true)
		btnLockPlayer:TriggerAnimation(btnLockPlayer.btnCom.animationTriggers.disabledTrigger)
	elseif buttonState == MainmenuCtrl.LockButtonState.Enabled then
		btnLockPlayer:SetNormal(true)
		btnLockPlayer:TriggerAnimation(btnLockPlayer.btnCom.animationTriggers.normalTrigger)
	elseif buttonState == MainmenuCtrl.LockButtonState.LockedOn then
		btnLockPlayer:SetHighlighted(true)
		btnLockPlayer:TriggerAnimation(btnLockPlayer.btnCom.animationTriggers.highlightedTrigger)
	end
end

function MainmenuCtrl.PointDown_ChangeLockPlayer()
	return
end

function MainmenuCtrl.Drag_ChangeLockPlayer()
	return
end

function MainmenuCtrl.PointUp_ChangeLockPlayer(offsetX, offsetY)
	local absOffset = offsetX * offsetX + offsetY * offsetY

	if absOffset > 5776 then
		sceneController:ChangeActionLockPlayer(offsetX, offsetY)
	end
end

function MainmenuCtrl.ShowDragPanel(btnIndex)
	if btnIndex >= 1 and btnIndex <= 3 then
		skillDrag[btnIndex].gameObject:SetActive(true)
	else
		return
	end

	skillJoystickArrow.gameObject:SetActive(true)
	imageSightCenter.gameObject:SetActive(true)

	local pos = this.UpdateJoystickPosition(btnIndex)

	if isUseGamePadAxis then
		pos = Vector3.zero

		this.HideAllDragPanel()
		imageSightCenter.gameObject:SetActive(true)
	end

	sceneController:DragSkillInit()
	sceneController:DragSkillDirection(pos, btnIndex)

	canDrag = true
end

function MainmenuCtrl.HideAllDragPanel()
	if previousLocked > 0 then
		HeadInfoCtrl.ShowLock(previousLocked, false)

		previousLocked = -1
	end

	skillDrag[1].gameObject:SetActive(false)
	skillDrag[2].gameObject:SetActive(false)
	skillDrag[3].gameObject:SetActive(false)
	skillJoystickArrow.gameObject:SetActive(false)
	imageSightCenter.gameObject:SetActive(false)

	canDrag = false
end

function MainmenuCtrl.SetSightFocus(flag, targetAnimal)
	if imageSightCenter.gameObject.activeSelf == true and imageSightCenterAnimator ~= nil then
		imageSightCenterAnimator:SetBool("focus", flag)

		if targetAnimal ~= nil then
			local currentLocked = targetAnimal:GetAnimalId()

			HeadInfoCtrl.ShowLock(currentLocked, flag)

			if previousLocked ~= currentLocked then
				HeadInfoCtrl.ShowLock(previousLocked, false)

				previousLocked = currentLocked
			end
		end
	end
end

function MainmenuCtrl.GetDragDegree()
	return dragDegree
end

function MainmenuCtrl.DebugControl()
	local hostPlayer = sceneController:GetHostPlayer()

	if hostPlayer ~= nil then
		if inputMgr:GetKeyUp(KMKey.ACTION) then
			hostPlayer:PressTestButtonE()
		elseif inputMgr:GetKeyUp(KMKey.MSLOW) then
			hostPlayer:PressTestButtonAlt()
		end
	end
end

function MainmenuCtrl.Update()
	if not this.loadFinish then
		return
	end

	local ctrlGameMode = sceneController:GetGameController()

	if ctrlGameMode and ctrlGameMode:IsInMovie() then
		return
	end

	UILayerCtrl.Update()

	if panelRoot then
		if panelRoot.isFadingInOut ~= 0 then
			this.UpdatePoi()

			return
		end

		if not panelRoot.isInteractive and not panelDeath.show then
			return
		end
	end

	this.DragSkillButton()

	if DebugConsole == true then
		this.DebugControl()
	end

	this.GamePadControl()
	this.KeyboardControl()
	UILayerCtrl.PostUpdate()

	if delayLoad > 0 then
		delayLoad = delayLoad - 1

		if delayLoad == 0 then
			this.RevalidateInputLayoutsForTouchScreen()

			if AppVer == AppAppleLight then
				inputMgr:SetLuaReturnToTitle(function()
					if UIManager.IsMovieMode() then
						UIManager.MovieMode(false)
					end

					LS_Setting.Reset()
					LS_Setting.Load(1)
					UIManager.RefreshLanguage()
					UIManager.SendMessage("Dialog", "StopDialog")
					UIManager.SendMessage("MsgBoxSimple", "CloseMessage")
					UIManager.SendMessage("MsgBoxSimple", "CloseAllRequestModal")
					UIManager.SendMessage("Setting", "ClosePanel")
					AudioCtrl.SetPause(false)
					XObjectPool.ClearImage()
					UILayerCtrl.Clear()

					local sceneController = ST_Main.GetSceneController()

					if sceneController ~= nil then
						inputMgr:SetPointerLocked(false)
						inputMgr:SetInMenuMode()
						sceneController:BackToTitle()
					end
				end)
			end
		end
	end

	if delayAutoAdaption > 0 then
		delayAutoAdaption = delayAutoAdaption - 1

		if delayAutoAdaption == 0 then
			this.RevalidateInputLayoutsForTouchScreen()
		end
	end

	this.UpdateRageInsufficient()
	this.BulletUpdate()
	this.UpdatePanelDeath()
	this.UpdateTouchUI()
	this.UpdateShowRewards()
	this.UpdateShowMessageTask()
	this.UpdatePoi()
end

function MainmenuCtrl.LateUpdate()
	if not this.loadFinish then
		return
	end

	local plu = lateUpdateTbl.player

	if plu.setShield then
		plu.setShield = false

		this.LateSetShield(plu.shieldVal, plu.shieldBase)
	end

	if plu.setHealth then
		plu.setHealth = false

		this.LateSetHp(plu.hpVal, plu.hpMax, plu.hpBase, plu.hpAnim)
	end

	if plu.setEnergy then
		plu.setEnergy = false

		this.LateSetEnergy(plu.energyVal)
	end

	if plu.setEnergyM then
		plu.setEnergyM = false

		this.LateSetEnergyMax(plu.energyMax)
	end

	if plu.setSanity then
		plu.setSanity = false

		this.LateSetSanityValue(plu.sanityCur, plu.sanityMax, plu.sanityPer, plu.sanityTyp, plu.sanityFR)
	end

	if plu.setRage then
		plu.setRage = false

		this.LateSetRage(plu.rageVal, plu.rageFR)
	end

	if plu.setKarma then
		plu.setKarma = false

		this.LateSetKarma(plu.karmaVal, plu.karmaFR)
	end
end

function MainmenuCtrl.SetBattleTime(timeVal)
	if Text_Time == nil then
		return
	end

	local timeSpan = TimeHelper.getTimeSpan(timeVal)

	Text_Time:SetContent(timeSpan.Minutes .. ":" .. timeSpan.Seconds)
end

function MainmenuCtrl.ShowHitImage()
	playerStatus.imageHit:SetActive(true)

	local tw = playerStatus.twHitMask

	tw:Play()
end

function MainmenuCtrl.UpdateJoystickPosition(touchSkillButton)
	local touchedBtnTf
	local dis = 85

	if touchSkillButton == ControllerMain.SkillButton.Special then
		touchedBtnTf = skillDrag[touchSkillButton].gameObject.transform
		dis = 145
	elseif touchSkillButton == ControllerMain.SkillButton.Heavy then
		touchedBtnTf = skillDrag[touchSkillButton].gameObject.transform
	elseif touchSkillButton == ControllerMain.SkillButton.Light then
		touchedBtnTf = skillDrag[touchSkillButton].gameObject.transform
	else
		return Vector3.zero
	end

	skillJoystickArrow.transform.position = dragPosition

	local touchedAxis = skillJoystickArrow.transform.anchoredPosition - touchedBtnTf.anchoredPosition

	if touchedAxis.sqrMagnitude >= dis * dis then
		touchedAxis:SetNormalize()
		touchedAxis:Mul(dis)

		skillJoystickArrow.transform.anchoredPosition = touchedBtnTf.anchoredPosition + touchedAxis
	end

	touchedAxis:Div(dis)

	return touchedAxis
end

function MainmenuCtrl.GetTouchWorldPosition(eventData)
	local worldPosition
	local ret, worldPosition = RectTransformUtility.ScreenPointToWorldPointInRectangle(skillJoystickArrow.transform.parent, eventData.position, eventData.pressEventCamera, worldPosition)

	if ret then
		return worldPosition
	end

	return skillJoystickArrow.transform.position
end

function MainmenuCtrl.GetLockChangeOffset(eventData)
	local pressPosition, worldPosition, ret

	ret, pressPosition = RectTransformUtility.ScreenPointToWorldPointInRectangle(btnChangeLock.transform.parent, eventData.pressPosition, eventData.pressEventCamera, pressPosition)
	ret, worldPosition = RectTransformUtility.ScreenPointToWorldPointInRectangle(btnChangeLock.transform.parent, eventData.position, eventData.pressEventCamera, worldPosition)

	local pos = Vector2.zero

	pos.x = worldPosition.x - pressPosition.x
	pos.y = worldPosition.y - pressPosition.y

	return pos
end

function MainmenuCtrl.ChangeSkillIcon(btnIndex, statusIdx, rageIdx)
	local heroId = sceneController:GetHostPlayerHeroId()
	local image = skillIcon[btnIndex]

	if image ~= nil then
		local iconName = MS_SkillIconData.GetSkillIcon(heroId, btnIndex, statusIdx)
		local sprite = XObjectPool.GetIcon(string.format("skill%s", iconName))

		image:SetSprite(sprite)
	end
end

function MainmenuCtrl.ChangeSpecialSkill(heroId, status)
	if playerStatus.animalId ~= heroId then
		return
	end

	local btnIndex = ControllerMain.SkillButton.Special
	local btn = skillBtn[btnIndex]

	if btn and heroId > 0 and status > 0 and playerStatus.skillSp1 ~= status then
		playerStatus.skillSp1 = status

		local image = skillIcon[btnIndex]

		if image then
			local iconName = MS_SkillIconData.GetSkillIcon(heroId, btnIndex, status)
			local sprite = XObjectPool.GetIcon(string.format("skill%s", iconName))

			image:SetSprite(sprite)
		end
	end
end

function MainmenuCtrl.ChangeHeavySkill(heroId, status, nextStatus)
	if playerStatus.animalId ~= heroId then
		return
	end

	local btnIndex = ControllerMain.SkillButton.Heavy
	local btn = skillBtn[btnIndex]

	if btn and heroId > 0 and status > 0 and playerStatus.skillSp1 ~= status then
		playerStatus.skillSp1 = status

		local image = skillIcon[btnIndex]

		if image then
			local iconName = MS_SkillIconData.GetSkillIcon(heroId, btnIndex, status)
			local sprite = XObjectPool.GetIcon(string.format("skill%s", iconName))

			image:SetSprite(sprite)
		end
	end
end

function MainmenuCtrl.ChangeMainSkills(heroId, status)
	if playerStatus.animalId ~= heroId then
		return
	end

	if playerStatus.skillSp1 ~= status then
		playerStatus.skillSp1 = status

		for btnIndex = 1, 3 do
			local btn = skillBtn[btnIndex]

			if btn and heroId > 0 and status > 0 then
				local image = skillIcon[btnIndex]

				if image then
					local iconName = MS_SkillIconData.GetSkillIcon(heroId, btnIndex, status)
					local sprite = XObjectPool.GetIcon(string.format("skill%s", iconName))

					image:SetSprite(sprite)
				end
			end
		end
	end
end

function MainmenuCtrl.ResetHeroPanel(animalId, heroIndex)
	local heroName = "hero" .. animalId
	local group = this.mainComponent:GetGroupByName(heroName)

	if group then
		group:SetActive(false)
	end

	if this["ResetPanel_" .. heroName] ~= nil then
		this["ResetPanel_" .. heroName]()
	end

	MainmenuCtrl.ResetAllStatus()
	MainmenuCtrl.ChangeSpecialSkill(animalId, 1, 0)

	if DebugShowHostHeader then
		UIManager.SendMessage("HeadInfo", "ShowHeader", heroIndex, false)
	end
end

function MainmenuCtrl.ShowHeroPanel(heroName, heroIndex)
	local heroId = tonumber(string.sub(heroName, 5, -1))

	playerStatus.animalId = heroId

	local skillList = MS_SkillIconData.GetSkillListDef(heroId)
	local skillCount = 0

	if skillList ~= nil then
		skillCount = #skillList
	end

	if skillCount > 0 then
		for i = 1, 5 do
			local obj = skillBtn[i]

			if obj then
				if i <= 4 then
					local skillIconName = skillList[i]

					if skillIconName then
						local sprite = XObjectPool.GetIcon(skillIconName)

						if sprite ~= nil then
							local image = skillIcon[i]

							image:SetSprite(sprite)
						end
					end
				else
					obj.gameObject:SetActive(false)
				end
			end
		end
	end

	local group = this.mainComponent:GetGroupByName(heroName)

	if group then
		group:SetActive(true)
	end

	if this["InitPanel_" .. heroName] ~= nil then
		this["InitPanel_" .. heroName]()
	else
		playerStatus.rageBar.icon.gameObject:SetActive(false)
	end

	if heroId > 20000 then
		local button = skillBtn[ControllerMain.SkillButton.Option]

		if button then
			button.gameObject:SetActive(true)
		end

		button = skillBtn[ControllerMain.SkillButton.Threat]

		if button then
			button.gameObject:SetActive(true)
		end

		if DebugMonsterAI and skillIcon and skillIcon.btnSkillMode then
			skillIcon.btnSkillMode.gameObject:SetActive(true)
		end
	end

	this.RefreshActionBtnJoystickIcon()
	this.RefreshActionBtnKeyboardIcon()
	this.RefreshOtherKeyboardIcons()

	for i = 1, 6 do
		local button = skillBtn[i]

		button.transform.localScale = Vector3.zero

		button.gameObject:SetActive(false)
	end

	btnLockPlayer.transform.localScale = Vector3.zero

	btnLockPlayer.gameObject:SetActive(false)

	panelSys.btnSettings.transform.localScale = Vector3.zero
	panelSys.btnPlayerInfo.transform.localScale = Vector3.zero
end

function MainmenuCtrl.ResetSkillStatus()
	playerStatus.skillSp1 = 1
end

function MainmenuCtrl.InitPanel_hero10001()
	this.SetRageType("10001", MainmenuCtrl.Rage.Type1, true)
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)

	local hostPlayer = sceneController:GetHostPlayer()
	local heroData = MS_HeroData.GetHero(10001)

	if heroData then
		if hostPlayer ~= nil then
			this.SetRageAvailableThreshold(heroData.UIRageMin, hostPlayer:GetUIRageLineDiff())
		else
			this.SetRageAvailableThreshold(heroData.UIRageMin)
		end
	else
		this.SetRageAvailableThreshold(MainmenuCtrl.RageAvailableThreshold)
	end
end

function MainmenuCtrl.ResetPanel_hero10001()
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)
	this.ResetSkillStatus()
end

function MainmenuCtrl.InitPanel_hero10002()
	this.SetRageType("10002", MainmenuCtrl.Rage.Type1, true)
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)

	local hostPlayer = sceneController:GetHostPlayer()
	local heroData = MS_HeroData.GetHero(10002)

	if heroData then
		if hostPlayer ~= nil then
			this.SetRageAvailableThreshold(heroData.UIRageMin, hostPlayer:GetUIRageLineDiff())
		else
			this.SetRageAvailableThreshold(heroData.UIRageMin)
		end
	else
		this.SetRageAvailableThreshold(MainmenuCtrl.RageAvailableThreshold)
	end

	MainmenuCtrl.BulletSetSlotCount()
	MainmenuCtrl.ShowPanelBullet(true)

	local button = skillBtn[ControllerMain.SkillButton.Heavy]

	button:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if dragStart == false then
			-- block empty
		end
	end, 0)

	button = skillBtn[ControllerMain.SkillButton.Option]

	if button then
		button.gameObject:SetActive(true)
	end

	button = skillBtn[ControllerMain.SkillButton.NewSpecial]

	if button then
		button:SetActive(false)
	end
end

function MainmenuCtrl.ResetPanel_hero10002()
	MainmenuCtrl.ShowPanelBullet(false)

	local button = skillBtn[ControllerMain.SkillButton.NewSpecial]

	if button then
		button:SetActive(false)
	end

	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)
	this.ResetSkillStatus()
end

function MainmenuCtrl.InitPanel_hero10003()
	this.SetRageType("10003", MainmenuCtrl.Rage.Type1, true)
	this.ShowKarmaBar(true)
	this.ShowRageJBar(false)

	local hostPlayer = sceneController:GetHostPlayer()
	local heroData = MS_HeroData.GetHero(10003)

	if heroData then
		if hostPlayer ~= nil then
			this.SetRageAvailableThreshold(heroData.UIRageMin, hostPlayer:GetUIRageLineDiff())
		else
			this.SetRageAvailableThreshold(heroData.UIRageMin)
		end
	else
		this.SetRageAvailableThreshold(MainmenuCtrl.RageAvailableThreshold)
	end

	button = skillBtn[ControllerMain.SkillButton.Option]

	if button then
		button.gameObject:SetActive(true)
	end
end

function MainmenuCtrl.ResetPanel_hero10003()
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)
	this.ResetSkillStatus()
end

function MainmenuCtrl.InitPanel_hero10004()
	this.SetRageType("10004", MainmenuCtrl.Rage.Type1, true)
	this.ShowKarmaBar(true)
	this.ShowRageJBar(false)

	local hostPlayer = sceneController:GetHostPlayer()
	local heroData = MS_HeroData.GetHero(10004)

	if heroData then
		if hostPlayer ~= nil then
			this.SetRageAvailableThreshold(heroData.UIRageMin, hostPlayer:GetUIRageLineDiff())
		else
			this.SetRageAvailableThreshold(heroData.UIRageMin)
		end
	else
		this.SetRageAvailableThreshold(MainmenuCtrl.RageAvailableThreshold)
	end
end

function MainmenuCtrl.ResetPanel_hero10004()
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)
	this.ResetSkillStatus()
end

function MainmenuCtrl.InitPanel_hero10005()
	this.SetRageType("10005", MainmenuCtrl.Rage.Type1, true)
	this.ShowKarmaBar(true, true)
	this.ShowRageJBar(true)

	local hostPlayer = sceneController:GetHostPlayer()
	local heroData = MS_HeroData.GetHero(10005)

	if heroData then
		if hostPlayer ~= nil then
			this.SetRageAvailableThreshold(heroData.UIRageMin, hostPlayer:GetUIRageLineDiff())
		else
			this.SetRageAvailableThreshold(heroData.UIRageMin)
		end
	else
		this.SetRageAvailableThreshold(MainmenuCtrl.RageAvailableThreshold)
	end
end

function MainmenuCtrl.ResetPanel_hero10005()
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)
	this.ResetSkillStatus()
end

function MainmenuCtrl.InitPanel_hero10007()
	this.SetRageType("10007", MainmenuCtrl.Rage.Type1, true)
	this.ShowKarmaBar(true, false)
	this.ShowRageJBar(false)

	local hostPlayer = sceneController:GetHostPlayer()
	local heroData = MS_HeroData.GetHero(10007)

	if heroData then
		if hostPlayer ~= nil then
			this.SetRageAvailableThreshold(heroData.UIRageMin, hostPlayer:GetUIRageLineDiff(), true)
		else
			this.SetRageAvailableThreshold(heroData.UIRageMin, nil, true)
		end

		this.SetKarmaAvailableThreshold(heroData.UIRageMin)
	else
		this.SetRageAvailableThreshold(MainmenuCtrl.RageAvailableThreshold, nil, true)
		this.SetKarmaAvailableThreshold(MainmenuCtrl.RageAvailableThreshold)
	end
end

function MainmenuCtrl.ResetPanel_hero10007()
	this.ShowKarmaBar(false)
	this.ShowRageJBar(false)
	this.ResetSkillStatus()
end

function MainmenuCtrl.ShowPanelBullet(show)
	if panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet

		if show ~= panelPlayer.showBullet then
			panelPlayer.showBullet = show

			pnlBullet.go:SetActive(show)
		end
	end
end

function MainmenuCtrl.BulletSetSlotCount(slotCount)
	if panelPlayer and panelPlayer.showBullet then
		local pnlBullet = panelPlayer.bullet

		if slotCount and type(slotCount) == "number" then
			pnlBullet.bulletMax = slotCount
		else
			slotCount = pnlBullet.bulletMax
		end

		local slots = pnlBullet.bulletSlots

		for i = 1, slotCount do
			local slot = slots[i]

			slot.showBody = true

			slot.body:SetActive(true)
		end
	end
end

function MainmenuCtrl.BulletSetIconType(bulletType)
	if panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet

		for idx = 1, 3 do
			local show = idx == bulletType

			pnlBullet.iconShow[idx] = show

			pnlBullet.iconType[idx]:SetActive(show)
		end

		this.SetRageType(playerStatus.animalId, bulletType)
	end
end

function MainmenuCtrl.BulletSetRemainingCount(count, bulletType)
	if count and type(count) == "number" and panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet

		if bulletType == Hero10002_Define.BulletType.White then
			count = GameText.UI_COMMON_INFINITY
		end

		if pnlBullet.countRemaining ~= count then
			pnlBullet.countRemaining = count

			local text = pnlBullet.txtBulletRemaining

			if type(count) == "number" and count >= 0 and count < 100 or type(count) == "string" then
				text:SetContent(count)
			end
		end

		if bulletType ~= nil and pnlBullet.txtBulletColor ~= bulletType then
			pnlBullet.txtBulletColor = bulletType

			local color = MainmenuCtrl.BulletTxtColor[bulletType]
			local text = pnlBullet.txtBulletRemaining

			text:SetColor(color[1], color[2], color[3], color[4])
		end

		this.BulletSetIconType(bulletType)
	end
end

function MainmenuCtrl.BulletAddSupply(count)
	if count and type(count) == "number" and panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet
	end
end

function MainmenuCtrl.BulletSetLoaded(typeLoaded, countLoaded, countRemaining)
	if panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet

		pnlBullet.isChanging = true
		pnlBullet.nextType = 0
		pnlBullet.currType = typeLoaded
		pnlBullet.countToLoad = 0
		pnlBullet.countLoaded = countLoaded

		local bulletMax = pnlBullet.bulletMax
		local slots = pnlBullet.bulletSlots
		local color = MainmenuCtrl.BulletColor[typeLoaded]
		local slots = pnlBullet.bulletSlots

		for i = 1, bulletMax do
			local slot = slots[i]

			slot.bulletLt:SetActive(false)
			slot.twBullet:Stop()
			slot.twRestore:Stop()
			slot.xtwBody:Stop()
			slot.xtwBody:ForceEndAnimation()
			slot.xtwBody:ResetData()

			slot.xtwBody.reversed = false

			slot.bullet:SetColor(color[1], color[2], color[3], color[4])

			slot.showBullet = i <= countLoaded
			slot.bulletCg.alpha = slot.showBullet and 1 or 0
			slot.isLoading = false
			slot.isRestoring = false
			slot.isCharging = false
			slot.isCharged = false
		end

		pnlBullet.isChanging = false

		pnlBullet.xtwOutOfAmmo:Stop()
		this.BulletSetRemainingCount(countRemaining, typeLoaded)
	end
end

function MainmenuCtrl.BulletReloading(countLoaded, countRemaining, duration)
	if panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet

		pnlBullet.isReloading = true

		local isOutOfAmmo = countLoaded == 0

		if isOutOfAmmo then
			if not pnlBullet.isOutOfAmmo then
				pnlBullet.isOutOfAmmo = true

				if not pnlBullet.xtwOutOfAmmo.isPlaying then
					pnlBullet.xtwOutOfAmmo:Play()
				end
			end
		else
			if pnlBullet.xtwOutOfAmmo.isPlaying then
				pnlBullet.xtwOutOfAmmo:ForceEndAnimation()
			end

			pnlBullet.xtwOutOfAmmo:Play()

			pnlBullet.countLoaded = 0
			pnlBullet.countToLoad = countLoaded

			if duration == nil then
				duration = 0.3
			end

			local bulletMax = pnlBullet.bulletMax
			local period = duration / bulletMax
			local delay = period * 0.4
			local slots = pnlBullet.bulletSlots

			for i = 1, countLoaded do
				local slot = slots[i]

				if not slot.isLoading then
					local tw = slot.twBullet

					tw:Delay(delay * (i - 1))
					tw:MoveTo({
						alpha = 1
					}, period)
					tw:Start()

					slot.isLoading = true
				end
			end

			if bulletMax > countLoaded + 1 then
				for i = countLoaded + 1, bulletMax do
					local slot = slots[i]

					slot.bulletCg.alpha = 0
					slot.showBullet = false
					slot.isLoading = false
					slot.isCharging = false
					slot.isCharged = false
				end
			end
		end

		local bulletType = pnlBullet.currType

		this.BulletSetRemainingCount(countRemaining, bulletType)
		this.BulletSetIconType(bulletType)
	end
end

function MainmenuCtrl.BulletChangeType(nextType, countLoaded, countRemaining)
	if panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet

		pnlBullet.xtwChangeAmmo:ForceEndAnimation()

		pnlBullet.nextType = nextType
		pnlBullet.isChanging = true
		pnlBullet.countLoaded = 0
		pnlBullet.countToLoad = countLoaded

		local bulletMax = pnlBullet.bulletMax
		local slots = pnlBullet.bulletSlots

		for i = 1, bulletMax do
			local slot = slots[i]

			if not slot.isLoading then
				local tw = slot.twBullet

				tw:Delay(0.033 * (i - 1))
				tw:MoveTo({
					alpha = 0
				}, 0.066)
				tw:Start()

				slot.isLoading = true
			end
		end

		pnlBullet.xtwChangeAmmo:Play()
		this.BulletSetRemainingCount(countRemaining, nextType)
		this.BulletSetIconType(nextType)
	end
end

function MainmenuCtrl.BulletSingleShooting()
	if panelPlayer and panelPlayer.showBullet then
		local pnlBullet = panelPlayer.bullet
		local idxSlot = pnlBullet.countLoaded

		if idxSlot > 0 then
			local slots = pnlBullet.bulletSlots
			local slot = slots[idxSlot]

			slot.showBullet = false
			slot.bulletCg.alpha = 0
			pnlBullet.countLoaded = idxSlot - 1
		end

		return pnlBullet.countLoaded
	end
end

function MainmenuCtrl.BulletSpecialShooting()
	if panelPlayer and panelPlayer.showBullet then
		local pnlBullet = panelPlayer.bullet

		if not pnlBullet.isSpShooting then
			local idxSlot = pnlBullet.countLoaded

			if idxSlot > 0 then
				local slots = pnlBullet.bulletSlots
				local slot = slots[idxSlot]

				slot.showBullet = false
				slot.bulletCg.alpha = 0
				pnlBullet.isSpShooting = true
			end
		end
	end
end

function MainmenuCtrl.BulletMultiShooting(count)
	if panelPlayer and panelPlayer.showBullet then
		local pnlBullet = panelPlayer.bullet
		local available = pnlBullet.countLoaded

		if count <= available and count ~= pnlBullet.countCharged then
			local slots = pnlBullet.bulletSlots

			if count > pnlBullet.countCharged then
				if not pnlBullet.isCharging then
					pnlBullet.isCharging = true
				end

				pnlBullet.countCharged = pnlBullet.countCharged + 1

				local slot = slots[available - count + 1]

				slot.xtwBody.delayTime = 0
				slot.xtwBody.reversed = false

				slot.xtwBody:ResetData()
				slot.xtwBody:Play()
				slot.bulletLt:SetActive(true)

				slot.isCharging = true
			elseif count < pnlBullet.countCharged then
				if pnlBullet.isCharging then
					pnlBullet.isCharging = false
				end

				local currentCountCharged = pnlBullet.countCharged
				local slot = slots[available - (currentCountCharged - count - 1)]

				if slot.isCharged then
					slot.xtwBody.delayTime = 0

					slot.xtwBody:Stop()
					slot.xtwBody:ForceEndAnimation()

					slot.xtwBody.reversed = true

					slot.xtwBody:ResetData()
					slot.xtwBody:Play()

					slot.isCharged = false
					slot.showBullet = false
					slot.bulletCg.alpha = 0

					slot.bulletLt:SetActive(false)

					pnlBullet.countCharged = currentCountCharged - 1
					pnlBullet.countLoaded = pnlBullet.countLoaded - 1
				end
			end
		end
	end
end

function MainmenuCtrl.BulletDisableCharging()
	if panelPlayer and panelPlayer.showBullet then
		local pnlBullet = panelPlayer.bullet
		local available = pnlBullet.countLoaded
		local bulletMax = pnlBullet.bulletMax

		pnlBullet.isCharging = false
		pnlBullet.countCharged = 0

		local slots = pnlBullet.bulletSlots

		for idx = 1, bulletMax do
			local slot = slots[idx]

			slot.xtwBody.delayTime = 0

			slot.xtwBody:Stop()
			slot.xtwBody:ForceEndAnimation()
			slot.xtwBody:ResetData()

			slot.isCharging = false
			slot.isCharged = false

			slot.bulletLt:SetActive(false)
		end
	end
end

function MainmenuCtrl.BulletUpdate()
	if panelPlayer and panelPlayer.showBullet then
		local pnlBullet = panelPlayer.bullet

		if pnlBullet ~= nil then
			if pnlBullet.isChanging and not pnlBullet.xtwChangeAmmo.isPlaying then
				pnlBullet.currType = pnlBullet.nextType
				pnlBullet.nextType = 0

				local color = MainmenuCtrl.BulletColor[pnlBullet.currType]
				local slots = pnlBullet.bulletSlots
				local bulletMax = pnlBullet.bulletMax

				for i = 1, bulletMax do
					local slot = slots[i]

					slot.isLoading = false

					slot.bullet:SetColor(color[1], color[2], color[3], color[4])

					slot.showBullet = i <= pnlBullet.countToLoad
					slot.bulletCg.alpha = slot.showBullet and 1 or 0
				end

				pnlBullet.countLoaded = pnlBullet.countToLoad
				pnlBullet.countToLoad = 0
				pnlBullet.isChanging = false
			elseif pnlBullet.isReloading and not pnlBullet.xtwOutOfAmmo.isPlaying then
				pnlBullet.isOutOfAmmo = false

				local slots = pnlBullet.bulletSlots
				local bulletMax = pnlBullet.bulletMax

				for i = 1, bulletMax do
					local slot = slots[i]

					slot.isLoading = false
					slot.showBullet = i <= pnlBullet.countToLoad
					slot.bulletCg.alpha = slot.showBullet and 1 or 0
				end

				pnlBullet.countLoaded = pnlBullet.countToLoad
				pnlBullet.countToLoad = 0
				pnlBullet.isReloading = false
			elseif pnlBullet.isCharging then
				local slots = pnlBullet.bulletSlots
				local bulletMax = pnlBullet.bulletMax

				for i = 1, bulletMax do
					local slot = slots[i]

					if slot.isCharging and not slot.xtwBody.isPlaying then
						slot.isCharged = true
						slot.isCharging = false
					end
				end
			elseif pnlBullet.isSpShooting then
				local slots = pnlBullet.bulletSlots
				local bulletMax = pnlBullet.bulletMax
				local bulletIdx = pnlBullet.countLoaded

				if bulletIdx <= bulletMax then
					local slot = slots[bulletIdx]

					if slot then
						slot.twRestore:Delay(0.2)
						slot.twRestore:MoveTo({
							alpha = 1
						}, 0.26)
						slot.twRestore:Start()
					end
				end

				pnlBullet.isSpShooting = false
			end

			if table.nums(pnlBullet.supply) > 0 then
				if not pnlBullet.isSupplying then
					pnlBullet.isSupplying = true

					pnlBullet.goSupplyEfx:SetActive(true)
				end

				if not pnlBullet.showEfx then
					pnlBullet.showEfx = true

					local count = table.remove(pnlBullet.supply)

					pnlBullet.txtSupplyCount:SetContent(GameText.UI_COMMON_PLUS .. count)
					pnlBullet.goSupplyLight:SetActive(true)
					pnlBullet.goSupplyCount:SetActive(true)
				elseif not pnlBullet.xtwSupplyLight.isPlaying and not pnlBullet.xtwSupplyCount.isPlaying then
					pnlBullet.goSupplyLight:SetActive(false)
					pnlBullet.goSupplyCount:SetActive(false)

					pnlBullet.showEfx = false
				end
			elseif pnlBullet.isSupplying and not pnlBullet.xtwSupplyLight.isPlaying and not pnlBullet.xtwSupplyCount.isPlaying then
				pnlBullet.goSupplyLight:SetActive(false)
				pnlBullet.goSupplyCount:SetActive(false)

				pnlBullet.isSupplying = false

				pnlBullet.goSupplyEfx:SetActive(false)
			end
		end
	end
end

function MainmenuCtrl.SetStatusEnabled(animalId, statusId, percent, isActive, param)
	local statusIcons = playerStatus.statusIcon
	local statusIcon = statusIcons[statusId]

	if statusIcon then
		if not statusIcon.show then
			statusIcon.show = true

			local tfBtn = statusIcon.com.transform

			tfBtn:SetParent(playerStatus.status.transform)

			if statusId > 90000 then
				table.insert(playerStatus.statusSp, statusId)
			end

			if statusIcon.com then
				statusIcon.com.gameObject:SetActive(true)
			end

			if statusIcon.icon then
				statusIcon.icon:SetActive(true)
			end
		end

		local statusSpCount = #playerStatus.statusSp

		if statusSpCount > 0 then
			local statusSp = playerStatus.statusSp

			for i = 1, statusSpCount do
				local spIcon = statusIcons[statusSp[i]]
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

				statusIcon.progress:SetFillAmount(transValue)
			end
		end
	end
end

function MainmenuCtrl.SetStatusDisabled(index, statusId)
	local statusIcons = playerStatus.statusIcon
	local statusIcon = statusIcons[statusId]

	if statusIcon then
		local tfBtn = statusIcon.com.transform

		tfBtn:SetParent(playerStatus.statusIcons.transform)

		if statusId and statusId == playerStatus.statusInReview then
			this.ShowStatusInfo(false, statusId)
		end

		if statusId > 90000 then
			local statusSpCount = #playerStatus.statusSp

			if statusSpCount > 0 then
				local statusSp = playerStatus.statusSp

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

function MainmenuCtrl.ResetAllStatus()
	local statusIcons = playerStatus.statusIcon
	local count = table.nums(statusIcons)

	for statusId, statusIcon in pairs(statusIcons) do
		if statusIcon then
			local tfBtn = statusIcon.com.transform

			tfBtn:SetParent(playerStatus.statusIcons.transform)

			if statusId and statusId == playerStatus.statusInReview then
				this.ShowStatusInfo(false, statusId)
			end

			if statusId > 90000 then
				local statusSpCount = #playerStatus.statusSp

				if statusSpCount > 0 then
					local statusSp = playerStatus.statusSp

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
end

function MainmenuCtrl.ShowStatusInfo(show, statusId)
	if playerStatus.statusInfoBar then
		if show then
			local statusData = MS_StatusData.GetStatusData(statusId)

			if statusData then
				playerStatus.statusInReview = statusId

				playerStatus.statusInfoTitle:SetContent(statusData.StatusName)

				if DebugShow and statusData.Description == GameText.UI_COMMON_EMPTY then
					statusData.Description = statusData.StatusId .. "_" .. statusData.StatusType .. "_" .. statusData.StackAddPer
				end

				playerStatus.statusInfoContent:SetContent(statusData.Description)
			else
				show = false
			end
		else
			playerStatus.statusInReview = 0
		end

		if playerStatus.showStatusInfoBar ~= show then
			playerStatus.showStatusInfoBar = show

			playerStatus.statusInfoBar:SetActive(show)
		end
	end
end

function MainmenuCtrl.ShowSpecialStatus(show)
	if playerStatus and playerStatus.iconSpecialStatus and playerStatus.showSpecialStatus ~= show then
		playerStatus.showSpecialStatus = show

		playerStatus.iconSpecialStatus:SetActive(show)
	end

	if show then
		FS_UserData.story:SetHadNoobItem()
	end
end

function MainmenuCtrl.UpdateHpBarByMode()
	if playerStatus == nil then
		return
	end

	if playerStatus and playerStatus.gameModeCount == nil then
		return
	end

	local gameMode = FS_UserData.story:GetDifficulty()

	playerStatus.gameMode = gameMode

	for idx = 1, playerStatus.gameModeCount do
		local value = idx == gameMode

		playerStatus.barHpFrm[idx].gameObject:SetActive(value)
		playerStatus.barHpBar[idx].gameObject:SetActive(value)

		if value == true then
			break
		end
	end
end

function MainmenuCtrl.SetShield(shldValue, baseValue)
	local plu = lateUpdateTbl.player

	plu.setShield = true
	plu.shieldVal = shldValue
	plu.shieldBase = baseValue
end

function MainmenuCtrl.LateSetShield(shldValue, baseValue)
	if playerStatus == nil then
		return
	end

	local doRefresh = false

	if shldValue then
		shldValue = Mathf.Floor(shldValue)

		if shldValue ~= playerStatus.hpShld then
			doRefresh = true
			playerStatus.hpShld = shldValue
		end
	else
		shldValue = playerStatus.hpShld
	end

	if baseValue then
		baseValue = Mathf.Floor(baseValue)

		if baseValue ~= playerStatus.hpShldBase then
			doRefresh = true
			playerStatus.hpShldBase = baseValue
		end
	else
		baseValue = playerStatus.hpShldBase
	end

	if doRefresh then
		local percent = Mathf.Clamp(shldValue / baseValue, 0, 1)
		local tween = playerStatus.hpShieldTween

		tween:MoveTo({
			fillAmount = percent
		}, 0.2)
		tween:Start()
	end
end

function MainmenuCtrl.SetHpLimiter(percent)
	if playerStatus == nil then
		return
	end

	local limiter = playerStatus.hpLimiter
	local slider = playerStatus.hpLimiterSlider

	if limiter and slider then
		if percent >= 0 and percent < 1 then
			if not playerStatus.showHpLimiter then
				playerStatus.showHpLimiter = true

				limiter:SetActive(true)
			end

			slider.value = 1 - percent
		elseif playerStatus.showHpLimiter then
			playerStatus.showHpLimiter = false

			limiter:SetActive(false)

			slider.value = 1
		end
	end
end

function MainmenuCtrl.SetHpMax(maxValue)
	local hpBar = playerStatus.hpBar

	if maxValue ~= hpBar.maxValue then
		hpBar.maxValue = maxValue
		maxValue = maxValue > hpBar.maxRef and hpBar.maxRef or maxValue

		local scale = maxValue / hpBar.valRef

		hpBar.numScale = scale

		hpBar.barScale:SetUvRect(0, 0, scale, 1)
	end
end

function MainmenuCtrl.SetHp(hpVal, hpMax, hpBase, animated)
	local plu = lateUpdateTbl.player

	plu.setHealth = true
	plu.hpVal = hpVal
	plu.hpMax = hpMax
	plu.hpBase = hpBase
	plu.hpAnim = animated
end

function MainmenuCtrl.LateSetHp(hpVal, hpMax, hpBase, animated)
	if playerStatus == nil then
		return
	end

	if not playerStatus.allowHpTween then
		return
	end

	hpVal = Mathf.Ceil(hpVal)
	hpMax = Mathf.Ceil(hpMax)
	hpBase = Mathf.Ceil(hpBase)

	if hpBase == nil then
		hpBase = hpMax
	end

	local revalidate = false

	if hpVal ~= playerStatus.hpVal then
		playerStatus.hpVal = hpVal
		revalidate = true
	end

	if hpMax ~= playerStatus.hpMax then
		playerStatus.hpMax = hpMax
		revalidate = true
	end

	if hpBase ~= playerStatus.hpBase then
		playerStatus.hpBase = hpBase

		this.SetShield(nil, hpBase)

		revalidate = true
	end

	if revalidate then
		local percent = Mathf.Clamp(hpVal / hpBase, 0, 1)
		local available = Mathf.Clamp(hpMax / hpBase, 0, 1)

		for idx = 1, playerStatus.gameModeCount do
			playerStatus.barHpBar[idx]:SetFillAmount(percent)
		end

		this.SetHpLimiter(available)

		if playerStatus.efxHpSlider then
			playerStatus.efxHpSlider.value = percent
		end

		if percent > 0 and percent < 1 then
			playerStatus.efxHpCg.alpha = 1
		elseif percent == 1 then
			playerStatus.efxHpCg.alpha = 0

			this.ShowHPWarning(false)
		else
			playerStatus.efxHpCg.alpha = 0
		end

		if animated then
			local hpStepTween = playerStatus.hpStepTween

			hpStepTween:MoveTo({
				fillAmount = percent
			}, 1)
			hpStepTween:Start()
		else
			playerStatus.barHpStep:SetFillAmount(percent)
		end

		playerStatus.txtHp:SetContent(hpVal)
		playerStatus.txtHpMax:SetContent(hpMax)
	end
end

function MainmenuCtrl.SetEnergy(percent)
	local plu = lateUpdateTbl.player

	plu.setEnergy = true
	plu.energyVal = percent
end

function MainmenuCtrl.SetEnergyMax(percent)
	local plu = lateUpdateTbl.player

	plu.setEnergyM = true
	plu.energyMax = percent
end

function MainmenuCtrl.LateSetEnergy(percent)
	local energyEffect = playerStatus.energyEffect

	if percent > 0 and percent < 1 then
		energyEffect:SetActive(true)

		energyEffect:GetComponent("Slider").value = percent

		MainmenuCtrl.ShowUseEnergyWarning(false)
	else
		energyEffect:SetActive(false)
	end

	if percent <= 0 then
		MainmenuCtrl.ShowUseEnergyWarning(true)
	end

	playerStatus.barEnergy:SetFillAmount(percent)
	playerStatus.energyGreyImg:SetFillAmount(1 + percent)
end

function MainmenuCtrl.LateSetEnergyMax(percent)
	local limiter = playerStatus.energyLimiter
	local slider = playerStatus.energyLimiterSlider

	if limiter and slider then
		if percent >= 0 and percent < 1 then
			if not playerStatus.showEnergyLimiter then
				playerStatus.showEnergyLimiter = true

				limiter:SetActive(true)
			end

			slider.value = 1 - percent
		elseif playerStatus.showEnergyLimiter then
			playerStatus.showEnergyLimiter = false

			limiter:SetActive(false)

			slider.value = 1
		end
	end
end

function MainmenuCtrl.SetSanityDelta(value)
	return
end

function MainmenuCtrl.SyncSanityEffectsGeneral()
	local scene = sceneController:GetScene()

	if playerStatus and scene then
		if LS_Setting.graphics.vignette > 0 then
			scene:SetSanityEffects(playerStatus.sanityState)
		else
			scene:SetSanityEffects(AnimalBase_Define.SanType.Normal)
		end
	end
end

function MainmenuCtrl.SyncSanityEffectsCustom()
	local scene = sceneController:GetScene()

	if playerStatus and scene then
		scene:SetSanityCustom(playerStatus.sanityState)
	end
end

function MainmenuCtrl.SetSanityValue(sanCur, sanMax, percent, sanityType, forceRefresh)
	local plu = lateUpdateTbl.player

	plu.setSanity = true
	plu.sanityCur = sanCur
	plu.sanityMax = sanMax
	plu.sanityPer = percent
	plu.sanityTyp = sanityType
	plu.sanityFR = forceRefresh
end

function MainmenuCtrl.LateSetSanityValue(sanCur, sanMax, percent, sanityType, forceRefresh)
	if playerStatus and playerStatus.sanityBar then
		local sanityBar = playerStatus.sanityBar

		playerStatus.sanityValue = percent
		playerStatus.sanityState = sanityType

		local threshold = AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Crazy]
		local percentSaved = percent
		local currentValue = sanCur
		local enableInnerBar = false

		if sanityType == AnimalBase_Define.SanType.Crazy then
			enableInnerBar = true
		end

		if enableInnerBar then
			percent = percent / threshold

			if sanityBar.showCrazyWarning then
				sanityBar.showCrazyWarning = false

				sanityBar.guageWarning:SetActive(false)
			end
		else
			percent = (percent - threshold) / (1 - threshold)
		end

		if sanityBar.valueInt ~= currentValue or forceRefresh then
			sanityBar.valueInt = currentValue

			if enableInnerBar then
				sanityBar.gauge:SetFillAmount(0)

				if not sanityBar.showSt[6] then
					sanityBar.showSt[6] = true

					sanityBar.states[6]:SetActive(true)
				end

				sanityBar.gaugeInner:SetFillAmount(percent)
			else
				sanityBar.gauge:SetFillAmount(percent)

				if sanityBar.showSt[6] then
					sanityBar.showSt[6] = false

					sanityBar.states[6]:SetActive(false)
				end

				sanityBar.gaugeInner:SetFillAmount(0)
			end

			if not enableInnerBar then
				if sanityType == AnimalBase_Define.SanType.Unusual then
					if percent > 0 and percent < 0.1 then
						if not sanityBar.showCrazyWarning then
							sanityBar.showCrazyWarning = true

							sanityBar.guageWarning:SetActive(true)
						end

						if not playerStatus.showSanityWarning then
							playerStatus.showSanityWarning = true

							playerStatus.sanityWarning:SetActive(true)
						end
					elseif sanityBar.showCrazyWarning then
						sanityBar.showCrazyWarning = false

						sanityBar.guageWarning:SetActive(false)
					end
				elseif sanityBar.showCrazyWarning then
					sanityBar.showCrazyWarning = false

					sanityBar.guageWarning:SetActive(false)
				end
			end

			if sanityType then
				for i = 1, 3 do
					if i == sanityType + 1 then
						if not sanityBar.showSt[i] then
							sanityBar.showSt[i] = true

							sanityBar.states[i]:SetActive(true)

							local scene = sceneController:GetScene()

							if scene ~= nil then
								if LS_Setting.graphics.vignette > 0 then
									scene:SetSanityEffects(sanityType)
								else
									scene:SetSanityEffects(AnimalBase_Define.SanType.Normal)
								end

								if sanityType == AnimalBase_Define.SanType.Normal then
									MainmenuCtrl.SetSanCameraVfx(false)
									this.SetStatusDisabled(playerStatus.animalId, 90001)

									if playerStatus.showSanityWarning then
										playerStatus.showSanityWarning = false

										playerStatus.sanityWarning:SetActive(false)
									end
								elseif sanityType == AnimalBase_Define.SanType.Unusual then
									MainmenuCtrl.SetSanCameraVfx(true)
									this.SetStatusEnabled(playerStatus.animalId, 90001, 1, true)
									uiPanelMessage.sanityAbnormal.tween:Start()

									if playerStatus.showSanityWarning then
										playerStatus.showSanityWarning = false

										playerStatus.sanityWarning:SetActive(false)
									end
								elseif sanityType == AnimalBase_Define.SanType.Crazy then
									MainmenuCtrl.SetSanCameraVfx(true)
									this.SetStatusEnabled(playerStatus.animalId, 90001, 1, true)
									uiPanelMessage.sanityBreakdown.tween:Start()

									if not playerStatus.showSanityWarning then
										playerStatus.showSanityWarning = true

										playerStatus.sanityWarning:SetActive(true)
									end
								end
							end
						end
					elseif sanityBar.showSt[i] then
						sanityBar.showSt[i] = false

						sanityBar.states[i]:SetActive(false)
					end
				end

				if sanityType == AnimalBase_Define.SanType.Special then
					MainmenuCtrl.SetSanCameraVfx(true)
					this.SetStatusEnabled(playerStatus.animalId, 90001, 1, true)
					uiPanelMessage.sanityBreakdown.tween:Start()

					if not playerStatus.showSanityWarning then
						playerStatus.showSanityWarning = true

						playerStatus.sanityWarning:SetActive(true)
					end

					for i = 1, 2 do
						sanityBar.showSt[i] = false

						sanityBar.states[i]:SetActive(false)
					end

					for i = 3, 6 do
						sanityBar.showSt[i] = true

						sanityBar.states[i]:SetActive(true)
					end

					sanityBar.gaugeInner:SetFillAmount(1)

					if sanityBar.gauge then
						local color = MainmenuCtrl.SanityColor[AnimalBase_Define.SanType.Crazy + MainmenuCtrl.SanityThreshold.Normal]

						sanityBar.gauge:SetColor(color[1], color[2], color[3], color[4])
					end

					return
				end
			end

			if sanityBar.gauge then
				local color = MainmenuCtrl.SanityColor[sanityType + MainmenuCtrl.SanityThreshold.Normal]

				sanityBar.gauge:SetColor(color[1], color[2], color[3], color[4])
			end

			local stateId = MainmenuCtrl.SanityThreshold.Crazy
			local showZero = percentSaved < threshold

			if sanityBar.showSt[stateId] ~= showZero then
				sanityBar.showSt[stateId] = showZero

				sanityBar.states[stateId]:SetActive(showZero)
				sanityBar.states[5]:SetActive(showZero)
			end

			stateId = MainmenuCtrl.SanityThreshold.Zero
			showZero = percentSaved <= 0

			if sanityBar.showSt[stateId] ~= showZero then
				sanityBar.showSt[stateId] = showZero

				sanityBar.states[stateId]:SetActive(showZero)
				sanityBar.states[5]:SetActive(showZero)
			end
		end
	end
end

function MainmenuCtrl.SetRageAvailableThreshold(valInt, valDelta, enable2ndVal)
	if playerStatus and playerStatus.rageBar then
		local rageBar = playerStatus.rageBar

		if valDelta ~= nil then
			rageBar.thresholdInt = valInt - valDelta
		else
			rageBar.thresholdInt = valInt
		end

		rageBar.threshold = rageBar.thresholdInt / 100

		if enable2ndVal ~= nil then
			rageBar.threshold2Int = rageBar.thresholdInt * 2
			rageBar.threshold2 = rageBar.threshold2Int / 100
		end
	end
end

function MainmenuCtrl.SetRageType(heroId, rageType, forceRefresh)
	SystemHelper.Log("[ Set rage: " .. rageType .. " for hero " .. heroId .. " ]")

	if playerStatus and playerStatus.rageBar then
		local rageBar = playerStatus.rageBar

		if forceRefresh or rageBar.rageType ~= rageType then
			rageBar.rageType = rageType
		else
			return
		end

		if rageBar then
			if rageBar.icon then
				local iconName = "rage" .. heroId .. rageType
				local sprite = XObjectPool.GetIcon(iconName)

				if sprite == nil then
					rageBar.icon.gameObject:SetActive(false)
				else
					local icon = rageBar.icon

					icon:SetSprite(sprite)
					icon.gameObject:SetActive(true)
				end
			end

			if rageBar.barImg and rageBar.barImg and playerStatus.animalId < 20000 then
				local heroIdx = playerStatus.animalId - 10000
				local colorIdx = MainmenuCtrl.Rage.Default

				if rageBar.usable then
					colorIdx = MainmenuCtrl.RageColorIndex[heroIdx][rageBar.rageType]
					colorIdx = colorIdx > 0 and colorIdx or MainmenuCtrl.Rage.Default
				end

				local color = MainmenuCtrl.RageColor[colorIdx]

				rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
			end

			if playerStatus.animalId == 10003 or playerStatus.animalId == 10004 then
				this.SetKarmaType(rageType)
			elseif playerStatus.animalId == 10005 or playerStatus.animalId == 10007 then
				this.SetKarmaType(rageType, true)
			end
		end

		if playerStatus.animalId == 10007 then
			for idx = 1, 3 do
				MainmenuCtrl.ChangeSkillIcon(idx, rageType)
			end
		end
	end
end

function MainmenuCtrl.RevalidateRage()
	local rageBar = playerStatus.rageBar

	if rageBar.isFull and rageBar.getFull then
		rageBar.animator:SetBool("RageReset", false)
		rageBar.animator:SetBool("RageFull", true)
	end
end

function MainmenuCtrl.ShowRageInsufficient()
	SystemHelper.Log("ShowRageInsufficient......")

	if playerStatus and playerStatus.rageBar then
		local rageBar = playerStatus.rageBar
		local efxWarn = rageBar.insufficient[1]
		local efxTween = rageBar.insufficientTween[1]

		if playerStatus.rageSpBar.show then
			local rageSpBar = playerStatus.rageSpBar

			if rageSpBar.scaleX > 0 then
				efxWarn = rageBar.insufficient[2]
				efxTween = rageBar.insufficientTween[2]
			elseif rageSpBar.scaleX < 0 then
				efxWarn = rageBar.insufficient[3]
				efxTween = rageBar.insufficientTween[3]
			end
		end

		if rageBar.showInsufficient and not efxTween.isPlaying then
			efxWarn:SetActive(false)

			rageBar.showInsufficient = false
		end

		if TimeHelper.getNowTimeNoScale() - rageBar.insufficientTweenTimestamp > 1.4 and not rageBar.showInsufficient then
			AudioCtrl.SetUIAudio("unable")
			efxWarn:SetActive(true)

			rageBar.showInsufficient = true
			rageBar.insufficientTweenTimestamp = TimeHelper.getNowTimeNoScale()
		end
	end
end

function MainmenuCtrl.UpdateRageInsufficient()
	if playerStatus then
		if playerStatus.rageBar then
			local rageBar = playerStatus.rageBar
			local efxWarn = rageBar.insufficient[1]
			local efxTween = rageBar.insufficientTween[1]

			if playerStatus.rageSpBar.show then
				local rageSpBar = playerStatus.rageSpBar

				if rageSpBar.scaleX > 0 then
					efxWarn = rageBar.insufficient[2]
					efxTween = rageBar.insufficientTween[2]
				elseif rageSpBar.scaleX < 0 then
					efxWarn = rageBar.insufficient[3]
					efxTween = rageBar.insufficientTween[3]
				end
			end

			if rageBar.showInsufficient and not efxTween.isPlaying then
				efxWarn:SetActive(false)

				rageBar.showInsufficient = false
			end
		end

		if playerStatus.rageSpBar then
			local rageSpBar = playerStatus.rageSpBar
			local efxWarn, efxTween

			if rageSpBar.scaleX > 0 then
				efxWarn = rageSpBar.insufficient[1]
				efxTween = rageSpBar.insufficientTween[1]
			elseif rageSpBar.scaleX < 0 then
				efxWarn = rageSpBar.insufficient[2]
				efxTween = rageSpBar.insufficientTween[2]
			end

			if rageSpBar.showInsufficient and not efxTween.isPlaying then
				efxWarn:SetActive(false)

				rageSpBar.showInsufficient = false
			end
		end
	end
end

function MainmenuCtrl.SetRage(percent, forceRefresh)
	local plu = lateUpdateTbl.player

	plu.setRage = true
	plu.rageVal = percent
	plu.rageFR = forceRefresh
end

function MainmenuCtrl.LateSetRage(percent, forceRefresh)
	if playerStatus and playerStatus.rageBar then
		local rageBar = playerStatus.rageBar

		if percent < 0 then
			percent = rageBar.value == 100 and 1 or 0.01 * rageBar.value
		end

		local valInt = Mathf.Round(100 * percent)

		if forceRefresh == nil then
			forceRefresh = false
		end

		local heroIdx = playerStatus.animalId % 10000

		if heroIdx ~= 7 then
			if percent >= rageBar.threshold then
				if not rageBar.usable and not rageBar.isInAnimThresholdReached then
					rageBar.usable = true
					rageBar.isInAnimThresholdReached = true

					rageBar.animator:SetBool("RageUsable", true)
					rageBar.thresholdEfx:SetActive(true)
					rageBar.barThresholdReached:SetFillAmount(percent)
					rageBar.tweenAnimThreshold:Start()

					if rageBar.barImg and playerStatus.animalId < 20000 then
						local colorIdx = MainmenuCtrl.RageColorIndex[heroIdx][rageBar.rageType]
						local color = MainmenuCtrl.RageColor[colorIdx]

						rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
					end
				end
			elseif rageBar.usable and not rageBar.isInFlush then
				rageBar.usable = false

				rageBar.thresholdEfx:SetActive(false)

				if rageBar.barImg then
					local color = MainmenuCtrl.RageColor[MainmenuCtrl.Rage.Default]

					rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
				end
			end
		elseif percent >= rageBar.threshold2 then
			if not rageBar.usable2 then
				rageBar.usable2 = true
				rageBar.isInAnimThresholdReached = true

				rageBar.animator:SetBool("RageReset", true)
				rageBar.animator:SetBool("RageReset", false)
				rageBar.animator:SetBool("RageUsableWhite", false)
				rageBar.animator:SetBool("RageUsable", true)
				rageBar.thresholdEfx:SetActive(true)
				rageBar.barThresholdReached:SetFillAmount(percent)
				rageBar.tweenAnimThreshold:Start()

				if rageBar.barImg and playerStatus.animalId < 20000 then
					rageBar.rageType = MainmenuCtrl.Rage.Type2

					local colorIdx = MainmenuCtrl.RageColorIndex[heroIdx][rageBar.rageType]
					local color = MainmenuCtrl.RageColor[colorIdx]

					rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
				end
			end
		elseif percent >= rageBar.threshold then
			if rageBar.usable2 then
				rageBar.usable2 = false
				rageBar.usable = false
			end

			if not rageBar.usable then
				rageBar.usable2 = false
				rageBar.usable = true
				rageBar.isInAnimThresholdReached = true

				rageBar.animator:SetBool("RageReset", true)
				rageBar.animator:SetBool("RageReset", false)
				rageBar.animator:SetBool("RageUsable", false)
				rageBar.animator:SetBool("RageUsableWhite", true)
				rageBar.thresholdEfx:SetActive(true)
				rageBar.barThresholdReached:SetFillAmount(percent)
				rageBar.tweenAnimThreshold:Start()

				if rageBar.barImg and playerStatus.animalId < 20000 then
					rageBar.rageType = MainmenuCtrl.Rage.Type1

					local colorIdx = MainmenuCtrl.RageColorIndex[heroIdx][rageBar.rageType]
					local color = MainmenuCtrl.RageColor[colorIdx]

					rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
				end
			end
		elseif rageBar.usable and not rageBar.isInFlush and percent < rageBar.threshold then
			rageBar.usable2 = false
			rageBar.usable = false

			rageBar.thresholdEfx:SetActive(false)

			if rageBar.barImg then
				local color = MainmenuCtrl.RageColor[MainmenuCtrl.Rage.Default]

				rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
			end
		end

		if forceRefresh and percent >= 1 then
			rageBar.isFull = false

			rageBar.animator:SetBool("RageReset", true)
		end

		if rageBar.value ~= valInt or forceRefresh then
			rageBar.deltaValue = valInt - rageBar.value
			rageBar.value = valInt

			rageBar.barImg:SetFillAmount(percent)

			if percent >= 1 and not rageBar.isFull then
				rageBar.isFull = true

				if not rageBar.getFull then
					rageBar.getFull = true

					AudioCtrl.SetUIAudio("rage_max")
				end

				rageBar.animator:SetBool("RageReset", false)
				rageBar.animator:SetBool("RageFull", true)
			elseif percent < 1 then
				rageBar.isFull = false
				rageBar.getFull = false

				if playerStatus.animalId == 10003 or playerStatus.animalId == 10004 or playerStatus.animalId == 10007 then
					if rageBar.isInFlush and percent < 0.01 then
						rageBar.animator:SetBool("RageSpecial", false)

						if not rageBar.isReset then
							rageBar.isReset = true

							rageBar.animator:SetBool("RageReset", true)
						end

						local tween = Tween:new(rageBar.go)

						tween:SetAutoKill(true)
						tween:MoveTo({}, 0.3)
						tween:OnComplete(function()
							rageBar.isInFlush = false
							rageBar.isReset = false

							rageBar.animator:SetBool("RageReset", false)

							if rageBar.barImg then
								local color = MainmenuCtrl.RageColor[MainmenuCtrl.Rage.Default]

								rageBar.barImg:SetColor(color[1], color[2], color[3], color[4])
							end
						end)
						tween:Start()
					elseif not rageBar.isInFlush and percent > 0.99 then
						rageBar.isInFlush = true

						rageBar.animator:SetBool("RageFull", false)
						rageBar.animator:SetBool("RageSpecial", true)
					elseif rageBar.deltaValue < 0 and Mathf.Abs(rageBar.deltaValue) >= 15 then
						rageBar.animator:SetBool("RageFull", false)

						if not rageBar.isReset then
							rageBar.isReset = true

							rageBar.animator:SetBool("RageReset", true)
						end

						local tween = Tween:new(rageBar.go)

						tween:SetAutoKill(true)
						tween:MoveTo({}, 0.3)
						tween:OnComplete(function()
							rageBar.isReset = false

							rageBar.animator:SetBool("RageReset", false)
						end)
						tween:Start()
					end
				else
					rageBar.animator:SetBool("RageFull", false)

					if not rageBar.isReset then
						rageBar.isReset = true

						rageBar.animator:SetBool("RageReset", true)
					end

					local tween = Tween:new(rageBar.go)

					tween:SetAutoKill(true)
					tween:MoveTo({}, 0.3)
					tween:OnComplete(function()
						rageBar.isReset = false

						rageBar.animator:SetBool("RageReset", false)
					end)
					tween:Start()
				end
			end
		end
	end
end

function MainmenuCtrl.SetKarmaAvailableThreshold(valInt, valDelta)
	if playerStatus and playerStatus.rageSpBar then
		local rageSpBar = playerStatus.rageSpBar

		if valDelta ~= nil then
			rageSpBar.thresholdInt = valInt - valDelta
		else
			rageSpBar.thresholdInt = valInt
		end

		rageSpBar.threshold = rageSpBar.thresholdInt / 100
	end
end

function MainmenuCtrl.ShowKarmaBar(show, isLeftSide)
	if playerStatus and playerStatus.rageSpBar then
		local rageSpBar = playerStatus.rageSpBar

		rageSpBar.usable = false

		if rageSpBar.show ~= show then
			if isLeftSide ~= nil and isLeftSide == true then
				rageSpBar.scaleX = -1
			else
				rageSpBar.scaleX = 1
			end

			rageSpBar.tfPnl.localScale = Vector3.New(rageSpBar.scaleX, 1, 1)
			playerStatus.rageSpBar.show = show

			rageSpBar.pnl:SetActive(show)
		end
	end
end

function MainmenuCtrl.SetKarmaType(karmaType, isLeftSide)
	local show = karmaType > 0

	if show and playerStatus and playerStatus.rageSpBar then
		local rageSpBar = playerStatus.rageSpBar

		if rageSpBar.karmaType ~= karmaType and playerStatus.animalId < 20000 then
			rageSpBar.karmaType = karmaType

			local heroIdx = playerStatus.animalId - 10000
			local colorIdx = MainmenuCtrl.KarmaColorIndex[heroIdx][rageSpBar.karmaType]

			if playerStatus.animalId == 10005 and rageSpBar.usable == false then
				colorIdx = MainmenuCtrl.Rage.Default
			end

			if colorIdx ~= nil and colorIdx > 0 then
				local color = MainmenuCtrl.RageColor[colorIdx]

				rageSpBar.bar:SetColor(color[1], color[2], color[3], color[4])
			end
		end
	end

	this.ShowKarmaBar(show, isLeftSide)
end

function MainmenuCtrl.ShowKarmaInsufficient()
	SystemHelper.Log("ShowKarmaInsufficient......")

	if playerStatus and playerStatus.rageSpBar then
		local rageSpBar = playerStatus.rageSpBar
		local efxWarn, efxTween

		if rageSpBar.scaleX > 0 then
			efxWarn = rageSpBar.insufficient[1]
			efxTween = rageSpBar.insufficientTween[1]
		elseif rageSpBar.scaleX < 0 then
			efxWarn = rageSpBar.insufficient[2]
			efxTween = rageSpBar.insufficientTween[2]
		end

		if rageSpBar.showInsufficient and not efxTween.isPlaying then
			efxWarn:SetActive(false)

			rageSpBar.showInsufficient = false
		end

		if TimeHelper.getNowTimeNoScale() - rageSpBar.insufficientTweenTimestamp > 1.4 and not rageSpBar.showInsufficient then
			AudioCtrl.SetUIAudio("unable")
			efxWarn:SetActive(true)

			rageSpBar.showInsufficient = true
			rageSpBar.insufficientTweenTimestamp = TimeHelper.getNowTimeNoScale()
		end
	end
end

function MainmenuCtrl.SetKarma(percent, forceRefresh)
	local plu = lateUpdateTbl.player

	plu.setKarma = true
	plu.karmaVal = percent
	plu.karmaFR = forceRefresh
end

function MainmenuCtrl.LateSetKarma(percent, forceRefresh)
	if playerStatus and playerStatus.rageSpBar then
		local rageSpBar = playerStatus.rageSpBar

		if percent < 0 then
			percent = rageSpBar.value == 100 and 1 or 0.01 * rageSpBar.value
		end

		local valInt = Mathf.Round(100 * percent)

		if forceRefresh == nil then
			forceRefresh = false
		end

		if percent >= rageSpBar.threshold then
			if not rageSpBar.usable and not rageSpBar.isInAnimThresholdReached then
				rageSpBar.usable = true
				rageSpBar.isInAnimThresholdReached = true

				rageSpBar.animator:SetBool("RageUsable", true)
				rageSpBar.tweenAnimThreshold:Start()

				if rageSpBar.bar and playerStatus.animalId < 20000 then
					local heroIdx = playerStatus.animalId - 10000
					local colorIdx = MainmenuCtrl.KarmaColorIndex[heroIdx][rageSpBar.karmaType]

					if colorIdx ~= nil and colorIdx > 0 then
						local color = MainmenuCtrl.RageColor[colorIdx]

						rageSpBar.bar:SetColor(color[1], color[2], color[3], color[4])
					end
				end
			end
		elseif rageSpBar.usable and not rageSpBar.isInFlush then
			rageSpBar.usable = false

			if rageSpBar.bar then
				local color = MainmenuCtrl.RageColor[MainmenuCtrl.Rage.Default]

				rageSpBar.bar:SetColor(color[1], color[2], color[3], color[4])
			end
		end

		if forceRefresh and percent >= 1 then
			rageSpBar.isFull = false

			rageSpBar.animator:SetBool("RageReset", true)
		end

		if percent >= 0.99 then
			percent = 1
		elseif percent <= 0.01 then
			percent = 0
		end

		local valInt = Mathf.Round(100 * percent)

		if rageSpBar.value ~= valInt then
			playerStatus.rageSpBar.value = valInt

			local tween = rageSpBar.tween

			tween:MoveTo({
				fillAmount = percent
			}, rageSpBar.tweenInterval)
			tween:Start()
		end
	end
end

function MainmenuCtrl.ShowRageJBar(show)
	if playerStatus and playerStatus.rageJBar then
		local rageJBar = playerStatus.rageJBar

		if rageJBar.show ~= show then
			rageJBar.show = show

			rageJBar.pnl:SetActive(show)

			if show == false then
				MainmenuCtrl.SetRageJBar(0)
			end
		end
	end
end

function MainmenuCtrl.SetRageJBar(val)
	if playerStatus and playerStatus.rageJBar then
		local rageJBar = playerStatus.rageJBar

		if rageJBar.value ~= val then
			rageJBar.value = val

			if val > 0 then
				for idx = 1, 6 do
					local seg = rageJBar.segments[idx]
					local show = idx <= val

					if seg.show ~= show then
						seg.show = show

						seg.go:SetActive(show)
					end
				end

				MainmenuCtrl.ChangeMainSkills(10005, 2)
			else
				rageJBar.Reset()
				MainmenuCtrl.ChangeMainSkills(10005, 1)
			end
		end
	end
end

function MainmenuCtrl.ShowHPWarning(show)
	if playerStatus and show ~= playerStatus.showEfxHpWarn then
		playerStatus.showEfxHpWarn = show

		playerStatus.efxHpWarn:SetActive(show)

		if show then
			playerStatus.xtwnEfxHpWarn:Play()
		else
			playerStatus.xtwnEfxHpWarn:Stop()
		end
	end
end

function MainmenuCtrl.ShowEnergyWarning(flag, instant)
	if playerStatus then
		local lowEnergy = playerStatus.lowEnergy
		local lowEnergyCg = playerStatus.lowEnergyCg

		if flag then
			lowEnergy:SetActive(true)

			if instant then
				lowEnergyCg.alpha = 1
			else
				lowEnergyCg.alpha = 0

				local tw = playerStatus.twLowEnergy

				tw:MoveTo({
					alpha = 1
				}, 0.4)
				tw:Start()
			end
		elseif instant then
			lowEnergyCg.alpha = 0

			lowEnergy:SetActive(false)
		else
			lowEnergyCg.alpha = 1

			local tw = playerStatus.twLowEnergy

			tw:MoveTo({
				alpha = 0
			}, 2)
			tw:Start()
		end
	end
end

function MainmenuCtrl.ShowUseEnergyWarning(flag)
	if playerStatus and flag ~= playerStatus.showEnergyWarn then
		playerStatus.showEnergyWarn = flag

		local energyWarn = playerStatus.energyWarn

		if energyWarn then
			energyWarn:SetActive(flag)

			if flag then
				playerStatus.energyWarnTween:Play()
			end
		end
	end
end

function MainmenuCtrl.ShowToughness(show)
	if oppositeStatus.showToughness ~= show then
		oppositeStatus.showToughness = show

		if not show then
			oppositeStatus.toughnessInt = 0

			oppositeStatus.toughnessBarS:SetFillAmount(0)
		end
	end
end

function MainmenuCtrl.SetToughness(percent)
	if percent >= 0.99 then
		percent = 1
	end

	local currentValue = Mathf.Round(100 * percent)

	if oppositeStatus.toughnessInt ~= currentValue then
		oppositeStatus.toughnessInt = currentValue

		local tween = oppositeStatus.toughnessBarSTween

		tween:MoveTo({
			fillAmount = percent
		}, oppositeStatus.toughnessInterval)
		tween:Start()
	end
end

function MainmenuCtrl.SetBossStatusEnabled(index, statusId, percent, param)
	local statusIcons = oppositeStatus.statusIcon
	local statusIcon = statusIcons[statusId]

	if statusIcon then
		if not statusIcon.show then
			statusIcon.show = true

			local tfBtn = statusIcon.com.transform

			tfBtn:SetParent(oppositeStatus.status.transform)

			if statusId > 90000 then
				table.insert(oppositeStatus.statusSp, statusId)
			end

			if statusIcon.com then
				statusIcon.com.gameObject:SetActive(true)
			end

			if statusIcon.icon then
				statusIcon.icon:SetActive(true)
			end
		end

		local statusSpCount = #oppositeStatus.statusSp

		if statusSpCount > 0 then
			local statusSp = oppositeStatus.statusSp

			for i = 1, statusSpCount do
				local spIcon = statusIcons[statusSp[i]]
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

				statusIcon.progress:SetFillAmount(transValue)
			end
		end
	end
end

function MainmenuCtrl.SetBossStatusDisabled(index, statusId)
	local statusIcons = oppositeStatus.statusIcon
	local statusIcon = statusIcons[statusId]

	if statusIcon then
		local tfBtn = statusIcon.com.transform

		tfBtn:SetParent(oppositeStatus.statusIcons.transform)

		if statusId > 90000 then
			local statusSpCount = #oppositeStatus.statusSp

			if statusSpCount > 0 then
				local statusSp = oppositeStatus.statusSp

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

function MainmenuCtrl.SetBossHp(hpPercent, hpValue)
	if hpValue ~= oppositeStatus.hp then
		oppositeStatus.hp = hpValue

		oppositeStatus.hpText:SetContent(hpValue)

		oppositeStatus.hpBarR.value = hpPercent

		local tween = oppositeStatus.hpBarYTween

		tween:Delay(0.2)
		tween:MoveTo({
			fillAmount = hpPercent
		}, 0.5)
		tween:Start()
	end
end

function MainmenuCtrl.SetName(name)
	if oppositeStatus and oppositeStatus.text then
		oppositeStatus.text:SetContent(name)
	end
end

function MainmenuCtrl.CreateBossHpBar(name, hpPercent, hpValue)
	if oppositeStatus then
		oppositeStatus.show = false

		oppositeStatus.panel:SetActive(false)
		oppositeStatus.text:SetGameTextContent(name)
		oppositeStatus.hpText:SetContent(hpValue)

		oppositeStatus.hp = hpValue
		oppositeStatus.hpBarR.value = hpPercent
	end
end

function MainmenuCtrl.ShowBossHpBar(show)
	if oppositeStatus ~= nil then
		if not show then
			oppositeStatus.hpBarYTween:Stop()
			oppositeStatus.focus:SetActive(show)
		end

		if show ~= oppositeStatus.show then
			oppositeStatus.show = show

			oppositeStatus.panel:SetActive(show)
		end
	end
end

function MainmenuCtrl.SetFocusActive(isLocked)
	if oppositeStatus ~= nil and oppositeStatus.focus ~= nil then
		oppositeStatus.focus:SetActive(isLocked)
	end
end

function MainmenuCtrl.SetFocusColor(r, g, b, a)
	if oppositeStatus ~= nil and oppositeStatus.focus ~= nil then
		if oppositeStatus.bracketL then
			oppositeStatus.bracketL:SetColor(r, g, b, a)
		end

		if oppositeStatus.bracketR then
			oppositeStatus.bracketR:SetColor(r, g, b, a)
		end
	end
end

function MainmenuCtrl.ShowMazeBar(show)
	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil and panelMazeBar.show ~= show then
			panelMazeBar.show = show

			panelMazeBar.go:SetActive(panelMazeBar.show)
		end
	end
end

function MainmenuCtrl.SetMazeProgress(value)
	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil and panelMazeBar.value ~= value then
			panelMazeBar.value = value

			panelMazeBar.bar:SetFillAmount(value)

			panelMazeBar.slider.value = value

			if panelMazeBar.value < 1 then
				if panelMazeBar.showScaler == false then
					panelMazeBar.showScaler = true

					panelMazeBar.scaler:SetActive(true)
					panelMazeBar.efxFull:SetActive(false)
				end
			elseif panelMazeBar.value >= 1 and panelMazeBar.showScaler == true then
				panelMazeBar.showScaler = false

				panelMazeBar.scaler:SetActive(false)
				panelMazeBar.efxFull:SetActive(true)
			end
		end
	end
end

function MainmenuCtrl.ResetMazeProgress()
	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil then
			panelMazeBar.value = 0

			panelMazeBar.bar:SetFillAmount(0)

			panelMazeBar.slider.value = 0
			panelMazeBar.showScaler = true

			panelMazeBar.scaler:SetActive(true)
			panelMazeBar.efxFull:SetActive(false)
		end
	end
end

function MainmenuCtrl.ShowMazeBossBar(show)
	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil and panelMazeBar.showBossBar ~= show then
			panelMazeBar.showBossBar = show

			panelMazeBar.goBossBar:SetActive(show)
		end
	end
end

function MainmenuCtrl.InitMazeBossBar(maxCount)
	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil then
			local loader = panelMazeBar.loaderBossBar

			if loader ~= nil then
				loader.loadCount = maxCount
				loader.loadStepping = 0
				loader.loadFinished = false

				loader:PreloadTemplate(function()
					panelMazeBar.loaderBossBar:Load()
				end)

				panelMazeBar.bossIconCount = maxCount
			end
		end
	end
end

function MainmenuCtrl.SetMazeBossStep(count)
	SystemHelper.Log(string.format("[ MainmenuCtrl.SetMazeBossStep( %d ) ]", count))

	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil and panelMazeBar.loaderBossBar.loadFinished then
			local maxCount = panelMazeBar.bossIconCount
			local icons = panelMazeBar.bossIcon

			if count <= 0 then
				count = 0
			elseif maxCount < count then
				count = maxCount
			end

			for idx = 1, maxCount do
				local icon = icons[idx]

				if icon ~= nil then
					local bShow = idx <= count

					if icon.showOn ~= bShow then
						icon.showOn = bShow

						icon.imgOn:SetActive(bShow)
					end
				end
			end
		end
	end
end

function MainmenuCtrl.SetMazeBossUpdated(count)
	SystemHelper.Log(string.format("[ MainmenuCtrl.SetMazeBossUpdated( %d ) ]", count))

	if panelPlayer ~= nil then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil and panelMazeBar.loaderBossBar.loadFinished then
			local maxCount = panelMazeBar.bossIconCount
			local icons = panelMazeBar.bossIcon

			if count <= 0 then
				count = 0
			elseif maxCount < count then
				count = maxCount
			end

			local threshold = count - 1

			for idx = 1, maxCount do
				local icon = icons[idx]

				if icon ~= nil then
					local bShow = idx <= count

					if icon.showOn ~= bShow then
						icon.showOn = bShow

						if idx == count then
							local tween = Tween:new(icon.imgOn)

							tween:SetAutoKill(true)
							tween:Delay(2)
							tween:MoveTo({}, 0)
							tween:OnComplete(function()
								icon.imgOn:SetActive(bShow)
							end)
							tween:Start()
						else
							icon.imgOn:SetActive(bShow)
						end
					end
				end
			end
		end
	end
end

function MainmenuCtrl.ShowBlockingCaution(alpha)
	if alpha > 0 then
		if alpha > 1 then
			alpha = 1
		end

		if not playerStatus.showPathBlock then
			playerStatus.showPathBlock = true

			playerStatus.pathBlock:SetActive(true)
		end

		playerStatus.pathBlockCg.alpha = alpha
	else
		if alpha < 0 then
			alpha = 0
		end

		if playerStatus.showPathBlock then
			playerStatus.showPathBlock = false

			playerStatus.pathBlock:SetActive(false)
		end

		playerStatus.pathBlockCg.alpha = alpha
	end
end

function MainmenuCtrl.SetPanelDeathExtraInfo(count)
	panelDeath.extra:SetActive(true)
	panelDeath.extraNum1:SetContent(count)
	UnityEngine.Canvas.ForceUpdateCanvases()
end

function MainmenuCtrl.ShowPanelDeath(flag)
	playerStatus.lowEnergy:SetActive(false)
	playerStatus.imageHit:SetActive(false)

	if playerStatus.sanityBar.showCrazyWarning then
		playerStatus.sanityBar.showCrazyWarning = false

		playerStatus.sanityBar.guageWarning:SetActive(false)
	end

	if playerStatus.showSanityWarning then
		playerStatus.showSanityWarning = false

		playerStatus.sanityWarning:SetActive(false)
	end

	if UIManager.IsMovieMode() then
		panelDeath.delayed = true
		panelDeath.showNext = flag
	else
		if flag and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			MainmenuCtrl.ShowChallengeResult(false)

			return
		end

		panelDeath.com:SetActive(flag)

		panelDeath.show = flag

		if flag then
			this.FadeOut(0, true)
			UILayerCtrl.Push("PanelDeath", "Panel_Death_Button_Retry")
			inputMgr:SetPointerLocked(false)
			inputMgr:SetInMenuMode()
		else
			UILayerCtrl.Pop()
			this.FadeIn(0.3, true)
			inputMgr:SetPointerLocked(true)
			inputMgr:SetInGameMode()
		end
	end
end

function MainmenuCtrl.UpdatePanelDeath()
	if panelDeath.delayed then
		if UIManager.IsMovieMode() then
			panelDeath.delayed = true
		else
			local flag = panelDeath.showNext

			panelDeath.showNext = false
			panelDeath.delayed = false

			panelDeath.com:SetActive(flag)

			panelDeath.show = flag

			if flag then
				UILayerCtrl.Push("PanelDeath", "Panel_Death_Button_Retry")
				inputMgr:SetPointerLocked(false)
				inputMgr:SetInMenuMode()
			else
				UILayerCtrl.Pop()
				inputMgr:SetPointerLocked(true)
				inputMgr:SetInGameMode()
			end
		end
	end

	if panelDeath ~= nil and panelDeath.show == true and inputMgr:IsControllerGameMode() == true then
		inputMgr:SetPointerLocked(false)
		inputMgr:SetInMenuMode()
	end
end

function MainmenuCtrl.SetReborn(show)
	this.ShowHPWarning(false)
	this.ShowEnergyWarning(false, true)
	this.ShowUseEnergyWarning(false)
end

function MainmenuCtrl.SetDead(show)
	this.ShowPanelDeath(show)
	this.ShowHPWarning(false)
	this.ShowEnergyWarning(false, true)
	this.ShowUseEnergyWarning(false)
end

function MainmenuCtrl.ForceClosingShortcutItems()
	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "SelectItem" then
		holdingTime.LB = 0

		UILayerCtrl.OnButtonClick("Panel_SelectItems")

		local controllerTimer = sceneController:GetControllerTimer()

		if controllerTimer ~= nil then
			controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.QuickItem)
		end
	end
end

function MainmenuCtrl.ShowMessageTask(taskType, contents)
	if uiPanelMessage.task.text:GetContent() == contents and uiPanelMessage.task.text.gameObject.activeSelf then
		return
	end

	if uiPanelMessage.task.actShowTime > 0 then
		uiPanelMessage.task.actShowTime = uiPanelMessage.task.maxShowTime

		uiPanelMessage.task.panel:SetActive(false)
		uiPanelMessage.task.panel:SetActive(true)
	end

	table.insert(uiPanelMessage.task.msgs, 1, {
		text = contents,
		type = taskType
	})

	uiPanelMessage.task.showRunning = true
end

function MainmenuCtrl.UpdateShowMessageTask()
	if this.gameObject == nil or not this.gameObject.activeSelf then
		return
	end

	if CurtainCtrl.IsInBlackCurtain() then
		return
	end

	local taskMsg = uiPanelMessage.task

	if taskMsg and taskMsg.showRunning then
		local showMax = taskMsg.showMax
		local refresh = false

		if not taskMsg.animCompleted and taskMsg.showCnt > 0 then
			local duration = uiPanelMessage.task.actShowTime + Time.deltaTime

			if duration < uiPanelMessage.task.maxShowTime then
				uiPanelMessage.task.actShowTime = duration
			else
				uiPanelMessage.task.actShowTime = 0
				taskMsg.animCompleted = true

				taskMsg.anim:SetBool("main", false)
				taskMsg.anim:SetBool("sub", false)
				taskMsg.anim:SetBool("hide", true)

				if taskMsg.showCnt <= 0 then
					refresh = true
				else
					taskMsg.show = true
				end
			end
		end

		if not refresh and taskMsg.showCnt > 0 and taskMsg.show and taskMsg.animCompleted then
			taskMsg.show = false
			taskMsg.showCnt = taskMsg.showCnt - 1
			taskMsg.animCompleted = false
			refresh = true
		end

		if not refresh and showMax > taskMsg.showCnt and table.nums(taskMsg.msgs) > 0 then
			local itemData = table.remove(taskMsg.msgs)
			local text = itemData.text
			local type = itemData.type

			taskMsg.show = true

			if text then
				taskMsg.showCnt = taskMsg.showCnt + 1

				taskMsg.text:SetContent(text)

				taskMsg.animCompleted = false

				taskMsg.anim:SetBool("hide", false)

				if type == MainmenuCtrl.TaskType.Mainplot then
					taskMsg.anim:SetBool("main", true)
				else
					taskMsg.anim:SetBool("sub", true)
				end

				AudioCtrl.SetUIAudio("task_tips")
			end

			taskMsg.showRunning = true
			refresh = true
		end
	end
end

function MainmenuCtrl.ShowMessageCallForHelpInLeftPanel(name)
	local src = GameText.UI_PVE_PNL_L_MSG_CALL4HELP
	local str = string.gsub(src, "{0}", name)

	this.ShowMessageInLeftPanel(str)
end

function MainmenuCtrl.ShowMessageInLeftPanel(contents)
	uiPaneL.panel:SetActive(false)
	uiPaneL.text:SetContent(contents)
	uiPaneL.panel:SetActive(true)
end

function MainmenuCtrl.GetItem(itemName, itemCount, iconName)
	table.insert(uiPanelB.msgs, 1, {
		name = itemName,
		count = itemCount,
		icon = "item" .. iconName
	})

	uiPanelB.showRunning = true
end

function MainmenuCtrl.ShowReward(itemName, itemCount, iconName)
	table.insert(uiPanelB.msgs, 1, {
		name = itemName,
		count = itemCount,
		icon = iconName
	})

	uiPanelB.showRunning = true
end

function MainmenuCtrl.UpdateShowRewards()
	if this.gameObject == nil or not this.gameObject.activeSelf then
		return
	end

	if CurtainCtrl.IsInBlackCurtain() then
		return
	end

	if uiPanelB and uiPanelB.showRunning then
		local showMax = uiPanelB.showMax
		local refresh = false

		if uiPanelB.showCnt > 0 then
			for idx = 1, showMax do
				local slot = uiPanelB.slots[idx]

				if slot.show then
					local duration = slot.actShowTime + Time.deltaTime

					if duration < slot.maxShowTime then
						slot.actShowTime = duration
					else
						slot.show = false
						slot.actShowTime = 0

						slot.anim:ResetTrigger("Show")
						slot.anim:SetTrigger("Hide")

						uiPanelB.showCnt = uiPanelB.showCnt - 1

						local item = table.remove(uiPanelB.slots, idx)

						table.insert(uiPanelB.slots, item)

						refresh = true

						break
					end
				end
			end
		end

		if not refresh and showMax > uiPanelB.showCnt then
			for idx = 1, showMax do
				local slot = uiPanelB.slots[idx]

				if not slot.show and table.nums(uiPanelB.msgs) > 0 then
					uiPanelB.showCnt = uiPanelB.showCnt + 1

					local itemData = table.remove(uiPanelB.msgs)
					local itemName = itemData.name
					local iconName = itemData.icon
					local itemCount = itemData.count

					slot.show = true

					if itemCount >= 0 then
						AudioCtrl.SetUIAudio("pickup")
					end

					if iconName then
						local sprite = XObjectPool.GetIcon(iconName)

						if sprite == nil then
							-- block empty
						else
							slot.icon:SetSprite(sprite)
						end
					end

					if itemCount >= 0 then
						slot.text:SetContent(itemName)
					else
						slot.text:SetContent(itemName .. " -1")
					end

					slot.anim:ResetTrigger("Hide")
					slot.anim:SetTrigger("Show")

					local item = table.remove(uiPanelB.slots, idx)

					table.insert(uiPanelB.slots, 1, item)

					refresh = true

					break
				end
			end
		end

		if refresh then
			local keepRunning = table.nums(uiPanelB.msgs) > 0

			if not keepRunning then
				for idx = 1, showMax do
					local slot = uiPanelB.slots[idx]

					slot.pos = 3 - idx

					slot.panel.transform:SetSiblingIndex(slot.pos)

					keepRunning = keepRunning or slot.show
				end
			end

			uiPanelB.showRunning = keepRunning
		end
	end
end

function MainmenuCtrl.ShowDestination(contents)
	if contents then
		local dest = uiPanelMessage.destination
		local tween = Tween:new(dest.panel)

		tween:SetAutoKill(true)
		tween:Delay(2)
		tween:MoveTo({}, 0)
		tween:OnComplete(function()
			dest.text:SetContent(contents)
			dest.panel:SetActive(false)

			dest.xtween.reversed = false

			dest.panel:SetActive(true)
			dest.tween:Start()
		end)
		tween:Start()
	end
end

function MainmenuCtrl.StartProgress(duration, cb)
	if duration <= 0 then
		return
	end

	uiProgress.panel:SetActive(true)

	uiProgress.bar.value = 0

	uiProgress.tween:MoveTo({
		value = 1
	}, duration)

	if cb == nil then
		uiProgress.tween:OnComplete(MainmenuCtrl.CancelProgress)
	else
		uiProgress.tween:OnComplete(cb)
	end

	uiProgress.tween:Start()
end

function MainmenuCtrl.CancelProgress()
	uiProgress.valInt = -1
	uiProgress.bar.value = 0

	uiProgress.tween:Stop()

	uiProgress.show = false

	uiProgress.panel:SetActive(false)
end

function MainmenuCtrl.UpdateProgress(percent, type)
	local percentInt = Mathf.Round(percent * 100)

	if percentInt ~= uiProgress.valInt then
		if percentInt >= 0 then
			uiProgress.valInt = percentInt
			uiProgress.bar.value = percent

			if not uiProgress.show then
				uiProgress.show = true

				uiProgress.panel:SetActive(true)

				if type == MainmenuCtrl.ProgressBarType.GatherReward then
					uiProgress.text:SetGameTextContent(function()
						return GameText.UI_COMMON_GATHER_REWARD
					end)
				elseif type == MainmenuCtrl.ProgressBarType.OccupySpot then
					uiProgress.text:SetGameTextContent(function()
						return GameText.UI_COMMON_OCCUPY_SPOT
					end)
				else
					uiProgress.text:SetGameTextContent(function()
						return percentInt .. GameText.UI_COMMON_PERCENT
					end)
				end
			end
		else
			uiProgress.valInt = -1
			uiProgress.bar.value = 0
			uiProgress.show = false

			uiProgress.panel:SetActive(false)
		end
	end
end

function MainmenuCtrl.GetIntersection(p1, p2, p3, p4)
	local a = 0
	local b = 0
	local la = false
	local lb = false

	if p1.x ~= p2.x then
		a = (p2.y - p1.y) / (p2.x - p1.x)
		la = true
	end

	if p3.x ~= p4.x then
		b = (p4.y - p3.y) / (p4.x - p3.x)
		lb = true
	end

	if not la and not lb then
		if p1.x == p3.x then
			return Vector3.zero
		else
			return Vector3.zero
		end
	elseif la and not lb then
		local x = p3.x
		local y = (p1.x - x) * -a + p1.y

		return Vector3.New(x, y, 0)
	elseif not la and lb then
		local x = p1.x
		local y = (p3.x - x) * -b + p3.y

		return Vector3.New(x, y, 0)
	else
		if a == b then
			return Vector3.zero
		end

		local x = (a * p1.x - b * p3.x - p1.y + p3.y) / (a - b)
		local y = a * x - a * p1.x + p1.y

		return Vector3.New(x, y, 0)
	end
end

function MainmenuCtrl.GetUiPos(pos)
	local ret = false
	local uiPos
	local tfHudArea = hudIcons.tfHudArea

	if tfHudArea ~= nil then
		local sp = scCamera:WorldToScreenPoint(pos)
		local screenWidth = hudNpcMargin.scrW
		local screenHeight = hudNpcMargin.scrH

		if sp.x >= -120 and sp.x <= screenWidth + 120 and sp.y >= -120 and sp.y <= screenHeight + 120 then
			ret, uiPos = RectTransformUtility.ScreenPointToWorldPointInRectangle(tfHudArea, sp, uiCamera, uiPos)
			uiPos.z = 0

			return ret, uiPos
		end
	end

	return false, nil
end

function MainmenuCtrl.GetPosInHud(pos, dist, idx)
	local tfHudArea = hudIcons.tfHudArea
	local ret = false
	local angle = 0
	local uiPos

	if tfHudArea ~= nil then
		local sp = scCamera:WorldToScreenPoint(pos)

		ret, uiPos = RectTransformUtility.ScreenPointToLocalPointInRectangle(tfHudArea, sp, uiCamera, uiPos)
		uiPos.z = 0
	end

	return ret, angle, uiPos
end

function MainmenuCtrl.InitHudSpotIcons()
	MainmenuCtrl.AddHudSpotIcon(1, Vector3.New(-15, 0, 15), 0)
	MainmenuCtrl.AddHudSpotIcon(2, Vector3.New(-15, 0, -15), 0)
	MainmenuCtrl.AddHudSpotIcon(3, Vector3.New(15, 0, 15), 0)
	MainmenuCtrl.AddHudSpotIcon(4, Vector3.New(15, 0, -15), 0)
	MainmenuCtrl.AddHudSpotIcon(5, Vector3.zero, 0)
end

function MainmenuCtrl.AddHudSpotIcon(index, pos)
	local spot = {}
	local tGo = hudIcons.Template.SpotIcon
	local icon = GoInstantiate(tGo)
	local tfIcon = icon.transform
	local panel = TfFindChild(tfIcon, "Spot_Panel")
	local symbol = TfFindChild(tfIcon, "Spot_Icon")

	tfIcon:SetParent(tGo.transform.parent)
	icon.gameObject:SetActive(true)

	local iconScale = tfIcon.localScale

	if index < 5 then
		iconScale.x = 0.9
		iconScale.y = 0.9
	else
		iconScale.x = 1
		iconScale.y = 1
	end

	tfIcon.localScale = iconScale
	spot.idx = index
	spot.pos = pos
	spot.dist = 0
	spot.teamId = -1
	spot.progress = 0
	spot.enabled = false
	spot.show = false
	spot.showDir = false
	spot.alpha = 1
	spot.mode = MainmenuCtrl.Distance.Near
	spot.isNeutual = true
	spot.icon = icon
	spot.cgrp = icon:GetComponent("CanvasGroup")
	spot.tfDir = TfFindChild(tfIcon, "Image_Way")
	spot.goDir = spot.tfDir.gameObject
	spot.dirEnabled = false

	spot.goDir:SetActive(false)
	TfFindChild(symbol, "Spot" .. index).gameObject:SetActive(true)

	spot.team = {}
	spot.tfTeam = {}
	spot.tfTeam[1] = TfFindChild(panel, "Image_Blue")
	spot.tfTeam[2] = TfFindChild(panel, "Image_Red")
	spot.team[1] = XImage:new(spot.tfTeam[1])
	spot.team[2] = XImage:new(spot.tfTeam[2])

	spot.team[1]:SetFillAmount(0)
	spot.team[2]:SetFillAmount(0)
	spot.tfTeam[1].gameObject:SetActive(true)
	spot.tfTeam[2].gameObject:SetActive(true)

	spot.flash = {}
	spot.flash[1] = TfFindChild(tfIcon, "Image_Light_Blue").gameObject
	spot.flash[2] = TfFindChild(tfIcon, "Image_Light_Red").gameObject
	spot.warning = TfFindChild(tfIcon, "Image_Light_Warning").gameObject

	spot.warning:SetActive(false)

	spot.reset = {}
	spot.reset[1] = Tween:new(spot.team[1].image)

	spot.reset[1]:SetAutoKill(false)

	spot.reset[2] = Tween:new(spot.team[2].image)

	spot.reset[2]:SetAutoKill(false)

	spot.tfText = TfFindChild(tfIcon, "Spot_Text")
	spot.text = XText:new(spot.tfText)

	spot.tfText.gameObject:SetActive(false)

	hudIcons.SpotIcon[index] = spot
end

function MainmenuCtrl.SetSpotIconAlphaObj(spot, alpha)
	if spot ~= nil and spot.alpha ~= alpha then
		spot.alpha = alpha
		spot.cgrp.alpha = alpha
	end
end

function MainmenuCtrl.SetSpotIconAlpha(index, alpha)
	local spot = hudIcons.SpotIcon[index]

	this.SetSpotIconAlphaObj(spot, alpha)
end

function MainmenuCtrl.EnableSpotIconByObj(spot, enabled)
	if spot ~= nil and spot.show ~= enabled then
		spot.show = enabled

		spot.icon:SetActive(enabled)
	end
end

function MainmenuCtrl.EnableSpotIcon(index, enabled)
	this.EnableSpotIconByObj(hudIcons.SpotIcon[index], enabled)
end

function MainmenuCtrl.RemoveHudSpotIcon(index)
	local spot = hudIcons.SpotIcon[index]

	TweenManager.Remove(spot.reset[1])
	TweenManager.Remove(spot.reset[2])
	GoDestroy(spot)

	hudIcons.spot[index] = nil
end

function MainmenuCtrl.SetHudSpotTeamOrder(spot, teamId)
	if spot ~= nil then
		local another = (teamId + 2) % 2 + 1

		spot.tfTeam[teamId]:SetSiblingIndex(1)
		spot.tfTeam[another]:SetSiblingIndex(2)
		spot.team[another]:SetFillAmount(0)
	end
end

function MainmenuCtrl.CancelInvading(spot, teamId)
	if spot ~= nil then
		local tw = spot.reset[teamId]

		tw:MoveTo({
			fillAmount = 0
		}, 0.2)
		tw:Start()
	end
end

function MainmenuCtrl.SetHudSpotWarningByObj(spot, show)
	if spot ~= nil then
		spot.warning:SetActive(show)
	end
end

function MainmenuCtrl.SetHudSpotWarning(index, show)
	this.SetHudSpotWarningByObj(hudIcons.SpotIcon[index], show)
end

function MainmenuCtrl.ShowHudSpotDirectionByObj(spot, show)
	if spot ~= nil and spot.dirEnabled ~= show then
		spot.dirEnabled = show

		spot.goDir:SetActive(show)
	end
end

function MainmenuCtrl.ShowHudSpotDirection(index, show)
	this.SetHudSpotWarningByObj(hudIcons.SpotIcon[index], show)
end

function MainmenuCtrl.ShowHudSpotOccupiedByObj(spot, teamId)
	if spot ~= nil then
		spot.teamId = teamId

		spot.flash[teamId]:SetActive(false)
		spot.flash[teamId]:SetActive(true)
		MainmenuCtrl.SetHudSpotTeamOrder(spot, teamId)
	end
end

function MainmenuCtrl.ShowHudSpotOccupied(index, teamId)
	this.ShowHudSpotOccupiedByObj(hudIcons.SpotIcon[index], teamId)
end

function MainmenuCtrl.SetSpotNeutual(index, flag)
	local spot = hudIcons.SpotIcon[index]

	if spot ~= nil then
		spot.isNeutual = flag
	end
end

function MainmenuCtrl.SetHudSpotInfo(index, teamIdOri, teamIdAtk, percent, show)
	local spot = hudIcons.SpotIcon[index]

	if spot ~= nil then
		MainmenuCtrl.EnableSpotIconByObj(spot, show)

		if not show then
			return
		end

		local dist = (scCamera.transform.position - spot.pos).magnitude

		spot.dist = dist

		if dist >= 0 and dist <= hudIcons.rNear then
			spot.mode = MainmenuCtrl.Distance.Near

			MainmenuCtrl.SetSpotIconAlpha(index, 1)
		elseif dist > hudIcons.rNear and dist <= hudIcons.rMedium then
			spot.mode = MainmenuCtrl.Distance.Medium

			MainmenuCtrl.SetSpotIconAlpha(index, 1)
		elseif dist > hudIcons.rMedium and dist <= hudIcons.rFar then
			spot.mode = MainmenuCtrl.Distance.Far

			MainmenuCtrl.SetSpotIconAlpha(index, 1)
		else
			spot.mode = MainmenuCtrl.Distance.VeryFar

			if not spot.isNeutual or index == MainmenuCtrl.SpotName.Center then
				MainmenuCtrl.SetSpotIconAlpha(index, 1)
			else
				MainmenuCtrl.SetSpotIconAlpha(index, 0.3)
			end
		end

		if teamIdAtk == 0 and percent <= 0 then
			spot.team[1]:SetFillAmount(0)
			spot.team[2]:SetFillAmount(0)
		end

		local percentInt = Mathf.Round(100 * percent)

		if spot.progress ~= percentInt then
			spot.progress = percentInt

			if teamIdOri > 0 then
				spot.team[teamIdOri]:SetFillAmount(teamIdOri > 0 and 1 or 0)
			end

			if teamIdAtk > 0 then
				spot.team[teamIdAtk]:SetFillAmount(teamIdAtk > 0 and percent or 0)

				if percent == 1 and spot.teamId ~= teamAtk then
					spot.teamId = teamIdAtk
				end
			else
				local another = (teamIdOri + 2) % 2 + 1

				spot.team[another]:SetFillAmount(0)
			end
		end

		local ret, angle, uiPos = MainmenuCtrl.GetPosInHud(spot.pos, dist, index)

		if ret then
			spot.icon.transform.localPosition = uiPos

			if dist > hudIcons.rNear then
				MainmenuCtrl.ShowHudSpotDirectionByObj(spot, true)

				spot.tfDir.localEulerAngles = Vector3.New(0, 0, angle)
			else
				MainmenuCtrl.ShowHudSpotDirectionByObj(spot, false)
			end
		end
	end
end

function MainmenuCtrl.AddScreenTag(characterId)
	local tGo = hudIcons.Template.CharIcon
	local tag = GoInstantiate(tGo)
	local tfTag = tag.transform

	tfTag:SetParent(tGo.transform.parent)
	tag.gameObject:SetActive(true)

	local tagScale = tfTag.localScale

	tagScale.x = 0.9
	tagScale.y = 0.9
	tfTag.localScale = tagScale
	hudIcons.CharIcon[characterId] = tag
	hudIcons.CharIconDir[characterId] = TfFindChild(tfTag, "Image_Way")
	hudIcons.charIconAnim[characterId] = tag.gameObject:GetComponent("Animator")
end

function MainmenuCtrl.RemoveScreenTag(characterId)
	hudIcons.charIconAnim[characterId]:SetBool("fadeout", false)
	GoDestroy(hudIcons[characterId])

	hudIcons[characterId] = nil
	hudIcons.CharIconDir[characterId] = nil
end

function MainmenuCtrl.ShowScreenTag(characterId, isEnabled)
	if isEnabled then
		hudIcons.CharIcon[characterId].gameObject:SetActive(isEnabled)
	else
		local hudIcon = hudIcons.CharIcon[characterId]
		local animIcon = hudIcons.charIconAnim[characterId]

		animIcon:SetBool("fadeout", true)

		local tween = Tween:new(hudIcons.CharIcon[characterId])

		tween:MoveTo({}, 3)
		tween:OnComplete(function()
			hudIcon.gameObject:SetActive(false)
		end)
		tween:Start()
	end
end

function MainmenuCtrl.SetCharacterPositionAndOrientation(characterId, pos, ori)
	local charIcon = hudIcons.CharIcon

	if charIcon[characterId] ~= nil then
		local ret, angle, uiPos = MainmenuCtrl.GetPosInHud(pos, 0, characterId)

		if ret then
			charIcon[characterId].transform.localPosition = uiPos
			hudIcons.CharIconDir[characterId].transform.localEulerAngles = Vector3.New(0, 0, angle)
		end
	end
end

function MainmenuCtrl.InitPoi()
	hudIcons.poiData = {}
	hudIcons.poiLife = {}
	hudIcons.poiIcon = {}
	hudIcons.poiPool = {}
end

function MainmenuCtrl.SetPoi(tp, id, sub, pos)
	local poiData = hudIcons.poiData
	local poiLife = hudIcons.poiLife
	local poiIcon = hudIcons.poiIcon
	local poiPool = hudIcons.poiPool

	if poiData and poiLife and poiIcon and poiPool then
		local key = tp .. "_" .. id .. "_" .. sub

		if poiData[key] == nil then
			local tfPoiRoot = hudIcons.tfPoiRoot

			poiData[key] = pos
			poiLife[key] = 3

			local goPoi

			if table.nums(poiPool) > 0 then
				goPoi = table.remove(poiPool)
			else
				local tPoi = hudIcons.Template.PoiIcon

				goPoi = GoInstantiate(tPoi)

				goPoi:SetActive(true)
			end

			goPoi.transform:SetParent(tfPoiRoot)

			poiIcon[key] = goPoi
		elseif poiLife[key] then
			poiLife[key] = 3
		end
	end
end

function MainmenuCtrl.UpdatePoi()
	local poiData = hudIcons.poiData
	local poiLife = hudIcons.poiLife
	local poiIcon = hudIcons.poiIcon
	local poiPool = hudIcons.poiPool
	local tfPoiPool = hudIcons.tfPoiPool
	local tPoi = hudIcons.Template.PoiIcon
	local tfPoiRoot = tPoi.transform.parent
	local count = table.nums(poiTmp)

	if poiData and poiLife and poiIcon and poiPool then
		for poiId, poiVec3 in pairs(poiData) do
			local life = poiLife[poiId] - 1

			if life > 0 then
				poiLife[poiId] = life

				local ret, angle, uiPos = this.GetPosInHud(poiVec3)

				if ret then
					poiIcon[poiId].transform.localPosition = uiPos
				end
			else
				poiData[poiId] = nil
				poiLife[poiId] = nil

				local icon = poiIcon[poiId]

				if icon then
					icon.transform:SetParent(tfPoiPool)
					table.insert(poiPool, icon)

					poiIcon[poiId] = nil
				end
			end
		end
	end
end

function MainmenuCtrl.ResetPoi()
	local poiData = hudIcons.poiData
	local poiLife = hudIcons.poiLife
	local poiIcon = hudIcons.poiIcon
	local poiPool = hudIcons.poiPool
	local tfPoiPool = hudIcons.tfPoiPool
	local count = table.nums(poiTmp)

	if poiData and poiLife and poiIcon and poiPool then
		for poiId, poiVec3 in pairs(poiData) do
			poiData[poiId] = nil
			poiLife[poiId] = nil

			local icon = poiIcon[poiId]

			if icon then
				icon.transform:SetParent(tfPoiPool)
				table.insert(poiPool, icon)

				poiIcon[poiId] = nil
			end
		end
	end
end

function MainmenuCtrl.ClearPoi()
	hudIcons.poiData = nil
	hudIcons.poiLife = nil

	local poiIcon = hudIcons.poiIcon

	for k, v in pairs(poiIcon) do
		GoDestroy(v)

		poiIcon[k] = nil
	end

	hudIcons.poiIcon = nil

	local poiPool = hudIcons.poiPool
	local count = table.nums(poiPool)

	for idx = 1, count do
		GoDestroy(poiPool[idx])

		poiPool[idx] = nil
	end

	hudIcons.poiPool = nil
end

function MainmenuCtrl.InitActionButton(name, textFunc, action)
	local com = actionBtn.buttons[name]

	if com then
		if com.img then
			local sprite = XObjectPool.GetIcon("main_actionbutton_" .. name)

			if sprite then
				com.img:SetSprite(sprite)
			end
		end

		if textFunc then
			com.text:SetGameTextContent(textFunc)
		end

		if action then
			com.btn:SetEventCallBack(EventTriggerType.PointerClick, action, 0)
		else
			com.btn:SetEventCallBack(EventTriggerType.PointerClick, function()
				if sceneController then
					sceneController:SetActionAssist(name)
				end
			end, 0)
		end

		if com.kmIcon then
			local keyName = LS_Setting.KMItems[LS_Setting.KMIndex.ACTION]
			local keyCode = KMKey[keyName]

			if keyCode > 0 then
				local filename = LS_Setting.GetPCIconName(XKeyIconName[keyCode])

				if filename then
					local sprite = XObjectPool.GetIcon(filename)

					if sprite then
						com.kmIcon:SetSprite(sprite)
					end

					if com.kmIcon.gameObject ~= nil then
						com.kmIcon.gameObject:SetActive(true)
					end

					com.abIcon:SetActive(false)
				else
					if com.kmIcon.gameObject ~= nil then
						com.kmIcon.gameObject:SetActive(false)
					end

					com.abIcon:SetActive(true)
				end
			else
				if com.kmIcon.gameObject ~= nil then
					com.kmIcon.gameObject:SetActive(false)
				end

				com.abIcon:SetActive(true)
			end

			if LS_Setting.isJoystickConnected then
				if com.kmIcon.gameObject ~= nil then
					com.kmIcon.gameObject:SetActive(false)
				end

				com.abIcon:SetActive(true)
			end
		end
	end
end

function MainmenuCtrl.OpenDialogCarriage()
	this.ShowActionButtons(false)
	UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.UI_COMMON_REQUIRE_CARRIAGE, function()
		AudioCtrl.SetUIAudio("bell")

		if sceneController then
			sceneController:SetActionAssist(ControllerMain.AssistButton.Carriage)
		end
	end, function()
		this.ShowActionButtons(true)
	end, false)

	if sceneController then
		sceneController:OpenMessageUI()
	end
end

function MainmenuCtrl.SetDialogButton(dialogType)
	if dialogType ~= nil then
		local com = actionBtn.buttons[ControllerMain.AssistButton.Dialog]

		if actionBtn.dialogType ~= dialogType and com ~= nil then
			actionBtn.dialogType = dialogType

			if dialogType == 0 then
				MainmenuCtrl.SetButtonDialog()
			else
				local actualActionType = MainmenuCtrl.DialogType[dialogType]

				if com.img then
					local sprite = XObjectPool.GetIcon("main_actionbutton_" .. actualActionType)

					if sprite then
						com.img:SetSprite(sprite)
					end
				end

				com.text:SetGameTextContent(function()
					return GameText[MainmenuCtrl.DialogBtnText[dialogType]]
				end)
			end
		end
	end
end

function MainmenuCtrl.SetTimeLineButton(dialogType)
	if dialogType ~= nil then
		local com = actionBtn.buttons[ControllerMain.AssistButton.TimeLine]

		if actionBtn.dialogTypeTimeLine ~= dialogType and com ~= nil then
			actionBtn.dialogTypeTimeLine = dialogType

			if dialogType == 0 then
				MainmenuCtrl.SetButtonTimeLine()
			else
				local actualActionType = MainmenuCtrl.TimeLineType[dialogType]

				if com.img then
					local sprite = XObjectPool.GetIcon("main_actionbutton_" .. actualActionType)

					if sprite then
						com.img:SetSprite(sprite)
					end
				end

				com.text:SetGameTextContent(function()
					return GameText[MainmenuCtrl.TimeLineBtnText[dialogType]]
				end)
			end
		end
	end
end

function MainmenuCtrl.ActionKeyName()
	if LS_Setting.isJoystickConnected then
		return GameText.UI_COMMON_EMPTY
	else
		local keyName = LS_Setting.KMItems[LS_Setting.KMIndex.ACTION]
		local keyCode = KMKey[keyName]

		return XKeySymbol[keyCode]
	end
end

function MainmenuCtrl.SetButtonClimb()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Climb, function()
		return GameText.UI_COMMON_ACTION_CLIMB
	end)
end

function MainmenuCtrl.SetButtonDialog()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Dialog, function()
		return GameText.UI_COMMON_ACTION_DIALOG
	end)
end

function MainmenuCtrl.SetButtonPicking()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Picking, function()
		return GameText.UI_COMMON_ACTION_PICKING
	end)
end

function MainmenuCtrl.SetButtonWorshiping()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Worshiping, function()
		return GameText.UI_COMMON_ACTION_WORSHIPING
	end)
end

function MainmenuCtrl.SetButtonViewMap()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.ViewMap, function()
		return GameText.UI_COMMON_ACTION_VIEWMAP
	end)
end

function MainmenuCtrl.SetButtonCarriage()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Carriage, function()
		return GameText.UI_COMMON_ACTION_RINGBELL
	end, function()
		MainmenuCtrl.OpenDialogCarriage()
	end)
end

function MainmenuCtrl.SetButtonBackstab()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Backstab, function()
		return GameText.UI_COMMON_ACTION_BACKSTAB
	end)
end

function MainmenuCtrl.SetButtonExecute()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Execute, function()
		return GameText.UI_COMMON_ACTION_EXECUTE
	end)
end

function MainmenuCtrl.SetButtonDoor()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Door, function()
		return GameText.UI_COMMON_ACTION_DOOR
	end)
end

function MainmenuCtrl.SetButtonDoorHint()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.DoorHint, function()
		return GameText.UI_COMMON_ACTION_DOORHINT
	end)
end

function MainmenuCtrl.SetButtonElevator()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Elevator, function()
		return GameText.UI_COMMON_ACTION_ELEVATOR
	end)
end

function MainmenuCtrl.SetButtonCage()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Cage, function()
		return GameText.UI_COMMON_ACTION_CAGE
	end)
end

function MainmenuCtrl.SetButtonStairKick()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.StairKick, function()
		return GameText.UI_COMMON_ACTION_STAIRKICK
	end)
end

function MainmenuCtrl.SetButtonCoverKick()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.CoverKick, function()
		return GameText.UI_COMMON_ACTION_COVERKICK
	end)
end

function MainmenuCtrl.SetButtonCoverKickHint()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.CoverKickHint, function()
		return GameText.UI_COMMON_ACTION_COVERKICKHINT
	end)
end

function MainmenuCtrl.SetButtonCrate()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Crate, function()
		return GameText.UI_COMMON_ACTION_OPENCRATE
	end)
end

function MainmenuCtrl.SetButtonGate()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Gate, function()
		return GameText.UI_COMMON_ACTION_OPENGATE
	end)
end

function MainmenuCtrl.SetButtonGateHint()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.GateHint, function()
		return GameText.UI_COMMON_ACTION_GATEHINT
	end)
end

function MainmenuCtrl.SetButtonBridge()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Bridge, function()
		return GameText.UI_COMMON_ACTION_BRIDGE
	end)
end

function MainmenuCtrl.SetButtonVirtualWall()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.VirtualWall, function()
		return GameText.UI_COMMON_ACTION_VIRTUALWALL
	end)
end

function MainmenuCtrl.SetButtonVirtualWallHint()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.VirtualWallHint, function()
		return GameText.UI_COMMON_ACTION_VIRTUALWALLHINT
	end)
end

function MainmenuCtrl.SetButtonTimeLine()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.TimeLine, function()
		return GameText.UI_COMMON_ACTION_TIMELINE
	end)
end

function MainmenuCtrl.SetButtonEntrance()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Entrance, function()
		return GameText.UI_COMMON_ACTION_ENTRANCE
	end)
end

function MainmenuCtrl.SetButtonStatue()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Statue, function()
		return GameText.UI_COMMON_ACTION_STATUE
	end)
end

function MainmenuCtrl.SetButtonFountain()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Fountain, function()
		return GameText.UI_COMMON_ACTION_FOUNTAIN
	end)
end

function MainmenuCtrl.SetButtonHoneypot()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Honeypot, function()
		return GameText.UI_COMMON_ACTION_HONEYPOT
	end)
end

function MainmenuCtrl.SetButtonBonefire()
	MainmenuCtrl.InitActionButton(ControllerMain.AssistButton.Bonefire, function()
		return GameText.UI_COMMON_ACTION_BONEFIRE
	end)
end

function MainmenuCtrl.SetActionButtonIcon(name, iconId)
	local com = actionBtn.buttons[name]

	if com and com.img then
		local sprite = XObjectPool.GetIcon("main_dialogbutton_" .. iconId)

		if sprite then
			com.img:SetSprite(sprite)
		end
	end
end

function MainmenuCtrl.ShowActionButtons(show)
	actionBtn.show = show

	actionBtn.go:SetActive(show)
end

function MainmenuCtrl.ShowActionButton(name, show, animalIndex, iconId)
	local com = actionBtn.buttons[name]

	if com ~= nil and com.ready ~= show then
		com.ready = show

		if show == true and iconId ~= nil then
			this.SetActionButtonIcon(name, iconId)
		end

		if name == ControllerMain.AssistButton.Execute then
			if animalIndex then
				playerStatus.readyExecution = animalIndex

				if show then
					UIManager.SendMessage("HeadInfo", "SetFocusColor", animalIndex, 0.9019607843137255, 0.38823529411764707, 0.38823529411764707, 1)
				end
			elseif not show then
				UIManager.SendMessage("HeadInfo", "SetFocusColor", playerStatus.readyExecution, 1, 1, 1, 1)

				playerStatus.readyExecution = 0
			end
		elseif name == ControllerMain.AssistButton.Backstab then
			if animalIndex then
				playerStatus.readyBackstab = animalIndex

				if show then
					UIManager.SendMessage("HeadInfo", "SetFocusColor", animalIndex, 0.9019607843137255, 0.38823529411764707, 0.38823529411764707, 1)
				end
			elseif not show then
				UIManager.SendMessage("HeadInfo", "SetFocusColor", playerStatus.readyBackstab, 1, 1, 1, 1)

				playerStatus.readyBackstab = 0
			end
		end

		MainmenuCtrl.UpdateActionButtons()
	end
end

function MainmenuCtrl.UpdateActionButtons()
	local priority = ControllerMain.ActionPriority
	local idx = 0
	local buttons = actionBtn.buttons

	for i = 1, actionBtn.maxCount do
		idx = priority[i]

		local btn = buttons[idx]

		if btn and btn.ready then
			if not btn.show then
				btn.show = true

				btn.go:SetActive(true)
			end

			break
		end

		idx = 0
	end

	for i = 1, actionBtn.maxCount do
		if idx ~= i then
			local btn = buttons[i]

			if btn.show then
				btn.show = false

				btn.go:SetActive(false)
			end
		end
	end
end

function MainmenuCtrl.isActionButtonEnabled(name)
	local ret = false
	local com = actionBtn.buttons[name]

	if com ~= nil then
		ret = com.show
	end

	return ret
end

function MainmenuCtrl.SetAdjacentActionButton(name, adjacentPosition, adjacentName)
	local com = actionBtn.buttons[name]

	if com ~= nil then
		com.btn:SetAdjacent(adjacentPosition, adjacentName)
	end
end

function MainmenuCtrl.JPadPress(pos)
	return
end

function MainmenuCtrl.DPadPress(pos)
	if panelRoot then
		if panelRoot.isFadingInOut ~= 0 then
			return
		end

		if not panelRoot.isInteractive then
			return
		end
	end

	local lName = UILayerCtrl.GetCurrentLayerName()

	if panelSys and lName == "GameMain" then
		if Platform == PlatformType.IOS or Platform == PlatformType.TVOS then
			if pos == 1 then
				-- block empty
			elseif pos == 2 then
				panelSys.dpadDnPressed = true
			elseif pos == 3 then
				-- block empty
			elseif pos == 4 then
				-- block empty
			else
				panelSys.dpadDnPressed = false
			end
		elseif pos == 1 then
			-- block empty
		elseif pos == 2 then
			panelSys.dpadDnPressed = true
		elseif pos == 3 then
			-- block empty
		elseif pos == 4 then
			if DebugScreenshot then
				CaptureScreenshot.Capture()
			end
		else
			panelSys.dpadDnPressed = false
		end
	end
end

function MainmenuCtrl.DPadLongPress(pos)
	return
end

function MainmenuCtrl.JPadLongPress(pos)
	return
end

function MainmenuCtrl.JPadRotPrecise(vec2)
	local lName = UILayerCtrl.GetCurrentLayerName()

	if lName == "SelectItem" then
		local mag = vec2.magnitude

		if mag < 0.7 and SelectItemPanel.NextSucessTime > TimeHelper.getNowTimeNoScale() then
			return
		end

		if mag > 0.3 then
			SelectItemPanel.NextSucessTime = TimeHelper.getNowTimeNoScale() + 0.15

			local d = math.atan2(vec2.y, vec2.x)

			d = math.deg(d)

			if d > -15 and d < 15 then
				local button = ItemSlotList[5]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif d >= 15 and d <= 90 then
				local button = ItemSlotList[6]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif d >= 90 and d < 165 then
				local button = ItemSlotList[1]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif d >= 165 and d <= 180 or d >= -180 and d <= -165 then
				local button = ItemSlotList[2]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif d > -165 and d <= -90 then
				local button = ItemSlotList[3]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			elseif d >= -90 and d <= -15 then
				local button = ItemSlotList[4]

				button:OnDown(nil, nil)
				button:OnClick(nil, nil)
			end
		end
	end
end

function MainmenuCtrl.ShowPanelItems(show)
	if panelItems ~= nil and panelItems.com ~= nil and panelItems.show ~= show then
		panelItems.show = show

		panelItems.com:SetActive(show)
	end
end

function MainmenuCtrl.Close(uiName)
	MainmenuCtrl.OnDestroyPaneGuardMode()
	MainmenuCtrl.OnDestroyPaneFreeMode()

	if panelSys ~= nil then
		TweenManager.Remove(panelSys.btnSettings.hiding)
		TweenManager.Remove(panelSys.btnPlayerInfo.hiding)
	end

	if playerStatus ~= nil then
		for i = 1, 5 do
			local btn = skillBtn[i]

			if btn then
				TweenManager.Remove(btn.hiding)
			end
		end

		TweenManager.Remove(btnLockPlayer.hiding)
		TweenManager.Remove(playerStatus.twLowEnergy)
		TweenManager.Remove(playerStatus.twPathBlock)
		TweenManager.Remove(playerStatus.hpStepTween)
		TweenManager.Remove(playerStatus.hpShieldTween)
		TweenManager.Remove(playerStatus.energyTween)
		TweenManager.Remove(playerStatus.sanityBar.deltaTween)
		TweenManager.Remove(playerStatus.rageBar.tweenAnimThreshold)
		TweenManager.Remove(playerStatus.rageSpBar.tweenAnimThreshold)

		if playerStatus.statusIcons then
			playerStatus.statusIcons:ClearTemplate()
		end
	end

	if uiPanelMessage ~= nil then
		TweenManager.Remove(uiPanelMessage.destination.tween)
		TweenManager.Remove(uiPanelMessage.sanityAbnormal.tween)
		TweenManager.Remove(uiPanelMessage.sanityBreakdown.tween)
	end

	if oppositeStatus ~= nil then
		TweenManager.Remove(oppositeStatus.hpBarYTween)
		TweenManager.Remove(oppositeStatus.toughnessBarSTween)

		if oppositeStatus.statusIcons then
			oppositeStatus.statusIcons:ClearTemplate()
		end
	end

	if panelPlayer and panelPlayer.bullet then
		local pnlBullet = panelPlayer.bullet
		local count = pnlBullet.bulletMax
		local slots = pnlBullet.bulletSlots

		for i = 1, count do
			TweenManager.Remove(slots[i].twBullet)
			TweenManager.Remove(slots[i].twRestore)
		end

		panelPlayer.bullet = nil
	end

	if actionBtn and actionBtn.loader then
		actionBtn.loader:ClearTemplate()
	end

	local hudIconList = hudIcons.CharIcon

	for _k, _v in pairs(hudIconList) do
		GoDestroy(_v)

		hudIcons.CharIcon[_k] = nil
		hudIcons.CharIconDir[_k] = nil
	end

	if panelRoot then
		TweenManager.Remove(panelRoot.twFadeIn)
		TweenManager.Remove(panelRoot.twFadeOut)
	end

	MainmenuCtrl.ClearPoi()

	if panelPlayer then
		local panelMazeBar = panelPlayer.panelMazeBar

		if panelMazeBar ~= nil then
			if panelMazeBar.loaderBossBar then
				panelMazeBar.loaderBossBar:ClearTemplate()
			end

			local maxCount = panelMazeBar.bossIconCount
			local icons = panelMazeBar.bossIcon

			for idx = 1, maxCount do
				local icon = icons[idx]

				if icon ~= nil then
					icon.showOn = false
					icon.imgOn = nil
				end
			end

			panelMazeBar.bossIcon = nil
		end
	end

	UICtrlBase.Close("Mainmenu")
end

function MainmenuCtrl.UpdateQuickItem(_quickItem)
	quickItem = _quickItem

	local img = quickItemBtn.img

	if _quickItem and _quickItem.itemId > 0 then
		if quickItemBtn.itemId ~= _quickItem.itemId then
			quickItemBtn.itemId = _quickItem.itemId

			local sprite = XObjectPool.GetIcon("item" .. _quickItem.itemIcon)

			img:SetSprite(sprite)
		end

		img:SetAlpha(1)
		quickItemBtn.numTextGO:SetActive(true)
		quickItemBtn.numText:SetContent(_quickItem.itemNum)

		if _quickItem.itemNum == 0 then
			img:SetGray(true)
		else
			img:SetGray(false)
		end
	else
		img:SetAlpha(0)
		quickItemBtn.numTextGO:SetActive(false)
	end
end

function MainmenuCtrl.UpdateComsumeItem(hp, mp)
	if ItemBtn1.num == 0 and hp > 0 then
		ItemBtn1.img:SetGray(false)
	elseif ItemBtn1.num > 0 and hp == 0 then
		ItemBtn1.img:SetGray(true)
	end

	if ItemBtn2.num == 0 and mp > 0 then
		ItemBtn2.img:SetGray(false)
	elseif ItemBtn2.num > 0 and mp == 0 then
		ItemBtn2.img:SetGray(true)
	end

	ItemBtn1.text:SetContent(hp)
	ItemBtn2.text:SetContent(mp)

	ItemBtn1.num = hp
	ItemBtn2.num = mp
end

function MainmenuCtrl.LoadQuickItem(list)
	if list == nil or table.nums(ItemSlotList) <= 0 then
		return
	end

	local quicklist = list

	SelectItemPanel.itemNameText:SetContent("")
	SelectItemPanel.ArcadeItemDes:SetContent("")

	for k, v in pairs(ItemSlotList) do
		local imgitem = v.imgGo

		v.quickslotBG:SetGray(true)
		v:SetLightFunc(false)

		if quicklist[k] ~= nil then
			if quicklist[k].lock then
				v.lockImgGO:SetActive(true)
			else
				v.lockImgGO:SetActive(false)

				if quicklist[k].itemId > 0 then
					local img = v.img

					imgitem:SetActive(true)

					if v.itemId ~= quicklist[k].item.itemId then
						v.itemId = quicklist[k].item.itemId

						local sprite = XObjectPool.GetIcon("item" .. quicklist[k].item.itemIcon)

						img:SetSprite(sprite)
					end

					v.numText.text = quicklist[k].item.itemNum

					if quicklist[k].item.itemNum == 0 then
						img:SetGray(true)
					else
						img:SetGray(false)
					end
				else
					imgitem:SetActive(false)
				end

				if quicklist[k].default then
					panelItems.SelectedItem = v

					if quicklist[k].item then
						local itemData = MS_ItemData.GetItemData(quicklist[k].item.itemId)

						if itemData then
							SelectItemPanel.itemNameText:SetContent(itemData.Name)
							SelectItemPanel.ArcadeItemDes:SetContent(itemData.Description)
						else
							SelectItemPanel.itemNameText:SetContent("")
							SelectItemPanel.ArcadeItemDes:SetContent("")
						end
					end

					v:SetHighlighted()
					v:SetLightFunc(true)
					v.quickslotBG:SetGray(false)
				end
			end
		end
	end
end

function MainmenuCtrl.AddTempGuide(tutorialId, itemId)
	if itemId then
		MainmenuCtrl.ShowTempGuide(tutorialId, itemId)
	else
		if guide.guideQueue and table.contains(guide.guideQueue, tutorialId) then
			return
		end

		if #guide.guideQueue == 0 then
			MainmenuCtrl.ShowTempGuide(tutorialId)

			guide.tutorialId = tutorialId
		else
			guide.leftFrame:SetActive(false)
			MainmenuCtrl.ShowTempGuide(tutorialId)

			guide.tutorialId = tutorialId
		end

		table.insert(guide.guideQueue, tutorialId)
	end
end

function MainmenuCtrl.RefreshGuideLanguage()
	if guide.leftFrame.activeSelf then
		MainmenuCtrl.ShowTempGuide(guide.tutorialId)
	end
end

function MainmenuCtrl.ShowTempGuide(tutorialId, itemId)
	local tData = MS_StoryTutorial.GetTutorialData(tutorialId)

	if tData == nil then
		return
	end

	local text

	if itemId then
		guide.isGetDocument = true

		if guide.getDucumentTimer then
			guide.getDucumentTimer:Reset(function()
				guide.isGetDocument = false

				MainmenuCtrl.CloseTempGuide()
			end, 6, 1, true)
		else
			guide.getDucumentTimer = Timer.New(function()
				guide.isGetDocument = false

				MainmenuCtrl.CloseTempGuide()
			end, 6, 1, true)
		end

		guide.getDucumentTimer:Start()

		local itemName = MS_ItemData.GetItemName(itemId)

		text = "{79}" .. itemName

		MainmenuCtrl.ShowGuideLeft(tData.HeroId, text, true)
	elseif LS_Setting.IsJoystickConnected() then
		text = tData.DescriptionJoystick

		MainmenuCtrl.ShowGuideLeft(tData.HeroId, text, true)
	else
		text = tData.DescriptionTouch

		MainmenuCtrl.ShowGuideLeft(tData.HeroId, text, false)
	end
end

function MainmenuCtrl.ShowTempGuideBottom(heroId)
	return
end

function MainmenuCtrl.CloseTempGuide()
	if guide.isGetDocument then
		return
	end

	if #guide.guideQueue > 0 then
		guide.guideQueue = {}
	end

	if guide.leftFrame ~= nil and not IsNil(guide.leftFrame) then
		guide.leftFrame:SetActive(false)
	end

	if guide.middleFrame ~= nil and not IsNil(guide.middleFrame) then
		guide.middleFrame:SetActive(false)
	end
end

function MainmenuCtrl.CloseTempGuideBottom()
	guide.bottomFrame:SetActive(false)
end

function MainmenuCtrl.RefreshTempGuide()
	if guide.bottomFrame.activeSelf then
		guide.bottomFrame:SetActive(false)
		guide.bottomFrame:SetActive(true)
	end

	if guide.leftFrame.activeSelf then
		guide.leftFrame:SetActive(false)
		guide.leftFrame:SetActive(true)
	end
end

function MainmenuCtrl.ShowGuideMiddle(text)
	guide.middleText:SetContent(text)
	guide.middleFrame:SetActive(true)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(guide.middleFrameRT)
end

function MainmenuCtrl.ShowGuideLeft(heroId, text, isJoystickAttached)
	guide.leftFrame:SetActive(false)

	local _text = SystemHelper.ConvertCustomRichText(text, 20, 2, heroId)

	guide.leftText:SetContent(_text)

	local textHeight = guide.leftText.textCom.preferredHeight

	guide.leftFrameRTF.sizeDelta = Vector2.New(299, 40 + textHeight)

	AudioCtrl.SetUIAudio("guide_tips")
	guide.leftFrame:SetActive(true)

	textHeight = guide.leftText.textCom.preferredHeight
	guide.leftFrameRTF.sizeDelta = Vector2.New(299, 40 + textHeight)
end

function MainmenuCtrl.ShowGuideBottom(heroId, text)
	guide.bottomFrame:SetActive(false)

	local _text = SystemHelper.ConvertCustomRichText(text, 27, 1, heroId)

	guide.bottomText:SetContent(_text)
	guide.bottomFrame:SetActive(true)
end

function MainmenuCtrl.OpenMap()
	if not panelMap.show then
		MainmenuCtrl.ShowBaseUI(false)
		MainmenuCtrl:SetBlurEnabled(true)
		UIManager.CreateCtrl("MapView")

		panelMap.show = true
	end
end

function MainmenuCtrl.ShowMapBg(show)
	MainmenuCtrl:SetBlurEnabled(show)
end

function MainmenuCtrl.CloseMap()
	if panelMap.show then
		UIManager.SendMessage("Captured", "Show", false)
		sceneController:GetCameraCtrl():Enable()
		MainmenuCtrl.ShowActionButtons(true)
		MainmenuCtrl.ShowBaseUI(true)
		UIManager.Close("MapView")

		panelMap.show = false

		UILayerCtrl.Pop()
		MainmenuCtrl:SetBlurEnabled(false)
	end
end

function MainmenuCtrl.ClearMap()
	UIManager.Close("MapView")
end

function MainmenuCtrl.ShowDebugPanel()
	if DebugShowCtrlPanel and sceneController then
		debugPanel.show = not debugPanel.show

		local show = debugPanel.show

		if show then
			UIManager.SendMessage("Debug", "SetPanelTarget", DebugCtrl.Panel.Host, sceneController:GetHostPlayer())
		end

		UIManager.SendMessage("Debug", "Show", show)

		if show then
			inputMgr:SetPointerLocked(false)
			inputMgr:SetInMenuMode()

			LS_Setting.ignoreLMB = true
		else
			inputMgr:SetPointerLocked(true)
			inputMgr:SetInGameMode()

			LS_Setting.ignoreLMB = false
		end
	end
end

function MainmenuCtrl.SetTouchPadLayout(btnCfg)
	local btnMap = SettingCtrl.TPBtnMap

	for k, v in pairs(btnMap) do
		local btn = this.mainComponent:GetGameObject(v)
		local rectTf = btn.gameObject:GetComponent("RectTransform")
		local cfg = btnCfg[k]

		btn.transform.localPosition = Vector3.New(cfg.x, cfg.y, 0)

		local localScale = cfg.s

		rectTf.localScale = Vector3.New(localScale, localScale, 1)
	end
end

function MainmenuCtrl.ExternalEvent(hasJoystick, hasKeyboardMouse)
	if actionBtn then
		MainmenuCtrl.UpdateActionButtons()
	end

	if not hasKeyboardMouse then
		this.ShowMainUI(true)
	end

	this.RefreshActionBtnJoystickIcon()
	this.RefreshActionBtnKeyboardIcon()
	this.RefreshOtherKeyboardIcons()
	UIManager.RefreshLanguage()
end

function MainmenuCtrl.ShowHostStatus(show)
	if panelPlayer and panelPlayer.showHostUI ~= show then
		panelPlayer.showHostUI = show

		this.ShowHostUI(show)
	end
end

function MainmenuCtrl.ShowTouchUI(show)
	if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
		return
	end

	if panelPlayer and panelPlayer.showEssentialButtons ~= show then
		show = show and not panelPlayer.forceStopingCounting
		panelPlayer.showEssentialButtons = show

		if show then
			for i = 1, 5 do
				local btn = skillBtn[i]

				if btn then
					btn:SetInteractable(true)

					btn.empty4Raycast.enabled = true
					btn.gameObject:GetComponent("CanvasGroup").alpha = 1
				end
			end

			if btnLockPlayer then
				btnLockPlayer:SetInteractable(true)

				btnLockPlayer.gameObject:GetComponent("CanvasGroup").alpha = 1
			end

			if panelSys.btnSettings then
				panelSys.btnSettings:SetInteractable(true)

				panelSys.btnSettings.gameObject:GetComponent("CanvasGroup").alpha = 1
			end

			if panelSys.btnPlayerInfo then
				panelSys.btnPlayerInfo:SetInteractable(true)

				panelSys.btnPlayerInfo.gameObject:GetComponent("CanvasGroup").alpha = 1
			end

			if panelSys.iBtnTouchEnabler then
				panelSys.iBtnTouchEnabler = false

				panelSys.btnTouchEnabler:SetInteractable(false)

				panelSys.btnTouchEnabler.empty4Raycast.enabled = false
			end
		else
			for i = 1, 5 do
				local btn = skillBtn[i]

				if btn then
					btn:SetInteractable(false)

					btn.empty4Raycast.enabled = false
					btn.gameObject:GetComponent("CanvasGroup").alpha = 0
				end
			end

			if btnLockPlayer then
				btnLockPlayer:SetInteractable(false)

				btnLockPlayer.gameObject:GetComponent("CanvasGroup").alpha = 0
			end

			if not LS_Setting.isMouseConnected or LS_Setting.isKeyboardConnected ~= false then
				if panelSys.btnSettings then
					panelSys.btnSettings:SetInteractable(false)

					panelSys.btnSettings.gameObject:GetComponent("CanvasGroup").alpha = 0
				end

				if panelSys.btnPlayerInfo then
					panelSys.btnPlayerInfo:SetInteractable(false)

					panelSys.btnPlayerInfo.gameObject:GetComponent("CanvasGroup").alpha = 0
				end
			end

			if not panelSys.iBtnTouchEnabler then
				panelSys.iBtnTouchEnabler = true

				panelSys.btnTouchEnabler:SetInteractable(true)

				panelSys.btnTouchEnabler.empty4Raycast.enabled = true
			end
		end

		if show then
			this.RevalidateLock()
			this.RevalidateRage()
		end
	end
end

function MainmenuCtrl.RecordTouchEvent()
	if (LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected or LS_Setting.isMouseConnected) and panelPlayer then
		this.ShowTouchUI(true)

		panelPlayer.idleTimeTouchUi = TimeHelper.getNowTimeNoScale()
	end
end

function MainmenuCtrl.SetForceHideTouchUI(bool)
	panelSys.forceHideTouchUI = bool
end

function MainmenuCtrl.UpdateTouchUI()
	if not LS_Setting.ignoreLMB and (LS_Setting.isJoystickConnected or LS_Setting.isKeyboardConnected or LS_Setting.isMouseConnected) then
		if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
			return
		end

		if not panelRoot.blocksRaycasts then
			panelPlayer.idleTimeTouchUi = TimeHelper.getNowTimeNoScale()
		end

		if panelPlayer.idleTimeTouchUi > 0 and TimeHelper.getNowTimeNoScale() - panelPlayer.idleTimeTouchUi > panelPlayer.thresholdTimeTouchUi then
			panelPlayer.idleTimeTouchUi = TimeHelper.getNowTimeNoScale()

			this.ShowTouchUI(false)
		end
	else
		if MS_StoryList.IsStoryCarriage(FS_UserData.story:GetStoryId()) == true then
			return
		end

		if panelSys.forceHideTouchUI then
			this.ShowTouchUI(false)

			return
		end

		if panelPlayer then
			this.ShowTouchUI(true)
		end
	end
end

function MainmenuCtrl.ApplyInputLayoutForTouchScreen()
	if not LS_Setting.enableCustomTPInput then
		return
	end

	SystemHelper.Log("[ ______ MainmenuCtrl.ApplyInputLayoutForTouchScreen ______ ]")

	local layout = LS_Setting.GetCurrentInputConfig(LS_Setting.InputMode.TP)

	if layout then
		for k, v in pairs(MainmenuCtrl.BtnTPC) do
			local tfData = layout[k]
			local btn = this.mainComponent:GetGameObject(v)

			if tfData and btn then
				local rectTf = btn:GetComponent("RectTransform")
				local x = tfData.x
				local y = tfData.y

				x, y = SystemHelper.AdaptX(x, y, v)
				rectTf.localPosition = Vector3.New(x, y, 0)

				local scale = tfData.s

				if scale < 2 then
					scale = scale * 100
				end

				local localScale = scale / 100

				btn.transform.localScale = Vector3.New(localScale, localScale, 1)

				if k == "MOVE" then
					joystickControllerForMove:SetJoystickMoveArea(x, y, localScale)
				elseif k == "MOVEFIXED" then
					joystickControllerForMove:SetJoystickMovePosition(x, y)
				end

				if (Platform == PlatformType.PC or Platform == PlatformType.MAC) and (k == "SKILL1" or k == "SKILL2" or k == "SKILL3" or k == "SKILL4" or k == "SKILL5" or k == "SKILL6" or k == "LOCKON") then
					btn.transform.localScale = Vector3.zero

					btn.gameObject:SetActive(false)

					panelSys.btnSettings.transform.localScale = Vector3.zero
					panelSys.btnPlayerInfo.transform.localScale = Vector3.zero
				end
			end
		end
	end

	this.RefreshActionBtnJoystickIcon()
	this.RefreshActionBtnKeyboardIcon()
	this.RefreshOtherKeyboardIcons()
end

function MainmenuCtrl.SaveTouchScreenLayoutToDefault()
	return
end

function MainmenuCtrl.ChangeScreenAspect()
	return
end

function MainmenuCtrl.ScheduleUiAutoAdaption()
	delayAutoAdaption = 2
end

function MainmenuCtrl.RevalidateInputLayoutsForTouchScreen()
	this.ApplyInputLayoutForTouchScreen()
	this.RevalidateSanCameraVfx()
end

function MainmenuCtrl.EnableTouchJoystick(enabled)
	return
end

function MainmenuCtrl.SetGraphicsQuality(level)
	fullscreenPanels.fullMask:SetActive(level == LS_Setting.QualityLevel.Low)
end

function MainmenuCtrl.ShowFullMask(show)
	local fullScreenMask = fullscreenPanels.fullMask

	if fullScreenMask ~= nil then
		fullScreenMask:SetActive(show)
	end

	local vfx_SanCameraTF = fullscreenPanels.vfx_SanCameraTF

	if vfx_SanCameraTF ~= nil then
		vfx_SanCameraTF.gameObject:SetActive(show)
	end
end

function MainmenuCtrl.SetSanCameraVfx(enabled)
	local vfx_SanCameraTF = fullscreenPanels.vfx_SanCameraTF

	vfx_SanCameraTF.gameObject:SetActive(enabled)

	if enabled then
		if vfx_SanCameraTF.parent.name ~= "Element_Mainmenu" then
			vfx_SanCameraTF:SetParent(this.gameObject.transform.parent)
			vfx_SanCameraTF:SetAsFirstSibling()

			vfx_SanCameraTF.localPosition = Vector3.New(0, 0, 100)
		end

		local layerName = enabled and "UI" or "UINotRender"

		SystemHelper.SetLayerInChildren(vfx_SanCameraTF, layerName)
		this.ShowFullMask(LS_Setting.graphics.vignette > 0)
	else
		this.ShowFullMask(false)
	end

	vfx_SanCameraTF.localScale = Vector3.New(1430 * (9 * SystemHelper.GetScreenWidth() / (16 * SystemHelper.GetScreenHeight())), 1430, 1)
end

function MainmenuCtrl.RevalidateSanCameraVfx()
	local vfx_SanCameraTF = fullscreenPanels.vfx_SanCameraTF

	if vfx_SanCameraTF ~= nil then
		vfx_SanCameraTF.localScale = Vector3.New(1430 * (9 * SystemHelper.GetScreenWidth() / (16 * SystemHelper.GetScreenHeight())), 1430, 1)
	end
end

function MainmenuCtrl.ClearSanityVfx()
	local scene = sceneController:GetScene()

	if scene then
		scene:InterpColorGradingSaturation(true, 18)
		scene:InterpChromaticAberrationIntensity(true, 0.126)
		MainmenuCtrl.SetSanCameraVfx(false)
	end
end

function MainmenuCtrl.ResetSanityVfx()
	if playerStatus then
		local sanityType = playerStatus.sanityState

		if sanityType and type(sanityType) == "number" then
			SystemHelper.LogError(string.format("ResetSanityVfx: %d", sanityType))

			local scene = sceneController:GetScene()

			if scene ~= nil then
				if LS_Setting.graphics.vignette > 0 then
					scene:SetSanityEffects(sanityType)
				else
					scene:SetSanityEffects(AnimalBase_Define.SanType.Normal)
				end

				if sanityType == AnimalBase_Define.SanType.Normal then
					MainmenuCtrl.SetSanCameraVfx(false)
					this.SetStatusDisabled(playerStatus.animalId, 90001)
				elseif sanityType == AnimalBase_Define.SanType.Unusual then
					MainmenuCtrl.SetSanCameraVfx(true)
					this.SetStatusEnabled(playerStatus.animalId, 90001, 1, true)
					uiPanelMessage.sanityAbnormal.tween:Start()
				elseif sanityType == AnimalBase_Define.SanType.Crazy then
					MainmenuCtrl.SetSanCameraVfx(true)
					this.SetStatusEnabled(playerStatus.animalId, 90001, 1, true)
					uiPanelMessage.sanityBreakdown.tween:Start()
				elseif sanityType == AnimalBase_Define.SanType.Special then
					MainmenuCtrl.SetSanCameraVfx(true)
					uiPanelMessage.sanityBreakdown.tween:Start()
				end
			end
		end
	end
end

function MainmenuCtrl.ResetSkillButtonStates()
	for i = 1, 6 do
		local btn = skillBtn[i]

		if btn ~= nil then
			btn:SetNormal(true)
		end
	end
end

function MainmenuCtrl.FadeIn(duration, noMask)
	if panelRoot and panelRoot.twFadeIn and panelRoot.twFadeOut and (not noMask or true) then
		if panelRoot.isFadingInOut < 0 then
			panelRoot.twFadeOut:Stop()

			panelRoot.isFadingInOut = 0
		elseif panelRoot.isFadingInOut > 0 then
			panelRoot.twFadeIn:Stop()

			panelRoot.isFadingInOut = 0
		end

		if panelRoot.isFadingInOut == 0 then
			local tbl = {
				alpha = 1
			}

			if duration == nil or type(duration) ~= "number" then
				duration = 0.7
			end

			if not noMask and UILayerCtrl.GetCurrentLayerName() == "UIOff" then
				UILayerCtrl.Pop()
			end

			panelRoot.isInteractive = true

			MainmenuCtrl.SetInteractive(true)

			panelRoot.show = true

			if duration > 0 then
				panelRoot.cg.alpha = 0
				panelRoot.isFadingInOut = 1

				panelRoot.twFadeIn:MoveTo(tbl, duration)
				panelRoot.twFadeIn:Start()
			else
				panelRoot.cg.alpha = 1
				panelRoot.isFadingInOut = 0

				this.ShowTouchUI(not LS_Setting.isJoystickConnected and not LS_Setting.isKeyboardConnected and not LS_Setting.isMouseConnected)
			end
		end

		this.ResetSkillButtonStates()
	end
end

function MainmenuCtrl.FadeOut(duration, noMask)
	if panelRoot and panelRoot.twFadeIn and panelRoot.twFadeOut and (not noMask or true) then
		if panelRoot.isFadingInOut < 0 then
			panelRoot.twFadeOut:Stop()

			panelRoot.isFadingInOut = 0
		elseif panelRoot.isFadingInOut > 0 then
			panelRoot.twFadeIn:Stop()

			panelRoot.isFadingInOut = 0
		end

		if panelRoot.isFadingInOut == 0 then
			local tbl = {
				alpha = 0
			}

			if duration == nil or type(duration) ~= "number" then
				duration = 0.7
			end

			if not noMask then
				UILayerCtrl.Push("UIOff")
			end

			panelRoot.isInteractive = false

			MainmenuCtrl.SetInteractive(false)

			panelRoot.show = false

			if duration > 0 then
				panelRoot.cg.alpha = 1
				panelRoot.isFadingInOut = -1

				panelRoot.twFadeOut:MoveTo(tbl, duration)
				panelRoot.twFadeOut:Start()
			else
				panelRoot.cg.alpha = 0
				panelRoot.isFadingInOut = 0

				this.ShowTouchUI(false)
			end
		end

		this.ResetSkillButtonStates()
	end
end

function MainmenuCtrl.SetInteractive(val)
	if panelRoot and panelRoot.blocksRaycasts ~= val then
		panelRoot.blocksRaycasts = val
		panelRoot.cg.blocksRaycasts = val
	end
end

function MainmenuCtrl.SetSpEventReady()
	if playerStatus and playerStatus.btnReserved then
		local btnReserved = playerStatus.btnReserved

		if btnReserved then
			btnReserved.count = 0
			btnReserved.show = true

			btnReserved.btn.gameObject:SetActive(true)

			if AppVer == AppDevVer then
				btnReserved.showText = true

				btnReserved.text.gameObject:SetActive(true)
			end
		end
	end
end

function MainmenuCtrl.SetSpEventCB(cb, duration, count)
	if playerStatus and playerStatus.btnReserved then
		playerStatus.btnReserved.cb = cb
		playerStatus.btnReserved.time = duration
		playerStatus.btnReserved.countMax = count
	end
end

function MainmenuCtrl.ResetSpEvent(clearCB)
	if playerStatus and playerStatus.btnReserved then
		local btnReserved = playerStatus.btnReserved

		if btnReserved then
			btnReserved.count = 0
			btnReserved.show = false

			btnReserved.btn.gameObject:SetActive(false)

			if AppVer == AppDevVer then
				btnReserved.showText = false

				btnReserved.text.gameObject:SetActive(false)
			end

			if clearCB then
				playerStatus.btnReserved.cb = nil
			end
		end
	end
end

function MainmenuCtrl.ShowChallengeResult(success, time, perfect)
	if panelChangeResult.go.activeSelf then
		return
	end

	if sceneController ~= nil then
		sceneController:SetMoveDirection(Vector2.s_zero, false)
		sceneController:GPadRelease()
	end

	UILayerCtrl.Push("PanelChallengeResult", "Panel_SubGroup_Panel_ChallengeResult_BG_Back")
	inputMgr:SetPointerLocked(false)
	inputMgr:SetInMenuMode()
	panelChangeResult.go:SetActive(true)

	if success then
		local perfectValue = 0

		if perfect then
			perfectValue = 1

			panelChangeResult.perfectFlag:SetActive(true)
		else
			perfectValue = 0

			panelChangeResult.perfectFlag:SetActive(false)
		end

		panelChangeResult.successGroup:SetActive(true)
		panelChangeResult.failedGroup:SetActive(false)

		time = math.floor(time * 100) / 100

		local playTime = TimeHelper.getTimeSpan(time)

		if time > 3599.9 then
			panelChangeResult.TimeText:SetContent(">60")
			panelChangeResult.CSTimeText:SetContent("")
		else
			panelChangeResult.TimeText:SetContent(playTime.Minutes .. ":" .. playTime.Seconds)
			panelChangeResult.CSTimeText:SetContent("." .. playTime.Centiseconds)
		end

		local currentHeroId = BattleData.GetHeroId()
		local fastHeroId = FS_UserData.challenge:GetFastChallengeRecordHeroId(FS_UserData.story:GetChallengeLevel(), FS_UserData.story:GetChallengeMonsterId())
		local fastRecord = FS_UserData.challenge:GetChallengeRecord(FS_UserData.story:GetChallengeLevel(), fastHeroId, FS_UserData.story:GetChallengeMonsterId())
		local thisHeroFastRecord = FS_UserData.challenge:GetChallengeRecord(FS_UserData.story:GetChallengeLevel(), currentHeroId, FS_UserData.story:GetChallengeMonsterId())

		panelChangeResult.newRecordTextGO:SetActive(false)

		if fastRecord then
			if time > fastRecord.time then
				local sprite = XObjectPool.GetIcon("photo" .. fastHeroId)

				panelChangeResult.historyHeroIcon:SetSprite(sprite)
				panelChangeResult.historyFastText:SetColor(1, 1, 1, 1)
				panelChangeResult.historyFastCSText:SetColor(1, 1, 1, 1)

				local hisTime = TimeHelper.getTimeSpan(fastRecord.time)

				if fastRecord.time > 3599.9 then
					panelChangeResult.historyFastText:SetContent(">60")
					panelChangeResult.historyFastCSText:SetContent("")
				else
					panelChangeResult.historyFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
					panelChangeResult.historyFastCSText:SetContent("." .. hisTime.Centiseconds)
				end

				panelChangeResult.historyFastFlag:SetActive(false)
			elseif fastRecord.perfect == 0 and perfectValue == 1 or time < fastRecord.time then
				local sprite = XObjectPool.GetIcon("photo" .. currentHeroId)

				panelChangeResult.historyHeroIcon:SetSprite(sprite)
				panelChangeResult.historyFastText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)
				panelChangeResult.historyFastCSText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)

				local hisTime = TimeHelper.getTimeSpan(time)

				if time > 3599.9 then
					panelChangeResult.historyFastText:SetContent(">60")
					panelChangeResult.historyFastCSText:SetContent("")
				else
					panelChangeResult.historyFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
					panelChangeResult.historyFastCSText:SetContent("." .. hisTime.Centiseconds)
				end

				panelChangeResult.historyFastFlag:SetActive(true)
				panelChangeResult.newRecordTextGO:SetActive(true)
			else
				local sprite = XObjectPool.GetIcon("photo" .. fastHeroId)

				panelChangeResult.historyHeroIcon:SetSprite(sprite)
				panelChangeResult.historyFastText:SetColor(1, 1, 1, 1)
				panelChangeResult.historyFastCSText:SetColor(1, 1, 1, 1)

				local hisTime = TimeHelper.getTimeSpan(fastRecord.time)

				if fastRecord.time > 3599.9 then
					panelChangeResult.historyFastText:SetContent(">60")
					panelChangeResult.historyFastCSText:SetContent("")
				else
					panelChangeResult.historyFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
					panelChangeResult.historyFastCSText:SetContent("." .. hisTime.Centiseconds)
				end

				panelChangeResult.historyFastFlag:SetActive(false)
			end
		else
			local sprite = XObjectPool.GetIcon("photo" .. currentHeroId)

			panelChangeResult.historyHeroIcon:SetSprite(sprite)
			panelChangeResult.historyFastText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)
			panelChangeResult.historyFastCSText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)

			local hisTime = TimeHelper.getTimeSpan(time)

			if time > 3599.9 then
				panelChangeResult.historyFastText:SetContent(">60")
				panelChangeResult.historyFastCSText:SetContent("")
			else
				panelChangeResult.historyFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
				panelChangeResult.historyFastCSText:SetContent("." .. hisTime.Centiseconds)
			end

			panelChangeResult.historyFastFlag:SetActive(true)
			panelChangeResult.newRecordTextGO:SetActive(true)
		end

		if thisHeroFastRecord then
			if time > thisHeroFastRecord.time then
				local sprite = XObjectPool.GetIcon("photo" .. currentHeroId)

				panelChangeResult.currentHeroIcon:SetSprite(sprite)
				panelChangeResult.currentFastText:SetColor(1, 1, 1, 1)
				panelChangeResult.currentFastCSText:SetColor(1, 1, 1, 1)

				local hisTime = TimeHelper.getTimeSpan(thisHeroFastRecord.time)

				if thisHeroFastRecord.time > 3599.9 then
					panelChangeResult.currentFastText:SetContent(">60")
					panelChangeResult.currentFastCSText:SetContent("")
				else
					panelChangeResult.currentFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
					panelChangeResult.currentFastCSText:SetContent("." .. hisTime.Centiseconds)
				end

				panelChangeResult.currentFastFlag:SetActive(false)
			elseif thisHeroFastRecord.perfect == 0 and perfectValue == 1 or time < thisHeroFastRecord.time then
				local sprite = XObjectPool.GetIcon("photo" .. currentHeroId)

				panelChangeResult.currentHeroIcon:SetSprite(sprite)
				panelChangeResult.currentFastText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)
				panelChangeResult.currentFastCSText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)

				local hisTime = TimeHelper.getTimeSpan(time)

				if time > 3599.9 then
					panelChangeResult.currentFastText:SetContent(">60")
					panelChangeResult.currentFastCSText:SetContent("")
				else
					panelChangeResult.currentFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
					panelChangeResult.currentFastCSText:SetContent("." .. hisTime.Centiseconds)
				end

				panelChangeResult.currentFastFlag:SetActive(true)
				panelChangeResult.newRecordTextGO:SetActive(true)
			else
				local sprite = XObjectPool.GetIcon("photo" .. currentHeroId)

				panelChangeResult.currentHeroIcon:SetSprite(sprite)
				panelChangeResult.currentFastText:SetColor(1, 1, 1, 1)
				panelChangeResult.currentFastCSText:SetColor(1, 1, 1, 1)

				local hisTime = TimeHelper.getTimeSpan(thisHeroFastRecord.time)

				if thisHeroFastRecord.time > 3599.9 then
					panelChangeResult.currentFastText:SetContent(">60")
					panelChangeResult.currentFastCSText:SetContent("")
				else
					panelChangeResult.currentFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
					panelChangeResult.currentFastCSText:SetContent("." .. hisTime.Centiseconds)
				end

				panelChangeResult.currentFastFlag:SetActive(false)
			end

			FS_UserData.challenge:SetChallengeRecord(FS_UserData.story:GetChallengeLevel(), BattleData.GetHeroId(), FS_UserData.story:GetChallengeMonsterId(), time, perfectValue)
		else
			local sprite = XObjectPool.GetIcon("photo" .. currentHeroId)

			panelChangeResult.currentHeroIcon:SetSprite(sprite)
			panelChangeResult.currentFastText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)
			panelChangeResult.currentFastCSText:SetColor(0.8509803921568627, 0.7294117647058823, 0.4980392156862745, 1)

			local hisTime = TimeHelper.getTimeSpan(time)

			if time > 3599.9 then
				panelChangeResult.currentFastText:SetContent(">60")
				panelChangeResult.currentFastCSText:SetContent("")
			else
				panelChangeResult.currentFastText:SetContent(hisTime.Minutes .. ":" .. hisTime.Seconds)
				panelChangeResult.currentFastCSText:SetContent("." .. hisTime.Centiseconds)
			end

			panelChangeResult.currentFastFlag:SetActive(true)
			panelChangeResult.newRecordTextGO:SetActive(true)
			FS_UserData.challenge:SetChallengeRecord(FS_UserData.story:GetChallengeLevel(), BattleData.GetHeroId(), FS_UserData.story:GetChallengeMonsterId(), time, perfectValue)
		end

		FS_UserData.challenge:SetBossPerfect(FS_UserData.story:GetChallengeLevel(), FS_UserData.story:GetChallengeMonsterId(), perfectValue)
		FS_UserData.challenge:SetRankInfo(FS_UserData.story:GetChallengeLevel(), FS_UserData.story:GetChallengeMonsterId())

		if FS_UserData.story:GetChallengeMonsterId() == 10006 and BattleData.GetHeroId() ~= 10001 then
			FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.killTerrsaWithOtherHero)
		end

		FS_UserData.challenge:CheckAchievement()
	else
		panelChangeResult.successGroup:SetActive(false)
		panelChangeResult.failedGroup:SetActive(true)
	end
end

function MainmenuCtrl.ShowRecordTime(time)
	local hisTime = TimeHelper.getTimeSpan(time)

	if time > 356400 then
		timeRecord.time:SetContent(">99:00:00")
	else
		timeRecord.time:SetContent(hisTime.Hours .. ":" .. hisTime.Minutes .. ":" .. hisTime.Seconds)
	end
end

function MainmenuCtrl.ShowRecordScore(score)
	scoreRecord.score:SetContent(score)

	local currentStoryId = FS_UserData.story:GetStoryId()
	local rankValue = FS_UserData.story:GetArcadeRankValue(currentStoryId, true)

	MainmenuCtrl.SetNumberFont(scoreRecord.score, rankValue)

	if scoreRecord.scoreYellowBG.activeSelf == false and rankValue == FS_SaveStory.ArcadeRankValueType.Yellow then
		scoreRecord.scoreYellowBG:SetActive(false)
		scoreRecord.scoreYellowBG:SetActive(true)
		scoreRecord.scoreRedBG:SetActive(false)
		scoreRecord.score.gameObject:SetActive(false)
		scoreRecord.score.gameObject:SetActive(true)
	end

	if scoreRecord.scoreRedBG.activeSelf == false and rankValue == FS_SaveStory.ArcadeRankValueType.Red then
		scoreRecord.scoreYellowBG:SetActive(false)
		scoreRecord.scoreRedBG:SetActive(false)
		scoreRecord.scoreRedBG:SetActive(true)
		scoreRecord.score.gameObject:SetActive(false)
		scoreRecord.score.gameObject:SetActive(true)
	end

	if rankValue == FS_SaveStory.ArcadeRankValueType.White then
		scoreRecord.scoreYellowBG:SetActive(false)
		scoreRecord.scoreRedBG:SetActive(false)
	end
end

function MainmenuCtrl.ShowRecordUpdateTime(time)
	if LS_Setting.showTimeAndScore == 0 then
		return
	end

	timeRecord.timeUpdateText:SetContent("-" .. time .. "s")
	timeRecord.timeUpdateGo:SetActive(false)
	timeRecord.timeUpdateGo:SetActive(true)
end

function MainmenuCtrl.ShowRecordUpdateScore(score)
	if LS_Setting.showTimeAndScore == 0 then
		return
	end

	scoreRecord.scoreUpdateText:SetContent("+" .. score)
	scoreRecord.scoreUpdateGo:SetActive(false)
	scoreRecord.scoreUpdateGo:SetActive(true)

	local currentStoryId = FS_UserData.story:GetStoryId()
	local rankValue = FS_UserData.story:GetArcadeRankValue(currentStoryId, true)

	MainmenuCtrl.SetNumberFont(scoreRecord.scoreUpdateText, rankValue)
end

function MainmenuCtrl.SetNumberFont(textCom, times)
	local font

	if times == FS_SaveStory.ArcadeRankValueType.White then
		font = UIManager.GetFont("4")
	elseif times == FS_SaveStory.ArcadeRankValueType.Yellow then
		font = UIManager.GetFont("3")
	elseif times == FS_SaveStory.ArcadeRankValueType.Red then
		font = UIManager.GetFont("5")
	end

	if font then
		textCom:SetFont(font)
	end
end

function MainmenuCtrl.SetTimeRecordVisible(bool)
	timeRecord.bIsShow = bool

	timeRecord.go:SetActive(bool and LS_Setting.showTimeAndScore == 1)
	scoreRecord.go:SetActive(bool and LS_Setting.showTimeAndScore == 1)
end

function MainmenuCtrl.RefreshTimeRecordVisible()
	MainmenuCtrl.SetTimeRecordVisible(timeRecord.bIsShow)
end

function MainmenuCtrl.ShowArcadeResultAnim()
	panelArcadeResult.BG:SetActive(false)
	panelArcadeResult.BG:SetActive(true)

	local currentHeroId = BattleData.GetHeroId()
	local currentStoryId = FS_UserData.story:GetStoryId()
	local time = FS_UserData.story:GetStageTime(currentStoryId, currentHeroId)
	local thisStageKillScore = FS_UserData.story:GetStageScore(currentStoryId)
	local TotalScore = FS_UserData.arcade:GetOneStageScore(currentStoryId, time, thisStageKillScore, panelArcadeResult.rankValue)
	local TimeScore = FS_UserData.arcade:GetOneStageTimeScore(currentStoryId, time)

	panelArcadeResult.totalScore:SetContent(TimeScore)
	AudioCtrl.SetUIAudio("score_settlement")

	if panelArcadeResult.panelArcadeResultTotalScoreTimer == nil then
		panelArcadeResult.panelArcadeResultTotalScoreTimer = Timer.New(function()
			panelArcadeResult.totalScore:SetContentAnimCustom(TotalScore, 0.05, 30)
		end, 4, 1, true)
	else
		panelArcadeResult.panelArcadeResultTotalScoreTimer:Reset(function()
			panelArcadeResult.totalScore:SetContentAnimCustom(TotalScore, 0.05, 30)
		end, 4, 1, true)
	end

	panelArcadeResult.panelArcadeResultTotalScoreTimer:Start()
end

function MainmenuCtrl.ShowArcadeResult()
	if panelArcadeResult.go.activeSelf then
		return
	end

	if not FS_UserData.story:IsSelectStageGameOver() then
		return
	end

	if sceneController ~= nil then
		sceneController:SetMoveDirection(Vector2.s_zero, false)
		sceneController:GPadRelease()
	end

	UILayerCtrl.Push("PanelArcadeResult", "Panel_SubGroup_Panel_ArcadeResult_BG_Back")
	inputMgr:SetPointerLocked(false)
	inputMgr:SetInMenuMode()
	panelArcadeResult.go:SetActive(true)

	local currentHeroId = BattleData.GetHeroId()
	local currentLevel = FS_UserData.story:GetDifficulty()

	if currentLevel == 1 then
		panelArcadeResult.LevelModeText:SetContent(GameText.UI_COMMON_GAMEMODE_CASUAL)
	elseif currentLevel == 2 then
		panelArcadeResult.LevelModeText:SetContent(GameText.UI_COMMON_GAMEMODE_NORMAL)
	elseif currentLevel == 3 then
		panelArcadeResult.LevelModeText:SetContent(GameText.UI_COMMON_GAMEMODE_HARDCORE)
	end

	local currentStoryId = FS_UserData.story:GetStoryId()
	local time = FS_UserData.story:GetStageTime(currentStoryId, currentHeroId)
	local thisStageTime = TimeHelper.getTimeSpan(time)
	local thisStageKillScore = FS_UserData.story:GetStageScore(currentStoryId)

	panelArcadeResult.rankValue = FS_UserData.story:GetArcadeRankValue(currentStoryId)

	local TotalScore = FS_UserData.arcade:GetOneStageScore(currentStoryId, time, thisStageKillScore, panelArcadeResult.rankValue)
	local TimeScore = FS_UserData.arcade:GetOneStageTimeScore(currentStoryId, time)
	local killCount = FS_UserData.story:GetArcadeMonsterDeadCount(currentStoryId)

	Common.LogError("killcount" .. killCount)

	local heroData = MS_HeroData.GetHero(currentHeroId)

	if heroData ~= nil then
		panelArcadeResult.heroName:SetContent(heroData.Name)
	end

	local heroSkinId = BattleData.ConvertHeroIdWithSkin(currentHeroId)
	local sprite = XObjectPool.GetIcon("arcadePortrait" .. heroSkinId)

	panelArcadeResult.heroPortrait:SetSprite(sprite)

	if currentStoryId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
		panelArcadeResult.stageName:SetContent(GameText["UI_ARCADE_STORY_NAME_" .. FS_SaveStory.ArcadeStoryIdMax])
	else
		panelArcadeResult.stageName:SetContent(GameText["UI_ARCADE_STORY_NAME_" .. currentStoryId])
	end

	local retABCS = FS_UserData.arcade:GetTotalScoreLevel(TotalScore, currentStoryId, FS_UserData.story:GetArcadePatternForScore())

	panelArcadeResult.totalScoreABCStar:SetActive(false)

	if retABCS then
		local spriteABCS = XObjectPool.GetIcon("arcade_score_" .. retABCS)

		panelArcadeResult.totalScoreABCS.gameObject:SetActive(true)
		panelArcadeResult.totalScoreABCS:SetSprite(spriteABCS)

		if retABCS == "s" then
			panelArcadeResult.totalScoreABCStar:SetActive(true)
		end
	else
		panelArcadeResult.totalScoreABCS.gameObject:SetActive(false)
	end

	local retABCSPoint = MainmenuCtrl.GetArcadeScoreLevelPoint(retABCS)
	local totalABCSPoint = 1
	local nickname = LS_Account.GetNickname()

	if nickname ~= nil and string.len(nickname) > 0 then
		panelArcadeResult.PlayerId:SetContent(nickname)
	else
		panelArcadeResult.PlayerId:SetContent(LS_Account.userId)
	end

	MainmenuCtrl.SetNumberFont(panelArcadeResult.totalScore, panelArcadeResult.rankValue)
	MainmenuCtrl.SetNumberFont(panelArcadeResult.totalScoreSmall, panelArcadeResult.rankValue)
	panelArcadeResult.totalScoreSmall:SetContent(TotalScore)
	panelArcadeResult.killScore:SetContent(thisStageKillScore)
	panelArcadeResult.killCount:SetContent(killCount)
	panelArcadeResult.KillCountTimes:SetContent("×" .. panelArcadeResult.rankValue)

	if time > 356400 then
		panelArcadeResult.time:SetContent(">99")
		panelArcadeResult.timePre:SetContent(">99")
	else
		panelArcadeResult.time:SetContent(thisStageTime.Hours .. ":" .. thisStageTime.Minutes .. ":" .. thisStageTime.Seconds)
		panelArcadeResult.timePre:SetContent(thisStageTime.Hours .. ":" .. thisStageTime.Minutes .. ":" .. thisStageTime.Seconds)
	end

	panelArcadeResult.historyTotalGroup:SetActive(false)
	panelArcadeResult.rankCompareText.gameObject:SetActive(false)

	local currentSingleStoryId
	local AllScore = 0
	local AllKillScore = 0
	local AllKillCount = 0

	if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
		if currentStoryId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
			currentStoryId = FS_SaveStory.ArcadeStoryIdMax
		end
	elseif FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.Normal) then
		if currentStoryId == FS_SaveStory.ArcadeStoryIdMax - 1000 then
			local totalABCS = MainmenuCtrl.CheckAllLevelForAchievement()

			totalABCSPoint = MainmenuCtrl.GetArcadeScoreLevelPoint(totalABCS)

			for storyId = 1001, 1007 do
				local _time = FS_UserData.story:GetStageTime(storyId, currentHeroId)
				local _thisStageKillScore = FS_UserData.story:GetStageScore(storyId)
				local _thisStagekillCount = FS_UserData.story:GetArcadeMonsterDeadCount(storyId)
				local rankValue = FS_UserData.story:GetArcadeRankValue(storyId)

				AllScore = AllScore + FS_UserData.arcade:GetOneStageScore(storyId, _time, _thisStageKillScore, rankValue)
				AllKillScore = AllKillScore + _thisStageKillScore
				AllKillCount = AllKillCount + _thisStagekillCount
			end

			local _time8 = FS_UserData.story:GetStageTime(currentStoryId, currentHeroId)
			local _thisStageKillScore8 = FS_UserData.story:GetStageScore(currentStoryId)
			local _thisStagekillCount8 = FS_UserData.story:GetArcadeMonsterDeadCount(currentStoryId)
			local rankValue = FS_UserData.story:GetArcadeRankValue(currentStoryId)

			AllScore = AllScore + FS_UserData.arcade:GetOneStageScore(currentStoryId, _time8, _thisStageKillScore8, rankValue)
			AllKillScore = AllKillScore + _thisStageKillScore8
			AllKillCount = AllKillCount + _thisStagekillCount8
			currentStoryId = FS_SaveStory.ArcadeStoryIdMax
		elseif currentStoryId == 1004 then
			for storyId = 1001, 1005 do
				local _time = FS_UserData.story:GetStageTime(storyId, currentHeroId)
				local _thisStageKillScore = FS_UserData.story:GetStageScore(storyId)
				local _thisStagekillCount = FS_UserData.story:GetArcadeMonsterDeadCount(storyId)
				local rankValue = FS_UserData.story:GetArcadeRankValue(storyId)

				AllScore = AllScore + FS_UserData.arcade:GetOneStageScore(storyId, _time, _thisStageKillScore, rankValue)
				AllKillScore = AllKillScore + _thisStageKillScore
				AllKillCount = AllKillCount + _thisStagekillCount
			end
		elseif currentStoryId == 1005 then
			for storyId = 1001, currentStoryId do
				if storyId ~= 1004 then
					local _time = FS_UserData.story:GetStageTime(storyId, currentHeroId)
					local _thisStageKillScore = FS_UserData.story:GetStageScore(storyId)
					local _thisStagekillCount = FS_UserData.story:GetArcadeMonsterDeadCount(storyId)
					local rankValue = FS_UserData.story:GetArcadeRankValue(storyId)

					AllScore = AllScore + FS_UserData.arcade:GetOneStageScore(storyId, _time, _thisStageKillScore, rankValue)
					AllKillScore = AllKillScore + _thisStageKillScore
					AllKillCount = AllKillCount + _thisStagekillCount
				end
			end
		else
			for storyId = 1001, currentStoryId do
				local _time = FS_UserData.story:GetStageTime(storyId, currentHeroId)
				local _thisStageKillScore = FS_UserData.story:GetStageScore(storyId)
				local _thisStagekillCount = FS_UserData.story:GetArcadeMonsterDeadCount(storyId)
				local rankValue = FS_UserData.story:GetArcadeRankValue(storyId)

				AllScore = AllScore + FS_UserData.arcade:GetOneStageScore(storyId, _time, _thisStageKillScore, rankValue)
				AllKillScore = AllKillScore + _thisStageKillScore
				AllKillCount = AllKillCount + _thisStagekillCount
			end
		end

		panelArcadeResult.historyScore:SetContent(AllScore)

		currentStoryId = currentStoryId * 10
		currentSingleStoryId = currentStoryId * 10
	end

	local HighestScoreHeroId = FS_UserData.arcade:GetHighestScoreArcadeRecordHeroId(currentLevel, currentStoryId)

	if MainmenuCtrl.CheckIsValidData(currentStoryId, TotalScore) == false then
		FS_UserData.arcade:CheckAchievement()

		return
	end

	if FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) then
		FS_UserData.arcade:SetArcadeRecord(currentLevel, currentHeroId, currentStoryId, time, thisStageKillScore, TotalScore, killCount, retABCSPoint)
		FS_UserData.arcade:CheckTotalRecord(currentLevel)
		FS_UserData.arcade:SetRankInfo(currentLevel, {
			currentStoryId,
			FS_Arcade.SelectStageTotalStoryId
		})
	else
		local totalTime = FS_UserData.story:GetGameTime()

		FS_UserData.arcade:SetArcadeRecord(currentLevel, currentHeroId, currentStoryId, totalTime, AllKillScore, AllScore, AllKillCount, totalABCSPoint)
		FS_UserData.arcade:SetArcadeRecord(currentLevel, currentHeroId, currentSingleStoryId, time, thisStageKillScore, TotalScore, killCount, retABCSPoint)
		FS_UserData.arcade:SetRankInfo(currentLevel, {
			currentStoryId,
			currentSingleStoryId
		})
	end

	FS_UserData.arcade:CheckAchievement()
end

function MainmenuCtrl.CheckIsValidData(StoryId, TotalScore)
	local hero = sceneController:GetHostPlayer()

	if TotalScore >= 32000 then
		return false
	end

	if hero ~= nil then
		local pyDamage = hero.animalValue:GetProperty(MS_HeroData.Property.PhysicDamage)

		if pyDamage > 242 then
			return false
		end
	end

	return true
end

function MainmenuCtrl.GetRankCompareCB(percent)
	panelArcadeResult.rankCompareText.gameObject:SetActive(true)

	local percentStr = math.floor(percent * 100) .. "%%"
	local retStr = string.gsub(GameText.UI_ARCADE_RESULT_RANK_COMPARE, "{0}", percentStr)

	panelArcadeResult.rankCompareText:SetContent(retStr)
end

function MainmenuCtrl.CheckAllLevelForAchievement()
	local currentHeroId = BattleData.GetHeroId()
	local pattern = FS_UserData.story:GetArcadePatternForScore()
	local TotalLevel = 0

	for storyId = 1001, 1007 do
		local _time = FS_UserData.story:GetStageTime(storyId, currentHeroId)
		local _thisStageKillScore = FS_UserData.story:GetStageScore(storyId)
		local rankValue = FS_UserData.story:GetArcadeRankValue(storyId)
		local totalScore = FS_UserData.arcade:GetOneStageScore(storyId, _time, _thisStageKillScore, rankValue)
		local retABCS = FS_UserData.arcade:GetTotalScoreLevel(totalScore, storyId, pattern)

		if retABCS == "s" then
			TotalLevel = TotalLevel + 4
		elseif retABCS == "a" then
			TotalLevel = TotalLevel + 3
		elseif retABCS == "b" then
			TotalLevel = TotalLevel + 2
		elseif retABCS == "c" then
			TotalLevel = TotalLevel + 1
		end

		local spriteABCS = XObjectPool.GetIcon("arcade_score_" .. retABCS)

		panelArcadeResult.ScoreEachABCS[storyId - 1000]:SetSprite(spriteABCS)
		panelArcadeResult.ScoreEachABCStar[storyId - 1000]:SetActive(retABCS == "s")
	end

	local _time = FS_UserData.story:GetStageTime(8, currentHeroId)
	local _thisStageKillScore = FS_UserData.story:GetStageScore(8)
	local rankValue = FS_UserData.story:GetArcadeRankValue(8)
	local totalScore = FS_UserData.arcade:GetOneStageScore(8, _time, _thisStageKillScore, rankValue)
	local retABCS = FS_UserData.arcade:GetTotalScoreLevel(totalScore, 8, pattern)

	if retABCS == "s" then
		TotalLevel = TotalLevel + 4
	elseif retABCS == "a" then
		TotalLevel = TotalLevel + 3
	elseif retABCS == "b" then
		TotalLevel = TotalLevel + 2
	elseif retABCS == "c" then
		TotalLevel = TotalLevel + 1
	end

	local spriteABCS = XObjectPool.GetIcon("arcade_score_" .. retABCS)

	panelArcadeResult.ScoreEachABCS[8]:SetSprite(spriteABCS)
	panelArcadeResult.ScoreEachABCStar[8]:SetActive(retABCS == "s")

	local TotalLevelAverage = TotalLevel / 8
	local retTotalLevel

	if TotalLevelAverage >= 4 then
		retTotalLevel = "s"

		if pattern == 3 then
			FS_UserData.achievement:AddAchievementValue(MS_Achievement.AchievementIdType.GetAllSInArcadeNormal)
		end
	else
		retTotalLevel = TotalLevelAverage >= 3 and "a" or TotalLevelAverage >= 2 and "b" or "c"
	end

	local spriteABCSAll = XObjectPool.GetIcon("arcade_score_" .. retTotalLevel)

	panelArcadeResult.ScoreAllABCS:SetSprite(spriteABCSAll)
	panelArcadeResult.ScoreAllABCStar:SetActive(retTotalLevel == "s")

	return retTotalLevel
end

function MainmenuCtrl.GetArcadeScoreLevelPoint(Scorelevel)
	if Scorelevel == "s" then
		return 4
	elseif Scorelevel == "a" then
		return 3
	elseif Scorelevel == "b" then
		return 2
	elseif Scorelevel == "c" then
		return 1
	end

	return 1
end

return MainmenuCtrl
