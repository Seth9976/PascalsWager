-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/MsgBoxSimple.lua

MsgBoxSimple = {}

local this = MsgBoxSimple

this.mainComponent = {
	{
		abName = "Common",
		exportName = "",
		assetName = "MsgBoxSimple",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "g10001",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderSimple",
		path = "LoaderSimple",
		components = {
			17
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderPanelWait",
		path = "LoaderPanelWait",
		components = {
			18
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderOkAndCancel",
		path = "LoaderOkAndCancel",
		components = {
			19
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderMenu",
		path = "LoaderMenu",
		components = {
			20
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderMenu_Loader",
		path = "LoaderMenu/Loader",
		components = {
			21
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderIntroduction",
		path = "LoaderIntroduction",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderGetItem",
		path = "LoaderGetItem",
		components = {
			23
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderSave_R",
		path = "LoaderSaveParanent/LoaderSave_R",
		components = {
			24
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderGetAchievement",
		path = "LoaderGetAchievement",
		components = {
			25
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderMessage",
		path = "LoaderMessage",
		components = {
			26
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderSlider",
		path = "LoaderSlider",
		components = {
			27
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "MsgBox_GameCtrlReq",
		path = "PanelGameControllerRequired"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "MsgBox_GameCtrlReq_TitleText",
		path = "PanelGameControllerRequired/TitleText",
		components = {
			28
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "MsgBox_GameCtrlReq_ContentText",
		path = "PanelGameControllerRequired/ContentText",
		components = {
			29
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "BoxLayout",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "PanelWait",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "ConfirmAndCancel",
				abName = "Common"
			}
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "MenuItem",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Introduction",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "GetItem",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Save",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "GetAchievement",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Message",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Slider",
				abName = "Common"
			}
		}
	},
	{
		text = "UI_MSGBOXSIMPLE.MSGBOX_GAMECTRLREQ_TITLETEXT",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.MSGBOX_GAMECTRLREQ_CONTENTTEXT",
		type = "text"
	}
}
this.BoxLayout = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "BoxLayout",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Message",
		path = "Text_Message",
		components = {
			3
		}
	},
	{
		text = "UI_MSGBOXSIMPLE.TEXT_MESSAGE",
		type = "text"
	}
}
this.PanelWait = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "PanelWait",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_WaitText",
		path = "Text_WaitText",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_WaitTime",
		path = "Text_WaitTime",
		components = {
			7
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Close",
		path = "Button_Close",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "LoaderPanelWait_#Loader#PanelWait_Button_Close_Text",
		path = "Button_Close/Text",
		components = {
			9
		}
	},
	{
		text = "UI_MSGBOXSIMPLE.TEXT_WAITTEXT",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.TEXT_WAITTIME",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.LOADERPANELWAIT_#LOADER#PANELWAIT_BUTTON_CLOSE_TEXT",
		type = "text"
	}
}
this.ConfirmAndCancel = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "ConfirmAndCancel",
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
		exportName = "MainPanel",
		path = "MainPanel"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Text_Message",
		path = "MainPanel/Text_Message",
		components = {
			15
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Confirm",
		path = "MainPanel/Panel/Button_Confirm",
		components = {
			16
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_ConfirmSelected",
		path = "MainPanel/Panel/Button_Confirm/ButtonSelected"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Confirm_Text",
		path = "MainPanel/Panel/Button_Confirm/Text",
		components = {
			17
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ProgressIndicator",
		path = "MainPanel/Panel/Button_Confirm/ProgressIndicator"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ProgressIndicatorBar",
		path = "MainPanel/Panel/Button_Confirm/ProgressIndicator/ProgressIndicatorBar"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Button_Confirm_a",
		path = "MainPanel/Panel/Button_Confirm/DialogReq_BtnIcon_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Cancel",
		path = "MainPanel/Panel/Button_Cancel",
		components = {
			18
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_CancelSelected",
		path = "MainPanel/Panel/Button_Cancel/ButtonSelected"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Cancel_Text",
		path = "MainPanel/Panel/Button_Cancel/Text",
		components = {
			19
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Button_Cancel_b",
		path = "MainPanel/Panel/Button_Cancel/DialogReq_BtnIcon_B"
	},
	{
		text = "UI_MSGBOXSIMPLE.TEXT_MESSAGE",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.BUTTON_CONFIRM_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.BUTTON_CANCEL_TEXT",
		type = "text"
	}
}
this.MenuItem = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "MenuItem",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_MenuItem_bg",
		path = "bg",
		components = {
			4
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_MenuItem_Text",
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
		text = "UI_MSGBOXSIMPLE.LOADER_MENUITEM_TEXT",
		type = "text"
	}
}
this.Introduction = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "Introduction",
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
		exportName = "BgButton",
		path = "BgButton",
		components = {
			26
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction_scale",
		path = "Introduction_scale"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction_scale_TitleText",
		path = "Introduction_scale/TitleText",
		components = {
			27
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Introduction_ContentText",
		path = "Introduction_scale/ContentText",
		components = {
			28
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction_scale_ConfirmBtn",
		path = "Introduction_scale/ConfirmBtn",
		components = {
			29
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction_ConfirmBtn_ProgressIndicator",
		path = "Introduction_scale/ProgressIndicator"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction_ConfirmBtn_ProgressIndicatorBar",
		path = "Introduction_scale/ProgressIndicator/MsgBox_ProgressIndicatorBg/MsgBox_ProgressIndicatorBar"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Introduction_ConfirmBtn_a",
		path = "Introduction_scale/ProgressIndicator/MsgBox_ProgressIndicatorBg/DialogReq_BtnIcon1_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Introduction_ConfirmBtn_Text",
		path = "Introduction_scale/ProgressIndicator/Text",
		components = {
			30
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale",
		path = "Introduction2_scale"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_TitleText",
		path = "Introduction2_scale/TitleText",
		components = {
			31
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Introduction2_ContentText",
		path = "Introduction2_scale/ContentText",
		components = {
			32
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_ConfirmBtn",
		path = "Introduction2_scale/ConfirmBtn",
		components = {
			33
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_Introduction_picture",
		path = "Introduction2_scale/Introduction_picture"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_ConfirmBtn_ProgressIndicator",
		path = "Introduction2_scale/ProgressIndicator2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_ConfirmBtn_ProgressIndicatorBar",
		path = "Introduction2_scale/ProgressIndicator2/MsgBox_ProgressIndicatorBg/MsgBox_ProgressIndicatorBar"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_ConfirmBtn_a",
		path = "Introduction2_scale/ProgressIndicator2/MsgBox_ProgressIndicatorBg/DialogReq_BtnIcon21_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Introduction2_ConfirmBtn_Text",
		path = "Introduction2_scale/ProgressIndicator2/Text",
		components = {
			34
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_NextArea",
		path = "Introduction2_scale/NextArea"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_NextArea_MsgBox_ProgressIndicatorBg_DialogReq_BtnIcon_A2",
		path = "Introduction2_scale/NextArea/MsgBox_ProgressIndicatorBg/DialogReq_BtnIcon22_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_NextArea_Text",
		path = "Introduction2_scale/NextArea/Text",
		components = {
			35
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_Next",
		path = "Introduction2_scale/Next",
		components = {
			36
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Introduction2_scale_Prev",
		path = "Introduction2_scale/Prev",
		components = {
			37
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.INTRODUCTION_SCALE_TITLETEXT",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.LOADER_INTRODUCTION_CONTENTTEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.LOADER_INTRODUCTION_CONFIRMBTN_TEXT",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.INTRODUCTION2_SCALE_TITLETEXT",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.LOADER_INTRODUCTION2_CONTENTTEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.LOADER_INTRODUCTION2_CONFIRMBTN_TEXT",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.INTRODUCTION2_SCALE_NEXTAREA_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		mode = 1,
		type = "button"
	}
}
this.GetItem = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "GetItem",
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
		exportName = "GetItemPanel",
		path = "GetItemPanel",
		components = {
			20
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "gain",
		path = "GetItemPanel/gain",
		components = {
			21
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "itemName",
		path = "GetItemPanel/itemName",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_Lose_Text",
		path = "GetItemPanel/Lose_Text",
		components = {
			23
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "boardmid_ConfirmBtn",
		path = "GetItemPanel/boardmid/ConfirmBtn",
		components = {
			24
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "boardmid_ConfirmBtn_Text",
		path = "GetItemPanel/boardmid/ConfirmBtn/Text",
		components = {
			25
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "boardmid_ConfirmBtn_a",
		path = "GetItemPanel/boardmid/ConfirmBtn/GetItem_BtnIcon_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame1",
		path = "GetItemPanel/ItemIconGroup/itemFrame1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame1_itemImage",
		path = "GetItemPanel/ItemIconGroup/itemFrame1/itemImage"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame2",
		path = "GetItemPanel/ItemIconGroup/itemFrame2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame2_itemImage",
		path = "GetItemPanel/ItemIconGroup/itemFrame2/itemImage"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame3",
		path = "GetItemPanel/ItemIconGroup/itemFrame3"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame3_itemImage",
		path = "GetItemPanel/ItemIconGroup/itemFrame3/itemImage"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame4",
		path = "GetItemPanel/ItemIconGroup/itemFrame4"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame4_itemImage",
		path = "GetItemPanel/ItemIconGroup/itemFrame4/itemImage"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame5",
		path = "GetItemPanel/ItemIconGroup/itemFrame5"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetItemPanel_ItemIconGroup_itemFrame5_itemImage",
		path = "GetItemPanel/ItemIconGroup/itemFrame5/itemImage"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.GAIN",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.ITEMNAME",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.GETITEMPANEL_LOSE_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.BOARDMID_CONFIRMBTN_TEXT",
		type = "text"
	}
}
this.Save = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "Save",
		type = "prefab"
	}
}
this.GetAchievement = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "GetAchievement",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetAchievementChild",
		path = "GetAchievementChild"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetAchievementChild_GetAchievement_Icon",
		path = "GetAchievementChild/GetAchievement_Icon"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetAchievementChild_GetAchievement_Title",
		path = "GetAchievementChild/GetAchievement_Title",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "GetAchievementChild_GetAchievement_Name",
		path = "GetAchievementChild/GetAchievement_Name",
		components = {
			7
		}
	},
	{
		text = "UI_MSGBOXSIMPLE.GETACHIEVEMENTCHILD_GETACHIEVEMENT_TITLE",
		type = "text"
	},
	{
		text = "UI_MSGBOXSIMPLE.GETACHIEVEMENTCHILD_GETACHIEVEMENT_NAME",
		type = "text"
	}
}
this.Message = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "Message",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "MessageText",
		path = "Text_Message",
		components = {
			3
		}
	},
	{
		text = "UI_MSGBOXSIMPLE.MESSAGETEXT",
		type = "text"
	}
}
this.Slider = {
	{
		abName = "MsgBoxSimple",
		exportName = "",
		assetName = "Slider",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image1",
		path = "Image1",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image2",
		path = "Image2",
		components = {
			7
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image3",
		path = "Image3",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Text",
		path = "BG/Text",
		components = {
			9
		}
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
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MSGBOXSIMPLE.IMAGE_TEXT",
		type = "text"
	}
}

return MsgBoxSimple
