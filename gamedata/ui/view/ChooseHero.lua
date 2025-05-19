-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/ChooseHero.lua

ChooseHero = {}

local this = ChooseHero

this.mainComponent = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "ChooseHero",
		type = "prefab"
	},
	{
		groupId = 10000,
		groupName = "map",
		groupMode = 2,
		type = "group"
	},
	{
		groupId = 10001,
		groupName = "pvp",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10002,
		groupName = "pve",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10003,
		groupName = "Joystick",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10004,
		groupName = "JoystickIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10005,
		groupName = "KeyboardIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Touch",
		path = "Panel_Touch",
		components = {
			43
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Panel_PvpWait",
		path = "Panel_PvpWait"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Wait_Text_WaitChoose",
		path = "Panel_PvpWait/Text_WaitChoose",
		components = {
			44
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Team_L",
		path = "Panel_Team",
		components = {
			45
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Team5_L",
		path = "Panel_Team5",
		components = {
			46
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Hero_Name_RB",
		path = "Panel_Hero_Name"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Hero_Name_HeroName",
		path = "Panel_Hero_Name/HeroName"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Hero_Name_HeroName_HeroIcon",
		path = "Panel_Hero_Name/HeroName/HeroIcon"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Hero_List_B",
		path = "Panel_Hero_List"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Scroll_Hero",
		path = "Panel_Hero_List/Scroll_Hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Scroll_Hero_Content",
		path = "Panel_Hero_List/Scroll_Hero/Viewport/Content",
		components = {
			47
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Intro_L",
		path = "Panel_L"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_L_Text_HeroName",
		path = "Panel_L/Text",
		components = {
			48
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_L_Text_HeroIntro",
		path = "Panel_L/Scroll View/Viewport/Content/Text",
		components = {
			49
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Costume_R",
		path = "Panel_R"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Scroll_Costume",
		path = "Panel_R/Scroll_Costume"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Scroll_Costume_Content",
		path = "Panel_R/Scroll_Costume/Viewport/Content",
		components = {
			50
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Confirm_B",
		path = "Button_Confirm",
		components = {
			51
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Confirm_Text",
		path = "Button_Confirm/Text",
		components = {
			52
		}
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "Button_Confirm_Image",
		path = "Button_Confirm/ChooseHeroBtnConfirm_GpIcon_A"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Button_Back_L",
		path = "Button_Back",
		components = {
			53
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Skill_R",
		path = "Button_Skill",
		components = {
			54
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Mode_R",
		path = "Panel_Modle"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Modle_Free",
		path = "Panel_Modle/Free"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Panel_Enemy",
		path = "Panel_Modle/Free/Panel_Enemy",
		components = {
			55
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map",
		path = "Panel_Modle/Free/Panel_Map"
	},
	{
		groupId = 10000,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map_Button_Map1",
		path = "Panel_Modle/Free/Panel_Map/Button_Map1",
		components = {
			56
		}
	},
	{
		groupId = 10000,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map_Button_Map2",
		path = "Panel_Modle/Free/Panel_Map/Button_Map2",
		components = {
			57
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Modle_Story",
		path = "Panel_Modle/Story"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Modle_Story_Story_Title",
		path = "Panel_Modle/Story/Story_Title"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Modle_Story_Text",
		path = "Panel_Modle/Story/Text",
		components = {
			58
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_NavBar_B",
		path = "Panel_NavBar_B"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_NavBar_B",
		path = "Panel_NavBar_B/Panel_NavBar_R"
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "Panel_NavBar_BR_GpBtnB",
		path = "Panel_NavBar_B/Panel_NavBar_R/NavBar_GPBtnB/ChooseHeroNavBar_GpIcon_B"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_NavBar_B_Panel_NavBar_R_GPIcon_B_GpBtnB_Text",
		path = "Panel_NavBar_B/Panel_NavBar_R/NavBar_GPBtnB/ChooseHeroNavBar_GpIcon_B/Text",
		components = {
			59
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_CHOOSEHERO.WAIT_TEXT_WAITCHOOSE",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "MateInfo",
				abName = "Lobby"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "MateInfo",
				abName = "Lobby"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "HeroIcon",
				abName = "Lobby"
			}
		}
	},
	{
		text = "UI_CHOOSEHERO.PANEL_L_TEXT_HERONAME",
		type = "text"
	},
	{
		text = "UI_CHOOSEHERO.PANEL_L_TEXT_HEROINTRO",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "WearItem",
				abName = "Lobby"
			}
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_CHOOSEHERO.BUTTON_CONFIRM_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "HeroIcon",
				abName = "Lobby"
			}
		}
	},
	{
		mode = 2,
		type = "button"
	},
	{
		mode = 2,
		type = "button"
	},
	{
		text = "UI_CHOOSEHERO.PANEL_MODLE_STORY_TEXT",
		type = "text"
	},
	{
		text = "UI_CHOOSEHERO.PANEL_NAVBAR_B_PANEL_NAVBAR_R_GPICON_B_GPBTNB_TEXT",
		type = "text"
	}
}
this.MateInfo = {
	{
		abName = "ChooseHero",
		exportName = "",
		assetName = "MateInfo",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "confirm",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10002,
		groupName = "normal",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10003,
		groupName = "change",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Image_ConfirmBase",
		path = "Image_ConfirmBase"
	},
	{
		groupId = 10003,
		type = "gameObject",
		note = "",
		exportName = "Light_Change",
		path = "Light_Change"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Light_Confirm",
		path = "Light_Confirm"
	},
	{
		groupId = 10003,
		type = "gameObject",
		note = "",
		exportName = "Light_Change2",
		path = "Light_Change2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Photo",
		path = "Image_Mask/Image_Photo"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Light_Confirm2",
		path = "Light_Confirm2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Name",
		path = "Text_Name",
		components = {
			14
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Job",
		path = "Text_Job",
		components = {
			15
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Image_Confirm",
		path = "Image_Confirm"
	},
	{
		text = "UI_CHOOSEHERO.TEXT_NAME",
		type = "text"
	},
	{
		text = "UI_CHOOSEHERO.TEXT_JOB",
		type = "text"
	}
}
this.HeroIcon = {
	{
		abName = "ChooseHero",
		exportName = "",
		assetName = "HeroIcon",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Select",
		path = "Button_Select",
		components = {
			5
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Hero",
		path = "Button_Select/Image_Hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_HeroIcon_Button_Select_Text",
		path = "Button_Select/Text",
		components = {
			6
		}
	},
	{
		mode = 2,
		type = "button"
	},
	{
		text = "UI_CHOOSEHERO.LOADER_HEROICON_BUTTON_SELECT_TEXT",
		type = "text"
	}
}
this.WearItem = {
	{
		abName = "ChooseHero",
		exportName = "",
		assetName = "WearItem",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "JoystickIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Btn",
		path = "Btn",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Btn_WearName",
		path = "Btn/WearName",
		components = {
			9
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Btn_WearImg",
		path = "Btn/WearImg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Btn_LockImg",
		path = "Btn/LockImg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Btn_Light",
		path = "Btn/Light"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_CHOOSEHERO.BTN_WEARNAME",
		type = "text"
	}
}

return ChooseHero
