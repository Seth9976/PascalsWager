-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Setting.lua

require("LuaScript/SDK/SdkHelper")

LS_Setting = class("LS_Setting")

require("LuaScript/StructData/XKeyCode")

if AppVer == AppComReview then
	require("GameData/SettingCfgComReview")
elseif AppVer == AppAppleLight then
	require("GameData/SettingCfgAppleLight")
elseif AppVer == AppTapTapCloudDemo then
	require("GameData/SettingCfgTapTapCloudDemo")
elseif AppVer == AppCJ2020 then
	require("GameData/SettingCfgCJ2020")
elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_TAP_TAP then
	require("GameData/SettingCfgTapTap")
elseif SdkHelper.CHANNEL == LS_Account.CH_ANDROID_GOOGLE_PLAY then
	require("GameData/SettingCfgGooglePlay")
else
	require("GameData/SettingCfg")
end

local KeyCode = UnityEngine.KeyCode

LS_Setting.ignoreLMB = false
LS_Setting.static.designWidth = 1334
LS_Setting.static.designHeight = 750
LS_Setting.static.SlotStatus = {
	PlayTime = 3,
	GameMode = 5,
	RoundCount = 6,
	Location = 1,
	SaveTime = 4,
	Level = 2,
	HeroId = 2
}
LS_Setting.static.maxSaveSlotsForArcade = 10
LS_Setting.static.ArcadeMode = {
	Expert = 3,
	Casual = 1,
	Normal = 2
}
LS_Setting.static.ArcadeAutoSaveSlotIndex = 11

if AppVer == AppTapTapEA then
	LS_Setting.keyName = "easetting"
else
	LS_Setting.keyName = "setting"
end

LS_Setting.keyUserId = "1"
LS_Setting.sound = 100
LS_Setting.bgm = 100
LS_Setting.sfx = 100
LS_Setting.voice = 100
LS_Setting.sensitivity = 70
LS_Setting.lang = Device.getSysLang()

if AppVer == AppCJ2020 then
	LS_Setting.lang = "zhs"
end

LS_Setting.voiceLanguage = "en"
LS_Setting.save = 0
LS_Setting.screenRatio = 178
LS_Setting.screenWidth = SystemHelper.GetScreenWidth()
LS_Setting.screenHeight = SystemHelper.GetScreenHeight()
LS_Setting.previousScreenWidth = 1334
LS_Setting.previousScreenHeight = 750
LS_Setting.fullscreen = 2
LS_Setting.customresolution = 0
LS_Setting.devScreenWidth = UnityEngine.Screen.width
LS_Setting.devScreenHeight = UnityEngine.Screen.height
LS_Setting.graphics = {}
LS_Setting.camera = {}
LS_Setting.static.Difficulty = {
	Normal = 2,
	Casual = 1
}
LS_Setting.static.QualityLevel = {
	Ultra = 4,
	Unknown = 0,
	Low = 1,
	High = 3,
	Medium = 2
}
LS_Setting.static.FrameRateLevel = {
	High = 2,
	Ultra = 3,
	Norm = 1,
	Unlimited = 4
}
LS_Setting.static.FrameRate = {
	30,
	60,
	144,
	-1
}
LS_Setting.static.CameraType = {
	Type1 = 1,
	Type2 = 2
}
LS_Setting.static.ItemData = {
	Value = 3,
	Node = 1,
	Show = 2
}
LS_Setting.static.VoiceLanguage = {
	CN = "cn",
	EN = "en"
}
LS_Setting.static.Anchor = {
	CR = 6,
	BR = 3,
	BC = 2,
	TL = 7,
	CL = 4,
	TR = 9,
	TC = 8,
	BL = 1,
	CC = 5
}
LS_Setting.static.UiName = {
	"SKILL1",
	"SKILL2",
	"SKILL3",
	"SKILL4",
	"SKILL5",
	"SKILL6",
	"LOCKON",
	"ACTION",
	"ITEMS1",
	"ITEMS2",
	"SETTINGS",
	"PLAYERINFO",
	"CHANGEHERO",
	"MOVE",
	"MOVEFIXED"
}
LS_Setting.static.UiBtn = {
	SKILL1 = {
		3,
		-92,
		283,
		100,
		100,
		0.5,
		0.5
	},
	SKILL2 = {
		3,
		-238,
		234,
		100,
		100,
		0.5,
		0.5
	},
	SKILL3 = {
		3,
		-260,
		84,
		100,
		100,
		0.5,
		0.5
	},
	SKILL4 = {
		3,
		-110,
		126,
		100,
		100,
		0.5,
		0.5
	},
	SKILL5 = {
		3,
		-406,
		162,
		100,
		100,
		0.5,
		0.5
	},
	SKILL6 = {
		3,
		-226,
		380,
		100,
		100,
		0.5,
		0.5
	},
	LOCKON = {
		3,
		-376,
		272,
		100,
		100,
		0.5,
		0.5
	},
	ACTION = {
		3,
		-116,
		420,
		80,
		80,
		0.5,
		0.5
	},
	ITEMS1 = {
		2,
		284,
		56,
		88,
		88,
		0.5,
		0.5
	},
	ITEMS2 = {
		2,
		-287,
		55,
		82,
		82,
		0.5,
		0.5
	},
	SETTINGS = {
		7,
		50,
		-50,
		53,
		52,
		0.5,
		0.5
	},
	PLAYERINFO = {
		7,
		133,
		-50,
		43,
		50,
		0.5,
		0.5
	},
	CHANGEHERO = {
		9,
		-80,
		-60,
		94,
		94,
		0.5,
		0.5
	},
	MOVE = {
		1,
		215,
		215,
		430,
		430,
		0.5,
		0.5
	},
	MOVEFIXED = {
		5,
		-37,
		-37,
		201,
		201,
		0.5,
		0.5
	}
}
LS_Setting.graphics.quality = LS_Setting.QualityLevel.Ultra
LS_Setting.graphics.framerate = LS_Setting.FrameRateLevel.High
LS_Setting.graphics.brightness = 25
LS_Setting.graphics.vsync = 0
LS_Setting.graphics.antialiasing = 2
LS_Setting.graphics.reflection = 1
LS_Setting.graphics.ambientocclusion = 1
LS_Setting.graphics.fieldofview = 55
LS_Setting.graphics.vignette = 1
LS_Setting.camera.type = LS_Setting.CameraType.Type1
LS_Setting.camera.horizontal = 1
LS_Setting.camera.vertical = 1
LS_Setting.camera.mouse = 1
LS_Setting.errno = 0
LS_Setting.maxFPS = 60
LS_Setting.difficulty = LS_Setting.Difficulty.Normal
LS_Setting.isJoystickReady = false
LS_Setting.isJoystickConnected = false
LS_Setting.isKeyboardMouseReady = false

if Platform == PlatformType.IOS or Platform == PlatformType.TVOS then
	LS_Setting.isKeyboardConnected = false
	LS_Setting.isMouseConnected = false
elseif Platform == PlatformType.ANDROID then
	LS_Setting.isKeyboardConnected = false
	LS_Setting.isMouseConnected = false
else
	LS_Setting.isKeyboardConnected = true
	LS_Setting.isMouseConnected = true
end

LS_Setting.nickname = ""
LS_Setting.isFirstLaunched = true
LS_Setting.subtitle = 1
LS_Setting.fixedvlj = 0
LS_Setting.touchUiAlpha = 1
LS_Setting.vibration = 1
LS_Setting.showVib = false
LS_Setting.showVibPermanently = false

if Platform == PlatformType.IOS then
	LS_Setting.showVib = false
elseif Platform == PlatformType.TVOS then
	LS_Setting.showVib = false
elseif Platform == PlatformType.MAC then
	LS_Setting.showVib = false
elseif Platform == PlatformType.ANDROID then
	LS_Setting.showVib = false
elseif Platform == PlatformType.PC then
	LS_Setting.showVib = true
else
	LS_Setting.showVib = false
end

if LS_Setting.showVibPermanently == true then
	LS_Setting.showVib = true
end

LS_Setting.numOfInputMethods = 2

if Platform == PlatformType.TVOS then
	LS_Setting.lastSetInput = 3
elseif Platform == PlatformType.IOS then
	LS_Setting.lastSetInput = 2
elseif Platform == PlatformType.ANDROID then
	LS_Setting.lastSetInput = 2
else
	LS_Setting.lastSetInput = 1
end

if AppVer == AppAppleLight then
	LS_Setting.lastSetInput = 3
end

LS_Setting.showTimeAndScore = 1
LS_Setting.skins = {}
LS_Setting.skins.terrence_special = 1
LS_Setting.dbgStageMap = {}

for i = 1, 7 do
	local sId = 100 * i
	local portals = {}

	portals[tostring(sId + 1)] = 1
	portals[tostring(sId + 2)] = 1
	portals[tostring(sId + 3)] = 1

	local site = {
		status = 3,
		portals = portals
	}

	LS_Setting.dbgStageMap[tostring(sId)] = site
end

LS_Setting.dbgStageMap["100"].portals["103"] = nil
LS_Setting.dbgStageMap["200"].portals["203"] = nil
LS_Setting.dbgStageMap["400"].portals["403"] = nil
LS_Setting.dbgStageMap["500"].portals["502"] = nil
LS_Setting.dbgStageMap["500"].portals["503"] = nil
LS_Setting.dbgStageMap["600"].portals["603"] = nil
LS_Setting.dbgStageMap["700"].portals["703"] = nil
LS_Setting.dbgStageMap["99"] = {}
LS_Setting.dbgStageMap["99"].status = 1
LS_Setting.enableCustomInput = true
LS_Setting.enableCustomKMInput = true
LS_Setting.enableCustomTPInput = false
LS_Setting.enableCustomGPInput = true

if AppVer == AppAppleLight then
	LS_Setting.enableCustomInput = false
	LS_Setting.enableCustomKMInput = false
	LS_Setting.enableCustomTPInput = false
	LS_Setting.enableCustomGPInput = false
end

LS_Setting.autoHidingTouchUI = true
LS_Setting.platform = "xb"
LS_Setting.exBtnIco1 = false
LS_Setting.exBtnIco2 = false
LS_Setting.exBtnCbk1 = false
LS_Setting.exBtnCbk2 = false

if AppConst.GamePadType == AppConst.GP_AT_E then
	LS_Setting.exBtnIco1 = false
	LS_Setting.exBtnCbk1 = false
elseif AppConst.GamePadType == AppConst.GP_AT_W then
	LS_Setting.exBtnIco1 = false
	LS_Setting.exBtnCbk1 = false
elseif AppConst.GamePadType == AppConst.GP_PS_E then
	LS_Setting.platform = "ps"
	LS_Setting.exBtnIco1 = true
	LS_Setting.exBtnCbk1 = true
elseif AppConst.GamePadType == AppConst.GP_PS_W then
	LS_Setting.platform = "ps"
	LS_Setting.exBtnIco1 = false
	LS_Setting.exBtnCbk1 = false
elseif AppConst.GamePadType == AppConst.GP_NX then
	LS_Setting.platform = "nx"
	LS_Setting.exBtnIco1 = true
	LS_Setting.exBtnIco2 = true
	LS_Setting.exBtnCbk1 = true
end

