-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/LobbyMainCfgEvt1909.lua

LobbyMainCfg = {
	PanelRoot = {
		"Panel_Load",
		"Panel_Story",
		"Panel_Local",
		"Panel_Heroes",
		"Panel_Season"
	},
	LobbyRoot = {
		{
			"Story",
			"LobbyMain_Root_NavBtn_Story",
			"OnButtonStoryModeStart"
		},
		{
			"Settings",
			"LobbyMain_Root_NavBtn_Settings",
			"OnButtonSettings"
		}
	},
	LevelDifficulty = {
		{
			"Casual",
			"LobbyMain_Game_NavBtn_Casual",
			"OnButtonGameCasual"
		},
		{
			"Hardcore",
			"LobbyMain_Game_NavBtn_Hardcore",
			"OnButtonGameHardcore"
		},
		{
			"Back",
			"LobbyMain_Game_NavBtn_Back",
			"OnButtonGameBack"
		}
	},
	BossDifficulty = {
		{
			"Casual",
			"LobbyMain_Game_NavBtn_Casual",
			"OnButtonBossCasual"
		},
		{
			"Hardcore",
			"LobbyMain_Game_NavBtn_Hardcore",
			"OnButtonBossHardcore"
		},
		{
			"Back",
			"LobbyMain_Game_NavBtn_Back",
			"OnButtonGameBack"
		}
	}
}
