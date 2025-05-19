-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/MapView.lua

MapView = {}

local this = MapView

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "MapView",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "NewLvEfx",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10002,
		groupName = "JoystickIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap",
		path = "Panel_Map"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_ScrollView",
		path = "Panel_Map/Scroll View"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_Viewport",
		path = "Panel_Map/Scroll View/Viewport"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map_Content",
		path = "Panel_Map/Scroll View/Viewport/Content"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map_Body",
		path = "Panel_Map/Scroll View/Viewport/Content/Map"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_BtnCloseSiteInfo",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Button",
		components = {
			111
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_Sites",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1/New_Site_1",
		components = {
			112
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1Pos",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1/New_Site_1/Tip"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2Pos2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1/New_Site_1/Tip2 (1)"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1_Portal1",
		components = {
			113
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1_Portal2",
		components = {
			114
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site1_Portal3",
		components = {
			115
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site2/New_Site_2",
		components = {
			116
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site2_Portal1",
		components = {
			117
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site2_Portal2",
		components = {
			118
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site2_Portal3",
		components = {
			119
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site3"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site3/New_Site_3",
		components = {
			120
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site3Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site3_Portal1",
		components = {
			121
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site3Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site3_Portal2",
		components = {
			122
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site3Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site3_Portal3",
		components = {
			123
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_3"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site4",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site4"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite4",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site4/New_Site_4",
		components = {
			124
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site4Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site4_Portal1",
		components = {
			125
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site4Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site4_Portal2",
		components = {
			126
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site4Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site4_Portal3",
		components = {
			127
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState4",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_4"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site5",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site5"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite5",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site5/New_Site_5",
		components = {
			128
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site5Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site5_Portal1",
		components = {
			129
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site5Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site5_Portal2",
		components = {
			130
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site5Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site5_Portal3",
		components = {
			131
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState5",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_5"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site6",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site6"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite6",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site6/New_Site_6",
		components = {
			132
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site6Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site6_Portal1",
		components = {
			133
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site6Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site6_Portal2",
		components = {
			134
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site6Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site6_Portal3",
		components = {
			135
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState6",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_6"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site7",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site7"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite7",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site7/New_Site_7",
		components = {
			136
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site7Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site7_Portal1",
		components = {
			137
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site7Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site7_Portal2",
		components = {
			138
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site7Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site7_Portal3",
		components = {
			139
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState7",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_7"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site9",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site9"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "NewSite9",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site9/New_Site_9",
		components = {
			140
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site9Btn1",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site9_Portal1",
		components = {
			141
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site9Btn2",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site9_Portal2",
		components = {
			142
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site9Btn3",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site9_Portal3",
		components = {
			143
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteState9",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Map_Sites/Site_State_9"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Carriage",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Carriage"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_CLight",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Carriage/Light"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Carriage_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Carriage/Carriage_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Selected",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/SelectedLight"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "MapView_SiteMask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "MapView_CameraMapMask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Camera4Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site1Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site2Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site3Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site3Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site4Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site4Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site5Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site5Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site6Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site6Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site7Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site7Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site9Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site9Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site1_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site1_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site2_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site2_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site3_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site3_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site4_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site4_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site5_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site5_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site6_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site6_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site7_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site7_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Site9_Mask",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Mask/Site9_Mask"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Cursor",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Cursor",
		components = {
			144
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Cursor_Dbg",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Cursor/Text",
		components = {
			145
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_ProtalDiagram",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Cursor/Position_Introduction"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_ProtalDiagram_Image",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Cursor/Position_Introduction/Position_Image"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_ProtalDiagram_Name",
		path = "Panel_Map/Scroll View/Viewport/Content/Map/Cursor/Position_Introduction/Position_Name",
		components = {
			146
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Panel_Portal",
		path = "Panel_Map/Panel_Portal"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_SiteInfo_B",
		path = "Panel_Map/Panel_SiteInfo"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteInfoBoard",
		path = "Panel_Map/Panel_SiteInfo/Site_Board"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteInfoTitle",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoTitle",
		components = {
			147
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Info_Frog",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoFrog"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Info_FrogTextTitle",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoFrog/Frog_TextTitle",
		components = {
			148
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Info_FrogTextFound",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoFrog/Frog_TextFound",
		components = {
			149
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Info_FrogTextSlash",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoFrog/Frog_TextSlash",
		components = {
			150
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_Info_FrogTextTotal",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoFrog/Frog_TextTotal",
		components = {
			151
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "SiteInfoIntro",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoIntro",
		components = {
			152
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_SiteInfo_BtnDestination",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoBtnGo",
		components = {
			153
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map_Panel_SiteInfo_Site_Board_SiteInfoBtnGo_SiteInfo_IcoBtnGo_A",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoBtnGo/SiteInfo_IcoBtnGo_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_SiteInfo_BtnDestination_Text",
		path = "Panel_Map/Panel_SiteInfo/Site_Board/SiteInfoBtnGo/Text",
		components = {
			154
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelMap_BtnClose",
		path = "Panel_Map/Map_Map_ButtonClose",
		components = {
			155
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Panel_Map_Map_Map_ButtonClose_Text",
		path = "Panel_Map/Map_Map_ButtonClose/Text",
		components = {
			156
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero",
		path = "Panel_Hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero_BtnBack",
		path = "Panel_Hero/Map_Hero_ButtonBack",
		components = {
			157
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero_BtnStart",
		path = "Panel_Hero/Hero_PanelB/ButtonStart",
		components = {
			158
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Panel_Hero_Hero_PanelB_ButtonStart_MapHero_IcoBtnStart_A",
		path = "Panel_Hero/Hero_PanelB/ButtonStart/MapHero_IcoBtnStart_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero_Select_BtnStart_Text",
		path = "Panel_Hero/Hero_PanelB/ButtonStart/Text",
		components = {
			159
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero_HeroList_B",
		path = "Panel_Hero/Hero_Panel"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero_HeroList_ScrollView",
		path = "Panel_Hero/Hero_Panel/Scroll View"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Map_PanelHero_Content",
		path = "Panel_Hero/Hero_Panel/Scroll View/Viewport/Content",
		components = {
			160
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
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAPVIEW.MAP_CURSOR_DBG",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.MAP_PANELMAP_PROTALDIAGRAM_NAME",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.SITEINFOTITLE",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.MAP_INFO_FROGTEXTTITLE",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.MAP_INFO_FROGTEXTFOUND",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.MAP_INFO_FROGTEXTSLASH",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.MAP_INFO_FROGTEXTTOTAL",
		type = "text"
	},
	{
		text = "UI_MAPVIEW.SITEINFOINTRO",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAPVIEW.MAP_PANELMAP_SITEINFO_BTNDESTINATION_TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAPVIEW.PANEL_MAP_MAP_MAP_BUTTONCLOSE_TEXT",
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
		text = "UI_MAPVIEW.MAP_PANELHERO_SELECT_BTNSTART_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "HeroIconMv",
				abName = "Main"
			}
		}
	}
}
this.HeroIconMv = {
	{
		abName = "MapView",
		exportName = "",
		assetName = "HeroIconMv",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Button_Select",
		path = "Button_Select",
		components = {
			5
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Hero",
		path = "Button_Select/Image_Hero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Image_Lock",
		path = "Button_Select/Image_Lock"
	},
	{
		mode = 2,
		type = "button"
	}
}

return MapView