LS_Setting.activated = false
LS_Setting.activeTime = -1
LS_Setting.static.maxSaveSlot = 3
LS_Setting.static.IndexAutosave = 4
LS_Setting.lastSlotPlayed = 1
LS_Setting.gameTimes = 0
LS_Setting.lastAnnouncementId = 0
LS_Setting.static.maxArcadeSaveSlot = 10
LS_Setting.static.IndexArcadeAutosave = 11
LS_Setting.lastArcadeSlotPlayed = 1
LS_Setting.todayPlayTime = 0
LS_Setting.todayDate = ""
LS_Setting.lastChallengingLevel = -1
LS_Setting.lastChallengingDifficulty = -1
LS_Setting.saveSlotStatus = {
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	}
}
LS_Setting.saveSlotArcade = {
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	},
	{
		0,
		0,
		0,
		0,
		0,
		1
	}
}
LS_Setting.gpSel = {
	0,
	0,
	0,
	0
}
LS_Setting.static.Btn = {
	L3 = "L3",
	DU = "DU",
	L1 = "L1",
	DL = "DL",
	DD = "DD",
	DR = "DR",
	VY = "ViewY",
	C2 = "C2",
	MY = "MoveY",
	VX = "ViewX",
	C1 = "C1",
	MX = "MoveX",
	BB = "B",
	R3 = "R3",
	BA = "A",
	R2 = "R2",
	BY = "Y",
	L2 = "L2",
	R1 = "R1",
	BX = "X"
}
LS_Setting.OnButtonDownList = {}
LS_Setting.OnButtonList = {}
LS_Setting.OnButtonUpList = {}
LS_Setting.OnAxisList = {}
LS_Setting.OnKeyDownList = {}
LS_Setting.OnKeyList = {}
LS_Setting.OnKeyUpList = {}
LS_Setting.OnMouseAxisList = {}
GPKey = {
	CAM_Y = 1,
	CAM_X = 1,
	MOVEX = LS_Setting.Btn.MX,
	MOVEY = LS_Setting.Btn.MY,
	VIEWX = LS_Setting.Btn.VX,
	VIEWY = LS_Setting.Btn.VY,
	SKILL1 = LS_Setting.Btn.BX,
	SKILL2 = LS_Setting.Btn.R2,
	SKILL3 = LS_Setting.Btn.R1,
	SKILL4 = LS_Setting.Btn.BA,
	SKILL5 = LS_Setting.Btn.BY,
	SKILL6 = LS_Setting.Btn.L3,
	LOCKON = LS_Setting.Btn.R3,
	ACTION = LS_Setting.Btn.BB,
	ITEMS0 = LS_Setting.Btn.L2,
	ITEMS1 = LS_Setting.Btn.DL,
	SETTINGS = LS_Setting.Btn.C1,
	PLAYERINFO = LS_Setting.Btn.C2,
	CHANGEHERO = LS_Setting.Btn.DU
}
KMKey = {
	SKILL1 = XKeyCode.LeftControl,
	SKILL2 = XKeyCode.Mouse1,
	SKILL3 = XKeyCode.Mouse0,
	SKILL4 = XKeyCode.Space,
	SKILL5 = XKeyCode.F,
	SKILL6 = XKeyCode.Alpha0,
	LOCKON = XKeyCode.Mouse2,
	ACTION = XKeyCode.E,
	ITEMS0 = XKeyCode.R,
	ITEMS1 = XKeyCode.Q,
	CHANGEHERO = XKeyCode.G,
	MOVEW = XKeyCode.W,
	MOVES = XKeyCode.S,
	MOVEA = XKeyCode.A,
	MOVED = XKeyCode.D,
	MSLOW = XKeyCode.LeftAlt,
	CAMPU = XKeyCode.UpArrow,
	CAMPD = XKeyCode.DownArrow,
	CAMYL = XKeyCode.LeftArrow,
	CAMYR = XKeyCode.RightArrow,
	MOUSE = XKeyCode.Y,
	LCKPRV = XKeyCode.MousePanL,
	LCKNXT = XKeyCode.MousePanR,
	SETTINGS = XKeyCode.BackQuote,
	PLAYERINFO = XKeyCode.Tab,
	DBGPNL = XKeyCode.F1
}
LS_Setting.static.KMMapDef = {
	SKILL1 = {
		XKeyCode.LeftControl
	},
	SKILL2 = {
		XKeyCode.Mouse1
	},
	SKILL3 = {
		XKeyCode.Mouse0
	},
	SKILL4 = {
		XKeyCode.Space
	},
	SKILL5 = {
		XKeyCode.F
	},
	SKILL6 = {
		XKeyCode.Alpha0
	},
	LOCKON = {
		XKeyCode.Mouse2
	},
	ACTION = {
		XKeyCode.E
	},
	ITEMS0 = {
		XKeyCode.R
	},
	ITEMS1 = {
		XKeyCode.Q
	},
	CHANGEHERO = {
		XKeyCode.G
	},
	MOVEW = {
		XKeyCode.W
	},
	MOVES = {
		XKeyCode.S
	},
	MOVEA = {
		XKeyCode.A
	},
	MOVED = {
		XKeyCode.D
	},
	MSLOW = {
		XKeyCode.LeftAlt
	},
	CAMPU = {
		XKeyCode.UpArrow
	},
	CAMPD = {
		XKeyCode.DownArrow
	},
	CAMYL = {
		XKeyCode.LeftArrow
	},
	CAMYR = {
		XKeyCode.RightArrow
	},
	MOUSE = {
		XKeyCode.Y
	},
	LCKPRV = {
		XKeyCode.MousePanL
	},
	LCKNXT = {
		XKeyCode.MousePanR
	},
	PLAYERINFO = {
		XKeyCode.Tab
	}
}
GBKey = {
	A = LS_Setting.Btn.BA,
	B = LS_Setting.Btn.BB,
	X = LS_Setting.Btn.BX,
	Y = LS_Setting.Btn.BY
}

if LS_Setting.exBtnCbk1 then
	GBKey = {
		A = LS_Setting.Btn.BB,
		B = LS_Setting.Btn.BA
	}
end

if LS_Setting.exBtnCbk2 then
	GBKey = {
		X = LS_Setting.Btn.BY,
		Y = LS_Setting.Btn.BX
	}
end

LS_Setting.static.InputMode = {
	KM = 1,
	TP = 2,
	GP = 3
}
LS_Setting.static.InputAvailable = {
	LS_Setting.enableCustomKMInput,
	LS_Setting.enableCustomTPInput,
	LS_Setting.enableCustomGPInput
}
LS_Setting.static.InputProfileDefault = {
	2,
	4,
	2
}
LS_Setting.static.InputProfileIndex = {
	Count = 1,
	Current = 2
}
LS_Setting.kmCfg = {}
LS_Setting.gpCfg = {}
LS_Setting.inputSelect = {
	{
		1,
		1
	},
	{
		3,
		1
	},
	{
		1,
		1
	}
}
LS_Setting.inputConfig = {
	{
		{},
		{
			SKILL1 = {
				XKeyCode.LeftControl
			},
			SKILL2 = {
				XKeyCode.Mouse1
			},
			SKILL3 = {
				XKeyCode.Mouse0
			},
			SKILL4 = {
				XKeyCode.Space
			},
			SKILL5 = {
				XKeyCode.F
			},
			SKILL6 = {
				XKeyCode.Alpha0
			},
			LOCKON = {
				XKeyCode.Mouse2
			},
			ACTION = {
				XKeyCode.E
			},
			ITEMS0 = {
				XKeyCode.R
			},
			ITEMS1 = {
				XKeyCode.Q
			},
			CHANGEHERO = {
				XKeyCode.G
			},
			MOVEW = {
				XKeyCode.W
			},
			MOVES = {
				XKeyCode.S
			},
			MOVEA = {
				XKeyCode.A
			},
			MOVED = {
				XKeyCode.D
			},
			MSLOW = {
				XKeyCode.LeftShift
			},
			CAMPU = {
				XKeyCode.UpArrow
			},
			CAMPD = {
				XKeyCode.DownArrow
			},
			CAMYL = {
				XKeyCode.LeftArrow
			},
			CAMYR = {
				XKeyCode.RightArrow
			},
			MOUSE = {
				XKeyCode.Y
			},
			LCKPRV = {
				XKeyCode.MousePanL
			},
			LCKNXT = {
				XKeyCode.MousePanR
			},
			PLAYERINFO = {
				XKeyCode.Tab
			}
		}
	},
	{
		{},
		{},
		{},
		{}
	},
	{
		{},
		{
			CAM_X = {
				1
			},
			CAM_Y = {
				1
			},
			SKILL3 = {
				LS_Setting.Btn.R1
			},
			SKILL2 = {
				LS_Setting.Btn.R2
			},
			SKILL1 = {
				LS_Setting.Btn.BX
			},
			SKILL5 = {
				LS_Setting.Btn.BY
			},
			SKILL4 = {
				LS_Setting.Btn.BA
			},
			ACTION = {
				LS_Setting.Btn.BB
			},
			LOCKON = {
				LS_Setting.Btn.R3
			},
			CHANGEHERO = {
				LS_Setting.Btn.DU
			},
			ITEMS1 = {
				LS_Setting.Btn.DL
			},
			ITEMS0 = {
				LS_Setting.Btn.L2
			},
			PLAYERINFO = {
				LS_Setting.Btn.C2
			}
		}
	}
}
LS_Setting.static.GPItems = {
	"SKILL3",
	"SKILL2",
	"SKILL1",
	"SKILL5",
	"SKILL4",
	"ACTION",
	"LOCKON",
	"CHANGEHERO",
	"ITEMS1",
	"ITEMS0"
}
LS_Setting.static.KMItems = {
	"PLAYERINFO",
	"MOVEW",
	"MOVES",
	"MOVEA",
	"MOVED",
	"MSLOW",
	"SKILL3",
	"SKILL2",
	"SKILL1",
	"SKILL5",
	"SKILL4",
	"ACTION",
	"LOCKON",
	"CHANGEHERO",
	"ITEMS1",
	"ITEMS0",
	"CAMPU",
	"CAMPD",
	"CAMYL",
	"CAMYR",
	"MOUSE",
	"LCKPRV",
	"LCKNXT"
}
LS_Setting.static.KMIndex = {
	LOCKON = 13,
	SKILL1 = 9,
	CAMYL = 19,
	SKILL4 = 11,
	ITEMS0 = 16,
	MSLOW = 6,
	PLAYERINFO = 1,
	MOUSE = 21,
	CAMYR = 20,
	ITEMS1 = 15,
	CAMPD = 18,
	LCKNXT = 23,
	MOVEA = 4,
	LCKPRV = 22,
	CHANGEHERO = 14,
	CAMPU = 17,
	MOVEW = 2,
	SKILL2 = 8,
	SKILL5 = 10,
	ACTION = 12,
	MOVES = 3,
	SKILL3 = 7,
	MOVED = 5
}
LS_Setting.static.GPDItems = {
	R3 = "LOCKON",
	A = "SKILL4",
	L1 = "",
	Y = "SKILL5",
	DL = "ITEMS1",
	DU = "CHANGEHERO",
	X = "SKILL1",
	DR = "",
	L3 = "",
	R2 = "SKILL2",
	L2 = "ITEMS0",
	R1 = "SKILL3",
	DD = "",
	B = "ACTION"
}
LS_Setting.resulotions = {}
LS_Setting.resulotionIdx = 0
LS_Setting.resulotionCnt = 0

function LS_Setting.InitDeviceResolutions()
	local count = Device.GetResolutionCount()

	if count > 0 then
		LS_Setting.resulotionIdx = -1
		LS_Setting.resulotionCnt = count
		LS_Setting.resulotions = {}

		for i = 1, count do
			local res = Device.GetResolution(i - 1)

			LS_Setting.resulotions[i] = {
				res.x,
				res.y
			}
		end

		local fullRes = LS_Setting.resulotions[count]
		local sampleW = fullRes[1]
		local sampleH = fullRes[2]

		if sampleH < sampleW then
			for i = count, 1, -1 do
				fullRes = LS_Setting.resulotions[i]
				sampleW = fullRes[1]
				sampleH = fullRes[2]

				if sampleH <= LS_Setting.screenHeight then
					LS_Setting.resulotionIdx = i

					break
				end
			end
		else
			for i = count, 1, -1 do
				fullRes = LS_Setting.resulotions[i]
				sampleW = fullRes[1]
				sampleH = fullRes[2]

				if sampleW <= LS_Setting.screenWidth then
					LS_Setting.resulotionIdx = i

					break
				end
			end
		end

		if LS_Setting.resulotionIdx < 0 then
			LS_Setting.resulotionIdx = count
		end
	end

	LS_Setting.fullscreen = gameMgr:GetIsFullscreen()
	LS_Setting.devScreenWidth = gameMgr:GetDeviceScreenWidth()
	LS_Setting.devScreenHeight = gameMgr:GetDeviceScreenHeight()
