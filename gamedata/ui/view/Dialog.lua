-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Dialog.lua

Dialog = {}

local this = Dialog

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "Dialog",
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
		exportName = "DialogPanel",
		path = "DialogPanel",
		components = {
			21
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_BarU",
		path = "DialogPanel/BarU"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_BarD",
		path = "DialogPanel/BarD"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_B",
		path = "DialogPanel/DialogPanel_B"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_B_SoloBG",
		path = "DialogPanel/DialogPanel_B/SoloBG"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_B_SoloBG_SoloContent",
		path = "DialogPanel/DialogPanel_B/SoloBG/SoloContent",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_B_ClickBG",
		path = "DialogPanel/DialogPanel_B/ClickBG"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_Content",
		path = "DialogPanel/DialogPanel_B/ClickBG/Content",
		components = {
			23
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NextImg",
		path = "DialogPanel/DialogPanel_B/ClickBG/Content/NextImg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_B_JoystickPanel",
		path = "DialogPanel/DialogPanel_B/JoystickPanel"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_a",
		path = "DialogPanel/DialogPanel_B/JoystickPanel/Btn_Icon_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_B_ClickBG_a_Text",
		path = "DialogPanel/DialogPanel_B/JoystickPanel/Btn_Icon_A/Text",
		components = {
			24
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_RB",
		path = "DialogPanel/DialogPanel_RB"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_SelectPanel",
		path = "DialogPanel/DialogPanel_RB/SelectPanel",
		components = {
			25
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_DialogPanel_RT_Position_2_Text",
		path = "DialogPanel/DialogPanel_RT/Position_2/Text",
		components = {
			26
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_Map_Places_L",
		path = "DialogPanel/Map_Places_L"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_Map_Places_Places_Name_Country_Text",
		path = "DialogPanel/Map_Places_L/Places_Name/Country_Text",
		components = {
			27
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DialogPanel_Map_Places_Places_Name_City_Text",
		path = "DialogPanel/Map_Places_L/Places_Name/City_Text",
		components = {
			28
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_DIALOG.DIALOGPANEL_DIALOGPANEL_B_SOLOBG_SOLOCONTENT",
		type = "text"
	},
	{
		text = "UI_DIALOG.DIALOGPANEL_CONTENT",
		type = "text"
	},
	{
		text = "UI_DIALOG.DIALOGPANEL_DIALOGPANEL_B_CLICKBG_A_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Selection",
				abName = "Main"
			}
		}
	},
	{
		text = "UI_DIALOG.DIALOGPANEL_DIALOGPANEL_RT_POSITION_2_TEXT",
		type = "text"
	},
	{
		text = "UI_DIALOG.DIALOGPANEL_MAP_PLACES_PLACES_NAME_COUNTRY_TEXT",
		type = "text"
	},
	{
		text = "UI_DIALOG.DIALOGPANEL_MAP_PLACES_PLACES_NAME_CITY_TEXT",
		type = "text"
	}
}
this.Selection = {
	{
		abName = "Dialog",
		exportName = "",
		assetName = "Selection",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "BG",
		path = "BG",
		components = {
			4
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text",
		path = "Text",
		components = {
			5
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_DIALOG.TEXT",
		type = "text"
	}
}

return Dialog
