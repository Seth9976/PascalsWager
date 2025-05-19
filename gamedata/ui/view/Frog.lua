-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/Frog.lua

Frog = {}

local this = Frog

this.mainComponent = {
	{
		abName = "Main",
		exportName = "",
		assetName = "Frog",
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
		exportName = "FrogPanel_BtnGroup",
		path = "FrogPanel/BtnGroup",
		components = {
			29
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_back",
		path = "FrogPanel/back",
		components = {
			30
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_back_Text",
		path = "FrogPanel/back/Text",
		components = {
			31
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "hp",
		path = "FrogPanel/ItemNumGroup/hp"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "num1",
		path = "FrogPanel/ItemNumGroup/hp/num1",
		components = {
			32
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "bone",
		path = "FrogPanel/ItemNumGroup/bone"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "num2",
		path = "FrogPanel/ItemNumGroup/bone/num2",
		components = {
			33
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "coin",
		path = "FrogPanel/ItemNumGroup/coin"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "num3",
		path = "FrogPanel/ItemNumGroup/coin/num3",
		components = {
			34
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "san",
		path = "FrogPanel/ItemNumGroup/san"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "num4",
		path = "FrogPanel/ItemNumGroup/san/num4",
		components = {
			35
		}
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup",
		path = "FrogPanel/GamePadIconGroup"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup_A",
		path = "FrogPanel/GamePadIconGroup/A"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup_A_Btn_Icon_a",
		path = "FrogPanel/GamePadIconGroup/A/Btn_Icon_a"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup_A_Text",
		path = "FrogPanel/GamePadIconGroup/A/Text",
		components = {
			36
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup_B",
		path = "FrogPanel/GamePadIconGroup/B"
	},
	{
		groupId = 10001,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup_B_Btn_Icon_b",
		path = "FrogPanel/GamePadIconGroup/B/Btn_Icon_b"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_GamePadIconGroup_B_Text",
		path = "FrogPanel/GamePadIconGroup/B/Text",
		components = {
			37
		}
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup",
		path = "FrogPanel/KeyBoardIconGroup"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup_A",
		path = "FrogPanel/KeyBoardIconGroup/A"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup_A_Key_Enter",
		path = "FrogPanel/KeyBoardIconGroup/A/Key_Enter"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup_A_Text",
		path = "FrogPanel/KeyBoardIconGroup/A/Text",
		components = {
			38
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup_B",
		path = "FrogPanel/KeyBoardIconGroup/B"
	},
	{
		groupId = 10002,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup_B_Key_Esc",
		path = "FrogPanel/KeyBoardIconGroup/B/Key_Esc"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogPanel_KeyBoardIconGroup_B_Text",
		path = "FrogPanel/KeyBoardIconGroup/B/Text",
		components = {
			39
		}
	},
	{
		type = "loader",
		res = {
			{
				assetName = "FrogSelection",
				abName = "Main"
			}
		}
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_FROG.FROGPANEL_BACK_TEXT",
		type = "text"
	},
	{
		text = "UI_FROG.NUM1",
		type = "text"
	},
	{
		text = "UI_FROG.NUM2",
		type = "text"
	},
	{
		text = "UI_FROG.NUM3",
		type = "text"
	},
	{
		text = "UI_FROG.NUM4",
		type = "text"
	},
	{
		text = "UI_FROG.FROGPANEL_GAMEPADICONGROUP_A_TEXT",
		type = "text"
	},
	{
		text = "UI_FROG.FROGPANEL_GAMEPADICONGROUP_B_TEXT",
		type = "text"
	},
	{
		text = "UI_FROG.FROGPANEL_KEYBOARDICONGROUP_A_TEXT",
		type = "text"
	},
	{
		text = "UI_FROG.FROGPANEL_KEYBOARDICONGROUP_B_TEXT",
		type = "text"
	}
}
this.FrogSelection = {
	{
		abName = "Frog",
		exportName = "",
		assetName = "FrogSelection",
		type = "prefab"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "FrogBtn",
		path = "FrogBtn",
		components = {
			8
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Icon",
		path = "Icon"
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Content",
		path = "Content",
		components = {
			9
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Num",
		path = "Num",
		components = {
			10
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Description",
		path = "Description",
		components = {
			11
		}
	},
	{
		groupId = 0,
		type = "gameObject",
		note = "",
		exportName = "Mask",
		path = "Mask"
	},
	{
		mode = 1,
		type = "button"
	},
	{
		text = "UI_FROG.CONTENT",
		type = "text"
	},
	{
		text = "UI_FROG.NUM",
		type = "text"
	},
	{
		text = "UI_FROG.DESCRIPTION",
		type = "text"
	}
}

return Frog
