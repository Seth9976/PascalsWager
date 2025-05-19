-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Maze.lua

Maze = {}

local this = Maze

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "Maze",
		type = "prefab"
	},
	{
		groupId = 10001,
		groupName = "JoystickIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 10002,
		groupName = "KeyboardIcon",
		groupMode = 1,
		type = "group"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main",
		path = "Maze_Main"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnClose",
		path = "Maze_Main/BtnBack",
		components = {
			52
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnCloseText",
		path = "Maze_Main/BtnBack/Text",
		components = {
			53
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnHero1",
		path = "Maze_Main/BtnHero1",
		components = {
			54
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnHero1Text",
		path = "Maze_Main/BtnHero1/Text",
		components = {
			55
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_IcoHero1",
		path = "Maze_Main/BtnHero1/Add"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnHero1Sel",
		path = "Maze_Main/BtnHero1/Selected"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnHero2",
		path = "Maze_Main/BtnHero2",
		components = {
			56
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnHero2Text",
		path = "Maze_Main/BtnHero2/Text",
		components = {
			57
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_IcoHero2",
		path = "Maze_Main/BtnHero2/Add"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_BtnHero2Sel",
		path = "Maze_Main/BtnHero2/Selected"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_RB",
		path = "Maze_Main/NavBar"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_IconA",
		path = "Maze_Main/NavBar/IconA"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_IconA_Btn_Icon_A",
		path = "Maze_Main/NavBar/IconA/Btn_Icon_A"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_BtnAText",
		path = "Maze_Main/NavBar/IconA/Text",
		components = {
			58
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_IconB",
		path = "Maze_Main/NavBar/IconB"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_IconB_Btn_Icon_B",
		path = "Maze_Main/NavBar/IconB/Btn_Icon_B"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_NavBar_BtnBText",
		path = "Maze_Main/NavBar/IconB/Text",
		components = {
			59
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_RB",
		path = "Maze_Main/KeyboardNavBar"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_IconA",
		path = "Maze_Main/KeyboardNavBar/IconA"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_IconA_Key_Enter",
		path = "Maze_Main/KeyboardNavBar/IconA/Key_Enter"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_IconA_Text",
		path = "Maze_Main/KeyboardNavBar/IconA/Text",
		components = {
			60
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_IconB",
		path = "Maze_Main/KeyboardNavBar/IconB"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_IconB_Key_Esc",
		path = "Maze_Main/KeyboardNavBar/IconB/Key_Esc"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Main_KeyboardNavBar_IconB_Text",
		path = "Maze_Main/KeyboardNavBar/IconB/Text",
		components = {
			61
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub",
		path = "Maze_Sub"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_HeroList_R",
		path = "Maze_Sub/HeroList"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_Scroll",
		path = "Maze_Sub/HeroList/ScrollView"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_ScrollContent",
		path = "Maze_Sub/HeroList/ScrollView/Viewport/Content",
		components = {
			62
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_BtnBack",
		path = "Maze_Sub/BtnBack",
		components = {
			63
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_BtnBackText",
		path = "Maze_Sub/BtnBack/Text",
		components = {
			64
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_Buttons",
		path = "Maze_Sub/Buttons"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_BtnOk",
		path = "Maze_Sub/Buttons/ButtonOK",
		components = {
			65
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_BtnOkText",
		path = "Maze_Sub/Buttons/ButtonOK/Text",
		components = {
			66
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_Buttons_ButtonOK_Btn_Icon_a",
		path = "Maze_Sub/Buttons/ButtonOK/Btn_Icon_a"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_BtnUnload",
		path = "Maze_Sub/Buttons/ButtonUnload",
		components = {
			67
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_BtnUnloadText",
		path = "Maze_Sub/Buttons/ButtonUnload/Text",
		components = {
			68
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_Buttons_ButtonUnload_Btn_Icon_x",
		path = "Maze_Sub/Buttons/ButtonUnload/Btn_Icon_x"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_Status",
		path = "Maze_Sub/Status"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_StatusMark1",
		path = "Maze_Sub/Status/SelMark1"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_StatusMark2",
		path = "Maze_Sub/Status/SelMark2"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_RB",
		path = "Maze_Sub/KeyboardNavBar"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_IconEnter",
		path = "Maze_Sub/KeyboardNavBar/IconEnter"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_Icon_KeyEnter",
		path = "Maze_Sub/KeyboardNavBar/IconEnter/Key_Enter"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_Icon_KeyEnter_Text",
		path = "Maze_Sub/KeyboardNavBar/IconEnter/Text",
		components = {
			69
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_IconR",
		path = "Maze_Sub/KeyboardNavBar/IconR"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_Icon_KeyR",
		path = "Maze_Sub/KeyboardNavBar/IconR/Key_R"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Maze_Sub_KeyboardNavBar_Icon_KeyR_Text",
		path = "Maze_Sub/KeyboardNavBar/IconR/Text",
		components = {
			70
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_BTNCLOSETEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_BTNHERO1TEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_BTNHERO2TEXT",
		type = "text"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_NAVBAR_BTNATEXT",
		type = "text"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_NAVBAR_BTNBTEXT",
		type = "text"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_KEYBOARDNAVBAR_ICONA_TEXT",
		type = "text"
	},
	{
		text = "UI_MAZE.MAZE_MAIN_KEYBOARDNAVBAR_ICONB_TEXT",
		type = "text"
	},
	{
		type = "loader",
		res = {
			{
				assetName = "MazeHero",
				abName = "Main"
			}
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAZE.MAZE_SUB_BTNBACKTEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAZE.MAZE_SUB_BTNOKTEXT",
		type = "text"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_MAZE.MAZE_SUB_BTNUNLOADTEXT",
		type = "text"
	},
	{
		text = "UI_MAZE.MAZE_SUB_KEYBOARDNAVBAR_ICON_KEYENTER_TEXT",
		type = "text"
	},
	{
		text = "UI_MAZE.MAZE_SUB_KEYBOARDNAVBAR_ICON_KEYR_TEXT",
		type = "text"
	}
}
this.MazeHero = {
	{
		abName = "Maze",
		exportName = "",
		assetName = "MazeHero",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ButtonSelect",
		path = "ButtonSelect",
		components = {
			6
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ImageHero",
		path = "ButtonSelect/ImageHero"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ImageSelected",
		path = "ButtonSelect/ImageSelected"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "ImageLocked",
		path = "ButtonSelect/ImageLocked"
	},
	{
		mode = 2,
		type = "button"
	}
}

return Maze
