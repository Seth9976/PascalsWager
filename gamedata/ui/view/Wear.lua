-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Wear.lua

Wear = {}

local this = Wear

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "Wear",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "JoystickIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10002,
		groupName = "KeyboardIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_R",
		path = "WearPanel/Bg/RightPanel"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_Title_Text",
		path = "WearPanel/Bg/RightPanel/Title/Text",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearableBtn",
		path = "WearPanel/Bg/RightPanel/ConfirnGroup/WearableBtn",
		components = {
			23
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearableBtn_Btn_Icon_a",
		path = "WearPanel/Bg/RightPanel/ConfirnGroup/WearableBtn/Btn_Icon_a"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearLessBtn",
		path = "WearPanel/Bg/RightPanel/ConfirnGroup/WearLessBtn",
		components = {
			24
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_ConfirnGroup_WearLessBtn_Btn_Icon_a",
		path = "WearPanel/Bg/RightPanel/ConfirnGroup/WearLessBtn/Btn_Icon_a"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_ConfirnGroup_Text",
		path = "WearPanel/Bg/RightPanel/ConfirnGroup/Text",
		components = {
			25
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_WearList",
		path = "WearPanel/Bg/RightPanel/WearList"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RightPanel_WearList_Viewport_Content",
		path = "WearPanel/Bg/RightPanel/WearList/Viewport/Content",
		components = {
			26
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_DesPanel_DesText",
		path = "WearPanel/Bg/DesPanel/DesText",
		components = {
			27
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_RotateTouch",
		path = "WearPanel/Bg/RotateTouch",
		components = {
			28
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_BackBtn",
		path = "WearPanel/Bg/BackBtn",
		components = {
			29
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "PlayerInfoPanel_PlayerPanel_B_TabPanel_b",
		path = "WearPanel/Bg/b"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_b_Btn_Icon_b",
		path = "WearPanel/Bg/b/Btn_Icon_b"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_b_Text",
		path = "WearPanel/Bg/b/Text",
		components = {
			30
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_keyboard_esc",
		path = "WearPanel/Bg/keyboard_esc"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_keyboard_esc_Key_Esc",
		path = "WearPanel/Bg/keyboard_esc/Key_Esc"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "WearPanel_Bg_keyboard_esc_Text",
		path = "WearPanel/Bg/keyboard_esc/Text",
		components = {
			31
		}
	},
	{
		text = "UI_WEAR.WEARPANEL_BG_RIGHTPANEL_TITLE_TEXT",
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
		text = "UI_WEAR.WEARPANEL_BG_RIGHTPANEL_CONFIRNGROUP_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "WearItem",
				abName = "Main"
			}
		}
	},
	{
		text = "UI_WEAR.WEARPANEL_BG_DESPANEL_DESTEXT",
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
		text = "UI_WEAR.WEARPANEL_BG_B_TEXT",
		type = "text"
	},
	{
		text = "UI_WEAR.WEARPANEL_BG_KEYBOARD_ESC_TEXT",
		type = "text"
	}
}
this.WearItem = {
	{
		abName = "Wear",
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
		groupId = 0,
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
		text = "UI_WEAR.BTN_WEARNAME",
		type = "text"
	}
}

return Wear