end

function LS_Setting.IsDeviceFullScreen()
	return UnityEngine.Screen.fullScreen
end

function LS_Setting.GetCurrentResolutionIndex()
	local count = LS_Setting.resulotionCnt
	local currentSelIdx = 0

	LS_Setting.devScreenWidth = gameMgr:GetDeviceScreenWidth()
	LS_Setting.devScreenHeight = gameMgr:GetDeviceScreenHeight()

	local currentScrW = LS_Setting.devScreenWidth
	local currentScrH = LS_Setting.devScreenHeight
	local resData = {}

	for i = 1, count do
		resData = LS_Setting.resulotions[i]

		if currentScrW == resData[1] and currentScrH == resData[2] then
			currentSelIdx = i

			break
		end
	end

	if currentSelIdx < 1 then
		currentSelIdx = count
	end

	local edgeReachedL = false
	local edgeReachedR = false
	local prevIdx = currentSelIdx - 1
	local nextIdx = currentSelIdx + 1

	if prevIdx < 1 then
		prevIdx = 1
		edgeReachedL = true
	end

	if count < nextIdx then
		nextIdx = count
		edgeReachedR = true
	end

	LS_Setting.resulotionIdx = currentSelIdx

	return currentSelIdx, currentScrW, currentScrH, edgeReachedL, edgeReachedR
end

function LS_Setting.GetPrevScrResIndex(isFullScreen)
	local count = LS_Setting.resulotionCnt
	local nextIdx = -1
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = LS_Setting.resulotionIdx - 1

	if nextIdx <= 1 then
		nextIdx = 1
		edgeReachedL = true
	end

	if count < nextIdx + 1 then
		edgeReachedR = true
	end

	LS_Setting.resulotionIdx = nextIdx

	local res = LS_Setting.resulotions[nextIdx]

	return nextIdx, res[1], res[2], edgeReachedL, edgeReachedR
end

function LS_Setting.GetNextScrResIndex(isFullScreen)
	local count = LS_Setting.resulotionCnt
	local nextIdx = -1
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = LS_Setting.resulotionIdx + 1

	if count <= nextIdx then
		nextIdx = count
		edgeReachedR = true
	end

	if nextIdx - 1 <= 1 then
		edgeReachedL = true
	end

	LS_Setting.resulotionIdx = nextIdx

	local res = LS_Setting.resulotions[nextIdx]

	return nextIdx, res[1], res[2], edgeReachedL, edgeReachedR
end

function LS_Setting.GetCurrentGraphicsAntiAliasing()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAntiAliasing
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.antialiasing
	local edgeReachedL = false
	local edgeReachedR = false

	if currIdx - 1 < 0 then
		edgeReachedL = true
	end

	if count <= currIdx + 1 then
		edgeReachedR = true
	end

	local textKey = string.format("UI_GRAPHICS_ANTIALIASING%d", currIdx)

	local function textContent()
		return GameText[textKey]
	end

	return currIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetPrevGraphicsAntiAliasing()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAntiAliasing
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.antialiasing
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = currIdx - 1

	if nextIdx <= 0 then
		nextIdx = 0
		edgeReachedL = true
	end

	if nextIdx + 1 > count - 1 then
		edgeReachedR = true
	end

	SystemHelper.Log(string.format("%d -> %d / %d", currIdx, nextIdx, count))

	LS_Setting.graphics.antialiasing = nextIdx

	local textKey = string.format("UI_GRAPHICS_ANTIALIASING%d", nextIdx)

	local function textContent()
		return GameText[textKey]
	end

	SystemHelper.Log(string.format("%s <- %d -> %s : %s", tostring(edgeReachedL), nextIdx, tostring(edgeReachedR), textContent()))

	return nextIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetNextGraphicsAntiAliasing()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAntiAliasing
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.antialiasing
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = currIdx + 1

	if nextIdx >= count - 1 then
		nextIdx = count - 1
		edgeReachedR = true
	end

	if nextIdx - 1 < 0 then
		edgeReachedL = true
	end

	SystemHelper.Log(string.format("%d -> %d / %d", currIdx, nextIdx, count))

	LS_Setting.graphics.antialiasing = nextIdx

	local textKey = string.format("UI_GRAPHICS_ANTIALIASING%d", nextIdx)

	local function textContent()
		return GameText[textKey]
	end

	SystemHelper.Log(string.format("%s <- %d -> %s : %s", tostring(edgeReachedL), nextIdx, tostring(edgeReachedR), textContent()))

	return nextIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetCurrGraphicsReflection()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsReflection
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.reflection
	local edgeReachedL = false
	local edgeReachedR = false

	if currIdx - 1 < 0 then
		edgeReachedL = true
	end

	if count <= currIdx + 1 then
		edgeReachedR = true
	end

	local textKey = string.format("UI_GRAPHICS_REFLECTION%d", currIdx)

	local function textContent()
		return GameText[textKey]
	end

	return currIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetPrevGraphicsReflection()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsReflection
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.reflection
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = currIdx - 1

	if nextIdx <= 0 then
		nextIdx = 0
		edgeReachedL = true
	end

	if nextIdx + 1 > count - 1 then
		edgeReachedR = true
	end

	local textKey = string.format("UI_GRAPHICS_REFLECTION%d", nextIdx)

	local function textContent()
		return GameText[textKey]
	end

	SystemHelper.Log(string.format("%s <- %d -> %s : %s", tostring(edgeReachedL), currIdx, tostring(edgeReachedR), textContent()))

	return nextIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetNextGraphicsReflection()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsReflection
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.reflection
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = currIdx + 1

	if nextIdx >= count - 1 then
		nextIdx = count - 1
		edgeReachedR = true
	end

	if nextIdx - 1 < 0 then
		edgeReachedL = true
	end

	local textKey = string.format("UI_GRAPHICS_REFLECTION%d", nextIdx)

	local function textContent()
		return GameText[textKey]
	end

	SystemHelper.Log(string.format("%s <- %d -> %s : %s", tostring(edgeReachedL), currIdx, tostring(edgeReachedR), textContent()))

	return nextIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetCurrGraphicsAmbientOcculsion()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAmbientOcclusion
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.ambientocclusion
	local edgeReachedL = false
	local edgeReachedR = false

	if currIdx - 1 < 0 then
		edgeReachedL = true
	end

	if count <= currIdx + 1 then
		edgeReachedR = true
	end

	local textKey = string.format("UI_GRAPHICS_AMBIENTOCCLUSION%d", currIdx)

	local function textContent()
		return GameText[textKey]
	end

	return currIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetPrevGraphicsAmbientOcculsion()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAmbientOcclusion
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.ambientocclusion
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = currIdx - 1

	if nextIdx <= 0 then
		nextIdx = 0
		edgeReachedL = true
	end

	if nextIdx + 1 > count - 1 then
		edgeReachedR = true
	end

	SystemHelper.Log(string.format("%d -> %d / %d", currIdx, nextIdx, count))

	LS_Setting.graphics.ambientocclusion = nextIdx

	local textKey = string.format("UI_GRAPHICS_AMBIENTOCCLUSION%d", nextIdx)

	local function textContent()
		return GameText[textKey]
	end

	SystemHelper.Log(string.format("%s <- %d -> %s : %s", tostring(edgeReachedL), currIdx, tostring(edgeReachedR), textContent()))

	return nextIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.GetNextGraphicsAmbientOcculsion()
	local tabIdx = SettingCfg.Pnl.Basic
	local rowIdx = SettingCfg.Idx[tabIdx].GraphicsAmbientOcclusion
	local count = table.nums(SettingCfg.Tab[tabIdx][rowIdx][4])
	local currIdx = LS_Setting.graphics.ambientocclusion
	local edgeReachedL = false
	local edgeReachedR = false
	local nextIdx = currIdx + 1

	if nextIdx >= count - 1 then
		nextIdx = count - 1
		edgeReachedR = true
	end

	if nextIdx - 1 < 0 then
		edgeReachedL = true
	end

	SystemHelper.Log(string.format("%d -> %d / %d", currIdx, nextIdx, count))

	LS_Setting.graphics.ambientocclusion = nextIdx

	local textKey = string.format("UI_GRAPHICS_AMBIENTOCCLUSION%d", nextIdx)

	local function textContent()
		return GameText[textKey]
	end

	SystemHelper.Log(string.format("%s <- %d -> %s : %s", tostring(edgeReachedL), currIdx, tostring(edgeReachedR), textContent()))

	return nextIdx, textContent, edgeReachedL, edgeReachedR
end

function LS_Setting.IsJoystickConnected()
	return LS_Setting.isJoystickConnected
end

function LS_Setting.IsKeyboardConnected()
	local value = inputMgr:IsKeyboardConnected()

	LS_Setting.isKeyboardConnected = value

	return value
end

function LS_Setting.IsMouseConnected()
	local value = inputMgr:IsMouseConnected()

	LS_Setting.isMouseConnected = value

	return value
end

function LS_Setting.GetInputConfig(mode, slot)
	return LS_Setting.inputConfig[mode][slot]
end

function LS_Setting.GetCurrentInputConfig(mode)
	local slot = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]

	return LS_Setting.inputConfig[mode][slot]
end

function LS_Setting.SetInputConfigGroup(mode, slot, layout)
	LS_Setting.inputConfig[mode][slot] = SystemHelper.DeepCopy(layout)
end

function LS_Setting.SetInputConfig(mode, slot, name, vx, vy, vs)
	LS_Setting.inputConfig[mode][slot][name] = {
		x = Mathf.Round(vx),
		y = Mathf.Round(vy),
		s = vs
	}
end

function LS_Setting.SetIgnoreLMB(val)
	LS_Setting.ignoreLMB = val
end

function LS_Setting.GetIgnoreLMB()
	return LS_Setting.ignoreLMB
end

function LS_Setting.GetKeyDown(keyCode)
	if keyCode == XKeyCode.Mouse0 and LS_Setting.ignoreLMB then
		return false
	end

	return LS_Setting.OnKeyDownList[keyCode]
end

function LS_Setting.GetKeyHold(keyCode)
	if keyCode == XKeyCode.Mouse0 and LS_Setting.ignoreLMB then
		return false
	end

	return LS_Setting.OnKeyList[keyCode]
end

function LS_Setting.GetKeyUp(keyCode)
	if keyCode == XKeyCode.Mouse0 and LS_Setting.ignoreLMB then
		return false
	end

	return LS_Setting.OnKeyUpList[keyCode]
end

function LS_Setting.ResetKeys()
	for i = 0, 329 do
		LS_Setting.OnKeyDownList[i] = false
	end

	for i = 0, 329 do
		LS_Setting.OnKeyList[i] = false
	end

	for i = 0, 329 do
		LS_Setting.OnKeyUpList[i] = false
	end
end

