-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Loading.lua

Loading = {}

local this = Loading

this.mainComponent = {
	{
		abName = "Common",
		exportName = "",
		assetName = "Loading",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main",
		path = "Loading_Main"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Image_Bg_B",
		path = "Loading_Main/Image_Bg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Image_Bg_Mask",
		path = "Loading_Main/Image_Bg/Image_Bg_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Image_Loading_RB",
		path = "Loading_Main/Image_Logo"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Text_Loadubg",
		path = "Loading_Main/Text_Loadubg",
		components = {
			15
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Text_Tips_B",
		path = "Loading_Main/Text_Tips",
		components = {
			16
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_Image_Loading_B",
		path = "Loading_Main/Image_Loading"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_Main_TipsText",
		path = "Loading_Main/TipsText",
		components = {
			17
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Pvp",
		path = "Loader_Pvp",
		components = {
			18
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_little",
		path = "Loading_little"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_little_BGB",
		path = "Loading_little/Image_Bg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_little_BGT",
		path = "Loading_little/Image_BGT"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loading_little_icon",
		path = "Loading_little/A_Loading (1)"
	},
	{
		text = "UI_LOADING.LOADING_MAIN_TEXT_LOADUBG",
		type = "text"
	},
	{
		text = "UI_LOADING.LOADING_MAIN_TEXT_TIPS_B",
		type = "text"
	},
	{
		text = "UI_LOADING.LOADING_MAIN_TIPSTEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Loading_Pvp",
				abName = "Common"
			}
		}
	}
}
this.Loading_Pvp = {
	{
		abName = "Common",
		exportName = "",
		assetName = "Loading_Pvp",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "map_text",
		path = "map_text",
		components = {
			5
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Pvp_Panel_Team1",
		path = "Panel_Self",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Pvp_Panel_Team2",
		path = "Panel_Enemy",
		components = {
			7
		}
	},
	{
		text = "UI_LOADING.MAP_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Loading_Hero1",
				abName = "Common"
			}
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "Loading_Hero2",
				abName = "Common"
			}
		}
	}
}
this.Loading_Hero1 = {
	{
		abName = "Common",
		exportName = "",
		assetName = "Loading_Hero1",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "hero",
		path = "hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "name",
		path = "name",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "hero_name",
		path = "hero_name",
		components = {
			7
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "HeroLoading_Slider",
		path = "Slider_Progress"
	},
	{
		text = "UI_LOADING.NAME",
		type = "text"
	},
	{
		text = "UI_LOADING.HERO_NAME",
		type = "text"
	}
}
this.Loading_Hero2 = {
	{
		abName = "Common",
		exportName = "",
		assetName = "Loading_Hero2",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "hero",
		path = "hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "name",
		path = "name",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "hero_name",
		path = "hero_name",
		components = {
			7
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "HeroLoading_Slider",
		path = "Slider_Progress"
	},
	{
		text = "UI_LOADING.NAME",
		type = "text"
	},
	{
		text = "UI_LOADING.HERO_NAME",
		type = "text"
	}
}

return Loading
