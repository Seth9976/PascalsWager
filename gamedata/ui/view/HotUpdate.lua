-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/HotUpdate.lua

HotUpdate = {}

local this = HotUpdate

this.mainComponent = {
	{
		abName = "Common",
		exportName = "",
		assetName = "HotUpdate",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Image_Loading_B",
		path = "Panel/Icon"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Progress",
		path = "Panel/Image_ProgressBg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Progress",
		path = "Panel/Image_Progress"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Progress",
		path = "Panel/Text_Progress",
		components = {
			10
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Tips",
		path = "Panel/Text_Tips",
		components = {
			11
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Dialog_Button",
		path = "Panel/Dialog/ConfirmButton",
		components = {
			12
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Dialog_Button_Text",
		path = "Panel/Dialog/ConfirmButton/ConfirmButtonText",
		components = {
			13
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Dialog_Contents",
		path = "Panel/Dialog/Contents",
		components = {
			14
		}
	},
	{
		text = "UI_HOTUPDATE.TEXT_PROGRESS",
		type = "text"
	},
	{
		text = "UI_HOTUPDATE.TEXT_TIPS",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_HOTUPDATE.PANEL_DIALOG_BUTTON_TEXT",
		type = "text"
	},
	{
		text = "UI_HOTUPDATE.PANEL_DIALOG_CONTENTS",
		type = "text"
	}
}

return HotUpdate