function LS_Setting.InitKMC(forceReset)
	local modeIdx = LS_Setting.InputMode.KM
	local slotDef = LS_Setting.InputProfileDefault[modeIdx]
	local slotSel = LS_Setting.inputSelect[modeIdx][LS_Setting.InputProfileIndex.Current]

	if not LS_Setting.isKeyboardMouseReady then
		inputMgr:SetLuaKeyboardOnConnect(function()
			LS_Setting.isKeyboardConnected = true

			SystemHelper.Log("Keyboard is connected........")
		end)
		inputMgr:SetLuaKeyboardOnDisconnect(function()
			LS_Setting.isKeyboardConnected = false

			SystemHelper.Log("Keyboard is disconnected........")
		end)
		inputMgr:SetLuaMouseOnConnect(function()
			LS_Setting.isMouseConnected = true

			SystemHelper.Log("Mouse is connected........")
			inputMgr:SetPointerLocked(inputMgr:GetPointerLocked())
		end)
		inputMgr:SetLuaMouseOnDisconnect(function()
			LS_Setting.isMouseConnected = false

			SystemHelper.Log("Mouse is disconnected........")
			inputMgr:ForcePointerUnlocked()
		end)

		LS_Setting.isKeyboardMouseReady = true
	end

	for i = 0, 329 do
		LS_Setting.OnKeyDownList[i] = false
	end

	for i = 0, 329 do
		LS_Setting.OnKeyList[i] = false
	end

	for i = 0, 329 do
		LS_Setting.OnKeyUpList[i] = false
	end

	inputMgr:SetLuaOnKeyDown(function(keyCode)
		LS_Setting.OnKeyDownList[keyCode] = true
	end)
	inputMgr:SetLuaOnKey(function(keyCode)
		LS_Setting.OnKeyList[keyCode] = true
	end)
	inputMgr:SetLuaOnKeyUp(function(keyCode)
		LS_Setting.OnKeyUpList[keyCode] = true
	end)

	if LS_Setting.inputConfig[modeIdx][slotDef].MOUSE == nil then
		LS_Setting.inputConfig[modeIdx][slotDef] = SystemHelper.DeepCopy(LS_Setting.KMMapDef)
	end

	if forceReset or table.nums(LS_Setting.inputConfig[modeIdx][slotSel]) <= 17 or LS_Setting.inputConfig[modeIdx][slotSel].MOUSE == nil then
		LS_Setting.inputConfig[modeIdx][slotSel] = SystemHelper.DeepCopy(LS_Setting.KMMapDef)
	end

	local config = LS_Setting.inputConfig[modeIdx][slotSel]

	for k, v in pairs(config) do
		LS_Setting.kmCfg[k] = v
		KMKey[k] = v[1]
	end

	if LS_Setting.kmCfg.PLAYERINFO == nil then
		LS_Setting.inputConfig.PLAYERINFO = {
			XKeyCode.Tab
		}
		LS_Setting.kmCfg.PLAYERINFO = {
			XKeyCode.Tab
		}
		KMKey.PLAYERINFO = XKeyCode.Tab
	end

	local kmCount = table.nums(LS_Setting.KMItems)

	for i = 1, kmCount do
		inputMgr:SetKMMapByIdx(i, KMKey[LS_Setting.KMItems[i]])
	end

	KMKey.CAM_X = LS_Setting.camera.horizontal
	KMKey.CAM_Y = LS_Setting.camera.vertical
end

function LS_Setting.InitTPC(forceReset)
	local modeIdx = LS_Setting.InputMode.TP
	local slotDef = LS_Setting.InputProfileDefault[modeIdx]
	local tpCfg = LS_Setting.inputConfig[modeIdx][slotDef]

	if forceReset or table.nums(tpCfg) == 0 then
		LS_Setting.CreateDefaultTouchScreenLayout()
		LS_Setting.CloneTouchScreenLayoutFromDefault()
	end
end

function LS_Setting.InitGPC(forceReset)
	local modeIdx = LS_Setting.InputMode.GP
	local slotDef = LS_Setting.InputProfileDefault[modeIdx]
	local slotSel = LS_Setting.inputSelect[modeIdx][LS_Setting.InputProfileIndex.Current]

	if not LS_Setting.isJoystickReady then
		inputMgr:SetLuaOnConnect(function(count, name, jid, jtp, gpTp)
			LS_Setting.isJoystickConnected = count > 0

			SystemHelper.Log(string.format("[ ++: %d => %s - jid %d | jtp %d | gtp %d", count, name, jid, jtp, gpTp))

			if gpTp == InputManager.XboxCompatible then
				LS_Setting.platform = "xb"
				LS_Setting.exBtnIco1 = false
				LS_Setting.exBtnCbk1 = false
			elseif gpTp == InputManager.SonyDualshockX then
				LS_Setting.platform = "ps"
				LS_Setting.exBtnIco1 = false
				LS_Setting.exBtnCbk1 = false
			elseif Platform == PlatformType.IOS then
				LS_Setting.platform = "xb"
				LS_Setting.exBtnIco1 = false
				LS_Setting.exBtnCbk1 = false

				if AppVer == AppAppleLight then
					LS_Setting.inputConfig[modeIdx][slotDef].LOCKON = {
						LS_Setting.Btn.L1
					}
					LS_Setting.inputConfig[modeIdx][slotSel].LOCKON = {
						LS_Setting.Btn.L1
					}
				end
			else
				LS_Setting.platform = "xb"
				LS_Setting.exBtnIco1 = false
				LS_Setting.exBtnCbk1 = false
			end

			UIManager.RefreshJoystickIcon(LS_Setting.platform)
		end)
		inputMgr:SetLuaOnDisconnect(function(count, name, jid, jtp)
			LS_Setting.isJoystickConnected = count > 0

			SystemHelper.Log(string.format("[ --: %d => %s - jid %d | jtp %d ]", count, name, jid, jtp))
		end)

		LS_Setting.isJoystickReady = true
	end

	inputMgr:SetLuaOnButtonDown(function(actionId)
		LS_Setting.OnButtonDownList[actionId] = true
	end)
	inputMgr:SetLuaOnButton(function(actionId)
		LS_Setting.OnButtonList[actionId] = true
	end)
	inputMgr:SetLuaOnButtonUp(function(actionId)
		LS_Setting.OnButtonUpList[actionId] = true
	end)
	inputMgr:SetLuaOnAxis(function(actionId, axis)
		LS_Setting.OnAxisList[actionId] = axis
	end)

	if forceReset or table.nums(LS_Setting.inputConfig[modeIdx][slotSel]) <= 0 then
		LS_Setting.inputConfig[modeIdx][slotSel] = SystemHelper.DeepCopy(LS_Setting.inputConfig[modeIdx][slotDef])

		SystemHelper.Log("[ ________Clone the default GPC mapping________ ]")
	end

	local config = LS_Setting.inputConfig[modeIdx][slotSel]
	local saveGpFix = false

	for k, v in pairs(config) do
		LS_Setting.gpCfg[k] = v

		if v[1] == nil then
			saveGpFix = true

			break
		end

		GPKey[k] = v[1]
	end

	if saveGpFix then
		LS_Setting.inputConfig[modeIdx][slotSel] = SystemHelper.DeepCopy(LS_Setting.inputConfig[modeIdx][slotDef])
		config = LS_Setting.inputConfig[modeIdx][slotSel]

		for k, v in pairs(config) do
			LS_Setting.gpCfg[k] = v
			GPKey[k] = v[1]

			SystemHelper.Log(string.format("__Key %s: %s", k, GPKey[k]))
		end
	end

	GPKey.CAM_X = LS_Setting.camera.horizontal
	GPKey.CAM_Y = LS_Setting.camera.vertical

	local gpType = inputMgr:GetJoystickType()

	if gpType == InputManager.XboxCompatible then
		LS_Setting.platform = "xb"
		LS_Setting.exBtnIco1 = false
		LS_Setting.exBtnCbk1 = false
	elseif gpType == InputManager.SonyDualshockX then
		LS_Setting.platform = "ps"
		LS_Setting.exBtnIco1 = false
		LS_Setting.exBtnCbk1 = false
	elseif Platform == PlatformType.IOS then
		LS_Setting.platform = "xb"
		LS_Setting.exBtnIco1 = false
		LS_Setting.exBtnCbk1 = false

		if AppVer == AppAppleLight then
			LS_Setting.inputConfig[modeIdx][slotDef].LOCKON = {
				LS_Setting.Btn.L1
			}
			LS_Setting.inputConfig[modeIdx][slotSel].LOCKON = {
				LS_Setting.Btn.L1
			}
		end
	end
end

function LS_Setting.SaveKMC()
	local modeIdx = LS_Setting.InputMode.KM
	local slotSel = LS_Setting.inputSelect[modeIdx][LS_Setting.InputProfileIndex.Current]

	LS_Setting.inputConfig[modeIdx][slotSel] = SystemHelper.DeepCopy(LS_Setting.kmCfg)
end

function LS_Setting.SaveGPC()
	local modeIdx = LS_Setting.InputMode.GP
	local slotSel = LS_Setting.inputSelect[modeIdx][LS_Setting.InputProfileIndex.Current]

	LS_Setting.inputConfig[modeIdx][slotSel] = SystemHelper.DeepCopy(LS_Setting.gpCfg)
end

function LS_Setting.GetBtnKey(btnVal)
	local btnKey
	local modeIdx = LS_Setting.InputMode.KM
	local slotSel = LS_Setting.inputSelect[modeIdx][LS_Setting.InputProfileIndex.Current]
	local config = LS_Setting.inputConfig[modeIdx][slotSel]

	for k, v in pairs(config) do
		if v[1] == btnVal then
			btnKey = k

			break
		end
	end

	return btnKey
end

function LS_Setting.GetBtnIconName(btnVal)
	local suffix = string.lower(btnVal)

	if suffix == "a" then
		suffix = LS_Setting.exBtnIco1 and "b" or "a"
	elseif suffix == "b" then
		suffix = LS_Setting.exBtnIco1 and "a" or "b"
	elseif suffix == "x" then
		suffix = LS_Setting.exBtnIco2 and "y" or "x"
	elseif suffix == "y" then
		suffix = LS_Setting.exBtnIco2 and "x" or "y"
	end

	return string.format("%s_%s", LS_Setting.platform, suffix)
end

function LS_Setting.GetPCIconName(btnVal)
	if btnVal ~= nil then
		local suffix = string.lower(btnVal)

		return string.format("pc_%s", suffix)
	else
		return ""
	end
end

function LS_Setting.GetKey()
	return LS_Setting.keyName .. "_" .. LS_Setting.keyUserId
end

function LS_Setting.SetLastSaveSlot(slotIdx)
	LS_Setting.lastSlotPlayed = slotIdx
end

function LS_Setting.FindLastSaveSlot()
	local lastSaveSlot = 0
	local latestSaveTime = 0
	local maxCount = LS_Setting.maxSaveSlot

	for slotIdx = 1, maxCount do
		local slotInfo = LS_Setting.saveSlotStatus[slotIdx]
		local savetime = slotInfo[LS_Setting.SlotStatus.SaveTime]

		if savetime > 0 and latestSaveTime < savetime then
			latestSaveTime = savetime
			lastSaveSlot = slotIdx
		end
	end

	return lastSaveSlot
end

function LS_Setting.SetLastArcadeSaveSlot(slotIdx)
	LS_Setting.lastArcadeSlotPlayed = slotIdx
end

function LS_Setting.FindLastArcadeSaveSlot()
	local lastSaveSlot = 0
	local latestSaveTime = 0
	local maxCount = LS_Setting.maxArcadeSaveSlot

	for slotIdx = 1, maxCount do
		local slotInfo = LS_Setting.saveSlotArcade[slotIdx]
		local savetime = slotInfo[LS_Setting.SlotStatus.SaveTime]

		if savetime > 0 and latestSaveTime < savetime then
			latestSaveTime = savetime
			lastSaveSlot = slotIdx
		end
	end

	return lastSaveSlot
end

function LS_Setting.SetGameTimes(times)
	LS_Setting.gameTimes = times

	LS_Setting.Update()
end

function LS_Setting.GetGameTimes()
	return LS_Setting.gameTimes
end

function LS_Setting.SetLastAnnouncementId(id)
	LS_Setting.lastAnnouncementId = id

	LS_Setting.Update()
end

function LS_Setting.GetLastAnnouncementId()
	return LS_Setting.lastAnnouncementId
end

function LS_Setting.GetTodayPlayTime(sec)
	LS_Setting.todayPlayTime = LS_Setting.todayPlayTime + sec

	return LS_Setting.todayPlayTime
end

function LS_Setting.EraseSaveSlot(slotIdx)
	LS_Setting.saveSlotStatus[slotIdx] = {
		0,
		0,
		0,
		0,
		0,
		1
	}

	SystemHelper.Log(string.format("[ Erase SlotStory %d => [0, 0, 0, 0, 0, 1] ]", slotIdx))
end

function LS_Setting.EraseArcadeSaveSlot(slotIdx)
	LS_Setting.saveSlotArcade[slotIdx] = {
		0,
		0,
		0,
		0,
		0,
		1
	}

	SystemHelper.Log(string.format("[ Erase SlotArcade %d => [0, 0, 0, 0, 0, 1] ]", slotIdx))
