-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/HitNumber.lua

HitNumber = {}

local this = HitNumber

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "HitNumber",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Loader_Number",
		path = "Loader_Number",
		components = {
			3
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "PanelNumber",
				abName = "Main"
			}
		}
	}
}
this.PanelNumber = {
	{
		abName = "Main",
		exportName = "",
		assetName = "PanelNumber",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Style1",
		path = "Text_Number",
		components = {
			5
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Style2",
		path = "Text_Hert",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Style3",
		path = "Text_Yellow",
		components = {
			7
		}
	},
	{
		text = "UI_HITNUMBER.STYLE1",
		type = "text"
	},
	{
		text = "UI_HITNUMBER.STYLE2",
		type = "text"
	},
	{
		text = "UI_HITNUMBER.STYLE3",
		type = "text"
	}
}

return HitNumber
