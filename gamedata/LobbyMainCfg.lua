-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/LobbyMainCfg.lua

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
			"Continue",
			"LobbyMain_Root_NavBtn_Continue",
			"OnButtonStoryModeContinue"
		},
		{
			"Load",
			"LobbyMain_Root_NavBtn_Load",
			"OnButtonStoryModeLoad"
		},
		{
			"Story",
			"LobbyMain_Root_NavBtn_Story",
			"OnButtonStoryModeStart"
		},
		{
			"Arcade",
			"LobbyMain_Root_NavBtn_Arcade",
			"OnButtonArcade"
		},
		{
			"Challenge",
			"LobbyMain_Root_NavBtn_Challenge",
			"OnButtonChallengeMode"
		},
		{
			"DLCs",
			"LobbyMain_Root_NavBtn_DLCs",
			"OnButtonDLCs"
		},
		{
			"Settings",
			"LobbyMain_Root_NavBtn_Settings",
			"OnButtonSettings"
		},
		{
			"Quit",
			"LobbyMain_Root_NavBtn_QuitGame",
			"OnButtonQuitGame"
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
	},
	NewGame = {
		""
	},
	LoadGame = {
		""
	}
}