end

function LS_Setting.SyncSaveSlotInfo(slotIdx, location, level, playtime, savetime, utctime, gamemode, roundCount, writeBack, arcadeMode)
	local slotInfo = {}

	if arcadeMode ~= nil then
		slotInfo = LS_Setting.saveSlotArcade[slotIdx]
		slotInfo[LS_Setting.SlotStatus.HeroId] = level
	else
		slotInfo = LS_Setting.saveSlotStatus[slotIdx]
		slotInfo[LS_Setting.SlotStatus.Level] = level
	end

	slotInfo[LS_Setting.SlotStatus.Location] = location
	slotInfo[LS_Setting.SlotStatus.PlayTime] = playtime
	slotInfo[LS_Setting.SlotStatus.SaveTime] = savetime
	slotInfo[LS_Setting.SlotStatus.GameMode] = gamemode
	slotInfo[LS_Setting.SlotStatus.RoundCount] = roundCount

	if arcadeMode ~= nil then
		LS_Setting.saveSlotArcade[slotIdx] = slotInfo
	else
		LS_Setting.saveSlotStatus[slotIdx] = slotInfo
	end

	if writeBack == true then
		LS_Setting.Update()
	end
end

function LS_Setting.GetSaveSlotInfo(slotIdx)
	local slotInfo
	local slotCount = LS_Setting.maxSaveSlot

	if slotIdx >= 1 and slotIdx <= slotCount then
		slotInfo = LS_Setting.saveSlotStatus[slotIdx]
	end

	return slotInfo
end

function LS_Setting.GetArcadeSaveSlotInfo(slotIdx)
	local slotInfo
	local slotCount = LS_Setting.maxArcadeSaveSlot

	if slotIdx >= 1 and slotIdx <= slotCount then
		slotInfo = LS_Setting.saveSlotArcade[slotIdx]
	end

	return slotInfo
end

function LS_Setting.CopySaveSlotInfo(srcIdx, dstIdx)
	local srcInfo = LS_Setting.saveSlotStatus[srcIdx]
	local dstInfo = LS_Setting.saveSlotStatus[dstIdx]

	dstInfo[LS_Setting.SlotStatus.Location] = srcInfo[LS_Setting.SlotStatus.Location]
	dstInfo[LS_Setting.SlotStatus.Level] = srcInfo[LS_Setting.SlotStatus.Level]
	dstInfo[LS_Setting.SlotStatus.PlayTime] = srcInfo[LS_Setting.SlotStatus.PlayTime]
	dstInfo[LS_Setting.SlotStatus.SaveTime] = os.time()
	dstInfo[LS_Setting.SlotStatus.GameMode] = srcInfo[LS_Setting.SlotStatus.GameMode]
	dstInfo[LS_Setting.SlotStatus.RoundCount] = srcInfo[LS_Setting.SlotStatus.RoundCount]
end

function LS_Setting.CopyArcadeSaveSlotInfo(srcIdx, dstIdx)
	local srcInfo = LS_Setting.saveSlotArcade[srcIdx]
	local dstInfo = LS_Setting.saveSlotArcade[dstIdx]

	dstInfo[LS_Setting.SlotStatus.Location] = srcInfo[LS_Setting.SlotStatus.Location]
	dstInfo[LS_Setting.SlotStatus.HeroId] = srcInfo[LS_Setting.SlotStatus.HeroId]
	dstInfo[LS_Setting.SlotStatus.PlayTime] = srcInfo[LS_Setting.SlotStatus.PlayTime]
	dstInfo[LS_Setting.SlotStatus.SaveTime] = os.time()
	dstInfo[LS_Setting.SlotStatus.GameMode] = srcInfo[LS_Setting.SlotStatus.GameMode]
	dstInfo[LS_Setting.SlotStatus.RoundCount] = srcInfo[LS_Setting.SlotStatus.RoundCount]
end

function LS_Setting.SetUserId(userId)
	if userId ~= nil and type(userId) == "string" then
		LS_Setting.keyUserId = userId
	end
end

function LS_Setting.IsReadable(userId)
	return Recorder.IsHaveRecorder(LS_Setting.keyName .. "_" .. userId)
end

function LS_Setting.Load(userId)
	LS_Setting.keyUserId = userId
	LS_Setting.screenRatio = Mathf.Round(LS_Setting.screenWidth / LS_Setting.screenHeight * 100)

	local retStr = ""

	if AppVer ~= AppAppleDemo and AppVer ~= AppAppleShow then
		retStr = Recorder.read(LS_Setting.GetKey())
	end

	if retStr ~= nil and type(retStr) == "string" and string.len(retStr) > 0 then
		SystemHelper.Log(string.format("[ LS_Setting.Load: %s ]", LS_Setting.GetKey()))
		LS_Setting.Decode(json.decode(retStr))
	else
		SystemHelper.Log("[ LS_Setting.Load: 1st saving. ]")
		LS_Setting.Update()
	end

	LS_Setting.ReCheckLanguage(LS_Setting.lang)

	if Platform == PlatformType.ANDROID then
		Device.SetScreenLevel(LS_Setting.graphics.quality)
	end

	if AppVer == AppDemoE3 or AppVer == AppDemoCJ or AppVer == AppDemoCJReview or AppVer == AppDemoInnerthen or AppVer == AppDemoCJMedia or AppVer == AppDemoGCores then
		LS_Setting.lang = "zhs"
		LS_Setting.save = 0
		LS_Setting.enableCustomInput = false
	elseif AppVer == AppDemoPax1903 then
		LS_Setting.lang = "us"
		LS_Setting.enableCustomInput = false
	elseif AppVer == AppAppleDemo or AppVer == AppAppleShow then
		LS_Setting.lang = "us"
	elseif AppVer == AppComReview then
		LS_Setting.lang = "zhs"
	end

	FmodManager.SetVolume(LS_Setting.sound / 100)
	FmodManager.SetVolume_BGM(LS_Setting.bgm / 100)
	FmodManager.SetVolume_SE(LS_Setting.sfx / 100)
	FmodManager.SetVolume_ADR(LS_Setting.voice / 100)
	LS_Setting.InitDeviceResolutions()
	Device.SetVSyncCount(LS_Setting.graphics.vsync)
	inputMgr:SetLuaIsGpLastInputDevice(function(value)
		LS_Setting.isJoystickConnected = value
	end)
	LS_Setting.InitKMC()
	LS_Setting.InitTPC()
	LS_Setting.InitGPC()

	LS_Setting.maxFPS = inputMgr:GetMaximumFramesPerSecond()
end

function LS_Setting.Update()
	if AppVer == AppAppleLight then
		return
	end

	if AppVer == AppCJ2020 then
		return
	end

	if AppVer == AppAppleDemo then
		return
	end

	if AppVer == AppAppleShow then
		return
	end

	local retStr = LS_Setting.Encode()

	SystemHelper.Log(string.format("[ LS_Setting.Update( %s ) ]", LS_Setting.keyUserId))
	Recorder.write(LS_Setting.GetKey(), retStr)
end

function LS_Setting.Delete()
	SystemHelper.Log(string.format("[ LS_Setting.Delete( %s ) ]", LS_Setting.keyUserId))

	local filename = LS_Setting.GetKey()

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Setting.ClearSaveInfo()
	LS_Setting.saveSlotStatus = {
		{
			0,
			0,
			0,
			0,
			0,
			1
		},
		{
			0,
			0,
			0,
			0,
			0,
			1
		},
		{
			0,
			0,
			0,
			0,
			0,
			1
		},
		{
			0,
			0,
			0,
			0,
			0,
			1
		}
	}

	if DLC_Elena == true then
		LS_Setting.saveSlotArcade = {
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				1
			},
			{
				0,
				0,
				0,
				0,
				0,
				0
			}
		}
	end
end

function LS_Setting.Write(data)
	SystemHelper.Log(string.format("[ LS_Setting.Write( %s ) ]", LS_Setting.GetKey()))
	Recorder.write(LS_Setting.GetKey(), data)
end

function LS_Setting.Encode()
	local jsonData = {}
	local tmpJsonSub = {}

	tmpJsonSub.sound = LS_Setting.sound
	tmpJsonSub.bgm = LS_Setting.bgm
	tmpJsonSub.sfx = LS_Setting.sfx
	tmpJsonSub.voice = LS_Setting.voice
	tmpJsonSub.sensitivity = MathHelper.ToFloatCut(LS_Setting.sensitivity)
	tmpJsonSub.graphics_quality = LS_Setting.graphics.quality
	tmpJsonSub.graphics_framerate = LS_Setting.graphics.framerate
	tmpJsonSub.graphics_brightness = LS_Setting.graphics.brightness
	tmpJsonSub.camera_type = LS_Setting.camera.type
	tmpJsonSub.camera_horizontal = LS_Setting.camera.horizontal
	tmpJsonSub.camera_vertical = LS_Setting.camera.vertical
	tmpJsonSub.lang = LS_Setting.lang
	tmpJsonSub.voice_language = LS_Setting.voiceLanguage
	tmpJsonSub.input_select = LS_Setting.inputSelect
	tmpJsonSub.input_config = LS_Setting.inputConfig
	tmpJsonSub.screen_width = LS_Setting.screenWidth
	tmpJsonSub.screen_height = LS_Setting.screenHeight
	tmpJsonSub.screen_ratio = LS_Setting.screenRatio
	tmpJsonSub.lastSlotPlayed = LS_Setting.lastSlotPlayed
	tmpJsonSub.lastArcadeSlotPlayed = LS_Setting.lastArcadeSlotPlayed
	tmpJsonSub.gameTimes = LS_Setting.gameTimes
	tmpJsonSub.last_announcement_id = LS_Setting.lastAnnouncementId
	tmpJsonSub.date = os.date("%x")
	tmpJsonSub.today_play_time = LS_Setting.todayPlayTime
	tmpJsonSub.save = LS_Setting.saveSlotStatus
	tmpJsonSub.arcade = LS_Setting.saveSlotArcade
	tmpJsonSub.save_time = LS_Setting.saveTime
	tmpJsonSub.nickname = LS_Setting.nickname
	tmpJsonSub.subtitle = LS_Setting.subtitle
	tmpJsonSub.fixedvlj = LS_Setting.fixedvlj
	tmpJsonSub.skins = LS_Setting.skins
	tmpJsonSub.vibration = LS_Setting.vibration
	tmpJsonSub.fullscreen = LS_Setting.fullscreen
	tmpJsonSub.customresolution = LS_Setting.customresolution
	tmpJsonSub.show_time_score = LS_Setting.showTimeAndScore
	tmpJsonSub.graphics_vsync = LS_Setting.graphics.vsync
	tmpJsonSub.graphics_antialiasing = LS_Setting.graphics.antialiasing
	tmpJsonSub.graphics_reflection = LS_Setting.graphics.reflection
	tmpJsonSub.graphics_ambientocclusion = LS_Setting.graphics.ambientocclusion
	tmpJsonSub.graphics_fieldofview = LS_Setting.graphics.fieldofview
	tmpJsonSub.graphics_vignette = LS_Setting.graphics.vignette
	jsonData.result = tmpJsonSub

	return json.encode(jsonData)
end

