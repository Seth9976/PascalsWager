-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/SettingCfgComReview.lua

SettingCfg = {
	Layers = {
		"Settings1",
		"Settings2",
		"Settings3",
		"Settings4",
		"Settings5",
		"InputConfig1",
		"InputConfig2",
		"InputConfig3",
		"KMConfig",
		"GPConfig",
		"NNConfig",
		"InputDiagram",
		"AccountLogin",
		"AccountRegister"
	},
	UiName = {
		"Settings1",
		"Settings2",
		"Settings3",
		"Settings4",
		"Settings5"
	},
	EnTabs = {
		true,
		true,
		true,
		true,
		true
	},
	InGame = {
		{
			"QuitToTitle",
			"",
			""
		}
	},
	Nav = {
		"Setting_NavBar_BtnBasic",
		"Setting_NavBar_BtnSounds",
		"Setting_NavBar_BtnControl",
		"Setting_NavBar_BtnSave",
		"Setting_NavBar_BtnGuide"
	},
	Pnl = {
		Guide = 5,
		Control = 3,
		Basic = 1,
		SaveData = 4,
		Sounds = 2
	},
	Idx = {
		{
			Language = 4,
			GraphicsQuality = 1,
			Count = 4,
			GraphicsFrameRate = 2,
			GraphicsBrightness = 3
		},
		{
			SfxVolume = 3,
			Count = 4,
			BgmVolume = 2,
			VoiceVolume = 4,
			MasVolume = 1
		},
		{
			InputConfiguration = 2,
			CamSensitivity = 1,
			Count = 2
		},
		{
			Account = 1,
			Count = 2,
			CloudData = 2
		},
		{
			GuideBook = 1,
			Count = 0
		}
	},
	Tab = {
		{
			{
				1,
				"Settings_Basic_GQ_Blank",
				"OnSelectGQuality",
				{
					{
						"Settings_Basic_GQ_Low",
						true
					},
					{
						"Settings_Basic_GQ_Medium",
						true
					},
					{
						"Settings_Basic_GQ_High",
						true
					},
					{
						"Settings_Basic_GQ_Ultra",
						true
					}
				},
				{
					"graphics",
					"quality"
				}
			},
			{
				1,
				"Settings_Basic_FR_Blank",
				"OnSelectFrameRate",
				{
					{
						"Settings_Basic_FR_Low",
						true
					},
					{
						"Settings_Basic_FR_Medium",
						true
					},
					{
						"Settings_Basic_FR_High",
						false
					}
				},
				{
					"graphics",
					"framerate"
				}
			},
			{
				2,
				"Settings_Basic_Brightness_Blank",
				"OnSldrBrightness",
				{
					"Setting_Basic_Brightness_Value",
					"Settings_Basic_Brightness_Slider"
				},
				{
					"graphics",
					"brightness"
				}
			},
			{
				1,
				"Settings_Basic_Language_Blank",
				"OnSelectLanguage",
				{
					{
						"Settings_Basic_Language_Btn_us",
						true,
						"us"
					},
					{
						"Settings_Basic_Language_Btn_zhs",
						true,
						"zhs"
					},
					{
						"Settings_Basic_Language_Btn_zht",
						false,
						"zht"
					},
					{
						"Settings_Basic_Language_Btn_jp",
						false,
						"jp"
					},
					{
						"Settings_Basic_Language_Btn_de",
						false,
						"de"
					},
					{
						"Settings_Basic_Language_Btn_fr",
						false,
						"fr"
					},
					{
						"Settings_Basic_Language_Btn_es",
						false,
						"es"
					},
					{
						"Settings_Basic_Language_Btn_pt",
						false,
						"pt"
					}
				},
				{
					"lang"
				},
				{
					"Settings_Basic_Language_BtnL",
					"Settings_Basic_Language_BtnR",
					"Settings_Basic_Language_Text"
				}
			}
		},
		{
			{
				2,
				"Settings_Sound_Mas_Blank",
				"OnSldrMasterVolume",
				{
					"Setting_Basic_Mas_Value",
					"Settings_Basic_Mas_Slider"
				},
				{
					"sound"
				}
			},
			{
				2,
				"Settings_Sound_Bgm_Blank",
				"OnSldrBgmVolume",
				{
					"Setting_Basic_Bgm_Value",
					"Settings_Basic_Bgm_Slider"
				},
				{
					"bgm"
				}
			},
			{
				2,
				"Settings_Sound_Sfx_Blank",
				"OnSldrSfxVolume",
				{
					"Setting_Basic_Sfx_Value",
					"Settings_Basic_Sfx_Slider"
				},
				{
					"sfx"
				}
			},
			{
				2,
				"Settings_Sound_Voice_Blank",
				"OnSldrVoiceVolume",
				{
					"Setting_Basic_Voice_Value",
					"Settings_Basic_Voice_Slider"
				},
				{
					"voice"
				}
			}
		},
		{
			{
				2,
				"Settings_Control_CamS_Blank",
				"OnSldrSensitivity",
				{
					"",
					"Setting_Basic_CameraSensitivity_Slider"
				},
				{
					"sensitivity"
				}
			},
			{
				1,
				"Settings_Control_Input_Blank",
				"OnSelectControllers",
				{
					{
						"Settings_Control_Input_Keyboard_Button",
						false
					},
					{
						"Settings_Control_Input_TouchPad_Button",
						true
					},
					{
						"Settings_Control_Input_GamePad_Button",
						true
					}
				}
			}
		},
		{
			{
				1,
				"Settings_Save_Account_Blank",
				"OnSelectAccount",
				{
					{
						"Settings_Save_Account_Button_SignInWithApple",
						true,
						"OnButtonSignInWithApple"
					},
					{
						"Settings_Save_Account_Button_SignInWithAccount",
						true,
						"OnButtonSignInWithAccount"
					},
					{
						"Settings_Save_Account_Button_SignOut",
						true,
						"OnButtonSignOut"
					}
				}
			},
			{
				1,
				"Settings_Save_SaveData_Blank",
				"OnSelectCloudData",
				{
					{
						"Settings_Save_CloudData_Button_Upload",
						false,
						"OnBtnUpload"
					},
					{
						"Settings_Save_CloudData_Button_Download",
						false,
						"OnBtnDownload"
					}
				}
			}
		},
		{
			{
				3,
				nil,
				"OnSelectPage"
			}
		}
	},
	Sub = {
		{
			"InputConfig1"
		},
		{
			"InputConfig2"
		},
		{
			"InputConfig3"
		}
	}
}
