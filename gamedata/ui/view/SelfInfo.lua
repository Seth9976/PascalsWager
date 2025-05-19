-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/SelfInfo.lua

SelfInfo = {}

local this = SelfInfo

this.mainComponent = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "SelfInfo",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "top",
		groupMode = 2,
		type = "group"
	},
	{
		groupId = 10002,
		groupName = "left",
		groupMode = 2,
		type = "group"
	},
	{
		groupId = 10004,
		groupName = "JoystickIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_B",
		path = "SelfInfoPanel/Panel_B"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfoButton",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfoButton",
		components = {
			48
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfoButton_Text",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfoButton/Text",
		components = {
			49
		}
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "PI_HudIconLT",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfoButton/PI_HudIconLT"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortraitButton",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortraitButton",
		components = {
			50
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortraitButton_Text",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortraitButton/Text",
		components = {
			51
		}
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_B_InfoBoard_ChangePortraitButton_PI_HudIconRT",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortraitButton/PI_HudIconRT"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_Close",
		path = "SelfInfoPanel/Panel_B/InfoBoard/Close",
		components = {
			52
		}
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "PI_HudIconB",
		path = "SelfInfoPanel/Panel_B/InfoBoard/Close/PI_HudIconB"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_SelfPortrait",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/SelfPortrait"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_SelfPortrait_SelfFrame",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/SelfPortrait/SelfFrame"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_IdText",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/IdText",
		components = {
			53
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_LevelText",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/LevelText",
		components = {
			54
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_ChangeNameButton",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/ChangeNameButton",
		components = {
			55
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_ChangeNameButton_Text",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/ChangeNameButton/Text",
		components = {
			56
		}
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "PI_HudIconY",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/ChangeNameButton/PI_HudIconY"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_LogoutButton",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/LogoutButton",
		components = {
			57
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_SelfInfo_LogoutButton_Text",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/LogoutButton/Text",
		components = {
			58
		}
	},
	{
		groupId = 10004,
		type = "gameObject",
		note = "",
		exportName = "PI_HudIconX",
		path = "SelfInfoPanel/Panel_B/InfoBoard/SelfInfo/LogoutButton/PI_HudIconX"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_FrameTabButton",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/FrameTabButton",
		components = {
			59
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_FrameTabButton_Text",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/FrameTabButton/Text",
		components = {
			60
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_PortraitTabButton",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/PortraitTabButton",
		components = {
			61
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_PortraitTabButton_Text",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/PortraitTabButton/Text",
		components = {
			62
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/FrameScroll"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll_ViewPort_Content",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/FrameScroll/ViewPort/Content",
		components = {
			63
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll_SelfPortrait",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/FrameScroll/SelfPortrait"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_FrameScroll_SelfPortrait_SelfFrame",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/FrameScroll/SelfPortrait/SelfFrame"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_PortraitScroll",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/PortraitScroll"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_InfoBoard_ChangePortrait_PortraitScroll_ViewPort_Content",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/PortraitScroll/ViewPort/Content",
		components = {
			64
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_B_InfoBoard_ChangePortrait_Panel",
		path = "SelfInfoPanel/Panel_B/InfoBoard/ChangePortrait/PI_PortraitHudTips"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName",
		path = "SelfInfoPanel/Panel_ChangeName"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_Panel_B",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_BG_Text",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/Text",
		components = {
			65
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_Text1",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/Text (1)",
		components = {
			66
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_BG_InputField",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/InputField"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_InputField_Placeholder",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/InputField/Placeholder",
		components = {
			67
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_InputField_Text",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/InputField/Text",
		components = {
			68
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_BG_Cancel",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/Cancel",
		components = {
			69
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_Cancel_Text",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/Cancel/Text",
		components = {
			70
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_BG_Confirm",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/Confirm",
		components = {
			71
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SelfInfoPanel_Panel_ChangeName_Confirm_Text2",
		path = "SelfInfoPanel/Panel_ChangeName/Panel_B/BG/Confirm/Text (2)",
		components = {
			72
		}
	},
	{
		mode = 2,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_SELFINFOBUTTON_TEXT",
		type = "text"
	},
	{
		mode = 2,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_CHANGEPORTRAITBUTTON_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_SELFINFO_IDTEXT",
		type = "text"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_SELFINFO_LEVELTEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_SELFINFO_CHANGENAMEBUTTON_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_SELFINFO_LOGOUTBUTTON_TEXT",
		type = "text"
	},
	{
		mode = 2,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_CHANGEPORTRAIT_FRAMETABBUTTON_TEXT",
		type = "text"
	},
	{
		mode = 2,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_INFOBOARD_CHANGEPORTRAIT_PORTRAITTABBUTTON_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Frame",
				abName = "Lobby"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Portrait",
				abName = "Lobby"
			}
		}
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_PANEL_CHANGENAME_BG_TEXT",
		type = "text"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_PANEL_CHANGENAME_TEXT1",
		type = "text"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_PANEL_CHANGENAME_INPUTFIELD_PLACEHOLDER",
		type = "text"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_PANEL_CHANGENAME_INPUTFIELD_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_PANEL_CHANGENAME_CANCEL_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_SELFINFO.SELFINFOPANEL_PANEL_CHANGENAME_CONFIRM_TEXT2",
		type = "text"
	}
}
this.Frame = {
	{
		abName = "Arena10008",
		exportName = "",
		assetName = "Frame",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrameButton",
		path = "FrameButton",
		components = {
			3
		}
	},
	{
		mode = 2,
		type = "button"
	}
}
this.Portrait = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "Portrait",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "PortraitButton",
		path = "PortraitButton",
		components = {
			3
		}
	},
	{
		mode = 2,
		type = "button"
	}
}

return SelfInfo