function LS_Setting.Decode(p_val)
	SystemHelper.Log("[ LS_Setting.Decode()... ]")

	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "sound") then
			LS_Setting.sound = FS_ParserJson.toInt(tmpJsonSub, "sound")
		else
			LS_Setting.sound = 100
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "bgm") then
			LS_Setting.bgm = FS_ParserJson.toInt(tmpJsonSub, "bgm")
		else
			LS_Setting.bgm = 100
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "sfx") then
			LS_Setting.sfx = FS_ParserJson.toInt(tmpJsonSub, "sfx")
		else
			LS_Setting.sfx = 100
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "voice") then
			LS_Setting.voice = FS_ParserJson.toInt(tmpJsonSub, "voice")
		else
			LS_Setting.voice = 100
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "sensitivity") then
			LS_Setting.sensitivity = FS_ParserJson.toFloat(tmpJsonSub, "sensitivity")
		else
			LS_Setting.sensitivity = 70
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "lang") then
			LS_Setting.lang = FS_ParserJson.toString(tmpJsonSub, "lang")
		else
			LS_Setting.lang = "us"
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "voice_language") then
			LS_Setting.voiceLanguage = FS_ParserJson.toString(tmpJsonSub, "voice_language")
		else
			LS_Setting.voiceLanguage = LS_Setting.VoiceLanguage.EN
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_quality") then
			LS_Setting.graphics.quality = FS_ParserJson.toInt(tmpJsonSub, "graphics_quality")

			if LS_Setting.graphics.quality < LS_Setting.QualityLevel.Medium or LS_Setting.graphics.quality > LS_Setting.QualityLevel.Ultra then
				LS_Setting.graphics.quality = LS_Setting.QualityLevel.Ultra
			end
		else
			LS_Setting.graphics.quality = LS_Setting.QualityLevel.Ultra
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_framerate") then
			LS_Setting.graphics.framerate = FS_ParserJson.toInt(tmpJsonSub, "graphics_framerate")

			if LS_Setting.graphics.framerate < LS_Setting.FrameRateLevel.Norm or LS_Setting.graphics.framerate > LS_Setting.FrameRateLevel.Unlimited then
				LS_Setting.graphics.framerate = LS_Setting.FrameRateLevel.High
			end
		else
			LS_Setting.graphics.framerate = LS_Setting.FrameRateLevel.High
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_brightness") then
			LS_Setting.graphics.brightness = FS_ParserJson.toInt(tmpJsonSub, "graphics_brightness")
		else
			LS_Setting.graphics.brightness = 25
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_vsync") then
			LS_Setting.graphics.vsync = FS_ParserJson.toInt(tmpJsonSub, "graphics_vsync")
		else
			LS_Setting.graphics.vsync = 0
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_antialiasing") then
			LS_Setting.graphics.antialiasing = FS_ParserJson.toInt(tmpJsonSub, "graphics_antialiasing")
		else
			LS_Setting.graphics.antialiasing = 2
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_reflection") then
			LS_Setting.graphics.reflection = FS_ParserJson.toInt(tmpJsonSub, "graphics_reflection")
		else
			LS_Setting.graphics.reflection = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_ambientocclusion") then
			LS_Setting.graphics.ambientocclusion = FS_ParserJson.toInt(tmpJsonSub, "graphics_ambientocclusion")
		else
			LS_Setting.graphics.ambientocclusion = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_fov") then
			LS_Setting.graphics.fieldofview = FS_ParserJson.toInt(tmpJsonSub, "graphics_fieldofview")
		else
			LS_Setting.graphics.fieldofview = 55
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "graphics_vignette") then
			LS_Setting.graphics.vignette = FS_ParserJson.toInt(tmpJsonSub, "graphics_vignette")
		else
			LS_Setting.graphics.vignette = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "camera_type") then
			LS_Setting.camera.type = FS_ParserJson.toInt(tmpJsonSub, "camera_type")

			if LS_Setting.camera.type < LS_Setting.CameraType.Type1 or LS_Setting.camera.type > LS_Setting.CameraType.Type2 then
				LS_Setting.camera.type = LS_Setting.CameraType.Type1
			end
		else
			LS_Setting.camera.type = LS_Setting.CameraType.Type1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "camera_horizontal") then
			LS_Setting.camera.horizontal = FS_ParserJson.toInt(tmpJsonSub, "camera_horizontal")

			if LS_Setting.camera.horizontal ~= 1 and LS_Setting.camera.horizontal ~= -1 then
				LS_Setting.camera.horizontal = 1
			end
		else
			LS_Setting.camera.horizontal = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "camera_vertical") then
			LS_Setting.camera.vertical = FS_ParserJson.toInt(tmpJsonSub, "camera_vertical")

			if LS_Setting.camera.vertical ~= 1 and LS_Setting.camera.vertical ~= -1 then
				LS_Setting.camera.vertical = 1
			end
		else
			LS_Setting.camera.vertical = 1
		end

		LS_Setting.inputSelect = FS_ParserJson.toTable(tmpJsonSub, "input_select", LS_Setting.inputSelect)
		LS_Setting.inputConfig = FS_ParserJson.toTable(tmpJsonSub, "input_config", LS_Setting.inputConfig)

		if FS_ParserJson.isValidKey(tmpJsonSub, "screen_width") then
			LS_Setting.screenWidth = FS_ParserJson.toInt(tmpJsonSub, "screen_width", LS_Setting.screenWidth)
		else
			LS_Setting.screenWidth = SystemHelper.GetScreenWidth()
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "screen_height") then
			LS_Setting.screenHeight = FS_ParserJson.toInt(tmpJsonSub, "screen_height", LS_Setting.screenHeight)
		else
			LS_Setting.screenHeight = SystemHelper.GetScreenHeight()
		end

		LS_Setting.previousScreenWidth = LS_Setting.screenWidth
		LS_Setting.previousScreenHeight = LS_Setting.screenHeight

		if FS_ParserJson.isValidKey(tmpJsonSub, "screen_ratio") then
			LS_Setting.screenRatio = FS_ParserJson.toFloat(tmpJsonSub, "screen_ratio", Mathf.Round(LS_Setting.screenWidth / LS_Setting.screenHeight * 100))

			if LS_Setting.screenRatio > 0 and LS_Setting.screenRatio < 100 then
				LS_Setting.screenRatio = Mathf.Round(LS_Setting.screenRatio * 100)
			end
		else
			LS_Setting.screenRatio = Mathf.Round(LS_Setting.screenWidth / LS_Setting.screenHeight * 100)
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "lastSlotPlayed") then
			LS_Setting.lastSlotPlayed = FS_ParserJson.toInt(tmpJsonSub, "lastSlotPlayed", LS_Setting.lastSlotPlayed)
		else
			LS_Setting.lastSlotPlayed = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "lastArcadeSlotPlayed") then
			LS_Setting.lastArcadeSlotPlayed = FS_ParserJson.toInt(tmpJsonSub, "lastArcadeSlotPlayed", LS_Setting.lastArcadeSlotPlayed)
		else
			LS_Setting.lastArcadeSlotPlayed = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "gameTimes") then
			LS_Setting.gameTimes = FS_ParserJson.toInt(tmpJsonSub, "gameTimes", LS_Setting.gameTimes)
		else
			LS_Setting.gameTimes = 0
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "last_announcement_id") then
			LS_Setting.lastAnnouncementId = FS_ParserJson.toInt(tmpJsonSub, "last_announcement_id", LS_Setting.lastAnnouncementId)
		else
			LS_Setting.lastAnnouncementId = 0
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "date") then
			LS_Setting.todayDate = FS_ParserJson.toString(tmpJsonSub, "date", LS_Setting.todayDate)

			if LS_Setting.todayDate == os.date("%x") then
				if FS_ParserJson.isValidKey(tmpJsonSub, "today_play_time") then
					LS_Setting.todayPlayTime = FS_ParserJson.toFloat(tmpJsonSub, "today_play_time", LS_Setting.todayPlayTime)
				end
			else
				LS_Setting.todayDate = os.date("%x")
				LS_Setting.todayPlayTime = 0
			end
		else
			LS_Setting.todayDate = os.date("%x")
			LS_Setting.todayPlayTime = 0
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "save_time") then
			LS_Setting.saveTime = FS_ParserJson.toInt(tmpJsonSub, "save_time", LS_Setting.saveTime)
		else
			LS_Setting.saveTime = TimeHelper.getUTC()
		end

		LS_Setting.saveSlotStatus = FS_ParserJson.toTable(tmpJsonSub, "save", LS_Setting.saveSlotStatus)

		for slotIdx = 1, 4 do
			local slotInfo = LS_Setting.saveSlotStatus[slotIdx]

			if slotInfo[LS_Setting.SlotStatus.GameMode] == nil then
				slotInfo[LS_Setting.SlotStatus.GameMode] = BattleData.GlobalDifficultyLevel.Normal
			end

			if slotInfo[LS_Setting.SlotStatus.RoundCount] == nil then
				slotInfo[LS_Setting.SlotStatus.RoundCount] = 1
			end

			LS_Setting.saveSlotStatus[slotIdx] = slotInfo
		end

		LS_Setting.saveSlotArcade = FS_ParserJson.toTable(tmpJsonSub, "arcade", LS_Setting.saveSlotArcade)

		for slotIdx = 1, 11 do
			local slotInfo = LS_Setting.saveSlotArcade[slotIdx]

			if slotInfo == nil then
				slotInfo = {
					0,
					0,
					0,
					0,
					0,
					1
				}
			end

			LS_Setting.saveSlotArcade[slotIdx] = slotInfo
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "nickname") then
			LS_Setting.nickname = FS_ParserJson.toString(tmpJsonSub, "nickname", "")
		else
			LS_Setting.nickname = ""
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "subtitle") then
			LS_Setting.subtitle = FS_ParserJson.toInt(tmpJsonSub, "subtitle", LS_Setting.subtitle)
		else
			LS_Setting.subtitle = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "fixedvlj") then
			LS_Setting.fixedvlj = FS_ParserJson.toInt(tmpJsonSub, "fixedvlj", LS_Setting.fixedvlj)
		else
			LS_Setting.fixedvlj = 0
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "vibration") then
			LS_Setting.vibration = FS_ParserJson.toInt(tmpJsonSub, "vibration", LS_Setting.vibration)
		else
			LS_Setting.vibration = 1
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "fullscreen") then
			LS_Setting.fullscreen = FS_ParserJson.toInt(tmpJsonSub, "fullscreen", LS_Setting.fullscreen)
		else
			LS_Setting.fullscreen = 2
		end

		LS_Setting.fullscreen = gameMgr:GetIsFullscreen()

		if FS_ParserJson.isValidKey(tmpJsonSub, "customresolution") then
			LS_Setting.customresolution = FS_ParserJson.toInt(tmpJsonSub, "customresolution", LS_Setting.customresolution)
		else
			LS_Setting.customresolution = 0
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "show_time_score") then
			LS_Setting.showTimeAndScore = FS_ParserJson.toInt(tmpJsonSub, "show_time_score", LS_Setting.showTimeAndScore)
		else
			LS_Setting.showTimeAndScore = 1
		end

		LS_Setting.skins = FS_ParserJson.toTable(tmpJsonSub, "skins", LS_Setting.skins)
	end
end

function LS_Setting.GetVolume(volType)
	local value = 0
	local tabIdx = SettingCfg.Pnl.Sounds
	local indices = SettingCfg.Idx[tabIdx]

	if volType == indices.MasVolume then
		value = LS_Setting.sound
	elseif volType == indices.BgmVolume then
		value = LS_Setting.bgm
	elseif volType == indices.SfxVolume then
		value = LS_Setting.sfx
	elseif volType == indices.VoiceVolume then
		value = LS_Setting.voice
	end

	SystemHelper.Log("[ >> Get Volume " .. volType .. ": " .. value .. " ]")

	return value
end

function LS_Setting.GetLanguage()
	if LS_Setting.lang == nil or LS_Setting.lang == "" then
		return AppConst.Language
	else
		return LS_Setting.lang
	end
end

function LS_Setting.GetLanguageName()
	if LS_Setting.lang == nil or LS_Setting.lang == "" then
		LS_Setting.lang = AppConst.Language
	end

	local langId = LS_Setting.lang
	local langKey = string.upper("UI_LANGUAGE_" .. langId)
	local langName = GameText[langKey]

	if langName then
		return langName
	end

	return "????"
end

function LS_Setting.GetLanguageIndex()
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local elements = SettingCfg.Tab[tabIdx][rowIdx][4]
	local languageCnt = table.nums(elements)

	for btnIdx = 1, languageCnt do
		if LS_Setting.lang == elements[btnIdx][LS_Setting.ItemData.Value] then
			return btnIdx
		end
	end

	return btnIdx
end

