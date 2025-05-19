-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Rank.lua

Rank = {}

local this = Rank

this.mainComponent = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "Rank",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Left_L",
		path = "Rank_Am/Left_L"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Button_Back",
		path = "Rank_Am/Left_L/Button_Back",
		components = {
			15
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Right_R",
		path = "Rank_Am/Right_R"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Image_Text",
		path = "Rank_Am/Image/Text",
		components = {
			16
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Image_Text1",
		path = "Rank_Am/Image/Text (1)",
		components = {
			17
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Image_Score",
		path = "Rank_Am/Image/Score",
		components = {
			18
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Image_MyRank",
		path = "Rank_Am/Image/MyRank",
		components = {
			19
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Text_Text_Rank",
		path = "Rank_Am/Text/Text_Rank",
		components = {
			20
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Text_Text_Player_Name",
		path = "Rank_Am/Text/Text_Player_Name",
		components = {
			21
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Text_Text_Hero_Name",
		path = "Rank_Am/Text/Text_Hero_Name",
		components = {
			22
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Text_Text_Turn",
		path = "Rank_Am/Text/Text_Turn",
		components = {
			23
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_Text_Text_Number",
		path = "Rank_Am/Text/Text_Number",
		components = {
			24
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank_Am_ScrollView_Viewport_Content",
		path = "Rank_Am/Scroll View/Viewport/Content",
		components = {
			25
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_RANK.RANK_AM_IMAGE_TEXT",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_IMAGE_TEXT1",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_IMAGE_SCORE",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_IMAGE_MYRANK",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_TEXT_TEXT_RANK",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_TEXT_TEXT_PLAYER_NAME",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_TEXT_TEXT_HERO_NAME",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_TEXT_TEXT_TURN",
		type = "text"
	},
	{
		text = "UI_RANK.RANK_AM_TEXT_TEXT_NUMBER",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "PlayerRank",
				abName = "Lobby"
			}
		}
	}
}
this.PlayerRank = {
	{
		abName = "Lobby",
		exportName = "",
		assetName = "PlayerRank",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Bg",
		path = "Bg"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Rank",
		path = "Rank",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Player_Name",
		path = "Player_Name",
		components = {
			9
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Hero",
		path = "Hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Turn",
		path = "Turn",
		components = {
			10
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Number",
		path = "Number",
		components = {
			11
		}
	},
	{
		text = "UI_RANK.RANK",
		type = "text"
	},
	{
		text = "UI_RANK.PLAYER_NAME",
		type = "text"
	},
	{
		text = "UI_RANK.TURN",
		type = "text"
	},
	{
		text = "UI_RANK.NUMBER",
		type = "text"
	}
}

return Rank
