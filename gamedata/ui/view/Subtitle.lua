-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Subtitle.lua

Subtitle = {}

local this = Subtitle

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "Subtitle",
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
		exportName = "Subtitle_BarU",
		path = "BarU"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_BarD",
		path = "BarD"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Contents_T",
		path = "Subtitle_Contents_T"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Contents_T_Text",
		path = "Subtitle_Contents_T/Contents_T_Text",
		components = {
			18
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Contents_C_B",
		path = "Subtitle_Contents_C"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Contents_C_Text",
		path = "Subtitle_Contents_C/Contents_C_Text",
		components = {
			19
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Contents_B",
		path = "Subtitle_Contents_B"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Contents_B_Text",
		path = "Subtitle_Contents_B/Contents_B_Text",
		components = {
			20
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Skip",
		path = "Subtitle_Buttons",
		components = {
			21
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Button_Skip",
		path = "Subtitle_Buttons/Button_Skip",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_SkipIndicator_R",
		path = "Subtitle_Buttons/Button_Skip/Button_Skip_Indicator"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_BtnSkip_A",
		path = "Subtitle_Buttons/Button_Skip/Button_Skip_Indicator/Subtitle_BtnSkip_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_SkipIndicator_Progress",
		path = "Subtitle_Buttons/Button_Skip/Button_Skip_Indicator/Button_Skip_Icon2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Button_Skip_Text",
		path = "Subtitle_Buttons/Button_Skip/Button_Skip_Indicator/Button_Skip_Text",
		components = {
			23
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Subtitle_Button_Active",
		path = "Subtitle_Buttons/Button_Active",
		components = {
			24
		}
	},
	{
		text = "UI_SUBTITLE.SUBTITLE_CONTENTS_T_TEXT",
		type = "text"
	},
	{
		text = "UI_SUBTITLE.SUBTITLE_CONTENTS_C_TEXT",
		type = "text"
	},
	{
		text = "UI_SUBTITLE.SUBTITLE_CONTENTS_B_TEXT",
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
		text = "UI_SUBTITLE.SUBTITLE_BUTTON_SKIP_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	}
}

return Subtitle