function LS_Setting.GetAvailableLanguageCount()
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local idxShow = SettingCtrl.ElemData.Show
	local elements = SettingCfg.Tab[tabIdx][rowIdx][4]
	local count = table.nums(elements)
	local available = 0

	for idx = 1, count do
		available = available + (elements[idx][idxShow] and 1 or 0)
	end

	SystemHelper.Log("[ Available language count: " .. available .. " ]")

	return available
end

function LS_Setting.GetCurrLanguage()
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local elements = SettingCfg.Tab[tabIdx][rowIdx][4]
	local languageCnt = table.nums(elements)
	local currLangIdx = 1

	for btnIdx = 1, languageCnt do
		if LS_Setting.lang == elements[btnIdx][LS_Setting.ItemData.Value] then
			currLangIdx = btnIdx
		end
	end

	local prevLangIdx = currLangIdx
	local nextLangIdx = -1
	local edgeReachedL = false

	for idx = currLangIdx - 1, 1, -1 do
		local show = elements[idx][LS_Setting.ItemData.Show]

		if show then
			nextLangIdx = idx

			break
		end
	end

	if nextLangIdx < 0 then
		nextLangIdx = prevLangIdx
		edgeReachedL = true
	end

	local prevLangIdx = currLangIdx
	local nextLangIdx = -1
	local edgeReachedR = false

	for idx = currLangIdx + 1, languageCnt do
		local show = elements[idx][LS_Setting.ItemData.Show]

		if show then
			nextLangIdx = idx

			break
		end
	end

	if nextLangIdx < 0 then
		nextLangIdx = prevLangIdx
		edgeReachedR = true
	end

	local langId = elements[currLangIdx][LS_Setting.ItemData.Value]
	local langKey = string.format("UI_LANGUAGE_%s", string.upper(langId))

	local function langName()
		return GameText[langKey]
	end

	LS_Setting.lang = langId

	SystemHelper.Log(currLangIdx .. ", " .. langId .. " - " .. langName())

	return currLangIdx, langName, edgeReachedL, edgeReachedR
end

function LS_Setting.GetPrevLanguage()
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local elements = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem]
	local languageCnt = table.nums(elements)
	local currLangIdx = 1

	for btnIdx = 1, languageCnt do
		if LS_Setting.lang == elements[btnIdx][LS_Setting.ItemData.Value] then
			currLangIdx = btnIdx
		end
	end

	local prevLangIdx = currLangIdx
	local nextLangIdx = -1
	local edgeReachedL = false

	for idx = currLangIdx - 1, 1, -1 do
		local show = elements[idx][LS_Setting.ItemData.Show]

		if show then
			nextLangIdx = idx

			break
		end
	end

	if nextLangIdx < 0 then
		nextLangIdx = prevLangIdx
		edgeReachedL = true
	else
		local nextNextIdx = 0

		for idx = nextLangIdx - 1, 1, -1 do
			local show = elements[idx][LS_Setting.ItemData.Show]

			if show then
				nextNextIdx = idx

				break
			end
		end

		if nextNextIdx == 0 then
			edgeReachedL = true
		end
	end

	local langId = elements[nextLangIdx][LS_Setting.ItemData.Value]
	local langKey = string.upper("UI_LANGUAGE_" .. langId)
	local langName = GameText[langKey]

	LS_Setting.lang = langId

	SystemHelper.Log("Prev " .. nextLangIdx .. ", " .. langId .. " - " .. langName)

	return nextLangIdx, langName, edgeReachedL, edgeReachedR
end

function LS_Setting.GetNextLanguage()
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local elements = SettingCfg.Tab[tabIdx][rowIdx][SettingCtrl.ItemData.Elem]
	local languageCnt = table.nums(elements)
	local currLangIdx = 1

	for btnIdx = 1, languageCnt do
		if LS_Setting.lang == elements[btnIdx][LS_Setting.ItemData.Value] then
			currLangIdx = btnIdx
		end
	end

	local prevLangIdx = currLangIdx
	local nextLangIdx = -1
	local edgeReachedR = false

	for idx = currLangIdx + 1, languageCnt do
		local show = elements[idx][LS_Setting.ItemData.Show]

		if show then
			nextLangIdx = idx

			break
		end
	end

	if nextLangIdx < 0 then
		nextLangIdx = prevLangIdx
		edgeReachedR = true
	else
		local nextNextIdx = 0

		for idx = nextLangIdx + 1, languageCnt do
			local show = elements[idx][LS_Setting.ItemData.Show]

			if show then
				nextNextIdx = idx

				break
			end
		end

		if nextNextIdx == 0 then
			edgeReachedR = true
		end
	end

	local langId = elements[nextLangIdx][LS_Setting.ItemData.Value]
	local langKey = string.upper("UI_LANGUAGE_" .. langId)
	local langName = GameText[langKey]

	LS_Setting.lang = langId

	SystemHelper.Log("Next " .. nextLangIdx .. ", " .. langId .. " - " .. langName)

	return nextLangIdx, langName, edgeReachedL, edgeReachedR
end

function LS_Setting.GetVoiceLanguage()
	if LS_Setting.voiceLanguage == nil or LS_Setting.voiceLanguage == "" then
		return LS_Setting.VoiceLanguage.EN
	else
		return LS_Setting.voiceLanguage
	end
end

function LS_Setting.GetVoiceLanguageIndex()
	for i = 1, 2 do
		if LS_Setting.voiceLanguage == LS_Setting.VoiceLanguage[i] then
			return i
		end
	end

	return 1
end

function LS_Setting.GetInputDefaultItem()
	local inputCnt = table.nums(LS_Setting.InputAvailable)

	LS_Setting.numOfInputMethods = inputCnt

	local inputSel = 0

	for i = 1, inputCnt do
		if LS_Setting.InputAvailable[i] then
			inputSel = i
			LS_Setting.lastSetInput = i

			break
		end
	end

	return inputSel
end

function LS_Setting.CheckAspectRatio()
	local screenW = SystemHelper.GetScreenWidth()
	local screenH = SystemHelper.GetScreenHeight()
	local ratio = Mathf.Round(screenW / screenH * 100)
	local dRatio = LS_Setting.screenRatio - ratio

	SystemHelper.Log(string.format("[ ori = %d, now = %d, delta = %d ]", LS_Setting.screenRatio, ratio, dRatio))

	local isRatioChanged = false

	if Mathf.Abs(dRatio) > 12 then
		LS_Setting.screenRatio = ratio
		isRatioChanged = true

		SystemHelper.Log(string.format("[ Screen aspect ratio has been changed: %d x %d @ %5.3f]", screenW, screenH, ratio / 100))
	end

	if screenW ~= LS_Setting.screenWidth or screenH ~= LS_Setting.screenHeight then
		LS_Setting.previousScreenWidth = LS_Setting.screenWidth > 0 and LS_Setting.screenWidth or screenW
		LS_Setting.previousScreenHeight = LS_Setting.screenHeight > 0 and LS_Setting.screenHeight or screenH
		LS_Setting.screenWidth = screenW
		LS_Setting.screenHeight = screenH

		SystemHelper.Log(string.format("[ Screen resolution has been changed: %d x %d => %d x %d ]", LS_Setting.previousScreenWidth, LS_Setting.previousScreenHeight, screenW, screenH))
	end

	return isRatioChanged
end

function LS_Setting.CompareAspectRatio(width, height, ratio)
	SystemHelper.Log(string.format("[ CompareAspectRatio: %d x %d @ %4.2f]", width, height, ratio / 100))

	local actScrW = SystemHelper.GetScreenWidth()
	local actScrH = SystemHelper.GetScreenHeight()
	local actScrR = Mathf.Round(actScrW / actScrH * 100)
	local dRatio = actScrR - ratio

	SystemHelper.Log(string.format("Ratio Delta = %d", dRatio))

	local isRatioChanged = false

	if Mathf.Abs(dRatio) > 12 then
		isRatioChanged = true

		SystemHelper.Log(string.format("[ Screen Resolution: %d x %d @ %4.2f]", width, height, ratio / 100))
		SystemHelper.Log(string.format("[ Different Screen Resolution: %d x %d @ %4.2f]", actScrW, actScrH, actScrR / 100))
	else
		SystemHelper.Log("[ Screen Resolution or Aspect Ratio has NOT been changed... ]")
	end

	return isRatioChanged, actScrW, actScrH, actScrR
end

function LS_Setting.GenLocalPos(slotIdx)
	local modeIdx = LS_Setting.InputMode.TP
	local tpCfg = LS_Setting.inputConfig[modeIdx][slotIdx]
	local whMatch = 1
	local designWidth = LS_Setting.designWidth
	local designHeight = LS_Setting.designHeight
	local rar = tpCfg.RAR
	local screenWidth = 1334
	local screenHeight = 750
	local aspectRatio = 178

	if rar == nil then
		screenWidth = LS_Setting.previousScreenWidth
		screenHeight = LS_Setting.previousScreenHeight
		aspectRatio = Mathf.Round(screenWidth / screenHeight * 100)
	else
		screenWidth = rar.x
		screenHeight = rar.y
		aspectRatio = rar.s
	end

	local actualWidth = screenWidth
	local actualHeight = screenHeight
	local pixelScale = 1

	if aspectRatio > 170 then
		pixelScale = designHeight / screenHeight
		actualWidth = Mathf.Round(screenWidth * pixelScale)
		actualHeight = designHeight
		whMatch = 1

		if pixelScale > 1 and Mathf.Abs(designWidth - actualWidth) <= 12 then
			actualWidth = designWidth
		end
	else
		pixelScale = designWidth / screenWidth
		actualWidth = designWidth
		actualHeight = Mathf.Round(screenHeight * pixelScale)
		whMatch = 0

		if pixelScale > 1 and Mathf.Abs(designHeight - actualHeight) <= 12 then
			actualHeight = designHeight
		end
	end

	local halfActualWidth = Mathf.Round(0.5 * actualWidth)
	local halfActualHeight = Mathf.Round(0.5 * actualHeight)
	local localPos = {}
	local oriData = LS_Setting.UiBtn

	for k, v in pairs(tpCfg) do
		if k ~= "RAR" then
			local uiData = oriData[k]
			local mt = uiData[1]
			local pX, pY = SystemHelper.GetOriUiPos(v.x, v.y, halfActualWidth, halfActualHeight, mt)

			localPos[k] = {
				Mathf.Ceil(pX),
				Mathf.Ceil(pY)
			}
		else
			localPos[k] = {}
		end
	end

	if localPos.RAR == nil then
		localPos.RAR = {}
	end

	return localPos
end

function LS_Setting.AdaptLayout(slotIdx)
	local modeIdx = LS_Setting.InputMode.TP
	local tpCfg = LS_Setting.inputConfig[modeIdx][slotIdx]
	local whMatch = 1
	local designWidth = LS_Setting.designWidth
	local designHeight = LS_Setting.designHeight
	local screenWidth = LS_Setting.screenWidth
	local screenHeight = LS_Setting.screenHeight
	local actualWidth = screenWidth
	local actualHeight = screenHeight
	local aspectRatio = screenWidth / screenHeight
	local pixelScale = 1

	if aspectRatio > 1.7 then
		pixelScale = designHeight / screenHeight
		actualWidth = Mathf.Round(screenWidth * pixelScale)
		actualHeight = designHeight
		whMatch = 1
	else
		pixelScale = designWidth / screenWidth
		actualWidth = designWidth
		actualHeight = Mathf.Round(screenHeight * pixelScale)
		whMatch = 0
	end

	local halfActualWidth = Mathf.Round(0.5 * actualWidth)
	local halfActualHeight = Mathf.Round(0.5 * actualHeight)

	SystemHelper.Log("------------------------------------------------")

	local tempPos = LS_Setting.GenLocalPos(slotIdx)

	SystemHelper.Log(string.format("@@@@@@@@@@@@@ %d, %d", halfActualWidth, halfActualHeight))

	local oriData = LS_Setting.UiBtn

	for k, v in pairs(tempPos) do
		if k ~= "RAR" then
			local uiData = oriData[k]
			local mt = uiData[1]
			local lx = v[1]
			local ly = v[2]
			local pX, pY = SystemHelper.ReCompUiPos(lx, ly, halfActualWidth, halfActualHeight, mt)

			tpCfg[k].x = Mathf.Ceil(pX)
			tpCfg[k].y = Mathf.Ceil(pY)
		else
			local ResolutionAndAspectRatio = {
				x = Mathf.Round(actualWidth),
				y = Mathf.Round(actualHeight),
				s = Mathf.Round(aspectRatio * 100)
			}

			tpCfg.RAR = SystemHelper.DeepCopy(ResolutionAndAspectRatio)

			SystemHelper.Log(string.format("%s: %d, %d, %d", k, tpCfg[k].x, tpCfg[k].y, tpCfg[k].s))
		end
	end

	SystemHelper.Log("------------------------------------------------")
