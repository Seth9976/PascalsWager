-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/HeadInfo.lua

HeadInfo = {}

local this = HeadInfo

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "HeadInfo",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "DisplayArea",
		path = "DisplayArea"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Info",
		path = "Loader_Info",
		components = {
			4
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "HeadInfoDetail",
				abName = "Main"
			}
		}
	}
}
this.HeadInfoDetail = {
	{
		abName = "Main",
		exportName = "",
		assetName = "HeadInfoDetail",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "HeadBar",
		path = "HeadBar"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Focus",
		path = "HeadBar/Panel_Focus"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Focus1",
		path = "HeadBar/Panel_Focus/Image_Focus1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Focus2",
		path = "HeadBar/Panel_Focus/Image_Focus2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Bar",
		path = "HeadBar/Panel_Bar"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Bg",
		path = "HeadBar/Panel_Bar/Image_Bg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_HpWarning",
		path = "HeadBar/Panel_Bar/Image_HpWarning"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_EnergyWarning",
		path = "HeadBar/Panel_Bar/Image_EnergyWarning"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Energy",
		path = "HeadBar/Panel_Bar/Image_Energy"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Easing",
		path = "HeadBar/Panel_Bar/Image_Easing"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Bar1",
		path = "HeadBar/Panel_Bar/Image_Bar1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Bar2",
		path = "HeadBar/Panel_Bar/Image_Bar2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Bar3",
		path = "HeadBar/Panel_Bar/Image_Bar3"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Shield",
		path = "HeadBar/Panel_Bar/Image_Shield"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Armor",
		path = "HeadBar/Panel_Bar/Image_Armor"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "RawImage",
		exportName = "Image_Scaler",
		path = "HeadBar/Panel_Bar/Image_Scaler"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Locator",
		path = "HeadBar/Locator"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Locator_Team1",
		path = "HeadBar/Locator/Team1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Locator_Team2",
		path = "HeadBar/Locator/Team2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatusBar",
		path = "HeadBar/StatusBar"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "StatusIcon",
		path = "HeadBar/StatusIcon",
		components = {
			26
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "HostStatus",
		path = "HeadBar/StatusIcon/HostStatus"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "HostStatusIcon",
		path = "HeadBar/StatusIcon/HostStatus/HostStatusIcon"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Name",
		path = "Name",
		components = {
			27
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_HEADINFO.NAME",
		type = "text"
	}
}

return HeadInfo
