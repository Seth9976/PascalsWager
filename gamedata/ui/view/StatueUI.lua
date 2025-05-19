-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/StatueUI.lua

StatueUI = {}

local this = StatueUI

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "StatueUI",
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
		exportName = "StatuePanel_Back_L",
		path = "StatuePanel/Back",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_Panel_R",
		path = "StatuePanel/Panel"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_Panel_Bg_Text",
		path = "StatuePanel/Panel/Bg/Text",
		components = {
			23
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_Panel_BoardList",
		path = "StatuePanel/Panel/BoardList",
		components = {
			24
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_GamePadIconGroup_R",
		path = "StatuePanel/GamePadIconGroup"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_GamePadIconGroup_A",
		path = "StatuePanel/GamePadIconGroup/A"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_GamePadIconGroup_A_Btn_Icon_a",
		path = "StatuePanel/GamePadIconGroup/A/Btn_Icon_a"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_GamePadIconGroup_A_Text",
		path = "StatuePanel/GamePadIconGroup/A/Text",
		components = {
			25
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ExchangePanel_ExchangeBG_GamePadIconGroup_B",
		path = "StatuePanel/GamePadIconGroup/B"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_GamePadIconGroup_B_Btn_Icon_b",
		path = "StatuePanel/GamePadIconGroup/B/Btn_Icon_b"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_GamePadIconGroup_B_Text",
		path = "StatuePanel/GamePadIconGroup/B/Text",
		components = {
			26
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup",
		path = "StatuePanel/KeyboardIconGroup"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup_A",
		path = "StatuePanel/KeyboardIconGroup/A"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup_A_Key_Enter",
		path = "StatuePanel/KeyboardIconGroup/A/Key_Enter"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup_A_Text",
		path = "StatuePanel/KeyboardIconGroup/A/Text",
		components = {
			27
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup_B",
		path = "StatuePanel/KeyboardIconGroup/B"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup_B_Key_Esc",
		path = "StatuePanel/KeyboardIconGroup/B/Key_Esc"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatuePanel_KeyboardIconGroup_B_Text",
		path = "StatuePanel/KeyboardIconGroup/B/Text",
		components = {
			28
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_STATUEUI.STATUEPANEL_PANEL_BG_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Board",
				abName = "Main"
			}
		}
	},
	{
		text = "UI_STATUEUI.STATUEPANEL_GAMEPADICONGROUP_A_TEXT",
		type = "text"
	},
	{
		text = "UI_STATUEUI.STATUEPANEL_GAMEPADICONGROUP_B_TEXT",
		type = "text"
	},
	{
		text = "UI_STATUEUI.STATUEPANEL_KEYBOARDICONGROUP_A_TEXT",
		type = "text"
	},
	{
		text = "UI_STATUEUI.STATUEPANEL_KEYBOARDICONGROUP_B_TEXT",
		type = "text"
	}
}
this.Board = {
	{
		abName = "StatueUI",
		exportName = "",
		assetName = "Board",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Gain",
		path = "Button_Gain",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Gain_SelectedLight",
		path = "Button_Gain/SelectedLight"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Title",
		path = "Text_Title",
		components = {
			9
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Content",
		path = "Text_Content",
		components = {
			10
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Possess",
		path = "Text_Possess",
		components = {
			11
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Mask",
		path = "Mask"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_STATUEUI.TEXT_TITLE",
		type = "text"
	},
	{
		text = "UI_STATUEUI.TEXT_CONTENT",
		type = "text"
	},
	{
		text = "UI_STATUEUI.TEXT_POSSESS",
		type = "text"
	}
}

return StatueUI