end

function LS_Setting.AdaptLayoutAll()
	for i = 1, 4 do
		LS_Setting.AdaptLayout(i)
	end
end

function LS_Setting.CreateDefaultTouchScreenLayout()
	SystemHelper.Log("[ LS_Setting__CreateDefaultTouchScreenLayout() ]")

	local modeIdx = LS_Setting.InputMode.TP
	local slotDef = LS_Setting.InputProfileDefault[modeIdx]
	local tpCfg = LS_Setting.inputConfig[modeIdx][slotDef]
	local designWidth = LS_Setting.designWidth
	local designHeight = LS_Setting.designHeight
	local screenWidth = SystemHelper.GetScreenWidth()
	local screenHeight = SystemHelper.GetScreenHeight()

	SystemHelper.Log(screenWidth .. ", " .. screenHeight)

	local actualWidth = screenWidth
	local actualHeight = screenHeight
	local aspectRatio = screenWidth / screenHeight
	local pixelScale = 1

	if aspectRatio > 1.7 then
		pixelScale = designHeight / screenHeight
		actualWidth = screenWidth * pixelScale
		actualHeight = designHeight

		if pixelScale > 1 and Mathf.Abs(designWidth - actualWidth) <= 12 then
			actualWidth = designWidth
		end
	else
		pixelScale = designWidth / screenWidth
		actualWidth = designWidth
		actualHeight = screenHeight * pixelScale

		if pixelScale > 1 and Mathf.Abs(designHeight - actualHeight) <= 12 then
			actualHeight = designHeight
		end
	end

	local halfActualWidth = 0.5 * actualWidth
	local halfActualHeight = 0.5 * actualHeight
	local oriData = LS_Setting.UiBtn

	for k, v in pairs(oriData) do
		local mt = v[1]
		local lx = v[2]
		local ly = v[3]
		local pX, pY = SystemHelper.ReCompUiPos(lx, ly, halfActualWidth, halfActualHeight, mt)
		local elem = {
			s = 100,
			x = Mathf.Ceil(pX),
			y = Mathf.Ceil(pY)
		}

		tpCfg[k] = elem
	end

	local ResolutionAndAspectRatio = {
		x = Mathf.Round(actualWidth),
		y = Mathf.Round(actualHeight),
		s = Mathf.Round(aspectRatio * 100)
	}

	tpCfg.RAR = ResolutionAndAspectRatio
end

function LS_Setting.SaveAsDefaultTouchScreenLayout(layout)
	SystemHelper.Log("[ LS_Setting__SaveAsDefaultTouchScreenLayout() ]")

	local modeIdx = LS_Setting.InputMode.TP
	local idxDef = LS_Setting.InputProfileDefault[modeIdx]
	local tpCfg = LS_Setting.inputConfig[modeIdx]
	local data = {}

	for k, v in pairs(layout) do
		data[k] = SystemHelper.DeepCopy(v)
	end

	tpCfg[idxDef] = data
	LS_Setting.inputConfig[modeIdx] = tpCfg

	LS_Setting.Update()
end

function LS_Setting.UpdateDefaultTouchScreenRawInfo()
	local modeIdx = LS_Setting.InputMode.TP
	local idxDef = LS_Setting.InputProfileDefault[modeIdx]
	local tpCfg = LS_Setting.inputConfig[modeIdx][idxDef]

	if tpCfg.RAR == nil then
		local ResolutionAndAspectRatio = {
			x = Mathf.Round(LS_Setting.screenWidth),
			y = Mathf.Round(LS_Setting.screenHeight),
			s = Mathf.Round(LS_Setting.screenRatio)
		}

		tpCfg.RAR = ResolutionAndAspectRatio

		SystemHelper.Log("Add DEFAULT touch screen raw info!!!!!!!!!!!!!!!!!")
	end
end

function LS_Setting.UpdateTouchScreenLayoutData(idxSel, scrW, scrH)
	local mode = LS_Setting.InputMode.TP
	local tpCfg = LS_Setting.inputConfig[mode][idxSel]

	if tpCfg ~= nil and tpCfg.RAR ~= nil then
		tpCfg.RAR.x = Mathf.Round(scrW)
		tpCfg.RAR.y = Mathf.Round(scrH)
		tpCfg.RAR.s = Mathf.Round(scrW / scrH * 100)

		SystemHelper.Log("Update touch screen raw info!!!!!!!!!!!!!!!!! " .. idxSel)
	end
end

function LS_Setting.AutoAdaptTouchScreenLayoutData(idxSel)
	local mode = LS_Setting.InputMode.TP
	local idxDef = LS_Setting.InputProfileDefault[mode]
	local tpCfg = LS_Setting.inputConfig[mode][idxSel]
	local btnCount = table.nums(LS_Setting.UiName)

	for i = 1, btnCount do
		local name = LS_Setting.UiName[i]
	end

	if tpCfg.RAR == nil then
		local ResolutionAndAspectRatio = {
			x = Mathf.Round(LS_Setting.screenWidth),
			y = Mathf.Round(LS_Setting.screenHeight),
			s = Mathf.Round(LS_Setting.screenRatio)
		}

		tpCfg.RAR = ResolutionAndAspectRatio

		LS_Setting.Update()
		SystemHelper.Log("Upgrade DEFAULT touch screen layout!!!!!!!!!!!!!!!!!")
	end
end

function LS_Setting.CloneTouchScreenLayoutFromDefault()
	SystemHelper.Log("[ ________ LS_Setting.CloneTouchScreenLayoutFromDefault() ________ ]")

	local mode = LS_Setting.InputMode.TP
	local idxDef = LS_Setting.InputProfileDefault[mode]
	local CfgDef = LS_Setting.inputConfig[mode][idxDef]

	for idx = 1, 3 do
		LS_Setting.inputConfig[mode][idx] = SystemHelper.DeepCopy(CfgDef)

		SystemHelper.Log(string.format("[ Initialize touch profile: %d ]", idx))
	end
end

function LS_Setting.SetCameraParamX(value)
	GPKey.CAM_X = value
	LS_Setting.camera.horizontal = value
end

function LS_Setting.SetCameraParamY(value)
	GPKey.CAM_Y = value
	LS_Setting.camera.vertical = value
end

function LS_Setting.UpdateTouchUi()
	if not LS_Setting.enableCustomTPInput then
		return
	end

	local isCfgMod = false
	local isScrMod = false
	local mode = LS_Setting.InputMode.TP
	local idxDef = LS_Setting.InputProfileDefault[mode]
	local cfgDef = LS_Setting.GetInputConfig(mode, idxDef)

	if table.nums(cfgDef) <= 0 then
		LS_Setting.CreateDefaultTouchScreenLayout()

		isCfgMod = true
	end

	if LS_Setting.CheckAspectRatio() then
		isScrMod = true
	end

	if cfgDef.BAR == nil then
		LS_Setting.UpdateDefaultTouchScreenRawInfo()

		isCfgMod = true
	end

	local idxSel = LS_Setting.inputSelect[mode][LS_Setting.InputProfileIndex.Current]
	local cfgSel = LS_Setting.GetInputConfig(mode, idxSel)

	if table.nums(cfgSel) <= 0 then
		LS_Setting.CloneTouchScreenLayoutFromDefault()

		isCfgMod = true
	elseif isScrMod then
		LS_Setting.AdaptLayoutAll()

		isCfgMod = true
	end

	if isCfgMod == true then
		SystemHelper.Log("InGame - Update touch screen UI layout")
		LS_Setting.Update()
	end
end

function LS_Setting.GetNickname()
	return LS_Setting.nickname
end

function LS_Setting.SetNickname(value)
	if value ~= nil and type(value) == "string" then
		LS_Setting.nickname = tostring(value)
	else
		LS_Setting.nickname = ""
	end
end

function LS_Setting.ReCheckLanguage(currLang)
	local tabIdx = SettingCfg.Pnl.Gameplay
	local rowIdx = SettingCfg.Idx[tabIdx].Language
	local langElem = SettingCfg.Tab[tabIdx][rowIdx][4]
	local langCount = table.nums(langElem)

	for i = 1, langCount do
		local elem = langElem[i]

		if elem[3] == currLang then
			if elem[2] == true then
				return
			else
				LS_Setting.lang = "us"

				return
			end
		end
	end

	LS_Setting.lang = "us"
end

function LS_Setting.SetTempChallengingInfo(level, difficulty)
	LS_Setting.lastChallengingLevel = level % 1000
	LS_Setting.lastChallengingDifficulty = difficulty
end

function LS_Setting.GetTempChallengingInfo()
	return LS_Setting.lastChallengingLevel, LS_Setting.lastChallengingDifficulty
end

function LS_Setting.ResetTempChallengingInfo()
	LS_Setting.lastChallengingLevel = -1
	LS_Setting.lastChallengingDifficulty = -1
end

function LS_Setting.Reset()
	LS_Setting.ignoreLMB = false
	LS_Setting.sound = 100
	LS_Setting.bgm = 100
	LS_Setting.sfx = 100
	LS_Setting.voice = 100
	LS_Setting.sensitivity = 50
	LS_Setting.lang = Device.getSysLang()
	LS_Setting.voiceLanguage = "en"
	LS_Setting.save = 0
	LS_Setting.graphics = {}
	LS_Setting.camera = {}
	LS_Setting.graphics.quality = tonumber(Common.GetDeviceGeneration() > 0 and Common.GetDeviceGeneration() or LS_Setting.QualityLevel.Ultra)

	if Platform == PlatformType.IOS then
		LS_Setting.graphics.framerate = tonumber(Common.GetDeviceGeneration() > LS_Setting.FrameRateLevel.High and LS_Setting.FrameRateLevel.High or LS_Setting.FrameRateLevel.Norm)
	else
		LS_Setting.graphics.framerate = LS_Setting.FrameRateLevel.High
	end

	if Platform == PlatformType.TVOS then
		LS_Setting.graphics.quality = tonumber(LS_Setting.QualityLevel.Ultra)
	end

	LS_Setting.graphics.brightness = 25
	LS_Setting.camera.type = LS_Setting.CameraType.Type1
	LS_Setting.camera.horizontal = 1
	LS_Setting.camera.vertical = 1
	LS_Setting.camera.mouse = 1
	LS_Setting.errno = 0
	LS_Setting.difficulty = LS_Setting.Difficulty.Normal
	LS_Setting.isJoystickReady = false
	LS_Setting.isJoystickConnected = false
	LS_Setting.isKeyboardMouseReady = false

	if Platform == PlatformType.IOS or Platform == PlatformType.TVOS then
		LS_Setting.isKeyboardConnected = false
		LS_Setting.isMouseConnected = false
	end

	LS_Setting.subtitle = 1
	LS_Setting.fixedvlj = 0
	LS_Setting.touchUiAlpha = 1
	LS_Setting.showTimeAndScore = 1
	LS_Setting.skins = {}
	LS_Setting.skins.terrence_special = 1
	LS_Setting.enableCustomInput = false
	LS_Setting.enableCustomKMInput = false
	LS_Setting.enableCustomTPInput = false
	LS_Setting.enableCustomGPInput = false
	LS_Setting.lastSlotPlayed = 1
	LS_Setting.gameTimes = 0
	LS_Setting.lastAnnouncementId = 0
end

return LS_Setting
