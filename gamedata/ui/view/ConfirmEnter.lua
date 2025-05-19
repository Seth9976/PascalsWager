-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/ConfirmEnter.lua

ConfirmEnter = {}

local this = ConfirmEnter

this.mainComponent = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "ConfirmEnter",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ConfirmEntry_Button_Confirm",
		path = "PanelConfirm/Button_Confirm",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "PanelConfirm_Button_Confirm_Text",
		path = "PanelConfirm/Button_Confirm/Text",
		components = {
			9
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ConfirmEntry_Team1",
		path = "PanelConfirm/Self_PhotoGroup",
		components = {
			10
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ConfirmEntry_Team2",
		path = "PanelConfirm/Enemy_PhotoGroup",
		components = {
			11
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_WaitTime",
		path = "PanelConfirm/Text_WaitTime",
		components = {
			12
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ConfirmEntry_Text_Title",
		path = "PanelConfirm/Text_WaitConfirm",
		components = {
			13
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_CONFIRMENTER.PANELCONFIRM_BUTTON_CONFIRM_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "WaitPlayerPhoto",
				abName = "Lobby"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "WaitPlayerPhoto",
				abName = "Lobby"
			}
		}
	},
	{
		text = "UI_CONFIRMENTER.TEXT_WAITTIME",
		type = "text"
	},
	{
		text = "UI_CONFIRMENTER.CONFIRMENTRY_TEXT_TITLE",
		type = "text"
	}
}
this.WaitPlayerPhoto = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "WaitPlayerPhoto",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Icon",
		path = "Image_Photo"
	}
}

return ConfirmEnter
