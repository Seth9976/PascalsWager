-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Skip.lua

Skip = {}

local this = Skip

this.mainComponent = {
	{
		abName = "Common",
		exportName = "",
		assetName = "Skip",
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
		exportName = "Skip",
		path = "Skip"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_BarU",
		path = "Skip/BarU"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_BarD",
		path = "Skip/BarD"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_SkipBG",
		path = "Skip/SkipBG",
		components = {
			12
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_SkipBG_SkipBtn",
		path = "Skip/SkipBG/SkipBtn",
		components = {
			13
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_SkipBG_Indicator_R",
		path = "Skip/SkipBG/SkipBtn/SkipIndicator"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Skip_SkipBG_Indicator_JsBtn",
		path = "Skip/SkipBG/SkipBtn/SkipIndicator/Btn_BtnSkip_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_SkipBG_Indicator_Circle",
		path = "Skip/SkipBG/SkipBtn/SkipIndicator/SkipIndicatorCircle"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Skip_SkipBG_SkipBtn_Text",
		path = "Skip/SkipBG/SkipBtn/SkipIndicator/SkipIndicatorText",
		components = {
			14
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
		text = "UI_SKIP.SKIP_SKIPBG_SKIPBTN_TEXT",
		type = "text"
	}
}

return Skip
